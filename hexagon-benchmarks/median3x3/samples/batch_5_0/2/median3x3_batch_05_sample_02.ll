; ModuleID = 'median3x3/samples/batch_5_0/2/median3x3_batch_05_sample_02.bc'
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
%closure_t = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, %struct.halide_buffer_t*, i8*, %struct.halide_buffer_t* }
%struct.halide_pseudostack_slot_t = type { i8*, i64 }

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
@str.224 = private constant [14 x i8] c"bounded_input\00", align 32
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
@str.225 = private constant [112 x i8] c"x86-64-linux-avx-avx2-avx512-avx512_skylake-disable_llvm_loop_unroll-disable_llvm_loop_vectorize-f16c-fma-sse41\00", align 64
@str.226 = private constant [29 x i8] c"median3x3_batch_05_sample_02\00", align 32
@median3x3_batch_05_sample_02_metadata_storage = private constant %struct.halide_filter_metadata_t { i32 1, i32 2, %struct.halide_filter_argument_t* getelementptr inbounds ([2 x %struct.halide_filter_argument_t], [2 x %struct.halide_filter_argument_t]* @10, i32 0, i32 0), i8* getelementptr inbounds ([112 x i8], [112 x i8]* @str.225, i32 0, i32 0), i8* getelementptr inbounds ([29 x i8], [29 x i8]* @str.226, i32 0, i32 0) }
@switch.table.halide_type_to_string = private unnamed_addr constant [4 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.13.76, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.14.75, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.15.74, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.16.73, i64 0, i64 0)]

; Function Attrs: nounwind
define weak i8* @halide_default_malloc(i8*, i64) #0 {
  %3 = add i64 %1, 64
  %4 = tail call i8* @malloc(i64 %3) #11
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
  tail call void @free(i8* %5) #11
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
  %4 = tail call i8* %3(i8* %0, i64 %1) #11
  ret i8* %4
}

; Function Attrs: nounwind
define weak void @halide_free(i8*, i8*) local_unnamed_addr #0 {
  %3 = load void (i8*, i8*)*, void (i8*, i8*)** @_ZN6Halide7Runtime8Internal11custom_freeE, align 8, !tbaa !7
  tail call void %3(i8* %0, i8* %1) #11
  ret void
}

; Function Attrs: nounwind
define weak void @halide_default_error(i8*, i8*) #0 {
  %3 = alloca [4096 x i8], align 1
  %4 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 4096, i8* nonnull %4) #9
  %5 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3, i64 0, i64 4094
  %6 = call i8* @halide_string_to_string(i8* nonnull %4, i8* nonnull %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0)) #11
  %7 = call i8* @halide_string_to_string(i8* %6, i8* nonnull %5, i8* %1) #11
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
  call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %4, i64 %18) #11
  call void @halide_print(i8* %0, i8* nonnull %4) #11
  call void @abort() #11
  call void @llvm.lifetime.end.p0i8(i64 4096, i8* nonnull %4) #9
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #3

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #3

; Function Attrs: nounwind
define weak void @halide_error(i8*, i8*) local_unnamed_addr #0 {
  %3 = load void (i8*, i8*)*, void (i8*, i8*)** @_ZN6Halide7Runtime8Internal13error_handlerE, align 8, !tbaa !7
  tail call void %3(i8* %0, i8* %1) #11
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
  tail call void %3(i8* %0, i8* %1) #11
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
  %5 = tail call i32 (i32, ...) @syscall(i32 228, i32 0, %struct.timespec* nonnull @halide_reference_clock) #11
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
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %3) #9
  %4 = call i32 (i32, ...) @syscall(i32 228, i32 0, <2 x i64>* nonnull %2) #11
  %5 = load <2 x i64>, <2 x i64>* %2, align 16, !tbaa !15
  %6 = load <2 x i64>, <2 x i64>* bitcast (%struct.timespec* @halide_reference_clock to <2 x i64>*), align 8, !tbaa !15
  %7 = sub <2 x i64> %5, %6
  %8 = extractelement <2 x i64> %7, i32 0
  %9 = mul nsw i64 %8, 1000000000
  %10 = extractelement <2 x i64> %7, i32 1
  %11 = add nsw i64 %9, %10
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %3) #9
  ret i64 %11
}

; Function Attrs: nounwind
define weak void @halide_sleep_ms(i8*, i32) local_unnamed_addr #0 {
  %3 = mul nsw i32 %1, 1000
  %4 = tail call i32 @usleep(i32 %3) #11
  ret void
}

declare i32 @usleep(i32) local_unnamed_addr #4

; Function Attrs: nounwind
define weak void @halide_default_print(i8*, i8*) #0 {
  %3 = tail call i64 @strlen(i8* %1) #11
  %4 = tail call i64 @write(i32 1, i8* %1, i64 %3) #11
  ret void
}

; Function Attrs: argmemonly nounwind readonly
declare i64 @strlen(i8* nocapture) local_unnamed_addr #5

declare i64 @write(i32, i8* nocapture readonly, i64) local_unnamed_addr #4

; Function Attrs: nounwind
define weak i32 @halide_host_cpu_count() local_unnamed_addr #0 {
  %1 = tail call i64 @sysconf(i32 84) #11
  %2 = trunc i64 %1 to i32
  ret i32 %2
}

declare i64 @sysconf(i32) local_unnamed_addr #4

; Function Attrs: nounwind
define linkonce void @_ZN6Halide7Runtime8Internal19halide_thread_yieldEv() local_unnamed_addr #0 {
  %1 = tail call i32 @sched_yield() #11
  ret void
}

declare i32 @sched_yield() local_unnamed_addr #4

; Function Attrs: nounwind
define weak i32 @halide_default_do_task(i8*, i32 (i8*, i32, i8*)*, i32, i8*) #0 {
  %5 = tail call i32 %1(i8* %0, i32 %2, i8* %3) #11
  ret i32 %5
}

; Function Attrs: nounwind
define weak i32 @halide_default_do_loop_task(i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*) #0 {
  %7 = tail call i32 %1(i8* %0, i32 %2, i32 %3, i8* %4, i8* %5) #11
  ret i32 %7
}

; Function Attrs: nounwind
define weak i32 @halide_default_do_par_for(i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*) #0 {
  %6 = alloca %"struct.Halide::Runtime::Internal::work", align 8
  %7 = icmp slt i32 %3, 1
  br i1 %7, label %28, label %8

; <label>:8:                                      ; preds = %5
  %9 = bitcast %"struct.Halide::Runtime::Internal::work"* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %9) #9
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
  call void @halide_mutex_lock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #12
  call void @_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_(i32 1, %"struct.Halide::Runtime::Internal::work"* nonnull %6, %"struct.Halide::Runtime::Internal::work"* null) #12
  call void @_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE(%"struct.Halide::Runtime::Internal::work"* nonnull %6) #12
  call void @halide_mutex_unlock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #12
  %27 = load i32, i32* %21, align 4, !tbaa !34
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %9) #9
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
  call void @_ZN6Halide7Runtime8Internal19halide_thread_yieldEv() #11
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
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %8) #9
  store void (i8*)* @_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv, void (i8*)** %10, align 8, !tbaa !35
  store void (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*, i1, i1)* @_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb, void (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*, i1, i1)** %12, align 8, !tbaa !37
  store i64* %3, i64** %13, align 8, !tbaa !38
  store i1 (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)* @_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE, i1 (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)** %9, align 8, !tbaa !40
  store i64 (i8*, i32, i1)* @_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib, i64 (i8*, i32, i1)** %11, align 8, !tbaa !41
  %46 = call i64 @_ZN6Halide7Runtime8Internal15Synchronization4parkEyRNS2_15parking_controlE(i64 %14, %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* nonnull dereferenceable(32) %15) #11
  %47 = icmp eq i64 %46, %14
  br i1 %47, label %50, label %48

; <label>:48:                                     ; preds = %45
  %49 = load atomic i64, i64* %3 monotonic, align 8
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %8) #9
  br label %.backedge

.backedge:                                        ; preds = %48, %43, %35
  %.be = phi i64 [ %44, %43 ], [ %49, %48 ], [ %37, %35 ]
  %.be5 = phi i32 [ %39, %43 ], [ 40, %48 ], [ %36, %35 ]
  br label %16

; <label>:50:                                     ; preds = %45
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %8) #9
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
  tail call void @halide_print(i8* null, i8* getelementptr inbounds ([199 x i8], [199 x i8]* @.str.7, i64 0, i64 0)) #11
  tail call void @abort() #11
  br label %17

; <label>:17:                                     ; preds = %16, %13
  %18 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 1), align 8, !tbaa !46
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %22

; <label>:20:                                     ; preds = %17
  %21 = tail call i32 @_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv() #12
  store i32 %21, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 1), align 8, !tbaa !46
  br label %22

; <label>:22:                                     ; preds = %20, %17
  %23 = phi i32 [ %18, %17 ], [ %21, %20 ]
  %24 = tail call i32 @_ZN6Halide7Runtime8Internal17clamp_num_threadsEi(i32 %23) #12
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
  %90 = tail call %struct.halide_thread* @halide_spawn_thread(void (i8*)* nonnull @_ZN6Halide7Runtime8Internal13worker_threadEPv, i8* null) #12
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
  tail call void @halide_print(i8* null, i8* getelementptr inbounds ([276 x i8], [276 x i8]* @.str.3, i64 0, i64 0)) #11
  tail call void @abort() #11
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
  tail call void @halide_cond_broadcast(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 8)) #12
  %149 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 6), align 8, !tbaa !56
  %150 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 5), align 4, !tbaa !49
  %151 = icmp sgt i32 %149, %150
  br i1 %151, label %152, label %155

; <label>:152:                                    ; preds = %147
  tail call void @halide_cond_broadcast(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 9)) #12
  %153 = icmp eq i8 %33, 0
  br i1 %153, label %155, label %154

; <label>:154:                                    ; preds = %152
  tail call void @halide_cond_broadcast(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 10)) #12
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
  tail call void @halide_cond_broadcast(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 10)) #12
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
  %118 = tail call zeroext i1 @halide_default_semaphore_try_acquire(%struct.halide_semaphore_t* %115, i32 %117) #11
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
  %185 = tail call zeroext i1 @halide_default_semaphore_try_acquire(%struct.halide_semaphore_t* %182, i32 %184) #11
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
  tail call void @halide_cond_wait(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 10), %struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #12
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
  tail call void @halide_cond_wait(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 9), %struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #12
  %207 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 5), align 4, !tbaa !49
  %208 = add nsw i32 %207, 1
  store i32 %208, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 5), align 4, !tbaa !49
  br label %210

; <label>:209:                                    ; preds = %199
  tail call void @halide_cond_wait(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 8), %struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #12
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
  tail call void @halide_mutex_unlock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #12
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
  %271 = tail call zeroext i1 @halide_default_semaphore_try_acquire(%struct.halide_semaphore_t* %268, i32 %270) #11
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
  %293 = tail call i32 @halide_do_loop_task(i8* %288, i32 (i8*, i32, i32, i8*, i8*)* %289, i32 %291, i32 %287, i8* %292, i8* nonnull %247) #12
  %294 = add nuw nsw i32 %287, %250
  %295 = icmp eq i32 %293, 0
  br i1 %295, label %248, label %296

; <label>:296:                                    ; preds = %.loopexit2, %.loopexit
  %297 = phi i32 [ %250, %.loopexit ], [ %294, %.loopexit2 ]
  %298 = phi i32 [ 0, %.loopexit ], [ %293, %.loopexit2 ]
  %299 = phi i1 [ true, %.loopexit ], [ false, %.loopexit2 ]
  tail call void @halide_mutex_lock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #12
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
  tail call void @halide_mutex_unlock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #12
  %331 = icmp eq i32 (i8*, i32, i8*)* %317, null
  br i1 %331, label %334, label %332

; <label>:332:                                    ; preds = %330
  %333 = tail call i32 @halide_do_task(i8* %319, i32 (i8*, i32, i8*)* nonnull %317, i32 %315, i8* %313) #12
  br label %337

; <label>:334:                                    ; preds = %330
  %335 = bitcast %"struct.Halide::Runtime::Internal::work"* %.sink147 to i8*
  %336 = tail call i32 @halide_do_loop_task(i8* %319, i32 (i8*, i32, i32, i8*, i8*)* %311, i32 %315, i32 1, i8* %313, i8* %335) #12
  br label %337

; <label>:337:                                    ; preds = %334, %332
  %338 = phi i32 [ %333, %332 ], [ %336, %334 ]
  tail call void @halide_mutex_lock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #12
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
  tail call void @halide_cond_broadcast(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 10)) #12
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
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %10) #9
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
  %18 = call i64 @_ZN6Halide7Runtime8Internal15Synchronization10unpark_oneEyRNS2_15parking_controlE(i64 %16, %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* nonnull dereferenceable(32) %17) #11
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %10) #9
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
  %3 = tail call dereferenceable(24) %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* @_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy(i64 %0) #12
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
  %43 = tail call i64 %40(i8* nonnull %41, i32 1, i1 zeroext %42) #11
  %44 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %10, i64 0, i32 3
  store i64 %43, i64* %44, align 8, !tbaa !72
  %45 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %10, i64 0, i32 0, i32 0
  %46 = tail call i32 @pthread_mutex_lock(%struct.pthread_mutex_t* nonnull %45) #11
  %47 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %3, i64 0, i32 0, i32 0
  %48 = atomicrmw and i64* %47, i64 -2 release
  %49 = and i64 %48, 2
  %50 = icmp eq i64 %49, 0
  %51 = icmp ugt i64 %48, 3
  %52 = and i1 %51, %50
  br i1 %52, label %53, label %55

; <label>:53:                                     ; preds = %37
  %54 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %3, i64 0, i32 0
  tail call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* nonnull %54) #11
  br label %55

; <label>:55:                                     ; preds = %53, %37
  %56 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %10, i64 0, i32 0, i32 2
  store i8 0, i8* %56, align 8, !tbaa !73
  %57 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %10, i64 0, i32 0, i32 1
  %58 = tail call i32 @pthread_cond_signal(%struct.pthread_mutex_t* nonnull %57) #11
  %59 = tail call i32 @pthread_mutex_unlock(%struct.pthread_mutex_t* nonnull %45) #11
  %60 = zext i8 %38 to i64
  br label %73

.loopexit:                                        ; preds = %7, %2
  %61 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::parking_control", %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* %1, i64 0, i32 2
  %62 = load i64 (i8*, i32, i1)*, i64 (i8*, i32, i1)** %61, align 8, !tbaa !41
  %63 = bitcast %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* %1 to i8*
  %64 = tail call i64 %62(i8* nonnull %63, i32 0, i1 zeroext false) #11
  %65 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %3, i64 0, i32 0, i32 0
  %66 = atomicrmw and i64* %65, i64 -2 release
  %67 = and i64 %66, 2
  %68 = icmp eq i64 %67, 0
  %69 = icmp ugt i64 %66, 3
  %70 = and i1 %69, %68
  br i1 %70, label %71, label %73

; <label>:71:                                     ; preds = %.loopexit
  %72 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %3, i64 0, i32 0
  tail call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* nonnull %72) #11
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
  tail call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* %9) #11
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
  tail call void @halide_print(i8* null, i8* getelementptr inbounds ([140 x i8], [140 x i8]* @.str.5, i64 0, i64 0)) #11
  tail call void @abort() #11
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
  %65 = tail call i32 @pthread_mutex_lock(%struct.pthread_mutex_t* nonnull %64) #11
  %66 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data", %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %37, i64 0, i32 0, i32 2
  store i8 0, i8* %66, align 8, !tbaa !73
  %67 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data", %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %37, i64 0, i32 0, i32 1
  %68 = tail call i32 @pthread_cond_signal(%struct.pthread_mutex_t* nonnull %67) #11
  %69 = tail call i32 @pthread_mutex_unlock(%struct.pthread_mutex_t* nonnull %64) #11
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
  call void @_ZN6Halide7Runtime8Internal19halide_thread_yieldEv() #11
  %33 = load atomic i64, i64* %3 monotonic, align 8
  br label %.backedge

; <label>:34:                                     ; preds = %29, %25
  %35 = phi i32 [ 0, %29 ], [ %15, %25 ]
  call void @llvm.lifetime.start.p0i8(i64 160, i8* nonnull %5) #9
  store i8 0, i8* %6, align 8, !tbaa !73
  %36 = call i32 @pthread_mutex_init(%struct.pthread_mutex_t* nonnull %7, i8* null) #11
  %37 = call i32 @pthread_cond_init(%struct.pthread_mutex_t* nonnull %8, i8* null) #11
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
  %51 = call i32 @pthread_mutex_lock(%struct.pthread_mutex_t* nonnull %7) #11
  %52 = load i8, i8* %6, align 8, !tbaa !73, !range !14
  %53 = icmp eq i8 %52, 0
  br i1 %53, label %.loopexit, label %.preheader

.preheader:                                       ; preds = %50
  br label %54

; <label>:54:                                     ; preds = %54, %.preheader
  %55 = call i32 @pthread_cond_wait(%struct.pthread_mutex_t* nonnull %8, %struct.pthread_mutex_t* nonnull %7) #11
  %56 = load i8, i8* %6, align 8, !tbaa !73, !range !14
  %57 = icmp eq i8 %56, 0
  br i1 %57, label %.loopexit, label %54

.loopexit:                                        ; preds = %54, %50
  %58 = call i32 @pthread_mutex_unlock(%struct.pthread_mutex_t* nonnull %7) #11
  %59 = load atomic i64, i64* %3 monotonic, align 8
  br label %60

; <label>:60:                                     ; preds = %.loopexit, %48
  %61 = phi i64 [ %59, %.loopexit ], [ %49, %48 ]
  %62 = phi i32 [ 40, %.loopexit ], [ %35, %48 ]
  %63 = call i32 @pthread_cond_destroy(%struct.pthread_mutex_t* nonnull %8) #11
  %64 = call i32 @pthread_mutex_destroy(%struct.pthread_mutex_t* nonnull %7) #11
  call void @llvm.lifetime.end.p0i8(i64 160, i8* nonnull %5) #9
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
  call void @llvm.lifetime.start.p0i8(i64 48, i8* nonnull %7) #9
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
  %17 = call i32 @_ZN6Halide7Runtime8Internal15Synchronization14unpark_requeueEyyRNS2_15parking_controlEy(i64 %15, i64 %4, %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* nonnull dereferenceable(32) %16, i64 0) #11
  call void @llvm.lifetime.end.p0i8(i64 48, i8* nonnull %7) #9
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
  call void @llvm.lifetime.start.p0i8(i64 48, i8* nonnull %5) #9
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
  %16 = call i64 @_ZN6Halide7Runtime8Internal15Synchronization4parkEyRNS2_15parking_controlE(i64 %14, %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* nonnull dereferenceable(32) %15) #11
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
  call void @_ZN6Halide7Runtime8Internal19halide_thread_yieldEv() #11
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
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %25) #9
  store void (i8*)* @_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv, void (i8*)** %27, align 8, !tbaa !35
  store void (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*, i1, i1)* @_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb, void (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*, i1, i1)** %29, align 8, !tbaa !37
  store i64* %19, i64** %30, align 8, !tbaa !38
  store i1 (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)* @_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE, i1 (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)** %26, align 8, !tbaa !40
  store i64 (i8*, i32, i1)* @_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib, i64 (i8*, i32, i1)** %28, align 8, !tbaa !41
  %62 = call i64 @_ZN6Halide7Runtime8Internal15Synchronization4parkEyRNS2_15parking_controlE(i64 %17, %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* nonnull dereferenceable(32) %31) #11
  %63 = icmp eq i64 %62, %17
  br i1 %63, label %66, label %64

; <label>:64:                                     ; preds = %61
  %65 = load atomic i64, i64* %19 monotonic, align 8
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %25) #9
  br label %.backedge

.backedge:                                        ; preds = %64, %59, %51
  %.be = phi i64 [ %60, %59 ], [ %65, %64 ], [ %53, %51 ]
  %.be5 = phi i32 [ %55, %59 ], [ 40, %64 ], [ %52, %51 ]
  br label %32

; <label>:66:                                     ; preds = %61
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %25) #9
  br label %.loopexit

; <label>:67:                                     ; preds = %2
  %68 = load atomic i64, i64* %19 monotonic, align 8
  %69 = and i64 %68, 1
  %70 = icmp eq i64 %69, 0
  br i1 %70, label %71, label %.loopexit

; <label>:71:                                     ; preds = %67
  call void @halide_print(i8* null, i8* getelementptr inbounds ([138 x i8], [138 x i8]* @.str.6, i64 0, i64 0)) #11
  call void @abort() #11
  br label %.loopexit

.loopexit:                                        ; preds = %71, %67, %66, %39, %20
  call void @llvm.lifetime.end.p0i8(i64 48, i8* nonnull %5) #9
  ret void
}

; Function Attrs: nounwind
define weak i32 @halide_do_loop_task(i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*) local_unnamed_addr #0 {
  %7 = load i32 (i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*)*, i32 (i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*)** @_ZN6Halide7Runtime8Internal19custom_do_loop_taskE, align 8, !tbaa !7
  %8 = tail call i32 %7(i8* %0, i32 (i8*, i32, i32, i8*, i8*)* %1, i32 %2, i32 %3, i8* %4, i8* %5) #11
  ret i32 %8
}

; Function Attrs: nounwind
define weak i32 @halide_do_task(i8*, i32 (i8*, i32, i8*)*, i32, i8*) local_unnamed_addr #0 {
  %5 = load i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)*, i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)** @_ZN6Halide7Runtime8Internal14custom_do_taskE, align 8, !tbaa !7
  %6 = tail call i32 %5(i8* %0, i32 (i8*, i32, i8*)* %1, i32 %2, i8* %3) #11
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
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %13) #9
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
  %21 = call i64 @_ZN6Halide7Runtime8Internal15Synchronization10unpark_oneEyRNS2_15parking_controlE(i64 %19, %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* nonnull dereferenceable(32) %20) #11
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %13) #9
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
  call void @llvm.lifetime.start.p0i8(i64 160, i8* nonnull %5) #9
  %6 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %3, i64 0, i32 0, i32 2
  store i8 0, i8* %6, align 8, !tbaa !73
  %7 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %3, i64 0, i32 0, i32 0
  %8 = call i32 @pthread_mutex_init(%struct.pthread_mutex_t* nonnull %7, i8* null) #11
  %9 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %3, i64 0, i32 0, i32 1
  %10 = call i32 @pthread_cond_init(%struct.pthread_mutex_t* nonnull %9, i8* null) #11
  store i8 0, i8* %6, align 8, !tbaa !73
  %11 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %3, i64 0, i32 1
  %12 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %3, i64 0, i32 3
  %13 = bitcast i64* %11 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %13, i8 0, i64 24, i32 8, i1 false)
  %14 = call dereferenceable(24) %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* @_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy(i64 %0) #12
  %15 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::validate_action", %"struct.Halide::Runtime::Internal::Synchronization::validate_action"* %4, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %15) #9
  store i8 0, i8* %15, align 8, !tbaa !86
  %16 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::validate_action", %"struct.Halide::Runtime::Internal::Synchronization::validate_action"* %4, i64 0, i32 2
  store i64 0, i64* %16, align 8, !tbaa !84
  %17 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::parking_control", %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* %1, i64 0, i32 0
  %18 = load i1 (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)*, i1 (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)** %17, align 8, !tbaa !40
  %19 = bitcast %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* %1 to i8*
  %20 = call zeroext i1 %18(i8* nonnull %19, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"* nonnull dereferenceable(16) %4) #11
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
  call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* nonnull %29) #11
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
  call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* nonnull %50) #11
  br label %51

; <label>:51:                                     ; preds = %49, %41
  %52 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::parking_control", %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* %1, i64 0, i32 1
  %53 = load void (i8*)*, void (i8*)** %52, align 8, !tbaa !35
  call void %53(i8* nonnull %19) #11
  %54 = call i32 @pthread_mutex_lock(%struct.pthread_mutex_t* nonnull %7) #11
  %55 = load i8, i8* %6, align 8, !tbaa !73, !range !14
  %56 = icmp eq i8 %55, 0
  br i1 %56, label %.loopexit, label %.preheader

.preheader:                                       ; preds = %51
  br label %57

; <label>:57:                                     ; preds = %57, %.preheader
  %58 = call i32 @pthread_cond_wait(%struct.pthread_mutex_t* nonnull %9, %struct.pthread_mutex_t* nonnull %7) #11
  %59 = load i8, i8* %6, align 8, !tbaa !73, !range !14
  %60 = icmp eq i8 %59, 0
  br i1 %60, label %.loopexit, label %57

.loopexit:                                        ; preds = %57, %51
  %61 = call i32 @pthread_mutex_unlock(%struct.pthread_mutex_t* nonnull %7) #11
  br label %62

; <label>:62:                                     ; preds = %.loopexit, %28, %21
  %63 = phi i64* [ %12, %.loopexit ], [ %16, %21 ], [ %16, %28 ]
  %64 = load i64, i64* %63, align 8, !tbaa !89
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %15) #9
  %65 = call i32 @pthread_cond_destroy(%struct.pthread_mutex_t* nonnull %9) #11
  %66 = call i32 @pthread_mutex_destroy(%struct.pthread_mutex_t* nonnull %7) #11
  call void @llvm.lifetime.end.p0i8(i64 160, i8* nonnull %5) #9
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
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %7) #9
  call void @_ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEyy(%"struct.Halide::Runtime::Internal::Synchronization::bucket_pair"* nonnull sret %5, i64 %0, i64 %1) #12
  %8 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::validate_action", %"struct.Halide::Runtime::Internal::Synchronization::validate_action"* %6, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %8) #9
  store i8 0, i8* %8, align 8, !tbaa !86
  %9 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::validate_action", %"struct.Halide::Runtime::Internal::Synchronization::validate_action"* %6, i64 0, i32 2
  store i64 0, i64* %9, align 8, !tbaa !84
  %10 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::parking_control", %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* %2, i64 0, i32 0
  %11 = load i1 (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)*, i1 (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)** %10, align 8, !tbaa !40
  %12 = bitcast %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* %2 to i8*
  %13 = call zeroext i1 %11(i8* nonnull %12, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"* nonnull dereferenceable(16) %6) #11
  br i1 %13, label %15, label %14

; <label>:14:                                     ; preds = %4
  call void @_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE(%"struct.Halide::Runtime::Internal::Synchronization::bucket_pair"* nonnull dereferenceable(16) %5) #12
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
  call void %109(i8* nonnull %12, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"* nonnull dereferenceable(16) %6, i1 zeroext %110, i1 zeroext %106) #11
  br i1 %110, label %111, label %119

; <label>:111:                                    ; preds = %105
  %112 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %107, i64 0, i32 3
  store i64 %3, i64* %112, align 8, !tbaa !72
  %113 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %107, i64 0, i32 0, i32 0
  %114 = call i32 @pthread_mutex_lock(%struct.pthread_mutex_t* nonnull %113) #11
  call void @_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE(%"struct.Halide::Runtime::Internal::Synchronization::bucket_pair"* nonnull dereferenceable(16) %5) #12
  %115 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %107, i64 0, i32 0, i32 2
  store i8 0, i8* %115, align 8, !tbaa !73
  %116 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %107, i64 0, i32 0, i32 1
  %117 = call i32 @pthread_cond_signal(%struct.pthread_mutex_t* nonnull %116) #11
  %118 = call i32 @pthread_mutex_unlock(%struct.pthread_mutex_t* nonnull %113) #11
  br label %120

; <label>:119:                                    ; preds = %105
  call void @_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE(%"struct.Halide::Runtime::Internal::Synchronization::bucket_pair"* nonnull dereferenceable(16) %5) #12
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
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %8) #9
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %7) #9
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
  tail call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* %15) #11
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
  tail call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* %25) #11
  br label %26

; <label>:26:                                     ; preds = %24, %18
  %27 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %20, i64 0, i32 0, i32 0
  %28 = cmpxchg weak i64* %27, i64 0, i64 1 acquire monotonic
  %29 = extractvalue { i64, i1 } %28, 1
  br i1 %29, label %46, label %30

; <label>:30:                                     ; preds = %26
  %31 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %20, i64 0, i32 0
  tail call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* %31) #11
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
  tail call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* %39) #11
  br label %40

; <label>:40:                                     ; preds = %38, %32
  %41 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %34, i64 0, i32 0, i32 0
  %42 = cmpxchg weak i64* %41, i64 0, i64 1 acquire monotonic
  %43 = extractvalue { i64, i1 } %42, 1
  br i1 %43, label %46, label %44

; <label>:44:                                     ; preds = %40
  %45 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %34, i64 0, i32 0
  tail call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* %45) #11
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
  tail call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* %15) #11
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
  tail call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* %26) #11
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
  tail call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* %36) #11
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
  tail call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* %45) #11
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
  tail call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* %55) #11
  br label %56

; <label>:56:                                     ; preds = %54, %46, %35, %27, %14, %7
  ret void
}

; Function Attrs: nounwind
define linkonce i32 @_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv() local_unnamed_addr #0 {
  %1 = tail call i8* @getenv(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i64 0, i64 0)) #11
  %2 = icmp eq i8* %1, null
  br i1 %2, label %3, label %6

; <label>:3:                                      ; preds = %0
  %4 = tail call i8* @getenv(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i64 0, i64 0)) #11
  %5 = icmp eq i8* %4, null
  br i1 %5, label %9, label %6

; <label>:6:                                      ; preds = %3, %0
  %7 = phi i8* [ %4, %3 ], [ %1, %0 ]
  %8 = tail call i32 @atoi(i8* nonnull %7) #11
  br label %11

; <label>:9:                                      ; preds = %3
  %10 = tail call i32 @halide_host_cpu_count() #11
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
  tail call void @halide_mutex_lock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #12
  %2 = bitcast i8* %0 to %"struct.Halide::Runtime::Internal::work"*
  tail call void @_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE(%"struct.Halide::Runtime::Internal::work"* %2) #12
  tail call void @halide_mutex_unlock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #12
  ret void
}

; Function Attrs: nounwind
define weak %struct.halide_thread* @halide_spawn_thread(void (i8*)*, i8*) local_unnamed_addr #0 {
  %3 = tail call i8* @malloc(i64 24) #11
  %4 = bitcast i8* %3 to void (i8*)**
  store void (i8*)* %0, void (i8*)** %4, align 8, !tbaa !93
  %5 = getelementptr inbounds i8, i8* %3, i64 8
  %6 = bitcast i8* %5 to i8**
  store i8* %1, i8** %6, align 8, !tbaa !95
  %7 = getelementptr inbounds i8, i8* %3, i64 16
  %8 = bitcast i8* %7 to i64*
  store i64 0, i64* %8, align 8, !tbaa !96
  %9 = tail call i32 @pthread_create(i64* nonnull %8, i8* null, i8* (i8*)* nonnull @_ZN6Halide7Runtime8Internal19spawn_thread_helperEPv, i8* %3) #11
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
  tail call void %3(i8* %6) #11
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
  tail call void @halide_mutex_lock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #12
  %37 = bitcast i8* %3 to %"struct.Halide::Runtime::Internal::work"*
  call void @_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_(i32 %8, %"struct.Halide::Runtime::Internal::work"* nonnull %6, %"struct.Halide::Runtime::Internal::work"* %37) #12
  %38 = icmp sgt i32 %8, 0
  br i1 %38, label %39, label %.loopexit

; <label>:39:                                     ; preds = %36
  %40 = zext i32 %8 to i64
  br label %42

.loopexit:                                        ; preds = %42, %36
  %41 = phi i32 [ 0, %36 ], [ %49, %42 ]
  call void @halide_mutex_unlock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #12
  br label %52

; <label>:42:                                     ; preds = %42, %39
  %43 = phi i64 [ 0, %39 ], [ %50, %42 ]
  %44 = phi i32 [ 0, %39 ], [ %49, %42 ]
  %45 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %6, i64 %43
  call void @_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE(%"struct.Halide::Runtime::Internal::work"* nonnull %45) #12
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
  tail call void @halide_mutex_lock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #12
  tail call void @halide_cond_broadcast(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 8)) #12
  tail call void @halide_cond_broadcast(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 10)) #12
  tail call void @halide_mutex_unlock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #12
  br label %9

; <label>:9:                                      ; preds = %8, %2
  %10 = add nsw i32 %4, %1
  ret i32 %10
}

; Function Attrs: nounwind
define weak void @halide_thread_pool_cleanup() #0 {
  tail call void @halide_shutdown_thread_pool() #12
  ret void
}

; Function Attrs: nounwind
define weak void @halide_shutdown_thread_pool() local_unnamed_addr #0 {
  %1 = load i8, i8* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 15), align 1, !tbaa !42, !range !14
  %2 = icmp eq i8 %1, 0
  br i1 %2, label %15, label %3

; <label>:3:                                      ; preds = %0
  tail call void @halide_mutex_lock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #12
  store i8 1, i8* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 14), align 8, !tbaa !57
  tail call void @halide_cond_broadcast(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 10)) #12
  tail call void @halide_cond_broadcast(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 8)) #12
  tail call void @halide_cond_broadcast(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 9)) #12
  tail call void @halide_mutex_unlock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #12
  %4 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 4), align 8, !tbaa !47
  %5 = icmp sgt i32 %4, 0
  br i1 %5, label %.preheader, label %.loopexit

.preheader:                                       ; preds = %3
  br label %7

.loopexit:                                        ; preds = %7, %3
  %6 = tail call i8* @memset(i8* nonnull bitcast (i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 2) to i8*), i32 0, i64 2116) #11
  br label %15

; <label>:7:                                      ; preds = %7, %.preheader
  %8 = phi i64 [ %11, %7 ], [ 0, %.preheader ]
  %9 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 13, i64 %8
  %10 = load %struct.halide_thread*, %struct.halide_thread** %9, align 8, !tbaa !7
  tail call void @halide_join_thread(%struct.halide_thread* %10) #12
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
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %4) #9
  store i8* null, i8** %2, align 8, !tbaa !7
  %5 = getelementptr inbounds %"struct.Halide::Runtime::Internal::spawned_thread", %"struct.Halide::Runtime::Internal::spawned_thread"* %3, i64 0, i32 2
  %6 = load i64, i64* %5, align 8, !tbaa !96
  %7 = call i32 @pthread_join(i64 %6, i8** nonnull %2) #11
  %8 = bitcast %struct.halide_thread* %0 to i8*
  call void @free(i8* %8) #11
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %4) #9
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
  call void @llvm.lifetime.start.p0i8(i64 48, i8* nonnull %7) #9
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
  %17 = call i64 @_ZN6Halide7Runtime8Internal15Synchronization10unpark_oneEyRNS2_15parking_controlE(i64 %15, %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* nonnull dereferenceable(32) %16) #11
  call void @llvm.lifetime.end.p0i8(i64 48, i8* nonnull %7) #9
  br label %18

; <label>:18:                                     ; preds = %6, %1
  ret void
}

; Function Attrs: nounwind
define weak i32 @halide_set_num_threads(i32) local_unnamed_addr #0 {
  %2 = icmp slt i32 %0, 0
  br i1 %2, label %3, label %4

; <label>:3:                                      ; preds = %1
  tail call void @halide_error(i8* null, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.4, i64 0, i64 0)) #11
  tail call void @halide_mutex_lock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #12
  br label %8

; <label>:4:                                      ; preds = %1
  tail call void @halide_mutex_lock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #12
  %5 = icmp eq i32 %0, 0
  br i1 %5, label %6, label %8

; <label>:6:                                      ; preds = %4
  %7 = tail call i32 @_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv() #12
  br label %8

; <label>:8:                                      ; preds = %6, %4, %3
  %9 = phi i32 [ %7, %6 ], [ %0, %4 ], [ %0, %3 ]
  %10 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 1), align 8, !tbaa !46
  %11 = tail call i32 @_ZN6Halide7Runtime8Internal17clamp_num_threadsEi(i32 %9) #12
  store i32 %11, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 1), align 8, !tbaa !46
  tail call void @halide_mutex_unlock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #12
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
  %7 = tail call i32 %6(i8* %0, i32 (i8*, i32, i8*)* %1, i32 %2, i32 %3, i8* %4) #11
  ret i32 %7
}

; Function Attrs: nounwind
define weak i32 @halide_do_parallel_tasks(i8*, i32, %struct.halide_parallel_task_t*, i8*) local_unnamed_addr #0 {
  %5 = load i32 (i8*, i32, %struct.halide_parallel_task_t*, i8*)*, i32 (i8*, i32, %struct.halide_parallel_task_t*, i8*)** @_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE, align 8, !tbaa !7
  %6 = tail call i32 %5(i8* %0, i32 %1, %struct.halide_parallel_task_t* %2, i8* %3) #11
  ret i32 %6
}

; Function Attrs: nounwind
define weak i32 @halide_semaphore_init(%struct.halide_semaphore_t*, i32) local_unnamed_addr #0 {
  %3 = load i32 (%struct.halide_semaphore_t*, i32)*, i32 (%struct.halide_semaphore_t*, i32)** @_ZN6Halide7Runtime8Internal21custom_semaphore_initE, align 8, !tbaa !7
  %4 = tail call i32 %3(%struct.halide_semaphore_t* %0, i32 %1) #11
  ret i32 %4
}

; Function Attrs: nounwind
define weak i32 @halide_semaphore_release(%struct.halide_semaphore_t*, i32) local_unnamed_addr #0 {
  %3 = load i32 (%struct.halide_semaphore_t*, i32)*, i32 (%struct.halide_semaphore_t*, i32)** @_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE, align 8, !tbaa !7
  %4 = tail call i32 %3(%struct.halide_semaphore_t* %0, i32 %1) #11
  ret i32 %4
}

; Function Attrs: nounwind
define weak zeroext i1 @halide_semaphore_try_acquire(%struct.halide_semaphore_t*, i32) local_unnamed_addr #0 {
  %3 = load i1 (%struct.halide_semaphore_t*, i32)*, i1 (%struct.halide_semaphore_t*, i32)** @_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE, align 8, !tbaa !7
  %4 = tail call zeroext i1 %3(%struct.halide_semaphore_t* %0, i32 %1) #11
  ret i1 %4
}

; Function Attrs: nounwind
define weak i8* @halide_default_get_symbol(i8*) #0 {
  %2 = tail call i8* @dlsym(i8* null, i8* %0) #11
  ret i8* %2
}

declare i8* @dlsym(i8*, i8*) local_unnamed_addr #4

; Function Attrs: nounwind
define weak i8* @halide_default_load_library(i8*) #0 {
  %2 = tail call i8* @dlopen(i8* %0, i32 1) #11
  %3 = icmp eq i8* %2, null
  br i1 %3, label %4, label %6

; <label>:4:                                      ; preds = %1
  %5 = tail call i8* @dlerror() #11
  br label %6

; <label>:6:                                      ; preds = %4, %1
  ret i8* %2
}

declare i8* @dlopen(i8*, i32) local_unnamed_addr #4

declare i8* @dlerror() local_unnamed_addr #4

; Function Attrs: nounwind
define weak i8* @halide_default_get_library_symbol(i8*, i8*) #0 {
  %3 = tail call i8* @dlsym(i8* %0, i8* %1) #11
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
  %3 = tail call i8* %2(i8* %0) #11
  ret i8* %3
}

; Function Attrs: nounwind
define weak i8* @halide_load_library(i8*) local_unnamed_addr #0 {
  %2 = load i8* (i8*)*, i8* (i8*)** @_ZN6Halide7Runtime8Internal19custom_load_libraryE, align 8, !tbaa !7
  %3 = tail call i8* %2(i8* %0) #11
  ret i8* %3
}

; Function Attrs: nounwind
define weak i8* @halide_get_library_symbol(i8*, i8*) local_unnamed_addr #0 {
  %3 = load i8* (i8*, i8*)*, i8* (i8*, i8*)** @_ZN6Halide7Runtime8Internal25custom_get_library_symbolE, align 8, !tbaa !7
  %4 = tail call i8* %3(i8* %0, i8* %1) #11
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
  %11 = tail call i8* @getenv(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.8, i64 0, i64 0)) #11
  %12 = icmp eq i8* %11, null
  br i1 %12, label %15, label %13

; <label>:13:                                     ; preds = %10
  %14 = tail call i32 @atoi(i8* nonnull %11) #11
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
  %5 = tail call i32 @halide_get_trace_file(i8* %0) #12
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
  %23 = tail call i64 @strlen(i8* %22) #11
  %24 = trunc i64 %23 to i32
  %25 = add i32 %24, 1
  %26 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 3
  %27 = load i8*, i8** %26, align 8, !tbaa !111
  %28 = icmp eq i8* %27, null
  br i1 %28, label %33, label %29

; <label>:29:                                     ; preds = %7
  %30 = tail call i64 @strlen(i8* nonnull %27) #11
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
  %70 = tail call i64 @write(i32 %5, i8* nonnull %45, i64 %69) #11
  %71 = trunc i64 %70 to i32
  %72 = icmp eq i32 %68, %71
  store i32 0, i32* %43, align 4, !tbaa !114
  store i32 0, i32* %44, align 4, !tbaa !116
  %73 = atomicrmw and i32* %41, i32 2147483647 seq_cst
  br i1 %72, label %.backedge, label %74

; <label>:74:                                     ; preds = %66
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([157 x i8], [157 x i8]* @.str.32, i64 0, i64 0)) #11
  tail call void @abort() #11
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
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([133 x i8], [133 x i8]* @.str.31, i64 0, i64 0)) #11
  tail call void @abort() #11
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
  %101 = tail call i64 @write(i32 %5, i8* nonnull %45, i64 %100) #11
  %102 = trunc i64 %101 to i32
  %103 = icmp eq i32 %99, %102
  store i32 0, i32* %43, align 4, !tbaa !114
  store i32 0, i32* %44, align 4, !tbaa !116
  %104 = atomicrmw and i32* %41, i32 2147483647 seq_cst
  br i1 %103, label %.backedge34, label %105

; <label>:105:                                    ; preds = %97
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([157 x i8], [157 x i8]* @.str.32, i64 0, i64 0)) #11
  tail call void @abort() #11
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
  %113 = tail call i8* @halide_malloc(i8* null, i64 1024) #11
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
  %121 = tail call i8* @halide_uint64_to_string(i8* %113, i8* %119, i64 %120, i32 1) #11
  %122 = tail call i8* @halide_string_to_string(i8* %121, i8* %119, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7.175, i64 0, i64 0)) #11
  br i1 %115, label %.predBB1.split, label %.predBB2.split

.predBB1.split:                                   ; preds = %118
  tail call void @halide_error(i8* null, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #11
  tail call void @halide_free(i8* null, i8* null) #11
  br label %126

.predBB2.split:                                   ; preds = %118
  %123 = ptrtoint i8* %122 to i64
  %124 = sub i64 1, %114
  %125 = add i64 %124, %123
  tail call void @halide_msan_annotate_memory_is_initialized(i8* null, i8* nonnull %113, i64 %125) #11
  tail call void @halide_print(i8* null, i8* nonnull %113) #11
  tail call void @halide_free(i8* null, i8* nonnull %113) #11
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
  %148 = tail call i8* @memcpy(i8* nonnull %146, i8* %145, i64 %147) #11
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
  %160 = tail call i8* @memcpy(i8* nonnull %158, i8* nonnull %151, i64 %159) #11
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
  %180 = tail call i8* @memcpy(i8* %177, i8* %178, i64 %179) #11
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
  %204 = tail call i8* @memcpy(i8* nonnull %196, i8* %202, i64 %203) #11
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
  %227 = tail call i64 @write(i32 %5, i8* nonnull %225, i64 %226) #11
  %228 = trunc i64 %227 to i32
  %229 = icmp eq i32 %224, %228
  store i32 0, i32* %218, align 4, !tbaa !114
  store i32 0, i32* %222, align 4, !tbaa !116
  %230 = atomicrmw and i32* %212, i32 2147483647 seq_cst
  br i1 %229, label %491, label %231

; <label>:231:                                    ; preds = %221
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([157 x i8], [157 x i8]* @.str.32, i64 0, i64 0)) #11
  tail call void @abort() #11
  br label %491

; <label>:232:                                    ; preds = %217
  %233 = atomicrmw and i32* %212, i32 2147483647 seq_cst
  br label %491

; <label>:234:                                    ; preds = %2
  %235 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 4096, i8* nonnull %235) #9
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
  call void @halide_print(i8* %0, i8* getelementptr inbounds ([153 x i8], [153 x i8]* @.str.2.11, i64 0, i64 0)) #11
  call void @abort() #11
  br label %248

; <label>:248:                                    ; preds = %247, %244
  %249 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 5
  %250 = load i32, i32* %249, align 4, !tbaa !124
  %251 = icmp slt i32 %250, 2
  %252 = zext i32 %250 to i64
  %253 = getelementptr inbounds [11 x i8*], [11 x i8*]* @_ZZ20halide_default_traceE11event_types, i64 0, i64 %252
  %254 = load i8*, i8** %253, align 8, !tbaa !7
  %255 = call i8* @halide_string_to_string(i8* nonnull %235, i8* nonnull %236, i8* nonnull %254) #11
  %256 = call i8* @halide_string_to_string(i8* %255, i8* nonnull %236, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.20.188, i64 0, i64 0)) #11
  %257 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 0
  %258 = load i8*, i8** %257, align 8, !tbaa !110
  %259 = icmp eq i8* %258, null
  br i1 %259, label %260, label %262

; <label>:260:                                    ; preds = %248
  %261 = call i8* @halide_string_to_string(i8* %256, i8* nonnull %236, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #11
  br label %264

; <label>:262:                                    ; preds = %248
  %263 = call i8* @halide_string_to_string(i8* %256, i8* nonnull %236, i8* nonnull %258) #11
  br label %264

; <label>:264:                                    ; preds = %262, %260
  %265 = phi i8* [ %263, %262 ], [ %261, %260 ]
  %266 = call i8* @halide_string_to_string(i8* %265, i8* nonnull %236, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30.142, i64 0, i64 0)) #11
  %267 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 7
  %268 = load i32, i32* %267, align 4, !tbaa !126
  %269 = sext i32 %268 to i64
  %270 = call i8* @halide_int64_to_string(i8* %266, i8* nonnull %236, i64 %269, i32 1) #11
  %271 = call i8* @halide_string_to_string(i8* %270, i8* nonnull %236, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.22.190, i64 0, i64 0)) #11
  %272 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 4, i32 2
  %273 = load i16, i16* %272, align 2, !tbaa !103
  %274 = icmp ugt i16 %273, 1
  br i1 %274, label %275, label %277

; <label>:275:                                    ; preds = %264
  %276 = call i8* @halide_string_to_string(i8* %271, i8* nonnull %236, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.17, i64 0, i64 0)) #11
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
  %288 = call i8* @halide_string_to_string(i8* %284, i8* nonnull %236, i8* nonnull %287) #11
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
  %302 = call i8* @halide_string_to_string(i8* %292, i8* nonnull %236, i8* nonnull %.sink) #11
  br label %303

; <label>:303:                                    ; preds = %.sink.split, %290
  %304 = phi i8* [ %292, %290 ], [ %302, %.sink.split ]
  %305 = load i32*, i32** %283, align 8, !tbaa !120
  %306 = getelementptr inbounds i32, i32* %305, i64 %291
  %307 = load i32, i32* %306, align 4, !tbaa !99
  %308 = sext i32 %307 to i64
  %309 = call i8* @halide_int64_to_string(i8* %304, i8* nonnull %236, i64 %308, i32 1) #11
  %310 = add nuw nsw i64 %291, 1
  %311 = load i32, i32* %279, align 8, !tbaa !109
  %312 = sext i32 %311 to i64
  %313 = icmp slt i64 %310, %312
  br i1 %313, label %290, label %.loopexit4

; <label>:314:                                    ; preds = %.loopexit4
  %315 = load i16, i16* %272, align 2, !tbaa !103
  %316 = icmp ugt i16 %315, 1
  %317 = select i1 %316, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.22, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.23, i64 0, i64 0)
  %318 = call i8* @halide_string_to_string(i8* %288, i8* nonnull %236, i8* nonnull %317) #11
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
  %339 = call i8* @halide_string_to_string(i8* %338, i8* nonnull %236, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i64 0, i64 0)) #11
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
  %351 = call i8* @halide_int64_to_string(i8* %349, i8* nonnull %236, i64 %350, i32 1) #11
  %352 = ptrtoint i8* %351 to i64
  br label %449

; <label>:353:                                    ; preds = %344
  %354 = load i16*, i16** %328, align 8, !tbaa !121
  %355 = getelementptr inbounds i16, i16* %354, i64 %334
  %356 = load i16, i16* %355, align 2, !tbaa !128
  %357 = inttoptr i64 %342 to i8*
  %358 = sext i16 %356 to i64
  %359 = call i8* @halide_int64_to_string(i8* %357, i8* nonnull %236, i64 %358, i32 1) #11
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
  %369 = call i8* @halide_int64_to_string(i8* %367, i8* nonnull %236, i64 %368, i32 1) #11
  %370 = ptrtoint i8* %369 to i64
  br label %449

; <label>:371:                                    ; preds = %361
  %372 = bitcast i8* %362 to i64*
  %373 = getelementptr inbounds i64, i64* %372, i64 %334
  %374 = load i64, i64* %373, align 8, !tbaa !89
  %375 = inttoptr i64 %342 to i8*
  %376 = call i8* @halide_int64_to_string(i8* %375, i8* nonnull %236, i64 %374, i32 1) #11
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
  %385 = call i8* @halide_int64_to_string(i8* %383, i8* nonnull %236, i64 %384, i32 1) #11
  %386 = ptrtoint i8* %385 to i64
  br label %449

; <label>:387:                                    ; preds = %378
  %388 = load i16*, i16** %328, align 8, !tbaa !121
  %389 = getelementptr inbounds i16, i16* %388, i64 %334
  %390 = load i16, i16* %389, align 2, !tbaa !128
  %391 = inttoptr i64 %342 to i8*
  %392 = zext i16 %390 to i64
  %393 = call i8* @halide_int64_to_string(i8* %391, i8* nonnull %236, i64 %392, i32 1) #11
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
  %403 = call i8* @halide_uint64_to_string(i8* %401, i8* nonnull %236, i64 %402, i32 1) #11
  %404 = ptrtoint i8* %403 to i64
  br label %449

; <label>:405:                                    ; preds = %395
  %406 = bitcast i8* %396 to i64*
  %407 = getelementptr inbounds i64, i64* %406, i64 %334
  %408 = load i64, i64* %407, align 8, !tbaa !89
  %409 = inttoptr i64 %342 to i8*
  %410 = call i8* @halide_uint64_to_string(i8* %409, i8* nonnull %236, i64 %408, i32 1) #11
  %411 = ptrtoint i8* %410 to i64
  br label %449

; <label>:412:                                    ; preds = %341
  br i1 %324, label %415, label %413

; <label>:413:                                    ; preds = %412
  call void @halide_print(i8* %0, i8* getelementptr inbounds ([155 x i8], [155 x i8]* @.str.24, i64 0, i64 0)) #11
  call void @abort() #11
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
  %422 = call i8* @halide_double_to_string(i8* %420, i8* nonnull %236, double %421, i32 0) #11
  %423 = ptrtoint i8* %422 to i64
  br label %449

; <label>:424:                                    ; preds = %415
  %425 = load i8*, i8** %325, align 8, !tbaa !121
  br i1 %330, label %426, label %434

; <label>:426:                                    ; preds = %424
  %427 = bitcast i8* %425 to i16*
  %428 = getelementptr inbounds i16, i16* %427, i64 %334
  %429 = load i16, i16* %428, align 2, !tbaa !128
  %430 = call double @halide_float16_bits_to_double(i16 zeroext %429) #11
  %431 = inttoptr i64 %342 to i8*
  %432 = call i8* @halide_double_to_string(i8* %431, i8* nonnull %236, double %430, i32 1) #11
  %433 = ptrtoint i8* %432 to i64
  br label %449

; <label>:434:                                    ; preds = %424, %413
  %435 = phi i8* [ %414, %413 ], [ %425, %424 ]
  %436 = bitcast i8* %435 to double*
  %437 = getelementptr inbounds double, double* %436, i64 %334
  %438 = load double, double* %437, align 8, !tbaa !131
  %439 = inttoptr i64 %342 to i8*
  %440 = call i8* @halide_double_to_string(i8* %439, i8* nonnull %236, double %438, i32 1) #11
  %441 = ptrtoint i8* %440 to i64
  br label %449

; <label>:442:                                    ; preds = %341
  %443 = load i8**, i8*** %326, align 8, !tbaa !121
  %444 = getelementptr inbounds i8*, i8** %443, i64 %334
  %445 = load i8*, i8** %444, align 8, !tbaa !7
  %446 = inttoptr i64 %342 to i8*
  %447 = call i8* @halide_pointer_to_string(i8* %446, i8* nonnull %236, i8* %445) #11
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
  %457 = call i8* @halide_string_to_string(i8* %456, i8* nonnull %236, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.25, i64 0, i64 0)) #11
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
  %469 = call i8* @halide_string_to_string(i8* %468, i8* nonnull %236, i8* nonnull getelementptr inbounds ([9 x i8], [9 x i8]* @.str.26, i64 0, i64 0)) #11
  %470 = load i8*, i8** %461, align 8, !tbaa !111
  %471 = icmp eq i8* %470, null
  br i1 %471, label %472, label %474

; <label>:472:                                    ; preds = %467
  %473 = call i8* @halide_string_to_string(i8* %469, i8* nonnull %236, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #11
  br label %476

; <label>:474:                                    ; preds = %467
  %475 = call i8* @halide_string_to_string(i8* %469, i8* nonnull %236, i8* nonnull %470) #11
  br label %476

; <label>:476:                                    ; preds = %474, %472
  %477 = phi i8* [ %475, %474 ], [ %473, %472 ]
  %478 = call i8* @halide_string_to_string(i8* %477, i8* nonnull %236, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.27, i64 0, i64 0)) #11
  %479 = ptrtoint i8* %478 to i64
  br label %480

; <label>:480:                                    ; preds = %476, %464, %459
  %481 = phi i64 [ %460, %459 ], [ %460, %464 ], [ %479, %476 ]
  %482 = inttoptr i64 %481 to i8*
  %483 = call i8* @halide_string_to_string(i8* %482, i8* nonnull %236, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7.175, i64 0, i64 0)) #11
  %484 = ptrtoint i8* %483 to i64
  %485 = sub i64 1, %245
  %486 = add i64 %485, %484
  call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %235, i64 %486) #11
  br label %487

; <label>:487:                                    ; preds = %487, %480
  %488 = atomicrmw xchg i32* @_ZN6Halide7Runtime8Internal22halide_trace_file_lockE, i32 1 seq_cst
  %489 = icmp eq i32 %488, 0
  br i1 %489, label %490, label %487

; <label>:490:                                    ; preds = %487
  call void @halide_print(i8* %0, i8* nonnull %235) #11
  store atomic i32 0, i32* @_ZN6Halide7Runtime8Internal22halide_trace_file_lockE release, align 4
  call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %235, i64 %486) #11
  call void @llvm.lifetime.end.p0i8(i64 4096, i8* nonnull %235) #9
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
  %9 = tail call i8* @getenv(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.28, i64 0, i64 0)) #11
  %10 = icmp eq i8* %9, null
  br i1 %10, label %26, label %11

; <label>:11:                                     ; preds = %8
  %12 = tail call i8* @fopen(i8* nonnull %9, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.29, i64 0, i64 0)) #11
  %13 = icmp eq i8* %12, null
  br i1 %13, label %14, label %15

; <label>:14:                                     ; preds = %11
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([152 x i8], [152 x i8]* @.str.30, i64 0, i64 0)) #11
  tail call void @abort() #11
  br label %15

; <label>:15:                                     ; preds = %14, %11
  %16 = tail call i32 @fileno(i8* %12) #11
  tail call void @halide_set_trace_file(i32 %16) #12
  store i8* %12, i8** @_ZN6Halide7Runtime8Internal35halide_trace_file_internally_openedE, align 8, !tbaa !7
  %17 = load %"class.Halide::Runtime::Internal::TraceBuffer"*, %"class.Halide::Runtime::Internal::TraceBuffer"** @_ZN6Halide7Runtime8Internal19halide_trace_bufferE, align 8, !tbaa !7
  %18 = icmp eq %"class.Halide::Runtime::Internal::TraceBuffer"* %17, null
  br i1 %18, label %19, label %27

; <label>:19:                                     ; preds = %15
  %20 = tail call i8* @malloc(i64 1048588) #11
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
  tail call void @halide_set_trace_file(i32 0) #12
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
  %1 = tail call i32 @halide_shutdown_trace() #12
  ret void
}

; Function Attrs: nounwind
define weak i32 @halide_shutdown_trace() local_unnamed_addr #0 {
  %1 = load i8*, i8** @_ZN6Halide7Runtime8Internal35halide_trace_file_internally_openedE, align 8, !tbaa !7
  %2 = icmp eq i8* %1, null
  br i1 %2, label %9, label %3

; <label>:3:                                      ; preds = %0
  %4 = tail call i32 @fclose(i8* nonnull %1) #11
  store i32 0, i32* @_ZN6Halide7Runtime8Internal17halide_trace_fileE, align 4, !tbaa !99
  store i8 0, i8* @_ZN6Halide7Runtime8Internal29halide_trace_file_initializedE, align 1, !tbaa !12
  store i8* null, i8** @_ZN6Halide7Runtime8Internal35halide_trace_file_internally_openedE, align 8, !tbaa !7
  %5 = load %"class.Halide::Runtime::Internal::TraceBuffer"*, %"class.Halide::Runtime::Internal::TraceBuffer"** @_ZN6Halide7Runtime8Internal19halide_trace_bufferE, align 8, !tbaa !7
  %6 = icmp eq %"class.Halide::Runtime::Internal::TraceBuffer"* %5, null
  br i1 %6, label %9, label %7

; <label>:7:                                      ; preds = %3
  %8 = bitcast %"class.Halide::Runtime::Internal::TraceBuffer"* %5 to i8*
  tail call void @free(i8* %8) #11
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
  %4 = tail call i32 %3(i8* %0, %struct.halide_trace_event_t* %1) #11
  ret i32 %4
}

; Function Attrs: nounwind
define weak i32 @halide_trace_helper(i8*, i8*, i8*, i32*, i32, i32, i32, i32, i32, i32, i32, i8*) local_unnamed_addr #0 {
  %13 = alloca %struct.halide_trace_event_t, align 8
  %14 = bitcast %struct.halide_trace_event_t* %13 to i8*
  call void @llvm.lifetime.start.p0i8(i64 56, i8* nonnull %14) #9
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
  call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %14, i64 56) #11
  %29 = add nsw i32 %5, 7
  %30 = sdiv i32 %29, 8
  %31 = mul nsw i32 %30, %6
  %32 = sext i32 %31 to i64
  call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* %2, i64 %32) #11
  %33 = bitcast i32* %3 to i8*
  %34 = sext i32 %10 to i64
  %35 = shl nsw i64 %34, 2
  call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* %33, i64 %35) #11
  %36 = call i32 @halide_trace(i8* %0, %struct.halide_trace_event_t* nonnull %13) #11
  call void @llvm.lifetime.end.p0i8(i64 56, i8* nonnull %14) #9
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
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.35, i64 0, i64 0)) #11
  br label %578

; <label>:23:                                     ; preds = %4
  %24 = tail call i32 @halide_copy_to_host(i8* %0, %struct.halide_buffer_t* nonnull %3) #11
  %25 = tail call i8* @fopen(i8* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1.36, i64 0, i64 0)) #11
  %26 = icmp eq i8* %25, null
  br i1 %26, label %575, label %27

; <label>:27:                                     ; preds = %23
  %28 = bitcast [4 x %struct.halide_dimension_t]* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %28) #9
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
  %69 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal9ends_withEPKcS3_(i8* %1, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2.37, i64 0, i64 0)) #12
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
  %78 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal9ends_withEPKcS3_(i8* %1, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3.38, i64 0, i64 0)) #12
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
  call void @llvm.lifetime.start.p0i8(i64 210, i8* nonnull %89) #9
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
  %183 = call i64 @fwrite(i8* nonnull %89, i64 210, i64 1, i8* nonnull %25) #11
  %184 = icmp eq i64 %183, 0
  br i1 %184, label %217, label %185

; <label>:185:                                    ; preds = %143
  %186 = icmp sgt i32 %88, 1
  br i1 %186, label %187, label %219

; <label>:187:                                    ; preds = %185
  %188 = bitcast i32* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %188) #9
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
  %198 = call i64 @fwrite(i8* nonnull %188, i64 4, i64 1, i8* nonnull %25) #11
  %199 = icmp eq i64 %198, 0
  br i1 %199, label %200, label %201

; <label>:200:                                    ; preds = %196
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %188) #9
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
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %207) #9
  store i32 %195, i32* %8, align 4, !tbaa !99
  %208 = icmp sgt i32 %88, 0
  br i1 %208, label %.preheader81, label %.loopexit1

.preheader81:                                     ; preds = %206
  br label %211

; <label>:209:                                    ; preds = %211
  %210 = icmp slt i32 %215, %88
  br i1 %210, label %211, label %.loopexit1

.loopexit1:                                       ; preds = %209, %206
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %207) #9
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %188) #9
  br label %219

; <label>:211:                                    ; preds = %209, %.preheader81
  %212 = phi i32 [ %215, %209 ], [ 0, %.preheader81 ]
  %213 = call i64 @fwrite(i8* nonnull %207, i64 4, i64 1, i8* nonnull %25) #11
  %214 = icmp eq i64 %213, 0
  %215 = add nuw nsw i32 %212, 1
  br i1 %214, label %216, label %209

; <label>:216:                                    ; preds = %211
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %207) #9
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %188) #9
  br label %217

; <label>:217:                                    ; preds = %216, %200, %143
  %218 = phi i32 [ -4, %200 ], [ -3, %143 ], [ -5, %216 ]
  call void @llvm.lifetime.end.p0i8(i64 210, i8* nonnull %89) #9
  br label %573

; <label>:219:                                    ; preds = %.loopexit1, %185
  call void @llvm.lifetime.end.p0i8(i64 210, i8* nonnull %89) #9
  br label %428

; <label>:220:                                    ; preds = %77
  %221 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal9ends_withEPKcS3_(i8* %1, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4.39, i64 0, i64 0)) #12
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
  call void @llvm.lifetime.start.p0i8(i64 256, i8* nonnull %235) #9
  br label %.loopexit2.loopexit

; <label>:236:                                    ; preds = %242
  %237 = icmp eq i8* %245, %1
  br i1 %237, label %238, label %242

; <label>:238:                                    ; preds = %236
  %239 = trunc i64 %244 to i32
  %240 = xor i32 %239, -1
  %241 = getelementptr inbounds [256 x i8], [256 x i8]* %9, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 256, i8* nonnull %241) #9
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
  call void @llvm.lifetime.start.p0i8(i64 256, i8* nonnull %251) #9
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
  call void @llvm.lifetime.start.p0i8(i64 129, i8* nonnull %282) #9
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %282, i8* getelementptr inbounds ([129 x i8], [129 x i8]* @_ZZ20halide_debug_to_fileE6header, i64 0, i64 0), i64 129, i32 1, i1 false)
  %283 = call i64 @fwrite(i8* nonnull %282, i64 128, i64 1, i8* nonnull %25) #11
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
  call void @halide_error(i8* %0, i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.5.40, i64 0, i64 0)) #11
  call void @llvm.lifetime.end.p0i8(i64 129, i8* nonnull %282) #9
  call void @llvm.lifetime.end.p0i8(i64 256, i8* nonnull %279) #9
  br label %573

; <label>:341:                                    ; preds = %330
  %342 = icmp sgt i32 %284, 2
  %343 = select i1 %342, i32 %284, i32 2
  %344 = bitcast [8 x i32]* %11 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %344) #9
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
  %364 = call i64 @fwrite(i8* nonnull %344, i64 32, i64 1, i8* nonnull %25) #11
  %365 = icmp eq i64 %364, 0
  br i1 %365, label %410, label %366

; <label>:366:                                    ; preds = %341
  %367 = bitcast [4 x i32]* %12 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %367) #9
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
  %377 = call i64 @fwrite(i8* nonnull %367, i64 %376, i64 1, i8* nonnull %25) #11
  %378 = icmp eq i64 %377, 0
  br i1 %378, label %406, label %379

; <label>:379:                                    ; preds = %366
  %380 = bitcast [2 x i32]* %13 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %380) #9
  %381 = getelementptr inbounds [2 x i32], [2 x i32]* %13, i64 0, i64 0
  store i32 1, i32* %381, align 4, !tbaa !99
  %382 = getelementptr inbounds [2 x i32], [2 x i32]* %13, i64 0, i64 1
  store i32 %278, i32* %382, align 4, !tbaa !99
  %383 = call i64 @fwrite(i8* nonnull %380, i64 8, i64 1, i8* nonnull %25) #11
  %384 = icmp eq i64 %383, 0
  br i1 %384, label %402, label %385

; <label>:385:                                    ; preds = %379
  %386 = zext i32 %281 to i64
  %387 = call i64 @fwrite(i8* nonnull %279, i64 %386, i64 1, i8* nonnull %25) #11
  %388 = icmp eq i64 %387, 0
  br i1 %388, label %402, label %389

; <label>:389:                                    ; preds = %385
  %390 = add i32 %350, 7
  %391 = and i32 %390, 7
  %392 = xor i32 %391, 7
  %393 = bitcast [2 x i32]* %14 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %393) #9
  %394 = getelementptr inbounds [2 x i32], [2 x i32]* %14, i64 0, i64 0
  %395 = getelementptr inbounds [10 x i8], [10 x i8]* @_ZN6Halide7Runtime8Internal30pixel_type_to_matlab_type_codeE, i64 0, i64 %357
  %396 = load i8, i8* %395, align 1, !tbaa !11
  %397 = zext i8 %396 to i32
  store i32 %397, i32* %394, align 4, !tbaa !99
  %398 = getelementptr inbounds [2 x i32], [2 x i32]* %14, i64 0, i64 1
  store i32 %350, i32* %398, align 4, !tbaa !99
  %399 = call i64 @fwrite(i8* nonnull %393, i64 8, i64 1, i8* nonnull %25) #11
  %400 = icmp eq i64 %399, 0
  %401 = zext i1 %400 to i32
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %393) #9
  br label %402

; <label>:402:                                    ; preds = %389, %385, %379
  %403 = phi i32 [ %392, %389 ], [ 0, %379 ], [ 0, %385 ]
  %404 = phi i32 [ %401, %389 ], [ 1, %379 ], [ 1, %385 ]
  %405 = phi i32 [ -11, %389 ], [ -9, %379 ], [ -10, %385 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %380) #9
  br label %406

; <label>:406:                                    ; preds = %402, %366
  %407 = phi i32 [ %403, %402 ], [ 0, %366 ]
  %408 = phi i32 [ %404, %402 ], [ 1, %366 ]
  %409 = phi i32 [ %405, %402 ], [ -8, %366 ]
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %367) #9
  br label %410

; <label>:410:                                    ; preds = %406, %341
  %411 = phi i32 [ %407, %406 ], [ 0, %341 ]
  %412 = phi i32 [ %408, %406 ], [ 1, %341 ]
  %413 = phi i32 [ %409, %406 ], [ -7, %341 ]
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %344) #9
  call void @llvm.lifetime.end.p0i8(i64 129, i8* nonnull %282) #9
  call void @llvm.lifetime.end.p0i8(i64 256, i8* nonnull %279) #9
  %414 = icmp eq i32 %412, 0
  br i1 %414, label %428, label %573

; <label>:415:                                    ; preds = %220
  %416 = bitcast [5 x i32]* %15 to i8*
  call void @llvm.lifetime.start.p0i8(i64 20, i8* nonnull %416) #9
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
  %426 = call i64 @fwrite(i8* nonnull %416, i64 20, i64 1, i8* nonnull %25) #11
  %427 = icmp eq i64 %426, 0
  call void @llvm.lifetime.end.p0i8(i64 20, i8* nonnull %416) #9
  br i1 %427, label %573, label %428

; <label>:428:                                    ; preds = %415, %410, %219
  %429 = phi i32 [ 0, %415 ], [ 0, %219 ], [ %411, %410 ]
  %430 = getelementptr inbounds [4096 x i8], [4096 x i8]* %16, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 4096, i8* nonnull %430) #9
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
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %436) #9
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
  %524 = call i8* @memcpy(i8* nonnull %523, i8* %520, i64 %443) #11
  %525 = icmp eq i32 %477, %431
  br i1 %525, label %526, label %529

; <label>:526:                                    ; preds = %.loopexit
  %527 = call i64 @fwrite(i8* nonnull %430, i64 %445, i64 1, i8* nonnull %25) #11
  %528 = icmp eq i64 %527, 0
  br i1 %528, label %550, label %529

; <label>:529:                                    ; preds = %526, %.loopexit
  %530 = phi i32 [ 0, %526 ], [ %477, %.loopexit ]
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %436) #9
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
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %436) #9
  br label %571

; <label>:551:                                    ; preds = %.loopexit63
  %552 = icmp sgt i32 %546, 0
  br i1 %552, label %553, label %558

; <label>:553:                                    ; preds = %551
  %554 = mul nsw i32 %546, %68
  %555 = sext i32 %554 to i64
  %556 = call i64 @fwrite(i8* nonnull %430, i64 %555, i64 1, i8* nonnull %25) #11
  %557 = icmp eq i64 %556, 0
  br i1 %557, label %571, label %558

; <label>:558:                                    ; preds = %553, %551, %428
  %559 = bitcast i64* %18 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %559) #9
  store i64 0, i64* %18, align 8, !tbaa !89
  %560 = icmp eq i32 %429, 0
  br i1 %560, label %568, label %561

; <label>:561:                                    ; preds = %558
  %562 = icmp ugt i32 %429, 8
  br i1 %562, label %563, label %564

; <label>:563:                                    ; preds = %561
  call void @halide_error(i8* %0, i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.6.41, i64 0, i64 0)) #11
  br label %569

; <label>:564:                                    ; preds = %561
  %565 = zext i32 %429 to i64
  %566 = call i64 @fwrite(i8* nonnull %559, i64 %565, i64 1, i8* nonnull %25) #11
  %567 = icmp eq i64 %566, 0
  br i1 %567, label %569, label %568

; <label>:568:                                    ; preds = %564, %558
  br label %569

; <label>:569:                                    ; preds = %568, %564, %563
  %570 = phi i32 [ -15, %563 ], [ 0, %568 ], [ -16, %564 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %559) #9
  br label %571

; <label>:571:                                    ; preds = %569, %553, %550
  %572 = phi i32 [ %570, %569 ], [ -13, %550 ], [ -14, %553 ]
  call void @llvm.lifetime.end.p0i8(i64 4096, i8* nonnull %430) #9
  br label %573

; <label>:573:                                    ; preds = %571, %415, %410, %340, %217
  %574 = phi i32 [ %572, %571 ], [ %413, %410 ], [ -12, %415 ], [ %218, %217 ], [ -6, %340 ]
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %28) #9
  br label %575

; <label>:575:                                    ; preds = %573, %23
  %576 = phi i32 [ %574, %573 ], [ -2, %23 ]
  %577 = call i32 @fclose(i8* %25) #11
  br label %578

; <label>:578:                                    ; preds = %575, %22
  %579 = phi i32 [ -1, %22 ], [ %576, %575 ]
  ret i32 %579
}

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, i8* nocapture) local_unnamed_addr #1

; Function Attrs: nounwind
define weak void @halide_cache_cleanup() #0 {
  tail call void @halide_memoization_cache_cleanup() #12
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
  tail call void @_ZN6Halide7Runtime8Internal10CacheEntry7destroyEv(%"struct.Halide::Runtime::Internal::CacheEntry"* nonnull %8) #12
  tail call void @halide_free(i8* null, i8* %9) #11
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
  tail call void @halide_free(i8* null, i8* %8) #11
  ret void

; <label>:9:                                      ; preds = %9, %5
  %10 = phi i64 [ 0, %5 ], [ %19, %9 ]
  %11 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %6, align 8, !tbaa !156
  %12 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %11, i64 %10
  %13 = tail call i32 @halide_device_free(i8* null, %struct.halide_buffer_t* %12) #11
  %14 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %6, align 8, !tbaa !156
  %15 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %14, i64 %10, i32 2
  %16 = load i8*, i8** %15, align 8, !tbaa !151
  %17 = tail call %"struct.Halide::Runtime::Internal::CacheBlockHeader"* @_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh(i8* %16) #12
  %18 = bitcast %"struct.Halide::Runtime::Internal::CacheBlockHeader"* %17 to i8*
  tail call void @halide_free(i8* null, i8* %18) #11
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
  %32 = tail call i8* @memcpy(i8* %29, i8* %25, i64 %31) #11
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
  tail call void @_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx(%"struct.Halide::Runtime::Internal::device_copy"* nonnull dereferenceable(416) %0, i32 %42, i64 %47, i64 %48) #12
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
  tail call void @_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx(%"struct.Halide::Runtime::Internal::device_copy"* nonnull dereferenceable(416) %0, i32 15, i64 %10, i64 0) #12
  br label %11

; <label>:11:                                     ; preds = %8, %2
  ret void
}

; Function Attrs: nounwind
define linkonce void @_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b(%"struct.Halide::Runtime::Internal::device_copy"* noalias sret, %struct.halide_buffer_t*, i1 zeroext, %struct.halide_buffer_t*, i1 zeroext) local_unnamed_addr #0 {
  %6 = alloca %"struct.Halide::Runtime::Internal::device_copy", align 8
  %7 = bitcast %"struct.Halide::Runtime::Internal::device_copy"* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 416, i8* nonnull %7) #9
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
  call void @llvm.lifetime.end.p0i8(i64 416, i8* nonnull %7) #9
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #3

; Function Attrs: nounwind
define linkonce zeroext i1 @_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m(i8*, i8*, i64) local_unnamed_addr #0 {
  %4 = tail call i32 @memcmp(i8* %0, i8* %1, i64 %2) #11
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
  %25 = tail call i8* @halide_malloc(i8* null, i64 %24) #11
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
  tail call void @halide_print(i8* null, i8* getelementptr inbounds ([136 x i8], [136 x i8]* @.str.4.43, i64 0, i64 0)) #11
  tail call void @abort() #11
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
  tail call void @_ZN6Halide7Runtime8Internal10CacheEntry7destroyEv(%"struct.Halide::Runtime::Internal::CacheEntry"* nonnull %10) #12
  %74 = bitcast %"struct.Halide::Runtime::Internal::CacheEntry"* %10 to i8*
  tail call void @halide_free(i8* null, i8* %74) #11
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
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal16memoization_lockE) #11
  store i64 %3, i64* @_ZN6Halide7Runtime8Internal14max_cache_sizeE, align 8, !tbaa !89
  tail call void @_ZN6Halide7Runtime8Internal11prune_cacheEv() #12
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal16memoization_lockE) #11
  ret void
}

; Function Attrs: nounwind
define weak i32 @halide_memoization_cache_lookup(i8*, i8*, i32, %struct.halide_buffer_t*, i32, %struct.halide_buffer_t**) local_unnamed_addr #0 {
  %7 = sext i32 %2 to i64
  %8 = tail call i32 @_ZN6Halide7Runtime8Internal8djb_hashEPKhm(i8* %1, i64 %7) #12
  %9 = and i32 %8, 255
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal16memoization_lockE) #11
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
  %30 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m(i8* %29, i8* %1, i64 %7) #12
  br i1 %30, label %31, label %39

; <label>:31:                                     ; preds = %27
  %32 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %19, i64 0, i32 10
  %33 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %32, align 8, !tbaa !168
  %34 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t(%struct.halide_buffer_t* %3, %struct.halide_dimension_t* %33) #12
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
  %50 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t(%struct.halide_buffer_t* %46, %struct.halide_dimension_t* %49) #12
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
  %69 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m(i8* %68, i8* %1, i64 %7) #12
  br i1 %69, label %70, label %138

; <label>:70:                                     ; preds = %66
  %71 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %58, i64 0, i32 10
  %72 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %71, align 8, !tbaa !168
  %73 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t(%struct.halide_buffer_t* %3, %struct.halide_dimension_t* %72) #12
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
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([139 x i8], [139 x i8]* @.str.5.44, i64 0, i64 0)) #11
  tail call void @abort() #11
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
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([141 x i8], [141 x i8]* @.str.6.45, i64 0, i64 0)) #11
  tail call void @abort() #11
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
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([139 x i8], [139 x i8]* @.str.7.46, i64 0, i64 0)) #11
  tail call void @abort() #11
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
  %208 = tail call i8* @halide_malloc(i8* %0, i64 %207) #11
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
  %224 = tail call %"struct.Halide::Runtime::Internal::CacheBlockHeader"* @_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh(i8* %223) #12
  %225 = bitcast %"struct.Halide::Runtime::Internal::CacheBlockHeader"* %224 to i8*
  tail call void @halide_free(i8* %0, i8* %225) #11
  %226 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %220, align 8, !tbaa !7
  %227 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %226, i64 0, i32 2
  store i8* null, i8** %227, align 8, !tbaa !151
  %228 = icmp sgt i64 %218, 1
  br i1 %228, label %217, label %.loopexit

; <label>:229:                                    ; preds = %198
  %230 = getelementptr inbounds i8, i8* %208, i64 64
  store i8* %230, i8** %209, align 8, !tbaa !151
  %231 = tail call %"struct.Halide::Runtime::Internal::CacheBlockHeader"* @_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh(i8* nonnull %230) #12
  %232 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheBlockHeader", %"struct.Halide::Runtime::Internal::CacheBlockHeader"* %231, i64 0, i32 1
  store i32 %8, i32* %232, align 8, !tbaa !173
  %233 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheBlockHeader", %"struct.Halide::Runtime::Internal::CacheBlockHeader"* %231, i64 0, i32 0
  store %"struct.Halide::Runtime::Internal::CacheEntry"* null, %"struct.Halide::Runtime::Internal::CacheEntry"** %233, align 8, !tbaa !175
  %234 = add nuw nsw i64 %146, 1
  %235 = icmp slt i64 %234, %144
  br i1 %235, label %145, label %.loopexit

.loopexit:                                        ; preds = %229, %217, %211, %.loopexit4, %.loopexit2
  %236 = phi i32 [ 0, %.loopexit2 ], [ -1, %211 ], [ 1, %.loopexit4 ], [ -1, %217 ], [ 1, %229 ]
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal16memoization_lockE) #11
  ret i32 %236
}

; Function Attrs: nounwind
define weak i32 @halide_memoization_cache_store(i8*, i8*, i32, %struct.halide_buffer_t*, i32, %struct.halide_buffer_t**) local_unnamed_addr #0 {
  %7 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %5, align 8, !tbaa !7
  %8 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %7, i64 0, i32 2
  %9 = load i8*, i8** %8, align 8, !tbaa !151
  %10 = tail call %"struct.Halide::Runtime::Internal::CacheBlockHeader"* @_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh(i8* %9) #12
  %11 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheBlockHeader", %"struct.Halide::Runtime::Internal::CacheBlockHeader"* %10, i64 0, i32 1
  %12 = load i32, i32* %11, align 8, !tbaa !173
  %13 = and i32 %12, 255
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal16memoization_lockE) #11
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
  %35 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m(i8* %34, i8* %1, i64 %19) #12
  br i1 %35, label %36, label %44

; <label>:36:                                     ; preds = %32
  %37 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %24, i64 0, i32 10
  %38 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %37, align 8, !tbaa !168
  %39 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t(%struct.halide_buffer_t* %3, %struct.halide_dimension_t* %38) #12
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
  %56 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t(%struct.halide_buffer_t* %53, %struct.halide_dimension_t* %55) #12
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
  %83 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m(i8* %82, i8* %1, i64 %19) #12
  br i1 %83, label %84, label %108

; <label>:84:                                     ; preds = %80
  %85 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %72, i64 0, i32 10
  %86 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %85, align 8, !tbaa !168
  %87 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t(%struct.halide_buffer_t* %3, %struct.halide_dimension_t* %86) #12
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
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([135 x i8], [135 x i8]* @.str.9.47, i64 0, i64 0)) #11
  tail call void @abort() #11
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
  %104 = tail call %"struct.Halide::Runtime::Internal::CacheBlockHeader"* @_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh(i8* %103) #12
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
  tail call void @_ZN6Halide7Runtime8Internal11prune_cacheEv() #12
  %118 = tail call i8* @halide_malloc(i8* null, i64 80) #11
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
  %189 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal10CacheEntry4initEPKhmjPK15halide_buffer_tiPPS5_(%"struct.Halide::Runtime::Internal::CacheEntry"* %187, i8* %1, i64 %188, i32 %12, %struct.halide_buffer_t* %3, i32 %4, %struct.halide_buffer_t** %5) #12
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
  %201 = tail call %"struct.Halide::Runtime::Internal::CacheBlockHeader"* @_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh(i8* %200) #12
  %202 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheBlockHeader", %"struct.Halide::Runtime::Internal::CacheBlockHeader"* %201, i64 0, i32 0
  store %"struct.Halide::Runtime::Internal::CacheEntry"* null, %"struct.Halide::Runtime::Internal::CacheEntry"** %202, align 8, !tbaa !175
  %203 = add nuw nsw i64 %196, 1
  %204 = icmp eq i64 %203, %194
  br i1 %204, label %.loopexit1, label %195

; <label>:205:                                    ; preds = %.loopexit1
  tail call void @halide_free(i8* %0, i8* nonnull %118) #11
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
  %234 = tail call %"struct.Halide::Runtime::Internal::CacheBlockHeader"* @_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh(i8* %233) #12
  %235 = bitcast %"struct.Halide::Runtime::Internal::CacheBlockHeader"* %234 to i8**
  store i8* %118, i8** %235, align 8, !tbaa !175
  %236 = add nuw nsw i64 %229, 1
  %237 = icmp eq i64 %236, %227
  br i1 %237, label %.loopexit, label %228

.loopexit:                                        ; preds = %228, %222, %205, %.loopexit1, %98, %.loopexit5
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal16memoization_lockE) #11
  ret i32 0
}

; Function Attrs: nounwind
define weak void @halide_memoization_cache_release(i8*, i8*) local_unnamed_addr #0 {
  %3 = tail call %"struct.Halide::Runtime::Internal::CacheBlockHeader"* @_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh(i8* %1) #12
  %4 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheBlockHeader", %"struct.Halide::Runtime::Internal::CacheBlockHeader"* %3, i64 0, i32 0
  %5 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %4, align 8, !tbaa !175
  %6 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %5, null
  br i1 %6, label %7, label %9

; <label>:7:                                      ; preds = %2
  %8 = bitcast %"struct.Halide::Runtime::Internal::CacheBlockHeader"* %3 to i8*
  tail call void @halide_free(i8* %0, i8* %8) #11
  br label %18

; <label>:9:                                      ; preds = %2
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal16memoization_lockE) #11
  %10 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %5, i64 0, i32 7
  %11 = load i32, i32* %10, align 4, !tbaa !166
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %9
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([136 x i8], [136 x i8]* @.str.12.48, i64 0, i64 0)) #11
  tail call void @abort() #11
  %14 = load i32, i32* %10, align 4, !tbaa !166
  br label %15

; <label>:15:                                     ; preds = %13, %9
  %16 = phi i32 [ %11, %9 ], [ %14, %13 ]
  %17 = add i32 %16, -1
  store i32 %17, i32* %10, align 4, !tbaa !166
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal16memoization_lockE) #11
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
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %6) #9
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
  %14 = call i8* @halide_string_to_string(i8* %0, i8* %1, i8* nonnull %13) #12
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %6) #9
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
  %14 = tail call i8* @halide_uint64_to_string(i8* %13, i8* %1, i64 %12, i32 %3) #12
  ret i8* %14
}

; Function Attrs: nounwind
define weak i8* @halide_double_to_string(i8*, i8*, double, i32) local_unnamed_addr #0 {
  %5 = alloca double, align 8
  %6 = alloca i64, align 8
  %7 = alloca [512 x i8], align 1
  store double %2, double* %5, align 8, !tbaa !131
  %8 = bitcast i64* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %8) #9
  store i64 0, i64* %6, align 8, !tbaa !89
  %9 = bitcast double* %5 to i8*
  %10 = call i8* @memcpy(i8* nonnull %8, i8* nonnull %9, i64 8) #11
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
  %24 = call i8* @halide_string_to_string(i8* %0, i8* %1, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.57, i64 0, i64 0)) #12
  br label %179

; <label>:25:                                     ; preds = %22
  %26 = call i8* @halide_string_to_string(i8* %0, i8* %1, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1.58, i64 0, i64 0)) #12
  br label %179

; <label>:27:                                     ; preds = %19
  br i1 %21, label %28, label %30

; <label>:28:                                     ; preds = %27
  %29 = call i8* @halide_string_to_string(i8* %0, i8* %1, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2.59, i64 0, i64 0)) #12
  br label %179

; <label>:30:                                     ; preds = %27
  %31 = call i8* @halide_string_to_string(i8* %0, i8* %1, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3.60, i64 0, i64 0)) #12
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
  %41 = call i8* @halide_string_to_string(i8* %0, i8* %1, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.4.61, i64 0, i64 0)) #12
  br label %179

; <label>:42:                                     ; preds = %39
  %43 = call i8* @halide_string_to_string(i8* %0, i8* %1, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.5.62, i64 0, i64 0)) #12
  br label %179

; <label>:44:                                     ; preds = %36
  br i1 %38, label %45, label %47

; <label>:45:                                     ; preds = %44
  %46 = call i8* @halide_string_to_string(i8* %0, i8* %1, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.6.63, i64 0, i64 0)) #12
  br label %179

; <label>:47:                                     ; preds = %44
  %48 = call i8* @halide_string_to_string(i8* %0, i8* %1, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.7.64, i64 0, i64 0)) #12
  br label %179

; <label>:49:                                     ; preds = %32
  %50 = icmp eq i32 %17, 0
  br i1 %50, label %54, label %51

; <label>:51:                                     ; preds = %49
  %52 = call i8* @halide_string_to_string(i8* %0, i8* %1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8.65, i64 0, i64 0)) #12
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
  %87 = call i8* @halide_int64_to_string(i8* %56, i8* %1, i64 %84, i32 1) #12
  %88 = call i8* @halide_string_to_string(i8* %87, i8* %1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30.142, i64 0, i64 0)) #12
  %89 = call i8* @halide_int64_to_string(i8* %88, i8* %1, i64 %86, i32 6) #12
  %90 = icmp sgt i32 %80, -1
  br i1 %90, label %91, label %93

; <label>:91:                                     ; preds = %78
  %92 = call i8* @halide_string_to_string(i8* %89, i8* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.10.67, i64 0, i64 0)) #12
  br label %96

; <label>:93:                                     ; preds = %78
  %94 = call i8* @halide_string_to_string(i8* %89, i8* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.11.68, i64 0, i64 0)) #12
  %95 = sub nsw i32 0, %80
  br label %96

; <label>:96:                                     ; preds = %93, %91
  %97 = phi i32 [ %80, %91 ], [ %95, %93 ]
  %98 = phi i8* [ %92, %91 ], [ %94, %93 ]
  %99 = sext i32 %97 to i64
  %100 = call i8* @halide_int64_to_string(i8* %98, i8* %1, i64 %99, i32 2) #12
  br label %179

; <label>:101:                                    ; preds = %54
  br i1 %33, label %102, label %104

; <label>:102:                                    ; preds = %101
  %103 = call i8* @halide_double_to_string(i8* %56, i8* %1, double 0.000000e+00, i32 0) #12
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
  call void @llvm.lifetime.start.p0i8(i64 512, i8* nonnull %142) #9
  %143 = getelementptr inbounds [512 x i8], [512 x i8]* %7, i64 0, i64 512
  %144 = getelementptr inbounds [512 x i8], [512 x i8]* %7, i64 0, i64 480
  %145 = call i8* @halide_int64_to_string(i8* nonnull %144, i8* nonnull %143, i64 %139, i32 1) #12
  %146 = icmp sgt i32 %140, 0
  br i1 %146, label %.preheader21, label %.loopexit

.preheader21:                                     ; preds = %138
  br label %151

.loopexit:                                        ; preds = %175, %138
  %147 = phi i8* [ %144, %138 ], [ %176, %175 ]
  %148 = call i8* @halide_string_to_string(i8* %56, i8* %1, i8* %147) #12
  %149 = call i8* @halide_string_to_string(i8* %148, i8* %1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30.142, i64 0, i64 0)) #12
  %150 = call i8* @halide_int64_to_string(i8* %149, i8* %1, i64 %141, i32 6) #12
  call void @llvm.lifetime.end.p0i8(i64 512, i8* nonnull %142) #9
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
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %8) #9
  ret i8* %180
}

; Function Attrs: nounwind
define weak i8* @halide_pointer_to_string(i8*, i8*, i8*) local_unnamed_addr #0 {
  %4 = alloca [20 x i8], align 1
  %5 = getelementptr inbounds [20 x i8], [20 x i8]* %4, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 20, i8* nonnull %5) #9
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
  %23 = call i8* @halide_string_to_string(i8* %0, i8* %1, i8* nonnull %22) #12
  call void @llvm.lifetime.end.p0i8(i64 20, i8* nonnull %5) #9
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
  %10 = tail call i8* @halide_string_to_string(i8* %0, i8* %1, i8* nonnull %9) #12
  %11 = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %2, i64 0, i32 1
  %12 = load i8, i8* %11, align 1, !tbaa !108
  %13 = zext i8 %12 to i64
  %14 = tail call i8* @halide_uint64_to_string(i8* %10, i8* %1, i64 %13, i32 1) #12
  %15 = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %2, i64 0, i32 2
  %16 = load i16, i16* %15, align 2, !tbaa !177
  %17 = icmp eq i16 %16, 1
  br i1 %17, label %23, label %18

; <label>:18:                                     ; preds = %8
  %19 = tail call i8* @halide_string_to_string(i8* %14, i8* %1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.18.77, i64 0, i64 0)) #12
  %20 = load i16, i16* %15, align 2, !tbaa !177
  %21 = zext i16 %20 to i64
  %22 = tail call i8* @halide_uint64_to_string(i8* %19, i8* %1, i64 %21, i32 1) #12
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
  %6 = tail call i8* @halide_string_to_string(i8* %0, i8* %1, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.78, i64 0, i64 0)) #12
  br label %61

; <label>:7:                                      ; preds = %3
  %8 = tail call i8* @halide_string_to_string(i8* %0, i8* %1, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.20.79, i64 0, i64 0)) #12
  %9 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %2, i64 0, i32 0
  %10 = load i64, i64* %9, align 8, !tbaa !178
  %11 = tail call i8* @halide_uint64_to_string(i8* %8, i8* %1, i64 %10, i32 1) #12
  %12 = tail call i8* @halide_string_to_string(i8* %11, i8* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i64 0, i64 0)) #12
  %13 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %2, i64 0, i32 1
  %14 = bitcast %struct.halide_device_interface_t** %13 to i8**
  %15 = load i8*, i8** %14, align 8, !tbaa !179
  %16 = tail call i8* @halide_pointer_to_string(i8* %12, i8* %1, i8* %15) #12
  %17 = tail call i8* @halide_string_to_string(i8* %16, i8* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i64 0, i64 0)) #12
  %18 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %2, i64 0, i32 2
  %19 = load i8*, i8** %18, align 8, !tbaa !151
  %20 = tail call i8* @halide_pointer_to_string(i8* %17, i8* %1, i8* %19) #12
  %21 = tail call i8* @halide_string_to_string(i8* %20, i8* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i64 0, i64 0)) #12
  %22 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %2, i64 0, i32 3
  %23 = load i64, i64* %22, align 8, !tbaa !180
  %24 = tail call i8* @halide_uint64_to_string(i8* %21, i8* %1, i64 %23, i32 1) #12
  %25 = tail call i8* @halide_string_to_string(i8* %24, i8* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i64 0, i64 0)) #12
  %26 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %2, i64 0, i32 4
  %27 = tail call i8* @halide_type_to_string(i8* %25, i8* %1, %struct.halide_type_t* nonnull %26) #12
  %28 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %2, i64 0, i32 5
  %29 = load i32, i32* %28, align 4, !tbaa !134
  %30 = icmp sgt i32 %29, 0
  br i1 %30, label %31, label %.loopexit

; <label>:31:                                     ; preds = %7
  %32 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %2, i64 0, i32 6
  br label %35

.loopexit:                                        ; preds = %35, %7
  %33 = phi i8* [ %27, %7 ], [ %56, %35 ]
  %34 = tail call i8* @halide_string_to_string(i8* %33, i8* %1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5.169, i64 0, i64 0)) #12
  br label %61

; <label>:35:                                     ; preds = %35, %31
  %36 = phi i64 [ 0, %31 ], [ %57, %35 ]
  %37 = phi i8* [ %27, %31 ], [ %56, %35 ]
  %38 = tail call i8* @halide_string_to_string(i8* %37, i8* %1, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.22.82, i64 0, i64 0)) #12
  %39 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %32, align 8, !tbaa !136
  %40 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %39, i64 %36, i32 0
  %41 = load i32, i32* %40, align 4, !tbaa !140
  %42 = sext i32 %41 to i64
  %43 = tail call i8* @halide_int64_to_string(i8* %38, i8* %1, i64 %42, i32 1) #12
  %44 = tail call i8* @halide_string_to_string(i8* %43, i8* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i64 0, i64 0)) #12
  %45 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %32, align 8, !tbaa !136
  %46 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %45, i64 %36, i32 1
  %47 = load i32, i32* %46, align 4, !tbaa !138
  %48 = sext i32 %47 to i64
  %49 = tail call i8* @halide_int64_to_string(i8* %44, i8* %1, i64 %48, i32 1) #12
  %50 = tail call i8* @halide_string_to_string(i8* %49, i8* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i64 0, i64 0)) #12
  %51 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %32, align 8, !tbaa !136
  %52 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %51, i64 %36, i32 2
  %53 = load i32, i32* %52, align 4, !tbaa !141
  %54 = sext i32 %53 to i64
  %55 = tail call i8* @halide_int64_to_string(i8* %50, i8* %1, i64 %54, i32 1) #12
  %56 = tail call i8* @halide_string_to_string(i8* %55, i8* %1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.23.83, i64 0, i64 0)) #12
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
  %19 = tail call i32 %18(i8* %0, %struct.halide_buffer_t* nonnull %1) #11
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %21, label %24

; <label>:21:                                     ; preds = %14
  %22 = load i64, i64* %3, align 8, !tbaa !180
  %23 = and i64 %22, -3
  store i64 %23, i64* %3, align 8, !tbaa !180
  tail call void @halide_msan_annotate_buffer_is_initialized(i8* %0, %struct.halide_buffer_t* nonnull %1) #11
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
  %7 = tail call i32 %6(i8* %0) #11
  ret void
}

; Function Attrs: nounwind
define weak i32 @halide_copy_to_host(i8*, %struct.halide_buffer_t*) local_unnamed_addr #0 {
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #11
  %3 = icmp eq %struct.halide_buffer_t* %1, null
  br i1 %3, label %4, label %6

; <label>:4:                                      ; preds = %2
  %5 = tail call i32 @halide_error_buffer_is_null(i8* %0, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.9.88, i64 0, i64 0)) #11
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
  %16 = tail call i32 @halide_error_no_device_interface(i8* %0) #11
  br label %29

; <label>:17:                                     ; preds = %6
  %18 = xor i1 %9, true
  %19 = or i1 %12, %18
  br i1 %19, label %22, label %20

; <label>:20:                                     ; preds = %17
  %21 = tail call i32 @halide_error_device_interface_no_device(i8* %0) #11
  br label %29

; <label>:22:                                     ; preds = %17
  %23 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %24 = load i64, i64* %23, align 8, !tbaa !180
  %25 = and i64 %24, 3
  %26 = icmp eq i64 %25, 3
  br i1 %26, label %27, label %.predBB1.split

; <label>:27:                                     ; preds = %22
  %28 = tail call i32 @halide_error_host_and_device_dirty(i8* %0) #11
  br label %29

; <label>:29:                                     ; preds = %27, %20, %15, %4
  %30 = phi i32 [ %5, %4 ], [ %21, %20 ], [ %16, %15 ], [ %28, %27 ]
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %.predBB2.split, label %34

.predBB1.split:                                   ; preds = %22
  %32 = tail call i32 @_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t(i8* %0, %struct.halide_buffer_t* nonnull %1) #12
  br label %34

.predBB2.split:                                   ; preds = %29
  %33 = tail call i32 @_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t(i8* %0, %struct.halide_buffer_t* %1) #12
  br label %34

; <label>:34:                                     ; preds = %.predBB2.split, %.predBB1.split, %29
  %35 = phi i32 [ %30, %29 ], [ %32, %.predBB1.split ], [ %33, %.predBB2.split ]
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #11
  ret i32 %35
}

; Function Attrs: nounwind
define linkonce i32 @copy_to_device_already_locked(i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*) local_unnamed_addr #0 {
  %4 = icmp eq %struct.halide_buffer_t* %1, null
  br i1 %4, label %5, label %7

; <label>:5:                                      ; preds = %3
  %6 = tail call i32 @halide_error_buffer_is_null(i8* %0, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.10.89, i64 0, i64 0)) #11
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
  %17 = tail call i32 @halide_error_no_device_interface(i8* %0) #11
  br label %30

; <label>:18:                                     ; preds = %7
  %19 = xor i1 %10, true
  %20 = or i1 %13, %19
  br i1 %20, label %23, label %21

; <label>:21:                                     ; preds = %18
  %22 = tail call i32 @halide_error_device_interface_no_device(i8* %0) #11
  br label %30

; <label>:23:                                     ; preds = %18
  %24 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %25 = load i64, i64* %24, align 8, !tbaa !180
  %26 = and i64 %25, 3
  %27 = icmp eq i64 %26, 3
  br i1 %27, label %28, label %33

; <label>:28:                                     ; preds = %23
  %29 = tail call i32 @halide_error_host_and_device_dirty(i8* %0) #11
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
  %40 = tail call i32 @halide_error_no_device_interface(i8* %0) #11
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
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([61 x i8], [61 x i8]* @.str.12.90, i64 0, i64 0)) #11
  br label %72

; <label>:51:                                     ; preds = %41
  %52 = tail call i32 @halide_device_malloc(i8* %0, %struct.halide_buffer_t* nonnull %1, %struct.halide_device_interface_t* nonnull %42) #12
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
  %67 = tail call i32 %66(i8* %0, %struct.halide_buffer_t* nonnull %1) #11
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
  %6 = tail call i32 @halide_error_buffer_is_null(i8* %0, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.18.91, i64 0, i64 0)) #11
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
  %17 = tail call i32 @halide_error_no_device_interface(i8* %0) #11
  br label %30

; <label>:18:                                     ; preds = %7
  %19 = xor i1 %10, true
  %20 = or i1 %13, %19
  br i1 %20, label %23, label %21

; <label>:21:                                     ; preds = %18
  %22 = tail call i32 @halide_error_device_interface_no_device(i8* %0) #11
  br label %30

; <label>:23:                                     ; preds = %18
  %24 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %25 = load i64, i64* %24, align 8, !tbaa !180
  %26 = and i64 %25, 3
  %27 = icmp eq i64 %26, 3
  br i1 %27, label %28, label %36

; <label>:28:                                     ; preds = %23
  %29 = tail call i32 @halide_error_host_and_device_dirty(i8* %0) #11
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
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.20.92, i64 0, i64 0)) #11
  br label %56

; <label>:42:                                     ; preds = %36
  %43 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %2, i64 0, i32 15
  %44 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %43, align 8, !tbaa !181
  %45 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %44, i64 0, i32 0
  %46 = load void ()*, void ()** %45, align 8, !tbaa !187
  tail call void %46() #11
  %47 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %43, align 8, !tbaa !181
  %48 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %47, i64 0, i32 2
  %49 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %48, align 8, !tbaa !188
  %50 = tail call i32 %49(i8* %0, %struct.halide_buffer_t* nonnull %1) #11
  %51 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %43, align 8, !tbaa !181
  %52 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %51, i64 0, i32 1
  %53 = load void ()*, void ()** %52, align 8, !tbaa !189
  tail call void %53() #11
  %54 = icmp eq i32 %50, 0
  %55 = select i1 %54, i32 0, i32 -16
  br label %56

; <label>:56:                                     ; preds = %42, %41, %30
  %57 = phi i32 [ %31, %30 ], [ -42, %41 ], [ %55, %42 ]
  ret i32 %57
}

; Function Attrs: nounwind
define weak i32 @halide_copy_to_device(i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*) local_unnamed_addr #0 {
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #11
  %4 = tail call i32 @copy_to_device_already_locked(i8* %0, %struct.halide_buffer_t* %1, %struct.halide_device_interface_t* %2) #12
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #11
  ret i32 %4
}

; Function Attrs: nounwind
define weak i32 @halide_device_sync(i8*, %struct.halide_buffer_t*) local_unnamed_addr #0 {
  %3 = icmp eq %struct.halide_buffer_t* %1, null
  br i1 %3, label %4, label %6

; <label>:4:                                      ; preds = %2
  %5 = tail call i32 @halide_error_buffer_is_null(i8* %0, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.17.93, i64 0, i64 0)) #11
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
  %16 = tail call i32 @halide_error_no_device_interface(i8* %0) #11
  br label %29

; <label>:17:                                     ; preds = %6
  %18 = xor i1 %9, true
  %19 = or i1 %12, %18
  br i1 %19, label %22, label %20

; <label>:20:                                     ; preds = %17
  %21 = tail call i32 @halide_error_device_interface_no_device(i8* %0) #11
  br label %29

; <label>:22:                                     ; preds = %17
  %23 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %24 = load i64, i64* %23, align 8, !tbaa !180
  %25 = and i64 %24, 3
  %26 = icmp eq i64 %25, 3
  br i1 %26, label %27, label %35

; <label>:27:                                     ; preds = %22
  %28 = tail call i32 @halide_error_host_and_device_dirty(i8* %0) #11
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
  %39 = tail call i32 @halide_error_no_device_interface(i8* %0) #11
  br label %48

; <label>:40:                                     ; preds = %35
  %41 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %36, i64 0, i32 15
  %42 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %41, align 8, !tbaa !181
  %43 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %42, i64 0, i32 4
  %44 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %43, align 8, !tbaa !190
  %45 = tail call i32 %44(i8* %0, %struct.halide_buffer_t* nonnull %1) #11
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
  %5 = tail call i32 @halide_error_buffer_is_null(i8* %0, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.21.96, i64 0, i64 0)) #11
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
  %16 = tail call i32 @halide_error_no_device_interface(i8* %0) #11
  br label %29

; <label>:17:                                     ; preds = %6
  %18 = xor i1 %9, true
  %19 = or i1 %12, %18
  br i1 %19, label %22, label %20

; <label>:20:                                     ; preds = %17
  %21 = tail call i32 @halide_error_device_interface_no_device(i8* %0) #11
  br label %29

; <label>:22:                                     ; preds = %17
  %23 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %24 = load i64, i64* %23, align 8, !tbaa !180
  %25 = and i64 %24, 3
  %26 = icmp eq i64 %25, 3
  br i1 %26, label %27, label %35

; <label>:27:                                     ; preds = %22
  %28 = tail call i32 @halide_error_host_and_device_dirty(i8* %0) #11
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
  tail call void %42() #11
  %43 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %39, align 8, !tbaa !181
  %44 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %43, i64 0, i32 3
  %45 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %44, align 8, !tbaa !191
  %46 = tail call i32 %45(i8* %0, %struct.halide_buffer_t* nonnull %1) #11
  %47 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %39, align 8, !tbaa !181
  %48 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %47, i64 0, i32 1
  %49 = load void ()*, void ()** %48, align 8, !tbaa !189
  tail call void %49() #11
  %50 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %51 = load i64, i64* %50, align 8, !tbaa !178
  %52 = icmp eq i64 %51, 0
  br i1 %52, label %54, label %53

; <label>:53:                                     ; preds = %38
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([140 x i8], [140 x i8]* @.str.22.97, i64 0, i64 0)) #11
  tail call void @abort() #11
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
  %4 = tail call i32 @halide_device_free(i8* %0, %struct.halide_buffer_t* %3) #12
  ret void
}

; Function Attrs: nounwind
define weak i32 @halide_device_and_host_malloc(i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*) local_unnamed_addr #0 {
  %4 = icmp eq %struct.halide_buffer_t* %1, null
  br i1 %4, label %5, label %7

; <label>:5:                                      ; preds = %3
  %6 = tail call i32 @halide_error_buffer_is_null(i8* %0, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.23.98, i64 0, i64 0)) #11
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
  %17 = tail call i32 @halide_error_no_device_interface(i8* %0) #11
  br label %30

; <label>:18:                                     ; preds = %7
  %19 = xor i1 %10, true
  %20 = or i1 %13, %19
  br i1 %20, label %23, label %21

; <label>:21:                                     ; preds = %18
  %22 = tail call i32 @halide_error_device_interface_no_device(i8* %0) #11
  br label %30

; <label>:23:                                     ; preds = %18
  %24 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %25 = load i64, i64* %24, align 8, !tbaa !180
  %26 = and i64 %25, 3
  %27 = icmp eq i64 %26, 3
  br i1 %27, label %28, label %36

; <label>:28:                                     ; preds = %23
  %29 = tail call i32 @halide_error_host_and_device_dirty(i8* %0) #11
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
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.25.99, i64 0, i64 0)) #11
  br label %56

; <label>:42:                                     ; preds = %36
  %43 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %2, i64 0, i32 15
  %44 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %43, align 8, !tbaa !181
  %45 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %44, i64 0, i32 0
  %46 = load void ()*, void ()** %45, align 8, !tbaa !187
  tail call void %46() #11
  %47 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %43, align 8, !tbaa !181
  %48 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %47, i64 0, i32 8
  %49 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %48, align 8, !tbaa !192
  %50 = tail call i32 %49(i8* %0, %struct.halide_buffer_t* nonnull %1) #11
  %51 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %43, align 8, !tbaa !181
  %52 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %51, i64 0, i32 1
  %53 = load void ()*, void ()** %52, align 8, !tbaa !189
  tail call void %53() #11
  %54 = icmp eq i32 %50, 0
  br i1 %54, label %56, label %55

; <label>:55:                                     ; preds = %42
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.26.100, i64 0, i64 0)) #11
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
  %5 = tail call i32 @halide_error_buffer_is_null(i8* %0, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.27.101, i64 0, i64 0)) #11
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
  %16 = tail call i32 @halide_error_no_device_interface(i8* %0) #11
  br label %29

; <label>:17:                                     ; preds = %6
  %18 = xor i1 %9, true
  %19 = or i1 %12, %18
  br i1 %19, label %22, label %20

; <label>:20:                                     ; preds = %17
  %21 = tail call i32 @halide_error_device_interface_no_device(i8* %0) #11
  br label %29

; <label>:22:                                     ; preds = %17
  %23 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %24 = load i64, i64* %23, align 8, !tbaa !180
  %25 = and i64 %24, 3
  %26 = icmp eq i64 %25, 3
  br i1 %26, label %27, label %35

; <label>:27:                                     ; preds = %22
  %28 = tail call i32 @halide_error_host_and_device_dirty(i8* %0) #11
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
  tail call void %42() #11
  %43 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %39, align 8, !tbaa !181
  %44 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %43, i64 0, i32 9
  %45 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %44, align 8, !tbaa !193
  %46 = tail call i32 %45(i8* %0, %struct.halide_buffer_t* nonnull %1) #11
  %47 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %39, align 8, !tbaa !181
  %48 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %47, i64 0, i32 1
  %49 = load void ()*, void ()** %48, align 8, !tbaa !189
  tail call void %49() #11
  %50 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %51 = load i64, i64* %50, align 8, !tbaa !178
  %52 = icmp eq i64 %51, 0
  br i1 %52, label %54, label %53

; <label>:53:                                     ; preds = %38
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([140 x i8], [140 x i8]* @.str.28.102, i64 0, i64 0)) #11
  tail call void @abort() #11
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
  tail call void @halide_free(i8* %0, i8* nonnull %59) #11
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
  %6 = tail call i32 @halide_error_buffer_is_null(i8* %0, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.29.103, i64 0, i64 0)) #11
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
  %17 = tail call i32 @halide_error_no_device_interface(i8* %0) #11
  br label %30

; <label>:18:                                     ; preds = %7
  %19 = xor i1 %10, true
  %20 = or i1 %13, %19
  br i1 %20, label %23, label %21

; <label>:21:                                     ; preds = %18
  %22 = tail call i32 @halide_error_device_interface_no_device(i8* %0) #11
  br label %30

; <label>:23:                                     ; preds = %18
  %24 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %25 = load i64, i64* %24, align 8, !tbaa !180
  %26 = and i64 %25, 3
  %27 = icmp eq i64 %26, 3
  br i1 %27, label %28, label %33

; <label>:28:                                     ; preds = %23
  %29 = tail call i32 @halide_error_host_and_device_dirty(i8* %0) #11
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
  %92 = tail call i8* @halide_malloc(i8* %0, i64 %91) #11
  %93 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 2
  store i8* %92, i8** %93, align 8, !tbaa !151
  %94 = icmp eq i8* %92, null
  br i1 %94, label %100, label %95

; <label>:95:                                     ; preds = %83
  %96 = tail call i32 @halide_device_malloc(i8* %0, %struct.halide_buffer_t* nonnull %1, %struct.halide_device_interface_t* %2) #12
  %97 = icmp eq i32 %96, 0
  br i1 %97, label %100, label %98

; <label>:98:                                     ; preds = %95
  %99 = load i8*, i8** %93, align 8, !tbaa !151
  tail call void @halide_free(i8* %0, i8* %99) #11
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
  %6 = tail call i32 @halide_error_buffer_is_null(i8* %0, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.30.104, i64 0, i64 0)) #11
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
  %17 = tail call i32 @halide_error_no_device_interface(i8* %0) #11
  br label %30

; <label>:18:                                     ; preds = %7
  %19 = xor i1 %10, true
  %20 = or i1 %13, %19
  br i1 %20, label %23, label %21

; <label>:21:                                     ; preds = %18
  %22 = tail call i32 @halide_error_device_interface_no_device(i8* %0) #11
  br label %30

; <label>:23:                                     ; preds = %18
  %24 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %25 = load i64, i64* %24, align 8, !tbaa !180
  %26 = and i64 %25, 3
  %27 = icmp eq i64 %26, 3
  br i1 %27, label %28, label %.predBB1.split

; <label>:28:                                     ; preds = %23
  %29 = tail call i32 @halide_error_host_and_device_dirty(i8* %0) #11
  br label %30

; <label>:30:                                     ; preds = %28, %21, %16, %5
  %31 = phi i32 [ %6, %5 ], [ %22, %21 ], [ %17, %16 ], [ %29, %28 ]
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %.predBB2.split, label %44

.predBB1.split:                                   ; preds = %23
  %33 = tail call i32 @halide_device_free(i8* %0, %struct.halide_buffer_t* nonnull %1) #12
  br label %35

.predBB2.split:                                   ; preds = %30
  %34 = tail call i32 @halide_device_free(i8* %0, %struct.halide_buffer_t* %1) #12
  br label %35

; <label>:35:                                     ; preds = %.predBB2.split, %.predBB1.split
  %phi.call = phi i32 [ %33, %.predBB1.split ], [ %34, %.predBB2.split ]
  %36 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 2
  %37 = load i8*, i8** %36, align 8, !tbaa !151
  %38 = icmp eq i8* %37, null
  br i1 %38, label %40, label %39

; <label>:39:                                     ; preds = %35
  tail call void @halide_free(i8* %0, i8* nonnull %37) #11
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
  %7 = tail call i32 @halide_error_buffer_is_null(i8* %0, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.31.105, i64 0, i64 0)) #11
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
  %18 = tail call i32 @halide_error_no_device_interface(i8* %0) #11
  br label %31

; <label>:19:                                     ; preds = %8
  %20 = xor i1 %11, true
  %21 = or i1 %14, %20
  br i1 %21, label %24, label %22

; <label>:22:                                     ; preds = %19
  %23 = tail call i32 @halide_error_device_interface_no_device(i8* %0) #11
  br label %31

; <label>:24:                                     ; preds = %19
  %25 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %26 = load i64, i64* %25, align 8, !tbaa !180
  %27 = and i64 %26, 3
  %28 = icmp eq i64 %27, 3
  br i1 %28, label %29, label %37

; <label>:29:                                     ; preds = %24
  %30 = tail call i32 @halide_error_host_and_device_dirty(i8* %0) #11
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
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.32.106, i64 0, i64 0)) #11
  br label %58

; <label>:44:                                     ; preds = %37
  %45 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %3, i64 0, i32 15
  %46 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %45, align 8, !tbaa !181
  %47 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %46, i64 0, i32 0
  %48 = load void ()*, void ()** %47, align 8, !tbaa !187
  tail call void %48() #11
  store %struct.halide_device_interface_t* %3, %struct.halide_device_interface_t** %38, align 8, !tbaa !179
  %49 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %45, align 8, !tbaa !181
  %50 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %49, i64 0, i32 14
  %51 = load i32 (i8*, %struct.halide_buffer_t*, i64)*, i32 (i8*, %struct.halide_buffer_t*, i64)** %50, align 8, !tbaa !194
  %52 = tail call i32 %51(i8* %0, %struct.halide_buffer_t* nonnull %1, i64 %2) #11
  %53 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %45, align 8, !tbaa !181
  %54 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %53, i64 0, i32 1
  %55 = load void ()*, void ()** %54, align 8, !tbaa !189
  tail call void %55() #11
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
  %5 = tail call i32 @halide_error_buffer_is_null(i8* %0, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.33.107, i64 0, i64 0)) #11
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
  %16 = tail call i32 @halide_error_no_device_interface(i8* %0) #11
  br label %29

; <label>:17:                                     ; preds = %6
  %18 = xor i1 %9, true
  %19 = or i1 %12, %18
  br i1 %19, label %22, label %20

; <label>:20:                                     ; preds = %17
  %21 = tail call i32 @halide_error_device_interface_no_device(i8* %0) #11
  br label %29

; <label>:22:                                     ; preds = %17
  %23 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %24 = load i64, i64* %23, align 8, !tbaa !180
  %25 = and i64 %24, 3
  %26 = icmp eq i64 %25, 3
  br i1 %26, label %27, label %35

; <label>:27:                                     ; preds = %22
  %28 = tail call i32 @halide_error_host_and_device_dirty(i8* %0) #11
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
  tail call void %42() #11
  %43 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %39, align 8, !tbaa !181
  %44 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %43, i64 0, i32 15
  %45 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %44, align 8, !tbaa !195
  %46 = tail call i32 %45(i8* %0, %struct.halide_buffer_t* nonnull %1) #11
  %47 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %39, align 8, !tbaa !181
  %48 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %47, i64 0, i32 1
  %49 = load void ()*, void ()** %48, align 8, !tbaa !189
  tail call void %49() #11
  %50 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %51 = load i64, i64* %50, align 8, !tbaa !178
  %52 = icmp eq i64 %51, 0
  br i1 %52, label %54, label %53

; <label>:53:                                     ; preds = %38
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([140 x i8], [140 x i8]* @.str.34.108, i64 0, i64 0)) #11
  tail call void @abort() #11
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
  %6 = tail call i32 @halide_error_buffer_is_null(i8* %0, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.35.109, i64 0, i64 0)) #11
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
  %17 = tail call i32 @halide_error_no_device_interface(i8* %0) #11
  br label %30

; <label>:18:                                     ; preds = %7
  %19 = xor i1 %10, true
  %20 = or i1 %13, %19
  br i1 %20, label %23, label %21

; <label>:21:                                     ; preds = %18
  %22 = tail call i32 @halide_error_device_interface_no_device(i8* %0) #11
  br label %30

; <label>:23:                                     ; preds = %18
  %24 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %25 = load i64, i64* %24, align 8, !tbaa !180
  %26 = and i64 %25, 3
  %27 = icmp eq i64 %26, 3
  br i1 %27, label %28, label %37

; <label>:28:                                     ; preds = %23
  %29 = tail call i32 @halide_error_host_and_device_dirty(i8* %0) #11
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
  tail call void %43() #11
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
  %5 = tail call i32 @halide_error_buffer_is_null(i8* %0, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.36, i64 0, i64 0)) #11
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
  %16 = tail call i32 @halide_error_no_device_interface(i8* %0) #11
  br label %29

; <label>:17:                                     ; preds = %6
  %18 = xor i1 %9, true
  %19 = or i1 %12, %18
  br i1 %19, label %22, label %20

; <label>:20:                                     ; preds = %17
  %21 = tail call i32 @halide_error_device_interface_no_device(i8* %0) #11
  br label %29

; <label>:22:                                     ; preds = %17
  %23 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %24 = load i64, i64* %23, align 8, !tbaa !180
  %25 = and i64 %24, 3
  %26 = icmp eq i64 %25, 3
  br i1 %26, label %27, label %35

; <label>:27:                                     ; preds = %22
  %28 = tail call i32 @halide_error_host_and_device_dirty(i8* %0) #11
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
  tail call void %45() #11
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
  %4 = tail call i32 @halide_device_and_host_free(i8* %0, %struct.halide_buffer_t* %3) #12
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
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.42, i64 0, i64 0)) #11
  br label %130

; <label>:14:                                     ; preds = %7
  %15 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 0
  %16 = load i64, i64* %15, align 8, !tbaa !178
  %17 = icmp eq i64 %16, 0
  br i1 %17, label %18, label %21

; <label>:18:                                     ; preds = %14
  %19 = tail call i32 @halide_device_malloc(i8* %0, %struct.halide_buffer_t* nonnull %3, %struct.halide_device_interface_t* nonnull %2) #12
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
  %68 = tail call i32 %67(i8* %0, %struct.halide_buffer_t* nonnull %1, %struct.halide_device_interface_t* nonnull %2, %struct.halide_buffer_t* nonnull %3) #11
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
  call void @llvm.lifetime.start.p0i8(i64 416, i8* nonnull %75) #9
  call void @_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b(%"struct.Halide::Runtime::Internal::device_copy"* nonnull sret %5, %struct.halide_buffer_t* nonnull %1, i1 zeroext true, %struct.halide_buffer_t* nonnull %3, i1 zeroext true) #12
  call void @_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv(%"struct.Halide::Runtime::Internal::device_copy"* nonnull dereferenceable(416) %5, i8* %0) #12
  call void @llvm.lifetime.end.p0i8(i64 416, i8* nonnull %75) #9
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
  %84 = tail call i32 %83(i8* %0, %struct.halide_buffer_t* nonnull %1, %struct.halide_device_interface_t* null, %struct.halide_buffer_t* nonnull %3) #11
  %85 = icmp eq i32 %84, -42
  br i1 %85, label %86, label %117

; <label>:86:                                     ; preds = %77
  %87 = tail call i32 @_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t(i8* %0, %struct.halide_buffer_t* nonnull %1) #12
  %88 = icmp eq i32 %87, 0
  br i1 %88, label %89, label %130

; <label>:89:                                     ; preds = %86
  %90 = tail call i32 @halide_buffer_copy_already_locked(i8* %0, %struct.halide_buffer_t* nonnull %1, %struct.halide_device_interface_t* null, %struct.halide_buffer_t* nonnull %3) #12
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
  %101 = tail call i32 %100(i8* %0, %struct.halide_buffer_t* nonnull %1, %struct.halide_device_interface_t* null, %struct.halide_buffer_t* nonnull %3) #11
  %102 = icmp eq i32 %101, 0
  br i1 %102, label %103, label %130

; <label>:103:                                    ; preds = %94
  %104 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 3
  %105 = load i64, i64* %104, align 8, !tbaa !180
  %106 = or i64 %105, 1
  store i64 %106, i64* %104, align 8, !tbaa !180
  %107 = tail call i32 @copy_to_device_already_locked(i8* %0, %struct.halide_buffer_t* nonnull %3, %struct.halide_device_interface_t* nonnull %2) #12
  br label %117

; <label>:108:                                    ; preds = %91
  %109 = tail call i32 @_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t(i8* %0, %struct.halide_buffer_t* nonnull %1) #12
  %110 = icmp eq i32 %109, 0
  br i1 %110, label %111, label %130

; <label>:111:                                    ; preds = %108
  %112 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %2, i64 0, i32 15
  %113 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %112, align 8, !tbaa !181
  %114 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %113, i64 0, i32 10
  %115 = load i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)** %114, align 8, !tbaa !196
  %116 = tail call i32 %115(i8* %0, %struct.halide_buffer_t* nonnull %1, %struct.halide_device_interface_t* nonnull %2, %struct.halide_buffer_t* nonnull %3) #11
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
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #11
  %5 = icmp ne %struct.halide_device_interface_t* %2, null
  br i1 %5, label %6, label %11

; <label>:6:                                      ; preds = %4
  %7 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %2, i64 0, i32 15
  %8 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %7, align 8, !tbaa !181
  %9 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %8, i64 0, i32 0
  %10 = load void ()*, void ()** %9, align 8, !tbaa !187
  tail call void %10() #11
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
  tail call void %19() #11
  br label %20

; <label>:20:                                     ; preds = %15, %11
  %21 = tail call i32 @halide_buffer_copy_already_locked(i8* %0, %struct.halide_buffer_t* nonnull %1, %struct.halide_device_interface_t* %2, %struct.halide_buffer_t* %3) #12
  br i1 %5, label %22, label %27

; <label>:22:                                     ; preds = %20
  %23 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %2, i64 0, i32 15
  %24 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %23, align 8, !tbaa !181
  %25 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %24, i64 0, i32 1
  %26 = load void ()*, void ()** %25, align 8, !tbaa !189
  tail call void %26() #11
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
  tail call void %34() #11
  br label %35

; <label>:35:                                     ; preds = %30, %27
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #11
  ret i32 %21
}

; Function Attrs: nounwind
define weak i32 @halide_default_device_crop(i8*, %struct.halide_buffer_t*, %struct.halide_buffer_t*) local_unnamed_addr #0 {
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.58, i64 0, i64 0)) #11
  ret i32 -40
}

; Function Attrs: nounwind
define weak i32 @halide_default_device_slice(i8*, %struct.halide_buffer_t*, i32, i32, %struct.halide_buffer_t*) local_unnamed_addr #0 {
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.59, i64 0, i64 0)) #11
  ret i32 -40
}

; Function Attrs: nounwind
define weak i32 @halide_device_crop(i8*, %struct.halide_buffer_t*, %struct.halide_buffer_t*) local_unnamed_addr #0 {
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #11
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
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.60, i64 0, i64 0)) #11
  br label %32

; <label>:12:                                     ; preds = %7
  %13 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 5
  %14 = load i32, i32* %13, align 4, !tbaa !134
  %15 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %2, i64 0, i32 5
  %16 = load i32, i32* %15, align 4, !tbaa !134
  %17 = icmp eq i32 %14, %16
  br i1 %17, label %19, label %18

; <label>:18:                                     ; preds = %12
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.61, i64 0, i64 0)) #11
  br label %32

; <label>:19:                                     ; preds = %12
  %20 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %21 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %20, align 8, !tbaa !179
  %22 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %21, i64 0, i32 15
  %23 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %22, align 8, !tbaa !181
  %24 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %23, i64 0, i32 0
  %25 = load void ()*, void ()** %24, align 8, !tbaa !187
  tail call void %25() #11
  %26 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %20, align 8, !tbaa !179
  %27 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %26, i64 0, i32 15
  %28 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %27, align 8, !tbaa !181
  %29 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %28, i64 0, i32 11
  %30 = load i32 (i8*, %struct.halide_buffer_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_buffer_t*)** %29, align 8, !tbaa !197
  %31 = tail call i32 %30(i8* %0, %struct.halide_buffer_t* nonnull %1, %struct.halide_buffer_t* nonnull %2) #11
  br label %32

; <label>:32:                                     ; preds = %19, %18, %11, %3
  %33 = phi i32 [ -41, %11 ], [ -41, %18 ], [ %31, %19 ], [ 0, %3 ]
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #11
  ret i32 %33
}

; Function Attrs: nounwind
define weak i32 @halide_device_slice(i8*, %struct.halide_buffer_t*, i32, i32, %struct.halide_buffer_t*) local_unnamed_addr #0 {
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #11
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
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.60, i64 0, i64 0)) #11
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
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.64, i64 0, i64 0)) #11
  br label %35

; <label>:22:                                     ; preds = %14
  %23 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %24 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %23, align 8, !tbaa !179
  %25 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %24, i64 0, i32 15
  %26 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %25, align 8, !tbaa !181
  %27 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %26, i64 0, i32 0
  %28 = load void ()*, void ()** %27, align 8, !tbaa !187
  tail call void %28() #11
  %29 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %23, align 8, !tbaa !179
  %30 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %29, i64 0, i32 15
  %31 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %30, align 8, !tbaa !181
  %32 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %31, i64 0, i32 12
  %33 = load i32 (i8*, %struct.halide_buffer_t*, i32, i32, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, i32, i32, %struct.halide_buffer_t*)** %32, align 8, !tbaa !198
  %34 = tail call i32 %33(i8* %0, %struct.halide_buffer_t* nonnull %1, i32 %2, i32 %3, %struct.halide_buffer_t* nonnull %4) #11
  br label %35

; <label>:35:                                     ; preds = %22, %21, %13, %5
  %36 = phi i32 [ -41, %13 ], [ -41, %21 ], [ %34, %22 ], [ 0, %5 ]
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #11
  ret i32 %36
}

; Function Attrs: nounwind
define weak i32 @halide_default_device_release_crop(i8*, %struct.halide_buffer_t*) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %4 = load i64, i64* %3, align 8, !tbaa !178
  %5 = icmp eq i64 %4, 0
  br i1 %5, label %7, label %6

; <label>:6:                                      ; preds = %2
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.58, i64 0, i64 0)) #11
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
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #11
  %7 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %8 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %7, align 8, !tbaa !179
  %9 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %8, i64 0, i32 15
  %10 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %9, align 8, !tbaa !181
  %11 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %10, i64 0, i32 13
  %12 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %11, align 8, !tbaa !199
  %13 = tail call i32 %12(i8* %0, %struct.halide_buffer_t* nonnull %1) #11
  store i64 0, i64* %3, align 8, !tbaa !178
  %14 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %9, align 8, !tbaa !181
  %15 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %14, i64 0, i32 1
  %16 = load void ()*, void ()** %15, align 8, !tbaa !189
  tail call void %16() #11
  store %struct.halide_device_interface_t* null, %struct.halide_device_interface_t** %7, align 8, !tbaa !179
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #11
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
  %2 = tail call float @halide_float16_bits_to_float(i16 zeroext %0) #12
  %3 = fpext float %2 to double
  ret double %3
}

; Function Attrs: nounwind
define weak i32 @halide_error_bounds_inference_call_failed(i8*, i8*, i32) local_unnamed_addr #0 {
  %4 = tail call i8* @halide_malloc(i8* %0, i64 1024) #11
  %5 = ptrtoint i8* %4 to i64
  %6 = icmp eq i8* %4, null
  br i1 %6, label %.predBB1.split, label %.predBB2.split

.predBB2.split:                                   ; preds = %3
  %7 = getelementptr inbounds i8, i8* %4, i64 1023
  store i8 0, i8* %7, align 1, !tbaa !11
  %8 = tail call i8* @halide_string_to_string(i8* nonnull %4, i8* nonnull %7, i8* nonnull getelementptr inbounds ([41 x i8], [41 x i8]* @.str.112, i64 0, i64 0)) #11
  br label %10

.predBB1.split:                                   ; preds = %3
  %9 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([41 x i8], [41 x i8]* @.str.112, i64 0, i64 0)) #11
  br label %10

; <label>:10:                                     ; preds = %.predBB1.split, %.predBB2.split
  %11 = phi i8* [ null, %.predBB1.split ], [ %7, %.predBB2.split ]
  %phi.call = phi i8* [ %9, %.predBB1.split ], [ %8, %.predBB2.split ]
  %12 = icmp eq i8* %1, null
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %10
  %14 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #11
  br label %17

; <label>:15:                                     ; preds = %10
  %16 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* nonnull %1) #11
  br label %17

; <label>:17:                                     ; preds = %15, %13
  %18 = phi i8* [ %16, %15 ], [ %14, %13 ]
  %19 = tail call i8* @halide_string_to_string(i8* %18, i8* %11, i8* nonnull getelementptr inbounds ([27 x i8], [27 x i8]* @.str.1.113, i64 0, i64 0)) #11
  %20 = sext i32 %2 to i64
  %21 = tail call i8* @halide_int64_to_string(i8* %19, i8* %11, i64 %20, i32 1) #11
  br i1 %6, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %17
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #11
  tail call void @halide_free(i8* %0, i8* null) #11
  br label %25

.predBB2.split2:                                  ; preds = %17
  %22 = ptrtoint i8* %21 to i64
  %23 = sub i64 1, %5
  %24 = add i64 %23, %22
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %4, i64 %24) #11
  tail call void @halide_error(i8* %0, i8* nonnull %4) #11
  tail call void @halide_free(i8* %0, i8* nonnull %4) #11
  br label %25

; <label>:25:                                     ; preds = %.predBB2.split2, %.predBB1.split1
  ret i32 %2
}

; Function Attrs: nounwind
define weak i32 @halide_error_extern_stage_failed(i8*, i8*, i32) local_unnamed_addr #0 {
  %4 = tail call i8* @halide_malloc(i8* %0, i64 1024) #11
  %5 = ptrtoint i8* %4 to i64
  %6 = icmp eq i8* %4, null
  br i1 %6, label %.predBB1.split, label %.predBB2.split

.predBB2.split:                                   ; preds = %3
  %7 = getelementptr inbounds i8, i8* %4, i64 1023
  store i8 0, i8* %7, align 1, !tbaa !11
  %8 = tail call i8* @halide_string_to_string(i8* nonnull %4, i8* nonnull %7, i8* nonnull getelementptr inbounds ([24 x i8], [24 x i8]* @.str.2.114, i64 0, i64 0)) #11
  br label %10

.predBB1.split:                                   ; preds = %3
  %9 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([24 x i8], [24 x i8]* @.str.2.114, i64 0, i64 0)) #11
  br label %10

; <label>:10:                                     ; preds = %.predBB1.split, %.predBB2.split
  %11 = phi i8* [ null, %.predBB1.split ], [ %7, %.predBB2.split ]
  %phi.call = phi i8* [ %9, %.predBB1.split ], [ %8, %.predBB2.split ]
  %12 = icmp eq i8* %1, null
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %10
  %14 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #11
  br label %17

; <label>:15:                                     ; preds = %10
  %16 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* nonnull %1) #11
  br label %17

; <label>:17:                                     ; preds = %15, %13
  %18 = phi i8* [ %16, %15 ], [ %14, %13 ]
  %19 = tail call i8* @halide_string_to_string(i8* %18, i8* %11, i8* nonnull getelementptr inbounds ([27 x i8], [27 x i8]* @.str.1.113, i64 0, i64 0)) #11
  %20 = sext i32 %2 to i64
  %21 = tail call i8* @halide_int64_to_string(i8* %19, i8* %11, i64 %20, i32 1) #11
  br i1 %6, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %17
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #11
  tail call void @halide_free(i8* %0, i8* null) #11
  br label %25

.predBB2.split2:                                  ; preds = %17
  %22 = ptrtoint i8* %21 to i64
  %23 = sub i64 1, %5
  %24 = add i64 %23, %22
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %4, i64 %24) #11
  tail call void @halide_error(i8* %0, i8* nonnull %4) #11
  tail call void @halide_free(i8* %0, i8* nonnull %4) #11
  br label %25

; <label>:25:                                     ; preds = %.predBB2.split2, %.predBB1.split1
  ret i32 %2
}

; Function Attrs: nounwind
define weak i32 @halide_error_explicit_bounds_too_small(i8*, i8*, i8*, i32, i32, i32, i32) local_unnamed_addr #0 {
  %8 = tail call i8* @halide_malloc(i8* %0, i64 1024) #11
  %9 = ptrtoint i8* %8 to i64
  %10 = icmp eq i8* %8, null
  br i1 %10, label %.predBB1.split, label %.predBB2.split

.predBB2.split:                                   ; preds = %7
  %11 = getelementptr inbounds i8, i8* %8, i64 1023
  store i8 0, i8* %11, align 1, !tbaa !11
  %12 = tail call i8* @halide_string_to_string(i8* nonnull %8, i8* nonnull %11, i8* nonnull getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3.115, i64 0, i64 0)) #11
  br label %14

.predBB1.split:                                   ; preds = %7
  %13 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3.115, i64 0, i64 0)) #11
  br label %14

; <label>:14:                                     ; preds = %.predBB1.split, %.predBB2.split
  %15 = phi i8* [ null, %.predBB1.split ], [ %11, %.predBB2.split ]
  %phi.call = phi i8* [ %13, %.predBB1.split ], [ %12, %.predBB2.split ]
  %16 = icmp eq i8* %2, null
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %14
  %18 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %15, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #11
  br label %21

; <label>:19:                                     ; preds = %14
  %20 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %15, i8* nonnull %2) #11
  br label %21

; <label>:21:                                     ; preds = %19, %17
  %22 = phi i8* [ %20, %19 ], [ %18, %17 ]
  %23 = tail call i8* @halide_string_to_string(i8* %22, i8* %15, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4.116, i64 0, i64 0)) #11
  %24 = icmp eq i8* %1, null
  br i1 %24, label %25, label %27

; <label>:25:                                     ; preds = %21
  %26 = tail call i8* @halide_string_to_string(i8* %23, i8* %15, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #11
  br label %29

; <label>:27:                                     ; preds = %21
  %28 = tail call i8* @halide_string_to_string(i8* %23, i8* %15, i8* nonnull %1) #11
  br label %29

; <label>:29:                                     ; preds = %27, %25
  %30 = phi i8* [ %28, %27 ], [ %26, %25 ]
  %31 = tail call i8* @halide_string_to_string(i8* %30, i8* %15, i8* nonnull getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5.117, i64 0, i64 0)) #11
  %32 = sext i32 %3 to i64
  %33 = tail call i8* @halide_int64_to_string(i8* %31, i8* %15, i64 %32, i32 1) #11
  %34 = tail call i8* @halide_string_to_string(i8* %33, i8* %15, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6.118, i64 0, i64 0)) #11
  %35 = sext i32 %4 to i64
  %36 = tail call i8* @halide_int64_to_string(i8* %34, i8* %15, i64 %35, i32 1) #11
  %37 = tail call i8* @halide_string_to_string(i8* %36, i8* %15, i8* nonnull getelementptr inbounds ([38 x i8], [38 x i8]* @.str.7.119, i64 0, i64 0)) #11
  %38 = sext i32 %5 to i64
  %39 = tail call i8* @halide_int64_to_string(i8* %37, i8* %15, i64 %38, i32 1) #11
  %40 = tail call i8* @halide_string_to_string(i8* %39, i8* %15, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6.118, i64 0, i64 0)) #11
  %41 = sext i32 %6 to i64
  %42 = tail call i8* @halide_int64_to_string(i8* %40, i8* %15, i64 %41, i32 1) #11
  %43 = tail call i8* @halide_string_to_string(i8* %42, i8* %15, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5.169, i64 0, i64 0)) #11
  br i1 %10, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %29
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #11
  tail call void @halide_free(i8* %0, i8* null) #11
  br label %47

.predBB2.split2:                                  ; preds = %29
  %44 = ptrtoint i8* %43 to i64
  %45 = sub i64 1, %9
  %46 = add i64 %45, %44
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %8, i64 %46) #11
  tail call void @halide_error(i8* %0, i8* nonnull %8) #11
  tail call void @halide_free(i8* %0, i8* nonnull %8) #11
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
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %9) #9
  store i8 0, i8* %9, align 2, !tbaa !176
  %10 = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %7, i64 0, i32 1
  store i8 0, i8* %10, align 1, !tbaa !108
  %11 = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %7, i64 0, i32 2
  store i16 0, i16* %11, align 2, !tbaa !177
  %12 = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %8, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %12) #9
  store i8 0, i8* %12, align 2, !tbaa !176
  %13 = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %8, i64 0, i32 1
  store i8 0, i8* %13, align 1, !tbaa !108
  %14 = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %8, i64 0, i32 2
  store i16 0, i16* %14, align 2, !tbaa !177
  %15 = bitcast i32* %6 to i8*
  %16 = call i8* @memcpy(i8* nonnull %9, i8* nonnull %15, i64 4) #11
  %17 = bitcast i32* %5 to i8*
  %18 = call i8* @memcpy(i8* nonnull %12, i8* nonnull %17, i64 4) #11
  %19 = call i8* @halide_malloc(i8* %0, i64 1024) #11
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
  %28 = call i8* @halide_string_to_string(i8* %19, i8* %25, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #11
  br label %31

; <label>:29:                                     ; preds = %24
  %30 = call i8* @halide_string_to_string(i8* %19, i8* %25, i8* nonnull %1) #11
  br label %31

; <label>:31:                                     ; preds = %29, %27
  %32 = phi i8* [ %30, %29 ], [ %28, %27 ]
  %33 = call i8* @halide_string_to_string(i8* %32, i8* %25, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.9.121, i64 0, i64 0)) #11
  %34 = call i8* @halide_type_to_string(i8* %33, i8* %25, %struct.halide_type_t* nonnull %7) #11
  %35 = call i8* @halide_string_to_string(i8* %34, i8* %25, i8* nonnull getelementptr inbounds ([38 x i8], [38 x i8]* @.str.10.122, i64 0, i64 0)) #11
  %36 = call i8* @halide_type_to_string(i8* %35, i8* %25, %struct.halide_type_t* nonnull %8) #11
  br i1 %21, label %.predBB1.split, label %.predBB2.split

.predBB1.split:                                   ; preds = %31
  call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #11
  call void @halide_free(i8* %0, i8* null) #11
  br label %40

.predBB2.split:                                   ; preds = %31
  %37 = ptrtoint i8* %36 to i64
  %38 = sub i64 1, %20
  %39 = add i64 %38, %37
  call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %19, i64 %39) #11
  call void @halide_error(i8* %0, i8* nonnull %19) #11
  call void @halide_free(i8* %0, i8* nonnull %19) #11
  br label %40

; <label>:40:                                     ; preds = %.predBB2.split, %.predBB1.split
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %12) #9
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %9) #9
  ret i32 -3
}

; Function Attrs: nounwind
define weak i32 @halide_error_bad_dimensions(i8*, i8*, i32, i32) local_unnamed_addr #0 {
  %5 = tail call i8* @halide_malloc(i8* %0, i64 1024) #11
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
  %14 = tail call i8* @halide_string_to_string(i8* %5, i8* %11, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #11
  br label %17

; <label>:15:                                     ; preds = %10
  %16 = tail call i8* @halide_string_to_string(i8* %5, i8* %11, i8* nonnull %1) #11
  br label %17

; <label>:17:                                     ; preds = %15, %13
  %18 = phi i8* [ %16, %15 ], [ %14, %13 ]
  %19 = tail call i8* @halide_string_to_string(i8* %18, i8* %11, i8* nonnull getelementptr inbounds ([31 x i8], [31 x i8]* @.str.11.123, i64 0, i64 0)) #11
  %20 = sext i32 %3 to i64
  %21 = tail call i8* @halide_int64_to_string(i8* %19, i8* %11, i64 %20, i32 1) #11
  %22 = tail call i8* @halide_string_to_string(i8* %21, i8* %11, i8* nonnull getelementptr inbounds ([43 x i8], [43 x i8]* @.str.12.124, i64 0, i64 0)) #11
  %23 = sext i32 %2 to i64
  %24 = tail call i8* @halide_int64_to_string(i8* %22, i8* %11, i64 %23, i32 1) #11
  %25 = tail call i8* @halide_string_to_string(i8* %24, i8* %11, i8* nonnull getelementptr inbounds ([12 x i8], [12 x i8]* @.str.13.125, i64 0, i64 0)) #11
  br i1 %7, label %.predBB1.split, label %.predBB2.split

.predBB1.split:                                   ; preds = %17
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #11
  tail call void @halide_free(i8* %0, i8* null) #11
  br label %29

.predBB2.split:                                   ; preds = %17
  %26 = ptrtoint i8* %25 to i64
  %27 = sub i64 1, %6
  %28 = add i64 %27, %26
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %5, i64 %28) #11
  tail call void @halide_error(i8* %0, i8* nonnull %5) #11
  tail call void @halide_free(i8* %0, i8* nonnull %5) #11
  br label %29

; <label>:29:                                     ; preds = %.predBB2.split, %.predBB1.split
  ret i32 -43
}

; Function Attrs: nounwind
define weak i32 @halide_error_access_out_of_bounds(i8*, i8*, i32, i32, i32, i32, i32) local_unnamed_addr #0 {
  %8 = icmp slt i32 %3, %5
  br i1 %8, label %9, label %36

; <label>:9:                                      ; preds = %7
  %10 = tail call i8* @halide_malloc(i8* %0, i64 1024) #11
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
  %19 = tail call i8* @halide_string_to_string(i8* %10, i8* %16, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #11
  br label %22

; <label>:20:                                     ; preds = %15
  %21 = tail call i8* @halide_string_to_string(i8* %10, i8* %16, i8* nonnull %1) #11
  br label %22

; <label>:22:                                     ; preds = %20, %18
  %23 = phi i8* [ %21, %20 ], [ %19, %18 ]
  %24 = tail call i8* @halide_string_to_string(i8* %23, i8* %16, i8* nonnull getelementptr inbounds ([17 x i8], [17 x i8]* @.str.14.126, i64 0, i64 0)) #11
  %25 = sext i32 %3 to i64
  %26 = tail call i8* @halide_int64_to_string(i8* %24, i8* %16, i64 %25, i32 1) #11
  %27 = tail call i8* @halide_string_to_string(i8* %26, i8* %16, i8* nonnull getelementptr inbounds ([28 x i8], [28 x i8]* @.str.15.127, i64 0, i64 0)) #11
  %28 = sext i32 %5 to i64
  %29 = tail call i8* @halide_int64_to_string(i8* %27, i8* %16, i64 %28, i32 1) #11
  %30 = tail call i8* @halide_string_to_string(i8* %29, i8* %16, i8* nonnull getelementptr inbounds ([16 x i8], [16 x i8]* @.str.16.128, i64 0, i64 0)) #11
  %31 = sext i32 %2 to i64
  %32 = tail call i8* @halide_int64_to_string(i8* %30, i8* %16, i64 %31, i32 1) #11
  br i1 %12, label %.predBB1.split, label %.predBB2.split

.predBB1.split:                                   ; preds = %22
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #11
  tail call void @halide_free(i8* %0, i8* null) #11
  br label %65

.predBB2.split:                                   ; preds = %22
  %33 = ptrtoint i8* %32 to i64
  %34 = sub i64 1, %11
  %35 = add i64 %34, %33
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %10, i64 %35) #11
  tail call void @halide_error(i8* %0, i8* nonnull %10) #11
  tail call void @halide_free(i8* %0, i8* nonnull %10) #11
  br label %65

; <label>:36:                                     ; preds = %7
  %37 = icmp sgt i32 %4, %6
  br i1 %37, label %38, label %65

; <label>:38:                                     ; preds = %36
  %39 = tail call i8* @halide_malloc(i8* %0, i64 1024) #11
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
  %48 = tail call i8* @halide_string_to_string(i8* %39, i8* %45, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #11
  br label %51

; <label>:49:                                     ; preds = %44
  %50 = tail call i8* @halide_string_to_string(i8* %39, i8* %45, i8* nonnull %1) #11
  br label %51

; <label>:51:                                     ; preds = %49, %47
  %52 = phi i8* [ %50, %49 ], [ %48, %47 ]
  %53 = tail call i8* @halide_string_to_string(i8* %52, i8* %45, i8* nonnull getelementptr inbounds ([17 x i8], [17 x i8]* @.str.14.126, i64 0, i64 0)) #11
  %54 = sext i32 %4 to i64
  %55 = tail call i8* @halide_int64_to_string(i8* %53, i8* %45, i64 %54, i32 1) #11
  %56 = tail call i8* @halide_string_to_string(i8* %55, i8* %45, i8* nonnull getelementptr inbounds ([28 x i8], [28 x i8]* @.str.17.129, i64 0, i64 0)) #11
  %57 = sext i32 %6 to i64
  %58 = tail call i8* @halide_int64_to_string(i8* %56, i8* %45, i64 %57, i32 1) #11
  %59 = tail call i8* @halide_string_to_string(i8* %58, i8* %45, i8* nonnull getelementptr inbounds ([16 x i8], [16 x i8]* @.str.16.128, i64 0, i64 0)) #11
  %60 = sext i32 %2 to i64
  %61 = tail call i8* @halide_int64_to_string(i8* %59, i8* %45, i64 %60, i32 1) #11
  br i1 %41, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %51
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #11
  tail call void @halide_free(i8* %0, i8* null) #11
  br label %65

.predBB2.split2:                                  ; preds = %51
  %62 = ptrtoint i8* %61 to i64
  %63 = sub i64 1, %40
  %64 = add i64 %63, %62
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %39, i64 %64) #11
  tail call void @halide_error(i8* %0, i8* nonnull %39) #11
  tail call void @halide_free(i8* %0, i8* nonnull %39) #11
  br label %65

; <label>:65:                                     ; preds = %.predBB2.split2, %.predBB1.split1, %36, %.predBB2.split, %.predBB1.split
  ret i32 -4
}

; Function Attrs: nounwind
define weak i32 @halide_error_buffer_allocation_too_large(i8*, i8*, i64, i64) local_unnamed_addr #0 {
  %5 = tail call i8* @halide_malloc(i8* %0, i64 1024) #11
  %6 = ptrtoint i8* %5 to i64
  %7 = icmp eq i8* %5, null
  br i1 %7, label %.predBB1.split, label %.predBB2.split

.predBB2.split:                                   ; preds = %4
  %8 = getelementptr inbounds i8, i8* %5, i64 1023
  store i8 0, i8* %8, align 1, !tbaa !11
  %9 = tail call i8* @halide_string_to_string(i8* nonnull %5, i8* nonnull %8, i8* nonnull getelementptr inbounds ([29 x i8], [29 x i8]* @.str.18.130, i64 0, i64 0)) #11
  br label %11

.predBB1.split:                                   ; preds = %4
  %10 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([29 x i8], [29 x i8]* @.str.18.130, i64 0, i64 0)) #11
  br label %11

; <label>:11:                                     ; preds = %.predBB1.split, %.predBB2.split
  %12 = phi i8* [ null, %.predBB1.split ], [ %8, %.predBB2.split ]
  %phi.call = phi i8* [ %10, %.predBB1.split ], [ %9, %.predBB2.split ]
  %13 = icmp eq i8* %1, null
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %11
  %15 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #11
  br label %18

; <label>:16:                                     ; preds = %11
  %17 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %12, i8* nonnull %1) #11
  br label %18

; <label>:18:                                     ; preds = %16, %14
  %19 = phi i8* [ %17, %16 ], [ %15, %14 ]
  %20 = tail call i8* @halide_string_to_string(i8* %19, i8* %12, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.131, i64 0, i64 0)) #11
  %21 = tail call i8* @halide_uint64_to_string(i8* %20, i8* %12, i64 %2, i32 1) #11
  %22 = tail call i8* @halide_string_to_string(i8* %21, i8* %12, i8* nonnull getelementptr inbounds ([37 x i8], [37 x i8]* @.str.20.132, i64 0, i64 0)) #11
  %23 = tail call i8* @halide_uint64_to_string(i8* %22, i8* %12, i64 %3, i32 1) #11
  br i1 %7, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %18
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #11
  tail call void @halide_free(i8* %0, i8* null) #11
  br label %27

.predBB2.split2:                                  ; preds = %18
  %24 = ptrtoint i8* %23 to i64
  %25 = sub i64 1, %6
  %26 = add i64 %25, %24
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %5, i64 %26) #11
  tail call void @halide_error(i8* %0, i8* nonnull %5) #11
  tail call void @halide_free(i8* %0, i8* nonnull %5) #11
  br label %27

; <label>:27:                                     ; preds = %.predBB2.split2, %.predBB1.split1
  ret i32 -5
}

; Function Attrs: nounwind
define weak i32 @halide_error_buffer_extents_negative(i8*, i8*, i32, i32) local_unnamed_addr #0 {
  %5 = tail call i8* @halide_malloc(i8* %0, i64 1024) #11
  %6 = ptrtoint i8* %5 to i64
  %7 = icmp eq i8* %5, null
  br i1 %7, label %.predBB1.split, label %.predBB2.split

.predBB2.split:                                   ; preds = %4
  %8 = getelementptr inbounds i8, i8* %5, i64 1023
  store i8 0, i8* %8, align 1, !tbaa !11
  %9 = tail call i8* @halide_string_to_string(i8* nonnull %5, i8* nonnull %8, i8* nonnull getelementptr inbounds ([24 x i8], [24 x i8]* @.str.21.133, i64 0, i64 0)) #11
  br label %11

.predBB1.split:                                   ; preds = %4
  %10 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([24 x i8], [24 x i8]* @.str.21.133, i64 0, i64 0)) #11
  br label %11

; <label>:11:                                     ; preds = %.predBB1.split, %.predBB2.split
  %12 = phi i8* [ null, %.predBB1.split ], [ %8, %.predBB2.split ]
  %phi.call = phi i8* [ %10, %.predBB1.split ], [ %9, %.predBB2.split ]
  %13 = icmp eq i8* %1, null
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %11
  %15 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #11
  br label %18

; <label>:16:                                     ; preds = %11
  %17 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %12, i8* nonnull %1) #11
  br label %18

; <label>:18:                                     ; preds = %16, %14
  %19 = phi i8* [ %17, %16 ], [ %15, %14 ]
  %20 = tail call i8* @halide_string_to_string(i8* %19, i8* %12, i8* nonnull getelementptr inbounds ([12 x i8], [12 x i8]* @.str.22.134, i64 0, i64 0)) #11
  %21 = sext i32 %2 to i64
  %22 = tail call i8* @halide_int64_to_string(i8* %20, i8* %12, i64 %21, i32 1) #11
  %23 = tail call i8* @halide_string_to_string(i8* %22, i8* %12, i8* nonnull getelementptr inbounds ([15 x i8], [15 x i8]* @.str.23.135, i64 0, i64 0)) #11
  %24 = sext i32 %3 to i64
  %25 = tail call i8* @halide_int64_to_string(i8* %23, i8* %12, i64 %24, i32 1) #11
  %26 = tail call i8* @halide_string_to_string(i8* %25, i8* %12, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5.169, i64 0, i64 0)) #11
  br i1 %7, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %18
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #11
  tail call void @halide_free(i8* %0, i8* null) #11
  br label %30

.predBB2.split2:                                  ; preds = %18
  %27 = ptrtoint i8* %26 to i64
  %28 = sub i64 1, %6
  %29 = add i64 %28, %27
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %5, i64 %29) #11
  tail call void @halide_error(i8* %0, i8* nonnull %5) #11
  tail call void @halide_free(i8* %0, i8* nonnull %5) #11
  br label %30

; <label>:30:                                     ; preds = %.predBB2.split2, %.predBB1.split1
  ret i32 -28
}

; Function Attrs: nounwind
define weak i32 @halide_error_buffer_extents_too_large(i8*, i8*, i64, i64) local_unnamed_addr #0 {
  %5 = tail call i8* @halide_malloc(i8* %0, i64 1024) #11
  %6 = ptrtoint i8* %5 to i64
  %7 = icmp eq i8* %5, null
  br i1 %7, label %.predBB1.split, label %.predBB2.split

.predBB2.split:                                   ; preds = %4
  %8 = getelementptr inbounds i8, i8* %5, i64 1023
  store i8 0, i8* %8, align 1, !tbaa !11
  %9 = tail call i8* @halide_string_to_string(i8* nonnull %5, i8* nonnull %8, i8* nonnull getelementptr inbounds ([31 x i8], [31 x i8]* @.str.24.136, i64 0, i64 0)) #11
  br label %11

.predBB1.split:                                   ; preds = %4
  %10 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([31 x i8], [31 x i8]* @.str.24.136, i64 0, i64 0)) #11
  br label %11

; <label>:11:                                     ; preds = %.predBB1.split, %.predBB2.split
  %12 = phi i8* [ null, %.predBB1.split ], [ %8, %.predBB2.split ]
  %phi.call = phi i8* [ %10, %.predBB1.split ], [ %9, %.predBB2.split ]
  %13 = icmp eq i8* %1, null
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %11
  %15 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #11
  br label %18

; <label>:16:                                     ; preds = %11
  %17 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %12, i8* nonnull %1) #11
  br label %18

; <label>:18:                                     ; preds = %16, %14
  %19 = phi i8* [ %17, %16 ], [ %15, %14 ]
  %20 = tail call i8* @halide_string_to_string(i8* %19, i8* %12, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.131, i64 0, i64 0)) #11
  %21 = tail call i8* @halide_int64_to_string(i8* %20, i8* %12, i64 %2, i32 1) #11
  %22 = tail call i8* @halide_string_to_string(i8* %21, i8* %12, i8* nonnull getelementptr inbounds ([37 x i8], [37 x i8]* @.str.20.132, i64 0, i64 0)) #11
  %23 = tail call i8* @halide_int64_to_string(i8* %22, i8* %12, i64 %3, i32 1) #11
  br i1 %7, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %18
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #11
  tail call void @halide_free(i8* %0, i8* null) #11
  br label %27

.predBB2.split2:                                  ; preds = %18
  %24 = ptrtoint i8* %23 to i64
  %25 = sub i64 1, %6
  %26 = add i64 %25, %24
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %5, i64 %26) #11
  tail call void @halide_error(i8* %0, i8* nonnull %5) #11
  tail call void @halide_free(i8* %0, i8* nonnull %5) #11
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
  %12 = tail call i8* @halide_malloc(i8* %0, i64 1024) #11
  %13 = ptrtoint i8* %12 to i64
  %14 = icmp eq i8* %12, null
  br i1 %14, label %.predBB1.split, label %.predBB2.split

.predBB2.split:                                   ; preds = %7
  %15 = getelementptr inbounds i8, i8* %12, i64 1023
  store i8 0, i8* %15, align 1, !tbaa !11
  %16 = tail call i8* @halide_string_to_string(i8* nonnull %12, i8* nonnull %15, i8* nonnull getelementptr inbounds ([29 x i8], [29 x i8]* @.str.25.137, i64 0, i64 0)) #11
  br label %18

.predBB1.split:                                   ; preds = %7
  %17 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([29 x i8], [29 x i8]* @.str.25.137, i64 0, i64 0)) #11
  br label %18

; <label>:18:                                     ; preds = %.predBB1.split, %.predBB2.split
  %19 = phi i8* [ null, %.predBB1.split ], [ %15, %.predBB2.split ]
  %phi.call = phi i8* [ %17, %.predBB1.split ], [ %16, %.predBB2.split ]
  %20 = icmp eq i8* %1, null
  br i1 %20, label %21, label %23

; <label>:21:                                     ; preds = %18
  %22 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %19, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #11
  br label %25

; <label>:23:                                     ; preds = %18
  %24 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %19, i8* nonnull %1) #11
  br label %25

; <label>:25:                                     ; preds = %23, %21
  %26 = phi i8* [ %24, %23 ], [ %22, %21 ]
  %27 = tail call i8* @halide_string_to_string(i8* %26, i8* %19, i8* nonnull getelementptr inbounds ([54 x i8], [54 x i8]* @.str.26.138, i64 0, i64 0)) #11
  %28 = sext i32 %2 to i64
  %29 = tail call i8* @halide_int64_to_string(i8* %27, i8* %19, i64 %28, i32 1) #11
  %30 = tail call i8* @halide_string_to_string(i8* %29, i8* %19, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.27.139, i64 0, i64 0)) #11
  %31 = tail call i8* @halide_string_to_string(i8* %30, i8* %19, i8* nonnull getelementptr inbounds ([16 x i8], [16 x i8]* @.str.28.140, i64 0, i64 0)) #11
  %32 = sext i32 %5 to i64
  %33 = tail call i8* @halide_int64_to_string(i8* %31, i8* %19, i64 %32, i32 1) #11
  %34 = tail call i8* @halide_string_to_string(i8* %33, i8* %19, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6.118, i64 0, i64 0)) #11
  %35 = sext i32 %9 to i64
  %36 = tail call i8* @halide_int64_to_string(i8* %34, i8* %19, i64 %35, i32 1) #11
  %37 = tail call i8* @halide_string_to_string(i8* %36, i8* %19, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.27.139, i64 0, i64 0)) #11
  %38 = tail call i8* @halide_string_to_string(i8* %37, i8* %19, i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str.29.141, i64 0, i64 0)) #11
  %39 = sext i32 %3 to i64
  %40 = tail call i8* @halide_int64_to_string(i8* %38, i8* %19, i64 %39, i32 1) #11
  %41 = tail call i8* @halide_string_to_string(i8* %40, i8* %19, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6.118, i64 0, i64 0)) #11
  %42 = sext i32 %11 to i64
  %43 = tail call i8* @halide_int64_to_string(i8* %41, i8* %19, i64 %42, i32 1) #11
  %44 = tail call i8* @halide_string_to_string(i8* %43, i8* %19, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30.142, i64 0, i64 0)) #11
  br i1 %14, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %25
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #11
  tail call void @halide_free(i8* %0, i8* null) #11
  br label %48

.predBB2.split2:                                  ; preds = %25
  %45 = ptrtoint i8* %44 to i64
  %46 = sub i64 1, %13
  %47 = add i64 %46, %45
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %12, i64 %47) #11
  tail call void @halide_error(i8* %0, i8* nonnull %12) #11
  tail call void @halide_free(i8* %0, i8* nonnull %12) #11
  br label %48

; <label>:48:                                     ; preds = %.predBB2.split2, %.predBB1.split1
  ret i32 -7
}

; Function Attrs: nounwind
define weak i32 @halide_error_constraint_violated(i8*, i8*, i32, i8*, i32) local_unnamed_addr #0 {
  %6 = tail call i8* @halide_malloc(i8* %0, i64 1024) #11
  %7 = ptrtoint i8* %6 to i64
  %8 = icmp eq i8* %6, null
  br i1 %8, label %.predBB1.split, label %.predBB2.split

.predBB2.split:                                   ; preds = %5
  %9 = getelementptr inbounds i8, i8* %6, i64 1023
  store i8 0, i8* %9, align 1, !tbaa !11
  %10 = tail call i8* @halide_string_to_string(i8* nonnull %6, i8* nonnull %9, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.31.143, i64 0, i64 0)) #11
  br label %12

.predBB1.split:                                   ; preds = %5
  %11 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.31.143, i64 0, i64 0)) #11
  br label %12

; <label>:12:                                     ; preds = %.predBB1.split, %.predBB2.split
  %13 = phi i8* [ null, %.predBB1.split ], [ %9, %.predBB2.split ]
  %phi.call = phi i8* [ %11, %.predBB1.split ], [ %10, %.predBB2.split ]
  %14 = icmp eq i8* %1, null
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %12
  %16 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %13, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #11
  br label %19

; <label>:17:                                     ; preds = %12
  %18 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %13, i8* nonnull %1) #11
  br label %19

; <label>:19:                                     ; preds = %17, %15
  %20 = phi i8* [ %18, %17 ], [ %16, %15 ]
  %21 = tail call i8* @halide_string_to_string(i8* %20, i8* %13, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.32.144, i64 0, i64 0)) #11
  %22 = sext i32 %2 to i64
  %23 = tail call i8* @halide_int64_to_string(i8* %21, i8* %13, i64 %22, i32 1) #11
  %24 = tail call i8* @halide_string_to_string(i8* %23, i8* %13, i8* nonnull getelementptr inbounds ([6 x i8], [6 x i8]* @.str.33.145, i64 0, i64 0)) #11
  %25 = icmp eq i8* %3, null
  br i1 %25, label %26, label %28

; <label>:26:                                     ; preds = %19
  %27 = tail call i8* @halide_string_to_string(i8* %24, i8* %13, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #11
  br label %30

; <label>:28:                                     ; preds = %19
  %29 = tail call i8* @halide_string_to_string(i8* %24, i8* %13, i8* nonnull %3) #11
  br label %30

; <label>:30:                                     ; preds = %28, %26
  %31 = phi i8* [ %29, %28 ], [ %27, %26 ]
  %32 = tail call i8* @halide_string_to_string(i8* %31, i8* %13, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.32.144, i64 0, i64 0)) #11
  %33 = sext i32 %4 to i64
  %34 = tail call i8* @halide_int64_to_string(i8* %32, i8* %13, i64 %33, i32 1) #11
  %35 = tail call i8* @halide_string_to_string(i8* %34, i8* %13, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5.169, i64 0, i64 0)) #11
  br i1 %8, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %30
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #11
  tail call void @halide_free(i8* %0, i8* null) #11
  br label %39

.predBB2.split2:                                  ; preds = %30
  %36 = ptrtoint i8* %35 to i64
  %37 = sub i64 1, %7
  %38 = add i64 %37, %36
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %6, i64 %38) #11
  tail call void @halide_error(i8* %0, i8* nonnull %6) #11
  tail call void @halide_free(i8* %0, i8* nonnull %6) #11
  br label %39

; <label>:39:                                     ; preds = %.predBB2.split2, %.predBB1.split1
  ret i32 -8
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_small_i64(i8*, i8*, i64, i64) local_unnamed_addr #0 {
  %5 = tail call i8* @halide_malloc(i8* %0, i64 1024) #11
  %6 = ptrtoint i8* %5 to i64
  %7 = icmp eq i8* %5, null
  br i1 %7, label %.predBB1.split, label %.predBB2.split

.predBB2.split:                                   ; preds = %4
  %8 = getelementptr inbounds i8, i8* %5, i64 1023
  store i8 0, i8* %8, align 1, !tbaa !11
  %9 = tail call i8* @halide_string_to_string(i8* nonnull %5, i8* nonnull %8, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.146, i64 0, i64 0)) #11
  br label %11

.predBB1.split:                                   ; preds = %4
  %10 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.146, i64 0, i64 0)) #11
  br label %11

; <label>:11:                                     ; preds = %.predBB1.split, %.predBB2.split
  %12 = phi i8* [ null, %.predBB1.split ], [ %8, %.predBB2.split ]
  %phi.call = phi i8* [ %10, %.predBB1.split ], [ %9, %.predBB2.split ]
  %13 = icmp eq i8* %1, null
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %11
  %15 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #11
  br label %18

; <label>:16:                                     ; preds = %11
  %17 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %12, i8* nonnull %1) #11
  br label %18

; <label>:18:                                     ; preds = %16, %14
  %19 = phi i8* [ %17, %16 ], [ %15, %14 ]
  %20 = tail call i8* @halide_string_to_string(i8* %19, i8* %12, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.131, i64 0, i64 0)) #11
  %21 = tail call i8* @halide_int64_to_string(i8* %20, i8* %12, i64 %2, i32 1) #11
  %22 = tail call i8* @halide_string_to_string(i8* %21, i8* %12, i8* nonnull getelementptr inbounds ([23 x i8], [23 x i8]* @.str.35.147, i64 0, i64 0)) #11
  %23 = tail call i8* @halide_int64_to_string(i8* %22, i8* %12, i64 %3, i32 1) #11
  br i1 %7, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %18
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #11
  tail call void @halide_free(i8* %0, i8* null) #11
  br label %27

.predBB2.split2:                                  ; preds = %18
  %24 = ptrtoint i8* %23 to i64
  %25 = sub i64 1, %6
  %26 = add i64 %25, %24
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %5, i64 %26) #11
  tail call void @halide_error(i8* %0, i8* nonnull %5) #11
  tail call void @halide_free(i8* %0, i8* nonnull %5) #11
  br label %27

; <label>:27:                                     ; preds = %.predBB2.split2, %.predBB1.split1
  ret i32 -9
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_small_u64(i8*, i8*, i64, i64) local_unnamed_addr #0 {
  %5 = tail call i8* @halide_malloc(i8* %0, i64 1024) #11
  %6 = ptrtoint i8* %5 to i64
  %7 = icmp eq i8* %5, null
  br i1 %7, label %.predBB1.split, label %.predBB2.split

.predBB2.split:                                   ; preds = %4
  %8 = getelementptr inbounds i8, i8* %5, i64 1023
  store i8 0, i8* %8, align 1, !tbaa !11
  %9 = tail call i8* @halide_string_to_string(i8* nonnull %5, i8* nonnull %8, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.146, i64 0, i64 0)) #11
  br label %11

.predBB1.split:                                   ; preds = %4
  %10 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.146, i64 0, i64 0)) #11
  br label %11

; <label>:11:                                     ; preds = %.predBB1.split, %.predBB2.split
  %12 = phi i8* [ null, %.predBB1.split ], [ %8, %.predBB2.split ]
  %phi.call = phi i8* [ %10, %.predBB1.split ], [ %9, %.predBB2.split ]
  %13 = icmp eq i8* %1, null
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %11
  %15 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #11
  br label %18

; <label>:16:                                     ; preds = %11
  %17 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %12, i8* nonnull %1) #11
  br label %18

; <label>:18:                                     ; preds = %16, %14
  %19 = phi i8* [ %17, %16 ], [ %15, %14 ]
  %20 = tail call i8* @halide_string_to_string(i8* %19, i8* %12, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.131, i64 0, i64 0)) #11
  %21 = tail call i8* @halide_uint64_to_string(i8* %20, i8* %12, i64 %2, i32 1) #11
  %22 = tail call i8* @halide_string_to_string(i8* %21, i8* %12, i8* nonnull getelementptr inbounds ([23 x i8], [23 x i8]* @.str.35.147, i64 0, i64 0)) #11
  %23 = tail call i8* @halide_uint64_to_string(i8* %22, i8* %12, i64 %3, i32 1) #11
  br i1 %7, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %18
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #11
  tail call void @halide_free(i8* %0, i8* null) #11
  br label %27

.predBB2.split2:                                  ; preds = %18
  %24 = ptrtoint i8* %23 to i64
  %25 = sub i64 1, %6
  %26 = add i64 %25, %24
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %5, i64 %26) #11
  tail call void @halide_error(i8* %0, i8* nonnull %5) #11
  tail call void @halide_free(i8* %0, i8* nonnull %5) #11
  br label %27

; <label>:27:                                     ; preds = %.predBB2.split2, %.predBB1.split1
  ret i32 -9
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_small_f64(i8*, i8*, double, double) local_unnamed_addr #0 {
  %5 = tail call i8* @halide_malloc(i8* %0, i64 1024) #11
  %6 = ptrtoint i8* %5 to i64
  %7 = icmp eq i8* %5, null
  br i1 %7, label %.predBB1.split, label %.predBB2.split

.predBB2.split:                                   ; preds = %4
  %8 = getelementptr inbounds i8, i8* %5, i64 1023
  store i8 0, i8* %8, align 1, !tbaa !11
  %9 = tail call i8* @halide_string_to_string(i8* nonnull %5, i8* nonnull %8, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.146, i64 0, i64 0)) #11
  br label %11

.predBB1.split:                                   ; preds = %4
  %10 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.146, i64 0, i64 0)) #11
  br label %11

; <label>:11:                                     ; preds = %.predBB1.split, %.predBB2.split
  %12 = phi i8* [ null, %.predBB1.split ], [ %8, %.predBB2.split ]
  %phi.call = phi i8* [ %10, %.predBB1.split ], [ %9, %.predBB2.split ]
  %13 = icmp eq i8* %1, null
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %11
  %15 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #11
  br label %18

; <label>:16:                                     ; preds = %11
  %17 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %12, i8* nonnull %1) #11
  br label %18

; <label>:18:                                     ; preds = %16, %14
  %19 = phi i8* [ %17, %16 ], [ %15, %14 ]
  %20 = tail call i8* @halide_string_to_string(i8* %19, i8* %12, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.131, i64 0, i64 0)) #11
  %21 = tail call i8* @halide_double_to_string(i8* %20, i8* %12, double %2, i32 1) #11
  %22 = tail call i8* @halide_string_to_string(i8* %21, i8* %12, i8* nonnull getelementptr inbounds ([23 x i8], [23 x i8]* @.str.35.147, i64 0, i64 0)) #11
  %23 = tail call i8* @halide_double_to_string(i8* %22, i8* %12, double %3, i32 1) #11
  br i1 %7, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %18
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #11
  tail call void @halide_free(i8* %0, i8* null) #11
  br label %27

.predBB2.split2:                                  ; preds = %18
  %24 = ptrtoint i8* %23 to i64
  %25 = sub i64 1, %6
  %26 = add i64 %25, %24
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %5, i64 %26) #11
  tail call void @halide_error(i8* %0, i8* nonnull %5) #11
  tail call void @halide_free(i8* %0, i8* nonnull %5) #11
  br label %27

; <label>:27:                                     ; preds = %.predBB2.split2, %.predBB1.split1
  ret i32 -9
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_large_i64(i8*, i8*, i64, i64) local_unnamed_addr #0 {
  %5 = tail call i8* @halide_malloc(i8* %0, i64 1024) #11
  %6 = ptrtoint i8* %5 to i64
  %7 = icmp eq i8* %5, null
  br i1 %7, label %.predBB1.split, label %.predBB2.split

.predBB2.split:                                   ; preds = %4
  %8 = getelementptr inbounds i8, i8* %5, i64 1023
  store i8 0, i8* %8, align 1, !tbaa !11
  %9 = tail call i8* @halide_string_to_string(i8* nonnull %5, i8* nonnull %8, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.146, i64 0, i64 0)) #11
  br label %11

.predBB1.split:                                   ; preds = %4
  %10 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.146, i64 0, i64 0)) #11
  br label %11

; <label>:11:                                     ; preds = %.predBB1.split, %.predBB2.split
  %12 = phi i8* [ null, %.predBB1.split ], [ %8, %.predBB2.split ]
  %phi.call = phi i8* [ %10, %.predBB1.split ], [ %9, %.predBB2.split ]
  %13 = icmp eq i8* %1, null
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %11
  %15 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #11
  br label %18

; <label>:16:                                     ; preds = %11
  %17 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %12, i8* nonnull %1) #11
  br label %18

; <label>:18:                                     ; preds = %16, %14
  %19 = phi i8* [ %17, %16 ], [ %15, %14 ]
  %20 = tail call i8* @halide_string_to_string(i8* %19, i8* %12, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.131, i64 0, i64 0)) #11
  %21 = tail call i8* @halide_int64_to_string(i8* %20, i8* %12, i64 %2, i32 1) #11
  %22 = tail call i8* @halide_string_to_string(i8* %21, i8* %12, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.36.148, i64 0, i64 0)) #11
  %23 = tail call i8* @halide_int64_to_string(i8* %22, i8* %12, i64 %3, i32 1) #11
  br i1 %7, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %18
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #11
  tail call void @halide_free(i8* %0, i8* null) #11
  br label %27

.predBB2.split2:                                  ; preds = %18
  %24 = ptrtoint i8* %23 to i64
  %25 = sub i64 1, %6
  %26 = add i64 %25, %24
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %5, i64 %26) #11
  tail call void @halide_error(i8* %0, i8* nonnull %5) #11
  tail call void @halide_free(i8* %0, i8* nonnull %5) #11
  br label %27

; <label>:27:                                     ; preds = %.predBB2.split2, %.predBB1.split1
  ret i32 -10
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_large_u64(i8*, i8*, i64, i64) local_unnamed_addr #0 {
  %5 = tail call i8* @halide_malloc(i8* %0, i64 1024) #11
  %6 = ptrtoint i8* %5 to i64
  %7 = icmp eq i8* %5, null
  br i1 %7, label %.predBB1.split, label %.predBB2.split

.predBB2.split:                                   ; preds = %4
  %8 = getelementptr inbounds i8, i8* %5, i64 1023
  store i8 0, i8* %8, align 1, !tbaa !11
  %9 = tail call i8* @halide_string_to_string(i8* nonnull %5, i8* nonnull %8, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.146, i64 0, i64 0)) #11
  br label %11

.predBB1.split:                                   ; preds = %4
  %10 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.146, i64 0, i64 0)) #11
  br label %11

; <label>:11:                                     ; preds = %.predBB1.split, %.predBB2.split
  %12 = phi i8* [ null, %.predBB1.split ], [ %8, %.predBB2.split ]
  %phi.call = phi i8* [ %10, %.predBB1.split ], [ %9, %.predBB2.split ]
  %13 = icmp eq i8* %1, null
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %11
  %15 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #11
  br label %18

; <label>:16:                                     ; preds = %11
  %17 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %12, i8* nonnull %1) #11
  br label %18

; <label>:18:                                     ; preds = %16, %14
  %19 = phi i8* [ %17, %16 ], [ %15, %14 ]
  %20 = tail call i8* @halide_string_to_string(i8* %19, i8* %12, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.131, i64 0, i64 0)) #11
  %21 = tail call i8* @halide_uint64_to_string(i8* %20, i8* %12, i64 %2, i32 1) #11
  %22 = tail call i8* @halide_string_to_string(i8* %21, i8* %12, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.36.148, i64 0, i64 0)) #11
  %23 = tail call i8* @halide_uint64_to_string(i8* %22, i8* %12, i64 %3, i32 1) #11
  br i1 %7, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %18
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #11
  tail call void @halide_free(i8* %0, i8* null) #11
  br label %27

.predBB2.split2:                                  ; preds = %18
  %24 = ptrtoint i8* %23 to i64
  %25 = sub i64 1, %6
  %26 = add i64 %25, %24
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %5, i64 %26) #11
  tail call void @halide_error(i8* %0, i8* nonnull %5) #11
  tail call void @halide_free(i8* %0, i8* nonnull %5) #11
  br label %27

; <label>:27:                                     ; preds = %.predBB2.split2, %.predBB1.split1
  ret i32 -10
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_large_f64(i8*, i8*, double, double) local_unnamed_addr #0 {
  %5 = tail call i8* @halide_malloc(i8* %0, i64 1024) #11
  %6 = ptrtoint i8* %5 to i64
  %7 = icmp eq i8* %5, null
  br i1 %7, label %.predBB1.split, label %.predBB2.split

.predBB2.split:                                   ; preds = %4
  %8 = getelementptr inbounds i8, i8* %5, i64 1023
  store i8 0, i8* %8, align 1, !tbaa !11
  %9 = tail call i8* @halide_string_to_string(i8* nonnull %5, i8* nonnull %8, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.146, i64 0, i64 0)) #11
  br label %11

.predBB1.split:                                   ; preds = %4
  %10 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.146, i64 0, i64 0)) #11
  br label %11

; <label>:11:                                     ; preds = %.predBB1.split, %.predBB2.split
  %12 = phi i8* [ null, %.predBB1.split ], [ %8, %.predBB2.split ]
  %phi.call = phi i8* [ %10, %.predBB1.split ], [ %9, %.predBB2.split ]
  %13 = icmp eq i8* %1, null
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %11
  %15 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #11
  br label %18

; <label>:16:                                     ; preds = %11
  %17 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %12, i8* nonnull %1) #11
  br label %18

; <label>:18:                                     ; preds = %16, %14
  %19 = phi i8* [ %17, %16 ], [ %15, %14 ]
  %20 = tail call i8* @halide_string_to_string(i8* %19, i8* %12, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.131, i64 0, i64 0)) #11
  %21 = tail call i8* @halide_double_to_string(i8* %20, i8* %12, double %2, i32 1) #11
  %22 = tail call i8* @halide_string_to_string(i8* %21, i8* %12, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.36.148, i64 0, i64 0)) #11
  %23 = tail call i8* @halide_double_to_string(i8* %22, i8* %12, double %3, i32 1) #11
  br i1 %7, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %18
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #11
  tail call void @halide_free(i8* %0, i8* null) #11
  br label %27

.predBB2.split2:                                  ; preds = %18
  %24 = ptrtoint i8* %23 to i64
  %25 = sub i64 1, %6
  %26 = add i64 %25, %24
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %5, i64 %26) #11
  tail call void @halide_error(i8* %0, i8* nonnull %5) #11
  tail call void @halide_free(i8* %0, i8* nonnull %5) #11
  br label %27

; <label>:27:                                     ; preds = %.predBB2.split2, %.predBB1.split1
  ret i32 -10
}

; Function Attrs: nounwind
define weak i32 @halide_error_out_of_memory(i8*) local_unnamed_addr #0 {
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.37, i64 0, i64 0)) #11
  ret i32 -11
}

; Function Attrs: nounwind
define weak i32 @halide_error_buffer_argument_is_null(i8*, i8*) local_unnamed_addr #0 {
  %3 = tail call i8* @halide_malloc(i8* %0, i64 1024) #11
  %4 = ptrtoint i8* %3 to i64
  %5 = icmp eq i8* %3, null
  br i1 %5, label %.predBB1.split, label %.predBB2.split

.predBB2.split:                                   ; preds = %2
  %6 = getelementptr inbounds i8, i8* %3, i64 1023
  store i8 0, i8* %6, align 1, !tbaa !11
  %7 = tail call i8* @halide_string_to_string(i8* nonnull %3, i8* nonnull %6, i8* nonnull getelementptr inbounds ([17 x i8], [17 x i8]* @.str.38, i64 0, i64 0)) #11
  br label %9

.predBB1.split:                                   ; preds = %2
  %8 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([17 x i8], [17 x i8]* @.str.38, i64 0, i64 0)) #11
  br label %9

; <label>:9:                                      ; preds = %.predBB1.split, %.predBB2.split
  %10 = phi i8* [ null, %.predBB1.split ], [ %6, %.predBB2.split ]
  %phi.call = phi i8* [ %8, %.predBB1.split ], [ %7, %.predBB2.split ]
  %11 = icmp eq i8* %1, null
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %9
  %13 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %10, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #11
  br label %16

; <label>:14:                                     ; preds = %9
  %15 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %10, i8* nonnull %1) #11
  br label %16

; <label>:16:                                     ; preds = %14, %12
  %17 = phi i8* [ %15, %14 ], [ %13, %12 ]
  %18 = tail call i8* @halide_string_to_string(i8* %17, i8* %10, i8* nonnull getelementptr inbounds ([9 x i8], [9 x i8]* @.str.39, i64 0, i64 0)) #11
  br i1 %5, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %16
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #11
  tail call void @halide_free(i8* %0, i8* null) #11
  br label %22

.predBB2.split2:                                  ; preds = %16
  %19 = ptrtoint i8* %18 to i64
  %20 = sub i64 1, %4
  %21 = add i64 %20, %19
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %3, i64 %21) #11
  tail call void @halide_error(i8* %0, i8* nonnull %3) #11
  tail call void @halide_free(i8* %0, i8* nonnull %3) #11
  br label %22

; <label>:22:                                     ; preds = %.predBB2.split2, %.predBB1.split1
  ret i32 -12
}

; Function Attrs: nounwind
define weak i32 @halide_error_debug_to_file_failed(i8*, i8*, i8*, i32) local_unnamed_addr #0 {
  %5 = tail call i8* @halide_malloc(i8* %0, i64 1024) #11
  %6 = ptrtoint i8* %5 to i64
  %7 = icmp eq i8* %5, null
  br i1 %7, label %.predBB1.split, label %.predBB2.split

.predBB2.split:                                   ; preds = %4
  %8 = getelementptr inbounds i8, i8* %5, i64 1023
  store i8 0, i8* %8, align 1, !tbaa !11
  %9 = tail call i8* @halide_string_to_string(i8* nonnull %5, i8* nonnull %8, i8* nonnull getelementptr inbounds ([25 x i8], [25 x i8]* @.str.40, i64 0, i64 0)) #11
  br label %11

.predBB1.split:                                   ; preds = %4
  %10 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([25 x i8], [25 x i8]* @.str.40, i64 0, i64 0)) #11
  br label %11

; <label>:11:                                     ; preds = %.predBB1.split, %.predBB2.split
  %12 = phi i8* [ null, %.predBB1.split ], [ %8, %.predBB2.split ]
  %phi.call = phi i8* [ %10, %.predBB1.split ], [ %9, %.predBB2.split ]
  %13 = icmp eq i8* %1, null
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %11
  %15 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #11
  br label %18

; <label>:16:                                     ; preds = %11
  %17 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %12, i8* nonnull %1) #11
  br label %18

; <label>:18:                                     ; preds = %16, %14
  %19 = phi i8* [ %17, %16 ], [ %15, %14 ]
  %20 = tail call i8* @halide_string_to_string(i8* %19, i8* %12, i8* nonnull getelementptr inbounds ([10 x i8], [10 x i8]* @.str.41, i64 0, i64 0)) #11
  %21 = icmp eq i8* %2, null
  br i1 %21, label %22, label %24

; <label>:22:                                     ; preds = %18
  %23 = tail call i8* @halide_string_to_string(i8* %20, i8* %12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #11
  br label %26

; <label>:24:                                     ; preds = %18
  %25 = tail call i8* @halide_string_to_string(i8* %20, i8* %12, i8* nonnull %2) #11
  br label %26

; <label>:26:                                     ; preds = %24, %22
  %27 = phi i8* [ %25, %24 ], [ %23, %22 ]
  %28 = tail call i8* @halide_string_to_string(i8* %27, i8* %12, i8* nonnull getelementptr inbounds ([13 x i8], [13 x i8]* @.str.42.149, i64 0, i64 0)) #11
  %29 = sext i32 %3 to i64
  %30 = tail call i8* @halide_int64_to_string(i8* %28, i8* %12, i64 %29, i32 1) #11
  br i1 %7, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %26
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #11
  tail call void @halide_free(i8* %0, i8* null) #11
  br label %34

.predBB2.split2:                                  ; preds = %26
  %31 = ptrtoint i8* %30 to i64
  %32 = sub i64 1, %6
  %33 = add i64 %32, %31
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %5, i64 %33) #11
  tail call void @halide_error(i8* %0, i8* nonnull %5) #11
  tail call void @halide_free(i8* %0, i8* nonnull %5) #11
  br label %34

; <label>:34:                                     ; preds = %.predBB2.split2, %.predBB1.split1
  ret i32 -13
}

; Function Attrs: nounwind
define weak i32 @halide_error_failed_to_upgrade_buffer_t(i8*, i8*, i8*) local_unnamed_addr #0 {
  %4 = tail call i8* @halide_malloc(i8* %0, i64 1024) #11
  %5 = ptrtoint i8* %4 to i64
  %6 = icmp eq i8* %4, null
  br i1 %6, label %.predBB1.split, label %.predBB2.split

.predBB2.split:                                   ; preds = %3
  %7 = getelementptr inbounds i8, i8* %4, i64 1023
  store i8 0, i8* %7, align 1, !tbaa !11
  %8 = tail call i8* @halide_string_to_string(i8* nonnull %4, i8* nonnull %7, i8* nonnull getelementptr inbounds ([51 x i8], [51 x i8]* @.str.43, i64 0, i64 0)) #11
  br label %10

.predBB1.split:                                   ; preds = %3
  %9 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([51 x i8], [51 x i8]* @.str.43, i64 0, i64 0)) #11
  br label %10

; <label>:10:                                     ; preds = %.predBB1.split, %.predBB2.split
  %11 = phi i8* [ null, %.predBB1.split ], [ %7, %.predBB2.split ]
  %phi.call = phi i8* [ %9, %.predBB1.split ], [ %8, %.predBB2.split ]
  %12 = icmp eq i8* %1, null
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %10
  %14 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #11
  br label %17

; <label>:15:                                     ; preds = %10
  %16 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* nonnull %1) #11
  br label %17

; <label>:17:                                     ; preds = %15, %13
  %18 = phi i8* [ %16, %15 ], [ %14, %13 ]
  %19 = tail call i8* @halide_string_to_string(i8* %18, i8* %11, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.19.187, i64 0, i64 0)) #11
  %20 = icmp eq i8* %2, null
  br i1 %20, label %21, label %23

; <label>:21:                                     ; preds = %17
  %22 = tail call i8* @halide_string_to_string(i8* %19, i8* %11, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #11
  br label %25

; <label>:23:                                     ; preds = %17
  %24 = tail call i8* @halide_string_to_string(i8* %19, i8* %11, i8* nonnull %2) #11
  br label %25

; <label>:25:                                     ; preds = %23, %21
  %26 = phi i8* [ %24, %23 ], [ %22, %21 ]
  br i1 %6, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %25
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #11
  tail call void @halide_free(i8* %0, i8* null) #11
  br label %30

.predBB2.split2:                                  ; preds = %25
  %27 = ptrtoint i8* %26 to i64
  %28 = sub i64 1, %5
  %29 = add i64 %28, %27
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %4, i64 %29) #11
  tail call void @halide_error(i8* %0, i8* nonnull %4) #11
  tail call void @halide_free(i8* %0, i8* nonnull %4) #11
  br label %30

; <label>:30:                                     ; preds = %.predBB2.split2, %.predBB1.split1
  ret i32 -29
}

; Function Attrs: nounwind
define weak i32 @halide_error_failed_to_downgrade_buffer_t(i8*, i8*, i8*) local_unnamed_addr #0 {
  %4 = tail call i8* @halide_malloc(i8* %0, i64 1024) #11
  %5 = ptrtoint i8* %4 to i64
  %6 = icmp eq i8* %4, null
  br i1 %6, label %.predBB1.split, label %.predBB2.split

.predBB2.split:                                   ; preds = %3
  %7 = getelementptr inbounds i8, i8* %4, i64 1023
  store i8 0, i8* %7, align 1, !tbaa !11
  %8 = tail call i8* @halide_string_to_string(i8* nonnull %4, i8* nonnull %7, i8* nonnull getelementptr inbounds ([53 x i8], [53 x i8]* @.str.45, i64 0, i64 0)) #11
  br label %10

.predBB1.split:                                   ; preds = %3
  %9 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([53 x i8], [53 x i8]* @.str.45, i64 0, i64 0)) #11
  br label %10

; <label>:10:                                     ; preds = %.predBB1.split, %.predBB2.split
  %11 = phi i8* [ null, %.predBB1.split ], [ %7, %.predBB2.split ]
  %phi.call = phi i8* [ %9, %.predBB1.split ], [ %8, %.predBB2.split ]
  %12 = icmp eq i8* %1, null
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %10
  %14 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #11
  br label %17

; <label>:15:                                     ; preds = %10
  %16 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* nonnull %1) #11
  br label %17

; <label>:17:                                     ; preds = %15, %13
  %18 = phi i8* [ %16, %15 ], [ %14, %13 ]
  %19 = tail call i8* @halide_string_to_string(i8* %18, i8* %11, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.19.187, i64 0, i64 0)) #11
  %20 = icmp eq i8* %2, null
  br i1 %20, label %21, label %23

; <label>:21:                                     ; preds = %17
  %22 = tail call i8* @halide_string_to_string(i8* %19, i8* %11, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #11
  br label %25

; <label>:23:                                     ; preds = %17
  %24 = tail call i8* @halide_string_to_string(i8* %19, i8* %11, i8* nonnull %2) #11
  br label %25

; <label>:25:                                     ; preds = %23, %21
  %26 = phi i8* [ %24, %23 ], [ %22, %21 ]
  br i1 %6, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %25
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #11
  tail call void @halide_free(i8* %0, i8* null) #11
  br label %30

.predBB2.split2:                                  ; preds = %25
  %27 = ptrtoint i8* %26 to i64
  %28 = sub i64 1, %5
  %29 = add i64 %28, %27
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %4, i64 %29) #11
  tail call void @halide_error(i8* %0, i8* nonnull %4) #11
  tail call void @halide_free(i8* %0, i8* nonnull %4) #11
  br label %30

; <label>:30:                                     ; preds = %.predBB2.split2, %.predBB1.split1
  ret i32 -30
}

; Function Attrs: nounwind
define weak i32 @halide_error_unaligned_host_ptr(i8*, i8*, i32) local_unnamed_addr #0 {
  %4 = tail call i8* @halide_malloc(i8* %0, i64 1024) #11
  %5 = ptrtoint i8* %4 to i64
  %6 = icmp eq i8* %4, null
  br i1 %6, label %.predBB1.split, label %.predBB2.split

.predBB2.split:                                   ; preds = %3
  %7 = getelementptr inbounds i8, i8* %4, i64 1023
  store i8 0, i8* %7, align 1, !tbaa !11
  %8 = tail call i8* @halide_string_to_string(i8* nonnull %4, i8* nonnull %7, i8* nonnull getelementptr inbounds ([21 x i8], [21 x i8]* @.str.46, i64 0, i64 0)) #11
  br label %10

.predBB1.split:                                   ; preds = %3
  %9 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([21 x i8], [21 x i8]* @.str.46, i64 0, i64 0)) #11
  br label %10

; <label>:10:                                     ; preds = %.predBB1.split, %.predBB2.split
  %11 = phi i8* [ null, %.predBB1.split ], [ %7, %.predBB2.split ]
  %phi.call = phi i8* [ %9, %.predBB1.split ], [ %8, %.predBB2.split ]
  %12 = icmp eq i8* %1, null
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %10
  %14 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #11
  br label %17

; <label>:15:                                     ; preds = %10
  %16 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* nonnull %1) #11
  br label %17

; <label>:17:                                     ; preds = %15, %13
  %18 = phi i8* [ %16, %15 ], [ %14, %13 ]
  %19 = tail call i8* @halide_string_to_string(i8* %18, i8* %11, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.47, i64 0, i64 0)) #11
  %20 = sext i32 %2 to i64
  %21 = tail call i8* @halide_int64_to_string(i8* %19, i8* %11, i64 %20, i32 1) #11
  %22 = tail call i8* @halide_string_to_string(i8* %21, i8* %11, i8* nonnull getelementptr inbounds ([17 x i8], [17 x i8]* @.str.48, i64 0, i64 0)) #11
  br i1 %6, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %17
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #11
  tail call void @halide_free(i8* %0, i8* null) #11
  br label %26

.predBB2.split2:                                  ; preds = %17
  %23 = ptrtoint i8* %22 to i64
  %24 = sub i64 1, %5
  %25 = add i64 %24, %23
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %4, i64 %25) #11
  tail call void @halide_error(i8* %0, i8* nonnull %4) #11
  tail call void @halide_free(i8* %0, i8* nonnull %4) #11
  br label %26

; <label>:26:                                     ; preds = %.predBB2.split2, %.predBB1.split1
  ret i32 -24
}

; Function Attrs: nounwind
define weak i32 @halide_error_host_is_null(i8*, i8*) local_unnamed_addr #0 {
  %3 = tail call i8* @halide_malloc(i8* %0, i64 1024) #11
  %4 = ptrtoint i8* %3 to i64
  %5 = icmp eq i8* %3, null
  br i1 %5, label %.predBB1.split, label %.predBB2.split

.predBB2.split:                                   ; preds = %2
  %6 = getelementptr inbounds i8, i8* %3, i64 1023
  store i8 0, i8* %6, align 1, !tbaa !11
  %7 = tail call i8* @halide_string_to_string(i8* nonnull %3, i8* nonnull %6, i8* nonnull getelementptr inbounds ([21 x i8], [21 x i8]* @.str.46, i64 0, i64 0)) #11
  br label %9

.predBB1.split:                                   ; preds = %2
  %8 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([21 x i8], [21 x i8]* @.str.46, i64 0, i64 0)) #11
  br label %9

; <label>:9:                                      ; preds = %.predBB1.split, %.predBB2.split
  %10 = phi i8* [ null, %.predBB1.split ], [ %6, %.predBB2.split ]
  %phi.call = phi i8* [ %8, %.predBB1.split ], [ %7, %.predBB2.split ]
  %11 = icmp eq i8* %1, null
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %9
  %13 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %10, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #11
  br label %16

; <label>:14:                                     ; preds = %9
  %15 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %10, i8* nonnull %1) #11
  br label %16

; <label>:16:                                     ; preds = %14, %12
  %17 = phi i8* [ %15, %14 ], [ %13, %12 ]
  %18 = tail call i8* @halide_string_to_string(i8* %17, i8* %10, i8* nonnull getelementptr inbounds ([55 x i8], [55 x i8]* @.str.49, i64 0, i64 0)) #11
  br i1 %5, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %16
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #11
  tail call void @halide_free(i8* %0, i8* null) #11
  br label %22

.predBB2.split2:                                  ; preds = %16
  %19 = ptrtoint i8* %18 to i64
  %20 = sub i64 1, %4
  %21 = add i64 %20, %19
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %3, i64 %21) #11
  tail call void @halide_error(i8* %0, i8* nonnull %3) #11
  tail call void @halide_free(i8* %0, i8* nonnull %3) #11
  br label %22

; <label>:22:                                     ; preds = %.predBB2.split2, %.predBB1.split1
  ret i32 -34
}

; Function Attrs: nounwind
define weak i32 @halide_error_bad_fold(i8*, i8*, i8*, i8*) local_unnamed_addr #0 {
  %5 = tail call i8* @halide_malloc(i8* %0, i64 1024) #11
  %6 = ptrtoint i8* %5 to i64
  %7 = icmp eq i8* %5, null
  br i1 %7, label %.predBB1.split, label %.predBB2.split

.predBB2.split:                                   ; preds = %4
  %8 = getelementptr inbounds i8, i8* %5, i64 1023
  store i8 0, i8* %8, align 1, !tbaa !11
  %9 = tail call i8* @halide_string_to_string(i8* nonnull %5, i8* nonnull %8, i8* nonnull getelementptr inbounds ([30 x i8], [30 x i8]* @.str.50, i64 0, i64 0)) #11
  br label %11

.predBB1.split:                                   ; preds = %4
  %10 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([30 x i8], [30 x i8]* @.str.50, i64 0, i64 0)) #11
  br label %11

; <label>:11:                                     ; preds = %.predBB1.split, %.predBB2.split
  %12 = phi i8* [ null, %.predBB1.split ], [ %8, %.predBB2.split ]
  %phi.call = phi i8* [ %10, %.predBB1.split ], [ %9, %.predBB2.split ]
  %13 = icmp eq i8* %2, null
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %11
  %15 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #11
  br label %18

; <label>:16:                                     ; preds = %11
  %17 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %12, i8* nonnull %2) #11
  br label %18

; <label>:18:                                     ; preds = %16, %14
  %19 = phi i8* [ %17, %16 ], [ %15, %14 ]
  %20 = tail call i8* @halide_string_to_string(i8* %19, i8* %12, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.51, i64 0, i64 0)) #11
  %21 = icmp eq i8* %1, null
  br i1 %21, label %22, label %24

; <label>:22:                                     ; preds = %18
  %23 = tail call i8* @halide_string_to_string(i8* %20, i8* %12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #11
  br label %26

; <label>:24:                                     ; preds = %18
  %25 = tail call i8* @halide_string_to_string(i8* %20, i8* %12, i8* nonnull %1) #11
  br label %26

; <label>:26:                                     ; preds = %24, %22
  %27 = phi i8* [ %25, %24 ], [ %23, %22 ]
  %28 = tail call i8* @halide_string_to_string(i8* %27, i8* %12, i8* nonnull getelementptr inbounds ([36 x i8], [36 x i8]* @.str.52, i64 0, i64 0)) #11
  %29 = icmp eq i8* %3, null
  br i1 %29, label %30, label %32

; <label>:30:                                     ; preds = %26
  %31 = tail call i8* @halide_string_to_string(i8* %28, i8* %12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #11
  br label %34

; <label>:32:                                     ; preds = %26
  %33 = tail call i8* @halide_string_to_string(i8* %28, i8* %12, i8* nonnull %3) #11
  br label %34

; <label>:34:                                     ; preds = %32, %30
  %35 = phi i8* [ %33, %32 ], [ %31, %30 ]
  %36 = tail call i8* @halide_string_to_string(i8* %35, i8* %12, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30.142, i64 0, i64 0)) #11
  br i1 %7, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %34
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #11
  tail call void @halide_free(i8* %0, i8* null) #11
  br label %40

.predBB2.split2:                                  ; preds = %34
  %37 = ptrtoint i8* %36 to i64
  %38 = sub i64 1, %6
  %39 = add i64 %38, %37
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %5, i64 %39) #11
  tail call void @halide_error(i8* %0, i8* nonnull %5) #11
  tail call void @halide_free(i8* %0, i8* nonnull %5) #11
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
  %14 = tail call i8* @halide_malloc(i8* %0, i64 1024) #11
  %15 = ptrtoint i8* %14 to i64
  %16 = icmp eq i8* %14, null
  br i1 %16, label %.predBB1.split, label %.predBB2.split

.predBB2.split:                                   ; preds = %13
  %17 = getelementptr inbounds i8, i8* %14, i64 1023
  store i8 0, i8* %17, align 1, !tbaa !11
  %18 = tail call i8* @halide_string_to_string(i8* nonnull %14, i8* nonnull %17, i8* nonnull getelementptr inbounds ([23 x i8], [23 x i8]* @.str.53, i64 0, i64 0)) #11
  br label %20

.predBB1.split:                                   ; preds = %13
  %19 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([23 x i8], [23 x i8]* @.str.53, i64 0, i64 0)) #11
  br label %20

; <label>:20:                                     ; preds = %.predBB1.split, %.predBB2.split
  %21 = phi i8* [ null, %.predBB1.split ], [ %17, %.predBB2.split ]
  %phi.call = phi i8* [ %19, %.predBB1.split ], [ %18, %.predBB2.split ]
  %22 = sext i32 %2 to i64
  %23 = tail call i8* @halide_int64_to_string(i8* %phi.call, i8* %21, i64 %22, i32 1) #11
  %24 = tail call i8* @halide_string_to_string(i8* %23, i8* %21, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.51, i64 0, i64 0)) #11
  %25 = icmp eq i8* %1, null
  br i1 %25, label %26, label %28

; <label>:26:                                     ; preds = %20
  %27 = tail call i8* @halide_string_to_string(i8* %24, i8* %21, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #11
  br label %30

; <label>:28:                                     ; preds = %20
  %29 = tail call i8* @halide_string_to_string(i8* %24, i8* %21, i8* nonnull %1) #11
  br label %30

; <label>:30:                                     ; preds = %28, %26
  %31 = phi i8* [ %29, %28 ], [ %27, %26 ]
  %32 = tail call i8* @halide_string_to_string(i8* %31, i8* %21, i8* nonnull getelementptr inbounds ([36 x i8], [36 x i8]* @.str.54, i64 0, i64 0)) #11
  %33 = sext i32 %3 to i64
  %34 = tail call i8* @halide_int64_to_string(i8* %32, i8* %21, i64 %33, i32 1) #11
  %35 = tail call i8* @halide_string_to_string(i8* %34, i8* %21, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i64 0, i64 0)) #11
  %36 = add nsw i32 %4, %3
  %37 = add nsw i32 %36, -1
  %38 = sext i32 %37 to i64
  %39 = tail call i8* @halide_int64_to_string(i8* %35, i8* %21, i64 %38, i32 1) #11
  %40 = tail call i8* @halide_string_to_string(i8* %39, i8* %21, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.56, i64 0, i64 0)) #11
  %41 = tail call i8* @halide_string_to_string(i8* %40, i8* %21, i8* nonnull getelementptr inbounds ([47 x i8], [47 x i8]* @.str.57.150, i64 0, i64 0)) #11
  %42 = sext i32 %5 to i64
  %43 = tail call i8* @halide_int64_to_string(i8* %41, i8* %21, i64 %42, i32 1) #11
  %44 = tail call i8* @halide_string_to_string(i8* %43, i8* %21, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i64 0, i64 0)) #11
  %45 = add nsw i32 %6, %5
  %46 = add nsw i32 %45, -1
  %47 = sext i32 %46 to i64
  %48 = tail call i8* @halide_int64_to_string(i8* %44, i8* %21, i64 %47, i32 1) #11
  %49 = tail call i8* @halide_string_to_string(i8* %48, i8* %21, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.58.151, i64 0, i64 0)) #11
  br i1 %16, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %30
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #11
  tail call void @halide_free(i8* %0, i8* null) #11
  br label %88

.predBB2.split2:                                  ; preds = %30
  %50 = ptrtoint i8* %49 to i64
  %51 = sub i64 1, %15
  %52 = add i64 %51, %50
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %14, i64 %52) #11
  tail call void @halide_error(i8* %0, i8* nonnull %14) #11
  tail call void @halide_free(i8* %0, i8* nonnull %14) #11
  br label %88

; <label>:53:                                     ; preds = %9
  %54 = tail call i8* @halide_malloc(i8* %0, i64 1024) #11
  %55 = ptrtoint i8* %54 to i64
  %56 = icmp eq i8* %54, null
  br i1 %56, label %.predBB1.split3, label %.predBB2.split4

.predBB2.split4:                                  ; preds = %53
  %57 = getelementptr inbounds i8, i8* %54, i64 1023
  store i8 0, i8* %57, align 1, !tbaa !11
  %58 = tail call i8* @halide_string_to_string(i8* nonnull %54, i8* nonnull %57, i8* nonnull getelementptr inbounds ([23 x i8], [23 x i8]* @.str.53, i64 0, i64 0)) #11
  br label %60

.predBB1.split3:                                  ; preds = %53
  %59 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([23 x i8], [23 x i8]* @.str.53, i64 0, i64 0)) #11
  br label %60

; <label>:60:                                     ; preds = %.predBB1.split3, %.predBB2.split4
  %61 = phi i8* [ null, %.predBB1.split3 ], [ %57, %.predBB2.split4 ]
  %phi.call5 = phi i8* [ %59, %.predBB1.split3 ], [ %58, %.predBB2.split4 ]
  %62 = sext i32 %2 to i64
  %63 = tail call i8* @halide_int64_to_string(i8* %phi.call5, i8* %61, i64 %62, i32 1) #11
  %64 = tail call i8* @halide_string_to_string(i8* %63, i8* %61, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.51, i64 0, i64 0)) #11
  %65 = icmp eq i8* %1, null
  br i1 %65, label %66, label %68

; <label>:66:                                     ; preds = %60
  %67 = tail call i8* @halide_string_to_string(i8* %64, i8* %61, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #11
  br label %70

; <label>:68:                                     ; preds = %60
  %69 = tail call i8* @halide_string_to_string(i8* %64, i8* %61, i8* nonnull %1) #11
  br label %70

; <label>:70:                                     ; preds = %68, %66
  %71 = phi i8* [ %69, %68 ], [ %67, %66 ]
  %72 = tail call i8* @halide_string_to_string(i8* %71, i8* %61, i8* nonnull getelementptr inbounds ([36 x i8], [36 x i8]* @.str.54, i64 0, i64 0)) #11
  %73 = sext i32 %3 to i64
  %74 = tail call i8* @halide_int64_to_string(i8* %72, i8* %61, i64 %73, i32 1) #11
  %75 = tail call i8* @halide_string_to_string(i8* %74, i8* %61, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i64 0, i64 0)) #11
  %76 = add nsw i32 %10, -1
  %77 = sext i32 %76 to i64
  %78 = tail call i8* @halide_int64_to_string(i8* %75, i8* %61, i64 %77, i32 1) #11
  %79 = tail call i8* @halide_string_to_string(i8* %78, i8* %61, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.56, i64 0, i64 0)) #11
  %80 = tail call i8* @halide_string_to_string(i8* %79, i8* %61, i8* nonnull getelementptr inbounds ([47 x i8], [47 x i8]* @.str.59.152, i64 0, i64 0)) #11
  %81 = tail call i8* @halide_string_to_string(i8* %80, i8* %61, i8* nonnull getelementptr inbounds ([30 x i8], [30 x i8]* @.str.60.153, i64 0, i64 0)) #11
  %82 = sext i32 %6 to i64
  %83 = tail call i8* @halide_int64_to_string(i8* %81, i8* %61, i64 %82, i32 1) #11
  %84 = tail call i8* @halide_string_to_string(i8* %83, i8* %61, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30.142, i64 0, i64 0)) #11
  br i1 %56, label %.predBB1.split6, label %.predBB2.split7

.predBB1.split6:                                  ; preds = %70
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #11
  tail call void @halide_free(i8* %0, i8* null) #11
  br label %88

.predBB2.split7:                                  ; preds = %70
  %85 = ptrtoint i8* %84 to i64
  %86 = sub i64 1, %55
  %87 = add i64 %86, %85
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %54, i64 %87) #11
  tail call void @halide_error(i8* %0, i8* nonnull %54) #11
  tail call void @halide_free(i8* %0, i8* nonnull %54) #11
  br label %88

; <label>:88:                                     ; preds = %.predBB2.split7, %.predBB1.split6, %.predBB2.split2, %.predBB1.split1
  ret i32 -35
}

; Function Attrs: nounwind
define weak i32 @halide_error_fold_factor_too_small(i8*, i8*, i8*, i32, i8*, i32) local_unnamed_addr #0 {
  %7 = tail call i8* @halide_malloc(i8* %0, i64 1024) #11
  %8 = ptrtoint i8* %7 to i64
  %9 = icmp eq i8* %7, null
  br i1 %9, label %.predBB1.split, label %.predBB2.split

.predBB2.split:                                   ; preds = %6
  %10 = getelementptr inbounds i8, i8* %7, i64 1023
  store i8 0, i8* %10, align 1, !tbaa !11
  %11 = tail call i8* @halide_string_to_string(i8* nonnull %7, i8* nonnull %10, i8* nonnull getelementptr inbounds ([18 x i8], [18 x i8]* @.str.61.154, i64 0, i64 0)) #11
  br label %13

.predBB1.split:                                   ; preds = %6
  %12 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([18 x i8], [18 x i8]* @.str.61.154, i64 0, i64 0)) #11
  br label %13

; <label>:13:                                     ; preds = %.predBB1.split, %.predBB2.split
  %14 = phi i8* [ null, %.predBB1.split ], [ %10, %.predBB2.split ]
  %phi.call = phi i8* [ %12, %.predBB1.split ], [ %11, %.predBB2.split ]
  %15 = sext i32 %3 to i64
  %16 = tail call i8* @halide_int64_to_string(i8* %phi.call, i8* %14, i64 %15, i32 1) #11
  %17 = tail call i8* @halide_string_to_string(i8* %16, i8* %14, i8* nonnull getelementptr inbounds ([16 x i8], [16 x i8]* @.str.62, i64 0, i64 0)) #11
  %18 = icmp eq i8* %2, null
  br i1 %18, label %19, label %21

; <label>:19:                                     ; preds = %13
  %20 = tail call i8* @halide_string_to_string(i8* %17, i8* %14, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #11
  br label %23

; <label>:21:                                     ; preds = %13
  %22 = tail call i8* @halide_string_to_string(i8* %17, i8* %14, i8* nonnull %2) #11
  br label %23

; <label>:23:                                     ; preds = %21, %19
  %24 = phi i8* [ %22, %21 ], [ %20, %19 ]
  %25 = tail call i8* @halide_string_to_string(i8* %24, i8* %14, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.51, i64 0, i64 0)) #11
  %26 = icmp eq i8* %1, null
  br i1 %26, label %27, label %29

; <label>:27:                                     ; preds = %23
  %28 = tail call i8* @halide_string_to_string(i8* %25, i8* %14, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #11
  br label %31

; <label>:29:                                     ; preds = %23
  %30 = tail call i8* @halide_string_to_string(i8* %25, i8* %14, i8* nonnull %1) #11
  br label %31

; <label>:31:                                     ; preds = %29, %27
  %32 = phi i8* [ %30, %29 ], [ %28, %27 ]
  %33 = tail call i8* @halide_string_to_string(i8* %32, i8* %14, i8* nonnull getelementptr inbounds ([61 x i8], [61 x i8]* @.str.63, i64 0, i64 0)) #11
  %34 = icmp eq i8* %4, null
  br i1 %34, label %35, label %37

; <label>:35:                                     ; preds = %31
  %36 = tail call i8* @halide_string_to_string(i8* %33, i8* %14, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #11
  br label %39

; <label>:37:                                     ; preds = %31
  %38 = tail call i8* @halide_string_to_string(i8* %33, i8* %14, i8* nonnull %4) #11
  br label %39

; <label>:39:                                     ; preds = %37, %35
  %40 = phi i8* [ %38, %37 ], [ %36, %35 ]
  %41 = tail call i8* @halide_string_to_string(i8* %40, i8* %14, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.32.144, i64 0, i64 0)) #11
  %42 = sext i32 %5 to i64
  %43 = tail call i8* @halide_int64_to_string(i8* %41, i8* %14, i64 %42, i32 1) #11
  %44 = tail call i8* @halide_string_to_string(i8* %43, i8* %14, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.64.155, i64 0, i64 0)) #11
  br i1 %9, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %39
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #11
  tail call void @halide_free(i8* %0, i8* null) #11
  br label %48

.predBB2.split2:                                  ; preds = %39
  %45 = ptrtoint i8* %44 to i64
  %46 = sub i64 1, %8
  %47 = add i64 %46, %45
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %7, i64 %47) #11
  tail call void @halide_error(i8* %0, i8* nonnull %7) #11
  tail call void @halide_free(i8* %0, i8* nonnull %7) #11
  br label %48

; <label>:48:                                     ; preds = %.predBB2.split2, %.predBB1.split1
  ret i32 -26
}

; Function Attrs: nounwind
define weak i32 @halide_error_requirement_failed(i8*, i8*, i8*) local_unnamed_addr #0 {
  %4 = tail call i8* @halide_malloc(i8* %0, i64 1024) #11
  %5 = ptrtoint i8* %4 to i64
  %6 = icmp eq i8* %4, null
  br i1 %6, label %.predBB1.split, label %.predBB2.split

.predBB2.split:                                   ; preds = %3
  %7 = getelementptr inbounds i8, i8* %4, i64 1023
  store i8 0, i8* %7, align 1, !tbaa !11
  %8 = tail call i8* @halide_string_to_string(i8* nonnull %4, i8* nonnull %7, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.65, i64 0, i64 0)) #11
  br label %10

.predBB1.split:                                   ; preds = %3
  %9 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.65, i64 0, i64 0)) #11
  br label %10

; <label>:10:                                     ; preds = %.predBB1.split, %.predBB2.split
  %11 = phi i8* [ null, %.predBB1.split ], [ %7, %.predBB2.split ]
  %phi.call = phi i8* [ %9, %.predBB1.split ], [ %8, %.predBB2.split ]
  %12 = icmp eq i8* %1, null
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %10
  %14 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #11
  br label %17

; <label>:15:                                     ; preds = %10
  %16 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* nonnull %1) #11
  br label %17

; <label>:17:                                     ; preds = %15, %13
  %18 = phi i8* [ %16, %15 ], [ %14, %13 ]
  %19 = tail call i8* @halide_string_to_string(i8* %18, i8* %11, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3.167, i64 0, i64 0)) #11
  %20 = icmp eq i8* %2, null
  br i1 %20, label %21, label %23

; <label>:21:                                     ; preds = %17
  %22 = tail call i8* @halide_string_to_string(i8* %19, i8* %11, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #11
  br label %25

; <label>:23:                                     ; preds = %17
  %24 = tail call i8* @halide_string_to_string(i8* %19, i8* %11, i8* nonnull %2) #11
  br label %25

; <label>:25:                                     ; preds = %23, %21
  %26 = phi i8* [ %24, %23 ], [ %22, %21 ]
  br i1 %6, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %25
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #11
  tail call void @halide_free(i8* %0, i8* null) #11
  br label %30

.predBB2.split2:                                  ; preds = %25
  %27 = ptrtoint i8* %26 to i64
  %28 = sub i64 1, %5
  %29 = add i64 %28, %27
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %4, i64 %29) #11
  tail call void @halide_error(i8* %0, i8* nonnull %4) #11
  tail call void @halide_free(i8* %0, i8* nonnull %4) #11
  br label %30

; <label>:30:                                     ; preds = %.predBB2.split2, %.predBB1.split1
  ret i32 -27
}

; Function Attrs: nounwind
define weak i32 @halide_error_specialize_fail(i8*, i8*) local_unnamed_addr #0 {
  %3 = tail call i8* @halide_malloc(i8* %0, i64 1024) #11
  %4 = ptrtoint i8* %3 to i64
  %5 = icmp eq i8* %3, null
  br i1 %5, label %.predBB1.split, label %.predBB2.split

.predBB2.split:                                   ; preds = %2
  %6 = getelementptr inbounds i8, i8* %3, i64 1023
  store i8 0, i8* %6, align 1, !tbaa !11
  %7 = tail call i8* @halide_string_to_string(i8* nonnull %3, i8* nonnull %6, i8* nonnull getelementptr inbounds ([59 x i8], [59 x i8]* @.str.67, i64 0, i64 0)) #11
  br label %9

.predBB1.split:                                   ; preds = %2
  %8 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([59 x i8], [59 x i8]* @.str.67, i64 0, i64 0)) #11
  br label %9

; <label>:9:                                      ; preds = %.predBB1.split, %.predBB2.split
  %10 = phi i8* [ null, %.predBB1.split ], [ %6, %.predBB2.split ]
  %phi.call = phi i8* [ %8, %.predBB1.split ], [ %7, %.predBB2.split ]
  %11 = icmp eq i8* %1, null
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %9
  %13 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %10, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #11
  br label %16

; <label>:14:                                     ; preds = %9
  %15 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %10, i8* nonnull %1) #11
  br label %16

; <label>:16:                                     ; preds = %14, %12
  %17 = phi i8* [ %15, %14 ], [ %13, %12 ]
  br i1 %5, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %16
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #11
  tail call void @halide_free(i8* %0, i8* null) #11
  br label %21

.predBB2.split2:                                  ; preds = %16
  %18 = ptrtoint i8* %17 to i64
  %19 = sub i64 1, %4
  %20 = add i64 %19, %18
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %3, i64 %20) #11
  tail call void @halide_error(i8* %0, i8* nonnull %3) #11
  tail call void @halide_free(i8* %0, i8* nonnull %3) #11
  br label %21

; <label>:21:                                     ; preds = %.predBB2.split2, %.predBB1.split1
  ret i32 -31
}

; Function Attrs: nounwind
define weak i32 @halide_error_no_device_interface(i8*) local_unnamed_addr #0 {
  %2 = tail call i8* @halide_malloc(i8* %0, i64 1024) #11
  %3 = icmp eq i8* %2, null
  br i1 %3, label %.predBB1.split, label %.predBB2.split

.predBB1.split:                                   ; preds = %1
  %4 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([55 x i8], [55 x i8]* @.str.68, i64 0, i64 0)) #11
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #11
  tail call void @halide_free(i8* %0, i8* null) #11
  br label %11

.predBB2.split:                                   ; preds = %1
  %5 = ptrtoint i8* %2 to i64
  %6 = getelementptr inbounds i8, i8* %2, i64 1023
  store i8 0, i8* %6, align 1, !tbaa !11
  %7 = tail call i8* @halide_string_to_string(i8* nonnull %2, i8* nonnull %6, i8* nonnull getelementptr inbounds ([55 x i8], [55 x i8]* @.str.68, i64 0, i64 0)) #11
  %8 = ptrtoint i8* %7 to i64
  %9 = sub i64 1, %5
  %10 = add i64 %9, %8
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %2, i64 %10) #11
  tail call void @halide_error(i8* %0, i8* nonnull %2) #11
  tail call void @halide_free(i8* %0, i8* nonnull %2) #11
  br label %11

; <label>:11:                                     ; preds = %.predBB2.split, %.predBB1.split
  ret i32 -19
}

; Function Attrs: nounwind
define weak i32 @halide_error_device_interface_no_device(i8*) local_unnamed_addr #0 {
  %2 = tail call i8* @halide_malloc(i8* %0, i64 1024) #11
  %3 = icmp eq i8* %2, null
  br i1 %3, label %.predBB1.split, label %.predBB2.split

.predBB1.split:                                   ; preds = %1
  %4 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([56 x i8], [56 x i8]* @.str.69, i64 0, i64 0)) #11
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #11
  tail call void @halide_free(i8* %0, i8* null) #11
  br label %11

.predBB2.split:                                   ; preds = %1
  %5 = ptrtoint i8* %2 to i64
  %6 = getelementptr inbounds i8, i8* %2, i64 1023
  store i8 0, i8* %6, align 1, !tbaa !11
  %7 = tail call i8* @halide_string_to_string(i8* nonnull %2, i8* nonnull %6, i8* nonnull getelementptr inbounds ([56 x i8], [56 x i8]* @.str.69, i64 0, i64 0)) #11
  %8 = ptrtoint i8* %7 to i64
  %9 = sub i64 1, %5
  %10 = add i64 %9, %8
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %2, i64 %10) #11
  tail call void @halide_error(i8* %0, i8* nonnull %2) #11
  tail call void @halide_free(i8* %0, i8* nonnull %2) #11
  br label %11

; <label>:11:                                     ; preds = %.predBB2.split, %.predBB1.split
  ret i32 -36
}

; Function Attrs: nounwind
define weak i32 @halide_error_host_and_device_dirty(i8*) local_unnamed_addr #0 {
  %2 = tail call i8* @halide_malloc(i8* %0, i64 1024) #11
  %3 = icmp eq i8* %2, null
  br i1 %3, label %.predBB1.split, label %.predBB2.split

.predBB1.split:                                   ; preds = %1
  %4 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([49 x i8], [49 x i8]* @.str.70, i64 0, i64 0)) #11
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #11
  tail call void @halide_free(i8* %0, i8* null) #11
  br label %11

.predBB2.split:                                   ; preds = %1
  %5 = ptrtoint i8* %2 to i64
  %6 = getelementptr inbounds i8, i8* %2, i64 1023
  store i8 0, i8* %6, align 1, !tbaa !11
  %7 = tail call i8* @halide_string_to_string(i8* nonnull %2, i8* nonnull %6, i8* nonnull getelementptr inbounds ([49 x i8], [49 x i8]* @.str.70, i64 0, i64 0)) #11
  %8 = ptrtoint i8* %7 to i64
  %9 = sub i64 1, %5
  %10 = add i64 %9, %8
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %2, i64 %10) #11
  tail call void @halide_error(i8* %0, i8* nonnull %2) #11
  tail call void @halide_free(i8* %0, i8* nonnull %2) #11
  br label %11

; <label>:11:                                     ; preds = %.predBB2.split, %.predBB1.split
  ret i32 -37
}

; Function Attrs: nounwind
define weak i32 @halide_error_buffer_is_null(i8*, i8*) local_unnamed_addr #0 {
  %3 = tail call i8* @halide_malloc(i8* %0, i64 1024) #11
  %4 = ptrtoint i8* %3 to i64
  %5 = icmp eq i8* %3, null
  br i1 %5, label %.predBB1.split, label %.predBB2.split

.predBB2.split:                                   ; preds = %2
  %6 = getelementptr inbounds i8, i8* %3, i64 1023
  store i8 0, i8* %6, align 1, !tbaa !11
  %7 = tail call i8* @halide_string_to_string(i8* nonnull %3, i8* nonnull %6, i8* nonnull getelementptr inbounds ([26 x i8], [26 x i8]* @.str.71, i64 0, i64 0)) #11
  br label %9

.predBB1.split:                                   ; preds = %2
  %8 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([26 x i8], [26 x i8]* @.str.71, i64 0, i64 0)) #11
  br label %9

; <label>:9:                                      ; preds = %.predBB1.split, %.predBB2.split
  %10 = phi i8* [ null, %.predBB1.split ], [ %6, %.predBB2.split ]
  %phi.call = phi i8* [ %8, %.predBB1.split ], [ %7, %.predBB2.split ]
  %11 = icmp eq i8* %1, null
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %9
  %13 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %10, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #11
  br label %16

; <label>:14:                                     ; preds = %9
  %15 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %10, i8* nonnull %1) #11
  br label %16

; <label>:16:                                     ; preds = %14, %12
  %17 = phi i8* [ %15, %14 ], [ %13, %12 ]
  %18 = tail call i8* @halide_string_to_string(i8* %17, i8* %10, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.72, i64 0, i64 0)) #11
  br i1 %5, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %16
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #11
  tail call void @halide_free(i8* %0, i8* null) #11
  br label %22

.predBB2.split2:                                  ; preds = %16
  %19 = ptrtoint i8* %18 to i64
  %20 = sub i64 1, %4
  %21 = add i64 %20, %19
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %3, i64 %21) #11
  tail call void @halide_error(i8* %0, i8* nonnull %3) #11
  tail call void @halide_free(i8* %0, i8* nonnull %3) #11
  br label %22

; <label>:22:                                     ; preds = %.predBB2.split2, %.predBB1.split1
  ret i32 -38
}

; Function Attrs: nounwind
define weak i32 @halide_error_integer_division_by_zero(i8*) local_unnamed_addr #0 {
  %2 = tail call i8* @halide_malloc(i8* %0, i64 1024) #11
  %3 = icmp eq i8* %2, null
  br i1 %3, label %.predBB1.split, label %.predBB2.split

.predBB1.split:                                   ; preds = %1
  %4 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([37 x i8], [37 x i8]* @.str.73, i64 0, i64 0)) #11
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #11
  tail call void @halide_free(i8* %0, i8* null) #11
  br label %11

.predBB2.split:                                   ; preds = %1
  %5 = ptrtoint i8* %2 to i64
  %6 = getelementptr inbounds i8, i8* %2, i64 1023
  store i8 0, i8* %6, align 1, !tbaa !11
  %7 = tail call i8* @halide_string_to_string(i8* nonnull %2, i8* nonnull %6, i8* nonnull getelementptr inbounds ([37 x i8], [37 x i8]* @.str.73, i64 0, i64 0)) #11
  %8 = ptrtoint i8* %7 to i64
  %9 = sub i64 1, %5
  %10 = add i64 %9, %8
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %2, i64 %10) #11
  tail call void @halide_error(i8* %0, i8* nonnull %2) #11
  tail call void @halide_free(i8* %0, i8* nonnull %2) #11
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
  %30 = tail call i32 @halide_error_failed_to_upgrade_buffer_t(i8* %0, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.164, i64 0, i64 0), i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.1.165, i64 0, i64 0)) #11
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
  %28 = tail call i8* @halide_malloc(i8* %0, i64 1024) #11
  %29 = ptrtoint i8* %28 to i64
  %30 = icmp eq i8* %28, null
  br i1 %30, label %.predBB1.split, label %.predBB2.split

.predBB2.split:                                   ; preds = %27
  %31 = getelementptr inbounds i8, i8* %28, i64 1023
  store i8 0, i8* %31, align 1, !tbaa !11
  %32 = tail call i8* @halide_string_to_string(i8* nonnull %28, i8* nonnull %31, i8* nonnull getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.166, i64 0, i64 0)) #11
  br label %34

.predBB1.split:                                   ; preds = %27
  %33 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.166, i64 0, i64 0)) #11
  br label %34

; <label>:34:                                     ; preds = %.predBB1.split, %.predBB2.split
  %35 = phi i8* [ null, %.predBB1.split ], [ %31, %.predBB2.split ]
  %phi.call = phi i8* [ %33, %.predBB1.split ], [ %32, %.predBB2.split ]
  %36 = load i32, i32* %18, align 8, !tbaa !201
  %37 = sext i32 %36 to i64
  %38 = tail call i8* @halide_int64_to_string(i8* %phi.call, i8* %35, i64 %37, i32 1) #11
  %39 = tail call i8* @halide_string_to_string(i8* %38, i8* %35, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3.167, i64 0, i64 0)) #11
  %40 = tail call i8* @halide_string_to_string(i8* %39, i8* %35, i8* nonnull getelementptr inbounds ([20 x i8], [20 x i8]* @.str.4.168, i64 0, i64 0)) #11
  %41 = tail call i8* @halide_type_to_string(i8* %40, i8* %35, %struct.halide_type_t* nonnull %20) #11
  %42 = tail call i8* @halide_string_to_string(i8* %41, i8* %35, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5.169, i64 0, i64 0)) #11
  br i1 %30, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %34
  %43 = tail call i32 @halide_error_failed_to_upgrade_buffer_t(i8* %0, i8* %1, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #11
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #11
  tail call void @halide_free(i8* %0, i8* null) #11
  br label %104

.predBB2.split2:                                  ; preds = %34
  %44 = ptrtoint i8* %42 to i64
  %45 = sub i64 1, %29
  %46 = add i64 %45, %44
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %28, i64 %46) #11
  %47 = tail call i32 @halide_error_failed_to_upgrade_buffer_t(i8* %0, i8* %1, i8* nonnull %28) #11
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %28, i64 %46) #11
  tail call void @halide_free(i8* %0, i8* nonnull %28) #11
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
  %55 = tail call i32 @halide_error_failed_to_upgrade_buffer_t(i8* %0, i8* %1, i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str.6.171, i64 0, i64 0)) #11
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
  %6 = tail call i8* @memset(i8* %5, i32 0, i64 72) #11
  %7 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %2, i64 0, i32 5
  %8 = load i32, i32* %7, align 4, !tbaa !134
  %9 = icmp sgt i32 %8, 4
  br i1 %9, label %10, label %12

; <label>:10:                                     ; preds = %4
  %11 = tail call i32 @halide_error_failed_to_downgrade_buffer_t(i8* %0, i8* %1, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.7.172, i64 0, i64 0)) #11
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
  %28 = tail call i32 @halide_downgrade_buffer_t_device_fields(i8* %0, i8* %1, %struct.halide_buffer_t* nonnull %2, %struct.buffer_t* nonnull %3) #12
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
  %30 = tail call i8* @malloc(i64 16) #11
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
  tail call void @free(i8* %37) #11
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
  call void @llvm.lifetime.start.p0i8(i64 56, i8* nonnull %5) #9
  %6 = bitcast [4 x %struct.halide_dimension_t]* %4 to i8*
  %7 = bitcast %struct.halide_buffer_t* %3 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %7, i8 0, i64 56, i32 8, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %6) #9
  %8 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %4, i64 0, i64 0
  %9 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 6
  %10 = bitcast [4 x %struct.halide_dimension_t]* %4 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %10, i8 0, i64 64, i32 4, i1 false)
  store %struct.halide_dimension_t* %8, %struct.halide_dimension_t** %9, align 8, !tbaa !136
  %11 = call i32 @_ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t(i8* %0, %struct.buffer_t* %1, %struct.halide_buffer_t* nonnull %3) #12
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %23

; <label>:13:                                     ; preds = %2
  %14 = call i32 @halide_upgrade_buffer_t(i8* %0, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.164, i64 0, i64 0), %struct.buffer_t* %1, %struct.halide_buffer_t* nonnull %3, i32 0) #12
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %23

; <label>:16:                                     ; preds = %13
  %17 = call i32 @halide_copy_to_host(i8* %0, %struct.halide_buffer_t* nonnull %3) #11
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %23

; <label>:19:                                     ; preds = %16
  %20 = call i32 @halide_downgrade_buffer_t_device_fields(i8* %0, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.164, i64 0, i64 0), %struct.halide_buffer_t* nonnull %3, %struct.buffer_t* %1) #12
  %21 = icmp ne i32 %20, 0
  %22 = zext i1 %21 to i32
  br label %23

; <label>:23:                                     ; preds = %19, %16, %13, %2
  %24 = phi i32 [ 1, %16 ], [ %22, %19 ], [ 1, %13 ], [ 1, %2 ]
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %6) #9
  call void @llvm.lifetime.end.p0i8(i64 56, i8* nonnull %5) #9
  ret i32 %24
}

; Function Attrs: nounwind
define weak i32 @halide_copy_to_device_legacy(i8*, %struct.buffer_t*, %struct.halide_device_interface_t*) local_unnamed_addr #0 {
  %4 = alloca %struct.halide_buffer_t, align 8
  %5 = alloca [4 x %struct.halide_dimension_t], align 4
  %6 = bitcast %struct.halide_buffer_t* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 56, i8* nonnull %6) #9
  %7 = bitcast [4 x %struct.halide_dimension_t]* %5 to i8*
  %8 = bitcast %struct.halide_buffer_t* %4 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %8, i8 0, i64 56, i32 8, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %7) #9
  %9 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, i64 0
  %10 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %4, i64 0, i32 6
  %11 = bitcast [4 x %struct.halide_dimension_t]* %5 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %11, i8 0, i64 64, i32 4, i1 false)
  store %struct.halide_dimension_t* %9, %struct.halide_dimension_t** %10, align 8, !tbaa !136
  %12 = call i32 @_ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t(i8* %0, %struct.buffer_t* %1, %struct.halide_buffer_t* nonnull %4) #12
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %24

; <label>:14:                                     ; preds = %3
  %15 = call i32 @halide_upgrade_buffer_t(i8* %0, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.164, i64 0, i64 0), %struct.buffer_t* %1, %struct.halide_buffer_t* nonnull %4, i32 0) #12
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %24

; <label>:17:                                     ; preds = %14
  %18 = call i32 @halide_copy_to_device(i8* %0, %struct.halide_buffer_t* nonnull %4, %struct.halide_device_interface_t* %2) #11
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %24

; <label>:20:                                     ; preds = %17
  %21 = call i32 @halide_downgrade_buffer_t_device_fields(i8* %0, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.164, i64 0, i64 0), %struct.halide_buffer_t* nonnull %4, %struct.buffer_t* %1) #12
  %22 = icmp ne i32 %21, 0
  %23 = zext i1 %22 to i32
  br label %24

; <label>:24:                                     ; preds = %20, %17, %14, %3
  %25 = phi i32 [ 1, %17 ], [ %23, %20 ], [ 1, %14 ], [ 1, %3 ]
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %7) #9
  call void @llvm.lifetime.end.p0i8(i64 56, i8* nonnull %6) #9
  ret i32 %25
}

; Function Attrs: nounwind
define weak i32 @halide_device_sync_legacy(i8*, %struct.buffer_t*) local_unnamed_addr #0 {
  %3 = alloca %struct.halide_buffer_t, align 8
  %4 = alloca [4 x %struct.halide_dimension_t], align 4
  %5 = bitcast %struct.halide_buffer_t* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 56, i8* nonnull %5) #9
  %6 = bitcast [4 x %struct.halide_dimension_t]* %4 to i8*
  %7 = bitcast %struct.halide_buffer_t* %3 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %7, i8 0, i64 56, i32 8, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %6) #9
  %8 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %4, i64 0, i64 0
  %9 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 6
  %10 = bitcast [4 x %struct.halide_dimension_t]* %4 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %10, i8 0, i64 64, i32 4, i1 false)
  store %struct.halide_dimension_t* %8, %struct.halide_dimension_t** %9, align 8, !tbaa !136
  %11 = call i32 @_ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t(i8* %0, %struct.buffer_t* %1, %struct.halide_buffer_t* nonnull %3) #12
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %23

; <label>:13:                                     ; preds = %2
  %14 = call i32 @halide_upgrade_buffer_t(i8* %0, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.164, i64 0, i64 0), %struct.buffer_t* %1, %struct.halide_buffer_t* nonnull %3, i32 0) #12
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %23

; <label>:16:                                     ; preds = %13
  %17 = call i32 @halide_device_sync(i8* %0, %struct.halide_buffer_t* nonnull %3) #11
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %23

; <label>:19:                                     ; preds = %16
  %20 = call i32 @halide_downgrade_buffer_t_device_fields(i8* %0, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.164, i64 0, i64 0), %struct.halide_buffer_t* nonnull %3, %struct.buffer_t* %1) #12
  %21 = icmp ne i32 %20, 0
  %22 = zext i1 %21 to i32
  br label %23

; <label>:23:                                     ; preds = %19, %16, %13, %2
  %24 = phi i32 [ 1, %16 ], [ %22, %19 ], [ 1, %13 ], [ 1, %2 ]
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %6) #9
  call void @llvm.lifetime.end.p0i8(i64 56, i8* nonnull %5) #9
  ret i32 %24
}

; Function Attrs: nounwind
define weak i32 @halide_device_malloc_legacy(i8*, %struct.buffer_t*, %struct.halide_device_interface_t*) local_unnamed_addr #0 {
  %4 = alloca %struct.halide_buffer_t, align 8
  %5 = alloca [4 x %struct.halide_dimension_t], align 4
  %6 = bitcast %struct.halide_buffer_t* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 56, i8* nonnull %6) #9
  %7 = bitcast [4 x %struct.halide_dimension_t]* %5 to i8*
  %8 = bitcast %struct.halide_buffer_t* %4 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %8, i8 0, i64 56, i32 8, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %7) #9
  %9 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, i64 0
  %10 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %4, i64 0, i32 6
  %11 = bitcast [4 x %struct.halide_dimension_t]* %5 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %11, i8 0, i64 64, i32 4, i1 false)
  store %struct.halide_dimension_t* %9, %struct.halide_dimension_t** %10, align 8, !tbaa !136
  %12 = call i32 @_ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t(i8* %0, %struct.buffer_t* %1, %struct.halide_buffer_t* nonnull %4) #12
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %24

; <label>:14:                                     ; preds = %3
  %15 = call i32 @halide_upgrade_buffer_t(i8* %0, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.164, i64 0, i64 0), %struct.buffer_t* %1, %struct.halide_buffer_t* nonnull %4, i32 0) #12
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %24

; <label>:17:                                     ; preds = %14
  %18 = call i32 @halide_device_malloc(i8* %0, %struct.halide_buffer_t* nonnull %4, %struct.halide_device_interface_t* %2) #11
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %24

; <label>:20:                                     ; preds = %17
  %21 = call i32 @halide_downgrade_buffer_t_device_fields(i8* %0, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.164, i64 0, i64 0), %struct.halide_buffer_t* nonnull %4, %struct.buffer_t* %1) #12
  %22 = icmp ne i32 %21, 0
  %23 = zext i1 %22 to i32
  br label %24

; <label>:24:                                     ; preds = %20, %17, %14, %3
  %25 = phi i32 [ 1, %17 ], [ %23, %20 ], [ 1, %14 ], [ 1, %3 ]
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %7) #9
  call void @llvm.lifetime.end.p0i8(i64 56, i8* nonnull %6) #9
  ret i32 %25
}

; Function Attrs: nounwind
define weak i32 @halide_device_free_legacy(i8*, %struct.buffer_t*) local_unnamed_addr #0 {
  %3 = alloca %struct.halide_buffer_t, align 8
  %4 = alloca [4 x %struct.halide_dimension_t], align 4
  %5 = bitcast %struct.halide_buffer_t* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 56, i8* nonnull %5) #9
  %6 = bitcast [4 x %struct.halide_dimension_t]* %4 to i8*
  %7 = bitcast %struct.halide_buffer_t* %3 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %7, i8 0, i64 56, i32 8, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %6) #9
  %8 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %4, i64 0, i64 0
  %9 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 6
  %10 = bitcast [4 x %struct.halide_dimension_t]* %4 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %10, i8 0, i64 64, i32 4, i1 false)
  store %struct.halide_dimension_t* %8, %struct.halide_dimension_t** %9, align 8, !tbaa !136
  %11 = call i32 @_ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t(i8* %0, %struct.buffer_t* %1, %struct.halide_buffer_t* nonnull %3) #12
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %23

; <label>:13:                                     ; preds = %2
  %14 = call i32 @halide_upgrade_buffer_t(i8* %0, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.164, i64 0, i64 0), %struct.buffer_t* %1, %struct.halide_buffer_t* nonnull %3, i32 0) #12
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %23

; <label>:16:                                     ; preds = %13
  %17 = call i32 @halide_device_free(i8* %0, %struct.halide_buffer_t* nonnull %3) #11
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %23

; <label>:19:                                     ; preds = %16
  %20 = call i32 @halide_downgrade_buffer_t_device_fields(i8* %0, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.164, i64 0, i64 0), %struct.halide_buffer_t* nonnull %3, %struct.buffer_t* %1) #12
  %21 = icmp ne i32 %20, 0
  %22 = zext i1 %21 to i32
  br label %23

; <label>:23:                                     ; preds = %19, %16, %13, %2
  %24 = phi i32 [ 1, %16 ], [ %22, %19 ], [ 1, %13 ], [ 1, %2 ]
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %6) #9
  call void @llvm.lifetime.end.p0i8(i64 56, i8* nonnull %5) #9
  ret i32 %24
}

; Function Attrs: nounwind
define weak void @halide_profiler_shutdown() #0 {
  %1 = tail call %struct.halide_profiler_state* @halide_profiler_get_state() #12
  %2 = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %1, i64 0, i32 7
  %3 = load %struct.halide_thread*, %struct.halide_thread** %2, align 8, !tbaa !210
  %4 = icmp eq %struct.halide_thread* %3, null
  br i1 %4, label %7, label %5

; <label>:5:                                      ; preds = %0
  %6 = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %1, i64 0, i32 3
  store i32 -2, i32* %6, align 8, !tbaa !212
  tail call void @halide_join_thread(%struct.halide_thread* nonnull %3) #11
  store %struct.halide_thread* null, %struct.halide_thread** %2, align 8, !tbaa !210
  store i32 -1, i32* %6, align 8, !tbaa !212
  tail call void @halide_profiler_report_unlocked(i8* null, %struct.halide_profiler_state* %1) #12
  tail call void @halide_profiler_reset_unlocked(%struct.halide_profiler_state* %1) #12
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
  call void @llvm.lifetime.start.p0i8(i64 1024, i8* nonnull %4) #9
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
  call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %4, i64 %12) #11
  call void @llvm.lifetime.end.p0i8(i64 1024, i8* nonnull %4) #9
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
  %34 = call i8* @halide_string_to_string(i8* nonnull %4, i8* nonnull %6, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #11
  br label %37

; <label>:35:                                     ; preds = %23
  %36 = call i8* @halide_string_to_string(i8* nonnull %4, i8* nonnull %6, i8* nonnull %31) #11
  br label %37

; <label>:37:                                     ; preds = %35, %33
  %38 = phi i8* [ %36, %35 ], [ %34, %33 ]
  %39 = call i8* @halide_string_to_string(i8* %38, i8* nonnull %6, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7.175, i64 0, i64 0)) #11
  %40 = call i8* @halide_string_to_string(i8* %39, i8* nonnull %6, i8* nonnull getelementptr inbounds ([14 x i8], [14 x i8]* @.str.8.176, i64 0, i64 0)) #11
  %41 = fpext float %19 to double
  %42 = call i8* @halide_double_to_string(i8* %40, i8* nonnull %6, double %41, i32 0) #11
  %43 = call i8* @halide_string_to_string(i8* %42, i8* nonnull %6, i8* nonnull getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9.177, i64 0, i64 0)) #11
  %44 = call i8* @halide_string_to_string(i8* %43, i8* nonnull %6, i8* nonnull getelementptr inbounds ([12 x i8], [12 x i8]* @.str.10.178, i64 0, i64 0)) #11
  %45 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %14, i64 0, i32 12
  %46 = load i32, i32* %45, align 4, !tbaa !219
  %47 = sext i32 %46 to i64
  %48 = call i8* @halide_int64_to_string(i8* %44, i8* nonnull %6, i64 %47, i32 1) #11
  %49 = call i8* @halide_string_to_string(i8* %48, i8* nonnull %6, i8* nonnull getelementptr inbounds ([9 x i8], [9 x i8]* @.str.11.179, i64 0, i64 0)) #11
  %50 = load i32, i32* %20, align 8, !tbaa !215
  %51 = sext i32 %50 to i64
  %52 = call i8* @halide_int64_to_string(i8* %49, i8* nonnull %6, i64 %51, i32 1) #11
  %53 = call i8* @halide_string_to_string(i8* %52, i8* nonnull %6, i8* nonnull getelementptr inbounds ([13 x i8], [13 x i8]* @.str.12.180, i64 0, i64 0)) #11
  %54 = load i32, i32* %20, align 8, !tbaa !215
  %55 = sitofp i32 %54 to float
  %56 = fdiv float %19, %55
  %57 = fpext float %56 to double
  %58 = call i8* @halide_double_to_string(i8* %53, i8* nonnull %6, double %57, i32 0) #11
  %59 = call i8* @halide_string_to_string(i8* %58, i8* nonnull %6, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.13.181, i64 0, i64 0)) #11
  br i1 %29, label %70, label %60

; <label>:60:                                     ; preds = %37
  %61 = uitofp i64 %26 to double
  %62 = uitofp i64 %28 to double
  %63 = fadd double %62, 1.000000e-10
  %64 = fdiv double %61, %63
  %65 = fptrunc double %64 to float
  %66 = call i8* @halide_string_to_string(i8* %59, i8* nonnull %6, i8* nonnull getelementptr inbounds ([24 x i8], [24 x i8]* @.str.14.182, i64 0, i64 0)) #11
  %67 = fpext float %65 to double
  %68 = call i8* @halide_double_to_string(i8* %66, i8* nonnull %6, double %67, i32 0) #11
  %69 = call i8* @halide_string_to_string(i8* %68, i8* nonnull %6, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7.175, i64 0, i64 0)) #11
  br label %70

; <label>:70:                                     ; preds = %60, %37
  %71 = phi i8* [ %59, %37 ], [ %69, %60 ]
  %72 = call i8* @halide_string_to_string(i8* %71, i8* nonnull %6, i8* nonnull getelementptr inbounds ([20 x i8], [20 x i8]* @.str.15.183, i64 0, i64 0)) #11
  %73 = load i32, i32* %24, align 8, !tbaa !220
  %74 = sext i32 %73 to i64
  %75 = call i8* @halide_int64_to_string(i8* %72, i8* nonnull %6, i64 %74, i32 1) #11
  %76 = call i8* @halide_string_to_string(i8* %75, i8* nonnull %6, i8* nonnull getelementptr inbounds ([20 x i8], [20 x i8]* @.str.16.184, i64 0, i64 0)) #11
  %77 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %14, i64 0, i32 2
  %78 = load i64, i64* %77, align 8, !tbaa !221
  %79 = call i8* @halide_uint64_to_string(i8* %76, i8* nonnull %6, i64 %78, i32 1) #11
  %80 = call i8* @halide_string_to_string(i8* %79, i8* nonnull %6, i8* nonnull getelementptr inbounds ([8 x i8], [8 x i8]* @.str.17.185, i64 0, i64 0)) #11
  %81 = ptrtoint i8* %80 to i64
  %82 = add i64 %10, %81
  call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %4, i64 %82) #11
  call void @halide_print(i8* %0, i8* nonnull %4) #11
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
  %121 = call i8* @halide_string_to_string(i8* nonnull %4, i8* nonnull %6, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.18.186, i64 0, i64 0)) #11
  %122 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %113, i64 %112, i32 7
  %123 = load i8*, i8** %122, align 8, !tbaa !228
  %124 = icmp eq i8* %123, null
  br i1 %124, label %125, label %127

; <label>:125:                                    ; preds = %120
  %126 = call i8* @halide_string_to_string(i8* %121, i8* nonnull %6, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #11
  br label %129

; <label>:127:                                    ; preds = %120
  %128 = call i8* @halide_string_to_string(i8* %121, i8* nonnull %6, i8* nonnull %123) #11
  br label %129

; <label>:129:                                    ; preds = %127, %125
  %130 = phi i8* [ %128, %127 ], [ %126, %125 ]
  %131 = call i8* @halide_string_to_string(i8* %130, i8* nonnull %6, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.19.187, i64 0, i64 0)) #11
  %132 = ptrtoint i8* %131 to i64
  %133 = sub i64 %132, %5
  %134 = icmp ult i64 %133, 25
  br i1 %134, label %.preheader51, label %.loopexit5

.preheader51:                                     ; preds = %129
  br label %135

; <label>:135:                                    ; preds = %135, %.preheader51
  %136 = phi i8* [ %137, %135 ], [ %131, %.preheader51 ]
  %137 = call i8* @halide_string_to_string(i8* %136, i8* nonnull %6, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.20.188, i64 0, i64 0)) #11
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
  %150 = call i8* @halide_double_to_string(i8* %141, i8* nonnull %6, double %149, i32 0) #11
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
  %158 = call i8* @halide_string_to_string(i8* %157, i8* nonnull %6, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.21.189, i64 0, i64 0)) #11
  %159 = ptrtoint i8* %158 to i64
  %160 = sub i64 %159, %5
  %161 = icmp ult i64 %160, 35
  br i1 %161, label %.preheader50, label %.loopexit4

.preheader50:                                     ; preds = %156
  br label %162

; <label>:162:                                    ; preds = %162, %.preheader50
  %163 = phi i8* [ %164, %162 ], [ %158, %.preheader50 ]
  %164 = call i8* @halide_string_to_string(i8* %163, i8* nonnull %6, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.20.188, i64 0, i64 0)) #11
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
  %177 = call i8* @halide_string_to_string(i8* %168, i8* nonnull %6, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.22.190, i64 0, i64 0)) #11
  %178 = shl i64 %176, 32
  %179 = ashr exact i64 %178, 32
  %180 = call i8* @halide_int64_to_string(i8* %177, i8* nonnull %6, i64 %179, i32 1) #11
  %181 = call i8* @halide_string_to_string(i8* %180, i8* nonnull %6, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.23.191, i64 0, i64 0)) #11
  %182 = ptrtoint i8* %181 to i64
  %183 = sub i64 %182, %5
  %184 = icmp ult i64 %183, 43
  br i1 %184, label %.preheader49, label %.loopexit3

.preheader49:                                     ; preds = %175
  br label %185

; <label>:185:                                    ; preds = %185, %.preheader49
  %186 = phi i8* [ %187, %185 ], [ %181, %.preheader49 ]
  %187 = call i8* @halide_string_to_string(i8* %186, i8* nonnull %6, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.20.188, i64 0, i64 0)) #11
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
  %204 = call i8* @halide_string_to_string(i8* %192, i8* nonnull %6, i8* nonnull getelementptr inbounds ([10 x i8], [10 x i8]* @.str.24.192, i64 0, i64 0)) #11
  %205 = fpext float %203 to double
  %206 = call i8* @halide_double_to_string(i8* %204, i8* nonnull %6, double %205, i32 0) #11
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
  %219 = call i8* @halide_string_to_string(i8* %218, i8* nonnull %6, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.20.188, i64 0, i64 0)) #11
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
  %241 = call i8* @halide_string_to_string(i8* %240, i8* nonnull %6, i8* nonnull getelementptr inbounds ([8 x i8], [8 x i8]* @.str.25.193, i64 0, i64 0)) #11
  %242 = load i64, i64* %236, align 8, !tbaa !233
  %243 = call i8* @halide_uint64_to_string(i8* %241, i8* nonnull %6, i64 %242, i32 1) #11
  %244 = ptrtoint i8* %243 to i64
  %245 = sub i64 %244, %5
  %246 = icmp ult i64 %245, %225
  br i1 %246, label %.preheader47, label %.loopexit1

.preheader47:                                     ; preds = %239
  br label %247

; <label>:247:                                    ; preds = %247, %.preheader47
  %248 = phi i8* [ %249, %247 ], [ %243, %.preheader47 ]
  %249 = call i8* @halide_string_to_string(i8* %248, i8* nonnull %6, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.20.188, i64 0, i64 0)) #11
  %250 = ptrtoint i8* %249 to i64
  %251 = sub i64 %250, %5
  %252 = icmp ult i64 %251, %225
  br i1 %252, label %247, label %.loopexit1

.loopexit1:                                       ; preds = %247, %239
  %253 = phi i8* [ %243, %239 ], [ %249, %247 ]
  %254 = call i8* @halide_string_to_string(i8* %253, i8* nonnull %6, i8* nonnull getelementptr inbounds ([7 x i8], [7 x i8]* @.str.26.194, i64 0, i64 0)) #11
  %255 = load i32, i32* %226, align 8, !tbaa !231
  %256 = sext i32 %255 to i64
  %257 = call i8* @halide_int64_to_string(i8* %254, i8* nonnull %6, i64 %256, i32 1) #11
  %258 = add nuw nsw i64 %225, 15
  %259 = ptrtoint i8* %257 to i64
  %260 = sub i64 %259, %5
  %261 = icmp ult i64 %260, %258
  br i1 %261, label %.preheader, label %.loopexit

.preheader:                                       ; preds = %.loopexit1
  br label %262

; <label>:262:                                    ; preds = %262, %.preheader
  %263 = phi i8* [ %264, %262 ], [ %257, %.preheader ]
  %264 = call i8* @halide_string_to_string(i8* %263, i8* nonnull %6, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.20.188, i64 0, i64 0)) #11
  %265 = ptrtoint i8* %264 to i64
  %266 = sub i64 %265, %5
  %267 = icmp ult i64 %266, %258
  br i1 %267, label %262, label %.loopexit

.loopexit:                                        ; preds = %262, %.loopexit1
  %268 = phi i8* [ %257, %.loopexit1 ], [ %264, %262 ]
  %269 = call i8* @halide_string_to_string(i8* %268, i8* nonnull %6, i8* nonnull getelementptr inbounds ([7 x i8], [7 x i8]* @.str.27.195, i64 0, i64 0)) #11
  %270 = shl i64 %235, 32
  %271 = ashr exact i64 %270, 32
  %272 = call i8* @halide_int64_to_string(i8* %269, i8* nonnull %6, i64 %271, i32 1) #11
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
  %281 = call i8* @halide_string_to_string(i8* %280, i8* nonnull %6, i8* nonnull getelementptr inbounds ([9 x i8], [9 x i8]* @.str.28.196, i64 0, i64 0)) #11
  %282 = load i64, i64* %276, align 8, !tbaa !225
  %283 = call i8* @halide_uint64_to_string(i8* %281, i8* nonnull %6, i64 %282, i32 1) #11
  %284 = ptrtoint i8* %283 to i64
  br label %285

; <label>:285:                                    ; preds = %279, %274
  %286 = phi i64 [ %275, %274 ], [ %284, %279 ]
  %287 = inttoptr i64 %286 to i8*
  %288 = call i8* @halide_string_to_string(i8* %287, i8* nonnull %6, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7.175, i64 0, i64 0)) #11
  %289 = ptrtoint i8* %288 to i64
  %290 = add i64 %10, %289
  call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %4, i64 %290) #11
  call void @halide_print(i8* %0, i8* nonnull %4) #11
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
  tail call void @free(i8* %14) #11
  %15 = bitcast %struct.halide_profiler_pipeline_stats* %8 to i8*
  tail call void @free(i8* %15) #11
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
  %4 = tail call %struct.halide_profiler_state* @halide_profiler_get_state() #12
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
  %22 = tail call i8* @malloc(i64 96) #11
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
  %46 = tail call i8* @malloc(i64 %45) #11
  %47 = getelementptr inbounds i8, i8* %22, i64 56
  %48 = bitcast i8* %47 to i8**
  store i8* %46, i8** %48, align 8, !tbaa !224
  %49 = icmp eq i8* %46, null
  %50 = bitcast i8* %46 to %struct.halide_profiler_func_stats*
  br i1 %49, label %51, label %52

; <label>:51:                                     ; preds = %25
  tail call void @free(i8* nonnull %22) #11
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
  %4 = tail call %struct.halide_profiler_state* @halide_profiler_get_state() #12
  %5 = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %4, i64 0, i32 0
  tail call void @halide_mutex_lock(%struct.halide_mutex* %5) #11
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
  %16 = call i64 @halide_current_time_ns(i8* null) #11
  br label %17

; <label>:17:                                     ; preds = %34, %15
  %18 = phi i64 [ %16, %15 ], [ %26, %34 ]
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %10) #9
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %11) #9
  %19 = load void (i32*, i32*)*, void (i32*, i32*)** %12, align 8, !tbaa !238
  %20 = icmp eq void (i32*, i32*)* %19, null
  br i1 %20, label %22, label %21

; <label>:21:                                     ; preds = %17
  call void %19(i32* nonnull %2, i32* nonnull %3) #11
  br label %25

; <label>:22:                                     ; preds = %17
  %23 = load i32, i32* %6, align 8, !tbaa !212
  store i32 %23, i32* %2, align 4, !tbaa !99
  %24 = load i32, i32* %13, align 4, !tbaa !239
  store i32 %24, i32* %3, align 4, !tbaa !99
  br label %25

; <label>:25:                                     ; preds = %22, %21
  %26 = call i64 @halide_current_time_ns(i8* null) #11
  %27 = load i32, i32* %2, align 4, !tbaa !99
  %28 = icmp eq i32 %27, -2
  br i1 %28, label %36, label %29

; <label>:29:                                     ; preds = %25
  %30 = icmp sgt i32 %27, -1
  br i1 %30, label %31, label %34

; <label>:31:                                     ; preds = %29
  %32 = sub i64 %26, %18
  %33 = load i32, i32* %3, align 4, !tbaa !99
  call void @_ZN6Halide7Runtime8Internal9bill_funcEP21halide_profiler_stateiyi(%struct.halide_profiler_state* nonnull %4, i32 %27, i64 %32, i32 %33) #12
  br label %34

; <label>:34:                                     ; preds = %31, %29
  %35 = load i32, i32* %14, align 8, !tbaa !240
  call void @halide_mutex_unlock(%struct.halide_mutex* nonnull %5) #11
  call void @halide_sleep_ms(i8* null, i32 %35) #11
  call void @halide_mutex_lock(%struct.halide_mutex* nonnull %5) #11
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %11) #9
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %10) #9
  br label %17

; <label>:36:                                     ; preds = %25
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %11) #9
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %10) #9
  %37 = load i32, i32* %6, align 8, !tbaa !212
  %38 = icmp eq i32 %37, -2
  br i1 %38, label %.loopexit, label %15

.loopexit:                                        ; preds = %36, %1
  call void @halide_mutex_unlock(%struct.halide_mutex* nonnull %5) #11
  ret void
}

; Function Attrs: nounwind
define weak %struct.halide_profiler_pipeline_stats* @halide_profiler_get_pipeline_state(i8*) local_unnamed_addr #0 {
  %2 = tail call %struct.halide_profiler_state* @halide_profiler_get_state() #12
  %3 = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %2, i64 0, i32 0
  tail call void @halide_mutex_lock(%struct.halide_mutex* %3) #11
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
  tail call void @halide_mutex_unlock(%struct.halide_mutex* %3) #11
  ret %struct.halide_profiler_pipeline_stats* %17
}

; Function Attrs: nounwind
define weak i32 @halide_profiler_pipeline_start(i8*, i8*, i32, i64*) local_unnamed_addr #0 {
  %5 = tail call %struct.halide_profiler_state* @halide_profiler_get_state() #12
  %6 = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %5, i64 0, i32 0
  tail call void @halide_mutex_lock(%struct.halide_mutex* %6) #11
  %7 = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %5, i64 0, i32 7
  %8 = load %struct.halide_thread*, %struct.halide_thread** %7, align 8, !tbaa !210
  %9 = icmp eq %struct.halide_thread* %8, null
  br i1 %9, label %10, label %13

; <label>:10:                                     ; preds = %4
  %11 = tail call i32 @halide_start_clock(i8* %0) #11
  %12 = tail call %struct.halide_thread* @halide_spawn_thread(void (i8*)* nonnull @_ZN6Halide7Runtime8Internal24sampling_profiler_threadEPv, i8* null) #11
  store %struct.halide_thread* %12, %struct.halide_thread** %7, align 8, !tbaa !210
  br label %13

; <label>:13:                                     ; preds = %10, %4
  %14 = tail call %struct.halide_profiler_pipeline_stats* @_ZN6Halide7Runtime8Internal23find_or_create_pipelineEPKciPKy(i8* %1, i32 %2, i64* %3) #12
  %15 = icmp eq %struct.halide_profiler_pipeline_stats* %14, null
  br i1 %15, label %16, label %18

; <label>:16:                                     ; preds = %13
  %17 = tail call i32 @halide_error_out_of_memory(i8* %0) #11
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
  tail call void @halide_mutex_unlock(%struct.halide_mutex* %6) #11
  ret i32 %25
}

; Function Attrs: nounwind
define weak void @halide_profiler_stack_peak_update(i8*, i8*, i64*) local_unnamed_addr #0 {
  %4 = icmp eq i8* %1, null
  br i1 %4, label %5, label %6

; <label>:5:                                      ; preds = %3
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([131 x i8], [131 x i8]* @.str.197, i64 0, i64 0)) #11
  tail call void @abort() #11
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
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([131 x i8], [131 x i8]* @.str.1.198, i64 0, i64 0)) #11
  tail call void @abort() #11
  br label %9

; <label>:9:                                      ; preds = %8, %6
  %10 = icmp sgt i32 %2, -1
  br i1 %10, label %12, label %11

; <label>:11:                                     ; preds = %9
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @.str.2.199, i64 0, i64 0)) #11
  tail call void @abort() #11
  br label %12

; <label>:12:                                     ; preds = %11, %9
  %13 = getelementptr inbounds i8, i8* %1, i64 72
  %14 = bitcast i8* %13 to i32*
  %15 = load i32, i32* %14, align 8, !tbaa !223
  %16 = icmp sgt i32 %15, %2
  br i1 %16, label %18, label %17

; <label>:17:                                     ; preds = %12
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([144 x i8], [144 x i8]* @.str.3.200, i64 0, i64 0)) #11
  tail call void @abort() #11
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
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([131 x i8], [131 x i8]* @.str.4.201, i64 0, i64 0)) #11
  tail call void @abort() #11
  br label %9

; <label>:9:                                      ; preds = %8, %6
  %10 = icmp sgt i32 %2, -1
  br i1 %10, label %12, label %11

; <label>:11:                                     ; preds = %9
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @.str.5.202, i64 0, i64 0)) #11
  tail call void @abort() #11
  br label %12

; <label>:12:                                     ; preds = %11, %9
  %13 = getelementptr inbounds i8, i8* %1, i64 72
  %14 = bitcast i8* %13 to i32*
  %15 = load i32, i32* %14, align 8, !tbaa !223
  %16 = icmp sgt i32 %15, %2
  br i1 %16, label %18, label %17

; <label>:17:                                     ; preds = %12
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([144 x i8], [144 x i8]* @.str.6.203, i64 0, i64 0)) #11
  tail call void @abort() #11
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
  %2 = tail call %struct.halide_profiler_state* @halide_profiler_get_state() #12
  %3 = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %2, i64 0, i32 0
  tail call void @halide_mutex_lock(%struct.halide_mutex* %3) #11
  tail call void @halide_profiler_report_unlocked(i8* %0, %struct.halide_profiler_state* %2) #12
  tail call void @halide_mutex_unlock(%struct.halide_mutex* %3) #11
  ret void
}

; Function Attrs: nounwind
define weak void @halide_profiler_reset() local_unnamed_addr #0 {
  %1 = tail call %struct.halide_profiler_state* @halide_profiler_get_state() #12
  %2 = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %1, i64 0, i32 0
  tail call void @halide_mutex_lock(%struct.halide_mutex* %2) #11
  tail call void @halide_profiler_reset_unlocked(%struct.halide_profiler_state* %1) #12
  tail call void @halide_mutex_unlock(%struct.halide_mutex* %2) #11
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
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %6) #9
  call void @_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv(%"struct.Halide::Runtime::Internal::CpuFeatures"* nonnull sret %3) #11
  %7 = call i8* @memcpy(i8* bitcast ([2 x i64]* @_ZZ38halide_default_can_use_target_featuresE20cpu_features_storage to i8*), i8* nonnull %6, i64 16) #11
  store i1 true, i1* @_ZZ38halide_default_can_use_target_featuresE11initialized, align 1
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %6) #9
  br label %8

; <label>:8:                                      ; preds = %5, %2
  %9 = icmp eq i32 %0, 1
  br i1 %9, label %11, label %10

; <label>:10:                                     ; preds = %8
  call void @halide_error(i8* null, i8* getelementptr inbounds ([81 x i8], [81 x i8]* @.str.208, i64 0, i64 0)) #11
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
  %4 = tail call i32 %3(i32 %0, i64* %1) #11
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
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %6) #9
  %7 = getelementptr inbounds [4 x i32], [4 x i32]* %2, i64 0, i64 0
  store i32 1, i32* %7, align 4, !tbaa !99
  call void asm sideeffect inteldialect "xchg ebx, esi\0A\09mov eax, dword ptr $$0 $0\0A\09mov ecx, 0\0A\09cpuid\0A\09mov dword ptr $$0 $0, eax\0A\09mov dword ptr $$4 $0, ebx\0A\09mov dword ptr $$8 $0, ecx\0A\09mov dword ptr $$12 $0, edx\0A\09xchg ebx, esi", "=*m,~{eax},~{ebx},~{ecx},~{edx},~{esi},~{dirflag},~{fpsr},~{flags}"(i32* nonnull %7) #9
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
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %32) #9
  %33 = getelementptr inbounds [4 x i32], [4 x i32]* %3, i64 0, i64 0
  store i32 7, i32* %33, align 4, !tbaa !99
  call void asm sideeffect inteldialect "xchg ebx, esi\0A\09mov eax, dword ptr $$0 $0\0A\09mov ecx, 0\0A\09cpuid\0A\09mov dword ptr $$0 $0, eax\0A\09mov dword ptr $$4 $0, ebx\0A\09mov dword ptr $$8 $0, ecx\0A\09mov dword ptr $$12 $0, edx\0A\09xchg ebx, esi", "=*m,~{eax},~{ebx},~{ecx},~{edx},~{esi},~{dirflag},~{fpsr},~{flags}"(i32* nonnull %33) #9
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
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %32) #9
  br label %58

; <label>:58:                                     ; preds = %57, %28
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %6) #9
  ret void
}

declare void @abort() local_unnamed_addr #4

; Function Attrs: nounwind
define i32 @median3x3_batch_05_sample_02(%struct.halide_buffer_t* noalias %input.buffer, %struct.halide_buffer_t* noalias %output.buffer) local_unnamed_addr #8 {
entry:
  %0 = alloca i32, align 4
  %1 = alloca i32, align 4
  %2 = alloca %closure_t, align 8
  %3 = alloca [8 x i32], align 4
  %4 = alloca [8 x i32], align 4
  %5 = icmp eq %struct.halide_buffer_t* %output.buffer, null
  br i1 %5, label %"assert failed", label %"assert succeeded", !prof !241

"assert failed":                                  ; preds = %entry
  %6 = tail call i32 @halide_error_buffer_argument_is_null(i8* null, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @str, i64 0, i64 0)) #9
  br label %destructor_block

"assert succeeded":                               ; preds = %entry
  %7 = icmp eq %struct.halide_buffer_t* %input.buffer, null
  br i1 %7, label %"assert failed1", label %"assert succeeded2", !prof !241

destructor_block:                                 ; preds = %"produce output", %_halide_buffer_is_bounds_query.exit54, %"assert failed9", %"assert failed7", %"assert failed5", %"assert failed3", %"assert failed1", %"assert failed"
  %8 = phi i32 [ %6, %"assert failed" ], [ %9, %"assert failed1" ], [ %78, %"assert failed3" ], [ %81, %"assert failed5" ], [ %90, %"assert failed7" ], [ %96, %"assert failed9" ], [ 0, %_halide_buffer_is_bounds_query.exit54 ], [ %359, %"produce output" ]
  ret i32 %8

"assert failed1":                                 ; preds = %"assert succeeded"
  %9 = tail call i32 @halide_error_buffer_argument_is_null(i8* null, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @str.213, i64 0, i64 0)) #9
  br label %destructor_block

"assert succeeded2":                              ; preds = %"assert succeeded"
  %10 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %input.buffer, i64 0, i32 2
  %11 = load i8*, i8** %10, align 8, !tbaa !151
  %12 = bitcast i32* %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %12) #9
  %13 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %input.buffer, i64 0, i32 4, i32 0
  %14 = call i8* @memcpy(i8* nonnull %12, i8* nonnull %13, i64 4) #11
  %15 = load i32, i32* %1, align 4, !tbaa !99
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %12) #9
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
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %34) #9
  %35 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %output.buffer, i64 0, i32 4, i32 0
  %36 = call i8* @memcpy(i8* nonnull %34, i8* nonnull %35, i64 4) #11
  %37 = load i32, i32* %0, align 4, !tbaa !99
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %34) #9
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
  %78 = call i32 @halide_error_constraints_make_required_region_smaller(i8* null, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @str.214, i64 0, i64 0), i32 0, i32 0, i32 %input.extent.0.required.s, i32 %62, i32 %57) #9
  br label %destructor_block

_halide_buffer_is_bounds_query.exit47:            ; preds = %_halide_buffer_is_bounds_query.exit
  %79 = icmp eq i32 %70, 0
  %80 = or i1 %79, %75
  br i1 %80, label %"assert succeeded6", label %"assert failed5", !prof !242

"assert failed5":                                 ; preds = %_halide_buffer_is_bounds_query.exit47
  %81 = call i32 @halide_error_constraints_make_required_region_smaller(i8* null, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @str.214, i64 0, i64 0), i32 1, i32 0, i32 %input.extent.1.required.s, i32 %70, i32 %66) #9
  br label %destructor_block

"assert succeeded6":                              ; preds = %_halide_buffer_is_bounds_query.exit47, %"assert succeeded2"
  %82 = load i8*, i8** %32, align 8, !tbaa !151
  %83 = icmp eq i8* %82, null
  br i1 %83, label %_halide_buffer_is_bounds_query.exit48, label %_halide_buffer_is_bounds_query.exit49.thread

_halide_buffer_is_bounds_query.exit48:            ; preds = %"assert succeeded6"
  %84 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %output.buffer, i64 0, i32 0
  %85 = load i64, i64* %84, align 8, !tbaa !178
  %86 = icmp eq i64 %85, 0
  %87 = icmp slt i32 %45, 192
  %.demorgan = and i1 %87, %86
  br i1 %.demorgan, label %"assert failed7", label %_halide_buffer_is_bounds_query.exit49, !prof !241

"assert failed7":                                 ; preds = %_halide_buffer_is_bounds_query.exit48
  %88 = add nsw i32 %45, -192
  %89 = add nsw i32 %45, -1
  %90 = call i32 @halide_error_constraints_make_required_region_smaller(i8* null, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @str.215, i64 0, i64 0), i32 0, i32 0, i32 191, i32 %88, i32 %89) #9
  br label %destructor_block

_halide_buffer_is_bounds_query.exit49.thread:     ; preds = %"assert succeeded6"
  %91 = icmp slt i32 %45, 192
  %92 = icmp slt i32 %51, 32
  br label %"assert succeeded10"

_halide_buffer_is_bounds_query.exit49:            ; preds = %_halide_buffer_is_bounds_query.exit48
  %93 = icmp slt i32 %51, 32
  %.demorgan45 = and i1 %93, %86
  br i1 %.demorgan45, label %"assert failed9", label %"assert succeeded10", !prof !241

"assert failed9":                                 ; preds = %_halide_buffer_is_bounds_query.exit49
  %94 = add nsw i32 %51, -32
  %95 = add nsw i32 %51, -1
  %96 = call i32 @halide_error_constraints_make_required_region_smaller(i8* null, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @str.215, i64 0, i64 0), i32 1, i32 0, i32 31, i32 %94, i32 %95) #9
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
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %103, i8* nonnull %117, i64 16, i32 4, i1 false) #9, !tbaa.struct !137
  %118 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %18, align 8, !tbaa !136
  %119 = getelementptr inbounds [8 x i32], [8 x i32]* %4, i64 0, i64 4
  %120 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %118, i64 1
  %121 = bitcast %struct.halide_dimension_t* %120 to i8*
  %122 = bitcast i32* %119 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %121, i8* nonnull %122, i64 16, i32 4, i1 false) #9, !tbaa.struct !137
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
  %131 = icmp sgt i32 %45, 192
  %132 = select i1 %131, i32 %45, i32 192
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
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %130, i8* nonnull %146, i64 16, i32 4, i1 false) #9, !tbaa.struct !137
  %147 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %40, align 8, !tbaa !136
  %148 = getelementptr inbounds [8 x i32], [8 x i32]* %3, i64 0, i64 4
  %149 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %147, i64 1
  %150 = bitcast %struct.halide_dimension_t* %149 to i8*
  %151 = bitcast i32* %148 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %150, i8* nonnull %151, i64 16, i32 4, i1 false) #9, !tbaa.struct !137
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
  %input.extent.0.lobit = lshr i32 %23, 31
  %182 = shl nuw nsw i32 %input.extent.0.lobit, 5
  %183 = zext i32 %182 to i64
  %184 = icmp sge i32 %66, %63
  %185 = zext i1 %184 to i64
  %186 = shl nuw nsw i64 %185, 6
  %input.extent.1.lobit = lshr i32 %29, 31
  %187 = shl nuw nsw i32 %input.extent.1.lobit, 7
  %188 = zext i32 %187 to i64
  %189 = add nsw i32 %43, 192
  %190 = select i1 %98, i32 %45, i32 192
  %191 = icmp sgt i32 %189, %190
  %192 = zext i1 %191 to i64
  %output.min.0.lobit = lshr i32 %43, 31
  %193 = zext i32 %output.min.0.lobit to i64
  %194 = or i64 %192, %193
  %195 = shl nuw nsw i64 %194, 8
  %b26.lobit = lshr i32 %45, 31
  %196 = shl nuw nsw i32 %b26.lobit, 9
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
  %294 = call i32 @halide_error_bad_type(i8* null, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @str.214, i64 0, i64 0), i32 %15, i32 67585) #9
  ret i32 %294

assert_failed17:                                  ; preds = %true_bb14
  %295 = call i32 @halide_error_bad_dimensions(i8* null, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @str.214, i64 0, i64 0), i32 %17, i32 2) #9
  ret i32 %295

assert_failed18:                                  ; preds = %true_bb14
  %296 = call i32 @halide_error_bad_type(i8* null, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @str.215, i64 0, i64 0), i32 %37, i32 67585) #9
  ret i32 %296

assert_failed19:                                  ; preds = %true_bb14
  %297 = call i32 @halide_error_bad_dimensions(i8* null, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @str.215, i64 0, i64 0), i32 %39, i32 2) #9
  ret i32 %297

assert_failed20:                                  ; preds = %true_bb14
  %298 = call i32 @halide_error_access_out_of_bounds(i8* null, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @str.214, i64 0, i64 0), i32 0, i32 %62, i32 %57, i32 %21, i32 %a1) #9
  ret i32 %298

assert_failed21:                                  ; preds = %true_bb14
  %299 = call i32 @halide_error_buffer_extents_negative(i8* null, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @str.214, i64 0, i64 0), i32 0, i32 %23) #9
  ret i32 %299

assert_failed22:                                  ; preds = %true_bb14
  %300 = call i32 @halide_error_access_out_of_bounds(i8* null, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @str.214, i64 0, i64 0), i32 1, i32 %70, i32 %66, i32 %27, i32 %a9) #9
  ret i32 %300

assert_failed23:                                  ; preds = %true_bb14
  %301 = call i32 @halide_error_buffer_extents_negative(i8* null, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @str.214, i64 0, i64 0), i32 1, i32 %29) #9
  ret i32 %301

assert_failed24:                                  ; preds = %true_bb14
  %302 = add nsw i32 %190, -192
  %303 = add i32 %45, -1
  %304 = add i32 %303, %43
  %305 = call i32 @halide_error_access_out_of_bounds(i8* null, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @str.215, i64 0, i64 0), i32 0, i32 %302, i32 %303, i32 %43, i32 %304) #9
  ret i32 %305

assert_failed25:                                  ; preds = %true_bb14
  %306 = call i32 @halide_error_buffer_extents_negative(i8* null, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @str.215, i64 0, i64 0), i32 0, i32 %45) #9
  ret i32 %306

assert_failed26:                                  ; preds = %true_bb14
  %307 = add nsw i32 %199, -32
  %308 = add i32 %51, -1
  %309 = add i32 %308, %49
  %310 = call i32 @halide_error_access_out_of_bounds(i8* null, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @str.215, i64 0, i64 0), i32 1, i32 %307, i32 %308, i32 %49, i32 %309) #9
  ret i32 %310

assert_failed27:                                  ; preds = %true_bb14
  %311 = call i32 @halide_error_buffer_extents_negative(i8* null, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @str.215, i64 0, i64 0), i32 1, i32 %51) #9
  ret i32 %311

assert_failed28:                                  ; preds = %true_bb14
  %312 = call i32 @halide_error_constraint_violated(i8* null, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @str.216, i64 0, i64 0), i32 %25, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.217, i64 0, i64 0), i32 1) #9
  ret i32 %312

assert_failed29:                                  ; preds = %true_bb14
  %313 = call i32 @halide_error_constraint_violated(i8* null, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @str.218, i64 0, i64 0), i32 %21, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.219, i64 0, i64 0), i32 0) #9
  ret i32 %313

assert_failed30:                                  ; preds = %true_bb14
  %314 = call i32 @halide_error_constraint_violated(i8* null, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @str.220, i64 0, i64 0), i32 %27, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.219, i64 0, i64 0), i32 0) #9
  ret i32 %314

assert_failed31:                                  ; preds = %true_bb14
  %315 = call i32 @halide_error_constraint_violated(i8* null, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @str.221, i64 0, i64 0), i32 %47, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.217, i64 0, i64 0), i32 1) #9
  ret i32 %315

assert_failed32:                                  ; preds = %true_bb14
  %316 = call i32 @halide_error_constraint_violated(i8* null, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @str.222, i64 0, i64 0), i32 %43, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.219, i64 0, i64 0), i32 0) #9
  ret i32 %316

assert_failed33:                                  ; preds = %true_bb14
  %317 = call i32 @halide_error_constraint_violated(i8* null, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @str.223, i64 0, i64 0), i32 %49, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.219, i64 0, i64 0), i32 0) #9
  ret i32 %317

assert_failed35:                                  ; preds = %no_errors_bb
  %318 = call i32 @halide_error_buffer_allocation_too_large(i8* null, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @str.213, i64 0, i64 0), i64 %250, i64 2147483647) #9
  ret i32 %318

assert_failed36:                                  ; preds = %no_errors_bb
  %319 = call i32 @halide_error_buffer_allocation_too_large(i8* null, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @str.213, i64 0, i64 0), i64 %256, i64 2147483647) #9
  ret i32 %319

assert_failed37:                                  ; preds = %no_errors_bb
  %320 = call i32 @halide_error_buffer_extents_too_large(i8* null, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @str.213, i64 0, i64 0), i64 %input.total_extent.1, i64 2147483647) #9
  ret i32 %320

assert_failed38:                                  ; preds = %no_errors_bb
  %321 = call i32 @halide_error_buffer_allocation_too_large(i8* null, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @str, i64 0, i64 0), i64 %265, i64 2147483647) #9
  ret i32 %321

assert_failed39:                                  ; preds = %no_errors_bb
  %322 = call i32 @halide_error_buffer_allocation_too_large(i8* null, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @str, i64 0, i64 0), i64 %272, i64 2147483647) #9
  ret i32 %322

assert_failed40:                                  ; preds = %no_errors_bb
  %323 = call i32 @halide_error_buffer_extents_too_large(i8* null, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @str, i64 0, i64 0), i64 %output.total_extent.1, i64 2147483647) #9
  ret i32 %323

assert_failed41:                                  ; preds = %no_errors_bb
  %324 = call i32 @halide_error_host_is_null(i8* null, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @str.214, i64 0, i64 0)) #9
  ret i32 %324

assert_failed42:                                  ; preds = %no_errors_bb
  %325 = call i32 @halide_error_host_is_null(i8* null, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @str.215, i64 0, i64 0)) #9
  ret i32 %325

"produce output":                                 ; preds = %no_errors_bb
  %326 = add nsw i32 %45, 191
  %327 = ashr i32 %326, 31
  %328 = xor i32 %327, %326
  %329 = zext i32 %328 to i64
  %330 = mul nuw nsw i64 %329, 715827883
  %331 = lshr i64 %330, 37
  %332 = trunc i64 %331 to i32
  %t254 = xor i32 %327, %332
  %t255 = icmp sgt i32 %45, 192
  %b24 = add nsw i32 %190, -193
  %a22 = select i1 %t255, i32 1, i32 %b24
  %333 = icmp sgt i32 %b24, %a22
  %t257 = select i1 %333, i32 %a22, i32 %b24
  %b27 = add nsw i32 %45, -193
  %a26 = mul nsw i32 %t254, 192
  %b28 = add nsw i32 %45, 192
  %334 = icmp sgt i32 %b28, %a26
  %335 = select i1 %334, i32 %a26, i32 %b28
  %336 = add nsw i32 %335, -191
  %a25 = select i1 %t255, i32 %336, i32 %b27
  %337 = icmp sgt i32 %a25, %b27
  %338 = select i1 %337, i32 %a25, i32 %b27
  %339 = sub nsw i32 %45, %t257
  %340 = and i32 %339, -64
  %341 = add i32 %338, 63
  %a24 = add i32 %341, %340
  %342 = icmp sgt i32 %45, %a24
  %a23 = select i1 %342, i32 %a24, i32 %45
  %b25 = add nsw i32 %45, 62
  %343 = icmp sgt i32 %a23, %b25
  %t249 = select i1 %343, i32 %a23, i32 %b25
  %344 = add nsw i32 %51, 31
  %t246 = ashr i32 %344, 5
  %t247 = add nsw i32 %51, -32
  %345 = getelementptr inbounds %closure_t, %closure_t* %2, i64 0, i32 0
  store i32 %23, i32* %345, align 8
  %346 = getelementptr inbounds %closure_t, %closure_t* %2, i64 0, i32 1
  store i32 %29, i32* %346, align 4
  %347 = getelementptr inbounds %closure_t, %closure_t* %2, i64 0, i32 2
  store i32 %31, i32* %347, align 8
  %348 = getelementptr inbounds %closure_t, %closure_t* %2, i64 0, i32 3
  store i32 %45, i32* %348, align 4
  %349 = getelementptr inbounds %closure_t, %closure_t* %2, i64 0, i32 4
  store i32 %53, i32* %349, align 8
  %350 = getelementptr inbounds %closure_t, %closure_t* %2, i64 0, i32 5
  store i32 %t247, i32* %350, align 4
  %351 = getelementptr inbounds %closure_t, %closure_t* %2, i64 0, i32 6
  store i32 %t249, i32* %351, align 8
  %352 = getelementptr inbounds %closure_t, %closure_t* %2, i64 0, i32 7
  store i32 %t254, i32* %352, align 4
  %353 = getelementptr inbounds %closure_t, %closure_t* %2, i64 0, i32 8
  store i32 %t257, i32* %353, align 8
  %354 = getelementptr inbounds %closure_t, %closure_t* %2, i64 0, i32 9
  store i8* %11, i8** %354, align 8
  %355 = getelementptr inbounds %closure_t, %closure_t* %2, i64 0, i32 10
  store %struct.halide_buffer_t* %input.buffer, %struct.halide_buffer_t** %355, align 8
  %356 = getelementptr inbounds %closure_t, %closure_t* %2, i64 0, i32 11
  store i8* %33, i8** %356, align 8
  %357 = getelementptr inbounds %closure_t, %closure_t* %2, i64 0, i32 12
  store %struct.halide_buffer_t* %output.buffer, %struct.halide_buffer_t** %357, align 8
  %358 = bitcast %closure_t* %2 to i8*
  %359 = call i32 @halide_do_par_for(i8* null, i32 (i8*, i32, i8*)* nonnull @median3x3_batch_05_sample_02.par_for.output.s0.y.y, i32 0, i32 %t246, i8* nonnull %358)
  br label %destructor_block
}

; Function Attrs: nounwind readnone speculatable
declare i64 @llvm.cttz.i64(i64, i1) #7

; Function Attrs: nounwind
define internal i32 @median3x3_batch_05_sample_02.par_for.output.s0.y.y(i8* %__user_context, i32 %output.s0.y.y, i8* noalias nocapture readonly %closure) #8 {
entry:
  %mid_y23 = alloca [128 x i8], align 64
  %min_y24 = alloca [128 x i8], align 64
  %minmax_x25 = alloca [2048 x i8], align 64
  %max_y26 = alloca [8192 x i8], align 64
  %bounded_input.pseudostack_slot = alloca %struct.halide_pseudostack_slot_t, align 8
  %.fca.0.gep = getelementptr inbounds %struct.halide_pseudostack_slot_t, %struct.halide_pseudostack_slot_t* %bounded_input.pseudostack_slot, i64 0, i32 0
  %.fca.1.gep = getelementptr inbounds %struct.halide_pseudostack_slot_t, %struct.halide_pseudostack_slot_t* %bounded_input.pseudostack_slot, i64 0, i32 1
  %0 = bitcast i8* %closure to i32*
  %1 = bitcast %struct.halide_pseudostack_slot_t* %bounded_input.pseudostack_slot to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %1, i8 0, i64 16, i32 8, i1 false)
  %b58 = load i32, i32* %0, align 4
  %2 = getelementptr inbounds i8, i8* %closure, i64 4
  %3 = bitcast i8* %2 to i32*
  %b43 = load i32, i32* %3, align 4
  %4 = getelementptr inbounds i8, i8* %closure, i64 8
  %5 = bitcast i8* %4 to i32*
  %input.stride.1 = load i32, i32* %5, align 4
  %6 = getelementptr inbounds i8, i8* %closure, i64 12
  %7 = bitcast i8* %6 to i32*
  %b46 = load i32, i32* %7, align 4
  %8 = getelementptr inbounds i8, i8* %closure, i64 16
  %9 = bitcast i8* %8 to i32*
  %output.stride.1 = load i32, i32* %9, align 4
  %10 = getelementptr inbounds i8, i8* %closure, i64 20
  %11 = bitcast i8* %10 to i32*
  %b34 = load i32, i32* %11, align 4
  %12 = getelementptr inbounds i8, i8* %closure, i64 24
  %13 = bitcast i8* %12 to i32*
  %t249 = load i32, i32* %13, align 4
  %14 = getelementptr inbounds i8, i8* %closure, i64 28
  %15 = bitcast i8* %14 to i32*
  %t254 = load i32, i32* %15, align 4
  %16 = getelementptr inbounds i8, i8* %closure, i64 32
  %17 = bitcast i8* %16 to i32*
  %t257 = load i32, i32* %17, align 4
  %18 = getelementptr inbounds i8, i8* %closure, i64 40
  %19 = bitcast i8* %18 to i8**
  %input = load i8*, i8** %19, align 8
  %20 = getelementptr inbounds i8, i8* %closure, i64 56
  %21 = bitcast i8* %20 to i8**
  %output = load i8*, i8** %21, align 8
  %a27 = shl nsw i32 %output.s0.y.y, 5
  %22 = icmp sgt i32 %b34, %a27
  %a34 = select i1 %22, i32 %a27, i32 %b34
  %a28 = sub nsw i32 %t249, %t257
  %23 = icmp sgt i32 %a28, -1
  %t334 = select i1 %23, i32 %a28, i32 -1
  %24 = add nsw i32 %t334, 1
  %25 = zext i32 %24 to i64
  %26 = mul nuw nsw i64 %25, 34
  %27 = icmp ult i64 %26, 2147483648
  br i1 %27, label %pseudostack_alloc.exit, label %destructor_block, !prof !242

pseudostack_alloc.exit:                           ; preds = %entry
  %28 = or i64 %26, 1
  %29 = tail call i8* @halide_malloc(i8* %__user_context, i64 %28) #11
  store i8* %29, i8** %.fca.0.gep, align 8, !tbaa !247
  store i64 %28, i64* %.fca.1.gep, align 8, !tbaa !249
  %t274 = sub nsw i32 %t257, %t249
  %30 = icmp sgt i32 %a34, 1
  %a33 = select i1 %30, i32 %a34, i32 1
  %b35 = add nsw i32 %a34, 34
  %31 = icmp sgt i32 %b35, %a33
  %t276 = select i1 %31, i32 %a33, i32 %b35
  %a35 = add i32 %a34, 33
  %32 = icmp sgt i32 %b43, %a35
  %b40 = select i1 %32, i32 %a35, i32 %b43
  %a38 = add nsw i32 %t276, -1
  %33 = icmp sgt i32 %a38, %b40
  %34 = select i1 %33, i32 %a38, i32 %b40
  %a39 = sub nsw i32 %b40, %t276
  %35 = icmp slt i32 %a34, 1
  %36 = select i1 %35, i32 %a34, i32 1
  %t263 = sub nsw i32 1, %36
  %b66 = add nsw i32 %b43, -1
  %37 = icmp sgt i32 %t254, 0
  br i1 %37, label %"for output.s0.x.x.preheader", label %.loopexit, !prof !242

"for output.s0.x.x.preheader":                    ; preds = %pseudostack_alloc.exit
  %t271 = add nsw i32 %t274, -2
  %t272 = add nsw i32 %t274, 62
  %38 = icmp sgt i32 %a39, -1
  %39 = select i1 %38, i32 %a39, i32 -1
  %b45 = add nsw i32 %b46, -192
  %t283 = sub nsw i32 1, %a34
  %t284 = add nsw i32 %a28, 1
  %t279 = add nsw i32 %a34, -1
  %t282 = add nsw i32 %b58, -1
  %40 = add nsw i32 %t263, %t279
  %41 = icmp sgt i32 %t263, 0
  %42 = add i32 %39, %t276
  %43 = icmp sgt i32 %t276, %42
  %44 = insertelement <64 x i32> undef, i32 %t282, i32 0
  %45 = shufflevector <64 x i32> %44, <64 x i32> undef, <16 x i32> zeroinitializer
  %46 = icmp slt i32 %34, %a35
  %47 = add nsw i32 %a34, 32
  %48 = sext i32 %t271 to i64
  %49 = sext i32 %a28 to i64
  %50 = sext i32 %a34 to i64
  %min_y24.0.sroa_cast = bitcast [128 x i8]* %min_y24 to <64 x i8>*
  %51 = sext i32 %t272 to i64
  %min_y24.64.sroa_idx = getelementptr inbounds [128 x i8], [128 x i8]* %min_y24, i64 0, i64 64
  %min_y24.64.sroa_cast = bitcast i8* %min_y24.64.sroa_idx to <64 x i8>*
  %mid_y23.0.sroa_cast = bitcast [128 x i8]* %mid_y23 to <64 x i8>*
  %mid_y23.64.sroa_idx = getelementptr inbounds [128 x i8], [128 x i8]* %mid_y23, i64 0, i64 64
  %mid_y23.64.sroa_cast = bitcast i8* %mid_y23.64.sroa_idx to <64 x i8>*
  %mid_y23.1.sroa_idx = getelementptr inbounds [128 x i8], [128 x i8]* %mid_y23, i64 0, i64 1
  %mid_y23.1.sroa_cast = bitcast i8* %mid_y23.1.sroa_idx to <64 x i8>*
  %mid_y23.2.sroa_idx = getelementptr inbounds [128 x i8], [128 x i8]* %mid_y23, i64 0, i64 2
  %mid_y23.2.sroa_cast = bitcast i8* %mid_y23.2.sroa_idx to <64 x i8>*
  %min_y24.1.sroa_idx = getelementptr inbounds [128 x i8], [128 x i8]* %min_y24, i64 0, i64 1
  %min_y24.1.sroa_cast = bitcast i8* %min_y24.1.sroa_idx to <64 x i8>*
  %min_y24.2.sroa_idx = getelementptr inbounds [128 x i8], [128 x i8]* %min_y24, i64 0, i64 2
  %min_y24.2.sroa_cast = bitcast i8* %min_y24.2.sroa_idx to <64 x i8>*
  %52 = sext i32 %output.stride.1 to i64
  %53 = sext i32 %t279 to i64
  %54 = sext i32 %b66 to i64
  %55 = sext i32 %a38 to i64
  %56 = sext i32 %input.stride.1 to i64
  %57 = sext i32 %34 to i64
  br label %"for output.s0.x.x"

destructor_block:                                 ; preds = %entry
  %b31 = add nsw i32 %a28, 1
  %58 = icmp sgt i32 %b31, 0
  %59 = select i1 %58, i32 %b31, i32 0
  %60 = zext i32 %59 to i64
  %61 = mul nuw nsw i64 %60, 34
  %62 = tail call i32 @halide_error_buffer_allocation_too_large(i8* %__user_context, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @str.224, i64 0, i64 0), i64 %61, i64 2147483647) #9
  br label %call_destructor.exit

.loopexit.loopexit:                               ; preds = %"end for output.s0.x.xi.xi"
  %.pre = load i8*, i8** %.fca.0.gep, align 8, !tbaa !247
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %pseudostack_alloc.exit
  %63 = phi i8* [ %.pre, %.loopexit.loopexit ], [ %29, %pseudostack_alloc.exit ]
  store i64 0, i64* %.fca.1.gep, align 8, !tbaa !249
  %64 = icmp eq i8* %63, null
  br i1 %64, label %pseudostack_free.exit, label %65

; <label>:65:                                     ; preds = %.loopexit
  tail call void @halide_free(i8* %__user_context, i8* nonnull %63) #11
  br label %pseudostack_free.exit

pseudostack_free.exit:                            ; preds = %65, %.loopexit
  store i8* null, i8** %.fca.0.gep, align 8, !tbaa !247
  br label %call_destructor.exit

call_destructor.exit:                             ; preds = %pseudostack_free.exit, %destructor_block
  %66 = phi i32 [ %62, %destructor_block ], [ 0, %pseudostack_free.exit ]
  ret i32 %66

"for output.s0.x.x":                              ; preds = %"end for output.s0.x.xi.xi", %"for output.s0.x.x.preheader"
  %output.s0.x.x = phi i32 [ %1587, %"end for output.s0.x.xi.xi" ], [ 0, %"for output.s0.x.x.preheader" ]
  %a43 = mul nsw i32 %output.s0.x.x, 192
  %67 = icmp sgt i32 %b45, %a43
  %output.s0.x.xi.base = select i1 %67, i32 %a43, i32 %b45
  %68 = icmp eq i32 %output.s0.x.x, 0
  %69 = icmp sgt i32 %b46, %a43
  %70 = select i1 %69, i32 %a43, i32 %b46
  %71 = add nsw i32 %70, 1
  %72 = add nsw i32 %output.s0.x.xi.base, -1
  %bounded_input.s0.x.min_2 = select i1 %68, i32 %72, i32 %71
  %73 = sub nsw i32 %output.s0.x.xi.base, %bounded_input.s0.x.min_2
  %74 = ashr i32 %73, 6
  %t280 = add nsw i32 %74, 4
  %b49 = add nsw i32 %output.s0.x.xi.base, 129
  br i1 %41, label %"for bounded_input.s0.y.preheader", label %"end for bounded_input.s0.y", !prof !242

"for bounded_input.s0.y.preheader":               ; preds = %"for output.s0.x.x"
  %75 = icmp sgt i32 %73, -193
  br label %"for bounded_input.s0.y"

"for bounded_input.s0.y":                         ; preds = %"end for bounded_input.s0.x.x", %"for bounded_input.s0.y.preheader"
  %indvars.iv = phi i64 [ %53, %"for bounded_input.s0.y.preheader" ], [ %indvars.iv.next, %"end for bounded_input.s0.x.x" ]
  %a46 = phi i32 [ %t279, %"for bounded_input.s0.y.preheader" ], [ %455, %"end for bounded_input.s0.x.x" ]
  %76 = icmp slt i64 %indvars.iv, %54
  %77 = trunc i64 %indvars.iv to i32
  %a45 = select i1 %76, i32 %77, i32 %b66
  br i1 %75, label %"for bounded_input.s0.x.x.preheader", label %"end for bounded_input.s0.x.x", !prof !242

"for bounded_input.s0.x.x.preheader":             ; preds = %"for bounded_input.s0.y"
  %78 = add nsw i32 %a46, %t283
  %79 = mul nsw i32 %78, %t284
  %t286 = sub nsw i32 %79, %t257
  %80 = icmp sgt i32 %a45, 0
  %81 = select i1 %80, i32 %a45, i32 0
  %t285 = mul nsw i32 %81, %input.stride.1
  %82 = insertelement <64 x i32> undef, i32 %t285, i32 0
  %83 = shufflevector <64 x i32> %82, <64 x i32> undef, <64 x i32> zeroinitializer
  %84 = sext i32 %t286 to i64
  br label %"for bounded_input.s0.x.x"

"end for bounded_input.s0.y":                     ; preds = %"end for bounded_input.s0.x.x", %"for output.s0.x.x"
  %85 = sub nsw i32 63, %bounded_input.s0.x.min_2
  %a51 = ashr i32 %85, 6
  %86 = icmp sgt i32 %a51, 0
  %a50 = select i1 %86, i32 %a51, i32 0
  %87 = icmp sgt i32 %t280, %a50
  %b54 = select i1 %87, i32 %a50, i32 %t280
  %a55 = sub nsw i32 %b58, %bounded_input.s0.x.min_2
  %b57 = add nsw i32 %73, 193
  %88 = icmp sgt i32 %b57, %a55
  %a54 = select i1 %88, i32 %a55, i32 %b57
  %a56 = add nsw i32 %output.s0.x.xi.base, 130
  %89 = icmp sgt i32 %b58, %a56
  %90 = select i1 %89, i32 %a56, i32 %b58
  %91 = sub nsw i32 %90, %bounded_input.s0.x.min_2
  %b56 = add nsw i32 %91, 63
  %92 = icmp sgt i32 %b56, %a54
  %a53 = select i1 %92, i32 %a54, i32 %b56
  %b55 = add nsw i32 %73, 256
  %93 = icmp sgt i32 %b55, %a53
  %94 = select i1 %93, i32 %a53, i32 %b55
  %a52 = ashr i32 %94, 6
  %95 = icmp sgt i32 %a52, %b54
  %t289 = select i1 %95, i32 %a52, i32 %b54
  br i1 %43, label %"end for bounded_input.s0.y2", label %"for bounded_input.s0.y1.preheader", !prof !241

"for bounded_input.s0.y1.preheader":              ; preds = %"end for bounded_input.s0.y"
  %96 = icmp sgt i32 %b54, 0
  %97 = sub i32 %bounded_input.s0.x.min_2, %t257
  %98 = icmp slt i32 %t289, %t280
  %99 = sext i32 %b54 to i64
  %100 = sext i32 %bounded_input.s0.x.min_2 to i64
  br label %"for bounded_input.s0.y1"

"for bounded_input.s0.x.x":                       ; preds = %"for bounded_input.s0.x.x", %"for bounded_input.s0.x.x.preheader"
  %bounded_input.s0.x.x = phi i32 [ %453, %"for bounded_input.s0.x.x" ], [ 0, %"for bounded_input.s0.x.x.preheader" ]
  %101 = shl nsw i32 %bounded_input.s0.x.x, 6
  %a47 = add nsw i32 %101, %bounded_input.s0.x.min_2
  %102 = icmp sgt i32 %b49, %a47
  %bounded_input.s0.x.xi.base = select i1 %102, i32 %a47, i32 %b49
  %103 = insertelement <64 x i32> undef, i32 %bounded_input.s0.x.xi.base, i32 0
  %104 = shufflevector <64 x i32> %103, <64 x i32> undef, <64 x i32> zeroinitializer
  %a49 = add nsw <64 x i32> %104, <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %105 = shufflevector <64 x i32> %a49, <64 x i32> undef, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %106 = icmp sgt <16 x i32> %45, %105
  %107 = shufflevector <64 x i32> %a49, <64 x i32> undef, <16 x i32> <i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %108 = icmp sgt <16 x i32> %45, %107
  %109 = shufflevector <64 x i32> %a49, <64 x i32> undef, <16 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47>
  %110 = icmp sgt <16 x i32> %45, %109
  %111 = shufflevector <64 x i32> %a49, <64 x i32> undef, <16 x i32> <i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %112 = icmp sgt <16 x i32> %45, %111
  %113 = select <16 x i1> %106, <16 x i32> %105, <16 x i32> %45
  %114 = select <16 x i1> %108, <16 x i32> %107, <16 x i32> %45
  %115 = select <16 x i1> %110, <16 x i32> %109, <16 x i32> %45
  %116 = select <16 x i1> %112, <16 x i32> %111, <16 x i32> %45
  %117 = icmp sgt <16 x i32> %113, zeroinitializer
  %118 = icmp sgt <16 x i32> %114, zeroinitializer
  %119 = icmp sgt <16 x i32> %115, zeroinitializer
  %120 = icmp sgt <16 x i32> %116, zeroinitializer
  %121 = select <16 x i1> %117, <16 x i32> %113, <16 x i32> zeroinitializer
  %122 = select <16 x i1> %118, <16 x i32> %114, <16 x i32> zeroinitializer
  %123 = select <16 x i1> %119, <16 x i32> %115, <16 x i32> zeroinitializer
  %124 = select <16 x i1> %120, <16 x i32> %116, <16 x i32> zeroinitializer
  %125 = shufflevector <16 x i32> %121, <16 x i32> %122, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %126 = shufflevector <16 x i32> %123, <16 x i32> %124, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %127 = shufflevector <32 x i32> %125, <32 x i32> %126, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %128 = add nsw <64 x i32> %127, %83
  %129 = extractelement <64 x i32> %128, i32 0
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds i8, i8* %input, i64 %130
  %132 = load i8, i8* %131, align 1, !tbaa !250
  %133 = insertelement <64 x i8> undef, i8 %132, i32 0
  %134 = extractelement <64 x i32> %128, i32 1
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds i8, i8* %input, i64 %135
  %137 = load i8, i8* %136, align 1, !tbaa !250
  %138 = insertelement <64 x i8> %133, i8 %137, i32 1
  %139 = extractelement <64 x i32> %128, i32 2
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds i8, i8* %input, i64 %140
  %142 = load i8, i8* %141, align 1, !tbaa !250
  %143 = insertelement <64 x i8> %138, i8 %142, i32 2
  %144 = extractelement <64 x i32> %128, i32 3
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds i8, i8* %input, i64 %145
  %147 = load i8, i8* %146, align 1, !tbaa !250
  %148 = insertelement <64 x i8> %143, i8 %147, i32 3
  %149 = extractelement <64 x i32> %128, i32 4
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds i8, i8* %input, i64 %150
  %152 = load i8, i8* %151, align 1, !tbaa !250
  %153 = insertelement <64 x i8> %148, i8 %152, i32 4
  %154 = extractelement <64 x i32> %128, i32 5
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds i8, i8* %input, i64 %155
  %157 = load i8, i8* %156, align 1, !tbaa !250
  %158 = insertelement <64 x i8> %153, i8 %157, i32 5
  %159 = extractelement <64 x i32> %128, i32 6
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds i8, i8* %input, i64 %160
  %162 = load i8, i8* %161, align 1, !tbaa !250
  %163 = insertelement <64 x i8> %158, i8 %162, i32 6
  %164 = extractelement <64 x i32> %128, i32 7
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds i8, i8* %input, i64 %165
  %167 = load i8, i8* %166, align 1, !tbaa !250
  %168 = insertelement <64 x i8> %163, i8 %167, i32 7
  %169 = extractelement <64 x i32> %128, i32 8
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds i8, i8* %input, i64 %170
  %172 = load i8, i8* %171, align 1, !tbaa !250
  %173 = insertelement <64 x i8> %168, i8 %172, i32 8
  %174 = extractelement <64 x i32> %128, i32 9
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds i8, i8* %input, i64 %175
  %177 = load i8, i8* %176, align 1, !tbaa !250
  %178 = insertelement <64 x i8> %173, i8 %177, i32 9
  %179 = extractelement <64 x i32> %128, i32 10
  %180 = sext i32 %179 to i64
  %181 = getelementptr inbounds i8, i8* %input, i64 %180
  %182 = load i8, i8* %181, align 1, !tbaa !250
  %183 = insertelement <64 x i8> %178, i8 %182, i32 10
  %184 = extractelement <64 x i32> %128, i32 11
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds i8, i8* %input, i64 %185
  %187 = load i8, i8* %186, align 1, !tbaa !250
  %188 = insertelement <64 x i8> %183, i8 %187, i32 11
  %189 = extractelement <64 x i32> %128, i32 12
  %190 = sext i32 %189 to i64
  %191 = getelementptr inbounds i8, i8* %input, i64 %190
  %192 = load i8, i8* %191, align 1, !tbaa !250
  %193 = insertelement <64 x i8> %188, i8 %192, i32 12
  %194 = extractelement <64 x i32> %128, i32 13
  %195 = sext i32 %194 to i64
  %196 = getelementptr inbounds i8, i8* %input, i64 %195
  %197 = load i8, i8* %196, align 1, !tbaa !250
  %198 = insertelement <64 x i8> %193, i8 %197, i32 13
  %199 = extractelement <64 x i32> %128, i32 14
  %200 = sext i32 %199 to i64
  %201 = getelementptr inbounds i8, i8* %input, i64 %200
  %202 = load i8, i8* %201, align 1, !tbaa !250
  %203 = insertelement <64 x i8> %198, i8 %202, i32 14
  %204 = extractelement <64 x i32> %128, i32 15
  %205 = sext i32 %204 to i64
  %206 = getelementptr inbounds i8, i8* %input, i64 %205
  %207 = load i8, i8* %206, align 1, !tbaa !250
  %208 = insertelement <64 x i8> %203, i8 %207, i32 15
  %209 = extractelement <64 x i32> %128, i32 16
  %210 = sext i32 %209 to i64
  %211 = getelementptr inbounds i8, i8* %input, i64 %210
  %212 = load i8, i8* %211, align 1, !tbaa !250
  %213 = insertelement <64 x i8> %208, i8 %212, i32 16
  %214 = extractelement <64 x i32> %128, i32 17
  %215 = sext i32 %214 to i64
  %216 = getelementptr inbounds i8, i8* %input, i64 %215
  %217 = load i8, i8* %216, align 1, !tbaa !250
  %218 = insertelement <64 x i8> %213, i8 %217, i32 17
  %219 = extractelement <64 x i32> %128, i32 18
  %220 = sext i32 %219 to i64
  %221 = getelementptr inbounds i8, i8* %input, i64 %220
  %222 = load i8, i8* %221, align 1, !tbaa !250
  %223 = insertelement <64 x i8> %218, i8 %222, i32 18
  %224 = extractelement <64 x i32> %128, i32 19
  %225 = sext i32 %224 to i64
  %226 = getelementptr inbounds i8, i8* %input, i64 %225
  %227 = load i8, i8* %226, align 1, !tbaa !250
  %228 = insertelement <64 x i8> %223, i8 %227, i32 19
  %229 = extractelement <64 x i32> %128, i32 20
  %230 = sext i32 %229 to i64
  %231 = getelementptr inbounds i8, i8* %input, i64 %230
  %232 = load i8, i8* %231, align 1, !tbaa !250
  %233 = insertelement <64 x i8> %228, i8 %232, i32 20
  %234 = extractelement <64 x i32> %128, i32 21
  %235 = sext i32 %234 to i64
  %236 = getelementptr inbounds i8, i8* %input, i64 %235
  %237 = load i8, i8* %236, align 1, !tbaa !250
  %238 = insertelement <64 x i8> %233, i8 %237, i32 21
  %239 = extractelement <64 x i32> %128, i32 22
  %240 = sext i32 %239 to i64
  %241 = getelementptr inbounds i8, i8* %input, i64 %240
  %242 = load i8, i8* %241, align 1, !tbaa !250
  %243 = insertelement <64 x i8> %238, i8 %242, i32 22
  %244 = extractelement <64 x i32> %128, i32 23
  %245 = sext i32 %244 to i64
  %246 = getelementptr inbounds i8, i8* %input, i64 %245
  %247 = load i8, i8* %246, align 1, !tbaa !250
  %248 = insertelement <64 x i8> %243, i8 %247, i32 23
  %249 = extractelement <64 x i32> %128, i32 24
  %250 = sext i32 %249 to i64
  %251 = getelementptr inbounds i8, i8* %input, i64 %250
  %252 = load i8, i8* %251, align 1, !tbaa !250
  %253 = insertelement <64 x i8> %248, i8 %252, i32 24
  %254 = extractelement <64 x i32> %128, i32 25
  %255 = sext i32 %254 to i64
  %256 = getelementptr inbounds i8, i8* %input, i64 %255
  %257 = load i8, i8* %256, align 1, !tbaa !250
  %258 = insertelement <64 x i8> %253, i8 %257, i32 25
  %259 = extractelement <64 x i32> %128, i32 26
  %260 = sext i32 %259 to i64
  %261 = getelementptr inbounds i8, i8* %input, i64 %260
  %262 = load i8, i8* %261, align 1, !tbaa !250
  %263 = insertelement <64 x i8> %258, i8 %262, i32 26
  %264 = extractelement <64 x i32> %128, i32 27
  %265 = sext i32 %264 to i64
  %266 = getelementptr inbounds i8, i8* %input, i64 %265
  %267 = load i8, i8* %266, align 1, !tbaa !250
  %268 = insertelement <64 x i8> %263, i8 %267, i32 27
  %269 = extractelement <64 x i32> %128, i32 28
  %270 = sext i32 %269 to i64
  %271 = getelementptr inbounds i8, i8* %input, i64 %270
  %272 = load i8, i8* %271, align 1, !tbaa !250
  %273 = insertelement <64 x i8> %268, i8 %272, i32 28
  %274 = extractelement <64 x i32> %128, i32 29
  %275 = sext i32 %274 to i64
  %276 = getelementptr inbounds i8, i8* %input, i64 %275
  %277 = load i8, i8* %276, align 1, !tbaa !250
  %278 = insertelement <64 x i8> %273, i8 %277, i32 29
  %279 = extractelement <64 x i32> %128, i32 30
  %280 = sext i32 %279 to i64
  %281 = getelementptr inbounds i8, i8* %input, i64 %280
  %282 = load i8, i8* %281, align 1, !tbaa !250
  %283 = insertelement <64 x i8> %278, i8 %282, i32 30
  %284 = extractelement <64 x i32> %128, i32 31
  %285 = sext i32 %284 to i64
  %286 = getelementptr inbounds i8, i8* %input, i64 %285
  %287 = load i8, i8* %286, align 1, !tbaa !250
  %288 = insertelement <64 x i8> %283, i8 %287, i32 31
  %289 = extractelement <64 x i32> %128, i32 32
  %290 = sext i32 %289 to i64
  %291 = getelementptr inbounds i8, i8* %input, i64 %290
  %292 = load i8, i8* %291, align 1, !tbaa !250
  %293 = insertelement <64 x i8> %288, i8 %292, i32 32
  %294 = extractelement <64 x i32> %128, i32 33
  %295 = sext i32 %294 to i64
  %296 = getelementptr inbounds i8, i8* %input, i64 %295
  %297 = load i8, i8* %296, align 1, !tbaa !250
  %298 = insertelement <64 x i8> %293, i8 %297, i32 33
  %299 = extractelement <64 x i32> %128, i32 34
  %300 = sext i32 %299 to i64
  %301 = getelementptr inbounds i8, i8* %input, i64 %300
  %302 = load i8, i8* %301, align 1, !tbaa !250
  %303 = insertelement <64 x i8> %298, i8 %302, i32 34
  %304 = extractelement <64 x i32> %128, i32 35
  %305 = sext i32 %304 to i64
  %306 = getelementptr inbounds i8, i8* %input, i64 %305
  %307 = load i8, i8* %306, align 1, !tbaa !250
  %308 = insertelement <64 x i8> %303, i8 %307, i32 35
  %309 = extractelement <64 x i32> %128, i32 36
  %310 = sext i32 %309 to i64
  %311 = getelementptr inbounds i8, i8* %input, i64 %310
  %312 = load i8, i8* %311, align 1, !tbaa !250
  %313 = insertelement <64 x i8> %308, i8 %312, i32 36
  %314 = extractelement <64 x i32> %128, i32 37
  %315 = sext i32 %314 to i64
  %316 = getelementptr inbounds i8, i8* %input, i64 %315
  %317 = load i8, i8* %316, align 1, !tbaa !250
  %318 = insertelement <64 x i8> %313, i8 %317, i32 37
  %319 = extractelement <64 x i32> %128, i32 38
  %320 = sext i32 %319 to i64
  %321 = getelementptr inbounds i8, i8* %input, i64 %320
  %322 = load i8, i8* %321, align 1, !tbaa !250
  %323 = insertelement <64 x i8> %318, i8 %322, i32 38
  %324 = extractelement <64 x i32> %128, i32 39
  %325 = sext i32 %324 to i64
  %326 = getelementptr inbounds i8, i8* %input, i64 %325
  %327 = load i8, i8* %326, align 1, !tbaa !250
  %328 = insertelement <64 x i8> %323, i8 %327, i32 39
  %329 = extractelement <64 x i32> %128, i32 40
  %330 = sext i32 %329 to i64
  %331 = getelementptr inbounds i8, i8* %input, i64 %330
  %332 = load i8, i8* %331, align 1, !tbaa !250
  %333 = insertelement <64 x i8> %328, i8 %332, i32 40
  %334 = extractelement <64 x i32> %128, i32 41
  %335 = sext i32 %334 to i64
  %336 = getelementptr inbounds i8, i8* %input, i64 %335
  %337 = load i8, i8* %336, align 1, !tbaa !250
  %338 = insertelement <64 x i8> %333, i8 %337, i32 41
  %339 = extractelement <64 x i32> %128, i32 42
  %340 = sext i32 %339 to i64
  %341 = getelementptr inbounds i8, i8* %input, i64 %340
  %342 = load i8, i8* %341, align 1, !tbaa !250
  %343 = insertelement <64 x i8> %338, i8 %342, i32 42
  %344 = extractelement <64 x i32> %128, i32 43
  %345 = sext i32 %344 to i64
  %346 = getelementptr inbounds i8, i8* %input, i64 %345
  %347 = load i8, i8* %346, align 1, !tbaa !250
  %348 = insertelement <64 x i8> %343, i8 %347, i32 43
  %349 = extractelement <64 x i32> %128, i32 44
  %350 = sext i32 %349 to i64
  %351 = getelementptr inbounds i8, i8* %input, i64 %350
  %352 = load i8, i8* %351, align 1, !tbaa !250
  %353 = insertelement <64 x i8> %348, i8 %352, i32 44
  %354 = extractelement <64 x i32> %128, i32 45
  %355 = sext i32 %354 to i64
  %356 = getelementptr inbounds i8, i8* %input, i64 %355
  %357 = load i8, i8* %356, align 1, !tbaa !250
  %358 = insertelement <64 x i8> %353, i8 %357, i32 45
  %359 = extractelement <64 x i32> %128, i32 46
  %360 = sext i32 %359 to i64
  %361 = getelementptr inbounds i8, i8* %input, i64 %360
  %362 = load i8, i8* %361, align 1, !tbaa !250
  %363 = insertelement <64 x i8> %358, i8 %362, i32 46
  %364 = extractelement <64 x i32> %128, i32 47
  %365 = sext i32 %364 to i64
  %366 = getelementptr inbounds i8, i8* %input, i64 %365
  %367 = load i8, i8* %366, align 1, !tbaa !250
  %368 = insertelement <64 x i8> %363, i8 %367, i32 47
  %369 = extractelement <64 x i32> %128, i32 48
  %370 = sext i32 %369 to i64
  %371 = getelementptr inbounds i8, i8* %input, i64 %370
  %372 = load i8, i8* %371, align 1, !tbaa !250
  %373 = insertelement <64 x i8> %368, i8 %372, i32 48
  %374 = extractelement <64 x i32> %128, i32 49
  %375 = sext i32 %374 to i64
  %376 = getelementptr inbounds i8, i8* %input, i64 %375
  %377 = load i8, i8* %376, align 1, !tbaa !250
  %378 = insertelement <64 x i8> %373, i8 %377, i32 49
  %379 = extractelement <64 x i32> %128, i32 50
  %380 = sext i32 %379 to i64
  %381 = getelementptr inbounds i8, i8* %input, i64 %380
  %382 = load i8, i8* %381, align 1, !tbaa !250
  %383 = insertelement <64 x i8> %378, i8 %382, i32 50
  %384 = extractelement <64 x i32> %128, i32 51
  %385 = sext i32 %384 to i64
  %386 = getelementptr inbounds i8, i8* %input, i64 %385
  %387 = load i8, i8* %386, align 1, !tbaa !250
  %388 = insertelement <64 x i8> %383, i8 %387, i32 51
  %389 = extractelement <64 x i32> %128, i32 52
  %390 = sext i32 %389 to i64
  %391 = getelementptr inbounds i8, i8* %input, i64 %390
  %392 = load i8, i8* %391, align 1, !tbaa !250
  %393 = insertelement <64 x i8> %388, i8 %392, i32 52
  %394 = extractelement <64 x i32> %128, i32 53
  %395 = sext i32 %394 to i64
  %396 = getelementptr inbounds i8, i8* %input, i64 %395
  %397 = load i8, i8* %396, align 1, !tbaa !250
  %398 = insertelement <64 x i8> %393, i8 %397, i32 53
  %399 = extractelement <64 x i32> %128, i32 54
  %400 = sext i32 %399 to i64
  %401 = getelementptr inbounds i8, i8* %input, i64 %400
  %402 = load i8, i8* %401, align 1, !tbaa !250
  %403 = insertelement <64 x i8> %398, i8 %402, i32 54
  %404 = extractelement <64 x i32> %128, i32 55
  %405 = sext i32 %404 to i64
  %406 = getelementptr inbounds i8, i8* %input, i64 %405
  %407 = load i8, i8* %406, align 1, !tbaa !250
  %408 = insertelement <64 x i8> %403, i8 %407, i32 55
  %409 = extractelement <64 x i32> %128, i32 56
  %410 = sext i32 %409 to i64
  %411 = getelementptr inbounds i8, i8* %input, i64 %410
  %412 = load i8, i8* %411, align 1, !tbaa !250
  %413 = insertelement <64 x i8> %408, i8 %412, i32 56
  %414 = extractelement <64 x i32> %128, i32 57
  %415 = sext i32 %414 to i64
  %416 = getelementptr inbounds i8, i8* %input, i64 %415
  %417 = load i8, i8* %416, align 1, !tbaa !250
  %418 = insertelement <64 x i8> %413, i8 %417, i32 57
  %419 = extractelement <64 x i32> %128, i32 58
  %420 = sext i32 %419 to i64
  %421 = getelementptr inbounds i8, i8* %input, i64 %420
  %422 = load i8, i8* %421, align 1, !tbaa !250
  %423 = insertelement <64 x i8> %418, i8 %422, i32 58
  %424 = extractelement <64 x i32> %128, i32 59
  %425 = sext i32 %424 to i64
  %426 = getelementptr inbounds i8, i8* %input, i64 %425
  %427 = load i8, i8* %426, align 1, !tbaa !250
  %428 = insertelement <64 x i8> %423, i8 %427, i32 59
  %429 = extractelement <64 x i32> %128, i32 60
  %430 = sext i32 %429 to i64
  %431 = getelementptr inbounds i8, i8* %input, i64 %430
  %432 = load i8, i8* %431, align 1, !tbaa !250
  %433 = insertelement <64 x i8> %428, i8 %432, i32 60
  %434 = extractelement <64 x i32> %128, i32 61
  %435 = sext i32 %434 to i64
  %436 = getelementptr inbounds i8, i8* %input, i64 %435
  %437 = load i8, i8* %436, align 1, !tbaa !250
  %438 = insertelement <64 x i8> %433, i8 %437, i32 61
  %439 = extractelement <64 x i32> %128, i32 62
  %440 = sext i32 %439 to i64
  %441 = getelementptr inbounds i8, i8* %input, i64 %440
  %442 = load i8, i8* %441, align 1, !tbaa !250
  %443 = insertelement <64 x i8> %438, i8 %442, i32 62
  %444 = extractelement <64 x i32> %128, i32 63
  %445 = sext i32 %444 to i64
  %446 = getelementptr inbounds i8, i8* %input, i64 %445
  %447 = load i8, i8* %446, align 1, !tbaa !250
  %448 = insertelement <64 x i8> %443, i8 %447, i32 63
  %449 = sext i32 %bounded_input.s0.x.xi.base to i64
  %450 = add nsw i64 %449, %84
  %451 = getelementptr inbounds i8, i8* %29, i64 %450
  %452 = bitcast i8* %451 to <64 x i8>*
  store <64 x i8> %448, <64 x i8>* %452, align 1, !tbaa !253
  %453 = add nuw nsw i32 %bounded_input.s0.x.x, 1
  %454 = icmp eq i32 %453, %t280
  br i1 %454, label %"end for bounded_input.s0.x.x", label %"for bounded_input.s0.x.x"

"end for bounded_input.s0.x.x":                   ; preds = %"for bounded_input.s0.x.x", %"for bounded_input.s0.y"
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %455 = add nsw i32 %a46, 1
  %456 = trunc i64 %indvars.iv.next to i32
  %457 = icmp eq i32 %40, %456
  br i1 %457, label %"end for bounded_input.s0.y", label %"for bounded_input.s0.y"

"for bounded_input.s0.y1":                        ; preds = %"end for bounded_input.s0.x.x11", %"for bounded_input.s0.y1.preheader"
  %indvars.iv35 = phi i64 [ %55, %"for bounded_input.s0.y1.preheader" ], [ %indvars.iv.next36, %"end for bounded_input.s0.x.x11" ]
  %bounded_input.s0.y = phi i32 [ %a38, %"for bounded_input.s0.y1.preheader" ], [ %1190, %"end for bounded_input.s0.x.x11" ]
  %458 = mul nsw i64 %indvars.iv35, %56
  %459 = add nsw i32 %bounded_input.s0.y, %t283
  %460 = mul nsw i32 %459, %t284
  %t300 = sub nsw i32 %460, %t257
  br i1 %96, label %"for bounded_input.s0.x.x3.preheader", label %"end for bounded_input.s0.x.x4", !prof !242

"for bounded_input.s0.x.x3.preheader":            ; preds = %"for bounded_input.s0.y1"
  %461 = trunc i64 %458 to i32
  %462 = insertelement <64 x i32> undef, i32 %461, i32 0
  %463 = shufflevector <64 x i32> %462, <64 x i32> undef, <64 x i32> zeroinitializer
  %464 = sext i32 %t300 to i64
  br label %"for bounded_input.s0.x.x3"

"end for bounded_input.s0.y2":                    ; preds = %"end for bounded_input.s0.x.x11", %"end for bounded_input.s0.y"
  br i1 %46, label %"for bounded_input.s0.y14.preheader", label %"consume bounded_input", !prof !242

"for bounded_input.s0.y14.preheader":             ; preds = %"end for bounded_input.s0.y2"
  %465 = icmp sgt i32 %73, -193
  br label %"for bounded_input.s0.y14"

"for bounded_input.s0.x.x3":                      ; preds = %"for bounded_input.s0.x.x3", %"for bounded_input.s0.x.x3.preheader"
  %bounded_input.s0.x.x5 = phi i32 [ %818, %"for bounded_input.s0.x.x3" ], [ 0, %"for bounded_input.s0.x.x3.preheader" ]
  %466 = shl nsw i32 %bounded_input.s0.x.x5, 6
  %a57 = add nsw i32 %466, %bounded_input.s0.x.min_2
  %467 = icmp sgt i32 %b49, %a57
  %bounded_input.s0.x.xi.base6 = select i1 %467, i32 %a57, i32 %b49
  %468 = insertelement <64 x i32> undef, i32 %bounded_input.s0.x.xi.base6, i32 0
  %469 = shufflevector <64 x i32> %468, <64 x i32> undef, <64 x i32> zeroinitializer
  %a59 = add nsw <64 x i32> %469, <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %470 = shufflevector <64 x i32> %a59, <64 x i32> undef, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %471 = icmp sgt <16 x i32> %45, %470
  %472 = shufflevector <64 x i32> %a59, <64 x i32> undef, <16 x i32> <i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %473 = icmp sgt <16 x i32> %45, %472
  %474 = shufflevector <64 x i32> %a59, <64 x i32> undef, <16 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47>
  %475 = icmp sgt <16 x i32> %45, %474
  %476 = shufflevector <64 x i32> %a59, <64 x i32> undef, <16 x i32> <i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %477 = icmp sgt <16 x i32> %45, %476
  %478 = select <16 x i1> %471, <16 x i32> %470, <16 x i32> %45
  %479 = select <16 x i1> %473, <16 x i32> %472, <16 x i32> %45
  %480 = select <16 x i1> %475, <16 x i32> %474, <16 x i32> %45
  %481 = select <16 x i1> %477, <16 x i32> %476, <16 x i32> %45
  %482 = icmp sgt <16 x i32> %478, zeroinitializer
  %483 = icmp sgt <16 x i32> %479, zeroinitializer
  %484 = icmp sgt <16 x i32> %480, zeroinitializer
  %485 = icmp sgt <16 x i32> %481, zeroinitializer
  %486 = select <16 x i1> %482, <16 x i32> %478, <16 x i32> zeroinitializer
  %487 = select <16 x i1> %483, <16 x i32> %479, <16 x i32> zeroinitializer
  %488 = select <16 x i1> %484, <16 x i32> %480, <16 x i32> zeroinitializer
  %489 = select <16 x i1> %485, <16 x i32> %481, <16 x i32> zeroinitializer
  %490 = shufflevector <16 x i32> %486, <16 x i32> %487, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %491 = shufflevector <16 x i32> %488, <16 x i32> %489, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %492 = shufflevector <32 x i32> %490, <32 x i32> %491, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %493 = add nsw <64 x i32> %492, %463
  %494 = extractelement <64 x i32> %493, i32 0
  %495 = sext i32 %494 to i64
  %496 = getelementptr inbounds i8, i8* %input, i64 %495
  %497 = load i8, i8* %496, align 1, !tbaa !250
  %498 = insertelement <64 x i8> undef, i8 %497, i32 0
  %499 = extractelement <64 x i32> %493, i32 1
  %500 = sext i32 %499 to i64
  %501 = getelementptr inbounds i8, i8* %input, i64 %500
  %502 = load i8, i8* %501, align 1, !tbaa !250
  %503 = insertelement <64 x i8> %498, i8 %502, i32 1
  %504 = extractelement <64 x i32> %493, i32 2
  %505 = sext i32 %504 to i64
  %506 = getelementptr inbounds i8, i8* %input, i64 %505
  %507 = load i8, i8* %506, align 1, !tbaa !250
  %508 = insertelement <64 x i8> %503, i8 %507, i32 2
  %509 = extractelement <64 x i32> %493, i32 3
  %510 = sext i32 %509 to i64
  %511 = getelementptr inbounds i8, i8* %input, i64 %510
  %512 = load i8, i8* %511, align 1, !tbaa !250
  %513 = insertelement <64 x i8> %508, i8 %512, i32 3
  %514 = extractelement <64 x i32> %493, i32 4
  %515 = sext i32 %514 to i64
  %516 = getelementptr inbounds i8, i8* %input, i64 %515
  %517 = load i8, i8* %516, align 1, !tbaa !250
  %518 = insertelement <64 x i8> %513, i8 %517, i32 4
  %519 = extractelement <64 x i32> %493, i32 5
  %520 = sext i32 %519 to i64
  %521 = getelementptr inbounds i8, i8* %input, i64 %520
  %522 = load i8, i8* %521, align 1, !tbaa !250
  %523 = insertelement <64 x i8> %518, i8 %522, i32 5
  %524 = extractelement <64 x i32> %493, i32 6
  %525 = sext i32 %524 to i64
  %526 = getelementptr inbounds i8, i8* %input, i64 %525
  %527 = load i8, i8* %526, align 1, !tbaa !250
  %528 = insertelement <64 x i8> %523, i8 %527, i32 6
  %529 = extractelement <64 x i32> %493, i32 7
  %530 = sext i32 %529 to i64
  %531 = getelementptr inbounds i8, i8* %input, i64 %530
  %532 = load i8, i8* %531, align 1, !tbaa !250
  %533 = insertelement <64 x i8> %528, i8 %532, i32 7
  %534 = extractelement <64 x i32> %493, i32 8
  %535 = sext i32 %534 to i64
  %536 = getelementptr inbounds i8, i8* %input, i64 %535
  %537 = load i8, i8* %536, align 1, !tbaa !250
  %538 = insertelement <64 x i8> %533, i8 %537, i32 8
  %539 = extractelement <64 x i32> %493, i32 9
  %540 = sext i32 %539 to i64
  %541 = getelementptr inbounds i8, i8* %input, i64 %540
  %542 = load i8, i8* %541, align 1, !tbaa !250
  %543 = insertelement <64 x i8> %538, i8 %542, i32 9
  %544 = extractelement <64 x i32> %493, i32 10
  %545 = sext i32 %544 to i64
  %546 = getelementptr inbounds i8, i8* %input, i64 %545
  %547 = load i8, i8* %546, align 1, !tbaa !250
  %548 = insertelement <64 x i8> %543, i8 %547, i32 10
  %549 = extractelement <64 x i32> %493, i32 11
  %550 = sext i32 %549 to i64
  %551 = getelementptr inbounds i8, i8* %input, i64 %550
  %552 = load i8, i8* %551, align 1, !tbaa !250
  %553 = insertelement <64 x i8> %548, i8 %552, i32 11
  %554 = extractelement <64 x i32> %493, i32 12
  %555 = sext i32 %554 to i64
  %556 = getelementptr inbounds i8, i8* %input, i64 %555
  %557 = load i8, i8* %556, align 1, !tbaa !250
  %558 = insertelement <64 x i8> %553, i8 %557, i32 12
  %559 = extractelement <64 x i32> %493, i32 13
  %560 = sext i32 %559 to i64
  %561 = getelementptr inbounds i8, i8* %input, i64 %560
  %562 = load i8, i8* %561, align 1, !tbaa !250
  %563 = insertelement <64 x i8> %558, i8 %562, i32 13
  %564 = extractelement <64 x i32> %493, i32 14
  %565 = sext i32 %564 to i64
  %566 = getelementptr inbounds i8, i8* %input, i64 %565
  %567 = load i8, i8* %566, align 1, !tbaa !250
  %568 = insertelement <64 x i8> %563, i8 %567, i32 14
  %569 = extractelement <64 x i32> %493, i32 15
  %570 = sext i32 %569 to i64
  %571 = getelementptr inbounds i8, i8* %input, i64 %570
  %572 = load i8, i8* %571, align 1, !tbaa !250
  %573 = insertelement <64 x i8> %568, i8 %572, i32 15
  %574 = extractelement <64 x i32> %493, i32 16
  %575 = sext i32 %574 to i64
  %576 = getelementptr inbounds i8, i8* %input, i64 %575
  %577 = load i8, i8* %576, align 1, !tbaa !250
  %578 = insertelement <64 x i8> %573, i8 %577, i32 16
  %579 = extractelement <64 x i32> %493, i32 17
  %580 = sext i32 %579 to i64
  %581 = getelementptr inbounds i8, i8* %input, i64 %580
  %582 = load i8, i8* %581, align 1, !tbaa !250
  %583 = insertelement <64 x i8> %578, i8 %582, i32 17
  %584 = extractelement <64 x i32> %493, i32 18
  %585 = sext i32 %584 to i64
  %586 = getelementptr inbounds i8, i8* %input, i64 %585
  %587 = load i8, i8* %586, align 1, !tbaa !250
  %588 = insertelement <64 x i8> %583, i8 %587, i32 18
  %589 = extractelement <64 x i32> %493, i32 19
  %590 = sext i32 %589 to i64
  %591 = getelementptr inbounds i8, i8* %input, i64 %590
  %592 = load i8, i8* %591, align 1, !tbaa !250
  %593 = insertelement <64 x i8> %588, i8 %592, i32 19
  %594 = extractelement <64 x i32> %493, i32 20
  %595 = sext i32 %594 to i64
  %596 = getelementptr inbounds i8, i8* %input, i64 %595
  %597 = load i8, i8* %596, align 1, !tbaa !250
  %598 = insertelement <64 x i8> %593, i8 %597, i32 20
  %599 = extractelement <64 x i32> %493, i32 21
  %600 = sext i32 %599 to i64
  %601 = getelementptr inbounds i8, i8* %input, i64 %600
  %602 = load i8, i8* %601, align 1, !tbaa !250
  %603 = insertelement <64 x i8> %598, i8 %602, i32 21
  %604 = extractelement <64 x i32> %493, i32 22
  %605 = sext i32 %604 to i64
  %606 = getelementptr inbounds i8, i8* %input, i64 %605
  %607 = load i8, i8* %606, align 1, !tbaa !250
  %608 = insertelement <64 x i8> %603, i8 %607, i32 22
  %609 = extractelement <64 x i32> %493, i32 23
  %610 = sext i32 %609 to i64
  %611 = getelementptr inbounds i8, i8* %input, i64 %610
  %612 = load i8, i8* %611, align 1, !tbaa !250
  %613 = insertelement <64 x i8> %608, i8 %612, i32 23
  %614 = extractelement <64 x i32> %493, i32 24
  %615 = sext i32 %614 to i64
  %616 = getelementptr inbounds i8, i8* %input, i64 %615
  %617 = load i8, i8* %616, align 1, !tbaa !250
  %618 = insertelement <64 x i8> %613, i8 %617, i32 24
  %619 = extractelement <64 x i32> %493, i32 25
  %620 = sext i32 %619 to i64
  %621 = getelementptr inbounds i8, i8* %input, i64 %620
  %622 = load i8, i8* %621, align 1, !tbaa !250
  %623 = insertelement <64 x i8> %618, i8 %622, i32 25
  %624 = extractelement <64 x i32> %493, i32 26
  %625 = sext i32 %624 to i64
  %626 = getelementptr inbounds i8, i8* %input, i64 %625
  %627 = load i8, i8* %626, align 1, !tbaa !250
  %628 = insertelement <64 x i8> %623, i8 %627, i32 26
  %629 = extractelement <64 x i32> %493, i32 27
  %630 = sext i32 %629 to i64
  %631 = getelementptr inbounds i8, i8* %input, i64 %630
  %632 = load i8, i8* %631, align 1, !tbaa !250
  %633 = insertelement <64 x i8> %628, i8 %632, i32 27
  %634 = extractelement <64 x i32> %493, i32 28
  %635 = sext i32 %634 to i64
  %636 = getelementptr inbounds i8, i8* %input, i64 %635
  %637 = load i8, i8* %636, align 1, !tbaa !250
  %638 = insertelement <64 x i8> %633, i8 %637, i32 28
  %639 = extractelement <64 x i32> %493, i32 29
  %640 = sext i32 %639 to i64
  %641 = getelementptr inbounds i8, i8* %input, i64 %640
  %642 = load i8, i8* %641, align 1, !tbaa !250
  %643 = insertelement <64 x i8> %638, i8 %642, i32 29
  %644 = extractelement <64 x i32> %493, i32 30
  %645 = sext i32 %644 to i64
  %646 = getelementptr inbounds i8, i8* %input, i64 %645
  %647 = load i8, i8* %646, align 1, !tbaa !250
  %648 = insertelement <64 x i8> %643, i8 %647, i32 30
  %649 = extractelement <64 x i32> %493, i32 31
  %650 = sext i32 %649 to i64
  %651 = getelementptr inbounds i8, i8* %input, i64 %650
  %652 = load i8, i8* %651, align 1, !tbaa !250
  %653 = insertelement <64 x i8> %648, i8 %652, i32 31
  %654 = extractelement <64 x i32> %493, i32 32
  %655 = sext i32 %654 to i64
  %656 = getelementptr inbounds i8, i8* %input, i64 %655
  %657 = load i8, i8* %656, align 1, !tbaa !250
  %658 = insertelement <64 x i8> %653, i8 %657, i32 32
  %659 = extractelement <64 x i32> %493, i32 33
  %660 = sext i32 %659 to i64
  %661 = getelementptr inbounds i8, i8* %input, i64 %660
  %662 = load i8, i8* %661, align 1, !tbaa !250
  %663 = insertelement <64 x i8> %658, i8 %662, i32 33
  %664 = extractelement <64 x i32> %493, i32 34
  %665 = sext i32 %664 to i64
  %666 = getelementptr inbounds i8, i8* %input, i64 %665
  %667 = load i8, i8* %666, align 1, !tbaa !250
  %668 = insertelement <64 x i8> %663, i8 %667, i32 34
  %669 = extractelement <64 x i32> %493, i32 35
  %670 = sext i32 %669 to i64
  %671 = getelementptr inbounds i8, i8* %input, i64 %670
  %672 = load i8, i8* %671, align 1, !tbaa !250
  %673 = insertelement <64 x i8> %668, i8 %672, i32 35
  %674 = extractelement <64 x i32> %493, i32 36
  %675 = sext i32 %674 to i64
  %676 = getelementptr inbounds i8, i8* %input, i64 %675
  %677 = load i8, i8* %676, align 1, !tbaa !250
  %678 = insertelement <64 x i8> %673, i8 %677, i32 36
  %679 = extractelement <64 x i32> %493, i32 37
  %680 = sext i32 %679 to i64
  %681 = getelementptr inbounds i8, i8* %input, i64 %680
  %682 = load i8, i8* %681, align 1, !tbaa !250
  %683 = insertelement <64 x i8> %678, i8 %682, i32 37
  %684 = extractelement <64 x i32> %493, i32 38
  %685 = sext i32 %684 to i64
  %686 = getelementptr inbounds i8, i8* %input, i64 %685
  %687 = load i8, i8* %686, align 1, !tbaa !250
  %688 = insertelement <64 x i8> %683, i8 %687, i32 38
  %689 = extractelement <64 x i32> %493, i32 39
  %690 = sext i32 %689 to i64
  %691 = getelementptr inbounds i8, i8* %input, i64 %690
  %692 = load i8, i8* %691, align 1, !tbaa !250
  %693 = insertelement <64 x i8> %688, i8 %692, i32 39
  %694 = extractelement <64 x i32> %493, i32 40
  %695 = sext i32 %694 to i64
  %696 = getelementptr inbounds i8, i8* %input, i64 %695
  %697 = load i8, i8* %696, align 1, !tbaa !250
  %698 = insertelement <64 x i8> %693, i8 %697, i32 40
  %699 = extractelement <64 x i32> %493, i32 41
  %700 = sext i32 %699 to i64
  %701 = getelementptr inbounds i8, i8* %input, i64 %700
  %702 = load i8, i8* %701, align 1, !tbaa !250
  %703 = insertelement <64 x i8> %698, i8 %702, i32 41
  %704 = extractelement <64 x i32> %493, i32 42
  %705 = sext i32 %704 to i64
  %706 = getelementptr inbounds i8, i8* %input, i64 %705
  %707 = load i8, i8* %706, align 1, !tbaa !250
  %708 = insertelement <64 x i8> %703, i8 %707, i32 42
  %709 = extractelement <64 x i32> %493, i32 43
  %710 = sext i32 %709 to i64
  %711 = getelementptr inbounds i8, i8* %input, i64 %710
  %712 = load i8, i8* %711, align 1, !tbaa !250
  %713 = insertelement <64 x i8> %708, i8 %712, i32 43
  %714 = extractelement <64 x i32> %493, i32 44
  %715 = sext i32 %714 to i64
  %716 = getelementptr inbounds i8, i8* %input, i64 %715
  %717 = load i8, i8* %716, align 1, !tbaa !250
  %718 = insertelement <64 x i8> %713, i8 %717, i32 44
  %719 = extractelement <64 x i32> %493, i32 45
  %720 = sext i32 %719 to i64
  %721 = getelementptr inbounds i8, i8* %input, i64 %720
  %722 = load i8, i8* %721, align 1, !tbaa !250
  %723 = insertelement <64 x i8> %718, i8 %722, i32 45
  %724 = extractelement <64 x i32> %493, i32 46
  %725 = sext i32 %724 to i64
  %726 = getelementptr inbounds i8, i8* %input, i64 %725
  %727 = load i8, i8* %726, align 1, !tbaa !250
  %728 = insertelement <64 x i8> %723, i8 %727, i32 46
  %729 = extractelement <64 x i32> %493, i32 47
  %730 = sext i32 %729 to i64
  %731 = getelementptr inbounds i8, i8* %input, i64 %730
  %732 = load i8, i8* %731, align 1, !tbaa !250
  %733 = insertelement <64 x i8> %728, i8 %732, i32 47
  %734 = extractelement <64 x i32> %493, i32 48
  %735 = sext i32 %734 to i64
  %736 = getelementptr inbounds i8, i8* %input, i64 %735
  %737 = load i8, i8* %736, align 1, !tbaa !250
  %738 = insertelement <64 x i8> %733, i8 %737, i32 48
  %739 = extractelement <64 x i32> %493, i32 49
  %740 = sext i32 %739 to i64
  %741 = getelementptr inbounds i8, i8* %input, i64 %740
  %742 = load i8, i8* %741, align 1, !tbaa !250
  %743 = insertelement <64 x i8> %738, i8 %742, i32 49
  %744 = extractelement <64 x i32> %493, i32 50
  %745 = sext i32 %744 to i64
  %746 = getelementptr inbounds i8, i8* %input, i64 %745
  %747 = load i8, i8* %746, align 1, !tbaa !250
  %748 = insertelement <64 x i8> %743, i8 %747, i32 50
  %749 = extractelement <64 x i32> %493, i32 51
  %750 = sext i32 %749 to i64
  %751 = getelementptr inbounds i8, i8* %input, i64 %750
  %752 = load i8, i8* %751, align 1, !tbaa !250
  %753 = insertelement <64 x i8> %748, i8 %752, i32 51
  %754 = extractelement <64 x i32> %493, i32 52
  %755 = sext i32 %754 to i64
  %756 = getelementptr inbounds i8, i8* %input, i64 %755
  %757 = load i8, i8* %756, align 1, !tbaa !250
  %758 = insertelement <64 x i8> %753, i8 %757, i32 52
  %759 = extractelement <64 x i32> %493, i32 53
  %760 = sext i32 %759 to i64
  %761 = getelementptr inbounds i8, i8* %input, i64 %760
  %762 = load i8, i8* %761, align 1, !tbaa !250
  %763 = insertelement <64 x i8> %758, i8 %762, i32 53
  %764 = extractelement <64 x i32> %493, i32 54
  %765 = sext i32 %764 to i64
  %766 = getelementptr inbounds i8, i8* %input, i64 %765
  %767 = load i8, i8* %766, align 1, !tbaa !250
  %768 = insertelement <64 x i8> %763, i8 %767, i32 54
  %769 = extractelement <64 x i32> %493, i32 55
  %770 = sext i32 %769 to i64
  %771 = getelementptr inbounds i8, i8* %input, i64 %770
  %772 = load i8, i8* %771, align 1, !tbaa !250
  %773 = insertelement <64 x i8> %768, i8 %772, i32 55
  %774 = extractelement <64 x i32> %493, i32 56
  %775 = sext i32 %774 to i64
  %776 = getelementptr inbounds i8, i8* %input, i64 %775
  %777 = load i8, i8* %776, align 1, !tbaa !250
  %778 = insertelement <64 x i8> %773, i8 %777, i32 56
  %779 = extractelement <64 x i32> %493, i32 57
  %780 = sext i32 %779 to i64
  %781 = getelementptr inbounds i8, i8* %input, i64 %780
  %782 = load i8, i8* %781, align 1, !tbaa !250
  %783 = insertelement <64 x i8> %778, i8 %782, i32 57
  %784 = extractelement <64 x i32> %493, i32 58
  %785 = sext i32 %784 to i64
  %786 = getelementptr inbounds i8, i8* %input, i64 %785
  %787 = load i8, i8* %786, align 1, !tbaa !250
  %788 = insertelement <64 x i8> %783, i8 %787, i32 58
  %789 = extractelement <64 x i32> %493, i32 59
  %790 = sext i32 %789 to i64
  %791 = getelementptr inbounds i8, i8* %input, i64 %790
  %792 = load i8, i8* %791, align 1, !tbaa !250
  %793 = insertelement <64 x i8> %788, i8 %792, i32 59
  %794 = extractelement <64 x i32> %493, i32 60
  %795 = sext i32 %794 to i64
  %796 = getelementptr inbounds i8, i8* %input, i64 %795
  %797 = load i8, i8* %796, align 1, !tbaa !250
  %798 = insertelement <64 x i8> %793, i8 %797, i32 60
  %799 = extractelement <64 x i32> %493, i32 61
  %800 = sext i32 %799 to i64
  %801 = getelementptr inbounds i8, i8* %input, i64 %800
  %802 = load i8, i8* %801, align 1, !tbaa !250
  %803 = insertelement <64 x i8> %798, i8 %802, i32 61
  %804 = extractelement <64 x i32> %493, i32 62
  %805 = sext i32 %804 to i64
  %806 = getelementptr inbounds i8, i8* %input, i64 %805
  %807 = load i8, i8* %806, align 1, !tbaa !250
  %808 = insertelement <64 x i8> %803, i8 %807, i32 62
  %809 = extractelement <64 x i32> %493, i32 63
  %810 = sext i32 %809 to i64
  %811 = getelementptr inbounds i8, i8* %input, i64 %810
  %812 = load i8, i8* %811, align 1, !tbaa !250
  %813 = insertelement <64 x i8> %808, i8 %812, i32 63
  %814 = sext i32 %bounded_input.s0.x.xi.base6 to i64
  %815 = add nsw i64 %814, %464
  %816 = getelementptr inbounds i8, i8* %29, i64 %815
  %817 = bitcast i8* %816 to <64 x i8>*
  store <64 x i8> %813, <64 x i8>* %817, align 1, !tbaa !253
  %818 = add nuw nsw i32 %bounded_input.s0.x.x5, 1
  %819 = icmp eq i32 %818, %b54
  br i1 %819, label %"end for bounded_input.s0.x.x4", label %"for bounded_input.s0.x.x3"

"end for bounded_input.s0.x.x4":                  ; preds = %"for bounded_input.s0.x.x3", %"for bounded_input.s0.y1"
  br i1 %95, label %"for bounded_input.s0.x.x7.preheader", label %"end for bounded_input.s0.x.x8", !prof !242

"for bounded_input.s0.x.x7.preheader":            ; preds = %"end for bounded_input.s0.x.x4"
  %820 = add nsw i64 %458, %100
  %t303 = add nsw i32 %97, %460
  %821 = sext i32 %t303 to i64
  br label %"for bounded_input.s0.x.x7"

"for bounded_input.s0.x.x7":                      ; preds = %"for bounded_input.s0.x.x7", %"for bounded_input.s0.x.x7.preheader"
  %indvars.iv31 = phi i64 [ %99, %"for bounded_input.s0.x.x7.preheader" ], [ %indvars.iv.next32, %"for bounded_input.s0.x.x7" ]
  %822 = shl nsw i64 %indvars.iv31, 6
  %823 = add nsw i64 %822, %820
  %824 = getelementptr inbounds i8, i8* %input, i64 %823
  %825 = bitcast i8* %824 to <64 x i8>*
  %826 = load <64 x i8>, <64 x i8>* %825, align 1, !tbaa !250
  %827 = add nsw i64 %822, %821
  %828 = getelementptr inbounds i8, i8* %29, i64 %827
  %829 = bitcast i8* %828 to <64 x i8>*
  store <64 x i8> %826, <64 x i8>* %829, align 1, !tbaa !253
  %indvars.iv.next32 = add nsw i64 %indvars.iv31, 1
  %830 = trunc i64 %indvars.iv.next32 to i32
  %831 = icmp eq i32 %t289, %830
  br i1 %831, label %"end for bounded_input.s0.x.x8", label %"for bounded_input.s0.x.x7"

"end for bounded_input.s0.x.x8":                  ; preds = %"for bounded_input.s0.x.x7", %"end for bounded_input.s0.x.x4"
  br i1 %98, label %"for bounded_input.s0.x.x10.preheader", label %"end for bounded_input.s0.x.x11", !prof !242

"for bounded_input.s0.x.x10.preheader":           ; preds = %"end for bounded_input.s0.x.x8"
  %832 = trunc i64 %458 to i32
  %833 = insertelement <64 x i32> undef, i32 %832, i32 0
  %834 = shufflevector <64 x i32> %833, <64 x i32> undef, <64 x i32> zeroinitializer
  %835 = sext i32 %t300 to i64
  br label %"for bounded_input.s0.x.x10"

"for bounded_input.s0.x.x10":                     ; preds = %"for bounded_input.s0.x.x10", %"for bounded_input.s0.x.x10.preheader"
  %bounded_input.s0.x.x12 = phi i32 [ %1188, %"for bounded_input.s0.x.x10" ], [ %t289, %"for bounded_input.s0.x.x10.preheader" ]
  %836 = shl nsw i32 %bounded_input.s0.x.x12, 6
  %a60 = add nsw i32 %836, %bounded_input.s0.x.min_2
  %837 = icmp sgt i32 %b49, %a60
  %bounded_input.s0.x.xi.base13 = select i1 %837, i32 %a60, i32 %b49
  %838 = insertelement <64 x i32> undef, i32 %bounded_input.s0.x.xi.base13, i32 0
  %839 = shufflevector <64 x i32> %838, <64 x i32> undef, <64 x i32> zeroinitializer
  %a62 = add nsw <64 x i32> %839, <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %840 = shufflevector <64 x i32> %a62, <64 x i32> undef, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %841 = icmp sgt <16 x i32> %45, %840
  %842 = shufflevector <64 x i32> %a62, <64 x i32> undef, <16 x i32> <i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %843 = icmp sgt <16 x i32> %45, %842
  %844 = shufflevector <64 x i32> %a62, <64 x i32> undef, <16 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47>
  %845 = icmp sgt <16 x i32> %45, %844
  %846 = shufflevector <64 x i32> %a62, <64 x i32> undef, <16 x i32> <i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %847 = icmp sgt <16 x i32> %45, %846
  %848 = select <16 x i1> %841, <16 x i32> %840, <16 x i32> %45
  %849 = select <16 x i1> %843, <16 x i32> %842, <16 x i32> %45
  %850 = select <16 x i1> %845, <16 x i32> %844, <16 x i32> %45
  %851 = select <16 x i1> %847, <16 x i32> %846, <16 x i32> %45
  %852 = icmp sgt <16 x i32> %848, zeroinitializer
  %853 = icmp sgt <16 x i32> %849, zeroinitializer
  %854 = icmp sgt <16 x i32> %850, zeroinitializer
  %855 = icmp sgt <16 x i32> %851, zeroinitializer
  %856 = select <16 x i1> %852, <16 x i32> %848, <16 x i32> zeroinitializer
  %857 = select <16 x i1> %853, <16 x i32> %849, <16 x i32> zeroinitializer
  %858 = select <16 x i1> %854, <16 x i32> %850, <16 x i32> zeroinitializer
  %859 = select <16 x i1> %855, <16 x i32> %851, <16 x i32> zeroinitializer
  %860 = shufflevector <16 x i32> %856, <16 x i32> %857, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %861 = shufflevector <16 x i32> %858, <16 x i32> %859, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %862 = shufflevector <32 x i32> %860, <32 x i32> %861, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %863 = add nsw <64 x i32> %862, %834
  %864 = extractelement <64 x i32> %863, i32 0
  %865 = sext i32 %864 to i64
  %866 = getelementptr inbounds i8, i8* %input, i64 %865
  %867 = load i8, i8* %866, align 1, !tbaa !250
  %868 = insertelement <64 x i8> undef, i8 %867, i32 0
  %869 = extractelement <64 x i32> %863, i32 1
  %870 = sext i32 %869 to i64
  %871 = getelementptr inbounds i8, i8* %input, i64 %870
  %872 = load i8, i8* %871, align 1, !tbaa !250
  %873 = insertelement <64 x i8> %868, i8 %872, i32 1
  %874 = extractelement <64 x i32> %863, i32 2
  %875 = sext i32 %874 to i64
  %876 = getelementptr inbounds i8, i8* %input, i64 %875
  %877 = load i8, i8* %876, align 1, !tbaa !250
  %878 = insertelement <64 x i8> %873, i8 %877, i32 2
  %879 = extractelement <64 x i32> %863, i32 3
  %880 = sext i32 %879 to i64
  %881 = getelementptr inbounds i8, i8* %input, i64 %880
  %882 = load i8, i8* %881, align 1, !tbaa !250
  %883 = insertelement <64 x i8> %878, i8 %882, i32 3
  %884 = extractelement <64 x i32> %863, i32 4
  %885 = sext i32 %884 to i64
  %886 = getelementptr inbounds i8, i8* %input, i64 %885
  %887 = load i8, i8* %886, align 1, !tbaa !250
  %888 = insertelement <64 x i8> %883, i8 %887, i32 4
  %889 = extractelement <64 x i32> %863, i32 5
  %890 = sext i32 %889 to i64
  %891 = getelementptr inbounds i8, i8* %input, i64 %890
  %892 = load i8, i8* %891, align 1, !tbaa !250
  %893 = insertelement <64 x i8> %888, i8 %892, i32 5
  %894 = extractelement <64 x i32> %863, i32 6
  %895 = sext i32 %894 to i64
  %896 = getelementptr inbounds i8, i8* %input, i64 %895
  %897 = load i8, i8* %896, align 1, !tbaa !250
  %898 = insertelement <64 x i8> %893, i8 %897, i32 6
  %899 = extractelement <64 x i32> %863, i32 7
  %900 = sext i32 %899 to i64
  %901 = getelementptr inbounds i8, i8* %input, i64 %900
  %902 = load i8, i8* %901, align 1, !tbaa !250
  %903 = insertelement <64 x i8> %898, i8 %902, i32 7
  %904 = extractelement <64 x i32> %863, i32 8
  %905 = sext i32 %904 to i64
  %906 = getelementptr inbounds i8, i8* %input, i64 %905
  %907 = load i8, i8* %906, align 1, !tbaa !250
  %908 = insertelement <64 x i8> %903, i8 %907, i32 8
  %909 = extractelement <64 x i32> %863, i32 9
  %910 = sext i32 %909 to i64
  %911 = getelementptr inbounds i8, i8* %input, i64 %910
  %912 = load i8, i8* %911, align 1, !tbaa !250
  %913 = insertelement <64 x i8> %908, i8 %912, i32 9
  %914 = extractelement <64 x i32> %863, i32 10
  %915 = sext i32 %914 to i64
  %916 = getelementptr inbounds i8, i8* %input, i64 %915
  %917 = load i8, i8* %916, align 1, !tbaa !250
  %918 = insertelement <64 x i8> %913, i8 %917, i32 10
  %919 = extractelement <64 x i32> %863, i32 11
  %920 = sext i32 %919 to i64
  %921 = getelementptr inbounds i8, i8* %input, i64 %920
  %922 = load i8, i8* %921, align 1, !tbaa !250
  %923 = insertelement <64 x i8> %918, i8 %922, i32 11
  %924 = extractelement <64 x i32> %863, i32 12
  %925 = sext i32 %924 to i64
  %926 = getelementptr inbounds i8, i8* %input, i64 %925
  %927 = load i8, i8* %926, align 1, !tbaa !250
  %928 = insertelement <64 x i8> %923, i8 %927, i32 12
  %929 = extractelement <64 x i32> %863, i32 13
  %930 = sext i32 %929 to i64
  %931 = getelementptr inbounds i8, i8* %input, i64 %930
  %932 = load i8, i8* %931, align 1, !tbaa !250
  %933 = insertelement <64 x i8> %928, i8 %932, i32 13
  %934 = extractelement <64 x i32> %863, i32 14
  %935 = sext i32 %934 to i64
  %936 = getelementptr inbounds i8, i8* %input, i64 %935
  %937 = load i8, i8* %936, align 1, !tbaa !250
  %938 = insertelement <64 x i8> %933, i8 %937, i32 14
  %939 = extractelement <64 x i32> %863, i32 15
  %940 = sext i32 %939 to i64
  %941 = getelementptr inbounds i8, i8* %input, i64 %940
  %942 = load i8, i8* %941, align 1, !tbaa !250
  %943 = insertelement <64 x i8> %938, i8 %942, i32 15
  %944 = extractelement <64 x i32> %863, i32 16
  %945 = sext i32 %944 to i64
  %946 = getelementptr inbounds i8, i8* %input, i64 %945
  %947 = load i8, i8* %946, align 1, !tbaa !250
  %948 = insertelement <64 x i8> %943, i8 %947, i32 16
  %949 = extractelement <64 x i32> %863, i32 17
  %950 = sext i32 %949 to i64
  %951 = getelementptr inbounds i8, i8* %input, i64 %950
  %952 = load i8, i8* %951, align 1, !tbaa !250
  %953 = insertelement <64 x i8> %948, i8 %952, i32 17
  %954 = extractelement <64 x i32> %863, i32 18
  %955 = sext i32 %954 to i64
  %956 = getelementptr inbounds i8, i8* %input, i64 %955
  %957 = load i8, i8* %956, align 1, !tbaa !250
  %958 = insertelement <64 x i8> %953, i8 %957, i32 18
  %959 = extractelement <64 x i32> %863, i32 19
  %960 = sext i32 %959 to i64
  %961 = getelementptr inbounds i8, i8* %input, i64 %960
  %962 = load i8, i8* %961, align 1, !tbaa !250
  %963 = insertelement <64 x i8> %958, i8 %962, i32 19
  %964 = extractelement <64 x i32> %863, i32 20
  %965 = sext i32 %964 to i64
  %966 = getelementptr inbounds i8, i8* %input, i64 %965
  %967 = load i8, i8* %966, align 1, !tbaa !250
  %968 = insertelement <64 x i8> %963, i8 %967, i32 20
  %969 = extractelement <64 x i32> %863, i32 21
  %970 = sext i32 %969 to i64
  %971 = getelementptr inbounds i8, i8* %input, i64 %970
  %972 = load i8, i8* %971, align 1, !tbaa !250
  %973 = insertelement <64 x i8> %968, i8 %972, i32 21
  %974 = extractelement <64 x i32> %863, i32 22
  %975 = sext i32 %974 to i64
  %976 = getelementptr inbounds i8, i8* %input, i64 %975
  %977 = load i8, i8* %976, align 1, !tbaa !250
  %978 = insertelement <64 x i8> %973, i8 %977, i32 22
  %979 = extractelement <64 x i32> %863, i32 23
  %980 = sext i32 %979 to i64
  %981 = getelementptr inbounds i8, i8* %input, i64 %980
  %982 = load i8, i8* %981, align 1, !tbaa !250
  %983 = insertelement <64 x i8> %978, i8 %982, i32 23
  %984 = extractelement <64 x i32> %863, i32 24
  %985 = sext i32 %984 to i64
  %986 = getelementptr inbounds i8, i8* %input, i64 %985
  %987 = load i8, i8* %986, align 1, !tbaa !250
  %988 = insertelement <64 x i8> %983, i8 %987, i32 24
  %989 = extractelement <64 x i32> %863, i32 25
  %990 = sext i32 %989 to i64
  %991 = getelementptr inbounds i8, i8* %input, i64 %990
  %992 = load i8, i8* %991, align 1, !tbaa !250
  %993 = insertelement <64 x i8> %988, i8 %992, i32 25
  %994 = extractelement <64 x i32> %863, i32 26
  %995 = sext i32 %994 to i64
  %996 = getelementptr inbounds i8, i8* %input, i64 %995
  %997 = load i8, i8* %996, align 1, !tbaa !250
  %998 = insertelement <64 x i8> %993, i8 %997, i32 26
  %999 = extractelement <64 x i32> %863, i32 27
  %1000 = sext i32 %999 to i64
  %1001 = getelementptr inbounds i8, i8* %input, i64 %1000
  %1002 = load i8, i8* %1001, align 1, !tbaa !250
  %1003 = insertelement <64 x i8> %998, i8 %1002, i32 27
  %1004 = extractelement <64 x i32> %863, i32 28
  %1005 = sext i32 %1004 to i64
  %1006 = getelementptr inbounds i8, i8* %input, i64 %1005
  %1007 = load i8, i8* %1006, align 1, !tbaa !250
  %1008 = insertelement <64 x i8> %1003, i8 %1007, i32 28
  %1009 = extractelement <64 x i32> %863, i32 29
  %1010 = sext i32 %1009 to i64
  %1011 = getelementptr inbounds i8, i8* %input, i64 %1010
  %1012 = load i8, i8* %1011, align 1, !tbaa !250
  %1013 = insertelement <64 x i8> %1008, i8 %1012, i32 29
  %1014 = extractelement <64 x i32> %863, i32 30
  %1015 = sext i32 %1014 to i64
  %1016 = getelementptr inbounds i8, i8* %input, i64 %1015
  %1017 = load i8, i8* %1016, align 1, !tbaa !250
  %1018 = insertelement <64 x i8> %1013, i8 %1017, i32 30
  %1019 = extractelement <64 x i32> %863, i32 31
  %1020 = sext i32 %1019 to i64
  %1021 = getelementptr inbounds i8, i8* %input, i64 %1020
  %1022 = load i8, i8* %1021, align 1, !tbaa !250
  %1023 = insertelement <64 x i8> %1018, i8 %1022, i32 31
  %1024 = extractelement <64 x i32> %863, i32 32
  %1025 = sext i32 %1024 to i64
  %1026 = getelementptr inbounds i8, i8* %input, i64 %1025
  %1027 = load i8, i8* %1026, align 1, !tbaa !250
  %1028 = insertelement <64 x i8> %1023, i8 %1027, i32 32
  %1029 = extractelement <64 x i32> %863, i32 33
  %1030 = sext i32 %1029 to i64
  %1031 = getelementptr inbounds i8, i8* %input, i64 %1030
  %1032 = load i8, i8* %1031, align 1, !tbaa !250
  %1033 = insertelement <64 x i8> %1028, i8 %1032, i32 33
  %1034 = extractelement <64 x i32> %863, i32 34
  %1035 = sext i32 %1034 to i64
  %1036 = getelementptr inbounds i8, i8* %input, i64 %1035
  %1037 = load i8, i8* %1036, align 1, !tbaa !250
  %1038 = insertelement <64 x i8> %1033, i8 %1037, i32 34
  %1039 = extractelement <64 x i32> %863, i32 35
  %1040 = sext i32 %1039 to i64
  %1041 = getelementptr inbounds i8, i8* %input, i64 %1040
  %1042 = load i8, i8* %1041, align 1, !tbaa !250
  %1043 = insertelement <64 x i8> %1038, i8 %1042, i32 35
  %1044 = extractelement <64 x i32> %863, i32 36
  %1045 = sext i32 %1044 to i64
  %1046 = getelementptr inbounds i8, i8* %input, i64 %1045
  %1047 = load i8, i8* %1046, align 1, !tbaa !250
  %1048 = insertelement <64 x i8> %1043, i8 %1047, i32 36
  %1049 = extractelement <64 x i32> %863, i32 37
  %1050 = sext i32 %1049 to i64
  %1051 = getelementptr inbounds i8, i8* %input, i64 %1050
  %1052 = load i8, i8* %1051, align 1, !tbaa !250
  %1053 = insertelement <64 x i8> %1048, i8 %1052, i32 37
  %1054 = extractelement <64 x i32> %863, i32 38
  %1055 = sext i32 %1054 to i64
  %1056 = getelementptr inbounds i8, i8* %input, i64 %1055
  %1057 = load i8, i8* %1056, align 1, !tbaa !250
  %1058 = insertelement <64 x i8> %1053, i8 %1057, i32 38
  %1059 = extractelement <64 x i32> %863, i32 39
  %1060 = sext i32 %1059 to i64
  %1061 = getelementptr inbounds i8, i8* %input, i64 %1060
  %1062 = load i8, i8* %1061, align 1, !tbaa !250
  %1063 = insertelement <64 x i8> %1058, i8 %1062, i32 39
  %1064 = extractelement <64 x i32> %863, i32 40
  %1065 = sext i32 %1064 to i64
  %1066 = getelementptr inbounds i8, i8* %input, i64 %1065
  %1067 = load i8, i8* %1066, align 1, !tbaa !250
  %1068 = insertelement <64 x i8> %1063, i8 %1067, i32 40
  %1069 = extractelement <64 x i32> %863, i32 41
  %1070 = sext i32 %1069 to i64
  %1071 = getelementptr inbounds i8, i8* %input, i64 %1070
  %1072 = load i8, i8* %1071, align 1, !tbaa !250
  %1073 = insertelement <64 x i8> %1068, i8 %1072, i32 41
  %1074 = extractelement <64 x i32> %863, i32 42
  %1075 = sext i32 %1074 to i64
  %1076 = getelementptr inbounds i8, i8* %input, i64 %1075
  %1077 = load i8, i8* %1076, align 1, !tbaa !250
  %1078 = insertelement <64 x i8> %1073, i8 %1077, i32 42
  %1079 = extractelement <64 x i32> %863, i32 43
  %1080 = sext i32 %1079 to i64
  %1081 = getelementptr inbounds i8, i8* %input, i64 %1080
  %1082 = load i8, i8* %1081, align 1, !tbaa !250
  %1083 = insertelement <64 x i8> %1078, i8 %1082, i32 43
  %1084 = extractelement <64 x i32> %863, i32 44
  %1085 = sext i32 %1084 to i64
  %1086 = getelementptr inbounds i8, i8* %input, i64 %1085
  %1087 = load i8, i8* %1086, align 1, !tbaa !250
  %1088 = insertelement <64 x i8> %1083, i8 %1087, i32 44
  %1089 = extractelement <64 x i32> %863, i32 45
  %1090 = sext i32 %1089 to i64
  %1091 = getelementptr inbounds i8, i8* %input, i64 %1090
  %1092 = load i8, i8* %1091, align 1, !tbaa !250
  %1093 = insertelement <64 x i8> %1088, i8 %1092, i32 45
  %1094 = extractelement <64 x i32> %863, i32 46
  %1095 = sext i32 %1094 to i64
  %1096 = getelementptr inbounds i8, i8* %input, i64 %1095
  %1097 = load i8, i8* %1096, align 1, !tbaa !250
  %1098 = insertelement <64 x i8> %1093, i8 %1097, i32 46
  %1099 = extractelement <64 x i32> %863, i32 47
  %1100 = sext i32 %1099 to i64
  %1101 = getelementptr inbounds i8, i8* %input, i64 %1100
  %1102 = load i8, i8* %1101, align 1, !tbaa !250
  %1103 = insertelement <64 x i8> %1098, i8 %1102, i32 47
  %1104 = extractelement <64 x i32> %863, i32 48
  %1105 = sext i32 %1104 to i64
  %1106 = getelementptr inbounds i8, i8* %input, i64 %1105
  %1107 = load i8, i8* %1106, align 1, !tbaa !250
  %1108 = insertelement <64 x i8> %1103, i8 %1107, i32 48
  %1109 = extractelement <64 x i32> %863, i32 49
  %1110 = sext i32 %1109 to i64
  %1111 = getelementptr inbounds i8, i8* %input, i64 %1110
  %1112 = load i8, i8* %1111, align 1, !tbaa !250
  %1113 = insertelement <64 x i8> %1108, i8 %1112, i32 49
  %1114 = extractelement <64 x i32> %863, i32 50
  %1115 = sext i32 %1114 to i64
  %1116 = getelementptr inbounds i8, i8* %input, i64 %1115
  %1117 = load i8, i8* %1116, align 1, !tbaa !250
  %1118 = insertelement <64 x i8> %1113, i8 %1117, i32 50
  %1119 = extractelement <64 x i32> %863, i32 51
  %1120 = sext i32 %1119 to i64
  %1121 = getelementptr inbounds i8, i8* %input, i64 %1120
  %1122 = load i8, i8* %1121, align 1, !tbaa !250
  %1123 = insertelement <64 x i8> %1118, i8 %1122, i32 51
  %1124 = extractelement <64 x i32> %863, i32 52
  %1125 = sext i32 %1124 to i64
  %1126 = getelementptr inbounds i8, i8* %input, i64 %1125
  %1127 = load i8, i8* %1126, align 1, !tbaa !250
  %1128 = insertelement <64 x i8> %1123, i8 %1127, i32 52
  %1129 = extractelement <64 x i32> %863, i32 53
  %1130 = sext i32 %1129 to i64
  %1131 = getelementptr inbounds i8, i8* %input, i64 %1130
  %1132 = load i8, i8* %1131, align 1, !tbaa !250
  %1133 = insertelement <64 x i8> %1128, i8 %1132, i32 53
  %1134 = extractelement <64 x i32> %863, i32 54
  %1135 = sext i32 %1134 to i64
  %1136 = getelementptr inbounds i8, i8* %input, i64 %1135
  %1137 = load i8, i8* %1136, align 1, !tbaa !250
  %1138 = insertelement <64 x i8> %1133, i8 %1137, i32 54
  %1139 = extractelement <64 x i32> %863, i32 55
  %1140 = sext i32 %1139 to i64
  %1141 = getelementptr inbounds i8, i8* %input, i64 %1140
  %1142 = load i8, i8* %1141, align 1, !tbaa !250
  %1143 = insertelement <64 x i8> %1138, i8 %1142, i32 55
  %1144 = extractelement <64 x i32> %863, i32 56
  %1145 = sext i32 %1144 to i64
  %1146 = getelementptr inbounds i8, i8* %input, i64 %1145
  %1147 = load i8, i8* %1146, align 1, !tbaa !250
  %1148 = insertelement <64 x i8> %1143, i8 %1147, i32 56
  %1149 = extractelement <64 x i32> %863, i32 57
  %1150 = sext i32 %1149 to i64
  %1151 = getelementptr inbounds i8, i8* %input, i64 %1150
  %1152 = load i8, i8* %1151, align 1, !tbaa !250
  %1153 = insertelement <64 x i8> %1148, i8 %1152, i32 57
  %1154 = extractelement <64 x i32> %863, i32 58
  %1155 = sext i32 %1154 to i64
  %1156 = getelementptr inbounds i8, i8* %input, i64 %1155
  %1157 = load i8, i8* %1156, align 1, !tbaa !250
  %1158 = insertelement <64 x i8> %1153, i8 %1157, i32 58
  %1159 = extractelement <64 x i32> %863, i32 59
  %1160 = sext i32 %1159 to i64
  %1161 = getelementptr inbounds i8, i8* %input, i64 %1160
  %1162 = load i8, i8* %1161, align 1, !tbaa !250
  %1163 = insertelement <64 x i8> %1158, i8 %1162, i32 59
  %1164 = extractelement <64 x i32> %863, i32 60
  %1165 = sext i32 %1164 to i64
  %1166 = getelementptr inbounds i8, i8* %input, i64 %1165
  %1167 = load i8, i8* %1166, align 1, !tbaa !250
  %1168 = insertelement <64 x i8> %1163, i8 %1167, i32 60
  %1169 = extractelement <64 x i32> %863, i32 61
  %1170 = sext i32 %1169 to i64
  %1171 = getelementptr inbounds i8, i8* %input, i64 %1170
  %1172 = load i8, i8* %1171, align 1, !tbaa !250
  %1173 = insertelement <64 x i8> %1168, i8 %1172, i32 61
  %1174 = extractelement <64 x i32> %863, i32 62
  %1175 = sext i32 %1174 to i64
  %1176 = getelementptr inbounds i8, i8* %input, i64 %1175
  %1177 = load i8, i8* %1176, align 1, !tbaa !250
  %1178 = insertelement <64 x i8> %1173, i8 %1177, i32 62
  %1179 = extractelement <64 x i32> %863, i32 63
  %1180 = sext i32 %1179 to i64
  %1181 = getelementptr inbounds i8, i8* %input, i64 %1180
  %1182 = load i8, i8* %1181, align 1, !tbaa !250
  %1183 = insertelement <64 x i8> %1178, i8 %1182, i32 63
  %1184 = sext i32 %bounded_input.s0.x.xi.base13 to i64
  %1185 = add nsw i64 %1184, %835
  %1186 = getelementptr inbounds i8, i8* %29, i64 %1185
  %1187 = bitcast i8* %1186 to <64 x i8>*
  store <64 x i8> %1183, <64 x i8>* %1187, align 1, !tbaa !253
  %1188 = add nsw i32 %bounded_input.s0.x.x12, 1
  %1189 = icmp eq i32 %1188, %t280
  br i1 %1189, label %"end for bounded_input.s0.x.x11", label %"for bounded_input.s0.x.x10"

"end for bounded_input.s0.x.x11":                 ; preds = %"for bounded_input.s0.x.x10", %"end for bounded_input.s0.x.x8"
  %indvars.iv.next36 = add nsw i64 %indvars.iv35, 1
  %1190 = add nsw i32 %bounded_input.s0.y, 1
  %1191 = trunc i64 %indvars.iv.next36 to i32
  %1192 = icmp eq i32 %42, %1191
  br i1 %1192, label %"end for bounded_input.s0.y2", label %"for bounded_input.s0.y1"

"for bounded_input.s0.y14":                       ; preds = %"end for bounded_input.s0.x.x18", %"for bounded_input.s0.y14.preheader"
  %indvars.iv39 = phi i64 [ %57, %"for bounded_input.s0.y14.preheader" ], [ %indvars.iv.next40, %"end for bounded_input.s0.x.x18" ]
  %a64 = phi i32 [ %34, %"for bounded_input.s0.y14.preheader" ], [ %1556, %"end for bounded_input.s0.x.x18" ]
  %1193 = icmp slt i64 %indvars.iv39, %54
  %1194 = trunc i64 %indvars.iv39 to i32
  %a63 = select i1 %1193, i32 %1194, i32 %b66
  br i1 %465, label %"for bounded_input.s0.x.x17.preheader", label %"end for bounded_input.s0.x.x18", !prof !242

"for bounded_input.s0.x.x17.preheader":           ; preds = %"for bounded_input.s0.y14"
  %1195 = add nsw i32 %a64, %t283
  %1196 = mul nsw i32 %1195, %t284
  %t313 = sub nsw i32 %1196, %t257
  %1197 = icmp sgt i32 %a63, 0
  %1198 = select i1 %1197, i32 %a63, i32 0
  %t312 = mul nsw i32 %1198, %input.stride.1
  %1199 = insertelement <64 x i32> undef, i32 %t312, i32 0
  %1200 = shufflevector <64 x i32> %1199, <64 x i32> undef, <64 x i32> zeroinitializer
  %1201 = sext i32 %t313 to i64
  br label %"for bounded_input.s0.x.x17"

"for bounded_input.s0.x.x17":                     ; preds = %"for bounded_input.s0.x.x17", %"for bounded_input.s0.x.x17.preheader"
  %bounded_input.s0.x.x19 = phi i32 [ %1554, %"for bounded_input.s0.x.x17" ], [ 0, %"for bounded_input.s0.x.x17.preheader" ]
  %1202 = shl nsw i32 %bounded_input.s0.x.x19, 6
  %a65 = add nsw i32 %1202, %bounded_input.s0.x.min_2
  %1203 = icmp sgt i32 %b49, %a65
  %bounded_input.s0.x.xi.base20 = select i1 %1203, i32 %a65, i32 %b49
  %1204 = insertelement <64 x i32> undef, i32 %bounded_input.s0.x.xi.base20, i32 0
  %1205 = shufflevector <64 x i32> %1204, <64 x i32> undef, <64 x i32> zeroinitializer
  %a67 = add nsw <64 x i32> %1205, <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %1206 = shufflevector <64 x i32> %a67, <64 x i32> undef, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %1207 = icmp sgt <16 x i32> %45, %1206
  %1208 = shufflevector <64 x i32> %a67, <64 x i32> undef, <16 x i32> <i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %1209 = icmp sgt <16 x i32> %45, %1208
  %1210 = shufflevector <64 x i32> %a67, <64 x i32> undef, <16 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47>
  %1211 = icmp sgt <16 x i32> %45, %1210
  %1212 = shufflevector <64 x i32> %a67, <64 x i32> undef, <16 x i32> <i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %1213 = icmp sgt <16 x i32> %45, %1212
  %1214 = select <16 x i1> %1207, <16 x i32> %1206, <16 x i32> %45
  %1215 = select <16 x i1> %1209, <16 x i32> %1208, <16 x i32> %45
  %1216 = select <16 x i1> %1211, <16 x i32> %1210, <16 x i32> %45
  %1217 = select <16 x i1> %1213, <16 x i32> %1212, <16 x i32> %45
  %1218 = icmp sgt <16 x i32> %1214, zeroinitializer
  %1219 = icmp sgt <16 x i32> %1215, zeroinitializer
  %1220 = icmp sgt <16 x i32> %1216, zeroinitializer
  %1221 = icmp sgt <16 x i32> %1217, zeroinitializer
  %1222 = select <16 x i1> %1218, <16 x i32> %1214, <16 x i32> zeroinitializer
  %1223 = select <16 x i1> %1219, <16 x i32> %1215, <16 x i32> zeroinitializer
  %1224 = select <16 x i1> %1220, <16 x i32> %1216, <16 x i32> zeroinitializer
  %1225 = select <16 x i1> %1221, <16 x i32> %1217, <16 x i32> zeroinitializer
  %1226 = shufflevector <16 x i32> %1222, <16 x i32> %1223, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %1227 = shufflevector <16 x i32> %1224, <16 x i32> %1225, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %1228 = shufflevector <32 x i32> %1226, <32 x i32> %1227, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %1229 = add nsw <64 x i32> %1228, %1200
  %1230 = extractelement <64 x i32> %1229, i32 0
  %1231 = sext i32 %1230 to i64
  %1232 = getelementptr inbounds i8, i8* %input, i64 %1231
  %1233 = load i8, i8* %1232, align 1, !tbaa !250
  %1234 = insertelement <64 x i8> undef, i8 %1233, i32 0
  %1235 = extractelement <64 x i32> %1229, i32 1
  %1236 = sext i32 %1235 to i64
  %1237 = getelementptr inbounds i8, i8* %input, i64 %1236
  %1238 = load i8, i8* %1237, align 1, !tbaa !250
  %1239 = insertelement <64 x i8> %1234, i8 %1238, i32 1
  %1240 = extractelement <64 x i32> %1229, i32 2
  %1241 = sext i32 %1240 to i64
  %1242 = getelementptr inbounds i8, i8* %input, i64 %1241
  %1243 = load i8, i8* %1242, align 1, !tbaa !250
  %1244 = insertelement <64 x i8> %1239, i8 %1243, i32 2
  %1245 = extractelement <64 x i32> %1229, i32 3
  %1246 = sext i32 %1245 to i64
  %1247 = getelementptr inbounds i8, i8* %input, i64 %1246
  %1248 = load i8, i8* %1247, align 1, !tbaa !250
  %1249 = insertelement <64 x i8> %1244, i8 %1248, i32 3
  %1250 = extractelement <64 x i32> %1229, i32 4
  %1251 = sext i32 %1250 to i64
  %1252 = getelementptr inbounds i8, i8* %input, i64 %1251
  %1253 = load i8, i8* %1252, align 1, !tbaa !250
  %1254 = insertelement <64 x i8> %1249, i8 %1253, i32 4
  %1255 = extractelement <64 x i32> %1229, i32 5
  %1256 = sext i32 %1255 to i64
  %1257 = getelementptr inbounds i8, i8* %input, i64 %1256
  %1258 = load i8, i8* %1257, align 1, !tbaa !250
  %1259 = insertelement <64 x i8> %1254, i8 %1258, i32 5
  %1260 = extractelement <64 x i32> %1229, i32 6
  %1261 = sext i32 %1260 to i64
  %1262 = getelementptr inbounds i8, i8* %input, i64 %1261
  %1263 = load i8, i8* %1262, align 1, !tbaa !250
  %1264 = insertelement <64 x i8> %1259, i8 %1263, i32 6
  %1265 = extractelement <64 x i32> %1229, i32 7
  %1266 = sext i32 %1265 to i64
  %1267 = getelementptr inbounds i8, i8* %input, i64 %1266
  %1268 = load i8, i8* %1267, align 1, !tbaa !250
  %1269 = insertelement <64 x i8> %1264, i8 %1268, i32 7
  %1270 = extractelement <64 x i32> %1229, i32 8
  %1271 = sext i32 %1270 to i64
  %1272 = getelementptr inbounds i8, i8* %input, i64 %1271
  %1273 = load i8, i8* %1272, align 1, !tbaa !250
  %1274 = insertelement <64 x i8> %1269, i8 %1273, i32 8
  %1275 = extractelement <64 x i32> %1229, i32 9
  %1276 = sext i32 %1275 to i64
  %1277 = getelementptr inbounds i8, i8* %input, i64 %1276
  %1278 = load i8, i8* %1277, align 1, !tbaa !250
  %1279 = insertelement <64 x i8> %1274, i8 %1278, i32 9
  %1280 = extractelement <64 x i32> %1229, i32 10
  %1281 = sext i32 %1280 to i64
  %1282 = getelementptr inbounds i8, i8* %input, i64 %1281
  %1283 = load i8, i8* %1282, align 1, !tbaa !250
  %1284 = insertelement <64 x i8> %1279, i8 %1283, i32 10
  %1285 = extractelement <64 x i32> %1229, i32 11
  %1286 = sext i32 %1285 to i64
  %1287 = getelementptr inbounds i8, i8* %input, i64 %1286
  %1288 = load i8, i8* %1287, align 1, !tbaa !250
  %1289 = insertelement <64 x i8> %1284, i8 %1288, i32 11
  %1290 = extractelement <64 x i32> %1229, i32 12
  %1291 = sext i32 %1290 to i64
  %1292 = getelementptr inbounds i8, i8* %input, i64 %1291
  %1293 = load i8, i8* %1292, align 1, !tbaa !250
  %1294 = insertelement <64 x i8> %1289, i8 %1293, i32 12
  %1295 = extractelement <64 x i32> %1229, i32 13
  %1296 = sext i32 %1295 to i64
  %1297 = getelementptr inbounds i8, i8* %input, i64 %1296
  %1298 = load i8, i8* %1297, align 1, !tbaa !250
  %1299 = insertelement <64 x i8> %1294, i8 %1298, i32 13
  %1300 = extractelement <64 x i32> %1229, i32 14
  %1301 = sext i32 %1300 to i64
  %1302 = getelementptr inbounds i8, i8* %input, i64 %1301
  %1303 = load i8, i8* %1302, align 1, !tbaa !250
  %1304 = insertelement <64 x i8> %1299, i8 %1303, i32 14
  %1305 = extractelement <64 x i32> %1229, i32 15
  %1306 = sext i32 %1305 to i64
  %1307 = getelementptr inbounds i8, i8* %input, i64 %1306
  %1308 = load i8, i8* %1307, align 1, !tbaa !250
  %1309 = insertelement <64 x i8> %1304, i8 %1308, i32 15
  %1310 = extractelement <64 x i32> %1229, i32 16
  %1311 = sext i32 %1310 to i64
  %1312 = getelementptr inbounds i8, i8* %input, i64 %1311
  %1313 = load i8, i8* %1312, align 1, !tbaa !250
  %1314 = insertelement <64 x i8> %1309, i8 %1313, i32 16
  %1315 = extractelement <64 x i32> %1229, i32 17
  %1316 = sext i32 %1315 to i64
  %1317 = getelementptr inbounds i8, i8* %input, i64 %1316
  %1318 = load i8, i8* %1317, align 1, !tbaa !250
  %1319 = insertelement <64 x i8> %1314, i8 %1318, i32 17
  %1320 = extractelement <64 x i32> %1229, i32 18
  %1321 = sext i32 %1320 to i64
  %1322 = getelementptr inbounds i8, i8* %input, i64 %1321
  %1323 = load i8, i8* %1322, align 1, !tbaa !250
  %1324 = insertelement <64 x i8> %1319, i8 %1323, i32 18
  %1325 = extractelement <64 x i32> %1229, i32 19
  %1326 = sext i32 %1325 to i64
  %1327 = getelementptr inbounds i8, i8* %input, i64 %1326
  %1328 = load i8, i8* %1327, align 1, !tbaa !250
  %1329 = insertelement <64 x i8> %1324, i8 %1328, i32 19
  %1330 = extractelement <64 x i32> %1229, i32 20
  %1331 = sext i32 %1330 to i64
  %1332 = getelementptr inbounds i8, i8* %input, i64 %1331
  %1333 = load i8, i8* %1332, align 1, !tbaa !250
  %1334 = insertelement <64 x i8> %1329, i8 %1333, i32 20
  %1335 = extractelement <64 x i32> %1229, i32 21
  %1336 = sext i32 %1335 to i64
  %1337 = getelementptr inbounds i8, i8* %input, i64 %1336
  %1338 = load i8, i8* %1337, align 1, !tbaa !250
  %1339 = insertelement <64 x i8> %1334, i8 %1338, i32 21
  %1340 = extractelement <64 x i32> %1229, i32 22
  %1341 = sext i32 %1340 to i64
  %1342 = getelementptr inbounds i8, i8* %input, i64 %1341
  %1343 = load i8, i8* %1342, align 1, !tbaa !250
  %1344 = insertelement <64 x i8> %1339, i8 %1343, i32 22
  %1345 = extractelement <64 x i32> %1229, i32 23
  %1346 = sext i32 %1345 to i64
  %1347 = getelementptr inbounds i8, i8* %input, i64 %1346
  %1348 = load i8, i8* %1347, align 1, !tbaa !250
  %1349 = insertelement <64 x i8> %1344, i8 %1348, i32 23
  %1350 = extractelement <64 x i32> %1229, i32 24
  %1351 = sext i32 %1350 to i64
  %1352 = getelementptr inbounds i8, i8* %input, i64 %1351
  %1353 = load i8, i8* %1352, align 1, !tbaa !250
  %1354 = insertelement <64 x i8> %1349, i8 %1353, i32 24
  %1355 = extractelement <64 x i32> %1229, i32 25
  %1356 = sext i32 %1355 to i64
  %1357 = getelementptr inbounds i8, i8* %input, i64 %1356
  %1358 = load i8, i8* %1357, align 1, !tbaa !250
  %1359 = insertelement <64 x i8> %1354, i8 %1358, i32 25
  %1360 = extractelement <64 x i32> %1229, i32 26
  %1361 = sext i32 %1360 to i64
  %1362 = getelementptr inbounds i8, i8* %input, i64 %1361
  %1363 = load i8, i8* %1362, align 1, !tbaa !250
  %1364 = insertelement <64 x i8> %1359, i8 %1363, i32 26
  %1365 = extractelement <64 x i32> %1229, i32 27
  %1366 = sext i32 %1365 to i64
  %1367 = getelementptr inbounds i8, i8* %input, i64 %1366
  %1368 = load i8, i8* %1367, align 1, !tbaa !250
  %1369 = insertelement <64 x i8> %1364, i8 %1368, i32 27
  %1370 = extractelement <64 x i32> %1229, i32 28
  %1371 = sext i32 %1370 to i64
  %1372 = getelementptr inbounds i8, i8* %input, i64 %1371
  %1373 = load i8, i8* %1372, align 1, !tbaa !250
  %1374 = insertelement <64 x i8> %1369, i8 %1373, i32 28
  %1375 = extractelement <64 x i32> %1229, i32 29
  %1376 = sext i32 %1375 to i64
  %1377 = getelementptr inbounds i8, i8* %input, i64 %1376
  %1378 = load i8, i8* %1377, align 1, !tbaa !250
  %1379 = insertelement <64 x i8> %1374, i8 %1378, i32 29
  %1380 = extractelement <64 x i32> %1229, i32 30
  %1381 = sext i32 %1380 to i64
  %1382 = getelementptr inbounds i8, i8* %input, i64 %1381
  %1383 = load i8, i8* %1382, align 1, !tbaa !250
  %1384 = insertelement <64 x i8> %1379, i8 %1383, i32 30
  %1385 = extractelement <64 x i32> %1229, i32 31
  %1386 = sext i32 %1385 to i64
  %1387 = getelementptr inbounds i8, i8* %input, i64 %1386
  %1388 = load i8, i8* %1387, align 1, !tbaa !250
  %1389 = insertelement <64 x i8> %1384, i8 %1388, i32 31
  %1390 = extractelement <64 x i32> %1229, i32 32
  %1391 = sext i32 %1390 to i64
  %1392 = getelementptr inbounds i8, i8* %input, i64 %1391
  %1393 = load i8, i8* %1392, align 1, !tbaa !250
  %1394 = insertelement <64 x i8> %1389, i8 %1393, i32 32
  %1395 = extractelement <64 x i32> %1229, i32 33
  %1396 = sext i32 %1395 to i64
  %1397 = getelementptr inbounds i8, i8* %input, i64 %1396
  %1398 = load i8, i8* %1397, align 1, !tbaa !250
  %1399 = insertelement <64 x i8> %1394, i8 %1398, i32 33
  %1400 = extractelement <64 x i32> %1229, i32 34
  %1401 = sext i32 %1400 to i64
  %1402 = getelementptr inbounds i8, i8* %input, i64 %1401
  %1403 = load i8, i8* %1402, align 1, !tbaa !250
  %1404 = insertelement <64 x i8> %1399, i8 %1403, i32 34
  %1405 = extractelement <64 x i32> %1229, i32 35
  %1406 = sext i32 %1405 to i64
  %1407 = getelementptr inbounds i8, i8* %input, i64 %1406
  %1408 = load i8, i8* %1407, align 1, !tbaa !250
  %1409 = insertelement <64 x i8> %1404, i8 %1408, i32 35
  %1410 = extractelement <64 x i32> %1229, i32 36
  %1411 = sext i32 %1410 to i64
  %1412 = getelementptr inbounds i8, i8* %input, i64 %1411
  %1413 = load i8, i8* %1412, align 1, !tbaa !250
  %1414 = insertelement <64 x i8> %1409, i8 %1413, i32 36
  %1415 = extractelement <64 x i32> %1229, i32 37
  %1416 = sext i32 %1415 to i64
  %1417 = getelementptr inbounds i8, i8* %input, i64 %1416
  %1418 = load i8, i8* %1417, align 1, !tbaa !250
  %1419 = insertelement <64 x i8> %1414, i8 %1418, i32 37
  %1420 = extractelement <64 x i32> %1229, i32 38
  %1421 = sext i32 %1420 to i64
  %1422 = getelementptr inbounds i8, i8* %input, i64 %1421
  %1423 = load i8, i8* %1422, align 1, !tbaa !250
  %1424 = insertelement <64 x i8> %1419, i8 %1423, i32 38
  %1425 = extractelement <64 x i32> %1229, i32 39
  %1426 = sext i32 %1425 to i64
  %1427 = getelementptr inbounds i8, i8* %input, i64 %1426
  %1428 = load i8, i8* %1427, align 1, !tbaa !250
  %1429 = insertelement <64 x i8> %1424, i8 %1428, i32 39
  %1430 = extractelement <64 x i32> %1229, i32 40
  %1431 = sext i32 %1430 to i64
  %1432 = getelementptr inbounds i8, i8* %input, i64 %1431
  %1433 = load i8, i8* %1432, align 1, !tbaa !250
  %1434 = insertelement <64 x i8> %1429, i8 %1433, i32 40
  %1435 = extractelement <64 x i32> %1229, i32 41
  %1436 = sext i32 %1435 to i64
  %1437 = getelementptr inbounds i8, i8* %input, i64 %1436
  %1438 = load i8, i8* %1437, align 1, !tbaa !250
  %1439 = insertelement <64 x i8> %1434, i8 %1438, i32 41
  %1440 = extractelement <64 x i32> %1229, i32 42
  %1441 = sext i32 %1440 to i64
  %1442 = getelementptr inbounds i8, i8* %input, i64 %1441
  %1443 = load i8, i8* %1442, align 1, !tbaa !250
  %1444 = insertelement <64 x i8> %1439, i8 %1443, i32 42
  %1445 = extractelement <64 x i32> %1229, i32 43
  %1446 = sext i32 %1445 to i64
  %1447 = getelementptr inbounds i8, i8* %input, i64 %1446
  %1448 = load i8, i8* %1447, align 1, !tbaa !250
  %1449 = insertelement <64 x i8> %1444, i8 %1448, i32 43
  %1450 = extractelement <64 x i32> %1229, i32 44
  %1451 = sext i32 %1450 to i64
  %1452 = getelementptr inbounds i8, i8* %input, i64 %1451
  %1453 = load i8, i8* %1452, align 1, !tbaa !250
  %1454 = insertelement <64 x i8> %1449, i8 %1453, i32 44
  %1455 = extractelement <64 x i32> %1229, i32 45
  %1456 = sext i32 %1455 to i64
  %1457 = getelementptr inbounds i8, i8* %input, i64 %1456
  %1458 = load i8, i8* %1457, align 1, !tbaa !250
  %1459 = insertelement <64 x i8> %1454, i8 %1458, i32 45
  %1460 = extractelement <64 x i32> %1229, i32 46
  %1461 = sext i32 %1460 to i64
  %1462 = getelementptr inbounds i8, i8* %input, i64 %1461
  %1463 = load i8, i8* %1462, align 1, !tbaa !250
  %1464 = insertelement <64 x i8> %1459, i8 %1463, i32 46
  %1465 = extractelement <64 x i32> %1229, i32 47
  %1466 = sext i32 %1465 to i64
  %1467 = getelementptr inbounds i8, i8* %input, i64 %1466
  %1468 = load i8, i8* %1467, align 1, !tbaa !250
  %1469 = insertelement <64 x i8> %1464, i8 %1468, i32 47
  %1470 = extractelement <64 x i32> %1229, i32 48
  %1471 = sext i32 %1470 to i64
  %1472 = getelementptr inbounds i8, i8* %input, i64 %1471
  %1473 = load i8, i8* %1472, align 1, !tbaa !250
  %1474 = insertelement <64 x i8> %1469, i8 %1473, i32 48
  %1475 = extractelement <64 x i32> %1229, i32 49
  %1476 = sext i32 %1475 to i64
  %1477 = getelementptr inbounds i8, i8* %input, i64 %1476
  %1478 = load i8, i8* %1477, align 1, !tbaa !250
  %1479 = insertelement <64 x i8> %1474, i8 %1478, i32 49
  %1480 = extractelement <64 x i32> %1229, i32 50
  %1481 = sext i32 %1480 to i64
  %1482 = getelementptr inbounds i8, i8* %input, i64 %1481
  %1483 = load i8, i8* %1482, align 1, !tbaa !250
  %1484 = insertelement <64 x i8> %1479, i8 %1483, i32 50
  %1485 = extractelement <64 x i32> %1229, i32 51
  %1486 = sext i32 %1485 to i64
  %1487 = getelementptr inbounds i8, i8* %input, i64 %1486
  %1488 = load i8, i8* %1487, align 1, !tbaa !250
  %1489 = insertelement <64 x i8> %1484, i8 %1488, i32 51
  %1490 = extractelement <64 x i32> %1229, i32 52
  %1491 = sext i32 %1490 to i64
  %1492 = getelementptr inbounds i8, i8* %input, i64 %1491
  %1493 = load i8, i8* %1492, align 1, !tbaa !250
  %1494 = insertelement <64 x i8> %1489, i8 %1493, i32 52
  %1495 = extractelement <64 x i32> %1229, i32 53
  %1496 = sext i32 %1495 to i64
  %1497 = getelementptr inbounds i8, i8* %input, i64 %1496
  %1498 = load i8, i8* %1497, align 1, !tbaa !250
  %1499 = insertelement <64 x i8> %1494, i8 %1498, i32 53
  %1500 = extractelement <64 x i32> %1229, i32 54
  %1501 = sext i32 %1500 to i64
  %1502 = getelementptr inbounds i8, i8* %input, i64 %1501
  %1503 = load i8, i8* %1502, align 1, !tbaa !250
  %1504 = insertelement <64 x i8> %1499, i8 %1503, i32 54
  %1505 = extractelement <64 x i32> %1229, i32 55
  %1506 = sext i32 %1505 to i64
  %1507 = getelementptr inbounds i8, i8* %input, i64 %1506
  %1508 = load i8, i8* %1507, align 1, !tbaa !250
  %1509 = insertelement <64 x i8> %1504, i8 %1508, i32 55
  %1510 = extractelement <64 x i32> %1229, i32 56
  %1511 = sext i32 %1510 to i64
  %1512 = getelementptr inbounds i8, i8* %input, i64 %1511
  %1513 = load i8, i8* %1512, align 1, !tbaa !250
  %1514 = insertelement <64 x i8> %1509, i8 %1513, i32 56
  %1515 = extractelement <64 x i32> %1229, i32 57
  %1516 = sext i32 %1515 to i64
  %1517 = getelementptr inbounds i8, i8* %input, i64 %1516
  %1518 = load i8, i8* %1517, align 1, !tbaa !250
  %1519 = insertelement <64 x i8> %1514, i8 %1518, i32 57
  %1520 = extractelement <64 x i32> %1229, i32 58
  %1521 = sext i32 %1520 to i64
  %1522 = getelementptr inbounds i8, i8* %input, i64 %1521
  %1523 = load i8, i8* %1522, align 1, !tbaa !250
  %1524 = insertelement <64 x i8> %1519, i8 %1523, i32 58
  %1525 = extractelement <64 x i32> %1229, i32 59
  %1526 = sext i32 %1525 to i64
  %1527 = getelementptr inbounds i8, i8* %input, i64 %1526
  %1528 = load i8, i8* %1527, align 1, !tbaa !250
  %1529 = insertelement <64 x i8> %1524, i8 %1528, i32 59
  %1530 = extractelement <64 x i32> %1229, i32 60
  %1531 = sext i32 %1530 to i64
  %1532 = getelementptr inbounds i8, i8* %input, i64 %1531
  %1533 = load i8, i8* %1532, align 1, !tbaa !250
  %1534 = insertelement <64 x i8> %1529, i8 %1533, i32 60
  %1535 = extractelement <64 x i32> %1229, i32 61
  %1536 = sext i32 %1535 to i64
  %1537 = getelementptr inbounds i8, i8* %input, i64 %1536
  %1538 = load i8, i8* %1537, align 1, !tbaa !250
  %1539 = insertelement <64 x i8> %1534, i8 %1538, i32 61
  %1540 = extractelement <64 x i32> %1229, i32 62
  %1541 = sext i32 %1540 to i64
  %1542 = getelementptr inbounds i8, i8* %input, i64 %1541
  %1543 = load i8, i8* %1542, align 1, !tbaa !250
  %1544 = insertelement <64 x i8> %1539, i8 %1543, i32 62
  %1545 = extractelement <64 x i32> %1229, i32 63
  %1546 = sext i32 %1545 to i64
  %1547 = getelementptr inbounds i8, i8* %input, i64 %1546
  %1548 = load i8, i8* %1547, align 1, !tbaa !250
  %1549 = insertelement <64 x i8> %1544, i8 %1548, i32 63
  %1550 = sext i32 %bounded_input.s0.x.xi.base20 to i64
  %1551 = add nsw i64 %1550, %1201
  %1552 = getelementptr inbounds i8, i8* %29, i64 %1551
  %1553 = bitcast i8* %1552 to <64 x i8>*
  store <64 x i8> %1549, <64 x i8>* %1553, align 1, !tbaa !253
  %1554 = add nuw nsw i32 %bounded_input.s0.x.x19, 1
  %1555 = icmp eq i32 %1554, %t280
  br i1 %1555, label %"end for bounded_input.s0.x.x18", label %"for bounded_input.s0.x.x17"

"end for bounded_input.s0.x.x18":                 ; preds = %"for bounded_input.s0.x.x17", %"for bounded_input.s0.y14"
  %indvars.iv.next40 = add nsw i64 %indvars.iv39, 1
  %1556 = add nsw i32 %a64, 1
  %1557 = trunc i64 %indvars.iv.next40 to i32
  %1558 = icmp eq i32 %a35, %1557
  br i1 %1558, label %"consume bounded_input", label %"for bounded_input.s0.y14"

"consume bounded_input":                          ; preds = %"end for bounded_input.s0.x.x18", %"end for bounded_input.s0.y2"
  %t314 = sub nsw i32 %output.s0.x.xi.base, %t257
  br label %"for max_y.s0.y"

"for max_y.s0.y":                                 ; preds = %"end for max_y.s0.x.x", %"consume bounded_input"
  %indvars.iv43 = phi i64 [ %indvars.iv.next44, %"end for max_y.s0.x.x" ], [ %50, %"consume bounded_input" ]
  %max_y.s0.y = phi i32 [ %1583, %"end for max_y.s0.x.x" ], [ %a34, %"consume bounded_input" ]
  %1559 = sub nsw i64 %indvars.iv43, %50
  %t319 = sub nsw i32 %max_y.s0.y, %a34
  %1560 = shl nsw i64 %1559, 2
  %1561 = add nuw nsw i32 %t319, 1
  %1562 = mul nsw i32 %1561, %t284
  %t317 = add nsw i32 %1562, %t314
  %1563 = sext i32 %t317 to i64
  br label %"for max_y.s0.x.x"

"for max_y.s0.x.x":                               ; preds = %"for max_y.s0.x.x", %"for max_y.s0.y"
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %"for max_y.s0.x.x" ], [ 0, %"for max_y.s0.y" ]
  %1564 = shl nuw nsw i64 %indvars.iv41, 6
  %1565 = add nsw i64 %1564, %1563
  %1566 = add nsw i64 %1565, %48
  %1567 = getelementptr inbounds i8, i8* %29, i64 %1566
  %1568 = bitcast i8* %1567 to <64 x i8>*
  %a68 = load <64 x i8>, <64 x i8>* %1568, align 1, !tbaa !253
  %1569 = add nsw i64 %1565, -1
  %1570 = getelementptr inbounds i8, i8* %29, i64 %1569
  %1571 = bitcast i8* %1570 to <64 x i8>*
  %a69 = load <64 x i8>, <64 x i8>* %1571, align 1, !tbaa !253
  %1572 = add nsw i64 %1565, %49
  %1573 = getelementptr inbounds i8, i8* %29, i64 %1572
  %1574 = bitcast i8* %1573 to <64 x i8>*
  %b71 = load <64 x i8>, <64 x i8>* %1574, align 1, !tbaa !253
  %1575 = icmp ugt <64 x i8> %a69, %b71
  %b70 = select <64 x i1> %1575, <64 x i8> %a69, <64 x i8> %b71
  %1576 = icmp ugt <64 x i8> %a68, %b70
  %1577 = select <64 x i1> %1576, <64 x i8> %a68, <64 x i8> %b70
  %1578 = add nuw nsw i64 %indvars.iv41, %1560
  %1579 = shl nsw i64 %1578, 6
  %1580 = getelementptr inbounds [8192 x i8], [8192 x i8]* %max_y26, i64 0, i64 %1579
  %1581 = bitcast i8* %1580 to <64 x i8>*
  store <64 x i8> %1577, <64 x i8>* %1581, align 64, !tbaa !255
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %1582 = icmp eq i64 %indvars.iv.next42, 4
  br i1 %1582, label %"end for max_y.s0.x.x", label %"for max_y.s0.x.x"

"end for max_y.s0.x.x":                           ; preds = %"for max_y.s0.x.x"
  %indvars.iv.next44 = add nsw i64 %indvars.iv43, 1
  %1583 = add nsw i32 %max_y.s0.y, 1
  %1584 = trunc i64 %indvars.iv.next44 to i32
  %1585 = icmp eq i32 %47, %1584
  br i1 %1585, label %"consume bounded_input21", label %"for max_y.s0.y"

"consume bounded_input21":                        ; preds = %"end for max_y.s0.x.x"
  %1586 = sext i32 %output.s0.x.xi.base to i64
  br label %"for output.s0.x.xi.xi"

"for output.s0.x.xi.xi":                          ; preds = %"end for output.s0.y.yi.yi", %"consume bounded_input21"
  %indvars.iv56 = phi i64 [ %indvars.iv.next57, %"end for output.s0.y.yi.yi" ], [ 0, %"consume bounded_input21" ]
  %output.s0.x.xi.xi = phi i32 [ %1615, %"end for output.s0.y.yi.yi" ], [ 0, %"consume bounded_input21" ]
  br label %"for minmax_x.s0.y"

"end for output.s0.x.xi.xi":                      ; preds = %"end for output.s0.y.yi.yi"
  %1587 = add nuw nsw i32 %output.s0.x.x, 1
  %1588 = icmp eq i32 %1587, %t254
  br i1 %1588, label %.loopexit.loopexit, label %"for output.s0.x.x"

"for minmax_x.s0.y":                              ; preds = %"for minmax_x.s0.y", %"for output.s0.x.xi.xi"
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %"for minmax_x.s0.y" ], [ %50, %"for output.s0.x.xi.xi" ]
  %1589 = sub nsw i64 %indvars.iv48, %50
  %1590 = shl nsw i64 %1589, 2
  %1591 = add nuw nsw i64 %1590, %indvars.iv56
  %1592 = shl nsw i64 %1591, 6
  %1593 = getelementptr inbounds [8192 x i8], [8192 x i8]* %max_y26, i64 0, i64 %1592
  %1594 = bitcast i8* %1593 to <64 x i8>*
  %a70 = load <64 x i8>, <64 x i8>* %1594, align 64, !tbaa !255
  %1595 = or i64 %1592, 1
  %1596 = getelementptr inbounds [8192 x i8], [8192 x i8]* %max_y26, i64 0, i64 %1595
  %1597 = bitcast i8* %1596 to <64 x i8>*
  %a71 = load <64 x i8>, <64 x i8>* %1597, align 1, !tbaa !255
  %1598 = or i64 %1592, 2
  %1599 = getelementptr inbounds [8192 x i8], [8192 x i8]* %max_y26, i64 0, i64 %1598
  %1600 = bitcast i8* %1599 to <64 x i8>*
  %b73 = load <64 x i8>, <64 x i8>* %1600, align 2, !tbaa !255
  %1601 = icmp ugt <64 x i8> %b73, %a71
  %b72 = select <64 x i1> %1601, <64 x i8> %a71, <64 x i8> %b73
  %1602 = icmp ugt <64 x i8> %b72, %a70
  %1603 = select <64 x i1> %1602, <64 x i8> %a70, <64 x i8> %b72
  %1604 = shl nsw i64 %1589, 6
  %1605 = getelementptr inbounds [2048 x i8], [2048 x i8]* %minmax_x25, i64 0, i64 %1604
  %1606 = bitcast i8* %1605 to <64 x i8>*
  store <64 x i8> %1603, <64 x i8>* %1606, align 64, !tbaa !257
  %indvars.iv.next49 = add nsw i64 %indvars.iv48, 1
  %1607 = trunc i64 %indvars.iv.next49 to i32
  %1608 = icmp eq i32 %47, %1607
  br i1 %1608, label %"consume minmax_x", label %"for minmax_x.s0.y"

"consume minmax_x":                               ; preds = %"for minmax_x.s0.y"
  %1609 = shl nsw i64 %indvars.iv56, 6
  %t327 = shl nsw i32 %output.s0.x.xi.xi, 6
  %t323 = add nsw i32 %t327, %t314
  %1610 = add nsw i64 %1609, %1586
  %1611 = sext i32 %t323 to i64
  br label %"for output.s0.y.yi.yi"

"for output.s0.y.yi.yi":                          ; preds = %"end for output.s0.y.yi.yii", %"consume minmax_x"
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %"end for output.s0.y.yi.yii" ], [ 0, %"consume minmax_x" ]
  %1612 = shl nsw i64 %indvars.iv52, 4
  %1613 = add nsw i64 %1612, %50
  %1614 = trunc i64 %1612 to i32
  br label %"for output.s0.y.yi.yii"

"end for output.s0.y.yi.yi":                      ; preds = %"end for output.s0.y.yi.yii"
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %1615 = add nuw nsw i32 %output.s0.x.xi.xi, 1
  %1616 = icmp eq i64 %indvars.iv.next57, 3
  br i1 %1616, label %"end for output.s0.x.xi.xi", label %"for output.s0.x.xi.xi"

"for output.s0.y.yi.yii":                         ; preds = %"for output.s0.y.yi.yii", %"for output.s0.y.yi.yi"
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %"for output.s0.y.yi.yii" ], [ 0, %"for output.s0.y.yi.yi" ]
  %output.s0.y.yi.yii = phi i32 [ %1676, %"for output.s0.y.yi.yii" ], [ 0, %"for output.s0.y.yi.yi" ]
  %1617 = add nuw nsw i64 %indvars.iv50, %1612
  %1618 = add nuw nsw i32 %output.s0.y.yi.yii, %1614
  %1619 = add nuw nsw i32 %1618, 1
  %t231.s = mul nsw i32 %1619, %t284
  %1620 = sext i32 %t231.s to i64
  %1621 = add nsw i64 %1620, %1611
  %1622 = add nsw i64 %1621, %48
  %1623 = getelementptr inbounds i8, i8* %29, i64 %1622
  %1624 = bitcast i8* %1623 to <64 x i8>*
  %a72 = load <64 x i8>, <64 x i8>* %1624, align 1, !tbaa !253
  %1625 = add nsw i64 %1621, -1
  %1626 = getelementptr inbounds i8, i8* %29, i64 %1625
  %1627 = bitcast i8* %1626 to <64 x i8>*
  %a73 = load <64 x i8>, <64 x i8>* %1627, align 1, !tbaa !253
  %1628 = add nsw i64 %1621, %49
  %1629 = getelementptr inbounds i8, i8* %29, i64 %1628
  %1630 = bitcast i8* %1629 to <64 x i8>*
  %b75 = load <64 x i8>, <64 x i8>* %1630, align 1, !tbaa !253
  %1631 = icmp ugt <64 x i8> %b75, %a73
  %b74 = select <64 x i1> %1631, <64 x i8> %a73, <64 x i8> %b75
  %1632 = icmp ugt <64 x i8> %b74, %a72
  %1633 = select <64 x i1> %1632, <64 x i8> %a72, <64 x i8> %b74
  store <64 x i8> %1633, <64 x i8>* %min_y24.0.sroa_cast, align 64
  %1634 = add nsw i64 %1621, %51
  %1635 = getelementptr inbounds i8, i8* %29, i64 %1634
  %1636 = bitcast i8* %1635 to <64 x i8>*
  %a74 = load <64 x i8>, <64 x i8>* %1636, align 1, !tbaa !253
  %1637 = add nsw i64 %1621, 63
  %1638 = getelementptr inbounds i8, i8* %29, i64 %1637
  %1639 = bitcast i8* %1638 to <64 x i8>*
  %a75 = load <64 x i8>, <64 x i8>* %1639, align 1, !tbaa !253
  %1640 = add nsw i64 %1628, 64
  %1641 = getelementptr inbounds i8, i8* %29, i64 %1640
  %1642 = bitcast i8* %1641 to <64 x i8>*
  %b77 = load <64 x i8>, <64 x i8>* %1642, align 1, !tbaa !253
  %1643 = icmp ugt <64 x i8> %b77, %a75
  %b76 = select <64 x i1> %1643, <64 x i8> %a75, <64 x i8> %b77
  %1644 = icmp ugt <64 x i8> %b76, %a74
  %1645 = select <64 x i1> %1644, <64 x i8> %a74, <64 x i8> %b76
  store <64 x i8> %1645, <64 x i8>* %min_y24.64.sroa_cast, align 64
  %1646 = icmp ugt <64 x i8> %a72, %a73
  %b79 = select <64 x i1> %1646, <64 x i8> %a72, <64 x i8> %a73
  %1647 = icmp ugt <64 x i8> %b79, %b75
  %a76 = select <64 x i1> %1647, <64 x i8> %b75, <64 x i8> %b79
  %1648 = icmp ugt <64 x i8> %a73, %a72
  %b78 = select <64 x i1> %1648, <64 x i8> %a72, <64 x i8> %a73
  %1649 = icmp ugt <64 x i8> %a76, %b78
  %1650 = select <64 x i1> %1649, <64 x i8> %a76, <64 x i8> %b78
  store <64 x i8> %1650, <64 x i8>* %mid_y23.0.sroa_cast, align 64
  %1651 = icmp ugt <64 x i8> %a74, %a75
  %b83 = select <64 x i1> %1651, <64 x i8> %a74, <64 x i8> %a75
  %1652 = icmp ugt <64 x i8> %b83, %b77
  %a80 = select <64 x i1> %1652, <64 x i8> %b77, <64 x i8> %b83
  %1653 = icmp ugt <64 x i8> %a75, %a74
  %b82 = select <64 x i1> %1653, <64 x i8> %a74, <64 x i8> %a75
  %1654 = icmp ugt <64 x i8> %a80, %b82
  %1655 = select <64 x i1> %1654, <64 x i8> %a80, <64 x i8> %b82
  store <64 x i8> %1655, <64 x i8>* %mid_y23.64.sroa_cast, align 64
  %mid_y23.1.b89 = load <64 x i8>, <64 x i8>* %mid_y23.1.sroa_cast, align 1
  %mid_y23.2.a85 = load <64 x i8>, <64 x i8>* %mid_y23.2.sroa_cast, align 2
  %1656 = icmp ugt <64 x i8> %1650, %mid_y23.1.b89
  %b87 = select <64 x i1> %1656, <64 x i8> %1650, <64 x i8> %mid_y23.1.b89
  %1657 = icmp ugt <64 x i8> %b87, %mid_y23.2.a85
  %a84 = select <64 x i1> %1657, <64 x i8> %mid_y23.2.a85, <64 x i8> %b87
  %1658 = icmp ugt <64 x i8> %mid_y23.1.b89, %1650
  %b86 = select <64 x i1> %1658, <64 x i8> %1650, <64 x i8> %mid_y23.1.b89
  %1659 = icmp ugt <64 x i8> %a84, %b86
  %1660 = select <64 x i1> %1659, <64 x i8> %a84, <64 x i8> %b86
  %1661 = shl nuw nsw i64 %1617, 6
  %1662 = getelementptr inbounds [2048 x i8], [2048 x i8]* %minmax_x25, i64 0, i64 %1661
  %1663 = bitcast i8* %1662 to <64 x i8>*
  %a93 = load <64 x i8>, <64 x i8>* %1663, align 64, !tbaa !257
  %min_y24.1.a89 = load <64 x i8>, <64 x i8>* %min_y24.1.sroa_cast, align 1
  %min_y24.2.b91 = load <64 x i8>, <64 x i8>* %min_y24.2.sroa_cast, align 2
  %1664 = icmp ugt <64 x i8> %min_y24.1.a89, %min_y24.2.b91
  %b90 = select <64 x i1> %1664, <64 x i8> %min_y24.1.a89, <64 x i8> %min_y24.2.b91
  %1665 = icmp ugt <64 x i8> %1633, %b90
  %b95 = select <64 x i1> %1665, <64 x i8> %1633, <64 x i8> %b90
  %1666 = icmp ugt <64 x i8> %a93, %b95
  %b93 = select <64 x i1> %1666, <64 x i8> %a93, <64 x i8> %b95
  %1667 = icmp ugt <64 x i8> %b93, %1660
  %a90 = select <64 x i1> %1667, <64 x i8> %1660, <64 x i8> %b93
  %1668 = icmp ugt <64 x i8> %b95, %a93
  %b92 = select <64 x i1> %1668, <64 x i8> %a93, <64 x i8> %b95
  %1669 = icmp ugt <64 x i8> %a90, %b92
  %1670 = select <64 x i1> %1669, <64 x i8> %a90, <64 x i8> %b92
  %1671 = add nsw i64 %indvars.iv50, %1613
  %1672 = mul nsw i64 %1671, %52
  %1673 = add nsw i64 %1672, %1610
  %1674 = getelementptr inbounds i8, i8* %output, i64 %1673
  %1675 = bitcast i8* %1674 to <64 x i8>*
  store <64 x i8> %1670, <64 x i8>* %1675, align 1, !tbaa !259
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %1676 = add nuw nsw i32 %output.s0.y.yi.yii, 1
  %1677 = icmp eq i64 %indvars.iv.next51, 16
  br i1 %1677, label %"end for output.s0.y.yi.yii", label %"for output.s0.y.yi.yii"

"end for output.s0.y.yi.yii":                     ; preds = %"for output.s0.y.yi.yii"
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %1678 = icmp eq i64 %indvars.iv.next53, 2
  br i1 %1678, label %"end for output.s0.y.yi.yi", label %"for output.s0.y.yi.yi"
}

; Function Attrs: nounwind
define i32 @median3x3_batch_05_sample_02_argv(i8** nocapture readonly) local_unnamed_addr #9 {
entry:
  %1 = bitcast i8** %0 to %struct.halide_buffer_t**
  %2 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %1, align 8
  %3 = getelementptr i8*, i8** %0, i64 1
  %4 = bitcast i8** %3 to %struct.halide_buffer_t**
  %5 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %4, align 8
  %6 = tail call i32 @median3x3_batch_05_sample_02(%struct.halide_buffer_t* %2, %struct.halide_buffer_t* %5) #13
  ret i32 %6
}

; Function Attrs: norecurse nounwind readnone
define nonnull %struct.halide_filter_metadata_t* @median3x3_batch_05_sample_02_metadata() local_unnamed_addr #10 {
entry:
  ret %struct.halide_filter_metadata_t* @median3x3_batch_05_sample_02_metadata_storage
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
attributes #9 = { nounwind }
attributes #10 = { norecurse nounwind readnone }
attributes #11 = { nobuiltin nounwind }
attributes #12 = { nobuiltin }
attributes #13 = { noinline }

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
!247 = !{!248, !8, i64 0}
!248 = !{!"_ZTS25halide_pseudostack_slot_t", !8, i64 0, !16, i64 8}
!249 = !{!248, !16, i64 8}
!250 = !{!251, !251, i64 0}
!251 = !{!"input", !252, i64 0}
!252 = !{!"Halide buffer"}
!253 = !{!254, !254, i64 0}
!254 = !{!"bounded_input", !252, i64 0}
!255 = !{!256, !256, i64 0}
!256 = !{!"max_y", !252, i64 0}
!257 = !{!258, !258, i64 0}
!258 = !{!"minmax_x", !252, i64 0}
!259 = !{!260, !260, i64 0}
!260 = !{!"output", !252, i64 0}
