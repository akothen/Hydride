; ModuleID = '/home/sb54/Hydride/hexagon-benchmarks/rake/benchmarks/hexagon/halide/sobel3x3/samples/batch_58_0/15/sobel3x3_batch_0058_sample_0015.bc'
source_filename = "/home/sb54/halide-12/src/runtime/posix_allocator.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
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
%"struct.Halide::Runtime::Internal::CacheEntry" = type { %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"*, i8*, i64, i8*, i32, i32, i32, i32, %struct.halide_dimension_t*, %struct.halide_buffer_t*, i64, i8, [7 x i8] }
%struct.halide_dimension_t = type { i32, i32, i32, i32 }
%struct.halide_buffer_t = type { i64, %struct.halide_device_interface_t*, i8*, i64, %struct.halide_type_t, i32, %struct.halide_dimension_t*, i8* }
%struct.halide_device_interface_t = type { i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, void (i8*, %struct.halide_device_interface_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, i32, i32, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, i64, %struct.halide_device_interface_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, i32*, i32*)*, %struct.halide_device_interface_impl_t* }
%struct.halide_device_interface_impl_t = type { void ()*, void ()*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, i32, i32, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, i64)*, i32 (i8*, %struct.halide_buffer_t*)* }
%struct.halide_device_allocation_pool = type { i32 (i8*)*, %struct.halide_device_allocation_pool* }
%struct.halide_profiler_state = type { %struct.halide_mutex, i32, i32, i32, i32, %struct.halide_profiler_pipeline_stats*, void (i32*, i32*)*, %struct.halide_thread* }
%struct.halide_profiler_pipeline_stats = type { i64, i64, i64, i64, i64, i64, i8*, %struct.halide_profiler_func_stats*, i8*, i32, i32, i32, i32, i32, [4 x i8] }
%struct.halide_profiler_func_stats = type { i64, i64, i64, i64, i64, i64, i64, i8*, i32, [4 x i8] }
%struct.halide_filter_argument_t = type { i8*, i32, i32, %struct.halide_type_t, %struct.halide_scalar_value_t*, %struct.halide_scalar_value_t*, %struct.halide_scalar_value_t*, %struct.halide_scalar_value_t*, i64** }
%struct.halide_scalar_value_t = type { %union.anon.28 }
%union.anon.28 = type { double }
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
%struct.halide_mutex_array = type { %struct.halide_mutex* }
%"class.Halide::Runtime::Internal::(anonymous namespace)::Printer.0" = type <{ i8*, i8*, i8*, i8*, i8, [1 x i8], [6 x i8] }>
%"struct.Halide::Runtime::Internal::halide_tiff_header" = type <{ i16, i16, i32, i16, [15 x %"struct.Halide::Runtime::Internal::tiff_tag"], i32, [2 x i32], [2 x i32] }>
%"struct.Halide::Runtime::Internal::tiff_tag" = type { i16, i16, i32, %"class.Halide::Runtime::Internal::SharedExclusiveSpinLock" }
%"struct.Halide::Runtime::Internal::CacheBlockHeader" = type { %"struct.Halide::Runtime::Internal::CacheEntry"*, i32, [4 x i8] }
%"struct.Halide::Runtime::Internal::device_copy" = type { i64, i64, i64, [16 x i64], [16 x i64], [16 x i64], i64 }
%"struct.Halide::Runtime::Internal::CpuFeatures" = type { [2 x i64], [2 x i64] }
%closure_t = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i1, i32, i32, i32, i32, i32, i32, i32, i8*, %struct.halide_buffer_t*, i8*, %struct.halide_buffer_t* }
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
@.str.5 = private unnamed_addr constant [94 x i8] c"/home/sb54/halide-12/src/runtime/synchronization_common.h:395 Assert failed: next != nullptr\0A\00", align 1
@.str.6 = private unnamed_addr constant [89 x i8] c"/home/sb54/halide-12/src/runtime/synchronization_common.h:1116 Assert failed: val & 0x1\0A\00", align 1
@.str.7 = private unnamed_addr constant [150 x i8] c"/home/sb54/halide-12/src/runtime/thread_pool_common.h:153 Assert failed: bytes == limit && \22Logic error in thread pool work queue initialization.\\n\22\0A\00", align 1
@.str.3 = private unnamed_addr constant [227 x i8] c"/home/sb54/halide-12/src/runtime/thread_pool_common.h:520 Assert failed: (min_threads <= ((task_parent->task.min_threads * task_parent->active_workers) - task_parent->threads_reserved)) && \22Logic error: thread over commit.\\n\22\0A\00", align 1
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
@_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE = linkonce global i8 0, align 1
@_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE = linkonce local_unnamed_addr global i8 0, align 1
@.str.8 = private unnamed_addr constant [14 x i8] c"HL_GPU_DEVICE\00", align 1
@_ZN6Halide7Runtime8Internal19halide_trace_bufferE = linkonce local_unnamed_addr global %"class.Halide::Runtime::Internal::TraceBuffer"* null, align 8
@_ZN6Halide7Runtime8Internal17halide_trace_fileE = linkonce local_unnamed_addr global i32 -1, align 4
@_ZN6Halide7Runtime8Internal22halide_trace_file_lockE = linkonce global i8 0, align 1
@_ZN6Halide7Runtime8Internal29halide_trace_file_initializedE = linkonce local_unnamed_addr global i8 0, align 1
@_ZN6Halide7Runtime8Internal35halide_trace_file_internally_openedE = linkonce local_unnamed_addr global i8* null, align 8
@_ZN6Halide7Runtime8Internal19halide_custom_traceE = linkonce local_unnamed_addr global i32 (i8*, %struct.halide_trace_event_t*)* @halide_default_trace, align 8
@_ZZ20halide_default_traceE3ids = internal global i32 1, align 4
@.str.32 = private unnamed_addr constant [108 x i8] c"/home/sb54/halide-12/src/runtime/tracing.cpp:115 Assert failed: success && \22Could not write to trace file\22\0A\00", align 1
@.str.31 = private unnamed_addr constant [84 x i8] c"/home/sb54/halide-12/src/runtime/tracing.cpp:87 Assert failed: size <= buffer_size\0A\00", align 1
@.str.1.10 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.2.11 = private unnamed_addr constant [104 x i8] c"/home/sb54/halide-12/src/runtime/tracing.cpp:219 Assert failed: print_bits <= 64 && \22Tracing bad type\22\0A\00", align 1
@__const.halide_default_trace.event_types = private unnamed_addr constant [11 x i8*] [i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3.12, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.4.13, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.5.14, i32 0, i32 0), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.6.15, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.7.16, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.8.17, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9.18, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.12, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.13, i32 0, i32 0)], align 8
@.str.17 = private unnamed_addr constant [2 x i8] c"<\00", align 1
@.str.20 = private unnamed_addr constant [3 x i8] c">)\00", align 1
@.str.18 = private unnamed_addr constant [5 x i8] c">, <\00", align 1
@.str.22 = private unnamed_addr constant [5 x i8] c" = <\00", align 1
@.str.23 = private unnamed_addr constant [4 x i8] c" = \00", align 1
@.str.24 = private unnamed_addr constant [106 x i8] c"/home/sb54/halide-12/src/runtime/tracing.cpp:288 Assert failed: print_bits >= 16 && \22Tracing a bad type\22\0A\00", align 1
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
@.str.30 = private unnamed_addr constant [103 x i8] c"/home/sb54/halide-12/src/runtime/tracing.cpp:353 Assert failed: file && \22Failed to open trace file\\n\22\0A\00", align 1
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
@.str.1.113 = private unnamed_addr constant [27 x i8] c" returned non-zero value: \00", align 1
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
@.str.29.165 = private unnamed_addr constant [35 x i8] c"Printer buffer allocation failed.\0A\00", align 1
@.str.30.166 = private unnamed_addr constant [10 x i8] c"<nullptr>\00", align 1
@.str.7.167 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.8.168 = private unnamed_addr constant [14 x i8] c" total time: \00", align 1
@.str.9.169 = private unnamed_addr constant [4 x i8] c" ms\00", align 1
@.str.10.170 = private unnamed_addr constant [12 x i8] c"  samples: \00", align 1
@.str.11.171 = private unnamed_addr constant [9 x i8] c"  runs: \00", align 1
@.str.12.172 = private unnamed_addr constant [13 x i8] c"  time/run: \00", align 1
@.str.13.173 = private unnamed_addr constant [5 x i8] c" ms\0A\00", align 1
@.str.14.174 = private unnamed_addr constant [24 x i8] c" average threads used: \00", align 1
@.str.15.175 = private unnamed_addr constant [20 x i8] c" heap allocations: \00", align 1
@.str.16.176 = private unnamed_addr constant [20 x i8] c"  peak heap usage: \00", align 1
@.str.17.177 = private unnamed_addr constant [8 x i8] c" bytes\0A\00", align 1
@.str.18.178 = private unnamed_addr constant [3 x i8] c"  \00", align 1
@.str.19.179 = private unnamed_addr constant [3 x i8] c": \00", align 1
@.str.20.180 = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.21.181 = private unnamed_addr constant [3 x i8] c"ms\00", align 1
@.str.22.182 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@.str.23.183 = private unnamed_addr constant [3 x i8] c"%)\00", align 1
@.str.24.184 = private unnamed_addr constant [10 x i8] c"threads: \00", align 1
@.str.25.185 = private unnamed_addr constant [8 x i8] c" peak: \00", align 1
@.str.26.186 = private unnamed_addr constant [7 x i8] c" num: \00", align 1
@.str.27.187 = private unnamed_addr constant [7 x i8] c" avg: \00", align 1
@.str.28.188 = private unnamed_addr constant [9 x i8] c" stack: \00", align 1
@_ZZ25halide_profiler_get_stateE1s = internal global %struct.halide_profiler_state { %struct.halide_mutex zeroinitializer, i32 1, i32 0, i32 0, i32 0, %struct.halide_profiler_pipeline_stats* null, void (i32*, i32*)* null, %struct.halide_thread* null }, align 8
@.str.189 = private unnamed_addr constant [85 x i8] c"/home/sb54/halide-12/src/runtime/profiler.cpp:207 Assert failed: p_stats != nullptr\0A\00", align 1
@.str.1.190 = private unnamed_addr constant [85 x i8] c"/home/sb54/halide-12/src/runtime/profiler.cpp:234 Assert failed: p_stats != nullptr\0A\00", align 1
@.str.2.191 = private unnamed_addr constant [79 x i8] c"/home/sb54/halide-12/src/runtime/profiler.cpp:235 Assert failed: func_id >= 0\0A\00", align 1
@.str.3.192 = private unnamed_addr constant [95 x i8] c"/home/sb54/halide-12/src/runtime/profiler.cpp:236 Assert failed: func_id < p_stats->num_funcs\0A\00", align 1
@.str.4.193 = private unnamed_addr constant [85 x i8] c"/home/sb54/halide-12/src/runtime/profiler.cpp:270 Assert failed: p_stats != nullptr\0A\00", align 1
@.str.5.194 = private unnamed_addr constant [79 x i8] c"/home/sb54/halide-12/src/runtime/profiler.cpp:271 Assert failed: func_id >= 0\0A\00", align 1
@.str.6.195 = private unnamed_addr constant [95 x i8] c"/home/sb54/halide-12/src/runtime/profiler.cpp:272 Assert failed: func_id < p_stats->num_funcs\0A\00", align 1
@_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE = linkonce local_unnamed_addr global i32 (i32, i64*)* @halide_default_can_use_target_features, align 8
@_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE = linkonce global %struct.halide_mutex zeroinitializer, align 8
@_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE = linkonce local_unnamed_addr global i8 0, align 1
@_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE = linkonce global [4 x i64] zeroinitializer, align 8
@.str.200 = private unnamed_addr constant [81 x i8] c"Internal error: wrong structure size passed to halide_can_use_target_features()\0A\00", align 1
@str = private constant [7 x i8] c"output\00", align 32
@str.203 = private constant [6 x i8] c"input\00", align 32
@str.204 = private constant [19 x i8] c"Input buffer input\00", align 32
@str.205 = private constant [21 x i8] c"Output buffer output\00", align 32
@str.206 = private constant [15 x i8] c"input.stride.0\00", align 32
@str.207 = private constant [2 x i8] c"1\00", align 32
@str.208 = private constant [16 x i8] c"output.stride.0\00", align 32
@str.209 = private constant [12 x i8] c"repeat_edge\00", align 32
@str.210 = private constant [9 x i8] c"input_16\00", align 32
@str.211 = private constant [8 x i8] c"sobel_y\00", align 32
@0 = private constant i64 0
@1 = private constant i64 1920
@2 = private constant i64 0
@3 = private constant i64 1080
@4 = private constant [4 x i64*] [i64* @0, i64* @1, i64* @2, i64* @3]
@5 = private constant i64 0
@6 = private constant i64 1920
@7 = private constant i64 0
@8 = private constant i64 1080
@9 = private constant [4 x i64*] [i64* @5, i64* @6, i64* @7, i64* @8]
@10 = private constant [2 x %struct.halide_filter_argument_t] [%struct.halide_filter_argument_t { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @str.203, i32 0, i32 0), i32 1, i32 2, %struct.halide_type_t { i8 1, i8 8, i16 1 }, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, i64** getelementptr inbounds ([4 x i64*], [4 x i64*]* @4, i32 0, i32 0) }, %struct.halide_filter_argument_t { i8* getelementptr inbounds ([7 x i8], [7 x i8]* @str, i32 0, i32 0), i32 2, i32 2, %struct.halide_type_t { i8 1, i8 8, i16 1 }, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, i64** getelementptr inbounds ([4 x i64*], [4 x i64*]* @9, i32 0, i32 0) }]
@str.212 = private constant [59 x i8] c"x86-64-linux-avx-avx2-disable_llvm_loop_opt-f16c-fma-sse41\00", align 32
@str.213 = private constant [32 x i8] c"sobel3x3_batch_0058_sample_0015\00", align 32
@sobel3x3_batch_0058_sample_0015_metadata_storage = private constant %struct.halide_filter_metadata_t { i32 1, i32 2, %struct.halide_filter_argument_t* getelementptr inbounds ([2 x %struct.halide_filter_argument_t], [2 x %struct.halide_filter_argument_t]* @10, i32 0, i32 0), i8* getelementptr inbounds ([59 x i8], [59 x i8]* @str.212, i32 0, i32 0), i8* getelementptr inbounds ([32 x i8], [32 x i8]* @str.213, i32 0, i32 0) }
@switch.table.halide_type_to_string = private unnamed_addr constant [4 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.13.76, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.14.75, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.15.74, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.16.73, i64 0, i64 0)], align 8

; Function Attrs: nounwind mustprogress
define weak i8* @halide_default_malloc(i8* %0, i64 %1) #0 {
  %3 = add i64 %1, 64
  %4 = tail call i8* @malloc(i64 %3) #12
  %5 = icmp eq i8* %4, null
  br i1 %5, label %13, label %6

6:                                                ; preds = %2
  %7 = ptrtoint i8* %4 to i64
  %8 = add i64 %7, 71
  %9 = and i64 %8, -64
  %10 = inttoptr i64 %9 to i8*
  %11 = inttoptr i64 %9 to i8**
  %12 = getelementptr inbounds i8*, i8** %11, i64 -1
  store i8* %4, i8** %12, align 8, !tbaa !10
  br label %13

13:                                               ; preds = %6, %2
  %14 = phi i8* [ %10, %6 ], [ null, %2 ]
  ret i8* %14
}

declare i8* @malloc(i64) local_unnamed_addr #1

; Function Attrs: nounwind mustprogress
define weak void @halide_default_free(i8* %0, i8* %1) #0 {
  %3 = getelementptr inbounds i8, i8* %1, i64 -8
  %4 = bitcast i8* %3 to i8**
  %5 = load i8*, i8** %4, align 8, !tbaa !10
  tail call void @free(i8* %5) #12
  ret void
}

declare void @free(i8*) local_unnamed_addr #1

; Function Attrs: nounwind willreturn mustprogress
define weak i8* (i8*, i64)* @halide_set_custom_malloc(i8* (i8*, i64)* %0) local_unnamed_addr #2 {
  %2 = load i8* (i8*, i64)*, i8* (i8*, i64)** @_ZN6Halide7Runtime8Internal13custom_mallocE, align 8, !tbaa !10
  store i8* (i8*, i64)* %0, i8* (i8*, i64)** @_ZN6Halide7Runtime8Internal13custom_mallocE, align 8, !tbaa !10
  ret i8* (i8*, i64)* %2
}

; Function Attrs: nounwind willreturn mustprogress
define weak void (i8*, i8*)* @halide_set_custom_free(void (i8*, i8*)* %0) local_unnamed_addr #2 {
  %2 = load void (i8*, i8*)*, void (i8*, i8*)** @_ZN6Halide7Runtime8Internal11custom_freeE, align 8, !tbaa !10
  store void (i8*, i8*)* %0, void (i8*, i8*)** @_ZN6Halide7Runtime8Internal11custom_freeE, align 8, !tbaa !10
  ret void (i8*, i8*)* %2
}

; Function Attrs: nounwind mustprogress
define weak i8* @halide_malloc(i8* %0, i64 %1) local_unnamed_addr #0 {
  %3 = load i8* (i8*, i64)*, i8* (i8*, i64)** @_ZN6Halide7Runtime8Internal13custom_mallocE, align 8, !tbaa !10
  %4 = tail call i8* %3(i8* %0, i64 %1) #12
  ret i8* %4
}

; Function Attrs: nounwind mustprogress
define weak void @halide_free(i8* %0, i8* %1) local_unnamed_addr #0 {
  %3 = load void (i8*, i8*)*, void (i8*, i8*)** @_ZN6Halide7Runtime8Internal11custom_freeE, align 8, !tbaa !10
  tail call void %3(i8* %0, i8* %1) #12
  ret void
}

; Function Attrs: nounwind mustprogress
define weak void @halide_default_error(i8* %0, i8* %1) #0 {
  %3 = alloca [4096 x i8], align 1
  %4 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 4096, i8* nonnull %4) #10
  %5 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3, i64 0, i64 4094
  %6 = call i8* @halide_string_to_string(i8* nonnull %4, i8* nonnull %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0)) #12
  %7 = getelementptr inbounds i8, i8* %6, i64 4094
  %8 = call i8* @halide_string_to_string(i8* %6, i8* nonnull %7, i8* %1) #12
  %9 = getelementptr inbounds i8, i8* %8, i64 -1
  %10 = load i8, i8* %9, align 1, !tbaa !14
  %11 = icmp eq i8 %10, 10
  br i1 %11, label %14, label %12

12:                                               ; preds = %2
  store i8 10, i8* %8, align 1, !tbaa !14
  %13 = getelementptr inbounds i8, i8* %8, i64 1
  store i8 0, i8* %13, align 1, !tbaa !14
  br label %14

14:                                               ; preds = %12, %2
  %15 = phi i8* [ %13, %12 ], [ %8, %2 ]
  %16 = ptrtoint i8* %15 to i64
  %17 = ptrtoint [4096 x i8]* %3 to i64
  %18 = sub i64 1, %17
  %19 = add i64 %18, %16
  %20 = call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %4, i64 %19) #12
  call void @halide_print(i8* %0, i8* nonnull %4) #12
  call void @abort() #12
  call void @llvm.lifetime.end.p0i8(i64 4096, i8* nonnull %4) #10
  ret void
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

declare void @abort() local_unnamed_addr #1

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: nounwind mustprogress
define weak void @halide_error(i8* %0, i8* %1) local_unnamed_addr #0 {
  %3 = load void (i8*, i8*)*, void (i8*, i8*)** @_ZN6Halide7Runtime8Internal13error_handlerE, align 8, !tbaa !10
  tail call void %3(i8* %0, i8* %1) #12
  ret void
}

; Function Attrs: nounwind willreturn mustprogress
define weak void (i8*, i8*)* @halide_set_error_handler(void (i8*, i8*)* %0) local_unnamed_addr #2 {
  %2 = load void (i8*, i8*)*, void (i8*, i8*)** @_ZN6Halide7Runtime8Internal13error_handlerE, align 8, !tbaa !10
  store void (i8*, i8*)* %0, void (i8*, i8*)** @_ZN6Halide7Runtime8Internal13error_handlerE, align 8, !tbaa !10
  ret void (i8*, i8*)* %2
}

; Function Attrs: nounwind mustprogress
define weak void @halide_print(i8* %0, i8* %1) local_unnamed_addr #0 {
  %3 = load void (i8*, i8*)*, void (i8*, i8*)** @_ZN6Halide7Runtime8Internal12custom_printE, align 8, !tbaa !10
  tail call void %3(i8* %0, i8* %1) #12
  ret void
}

; Function Attrs: nounwind willreturn mustprogress
define weak void (i8*, i8*)* @halide_set_custom_print(void (i8*, i8*)* %0) local_unnamed_addr #2 {
  %2 = load void (i8*, i8*)*, void (i8*, i8*)** @_ZN6Halide7Runtime8Internal12custom_printE, align 8, !tbaa !10
  store void (i8*, i8*)* %0, void (i8*, i8*)** @_ZN6Halide7Runtime8Internal12custom_printE, align 8, !tbaa !10
  ret void (i8*, i8*)* %2
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_start_clock(i8* %0) local_unnamed_addr #0 {
  %2 = load i8, i8* @halide_reference_clock_inited, align 1, !tbaa !15, !range !17
  %3 = icmp eq i8 %2, 0
  br i1 %3, label %4, label %6

4:                                                ; preds = %1
  %5 = tail call i32 (i32, ...) @syscall(i32 228, i32 0, %struct.timespec* nonnull @halide_reference_clock) #12
  store i8 1, i8* @halide_reference_clock_inited, align 1, !tbaa !15
  br label %6

6:                                                ; preds = %4, %1
  ret i32 0
}

declare i32 @syscall(i32, ...) local_unnamed_addr #1

; Function Attrs: nounwind mustprogress
define weak i64 @halide_current_time_ns(i8* %0) local_unnamed_addr #0 {
  %2 = alloca <2 x i64>, align 16
  %3 = bitcast <2 x i64>* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %3) #10
  %4 = call i32 (i32, ...) @syscall(i32 228, i32 0, <2 x i64>* nonnull %2) #12
  %5 = load <2 x i64>, <2 x i64>* %2, align 16, !tbaa !18
  %6 = load <2 x i64>, <2 x i64>* bitcast (%struct.timespec* @halide_reference_clock to <2 x i64>*), align 8, !tbaa !18
  %7 = sub <2 x i64> %5, %6
  %8 = extractelement <2 x i64> %7, i32 0
  %9 = mul nsw i64 %8, 1000000000
  %10 = extractelement <2 x i64> %7, i32 1
  %11 = add nsw i64 %9, %10
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %3) #10
  ret i64 %11
}

; Function Attrs: nounwind mustprogress
define weak void @halide_sleep_ms(i8* %0, i32 %1) local_unnamed_addr #0 {
  %3 = mul nsw i32 %1, 1000
  %4 = tail call i32 @usleep(i32 %3) #12
  ret void
}

declare i32 @usleep(i32) local_unnamed_addr #1

; Function Attrs: nounwind mustprogress
define weak void @halide_default_print(i8* %0, i8* %1) #0 {
  %3 = tail call i64 @strlen(i8* %1) #12
  %4 = tail call i64 @write(i32 1, i8* %1, i64 %3) #12
  ret void
}

declare i64 @strlen(i8*) local_unnamed_addr #1

declare i64 @write(i32, i8*, i64) local_unnamed_addr #1

; Function Attrs: nounwind mustprogress
define weak i32 @halide_host_cpu_count() local_unnamed_addr #0 {
  %1 = tail call i64 @sysconf(i32 84) #12
  %2 = trunc i64 %1 to i32
  ret i32 %2
}

declare i64 @sysconf(i32) local_unnamed_addr #1

; Function Attrs: nounwind mustprogress
define weak void @halide_thread_yield() local_unnamed_addr #0 {
  %1 = tail call i32 @sched_yield() #12
  ret void
}

declare i32 @sched_yield() local_unnamed_addr #1

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_do_task(i8* %0, i32 (i8*, i32, i8*)* %1, i32 %2, i8* %3) #0 {
  %5 = tail call i32 %1(i8* %0, i32 %2, i8* %3) #12
  ret i32 %5
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_do_loop_task(i8* %0, i32 (i8*, i32, i32, i8*, i8*)* %1, i32 %2, i32 %3, i8* %4, i8* %5) #0 {
  %7 = tail call i32 %1(i8* %0, i32 %2, i32 %3, i8* %4, i8* %5) #12
  ret i32 %7
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_do_par_for(i8* %0, i32 (i8*, i32, i8*)* %1, i32 %2, i32 %3, i8* %4) #0 {
  %6 = alloca %"struct.Halide::Runtime::Internal::work", align 8
  %7 = icmp slt i32 %3, 1
  br i1 %7, label %29, label %8

8:                                                ; preds = %5
  %9 = bitcast %"struct.Halide::Runtime::Internal::work"* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %9) #10
  %10 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %6, i64 0, i32 0, i32 0
  store i32 (i8*, i32, i32, i8*, i8*)* null, i32 (i8*, i32, i32, i8*, i8*)** %10, align 8, !tbaa !20
  %11 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %6, i64 0, i32 0, i32 5
  store i32 %2, i32* %11, align 4, !tbaa !24
  %12 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %6, i64 0, i32 0, i32 6
  store i32 %3, i32* %12, align 8, !tbaa !25
  %13 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %6, i64 0, i32 0, i32 8
  store i8 0, i8* %13, align 8, !tbaa !26
  %14 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %6, i64 0, i32 0, i32 3
  store %struct.halide_semaphore_acquire_t* null, %struct.halide_semaphore_acquire_t** %14, align 8, !tbaa !27
  %15 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %6, i64 0, i32 0, i32 4
  store i32 0, i32* %15, align 8, !tbaa !28
  %16 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %6, i64 0, i32 0, i32 1
  store i8* %4, i8** %16, align 8, !tbaa !29
  %17 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %6, i64 0, i32 0, i32 7
  store i32 0, i32* %17, align 4, !tbaa !30
  %18 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %6, i64 0, i32 0, i32 2
  store i8* null, i8** %18, align 8, !tbaa !31
  %19 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %6, i64 0, i32 1
  store i32 (i8*, i32, i8*)* %1, i32 (i8*, i32, i8*)** %19, align 8, !tbaa !32
  %20 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %6, i64 0, i32 7
  store i8* %0, i8** %20, align 8, !tbaa !33
  %21 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %6, i64 0, i32 9
  store i32 0, i32* %21, align 4, !tbaa !34
  %22 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %6, i64 0, i32 8
  store i32 0, i32* %22, align 8, !tbaa !35
  %23 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %6, i64 0, i32 10
  store i32 0, i32* %23, align 8, !tbaa !36
  %24 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %6, i64 0, i32 11
  store i8 0, i8* %24, align 4, !tbaa !37
  %25 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %6, i64 0, i32 3
  store %"struct.Halide::Runtime::Internal::work"* %6, %"struct.Halide::Runtime::Internal::work"** %25, align 8, !tbaa !38
  %26 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %6, i64 0, i32 4
  store i32 0, i32* %26, align 8, !tbaa !39
  %27 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %6, i64 0, i32 5
  store %"struct.Halide::Runtime::Internal::work"* null, %"struct.Halide::Runtime::Internal::work"** %27, align 8, !tbaa !40
  call void @halide_mutex_lock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #13
  call void @_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_(i32 1, %"struct.Halide::Runtime::Internal::work"* nonnull %6, %"struct.Halide::Runtime::Internal::work"* null) #13
  call void @_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE(%"struct.Halide::Runtime::Internal::work"* nonnull %6) #13
  call void @halide_mutex_unlock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #13
  %28 = load i32, i32* %21, align 4, !tbaa !34
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %9) #10
  br label %29

29:                                               ; preds = %8, %5
  %30 = phi i32 [ %28, %8 ], [ 0, %5 ]
  ret i32 %30
}

; Function Attrs: nounwind
define weak void @halide_mutex_lock(%struct.halide_mutex* %0) local_unnamed_addr #4 {
  %2 = alloca %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", align 8
  %3 = getelementptr %struct.halide_mutex, %struct.halide_mutex* %0, i64 0, i32 0, i64 0
  %4 = cmpxchg weak i64* %3, i64 0, i64 1 acquire monotonic
  %5 = extractvalue { i64, i1 } %4, 1
  br i1 %5, label %.loopexit, label %6

6:                                                ; preds = %1
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

16:                                               ; preds = %.backedge, %6
  %17 = phi i64 [ %7, %6 ], [ %.be, %.backedge ]
  %18 = phi i32 [ 40, %6 ], [ %.be6, %.backedge ]
  %19 = and i64 %17, 1
  %20 = icmp eq i64 %19, 0
  br i1 %20, label %.preheader, label %.loopexit1

.preheader:                                       ; preds = %25, %16
  %21 = phi i64 [ %26, %25 ], [ %17, %16 ]
  %22 = or i64 %21, 1
  %23 = cmpxchg weak i64* %3, i64 %21, i64 %22 acquire monotonic
  %24 = extractvalue { i64, i1 } %23, 1
  br i1 %24, label %.loopexit, label %25

25:                                               ; preds = %.preheader
  %26 = extractvalue { i64, i1 } %23, 0
  %27 = and i64 %26, 1
  %28 = icmp eq i64 %27, 0
  br i1 %28, label %.preheader, label %.loopexit1.loopexit

.loopexit1.loopexit:                              ; preds = %25
  %29 = extractvalue { i64, i1 } %23, 0
  br label %.loopexit1

.loopexit1:                                       ; preds = %.loopexit1.loopexit, %16
  %30 = phi i64 [ %17, %16 ], [ %29, %.loopexit1.loopexit ]
  %31 = icmp sgt i32 %18, 0
  br i1 %31, label %32, label %37

32:                                               ; preds = %.loopexit1
  %33 = icmp eq i32 %18, 1
  br i1 %33, label %37, label %34

34:                                               ; preds = %32
  %35 = add nsw i32 %18, -1
  call void @halide_thread_yield() #12
  %36 = load atomic i64, i64* %3 monotonic, align 8
  br label %.backedge

37:                                               ; preds = %32, %.loopexit1
  %38 = phi i32 [ 0, %32 ], [ %18, %.loopexit1 ]
  %39 = and i64 %30, 2
  %40 = icmp eq i64 %39, 0
  br i1 %40, label %41, label %47

41:                                               ; preds = %37
  %42 = or i64 %30, 2
  %43 = cmpxchg weak i64* %3, i64 %30, i64 %42 monotonic monotonic
  %44 = extractvalue { i64, i1 } %43, 1
  br i1 %44, label %47, label %45

45:                                               ; preds = %41
  %46 = extractvalue { i64, i1 } %43, 0
  br label %.backedge

47:                                               ; preds = %41, %37
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %8) #10
  store void (i8*)* @_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv, void (i8*)** %10, align 8, !tbaa !41
  store void (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*, i1, i1)* @_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb, void (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*, i1, i1)** %12, align 8, !tbaa !43
  store i64* %3, i64** %13, align 8, !tbaa !44
  store i1 (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)* @_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE, i1 (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)** %9, align 8, !tbaa !46
  store i64 (i8*, i32, i1)* @_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib, i64 (i8*, i32, i1)** %11, align 8, !tbaa !47
  %48 = call i64 @_ZN6Halide7Runtime8Internal15Synchronization4parkEyRNS2_15parking_controlE(i64 %14, %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* nonnull align 8 dereferenceable(32) %15) #12
  %49 = icmp eq i64 %48, %14
  br i1 %49, label %52, label %50

50:                                               ; preds = %47
  %51 = load atomic i64, i64* %3 monotonic, align 8
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %8) #10
  br label %.backedge

.backedge:                                        ; preds = %50, %45, %34
  %.be = phi i64 [ %46, %45 ], [ %51, %50 ], [ %36, %34 ]
  %.be6 = phi i32 [ %38, %45 ], [ 40, %50 ], [ %35, %34 ]
  br label %16

52:                                               ; preds = %47
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %8) #10
  br label %.loopexit

.loopexit:                                        ; preds = %52, %.preheader, %1
  ret void
}

; Function Attrs: nounwind mustprogress
define linkonce void @_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_(i32 %0, %"struct.Halide::Runtime::Internal::work"* %1, %"struct.Halide::Runtime::Internal::work"* %2) local_unnamed_addr #0 {
  %4 = load i8, i8* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 15), align 1, !tbaa !48, !range !17
  %5 = icmp eq i8 %4, 0
  br i1 %5, label %.preheader8, label %24

.preheader8:                                      ; preds = %9, %3
  %6 = phi i8* [ %10, %9 ], [ bitcast (i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 2) to i8*), %3 ]
  %7 = load i8, i8* %6, align 1, !tbaa !14
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %9, label %12

9:                                                ; preds = %.preheader8
  %10 = getelementptr inbounds i8, i8* %6, i64 1
  %11 = icmp eq i8* %10, bitcast (%"struct.Halide::Runtime::Internal::work_queue_t"* select (i1 icmp ugt (i8* bitcast (%"struct.Halide::Runtime::Internal::work_queue_t"* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 1) to i8*), i8* getelementptr (i8, i8* bitcast (i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 2) to i8*), i64 1)), %"struct.Halide::Runtime::Internal::work_queue_t"* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 1), %"struct.Halide::Runtime::Internal::work_queue_t"* bitcast (i8* getelementptr (i8, i8* bitcast (i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 2) to i8*), i64 1) to %"struct.Halide::Runtime::Internal::work_queue_t"*)) to i8*)
  br i1 %11, label %12, label %.preheader8, !llvm.loop !52

12:                                               ; preds = %9, %.preheader8
  %13 = phi i8* [ %6, %.preheader8 ], [ bitcast (%"struct.Halide::Runtime::Internal::work_queue_t"* select (i1 icmp ugt (i8* bitcast (%"struct.Halide::Runtime::Internal::work_queue_t"* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 1) to i8*), i8* getelementptr (i8, i8* bitcast (i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 2) to i8*), i64 1)), %"struct.Halide::Runtime::Internal::work_queue_t"* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 1), %"struct.Halide::Runtime::Internal::work_queue_t"* bitcast (i8* getelementptr (i8, i8* bitcast (i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 2) to i8*), i64 1) to %"struct.Halide::Runtime::Internal::work_queue_t"*)) to i8*), %9 ]
  %14 = icmp eq i8* %13, bitcast (%"struct.Halide::Runtime::Internal::work_queue_t"* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 1) to i8*)
  br i1 %14, label %16, label %15

15:                                               ; preds = %12
  tail call void @halide_print(i8* null, i8* getelementptr inbounds ([150 x i8], [150 x i8]* @.str.7, i64 0, i64 0)) #12
  tail call void @abort() #12
  br label %16

16:                                               ; preds = %15, %12
  %17 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 1), align 8, !tbaa !54
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %21

19:                                               ; preds = %16
  %20 = tail call i32 @_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv() #13
  store i32 %20, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 1), align 8, !tbaa !54
  br label %21

21:                                               ; preds = %19, %16
  %22 = phi i32 [ %20, %19 ], [ %17, %16 ]
  %23 = tail call i32 @_ZN6Halide7Runtime8Internal17clamp_num_threadsEi(i32 %22) #13
  store i32 %23, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 1), align 8, !tbaa !54
  store i8 1, i8* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 15), align 1, !tbaa !48
  br label %24

24:                                               ; preds = %21, %3
  %25 = icmp sgt i32 %0, 0
  br i1 %25, label %26, label %30

26:                                               ; preds = %24
  %27 = zext i32 %0 to i64
  br label %37

28:                                               ; preds = %63
  %29 = and i8 %48, 1
  br label %30

30:                                               ; preds = %28, %24
  %31 = phi i32 [ -1, %24 ], [ %64, %28 ]
  %32 = phi i8 [ 0, %24 ], [ %29, %28 ]
  %33 = phi i8 [ 0, %24 ], [ %53, %28 ]
  %34 = phi i8 [ 0, %24 ], [ %49, %28 ]
  %35 = phi i32 [ 0, %24 ], [ %47, %28 ]
  %36 = icmp eq %"struct.Halide::Runtime::Internal::work"* %2, null
  br i1 %36, label %67, label %97

37:                                               ; preds = %63, %26
  %38 = phi i64 [ 0, %26 ], [ %65, %63 ]
  %39 = phi i32 [ 0, %26 ], [ %47, %63 ]
  %40 = phi i8 [ 0, %26 ], [ %49, %63 ]
  %41 = phi i8 [ 0, %26 ], [ %53, %63 ]
  %42 = phi i8 [ 0, %26 ], [ %48, %63 ]
  %43 = phi i32 [ -1, %26 ], [ %64, %63 ]
  %44 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %1, i64 %38, i32 0, i32 7
  %45 = load i32, i32* %44, align 4, !tbaa !30
  %46 = icmp eq i32 %45, 0
  %47 = add i32 %45, %39
  %48 = select i1 %46, i8 1, i8 %42
  %49 = select i1 %46, i8 %40, i8 1
  %50 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %1, i64 %38, i32 0, i32 4
  %51 = load i32, i32* %50, align 8, !tbaa !28
  %52 = icmp eq i32 %51, 0
  %53 = select i1 %52, i8 %41, i8 1
  %54 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %1, i64 %38, i32 0, i32 8
  %55 = load i8, i8* %54, align 8, !tbaa !26, !range !17
  %56 = icmp eq i8 %55, 0
  br i1 %56, label %59, label %57

57:                                               ; preds = %37
  %58 = add nsw i32 %43, 1
  br label %63

59:                                               ; preds = %37
  %60 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %1, i64 %38, i32 0, i32 6
  %61 = load i32, i32* %60, align 8, !tbaa !25
  %62 = add nsw i32 %61, %43
  br label %63

63:                                               ; preds = %59, %57
  %64 = phi i32 [ %58, %57 ], [ %62, %59 ]
  %65 = add nuw nsw i64 %38, 1
  %66 = icmp eq i64 %65, %27
  br i1 %66, label %28, label %37, !llvm.loop !55

67:                                               ; preds = %30
  %68 = or i8 %34, %33
  %69 = and i8 %68, 1
  %70 = icmp eq i8 %69, 0
  %71 = xor i1 %70, true
  %72 = zext i1 %71 to i32
  %73 = add nsw i32 %35, %72
  %74 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 4), align 8, !tbaa !56
  %75 = icmp slt i32 %74, 256
  br i1 %75, label %.preheader, label %.loopexit

.preheader:                                       ; preds = %85, %67
  %76 = phi i32 [ %90, %85 ], [ %74, %67 ]
  %77 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 1), align 8, !tbaa !54
  %78 = add nsw i32 %77, -1
  %79 = icmp slt i32 %76, %78
  br i1 %79, label %85, label %80

80:                                               ; preds = %.preheader
  %81 = add nsw i32 %76, 1
  %82 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 16), align 4, !tbaa !57
  %83 = sub i32 %81, %82
  %84 = icmp slt i32 %83, %73
  br i1 %84, label %85, label %.loopexit

85:                                               ; preds = %80, %.preheader
  %86 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 5), align 4, !tbaa !58
  %87 = add nsw i32 %86, 1
  store i32 %87, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 5), align 4, !tbaa !58
  %88 = tail call %struct.halide_thread* @halide_spawn_thread(void (i8*)* nonnull @_ZN6Halide7Runtime8Internal13worker_threadEPv, i8* null) #13
  %89 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 4), align 8, !tbaa !56
  %90 = add nsw i32 %89, 1
  store i32 %90, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 4), align 8, !tbaa !56
  %91 = sext i32 %89 to i64
  %92 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 13, i64 %91
  store %struct.halide_thread* %88, %struct.halide_thread** %92, align 8, !tbaa !10
  %93 = icmp slt i32 %89, 255
  br i1 %93, label %.preheader, label %.loopexit, !llvm.loop !59

.loopexit:                                        ; preds = %85, %80, %67
  br i1 %70, label %115, label %94

94:                                               ; preds = %.loopexit
  %95 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 16), align 4, !tbaa !57
  %96 = add nsw i32 %95, 1
  store i32 %96, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 16), align 4, !tbaa !57
  br label %115

97:                                               ; preds = %30
  %98 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %2, i64 0, i32 0, i32 7
  %99 = load i32, i32* %98, align 4, !tbaa !30
  %100 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %2, i64 0, i32 8
  %101 = load i32, i32* %100, align 8, !tbaa !35
  %102 = mul nsw i32 %101, %99
  %103 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %2, i64 0, i32 6
  %104 = load i32, i32* %103, align 8, !tbaa !60
  %105 = sub nsw i32 %102, %104
  %106 = icmp sgt i32 %35, %105
  br i1 %106, label %107, label %108

107:                                              ; preds = %97
  tail call void @halide_print(i8* null, i8* getelementptr inbounds ([227 x i8], [227 x i8]* @.str.3, i64 0, i64 0)) #12
  tail call void @abort() #12
  br label %108

108:                                              ; preds = %107, %97
  %109 = or i8 %34, %33
  %110 = and i8 %109, 1
  %111 = icmp eq i8 %110, 0
  br i1 %111, label %115, label %112

112:                                              ; preds = %108
  %113 = load i32, i32* %103, align 8, !tbaa !60
  %114 = add nsw i32 %113, 1
  store i32 %114, i32* %103, align 8, !tbaa !60
  br label %115

115:                                              ; preds = %112, %108, %94, %.loopexit
  br i1 %25, label %116, label %120

116:                                              ; preds = %115
  %117 = load %"struct.Halide::Runtime::Internal::work"*, %"struct.Halide::Runtime::Internal::work"** getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 3), align 8, !tbaa !61
  %118 = zext i32 %0 to i64
  br label %133

119:                                              ; preds = %133
  store %"struct.Halide::Runtime::Internal::work"* %1, %"struct.Halide::Runtime::Internal::work"** getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 3), align 8, !tbaa !61
  br label %120

120:                                              ; preds = %119, %115
  %121 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 12), align 4, !tbaa !62
  %122 = icmp ne i32 %121, 0
  %123 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 11), align 8
  %124 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 4), align 8
  %125 = icmp slt i32 %123, %124
  %126 = or i1 %122, %125
  %127 = icmp sgt i32 %31, %123
  %128 = or i1 %127, %126
  %129 = select i1 %128, i32 %124, i32 %31
  store i32 %129, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 6), align 8, !tbaa !63
  tail call void @halide_cond_broadcast(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 8)) #13
  %130 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 6), align 8, !tbaa !63
  %131 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 5), align 4, !tbaa !58
  %132 = icmp sgt i32 %130, %131
  br i1 %132, label %143, label %146

133:                                              ; preds = %133, %116
  %134 = phi i64 [ %118, %116 ], [ %136, %133 ]
  %135 = phi %"struct.Halide::Runtime::Internal::work"* [ %117, %116 ], [ %137, %133 ]
  %136 = add nsw i64 %134, -1
  %137 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %1, i64 %136
  %138 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %1, i64 %136, i32 2
  store %"struct.Halide::Runtime::Internal::work"* %135, %"struct.Halide::Runtime::Internal::work"** %138, align 8, !tbaa !64
  %139 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %1, i64 %136, i32 3
  store %"struct.Halide::Runtime::Internal::work"* %1, %"struct.Halide::Runtime::Internal::work"** %139, align 8, !tbaa !38
  %140 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %1, i64 %136, i32 4
  store i32 %0, i32* %140, align 8, !tbaa !39
  %141 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %1, i64 %136, i32 6
  store i32 0, i32* %141, align 8, !tbaa !60
  %142 = icmp sgt i64 %134, 1
  br i1 %142, label %133, label %119, !llvm.loop !65

143:                                              ; preds = %120
  tail call void @halide_cond_broadcast(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 9)) #13
  %144 = icmp eq i8 %32, 0
  br i1 %144, label %146, label %145

145:                                              ; preds = %143
  tail call void @halide_cond_broadcast(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 10)) #13
  br label %146

146:                                              ; preds = %145, %143, %120
  %147 = or i8 %34, %33
  %148 = and i8 %147, 1
  %149 = icmp eq i8 %148, 0
  br i1 %149, label %158, label %150

150:                                              ; preds = %146
  br i1 %36, label %155, label %151

151:                                              ; preds = %150
  %152 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %2, i64 0, i32 6
  %153 = load i32, i32* %152, align 8, !tbaa !60
  %154 = add nsw i32 %153, -1
  store i32 %154, i32* %152, align 8, !tbaa !60
  br label %158

155:                                              ; preds = %150
  %156 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 16), align 4, !tbaa !57
  %157 = add nsw i32 %156, -1
  store i32 %157, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 16), align 4, !tbaa !57
  br label %158

158:                                              ; preds = %155, %151, %146
  ret void
}

; Function Attrs: nounwind mustprogress
define linkonce void @_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE(%"struct.Halide::Runtime::Internal::work"* %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %0, i64 0, i32 8
  %3 = icmp eq %"struct.Halide::Runtime::Internal::work"* %0, null
  %4 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %0, i64 0, i32 0, i32 6
  %5 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %0, i64 0, i32 9
  %6 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %0, i64 0, i32 5
  %7 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %0, i64 0, i32 3
  %8 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %0, i64 0, i32 11
  %9 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %0, i64 0, i32 2
  br label %10

10:                                               ; preds = %.backedge, %1
  %11 = phi i32 [ 0, %1 ], [ %.be, %.backedge ]
  br i1 %3, label %15, label %12

12:                                               ; preds = %10
  %13 = load i32, i32* %4, align 8, !tbaa !25
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %18, label %21

15:                                               ; preds = %10
  %16 = load i8, i8* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 14), align 8, !tbaa !66, !range !17
  %17 = icmp eq i8 %16, 0
  br i1 %17, label %47, label %395

18:                                               ; preds = %12
  %19 = load i32, i32* %2, align 8, !tbaa !35
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %395, label %21

21:                                               ; preds = %18, %12
  %22 = load %"struct.Halide::Runtime::Internal::work"*, %"struct.Halide::Runtime::Internal::work"** getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 3), align 8, !tbaa !61
  %23 = load i32, i32* %5, align 4, !tbaa !34
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %37, label %25

25:                                               ; preds = %21
  %26 = load i32, i32* %2, align 8, !tbaa !35
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %45

28:                                               ; preds = %25
  %29 = icmp eq %"struct.Halide::Runtime::Internal::work"* %22, %0
  br i1 %29, label %.loopexit46, label %.preheader45

.preheader45:                                     ; preds = %.preheader45, %28
  %30 = phi %"struct.Halide::Runtime::Internal::work"* [ %32, %.preheader45 ], [ %22, %28 ]
  %31 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %30, i64 0, i32 2
  %32 = load %"struct.Halide::Runtime::Internal::work"*, %"struct.Halide::Runtime::Internal::work"** %31, align 8, !tbaa !64
  %33 = icmp eq %"struct.Halide::Runtime::Internal::work"* %32, %0
  br i1 %33, label %.loopexit46.loopexit, label %.preheader45, !llvm.loop !67

.loopexit46.loopexit:                             ; preds = %.preheader45
  %34 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %30, i64 0, i32 2
  br label %.loopexit46

.loopexit46:                                      ; preds = %.loopexit46.loopexit, %28
  %35 = phi %"struct.Halide::Runtime::Internal::work"** [ getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 3), %28 ], [ %34, %.loopexit46.loopexit ]
  %36 = load %"struct.Halide::Runtime::Internal::work"*, %"struct.Halide::Runtime::Internal::work"** %9, align 8, !tbaa !64
  store %"struct.Halide::Runtime::Internal::work"* %36, %"struct.Halide::Runtime::Internal::work"** %35, align 8, !tbaa !10
  store i32 0, i32* %4, align 8, !tbaa !25
  br label %.backedge

37:                                               ; preds = %21
  %38 = load %"struct.Halide::Runtime::Internal::work"*, %"struct.Halide::Runtime::Internal::work"** %6, align 8, !tbaa !40
  %39 = icmp eq %"struct.Halide::Runtime::Internal::work"* %38, null
  br i1 %39, label %45, label %40

40:                                               ; preds = %37
  %41 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %38, i64 0, i32 9
  %42 = load i32, i32* %41, align 4, !tbaa !34
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %45, label %44

44:                                               ; preds = %40
  store i32 %42, i32* %5, align 4, !tbaa !34
  tail call void @halide_cond_broadcast(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 10)) #13
  br label %.backedge

45:                                               ; preds = %40, %37, %25
  %46 = icmp eq %"struct.Halide::Runtime::Internal::work"* %22, null
  br i1 %46, label %.thread, label %.preheader42

47:                                               ; preds = %15
  %48 = load %"struct.Halide::Runtime::Internal::work"*, %"struct.Halide::Runtime::Internal::work"** getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 3), align 8, !tbaa !61
  %49 = icmp eq %"struct.Halide::Runtime::Internal::work"* %48, null
  br i1 %49, label %192, label %.preheader39

.preheader39:                                     ; preds = %.loopexit34, %47
  %50 = phi %"struct.Halide::Runtime::Internal::work"* [ %111, %.loopexit34 ], [ %48, %47 ]
  %51 = phi %"struct.Halide::Runtime::Internal::work"** [ %110, %.loopexit34 ], [ getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 3), %47 ]
  %52 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %50, i64 0, i32 5
  %53 = load %"struct.Halide::Runtime::Internal::work"*, %"struct.Halide::Runtime::Internal::work"** %52, align 8, !tbaa !40
  %54 = icmp eq %"struct.Halide::Runtime::Internal::work"* %53, null
  br i1 %54, label %70, label %55

55:                                               ; preds = %.preheader39
  %56 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %53, i64 0, i32 8
  %57 = load i32, i32* %56, align 8, !tbaa !35
  %58 = icmp eq i32 %57, 0
  %59 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %53, i64 0, i32 0, i32 7
  %60 = load i32, i32* %59, align 4, !tbaa !30
  br i1 %58, label %66, label %61

61:                                               ; preds = %55
  %62 = mul nsw i32 %60, %57
  %63 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %53, i64 0, i32 6
  %64 = load i32, i32* %63, align 8, !tbaa !60
  %65 = sub nsw i32 %62, %64
  br label %75

66:                                               ; preds = %55
  %67 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %53, i64 0, i32 6
  %68 = load i32, i32* %67, align 8, !tbaa !60
  %69 = sub nsw i32 %60, %68
  br label %75

70:                                               ; preds = %.preheader39
  %71 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 4), align 8, !tbaa !56
  %72 = add nsw i32 %71, 1
  %73 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 16), align 4, !tbaa !57
  %74 = sub i32 %72, %73
  br label %75

75:                                               ; preds = %70, %66, %61
  %76 = phi i32 [ %74, %70 ], [ %69, %66 ], [ %65, %61 ]
  %77 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %50, i64 0, i32 0, i32 7
  %78 = load i32, i32* %77, align 4, !tbaa !30
  %79 = icmp sge i32 %76, %78
  %80 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %50, i64 0, i32 0, i32 8
  %81 = load i8, i8* %80, align 8, !tbaa !26, !range !17
  %82 = icmp eq i8 %81, 0
  br i1 %82, label %._crit_edge191, label %83

._crit_edge191:                                   ; preds = %75
  %.0192 = and i1 %79, true
  br label %87

83:                                               ; preds = %75
  %84 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %50, i64 0, i32 8
  %85 = load i32, i32* %84, align 8, !tbaa !35
  %86 = icmp eq i32 %85, 0
  %.1193 = and i1 %79, %86
  br label %87

87:                                               ; preds = %83, %._crit_edge191
  %.phi194 = phi i1 [ %.0192, %._crit_edge191 ], [ %.1193, %83 ]
  br i1 %.phi194, label %88, label %.loopexit34

88:                                               ; preds = %87
  %89 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %50, i64 0, i32 10
  %90 = load i32, i32* %89, align 8, !tbaa !36
  %91 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %50, i64 0, i32 0, i32 4
  %92 = load i32, i32* %91, align 8, !tbaa !28
  %93 = icmp slt i32 %90, %92
  br i1 %93, label %94, label %.loopexit35

94:                                               ; preds = %88
  %95 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %50, i64 0, i32 0, i32 3
  br label %96

96:                                               ; preds = %105, %94
  %97 = phi i32 [ %90, %94 ], [ %107, %105 ]
  %98 = load %struct.halide_semaphore_acquire_t*, %struct.halide_semaphore_acquire_t** %95, align 8, !tbaa !27
  %99 = sext i32 %97 to i64
  %100 = getelementptr inbounds %struct.halide_semaphore_acquire_t, %struct.halide_semaphore_acquire_t* %98, i64 %99, i32 0
  %101 = load %struct.halide_semaphore_t*, %struct.halide_semaphore_t** %100, align 8, !tbaa !68
  %102 = getelementptr inbounds %struct.halide_semaphore_acquire_t, %struct.halide_semaphore_acquire_t* %98, i64 %99, i32 1
  %103 = load i32, i32* %102, align 8, !tbaa !70
  %104 = tail call zeroext i1 @halide_default_semaphore_try_acquire(%struct.halide_semaphore_t* %101, i32 %103) #12
  br i1 %104, label %105, label %.loopexit34

105:                                              ; preds = %96
  %106 = load i32, i32* %89, align 8, !tbaa !36
  %107 = add nsw i32 %106, 1
  store i32 %107, i32* %89, align 8, !tbaa !36
  %108 = load i32, i32* %91, align 8, !tbaa !28
  %109 = icmp slt i32 %107, %108
  br i1 %109, label %96, label %.loopexit35, !llvm.loop !71

.loopexit34:                                      ; preds = %96, %87
  %110 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %50, i64 0, i32 2
  %111 = load %"struct.Halide::Runtime::Internal::work"*, %"struct.Halide::Runtime::Internal::work"** %110, align 8, !tbaa !64
  %112 = icmp eq %"struct.Halide::Runtime::Internal::work"* %111, null
  br i1 %112, label %.loopexit41, label %.preheader39

.preheader42:                                     ; preds = %.loopexit36, %45
  %113 = phi %"struct.Halide::Runtime::Internal::work"* [ %182, %.loopexit36 ], [ %22, %45 ]
  %114 = phi %"struct.Halide::Runtime::Internal::work"** [ %181, %.loopexit36 ], [ getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 3), %45 ]
  %115 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %113, i64 0, i32 5
  %116 = load %"struct.Halide::Runtime::Internal::work"*, %"struct.Halide::Runtime::Internal::work"** %115, align 8, !tbaa !40
  %117 = icmp eq %"struct.Halide::Runtime::Internal::work"* %116, null
  br i1 %117, label %118, label %123

118:                                              ; preds = %.preheader42
  %119 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 4), align 8, !tbaa !56
  %120 = add nsw i32 %119, 1
  %121 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 16), align 4, !tbaa !57
  %122 = sub i32 %120, %121
  br label %138

123:                                              ; preds = %.preheader42
  %124 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %116, i64 0, i32 8
  %125 = load i32, i32* %124, align 8, !tbaa !35
  %126 = icmp eq i32 %125, 0
  %127 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %116, i64 0, i32 0, i32 7
  %128 = load i32, i32* %127, align 4, !tbaa !30
  br i1 %126, label %129, label %133

129:                                              ; preds = %123
  %130 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %116, i64 0, i32 6
  %131 = load i32, i32* %130, align 8, !tbaa !60
  %132 = sub nsw i32 %128, %131
  br label %138

133:                                              ; preds = %123
  %134 = mul nsw i32 %128, %125
  %135 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %116, i64 0, i32 6
  %136 = load i32, i32* %135, align 8, !tbaa !60
  %137 = sub nsw i32 %134, %136
  br label %138

138:                                              ; preds = %133, %129, %118
  %139 = phi i32 [ %122, %118 ], [ %132, %129 ], [ %137, %133 ]
  %140 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %113, i64 0, i32 0, i32 7
  %141 = load i32, i32* %140, align 4, !tbaa !30
  %142 = icmp slt i32 %139, %141
  %143 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %113, i64 0, i32 3
  %144 = load %"struct.Halide::Runtime::Internal::work"*, %"struct.Halide::Runtime::Internal::work"** %143, align 8, !tbaa !38
  %145 = load %"struct.Halide::Runtime::Internal::work"*, %"struct.Halide::Runtime::Internal::work"** %7, align 8, !tbaa !38
  %146 = icmp ne %"struct.Halide::Runtime::Internal::work"* %144, %145
  %147 = icmp ne i32 %141, 0
  %148 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %113, i64 0, i32 0, i32 8
  %149 = load i8, i8* %148, align 8, !tbaa !26, !range !17
  %150 = icmp eq i8 %149, 0
  br i1 %150, label %._crit_edge, label %151

._crit_edge:                                      ; preds = %138
  %.0 = xor i1 true, true
  br label %155

151:                                              ; preds = %138
  %152 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %113, i64 0, i32 8
  %153 = load i32, i32* %152, align 8, !tbaa !35
  %154 = icmp eq i32 %153, 0
  %.1 = xor i1 %154, true
  br label %155

155:                                              ; preds = %151, %._crit_edge
  %.phi = phi i1 [ %.0, %._crit_edge ], [ %.1, %151 ]
  %156 = and i1 %147, %146
  %157 = or i1 %142, %156
  %158 = or i1 %157, %.phi
  br i1 %158, label %.loopexit36, label %159

159:                                              ; preds = %155
  %160 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %113, i64 0, i32 10
  %161 = load i32, i32* %160, align 8, !tbaa !36
  %162 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %113, i64 0, i32 0, i32 4
  %163 = load i32, i32* %162, align 8, !tbaa !28
  %164 = icmp slt i32 %161, %163
  br i1 %164, label %165, label %.loopexit35

165:                                              ; preds = %159
  %166 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %113, i64 0, i32 0, i32 3
  br label %167

167:                                              ; preds = %176, %165
  %168 = phi i32 [ %161, %165 ], [ %178, %176 ]
  %169 = load %struct.halide_semaphore_acquire_t*, %struct.halide_semaphore_acquire_t** %166, align 8, !tbaa !27
  %170 = sext i32 %168 to i64
  %171 = getelementptr inbounds %struct.halide_semaphore_acquire_t, %struct.halide_semaphore_acquire_t* %169, i64 %170, i32 0
  %172 = load %struct.halide_semaphore_t*, %struct.halide_semaphore_t** %171, align 8, !tbaa !68
  %173 = getelementptr inbounds %struct.halide_semaphore_acquire_t, %struct.halide_semaphore_acquire_t* %169, i64 %170, i32 1
  %174 = load i32, i32* %173, align 8, !tbaa !70
  %175 = tail call zeroext i1 @halide_default_semaphore_try_acquire(%struct.halide_semaphore_t* %172, i32 %174) #12
  br i1 %175, label %176, label %.loopexit36

176:                                              ; preds = %167
  %177 = load i32, i32* %160, align 8, !tbaa !36
  %178 = add nsw i32 %177, 1
  store i32 %178, i32* %160, align 8, !tbaa !36
  %179 = load i32, i32* %162, align 8, !tbaa !28
  %180 = icmp slt i32 %178, %179
  br i1 %180, label %167, label %.loopexit35, !llvm.loop !71

.loopexit36:                                      ; preds = %167, %155
  %181 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %113, i64 0, i32 2
  %182 = load %"struct.Halide::Runtime::Internal::work"*, %"struct.Halide::Runtime::Internal::work"** %181, align 8, !tbaa !64
  %183 = icmp eq %"struct.Halide::Runtime::Internal::work"* %182, null
  br i1 %183, label %.loopexit41, label %.preheader42

.loopexit41:                                      ; preds = %.loopexit36, %.loopexit34
  br i1 %3, label %192, label %.thread

.thread:                                          ; preds = %.loopexit41, %45
  %184 = add nsw i32 %11, 1
  %185 = icmp slt i32 %11, 40
  br i1 %185, label %186, label %187

186:                                              ; preds = %.thread
  tail call void @halide_mutex_unlock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #13
  tail call void @halide_thread_yield() #12
  tail call void @halide_mutex_lock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #13
  br label %.backedge

187:                                              ; preds = %.thread
  %188 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 12), align 4, !tbaa !62
  %189 = add nsw i32 %188, 1
  store i32 %189, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 12), align 4, !tbaa !62
  store i8 1, i8* %8, align 4, !tbaa !37
  tail call void @halide_cond_wait(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 10), %struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #13
  store i8 0, i8* %8, align 4, !tbaa !37
  %190 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 12), align 4, !tbaa !62
  %191 = add nsw i32 %190, -1
  store i32 %191, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 12), align 4, !tbaa !62
  br label %.backedge

192:                                              ; preds = %.loopexit41, %47
  %193 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 11), align 8, !tbaa !72
  %194 = add nsw i32 %193, 1
  store i32 %194, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 11), align 8, !tbaa !72
  %195 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 5), align 4, !tbaa !58
  %196 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 6), align 8, !tbaa !63
  %197 = icmp sgt i32 %195, %196
  br i1 %197, label %198, label %202

198:                                              ; preds = %192
  %199 = add nsw i32 %195, -1
  store i32 %199, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 5), align 4, !tbaa !58
  tail call void @halide_cond_wait(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 9), %struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #13
  %200 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 5), align 4, !tbaa !58
  %201 = add nsw i32 %200, 1
  store i32 %201, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 5), align 4, !tbaa !58
  br label %207

202:                                              ; preds = %192
  %203 = add nsw i32 %11, 1
  %204 = icmp slt i32 %11, 40
  br i1 %204, label %205, label %206

205:                                              ; preds = %202
  tail call void @halide_mutex_unlock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #13
  tail call void @halide_thread_yield() #12
  tail call void @halide_mutex_lock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #13
  br label %207

206:                                              ; preds = %202
  tail call void @halide_cond_wait(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 8), %struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #13
  br label %207

207:                                              ; preds = %206, %205, %198
  %208 = phi i32 [ %11, %198 ], [ %203, %205 ], [ %203, %206 ]
  %209 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 11), align 8, !tbaa !72
  %210 = add nsw i32 %209, -1
  store i32 %210, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 11), align 8, !tbaa !72
  br label %.backedge

.loopexit35:                                      ; preds = %176, %159, %105, %88
  %211 = phi i32* [ %89, %105 ], [ %160, %176 ], [ %89, %88 ], [ %160, %159 ]
  %212 = phi %"struct.Halide::Runtime::Internal::work"** [ %51, %105 ], [ %114, %176 ], [ %51, %88 ], [ %114, %159 ]
  %213 = phi %"struct.Halide::Runtime::Internal::work"* [ %50, %105 ], [ %113, %176 ], [ %50, %88 ], [ %113, %159 ]
  store i32 0, i32* %211, align 8, !tbaa !36
  %214 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %213, i64 0, i32 8
  %215 = load i32, i32* %214, align 8, !tbaa !35
  %216 = add nsw i32 %215, 1
  store i32 %216, i32* %214, align 8, !tbaa !35
  %217 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %213, i64 0, i32 5
  %218 = load %"struct.Halide::Runtime::Internal::work"*, %"struct.Halide::Runtime::Internal::work"** %217, align 8, !tbaa !40
  %219 = icmp eq %"struct.Halide::Runtime::Internal::work"* %218, null
  %220 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %213, i64 0, i32 0, i32 7
  %221 = load i32, i32* %220, align 4, !tbaa !30
  br i1 %219, label %222, label %225

222:                                              ; preds = %.loopexit35
  %223 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 16), align 4, !tbaa !57
  %224 = add nsw i32 %223, %221
  store i32 %224, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 16), align 4, !tbaa !57
  br label %229

225:                                              ; preds = %.loopexit35
  %226 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %218, i64 0, i32 6
  %227 = load i32, i32* %226, align 8, !tbaa !60
  %228 = add nsw i32 %227, %221
  store i32 %228, i32* %226, align 8, !tbaa !60
  br label %229

229:                                              ; preds = %225, %222
  %230 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %213, i64 0, i32 0, i32 8
  %231 = load i8, i8* %230, align 8, !tbaa !26, !range !17
  %232 = icmp eq i8 %231, 0
  br i1 %232, label %305, label %233

233:                                              ; preds = %229
  %234 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %213, i64 0, i32 2
  %235 = load %"struct.Halide::Runtime::Internal::work"*, %"struct.Halide::Runtime::Internal::work"** %234, align 8, !tbaa !64
  store %"struct.Halide::Runtime::Internal::work"* %235, %"struct.Halide::Runtime::Internal::work"** %212, align 8, !tbaa !10
  tail call void @halide_mutex_unlock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #13
  %236 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %213, i64 0, i32 0, i32 6
  %237 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %213, i64 0, i32 10
  %238 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %213, i64 0, i32 0, i32 4
  %239 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %213, i64 0, i32 0, i32 3
  %240 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %213, i64 0, i32 7
  %241 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %213, i64 0, i32 0, i32 0
  %242 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %213, i64 0, i32 0, i32 5
  %243 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %213, i64 0, i32 0, i32 1
  %244 = bitcast %"struct.Halide::Runtime::Internal::work"* %213 to i8*
  br label %245

245:                                              ; preds = %.loopexit33, %233
  %246 = phi i32 [ 1, %233 ], [ 0, %.loopexit33 ]
  %247 = phi i32 [ 0, %233 ], [ %290, %.loopexit33 ]
  %248 = load i32, i32* %236, align 8, !tbaa !25
  %249 = sub nsw i32 %248, %247
  %250 = icmp sgt i32 %249, %246
  br i1 %250, label %251, label %.loopexit

251:                                              ; preds = %245
  %252 = load i32, i32* %237, align 8, !tbaa !36
  %253 = load i32, i32* %238, align 8, !tbaa !28
  br label %254

254:                                              ; preds = %275, %251
  %255 = phi i32 [ %276, %275 ], [ %248, %251 ]
  %256 = phi i32 [ %277, %275 ], [ %253, %251 ]
  %257 = phi i32 [ 0, %275 ], [ %252, %251 ]
  %258 = phi i32 [ %278, %275 ], [ %246, %251 ]
  %259 = icmp slt i32 %257, %256
  br i1 %259, label %.preheader, label %275

.preheader:                                       ; preds = %268, %254
  %260 = phi i32 [ %270, %268 ], [ %257, %254 ]
  %261 = load %struct.halide_semaphore_acquire_t*, %struct.halide_semaphore_acquire_t** %239, align 8, !tbaa !27
  %262 = sext i32 %260 to i64
  %263 = getelementptr inbounds %struct.halide_semaphore_acquire_t, %struct.halide_semaphore_acquire_t* %261, i64 %262, i32 0
  %264 = load %struct.halide_semaphore_t*, %struct.halide_semaphore_t** %263, align 8, !tbaa !68
  %265 = getelementptr inbounds %struct.halide_semaphore_acquire_t, %struct.halide_semaphore_acquire_t* %261, i64 %262, i32 1
  %266 = load i32, i32* %265, align 8, !tbaa !70
  %267 = tail call zeroext i1 @halide_default_semaphore_try_acquire(%struct.halide_semaphore_t* %264, i32 %266) #12
  br i1 %267, label %268, label %.loopexit

268:                                              ; preds = %.preheader
  %269 = load i32, i32* %237, align 8, !tbaa !36
  %270 = add nsw i32 %269, 1
  store i32 %270, i32* %237, align 8, !tbaa !36
  %271 = load i32, i32* %238, align 8, !tbaa !28
  %272 = icmp slt i32 %270, %271
  br i1 %272, label %.preheader, label %273, !llvm.loop !71

273:                                              ; preds = %268
  %274 = load i32, i32* %236, align 8, !tbaa !25
  br label %275

275:                                              ; preds = %273, %254
  %276 = phi i32 [ %274, %273 ], [ %255, %254 ]
  %277 = phi i32 [ %271, %273 ], [ %256, %254 ]
  store i32 0, i32* %237, align 8, !tbaa !36
  %278 = add nuw nsw i32 %258, 1
  %279 = sub nsw i32 %276, %247
  %280 = icmp sgt i32 %279, %278
  br i1 %280, label %254, label %.loopexit33, !llvm.loop !73

.loopexit:                                        ; preds = %.preheader, %245
  %281 = phi i32 [ %246, %245 ], [ %258, %.preheader ]
  %282 = icmp eq i32 %281, 0
  br i1 %282, label %292, label %.loopexit33

.loopexit33:                                      ; preds = %.loopexit, %275
  %283 = phi i32 [ %281, %.loopexit ], [ %278, %275 ]
  %284 = load i8*, i8** %240, align 8, !tbaa !33
  %285 = load i32 (i8*, i32, i32, i8*, i8*)*, i32 (i8*, i32, i32, i8*, i8*)** %241, align 8, !tbaa !20
  %286 = load i32, i32* %242, align 4, !tbaa !24
  %287 = add nsw i32 %286, %247
  %288 = load i8*, i8** %243, align 8, !tbaa !29
  %289 = tail call i32 @halide_do_loop_task(i8* %284, i32 (i8*, i32, i32, i8*, i8*)* %285, i32 %287, i32 %283, i8* %288, i8* nonnull %244) #13
  %290 = add nuw nsw i32 %283, %247
  %291 = icmp eq i32 %289, 0
  br i1 %291, label %245, label %292, !llvm.loop !74

292:                                              ; preds = %.loopexit33, %.loopexit
  %293 = phi i1 [ true, %.loopexit ], [ false, %.loopexit33 ]
  %294 = phi i32 [ 0, %.loopexit ], [ %289, %.loopexit33 ]
  %295 = phi i32 [ %247, %.loopexit ], [ %290, %.loopexit33 ]
  tail call void @halide_mutex_lock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #13
  %296 = load i32, i32* %242, align 4, !tbaa !24
  %297 = add nsw i32 %296, %295
  store i32 %297, i32* %242, align 4, !tbaa !24
  %298 = load i32, i32* %236, align 8, !tbaa !25
  %299 = sub nsw i32 %298, %295
  store i32 %299, i32* %236, align 8, !tbaa !25
  br i1 %293, label %301, label %300

300:                                              ; preds = %292
  store i32 0, i32* %236, align 8, !tbaa !25
  br label %334

301:                                              ; preds = %292
  %302 = icmp sgt i32 %299, 0
  br i1 %302, label %303, label %.loopexit38

303:                                              ; preds = %301
  %304 = load %"struct.Halide::Runtime::Internal::work"*, %"struct.Halide::Runtime::Internal::work"** getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 3), align 8, !tbaa !61
  store %"struct.Halide::Runtime::Internal::work"* %304, %"struct.Halide::Runtime::Internal::work"** %234, align 8, !tbaa !64
  store %"struct.Halide::Runtime::Internal::work"* %213, %"struct.Halide::Runtime::Internal::work"** getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 3), align 8, !tbaa !61
  br label %.loopexit38

305:                                              ; preds = %229
  %306 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %213, i64 0, i32 0, i32 0
  %307 = load i32 (i8*, i32, i32, i8*, i8*)*, i32 (i8*, i32, i32, i8*, i8*)** %306, align 8, !tbaa.struct !75
  %308 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %213, i64 0, i32 0, i32 1
  %309 = load i8*, i8** %308, align 8, !tbaa.struct !77
  %310 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %213, i64 0, i32 0, i32 5
  %311 = load i32, i32* %310, align 4
  %312 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %213, i64 0, i32 1
  %313 = load i32 (i8*, i32, i8*)*, i32 (i8*, i32, i8*)** %312, align 8, !tbaa.struct !78
  %314 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %213, i64 0, i32 7
  %315 = load i8*, i8** %314, align 8, !tbaa.struct !79
  %316 = add nsw i32 %311, 1
  store i32 %316, i32* %310, align 4, !tbaa !24
  %317 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %213, i64 0, i32 0, i32 6
  %318 = load i32, i32* %317, align 8, !tbaa !25
  %319 = add nsw i32 %318, -1
  store i32 %319, i32* %317, align 8, !tbaa !25
  %320 = icmp eq i32 %319, 0
  br i1 %320, label %321, label %324

321:                                              ; preds = %305
  %322 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %213, i64 0, i32 2
  %323 = load %"struct.Halide::Runtime::Internal::work"*, %"struct.Halide::Runtime::Internal::work"** %322, align 8, !tbaa !64
  store %"struct.Halide::Runtime::Internal::work"* %323, %"struct.Halide::Runtime::Internal::work"** %212, align 8, !tbaa !10
  br label %324

324:                                              ; preds = %321, %305
  tail call void @halide_mutex_unlock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #13
  %325 = icmp eq i32 (i8*, i32, i8*)* %313, null
  br i1 %325, label %328, label %326

326:                                              ; preds = %324
  %327 = tail call i32 @halide_do_task(i8* %315, i32 (i8*, i32, i8*)* nonnull %313, i32 %311, i8* %309) #13
  br label %331

328:                                              ; preds = %324
  %329 = bitcast %"struct.Halide::Runtime::Internal::work"* %213 to i8*
  %330 = tail call i32 @halide_do_loop_task(i8* %315, i32 (i8*, i32, i32, i8*, i8*)* %307, i32 %311, i32 1, i8* %309, i8* %329) #13
  br label %331

331:                                              ; preds = %328, %326
  %332 = phi i32 [ %327, %326 ], [ %330, %328 ]
  tail call void @halide_mutex_lock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #13
  %333 = icmp eq i32 %332, 0
  br i1 %333, label %.loopexit38, label %334

334:                                              ; preds = %331, %300
  %335 = phi i32 [ %294, %300 ], [ %332, %331 ]
  %336 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %213, i64 0, i32 9
  store i32 %335, i32* %336, align 4, !tbaa !34
  %337 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %213, i64 0, i32 4
  %338 = load i32, i32* %337, align 8, !tbaa !39
  %339 = icmp sgt i32 %338, 0
  br i1 %339, label %340, label %.loopexit38

340:                                              ; preds = %334
  %341 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %213, i64 0, i32 3
  %342 = load %"struct.Halide::Runtime::Internal::work"*, %"struct.Halide::Runtime::Internal::work"** %341, align 8, !tbaa !38
  %343 = zext i32 %338 to i64
  br label %344

344:                                              ; preds = %360, %340
  %345 = phi i64 [ 0, %340 ], [ %362, %360 ]
  %346 = phi i8 [ 0, %340 ], [ %361, %360 ]
  %347 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %342, i64 %345, i32 9
  %348 = load i32, i32* %347, align 4, !tbaa !34
  %349 = icmp eq i32 %348, 0
  br i1 %349, label %350, label %360

350:                                              ; preds = %344
  store i32 %335, i32* %347, align 4, !tbaa !34
  %351 = load i32, i32* %214, align 8, !tbaa !35
  %352 = icmp eq i32 %351, 0
  br i1 %352, label %353, label %356

353:                                              ; preds = %350
  %354 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %342, i64 %345, i32 11
  %355 = load i8, i8* %354, align 4, !tbaa !37, !range !17
  br label %356

356:                                              ; preds = %353, %350
  %357 = phi i8 [ 0, %350 ], [ %355, %353 ]
  %358 = and i8 %346, 1
  %359 = or i8 %357, %358
  br label %360

360:                                              ; preds = %356, %344
  %361 = phi i8 [ %359, %356 ], [ %346, %344 ]
  %362 = add nuw nsw i64 %345, 1
  %363 = icmp eq i64 %362, %343
  br i1 %363, label %.loopexit38, label %344, !llvm.loop !80

.loopexit38:                                      ; preds = %360, %334, %331, %303, %301
  %364 = phi i8 [ 0, %331 ], [ 0, %301 ], [ 0, %303 ], [ 0, %334 ], [ %361, %360 ]
  %365 = load %"struct.Halide::Runtime::Internal::work"*, %"struct.Halide::Runtime::Internal::work"** %217, align 8, !tbaa !40
  %366 = icmp eq %"struct.Halide::Runtime::Internal::work"* %365, null
  %367 = load i32, i32* %220, align 4, !tbaa !30
  br i1 %366, label %368, label %371

368:                                              ; preds = %.loopexit38
  %369 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 16), align 4, !tbaa !57
  %370 = sub nsw i32 %369, %367
  store i32 %370, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 16), align 4, !tbaa !57
  br label %375

371:                                              ; preds = %.loopexit38
  %372 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %365, i64 0, i32 6
  %373 = load i32, i32* %372, align 8, !tbaa !60
  %374 = sub nsw i32 %373, %367
  store i32 %374, i32* %372, align 8, !tbaa !60
  br label %375

375:                                              ; preds = %371, %368
  %376 = load i32, i32* %214, align 8, !tbaa !35
  %377 = add nsw i32 %376, -1
  store i32 %377, i32* %214, align 8, !tbaa !35
  %378 = and i8 %364, 1
  %379 = icmp eq i8 %378, 0
  br i1 %379, label %380, label %394

380:                                              ; preds = %375
  %381 = icmp eq i32 %377, 0
  br i1 %381, label %382, label %.backedge

382:                                              ; preds = %380
  %383 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %213, i64 0, i32 0, i32 6
  %384 = load i32, i32* %383, align 8, !tbaa !25
  %385 = icmp eq i32 %384, 0
  br i1 %385, label %390, label %386

386:                                              ; preds = %382
  %387 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %213, i64 0, i32 9
  %388 = load i32, i32* %387, align 4, !tbaa !34
  %389 = icmp eq i32 %388, 0
  br i1 %389, label %.backedge, label %390

390:                                              ; preds = %386, %382
  %391 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %213, i64 0, i32 11
  %392 = load i8, i8* %391, align 4, !tbaa !37, !range !17
  %393 = icmp eq i8 %392, 0
  br i1 %393, label %.backedge, label %394

394:                                              ; preds = %390, %375
  tail call void @halide_cond_broadcast(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 10)) #13
  br label %.backedge

.backedge:                                        ; preds = %394, %390, %386, %380, %207, %187, %186, %44, %.loopexit46
  %.be = phi i32 [ %11, %.loopexit46 ], [ %11, %44 ], [ %184, %186 ], [ %184, %187 ], [ %208, %207 ], [ 0, %394 ], [ 0, %390 ], [ 0, %386 ], [ 0, %380 ]
  br label %10, !llvm.loop !81

395:                                              ; preds = %18, %15
  ret void
}

; Function Attrs: nounwind
define weak void @halide_mutex_unlock(%struct.halide_mutex* %0) local_unnamed_addr #4 {
  %2 = alloca %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", align 8
  %3 = getelementptr %struct.halide_mutex, %struct.halide_mutex* %0, i64 0, i32 0, i64 0
  %4 = cmpxchg weak i64* %3, i64 1, i64 0 release monotonic
  %5 = extractvalue { i64, i1 } %4, 1
  br i1 %5, label %19, label %6

6:                                                ; preds = %1
  %7 = cmpxchg i64* %3, i64 1, i64 0 release monotonic
  %8 = extractvalue { i64, i1 } %7, 1
  br i1 %8, label %19, label %9

9:                                                ; preds = %6
  %10 = bitcast %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %10) #10
  %11 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %2, i64 0, i32 0, i32 0
  %12 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %2, i64 0, i32 0, i32 1
  store void (i8*)* @_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv, void (i8*)** %12, align 8, !tbaa !41
  %13 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %2, i64 0, i32 0, i32 2
  %14 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %2, i64 0, i32 0, i32 3
  store void (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*, i1, i1)* @_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb, void (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*, i1, i1)** %14, align 8, !tbaa !43
  %15 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %2, i64 0, i32 1
  store i64* %3, i64** %15, align 8, !tbaa !44
  store i1 (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)* @_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE, i1 (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)** %11, align 8, !tbaa !46
  store i64 (i8*, i32, i1)* @_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib, i64 (i8*, i32, i1)** %13, align 8, !tbaa !47
  %16 = ptrtoint %struct.halide_mutex* %0 to i64
  %17 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %2, i64 0, i32 0
  %18 = call i64 @_ZN6Halide7Runtime8Internal15Synchronization10unpark_oneEyRNS2_15parking_controlE(i64 %16, %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* nonnull align 8 dereferenceable(32) %17) #12
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %10) #10
  br label %19

19:                                               ; preds = %9, %6, %1
  ret void
}

; Function Attrs: nounwind willreturn mustprogress
define linkonce void @_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv(i8* %0) #2 {
  ret void
}

; Function Attrs: nounwind willreturn mustprogress
define linkonce void @_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb(i8* %0, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"* nonnull align 8 dereferenceable(16) %1, i1 zeroext %2, i1 zeroext %3) #2 {
  ret void
}

; Function Attrs: nounwind willreturn mustprogress
define linkonce zeroext i1 @_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE(i8* %0, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"* nonnull align 8 dereferenceable(16) %1) #2 {
  %3 = getelementptr inbounds i8, i8* %0, i64 32
  %4 = bitcast i8* %3 to i64**
  %5 = load i64*, i64** %4, align 8, !tbaa !44
  %6 = load atomic i64, i64* %5 monotonic, align 8
  %7 = icmp eq i64 %6, 3
  ret i1 %7
}

; Function Attrs: nounwind willreturn mustprogress
define linkonce i64 @_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib(i8* %0, i32 %1, i1 zeroext %2) #2 {
  %4 = select i1 %2, i64 2, i64 0
  %5 = getelementptr inbounds i8, i8* %0, i64 32
  %6 = bitcast i8* %5 to i64**
  %7 = load i64*, i64** %6, align 8, !tbaa !44
  store atomic i64 %4, i64* %7 release, align 8
  ret i64 0
}

; Function Attrs: nounwind mustprogress
define linkonce i64 @_ZN6Halide7Runtime8Internal15Synchronization10unpark_oneEyRNS2_15parking_controlE(i64 %0, %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* nonnull align 8 dereferenceable(32) %1) local_unnamed_addr #0 {
  %3 = tail call nonnull align 8 dereferenceable(24) %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* @_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy(i64 %0) #13
  %4 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %3, i64 0, i32 1
  %5 = load %"struct.Halide::Runtime::Internal::Synchronization::queue_data"*, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %4, align 8, !tbaa !10
  %6 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %3, i64 0, i32 2
  %7 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::parking_control", %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* %1, i64 0, i32 2
  %8 = bitcast %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* %1 to i8*
  %9 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %3, i64 0, i32 0, i32 0
  %10 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %3, i64 0, i32 0
  br label %11

11:                                               ; preds = %59, %2
  %12 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** [ %4, %2 ], [ %60, %59 ]
  %13 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ null, %2 ], [ %61, %59 ]
  %14 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ %5, %2 ], [ %62, %59 ]
  %15 = phi i64 [ undef, %2 ], [ %63, %59 ]
  %16 = icmp eq %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %14, null
  br i1 %16, label %64, label %17

17:                                               ; preds = %11
  %18 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %14, i64 0, i32 1
  %19 = load atomic i64, i64* %18 monotonic, align 8
  %20 = icmp eq i64 %19, %0
  %21 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %14, i64 0, i32 2
  %22 = load %"struct.Halide::Runtime::Internal::Synchronization::queue_data"*, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %21, align 8, !tbaa !82
  br i1 %20, label %23, label %59

23:                                               ; preds = %17
  store %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %22, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %12, align 8, !tbaa !10
  %24 = load %"struct.Halide::Runtime::Internal::Synchronization::queue_data"*, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %6, align 8, !tbaa !88
  %25 = icmp eq %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %24, %14
  br i1 %25, label %28, label %26

26:                                               ; preds = %23
  %27 = icmp eq %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %22, null
  br i1 %27, label %39, label %.preheader

28:                                               ; preds = %23
  store %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %13, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %6, align 8, !tbaa !88
  br label %39

.preheader:                                       ; preds = %.preheader, %26
  %29 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ %34, %.preheader ], [ %22, %26 ]
  %30 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %29, i64 0, i32 1
  %31 = load atomic i64, i64* %30 monotonic, align 8
  %32 = icmp eq i64 %31, %0
  %33 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %29, i64 0, i32 2
  %34 = load %"struct.Halide::Runtime::Internal::Synchronization::queue_data"*, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %33, align 8, !tbaa !82
  %35 = icmp eq %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %34, null
  %36 = or i1 %32, %35
  br i1 %36, label %37, label %.preheader, !llvm.loop !91

37:                                               ; preds = %.preheader
  %38 = zext i1 %32 to i8
  br label %39

39:                                               ; preds = %37, %28, %26
  %40 = phi i8 [ 0, %28 ], [ 0, %26 ], [ %38, %37 ]
  %41 = load i64 (i8*, i32, i1)*, i64 (i8*, i32, i1)** %7, align 8, !tbaa !47
  %42 = icmp ne i8 %40, 0
  %43 = tail call i64 %41(i8* nonnull %8, i32 1, i1 zeroext %42) #12
  %44 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %14, i64 0, i32 3
  store i64 %43, i64* %44, align 8, !tbaa !92
  %45 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %14, i64 0, i32 0, i32 0
  %46 = tail call i32 @pthread_mutex_lock(%struct.pthread_mutex_t* nonnull %45) #12
  %47 = atomicrmw and i64* %9, i64 -2 release
  %48 = and i64 %47, 2
  %49 = icmp ne i64 %48, 0
  %50 = icmp ult i64 %47, 4
  %51 = or i1 %50, %49
  br i1 %51, label %53, label %52

52:                                               ; preds = %39
  tail call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* nonnull dereferenceable(8) %10) #12
  br label %53

53:                                               ; preds = %52, %39
  %54 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %14, i64 0, i32 0, i32 2
  store i8 0, i8* %54, align 8, !tbaa !93
  %55 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %14, i64 0, i32 0, i32 1
  %56 = tail call i32 @pthread_cond_signal(%struct.pthread_mutex_t* nonnull %55) #12
  %57 = tail call i32 @pthread_mutex_unlock(%struct.pthread_mutex_t* nonnull %45) #12
  %58 = zext i8 %40 to i64
  br label %59

59:                                               ; preds = %53, %17
  %60 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** [ %12, %53 ], [ %21, %17 ]
  %61 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ %13, %53 ], [ %14, %17 ]
  %62 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ %14, %53 ], [ %22, %17 ]
  %63 = phi i64 [ %58, %53 ], [ %15, %17 ]
  br i1 %20, label %.loopexit, label %11, !llvm.loop !94

64:                                               ; preds = %11
  %65 = load i64 (i8*, i32, i1)*, i64 (i8*, i32, i1)** %7, align 8, !tbaa !47
  %66 = tail call i64 %65(i8* nonnull %8, i32 0, i1 zeroext false) #12
  %67 = atomicrmw and i64* %9, i64 -2 release
  %68 = and i64 %67, 2
  %69 = icmp ne i64 %68, 0
  %70 = icmp ult i64 %67, 4
  %71 = or i1 %70, %69
  br i1 %71, label %.loopexit, label %72

72:                                               ; preds = %64
  tail call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* nonnull dereferenceable(8) %10) #12
  br label %.loopexit

.loopexit:                                        ; preds = %72, %64, %59
  %73 = phi i64 [ 0, %64 ], [ 0, %72 ], [ %63, %59 ]
  ret i64 %73
}

; Function Attrs: nounwind mustprogress
define linkonce nonnull align 8 dereferenceable(24) %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* @_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy(i64 %0) local_unnamed_addr #0 {
  %2 = mul i64 %0, -7046029254386353131
  %3 = lshr i64 %2, 54
  %4 = getelementptr inbounds [1024 x %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"], [1024 x %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"]* bitcast ([24576 x i8]* @_ZN6Halide7Runtime8Internal15Synchronization13table_storageE to [1024 x %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"]*), i64 0, i64 %3
  %5 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %4, i64 0, i32 0, i32 0
  %6 = cmpxchg weak i64* %5, i64 0, i64 1 acquire monotonic
  %7 = extractvalue { i64, i1 } %6, 1
  br i1 %7, label %10, label %8

8:                                                ; preds = %1
  %9 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %4, i64 0, i32 0
  tail call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* nonnull dereferenceable(8) %9) #12
  br label %10

10:                                               ; preds = %8, %1
  ret %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %4
}

declare i32 @pthread_mutex_lock(%struct.pthread_mutex_t*) local_unnamed_addr #1

; Function Attrs: nounwind
define linkonce void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* nonnull dereferenceable(8) %0) local_unnamed_addr #4 align 2 {
  %2 = getelementptr inbounds %"class.Halide::Runtime::Internal::Synchronization::word_lock", %"class.Halide::Runtime::Internal::Synchronization::word_lock"* %0, i64 0, i32 0
  %3 = load atomic i64, i64* %2 monotonic, align 8
  br label %4

4:                                                ; preds = %10, %1
  %5 = phi i64 [ %3, %1 ], [ %14, %10 ]
  %6 = and i64 %5, 2
  %7 = icmp ne i64 %6, 0
  %8 = icmp ult i64 %5, 4
  %9 = or i1 %8, %7
  br i1 %9, label %.loopexit9, label %10

10:                                               ; preds = %4
  %11 = or i64 %5, 2
  %12 = cmpxchg weak i64* %2, i64 %5, i64 %11 acquire monotonic
  %13 = extractvalue { i64, i1 } %12, 1
  %14 = extractvalue { i64, i1 } %12, 0
  br i1 %13, label %.preheader8, label %4

.preheader8:                                      ; preds = %.loopexit5, %10
  %15 = phi { i64, i1 } [ %58, %.loopexit5 ], [ %12, %10 ]
  %16 = extractvalue { i64, i1 } %15, 0
  %17 = and i64 %16, -4
  %18 = inttoptr i64 %17 to %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"*
  %19 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data", %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %18, i64 0, i32 3
  %20 = load %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"*, %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"** %19, align 8, !tbaa !95
  %21 = icmp eq %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %20, null
  br i1 %21, label %.preheader6, label %.loopexit7

.preheader6:                                      ; preds = %27, %.preheader8
  %22 = phi %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* [ %24, %27 ], [ %18, %.preheader8 ]
  %23 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data", %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %22, i64 0, i32 1
  %24 = load %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"*, %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"** %23, align 8, !tbaa !97
  %25 = icmp eq %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %24, null
  br i1 %25, label %26, label %27

26:                                               ; preds = %.preheader6
  tail call void @halide_print(i8* null, i8* getelementptr inbounds ([94 x i8], [94 x i8]* @.str.5, i64 0, i64 0)) #12
  tail call void @abort() #12
  br label %27

27:                                               ; preds = %26, %.preheader6
  %28 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data", %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %24, i64 0, i32 2
  store %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %22, %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"** %28, align 8, !tbaa !98
  %29 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data", %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %24, i64 0, i32 3
  %30 = load %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"*, %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"** %29, align 8, !tbaa !95
  %31 = icmp eq %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %30, null
  br i1 %31, label %.preheader6, label %.loopexit7, !llvm.loop !99

.loopexit7:                                       ; preds = %27, %.preheader8
  %32 = phi %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* [ %20, %.preheader8 ], [ %30, %27 ]
  store %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %32, %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"** %19, align 8, !tbaa !95
  %33 = and i64 %16, 1
  %34 = icmp eq i64 %33, 0
  br i1 %34, label %39, label %35

35:                                               ; preds = %.loopexit7
  %36 = and i64 %16, -3
  %37 = cmpxchg weak i64* %2, i64 %16, i64 %36 acq_rel monotonic
  %38 = extractvalue { i64, i1 } %37, 1
  br i1 %38, label %.loopexit9, label %.loopexit5

39:                                               ; preds = %.loopexit7
  %40 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data", %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %32, i64 0, i32 2
  %41 = load %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"*, %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"** %40, align 8, !tbaa !98
  %42 = icmp eq %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %41, null
  br i1 %42, label %.preheader, label %50

.preheader:                                       ; preds = %47, %39
  %43 = phi i64 [ %48, %47 ], [ %16, %39 ]
  %44 = and i64 %43, 1
  %45 = cmpxchg weak i64* %2, i64 %43, i64 %44 acq_rel monotonic
  %46 = extractvalue { i64, i1 } %45, 1
  br i1 %46, label %.loopexit, label %47

47:                                               ; preds = %.preheader
  %48 = extractvalue { i64, i1 } %45, 0
  %49 = icmp ult i64 %48, 4
  br i1 %49, label %.preheader, label %.loopexit5, !llvm.loop !100

50:                                               ; preds = %39
  store %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %41, %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"** %19, align 8, !tbaa !95
  %51 = atomicrmw and i64* %2, i64 -3 release
  br label %.loopexit

.loopexit:                                        ; preds = %50, %.preheader
  %52 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data", %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %32, i64 0, i32 0, i32 0
  %53 = tail call i32 @pthread_mutex_lock(%struct.pthread_mutex_t* nonnull %52) #12
  %54 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data", %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %32, i64 0, i32 0, i32 2
  store i8 0, i8* %54, align 8, !tbaa !93
  %55 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data", %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %32, i64 0, i32 0, i32 1
  %56 = tail call i32 @pthread_cond_signal(%struct.pthread_mutex_t* nonnull %55) #12
  %57 = tail call i32 @pthread_mutex_unlock(%struct.pthread_mutex_t* nonnull %52) #12
  br label %.loopexit9

.loopexit5:                                       ; preds = %47, %35
  %58 = phi { i64, i1 } [ %37, %35 ], [ %45, %47 ]
  fence acquire
  br label %.preheader8

.loopexit9:                                       ; preds = %.loopexit, %35, %4
  ret void
}

declare i32 @pthread_cond_signal(%struct.pthread_mutex_t*) local_unnamed_addr #1

declare i32 @pthread_mutex_unlock(%struct.pthread_mutex_t*) local_unnamed_addr #1

; Function Attrs: nounwind
define linkonce void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* nonnull dereferenceable(8) %0) local_unnamed_addr #4 align 2 {
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
  %12 = bitcast %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"** %9 to <2 x %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"*>*
  br label %13

13:                                               ; preds = %.backedge, %1
  %14 = phi i64 [ %4, %1 ], [ %.be, %.backedge ]
  %15 = phi i32 [ 40, %1 ], [ %.be8, %.backedge ]
  %16 = and i64 %14, 1
  %17 = icmp eq i64 %16, 0
  br i1 %17, label %.preheader2, label %.loopexit3

.preheader2:                                      ; preds = %22, %13
  %18 = phi i64 [ %23, %22 ], [ %14, %13 ]
  %19 = or i64 %18, 1
  %20 = cmpxchg weak i64* %3, i64 %18, i64 %19 acquire monotonic
  %21 = extractvalue { i64, i1 } %20, 1
  br i1 %21, label %66, label %22

22:                                               ; preds = %.preheader2
  %23 = extractvalue { i64, i1 } %20, 0
  %24 = and i64 %23, 1
  %25 = icmp eq i64 %24, 0
  br i1 %25, label %.preheader2, label %.loopexit3.loopexit

.loopexit3.loopexit:                              ; preds = %22
  %26 = extractvalue { i64, i1 } %20, 0
  br label %.loopexit3

.loopexit3:                                       ; preds = %.loopexit3.loopexit, %13
  %27 = phi i64 [ %14, %13 ], [ %26, %.loopexit3.loopexit ]
  %28 = icmp ugt i64 %27, 3
  %29 = icmp sgt i32 %15, 0
  %30 = and i1 %29, %28
  br i1 %30, label %31, label %36

31:                                               ; preds = %.loopexit3
  %32 = icmp sgt i32 %15, 1
  br i1 %32, label %33, label %36

33:                                               ; preds = %31
  %34 = add nsw i32 %15, -1
  call void @halide_thread_yield() #12
  %35 = load atomic i64, i64* %3 monotonic, align 8
  br label %.backedge

36:                                               ; preds = %31, %.loopexit3
  %37 = phi i32 [ %15, %.loopexit3 ], [ 0, %31 ]
  call void @llvm.lifetime.start.p0i8(i64 160, i8* nonnull %5) #10
  store i8 0, i8* %6, align 8, !tbaa !93
  %38 = call i32 @pthread_mutex_init(%struct.pthread_mutex_t* nonnull %7, i8* null) #12
  %39 = call i32 @pthread_cond_init(%struct.pthread_mutex_t* nonnull %8, i8* null) #12
  store <2 x %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"*> zeroinitializer, <2 x %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"*>* %12, align 8, !tbaa !10
  store %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* null, %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"** %10, align 8, !tbaa !95
  store i8 1, i8* %6, align 8, !tbaa !93
  %40 = and i64 %27, -4
  %41 = icmp eq i64 %40, 0
  br i1 %41, label %42, label %43

42:                                               ; preds = %36
  store %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %2, %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"** %10, align 8, !tbaa !95
  br label %45

43:                                               ; preds = %36
  %44 = inttoptr i64 %40 to %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"*
  store %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %44, %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"** %9, align 8, !tbaa !97
  br label %45

45:                                               ; preds = %43, %42
  %46 = and i64 %27, 3
  %47 = or i64 %46, %11
  %48 = cmpxchg weak i64* %3, i64 %27, i64 %47 release monotonic
  %49 = extractvalue { i64, i1 } %48, 1
  br i1 %49, label %52, label %50

50:                                               ; preds = %45
  %51 = extractvalue { i64, i1 } %48, 0
  br label %61

52:                                               ; preds = %45
  %53 = call i32 @pthread_mutex_lock(%struct.pthread_mutex_t* nonnull %7) #12
  %54 = load i8, i8* %6, align 8, !tbaa !93, !range !17
  %55 = icmp eq i8 %54, 0
  br i1 %55, label %.loopexit, label %.preheader

.preheader:                                       ; preds = %.preheader, %52
  %56 = call i32 @pthread_cond_wait(%struct.pthread_mutex_t* nonnull %8, %struct.pthread_mutex_t* nonnull %7) #12
  %57 = load i8, i8* %6, align 8, !tbaa !93, !range !17
  %58 = icmp eq i8 %57, 0
  br i1 %58, label %.loopexit, label %.preheader, !llvm.loop !101

.loopexit:                                        ; preds = %.preheader, %52
  %59 = call i32 @pthread_mutex_unlock(%struct.pthread_mutex_t* nonnull %7) #12
  %60 = load atomic i64, i64* %3 monotonic, align 8
  br label %61

61:                                               ; preds = %.loopexit, %50
  %62 = phi i64 [ %60, %.loopexit ], [ %51, %50 ]
  %63 = phi i32 [ 40, %.loopexit ], [ %37, %50 ]
  %64 = call i32 @pthread_cond_destroy(%struct.pthread_mutex_t* nonnull %8) #12
  %65 = call i32 @pthread_mutex_destroy(%struct.pthread_mutex_t* nonnull %7) #12
  call void @llvm.lifetime.end.p0i8(i64 160, i8* nonnull %5) #10
  br label %.backedge

.backedge:                                        ; preds = %61, %33
  %.be = phi i64 [ %35, %33 ], [ %62, %61 ]
  %.be8 = phi i32 [ %34, %33 ], [ %63, %61 ]
  br label %13

66:                                               ; preds = %.preheader2
  ret void
}

declare i32 @pthread_mutex_init(%struct.pthread_mutex_t*, i8*) local_unnamed_addr #1

declare i32 @pthread_cond_init(%struct.pthread_mutex_t*, i8*) local_unnamed_addr #1

declare i32 @pthread_cond_wait(%struct.pthread_mutex_t*, %struct.pthread_mutex_t*) local_unnamed_addr #1

declare i32 @pthread_cond_destroy(%struct.pthread_mutex_t*) local_unnamed_addr #1

declare i32 @pthread_mutex_destroy(%struct.pthread_mutex_t*) local_unnamed_addr #1

; Function Attrs: nounwind
define weak void @halide_cond_broadcast(%struct.halide_mutex* %0) local_unnamed_addr #4 {
  %2 = alloca %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", align 8
  %3 = getelementptr %struct.halide_mutex, %struct.halide_mutex* %0, i64 0, i32 0, i64 0
  %4 = load atomic i64, i64* %3 monotonic, align 8
  %5 = icmp eq i64 %4, 0
  br i1 %5, label %18, label %6

6:                                                ; preds = %1
  %7 = bitcast %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 48, i8* nonnull %7) #10
  %8 = inttoptr i64 %4 to %"class.Halide::Runtime::Internal::Synchronization::word_lock"*
  %9 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %2, i64 0, i32 0, i32 0
  %10 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %2, i64 0, i32 0, i32 1
  store void (i8*)* @_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv, void (i8*)** %10, align 8, !tbaa !41
  %11 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %2, i64 0, i32 0, i32 2
  store i64 (i8*, i32, i1)* @_ZN6Halide7Runtime8Internal15Synchronization22parking_control_unparkEPvib, i64 (i8*, i32, i1)** %11, align 8, !tbaa !47
  %12 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %2, i64 0, i32 0, i32 3
  %13 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %2, i64 0, i32 1
  store i64* %3, i64** %13, align 8, !tbaa !102
  %14 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %2, i64 0, i32 2
  store %"class.Halide::Runtime::Internal::Synchronization::word_lock"* %8, %"class.Halide::Runtime::Internal::Synchronization::word_lock"** %14, align 8, !tbaa !104
  store i1 (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)* @_ZN6Halide7Runtime8Internal15Synchronization34broadcast_parking_control_validateEPvRNS2_15validate_actionE, i1 (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)** %9, align 8, !tbaa !46
  store void (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*, i1, i1)* @_ZN6Halide7Runtime8Internal15Synchronization42broadcast_parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb, void (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*, i1, i1)** %12, align 8, !tbaa !43
  %15 = ptrtoint %struct.halide_mutex* %0 to i64
  %16 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %2, i64 0, i32 0
  %17 = call i32 @_ZN6Halide7Runtime8Internal15Synchronization14unpark_requeueEyyRNS2_15parking_controlEy(i64 %15, i64 %4, %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* nonnull align 8 dereferenceable(32) %16, i64 0) #12
  call void @llvm.lifetime.end.p0i8(i64 48, i8* nonnull %7) #10
  br label %18

18:                                               ; preds = %6, %1
  ret void
}

; Function Attrs: nounwind mustprogress
define weak zeroext i1 @halide_default_semaphore_try_acquire(%struct.halide_semaphore_t* %0, i32 %1) #0 {
  %3 = icmp eq i32 %1, 0
  br i1 %3, label %.loopexit, label %4

4:                                                ; preds = %2
  %5 = bitcast %struct.halide_semaphore_t* %0 to i32*
  %6 = load atomic i32, i32* %5 acquire, align 4
  %7 = sub nsw i32 %6, %1
  %8 = icmp sgt i32 %7, -1
  br i1 %8, label %.preheader, label %.loopexit

.preheader:                                       ; preds = %13, %4
  %9 = phi i32 [ %15, %13 ], [ %7, %4 ]
  %10 = phi i32 [ %14, %13 ], [ %6, %4 ]
  %11 = cmpxchg weak i32* %5, i32 %10, i32 %9 acq_rel monotonic
  %12 = extractvalue { i32, i1 } %11, 1
  br i1 %12, label %.loopexit.loopexit, label %13

13:                                               ; preds = %.preheader
  %14 = extractvalue { i32, i1 } %11, 0
  %15 = sub nsw i32 %14, %1
  %16 = icmp sgt i32 %15, -1
  br i1 %16, label %.preheader, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %13, %.preheader
  %17 = extractvalue { i32, i1 } %11, 1
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %4, %2
  %18 = phi i1 [ true, %2 ], [ false, %4 ], [ %17, %.loopexit.loopexit ]
  ret i1 %18
}

; Function Attrs: nounwind
define weak void @halide_cond_wait(%struct.halide_mutex* %0, %struct.halide_mutex* %1) local_unnamed_addr #4 {
  %3 = alloca %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", align 8
  %4 = alloca %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", align 8
  %5 = bitcast %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 48, i8* nonnull %5) #10
  %6 = getelementptr %struct.halide_mutex, %struct.halide_mutex* %0, i64 0, i32 0, i64 0
  %7 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %4, i64 0, i32 0, i32 0
  %8 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %4, i64 0, i32 0, i32 1
  %9 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %4, i64 0, i32 0, i32 2
  %10 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %4, i64 0, i32 0, i32 3
  store void (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*, i1, i1)* @_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb, void (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*, i1, i1)** %10, align 8, !tbaa !43
  %11 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %4, i64 0, i32 1
  store i64* %6, i64** %11, align 8, !tbaa !105
  %12 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %4, i64 0, i32 2
  %13 = bitcast %"class.Halide::Runtime::Internal::Synchronization::word_lock"** %12 to %struct.halide_mutex**
  store %struct.halide_mutex* %1, %struct.halide_mutex** %13, align 8, !tbaa !107
  store i1 (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)* @_ZN6Halide7Runtime8Internal15Synchronization29wait_parking_control_validateEPvRNS2_15validate_actionE, i1 (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)** %7, align 8, !tbaa !46
  store void (i8*)* @_ZN6Halide7Runtime8Internal15Synchronization33wait_parking_control_before_sleepEPv, void (i8*)** %8, align 8, !tbaa !41
  store i64 (i8*, i32, i1)* @_ZN6Halide7Runtime8Internal15Synchronization27wait_parking_control_unparkEPvib, i64 (i8*, i32, i1)** %9, align 8, !tbaa !47
  %14 = ptrtoint %struct.halide_mutex* %0 to i64
  %15 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %4, i64 0, i32 0
  %16 = call i64 @_ZN6Halide7Runtime8Internal15Synchronization4parkEyRNS2_15parking_controlE(i64 %14, %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* nonnull align 8 dereferenceable(32) %15) #12
  %17 = ptrtoint %struct.halide_mutex* %1 to i64
  %18 = icmp eq i64 %16, %17
  %19 = getelementptr %struct.halide_mutex, %struct.halide_mutex* %1, i64 0, i32 0, i64 0
  br i1 %18, label %69, label %20

20:                                               ; preds = %2
  %21 = cmpxchg weak i64* %19, i64 0, i64 1 acquire monotonic
  %22 = extractvalue { i64, i1 } %21, 1
  br i1 %22, label %.loopexit, label %23

23:                                               ; preds = %20
  %24 = load atomic i64, i64* %19 monotonic, align 8
  %25 = bitcast %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %3 to i8*
  %26 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %3, i64 0, i32 0, i32 0
  %27 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %3, i64 0, i32 0, i32 1
  %28 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %3, i64 0, i32 0, i32 2
  %29 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %3, i64 0, i32 0, i32 3
  %30 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %3, i64 0, i32 1
  %31 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %3, i64 0, i32 0
  br label %32

32:                                               ; preds = %.backedge, %23
  %33 = phi i64 [ %24, %23 ], [ %.be, %.backedge ]
  %34 = phi i32 [ 40, %23 ], [ %.be7, %.backedge ]
  %35 = and i64 %33, 1
  %36 = icmp eq i64 %35, 0
  br i1 %36, label %.preheader, label %.loopexit2

.preheader:                                       ; preds = %41, %32
  %37 = phi i64 [ %42, %41 ], [ %33, %32 ]
  %38 = or i64 %37, 1
  %39 = cmpxchg weak i64* %19, i64 %37, i64 %38 acquire monotonic
  %40 = extractvalue { i64, i1 } %39, 1
  br i1 %40, label %.loopexit, label %41

41:                                               ; preds = %.preheader
  %42 = extractvalue { i64, i1 } %39, 0
  %43 = and i64 %42, 1
  %44 = icmp eq i64 %43, 0
  br i1 %44, label %.preheader, label %.loopexit2.loopexit

.loopexit2.loopexit:                              ; preds = %41
  %45 = extractvalue { i64, i1 } %39, 0
  br label %.loopexit2

.loopexit2:                                       ; preds = %.loopexit2.loopexit, %32
  %46 = phi i64 [ %33, %32 ], [ %45, %.loopexit2.loopexit ]
  %47 = icmp sgt i32 %34, 0
  br i1 %47, label %48, label %53

48:                                               ; preds = %.loopexit2
  %49 = icmp eq i32 %34, 1
  br i1 %49, label %53, label %50

50:                                               ; preds = %48
  %51 = add nsw i32 %34, -1
  call void @halide_thread_yield() #12
  %52 = load atomic i64, i64* %19 monotonic, align 8
  br label %.backedge

53:                                               ; preds = %48, %.loopexit2
  %54 = phi i32 [ 0, %48 ], [ %34, %.loopexit2 ]
  %55 = and i64 %46, 2
  %56 = icmp eq i64 %55, 0
  br i1 %56, label %57, label %63

57:                                               ; preds = %53
  %58 = or i64 %46, 2
  %59 = cmpxchg weak i64* %19, i64 %46, i64 %58 monotonic monotonic
  %60 = extractvalue { i64, i1 } %59, 1
  br i1 %60, label %63, label %61

61:                                               ; preds = %57
  %62 = extractvalue { i64, i1 } %59, 0
  br label %.backedge

63:                                               ; preds = %57, %53
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %25) #10
  store void (i8*)* @_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv, void (i8*)** %27, align 8, !tbaa !41
  store void (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*, i1, i1)* @_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb, void (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*, i1, i1)** %29, align 8, !tbaa !43
  store i64* %19, i64** %30, align 8, !tbaa !44
  store i1 (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)* @_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE, i1 (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)** %26, align 8, !tbaa !46
  store i64 (i8*, i32, i1)* @_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib, i64 (i8*, i32, i1)** %28, align 8, !tbaa !47
  %64 = call i64 @_ZN6Halide7Runtime8Internal15Synchronization4parkEyRNS2_15parking_controlE(i64 %17, %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* nonnull align 8 dereferenceable(32) %31) #12
  %65 = icmp eq i64 %64, %17
  br i1 %65, label %68, label %66

66:                                               ; preds = %63
  %67 = load atomic i64, i64* %19 monotonic, align 8
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %25) #10
  br label %.backedge

.backedge:                                        ; preds = %66, %61, %50
  %.be = phi i64 [ %62, %61 ], [ %67, %66 ], [ %52, %50 ]
  %.be7 = phi i32 [ %54, %61 ], [ 40, %66 ], [ %51, %50 ]
  br label %32

68:                                               ; preds = %63
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %25) #10
  br label %.loopexit

69:                                               ; preds = %2
  %70 = load atomic i64, i64* %19 monotonic, align 8
  %71 = and i64 %70, 1
  %72 = icmp eq i64 %71, 0
  br i1 %72, label %73, label %.loopexit

73:                                               ; preds = %69
  call void @halide_print(i8* null, i8* getelementptr inbounds ([89 x i8], [89 x i8]* @.str.6, i64 0, i64 0)) #12
  call void @abort() #12
  br label %.loopexit

.loopexit:                                        ; preds = %73, %69, %68, %.preheader, %20
  call void @llvm.lifetime.end.p0i8(i64 48, i8* nonnull %5) #10
  ret void
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_do_loop_task(i8* %0, i32 (i8*, i32, i32, i8*, i8*)* %1, i32 %2, i32 %3, i8* %4, i8* %5) local_unnamed_addr #0 {
  %7 = load i32 (i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*)*, i32 (i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*)** @_ZN6Halide7Runtime8Internal19custom_do_loop_taskE, align 8, !tbaa !10
  %8 = tail call i32 %7(i8* %0, i32 (i8*, i32, i32, i8*, i8*)* %1, i32 %2, i32 %3, i8* %4, i8* %5) #12
  ret i32 %8
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_do_task(i8* %0, i32 (i8*, i32, i8*)* %1, i32 %2, i8* %3) local_unnamed_addr #0 {
  %5 = load i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)*, i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)** @_ZN6Halide7Runtime8Internal14custom_do_taskE, align 8, !tbaa !10
  %6 = tail call i32 %5(i8* %0, i32 (i8*, i32, i8*)* %1, i32 %2, i8* %3) #12
  ret i32 %6
}

; Function Attrs: nounwind willreturn mustprogress
define linkonce zeroext i1 @_ZN6Halide7Runtime8Internal15Synchronization29wait_parking_control_validateEPvRNS2_15validate_actionE(i8* %0, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"* nonnull align 8 dereferenceable(16) %1) #2 {
  %3 = getelementptr inbounds i8, i8* %0, i64 32
  %4 = bitcast i8* %3 to i64**
  %5 = load i64*, i64** %4, align 8, !tbaa !105
  %6 = load atomic i64, i64* %5 monotonic, align 8
  %7 = icmp eq i64 %6, 0
  %8 = getelementptr inbounds i8, i8* %0, i64 40
  %9 = bitcast i8* %8 to %"class.Halide::Runtime::Internal::Synchronization::word_lock"**
  %10 = load %"class.Halide::Runtime::Internal::Synchronization::word_lock"*, %"class.Halide::Runtime::Internal::Synchronization::word_lock"** %9, align 8, !tbaa !107
  %11 = ptrtoint %"class.Halide::Runtime::Internal::Synchronization::word_lock"* %10 to i64
  br i1 %7, label %12, label %13

12:                                               ; preds = %2
  store atomic i64 %11, i64* %5 monotonic, align 8
  br label %17

13:                                               ; preds = %2
  %14 = icmp eq i64 %6, %11
  br i1 %14, label %17, label %15

15:                                               ; preds = %13
  %16 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::validate_action", %"struct.Halide::Runtime::Internal::Synchronization::validate_action"* %1, i64 0, i32 2
  store i64 %11, i64* %16, align 8, !tbaa !108
  br label %17

17:                                               ; preds = %15, %13, %12
  %18 = phi i1 [ false, %15 ], [ true, %13 ], [ true, %12 ]
  ret i1 %18
}

; Function Attrs: nounwind
define linkonce void @_ZN6Halide7Runtime8Internal15Synchronization33wait_parking_control_before_sleepEPv(i8* %0) #4 {
  %2 = alloca %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", align 8
  %3 = getelementptr inbounds i8, i8* %0, i64 40
  %4 = bitcast i8* %3 to %"class.Halide::Runtime::Internal::Synchronization::word_lock"**
  %5 = load %"class.Halide::Runtime::Internal::Synchronization::word_lock"*, %"class.Halide::Runtime::Internal::Synchronization::word_lock"** %4, align 8, !tbaa !107
  %6 = getelementptr inbounds %"class.Halide::Runtime::Internal::Synchronization::word_lock", %"class.Halide::Runtime::Internal::Synchronization::word_lock"* %5, i64 0, i32 0
  %7 = cmpxchg weak i64* %6, i64 1, i64 0 release monotonic
  %8 = extractvalue { i64, i1 } %7, 1
  br i1 %8, label %22, label %9

9:                                                ; preds = %1
  %10 = cmpxchg i64* %6, i64 1, i64 0 release monotonic
  %11 = extractvalue { i64, i1 } %10, 1
  br i1 %11, label %22, label %12

12:                                               ; preds = %9
  %13 = bitcast %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %13) #10
  %14 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %2, i64 0, i32 0, i32 0
  %15 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %2, i64 0, i32 0, i32 1
  store void (i8*)* @_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv, void (i8*)** %15, align 8, !tbaa !41
  %16 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %2, i64 0, i32 0, i32 2
  %17 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %2, i64 0, i32 0, i32 3
  store void (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*, i1, i1)* @_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb, void (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*, i1, i1)** %17, align 8, !tbaa !43
  %18 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %2, i64 0, i32 1
  store i64* %6, i64** %18, align 8, !tbaa !44
  store i1 (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)* @_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE, i1 (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)** %14, align 8, !tbaa !46
  store i64 (i8*, i32, i1)* @_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib, i64 (i8*, i32, i1)** %16, align 8, !tbaa !47
  %19 = ptrtoint %"class.Halide::Runtime::Internal::Synchronization::word_lock"* %5 to i64
  %20 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %2, i64 0, i32 0
  %21 = call i64 @_ZN6Halide7Runtime8Internal15Synchronization10unpark_oneEyRNS2_15parking_controlE(i64 %19, %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* nonnull align 8 dereferenceable(32) %20) #12
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %13) #10
  br label %22

22:                                               ; preds = %12, %9, %1
  ret void
}

; Function Attrs: nounwind willreturn mustprogress
define linkonce i64 @_ZN6Halide7Runtime8Internal15Synchronization27wait_parking_control_unparkEPvib(i8* %0, i32 %1, i1 zeroext %2) #2 {
  br i1 %2, label %8, label %4

4:                                                ; preds = %3
  %5 = getelementptr inbounds i8, i8* %0, i64 32
  %6 = bitcast i8* %5 to i64**
  %7 = load i64*, i64** %6, align 8, !tbaa !105
  store atomic i64 0, i64* %7 monotonic, align 8
  br label %8

8:                                                ; preds = %4, %3
  ret i64 0
}

; Function Attrs: nounwind
define linkonce i64 @_ZN6Halide7Runtime8Internal15Synchronization4parkEyRNS2_15parking_controlE(i64 %0, %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* nonnull align 8 dereferenceable(32) %1) local_unnamed_addr #4 {
  %3 = alloca %"struct.Halide::Runtime::Internal::Synchronization::queue_data", align 8
  %4 = alloca %"struct.Halide::Runtime::Internal::Synchronization::validate_action", align 8
  %5 = bitcast %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 160, i8* nonnull %5) #10
  %6 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %3, i64 0, i32 0, i32 2
  store i8 0, i8* %6, align 8, !tbaa !93
  %7 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %3, i64 0, i32 0, i32 0
  %8 = call i32 @pthread_mutex_init(%struct.pthread_mutex_t* nonnull %7, i8* null) #12
  %9 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %3, i64 0, i32 0, i32 1
  %10 = call i32 @pthread_cond_init(%struct.pthread_mutex_t* nonnull %9, i8* null) #12
  %11 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %3, i64 0, i32 1
  store i64 0, i64* %11, align 8, !tbaa !110
  %12 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %3, i64 0, i32 2
  store %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* null, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %12, align 8, !tbaa !82
  %13 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %3, i64 0, i32 3
  store i64 0, i64* %13, align 8, !tbaa !92
  %14 = call nonnull align 8 dereferenceable(24) %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* @_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy(i64 %0) #13
  %15 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::validate_action", %"struct.Halide::Runtime::Internal::Synchronization::validate_action"* %4, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %15) #10
  store i8 0, i8* %15, align 8, !tbaa !111
  %16 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::validate_action", %"struct.Halide::Runtime::Internal::Synchronization::validate_action"* %4, i64 0, i32 2
  store i64 0, i64* %16, align 8, !tbaa !108
  %17 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::parking_control", %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* %1, i64 0, i32 0
  %18 = load i1 (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)*, i1 (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)** %17, align 8, !tbaa !46
  %19 = bitcast %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* %1 to i8*
  %20 = call zeroext i1 %18(i8* nonnull %19, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"* nonnull align 8 dereferenceable(16) %4) #12
  br i1 %20, label %30, label %21

21:                                               ; preds = %2
  %22 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %14, i64 0, i32 0, i32 0
  %23 = atomicrmw and i64* %22, i64 -2 release
  %24 = and i64 %23, 2
  %25 = icmp ne i64 %24, 0
  %26 = icmp ult i64 %23, 4
  %27 = or i1 %26, %25
  br i1 %27, label %56, label %28

28:                                               ; preds = %21
  %29 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %14, i64 0, i32 0
  call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* nonnull dereferenceable(8) %29) #12
  br label %56

30:                                               ; preds = %2
  store %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* null, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %12, align 8, !tbaa !82
  store i64 %0, i64* %11, align 8, !tbaa !110
  store i8 1, i8* %6, align 8, !tbaa !93
  %31 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %14, i64 0, i32 1
  %32 = load %"struct.Halide::Runtime::Internal::Synchronization::queue_data"*, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %31, align 8, !tbaa !112
  %33 = icmp eq %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %32, null
  %34 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %14, i64 0, i32 2
  %35 = load %"struct.Halide::Runtime::Internal::Synchronization::queue_data"*, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %34, align 8
  %36 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %35, i64 0, i32 2
  %37 = select i1 %33, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %31, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %36
  store %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %3, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %37, align 8, !tbaa !10
  store %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %3, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %34, align 8, !tbaa !88
  %38 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %14, i64 0, i32 0, i32 0
  %39 = atomicrmw and i64* %38, i64 -2 release
  %40 = and i64 %39, 2
  %41 = icmp ne i64 %40, 0
  %42 = icmp ult i64 %39, 4
  %43 = or i1 %42, %41
  br i1 %43, label %46, label %44

44:                                               ; preds = %30
  %45 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %14, i64 0, i32 0
  call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* nonnull dereferenceable(8) %45) #12
  br label %46

46:                                               ; preds = %44, %30
  %47 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::parking_control", %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* %1, i64 0, i32 1
  %48 = load void (i8*)*, void (i8*)** %47, align 8, !tbaa !41
  call void %48(i8* nonnull %19) #12
  %49 = call i32 @pthread_mutex_lock(%struct.pthread_mutex_t* nonnull %7) #12
  %50 = load i8, i8* %6, align 8, !tbaa !93, !range !17
  %51 = icmp eq i8 %50, 0
  br i1 %51, label %.loopexit, label %.preheader

.preheader:                                       ; preds = %.preheader, %46
  %52 = call i32 @pthread_cond_wait(%struct.pthread_mutex_t* nonnull %9, %struct.pthread_mutex_t* nonnull %7) #12
  %53 = load i8, i8* %6, align 8, !tbaa !93, !range !17
  %54 = icmp eq i8 %53, 0
  br i1 %54, label %.loopexit, label %.preheader, !llvm.loop !101

.loopexit:                                        ; preds = %.preheader, %46
  %55 = call i32 @pthread_mutex_unlock(%struct.pthread_mutex_t* nonnull %7) #12
  br label %56

56:                                               ; preds = %.loopexit, %28, %21
  %57 = phi i64* [ %13, %.loopexit ], [ %16, %21 ], [ %16, %28 ]
  %58 = load i64, i64* %57, align 8, !tbaa !113
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %15) #10
  %59 = call i32 @pthread_cond_destroy(%struct.pthread_mutex_t* nonnull %9) #12
  %60 = call i32 @pthread_mutex_destroy(%struct.pthread_mutex_t* nonnull %7) #12
  call void @llvm.lifetime.end.p0i8(i64 160, i8* nonnull %5) #10
  ret i64 %58
}

; Function Attrs: nounwind willreturn mustprogress
define linkonce i64 @_ZN6Halide7Runtime8Internal15Synchronization22parking_control_unparkEPvib(i8* %0, i32 %1, i1 zeroext %2) #2 {
  ret i64 0
}

; Function Attrs: nounwind
define linkonce zeroext i1 @_ZN6Halide7Runtime8Internal15Synchronization34broadcast_parking_control_validateEPvRNS2_15validate_actionE(i8* %0, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"* nonnull align 8 dereferenceable(16) %1) #4 {
  %3 = getelementptr inbounds i8, i8* %0, i64 32
  %4 = bitcast i8* %3 to i64**
  %5 = load i64*, i64** %4, align 8, !tbaa !102
  %6 = load atomic i64, i64* %5 monotonic, align 8
  %7 = getelementptr inbounds i8, i8* %0, i64 40
  %8 = bitcast i8* %7 to %"class.Halide::Runtime::Internal::Synchronization::word_lock"**
  %9 = load %"class.Halide::Runtime::Internal::Synchronization::word_lock"*, %"class.Halide::Runtime::Internal::Synchronization::word_lock"** %8, align 8, !tbaa !104
  %10 = ptrtoint %"class.Halide::Runtime::Internal::Synchronization::word_lock"* %9 to i64
  %11 = icmp eq i64 %6, %10
  br i1 %11, label %12, label %28

12:                                               ; preds = %2
  store atomic i64 0, i64* %5 monotonic, align 8
  %13 = load %"class.Halide::Runtime::Internal::Synchronization::word_lock"*, %"class.Halide::Runtime::Internal::Synchronization::word_lock"** %8, align 8, !tbaa !104
  %14 = getelementptr inbounds %"class.Halide::Runtime::Internal::Synchronization::word_lock", %"class.Halide::Runtime::Internal::Synchronization::word_lock"* %13, i64 0, i32 0
  %15 = load atomic i64, i64* %14 monotonic, align 8
  %16 = and i64 %15, 1
  %17 = icmp eq i64 %16, 0
  br i1 %17, label %.loopexit, label %.preheader

.preheader:                                       ; preds = %22, %12
  %18 = phi i64 [ %23, %22 ], [ %15, %12 ]
  %19 = or i64 %18, 2
  %20 = cmpxchg weak i64* %14, i64 %18, i64 %19 monotonic monotonic
  %21 = extractvalue { i64, i1 } %20, 1
  br i1 %21, label %.loopexit, label %22

22:                                               ; preds = %.preheader
  %23 = extractvalue { i64, i1 } %20, 0
  %24 = and i64 %23, 1
  %25 = icmp eq i64 %24, 0
  br i1 %25, label %.loopexit, label %.preheader

.loopexit:                                        ; preds = %22, %.preheader, %12
  %26 = phi i8 [ 1, %12 ], [ 1, %22 ], [ 0, %.preheader ]
  %27 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::validate_action", %"struct.Halide::Runtime::Internal::Synchronization::validate_action"* %1, i64 0, i32 0
  store i8 %26, i8* %27, align 8, !tbaa !111
  br label %28

28:                                               ; preds = %.loopexit, %2
  ret i1 %11
}

; Function Attrs: nounwind willreturn mustprogress
define linkonce void @_ZN6Halide7Runtime8Internal15Synchronization42broadcast_parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb(i8* %0, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"* nonnull align 8 dereferenceable(16) %1, i1 zeroext %2, i1 zeroext %3) #2 {
  %5 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::validate_action", %"struct.Halide::Runtime::Internal::Synchronization::validate_action"* %1, i64 0, i32 0
  %6 = load i8, i8* %5, align 8, !tbaa !111, !range !17
  %7 = icmp ne i8 %6, 0
  %8 = and i1 %7, %3
  br i1 %8, label %9, label %15

9:                                                ; preds = %4
  %10 = getelementptr inbounds i8, i8* %0, i64 40
  %11 = bitcast i8* %10 to %"class.Halide::Runtime::Internal::Synchronization::word_lock"**
  %12 = load %"class.Halide::Runtime::Internal::Synchronization::word_lock"*, %"class.Halide::Runtime::Internal::Synchronization::word_lock"** %11, align 8, !tbaa !104
  %13 = getelementptr inbounds %"class.Halide::Runtime::Internal::Synchronization::word_lock", %"class.Halide::Runtime::Internal::Synchronization::word_lock"* %12, i64 0, i32 0
  %14 = atomicrmw or i64* %13, i64 2 monotonic
  br label %15

15:                                               ; preds = %9, %4
  ret void
}

; Function Attrs: nounwind
define linkonce i32 @_ZN6Halide7Runtime8Internal15Synchronization14unpark_requeueEyyRNS2_15parking_controlEy(i64 %0, i64 %1, %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* nonnull align 8 dereferenceable(32) %2, i64 %3) local_unnamed_addr #4 {
  %5 = alloca %"struct.Halide::Runtime::Internal::Synchronization::bucket_pair", align 8
  %6 = alloca %"struct.Halide::Runtime::Internal::Synchronization::validate_action", align 8
  %7 = bitcast %"struct.Halide::Runtime::Internal::Synchronization::bucket_pair"* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %7) #10
  call void @_ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEyy(%"struct.Halide::Runtime::Internal::Synchronization::bucket_pair"* nonnull sret(%"struct.Halide::Runtime::Internal::Synchronization::bucket_pair") align 8 %5, i64 %0, i64 %1) #13
  %8 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::validate_action", %"struct.Halide::Runtime::Internal::Synchronization::validate_action"* %6, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %8) #10
  store i8 0, i8* %8, align 8, !tbaa !111
  %9 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::validate_action", %"struct.Halide::Runtime::Internal::Synchronization::validate_action"* %6, i64 0, i32 2
  store i64 0, i64* %9, align 8, !tbaa !108
  %10 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::parking_control", %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* %2, i64 0, i32 0
  %11 = load i1 (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)*, i1 (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)** %10, align 8, !tbaa !46
  %12 = bitcast %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* %2 to i8*
  %13 = call zeroext i1 %11(i8* nonnull %12, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"* nonnull align 8 dereferenceable(16) %6) #12
  br i1 %13, label %15, label %14

14:                                               ; preds = %4
  call void @_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE(%"struct.Halide::Runtime::Internal::Synchronization::bucket_pair"* nonnull align 8 dereferenceable(16) %5) #13
  br label %93

15:                                               ; preds = %4
  %16 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::bucket_pair", %"struct.Halide::Runtime::Internal::Synchronization::bucket_pair"* %5, i64 0, i32 0
  %17 = load %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"*, %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"** %16, align 8, !tbaa !114
  %18 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %17, i64 0, i32 1
  %19 = load %"struct.Halide::Runtime::Internal::Synchronization::queue_data"*, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %18, align 8, !tbaa !10
  %20 = icmp eq %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %19, null
  br i1 %20, label %72, label %.preheader

.preheader:                                       ; preds = %49, %15
  %21 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ %54, %49 ], [ null, %15 ]
  %22 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ %53, %49 ], [ null, %15 ]
  %23 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ %52, %49 ], [ null, %15 ]
  %24 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ %30, %49 ], [ %19, %15 ]
  %25 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ %51, %49 ], [ null, %15 ]
  %26 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** [ %50, %49 ], [ %18, %15 ]
  %27 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %24, i64 0, i32 1
  %28 = load atomic i64, i64* %27 monotonic, align 8
  %29 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %24, i64 0, i32 2
  %30 = load %"struct.Halide::Runtime::Internal::Synchronization::queue_data"*, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %29, align 8, !tbaa !82
  %31 = icmp eq i64 %28, %0
  br i1 %31, label %32, label %49

32:                                               ; preds = %.preheader
  store %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %30, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %26, align 8, !tbaa !10
  %33 = load %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"*, %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"** %16, align 8, !tbaa !114
  %34 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %33, i64 0, i32 2
  %35 = load %"struct.Halide::Runtime::Internal::Synchronization::queue_data"*, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %34, align 8, !tbaa !88
  %36 = icmp eq %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %35, %24
  br i1 %36, label %37, label %38

37:                                               ; preds = %32
  store %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %25, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %34, align 8, !tbaa !88
  br label %38

38:                                               ; preds = %37, %32
  %39 = load i8, i8* %8, align 8, !tbaa !111, !range !17
  %40 = icmp ne i8 %39, 0
  %41 = icmp eq %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %21, null
  %42 = and i1 %41, %40
  br i1 %42, label %49, label %43

43:                                               ; preds = %38
  %44 = icmp eq %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %23, null
  br i1 %44, label %47, label %45

45:                                               ; preds = %43
  %46 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %22, i64 0, i32 2
  store %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %24, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %46, align 8, !tbaa !82
  br label %47

47:                                               ; preds = %45, %43
  %48 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ %23, %45 ], [ %24, %43 ]
  store atomic i64 %1, i64* %27 monotonic, align 8
  br label %49

49:                                               ; preds = %47, %38, %.preheader
  %50 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** [ %26, %38 ], [ %26, %47 ], [ %29, %.preheader ]
  %51 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ %25, %38 ], [ %25, %47 ], [ %24, %.preheader ]
  %52 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ %23, %38 ], [ %48, %47 ], [ %23, %.preheader ]
  %53 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ %22, %38 ], [ %24, %47 ], [ %22, %.preheader ]
  %54 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ %24, %38 ], [ %21, %47 ], [ %21, %.preheader ]
  %55 = icmp eq %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %30, null
  br i1 %55, label %56, label %.preheader, !llvm.loop !116

56:                                               ; preds = %49
  %57 = icmp eq %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %52, null
  br i1 %57, label %72, label %58

58:                                               ; preds = %56
  %59 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %53, i64 0, i32 2
  store %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* null, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %59, align 8, !tbaa !82
  %60 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::bucket_pair", %"struct.Halide::Runtime::Internal::Synchronization::bucket_pair"* %5, i64 0, i32 1
  %61 = load %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"*, %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"** %60, align 8, !tbaa !117
  %62 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %61, i64 0, i32 1
  %63 = load %"struct.Halide::Runtime::Internal::Synchronization::queue_data"*, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %62, align 8, !tbaa !112
  %64 = icmp eq %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %63, null
  br i1 %64, label %69, label %65

65:                                               ; preds = %58
  %66 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %61, i64 0, i32 2
  %67 = load %"struct.Halide::Runtime::Internal::Synchronization::queue_data"*, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %66, align 8, !tbaa !88
  %68 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %67, i64 0, i32 2
  br label %69

69:                                               ; preds = %65, %58
  %70 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** [ %68, %65 ], [ %62, %58 ]
  store %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %52, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %70, align 8, !tbaa !10
  %71 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %61, i64 0, i32 2
  store %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %53, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %71, align 8, !tbaa !88
  br label %72

72:                                               ; preds = %69, %56, %15
  %73 = phi i1 [ true, %69 ], [ false, %56 ], [ false, %15 ]
  %74 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ %54, %69 ], [ %54, %56 ], [ null, %15 ]
  %75 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::parking_control", %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* %2, i64 0, i32 3
  %76 = load void (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*, i1, i1)*, void (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*, i1, i1)** %75, align 8, !tbaa !43
  %77 = icmp ne %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %74, null
  call void %76(i8* nonnull %12, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"* nonnull align 8 dereferenceable(16) %6, i1 zeroext %77, i1 zeroext %73) #12
  br i1 %77, label %78, label %86

78:                                               ; preds = %72
  %79 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %74, i64 0, i32 3
  store i64 %3, i64* %79, align 8, !tbaa !92
  %80 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %74, i64 0, i32 0, i32 0
  %81 = call i32 @pthread_mutex_lock(%struct.pthread_mutex_t* nonnull %80) #12
  call void @_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE(%"struct.Halide::Runtime::Internal::Synchronization::bucket_pair"* nonnull align 8 dereferenceable(16) %5) #13
  %82 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %74, i64 0, i32 0, i32 2
  store i8 0, i8* %82, align 8, !tbaa !93
  %83 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %74, i64 0, i32 0, i32 1
  %84 = call i32 @pthread_cond_signal(%struct.pthread_mutex_t* nonnull %83) #12
  %85 = call i32 @pthread_mutex_unlock(%struct.pthread_mutex_t* nonnull %80) #12
  br label %87

86:                                               ; preds = %72
  call void @_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE(%"struct.Halide::Runtime::Internal::Synchronization::bucket_pair"* nonnull align 8 dereferenceable(16) %5) #13
  br label %87

87:                                               ; preds = %86, %78
  %88 = load i8, i8* %8, align 8
  %89 = and i8 %88, 1
  %90 = icmp ne i8 %89, 0
  %91 = and i1 %77, %90
  %92 = zext i1 %91 to i32
  br label %93

93:                                               ; preds = %87, %14
  %94 = phi i32 [ %92, %87 ], [ 0, %14 ]
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %8) #10
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %7) #10
  ret i32 %94
}

; Function Attrs: nounwind
define linkonce void @_ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEyy(%"struct.Halide::Runtime::Internal::Synchronization::bucket_pair"* noalias sret(%"struct.Halide::Runtime::Internal::Synchronization::bucket_pair") align 8 %0, i64 %1, i64 %2) local_unnamed_addr #4 {
  %4 = mul i64 %1, -7046029254386353131
  %5 = lshr i64 %4, 54
  %6 = mul i64 %2, -7046029254386353131
  %7 = lshr i64 %6, 54
  %8 = icmp eq i64 %5, %7
  br i1 %8, label %9, label %16

9:                                                ; preds = %3
  %10 = getelementptr inbounds [1024 x %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"], [1024 x %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"]* bitcast ([24576 x i8]* @_ZN6Halide7Runtime8Internal15Synchronization13table_storageE to [1024 x %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"]*), i64 0, i64 %5
  %11 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %10, i64 0, i32 0, i32 0
  %12 = cmpxchg weak i64* %11, i64 0, i64 1 acquire monotonic
  %13 = extractvalue { i64, i1 } %12, 1
  br i1 %13, label %46, label %14

14:                                               ; preds = %9
  %15 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %10, i64 0, i32 0
  tail call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* nonnull dereferenceable(8) %15) #12
  br label %46

16:                                               ; preds = %3
  %17 = icmp ult i64 %5, %7
  br i1 %17, label %18, label %32

18:                                               ; preds = %16
  %19 = getelementptr inbounds [1024 x %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"], [1024 x %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"]* bitcast ([24576 x i8]* @_ZN6Halide7Runtime8Internal15Synchronization13table_storageE to [1024 x %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"]*), i64 0, i64 %5
  %20 = getelementptr inbounds [1024 x %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"], [1024 x %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"]* bitcast ([24576 x i8]* @_ZN6Halide7Runtime8Internal15Synchronization13table_storageE to [1024 x %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"]*), i64 0, i64 %7
  %21 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %19, i64 0, i32 0, i32 0
  %22 = cmpxchg weak i64* %21, i64 0, i64 1 acquire monotonic
  %23 = extractvalue { i64, i1 } %22, 1
  br i1 %23, label %26, label %24

24:                                               ; preds = %18
  %25 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %19, i64 0, i32 0
  tail call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* nonnull dereferenceable(8) %25) #12
  br label %26

26:                                               ; preds = %24, %18
  %27 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %20, i64 0, i32 0, i32 0
  %28 = cmpxchg weak i64* %27, i64 0, i64 1 acquire monotonic
  %29 = extractvalue { i64, i1 } %28, 1
  br i1 %29, label %46, label %30

30:                                               ; preds = %26
  %31 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %20, i64 0, i32 0
  tail call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* nonnull dereferenceable(8) %31) #12
  br label %46

32:                                               ; preds = %16
  %33 = getelementptr inbounds [1024 x %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"], [1024 x %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"]* bitcast ([24576 x i8]* @_ZN6Halide7Runtime8Internal15Synchronization13table_storageE to [1024 x %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"]*), i64 0, i64 %7
  %34 = getelementptr inbounds [1024 x %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"], [1024 x %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"]* bitcast ([24576 x i8]* @_ZN6Halide7Runtime8Internal15Synchronization13table_storageE to [1024 x %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"]*), i64 0, i64 %5
  %35 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %33, i64 0, i32 0, i32 0
  %36 = cmpxchg weak i64* %35, i64 0, i64 1 acquire monotonic
  %37 = extractvalue { i64, i1 } %36, 1
  br i1 %37, label %40, label %38

38:                                               ; preds = %32
  %39 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %33, i64 0, i32 0
  tail call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* nonnull dereferenceable(8) %39) #12
  br label %40

40:                                               ; preds = %38, %32
  %41 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %34, i64 0, i32 0, i32 0
  %42 = cmpxchg weak i64* %41, i64 0, i64 1 acquire monotonic
  %43 = extractvalue { i64, i1 } %42, 1
  br i1 %43, label %46, label %44

44:                                               ; preds = %40
  %45 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %34, i64 0, i32 0
  tail call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* nonnull dereferenceable(8) %45) #12
  br label %46

46:                                               ; preds = %44, %40, %30, %26, %14, %9
  %47 = phi %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* [ %10, %9 ], [ %10, %14 ], [ %19, %26 ], [ %19, %30 ], [ %34, %40 ], [ %34, %44 ]
  %48 = phi %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* [ %10, %9 ], [ %10, %14 ], [ %20, %26 ], [ %20, %30 ], [ %33, %40 ], [ %33, %44 ]
  %49 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::bucket_pair", %"struct.Halide::Runtime::Internal::Synchronization::bucket_pair"* %0, i64 0, i32 0
  store %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %47, %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"** %49, align 8, !tbaa !10
  %50 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::bucket_pair", %"struct.Halide::Runtime::Internal::Synchronization::bucket_pair"* %0, i64 0, i32 1
  store %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %48, %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"** %50, align 8, !tbaa !10
  ret void
}

; Function Attrs: nounwind mustprogress
define linkonce void @_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE(%"struct.Halide::Runtime::Internal::Synchronization::bucket_pair"* nonnull align 8 dereferenceable(16) %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::bucket_pair", %"struct.Halide::Runtime::Internal::Synchronization::bucket_pair"* %0, i64 0, i32 0
  %3 = load %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"*, %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"** %2, align 8, !tbaa !114
  %4 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::bucket_pair", %"struct.Halide::Runtime::Internal::Synchronization::bucket_pair"* %0, i64 0, i32 1
  %5 = load %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"*, %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"** %4, align 8, !tbaa !117
  %6 = icmp eq %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %3, %5
  br i1 %6, label %7, label %16

7:                                                ; preds = %1
  %8 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %3, i64 0, i32 0, i32 0
  %9 = atomicrmw and i64* %8, i64 -2 release
  %10 = and i64 %9, 2
  %11 = icmp ne i64 %10, 0
  %12 = icmp ult i64 %9, 4
  %13 = or i1 %12, %11
  br i1 %13, label %56, label %14

14:                                               ; preds = %7
  %15 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %3, i64 0, i32 0
  tail call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* nonnull dereferenceable(8) %15) #12
  br label %56

16:                                               ; preds = %1
  %17 = icmp ugt %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %3, %5
  br i1 %17, label %18, label %37

18:                                               ; preds = %16
  %19 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %3, i64 0, i32 0, i32 0
  %20 = atomicrmw and i64* %19, i64 -2 release
  %21 = and i64 %20, 2
  %22 = icmp ne i64 %21, 0
  %23 = icmp ult i64 %20, 4
  %24 = or i1 %23, %22
  br i1 %24, label %27, label %25

25:                                               ; preds = %18
  %26 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %3, i64 0, i32 0
  tail call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* nonnull dereferenceable(8) %26) #12
  br label %27

27:                                               ; preds = %25, %18
  %28 = load %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"*, %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"** %4, align 8, !tbaa !117
  %29 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %28, i64 0, i32 0, i32 0
  %30 = atomicrmw and i64* %29, i64 -2 release
  %31 = and i64 %30, 2
  %32 = icmp ne i64 %31, 0
  %33 = icmp ult i64 %30, 4
  %34 = or i1 %33, %32
  br i1 %34, label %56, label %35

35:                                               ; preds = %27
  %36 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %28, i64 0, i32 0
  tail call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* nonnull dereferenceable(8) %36) #12
  br label %56

37:                                               ; preds = %16
  %38 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %5, i64 0, i32 0, i32 0
  %39 = atomicrmw and i64* %38, i64 -2 release
  %40 = and i64 %39, 2
  %41 = icmp ne i64 %40, 0
  %42 = icmp ult i64 %39, 4
  %43 = or i1 %42, %41
  br i1 %43, label %46, label %44

44:                                               ; preds = %37
  %45 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %5, i64 0, i32 0
  tail call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* nonnull dereferenceable(8) %45) #12
  br label %46

46:                                               ; preds = %44, %37
  %47 = load %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"*, %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"** %2, align 8, !tbaa !114
  %48 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %47, i64 0, i32 0, i32 0
  %49 = atomicrmw and i64* %48, i64 -2 release
  %50 = and i64 %49, 2
  %51 = icmp ne i64 %50, 0
  %52 = icmp ult i64 %49, 4
  %53 = or i1 %52, %51
  br i1 %53, label %56, label %54

54:                                               ; preds = %46
  %55 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %47, i64 0, i32 0
  tail call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* nonnull dereferenceable(8) %55) #12
  br label %56

56:                                               ; preds = %54, %46, %35, %27, %14, %7
  ret void
}

; Function Attrs: nounwind mustprogress
define linkonce i32 @_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv() local_unnamed_addr #0 {
  %1 = tail call i8* @getenv(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i64 0, i64 0)) #12
  %2 = icmp eq i8* %1, null
  br i1 %2, label %3, label %6

3:                                                ; preds = %0
  %4 = tail call i8* @getenv(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i64 0, i64 0)) #12
  %5 = icmp eq i8* %4, null
  br i1 %5, label %9, label %6

6:                                                ; preds = %3, %0
  %7 = phi i8* [ %4, %3 ], [ %1, %0 ]
  %8 = tail call i32 @atoi(i8* nonnull %7) #12
  br label %11

9:                                                ; preds = %3
  %10 = tail call i32 @halide_host_cpu_count() #12
  br label %11

11:                                               ; preds = %9, %6
  %12 = phi i32 [ %8, %6 ], [ %10, %9 ]
  ret i32 %12
}

; Function Attrs: nounwind willreturn mustprogress
define linkonce i32 @_ZN6Halide7Runtime8Internal17clamp_num_threadsEi(i32 %0) local_unnamed_addr #2 {
  %2 = icmp sgt i32 %0, 256
  br i1 %2, label %6, label %3

3:                                                ; preds = %1
  %4 = icmp sgt i32 %0, 1
  %5 = select i1 %4, i32 %0, i32 1
  ret i32 %5

6:                                                ; preds = %1
  ret i32 256
}

; Function Attrs: nounwind mustprogress
define linkonce void @_ZN6Halide7Runtime8Internal13worker_threadEPv(i8* %0) #0 {
  tail call void @halide_mutex_lock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #13
  %2 = bitcast i8* %0 to %"struct.Halide::Runtime::Internal::work"*
  tail call void @_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE(%"struct.Halide::Runtime::Internal::work"* %2) #13
  tail call void @halide_mutex_unlock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #13
  ret void
}

; Function Attrs: nounwind mustprogress
define weak %struct.halide_thread* @halide_spawn_thread(void (i8*)* %0, i8* %1) local_unnamed_addr #0 {
  %3 = tail call i8* @malloc(i64 24) #12
  %4 = bitcast i8* %3 to void (i8*)**
  store void (i8*)* %0, void (i8*)** %4, align 8, !tbaa !118
  %5 = getelementptr inbounds i8, i8* %3, i64 8
  %6 = bitcast i8* %5 to i8**
  store i8* %1, i8** %6, align 8, !tbaa !120
  %7 = getelementptr inbounds i8, i8* %3, i64 16
  %8 = bitcast i8* %7 to i64*
  store i64 0, i64* %8, align 8, !tbaa !121
  %9 = tail call i32 @pthread_create(i64* nonnull %8, i8* null, i8* (i8*)* nonnull @_ZN6Halide7Runtime8Internal19spawn_thread_helperEPv, i8* %3) #12
  %10 = bitcast i8* %3 to %struct.halide_thread*
  ret %struct.halide_thread* %10
}

; Function Attrs: nounwind mustprogress
define linkonce i8* @_ZN6Halide7Runtime8Internal19spawn_thread_helperEPv(i8* %0) #0 {
  %2 = bitcast i8* %0 to void (i8*)**
  %3 = load void (i8*)*, void (i8*)** %2, align 8, !tbaa !118
  %4 = getelementptr inbounds i8, i8* %0, i64 8
  %5 = bitcast i8* %4 to i8**
  %6 = load i8*, i8** %5, align 8, !tbaa !120
  tail call void %3(i8* %6) #12
  ret i8* null
}

declare i32 @pthread_create(i64*, i8*, i8* (i8*)*, i8*) local_unnamed_addr #1

declare i8* @getenv(i8*) local_unnamed_addr #1

declare i32 @atoi(i8*) local_unnamed_addr #1

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_do_parallel_tasks(i8* %0, i32 %1, %struct.halide_parallel_task_t* %2, i8* %3) #0 {
  %5 = sext i32 %1 to i64
  %6 = alloca %"struct.Halide::Runtime::Internal::work", i64 %5, align 8
  %7 = icmp sgt i32 %1, 0
  br i1 %7, label %.preheader, label %.loopexit3

.loopexit3:                                       ; preds = %31, %4
  %8 = phi i32 [ %1, %4 ], [ %33, %31 ]
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %53, label %37

.preheader:                                       ; preds = %31, %4
  %10 = phi i64 [ %34, %31 ], [ 0, %4 ]
  %11 = phi i32 [ %33, %31 ], [ %1, %4 ]
  %12 = phi %struct.halide_parallel_task_t* [ %32, %31 ], [ %2, %4 ]
  %13 = getelementptr inbounds %struct.halide_parallel_task_t, %struct.halide_parallel_task_t* %12, i64 0, i32 6
  %14 = load i32, i32* %13, align 8, !tbaa !122
  %15 = icmp slt i32 %14, 1
  br i1 %15, label %16, label %18

16:                                               ; preds = %.preheader
  %17 = add nsw i32 %11, -1
  br label %31

18:                                               ; preds = %.preheader
  %19 = getelementptr inbounds %struct.halide_parallel_task_t, %struct.halide_parallel_task_t* %12, i64 1
  %20 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %6, i64 %10
  %21 = bitcast %"struct.Halide::Runtime::Internal::work"* %20 to i8*
  %22 = bitcast %struct.halide_parallel_task_t* %12 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(56) %21, i8* nonnull align 8 dereferenceable(56) %22, i64 56, i1 false), !tbaa.struct !123
  %23 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %6, i64 %10, i32 1
  store i32 (i8*, i32, i8*)* null, i32 (i8*, i32, i8*)** %23, align 8, !tbaa !32
  %24 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %6, i64 %10, i32 7
  store i8* %0, i8** %24, align 8, !tbaa !33
  %25 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %6, i64 %10, i32 9
  store i32 0, i32* %25, align 4, !tbaa !34
  %26 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %6, i64 %10, i32 8
  store i32 0, i32* %26, align 8, !tbaa !35
  %27 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %6, i64 %10, i32 10
  store i32 0, i32* %27, align 8, !tbaa !36
  %28 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %6, i64 %10, i32 11
  store i8 0, i8* %28, align 4, !tbaa !37
  %29 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %6, i64 %10, i32 5
  %30 = bitcast %"struct.Halide::Runtime::Internal::work"** %29 to i8**
  store i8* %3, i8** %30, align 8, !tbaa !40
  br label %31

31:                                               ; preds = %18, %16
  %32 = phi %struct.halide_parallel_task_t* [ %12, %16 ], [ %19, %18 ]
  %33 = phi i32 [ %17, %16 ], [ %11, %18 ]
  %34 = add nuw nsw i64 %10, 1
  %35 = sext i32 %33 to i64
  %36 = icmp slt i64 %34, %35
  br i1 %36, label %.preheader, label %.loopexit3, !llvm.loop !124

37:                                               ; preds = %.loopexit3
  tail call void @halide_mutex_lock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #13
  %38 = bitcast i8* %3 to %"struct.Halide::Runtime::Internal::work"*
  call void @_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_(i32 %8, %"struct.Halide::Runtime::Internal::work"* nonnull %6, %"struct.Halide::Runtime::Internal::work"* %38) #13
  %39 = icmp sgt i32 %8, 0
  br i1 %39, label %40, label %.loopexit

40:                                               ; preds = %37
  %41 = zext i32 %8 to i64
  br label %43

.loopexit:                                        ; preds = %43, %37
  %42 = phi i32 [ 0, %37 ], [ %50, %43 ]
  call void @halide_mutex_unlock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #13
  br label %53

43:                                               ; preds = %43, %40
  %44 = phi i64 [ 0, %40 ], [ %51, %43 ]
  %45 = phi i32 [ 0, %40 ], [ %50, %43 ]
  %46 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %6, i64 %44
  call void @_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE(%"struct.Halide::Runtime::Internal::work"* nonnull %46) #13
  %47 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %6, i64 %44, i32 9
  %48 = load i32, i32* %47, align 4, !tbaa !34
  %49 = icmp eq i32 %48, 0
  %50 = select i1 %49, i32 %45, i32 %48
  %51 = add nuw nsw i64 %44, 1
  %52 = icmp eq i64 %51, %41
  br i1 %52, label %.loopexit, label %43, !llvm.loop !125

53:                                               ; preds = %.loopexit, %.loopexit3
  %54 = phi i32 [ %42, %.loopexit ], [ 0, %.loopexit3 ]
  ret i32 %54
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nounwind willreturn mustprogress
define weak i32 @halide_default_semaphore_init(%struct.halide_semaphore_t* %0, i32 %1) #2 {
  %3 = bitcast %struct.halide_semaphore_t* %0 to i32*
  store atomic i32 %1, i32* %3 release, align 4
  ret i32 %1
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_semaphore_release(%struct.halide_semaphore_t* %0, i32 %1) #0 {
  %3 = bitcast %struct.halide_semaphore_t* %0 to i32*
  %4 = atomicrmw add i32* %3, i32 %1 acq_rel
  %5 = icmp eq i32 %4, 0
  %6 = icmp ne i32 %1, 0
  %7 = and i1 %6, %5
  br i1 %7, label %8, label %9

8:                                                ; preds = %2
  tail call void @halide_mutex_lock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #13
  tail call void @halide_cond_broadcast(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 8)) #13
  tail call void @halide_cond_broadcast(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 10)) #13
  tail call void @halide_mutex_unlock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #13
  br label %9

9:                                                ; preds = %8, %2
  %10 = add nsw i32 %4, %1
  ret i32 %10
}

; Function Attrs: nounwind mustprogress
define weak void @halide_thread_pool_cleanup() #0 {
  tail call void @halide_shutdown_thread_pool() #13
  ret void
}

; Function Attrs: nounwind mustprogress
define weak void @halide_shutdown_thread_pool() local_unnamed_addr #0 {
  %1 = load i8, i8* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 15), align 1, !tbaa !48, !range !17
  %2 = icmp eq i8 %1, 0
  br i1 %2, label %14, label %3

3:                                                ; preds = %0
  tail call void @halide_mutex_lock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #13
  store i8 1, i8* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 14), align 8, !tbaa !66
  tail call void @halide_cond_broadcast(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 10)) #13
  tail call void @halide_cond_broadcast(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 8)) #13
  tail call void @halide_cond_broadcast(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 9)) #13
  tail call void @halide_mutex_unlock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #13
  %4 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 4), align 8, !tbaa !56
  %5 = icmp sgt i32 %4, 0
  br i1 %5, label %.preheader, label %.loopexit

.loopexit:                                        ; preds = %.preheader, %3
  %6 = tail call i8* @memset(i8* nonnull bitcast (i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 2) to i8*), i32 0, i64 2116) #12
  br label %14

.preheader:                                       ; preds = %.preheader, %3
  %7 = phi i64 [ %10, %.preheader ], [ 0, %3 ]
  %8 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 13, i64 %7
  %9 = load %struct.halide_thread*, %struct.halide_thread** %8, align 8, !tbaa !10
  tail call void @halide_join_thread(%struct.halide_thread* %9) #13
  %10 = add nuw nsw i64 %7, 1
  %11 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 4), align 8, !tbaa !56
  %12 = sext i32 %11 to i64
  %13 = icmp slt i64 %10, %12
  br i1 %13, label %.preheader, label %.loopexit, !llvm.loop !126

14:                                               ; preds = %.loopexit, %0
  ret void
}

declare i8* @memset(i8*, i32, i64) local_unnamed_addr #1

; Function Attrs: nounwind mustprogress
define weak void @halide_join_thread(%struct.halide_thread* %0) local_unnamed_addr #0 {
  %2 = alloca i8*, align 8
  %3 = bitcast %struct.halide_thread* %0 to %"struct.Halide::Runtime::Internal::spawned_thread"*
  %4 = bitcast i8** %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %4) #10
  store i8* null, i8** %2, align 8, !tbaa !10
  %5 = getelementptr inbounds %"struct.Halide::Runtime::Internal::spawned_thread", %"struct.Halide::Runtime::Internal::spawned_thread"* %3, i64 0, i32 2
  %6 = load i64, i64* %5, align 8, !tbaa !121
  %7 = call i32 @pthread_join(i64 %6, i8** nonnull %2) #12
  %8 = bitcast %struct.halide_thread* %0 to i8*
  call void @free(i8* %8) #12
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %4) #10
  ret void
}

declare i32 @pthread_join(i64, i8**) local_unnamed_addr #1

; Function Attrs: nounwind willreturn mustprogress
define linkonce zeroext i1 @_ZN6Halide7Runtime8Internal15Synchronization24parking_control_validateEPvRNS2_15validate_actionE(i8* %0, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"* nonnull align 8 dereferenceable(16) %1) #2 {
  ret i1 true
}

; Function Attrs: nounwind willreturn mustprogress
define linkonce i64 @_ZN6Halide7Runtime8Internal15Synchronization29signal_parking_control_unparkEPvib(i8* %0, i32 %1, i1 zeroext %2) #2 {
  br i1 %2, label %8, label %4

4:                                                ; preds = %3
  %5 = getelementptr inbounds i8, i8* %0, i64 32
  %6 = bitcast i8* %5 to i64**
  %7 = load i64*, i64** %6, align 8, !tbaa !127
  store atomic i64 0, i64* %7 monotonic, align 8
  br label %8

8:                                                ; preds = %4, %3
  ret i64 0
}

; Function Attrs: nounwind
define weak void @halide_cond_signal(%struct.halide_mutex* %0) local_unnamed_addr #4 {
  %2 = alloca %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", align 8
  %3 = getelementptr %struct.halide_mutex, %struct.halide_mutex* %0, i64 0, i32 0, i64 0
  %4 = load atomic i64, i64* %3 monotonic, align 8
  %5 = icmp eq i64 %4, 0
  br i1 %5, label %18, label %6

6:                                                ; preds = %1
  %7 = bitcast %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 48, i8* nonnull %7) #10
  %8 = inttoptr i64 %4 to %"class.Halide::Runtime::Internal::Synchronization::word_lock"*
  %9 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %2, i64 0, i32 0, i32 0
  store i1 (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)* @_ZN6Halide7Runtime8Internal15Synchronization24parking_control_validateEPvRNS2_15validate_actionE, i1 (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)** %9, align 8, !tbaa !46
  %10 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %2, i64 0, i32 0, i32 1
  store void (i8*)* @_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv, void (i8*)** %10, align 8, !tbaa !41
  %11 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %2, i64 0, i32 0, i32 2
  %12 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %2, i64 0, i32 0, i32 3
  store void (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*, i1, i1)* @_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb, void (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*, i1, i1)** %12, align 8, !tbaa !43
  %13 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %2, i64 0, i32 1
  store i64* %3, i64** %13, align 8, !tbaa !127
  %14 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %2, i64 0, i32 2
  store %"class.Halide::Runtime::Internal::Synchronization::word_lock"* %8, %"class.Halide::Runtime::Internal::Synchronization::word_lock"** %14, align 8, !tbaa !129
  store i64 (i8*, i32, i1)* @_ZN6Halide7Runtime8Internal15Synchronization29signal_parking_control_unparkEPvib, i64 (i8*, i32, i1)** %11, align 8, !tbaa !47
  %15 = ptrtoint %struct.halide_mutex* %0 to i64
  %16 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %2, i64 0, i32 0
  %17 = call i64 @_ZN6Halide7Runtime8Internal15Synchronization10unpark_oneEyRNS2_15parking_controlE(i64 %15, %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* nonnull align 8 dereferenceable(32) %16) #12
  call void @llvm.lifetime.end.p0i8(i64 48, i8* nonnull %7) #10
  br label %18

18:                                               ; preds = %6, %1
  ret void
}

; Function Attrs: nounwind mustprogress
define weak %struct.halide_mutex_array* @halide_mutex_array_create(i32 %0) local_unnamed_addr #0 {
  %2 = tail call i8* @halide_malloc(i8* null, i64 8) #12
  %3 = bitcast i8* %2 to %struct.halide_mutex_array*
  %4 = icmp eq i8* %2, null
  br i1 %4, label %14, label %5

5:                                                ; preds = %1
  %6 = sext i32 %0 to i64
  %7 = shl nsw i64 %6, 3
  %8 = tail call i8* @halide_malloc(i8* null, i64 %7) #12
  %9 = bitcast i8* %2 to i8**
  store i8* %8, i8** %9, align 8, !tbaa !130
  %10 = icmp eq i8* %8, null
  br i1 %10, label %11, label %12

11:                                               ; preds = %5
  tail call void @halide_free(i8* null, i8* nonnull %2) #12
  br label %14

12:                                               ; preds = %5
  %13 = tail call i8* @memset(i8* nonnull %8, i32 0, i64 %7) #12
  br label %14

14:                                               ; preds = %12, %11, %1
  %15 = phi %struct.halide_mutex_array* [ null, %11 ], [ %3, %12 ], [ null, %1 ]
  ret %struct.halide_mutex_array* %15
}

; Function Attrs: nounwind mustprogress
define weak void @halide_mutex_array_destroy(i8* %0, i8* %1) local_unnamed_addr #0 {
  %3 = bitcast i8* %1 to i8**
  %4 = load i8*, i8** %3, align 8, !tbaa !130
  tail call void @halide_free(i8* %0, i8* %4) #12
  tail call void @halide_free(i8* %0, i8* %1) #12
  ret void
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_mutex_array_lock(%struct.halide_mutex_array* %0, i32 %1) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.halide_mutex_array, %struct.halide_mutex_array* %0, i64 0, i32 0
  %4 = load %struct.halide_mutex*, %struct.halide_mutex** %3, align 8, !tbaa !130
  %5 = sext i32 %1 to i64
  %6 = getelementptr inbounds %struct.halide_mutex, %struct.halide_mutex* %4, i64 %5
  tail call void @halide_mutex_lock(%struct.halide_mutex* %6) #13
  ret i32 0
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_mutex_array_unlock(%struct.halide_mutex_array* %0, i32 %1) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.halide_mutex_array, %struct.halide_mutex_array* %0, i64 0, i32 0
  %4 = load %struct.halide_mutex*, %struct.halide_mutex** %3, align 8, !tbaa !130
  %5 = sext i32 %1 to i64
  %6 = getelementptr inbounds %struct.halide_mutex, %struct.halide_mutex* %4, i64 %5
  tail call void @halide_mutex_unlock(%struct.halide_mutex* %6) #13
  ret i32 0
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_set_num_threads(i32 %0) local_unnamed_addr #0 {
  %2 = icmp slt i32 %0, 0
  br i1 %2, label %3, label %4

3:                                                ; preds = %1
  tail call void @halide_error(i8* null, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.4, i64 0, i64 0)) #12
  tail call void @halide_mutex_lock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #13
  br label %8

4:                                                ; preds = %1
  tail call void @halide_mutex_lock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #13
  %5 = icmp eq i32 %0, 0
  br i1 %5, label %6, label %8

6:                                                ; preds = %4
  %7 = tail call i32 @_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv() #13
  br label %8

8:                                                ; preds = %6, %4, %3
  %9 = phi i32 [ %7, %6 ], [ %0, %4 ], [ %0, %3 ]
  %10 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 1), align 8, !tbaa !54
  %11 = tail call i32 @_ZN6Halide7Runtime8Internal17clamp_num_threadsEi(i32 %9) #13
  store i32 %11, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 1), align 8, !tbaa !54
  tail call void @halide_mutex_unlock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #13
  ret i32 %10
}

; Function Attrs: nounwind willreturn mustprogress
define weak i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)* @halide_set_custom_do_task(i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)* %0) local_unnamed_addr #2 {
  %2 = load i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)*, i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)** @_ZN6Halide7Runtime8Internal14custom_do_taskE, align 8, !tbaa !10
  store i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)* %0, i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)** @_ZN6Halide7Runtime8Internal14custom_do_taskE, align 8, !tbaa !10
  ret i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)* %2
}

; Function Attrs: nounwind willreturn mustprogress
define weak i32 (i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*)* @halide_set_custom_do_loop_task(i32 (i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*)* %0) local_unnamed_addr #2 {
  %2 = load i32 (i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*)*, i32 (i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*)** @_ZN6Halide7Runtime8Internal19custom_do_loop_taskE, align 8, !tbaa !10
  store i32 (i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*)* %0, i32 (i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*)** @_ZN6Halide7Runtime8Internal19custom_do_loop_taskE, align 8, !tbaa !10
  ret i32 (i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*)* %2
}

; Function Attrs: nounwind willreturn mustprogress
define weak i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)* @halide_set_custom_do_par_for(i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)* %0) local_unnamed_addr #2 {
  %2 = load i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)*, i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)** @_ZN6Halide7Runtime8Internal17custom_do_par_forE, align 8, !tbaa !10
  store i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)* %0, i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)** @_ZN6Halide7Runtime8Internal17custom_do_par_forE, align 8, !tbaa !10
  ret i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)* %2
}

; Function Attrs: nounwind willreturn mustprogress
define weak void @halide_set_custom_parallel_runtime(i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)* %0, i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)* %1, i32 (i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*)* %2, i32 (i8*, i32, %struct.halide_parallel_task_t*, i8*)* %3, i32 (%struct.halide_semaphore_t*, i32)* %4, i1 (%struct.halide_semaphore_t*, i32)* %5, i32 (%struct.halide_semaphore_t*, i32)* %6) local_unnamed_addr #2 {
  store i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)* %0, i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)** @_ZN6Halide7Runtime8Internal17custom_do_par_forE, align 8, !tbaa !10
  store i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)* %1, i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)** @_ZN6Halide7Runtime8Internal14custom_do_taskE, align 8, !tbaa !10
  store i32 (i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*)* %2, i32 (i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*)** @_ZN6Halide7Runtime8Internal19custom_do_loop_taskE, align 8, !tbaa !10
  store i32 (i8*, i32, %struct.halide_parallel_task_t*, i8*)* %3, i32 (i8*, i32, %struct.halide_parallel_task_t*, i8*)** @_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE, align 8, !tbaa !10
  store i32 (%struct.halide_semaphore_t*, i32)* %4, i32 (%struct.halide_semaphore_t*, i32)** @_ZN6Halide7Runtime8Internal21custom_semaphore_initE, align 8, !tbaa !10
  store i1 (%struct.halide_semaphore_t*, i32)* %5, i1 (%struct.halide_semaphore_t*, i32)** @_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE, align 8, !tbaa !10
  store i32 (%struct.halide_semaphore_t*, i32)* %6, i32 (%struct.halide_semaphore_t*, i32)** @_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE, align 8, !tbaa !10
  ret void
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_do_par_for(i8* %0, i32 (i8*, i32, i8*)* %1, i32 %2, i32 %3, i8* noalias %4) local_unnamed_addr #0 {
  %6 = load i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)*, i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)** @_ZN6Halide7Runtime8Internal17custom_do_par_forE, align 8, !tbaa !10
  %7 = tail call i32 %6(i8* %0, i32 (i8*, i32, i8*)* %1, i32 %2, i32 %3, i8* %4) #12
  ret i32 %7
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_do_parallel_tasks(i8* %0, i32 %1, %struct.halide_parallel_task_t* %2, i8* %3) local_unnamed_addr #0 {
  %5 = load i32 (i8*, i32, %struct.halide_parallel_task_t*, i8*)*, i32 (i8*, i32, %struct.halide_parallel_task_t*, i8*)** @_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE, align 8, !tbaa !10
  %6 = tail call i32 %5(i8* %0, i32 %1, %struct.halide_parallel_task_t* %2, i8* %3) #12
  ret i32 %6
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_semaphore_init(%struct.halide_semaphore_t* %0, i32 %1) local_unnamed_addr #0 {
  %3 = load i32 (%struct.halide_semaphore_t*, i32)*, i32 (%struct.halide_semaphore_t*, i32)** @_ZN6Halide7Runtime8Internal21custom_semaphore_initE, align 8, !tbaa !10
  %4 = tail call i32 %3(%struct.halide_semaphore_t* %0, i32 %1) #12
  ret i32 %4
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_semaphore_release(%struct.halide_semaphore_t* %0, i32 %1) local_unnamed_addr #0 {
  %3 = load i32 (%struct.halide_semaphore_t*, i32)*, i32 (%struct.halide_semaphore_t*, i32)** @_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE, align 8, !tbaa !10
  %4 = tail call i32 %3(%struct.halide_semaphore_t* %0, i32 %1) #12
  ret i32 %4
}

; Function Attrs: nounwind mustprogress
define weak zeroext i1 @halide_semaphore_try_acquire(%struct.halide_semaphore_t* %0, i32 %1) local_unnamed_addr #0 {
  %3 = load i1 (%struct.halide_semaphore_t*, i32)*, i1 (%struct.halide_semaphore_t*, i32)** @_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE, align 8, !tbaa !10
  %4 = tail call zeroext i1 %3(%struct.halide_semaphore_t* %0, i32 %1) #12
  ret i1 %4
}

; Function Attrs: nounwind mustprogress
define weak i8* @halide_default_get_symbol(i8* %0) #0 {
  %2 = tail call i8* @dlsym(i8* null, i8* %0) #12
  ret i8* %2
}

declare i8* @dlsym(i8*, i8*) local_unnamed_addr #1

; Function Attrs: nounwind mustprogress
define weak i8* @halide_default_load_library(i8* %0) #0 {
  %2 = tail call i8* @dlopen(i8* %0, i32 1) #12
  %3 = icmp eq i8* %2, null
  br i1 %3, label %4, label %6

4:                                                ; preds = %1
  %5 = tail call i8* @dlerror() #12
  br label %6

6:                                                ; preds = %4, %1
  ret i8* %2
}

declare i8* @dlopen(i8*, i32) local_unnamed_addr #1

declare i8* @dlerror() local_unnamed_addr #1

; Function Attrs: nounwind mustprogress
define weak i8* @halide_default_get_library_symbol(i8* %0, i8* %1) #0 {
  %3 = tail call i8* @dlsym(i8* %0, i8* %1) #12
  ret i8* %3
}

; Function Attrs: nounwind willreturn mustprogress
define weak i8* (i8*)* @halide_set_custom_get_symbol(i8* (i8*)* %0) local_unnamed_addr #2 {
  %2 = load i8* (i8*)*, i8* (i8*)** @_ZN6Halide7Runtime8Internal17custom_get_symbolE, align 8, !tbaa !10
  store i8* (i8*)* %0, i8* (i8*)** @_ZN6Halide7Runtime8Internal17custom_get_symbolE, align 8, !tbaa !10
  ret i8* (i8*)* %2
}

; Function Attrs: nounwind willreturn mustprogress
define weak i8* (i8*)* @halide_set_custom_load_library(i8* (i8*)* %0) local_unnamed_addr #2 {
  %2 = load i8* (i8*)*, i8* (i8*)** @_ZN6Halide7Runtime8Internal19custom_load_libraryE, align 8, !tbaa !10
  store i8* (i8*)* %0, i8* (i8*)** @_ZN6Halide7Runtime8Internal19custom_load_libraryE, align 8, !tbaa !10
  ret i8* (i8*)* %2
}

; Function Attrs: nounwind willreturn mustprogress
define weak i8* (i8*, i8*)* @halide_set_custom_get_library_symbol(i8* (i8*, i8*)* %0) local_unnamed_addr #2 {
  %2 = load i8* (i8*, i8*)*, i8* (i8*, i8*)** @_ZN6Halide7Runtime8Internal25custom_get_library_symbolE, align 8, !tbaa !10
  store i8* (i8*, i8*)* %0, i8* (i8*, i8*)** @_ZN6Halide7Runtime8Internal25custom_get_library_symbolE, align 8, !tbaa !10
  ret i8* (i8*, i8*)* %2
}

; Function Attrs: nounwind mustprogress
define weak i8* @halide_get_symbol(i8* %0) local_unnamed_addr #0 {
  %2 = load i8* (i8*)*, i8* (i8*)** @_ZN6Halide7Runtime8Internal17custom_get_symbolE, align 8, !tbaa !10
  %3 = tail call i8* %2(i8* %0) #12
  ret i8* %3
}

; Function Attrs: nounwind mustprogress
define weak i8* @halide_load_library(i8* %0) local_unnamed_addr #0 {
  %2 = load i8* (i8*)*, i8* (i8*)** @_ZN6Halide7Runtime8Internal19custom_load_libraryE, align 8, !tbaa !10
  %3 = tail call i8* %2(i8* %0) #12
  ret i8* %3
}

; Function Attrs: nounwind mustprogress
define weak i8* @halide_get_library_symbol(i8* %0, i8* %1) local_unnamed_addr #0 {
  %3 = load i8* (i8*, i8*)*, i8* (i8*, i8*)** @_ZN6Halide7Runtime8Internal25custom_get_library_symbolE, align 8, !tbaa !10
  %4 = tail call i8* %3(i8* %0, i8* %1) #12
  ret i8* %4
}

declare i8* @memcpy(i8*, i8*, i64) local_unnamed_addr #1

; Function Attrs: nounwind willreturn mustprogress
define weak void @halide_set_gpu_device(i32 %0) local_unnamed_addr #2 {
  store i32 %0, i32* @_ZN6Halide7Runtime8Internal17halide_gpu_deviceE, align 4, !tbaa !76
  store i8 1, i8* @_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE, align 1, !tbaa !15
  ret void
}

; Function Attrs: nounwind
define weak i32 @halide_get_gpu_device(i8* %0) local_unnamed_addr #4 {
  br label %2

2:                                                ; preds = %2, %1
  %3 = atomicrmw volatile xchg i8* @_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE, i8 1 acquire
  %4 = icmp eq i8 %3, 0
  br i1 %4, label %5, label %2, !llvm.loop !132

5:                                                ; preds = %2
  %6 = load i8, i8* @_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE, align 1, !tbaa !15, !range !17
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %10, label %8

8:                                                ; preds = %5
  %9 = load i32, i32* @_ZN6Halide7Runtime8Internal17halide_gpu_deviceE, align 4, !tbaa !76
  br label %17

10:                                               ; preds = %5
  %11 = tail call i8* @getenv(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.8, i64 0, i64 0)) #12
  %12 = icmp eq i8* %11, null
  br i1 %12, label %15, label %13

13:                                               ; preds = %10
  %14 = tail call i32 @atoi(i8* nonnull %11) #12
  br label %15

15:                                               ; preds = %13, %10
  %16 = phi i32 [ %14, %13 ], [ -1, %10 ]
  store i32 %16, i32* @_ZN6Halide7Runtime8Internal17halide_gpu_deviceE, align 4, !tbaa !76
  store i8 1, i8* @_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE, align 1, !tbaa !15
  br label %17

17:                                               ; preds = %15, %8
  %18 = phi i32 [ %9, %8 ], [ %16, %15 ]
  store atomic volatile i8 0, i8* @_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE release, align 1
  ret i32 %18
}

; Function Attrs: nounwind
define weak i32 @halide_default_trace(i8* %0, %struct.halide_trace_event_t* %1) #4 {
  %3 = alloca [4096 x i8], align 1
  %4 = alloca %"class.Halide::Runtime::Internal::(anonymous namespace)::Printer.0", align 8
  %5 = atomicrmw add i32* @_ZZ20halide_default_traceE3ids, i32 1 seq_cst
  %6 = tail call i32 @halide_get_trace_file(i8* %0) #13
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %8, label %239

8:                                                ; preds = %2
  %9 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 4
  %10 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 4, i32 2
  %11 = load i16, i16* %10, align 2, !tbaa !133
  %12 = zext i16 %11 to i32
  %13 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 4, i32 1
  %14 = load i8, i8* %13, align 1, !tbaa !139
  %15 = zext i8 %14 to i32
  %16 = add nuw nsw i32 %15, 7
  %17 = lshr i32 %16, 3
  %18 = mul nuw nsw i32 %17, %12
  %19 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 8
  %20 = load i32, i32* %19, align 8, !tbaa !140
  %21 = shl i32 %20, 2
  %22 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 0
  %23 = load i8*, i8** %22, align 8, !tbaa !141
  %24 = tail call i64 @strlen(i8* %23) #12
  %25 = trunc i64 %24 to i32
  %26 = add i32 %25, 1
  %27 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 3
  %28 = load i8*, i8** %27, align 8, !tbaa !142
  %29 = icmp eq i8* %28, null
  br i1 %29, label %34, label %30

30:                                               ; preds = %8
  %31 = tail call i64 @strlen(i8* nonnull %28) #12
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
  %41 = load %"class.Halide::Runtime::Internal::TraceBuffer"*, %"class.Halide::Runtime::Internal::TraceBuffer"** @_ZN6Halide7Runtime8Internal19halide_trace_bufferE, align 8, !tbaa !10
  %42 = getelementptr inbounds %"class.Halide::Runtime::Internal::TraceBuffer", %"class.Halide::Runtime::Internal::TraceBuffer"* %41, i64 0, i32 0, i32 0
  %43 = icmp ult i32 %40, 1048577
  %44 = getelementptr inbounds %"class.Halide::Runtime::Internal::TraceBuffer", %"class.Halide::Runtime::Internal::TraceBuffer"* %41, i64 0, i32 1
  %45 = getelementptr inbounds %"class.Halide::Runtime::Internal::TraceBuffer", %"class.Halide::Runtime::Internal::TraceBuffer"* %41, i64 0, i32 2
  %46 = getelementptr inbounds %"class.Halide::Runtime::Internal::TraceBuffer", %"class.Halide::Runtime::Internal::TraceBuffer"* %41, i64 0, i32 3, i64 0
  br i1 %43, label %.preheader, label %.preheader23

.preheader:                                       ; preds = %.preheader.backedge, %34
  %47 = load volatile i32, i32* %42, align 4, !tbaa !143
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
  %64 = load i32, i32* %44, align 4, !tbaa !145
  %65 = icmp eq i32 %64, 0
  br i1 %65, label %75, label %66

66:                                               ; preds = %63
  %67 = load i32, i32* %45, align 4, !tbaa !147
  %68 = sub i32 %64, %67
  store i32 %68, i32* %44, align 4, !tbaa !145
  %69 = zext i32 %68 to i64
  %70 = tail call i64 @write(i32 %6, i8* nonnull %46, i64 %69) #12
  %71 = trunc i64 %70 to i32
  %72 = icmp eq i32 %68, %71
  store i32 0, i32* %44, align 4, !tbaa !145
  store i32 0, i32* %45, align 4, !tbaa !147
  %73 = atomicrmw and i32* %42, i32 2147483647 seq_cst
  br i1 %72, label %.preheader.backedge, label %74

74:                                               ; preds = %66
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([108 x i8], [108 x i8]* @.str.32, i64 0, i64 0)) #12
  tail call void @abort() #12
  br label %.preheader.backedge

75:                                               ; preds = %63
  %76 = atomicrmw and i32* %42, i32 2147483647 seq_cst
  br label %.preheader.backedge

.preheader.backedge:                              ; preds = %75, %74, %66, %.preheader
  br label %.preheader, !llvm.loop !148

.preheader23:                                     ; preds = %.preheader23.backedge, %34
  %77 = load volatile i32, i32* %42, align 4, !tbaa !143
  %78 = and i32 %77, 1073741823
  %79 = add nuw nsw i32 %78, 1
  %80 = cmpxchg i32* %42, i32 %78, i32 %79 seq_cst seq_cst
  %81 = extractvalue { i32, i1 } %80, 1
  br i1 %81, label %82, label %.preheader23.backedge

82:                                               ; preds = %.preheader23
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([84 x i8], [84 x i8]* @.str.31, i64 0, i64 0)) #12
  tail call void @abort() #12
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
  %94 = load i32, i32* %44, align 4, !tbaa !145
  %95 = icmp eq i32 %94, 0
  br i1 %95, label %105, label %96

96:                                               ; preds = %93
  %97 = load i32, i32* %45, align 4, !tbaa !147
  %98 = sub i32 %94, %97
  store i32 %98, i32* %44, align 4, !tbaa !145
  %99 = zext i32 %98 to i64
  %100 = tail call i64 @write(i32 %6, i8* nonnull %46, i64 %99) #12
  %101 = trunc i64 %100 to i32
  %102 = icmp eq i32 %98, %101
  store i32 0, i32* %44, align 4, !tbaa !145
  store i32 0, i32* %45, align 4, !tbaa !147
  %103 = atomicrmw and i32* %42, i32 2147483647 seq_cst
  br i1 %102, label %.preheader23.backedge, label %104

104:                                              ; preds = %96
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([108 x i8], [108 x i8]* @.str.32, i64 0, i64 0)) #12
  tail call void @abort() #12
  br label %.preheader23.backedge

105:                                              ; preds = %93
  %106 = atomicrmw and i32* %42, i32 2147483647 seq_cst
  br label %.preheader23.backedge

.preheader23.backedge:                            ; preds = %105, %104, %96, %.preheader23
  br label %.preheader23, !llvm.loop !148

.loopexit:                                        ; preds = %82, %52
  %107 = phi i32 [ %53, %52 ], [ %83, %82 ]
  %108 = zext i32 %107 to i64
  %109 = getelementptr inbounds %"class.Halide::Runtime::Internal::TraceBuffer", %"class.Halide::Runtime::Internal::TraceBuffer"* %41, i64 0, i32 3, i64 %108
  %110 = icmp ugt i32 %40, 4096
  br i1 %110, label %111, label %129

111:                                              ; preds = %.loopexit
  %112 = tail call i8* @malloc(i64 1024) #12
  %113 = icmp eq i8* %112, null
  br i1 %113, label %114, label %118

114:                                              ; preds = %111
  %115 = zext i32 %40 to i64
  %116 = tail call i8* @halide_uint64_to_string(i8* null, i8* null, i64 %115, i32 1) #12
  %117 = tail call i8* @halide_string_to_string(i8* %116, i8* null, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7.167, i64 0, i64 0)) #12
  tail call void @halide_error(i8* null, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.29.165, i64 0, i64 0)) #12
  br label %128

118:                                              ; preds = %111
  %119 = getelementptr inbounds i8, i8* %112, i64 1023
  store i8 0, i8* %119, align 1, !tbaa !14
  %120 = zext i32 %40 to i64
  %121 = tail call i8* @halide_uint64_to_string(i8* nonnull %112, i8* nonnull %119, i64 %120, i32 1) #12
  %122 = tail call i8* @halide_string_to_string(i8* %121, i8* nonnull %119, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7.167, i64 0, i64 0)) #12
  %123 = ptrtoint i8* %122 to i64
  %124 = ptrtoint i8* %112 to i64
  %125 = sub i64 1, %124
  %126 = add i64 %125, %123
  %127 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* null, i8* nonnull %112, i64 %126) #12
  tail call void @halide_print(i8* null, i8* nonnull %112) #12
  br label %128

128:                                              ; preds = %118, %114
  tail call void @free(i8* %112) #12
  br label %129

129:                                              ; preds = %128, %.loopexit
  %130 = bitcast i8* %109 to i32*
  store i32 %40, i32* %130, align 4, !tbaa !149
  %131 = getelementptr inbounds i8, i8* %109, i64 4
  %132 = bitcast i8* %131 to i32*
  store i32 %5, i32* %132, align 4, !tbaa !151
  %133 = getelementptr inbounds i8, i8* %109, i64 8
  %134 = bitcast %struct.halide_type_t* %9 to i32*
  %135 = bitcast i8* %133 to i32*
  %136 = load i32, i32* %134, align 8
  store i32 %136, i32* %135, align 4
  %137 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 5
  %138 = getelementptr inbounds i8, i8* %109, i64 12
  %139 = bitcast i32* %137 to <4 x i32>*
  %140 = load <4 x i32>, <4 x i32>* %139, align 4, !tbaa !14
  %141 = getelementptr inbounds i8, i8* %109, i64 24
  %142 = bitcast i8* %141 to i32*
  %143 = bitcast i8* %138 to <4 x i32>*
  store <4 x i32> %140, <4 x i32>* %143, align 4, !tbaa !14
  %144 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 2
  %145 = load i32*, i32** %144, align 8, !tbaa !152
  %146 = icmp eq i32* %145, null
  br i1 %146, label %152, label %147

147:                                              ; preds = %129
  %148 = bitcast i32* %145 to i8*
  %149 = getelementptr inbounds i8, i8* %109, i64 28
  %150 = zext i32 %21 to i64
  %151 = tail call i8* @memcpy(i8* nonnull %149, i8* nonnull %148, i64 %150) #12
  br label %152

152:                                              ; preds = %147, %129
  %153 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 1
  %154 = load i8*, i8** %153, align 8, !tbaa !153
  %155 = icmp eq i8* %154, null
  br i1 %155, label %._crit_edge, label %156

156:                                              ; preds = %152
  %157 = getelementptr inbounds i8, i8* %109, i64 28
  %158 = bitcast i8* %157 to i32*
  %159 = load i32, i32* %142, align 4, !tbaa !154
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds i32, i32* %158, i64 %160
  %162 = bitcast i32* %161 to i8*
  %163 = zext i32 %18 to i64
  %164 = tail call i8* @memcpy(i8* nonnull %162, i8* nonnull %154, i64 %163) #12
  br label %._crit_edge

._crit_edge:                                      ; preds = %156, %152
  %165 = getelementptr inbounds i8, i8* %109, i64 28
  %166 = bitcast i8* %165 to i32*
  %167 = load i32, i32* %142, align 4, !tbaa !154
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds i32, i32* %166, i64 %168
  %170 = bitcast i32* %169 to i8*
  %171 = getelementptr inbounds i8, i8* %109, i64 10
  %172 = bitcast i8* %171 to i16*
  %173 = load i16, i16* %172, align 2, !tbaa !155
  %174 = zext i16 %173 to i32
  %175 = getelementptr inbounds i8, i8* %109, i64 9
  %176 = load i8, i8* %175, align 1, !tbaa !139
  %177 = zext i8 %176 to i32
  %178 = add nuw nsw i32 %177, 7
  %179 = lshr i32 %178, 3
  %180 = mul nuw nsw i32 %179, %174
  %181 = zext i32 %180 to i64
  %182 = getelementptr inbounds i8, i8* %170, i64 %181
  %183 = load i8*, i8** %22, align 8, !tbaa !141
  %184 = zext i32 %26 to i64
  %185 = tail call i8* @memcpy(i8* nonnull %182, i8* %183, i64 %184) #12
  %186 = load i32, i32* %142, align 4, !tbaa !154
  %187 = sext i32 %186 to i64
  %188 = getelementptr inbounds i32, i32* %166, i64 %187
  %189 = bitcast i32* %188 to i8*
  %190 = load i16, i16* %172, align 2, !tbaa !155
  %191 = zext i16 %190 to i32
  %192 = load i8, i8* %175, align 1, !tbaa !139
  %193 = zext i8 %192 to i32
  %194 = add nuw nsw i32 %193, 7
  %195 = lshr i32 %194, 3
  %196 = mul nuw nsw i32 %195, %191
  %197 = zext i32 %196 to i64
  %198 = getelementptr inbounds i8, i8* %189, i64 %197
  br label %199

199:                                              ; preds = %199, %._crit_edge
  %200 = phi i8* [ %198, %._crit_edge ], [ %201, %199 ]
  %201 = getelementptr inbounds i8, i8* %200, i64 1
  %202 = load i8, i8* %200, align 1, !tbaa !14
  %203 = icmp eq i8 %202, 0
  br i1 %203, label %204, label %199, !llvm.loop !156

204:                                              ; preds = %199
  %205 = load i8*, i8** %27, align 8, !tbaa !142
  %206 = icmp eq i8* %205, null
  %207 = select i1 %206, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1.10, i64 0, i64 0), i8* %205
  %208 = zext i32 %35 to i64
  %209 = tail call i8* @memcpy(i8* nonnull %201, i8* %207, i64 %208) #12
  %210 = load %"class.Halide::Runtime::Internal::TraceBuffer"*, %"class.Halide::Runtime::Internal::TraceBuffer"** @_ZN6Halide7Runtime8Internal19halide_trace_bufferE, align 8, !tbaa !10
  fence seq_cst
  %211 = getelementptr inbounds %"class.Halide::Runtime::Internal::TraceBuffer", %"class.Halide::Runtime::Internal::TraceBuffer"* %210, i64 0, i32 0, i32 0
  %212 = atomicrmw sub i32* %211, i32 1 seq_cst
  %213 = load i32, i32* %137, align 4, !tbaa !157
  %214 = icmp eq i32 %213, 9
  br i1 %214, label %215, label %528

215:                                              ; preds = %204
  %216 = load %"class.Halide::Runtime::Internal::TraceBuffer"*, %"class.Halide::Runtime::Internal::TraceBuffer"** @_ZN6Halide7Runtime8Internal19halide_trace_bufferE, align 8, !tbaa !10
  %217 = getelementptr inbounds %"class.Halide::Runtime::Internal::TraceBuffer", %"class.Halide::Runtime::Internal::TraceBuffer"* %216, i64 0, i32 0, i32 0
  br label %218

218:                                              ; preds = %218, %215
  %219 = atomicrmw or i32* %217, i32 1073741824 seq_cst
  %220 = cmpxchg i32* %217, i32 1073741824, i32 -2147483648 seq_cst seq_cst
  %221 = extractvalue { i32, i1 } %220, 1
  br i1 %221, label %222, label %218

222:                                              ; preds = %218
  %223 = getelementptr inbounds %"class.Halide::Runtime::Internal::TraceBuffer", %"class.Halide::Runtime::Internal::TraceBuffer"* %216, i64 0, i32 1
  %224 = load i32, i32* %223, align 4, !tbaa !145
  %225 = icmp eq i32 %224, 0
  br i1 %225, label %237, label %226

226:                                              ; preds = %222
  %227 = getelementptr inbounds %"class.Halide::Runtime::Internal::TraceBuffer", %"class.Halide::Runtime::Internal::TraceBuffer"* %216, i64 0, i32 2
  %228 = load i32, i32* %227, align 4, !tbaa !147
  %229 = sub i32 %224, %228
  store i32 %229, i32* %223, align 4, !tbaa !145
  %230 = getelementptr inbounds %"class.Halide::Runtime::Internal::TraceBuffer", %"class.Halide::Runtime::Internal::TraceBuffer"* %216, i64 0, i32 3, i64 0
  %231 = zext i32 %229 to i64
  %232 = tail call i64 @write(i32 %6, i8* nonnull %230, i64 %231) #12
  %233 = trunc i64 %232 to i32
  %234 = icmp eq i32 %229, %233
  store i32 0, i32* %223, align 4, !tbaa !145
  store i32 0, i32* %227, align 4, !tbaa !147
  %235 = atomicrmw and i32* %217, i32 2147483647 seq_cst
  br i1 %234, label %528, label %236

236:                                              ; preds = %226
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([108 x i8], [108 x i8]* @.str.32, i64 0, i64 0)) #12
  tail call void @abort() #12
  br label %528

237:                                              ; preds = %222
  %238 = atomicrmw and i32* %217, i32 2147483647 seq_cst
  br label %528

239:                                              ; preds = %2
  %240 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 4096, i8* nonnull %240) #10
  %241 = bitcast %"class.Halide::Runtime::Internal::(anonymous namespace)::Printer.0"* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %241) #10
  %242 = getelementptr inbounds %"class.Halide::Runtime::Internal::(anonymous namespace)::Printer.0", %"class.Halide::Runtime::Internal::(anonymous namespace)::Printer.0"* %4, i64 0, i32 3
  store i8* %0, i8** %242, align 8, !tbaa !158
  %243 = getelementptr inbounds %"class.Halide::Runtime::Internal::(anonymous namespace)::Printer.0", %"class.Halide::Runtime::Internal::(anonymous namespace)::Printer.0"* %4, i64 0, i32 4
  store i8 0, i8* %243, align 8, !tbaa !160
  %244 = getelementptr inbounds %"class.Halide::Runtime::Internal::(anonymous namespace)::Printer.0", %"class.Halide::Runtime::Internal::(anonymous namespace)::Printer.0"* %4, i64 0, i32 0
  store i8* %240, i8** %244, align 8
  %245 = getelementptr inbounds %"class.Halide::Runtime::Internal::(anonymous namespace)::Printer.0", %"class.Halide::Runtime::Internal::(anonymous namespace)::Printer.0"* %4, i64 0, i32 1
  store i8* %240, i8** %245, align 8, !tbaa !161
  %246 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3, i64 0, i64 4095
  %247 = getelementptr inbounds %"class.Halide::Runtime::Internal::(anonymous namespace)::Printer.0", %"class.Halide::Runtime::Internal::(anonymous namespace)::Printer.0"* %4, i64 0, i32 2
  store i8* %246, i8** %247, align 8, !tbaa !162
  store i8 0, i8* %246, align 1, !tbaa !14
  %248 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 4, i32 1
  %249 = load i8, i8* %248, align 1, !tbaa !163
  %250 = zext i8 %249 to i32
  br label %251

251:                                              ; preds = %251, %239
  %252 = phi i32 [ 8, %239 ], [ %254, %251 ]
  %253 = icmp slt i32 %252, %250
  %254 = shl i32 %252, 1
  br i1 %253, label %251, label %255, !llvm.loop !164

255:                                              ; preds = %251
  %256 = icmp slt i32 %252, 65
  br i1 %256, label %260, label %257

257:                                              ; preds = %255
  call void @halide_print(i8* %0, i8* getelementptr inbounds ([104 x i8], [104 x i8]* @.str.2.11, i64 0, i64 0)) #12
  call void @abort() #12
  %258 = load i8*, i8** %245, align 8, !tbaa !161
  %259 = load i8*, i8** %247, align 8, !tbaa !162
  br label %260

260:                                              ; preds = %257, %255
  %261 = phi i8* [ %259, %257 ], [ %246, %255 ]
  %262 = phi i8* [ %258, %257 ], [ %240, %255 ]
  %263 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 5
  %264 = load i32, i32* %263, align 4, !tbaa !157
  %265 = icmp slt i32 %264, 2
  %266 = zext i32 %264 to i64
  %267 = getelementptr inbounds [11 x i8*], [11 x i8*]* @__const.halide_default_trace.event_types, i64 0, i64 %266
  %268 = load i8*, i8** %267, align 8, !tbaa !10
  %269 = call i8* @halide_string_to_string(i8* %262, i8* %261, i8* nonnull %268) #12
  store i8* %269, i8** %245, align 8, !tbaa !161
  %270 = load i8*, i8** %247, align 8, !tbaa !162
  %271 = call i8* @halide_string_to_string(i8* %269, i8* %270, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.20.180, i64 0, i64 0)) #12
  store i8* %271, i8** %245, align 8, !tbaa !161
  %272 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 0
  %273 = load i8*, i8** %272, align 8, !tbaa !141
  %274 = icmp eq i8* %273, null
  %275 = load i8*, i8** %247, align 8, !tbaa !162
  br i1 %274, label %276, label %278

276:                                              ; preds = %260
  %277 = call i8* @halide_string_to_string(i8* %271, i8* %275, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.30.166, i64 0, i64 0)) #12
  br label %280

278:                                              ; preds = %260
  %279 = call i8* @halide_string_to_string(i8* %271, i8* %275, i8* nonnull %273) #12
  br label %280

280:                                              ; preds = %278, %276
  %281 = phi i8* [ %279, %278 ], [ %277, %276 ]
  store i8* %281, i8** %245, align 8, !tbaa !161
  %282 = load i8*, i8** %247, align 8, !tbaa !162
  %283 = call i8* @halide_string_to_string(i8* %281, i8* %282, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30.142, i64 0, i64 0)) #12
  store i8* %283, i8** %245, align 8, !tbaa !161
  %284 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 7
  %285 = load i32, i32* %284, align 4, !tbaa !165
  %286 = load i8*, i8** %247, align 8, !tbaa !162
  %287 = sext i32 %285 to i64
  %288 = call i8* @halide_int64_to_string(i8* %283, i8* %286, i64 %287, i32 1) #12
  store i8* %288, i8** %245, align 8, !tbaa !161
  %289 = load i8*, i8** %247, align 8, !tbaa !162
  %290 = call i8* @halide_string_to_string(i8* %288, i8* %289, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.22.182, i64 0, i64 0)) #12
  store i8* %290, i8** %245, align 8, !tbaa !161
  %291 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 4, i32 2
  %292 = load i16, i16* %291, align 2, !tbaa !133
  %293 = icmp ugt i16 %292, 1
  br i1 %293, label %294, label %297

294:                                              ; preds = %280
  %295 = load i8*, i8** %247, align 8, !tbaa !162
  %296 = call i8* @halide_string_to_string(i8* %290, i8* %295, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.17, i64 0, i64 0)) #12
  store i8* %296, i8** %245, align 8, !tbaa !161
  br label %297

297:                                              ; preds = %294, %280
  %298 = phi i8* [ %296, %294 ], [ %290, %280 ]
  %299 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 8
  %300 = load i32, i32* %299, align 8, !tbaa !140
  %301 = icmp sgt i32 %300, 0
  br i1 %301, label %302, label %.loopexit26

302:                                              ; preds = %297
  %303 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 2
  %304 = load i32*, i32** %303, align 8, !tbaa !152
  %305 = load i32, i32* %304, align 4, !tbaa !76
  %306 = load i8*, i8** %247, align 8, !tbaa !162
  %307 = sext i32 %305 to i64
  %308 = call i8* @halide_int64_to_string(i8* %298, i8* %306, i64 %307, i32 1) #12
  store i8* %308, i8** %245, align 8, !tbaa !161
  %309 = load i32, i32* %299, align 8, !tbaa !140
  %310 = icmp sgt i32 %309, 1
  br i1 %310, label %.preheader25, label %.loopexit26

.loopexit26:                                      ; preds = %327, %302, %297
  %311 = phi i8* [ %298, %297 ], [ %308, %302 ], [ %336, %327 ]
  %312 = load i16, i16* %291, align 2, !tbaa !133
  %313 = icmp ugt i16 %312, 1
  %314 = load i8*, i8** %247, align 8, !tbaa !162
  %315 = select i1 %313, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.20, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8.120, i64 0, i64 0)
  %316 = call i8* @halide_string_to_string(i8* %311, i8* %314, i8* nonnull %315) #12
  store i8* %316, i8** %245, align 8, !tbaa !161
  br i1 %265, label %341, label %470

.preheader25:                                     ; preds = %327, %302
  %317 = phi i8* [ %336, %327 ], [ %308, %302 ]
  %318 = phi i64 [ %337, %327 ], [ 1, %302 ]
  %319 = load i16, i16* %291, align 2, !tbaa !133
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
  %329 = load i8*, i8** %247, align 8, !tbaa !162
  %330 = call i8* @halide_string_to_string(i8* %317, i8* %329, i8* nonnull %328) #12
  store i8* %330, i8** %245, align 8, !tbaa !161
  %331 = load i32*, i32** %303, align 8, !tbaa !152
  %332 = getelementptr inbounds i32, i32* %331, i64 %318
  %333 = load i32, i32* %332, align 4, !tbaa !76
  %334 = load i8*, i8** %247, align 8, !tbaa !162
  %335 = sext i32 %333 to i64
  %336 = call i8* @halide_int64_to_string(i8* %330, i8* %334, i64 %335, i32 1) #12
  store i8* %336, i8** %245, align 8, !tbaa !161
  %337 = add nuw nsw i64 %318, 1
  %338 = load i32, i32* %299, align 8, !tbaa !140
  %339 = sext i32 %338 to i64
  %340 = icmp slt i64 %337, %339
  br i1 %340, label %.preheader25, label %.loopexit26, !llvm.loop !166

341:                                              ; preds = %.loopexit26
  %342 = load i16, i16* %291, align 2, !tbaa !133
  %343 = icmp ugt i16 %342, 1
  %344 = load i8*, i8** %247, align 8, !tbaa !162
  %345 = select i1 %343, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.22, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.23, i64 0, i64 0)
  %346 = call i8* @halide_string_to_string(i8* %316, i8* %344, i8* nonnull %345) #12
  store i8* %346, i8** %245, align 8, !tbaa !161
  %347 = load i16, i16* %291, align 2, !tbaa !133
  %348 = icmp eq i16 %347, 0
  br i1 %348, label %470, label %349

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
  br label %361

359:                                              ; preds = %461
  %360 = icmp ugt i16 %464, 1
  br i1 %360, label %467, label %470

361:                                              ; preds = %461, %349
  %362 = phi i8* [ %346, %349 ], [ %462, %461 ]
  %363 = phi i64 [ 0, %349 ], [ %463, %461 ]
  %364 = icmp eq i64 %363, 0
  br i1 %364, label %368, label %365

365:                                              ; preds = %361
  %366 = load i8*, i8** %247, align 8, !tbaa !162
  %367 = call i8* @halide_string_to_string(i8* %362, i8* %366, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i64 0, i64 0)) #12
  store i8* %367, i8** %245, align 8, !tbaa !161
  br label %368

368:                                              ; preds = %365, %361
  %369 = phi i8* [ %367, %365 ], [ %362, %361 ]
  %370 = load i8, i8* %350, align 8, !tbaa !168
  switch i8 %370, label %461 [
    i8 0, label %371
    i8 1, label %399
    i8 2, label %427
    i8 3, label %453
  ]

371:                                              ; preds = %368
  switch i32 %252, label %393 [
    i32 8, label %372
    i32 16, label %379
    i32 32, label %386
  ]

372:                                              ; preds = %371
  %373 = load i8*, i8** %351, align 8, !tbaa !153
  %374 = getelementptr inbounds i8, i8* %373, i64 %363
  %375 = load i8, i8* %374, align 1, !tbaa !14
  %376 = load i8*, i8** %247, align 8, !tbaa !162
  %377 = sext i8 %375 to i64
  %378 = call i8* @halide_int64_to_string(i8* %369, i8* %376, i64 %377, i32 1) #12
  br label %459

379:                                              ; preds = %371
  %380 = load i16*, i16** %354, align 8, !tbaa !153
  %381 = getelementptr inbounds i16, i16* %380, i64 %363
  %382 = load i16, i16* %381, align 2, !tbaa !169
  %383 = load i8*, i8** %247, align 8, !tbaa !162
  %384 = sext i16 %382 to i64
  %385 = call i8* @halide_int64_to_string(i8* %369, i8* %383, i64 %384, i32 1) #12
  br label %459

386:                                              ; preds = %371
  %387 = load i32*, i32** %357, align 8, !tbaa !153
  %388 = getelementptr inbounds i32, i32* %387, i64 %363
  %389 = load i32, i32* %388, align 4, !tbaa !76
  %390 = load i8*, i8** %247, align 8, !tbaa !162
  %391 = sext i32 %389 to i64
  %392 = call i8* @halide_int64_to_string(i8* %369, i8* %390, i64 %391, i32 1) #12
  br label %459

393:                                              ; preds = %371
  %394 = load i64*, i64** %358, align 8, !tbaa !153
  %395 = getelementptr inbounds i64, i64* %394, i64 %363
  %396 = load i64, i64* %395, align 8, !tbaa !113
  %397 = load i8*, i8** %247, align 8, !tbaa !162
  %398 = call i8* @halide_int64_to_string(i8* %369, i8* %397, i64 %396, i32 1) #12
  br label %459

399:                                              ; preds = %368
  switch i32 %252, label %421 [
    i32 8, label %400
    i32 16, label %407
    i32 32, label %414
  ]

400:                                              ; preds = %399
  %401 = load i8*, i8** %351, align 8, !tbaa !153
  %402 = getelementptr inbounds i8, i8* %401, i64 %363
  %403 = load i8, i8* %402, align 1, !tbaa !14
  %404 = load i8*, i8** %247, align 8, !tbaa !162
  %405 = zext i8 %403 to i64
  %406 = call i8* @halide_int64_to_string(i8* %369, i8* %404, i64 %405, i32 1) #12
  br label %459

407:                                              ; preds = %399
  %408 = load i16*, i16** %354, align 8, !tbaa !153
  %409 = getelementptr inbounds i16, i16* %408, i64 %363
  %410 = load i16, i16* %409, align 2, !tbaa !169
  %411 = load i8*, i8** %247, align 8, !tbaa !162
  %412 = zext i16 %410 to i64
  %413 = call i8* @halide_int64_to_string(i8* %369, i8* %411, i64 %412, i32 1) #12
  br label %459

414:                                              ; preds = %399
  %415 = load i32*, i32** %357, align 8, !tbaa !153
  %416 = getelementptr inbounds i32, i32* %415, i64 %363
  %417 = load i32, i32* %416, align 4, !tbaa !76
  %418 = load i8*, i8** %247, align 8, !tbaa !162
  %419 = zext i32 %417 to i64
  %420 = call i8* @halide_uint64_to_string(i8* %369, i8* %418, i64 %419, i32 1) #12
  br label %459

421:                                              ; preds = %399
  %422 = load i64*, i64** %358, align 8, !tbaa !153
  %423 = getelementptr inbounds i64, i64* %422, i64 %363
  %424 = load i64, i64* %423, align 8, !tbaa !113
  %425 = load i8*, i8** %247, align 8, !tbaa !162
  %426 = call i8* @halide_uint64_to_string(i8* %369, i8* %425, i64 %424, i32 1) #12
  br label %459

427:                                              ; preds = %368
  br i1 %353, label %429, label %428

428:                                              ; preds = %427
  call void @halide_print(i8* %0, i8* getelementptr inbounds ([106 x i8], [106 x i8]* @.str.24, i64 0, i64 0)) #12
  call void @abort() #12
  br label %429

429:                                              ; preds = %428, %427
  switch i32 %252, label %446 [
    i32 32, label %430
    i32 16, label %438
  ]

430:                                              ; preds = %429
  %431 = load float*, float** %355, align 8, !tbaa !153
  %432 = getelementptr inbounds float, float* %431, i64 %363
  %433 = load float, float* %432, align 4, !tbaa !170
  %434 = load i8*, i8** %245, align 8, !tbaa !161
  %435 = load i8*, i8** %247, align 8, !tbaa !162
  %436 = fpext float %433 to double
  %437 = call i8* @halide_double_to_string(i8* %434, i8* %435, double %436, i32 0) #12
  br label %459

438:                                              ; preds = %429
  %439 = load i16*, i16** %354, align 8, !tbaa !153
  %440 = getelementptr inbounds i16, i16* %439, i64 %363
  %441 = load i16, i16* %440, align 2, !tbaa !169
  %442 = call double @halide_float16_bits_to_double(i16 zeroext %441) #12
  %443 = load i8*, i8** %245, align 8, !tbaa !161
  %444 = load i8*, i8** %247, align 8, !tbaa !162
  %445 = call i8* @halide_double_to_string(i8* %443, i8* %444, double %442, i32 1) #12
  br label %459

446:                                              ; preds = %429
  %447 = load double*, double** %356, align 8, !tbaa !153
  %448 = getelementptr inbounds double, double* %447, i64 %363
  %449 = load double, double* %448, align 8, !tbaa !172
  %450 = load i8*, i8** %245, align 8, !tbaa !161
  %451 = load i8*, i8** %247, align 8, !tbaa !162
  %452 = call i8* @halide_double_to_string(i8* %450, i8* %451, double %449, i32 1) #12
  br label %459

453:                                              ; preds = %368
  %454 = load i8**, i8*** %352, align 8, !tbaa !153
  %455 = getelementptr inbounds i8*, i8** %454, i64 %363
  %456 = load i8*, i8** %455, align 8, !tbaa !10
  %457 = load i8*, i8** %247, align 8, !tbaa !162
  %458 = call i8* @halide_pointer_to_string(i8* %369, i8* %457, i8* %456) #12
  br label %459

459:                                              ; preds = %453, %446, %438, %430, %421, %414, %407, %400, %393, %386, %379, %372
  %460 = phi i8* [ %385, %379 ], [ %398, %393 ], [ %392, %386 ], [ %378, %372 ], [ %445, %438 ], [ %452, %446 ], [ %437, %430 ], [ %458, %453 ], [ %406, %400 ], [ %420, %414 ], [ %426, %421 ], [ %413, %407 ]
  store i8* %460, i8** %245, align 8, !tbaa !161
  br label %461

461:                                              ; preds = %459, %368
  %462 = phi i8* [ %369, %368 ], [ %460, %459 ]
  %463 = add nuw nsw i64 %363, 1
  %464 = load i16, i16* %291, align 2, !tbaa !133
  %465 = zext i16 %464 to i64
  %466 = icmp ult i64 %463, %465
  br i1 %466, label %361, label %359, !llvm.loop !174

467:                                              ; preds = %359
  %468 = load i8*, i8** %247, align 8, !tbaa !162
  %469 = call i8* @halide_string_to_string(i8* %462, i8* %468, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.25, i64 0, i64 0)) #12
  store i8* %469, i8** %245, align 8, !tbaa !161
  br label %470

470:                                              ; preds = %467, %359, %341, %.loopexit26
  %471 = phi i8* [ %462, %359 ], [ %469, %467 ], [ %316, %.loopexit26 ], [ %346, %341 ]
  %472 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 3
  %473 = load i8*, i8** %472, align 8, !tbaa !142
  %474 = icmp eq i8* %473, null
  br i1 %474, label %492, label %475

475:                                              ; preds = %470
  %476 = load i8, i8* %473, align 1, !tbaa !14
  %477 = icmp eq i8 %476, 0
  br i1 %477, label %492, label %478

478:                                              ; preds = %475
  %479 = load i8*, i8** %247, align 8, !tbaa !162
  %480 = call i8* @halide_string_to_string(i8* %471, i8* %479, i8* nonnull getelementptr inbounds ([9 x i8], [9 x i8]* @.str.26, i64 0, i64 0)) #12
  store i8* %480, i8** %245, align 8, !tbaa !161
  %481 = load i8*, i8** %472, align 8, !tbaa !142
  %482 = icmp eq i8* %481, null
  %483 = load i8*, i8** %247, align 8, !tbaa !162
  br i1 %482, label %484, label %486

484:                                              ; preds = %478
  %485 = call i8* @halide_string_to_string(i8* %480, i8* %483, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.30.166, i64 0, i64 0)) #12
  br label %488

486:                                              ; preds = %478
  %487 = call i8* @halide_string_to_string(i8* %480, i8* %483, i8* nonnull %481) #12
  br label %488

488:                                              ; preds = %486, %484
  %489 = phi i8* [ %487, %486 ], [ %485, %484 ]
  store i8* %489, i8** %245, align 8, !tbaa !161
  %490 = load i8*, i8** %247, align 8, !tbaa !162
  %491 = call i8* @halide_string_to_string(i8* %489, i8* %490, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.27, i64 0, i64 0)) #12
  store i8* %491, i8** %245, align 8, !tbaa !161
  br label %492

492:                                              ; preds = %488, %475, %470
  %493 = phi i8* [ %491, %488 ], [ %471, %475 ], [ %471, %470 ]
  %494 = load i8*, i8** %247, align 8, !tbaa !162
  %495 = call i8* @halide_string_to_string(i8* %493, i8* %494, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7.167, i64 0, i64 0)) #12
  store i8* %495, i8** %245, align 8, !tbaa !161
  %496 = load i8*, i8** %244, align 8, !tbaa !175
  %497 = load i8*, i8** %242, align 8, !tbaa !158
  %498 = ptrtoint i8* %495 to i64
  %499 = ptrtoint i8* %496 to i64
  %500 = add i64 %498, 1
  %501 = sub i64 %500, %499
  %502 = call i32 @halide_msan_annotate_memory_is_initialized(i8* %497, i8* %496, i64 %501) #12
  br label %503

503:                                              ; preds = %503, %492
  %504 = atomicrmw volatile xchg i8* @_ZN6Halide7Runtime8Internal22halide_trace_file_lockE, i8 1 acquire
  %505 = icmp eq i8 %504, 0
  br i1 %505, label %506, label %503, !llvm.loop !176

506:                                              ; preds = %503
  call void @halide_print(i8* %0, i8* nonnull %240) #12
  store atomic volatile i8 0, i8* @_ZN6Halide7Runtime8Internal22halide_trace_file_lockE release, align 1
  %507 = load i8*, i8** %244, align 8, !tbaa !175
  %508 = icmp eq i8* %507, null
  br i1 %508, label %509, label %511

509:                                              ; preds = %506
  %510 = load i8*, i8** %242, align 8, !tbaa !158
  call void @halide_error(i8* %510, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.29.165, i64 0, i64 0)) #12
  br label %519

511:                                              ; preds = %506
  %512 = load i8*, i8** %245, align 8, !tbaa !161
  %513 = load i8*, i8** %242, align 8, !tbaa !158
  %514 = ptrtoint i8* %512 to i64
  %515 = ptrtoint i8* %507 to i64
  %516 = sub i64 1, %515
  %517 = add i64 %516, %514
  %518 = call i32 @halide_msan_annotate_memory_is_initialized(i8* %513, i8* nonnull %507, i64 %517) #12
  br label %519

519:                                              ; preds = %511, %509
  %520 = load i8, i8* %243, align 8, !tbaa !160, !range !17
  %521 = icmp eq i8 %520, 0
  br i1 %521, label %527, label %522

522:                                              ; preds = %519
  %523 = load i8*, i8** %244, align 8, !tbaa !175
  %524 = getelementptr inbounds %"class.Halide::Runtime::Internal::(anonymous namespace)::Printer.0", %"class.Halide::Runtime::Internal::(anonymous namespace)::Printer.0"* %4, i64 0, i32 5, i64 0
  %525 = icmp eq i8* %523, %524
  br i1 %525, label %527, label %526

526:                                              ; preds = %522
  call void @free(i8* %523) #12
  br label %527

527:                                              ; preds = %526, %522, %519
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %241) #10
  call void @llvm.lifetime.end.p0i8(i64 4096, i8* nonnull %240) #10
  br label %528

528:                                              ; preds = %527, %237, %236, %226, %204
  ret i32 %5
}

; Function Attrs: nounwind
define weak i32 @halide_get_trace_file(i8* %0) local_unnamed_addr #4 {
  br label %2

2:                                                ; preds = %2, %1
  %3 = atomicrmw volatile xchg i8* @_ZN6Halide7Runtime8Internal22halide_trace_file_lockE, i8 1 acquire
  %4 = icmp eq i8 %3, 0
  br i1 %4, label %5, label %2, !llvm.loop !176

5:                                                ; preds = %2
  %6 = load i32, i32* @_ZN6Halide7Runtime8Internal17halide_trace_fileE, align 4, !tbaa !76
  %7 = icmp slt i32 %6, 0
  br i1 %7, label %8, label %27

8:                                                ; preds = %5
  %9 = tail call i8* @getenv(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.28, i64 0, i64 0)) #12
  %10 = icmp eq i8* %9, null
  br i1 %10, label %26, label %11

11:                                               ; preds = %8
  %12 = tail call i8* @fopen(i8* nonnull %9, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.29, i64 0, i64 0)) #12
  %13 = icmp eq i8* %12, null
  br i1 %13, label %14, label %15

14:                                               ; preds = %11
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([103 x i8], [103 x i8]* @.str.30, i64 0, i64 0)) #12
  tail call void @abort() #12
  br label %15

15:                                               ; preds = %14, %11
  %16 = tail call i32 @fileno(i8* %12) #12
  tail call void @halide_set_trace_file(i32 %16) #13
  store i8* %12, i8** @_ZN6Halide7Runtime8Internal35halide_trace_file_internally_openedE, align 8, !tbaa !10
  %17 = load %"class.Halide::Runtime::Internal::TraceBuffer"*, %"class.Halide::Runtime::Internal::TraceBuffer"** @_ZN6Halide7Runtime8Internal19halide_trace_bufferE, align 8, !tbaa !10
  %18 = icmp eq %"class.Halide::Runtime::Internal::TraceBuffer"* %17, null
  br i1 %18, label %19, label %27

19:                                               ; preds = %15
  %20 = tail call i8* @malloc(i64 1048588) #12
  store i8* %20, i8** bitcast (%"class.Halide::Runtime::Internal::TraceBuffer"** @_ZN6Halide7Runtime8Internal19halide_trace_bufferE to i8**), align 8, !tbaa !10
  %21 = getelementptr inbounds i8, i8* %20, i64 4
  %22 = bitcast i8* %21 to i32*
  store i32 0, i32* %22, align 4, !tbaa !145
  %23 = getelementptr inbounds i8, i8* %20, i64 8
  %24 = bitcast i8* %23 to i32*
  store i32 0, i32* %24, align 4, !tbaa !147
  %25 = bitcast i8* %20 to i32*
  store volatile i32 0, i32* %25, align 4, !tbaa !143
  br label %27

26:                                               ; preds = %8
  tail call void @halide_set_trace_file(i32 0) #13
  br label %27

27:                                               ; preds = %26, %19, %15, %5
  %28 = load i32, i32* @_ZN6Halide7Runtime8Internal17halide_trace_fileE, align 4, !tbaa !76
  store atomic volatile i8 0, i8* @_ZN6Halide7Runtime8Internal22halide_trace_file_lockE release, align 1
  ret i32 %28
}

declare i8* @fopen(i8*, i8*) local_unnamed_addr #1

declare i32 @fileno(i8*) local_unnamed_addr #1

; Function Attrs: nounwind willreturn mustprogress
define weak void @halide_set_trace_file(i32 %0) local_unnamed_addr #2 {
  store i32 %0, i32* @_ZN6Halide7Runtime8Internal17halide_trace_fileE, align 4, !tbaa !76
  ret void
}

; Function Attrs: nounwind mustprogress
define weak void @halide_trace_cleanup() #0 {
  %1 = tail call i32 @halide_shutdown_trace() #13
  ret void
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_shutdown_trace() local_unnamed_addr #0 {
  %1 = load i8*, i8** @_ZN6Halide7Runtime8Internal35halide_trace_file_internally_openedE, align 8, !tbaa !10
  %2 = icmp eq i8* %1, null
  br i1 %2, label %9, label %3

3:                                                ; preds = %0
  %4 = tail call i32 @fclose(i8* nonnull %1) #12
  store i32 0, i32* @_ZN6Halide7Runtime8Internal17halide_trace_fileE, align 4, !tbaa !76
  store i8 0, i8* @_ZN6Halide7Runtime8Internal29halide_trace_file_initializedE, align 1, !tbaa !15
  store i8* null, i8** @_ZN6Halide7Runtime8Internal35halide_trace_file_internally_openedE, align 8, !tbaa !10
  %5 = load %"class.Halide::Runtime::Internal::TraceBuffer"*, %"class.Halide::Runtime::Internal::TraceBuffer"** @_ZN6Halide7Runtime8Internal19halide_trace_bufferE, align 8, !tbaa !10
  %6 = icmp eq %"class.Halide::Runtime::Internal::TraceBuffer"* %5, null
  br i1 %6, label %9, label %7

7:                                                ; preds = %3
  %8 = bitcast %"class.Halide::Runtime::Internal::TraceBuffer"* %5 to i8*
  tail call void @free(i8* nonnull %8) #12
  br label %9

9:                                                ; preds = %7, %3, %0
  %10 = phi i32 [ %4, %7 ], [ %4, %3 ], [ 0, %0 ]
  ret i32 %10
}

declare i32 @fclose(i8*) local_unnamed_addr #1

; Function Attrs: nounwind willreturn mustprogress
define weak i32 (i8*, %struct.halide_trace_event_t*)* @halide_set_custom_trace(i32 (i8*, %struct.halide_trace_event_t*)* %0) local_unnamed_addr #2 {
  %2 = load i32 (i8*, %struct.halide_trace_event_t*)*, i32 (i8*, %struct.halide_trace_event_t*)** @_ZN6Halide7Runtime8Internal19halide_custom_traceE, align 8, !tbaa !10
  store i32 (i8*, %struct.halide_trace_event_t*)* %0, i32 (i8*, %struct.halide_trace_event_t*)** @_ZN6Halide7Runtime8Internal19halide_custom_traceE, align 8, !tbaa !10
  ret i32 (i8*, %struct.halide_trace_event_t*)* %2
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_trace(i8* %0, %struct.halide_trace_event_t* %1) local_unnamed_addr #0 {
  %3 = load i32 (i8*, %struct.halide_trace_event_t*)*, i32 (i8*, %struct.halide_trace_event_t*)** @_ZN6Halide7Runtime8Internal19halide_custom_traceE, align 8, !tbaa !10
  %4 = tail call i32 %3(i8* %0, %struct.halide_trace_event_t* %1) #12
  ret i32 %4
}

; Function Attrs: nounwind
define weak i32 @halide_trace_helper(i8* %0, i8* %1, i8* %2, i32* %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10, i8* %11) local_unnamed_addr #4 {
  %13 = alloca %struct.halide_trace_event_t, align 8
  %14 = bitcast %struct.halide_trace_event_t* %13 to i8*
  call void @llvm.lifetime.start.p0i8(i64 56, i8* nonnull %14) #10
  %15 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %13, i64 0, i32 4, i32 0
  %16 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %13, i64 0, i32 4, i32 1
  %17 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %13, i64 0, i32 4, i32 2
  %18 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %13, i64 0, i32 0
  store i8* %1, i8** %18, align 8, !tbaa !141
  %19 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %13, i64 0, i32 1
  store i8* %2, i8** %19, align 8, !tbaa !153
  %20 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %13, i64 0, i32 2
  store i32* %3, i32** %20, align 8, !tbaa !152
  %21 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %13, i64 0, i32 3
  store i8* %11, i8** %21, align 8, !tbaa !142
  %22 = trunc i32 %4 to i8
  store i8 %22, i8* %15, align 8, !tbaa !168
  %23 = trunc i32 %5 to i8
  store i8 %23, i8* %16, align 1, !tbaa !163
  %24 = trunc i32 %6 to i16
  store i16 %24, i16* %17, align 2, !tbaa !133
  %25 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %13, i64 0, i32 5
  store i32 %7, i32* %25, align 4, !tbaa !157
  %26 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %13, i64 0, i32 6
  store i32 %8, i32* %26, align 8, !tbaa !177
  %27 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %13, i64 0, i32 7
  store i32 %9, i32* %27, align 4, !tbaa !165
  %28 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %13, i64 0, i32 8
  store i32 %10, i32* %28, align 8, !tbaa !140
  %29 = call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %14, i64 56) #12
  %30 = add nsw i32 %5, 7
  %31 = sdiv i32 %30, 8
  %32 = mul nsw i32 %31, %6
  %33 = sext i32 %32 to i64
  %34 = call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* %2, i64 %33) #12
  %35 = bitcast i32* %3 to i8*
  %36 = sext i32 %10 to i64
  %37 = shl nsw i64 %36, 2
  %38 = call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* %35, i64 %37) #12
  %39 = call i32 @halide_trace(i8* %0, %struct.halide_trace_event_t* nonnull %13) #12
  call void @llvm.lifetime.end.p0i8(i64 56, i8* nonnull %14) #10
  ret i32 %39
}

; Function Attrs: nounwind mustprogress
define linkonce zeroext i1 @_ZN6Halide7Runtime8Internal9ends_withEPKcS3_(i8* %0, i8* %1) local_unnamed_addr #0 {
  br label %3

3:                                                ; preds = %3, %2
  %4 = phi i8* [ %0, %2 ], [ %7, %3 ]
  %5 = load i8, i8* %4, align 1, !tbaa !14
  %6 = icmp eq i8 %5, 0
  %7 = getelementptr inbounds i8, i8* %4, i64 1
  br i1 %6, label %.preheader5, label %3, !llvm.loop !178

.preheader5:                                      ; preds = %.preheader5, %3
  %8 = phi i8* [ %11, %.preheader5 ], [ %1, %3 ]
  %9 = load i8, i8* %8, align 1, !tbaa !14
  %10 = icmp eq i8 %9, 0
  %11 = getelementptr inbounds i8, i8* %8, i64 1
  br i1 %10, label %12, label %.preheader5, !llvm.loop !179

12:                                               ; preds = %.preheader5
  %13 = icmp ne i8* %8, %1
  %14 = icmp ne i8* %4, %0
  %15 = and i1 %14, %13
  br i1 %15, label %.preheader, label %.loopexit

.preheader:                                       ; preds = %25, %12
  %16 = phi i8* [ %18, %25 ], [ %4, %12 ]
  %17 = phi i8* [ %19, %25 ], [ %8, %12 ]
  %18 = getelementptr inbounds i8, i8* %16, i64 -1
  %19 = getelementptr inbounds i8, i8* %17, i64 -1
  %20 = icmp ne i8* %19, %1
  %21 = icmp ne i8* %18, %0
  %22 = and i1 %21, %20
  %23 = load i8, i8* %18, align 1, !tbaa !14
  %24 = load i8, i8* %19, align 1, !tbaa !14
  br i1 %22, label %25, label %.loopexit, !llvm.loop !180

25:                                               ; preds = %.preheader
  %26 = icmp eq i8 %23, %24
  br i1 %26, label %.preheader, label %.loopexit4

.loopexit:                                        ; preds = %.preheader, %12
  %27 = phi i8 [ 0, %12 ], [ %24, %.preheader ]
  %28 = phi i8 [ 0, %12 ], [ %23, %.preheader ]
  %29 = icmp eq i8 %28, %27
  br label %.loopexit4

.loopexit4:                                       ; preds = %.loopexit, %25
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
  %10 = alloca [129 x i8], align 1
  %11 = alloca [8 x i32], align 4
  %12 = alloca [4 x i32], align 4
  %13 = alloca [2 x i32], align 4
  %14 = alloca [2 x i32], align 4
  %15 = alloca [5 x i32], align 4
  %16 = alloca [4096 x i8], align 1
  %17 = alloca [4 x i32], align 4
  %18 = alloca i64, align 8
  %19 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 2
  %20 = load i8*, i8** %19, align 8, !tbaa !181
  %21 = icmp eq i8* %20, null
  br i1 %21, label %22, label %27

22:                                               ; preds = %4
  %23 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 0
  %24 = load i64, i64* %23, align 8, !tbaa !183
  %25 = icmp eq i64 %24, 0
  br i1 %25, label %26, label %27

26:                                               ; preds = %22
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.35, i64 0, i64 0)) #12
  br label %586

27:                                               ; preds = %22, %4
  %28 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 5
  %29 = load i32, i32* %28, align 4, !tbaa !184
  %30 = icmp sgt i32 %29, 4
  br i1 %30, label %31, label %32

31:                                               ; preds = %27
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.1.36, i64 0, i64 0)) #12
  br label %586

32:                                               ; preds = %27
  %33 = tail call i32 @halide_copy_to_host(i8* %0, %struct.halide_buffer_t* nonnull %3) #12
  %34 = tail call i8* @fopen(i8* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2.37, i64 0, i64 0)) #12
  %35 = icmp eq i8* %34, null
  br i1 %35, label %586, label %36

36:                                               ; preds = %32
  %37 = bitcast [4 x %struct.halide_dimension_t]* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %37) #10
  %38 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, i64 0, i32 0
  %39 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, i64 0, i32 1
  %40 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, i64 1, i32 0
  %41 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, i64 1, i32 1
  %42 = bitcast [4 x %struct.halide_dimension_t]* %5 to <8 x i32>*
  store <8 x i32> zeroinitializer, <8 x i32>* %42, align 4, !tbaa !76
  %43 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, i64 2, i32 0
  %44 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, i64 2, i32 1
  %45 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, i64 3, i32 0
  %46 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, i64 3, i32 1
  %47 = bitcast i32* %43 to <8 x i32>*
  store <8 x i32> zeroinitializer, <8 x i32>* %47, align 4, !tbaa !76
  %48 = load i32, i32* %28, align 4, !tbaa !184
  %49 = icmp sgt i32 %48, 0
  br i1 %49, label %50, label %59

50:                                               ; preds = %36
  %51 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 6
  %52 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %51, align 8, !tbaa !185
  %53 = zext i32 %48 to i64
  %54 = add nsw i64 %53, -1
  %55 = icmp ult i64 %54, 3
  %56 = select i1 %55, i64 %53, i64 4
  br label %62

57:                                               ; preds = %62
  %58 = icmp slt i32 %48, 4
  br i1 %58, label %59, label %.loopexit32

59:                                               ; preds = %57, %36
  %60 = phi i64 [ %72, %57 ], [ 1, %36 ]
  %61 = sext i32 %48 to i64
  br label %81

62:                                               ; preds = %62, %50
  %63 = phi i64 [ 0, %50 ], [ %73, %62 ]
  %64 = phi i64 [ 1, %50 ], [ %72, %62 ]
  %65 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %52, i64 %63
  %66 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, i64 %63
  %67 = bitcast %struct.halide_dimension_t* %66 to i8*
  %68 = bitcast %struct.halide_dimension_t* %65 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %67, i8* nonnull align 4 dereferenceable(16) %68, i64 16, i1 false), !tbaa.struct !186
  %69 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, i64 %63, i32 1
  %70 = load i32, i32* %69, align 4, !tbaa !187
  %71 = zext i32 %70 to i64
  %72 = mul i64 %64, %71
  %73 = add nuw nsw i64 %63, 1
  %exitcond.not = icmp eq i64 %73, %56
  br i1 %exitcond.not, label %57, label %62, !llvm.loop !189

.loopexit32:                                      ; preds = %81, %57
  %74 = phi i64 [ %72, %57 ], [ %60, %81 ]
  %75 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 4, i32 1
  %76 = load i8, i8* %75, align 1, !tbaa !139
  %77 = zext i8 %76 to i32
  %78 = add nuw nsw i32 %77, 7
  %79 = lshr i32 %78, 3
  %80 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal9ends_withEPKcS3_(i8* %1, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3.38, i64 0, i64 0)) #13
  br i1 %80, label %91, label %89

81:                                               ; preds = %81, %59
  %82 = phi i64 [ %61, %59 ], [ %86, %81 ]
  %83 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, i64 %82, i32 0
  store i32 0, i32* %83, align 4, !tbaa !190
  %84 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, i64 %82, i32 1
  store i32 1, i32* %84, align 4, !tbaa !187
  %85 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, i64 %82, i32 2
  store i32 0, i32* %85, align 4, !tbaa !191
  %86 = add nsw i64 %82, 1
  %87 = trunc i64 %86 to i32
  %88 = icmp eq i32 %87, 4
  br i1 %88, label %.loopexit32, label %81, !llvm.loop !192

89:                                               ; preds = %.loopexit32
  %90 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal9ends_withEPKcS3_(i8* %1, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4.39, i64 0, i64 0)) #13
  br i1 %90, label %91, label %227

91:                                               ; preds = %89, %.loopexit32
  %92 = load i32, i32* %39, align 4, !tbaa !187
  %93 = load i32, i32* %41, align 4, !tbaa !187
  %94 = load i32, i32* %46, align 4, !tbaa !187
  %95 = icmp ult i32 %94, 2
  %96 = load i32, i32* %44, align 4, !tbaa !187
  %97 = icmp slt i32 %96, 5
  %98 = and i1 %95, %97
  %99 = select i1 %98, i32 1, i32 %96
  %100 = select i1 %98, i32 %96, i32 %94
  %101 = bitcast %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 210, i8* nonnull %101) #10
  %102 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 0
  store i16 18761, i16* %102, align 2, !tbaa !193
  %103 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 1
  store i16 42, i16* %103, align 2, !tbaa !195
  %104 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 2
  store i32 8, i32* %104, align 2, !tbaa !196
  %105 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 3
  store i16 15, i16* %105, align 2, !tbaa !197
  %106 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 0, i32 0
  store i16 256, i16* %106, align 2, !tbaa !198
  %107 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 0, i32 1
  store i16 4, i16* %107, align 2, !tbaa !200
  %108 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 0, i32 2
  store i32 1, i32* %108, align 2, !tbaa !201
  %109 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 0, i32 3, i32 0
  store i32 %92, i32* %109, align 2, !tbaa !14
  %110 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 1, i32 0
  store i16 257, i16* %110, align 2, !tbaa !198
  %111 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 1, i32 1
  store i16 4, i16* %111, align 2, !tbaa !200
  %112 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 1, i32 2
  store i32 1, i32* %112, align 2, !tbaa !201
  %113 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 1, i32 3, i32 0
  store i32 %93, i32* %113, align 2, !tbaa !14
  %114 = trunc i32 %78 to i16
  %115 = and i16 %114, 504
  %116 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 2, i32 0
  store i16 258, i16* %116, align 2, !tbaa !198
  %117 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 2, i32 1
  store i16 3, i16* %117, align 2, !tbaa !200
  %118 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 2, i32 2
  store i32 1, i32* %118, align 2, !tbaa !201
  %119 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 2, i32 3
  %120 = bitcast %"class.Halide::Runtime::Internal::SharedExclusiveSpinLock"* %119 to i16*
  store i16 %115, i16* %120, align 2, !tbaa !14
  %121 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 3, i32 0
  store i16 259, i16* %121, align 2, !tbaa !198
  %122 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 3, i32 1
  store i16 3, i16* %122, align 2, !tbaa !200
  %123 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 3, i32 2
  store i32 1, i32* %123, align 2, !tbaa !201
  %124 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 3, i32 3
  %125 = bitcast %"class.Halide::Runtime::Internal::SharedExclusiveSpinLock"* %124 to i16*
  store i16 1, i16* %125, align 2, !tbaa !14
  %126 = icmp sgt i32 %100, 2
  %127 = select i1 %126, i16 2, i16 1
  %128 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 4, i32 0
  store i16 262, i16* %128, align 2, !tbaa !198
  %129 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 4, i32 1
  store i16 3, i16* %129, align 2, !tbaa !200
  %130 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 4, i32 2
  store i32 1, i32* %130, align 2, !tbaa !201
  %131 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 4, i32 3
  %132 = bitcast %"class.Halide::Runtime::Internal::SharedExclusiveSpinLock"* %131 to i16*
  store i16 %127, i16* %132, align 2, !tbaa !14
  %133 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 5, i32 0
  store i16 273, i16* %133, align 2, !tbaa !198
  %134 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 5, i32 1
  store i16 4, i16* %134, align 2, !tbaa !200
  %135 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 5, i32 2
  store i32 %100, i32* %135, align 2, !tbaa !201
  %136 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 5, i32 3, i32 0
  store i32 210, i32* %136, align 2, !tbaa !14
  %137 = trunc i32 %100 to i16
  %138 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 6, i32 0
  store i16 277, i16* %138, align 2, !tbaa !198
  %139 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 6, i32 1
  store i16 3, i16* %139, align 2, !tbaa !200
  %140 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 6, i32 2
  store i32 1, i32* %140, align 2, !tbaa !201
  %141 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 6, i32 3
  %142 = bitcast %"class.Halide::Runtime::Internal::SharedExclusiveSpinLock"* %141 to i16*
  store i16 %137, i16* %142, align 2, !tbaa !14
  %143 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 7, i32 0
  store i16 278, i16* %143, align 2, !tbaa !198
  %144 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 7, i32 1
  store i16 4, i16* %144, align 2, !tbaa !200
  %145 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 7, i32 2
  store i32 1, i32* %145, align 2, !tbaa !201
  %146 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 7, i32 3, i32 0
  store i32 %93, i32* %146, align 2, !tbaa !14
  %147 = icmp eq i32 %100, 1
  %148 = trunc i64 %74 to i32
  %149 = mul i32 %79, %148
  %150 = shl i32 %100, 2
  %151 = add i32 %150, 210
  %152 = select i1 %147, i32 %149, i32 %151
  %153 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 8, i32 0
  store i16 279, i16* %153, align 2
  %154 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 8, i32 1
  store i16 4, i16* %154, align 2
  %155 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 8, i32 2
  store i32 %100, i32* %155, align 2
  %156 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 8, i32 3, i32 0
  store i32 %152, i32* %156, align 2
  %157 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 9, i32 0
  store i16 282, i16* %157, align 2, !tbaa !198
  %158 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 9, i32 1
  store i16 5, i16* %158, align 2, !tbaa !200
  %159 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 9, i32 2
  store i32 1, i32* %159, align 2, !tbaa !201
  %160 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 9, i32 3, i32 0
  store i32 194, i32* %160, align 2, !tbaa !14
  %161 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 10, i32 0
  store i16 283, i16* %161, align 2, !tbaa !198
  %162 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 10, i32 1
  store i16 5, i16* %162, align 2, !tbaa !200
  %163 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 10, i32 2
  store i32 1, i32* %163, align 2, !tbaa !201
  %164 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 10, i32 3, i32 0
  store i32 202, i32* %164, align 2, !tbaa !14
  %165 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 11, i32 0
  store i16 284, i16* %165, align 2, !tbaa !198
  %166 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 11, i32 1
  store i16 3, i16* %166, align 2, !tbaa !200
  %167 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 11, i32 2
  store i32 1, i32* %167, align 2, !tbaa !201
  %168 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 11, i32 3
  %169 = bitcast %"class.Halide::Runtime::Internal::SharedExclusiveSpinLock"* %168 to i16*
  store i16 2, i16* %169, align 2, !tbaa !14
  %170 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 12, i32 0
  store i16 296, i16* %170, align 2, !tbaa !198
  %171 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 12, i32 1
  store i16 3, i16* %171, align 2, !tbaa !200
  %172 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 12, i32 2
  store i32 1, i32* %172, align 2, !tbaa !201
  %173 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 12, i32 3
  %174 = bitcast %"class.Halide::Runtime::Internal::SharedExclusiveSpinLock"* %173 to i16*
  store i16 1, i16* %174, align 2, !tbaa !14
  %175 = sext i32 %2 to i64
  %176 = getelementptr inbounds [10 x i16], [10 x i16]* @_ZN6Halide7Runtime8Internal30pixel_type_to_tiff_sample_typeE, i64 0, i64 %175
  %177 = load i16, i16* %176, align 2, !tbaa !169
  %178 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 13, i32 0
  store i16 339, i16* %178, align 2, !tbaa !198
  %179 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 13, i32 1
  store i16 3, i16* %179, align 2, !tbaa !200
  %180 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 13, i32 2
  store i32 1, i32* %180, align 2, !tbaa !201
  %181 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 13, i32 3
  %182 = bitcast %"class.Halide::Runtime::Internal::SharedExclusiveSpinLock"* %181 to i16*
  store i16 %177, i16* %182, align 2, !tbaa !14
  %183 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 14, i32 0
  store i16 -32539, i16* %183, align 2, !tbaa !198
  %184 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 14, i32 1
  store i16 4, i16* %184, align 2, !tbaa !200
  %185 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 14, i32 2
  store i32 1, i32* %185, align 2, !tbaa !201
  %186 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 14, i32 3, i32 0
  store i32 %99, i32* %186, align 2, !tbaa !14
  %187 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 5
  %188 = bitcast i32* %187 to <4 x i32>*
  store <4 x i32> <i32 0, i32 1, i32 1, i32 1>, <4 x i32>* %188, align 2, !tbaa !76
  %189 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 7, i64 1
  store i32 1, i32* %189, align 2, !tbaa !76
  %190 = call i64 @fwrite(i8* nonnull %101, i64 210, i64 1, i8* nonnull %34) #12
  %191 = icmp eq i64 %190, 0
  br i1 %191, label %225, label %192

192:                                              ; preds = %91
  %193 = icmp sgt i32 %100, 1
  br i1 %193, label %194, label %224

194:                                              ; preds = %192
  %195 = bitcast i32* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %195) #10
  %196 = shl i32 %100, 3
  %197 = add i32 %196, 210
  store i32 %197, i32* %7, align 4, !tbaa !76
  %198 = mul i32 %99, %79
  %199 = load i32, i32* %39, align 4
  %200 = load i32, i32* %41, align 4
  %201 = mul i32 %198, %199
  %202 = mul i32 %201, %200
  br label %203

203:                                              ; preds = %207, %194
  %204 = phi i32 [ 0, %194 ], [ %210, %207 ]
  %205 = call i64 @fwrite(i8* nonnull %195, i64 4, i64 1, i8* nonnull %34) #12
  %206 = icmp eq i64 %205, 0
  br i1 %206, label %.loopexit26, label %207

207:                                              ; preds = %203
  %208 = load i32, i32* %7, align 4, !tbaa !76
  %209 = add nsw i32 %202, %208
  store i32 %209, i32* %7, align 4, !tbaa !76
  %210 = add nuw nsw i32 %204, 1
  %211 = icmp eq i32 %210, %100
  br i1 %211, label %212, label %203, !llvm.loop !202

212:                                              ; preds = %207
  %213 = bitcast i32* %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %213) #10
  store i32 %202, i32* %8, align 4, !tbaa !76
  br label %216

214:                                              ; preds = %216
  %215 = icmp eq i32 %220, %100
  br i1 %215, label %223, label %216, !llvm.loop !203

216:                                              ; preds = %214, %212
  %217 = phi i32 [ %220, %214 ], [ 0, %212 ]
  %218 = call i64 @fwrite(i8* nonnull %213, i64 4, i64 1, i8* nonnull %34) #12
  %219 = icmp eq i64 %218, 0
  %220 = add nuw nsw i32 %217, 1
  br i1 %219, label %221, label %214

221:                                              ; preds = %216
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %213) #10
  br label %.loopexit26

.loopexit26:                                      ; preds = %221, %203
  %222 = phi i32 [ -5, %221 ], [ -4, %203 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %195) #10
  br label %225

223:                                              ; preds = %214
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %213) #10
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %195) #10
  br label %224

224:                                              ; preds = %223, %192
  call void @llvm.lifetime.end.p0i8(i64 210, i8* nonnull %101) #10
  br label %418

225:                                              ; preds = %.loopexit26, %91
  %226 = phi i32 [ -3, %91 ], [ %222, %.loopexit26 ]
  call void @llvm.lifetime.end.p0i8(i64 210, i8* nonnull %101) #10
  br label %583

227:                                              ; preds = %89
  %228 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal9ends_withEPKcS3_(i8* %1, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5.40, i64 0, i64 0)) #13
  br i1 %228, label %.preheader31, label %405

.preheader31:                                     ; preds = %.preheader31, %227
  %229 = phi i8* [ %232, %.preheader31 ], [ %1, %227 ]
  %230 = load i8, i8* %229, align 1, !tbaa !14
  %231 = icmp eq i8 %230, 0
  %232 = getelementptr inbounds i8, i8* %229, i64 1
  br i1 %231, label %.preheader30, label %.preheader31, !llvm.loop !204

233:                                              ; preds = %.preheader30
  %234 = ptrtoint i8* %237 to i64
  %235 = ptrtoint i8* %1 to i64
  %236 = sub i64 %235, %234
  br label %241

.preheader30:                                     ; preds = %.preheader30, %.preheader31
  %237 = phi i8* [ %238, %.preheader30 ], [ %229, %.preheader31 ]
  %238 = getelementptr inbounds i8, i8* %237, i64 -1
  %239 = load i8, i8* %238, align 1, !tbaa !14
  %240 = icmp eq i8 %239, 46
  br i1 %240, label %233, label %.preheader30, !llvm.loop !205

241:                                              ; preds = %245, %233
  %242 = phi i64 [ %246, %245 ], [ -1, %233 ]
  %243 = getelementptr inbounds i8, i8* %237, i64 %242
  %244 = icmp eq i8* %243, %1
  br i1 %244, label %250, label %245

245:                                              ; preds = %241
  %246 = add nsw i64 %242, -1
  %247 = getelementptr inbounds i8, i8* %237, i64 %246
  %248 = load i8, i8* %247, align 1, !tbaa !14
  %249 = icmp eq i8 %248, 47
  br i1 %249, label %250, label %241, !llvm.loop !206

250:                                              ; preds = %245, %241
  %251 = phi i64 [ %236, %241 ], [ %242, %245 ]
  %252 = trunc i64 %251 to i32
  %253 = xor i32 %252, -1
  %254 = getelementptr inbounds [256 x i8], [256 x i8]* %9, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 256, i8* nonnull %254) #10
  %255 = icmp eq i64 %251, -1
  br i1 %255, label %259, label %.preheader29

256:                                              ; preds = %.preheader29
  %257 = getelementptr inbounds [256 x i8], [256 x i8]* %9, i64 0, i64 256
  %258 = icmp ult i8* %267, %257
  br i1 %258, label %259, label %.loopexit28

259:                                              ; preds = %256, %250
  %260 = phi i8* [ %267, %256 ], [ %254, %250 ]
  %261 = getelementptr inbounds [256 x i8], [256 x i8]* %9, i64 1, i64 0
  br label %269

.preheader29:                                     ; preds = %.preheader29, %250
  %262 = phi i8* [ %267, %.preheader29 ], [ %254, %250 ]
  %263 = phi i64 [ %265, %.preheader29 ], [ %251, %250 ]
  %264 = getelementptr inbounds i8, i8* %237, i64 %263
  %265 = add nuw nsw i64 %263, 1
  %266 = load i8, i8* %264, align 1, !tbaa !14
  %267 = getelementptr inbounds i8, i8* %262, i64 1
  store i8 %266, i8* %262, align 1, !tbaa !14
  %268 = icmp eq i64 %265, -1
  br i1 %268, label %256, label %.preheader29, !llvm.loop !207

269:                                              ; preds = %269, %259
  %270 = phi i8* [ %271, %269 ], [ %260, %259 ]
  %271 = getelementptr inbounds i8, i8* %270, i64 1
  store i8 0, i8* %270, align 1, !tbaa !14
  %272 = icmp eq i8* %271, %261
  br i1 %272, label %.loopexit28, label %269, !llvm.loop !208

.loopexit28:                                      ; preds = %269, %256
  %273 = sub i32 6, %252
  %274 = and i32 %273, -8
  %275 = getelementptr inbounds [129 x i8], [129 x i8]* %10, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 129, i8* nonnull %275) #10
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(129) %275, i8* nonnull align 1 dereferenceable(129) getelementptr inbounds ([129 x i8], [129 x i8]* @__const.halide_debug_to_file.header, i64 0, i64 0), i64 129, i1 false)
  %276 = call i64 @fwrite(i8* nonnull %275, i64 128, i64 1, i8* nonnull %34) #12
  %277 = load i32, i32* %28, align 4, !tbaa !184
  %278 = icmp sgt i32 %277, 0
  br i1 %278, label %279, label %320

279:                                              ; preds = %.loopexit28
  %280 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 6
  %281 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %280, align 8, !tbaa !185
  %282 = zext i32 %277 to i64
  br label %283

283:                                              ; preds = %297, %279
  %284 = phi i64 [ 0, %279 ], [ %299, %297 ]
  %285 = phi i64 [ 0, %279 ], [ %298, %297 ]
  %286 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %281, i64 %284, i32 2
  %287 = load i32, i32* %286, align 4, !tbaa !191
  %288 = icmp sgt i32 %287, 0
  br i1 %288, label %289, label %297

289:                                              ; preds = %283
  %290 = zext i32 %287 to i64
  %291 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %281, i64 %284, i32 1
  %292 = load i32, i32* %291, align 4, !tbaa !187
  %293 = add nsw i32 %292, -1
  %294 = sext i32 %293 to i64
  %295 = mul nsw i64 %294, %290
  %296 = add nsw i64 %295, %285
  br label %297

297:                                              ; preds = %289, %283
  %298 = phi i64 [ %296, %289 ], [ %285, %283 ]
  %299 = add nuw nsw i64 %284, 1
  %300 = icmp eq i64 %299, %282
  br i1 %300, label %.preheader27, label %283, !llvm.loop !209

.preheader27:                                     ; preds = %314, %297
  %301 = phi i64 [ %316, %314 ], [ 0, %297 ]
  %302 = phi i64 [ %315, %314 ], [ 0, %297 ]
  %303 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %281, i64 %301, i32 2
  %304 = load i32, i32* %303, align 4, !tbaa !191
  %305 = icmp slt i32 %304, 0
  br i1 %305, label %306, label %314

306:                                              ; preds = %.preheader27
  %307 = sext i32 %304 to i64
  %308 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %281, i64 %301, i32 1
  %309 = load i32, i32* %308, align 4, !tbaa !187
  %310 = add nsw i32 %309, -1
  %311 = sext i32 %310 to i64
  %312 = mul nsw i64 %311, %307
  %313 = add nsw i64 %312, %302
  br label %314

314:                                              ; preds = %306, %.preheader27
  %315 = phi i64 [ %313, %306 ], [ %302, %.preheader27 ]
  %316 = add nuw nsw i64 %301, 1
  %317 = icmp eq i64 %316, %282
  br i1 %317, label %318, label %.preheader27, !llvm.loop !210

318:                                              ; preds = %314
  %319 = add nsw i64 %298, 1
  br label %320

320:                                              ; preds = %318, %.loopexit28
  %321 = phi i64 [ 1, %.loopexit28 ], [ %319, %318 ]
  %322 = phi i64 [ 0, %.loopexit28 ], [ %315, %318 ]
  %323 = sub nsw i64 %321, %322
  %324 = load i8, i8* %75, align 1, !tbaa !139
  %325 = zext i8 %324 to i64
  %326 = add nuw nsw i64 %325, 7
  %327 = lshr i64 %326, 3
  %328 = mul i64 %327, %323
  %329 = icmp ult i64 %328, 4294967296
  br i1 %329, label %331, label %330

330:                                              ; preds = %320
  call void @halide_error(i8* %0, i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.6.41, i64 0, i64 0)) #12
  call void @llvm.lifetime.end.p0i8(i64 129, i8* nonnull %275) #10
  call void @llvm.lifetime.end.p0i8(i64 256, i8* nonnull %254) #10
  br label %583

331:                                              ; preds = %320
  %332 = icmp sgt i32 %277, 2
  %333 = select i1 %332, i32 %277, i32 2
  %334 = bitcast [8 x i32]* %11 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %334) #10
  %335 = getelementptr inbounds [8 x i32], [8 x i32]* %11, i64 0, i64 0
  store i32 14, i32* %335, align 4, !tbaa !76
  %336 = getelementptr inbounds [8 x i32], [8 x i32]* %11, i64 0, i64 1
  %337 = shl i32 %333, 2
  %338 = add i32 %337, 4
  %339 = and i32 %338, -8
  %340 = trunc i64 %328 to i32
  %341 = add i32 %274, 40
  %342 = add i32 %341, %339
  %343 = add i32 %342, %340
  store i32 %343, i32* %336, align 4, !tbaa !76
  %344 = getelementptr inbounds [8 x i32], [8 x i32]* %11, i64 0, i64 2
  store i32 6, i32* %344, align 4, !tbaa !76
  %345 = getelementptr inbounds [8 x i32], [8 x i32]* %11, i64 0, i64 3
  store i32 8, i32* %345, align 4, !tbaa !76
  %346 = getelementptr inbounds [8 x i32], [8 x i32]* %11, i64 0, i64 4
  %347 = sext i32 %2 to i64
  %348 = getelementptr inbounds [10 x i8], [10 x i8]* @_ZN6Halide7Runtime8Internal31pixel_type_to_matlab_class_codeE, i64 0, i64 %347
  %349 = load i8, i8* %348, align 1, !tbaa !14
  %350 = zext i8 %349 to i32
  store i32 %350, i32* %346, align 4, !tbaa !76
  %351 = getelementptr inbounds [8 x i32], [8 x i32]* %11, i64 0, i64 5
  store i32 1, i32* %351, align 4, !tbaa !76
  %352 = getelementptr inbounds [8 x i32], [8 x i32]* %11, i64 0, i64 6
  store i32 5, i32* %352, align 4, !tbaa !76
  %353 = getelementptr inbounds [8 x i32], [8 x i32]* %11, i64 0, i64 7
  store i32 %337, i32* %353, align 4, !tbaa !76
  %354 = call i64 @fwrite(i8* nonnull %334, i64 32, i64 1, i8* nonnull %34) #12
  %355 = icmp eq i64 %354, 0
  br i1 %355, label %400, label %356

356:                                              ; preds = %331
  %357 = bitcast [4 x i32]* %12 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %357) #10
  %358 = getelementptr inbounds [4 x i32], [4 x i32]* %12, i64 0, i64 0
  %359 = load i32, i32* %39, align 4, !tbaa !187
  store i32 %359, i32* %358, align 4, !tbaa !76
  %360 = getelementptr inbounds [4 x i32], [4 x i32]* %12, i64 0, i64 1
  %361 = load i32, i32* %41, align 4, !tbaa !187
  store i32 %361, i32* %360, align 4, !tbaa !76
  %362 = getelementptr inbounds [4 x i32], [4 x i32]* %12, i64 0, i64 2
  %363 = load i32, i32* %44, align 4, !tbaa !187
  store i32 %363, i32* %362, align 4, !tbaa !76
  %364 = getelementptr inbounds [4 x i32], [4 x i32]* %12, i64 0, i64 3
  %365 = load i32, i32* %46, align 4, !tbaa !187
  store i32 %365, i32* %364, align 4, !tbaa !76
  %366 = sext i32 %339 to i64
  %367 = call i64 @fwrite(i8* nonnull %357, i64 %366, i64 1, i8* nonnull %34) #12
  %368 = icmp eq i64 %367, 0
  br i1 %368, label %396, label %369

369:                                              ; preds = %356
  %370 = bitcast [2 x i32]* %13 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %370) #10
  %371 = getelementptr inbounds [2 x i32], [2 x i32]* %13, i64 0, i64 0
  store i32 1, i32* %371, align 4, !tbaa !76
  %372 = getelementptr inbounds [2 x i32], [2 x i32]* %13, i64 0, i64 1
  store i32 %253, i32* %372, align 4, !tbaa !76
  %373 = call i64 @fwrite(i8* nonnull %370, i64 8, i64 1, i8* nonnull %34) #12
  %374 = icmp eq i64 %373, 0
  br i1 %374, label %392, label %375

375:                                              ; preds = %369
  %376 = zext i32 %274 to i64
  %377 = call i64 @fwrite(i8* nonnull %254, i64 %376, i64 1, i8* nonnull %34) #12
  %378 = icmp eq i64 %377, 0
  br i1 %378, label %392, label %379

379:                                              ; preds = %375
  %380 = add i32 %340, 7
  %381 = and i32 %380, 7
  %382 = xor i32 %381, 7
  %383 = bitcast [2 x i32]* %14 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %383) #10
  %384 = getelementptr inbounds [2 x i32], [2 x i32]* %14, i64 0, i64 0
  %385 = getelementptr inbounds [10 x i8], [10 x i8]* @_ZN6Halide7Runtime8Internal30pixel_type_to_matlab_type_codeE, i64 0, i64 %347
  %386 = load i8, i8* %385, align 1, !tbaa !14
  %387 = zext i8 %386 to i32
  store i32 %387, i32* %384, align 4, !tbaa !76
  %388 = getelementptr inbounds [2 x i32], [2 x i32]* %14, i64 0, i64 1
  store i32 %340, i32* %388, align 4, !tbaa !76
  %389 = call i64 @fwrite(i8* nonnull %383, i64 8, i64 1, i8* nonnull %34) #12
  %390 = icmp eq i64 %389, 0
  %391 = zext i1 %390 to i32
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %383) #10
  br label %392

392:                                              ; preds = %379, %375, %369
  %393 = phi i32 [ %382, %379 ], [ 0, %369 ], [ 0, %375 ]
  %394 = phi i32 [ %391, %379 ], [ 1, %369 ], [ 1, %375 ]
  %395 = phi i32 [ -11, %379 ], [ -9, %369 ], [ -10, %375 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %370) #10
  br label %396

396:                                              ; preds = %392, %356
  %397 = phi i32 [ %393, %392 ], [ 0, %356 ]
  %398 = phi i32 [ %394, %392 ], [ 1, %356 ]
  %399 = phi i32 [ %395, %392 ], [ -8, %356 ]
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %357) #10
  br label %400

400:                                              ; preds = %396, %331
  %401 = phi i32 [ %397, %396 ], [ 0, %331 ]
  %402 = phi i32 [ %398, %396 ], [ 1, %331 ]
  %403 = phi i32 [ %399, %396 ], [ -7, %331 ]
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %334) #10
  call void @llvm.lifetime.end.p0i8(i64 129, i8* nonnull %275) #10
  call void @llvm.lifetime.end.p0i8(i64 256, i8* nonnull %254) #10
  %404 = icmp eq i32 %402, 0
  br i1 %404, label %418, label %583

405:                                              ; preds = %227
  %406 = bitcast [5 x i32]* %15 to i8*
  call void @llvm.lifetime.start.p0i8(i64 20, i8* nonnull %406) #10
  %407 = getelementptr inbounds [5 x i32], [5 x i32]* %15, i64 0, i64 0
  %408 = load i32, i32* %39, align 4, !tbaa !187
  store i32 %408, i32* %407, align 4, !tbaa !76
  %409 = getelementptr inbounds [5 x i32], [5 x i32]* %15, i64 0, i64 1
  %410 = load i32, i32* %41, align 4, !tbaa !187
  store i32 %410, i32* %409, align 4, !tbaa !76
  %411 = getelementptr inbounds [5 x i32], [5 x i32]* %15, i64 0, i64 2
  %412 = load i32, i32* %44, align 4, !tbaa !187
  store i32 %412, i32* %411, align 4, !tbaa !76
  %413 = getelementptr inbounds [5 x i32], [5 x i32]* %15, i64 0, i64 3
  %414 = load i32, i32* %46, align 4, !tbaa !187
  store i32 %414, i32* %413, align 4, !tbaa !76
  %415 = getelementptr inbounds [5 x i32], [5 x i32]* %15, i64 0, i64 4
  store i32 %2, i32* %415, align 4, !tbaa !76
  %416 = call i64 @fwrite(i8* nonnull %406, i64 20, i64 1, i8* nonnull %34) #12
  %417 = icmp eq i64 %416, 0
  call void @llvm.lifetime.end.p0i8(i64 20, i8* nonnull %406) #10
  br i1 %417, label %583, label %418

418:                                              ; preds = %405, %400, %224
  %419 = phi i32 [ %401, %400 ], [ 0, %405 ], [ 0, %224 ]
  %420 = getelementptr inbounds [4096 x i8], [4096 x i8]* %16, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 4096, i8* nonnull %420) #10
  %421 = udiv i32 4096, %79
  %422 = load i32, i32* %46, align 4, !tbaa !187
  %423 = icmp sgt i32 %422, 0
  br i1 %423, label %424, label %570

424:                                              ; preds = %418
  %425 = load i32, i32* %45, align 4, !tbaa !190
  %426 = bitcast [4 x i32]* %17 to i8*
  %427 = getelementptr inbounds [4 x i32], [4 x i32]* %17, i64 0, i64 0
  %428 = getelementptr inbounds [4 x i32], [4 x i32]* %17, i64 0, i64 1
  %429 = getelementptr inbounds [4 x i32], [4 x i32]* %17, i64 0, i64 2
  %430 = getelementptr inbounds [4 x i32], [4 x i32]* %17, i64 0, i64 3
  %431 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 6
  %432 = zext i32 %79 to i64
  %433 = mul nuw nsw i32 %421, %79
  %434 = zext i32 %433 to i64
  %435 = load i32, i32* %43, align 4, !tbaa !190
  %436 = load i32, i32* %44, align 4, !tbaa !187
  %437 = load i32, i32* %40, align 4
  %438 = load i32, i32* %41, align 4
  %.pre = load i32, i32* %39, align 4
  %439 = load i32, i32* %38, align 4
  %440 = load i32, i32* %39, align 4
  %441 = load i32, i32* %38, align 4
  %442 = add nsw i32 %441, %440
  %.pre64 = load i32, i32* %41, align 4
  %.pre65 = load i32, i32* %40, align 4
  %443 = load i32, i32* %44, align 4
  %444 = load i32, i32* %43, align 4
  %445 = load i32, i32* %46, align 4
  %446 = load i32, i32* %45, align 4
  br label %447

447:                                              ; preds = %552, %424
  %448 = phi i32 [ %425, %424 ], [ %553, %552 ]
  %449 = phi i32 [ %422, %424 ], [ %554, %552 ]
  %450 = phi i32 [ %435, %424 ], [ %555, %552 ]
  %451 = phi i32 [ %436, %424 ], [ %556, %552 ]
  %452 = phi i32 [ %436, %424 ], [ %557, %552 ]
  %453 = phi i32 [ %435, %424 ], [ %558, %552 ]
  %454 = phi i32 [ %425, %424 ], [ %560, %552 ]
  %455 = phi i32 [ 0, %424 ], [ %559, %552 ]
  %456 = icmp sgt i32 %452, 0
  br i1 %456, label %457, label %552

457:                                              ; preds = %541, %447
  %458 = phi i32 [ %542, %541 ], [ %437, %447 ]
  %459 = phi i32 [ %543, %541 ], [ %438, %447 ]
  %460 = phi i32 [ %544, %541 ], [ %450, %447 ]
  %461 = phi i32 [ %545, %541 ], [ %451, %447 ]
  %462 = phi i32 [ %546, %541 ], [ %438, %447 ]
  %463 = phi i32 [ %547, %541 ], [ %437, %447 ]
  %464 = phi i32 [ %549, %541 ], [ %453, %447 ]
  %465 = phi i32 [ %548, %541 ], [ %455, %447 ]
  %466 = icmp sgt i32 %462, 0
  br i1 %466, label %.preheader25, label %541

.preheader25:                                     ; preds = %.loopexit24, %457
  %467 = phi i32 [ %534, %.loopexit24 ], [ %458, %457 ]
  %468 = phi i32 [ %535, %.loopexit24 ], [ %459, %457 ]
  %469 = phi i32 [ %536, %.loopexit24 ], [ %.pre, %457 ]
  %470 = phi i32 [ %538, %.loopexit24 ], [ %463, %457 ]
  %471 = phi i32 [ %537, %.loopexit24 ], [ %465, %457 ]
  %472 = icmp sgt i32 %469, 0
  br i1 %472, label %473, label %.loopexit24

473:                                              ; preds = %530, %.preheader25
  %474 = phi i32 [ %532, %530 ], [ %439, %.preheader25 ]
  %475 = phi i32 [ %531, %530 ], [ %471, %.preheader25 ]
  %476 = add nsw i32 %475, 1
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %426) #10
  store i32 %474, i32* %427, align 4, !tbaa !76
  store i32 %470, i32* %428, align 4, !tbaa !76
  store i32 %464, i32* %429, align 4, !tbaa !76
  store i32 %454, i32* %430, align 4, !tbaa !76
  %477 = load i32, i32* %28, align 4, !tbaa !184
  %478 = icmp sgt i32 %477, 0
  br i1 %478, label %479, label %.loopexit

479:                                              ; preds = %473
  %480 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %431, align 8, !tbaa !185
  %481 = zext i32 %477 to i64
  %482 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %480, i64 0, i32 2
  %483 = load i32, i32* %482, align 4, !tbaa !191
  %484 = sext i32 %483 to i64
  %485 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %480, i64 0, i32 0
  %486 = load i32, i32* %485, align 4, !tbaa !190
  %487 = sub nsw i32 %474, %486
  %488 = sext i32 %487 to i64
  %489 = mul nsw i64 %488, %484
  %490 = icmp eq i32 %477, 1
  br i1 %490, label %.loopexit, label %.preheader.preheader, !llvm.loop !211

.preheader.preheader:                             ; preds = %479
  %491 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %480, i64 1, i32 2
  %492 = load i32, i32* %491, align 4, !tbaa !191
  %493 = sext i32 %492 to i64
  %494 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %480, i64 1, i32 0
  %495 = load i32, i32* %494, align 4, !tbaa !190
  %496 = sub nsw i32 %470, %495
  %497 = sext i32 %496 to i64
  %498 = mul nsw i64 %497, %493
  %499 = add nsw i64 %498, %489
  %500 = icmp eq i32 %477, 2
  br i1 %500, label %.loopexit, label %.preheader..preheader_crit_edge, !llvm.loop !211

.preheader..preheader_crit_edge:                  ; preds = %.preheader..preheader_crit_edge, %.preheader.preheader
  %501 = phi i64 [ %512, %.preheader..preheader_crit_edge ], [ 2, %.preheader.preheader ]
  %502 = phi i64 [ %511, %.preheader..preheader_crit_edge ], [ %499, %.preheader.preheader ]
  %.phi.trans.insert = getelementptr inbounds [4 x i32], [4 x i32]* %17, i64 0, i64 %501
  %.pre63 = load i32, i32* %.phi.trans.insert, align 4, !tbaa !76
  %503 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %480, i64 %501, i32 2
  %504 = load i32, i32* %503, align 4, !tbaa !191
  %505 = sext i32 %504 to i64
  %506 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %480, i64 %501, i32 0
  %507 = load i32, i32* %506, align 4, !tbaa !190
  %508 = sub nsw i32 %.pre63, %507
  %509 = sext i32 %508 to i64
  %510 = mul nsw i64 %509, %505
  %511 = add nsw i64 %510, %502
  %512 = add nuw nsw i64 %501, 1
  %513 = icmp eq i64 %512, %481
  br i1 %513, label %.loopexit, label %.preheader..preheader_crit_edge, !llvm.loop !211

.loopexit:                                        ; preds = %.preheader..preheader_crit_edge, %.preheader.preheader, %479, %473
  %514 = phi i64 [ 0, %473 ], [ %489, %479 ], [ %499, %.preheader.preheader ], [ %511, %.preheader..preheader_crit_edge ]
  %515 = load i8*, i8** %19, align 8, !tbaa !181
  %516 = load i8, i8* %75, align 1, !tbaa !139
  %517 = zext i8 %516 to i64
  %518 = add nuw nsw i64 %517, 7
  %519 = lshr i64 %518, 3
  %520 = mul nsw i64 %519, %514
  %521 = getelementptr inbounds i8, i8* %515, i64 %520
  %522 = mul nsw i32 %475, %79
  %523 = sext i32 %522 to i64
  %524 = getelementptr inbounds [4096 x i8], [4096 x i8]* %16, i64 0, i64 %523
  %525 = call i8* @memcpy(i8* nonnull %524, i8* %521, i64 %432) #12
  %526 = icmp eq i32 %476, %421
  br i1 %526, label %527, label %530

527:                                              ; preds = %.loopexit
  %528 = call i64 @fwrite(i8* nonnull %420, i64 %434, i64 1, i8* nonnull %34) #12
  %529 = icmp eq i64 %528, 0
  br i1 %529, label %580, label %530

530:                                              ; preds = %527, %.loopexit
  %531 = phi i32 [ 0, %527 ], [ %476, %.loopexit ]
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %426) #10
  %532 = add nsw i32 %474, 1
  %533 = icmp slt i32 %532, %442
  br i1 %533, label %473, label %.loopexit24, !llvm.loop !212

.loopexit24:                                      ; preds = %530, %.preheader25
  %534 = phi i32 [ %467, %.preheader25 ], [ %.pre65, %530 ]
  %535 = phi i32 [ %468, %.preheader25 ], [ %.pre64, %530 ]
  %536 = phi i32 [ %469, %.preheader25 ], [ %440, %530 ]
  %537 = phi i32 [ %471, %.preheader25 ], [ %531, %530 ]
  %538 = add nsw i32 %470, 1
  %539 = add nsw i32 %534, %535
  %540 = icmp slt i32 %538, %539
  br i1 %540, label %.preheader25, label %541, !llvm.loop !213

541:                                              ; preds = %.loopexit24, %457
  %542 = phi i32 [ %458, %457 ], [ %534, %.loopexit24 ]
  %543 = phi i32 [ %459, %457 ], [ %535, %.loopexit24 ]
  %544 = phi i32 [ %460, %457 ], [ %444, %.loopexit24 ]
  %545 = phi i32 [ %461, %457 ], [ %443, %.loopexit24 ]
  %546 = phi i32 [ %462, %457 ], [ %535, %.loopexit24 ]
  %547 = phi i32 [ %463, %457 ], [ %534, %.loopexit24 ]
  %548 = phi i32 [ %465, %457 ], [ %537, %.loopexit24 ]
  %549 = add nsw i32 %464, 1
  %550 = add nsw i32 %545, %544
  %551 = icmp slt i32 %549, %550
  br i1 %551, label %457, label %552, !llvm.loop !214

552:                                              ; preds = %541, %447
  %553 = phi i32 [ %448, %447 ], [ %446, %541 ]
  %554 = phi i32 [ %449, %447 ], [ %445, %541 ]
  %555 = phi i32 [ %450, %447 ], [ %544, %541 ]
  %556 = phi i32 [ %451, %447 ], [ %545, %541 ]
  %557 = phi i32 [ %452, %447 ], [ %545, %541 ]
  %558 = phi i32 [ %453, %447 ], [ %544, %541 ]
  %559 = phi i32 [ %455, %447 ], [ %548, %541 ]
  %560 = add nsw i32 %454, 1
  %561 = add nsw i32 %554, %553
  %562 = icmp slt i32 %560, %561
  br i1 %562, label %447, label %563, !llvm.loop !215

563:                                              ; preds = %552
  %564 = icmp sgt i32 %559, 0
  br i1 %564, label %565, label %570

565:                                              ; preds = %563
  %566 = mul nsw i32 %559, %79
  %567 = sext i32 %566 to i64
  %568 = call i64 @fwrite(i8* nonnull %420, i64 %567, i64 1, i8* nonnull %34) #12
  %569 = icmp eq i64 %568, 0
  br i1 %569, label %581, label %570

570:                                              ; preds = %565, %563, %418
  %571 = bitcast i64* %18 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %571) #10
  store i64 0, i64* %18, align 8, !tbaa !113
  %572 = icmp eq i32 %419, 0
  br i1 %572, label %577, label %573

573:                                              ; preds = %570
  %574 = zext i32 %419 to i64
  %575 = call i64 @fwrite(i8* nonnull %571, i64 %574, i64 1, i8* nonnull %34) #12
  %576 = icmp eq i64 %575, 0
  br i1 %576, label %578, label %577

577:                                              ; preds = %573, %570
  br label %578

578:                                              ; preds = %577, %573
  %579 = phi i32 [ 0, %577 ], [ -16, %573 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %571) #10
  br label %581

580:                                              ; preds = %527
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %426) #10
  br label %581

581:                                              ; preds = %580, %578, %565
  %582 = phi i32 [ %579, %578 ], [ -14, %565 ], [ -13, %580 ]
  call void @llvm.lifetime.end.p0i8(i64 4096, i8* nonnull %420) #10
  br label %583

583:                                              ; preds = %581, %405, %400, %330, %225
  %584 = phi i32 [ %582, %581 ], [ %226, %225 ], [ %403, %400 ], [ -12, %405 ], [ -6, %330 ]
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %37) #10
  %585 = call i32 @fclose(i8* nonnull %34) #12
  br label %586

586:                                              ; preds = %583, %32, %31, %26
  %587 = phi i32 [ -1, %26 ], [ -1, %31 ], [ %584, %583 ], [ -2, %32 ]
  ret i32 %587
}

declare i64 @fwrite(i8*, i64, i64, i8*) local_unnamed_addr #1

; Function Attrs: nounwind mustprogress
define weak void @halide_cache_cleanup() #0 {
  tail call void @halide_memoization_cache_cleanup() #13
  ret void
}

; Function Attrs: nounwind mustprogress
define weak void @halide_memoization_cache_cleanup() local_unnamed_addr #0 {
  br label %2

1:                                                ; preds = %.loopexit
  store i64 0, i64* @_ZN6Halide7Runtime8Internal18current_cache_sizeE, align 8, !tbaa !113
  store %"struct.Halide::Runtime::Internal::CacheEntry"* null, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal18most_recently_usedE, align 8, !tbaa !10
  store %"struct.Halide::Runtime::Internal::CacheEntry"* null, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal19least_recently_usedE, align 8, !tbaa !10
  ret void

2:                                                ; preds = %.loopexit, %0
  %3 = phi i64 [ 0, %0 ], [ %12, %.loopexit ]
  %4 = getelementptr inbounds [256 x %"struct.Halide::Runtime::Internal::CacheEntry"*], [256 x %"struct.Halide::Runtime::Internal::CacheEntry"*]* @_ZN6Halide7Runtime8Internal13cache_entriesE, i64 0, i64 %3
  %5 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %4, align 8, !tbaa !10
  store %"struct.Halide::Runtime::Internal::CacheEntry"* null, %"struct.Halide::Runtime::Internal::CacheEntry"** %4, align 8, !tbaa !10
  %6 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %5, null
  br i1 %6, label %.loopexit, label %.preheader

.preheader:                                       ; preds = %.preheader, %2
  %7 = phi %"struct.Halide::Runtime::Internal::CacheEntry"* [ %9, %.preheader ], [ %5, %2 ]
  %8 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %7, i64 0, i32 0
  %9 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %8, align 8, !tbaa !216
  tail call void @_ZN6Halide7Runtime8Internal10CacheEntry7destroyEv(%"struct.Halide::Runtime::Internal::CacheEntry"* nonnull dereferenceable(96) %7) #13
  %10 = bitcast %"struct.Halide::Runtime::Internal::CacheEntry"* %7 to i8*
  tail call void @halide_free(i8* null, i8* nonnull %10) #12
  %11 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %9, null
  br i1 %11, label %.loopexit, label %.preheader, !llvm.loop !218

.loopexit:                                        ; preds = %.preheader, %2
  %12 = add nuw nsw i64 %3, 1
  %13 = icmp eq i64 %12, 256
  br i1 %13, label %1, label %2, !llvm.loop !219
}

; Function Attrs: nounwind mustprogress
define linkonce void @_ZN6Halide7Runtime8Internal10CacheEntry7destroyEv(%"struct.Halide::Runtime::Internal::CacheEntry"* nonnull dereferenceable(96) %0) local_unnamed_addr #0 align 2 {
  %2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %0, i64 0, i32 8
  %3 = load i32, i32* %2, align 8, !tbaa !220
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %.loopexit, label %5

5:                                                ; preds = %1
  %6 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %0, i64 0, i32 11
  br label %9

.loopexit:                                        ; preds = %9, %1
  %7 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %0, i64 0, i32 3
  %8 = load i8*, i8** %7, align 8, !tbaa !221
  tail call void @halide_free(i8* null, i8* %8) #12
  ret void

9:                                                ; preds = %9, %5
  %10 = phi i64 [ 0, %5 ], [ %19, %9 ]
  %11 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %6, align 8, !tbaa !222
  %12 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %11, i64 %10
  %13 = tail call i32 @halide_device_free(i8* null, %struct.halide_buffer_t* %12) #12
  %14 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %6, align 8, !tbaa !222
  %15 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %14, i64 %10, i32 2
  %16 = load i8*, i8** %15, align 8, !tbaa !181
  %17 = tail call %"struct.Halide::Runtime::Internal::CacheBlockHeader"* @_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh(i8* %16) #13
  %18 = bitcast %"struct.Halide::Runtime::Internal::CacheBlockHeader"* %17 to i8*
  tail call void @halide_free(i8* null, i8* %18) #12
  %19 = add nuw nsw i64 %10, 1
  %20 = load i32, i32* %2, align 8, !tbaa !220
  %21 = zext i32 %20 to i64
  %22 = icmp ult i64 %19, %21
  br i1 %22, label %9, label %.loopexit, !llvm.loop !223
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

.preheader:                                       ; preds = %11, %4
  %6 = phi i32 [ %12, %11 ], [ %1, %4 ]
  %7 = zext i32 %6 to i64
  %8 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %0, i64 0, i32 3, i64 %7
  %9 = load i64, i64* %8, align 8, !tbaa !113
  %10 = icmp eq i64 %9, 1
  br i1 %10, label %11, label %.loopexit2

11:                                               ; preds = %.preheader
  %12 = add nsw i32 %6, -1
  %13 = icmp sgt i32 %6, 0
  br i1 %13, label %.preheader, label %.loopexit3, !llvm.loop !224

.loopexit2:                                       ; preds = %.preheader, %4
  %14 = phi i32 [ %1, %4 ], [ %6, %.preheader ]
  %15 = icmp eq i32 %14, -1
  br i1 %15, label %.loopexit3, label %16

16:                                               ; preds = %.loopexit2
  %17 = sext i32 %14 to i64
  %18 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %0, i64 0, i32 3, i64 %17
  %19 = load i64, i64* %18, align 8, !tbaa !113
  %20 = icmp eq i64 %19, 0
  br i1 %20, label %.loopexit, label %21

21:                                               ; preds = %16
  %22 = add nsw i32 %14, -1
  %23 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %0, i64 0, i32 4, i64 %17
  %24 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %0, i64 0, i32 5, i64 %17
  br label %36

.loopexit3:                                       ; preds = %.loopexit2, %11
  %25 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %0, i64 0, i32 0
  %26 = load i64, i64* %25, align 8, !tbaa !225
  %27 = add i64 %26, %2
  %28 = inttoptr i64 %27 to i8*
  %29 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %0, i64 0, i32 1
  %30 = load i64, i64* %29, align 8, !tbaa !227
  %31 = add i64 %30, %3
  %32 = inttoptr i64 %31 to i8*
  %33 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %0, i64 0, i32 6
  %34 = load i64, i64* %33, align 8, !tbaa !228
  %35 = tail call i8* @memcpy(i8* %32, i8* %28, i64 %34) #12
  br label %.loopexit

36:                                               ; preds = %36, %21
  %37 = phi i64 [ 0, %21 ], [ %44, %36 ]
  %38 = phi i64 [ %2, %21 ], [ %41, %36 ]
  %39 = phi i64 [ %3, %21 ], [ %43, %36 ]
  tail call void @_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx(%"struct.Halide::Runtime::Internal::device_copy"* nonnull align 8 dereferenceable(416) %0, i32 %22, i64 %38, i64 %39) #13
  %40 = load i64, i64* %23, align 8, !tbaa !113
  %41 = add i64 %40, %38
  %42 = load i64, i64* %24, align 8, !tbaa !113
  %43 = add i64 %42, %39
  %44 = add nuw i64 %37, 1
  %45 = load i64, i64* %18, align 8, !tbaa !113
  %46 = icmp ult i64 %44, %45
  br i1 %46, label %36, label %.loopexit, !llvm.loop !229

.loopexit:                                        ; preds = %36, %.loopexit3, %16
  ret void
}

; Function Attrs: nounwind mustprogress
define linkonce void @_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv(%"struct.Halide::Runtime::Internal::device_copy"* nonnull align 8 dereferenceable(416) %0, i8* %1) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %0, i64 0, i32 0
  %4 = load i64, i64* %3, align 8, !tbaa !225
  %5 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %0, i64 0, i32 1
  %6 = load i64, i64* %5, align 8, !tbaa !227
  %7 = icmp eq i64 %4, %6
  br i1 %7, label %11, label %8

8:                                                ; preds = %2
  %9 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %0, i64 0, i32 2
  %10 = load i64, i64* %9, align 8, !tbaa !230
  tail call void @_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx(%"struct.Halide::Runtime::Internal::device_copy"* nonnull align 8 dereferenceable(416) %0, i32 15, i64 %10, i64 0) #13
  br label %11

11:                                               ; preds = %8, %2
  ret void
}

; Function Attrs: nounwind mustprogress
define linkonce void @_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b(%"struct.Halide::Runtime::Internal::device_copy"* noalias sret(%"struct.Halide::Runtime::Internal::device_copy") align 8 %0, %struct.halide_buffer_t* %1, i1 zeroext %2, %struct.halide_buffer_t* %3, i1 zeroext %4) local_unnamed_addr #0 {
  %6 = alloca %"struct.Halide::Runtime::Internal::device_copy", align 8
  %7 = bitcast %"struct.Halide::Runtime::Internal::device_copy"* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 416, i8* nonnull %7) #10
  br i1 %2, label %8, label %12

8:                                                ; preds = %5
  %9 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 2
  %10 = load i8*, i8** %9, align 8, !tbaa !181
  %11 = ptrtoint i8* %10 to i64
  br label %15

12:                                               ; preds = %5
  %13 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %14 = load i64, i64* %13, align 8, !tbaa !183
  br label %15

15:                                               ; preds = %12, %8
  %16 = phi i64 [ %11, %8 ], [ %14, %12 ]
  %17 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 0
  store i64 %16, i64* %17, align 8, !tbaa !225
  br i1 %4, label %18, label %22

18:                                               ; preds = %15
  %19 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 2
  %20 = load i8*, i8** %19, align 8, !tbaa !181
  %21 = ptrtoint i8* %20 to i64
  br label %25

22:                                               ; preds = %15
  %23 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 0
  %24 = load i64, i64* %23, align 8, !tbaa !183
  br label %25

25:                                               ; preds = %22, %18
  %26 = phi i64 [ %21, %18 ], [ %24, %22 ]
  %27 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 1
  store i64 %26, i64* %27, align 8, !tbaa !227
  %28 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 4, i32 1
  %29 = load i8, i8* %28, align 1, !tbaa !139
  %30 = zext i8 %29 to i32
  %31 = add nuw nsw i32 %30, 7
  %32 = lshr i32 %31, 3
  %33 = zext i32 %32 to i64
  %34 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 6
  store i64 %33, i64* %34, align 8, !tbaa !228
  %35 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 3, i64 0
  %36 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 4, i64 0
  %37 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 5, i64 0
  %38 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 3, i64 1
  %39 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 4, i64 1
  %40 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 5, i64 1
  %41 = bitcast i64* %35 to <4 x i64>*
  store <4 x i64> <i64 1, i64 1, i64 1, i64 1>, <4 x i64>* %41, align 8, !tbaa !113
  %42 = bitcast i64* %36 to <4 x i64>*
  store <4 x i64> zeroinitializer, <4 x i64>* %42, align 8, !tbaa !113
  %43 = bitcast i64* %37 to <4 x i64>*
  store <4 x i64> zeroinitializer, <4 x i64>* %43, align 8, !tbaa !113
  %44 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 3, i64 4
  %45 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 4, i64 4
  %46 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 5, i64 4
  %47 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 3, i64 5
  %48 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 4, i64 5
  %49 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 5, i64 5
  %50 = bitcast i64* %44 to <4 x i64>*
  store <4 x i64> <i64 1, i64 1, i64 1, i64 1>, <4 x i64>* %50, align 8, !tbaa !113
  %51 = bitcast i64* %45 to <4 x i64>*
  store <4 x i64> zeroinitializer, <4 x i64>* %51, align 8, !tbaa !113
  %52 = bitcast i64* %46 to <4 x i64>*
  store <4 x i64> zeroinitializer, <4 x i64>* %52, align 8, !tbaa !113
  %53 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 3, i64 8
  %54 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 4, i64 8
  %55 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 5, i64 8
  %56 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 3, i64 9
  %57 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 4, i64 9
  %58 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 5, i64 9
  %59 = bitcast i64* %53 to <4 x i64>*
  store <4 x i64> <i64 1, i64 1, i64 1, i64 1>, <4 x i64>* %59, align 8, !tbaa !113
  %60 = bitcast i64* %54 to <4 x i64>*
  store <4 x i64> zeroinitializer, <4 x i64>* %60, align 8, !tbaa !113
  %61 = bitcast i64* %55 to <4 x i64>*
  store <4 x i64> zeroinitializer, <4 x i64>* %61, align 8, !tbaa !113
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
  store <4 x i64> <i64 1, i64 1, i64 1, i64 1>, <4 x i64>* %72, align 8, !tbaa !113
  %73 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 4, i64 15
  %74 = bitcast i64* %63 to <4 x i64>*
  store <4 x i64> zeroinitializer, <4 x i64>* %74, align 8, !tbaa !113
  %75 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 5, i64 15
  %76 = bitcast i64* %64 to <4 x i64>*
  store <4 x i64> zeroinitializer, <4 x i64>* %76, align 8, !tbaa !113
  %77 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 2
  %78 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 5
  %79 = load i32, i32* %78, align 4, !tbaa !184
  %80 = icmp sgt i32 %79, 0
  br i1 %80, label %81, label %.loopexit9

81:                                               ; preds = %25
  %82 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 6
  %83 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %82, align 8, !tbaa !185
  %84 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 6
  %85 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %84, align 8, !tbaa !185
  %86 = zext i32 %79 to i64
  br label %92

.loopexit9:                                       ; preds = %92, %25
  %87 = phi i64 [ 0, %25 ], [ %105, %92 ]
  %88 = mul i64 %87, %33
  store i64 %88, i64* %77, align 8, !tbaa !230
  %89 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 5
  %90 = load i32, i32* %89, align 4, !tbaa !184
  %91 = icmp eq i32 %79, %90
  br i1 %91, label %108, label %117

92:                                               ; preds = %92, %81
  %93 = phi i64 [ 0, %81 ], [ %106, %92 ]
  %94 = phi i64 [ 0, %81 ], [ %105, %92 ]
  %95 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %83, i64 %93, i32 2
  %96 = load i32, i32* %95, align 4, !tbaa !191
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %85, i64 %93, i32 0
  %99 = load i32, i32* %98, align 4, !tbaa !190
  %100 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %83, i64 %93, i32 0
  %101 = load i32, i32* %100, align 4, !tbaa !190
  %102 = sub nsw i32 %99, %101
  %103 = sext i32 %102 to i64
  %104 = mul nsw i64 %103, %97
  %105 = add i64 %104, %94
  %106 = add nuw nsw i64 %93, 1
  %107 = icmp eq i64 %106, %86
  br i1 %107, label %.loopexit9, label %92, !llvm.loop !231

108:                                              ; preds = %.loopexit9
  %109 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 4, i32 1
  %110 = load i8, i8* %109, align 1, !tbaa !139
  %111 = zext i8 %110 to i32
  %112 = add nuw nsw i32 %111, 7
  %113 = lshr i32 %112, 3
  %114 = icmp ne i32 %32, %113
  %115 = icmp sgt i32 %79, 16
  %116 = or i1 %115, %114
  br i1 %116, label %117, label %119

117:                                              ; preds = %108, %.loopexit9
  %118 = bitcast %"struct.Halide::Runtime::Internal::device_copy"* %0 to i8*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(416) %118, i8 0, i64 416, i1 false)
  br label %238

119:                                              ; preds = %108
  %120 = icmp eq i32 %32, 0
  br i1 %120, label %128, label %121

121:                                              ; preds = %119
  br i1 %80, label %122, label %.loopexit

122:                                              ; preds = %121
  %123 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 6
  %124 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %123, align 8, !tbaa !185
  %125 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 6
  %126 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %125, align 8, !tbaa !185
  %127 = zext i32 %79 to i64
  br label %160

128:                                              ; preds = %119
  %129 = bitcast %"struct.Halide::Runtime::Internal::device_copy"* %0 to i8*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(416) %129, i8 0, i64 416, i1 false)
  br label %238

130:                                              ; preds = %.loopexit8
  %131 = load i64, i64* %34, align 8, !tbaa !228
  %132 = load i64, i64* %36, align 8, !tbaa !113
  %133 = icmp eq i64 %131, %132
  br i1 %133, label %134, label %.loopexit

134:                                              ; preds = %130
  %135 = load i64, i64* %37, align 8, !tbaa !113
  %136 = bitcast i64* %38 to <4 x i64>*
  %137 = bitcast i64* %35 to <4 x i64>*
  %138 = bitcast i64* %39 to <4 x i64>*
  %139 = bitcast i64* %36 to <4 x i64>*
  %140 = bitcast i64* %40 to <4 x i64>*
  %141 = bitcast i64* %37 to <4 x i64>*
  %142 = bitcast i64* %47 to <4 x i64>*
  %143 = bitcast i64* %44 to <4 x i64>*
  %144 = bitcast i64* %48 to <4 x i64>*
  %145 = bitcast i64* %45 to <4 x i64>*
  %146 = bitcast i64* %49 to <4 x i64>*
  %147 = bitcast i64* %46 to <4 x i64>*
  %148 = bitcast i64* %56 to <4 x i64>*
  %149 = bitcast i64* %53 to <4 x i64>*
  %150 = bitcast i64* %57 to <4 x i64>*
  %151 = bitcast i64* %54 to <4 x i64>*
  %152 = bitcast i64* %58 to <4 x i64>*
  %153 = bitcast i64* %55 to <4 x i64>*
  %154 = bitcast i64* %65 to <2 x i64>*
  %155 = bitcast i64* %62 to <2 x i64>*
  %156 = bitcast i64* %66 to <2 x i64>*
  %157 = bitcast i64* %63 to <2 x i64>*
  %158 = bitcast i64* %67 to <2 x i64>*
  %159 = bitcast i64* %64 to <2 x i64>*
  br label %212

160:                                              ; preds = %.loopexit8, %122
  %161 = phi i64 [ 0, %122 ], [ %197, %.loopexit8 ]
  %162 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %124, i64 %161, i32 2
  %163 = load i32, i32* %162, align 4, !tbaa !191
  %164 = sext i32 %163 to i64
  %165 = mul nsw i64 %164, %33
  %166 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %126, i64 %161, i32 2
  %167 = load i32, i32* %166, align 4, !tbaa !191
  %168 = sext i32 %167 to i64
  %169 = mul nsw i64 %168, %33
  %170 = icmp eq i64 %161, 0
  br i1 %170, label %185, label %171

171:                                              ; preds = %160
  %172 = icmp eq i64 %165, 0
  br i1 %172, label %173, label %.preheader

173:                                              ; preds = %171
  %174 = trunc i64 %161 to i32
  br label %185

.preheader:                                       ; preds = %179, %171
  %175 = phi i64 [ %180, %179 ], [ 0, %171 ]
  %176 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 5, i64 %175
  %177 = load i64, i64* %176, align 8, !tbaa !113
  %178 = icmp ult i64 %165, %177
  br i1 %178, label %182, label %179

179:                                              ; preds = %.preheader
  %180 = add nuw nsw i64 %175, 1
  %181 = icmp eq i64 %180, %161
  br i1 %181, label %182, label %.preheader, !llvm.loop !232

182:                                              ; preds = %179, %.preheader
  %183 = phi i64 [ %161, %179 ], [ %175, %.preheader ]
  %184 = trunc i64 %183 to i32
  br label %185

185:                                              ; preds = %182, %173, %160
  %186 = phi i32 [ 0, %160 ], [ %184, %182 ], [ %174, %173 ]
  %187 = zext i32 %186 to i64
  %188 = icmp ugt i64 %161, %187
  br i1 %188, label %189, label %.loopexit8

189:                                              ; preds = %185
  %190 = sext i32 %186 to i64
  br label %199

.loopexit8:                                       ; preds = %199, %185
  %191 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %124, i64 %161, i32 1
  %192 = load i32, i32* %191, align 4, !tbaa !187
  %193 = sext i32 %192 to i64
  %194 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 3, i64 %187
  store i64 %193, i64* %194, align 8, !tbaa !113
  %195 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 5, i64 %187
  store i64 %165, i64* %195, align 8, !tbaa !113
  %196 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 4, i64 %187
  store i64 %169, i64* %196, align 8, !tbaa !113
  %197 = add nuw nsw i64 %161, 1
  %198 = icmp eq i64 %197, %127
  br i1 %198, label %130, label %160, !llvm.loop !233

199:                                              ; preds = %199, %189
  %200 = phi i64 [ %161, %189 ], [ %201, %199 ]
  %201 = add nsw i64 %200, -1
  %202 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 3, i64 %201
  %203 = load i64, i64* %202, align 8, !tbaa !113
  %204 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 3, i64 %200
  store i64 %203, i64* %204, align 8, !tbaa !113
  %205 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 5, i64 %201
  %206 = load i64, i64* %205, align 8, !tbaa !113
  %207 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 5, i64 %200
  store i64 %206, i64* %207, align 8, !tbaa !113
  %208 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 4, i64 %201
  %209 = load i64, i64* %208, align 8, !tbaa !113
  %210 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 4, i64 %200
  store i64 %209, i64* %210, align 8, !tbaa !113
  %211 = icmp sgt i64 %201, %190
  br i1 %211, label %199, label %.loopexit8, !llvm.loop !234

212:                                              ; preds = %216, %134
  %213 = phi i64 [ %135, %134 ], [ %236, %216 ]
  %214 = phi i64 [ %131, %134 ], [ %218, %216 ]
  %215 = icmp eq i64 %214, %213
  br i1 %215, label %216, label %.loopexit

216:                                              ; preds = %212
  %217 = load i64, i64* %35, align 8, !tbaa !113
  %218 = mul i64 %217, %213
  store i64 %218, i64* %34, align 8, !tbaa !228
  %219 = load <4 x i64>, <4 x i64>* %136, align 8, !tbaa !113
  store <4 x i64> %219, <4 x i64>* %137, align 8, !tbaa !113
  %220 = load <4 x i64>, <4 x i64>* %138, align 8, !tbaa !113
  store <4 x i64> %220, <4 x i64>* %139, align 8, !tbaa !113
  %221 = load <4 x i64>, <4 x i64>* %140, align 8, !tbaa !113
  store <4 x i64> %221, <4 x i64>* %141, align 8, !tbaa !113
  %222 = load <4 x i64>, <4 x i64>* %142, align 8, !tbaa !113
  store <4 x i64> %222, <4 x i64>* %143, align 8, !tbaa !113
  %223 = load <4 x i64>, <4 x i64>* %144, align 8, !tbaa !113
  store <4 x i64> %223, <4 x i64>* %145, align 8, !tbaa !113
  %224 = load <4 x i64>, <4 x i64>* %146, align 8, !tbaa !113
  store <4 x i64> %224, <4 x i64>* %147, align 8, !tbaa !113
  %225 = load <4 x i64>, <4 x i64>* %148, align 8, !tbaa !113
  store <4 x i64> %225, <4 x i64>* %149, align 8, !tbaa !113
  %226 = load <4 x i64>, <4 x i64>* %150, align 8, !tbaa !113
  store <4 x i64> %226, <4 x i64>* %151, align 8, !tbaa !113
  %227 = load <4 x i64>, <4 x i64>* %152, align 8, !tbaa !113
  store <4 x i64> %227, <4 x i64>* %153, align 8, !tbaa !113
  %228 = load <2 x i64>, <2 x i64>* %154, align 8, !tbaa !113
  store <2 x i64> %228, <2 x i64>* %155, align 8, !tbaa !113
  %229 = load <2 x i64>, <2 x i64>* %156, align 8, !tbaa !113
  store <2 x i64> %229, <2 x i64>* %157, align 8, !tbaa !113
  %230 = load <2 x i64>, <2 x i64>* %158, align 8, !tbaa !113
  store <2 x i64> %230, <2 x i64>* %159, align 8, !tbaa !113
  %231 = load i64, i64* %71, align 8, !tbaa !113
  store i64 %231, i64* %68, align 8, !tbaa !113
  %232 = load i64, i64* %73, align 8, !tbaa !113
  store i64 %232, i64* %69, align 8, !tbaa !113
  %233 = load i64, i64* %75, align 8, !tbaa !113
  store i64 %233, i64* %70, align 8, !tbaa !113
  store i64 1, i64* %71, align 8, !tbaa !113
  store i64 0, i64* %73, align 8, !tbaa !113
  store i64 0, i64* %75, align 8, !tbaa !113
  %234 = extractelement <4 x i64> %220, i32 0
  %235 = icmp eq i64 %218, %234
  %236 = extractelement <4 x i64> %221, i32 0
  br i1 %235, label %212, label %.loopexit, !llvm.loop !235

.loopexit:                                        ; preds = %216, %212, %130, %121
  %237 = bitcast %"struct.Halide::Runtime::Internal::device_copy"* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(416) %237, i8* nonnull align 8 dereferenceable(416) %7, i64 416, i1 false), !tbaa.struct !236
  br label %238

238:                                              ; preds = %.loopexit, %128, %117
  call void @llvm.lifetime.end.p0i8(i64 416, i8* nonnull %7) #10
  ret void
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind mustprogress
define linkonce zeroext i1 @_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m(i8* %0, i8* %1, i64 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @memcmp(i8* %0, i8* %1, i64 %2) #12
  %5 = icmp eq i32 %4, 0
  ret i1 %5
}

declare i32 @memcmp(i8*, i8*, i64) local_unnamed_addr #1

; Function Attrs: nounwind mustprogress
define linkonce zeroext i1 @_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t(%struct.halide_buffer_t* %0, %struct.halide_dimension_t* %1) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %0, i64 0, i32 5
  %4 = load i32, i32* %3, align 4, !tbaa !184
  %5 = icmp sgt i32 %4, 0
  br i1 %5, label %6, label %.loopexit

6:                                                ; preds = %2
  %7 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %0, i64 0, i32 6
  %8 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %7, align 8, !tbaa !185
  %9 = zext i32 %4 to i64
  br label %11

10:                                               ; preds = %30
  %exitcond.not = icmp eq i64 %36, %9
  br i1 %exitcond.not, label %.loopexit, label %11, !llvm.loop !237

11:                                               ; preds = %10, %6
  %12 = phi i64 [ 0, %6 ], [ %36, %10 ]
  %13 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %8, i64 %12, i32 0
  %14 = load i32, i32* %13, align 4, !tbaa !190
  %15 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %1, i64 %12, i32 0
  %16 = load i32, i32* %15, align 4, !tbaa !190
  %17 = icmp eq i32 %14, %16
  br i1 %17, label %18, label %.loopexit

18:                                               ; preds = %11
  %19 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %8, i64 %12, i32 1
  %20 = load i32, i32* %19, align 4, !tbaa !187
  %21 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %1, i64 %12, i32 1
  %22 = load i32, i32* %21, align 4, !tbaa !187
  %23 = icmp eq i32 %20, %22
  br i1 %23, label %24, label %.loopexit

24:                                               ; preds = %18
  %25 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %8, i64 %12, i32 2
  %26 = load i32, i32* %25, align 4, !tbaa !191
  %27 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %1, i64 %12, i32 2
  %28 = load i32, i32* %27, align 4, !tbaa !191
  %29 = icmp eq i32 %26, %28
  br i1 %29, label %30, label %.loopexit

30:                                               ; preds = %24
  %31 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %8, i64 %12, i32 3
  %32 = load i32, i32* %31, align 4, !tbaa !238
  %33 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %1, i64 %12, i32 3
  %34 = load i32, i32* %33, align 4, !tbaa !238
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
  store <2 x %"struct.Halide::Runtime::Internal::CacheEntry"*> zeroinitializer, <2 x %"struct.Halide::Runtime::Internal::CacheEntry"*>* %11, align 8, !tbaa !10
  %12 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %0, i64 0, i32 2
  store %"struct.Halide::Runtime::Internal::CacheEntry"* null, %"struct.Halide::Runtime::Internal::CacheEntry"** %12, align 8, !tbaa !239
  %13 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %0, i64 0, i32 4
  store i64 %2, i64* %13, align 8, !tbaa !240
  %14 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %0, i64 0, i32 6
  store i32 %3, i32* %14, align 8, !tbaa !241
  %15 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %0, i64 0, i32 7
  store i32 0, i32* %15, align 4, !tbaa !242
  %16 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %0, i64 0, i32 8
  store i32 %5, i32* %16, align 8, !tbaa !220
  %17 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %4, i64 0, i32 5
  %18 = load i32, i32* %17, align 4, !tbaa !184
  %19 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %0, i64 0, i32 9
  store i32 %18, i32* %19, align 4, !tbaa !243
  %20 = zext i32 %5 to i64
  %21 = mul nuw nsw i64 %20, 56
  %22 = sext i32 %18 to i64
  %23 = add i32 %5, 1
  %24 = zext i32 %23 to i64
  %25 = shl nuw nsw i64 %24, 4
  %26 = mul i64 %25, %22
  %27 = add i64 %26, %21
  %28 = add i64 %27, %2
  %29 = tail call i8* @halide_malloc(i8* null, i64 %28) #12
  %30 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %0, i64 0, i32 3
  store i8* %29, i8** %30, align 8, !tbaa !221
  %31 = icmp eq i8* %29, null
  br i1 %31, label %117, label %32

32:                                               ; preds = %9
  %33 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %0, i64 0, i32 11
  %34 = bitcast %struct.halide_buffer_t** %33 to i8**
  store i8* %29, i8** %34, align 8, !tbaa !222
  %35 = getelementptr inbounds i8, i8* %29, i64 %21
  %36 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %0, i64 0, i32 10
  %37 = bitcast %struct.halide_dimension_t** %36 to i8**
  store i8* %35, i8** %37, align 8, !tbaa !244
  %38 = getelementptr inbounds i8, i8* %29, i64 %27
  %39 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %0, i64 0, i32 5
  store i8* %38, i8** %39, align 8, !tbaa !245
  %40 = load i64, i64* %13, align 8, !tbaa !240
  %41 = icmp eq i64 %40, 0
  br i1 %41, label %.loopexit6, label %42

42:                                               ; preds = %32
  %43 = load i8, i8* %1, align 1, !tbaa !14
  store i8 %43, i8* %38, align 1, !tbaa !14
  %44 = load i64, i64* %13, align 8, !tbaa !240
  %45 = icmp ugt i64 %44, 1
  br i1 %45, label %.preheader5, label %.loopexit6, !llvm.loop !246

.loopexit6:                                       ; preds = %.preheader5, %42, %32
  %46 = load i32, i32* %19, align 4, !tbaa !243
  %47 = icmp sgt i32 %46, 0
  br i1 %47, label %48, label %.loopexit4

48:                                               ; preds = %.loopexit6
  %49 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %4, i64 0, i32 6
  br label %60

.preheader5:                                      ; preds = %.preheader5, %42
  %50 = phi i64 [ %55, %.preheader5 ], [ 1, %42 ]
  %51 = load i8*, i8** %39, align 8, !tbaa !245
  %52 = getelementptr inbounds i8, i8* %1, i64 %50
  %53 = load i8, i8* %52, align 1, !tbaa !14
  %54 = getelementptr inbounds i8, i8* %51, i64 %50
  store i8 %53, i8* %54, align 1, !tbaa !14
  %55 = add nuw i64 %50, 1
  %56 = load i64, i64* %13, align 8, !tbaa !240
  %57 = icmp ult i64 %55, %56
  br i1 %57, label %.preheader5, label %.loopexit6, !llvm.loop !246

.loopexit4:                                       ; preds = %60, %.loopexit6
  %58 = load i32, i32* %16, align 8, !tbaa !220
  %59 = icmp eq i32 %58, 0
  br i1 %59, label %.loopexit3, label %.preheader2

60:                                               ; preds = %60, %48
  %61 = phi i64 [ 0, %48 ], [ %68, %60 ]
  %62 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %49, align 8, !tbaa !185
  %63 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %62, i64 %61
  %64 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %36, align 8, !tbaa !244
  %65 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %64, i64 %61
  %66 = bitcast %struct.halide_dimension_t* %65 to i8*
  %67 = bitcast %struct.halide_dimension_t* %63 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %66, i8* nonnull align 4 dereferenceable(16) %67, i64 16, i1 false), !tbaa.struct !186
  %68 = add nuw nsw i64 %61, 1
  %69 = load i32, i32* %19, align 4, !tbaa !243
  %70 = sext i32 %69 to i64
  %71 = icmp slt i64 %68, %70
  br i1 %71, label %60, label %.loopexit4, !llvm.loop !247

.loopexit:                                        ; preds = %.preheader, %94, %.preheader2
  %72 = load i32, i32* %16, align 8, !tbaa !220
  %73 = zext i32 %72 to i64
  %74 = icmp ult i64 %85, %73
  br i1 %74, label %.preheader2, label %.loopexit3, !llvm.loop !248

.loopexit3:                                       ; preds = %.loopexit, %.loopexit4
  %75 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %0, i64 0, i32 13
  store i8 %10, i8* %75, align 8, !tbaa !249
  %76 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %0, i64 0, i32 12
  store i64 %8, i64* %76, align 8, !tbaa !250
  br label %117

.preheader2:                                      ; preds = %.loopexit, %.loopexit4
  %77 = phi i64 [ %85, %.loopexit ], [ 0, %.loopexit4 ]
  %78 = getelementptr inbounds %struct.halide_buffer_t*, %struct.halide_buffer_t** %6, i64 %77
  %79 = bitcast %struct.halide_buffer_t** %78 to i8**
  %80 = load i8*, i8** %79, align 8, !tbaa !10
  %81 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %33, align 8, !tbaa !222
  %82 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %81, i64 %77
  %83 = bitcast %struct.halide_buffer_t* %82 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(56) %83, i8* nonnull align 8 dereferenceable(56) %80, i64 56, i1 false), !tbaa.struct !251
  %84 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %36, align 8, !tbaa !244
  %85 = add nuw nsw i64 %77, 1
  %86 = load i32, i32* %19, align 4, !tbaa !243
  %87 = trunc i64 %85 to i32
  %88 = mul i32 %86, %87
  %89 = zext i32 %88 to i64
  %90 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %84, i64 %89
  %91 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %33, align 8, !tbaa !222
  %92 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %91, i64 %77, i32 6
  store %struct.halide_dimension_t* %90, %struct.halide_dimension_t** %92, align 8, !tbaa !185
  %93 = icmp sgt i32 %86, 0
  br i1 %93, label %94, label %.loopexit

94:                                               ; preds = %.preheader2
  %95 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %78, align 8, !tbaa !10
  %96 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %95, i64 0, i32 6
  %97 = bitcast %struct.halide_dimension_t** %96 to i8**
  %98 = load i8*, i8** %97, align 8, !tbaa !185
  %99 = bitcast %struct.halide_dimension_t* %90 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %99, i8* nonnull align 4 dereferenceable(16) %98, i64 16, i1 false), !tbaa.struct !186
  %100 = load i32, i32* %19, align 4, !tbaa !243
  %101 = icmp sgt i32 %100, 1
  br i1 %101, label %.preheader, label %.loopexit, !llvm.loop !253

.preheader:                                       ; preds = %.preheader, %94
  %102 = phi i64 [ %113, %.preheader ], [ 1, %94 ]
  %103 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %33, align 8, !tbaa !222
  %104 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %103, i64 %77, i32 6
  %105 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %104, align 8, !tbaa !185
  %106 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %78, align 8, !tbaa !10
  %107 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %106, i64 0, i32 6
  %108 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %107, align 8, !tbaa !185
  %109 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %108, i64 %102
  %110 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %105, i64 %102
  %111 = bitcast %struct.halide_dimension_t* %110 to i8*
  %112 = bitcast %struct.halide_dimension_t* %109 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %111, i8* nonnull align 4 dereferenceable(16) %112, i64 16, i1 false), !tbaa.struct !186
  %113 = add nuw nsw i64 %102, 1
  %114 = load i32, i32* %19, align 4, !tbaa !243
  %115 = sext i32 %114 to i64
  %116 = icmp slt i64 %113, %115
  br i1 %116, label %.preheader, label %.loopexit, !llvm.loop !253

117:                                              ; preds = %.loopexit3, %9
  %118 = xor i1 %31, true
  ret i1 %118
}

; Function Attrs: nounwind mustprogress
define linkonce i32 @_ZN6Halide7Runtime8Internal8djb_hashEPKhm(i8* %0, i64 %1) local_unnamed_addr #0 {
  %3 = icmp eq i64 %1, 0
  br i1 %3, label %.loopexit, label %..preheader_crit_edge

..preheader_crit_edge:                            ; preds = %2
  %.1 = mul i32 5381, 33
  br label %.preheader

.loopexit:                                        ; preds = %.preheader, %2
  %4 = phi i32 [ 5381, %2 ], [ %9, %.preheader ]
  ret i32 %4

.preheader:                                       ; preds = %.preheader..preheader_crit_edge, %..preheader_crit_edge
  %5 = phi i64 [ %10, %.preheader..preheader_crit_edge ], [ 0, %..preheader_crit_edge ]
  %.phi = phi i32 [ %.0, %.preheader..preheader_crit_edge ], [ %.1, %..preheader_crit_edge ]
  %6 = getelementptr inbounds i8, i8* %0, i64 %5
  %7 = load i8, i8* %6, align 1, !tbaa !14
  %8 = zext i8 %7 to i32
  %9 = add i32 %.phi, %8
  %10 = add nuw i64 %5, 1
  %11 = icmp eq i64 %10, %1
  br i1 %11, label %.loopexit, label %.preheader..preheader_crit_edge, !llvm.loop !254

.preheader..preheader_crit_edge:                  ; preds = %.preheader
  %.0 = mul i32 %9, 33
  br label %.preheader
}

; Function Attrs: nounwind mustprogress
define linkonce void @_ZN6Halide7Runtime8Internal11prune_cacheEv() local_unnamed_addr #0 {
  %1 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal19least_recently_usedE, align 8, !tbaa !10
  %2 = load i64, i64* @_ZN6Halide7Runtime8Internal18current_cache_sizeE, align 8, !tbaa !113
  %3 = load i64, i64* @_ZN6Halide7Runtime8Internal14max_cache_sizeE, align 8, !tbaa !113
  %4 = icmp sgt i64 %2, %3
  %5 = icmp ne %"struct.Halide::Runtime::Internal::CacheEntry"* %1, null
  %6 = and i1 %5, %4
  br i1 %6, label %.preheader18, label %.loopexit19

.preheader18:                                     ; preds = %127, %0
  %7 = phi i64 [ %128, %127 ], [ %3, %0 ]
  %8 = phi i64 [ %129, %127 ], [ %2, %0 ]
  %9 = phi %"struct.Halide::Runtime::Internal::CacheEntry"* [ %11, %127 ], [ %1, %0 ]
  %10 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %9, i64 0, i32 1
  %11 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %10, align 8, !tbaa !255
  %12 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %9, i64 0, i32 7
  %13 = load i32, i32* %12, align 4, !tbaa !242
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %127

15:                                               ; preds = %.preheader18
  %16 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %9, i64 0, i32 6
  %17 = load i32, i32* %16, align 8, !tbaa !241
  %18 = and i32 %17, 255
  %19 = zext i32 %18 to i64
  %20 = getelementptr inbounds [256 x %"struct.Halide::Runtime::Internal::CacheEntry"*], [256 x %"struct.Halide::Runtime::Internal::CacheEntry"*]* @_ZN6Halide7Runtime8Internal13cache_entriesE, i64 0, i64 %19
  %21 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %20, align 8, !tbaa !10
  %22 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %21, %9
  br i1 %22, label %23, label %.preheader17

23:                                               ; preds = %15
  %24 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %9, i64 0, i32 0
  %25 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %24, align 8, !tbaa !216
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %25, %"struct.Halide::Runtime::Internal::CacheEntry"** %20, align 8, !tbaa !10
  br label %36

.preheader17:                                     ; preds = %28, %15
  %26 = phi %"struct.Halide::Runtime::Internal::CacheEntry"* [ %30, %28 ], [ %21, %15 ]
  %27 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %26, null
  br i1 %27, label %32, label %28

28:                                               ; preds = %.preheader17
  %29 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %26, i64 0, i32 0
  %30 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %29, align 8, !tbaa !216
  %31 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %30, %9
  br i1 %31, label %.loopexit, label %.preheader17, !llvm.loop !256

32:                                               ; preds = %.preheader17
  tail call void @halide_print(i8* null, i8* getelementptr inbounds ([90 x i8], [90 x i8]* @.str.1.43, i64 0, i64 0)) #12
  tail call void @abort() #12
  br label %.loopexit

.loopexit:                                        ; preds = %32, %28
  %33 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %9, i64 0, i32 0
  %34 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %33, align 8, !tbaa !216
  %35 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %26, i64 0, i32 0
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %34, %"struct.Halide::Runtime::Internal::CacheEntry"** %35, align 8, !tbaa !216
  br label %36

36:                                               ; preds = %.loopexit, %23
  %37 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal19least_recently_usedE, align 8, !tbaa !10
  %38 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %37, %9
  br i1 %38, label %39, label %40

39:                                               ; preds = %36
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %11, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal19least_recently_usedE, align 8, !tbaa !10
  br label %40

40:                                               ; preds = %39, %36
  %41 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %11, null
  br i1 %41, label %46, label %42

42:                                               ; preds = %40
  %43 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %9, i64 0, i32 2
  %44 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %43, align 8, !tbaa !239
  %45 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %11, i64 0, i32 2
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %44, %"struct.Halide::Runtime::Internal::CacheEntry"** %45, align 8, !tbaa !239
  br label %46

46:                                               ; preds = %42, %40
  %47 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal18most_recently_usedE, align 8, !tbaa !10
  %48 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %47, %9
  %49 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %9, i64 0, i32 2
  %50 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %49, align 8, !tbaa !239
  br i1 %48, label %51, label %52

51:                                               ; preds = %46
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %50, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal18most_recently_usedE, align 8, !tbaa !10
  br label %52

52:                                               ; preds = %51, %46
  %53 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %50, null
  br i1 %53, label %55, label %54

54:                                               ; preds = %52
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %11, %"struct.Halide::Runtime::Internal::CacheEntry"** %49, align 8, !tbaa !239
  br label %55

55:                                               ; preds = %54, %52
  %56 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %9, i64 0, i32 8
  %57 = load i32, i32* %56, align 8, !tbaa !220
  %58 = icmp eq i32 %57, 0
  br i1 %58, label %65, label %59

59:                                               ; preds = %55
  %60 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %9, i64 0, i32 11
  %61 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %60, align 8, !tbaa !222
  %62 = load i64, i64* @_ZN6Halide7Runtime8Internal18current_cache_sizeE, align 8, !tbaa !113
  %63 = zext i32 %57 to i64
  br label %69

64:                                               ; preds = %116
  store i64 %124, i64* @_ZN6Halide7Runtime8Internal18current_cache_sizeE, align 8, !tbaa !113
  br label %65

65:                                               ; preds = %64, %55
  tail call void @_ZN6Halide7Runtime8Internal10CacheEntry7destroyEv(%"struct.Halide::Runtime::Internal::CacheEntry"* nonnull dereferenceable(96) %9) #13
  %66 = bitcast %"struct.Halide::Runtime::Internal::CacheEntry"* %9 to i8*
  tail call void @halide_free(i8* null, i8* nonnull %66) #12
  %67 = load i64, i64* @_ZN6Halide7Runtime8Internal18current_cache_sizeE, align 8, !tbaa !113
  %68 = load i64, i64* @_ZN6Halide7Runtime8Internal14max_cache_sizeE, align 8, !tbaa !113
  br label %127

69:                                               ; preds = %116, %59
  %70 = phi i64 [ 0, %59 ], [ %125, %116 ]
  %71 = phi i64 [ %62, %59 ], [ %124, %116 ]
  %72 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %61, i64 %70, i32 5
  %73 = load i32, i32* %72, align 4, !tbaa !184
  %74 = icmp sgt i32 %73, 0
  br i1 %74, label %75, label %._crit_edge

._crit_edge:                                      ; preds = %69
  %.0 = add i64 0, -1
  br label %116

75:                                               ; preds = %69
  %76 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %61, i64 %70, i32 6
  %77 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %76, align 8, !tbaa !185
  %78 = zext i32 %73 to i64
  br label %79

79:                                               ; preds = %93, %75
  %80 = phi i64 [ 0, %75 ], [ %95, %93 ]
  %81 = phi i64 [ 0, %75 ], [ %94, %93 ]
  %82 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %77, i64 %80, i32 2
  %83 = load i32, i32* %82, align 4, !tbaa !191
  %84 = icmp sgt i32 %83, 0
  br i1 %84, label %85, label %93

85:                                               ; preds = %79
  %86 = zext i32 %83 to i64
  %87 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %77, i64 %80, i32 1
  %88 = load i32, i32* %87, align 4, !tbaa !187
  %89 = add nsw i32 %88, -1
  %90 = sext i32 %89 to i64
  %91 = mul nsw i64 %90, %86
  %92 = add nsw i64 %91, %81
  br label %93

93:                                               ; preds = %85, %79
  %94 = phi i64 [ %92, %85 ], [ %81, %79 ]
  %95 = add nuw nsw i64 %80, 1
  %96 = icmp eq i64 %95, %78
  br i1 %96, label %.preheader, label %79, !llvm.loop !257

.preheader:                                       ; preds = %110, %93
  %97 = phi i64 [ %112, %110 ], [ 0, %93 ]
  %98 = phi i64 [ %111, %110 ], [ 0, %93 ]
  %99 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %77, i64 %97, i32 2
  %100 = load i32, i32* %99, align 4, !tbaa !191
  %101 = icmp slt i32 %100, 0
  br i1 %101, label %102, label %110

102:                                              ; preds = %.preheader
  %103 = sext i32 %100 to i64
  %104 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %77, i64 %97, i32 1
  %105 = load i32, i32* %104, align 4, !tbaa !187
  %106 = add nsw i32 %105, -1
  %107 = sext i32 %106 to i64
  %108 = mul nsw i64 %107, %103
  %109 = add nsw i64 %108, %98
  br label %110

110:                                              ; preds = %102, %.preheader
  %111 = phi i64 [ %109, %102 ], [ %98, %.preheader ]
  %112 = add nuw nsw i64 %97, 1
  %113 = icmp eq i64 %112, %78
  br i1 %113, label %114, label %.preheader, !llvm.loop !258

114:                                              ; preds = %110
  %115 = xor i64 %94, -1
  %.1 = add i64 %111, %115
  br label %116

116:                                              ; preds = %114, %._crit_edge
  %.phi = phi i64 [ %.0, %._crit_edge ], [ %.1, %114 ]
  %117 = phi i64 [ 0, %._crit_edge ], [ %111, %114 ]
  %118 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %61, i64 %70, i32 4, i32 1
  %119 = load i8, i8* %118, align 1, !tbaa !139
  %120 = zext i8 %119 to i64
  %121 = add nuw nsw i64 %120, 7
  %122 = lshr i64 %121, 3
  %123 = mul i64 %122, %.phi
  %124 = add i64 %123, %71
  %125 = add nuw nsw i64 %70, 1
  %126 = icmp eq i64 %125, %63
  br i1 %126, label %64, label %69, !llvm.loop !259

127:                                              ; preds = %65, %.preheader18
  %128 = phi i64 [ %68, %65 ], [ %7, %.preheader18 ]
  %129 = phi i64 [ %67, %65 ], [ %8, %.preheader18 ]
  %130 = icmp sgt i64 %129, %128
  %131 = icmp ne %"struct.Halide::Runtime::Internal::CacheEntry"* %11, null
  %132 = and i1 %131, %130
  br i1 %132, label %.preheader18, label %.loopexit19, !llvm.loop !260

.loopexit19:                                      ; preds = %127, %0
  ret void
}

; Function Attrs: nounwind
define weak void @halide_memoization_cache_set_size(i64 %0) local_unnamed_addr #4 {
  %2 = icmp eq i64 %0, 0
  %3 = select i1 %2, i64 1048576, i64 %0
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal16memoization_lockE) #12
  store i64 %3, i64* @_ZN6Halide7Runtime8Internal14max_cache_sizeE, align 8, !tbaa !113
  tail call void @_ZN6Halide7Runtime8Internal11prune_cacheEv() #13
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal16memoization_lockE) #12
  ret void
}

; Function Attrs: nounwind
define weak i32 @halide_memoization_cache_lookup(i8* %0, i8* %1, i32 %2, %struct.halide_buffer_t* %3, i32 %4, %struct.halide_buffer_t** %5) local_unnamed_addr #4 {
  %7 = sext i32 %2 to i64
  %8 = tail call i32 @_ZN6Halide7Runtime8Internal8djb_hashEPKhm(i8* %1, i64 %7) #13
  %9 = and i32 %8, 255
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal16memoization_lockE) #12
  %10 = zext i32 %9 to i64
  %11 = getelementptr inbounds [256 x %"struct.Halide::Runtime::Internal::CacheEntry"*], [256 x %"struct.Halide::Runtime::Internal::CacheEntry"*]* @_ZN6Halide7Runtime8Internal13cache_entriesE, i64 0, i64 %10
  %12 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %11, align 8, !tbaa !10
  %13 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %12, null
  br i1 %13, label %.loopexit18, label %14

14:                                               ; preds = %6
  %15 = icmp sgt i32 %4, 0
  %16 = sext i32 %4 to i64
  br i1 %15, label %.split.us, label %.split

.split.us:                                        ; preds = %51, %14
  %17 = phi %"struct.Halide::Runtime::Internal::CacheEntry"* [ %53, %51 ], [ %12, %14 ]
  %18 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %17, i64 0, i32 6
  %19 = load i32, i32* %18, align 8, !tbaa !241
  %20 = icmp eq i32 %19, %8
  br i1 %20, label %21, label %51

21:                                               ; preds = %.split.us
  %22 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %17, i64 0, i32 4
  %23 = load i64, i64* %22, align 8, !tbaa !240
  %24 = icmp eq i64 %23, %7
  br i1 %24, label %25, label %51

25:                                               ; preds = %21
  %26 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %17, i64 0, i32 5
  %27 = load i8*, i8** %26, align 8, !tbaa !245
  %28 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m(i8* %27, i8* %1, i64 %7) #13
  br i1 %28, label %29, label %51

29:                                               ; preds = %25
  %30 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %17, i64 0, i32 10
  %31 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %30, align 8, !tbaa !244
  %32 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t(%struct.halide_buffer_t* %3, %struct.halide_dimension_t* %31) #13
  br i1 %32, label %33, label %51

33:                                               ; preds = %29
  %34 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %17, i64 0, i32 8
  %35 = load i32, i32* %34, align 8, !tbaa !220
  %36 = icmp eq i32 %35, %4
  br i1 %36, label %37, label %51

37:                                               ; preds = %33
  %38 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %17, i64 0, i32 11
  br label %39

39:                                               ; preds = %39, %37
  %40 = phi i64 [ 0, %37 ], [ %47, %39 ]
  %41 = getelementptr inbounds %struct.halide_buffer_t*, %struct.halide_buffer_t** %5, i64 %40
  %42 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %41, align 8, !tbaa !10
  %43 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %38, align 8, !tbaa !222
  %44 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %43, i64 %40, i32 6
  %45 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %44, align 8, !tbaa !185
  %46 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t(%struct.halide_buffer_t* %42, %struct.halide_dimension_t* %45) #13
  %47 = add nuw nsw i64 %40, 1
  %48 = icmp slt i64 %47, %16
  %49 = and i1 %48, %46
  br i1 %49, label %39, label %50, !llvm.loop !261

50:                                               ; preds = %39
  br i1 %46, label %.split26.us, label %51

51:                                               ; preds = %50, %33, %29, %25, %21, %.split.us
  %52 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %17, i64 0, i32 0
  %53 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %52, align 8, !tbaa !10
  %54 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %53, null
  br i1 %54, label %.loopexit18, label %.split.us, !llvm.loop !262

.loopexit18:                                      ; preds = %127, %51, %6
  %55 = icmp sgt i32 %4, 0
  br i1 %55, label %56, label %.loopexit

56:                                               ; preds = %.loopexit18
  %57 = zext i32 %4 to i64
  br label %131

.split:                                           ; preds = %127, %14
  %58 = phi %"struct.Halide::Runtime::Internal::CacheEntry"* [ %129, %127 ], [ %12, %14 ]
  %59 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %58, i64 0, i32 6
  %60 = load i32, i32* %59, align 8, !tbaa !241
  %61 = icmp eq i32 %60, %8
  br i1 %61, label %62, label %127

62:                                               ; preds = %.split
  %63 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %58, i64 0, i32 4
  %64 = load i64, i64* %63, align 8, !tbaa !240
  %65 = icmp eq i64 %64, %7
  br i1 %65, label %66, label %127

66:                                               ; preds = %62
  %67 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %58, i64 0, i32 5
  %68 = load i8*, i8** %67, align 8, !tbaa !245
  %69 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m(i8* %68, i8* %1, i64 %7) #13
  br i1 %69, label %70, label %127

70:                                               ; preds = %66
  %71 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %58, i64 0, i32 10
  %72 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %71, align 8, !tbaa !244
  %73 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t(%struct.halide_buffer_t* %3, %struct.halide_dimension_t* %72) #13
  br i1 %73, label %74, label %127

74:                                               ; preds = %70
  %75 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %58, i64 0, i32 8
  %76 = load i32, i32* %75, align 8, !tbaa !220
  %77 = icmp eq i32 %76, %4
  br i1 %77, label %.split26.us, label %127

.split26.us:                                      ; preds = %74, %50
  %.us-phi = phi %"struct.Halide::Runtime::Internal::CacheEntry"* [ %17, %50 ], [ %58, %74 ]
  %78 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal18most_recently_usedE, align 8, !tbaa !10
  %79 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %.us-phi, %78
  br i1 %79, label %113, label %80

80:                                               ; preds = %.split26.us
  %81 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %.us-phi, i64 0, i32 1
  %82 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %81, align 8, !tbaa !255
  %83 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %82, null
  br i1 %83, label %84, label %85

84:                                               ; preds = %80
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([93 x i8], [93 x i8]* @.str.2.44, i64 0, i64 0)) #12
  tail call void @abort() #12
  br label %85

85:                                               ; preds = %84, %80
  %86 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %.us-phi, i64 0, i32 2
  %87 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %86, align 8, !tbaa !239
  %88 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %87, null
  br i1 %88, label %93, label %89

89:                                               ; preds = %85
  %90 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %81, align 8, !tbaa !255
  %91 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %87, i64 0, i32 1
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %90, %"struct.Halide::Runtime::Internal::CacheEntry"** %91, align 8, !tbaa !255
  %92 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %81, align 8, !tbaa !255
  br label %99

93:                                               ; preds = %85
  %94 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal19least_recently_usedE, align 8, !tbaa !10
  %95 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %94, %.us-phi
  br i1 %95, label %97, label %96

96:                                               ; preds = %93
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([92 x i8], [92 x i8]* @.str.3.45, i64 0, i64 0)) #12
  tail call void @abort() #12
  br label %97

97:                                               ; preds = %96, %93
  %98 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %81, align 8, !tbaa !255
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %98, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal19least_recently_usedE, align 8, !tbaa !10
  br label %99

99:                                               ; preds = %97, %89
  %100 = phi %"struct.Halide::Runtime::Internal::CacheEntry"* [ %92, %89 ], [ %98, %97 ]
  %101 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %100, null
  br i1 %101, label %102, label %104

102:                                              ; preds = %99
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([93 x i8], [93 x i8]* @.str.4.46, i64 0, i64 0)) #12
  tail call void @abort() #12
  %103 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %81, align 8, !tbaa !255
  br label %104

104:                                              ; preds = %102, %99
  %105 = phi %"struct.Halide::Runtime::Internal::CacheEntry"* [ %103, %102 ], [ %100, %99 ]
  %106 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %86, align 8, !tbaa !239
  %107 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %105, i64 0, i32 2
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %106, %"struct.Halide::Runtime::Internal::CacheEntry"** %107, align 8, !tbaa !239
  store %"struct.Halide::Runtime::Internal::CacheEntry"* null, %"struct.Halide::Runtime::Internal::CacheEntry"** %81, align 8, !tbaa !255
  %108 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal18most_recently_usedE, align 8, !tbaa !10
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %108, %"struct.Halide::Runtime::Internal::CacheEntry"** %86, align 8, !tbaa !239
  %109 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %108, null
  br i1 %109, label %112, label %110

110:                                              ; preds = %104
  %111 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %108, i64 0, i32 1
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %.us-phi, %"struct.Halide::Runtime::Internal::CacheEntry"** %111, align 8, !tbaa !255
  br label %112

112:                                              ; preds = %110, %104
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %.us-phi, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal18most_recently_usedE, align 8, !tbaa !10
  br label %113

113:                                              ; preds = %112, %.split26.us
  br i1 %15, label %114, label %.loopexit17

114:                                              ; preds = %113
  %115 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %.us-phi, i64 0, i32 11
  %116 = zext i32 %4 to i64
  br label %117

117:                                              ; preds = %117, %114
  %118 = phi i64 [ 0, %114 ], [ %125, %117 ]
  %119 = getelementptr inbounds %struct.halide_buffer_t*, %struct.halide_buffer_t** %5, i64 %118
  %120 = bitcast %struct.halide_buffer_t** %119 to i8**
  %121 = load i8*, i8** %120, align 8, !tbaa !10
  %122 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %115, align 8, !tbaa !222
  %123 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %122, i64 %118
  %124 = bitcast %struct.halide_buffer_t* %123 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(56) %121, i8* nonnull align 8 dereferenceable(56) %124, i64 56, i1 false), !tbaa.struct !251
  %125 = add nuw nsw i64 %118, 1
  %126 = icmp eq i64 %125, %116
  br i1 %126, label %.loopexit17, label %117, !llvm.loop !263

127:                                              ; preds = %74, %70, %66, %62, %.split
  %128 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %58, i64 0, i32 0
  %129 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %128, align 8, !tbaa !10
  %130 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %129, null
  br i1 %130, label %.loopexit18, label %.split, !llvm.loop !262

131:                                              ; preds = %208, %56
  %132 = phi i64 [ 0, %56 ], [ %213, %208 ]
  %133 = getelementptr inbounds %struct.halide_buffer_t*, %struct.halide_buffer_t** %5, i64 %132
  %134 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %133, align 8, !tbaa !10
  %135 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %134, i64 0, i32 5
  %136 = load i32, i32* %135, align 4, !tbaa !184
  %137 = icmp sgt i32 %136, 0
  br i1 %137, label %138, label %179

138:                                              ; preds = %131
  %139 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %134, i64 0, i32 6
  %140 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %139, align 8, !tbaa !185
  %141 = zext i32 %136 to i64
  br label %142

142:                                              ; preds = %156, %138
  %143 = phi i64 [ 0, %138 ], [ %158, %156 ]
  %144 = phi i64 [ 0, %138 ], [ %157, %156 ]
  %145 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %140, i64 %143, i32 2
  %146 = load i32, i32* %145, align 4, !tbaa !191
  %147 = icmp sgt i32 %146, 0
  br i1 %147, label %148, label %156

148:                                              ; preds = %142
  %149 = zext i32 %146 to i64
  %150 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %140, i64 %143, i32 1
  %151 = load i32, i32* %150, align 4, !tbaa !187
  %152 = add nsw i32 %151, -1
  %153 = sext i32 %152 to i64
  %154 = mul nsw i64 %153, %149
  %155 = add nsw i64 %154, %144
  br label %156

156:                                              ; preds = %148, %142
  %157 = phi i64 [ %155, %148 ], [ %144, %142 ]
  %158 = add nuw nsw i64 %143, 1
  %159 = icmp eq i64 %158, %141
  br i1 %159, label %.preheader15, label %142, !llvm.loop !257

.preheader15:                                     ; preds = %173, %156
  %160 = phi i64 [ %175, %173 ], [ 0, %156 ]
  %161 = phi i64 [ %174, %173 ], [ 0, %156 ]
  %162 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %140, i64 %160, i32 2
  %163 = load i32, i32* %162, align 4, !tbaa !191
  %164 = icmp slt i32 %163, 0
  br i1 %164, label %165, label %173

165:                                              ; preds = %.preheader15
  %166 = sext i32 %163 to i64
  %167 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %140, i64 %160, i32 1
  %168 = load i32, i32* %167, align 4, !tbaa !187
  %169 = add nsw i32 %168, -1
  %170 = sext i32 %169 to i64
  %171 = mul nsw i64 %170, %166
  %172 = add nsw i64 %171, %161
  br label %173

173:                                              ; preds = %165, %.preheader15
  %174 = phi i64 [ %172, %165 ], [ %161, %.preheader15 ]
  %175 = add nuw nsw i64 %160, 1
  %176 = icmp eq i64 %175, %141
  br i1 %176, label %177, label %.preheader15, !llvm.loop !258

177:                                              ; preds = %173
  %178 = add nsw i64 %157, 1
  br label %179

179:                                              ; preds = %177, %131
  %180 = phi i64 [ 1, %131 ], [ %178, %177 ]
  %181 = phi i64 [ 0, %131 ], [ %174, %177 ]
  %182 = sub nsw i64 %180, %181
  %183 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %134, i64 0, i32 4, i32 1
  %184 = load i8, i8* %183, align 1, !tbaa !139
  %185 = zext i8 %184 to i64
  %186 = add nuw nsw i64 %185, 7
  %187 = lshr i64 %186, 3
  %188 = mul i64 %187, %182
  %189 = add i64 %188, 64
  %190 = tail call i8* @halide_malloc(i8* %0, i64 %189) #12
  %191 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %134, i64 0, i32 2
  store i8* %190, i8** %191, align 8, !tbaa !181
  %192 = icmp eq i8* %190, null
  br i1 %192, label %193, label %208

193:                                              ; preds = %179
  %194 = icmp eq i64 %132, 0
  br i1 %194, label %.loopexit, label %.preheader

.preheader:                                       ; preds = %.preheader, %193
  %195 = phi i64 [ %207, %.preheader ], [ %132, %193 ]
  %196 = add nuw nsw i64 %195, 4294967295
  %197 = and i64 %196, 4294967295
  %198 = getelementptr inbounds %struct.halide_buffer_t*, %struct.halide_buffer_t** %5, i64 %197
  %199 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %198, align 8, !tbaa !10
  %200 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %199, i64 0, i32 2
  %201 = load i8*, i8** %200, align 8, !tbaa !181
  %202 = tail call %"struct.Halide::Runtime::Internal::CacheBlockHeader"* @_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh(i8* %201) #13
  %203 = bitcast %"struct.Halide::Runtime::Internal::CacheBlockHeader"* %202 to i8*
  tail call void @halide_free(i8* %0, i8* %203) #12
  %204 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %198, align 8, !tbaa !10
  %205 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %204, i64 0, i32 2
  store i8* null, i8** %205, align 8, !tbaa !181
  %206 = icmp sgt i64 %195, 1
  %207 = add nsw i64 %195, -1
  br i1 %206, label %.preheader, label %.loopexit, !llvm.loop !264

208:                                              ; preds = %179
  %209 = getelementptr inbounds i8, i8* %190, i64 64
  store i8* %209, i8** %191, align 8, !tbaa !181
  %210 = tail call %"struct.Halide::Runtime::Internal::CacheBlockHeader"* @_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh(i8* nonnull %209) #13
  %211 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheBlockHeader", %"struct.Halide::Runtime::Internal::CacheBlockHeader"* %210, i64 0, i32 1
  store i32 %8, i32* %211, align 8, !tbaa !265
  %212 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheBlockHeader", %"struct.Halide::Runtime::Internal::CacheBlockHeader"* %210, i64 0, i32 0
  store %"struct.Halide::Runtime::Internal::CacheEntry"* null, %"struct.Halide::Runtime::Internal::CacheEntry"** %212, align 8, !tbaa !267
  %213 = add nuw nsw i64 %132, 1
  %214 = icmp eq i64 %213, %57
  br i1 %214, label %.loopexit, label %131, !llvm.loop !268

.loopexit17:                                      ; preds = %117, %113
  %215 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %.us-phi, i64 0, i32 7
  %216 = load i32, i32* %215, align 4, !tbaa !242
  %217 = add i32 %216, %4
  store i32 %217, i32* %215, align 4, !tbaa !242
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit17, %208, %.preheader, %193, %.loopexit18
  %218 = phi i32 [ 1, %.loopexit18 ], [ 0, %.loopexit17 ], [ -1, %193 ], [ -1, %.preheader ], [ 1, %208 ]
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal16memoization_lockE) #12
  ret i32 %218
}

; Function Attrs: nounwind
define weak i32 @halide_memoization_cache_store(i8* %0, i8* %1, i32 %2, %struct.halide_buffer_t* %3, i32 %4, %struct.halide_buffer_t** %5, i1 zeroext %6, i64 %7) local_unnamed_addr #4 {
  %9 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %5, align 8, !tbaa !10
  %10 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %9, i64 0, i32 2
  %11 = load i8*, i8** %10, align 8, !tbaa !181
  %12 = tail call %"struct.Halide::Runtime::Internal::CacheBlockHeader"* @_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh(i8* %11) #13
  %13 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheBlockHeader", %"struct.Halide::Runtime::Internal::CacheBlockHeader"* %12, i64 0, i32 1
  %14 = load i32, i32* %13, align 8, !tbaa !265
  %15 = and i32 %14, 255
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal16memoization_lockE) #12
  %16 = zext i32 %15 to i64
  %17 = getelementptr inbounds [256 x %"struct.Halide::Runtime::Internal::CacheEntry"*], [256 x %"struct.Halide::Runtime::Internal::CacheEntry"*]* @_ZN6Halide7Runtime8Internal13cache_entriesE, i64 0, i64 %16
  %18 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %17, align 8, !tbaa !10
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
  %28 = load i32, i32* %27, align 8, !tbaa !241
  %29 = icmp eq i32 %28, %14
  br i1 %29, label %30, label %51

30:                                               ; preds = %25
  %31 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %26, i64 0, i32 4
  %32 = load i64, i64* %31, align 8, !tbaa !240
  %33 = icmp eq i64 %32, %21
  br i1 %33, label %34, label %51

34:                                               ; preds = %30
  %35 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %26, i64 0, i32 5
  %36 = load i8*, i8** %35, align 8, !tbaa !245
  %37 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m(i8* %36, i8* %1, i64 %21) #13
  br i1 %37, label %38, label %51

38:                                               ; preds = %34
  %39 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %26, i64 0, i32 10
  %40 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %39, align 8, !tbaa !244
  %41 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t(%struct.halide_buffer_t* %3, %struct.halide_dimension_t* %40) #13
  br i1 %41, label %42, label %51

42:                                               ; preds = %38
  %43 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %26, i64 0, i32 8
  %44 = load i32, i32* %43, align 8, !tbaa !220
  %45 = icmp eq i32 %44, %4
  br i1 %45, label %84, label %51

46:                                               ; preds = %65
  br i1 %73, label %47, label %51

47:                                               ; preds = %46
  %48 = and i8 %80, 1
  %49 = icmp eq i8 %48, 0
  br i1 %49, label %50, label %.preheader49

.preheader49:                                     ; preds = %50, %47
  br label %55

50:                                               ; preds = %47
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([86 x i8], [86 x i8]* @.str.8.47, i64 0, i64 0)) #12
  tail call void @abort() #12
  br label %.preheader49

51:                                               ; preds = %46, %42, %38, %34, %30, %25
  %52 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %26, i64 0, i32 0
  %53 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %52, align 8, !tbaa !10
  %54 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %53, null
  br i1 %54, label %.loopexit18, label %25, !llvm.loop !269

55:                                               ; preds = %55, %.preheader49
  %56 = phi i64 [ %63, %55 ], [ 0, %.preheader49 ]
  %57 = getelementptr inbounds %struct.halide_buffer_t*, %struct.halide_buffer_t** %5, i64 %56
  %58 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %57, align 8, !tbaa !10
  %59 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %58, i64 0, i32 2
  %60 = load i8*, i8** %59, align 8, !tbaa !181
  %61 = tail call %"struct.Halide::Runtime::Internal::CacheBlockHeader"* @_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh(i8* %60) #13
  %62 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheBlockHeader", %"struct.Halide::Runtime::Internal::CacheBlockHeader"* %61, i64 0, i32 0
  store %"struct.Halide::Runtime::Internal::CacheEntry"* null, %"struct.Halide::Runtime::Internal::CacheEntry"** %62, align 8, !tbaa !267
  %63 = add nuw nsw i64 %56, 1
  %64 = icmp eq i64 %63, %24
  br i1 %64, label %.loopexit15, label %55, !llvm.loop !270

65:                                               ; preds = %84, %65
  %66 = phi %struct.halide_buffer_t* [ %86, %84 ], [ %74, %65 ]
  %67 = phi i64 [ 0, %84 ], [ %81, %65 ]
  %68 = phi i8 [ 1, %84 ], [ %80, %65 ]
  %69 = getelementptr inbounds %struct.halide_buffer_t*, %struct.halide_buffer_t** %5, i64 %67
  %70 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %69, align 8, !tbaa !10
  %71 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %66, i64 %67, i32 6
  %72 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %71, align 8, !tbaa !185
  %73 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t(%struct.halide_buffer_t* %70, %struct.halide_dimension_t* %72) #13
  %74 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %85, align 8, !tbaa !222
  %75 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %74, i64 %67, i32 2
  %76 = load i8*, i8** %75, align 8, !tbaa !181
  %77 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %70, i64 0, i32 2
  %78 = load i8*, i8** %77, align 8, !tbaa !181
  %79 = icmp eq i8* %76, %78
  %80 = select i1 %79, i8 0, i8 %68
  %81 = add nuw nsw i64 %67, 1
  %82 = icmp ult i64 %81, %24
  %83 = and i1 %82, %73
  br i1 %83, label %65, label %46, !llvm.loop !271

84:                                               ; preds = %42
  %85 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %26, i64 0, i32 11
  %86 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %85, align 8, !tbaa !222
  br label %65

.loopexit18:                                      ; preds = %110, %51, %8
  %87 = icmp sgt i32 %4, 0
  br i1 %87, label %88, label %.loopexit16

88:                                               ; preds = %.loopexit18
  %89 = zext i32 %4 to i64
  br label %119

.preheader19:                                     ; preds = %110, %20
  %90 = phi %"struct.Halide::Runtime::Internal::CacheEntry"* [ %112, %110 ], [ %18, %20 ]
  %91 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %90, i64 0, i32 6
  %92 = load i32, i32* %91, align 8, !tbaa !241
  %93 = icmp eq i32 %92, %14
  br i1 %93, label %94, label %110

94:                                               ; preds = %.preheader19
  %95 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %90, i64 0, i32 4
  %96 = load i64, i64* %95, align 8, !tbaa !240
  %97 = icmp eq i64 %96, %21
  br i1 %97, label %98, label %110

98:                                               ; preds = %94
  %99 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %90, i64 0, i32 5
  %100 = load i8*, i8** %99, align 8, !tbaa !245
  %101 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m(i8* %100, i8* %1, i64 %21) #13
  br i1 %101, label %102, label %110

102:                                              ; preds = %98
  %103 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %90, i64 0, i32 10
  %104 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %103, align 8, !tbaa !244
  %105 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t(%struct.halide_buffer_t* %3, %struct.halide_dimension_t* %104) #13
  br i1 %105, label %106, label %110

106:                                              ; preds = %102
  %107 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %90, i64 0, i32 8
  %108 = load i32, i32* %107, align 8, !tbaa !220
  %109 = icmp eq i32 %108, %4
  br i1 %109, label %.loopexit15, label %110

110:                                              ; preds = %106, %102, %98, %94, %.preheader19
  %111 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %90, i64 0, i32 0
  %112 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %111, align 8, !tbaa !10
  %113 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %112, null
  br i1 %113, label %.loopexit18, label %.preheader19, !llvm.loop !269

.loopexit16:                                      ; preds = %168, %.loopexit18
  %114 = phi i64 [ 0, %.loopexit18 ], [ %178, %168 ]
  %115 = load i64, i64* @_ZN6Halide7Runtime8Internal18current_cache_sizeE, align 8, !tbaa !113
  %116 = add i64 %115, %114
  store i64 %116, i64* @_ZN6Halide7Runtime8Internal18current_cache_sizeE, align 8, !tbaa !113
  tail call void @_ZN6Halide7Runtime8Internal11prune_cacheEv() #13
  %117 = tail call i8* @halide_malloc(i8* null, i64 96) #12
  %118 = icmp eq i8* %117, null
  br i1 %118, label %185, label %181

119:                                              ; preds = %168, %88
  %120 = phi i64 [ 0, %88 ], [ %179, %168 ]
  %121 = phi i64 [ 0, %88 ], [ %178, %168 ]
  %122 = getelementptr inbounds %struct.halide_buffer_t*, %struct.halide_buffer_t** %5, i64 %120
  %123 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %122, align 8, !tbaa !10
  %124 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %123, i64 0, i32 5
  %125 = load i32, i32* %124, align 4, !tbaa !184
  %126 = icmp sgt i32 %125, 0
  br i1 %126, label %127, label %168

127:                                              ; preds = %119
  %128 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %123, i64 0, i32 6
  %129 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %128, align 8, !tbaa !185
  %130 = zext i32 %125 to i64
  br label %131

131:                                              ; preds = %145, %127
  %132 = phi i64 [ 0, %127 ], [ %147, %145 ]
  %133 = phi i64 [ 0, %127 ], [ %146, %145 ]
  %134 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %129, i64 %132, i32 2
  %135 = load i32, i32* %134, align 4, !tbaa !191
  %136 = icmp sgt i32 %135, 0
  br i1 %136, label %137, label %145

137:                                              ; preds = %131
  %138 = zext i32 %135 to i64
  %139 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %129, i64 %132, i32 1
  %140 = load i32, i32* %139, align 4, !tbaa !187
  %141 = add nsw i32 %140, -1
  %142 = sext i32 %141 to i64
  %143 = mul nsw i64 %142, %138
  %144 = add nsw i64 %143, %133
  br label %145

145:                                              ; preds = %137, %131
  %146 = phi i64 [ %144, %137 ], [ %133, %131 ]
  %147 = add nuw nsw i64 %132, 1
  %148 = icmp eq i64 %147, %130
  br i1 %148, label %.preheader, label %131, !llvm.loop !257

.preheader:                                       ; preds = %162, %145
  %149 = phi i64 [ %164, %162 ], [ 0, %145 ]
  %150 = phi i64 [ %163, %162 ], [ 0, %145 ]
  %151 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %129, i64 %149, i32 2
  %152 = load i32, i32* %151, align 4, !tbaa !191
  %153 = icmp slt i32 %152, 0
  br i1 %153, label %154, label %162

154:                                              ; preds = %.preheader
  %155 = sext i32 %152 to i64
  %156 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %129, i64 %149, i32 1
  %157 = load i32, i32* %156, align 4, !tbaa !187
  %158 = add nsw i32 %157, -1
  %159 = sext i32 %158 to i64
  %160 = mul nsw i64 %159, %155
  %161 = add nsw i64 %160, %150
  br label %162

162:                                              ; preds = %154, %.preheader
  %163 = phi i64 [ %161, %154 ], [ %150, %.preheader ]
  %164 = add nuw nsw i64 %149, 1
  %165 = icmp eq i64 %164, %130
  br i1 %165, label %166, label %.preheader, !llvm.loop !258

166:                                              ; preds = %162
  %167 = add nsw i64 %146, 1
  br label %168

168:                                              ; preds = %166, %119
  %169 = phi i64 [ 1, %119 ], [ %167, %166 ]
  %170 = phi i64 [ 0, %119 ], [ %163, %166 ]
  %171 = sub nsw i64 %169, %170
  %172 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %123, i64 0, i32 4, i32 1
  %173 = load i8, i8* %172, align 1, !tbaa !139
  %174 = zext i8 %173 to i64
  %175 = add nuw nsw i64 %174, 7
  %176 = lshr i64 %175, 3
  %177 = mul i64 %176, %171
  %178 = add i64 %177, %121
  %179 = add nuw nsw i64 %120, 1
  %180 = icmp eq i64 %179, %89
  br i1 %180, label %.loopexit16, label %119, !llvm.loop !272

181:                                              ; preds = %.loopexit16
  %182 = bitcast i8* %117 to %"struct.Halide::Runtime::Internal::CacheEntry"*
  %183 = sext i32 %2 to i64
  %184 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal10CacheEntry4initEPKhmjPK15halide_buffer_tiPPS5_by(%"struct.Halide::Runtime::Internal::CacheEntry"* nonnull dereferenceable(96) %182, i8* %1, i64 %183, i32 %14, %struct.halide_buffer_t* %3, i32 %4, %struct.halide_buffer_t** nonnull %5, i1 zeroext %6, i64 %7) #13
  br i1 %184, label %201, label %185

185:                                              ; preds = %181, %.loopexit16
  %186 = load i64, i64* @_ZN6Halide7Runtime8Internal18current_cache_sizeE, align 8, !tbaa !113
  %187 = sub i64 %186, %114
  store i64 %187, i64* @_ZN6Halide7Runtime8Internal18current_cache_sizeE, align 8, !tbaa !113
  br i1 %87, label %188, label %.loopexit

188:                                              ; preds = %185
  %189 = zext i32 %4 to i64
  br label %190

.loopexit:                                        ; preds = %190, %185
  br i1 %118, label %.loopexit15, label %200

190:                                              ; preds = %190, %188
  %191 = phi i64 [ 0, %188 ], [ %198, %190 ]
  %192 = getelementptr inbounds %struct.halide_buffer_t*, %struct.halide_buffer_t** %5, i64 %191
  %193 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %192, align 8, !tbaa !10
  %194 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %193, i64 0, i32 2
  %195 = load i8*, i8** %194, align 8, !tbaa !181
  %196 = tail call %"struct.Halide::Runtime::Internal::CacheBlockHeader"* @_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh(i8* %195) #13
  %197 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheBlockHeader", %"struct.Halide::Runtime::Internal::CacheBlockHeader"* %196, i64 0, i32 0
  store %"struct.Halide::Runtime::Internal::CacheEntry"* null, %"struct.Halide::Runtime::Internal::CacheEntry"** %197, align 8, !tbaa !267
  %198 = add nuw nsw i64 %191, 1
  %199 = icmp eq i64 %198, %189
  br i1 %199, label %.loopexit, label %190, !llvm.loop !273

200:                                              ; preds = %.loopexit
  tail call void @halide_free(i8* %0, i8* nonnull %117) #12
  br label %.loopexit15

201:                                              ; preds = %181
  %202 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %17, align 8, !tbaa !10
  %203 = bitcast i8* %117 to %"struct.Halide::Runtime::Internal::CacheEntry"**
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %202, %"struct.Halide::Runtime::Internal::CacheEntry"** %203, align 8, !tbaa !216
  %204 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal18most_recently_usedE, align 8, !tbaa !10
  %205 = getelementptr inbounds i8, i8* %117, i64 16
  %206 = bitcast i8* %205 to %"struct.Halide::Runtime::Internal::CacheEntry"**
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %204, %"struct.Halide::Runtime::Internal::CacheEntry"** %206, align 8, !tbaa !239
  %207 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %204, null
  br i1 %207, label %211, label %208

208:                                              ; preds = %201
  %209 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %204, i64 0, i32 1
  %210 = bitcast %"struct.Halide::Runtime::Internal::CacheEntry"** %209 to i8**
  store i8* %117, i8** %210, align 8, !tbaa !255
  br label %211

211:                                              ; preds = %208, %201
  store i8* %117, i8** bitcast (%"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal18most_recently_usedE to i8**), align 8, !tbaa !10
  %212 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal19least_recently_usedE, align 8, !tbaa !10
  %213 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %212, null
  br i1 %213, label %214, label %215

214:                                              ; preds = %211
  store i8* %117, i8** bitcast (%"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal19least_recently_usedE to i8**), align 8, !tbaa !10
  br label %215

215:                                              ; preds = %214, %211
  %216 = bitcast %"struct.Halide::Runtime::Internal::CacheEntry"** %17 to i8**
  store i8* %117, i8** %216, align 8, !tbaa !10
  %217 = getelementptr inbounds i8, i8* %117, i64 52
  %218 = bitcast i8* %217 to i32*
  store i32 %4, i32* %218, align 4, !tbaa !242
  br i1 %87, label %219, label %.loopexit15

219:                                              ; preds = %215
  %220 = zext i32 %4 to i64
  br label %221

221:                                              ; preds = %221, %219
  %222 = phi i64 [ 0, %219 ], [ %229, %221 ]
  %223 = getelementptr inbounds %struct.halide_buffer_t*, %struct.halide_buffer_t** %5, i64 %222
  %224 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %223, align 8, !tbaa !10
  %225 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %224, i64 0, i32 2
  %226 = load i8*, i8** %225, align 8, !tbaa !181
  %227 = tail call %"struct.Halide::Runtime::Internal::CacheBlockHeader"* @_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh(i8* %226) #13
  %228 = bitcast %"struct.Halide::Runtime::Internal::CacheBlockHeader"* %227 to i8**
  store i8* %117, i8** %228, align 8, !tbaa !267
  %229 = add nuw nsw i64 %222, 1
  %230 = icmp eq i64 %229, %220
  br i1 %230, label %.loopexit15, label %221, !llvm.loop !274

.loopexit15:                                      ; preds = %221, %215, %200, %.loopexit, %106, %55
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal16memoization_lockE) #12
  ret i32 0
}

; Function Attrs: nounwind
define weak void @halide_memoization_cache_release(i8* %0, i8* %1) local_unnamed_addr #4 {
  %3 = tail call %"struct.Halide::Runtime::Internal::CacheBlockHeader"* @_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh(i8* %1) #13
  %4 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheBlockHeader", %"struct.Halide::Runtime::Internal::CacheBlockHeader"* %3, i64 0, i32 0
  %5 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %4, align 8, !tbaa !267
  %6 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %5, null
  br i1 %6, label %7, label %9

7:                                                ; preds = %2
  %8 = bitcast %"struct.Halide::Runtime::Internal::CacheBlockHeader"* %3 to i8*
  tail call void @halide_free(i8* %0, i8* %8) #12
  br label %18

9:                                                ; preds = %2
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal16memoization_lockE) #12
  %10 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %5, i64 0, i32 7
  %11 = load i32, i32* %10, align 4, !tbaa !242
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

13:                                               ; preds = %9
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([87 x i8], [87 x i8]* @.str.11.48, i64 0, i64 0)) #12
  tail call void @abort() #12
  %14 = load i32, i32* %10, align 4, !tbaa !242
  br label %15

15:                                               ; preds = %13, %9
  %16 = phi i32 [ %14, %13 ], [ %11, %9 ]
  %17 = add i32 %16, -1
  store i32 %17, i32* %10, align 4, !tbaa !242
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal16memoization_lockE) #12
  br label %18

18:                                               ; preds = %15, %7
  ret void
}

; Function Attrs: nounwind
define weak void @halide_memoization_cache_evict(i8* %0, i64 %1) local_unnamed_addr #4 {
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal16memoization_lockE) #12
  br label %4

3:                                                ; preds = %.loopexit
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal16memoization_lockE) #12
  ret void

4:                                                ; preds = %.loopexit, %2
  %5 = phi i64 [ 0, %2 ], [ %39, %.loopexit ]
  %6 = getelementptr inbounds [256 x %"struct.Halide::Runtime::Internal::CacheEntry"*], [256 x %"struct.Halide::Runtime::Internal::CacheEntry"*]* @_ZN6Halide7Runtime8Internal13cache_entriesE, i64 0, i64 %5
  %7 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %6, align 8, !tbaa !10
  %8 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %7, null
  br i1 %8, label %.loopexit, label %.preheader

.preheader:                                       ; preds = %36, %4
  %9 = phi %"struct.Halide::Runtime::Internal::CacheEntry"** [ %37, %36 ], [ %6, %4 ]
  %10 = phi %"struct.Halide::Runtime::Internal::CacheEntry"* [ %12, %36 ], [ %7, %4 ]
  %11 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %10, i64 0, i32 0
  %12 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %11, align 8, !tbaa !216
  %13 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %10, i64 0, i32 13
  %14 = load i8, i8* %13, align 8, !tbaa !249, !range !17
  %15 = icmp eq i8 %14, 0
  br i1 %15, label %36, label %16

16:                                               ; preds = %.preheader
  %17 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %10, i64 0, i32 12
  %18 = load i64, i64* %17, align 8, !tbaa !250
  %19 = icmp eq i64 %18, %1
  br i1 %19, label %20, label %36

20:                                               ; preds = %16
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %12, %"struct.Halide::Runtime::Internal::CacheEntry"** %9, align 8, !tbaa !10
  %21 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %10, i64 0, i32 1
  %22 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %21, align 8, !tbaa !255
  %23 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %22, null
  %24 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %10, i64 0, i32 2
  %25 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %24, align 8, !tbaa !239
  br i1 %23, label %29, label %26

26:                                               ; preds = %20
  %27 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %22, i64 0, i32 2
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %25, %"struct.Halide::Runtime::Internal::CacheEntry"** %27, align 8, !tbaa !239
  %28 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %24, align 8, !tbaa !239
  br label %30

29:                                               ; preds = %20
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %25, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal18most_recently_usedE, align 8, !tbaa !10
  br label %30

30:                                               ; preds = %29, %26
  %31 = phi %"struct.Halide::Runtime::Internal::CacheEntry"* [ %25, %29 ], [ %28, %26 ]
  %32 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %31, null
  %33 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %31, i64 0, i32 1
  %34 = select i1 %32, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal19least_recently_usedE, %"struct.Halide::Runtime::Internal::CacheEntry"** %33
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %22, %"struct.Halide::Runtime::Internal::CacheEntry"** %34, align 8, !tbaa !10
  tail call void @_ZN6Halide7Runtime8Internal10CacheEntry7destroyEv(%"struct.Halide::Runtime::Internal::CacheEntry"* nonnull dereferenceable(96) %10) #13
  %35 = bitcast %"struct.Halide::Runtime::Internal::CacheEntry"* %10 to i8*
  tail call void @halide_free(i8* %0, i8* nonnull %35) #12
  br label %36

36:                                               ; preds = %30, %16, %.preheader
  %37 = phi %"struct.Halide::Runtime::Internal::CacheEntry"** [ %9, %30 ], [ %11, %16 ], [ %11, %.preheader ]
  %38 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %12, null
  br i1 %38, label %.loopexit, label %.preheader, !llvm.loop !275

.loopexit:                                        ; preds = %36, %4
  %39 = add nuw nsw i64 %5, 1
  %40 = icmp eq i64 %39, 256
  br i1 %40, label %3, label %4, !llvm.loop !276
}

; Function Attrs: nounwind
define weak i8* @halide_string_to_string(i8* %0, i8* %1, i8* %2) local_unnamed_addr #4 {
  %4 = icmp ult i8* %0, %1
  br i1 %4, label %.preheader, label %.loopexit

5:                                                ; preds = %10
  store i8 0, i8* %7, align 1, !tbaa !14
  br label %.loopexit

.preheader:                                       ; preds = %10, %3
  %6 = phi i8* [ %12, %10 ], [ %2, %3 ]
  %7 = phi i8* [ %11, %10 ], [ %0, %3 ]
  %8 = load i8, i8* %6, align 1, !tbaa !14
  store i8 %8, i8* %7, align 1, !tbaa !14
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
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %6) #10
  %7 = getelementptr inbounds [32 x i8], [32 x i8]* %5, i64 0, i64 31
  store i8 0, i8* %7, align 1, !tbaa !14
  %8 = getelementptr inbounds [32 x i8], [32 x i8]* %5, i64 0, i64 30
  %9 = icmp sgt i32 %3, 0
  %10 = icmp ne i64 %2, 0
  %11 = or i1 %10, %9
  br i1 %11, label %.preheader, label %.loopexit

.loopexit:                                        ; preds = %.preheader, %4
  %12 = phi i8* [ %8, %4 ], [ %23, %.preheader ]
  %13 = getelementptr inbounds i8, i8* %12, i64 1
  %14 = call i8* @halide_string_to_string(i8* %0, i8* %1, i8* nonnull %13) #13
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %6) #10
  ret i8* %14

.preheader:                                       ; preds = %.preheader, %4
  %15 = phi i64 [ %18, %.preheader ], [ %2, %4 ]
  %16 = phi i8* [ %23, %.preheader ], [ %8, %4 ]
  %17 = phi i32 [ %24, %.preheader ], [ 0, %4 ]
  %18 = udiv i64 %15, 10
  %19 = mul i64 %18, -10
  %20 = add i64 %19, %15
  %21 = trunc i64 %20 to i8
  %22 = add i8 %21, 48
  store i8 %22, i8* %16, align 1, !tbaa !14
  %23 = getelementptr inbounds i8, i8* %16, i64 -1
  %24 = add nuw nsw i32 %17, 1
  %25 = icmp slt i32 %24, %3
  %26 = icmp ugt i64 %15, 9
  %27 = or i1 %26, %25
  br i1 %27, label %.preheader, label %.loopexit, !llvm.loop !277
}

; Function Attrs: nounwind mustprogress
define weak i8* @halide_int64_to_string(i8* %0, i8* %1, i64 %2, i32 %3) local_unnamed_addr #0 {
  %5 = icmp slt i64 %2, 0
  %6 = icmp ult i8* %0, %1
  %7 = and i1 %6, %5
  br i1 %7, label %8, label %11

8:                                                ; preds = %4
  %9 = getelementptr inbounds i8, i8* %0, i64 1
  store i8 45, i8* %0, align 1, !tbaa !14
  %10 = sub nsw i64 0, %2
  br label %11

11:                                               ; preds = %8, %4
  %12 = phi i64 [ %10, %8 ], [ %2, %4 ]
  %13 = phi i8* [ %9, %8 ], [ %0, %4 ]
  %14 = tail call i8* @halide_uint64_to_string(i8* %13, i8* %1, i64 %12, i32 %3) #13
  ret i8* %14
}

; Function Attrs: nounwind mustprogress
define weak i8* @halide_double_to_string(i8* %0, i8* %1, double %2, i32 %3) local_unnamed_addr #0 {
  %5 = alloca double, align 8
  %6 = alloca i64, align 8
  %7 = alloca [512 x i8], align 1
  store double %2, double* %5, align 8, !tbaa !172
  %8 = bitcast i64* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %8) #10
  store i64 0, i64* %6, align 8, !tbaa !113
  %9 = bitcast double* %5 to i8*
  %10 = call i8* @memcpy(i8* nonnull %8, i8* nonnull %9, i64 8) #12
  %11 = load i64, i64* %6, align 8, !tbaa !113
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
  %22 = call i8* @halide_string_to_string(i8* %0, i8* %1, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.57, i64 0, i64 0)) #13
  br label %172

23:                                               ; preds = %20
  %24 = call i8* @halide_string_to_string(i8* %0, i8* %1, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1.58, i64 0, i64 0)) #13
  br label %172

25:                                               ; preds = %17
  br i1 %19, label %28, label %26

26:                                               ; preds = %25
  %27 = call i8* @halide_string_to_string(i8* %0, i8* %1, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2.59, i64 0, i64 0)) #13
  br label %172

28:                                               ; preds = %25
  %29 = call i8* @halide_string_to_string(i8* %0, i8* %1, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3.60, i64 0, i64 0)) #13
  br label %172

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
  %39 = call i8* @halide_string_to_string(i8* %0, i8* %1, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.4.61, i64 0, i64 0)) #13
  br label %172

40:                                               ; preds = %37
  %41 = call i8* @halide_string_to_string(i8* %0, i8* %1, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.5.62, i64 0, i64 0)) #13
  br label %172

42:                                               ; preds = %34
  br i1 %36, label %45, label %43

43:                                               ; preds = %42
  %44 = call i8* @halide_string_to_string(i8* %0, i8* %1, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.6.63, i64 0, i64 0)) #13
  br label %172

45:                                               ; preds = %42
  %46 = call i8* @halide_string_to_string(i8* %0, i8* %1, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.7.64, i64 0, i64 0)) #13
  br label %172

47:                                               ; preds = %30
  %48 = icmp sgt i64 %11, -1
  br i1 %48, label %53, label %49

49:                                               ; preds = %47
  %50 = call i8* @halide_string_to_string(i8* %0, i8* %1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8.65, i64 0, i64 0)) #13
  %51 = load double, double* %5, align 8, !tbaa !172
  %52 = fneg double %51
  store double %52, double* %5, align 8, !tbaa !172
  br label %53

53:                                               ; preds = %49, %47
  %54 = phi i8* [ %50, %49 ], [ %0, %47 ]
  %55 = icmp eq i32 %3, 0
  br i1 %55, label %98, label %56

56:                                               ; preds = %53
  %57 = load double, double* %5, align 8, !tbaa !172
  %58 = fcmp olt double %57, 1.000000e+00
  br i1 %58, label %.preheader14, label %65

.preheader14:                                     ; preds = %.preheader14, %56
  %59 = phi i32 [ %62, %.preheader14 ], [ 0, %56 ]
  %60 = phi double [ %61, %.preheader14 ], [ %57, %56 ]
  %61 = fmul double %60, 1.000000e+01
  %62 = add nsw i32 %59, -1
  %63 = fcmp olt double %61, 1.000000e+00
  br i1 %63, label %.preheader14, label %64, !llvm.loop !278

64:                                               ; preds = %.preheader14
  store double %61, double* %5, align 8, !tbaa !172
  br label %65

65:                                               ; preds = %64, %56
  %66 = phi double [ %61, %64 ], [ %57, %56 ]
  %67 = phi i32 [ %62, %64 ], [ 0, %56 ]
  %68 = fcmp ult double %66, 1.000000e+01
  br i1 %68, label %75, label %.preheader13

.preheader13:                                     ; preds = %.preheader13, %65
  %69 = phi i32 [ %72, %.preheader13 ], [ %67, %65 ]
  %70 = phi double [ %71, %.preheader13 ], [ %66, %65 ]
  %71 = fdiv double %70, 1.000000e+01
  %72 = add nsw i32 %69, 1
  %73 = fcmp ult double %71, 1.000000e+01
  br i1 %73, label %74, label %.preheader13, !llvm.loop !279

74:                                               ; preds = %.preheader13
  store double %71, double* %5, align 8, !tbaa !172
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
  %84 = call i8* @halide_int64_to_string(i8* %54, i8* %1, i64 %81, i32 1) #13
  %85 = call i8* @halide_string_to_string(i8* %84, i8* %1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30.142, i64 0, i64 0)) #13
  %86 = call i8* @halide_int64_to_string(i8* %85, i8* %1, i64 %83, i32 6) #13
  %87 = icmp sgt i32 %77, -1
  br i1 %87, label %88, label %90

88:                                               ; preds = %75
  %89 = call i8* @halide_string_to_string(i8* %86, i8* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.10.67, i64 0, i64 0)) #13
  br label %93

90:                                               ; preds = %75
  %91 = call i8* @halide_string_to_string(i8* %86, i8* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.11.68, i64 0, i64 0)) #13
  %92 = sub nsw i32 0, %77
  br label %93

93:                                               ; preds = %90, %88
  %94 = phi i32 [ %77, %88 ], [ %92, %90 ]
  %95 = phi i8* [ %89, %88 ], [ %91, %90 ]
  %96 = zext i32 %94 to i64
  %97 = call i8* @halide_int64_to_string(i8* %95, i8* %1, i64 %96, i32 2) #13
  br label %172

98:                                               ; preds = %53
  br i1 %31, label %99, label %101

99:                                               ; preds = %98
  %100 = call i8* @halide_double_to_string(i8* %54, i8* %1, double 0.000000e+00, i32 0) #13
  br label %172

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
  call void @llvm.lifetime.start.p0i8(i64 512, i8* nonnull %137) #10
  %138 = getelementptr inbounds [512 x i8], [512 x i8]* %7, i64 0, i64 512
  %139 = getelementptr inbounds [512 x i8], [512 x i8]* %7, i64 0, i64 480
  %140 = call i8* @halide_int64_to_string(i8* nonnull %139, i8* nonnull %138, i64 %134, i32 1) #13
  %141 = icmp sgt i32 %135, 0
  br i1 %141, label %.preheader12, label %.loopexit

.preheader12:                                     ; preds = %168, %133
  %142 = phi i32 [ %170, %168 ], [ 0, %133 ]
  %143 = phi i8* [ %169, %168 ], [ %139, %133 ]
  %144 = icmp eq i8* %140, %143
  br i1 %144, label %168, label %.preheader

.loopexit:                                        ; preds = %168, %133
  %145 = phi i8* [ %139, %133 ], [ %169, %168 ]
  %146 = call i8* @halide_string_to_string(i8* %54, i8* %1, i8* %145) #13
  %147 = call i8* @halide_string_to_string(i8* %146, i8* %1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30.142, i64 0, i64 0)) #13
  %148 = call i8* @halide_int64_to_string(i8* %147, i8* %1, i64 %136, i32 6) #13
  call void @llvm.lifetime.end.p0i8(i64 512, i8* nonnull %137) #10
  br label %172

149:                                              ; preds = %.preheader
  br i1 %159, label %166, label %168

.preheader:                                       ; preds = %.preheader, %.preheader12
  %150 = phi i8* [ %152, %.preheader ], [ %140, %.preheader12 ]
  %151 = phi i32 [ %161, %.preheader ], [ 0, %.preheader12 ]
  %152 = getelementptr inbounds i8, i8* %150, i64 -1
  %153 = load i8, i8* %152, align 1, !tbaa !14
  %154 = add i8 %153, -48
  %155 = sext i8 %154 to i32
  %156 = shl nsw i32 %155, 1
  %157 = or i32 %156, %151
  %158 = trunc i32 %157 to i8
  %159 = icmp sgt i8 %158, 9
  %160 = add nsw i32 %157, 246
  %161 = zext i1 %159 to i32
  %162 = select i1 %159, i32 %160, i32 %157
  %163 = trunc i32 %162 to i8
  %164 = add i8 %163, 48
  store i8 %164, i8* %152, align 1, !tbaa !14
  %165 = icmp eq i8* %152, %143
  br i1 %165, label %149, label %.preheader, !llvm.loop !280

166:                                              ; preds = %149
  %167 = getelementptr inbounds i8, i8* %143, i64 -1
  store i8 49, i8* %167, align 1, !tbaa !14
  br label %168

168:                                              ; preds = %166, %149, %.preheader12
  %169 = phi i8* [ %167, %166 ], [ %143, %149 ], [ %140, %.preheader12 ]
  %170 = add nuw nsw i32 %142, 1
  %171 = icmp eq i32 %170, %135
  br i1 %171, label %.loopexit, label %.preheader12, !llvm.loop !281

172:                                              ; preds = %.loopexit, %99, %93, %45, %43, %40, %38, %28, %26, %23, %21
  %173 = phi i8* [ %22, %21 ], [ %24, %23 ], [ %27, %26 ], [ %29, %28 ], [ %39, %38 ], [ %41, %40 ], [ %44, %43 ], [ %46, %45 ], [ %100, %99 ], [ %97, %93 ], [ %148, %.loopexit ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %8) #10
  ret i8* %173
}

; Function Attrs: nounwind mustprogress
define weak i8* @halide_pointer_to_string(i8* %0, i8* %1, i8* %2) local_unnamed_addr #0 {
  %4 = alloca [20 x i8], align 1
  %5 = getelementptr inbounds [20 x i8], [20 x i8]* %4, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 20, i8* nonnull %5) #10
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(20) %5, i8 0, i64 20, i1 false)
  %6 = getelementptr inbounds [20 x i8], [20 x i8]* %4, i64 0, i64 18
  %7 = ptrtoint i8* %2 to i64
  %8 = and i64 %7, 15
  %9 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.12.71, i64 0, i64 %8
  %10 = load i8, i8* %9, align 1, !tbaa !14
  %11 = getelementptr inbounds [20 x i8], [20 x i8]* %4, i64 0, i64 17
  store i8 %10, i8* %6, align 1, !tbaa !14
  %12 = lshr i64 %7, 4
  %13 = icmp eq i64 %12, 0
  br i1 %13, label %21, label %14

14:                                               ; preds = %3
  %15 = and i64 %12, 15
  %16 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.12.71, i64 0, i64 %15
  %17 = load i8, i8* %16, align 1, !tbaa !14
  %18 = getelementptr inbounds [20 x i8], [20 x i8]* %4, i64 0, i64 16
  store i8 %17, i8* %11, align 1, !tbaa !14
  %19 = lshr i64 %7, 8
  %20 = icmp eq i64 %19, 0
  br i1 %20, label %21, label %26

21:                                               ; preds = %117, %110, %103, %96, %89, %82, %75, %68, %61, %54, %47, %40, %33, %26, %14, %3
  %22 = phi i8* [ %6, %3 ], [ %11, %14 ], [ %18, %26 ], [ %30, %33 ], [ %37, %40 ], [ %44, %47 ], [ %51, %54 ], [ %58, %61 ], [ %65, %68 ], [ %72, %75 ], [ %79, %82 ], [ %86, %89 ], [ %93, %96 ], [ %100, %103 ], [ %107, %110 ], [ %114, %117 ]
  %23 = phi i8* [ %11, %3 ], [ %18, %14 ], [ %30, %26 ], [ %37, %33 ], [ %44, %40 ], [ %51, %47 ], [ %58, %54 ], [ %65, %61 ], [ %72, %68 ], [ %79, %75 ], [ %86, %82 ], [ %93, %89 ], [ %100, %96 ], [ %107, %103 ], [ %114, %110 ], [ %120, %117 ]
  %24 = getelementptr inbounds i8, i8* %22, i64 -2
  store i8 120, i8* %23, align 1, !tbaa !14
  store i8 48, i8* %24, align 1, !tbaa !14
  %25 = call i8* @halide_string_to_string(i8* %0, i8* %1, i8* nonnull %24) #13
  call void @llvm.lifetime.end.p0i8(i64 20, i8* nonnull %5) #10
  ret i8* %25

26:                                               ; preds = %14
  %27 = and i64 %19, 15
  %28 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.12.71, i64 0, i64 %27
  %29 = load i8, i8* %28, align 1, !tbaa !14
  %30 = getelementptr inbounds [20 x i8], [20 x i8]* %4, i64 0, i64 15
  store i8 %29, i8* %18, align 1, !tbaa !14
  %31 = lshr i64 %7, 12
  %32 = icmp eq i64 %31, 0
  br i1 %32, label %21, label %33

33:                                               ; preds = %26
  %34 = and i64 %31, 15
  %35 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.12.71, i64 0, i64 %34
  %36 = load i8, i8* %35, align 1, !tbaa !14
  %37 = getelementptr inbounds [20 x i8], [20 x i8]* %4, i64 0, i64 14
  store i8 %36, i8* %30, align 1, !tbaa !14
  %38 = lshr i64 %7, 16
  %39 = icmp eq i64 %38, 0
  br i1 %39, label %21, label %40

40:                                               ; preds = %33
  %41 = and i64 %38, 15
  %42 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.12.71, i64 0, i64 %41
  %43 = load i8, i8* %42, align 1, !tbaa !14
  %44 = getelementptr inbounds [20 x i8], [20 x i8]* %4, i64 0, i64 13
  store i8 %43, i8* %37, align 1, !tbaa !14
  %45 = lshr i64 %7, 20
  %46 = icmp eq i64 %45, 0
  br i1 %46, label %21, label %47

47:                                               ; preds = %40
  %48 = and i64 %45, 15
  %49 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.12.71, i64 0, i64 %48
  %50 = load i8, i8* %49, align 1, !tbaa !14
  %51 = getelementptr inbounds [20 x i8], [20 x i8]* %4, i64 0, i64 12
  store i8 %50, i8* %44, align 1, !tbaa !14
  %52 = lshr i64 %7, 24
  %53 = icmp eq i64 %52, 0
  br i1 %53, label %21, label %54

54:                                               ; preds = %47
  %55 = and i64 %52, 15
  %56 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.12.71, i64 0, i64 %55
  %57 = load i8, i8* %56, align 1, !tbaa !14
  %58 = getelementptr inbounds [20 x i8], [20 x i8]* %4, i64 0, i64 11
  store i8 %57, i8* %51, align 1, !tbaa !14
  %59 = lshr i64 %7, 28
  %60 = icmp eq i64 %59, 0
  br i1 %60, label %21, label %61

61:                                               ; preds = %54
  %62 = and i64 %59, 15
  %63 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.12.71, i64 0, i64 %62
  %64 = load i8, i8* %63, align 1, !tbaa !14
  %65 = getelementptr inbounds [20 x i8], [20 x i8]* %4, i64 0, i64 10
  store i8 %64, i8* %58, align 1, !tbaa !14
  %66 = lshr i64 %7, 32
  %67 = icmp eq i64 %66, 0
  br i1 %67, label %21, label %68

68:                                               ; preds = %61
  %69 = and i64 %66, 15
  %70 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.12.71, i64 0, i64 %69
  %71 = load i8, i8* %70, align 1, !tbaa !14
  %72 = getelementptr inbounds [20 x i8], [20 x i8]* %4, i64 0, i64 9
  store i8 %71, i8* %65, align 1, !tbaa !14
  %73 = lshr i64 %7, 36
  %74 = icmp eq i64 %73, 0
  br i1 %74, label %21, label %75

75:                                               ; preds = %68
  %76 = and i64 %73, 15
  %77 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.12.71, i64 0, i64 %76
  %78 = load i8, i8* %77, align 1, !tbaa !14
  %79 = getelementptr inbounds [20 x i8], [20 x i8]* %4, i64 0, i64 8
  store i8 %78, i8* %72, align 1, !tbaa !14
  %80 = lshr i64 %7, 40
  %81 = icmp eq i64 %80, 0
  br i1 %81, label %21, label %82

82:                                               ; preds = %75
  %83 = and i64 %80, 15
  %84 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.12.71, i64 0, i64 %83
  %85 = load i8, i8* %84, align 1, !tbaa !14
  %86 = getelementptr inbounds [20 x i8], [20 x i8]* %4, i64 0, i64 7
  store i8 %85, i8* %79, align 1, !tbaa !14
  %87 = lshr i64 %7, 44
  %88 = icmp eq i64 %87, 0
  br i1 %88, label %21, label %89

89:                                               ; preds = %82
  %90 = and i64 %87, 15
  %91 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.12.71, i64 0, i64 %90
  %92 = load i8, i8* %91, align 1, !tbaa !14
  %93 = getelementptr inbounds [20 x i8], [20 x i8]* %4, i64 0, i64 6
  store i8 %92, i8* %86, align 1, !tbaa !14
  %94 = lshr i64 %7, 48
  %95 = icmp eq i64 %94, 0
  br i1 %95, label %21, label %96

96:                                               ; preds = %89
  %97 = and i64 %94, 15
  %98 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.12.71, i64 0, i64 %97
  %99 = load i8, i8* %98, align 1, !tbaa !14
  %100 = getelementptr inbounds [20 x i8], [20 x i8]* %4, i64 0, i64 5
  store i8 %99, i8* %93, align 1, !tbaa !14
  %101 = lshr i64 %7, 52
  %102 = icmp eq i64 %101, 0
  br i1 %102, label %21, label %103

103:                                              ; preds = %96
  %104 = and i64 %101, 15
  %105 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.12.71, i64 0, i64 %104
  %106 = load i8, i8* %105, align 1, !tbaa !14
  %107 = getelementptr inbounds [20 x i8], [20 x i8]* %4, i64 0, i64 4
  store i8 %106, i8* %100, align 1, !tbaa !14
  %108 = lshr i64 %7, 56
  %109 = icmp eq i64 %108, 0
  br i1 %109, label %21, label %110

110:                                              ; preds = %103
  %111 = and i64 %108, 15
  %112 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.12.71, i64 0, i64 %111
  %113 = load i8, i8* %112, align 1, !tbaa !14
  %114 = getelementptr inbounds [20 x i8], [20 x i8]* %4, i64 0, i64 3
  store i8 %113, i8* %107, align 1, !tbaa !14
  %115 = lshr i64 %7, 60
  %116 = icmp eq i64 %115, 0
  br i1 %116, label %21, label %117

117:                                              ; preds = %110
  %118 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.12.71, i64 0, i64 %115
  %119 = load i8, i8* %118, align 1, !tbaa !14
  %120 = getelementptr inbounds [20 x i8], [20 x i8]* %4, i64 0, i64 2
  store i8 %119, i8* %114, align 1, !tbaa !14
  br label %21
}

; Function Attrs: nounwind mustprogress
define weak i8* @halide_type_to_string(i8* %0, i8* %1, %struct.halide_type_t* %2) local_unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %2, i64 0, i32 0
  %5 = load i8, i8* %4, align 2, !tbaa !282
  %6 = icmp ult i8 %5, 4
  br i1 %6, label %switch.lookup, label %8

switch.lookup:                                    ; preds = %3
  %7 = sext i8 %5 to i64
  %switch.gep = getelementptr inbounds [4 x i8*], [4 x i8*]* @switch.table.halide_type_to_string, i64 0, i64 %7
  %switch.load = load i8*, i8** %switch.gep, align 8
  br label %8

8:                                                ; preds = %switch.lookup, %3
  %9 = phi i8* [ %switch.load, %switch.lookup ], [ getelementptr inbounds ([14 x i8], [14 x i8]* @.str.17.72, i64 0, i64 0), %3 ]
  %10 = tail call i8* @halide_string_to_string(i8* %0, i8* %1, i8* nonnull %9) #13
  %11 = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %2, i64 0, i32 1
  %12 = load i8, i8* %11, align 1, !tbaa !139
  %13 = zext i8 %12 to i64
  %14 = tail call i8* @halide_uint64_to_string(i8* %10, i8* %1, i64 %13, i32 1) #13
  %15 = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %2, i64 0, i32 2
  %16 = load i16, i16* %15, align 2, !tbaa !283
  %17 = icmp eq i16 %16, 1
  br i1 %17, label %23, label %18

18:                                               ; preds = %8
  %19 = tail call i8* @halide_string_to_string(i8* %14, i8* %1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.18.77, i64 0, i64 0)) #13
  %20 = load i16, i16* %15, align 2, !tbaa !283
  %21 = zext i16 %20 to i64
  %22 = tail call i8* @halide_uint64_to_string(i8* %19, i8* %1, i64 %21, i32 1) #13
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
  %6 = tail call i8* @halide_string_to_string(i8* %0, i8* %1, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.19.78, i64 0, i64 0)) #13
  br label %61

7:                                                ; preds = %3
  %8 = tail call i8* @halide_string_to_string(i8* %0, i8* %1, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.20.79, i64 0, i64 0)) #13
  %9 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %2, i64 0, i32 0
  %10 = load i64, i64* %9, align 8, !tbaa !183
  %11 = tail call i8* @halide_uint64_to_string(i8* %8, i8* %1, i64 %10, i32 1) #13
  %12 = tail call i8* @halide_string_to_string(i8* %11, i8* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i64 0, i64 0)) #13
  %13 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %2, i64 0, i32 1
  %14 = bitcast %struct.halide_device_interface_t** %13 to i8**
  %15 = load i8*, i8** %14, align 8, !tbaa !284
  %16 = tail call i8* @halide_pointer_to_string(i8* %12, i8* %1, i8* %15) #13
  %17 = tail call i8* @halide_string_to_string(i8* %16, i8* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i64 0, i64 0)) #13
  %18 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %2, i64 0, i32 2
  %19 = load i8*, i8** %18, align 8, !tbaa !181
  %20 = tail call i8* @halide_pointer_to_string(i8* %17, i8* %1, i8* %19) #13
  %21 = tail call i8* @halide_string_to_string(i8* %20, i8* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i64 0, i64 0)) #13
  %22 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %2, i64 0, i32 3
  %23 = load i64, i64* %22, align 8, !tbaa !285
  %24 = tail call i8* @halide_uint64_to_string(i8* %21, i8* %1, i64 %23, i32 1) #13
  %25 = tail call i8* @halide_string_to_string(i8* %24, i8* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i64 0, i64 0)) #13
  %26 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %2, i64 0, i32 4
  %27 = tail call i8* @halide_type_to_string(i8* %25, i8* %1, %struct.halide_type_t* nonnull %26) #13
  %28 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %2, i64 0, i32 5
  %29 = load i32, i32* %28, align 4, !tbaa !184
  %30 = icmp sgt i32 %29, 0
  br i1 %30, label %31, label %.loopexit

31:                                               ; preds = %7
  %32 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %2, i64 0, i32 6
  br label %35

.loopexit:                                        ; preds = %35, %7
  %33 = phi i8* [ %27, %7 ], [ %56, %35 ]
  %34 = tail call i8* @halide_string_to_string(i8* %33, i8* %1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8.120, i64 0, i64 0)) #13
  br label %61

35:                                               ; preds = %35, %31
  %36 = phi i64 [ 0, %31 ], [ %57, %35 ]
  %37 = phi i8* [ %27, %31 ], [ %56, %35 ]
  %38 = tail call i8* @halide_string_to_string(i8* %37, i8* %1, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.22.82, i64 0, i64 0)) #13
  %39 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %32, align 8, !tbaa !185
  %40 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %39, i64 %36, i32 0
  %41 = load i32, i32* %40, align 4, !tbaa !190
  %42 = sext i32 %41 to i64
  %43 = tail call i8* @halide_int64_to_string(i8* %38, i8* %1, i64 %42, i32 1) #13
  %44 = tail call i8* @halide_string_to_string(i8* %43, i8* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i64 0, i64 0)) #13
  %45 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %32, align 8, !tbaa !185
  %46 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %45, i64 %36, i32 1
  %47 = load i32, i32* %46, align 4, !tbaa !187
  %48 = sext i32 %47 to i64
  %49 = tail call i8* @halide_int64_to_string(i8* %44, i8* %1, i64 %48, i32 1) #13
  %50 = tail call i8* @halide_string_to_string(i8* %49, i8* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i64 0, i64 0)) #13
  %51 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %32, align 8, !tbaa !185
  %52 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %51, i64 %36, i32 2
  %53 = load i32, i32* %52, align 4, !tbaa !191
  %54 = sext i32 %53 to i64
  %55 = tail call i8* @halide_int64_to_string(i8* %50, i8* %1, i64 %54, i32 1) #13
  %56 = tail call i8* @halide_string_to_string(i8* %55, i8* %1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.23.83, i64 0, i64 0)) #13
  %57 = add nuw nsw i64 %36, 1
  %58 = load i32, i32* %28, align 4, !tbaa !184
  %59 = sext i32 %58 to i64
  %60 = icmp slt i64 %57, %59
  br i1 %60, label %35, label %.loopexit, !llvm.loop !286

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
  store i8 %3, i8* @_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE, align 1, !tbaa !15
  br i1 %1, label %18, label %4

4:                                                ; preds = %2
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal21allocation_pools_lockE) #12
  %5 = load %struct.halide_device_allocation_pool*, %struct.halide_device_allocation_pool** @_ZN6Halide7Runtime8Internal23device_allocation_poolsE, align 8, !tbaa !10
  %6 = icmp eq %struct.halide_device_allocation_pool* %5, null
  br i1 %6, label %.loopexit, label %.preheader

.loopexit:                                        ; preds = %.preheader, %4
  %7 = phi i32 [ 0, %4 ], [ %14, %.preheader ]
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal21allocation_pools_lockE) #12
  br label %18

.preheader:                                       ; preds = %.preheader, %4
  %8 = phi %struct.halide_device_allocation_pool* [ %16, %.preheader ], [ %5, %4 ]
  %9 = phi i32 [ %14, %.preheader ], [ 0, %4 ]
  %10 = getelementptr inbounds %struct.halide_device_allocation_pool, %struct.halide_device_allocation_pool* %8, i64 0, i32 0
  %11 = load i32 (i8*)*, i32 (i8*)** %10, align 8, !tbaa !287
  %12 = tail call i32 %11(i8* %0) #12
  %13 = icmp eq i32 %12, 0
  %14 = select i1 %13, i32 %9, i32 %12
  %15 = getelementptr inbounds %struct.halide_device_allocation_pool, %struct.halide_device_allocation_pool* %8, i64 0, i32 1
  %16 = load %struct.halide_device_allocation_pool*, %struct.halide_device_allocation_pool** %15, align 8, !tbaa !10
  %17 = icmp eq %struct.halide_device_allocation_pool* %16, null
  br i1 %17, label %.loopexit, label %.preheader, !llvm.loop !289

18:                                               ; preds = %.loopexit, %2
  %19 = phi i32 [ 0, %2 ], [ %7, %.loopexit ]
  ret i32 %19
}

; Function Attrs: nounwind willreturn mustprogress
define weak zeroext i1 @halide_can_reuse_device_allocations(i8* %0) local_unnamed_addr #2 {
  %2 = load i8, i8* @_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE, align 1, !tbaa !15, !range !17
  %3 = icmp ne i8 %2, 0
  ret i1 %3
}

; Function Attrs: nounwind
define weak void @halide_register_device_allocation_pool(%struct.halide_device_allocation_pool* %0) local_unnamed_addr #4 {
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal21allocation_pools_lockE) #12
  %2 = load %struct.halide_device_allocation_pool*, %struct.halide_device_allocation_pool** @_ZN6Halide7Runtime8Internal23device_allocation_poolsE, align 8, !tbaa !10
  %3 = getelementptr inbounds %struct.halide_device_allocation_pool, %struct.halide_device_allocation_pool* %0, i64 0, i32 1
  store %struct.halide_device_allocation_pool* %2, %struct.halide_device_allocation_pool** %3, align 8, !tbaa !290
  store %struct.halide_device_allocation_pool* %0, %struct.halide_device_allocation_pool** @_ZN6Halide7Runtime8Internal23device_allocation_poolsE, align 8, !tbaa !10
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal21allocation_pools_lockE) #12
  ret void
}

; Function Attrs: nounwind mustprogress
define linkonce i32 @_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t(i8* %0, %struct.halide_buffer_t* %1) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %4 = load i64, i64* %3, align 8, !tbaa !285
  %5 = and i64 %4, 2
  %6 = icmp eq i64 %5, 0
  br i1 %6, label %25, label %7

7:                                                ; preds = %2
  %8 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %9 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %8, align 8, !tbaa !284
  %10 = and i64 %4, 1
  %11 = icmp eq i64 %10, 0
  br i1 %11, label %12, label %25

12:                                               ; preds = %7
  %13 = icmp eq %struct.halide_device_interface_t* %9, null
  br i1 %13, label %25, label %14

14:                                               ; preds = %12
  %15 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %9, i64 0, i32 15
  %16 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %15, align 8, !tbaa !291
  %17 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %16, i64 0, i32 6
  %18 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %17, align 8, !tbaa !293
  %19 = tail call i32 %18(i8* %0, %struct.halide_buffer_t* nonnull %1) #12
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %21, label %25

21:                                               ; preds = %14
  %22 = load i64, i64* %3, align 8, !tbaa !285
  %23 = and i64 %22, -3
  store i64 %23, i64* %3, align 8, !tbaa !285
  %24 = tail call i32 @halide_msan_annotate_buffer_is_initialized(i8* %0, %struct.halide_buffer_t* nonnull %1) #12
  br label %25

25:                                               ; preds = %21, %14, %12, %7, %2
  %26 = phi i32 [ 0, %2 ], [ 0, %21 ], [ -14, %7 ], [ -19, %12 ], [ -14, %14 ]
  ret i32 %26
}

; Function Attrs: nounwind mustprogress
define weak void @halide_device_release(i8* %0, %struct.halide_device_interface_t* %1) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %1, i64 0, i32 15
  %4 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %3, align 8, !tbaa !291
  %5 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %4, i64 0, i32 5
  %6 = load i32 (i8*)*, i32 (i8*)** %5, align 8, !tbaa !295
  %7 = tail call i32 %6(i8* %0) #12
  ret void
}

; Function Attrs: nounwind
define weak i32 @halide_copy_to_host(i8* %0, %struct.halide_buffer_t* %1) local_unnamed_addr #4 {
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #12
  %3 = icmp eq %struct.halide_buffer_t* %1, null
  br i1 %3, label %4, label %6

4:                                                ; preds = %2
  %5 = tail call i32 @halide_error_buffer_is_null(i8* %0, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.6.88, i64 0, i64 0)) #12
  br label %30

6:                                                ; preds = %2
  %7 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %8 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %7, align 8, !tbaa !284
  %9 = icmp eq %struct.halide_device_interface_t* %8, null
  %10 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %11 = load i64, i64* %10, align 8, !tbaa !183
  %12 = icmp eq i64 %11, 0
  %13 = xor i1 %9, true
  %14 = or i1 %12, %13
  br i1 %14, label %17, label %15

15:                                               ; preds = %6
  %16 = tail call i32 @halide_error_no_device_interface(i8* %0) #12
  br label %30

17:                                               ; preds = %6
  %18 = xor i1 %12, true
  %19 = or i1 %9, %18
  br i1 %19, label %22, label %20

20:                                               ; preds = %17
  %21 = tail call i32 @halide_error_device_interface_no_device(i8* %0) #12
  br label %30

22:                                               ; preds = %17
  %23 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %24 = load i64, i64* %23, align 8, !tbaa !285
  %25 = and i64 %24, 3
  %26 = icmp eq i64 %25, 3
  br i1 %26, label %28, label %.split

.split:                                           ; preds = %22
  %27 = tail call i32 @_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t(i8* %0, %struct.halide_buffer_t* nonnull %1) #13
  br label %34

28:                                               ; preds = %22
  %29 = tail call i32 @halide_error_host_and_device_dirty(i8* %0) #12
  br label %30

30:                                               ; preds = %28, %20, %15, %4
  %31 = phi i32 [ %5, %4 ], [ %21, %20 ], [ %16, %15 ], [ %29, %28 ]
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %.split1, label %34

.split1:                                          ; preds = %30
  %33 = tail call i32 @_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t(i8* %0, %struct.halide_buffer_t* %1) #13
  br label %34

34:                                               ; preds = %.split1, %30, %.split
  %35 = phi i32 [ %31, %30 ], [ %27, %.split ], [ %33, %.split1 ]
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #12
  ret i32 %35
}

; Function Attrs: nounwind mustprogress
define linkonce i32 @copy_to_device_already_locked(i8* %0, %struct.halide_buffer_t* %1, %struct.halide_device_interface_t* %2) local_unnamed_addr #0 {
  %4 = icmp eq %struct.halide_buffer_t* %1, null
  br i1 %4, label %5, label %7

5:                                                ; preds = %3
  %6 = tail call i32 @halide_error_buffer_is_null(i8* %0, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.7.89, i64 0, i64 0)) #12
  br label %30

7:                                                ; preds = %3
  %8 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %9 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %8, align 8, !tbaa !284
  %10 = icmp eq %struct.halide_device_interface_t* %9, null
  %11 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %12 = load i64, i64* %11, align 8, !tbaa !183
  %13 = icmp eq i64 %12, 0
  %14 = xor i1 %10, true
  %15 = or i1 %13, %14
  br i1 %15, label %18, label %16

16:                                               ; preds = %7
  %17 = tail call i32 @halide_error_no_device_interface(i8* %0) #12
  br label %30

18:                                               ; preds = %7
  %19 = xor i1 %13, true
  %20 = or i1 %10, %19
  br i1 %20, label %23, label %21

21:                                               ; preds = %18
  %22 = tail call i32 @halide_error_device_interface_no_device(i8* %0) #12
  br label %30

23:                                               ; preds = %18
  %24 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %25 = load i64, i64* %24, align 8, !tbaa !285
  %26 = and i64 %25, 3
  %27 = icmp eq i64 %26, 3
  br i1 %27, label %28, label %33

28:                                               ; preds = %23
  %29 = tail call i32 @halide_error_host_and_device_dirty(i8* %0) #12
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
  %37 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %36, align 8, !tbaa !284
  %38 = icmp eq %struct.halide_device_interface_t* %37, null
  br i1 %38, label %39, label %41

39:                                               ; preds = %35
  %40 = tail call i32 @halide_error_no_device_interface(i8* %0) #12
  br label %72

41:                                               ; preds = %35, %33
  %42 = phi %struct.halide_device_interface_t* [ %2, %33 ], [ %37, %35 ]
  %43 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %44 = load i64, i64* %43, align 8, !tbaa !183
  %45 = icmp eq i64 %44, 0
  br i1 %45, label %51, label %46

46:                                               ; preds = %41
  %47 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %48 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %47, align 8, !tbaa !284
  %49 = icmp eq %struct.halide_device_interface_t* %48, %42
  br i1 %49, label %54, label %50

50:                                               ; preds = %46
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([61 x i8], [61 x i8]* @.str.9.90, i64 0, i64 0)) #12
  br label %72

51:                                               ; preds = %41
  %52 = tail call i32 @halide_device_malloc(i8* %0, %struct.halide_buffer_t* nonnull %1, %struct.halide_device_interface_t* nonnull %42) #13
  %53 = icmp eq i32 %52, 0
  br i1 %53, label %54, label %72

54:                                               ; preds = %51, %46
  %55 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %56 = load i64, i64* %55, align 8, !tbaa !285
  %57 = and i64 %56, 1
  %58 = icmp eq i64 %57, 0
  br i1 %58, label %72, label %59

59:                                               ; preds = %54
  %60 = and i64 %56, 2
  %61 = icmp eq i64 %60, 0
  br i1 %61, label %62, label %72

62:                                               ; preds = %59
  %63 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %42, i64 0, i32 15
  %64 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %63, align 8, !tbaa !291
  %65 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %64, i64 0, i32 7
  %66 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %65, align 8, !tbaa !296
  %67 = tail call i32 %66(i8* %0, %struct.halide_buffer_t* nonnull %1) #12
  %68 = icmp eq i32 %67, 0
  br i1 %68, label %69, label %72

69:                                               ; preds = %62
  %70 = load i64, i64* %55, align 8, !tbaa !285
  %71 = and i64 %70, -2
  store i64 %71, i64* %55, align 8, !tbaa !285
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
  %6 = tail call i32 @halide_error_buffer_is_null(i8* %0, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.17.91, i64 0, i64 0)) #12
  br label %30

7:                                                ; preds = %3
  %8 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %9 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %8, align 8, !tbaa !284
  %10 = icmp eq %struct.halide_device_interface_t* %9, null
  %11 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %12 = load i64, i64* %11, align 8, !tbaa !183
  %13 = icmp eq i64 %12, 0
  %14 = xor i1 %10, true
  %15 = or i1 %13, %14
  br i1 %15, label %18, label %16

16:                                               ; preds = %7
  %17 = tail call i32 @halide_error_no_device_interface(i8* %0) #12
  br label %30

18:                                               ; preds = %7
  %19 = xor i1 %13, true
  %20 = or i1 %10, %19
  br i1 %20, label %23, label %21

21:                                               ; preds = %18
  %22 = tail call i32 @halide_error_device_interface_no_device(i8* %0) #12
  br label %30

23:                                               ; preds = %18
  %24 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %25 = load i64, i64* %24, align 8, !tbaa !285
  %26 = and i64 %25, 3
  %27 = icmp eq i64 %26, 3
  br i1 %27, label %28, label %36

28:                                               ; preds = %23
  %29 = tail call i32 @halide_error_host_and_device_dirty(i8* %0) #12
  br label %30

30:                                               ; preds = %28, %21, %16, %5
  %31 = phi i32 [ %6, %5 ], [ %22, %21 ], [ %17, %16 ], [ %29, %28 ]
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %33, label %56

33:                                               ; preds = %30
  %34 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %35 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %34, align 8, !tbaa !284
  br label %36

36:                                               ; preds = %33, %23
  %37 = phi %struct.halide_device_interface_t* [ %35, %33 ], [ %9, %23 ]
  %38 = icmp eq %struct.halide_device_interface_t* %37, null
  %39 = icmp eq %struct.halide_device_interface_t* %37, %2
  %40 = or i1 %38, %39
  br i1 %40, label %42, label %41

41:                                               ; preds = %36
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.20.92, i64 0, i64 0)) #12
  br label %56

42:                                               ; preds = %36
  %43 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %2, i64 0, i32 15
  %44 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %43, align 8, !tbaa !291
  %45 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %44, i64 0, i32 0
  %46 = load void ()*, void ()** %45, align 8, !tbaa !297
  tail call void %46() #12
  %47 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %43, align 8, !tbaa !291
  %48 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %47, i64 0, i32 2
  %49 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %48, align 8, !tbaa !298
  %50 = tail call i32 %49(i8* %0, %struct.halide_buffer_t* nonnull %1) #12
  %51 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %43, align 8, !tbaa !291
  %52 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %51, i64 0, i32 1
  %53 = load void ()*, void ()** %52, align 8, !tbaa !299
  tail call void %53() #12
  %54 = icmp eq i32 %50, 0
  %55 = select i1 %54, i32 0, i32 -16
  ret i32 %55

56:                                               ; preds = %41, %30
  %57 = phi i32 [ %31, %30 ], [ -42, %41 ]
  ret i32 %57
}

; Function Attrs: nounwind
define weak i32 @halide_copy_to_device(i8* %0, %struct.halide_buffer_t* %1, %struct.halide_device_interface_t* %2) local_unnamed_addr #4 {
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #12
  %4 = tail call i32 @copy_to_device_already_locked(i8* %0, %struct.halide_buffer_t* %1, %struct.halide_device_interface_t* %2) #13
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #12
  ret i32 %4
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_device_sync(i8* %0, %struct.halide_buffer_t* %1) local_unnamed_addr #0 {
  %3 = icmp eq %struct.halide_buffer_t* %1, null
  br i1 %3, label %4, label %6

4:                                                ; preds = %2
  %5 = tail call i32 @halide_error_buffer_is_null(i8* %0, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.16.93, i64 0, i64 0)) #12
  br label %29

6:                                                ; preds = %2
  %7 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %8 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %7, align 8, !tbaa !284
  %9 = icmp eq %struct.halide_device_interface_t* %8, null
  %10 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %11 = load i64, i64* %10, align 8, !tbaa !183
  %12 = icmp eq i64 %11, 0
  %13 = xor i1 %9, true
  %14 = or i1 %12, %13
  br i1 %14, label %17, label %15

15:                                               ; preds = %6
  %16 = tail call i32 @halide_error_no_device_interface(i8* %0) #12
  br label %29

17:                                               ; preds = %6
  %18 = xor i1 %12, true
  %19 = or i1 %9, %18
  br i1 %19, label %22, label %20

20:                                               ; preds = %17
  %21 = tail call i32 @halide_error_device_interface_no_device(i8* %0) #12
  br label %29

22:                                               ; preds = %17
  %23 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %24 = load i64, i64* %23, align 8, !tbaa !285
  %25 = and i64 %24, 3
  %26 = icmp eq i64 %25, 3
  br i1 %26, label %27, label %35

27:                                               ; preds = %22
  %28 = tail call i32 @halide_error_host_and_device_dirty(i8* %0) #12
  br label %29

29:                                               ; preds = %27, %20, %15, %4
  %30 = phi i32 [ %5, %4 ], [ %21, %20 ], [ %16, %15 ], [ %28, %27 ]
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %48

32:                                               ; preds = %29
  %33 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %34 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %33, align 8, !tbaa !284
  br label %35

35:                                               ; preds = %32, %22
  %36 = phi %struct.halide_device_interface_t* [ %34, %32 ], [ %8, %22 ]
  %37 = icmp eq %struct.halide_device_interface_t* %36, null
  br i1 %37, label %38, label %40

38:                                               ; preds = %35
  %39 = tail call i32 @halide_error_no_device_interface(i8* %0) #12
  br label %48

40:                                               ; preds = %35
  %41 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %36, i64 0, i32 15
  %42 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %41, align 8, !tbaa !291
  %43 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %42, i64 0, i32 4
  %44 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %43, align 8, !tbaa !300
  %45 = tail call i32 %44(i8* %0, %struct.halide_buffer_t* nonnull %1) #12
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
  %5 = tail call i32 @halide_error_buffer_is_null(i8* %0, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.21.96, i64 0, i64 0)) #12
  br label %29

6:                                                ; preds = %2
  %7 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %8 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %7, align 8, !tbaa !284
  %9 = icmp eq %struct.halide_device_interface_t* %8, null
  %10 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %11 = load i64, i64* %10, align 8, !tbaa !183
  %12 = icmp eq i64 %11, 0
  %13 = xor i1 %9, true
  %14 = or i1 %12, %13
  br i1 %14, label %17, label %15

15:                                               ; preds = %6
  %16 = tail call i32 @halide_error_no_device_interface(i8* %0) #12
  br label %29

17:                                               ; preds = %6
  %18 = xor i1 %12, true
  %19 = or i1 %9, %18
  br i1 %19, label %22, label %20

20:                                               ; preds = %17
  %21 = tail call i32 @halide_error_device_interface_no_device(i8* %0) #12
  br label %29

22:                                               ; preds = %17
  %23 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %24 = load i64, i64* %23, align 8, !tbaa !285
  %25 = and i64 %24, 3
  %26 = icmp eq i64 %25, 3
  br i1 %26, label %27, label %35

27:                                               ; preds = %22
  %28 = tail call i32 @halide_error_host_and_device_dirty(i8* %0) #12
  br label %29

29:                                               ; preds = %27, %20, %15, %4
  %30 = phi i32 [ %5, %4 ], [ %21, %20 ], [ %16, %15 ], [ %28, %27 ]
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %61

32:                                               ; preds = %29
  %33 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %34 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %33, align 8, !tbaa !284
  br label %35

35:                                               ; preds = %32, %22
  %36 = phi %struct.halide_device_interface_t* [ %34, %32 ], [ %8, %22 ]
  %37 = icmp eq %struct.halide_device_interface_t* %36, null
  br i1 %37, label %57, label %38

38:                                               ; preds = %35
  %39 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %36, i64 0, i32 15
  %40 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %39, align 8, !tbaa !291
  %41 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %40, i64 0, i32 0
  %42 = load void ()*, void ()** %41, align 8, !tbaa !297
  tail call void %42() #12
  %43 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %39, align 8, !tbaa !291
  %44 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %43, i64 0, i32 3
  %45 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %44, align 8, !tbaa !301
  %46 = tail call i32 %45(i8* %0, %struct.halide_buffer_t* nonnull %1) #12
  %47 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %39, align 8, !tbaa !291
  %48 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %47, i64 0, i32 1
  %49 = load void ()*, void ()** %48, align 8, !tbaa !299
  tail call void %49() #12
  %50 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %51 = load i64, i64* %50, align 8, !tbaa !183
  %52 = icmp eq i64 %51, 0
  br i1 %52, label %54, label %53

53:                                               ; preds = %38
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([91 x i8], [91 x i8]* @.str.22.97, i64 0, i64 0)) #12
  tail call void @abort() #12
  br label %54

54:                                               ; preds = %53, %38
  %55 = icmp eq i32 %46, 0
  %56 = select i1 %55, i32 0, i32 -18
  ret i32 %56

57:                                               ; preds = %35
  %58 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %59 = load i64, i64* %58, align 8, !tbaa !285
  %60 = and i64 %59, -3
  store i64 %60, i64* %58, align 8, !tbaa !285
  br label %61

61:                                               ; preds = %57, %29
  %62 = phi i32 [ %30, %29 ], [ 0, %57 ]
  ret i32 %62
}

; Function Attrs: nounwind mustprogress
define weak void @halide_device_free_as_destructor(i8* %0, i8* %1) local_unnamed_addr #0 {
  %3 = bitcast i8* %1 to %struct.halide_buffer_t*
  %4 = tail call i32 @halide_device_free(i8* %0, %struct.halide_buffer_t* %3) #13
  ret void
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_device_and_host_malloc(i8* %0, %struct.halide_buffer_t* %1, %struct.halide_device_interface_t* %2) local_unnamed_addr #0 {
  %4 = icmp eq %struct.halide_buffer_t* %1, null
  br i1 %4, label %5, label %7

5:                                                ; preds = %3
  %6 = tail call i32 @halide_error_buffer_is_null(i8* %0, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.23.98, i64 0, i64 0)) #12
  br label %30

7:                                                ; preds = %3
  %8 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %9 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %8, align 8, !tbaa !284
  %10 = icmp eq %struct.halide_device_interface_t* %9, null
  %11 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %12 = load i64, i64* %11, align 8, !tbaa !183
  %13 = icmp eq i64 %12, 0
  %14 = xor i1 %10, true
  %15 = or i1 %13, %14
  br i1 %15, label %18, label %16

16:                                               ; preds = %7
  %17 = tail call i32 @halide_error_no_device_interface(i8* %0) #12
  br label %30

18:                                               ; preds = %7
  %19 = xor i1 %13, true
  %20 = or i1 %10, %19
  br i1 %20, label %23, label %21

21:                                               ; preds = %18
  %22 = tail call i32 @halide_error_device_interface_no_device(i8* %0) #12
  br label %30

23:                                               ; preds = %18
  %24 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %25 = load i64, i64* %24, align 8, !tbaa !285
  %26 = and i64 %25, 3
  %27 = icmp eq i64 %26, 3
  br i1 %27, label %28, label %36

28:                                               ; preds = %23
  %29 = tail call i32 @halide_error_host_and_device_dirty(i8* %0) #12
  br label %30

30:                                               ; preds = %28, %21, %16, %5
  %31 = phi i32 [ %6, %5 ], [ %22, %21 ], [ %17, %16 ], [ %29, %28 ]
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %33, label %56

33:                                               ; preds = %30
  %34 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %35 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %34, align 8, !tbaa !284
  br label %36

36:                                               ; preds = %33, %23
  %37 = phi %struct.halide_device_interface_t* [ %35, %33 ], [ %9, %23 ]
  %38 = icmp eq %struct.halide_device_interface_t* %37, null
  %39 = icmp eq %struct.halide_device_interface_t* %37, %2
  %40 = or i1 %38, %39
  br i1 %40, label %42, label %41

41:                                               ; preds = %36
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.25.99, i64 0, i64 0)) #12
  br label %56

42:                                               ; preds = %36
  %43 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %2, i64 0, i32 15
  %44 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %43, align 8, !tbaa !291
  %45 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %44, i64 0, i32 0
  %46 = load void ()*, void ()** %45, align 8, !tbaa !297
  tail call void %46() #12
  %47 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %43, align 8, !tbaa !291
  %48 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %47, i64 0, i32 8
  %49 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %48, align 8, !tbaa !302
  %50 = tail call i32 %49(i8* %0, %struct.halide_buffer_t* nonnull %1) #12
  %51 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %43, align 8, !tbaa !291
  %52 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %51, i64 0, i32 1
  %53 = load void ()*, void ()** %52, align 8, !tbaa !299
  tail call void %53() #12
  %54 = icmp eq i32 %50, 0
  br i1 %54, label %56, label %55

55:                                               ; preds = %42
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.26.100, i64 0, i64 0)) #12
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
  %5 = tail call i32 @halide_error_buffer_is_null(i8* %0, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.27.101, i64 0, i64 0)) #12
  br label %29

6:                                                ; preds = %2
  %7 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %8 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %7, align 8, !tbaa !284
  %9 = icmp eq %struct.halide_device_interface_t* %8, null
  %10 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %11 = load i64, i64* %10, align 8, !tbaa !183
  %12 = icmp eq i64 %11, 0
  %13 = xor i1 %9, true
  %14 = or i1 %12, %13
  br i1 %14, label %17, label %15

15:                                               ; preds = %6
  %16 = tail call i32 @halide_error_no_device_interface(i8* %0) #12
  br label %29

17:                                               ; preds = %6
  %18 = xor i1 %12, true
  %19 = or i1 %9, %18
  br i1 %19, label %22, label %20

20:                                               ; preds = %17
  %21 = tail call i32 @halide_error_device_interface_no_device(i8* %0) #12
  br label %29

22:                                               ; preds = %17
  %23 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %24 = load i64, i64* %23, align 8, !tbaa !285
  %25 = and i64 %24, 3
  %26 = icmp eq i64 %25, 3
  br i1 %26, label %27, label %35

27:                                               ; preds = %22
  %28 = tail call i32 @halide_error_host_and_device_dirty(i8* %0) #12
  br label %29

29:                                               ; preds = %27, %20, %15, %4
  %30 = phi i32 [ %5, %4 ], [ %21, %20 ], [ %16, %15 ], [ %28, %27 ]
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %66

32:                                               ; preds = %29
  %33 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %34 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %33, align 8, !tbaa !284
  br label %35

35:                                               ; preds = %32, %22
  %36 = phi %struct.halide_device_interface_t* [ %34, %32 ], [ %8, %22 ]
  %37 = icmp eq %struct.halide_device_interface_t* %36, null
  br i1 %37, label %57, label %38

38:                                               ; preds = %35
  %39 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %36, i64 0, i32 15
  %40 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %39, align 8, !tbaa !291
  %41 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %40, i64 0, i32 0
  %42 = load void ()*, void ()** %41, align 8, !tbaa !297
  tail call void %42() #12
  %43 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %39, align 8, !tbaa !291
  %44 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %43, i64 0, i32 9
  %45 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %44, align 8, !tbaa !303
  %46 = tail call i32 %45(i8* %0, %struct.halide_buffer_t* nonnull %1) #12
  %47 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %39, align 8, !tbaa !291
  %48 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %47, i64 0, i32 1
  %49 = load void ()*, void ()** %48, align 8, !tbaa !299
  tail call void %49() #12
  %50 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %51 = load i64, i64* %50, align 8, !tbaa !183
  %52 = icmp eq i64 %51, 0
  br i1 %52, label %54, label %53

53:                                               ; preds = %38
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([91 x i8], [91 x i8]* @.str.28.102, i64 0, i64 0)) #12
  tail call void @abort() #12
  br label %54

54:                                               ; preds = %53, %38
  %55 = icmp eq i32 %46, 0
  %56 = select i1 %55, i32 0, i32 -18
  ret i32 %56

57:                                               ; preds = %35
  %58 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 2
  %59 = load i8*, i8** %58, align 8, !tbaa !181
  %60 = icmp eq i8* %59, null
  br i1 %60, label %62, label %61

61:                                               ; preds = %57
  tail call void @halide_free(i8* %0, i8* nonnull %59) #12
  store i8* null, i8** %58, align 8, !tbaa !181
  br label %62

62:                                               ; preds = %61, %57
  %63 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %64 = load i64, i64* %63, align 8, !tbaa !285
  %65 = and i64 %64, -3
  store i64 %65, i64* %63, align 8, !tbaa !285
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
  %6 = tail call i32 @halide_error_buffer_is_null(i8* %0, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.29.103, i64 0, i64 0)) #12
  br label %30

7:                                                ; preds = %3
  %8 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %9 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %8, align 8, !tbaa !284
  %10 = icmp eq %struct.halide_device_interface_t* %9, null
  %11 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %12 = load i64, i64* %11, align 8, !tbaa !183
  %13 = icmp eq i64 %12, 0
  %14 = xor i1 %10, true
  %15 = or i1 %13, %14
  br i1 %15, label %18, label %16

16:                                               ; preds = %7
  %17 = tail call i32 @halide_error_no_device_interface(i8* %0) #12
  br label %30

18:                                               ; preds = %7
  %19 = xor i1 %13, true
  %20 = or i1 %10, %19
  br i1 %20, label %23, label %21

21:                                               ; preds = %18
  %22 = tail call i32 @halide_error_device_interface_no_device(i8* %0) #12
  br label %30

23:                                               ; preds = %18
  %24 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %25 = load i64, i64* %24, align 8, !tbaa !285
  %26 = and i64 %25, 3
  %27 = icmp eq i64 %26, 3
  br i1 %27, label %28, label %33

28:                                               ; preds = %23
  %29 = tail call i32 @halide_error_host_and_device_dirty(i8* %0) #12
  br label %30

30:                                               ; preds = %28, %21, %16, %5
  %31 = phi i32 [ %6, %5 ], [ %22, %21 ], [ %17, %16 ], [ %29, %28 ]
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %33, label %96

33:                                               ; preds = %30, %23
  %34 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 5
  %35 = load i32, i32* %34, align 4, !tbaa !184
  %36 = icmp sgt i32 %35, 0
  br i1 %36, label %37, label %78

37:                                               ; preds = %33
  %38 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 6
  %39 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %38, align 8, !tbaa !185
  %40 = zext i32 %35 to i64
  br label %41

41:                                               ; preds = %55, %37
  %42 = phi i64 [ 0, %37 ], [ %57, %55 ]
  %43 = phi i64 [ 0, %37 ], [ %56, %55 ]
  %44 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %39, i64 %42, i32 2
  %45 = load i32, i32* %44, align 4, !tbaa !191
  %46 = icmp sgt i32 %45, 0
  br i1 %46, label %47, label %55

47:                                               ; preds = %41
  %48 = zext i32 %45 to i64
  %49 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %39, i64 %42, i32 1
  %50 = load i32, i32* %49, align 4, !tbaa !187
  %51 = add nsw i32 %50, -1
  %52 = sext i32 %51 to i64
  %53 = mul nsw i64 %52, %48
  %54 = add nsw i64 %53, %43
  br label %55

55:                                               ; preds = %47, %41
  %56 = phi i64 [ %54, %47 ], [ %43, %41 ]
  %57 = add nuw nsw i64 %42, 1
  %58 = icmp eq i64 %57, %40
  br i1 %58, label %.preheader, label %41, !llvm.loop !304

.preheader:                                       ; preds = %72, %55
  %59 = phi i64 [ %74, %72 ], [ 0, %55 ]
  %60 = phi i64 [ %73, %72 ], [ 0, %55 ]
  %61 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %39, i64 %59, i32 2
  %62 = load i32, i32* %61, align 4, !tbaa !191
  %63 = icmp slt i32 %62, 0
  br i1 %63, label %64, label %72

64:                                               ; preds = %.preheader
  %65 = sext i32 %62 to i64
  %66 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %39, i64 %59, i32 1
  %67 = load i32, i32* %66, align 4, !tbaa !187
  %68 = add nsw i32 %67, -1
  %69 = sext i32 %68 to i64
  %70 = mul nsw i64 %69, %65
  %71 = add nsw i64 %70, %60
  br label %72

72:                                               ; preds = %64, %.preheader
  %73 = phi i64 [ %71, %64 ], [ %60, %.preheader ]
  %74 = add nuw nsw i64 %59, 1
  %75 = icmp eq i64 %74, %40
  br i1 %75, label %76, label %.preheader, !llvm.loop !305

76:                                               ; preds = %72
  %77 = add nsw i64 %56, 1
  br label %78

78:                                               ; preds = %76, %33
  %79 = phi i64 [ 1, %33 ], [ %77, %76 ]
  %80 = phi i64 [ 0, %33 ], [ %73, %76 ]
  %81 = sub nsw i64 %79, %80
  %82 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 4, i32 1
  %83 = load i8, i8* %82, align 1, !tbaa !139
  %84 = zext i8 %83 to i64
  %85 = add nuw nsw i64 %84, 7
  %86 = lshr i64 %85, 3
  %87 = mul i64 %86, %81
  %88 = tail call i8* @halide_malloc(i8* %0, i64 %87) #12
  %89 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 2
  store i8* %88, i8** %89, align 8, !tbaa !181
  %90 = icmp eq i8* %88, null
  br i1 %90, label %96, label %91

91:                                               ; preds = %78
  %92 = tail call i32 @halide_device_malloc(i8* %0, %struct.halide_buffer_t* nonnull %1, %struct.halide_device_interface_t* %2) #13
  %93 = icmp eq i32 %92, 0
  br i1 %93, label %96, label %94

94:                                               ; preds = %91
  %95 = load i8*, i8** %89, align 8, !tbaa !181
  tail call void @halide_free(i8* %0, i8* %95) #12
  store i8* null, i8** %89, align 8, !tbaa !181
  br label %96

96:                                               ; preds = %94, %91, %78, %30
  %97 = phi i32 [ %31, %30 ], [ -1, %78 ], [ %92, %94 ], [ 0, %91 ]
  ret i32 %97
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_device_and_host_free(i8* %0, %struct.halide_buffer_t* %1, %struct.halide_device_interface_t* %2) local_unnamed_addr #0 {
  %4 = icmp eq %struct.halide_buffer_t* %1, null
  br i1 %4, label %5, label %7

5:                                                ; preds = %3
  %6 = tail call i32 @halide_error_buffer_is_null(i8* %0, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.30.104, i64 0, i64 0)) #12
  br label %31

7:                                                ; preds = %3
  %8 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %9 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %8, align 8, !tbaa !284
  %10 = icmp eq %struct.halide_device_interface_t* %9, null
  %11 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %12 = load i64, i64* %11, align 8, !tbaa !183
  %13 = icmp eq i64 %12, 0
  %14 = xor i1 %10, true
  %15 = or i1 %13, %14
  br i1 %15, label %18, label %16

16:                                               ; preds = %7
  %17 = tail call i32 @halide_error_no_device_interface(i8* %0) #12
  br label %31

18:                                               ; preds = %7
  %19 = xor i1 %13, true
  %20 = or i1 %10, %19
  br i1 %20, label %23, label %21

21:                                               ; preds = %18
  %22 = tail call i32 @halide_error_device_interface_no_device(i8* %0) #12
  br label %31

23:                                               ; preds = %18
  %24 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %25 = load i64, i64* %24, align 8, !tbaa !285
  %26 = and i64 %25, 3
  %27 = icmp eq i64 %26, 3
  br i1 %27, label %29, label %.split

.split:                                           ; preds = %23
  %28 = tail call i32 @halide_device_free(i8* %0, %struct.halide_buffer_t* nonnull %1) #13
  br label %35

29:                                               ; preds = %23
  %30 = tail call i32 @halide_error_host_and_device_dirty(i8* %0) #12
  br label %31

31:                                               ; preds = %29, %21, %16, %5
  %32 = phi i32 [ %6, %5 ], [ %22, %21 ], [ %17, %16 ], [ %30, %29 ]
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %.split1, label %44

.split1:                                          ; preds = %31
  %34 = tail call i32 @halide_device_free(i8* %0, %struct.halide_buffer_t* %1) #13
  br label %35

35:                                               ; preds = %.split1, %.split
  %phi.call = phi i32 [ %28, %.split ], [ %34, %.split1 ]
  %36 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 2
  %37 = load i8*, i8** %36, align 8, !tbaa !181
  %38 = icmp eq i8* %37, null
  br i1 %38, label %40, label %39

39:                                               ; preds = %35
  tail call void @halide_free(i8* %0, i8* nonnull %37) #12
  store i8* null, i8** %36, align 8, !tbaa !181
  br label %40

40:                                               ; preds = %39, %35
  %41 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %42 = load i64, i64* %41, align 8, !tbaa !285
  %43 = and i64 %42, -4
  store i64 %43, i64* %41, align 8, !tbaa !285
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
  %7 = tail call i32 @halide_error_buffer_is_null(i8* %0, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.31.105, i64 0, i64 0)) #12
  br label %31

8:                                                ; preds = %4
  %9 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %10 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %9, align 8, !tbaa !284
  %11 = icmp eq %struct.halide_device_interface_t* %10, null
  %12 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %13 = load i64, i64* %12, align 8, !tbaa !183
  %14 = icmp eq i64 %13, 0
  %15 = xor i1 %11, true
  %16 = or i1 %14, %15
  br i1 %16, label %19, label %17

17:                                               ; preds = %8
  %18 = tail call i32 @halide_error_no_device_interface(i8* %0) #12
  br label %31

19:                                               ; preds = %8
  %20 = xor i1 %14, true
  %21 = or i1 %11, %20
  br i1 %21, label %24, label %22

22:                                               ; preds = %19
  %23 = tail call i32 @halide_error_device_interface_no_device(i8* %0) #12
  br label %31

24:                                               ; preds = %19
  %25 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %26 = load i64, i64* %25, align 8, !tbaa !285
  %27 = and i64 %26, 3
  %28 = icmp eq i64 %27, 3
  br i1 %28, label %29, label %37

29:                                               ; preds = %24
  %30 = tail call i32 @halide_error_host_and_device_dirty(i8* %0) #12
  br label %31

31:                                               ; preds = %29, %22, %17, %6
  %32 = phi i32 [ %7, %6 ], [ %23, %22 ], [ %18, %17 ], [ %30, %29 ]
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %34, label %58

34:                                               ; preds = %31
  %35 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %36 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %35, align 8, !tbaa !284
  br label %37

37:                                               ; preds = %34, %24
  %38 = phi %struct.halide_device_interface_t* [ %36, %34 ], [ %10, %24 ]
  %39 = icmp eq %struct.halide_device_interface_t* %38, null
  %40 = icmp eq %struct.halide_device_interface_t* %38, %3
  %41 = or i1 %39, %40
  br i1 %41, label %43, label %42

42:                                               ; preds = %37
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.32.106, i64 0, i64 0)) #12
  br label %58

43:                                               ; preds = %37
  %44 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %45 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %3, i64 0, i32 15
  %46 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %45, align 8, !tbaa !291
  %47 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %46, i64 0, i32 0
  %48 = load void ()*, void ()** %47, align 8, !tbaa !297
  tail call void %48() #12
  store %struct.halide_device_interface_t* %3, %struct.halide_device_interface_t** %44, align 8, !tbaa !284
  %49 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %45, align 8, !tbaa !291
  %50 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %49, i64 0, i32 14
  %51 = load i32 (i8*, %struct.halide_buffer_t*, i64)*, i32 (i8*, %struct.halide_buffer_t*, i64)** %50, align 8, !tbaa !306
  %52 = tail call i32 %51(i8* %0, %struct.halide_buffer_t* nonnull %1, i64 %2) #12
  %53 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %45, align 8, !tbaa !291
  %54 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %53, i64 0, i32 1
  %55 = load void ()*, void ()** %54, align 8, !tbaa !299
  tail call void %55() #12
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
  %5 = tail call i32 @halide_error_buffer_is_null(i8* %0, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.33.107, i64 0, i64 0)) #12
  br label %29

6:                                                ; preds = %2
  %7 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %8 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %7, align 8, !tbaa !284
  %9 = icmp eq %struct.halide_device_interface_t* %8, null
  %10 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %11 = load i64, i64* %10, align 8, !tbaa !183
  %12 = icmp eq i64 %11, 0
  %13 = xor i1 %9, true
  %14 = or i1 %12, %13
  br i1 %14, label %17, label %15

15:                                               ; preds = %6
  %16 = tail call i32 @halide_error_no_device_interface(i8* %0) #12
  br label %29

17:                                               ; preds = %6
  %18 = xor i1 %12, true
  %19 = or i1 %9, %18
  br i1 %19, label %22, label %20

20:                                               ; preds = %17
  %21 = tail call i32 @halide_error_device_interface_no_device(i8* %0) #12
  br label %29

22:                                               ; preds = %17
  %23 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %24 = load i64, i64* %23, align 8, !tbaa !285
  %25 = and i64 %24, 3
  %26 = icmp eq i64 %25, 3
  br i1 %26, label %27, label %35

27:                                               ; preds = %22
  %28 = tail call i32 @halide_error_host_and_device_dirty(i8* %0) #12
  br label %29

29:                                               ; preds = %27, %20, %15, %4
  %30 = phi i32 [ %5, %4 ], [ %21, %20 ], [ %16, %15 ], [ %28, %27 ]
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %57

32:                                               ; preds = %29
  %33 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %34 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %33, align 8, !tbaa !284
  br label %35

35:                                               ; preds = %32, %22
  %36 = phi %struct.halide_device_interface_t* [ %34, %32 ], [ %8, %22 ]
  %37 = icmp eq %struct.halide_device_interface_t* %36, null
  br i1 %37, label %57, label %38

38:                                               ; preds = %35
  %39 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %36, i64 0, i32 15
  %40 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %39, align 8, !tbaa !291
  %41 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %40, i64 0, i32 0
  %42 = load void ()*, void ()** %41, align 8, !tbaa !297
  tail call void %42() #12
  %43 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %39, align 8, !tbaa !291
  %44 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %43, i64 0, i32 15
  %45 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %44, align 8, !tbaa !307
  %46 = tail call i32 %45(i8* %0, %struct.halide_buffer_t* nonnull %1) #12
  %47 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %39, align 8, !tbaa !291
  %48 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %47, i64 0, i32 1
  %49 = load void ()*, void ()** %48, align 8, !tbaa !299
  tail call void %49() #12
  %50 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %51 = load i64, i64* %50, align 8, !tbaa !183
  %52 = icmp eq i64 %51, 0
  br i1 %52, label %54, label %53

53:                                               ; preds = %38
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([91 x i8], [91 x i8]* @.str.34.108, i64 0, i64 0)) #12
  tail call void @abort() #12
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
  %6 = tail call i32 @halide_error_buffer_is_null(i8* %0, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.35.109, i64 0, i64 0)) #12
  br label %30

7:                                                ; preds = %3
  %8 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %9 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %8, align 8, !tbaa !284
  %10 = icmp eq %struct.halide_device_interface_t* %9, null
  %11 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %12 = load i64, i64* %11, align 8, !tbaa !183
  %13 = icmp eq i64 %12, 0
  %14 = xor i1 %10, true
  %15 = or i1 %13, %14
  br i1 %15, label %18, label %16

16:                                               ; preds = %7
  %17 = tail call i32 @halide_error_no_device_interface(i8* %0) #12
  br label %30

18:                                               ; preds = %7
  %19 = xor i1 %13, true
  %20 = or i1 %10, %19
  br i1 %20, label %23, label %21

21:                                               ; preds = %18
  %22 = tail call i32 @halide_error_device_interface_no_device(i8* %0) #12
  br label %30

23:                                               ; preds = %18
  %24 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %25 = load i64, i64* %24, align 8, !tbaa !285
  %26 = and i64 %25, 3
  %27 = icmp eq i64 %26, 3
  br i1 %27, label %28, label %36

28:                                               ; preds = %23
  %29 = tail call i32 @halide_error_host_and_device_dirty(i8* %0) #12
  br label %30

30:                                               ; preds = %28, %21, %16, %5
  %31 = phi i32 [ %6, %5 ], [ %22, %21 ], [ %17, %16 ], [ %29, %28 ]
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %33, label %43

33:                                               ; preds = %30
  %34 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %35 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %34, align 8, !tbaa !284
  br label %36

36:                                               ; preds = %33, %23
  %37 = phi %struct.halide_device_interface_t* [ %35, %33 ], [ %9, %23 ]
  %38 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %37, i64 0, i32 15
  %39 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %38, align 8, !tbaa !291
  %40 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %39, i64 0, i32 0
  %41 = load void ()*, void ()** %40, align 8, !tbaa !297
  tail call void %41() #12
  %42 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  store i64 %2, i64* %42, align 8, !tbaa !183
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
  %5 = tail call i32 @halide_error_buffer_is_null(i8* %0, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.36, i64 0, i64 0)) #12
  br label %29

6:                                                ; preds = %2
  %7 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %8 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %7, align 8, !tbaa !284
  %9 = icmp eq %struct.halide_device_interface_t* %8, null
  %10 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %11 = load i64, i64* %10, align 8, !tbaa !183
  %12 = icmp eq i64 %11, 0
  %13 = xor i1 %9, true
  %14 = or i1 %12, %13
  br i1 %14, label %17, label %15

15:                                               ; preds = %6
  %16 = tail call i32 @halide_error_no_device_interface(i8* %0) #12
  br label %29

17:                                               ; preds = %6
  %18 = xor i1 %12, true
  %19 = or i1 %9, %18
  br i1 %19, label %22, label %20

20:                                               ; preds = %17
  %21 = tail call i32 @halide_error_device_interface_no_device(i8* %0) #12
  br label %29

22:                                               ; preds = %17
  %23 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %24 = load i64, i64* %23, align 8, !tbaa !285
  %25 = and i64 %24, 3
  %26 = icmp eq i64 %25, 3
  br i1 %26, label %27, label %35

27:                                               ; preds = %22
  %28 = tail call i32 @halide_error_host_and_device_dirty(i8* %0) #12
  br label %29

29:                                               ; preds = %27, %20, %15, %4
  %30 = phi i32 [ %5, %4 ], [ %21, %20 ], [ %16, %15 ], [ %28, %27 ]
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %46

32:                                               ; preds = %29
  %33 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %34 = load i64, i64* %33, align 8, !tbaa !183
  br label %35

35:                                               ; preds = %32, %22
  %36 = phi i64 [ %34, %32 ], [ %11, %22 ]
  %37 = icmp eq i64 %36, 0
  br i1 %37, label %46, label %38

38:                                               ; preds = %35
  %39 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %40 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %41 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %40, align 8, !tbaa !284
  %42 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %41, i64 0, i32 15
  %43 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %42, align 8, !tbaa !291
  %44 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %43, i64 0, i32 1
  %45 = load void ()*, void ()** %44, align 8, !tbaa !299
  tail call void %45() #12
  store i64 0, i64* %39, align 8, !tbaa !183
  store %struct.halide_device_interface_t* null, %struct.halide_device_interface_t** %40, align 8, !tbaa !284
  br label %46

46:                                               ; preds = %38, %35, %29
  %47 = phi i32 [ 0, %38 ], [ %30, %29 ], [ 0, %35 ]
  ret i32 %47
}

; Function Attrs: nounwind mustprogress
define weak void @halide_device_and_host_free_as_destructor(i8* %0, i8* %1) local_unnamed_addr #0 {
  %3 = bitcast i8* %1 to %struct.halide_buffer_t*
  %4 = tail call i32 @halide_device_and_host_free(i8* %0, %struct.halide_buffer_t* %3) #13
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
  %9 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %8, align 8, !tbaa !284
  %10 = icmp eq %struct.halide_device_interface_t* %9, null
  %11 = icmp eq %struct.halide_device_interface_t* %9, %2
  %12 = or i1 %10, %11
  br i1 %12, label %14, label %13

13:                                               ; preds = %7
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.42, i64 0, i64 0)) #12
  br label %121

14:                                               ; preds = %7
  %15 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 0
  %16 = load i64, i64* %15, align 8, !tbaa !183
  %17 = icmp eq i64 %16, 0
  br i1 %17, label %18, label %21

18:                                               ; preds = %14
  %19 = tail call i32 @halide_device_malloc(i8* %0, %struct.halide_buffer_t* nonnull %3, %struct.halide_device_interface_t* nonnull %2) #13
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %21, label %121

21:                                               ; preds = %18, %14, %4
  %22 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %23 = load i64, i64* %22, align 8, !tbaa !183
  %24 = icmp eq i64 %23, 0
  %25 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 2
  %26 = load i8*, i8** %25, align 8, !tbaa !181
  %27 = icmp eq i8* %26, null
  br i1 %24, label %34, label %28

28:                                               ; preds = %21
  br i1 %27, label %44, label %29

29:                                               ; preds = %28
  %30 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %31 = load i64, i64* %30, align 8, !tbaa !285
  %32 = and i64 %31, 1
  %33 = icmp ne i64 %32, 0
  br label %35

34:                                               ; preds = %21
  br i1 %27, label %44, label %._crit_edge

._crit_edge:                                      ; preds = %34
  %.phi.trans.insert = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %.pre = load i64, i64* %.phi.trans.insert, align 8, !tbaa !285
  br label %35

35:                                               ; preds = %._crit_edge, %29
  %36 = phi i64 [ %31, %29 ], [ %.pre, %._crit_edge ]
  %37 = phi i1 [ %33, %29 ], [ true, %._crit_edge ]
  %38 = and i64 %36, 2
  %39 = icmp eq i64 %38, 0
  br i1 %39, label %44, label %40

40:                                               ; preds = %35
  %41 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %42 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %41, align 8, !tbaa !284
  %43 = icmp ne %struct.halide_device_interface_t* %42, null
  br label %44

44:                                               ; preds = %40, %35, %34, %28
  %45 = phi i1 [ true, %34 ], [ false, %35 ], [ false, %40 ], [ true, %28 ]
  %46 = phi i1 [ true, %34 ], [ %37, %35 ], [ %37, %40 ], [ false, %28 ]
  %47 = phi i1 [ true, %34 ], [ false, %35 ], [ %43, %40 ], [ true, %28 ]
  %48 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 2
  %49 = load i8*, i8** %48, align 8, !tbaa !181
  %50 = icmp eq i8* %49, null
  %51 = xor i1 %6, true
  %52 = and i1 %6, %50
  br i1 %52, label %121, label %53

53:                                               ; preds = %44
  %54 = or i1 %6, %46
  br i1 %54, label %62, label %55

55:                                               ; preds = %53
  %56 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %2, i64 0, i32 15
  %57 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %56, align 8, !tbaa !291
  %58 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %57, i64 0, i32 10
  %59 = load i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)** %58, align 8, !tbaa !308
  %60 = tail call i32 %59(i8* %0, %struct.halide_buffer_t* nonnull %1, %struct.halide_device_interface_t* nonnull %2, %struct.halide_buffer_t* nonnull %3) #12
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
  call void @llvm.lifetime.start.p0i8(i64 416, i8* nonnull %67) #10
  call void @_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b(%"struct.Halide::Runtime::Internal::device_copy"* nonnull sret(%"struct.Halide::Runtime::Internal::device_copy") align 8 %5, %struct.halide_buffer_t* nonnull %1, i1 zeroext true, %struct.halide_buffer_t* nonnull %3, i1 zeroext true) #13
  call void @_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv(%"struct.Halide::Runtime::Internal::device_copy"* nonnull align 8 dereferenceable(416) %5, i8* %0) #13
  call void @llvm.lifetime.end.p0i8(i64 416, i8* nonnull %67) #10
  br label %111

68:                                               ; preds = %64
  br i1 %6, label %69, label %83

69:                                               ; preds = %68
  %70 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %71 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %70, align 8, !tbaa !284
  %72 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %71, i64 0, i32 15
  %73 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %72, align 8, !tbaa !291
  %74 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %73, i64 0, i32 10
  %75 = load i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)** %74, align 8, !tbaa !308
  %76 = tail call i32 %75(i8* %0, %struct.halide_buffer_t* nonnull %1, %struct.halide_device_interface_t* null, %struct.halide_buffer_t* nonnull %3) #12
  %77 = icmp eq i32 %76, -42
  br i1 %77, label %78, label %108

78:                                               ; preds = %69
  %79 = tail call i32 @_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t(i8* %0, %struct.halide_buffer_t* nonnull %1) #13
  %80 = icmp eq i32 %79, 0
  br i1 %80, label %81, label %121

81:                                               ; preds = %78
  %82 = tail call i32 @halide_buffer_copy_already_locked(i8* %0, %struct.halide_buffer_t* nonnull %1, %struct.halide_device_interface_t* null, %struct.halide_buffer_t* nonnull %3) #13
  br label %108

83:                                               ; preds = %68
  %84 = or i1 %46, %50
  br i1 %84, label %99, label %85

85:                                               ; preds = %83
  %86 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %87 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %86, align 8, !tbaa !284
  %88 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %87, i64 0, i32 15
  %89 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %88, align 8, !tbaa !291
  %90 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %89, i64 0, i32 10
  %91 = load i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)** %90, align 8, !tbaa !308
  %92 = tail call i32 %91(i8* %0, %struct.halide_buffer_t* nonnull %1, %struct.halide_device_interface_t* null, %struct.halide_buffer_t* nonnull %3) #12
  %93 = icmp eq i32 %92, 0
  br i1 %93, label %94, label %121

94:                                               ; preds = %85
  %95 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 3
  %96 = load i64, i64* %95, align 8, !tbaa !285
  %97 = or i64 %96, 1
  store i64 %97, i64* %95, align 8, !tbaa !285
  %98 = tail call i32 @copy_to_device_already_locked(i8* %0, %struct.halide_buffer_t* nonnull %3, %struct.halide_device_interface_t* nonnull %2) #13
  br label %108

99:                                               ; preds = %83
  %100 = tail call i32 @_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t(i8* %0, %struct.halide_buffer_t* nonnull %1) #13
  %101 = icmp eq i32 %100, 0
  br i1 %101, label %102, label %121

102:                                              ; preds = %99
  %103 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %2, i64 0, i32 15
  %104 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %103, align 8, !tbaa !291
  %105 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %104, i64 0, i32 10
  %106 = load i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)** %105, align 8, !tbaa !308
  %107 = tail call i32 %106(i8* %0, %struct.halide_buffer_t* nonnull %1, %struct.halide_device_interface_t* nonnull %2, %struct.halide_buffer_t* nonnull %3) #12
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
  %115 = load i64, i64* %114, align 8, !tbaa !285
  %116 = and i64 %115, -4
  br i1 %6, label %119, label %117

117:                                              ; preds = %113
  %118 = or i64 %116, 2
  store i64 %118, i64* %114, align 8, !tbaa !285
  br label %121

119:                                              ; preds = %113
  %120 = or i64 %116, 1
  store i64 %120, i64* %114, align 8, !tbaa !285
  br label %121

121:                                              ; preds = %119, %117, %111, %108, %99, %85, %78, %62, %44, %18, %13
  %122 = phi i32 [ -42, %13 ], [ %19, %18 ], [ -34, %44 ], [ 0, %117 ], [ 0, %119 ], [ 0, %111 ], [ -42, %62 ], [ %109, %108 ], [ %100, %99 ], [ %92, %85 ], [ %79, %78 ]
  ret i32 %122
}

; Function Attrs: nounwind
define weak i32 @halide_buffer_copy(i8* %0, %struct.halide_buffer_t* %1, %struct.halide_device_interface_t* %2, %struct.halide_buffer_t* %3) local_unnamed_addr #4 {
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #12
  %5 = icmp eq %struct.halide_device_interface_t* %2, null
  br i1 %5, label %11, label %6

6:                                                ; preds = %4
  %7 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %2, i64 0, i32 15
  %8 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %7, align 8, !tbaa !291
  %9 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %8, i64 0, i32 0
  %10 = load void ()*, void ()** %9, align 8, !tbaa !297
  tail call void %10() #12
  br label %11

11:                                               ; preds = %6, %4
  %12 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %13 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %12, align 8, !tbaa !284
  %14 = icmp eq %struct.halide_device_interface_t* %13, null
  br i1 %14, label %20, label %15

15:                                               ; preds = %11
  %16 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %13, i64 0, i32 15
  %17 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %16, align 8, !tbaa !291
  %18 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %17, i64 0, i32 0
  %19 = load void ()*, void ()** %18, align 8, !tbaa !297
  tail call void %19() #12
  br label %20

20:                                               ; preds = %15, %11
  %21 = tail call i32 @halide_buffer_copy_already_locked(i8* %0, %struct.halide_buffer_t* nonnull %1, %struct.halide_device_interface_t* %2, %struct.halide_buffer_t* %3) #13
  br i1 %5, label %27, label %22

22:                                               ; preds = %20
  %23 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %2, i64 0, i32 15
  %24 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %23, align 8, !tbaa !291
  %25 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %24, i64 0, i32 1
  %26 = load void ()*, void ()** %25, align 8, !tbaa !299
  tail call void %26() #12
  br label %27

27:                                               ; preds = %22, %20
  %28 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %12, align 8, !tbaa !284
  %29 = icmp eq %struct.halide_device_interface_t* %28, null
  br i1 %29, label %35, label %30

30:                                               ; preds = %27
  %31 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %28, i64 0, i32 15
  %32 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %31, align 8, !tbaa !291
  %33 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %32, i64 0, i32 1
  %34 = load void ()*, void ()** %33, align 8, !tbaa !299
  tail call void %34() #12
  br label %35

35:                                               ; preds = %30, %27
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #12
  ret i32 %21
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_device_crop(i8* %0, %struct.halide_buffer_t* %1, %struct.halide_buffer_t* %2) local_unnamed_addr #0 {
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.58, i64 0, i64 0)) #12
  ret i32 -40
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_device_slice(i8* %0, %struct.halide_buffer_t* %1, i32 %2, i32 %3, %struct.halide_buffer_t* %4) local_unnamed_addr #0 {
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.59, i64 0, i64 0)) #12
  ret i32 -40
}

; Function Attrs: nounwind
define weak i32 @halide_device_crop(i8* %0, %struct.halide_buffer_t* %1, %struct.halide_buffer_t* %2) local_unnamed_addr #4 {
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #12
  %4 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %5 = load i64, i64* %4, align 8, !tbaa !183
  %6 = icmp eq i64 %5, 0
  br i1 %6, label %32, label %7

7:                                                ; preds = %3
  %8 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %2, i64 0, i32 0
  %9 = load i64, i64* %8, align 8, !tbaa !183
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %12, label %11

11:                                               ; preds = %7
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.60, i64 0, i64 0)) #12
  br label %32

12:                                               ; preds = %7
  %13 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 5
  %14 = load i32, i32* %13, align 4, !tbaa !184
  %15 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %2, i64 0, i32 5
  %16 = load i32, i32* %15, align 4, !tbaa !184
  %17 = icmp eq i32 %14, %16
  br i1 %17, label %19, label %18

18:                                               ; preds = %12
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.61, i64 0, i64 0)) #12
  br label %32

19:                                               ; preds = %12
  %20 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %21 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %20, align 8, !tbaa !284
  %22 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %21, i64 0, i32 15
  %23 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %22, align 8, !tbaa !291
  %24 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %23, i64 0, i32 0
  %25 = load void ()*, void ()** %24, align 8, !tbaa !297
  tail call void %25() #12
  %26 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %20, align 8, !tbaa !284
  %27 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %26, i64 0, i32 15
  %28 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %27, align 8, !tbaa !291
  %29 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %28, i64 0, i32 11
  %30 = load i32 (i8*, %struct.halide_buffer_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_buffer_t*)** %29, align 8, !tbaa !309
  %31 = tail call i32 %30(i8* %0, %struct.halide_buffer_t* nonnull %1, %struct.halide_buffer_t* nonnull %2) #12
  br label %32

32:                                               ; preds = %19, %18, %11, %3
  %33 = phi i32 [ -41, %11 ], [ -41, %18 ], [ %31, %19 ], [ 0, %3 ]
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #12
  ret i32 %33
}

; Function Attrs: nounwind
define weak i32 @halide_device_slice(i8* %0, %struct.halide_buffer_t* %1, i32 %2, i32 %3, %struct.halide_buffer_t* %4) local_unnamed_addr #4 {
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #12
  %6 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %7 = load i64, i64* %6, align 8, !tbaa !183
  %8 = icmp eq i64 %7, 0
  br i1 %8, label %35, label %9

9:                                                ; preds = %5
  %10 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %4, i64 0, i32 0
  %11 = load i64, i64* %10, align 8, !tbaa !183
  %12 = icmp eq i64 %11, 0
  br i1 %12, label %14, label %13

13:                                               ; preds = %9
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.60, i64 0, i64 0)) #12
  br label %35

14:                                               ; preds = %9
  %15 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 5
  %16 = load i32, i32* %15, align 4, !tbaa !184
  %17 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %4, i64 0, i32 5
  %18 = load i32, i32* %17, align 4, !tbaa !184
  %19 = add nsw i32 %18, 1
  %20 = icmp eq i32 %16, %19
  br i1 %20, label %22, label %21

21:                                               ; preds = %14
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.64, i64 0, i64 0)) #12
  br label %35

22:                                               ; preds = %14
  %23 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %24 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %23, align 8, !tbaa !284
  %25 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %24, i64 0, i32 15
  %26 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %25, align 8, !tbaa !291
  %27 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %26, i64 0, i32 0
  %28 = load void ()*, void ()** %27, align 8, !tbaa !297
  tail call void %28() #12
  %29 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %23, align 8, !tbaa !284
  %30 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %29, i64 0, i32 15
  %31 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %30, align 8, !tbaa !291
  %32 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %31, i64 0, i32 12
  %33 = load i32 (i8*, %struct.halide_buffer_t*, i32, i32, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, i32, i32, %struct.halide_buffer_t*)** %32, align 8, !tbaa !310
  %34 = tail call i32 %33(i8* %0, %struct.halide_buffer_t* nonnull %1, i32 %2, i32 %3, %struct.halide_buffer_t* nonnull %4) #12
  br label %35

35:                                               ; preds = %22, %21, %13, %5
  %36 = phi i32 [ -41, %13 ], [ -41, %21 ], [ %34, %22 ], [ 0, %5 ]
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #12
  ret i32 %36
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_device_release_crop(i8* %0, %struct.halide_buffer_t* %1) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %4 = load i64, i64* %3, align 8, !tbaa !183
  %5 = icmp eq i64 %4, 0
  br i1 %5, label %7, label %6

6:                                                ; preds = %2
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.58, i64 0, i64 0)) #12
  br label %7

7:                                                ; preds = %6, %2
  %8 = phi i32 [ -40, %6 ], [ 0, %2 ]
  ret i32 %8
}

; Function Attrs: nounwind
define weak i32 @halide_device_release_crop(i8* %0, %struct.halide_buffer_t* %1) local_unnamed_addr #4 {
  %3 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %4 = load i64, i64* %3, align 8, !tbaa !183
  %5 = icmp eq i64 %4, 0
  br i1 %5, label %17, label %6

6:                                                ; preds = %2
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #12
  %7 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %8 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %7, align 8, !tbaa !284
  %9 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %8, i64 0, i32 15
  %10 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %9, align 8, !tbaa !291
  %11 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %10, i64 0, i32 13
  %12 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %11, align 8, !tbaa !311
  %13 = tail call i32 %12(i8* %0, %struct.halide_buffer_t* nonnull %1) #12
  store i64 0, i64* %3, align 8, !tbaa !183
  %14 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %9, align 8, !tbaa !291
  %15 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %14, i64 0, i32 1
  %16 = load void ()*, void ()** %15, align 8, !tbaa !299
  tail call void %16() #12
  store %struct.halide_device_interface_t* null, %struct.halide_device_interface_t** %7, align 8, !tbaa !284
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #12
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
  %10 = tail call i32 @llvm.ctlz.i32(i32 %3, i1 true), !range !312
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
declare i32 @llvm.ctlz.i32(i32, i1 immarg) #7

; Function Attrs: nounwind willreturn mustprogress
define weak double @halide_float16_bits_to_double(i16 zeroext %0) local_unnamed_addr #2 {
  %2 = tail call float @halide_float16_bits_to_float(i16 zeroext %0) #13
  %3 = fpext float %2 to double
  ret double %3
}

; Function Attrs: nounwind
define weak i32 @halide_error_bounds_inference_call_failed(i8* %0, i8* %1, i32 %2) local_unnamed_addr #4 {
  %4 = tail call i8* @malloc(i64 1024) #12
  %5 = icmp eq i8* %4, null
  br i1 %5, label %.split, label %.split2

.split:                                           ; preds = %3
  %6 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([41 x i8], [41 x i8]* @.str.112, i64 0, i64 0)) #12
  br label %9

.split2:                                          ; preds = %3
  %7 = getelementptr inbounds i8, i8* %4, i64 1023
  store i8 0, i8* %7, align 1, !tbaa !14
  %8 = tail call i8* @halide_string_to_string(i8* nonnull %4, i8* nonnull %7, i8* nonnull getelementptr inbounds ([41 x i8], [41 x i8]* @.str.112, i64 0, i64 0)) #12
  br label %9

9:                                                ; preds = %.split2, %.split
  %phi.call = phi i8* [ %6, %.split ], [ %8, %.split2 ]
  %10 = phi i8* [ null, %.split ], [ %7, %.split2 ]
  %11 = icmp eq i8* %1, null
  br i1 %11, label %12, label %14

12:                                               ; preds = %9
  %13 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %10, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.30.166, i64 0, i64 0)) #12
  br label %16

14:                                               ; preds = %9
  %15 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %10, i8* nonnull %1) #12
  br label %16

16:                                               ; preds = %14, %12
  %17 = phi i8* [ %15, %14 ], [ %13, %12 ]
  %18 = tail call i8* @halide_string_to_string(i8* %17, i8* %10, i8* nonnull getelementptr inbounds ([27 x i8], [27 x i8]* @.str.1.113, i64 0, i64 0)) #12
  %19 = sext i32 %2 to i64
  %20 = tail call i8* @halide_int64_to_string(i8* %18, i8* %10, i64 %19, i32 1) #12
  br i1 %5, label %21, label %22

21:                                               ; preds = %16
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.29.165, i64 0, i64 0)) #12
  br label %28

22:                                               ; preds = %16
  %23 = ptrtoint i8* %20 to i64
  %24 = ptrtoint i8* %4 to i64
  %25 = sub i64 1, %24
  %26 = add i64 %25, %23
  %27 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %4, i64 %26) #12
  tail call void @halide_error(i8* %0, i8* nonnull %4) #12
  br label %28

28:                                               ; preds = %22, %21
  tail call void @free(i8* %4) #12
  ret i32 %2
}

; Function Attrs: nounwind
define weak i32 @halide_error_extern_stage_failed(i8* %0, i8* %1, i32 %2) local_unnamed_addr #4 {
  %4 = tail call i8* @malloc(i64 1024) #12
  %5 = icmp eq i8* %4, null
  br i1 %5, label %.split, label %.split2

.split:                                           ; preds = %3
  %6 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([24 x i8], [24 x i8]* @.str.2.114, i64 0, i64 0)) #12
  br label %9

.split2:                                          ; preds = %3
  %7 = getelementptr inbounds i8, i8* %4, i64 1023
  store i8 0, i8* %7, align 1, !tbaa !14
  %8 = tail call i8* @halide_string_to_string(i8* nonnull %4, i8* nonnull %7, i8* nonnull getelementptr inbounds ([24 x i8], [24 x i8]* @.str.2.114, i64 0, i64 0)) #12
  br label %9

9:                                                ; preds = %.split2, %.split
  %phi.call = phi i8* [ %6, %.split ], [ %8, %.split2 ]
  %10 = phi i8* [ null, %.split ], [ %7, %.split2 ]
  %11 = icmp eq i8* %1, null
  br i1 %11, label %12, label %14

12:                                               ; preds = %9
  %13 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %10, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.30.166, i64 0, i64 0)) #12
  br label %16

14:                                               ; preds = %9
  %15 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %10, i8* nonnull %1) #12
  br label %16

16:                                               ; preds = %14, %12
  %17 = phi i8* [ %15, %14 ], [ %13, %12 ]
  %18 = tail call i8* @halide_string_to_string(i8* %17, i8* %10, i8* nonnull getelementptr inbounds ([27 x i8], [27 x i8]* @.str.1.113, i64 0, i64 0)) #12
  %19 = sext i32 %2 to i64
  %20 = tail call i8* @halide_int64_to_string(i8* %18, i8* %10, i64 %19, i32 1) #12
  br i1 %5, label %21, label %22

21:                                               ; preds = %16
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.29.165, i64 0, i64 0)) #12
  br label %28

22:                                               ; preds = %16
  %23 = ptrtoint i8* %20 to i64
  %24 = ptrtoint i8* %4 to i64
  %25 = sub i64 1, %24
  %26 = add i64 %25, %23
  %27 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %4, i64 %26) #12
  tail call void @halide_error(i8* %0, i8* nonnull %4) #12
  br label %28

28:                                               ; preds = %22, %21
  tail call void @free(i8* %4) #12
  ret i32 %2
}

; Function Attrs: nounwind
define weak i32 @halide_error_explicit_bounds_too_small(i8* %0, i8* %1, i8* %2, i32 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #4 {
  %8 = tail call i8* @malloc(i64 1024) #12
  %9 = icmp eq i8* %8, null
  br i1 %9, label %.split, label %.split2

.split:                                           ; preds = %7
  %10 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3.115, i64 0, i64 0)) #12
  br label %13

.split2:                                          ; preds = %7
  %11 = getelementptr inbounds i8, i8* %8, i64 1023
  store i8 0, i8* %11, align 1, !tbaa !14
  %12 = tail call i8* @halide_string_to_string(i8* nonnull %8, i8* nonnull %11, i8* nonnull getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3.115, i64 0, i64 0)) #12
  br label %13

13:                                               ; preds = %.split2, %.split
  %phi.call = phi i8* [ %10, %.split ], [ %12, %.split2 ]
  %14 = phi i8* [ null, %.split ], [ %11, %.split2 ]
  %15 = icmp eq i8* %2, null
  br i1 %15, label %16, label %18

16:                                               ; preds = %13
  %17 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %14, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.30.166, i64 0, i64 0)) #12
  br label %20

18:                                               ; preds = %13
  %19 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %14, i8* nonnull %2) #12
  br label %20

20:                                               ; preds = %18, %16
  %21 = phi i8* [ %19, %18 ], [ %17, %16 ]
  %22 = tail call i8* @halide_string_to_string(i8* %21, i8* %14, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4.116, i64 0, i64 0)) #12
  %23 = icmp eq i8* %1, null
  br i1 %23, label %24, label %26

24:                                               ; preds = %20
  %25 = tail call i8* @halide_string_to_string(i8* %22, i8* %14, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.30.166, i64 0, i64 0)) #12
  br label %28

26:                                               ; preds = %20
  %27 = tail call i8* @halide_string_to_string(i8* %22, i8* %14, i8* nonnull %1) #12
  br label %28

28:                                               ; preds = %26, %24
  %29 = phi i8* [ %27, %26 ], [ %25, %24 ]
  %30 = tail call i8* @halide_string_to_string(i8* %29, i8* %14, i8* nonnull getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5.117, i64 0, i64 0)) #12
  %31 = sext i32 %3 to i64
  %32 = tail call i8* @halide_int64_to_string(i8* %30, i8* %14, i64 %31, i32 1) #12
  %33 = tail call i8* @halide_string_to_string(i8* %32, i8* %14, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6.118, i64 0, i64 0)) #12
  %34 = sext i32 %4 to i64
  %35 = tail call i8* @halide_int64_to_string(i8* %33, i8* %14, i64 %34, i32 1) #12
  %36 = tail call i8* @halide_string_to_string(i8* %35, i8* %14, i8* nonnull getelementptr inbounds ([38 x i8], [38 x i8]* @.str.7.119, i64 0, i64 0)) #12
  %37 = sext i32 %5 to i64
  %38 = tail call i8* @halide_int64_to_string(i8* %36, i8* %14, i64 %37, i32 1) #12
  %39 = tail call i8* @halide_string_to_string(i8* %38, i8* %14, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6.118, i64 0, i64 0)) #12
  %40 = sext i32 %6 to i64
  %41 = tail call i8* @halide_int64_to_string(i8* %39, i8* %14, i64 %40, i32 1) #12
  %42 = tail call i8* @halide_string_to_string(i8* %41, i8* %14, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8.120, i64 0, i64 0)) #12
  br i1 %9, label %43, label %44

43:                                               ; preds = %28
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.29.165, i64 0, i64 0)) #12
  br label %50

44:                                               ; preds = %28
  %45 = ptrtoint i8* %42 to i64
  %46 = ptrtoint i8* %8 to i64
  %47 = sub i64 1, %46
  %48 = add i64 %47, %45
  %49 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %8, i64 %48) #12
  tail call void @halide_error(i8* %0, i8* nonnull %8) #12
  br label %50

50:                                               ; preds = %44, %43
  tail call void @free(i8* %8) #12
  ret i32 -2
}

; Function Attrs: nounwind
define weak i32 @halide_error_bad_type(i8* %0, i8* %1, i32 %2, i32 %3) local_unnamed_addr #4 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct.halide_type_t, align 2
  %8 = alloca %struct.halide_type_t, align 2
  store i32 %2, i32* %5, align 4, !tbaa !76
  store i32 %3, i32* %6, align 4, !tbaa !76
  %9 = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %7, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %9) #10
  store i8 0, i8* %9, align 2, !tbaa !282
  %10 = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %7, i64 0, i32 1
  store i8 0, i8* %10, align 1, !tbaa !139
  %11 = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %7, i64 0, i32 2
  store i16 0, i16* %11, align 2, !tbaa !283
  %12 = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %8, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %12) #10
  store i8 0, i8* %12, align 2, !tbaa !282
  %13 = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %8, i64 0, i32 1
  store i8 0, i8* %13, align 1, !tbaa !139
  %14 = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %8, i64 0, i32 2
  store i16 0, i16* %14, align 2, !tbaa !283
  %15 = bitcast i32* %6 to i8*
  %16 = call i8* @memcpy(i8* nonnull %9, i8* nonnull %15, i64 4) #12
  %17 = bitcast i32* %5 to i8*
  %18 = call i8* @memcpy(i8* nonnull %12, i8* nonnull %17, i64 4) #12
  %19 = call i8* @malloc(i64 1024) #12
  %20 = icmp eq i8* %19, null
  br i1 %20, label %23, label %21

21:                                               ; preds = %4
  %22 = getelementptr inbounds i8, i8* %19, i64 1023
  store i8 0, i8* %22, align 1, !tbaa !14
  br label %23

23:                                               ; preds = %21, %4
  %24 = phi i8* [ %22, %21 ], [ null, %4 ]
  %25 = icmp eq i8* %1, null
  br i1 %25, label %26, label %28

26:                                               ; preds = %23
  %27 = call i8* @halide_string_to_string(i8* %19, i8* %24, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.30.166, i64 0, i64 0)) #12
  br label %30

28:                                               ; preds = %23
  %29 = call i8* @halide_string_to_string(i8* %19, i8* %24, i8* nonnull %1) #12
  br label %30

30:                                               ; preds = %28, %26
  %31 = phi i8* [ %29, %28 ], [ %27, %26 ]
  %32 = call i8* @halide_string_to_string(i8* %31, i8* %24, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.9.121, i64 0, i64 0)) #12
  %33 = call i8* @halide_type_to_string(i8* %32, i8* %24, %struct.halide_type_t* nonnull %7) #12
  %34 = call i8* @halide_string_to_string(i8* %33, i8* %24, i8* nonnull getelementptr inbounds ([38 x i8], [38 x i8]* @.str.10.122, i64 0, i64 0)) #12
  %35 = call i8* @halide_type_to_string(i8* %34, i8* %24, %struct.halide_type_t* nonnull %8) #12
  br i1 %20, label %42, label %36

36:                                               ; preds = %30
  %37 = ptrtoint i8* %35 to i64
  %38 = ptrtoint i8* %19 to i64
  %39 = sub i64 1, %38
  %40 = add i64 %39, %37
  %41 = call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %19, i64 %40) #12
  br label %42

42:                                               ; preds = %36, %30
  %43 = phi i8* [ %19, %36 ], [ getelementptr inbounds ([35 x i8], [35 x i8]* @.str.29.165, i64 0, i64 0), %30 ]
  call void @halide_error(i8* %0, i8* nonnull %43) #12
  call void @free(i8* %19) #12
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %12) #10
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %9) #10
  ret i32 -3
}

; Function Attrs: nounwind
define weak i32 @halide_error_bad_dimensions(i8* %0, i8* %1, i32 %2, i32 %3) local_unnamed_addr #4 {
  %5 = tail call i8* @malloc(i64 1024) #12
  %6 = icmp eq i8* %5, null
  br i1 %6, label %9, label %7

7:                                                ; preds = %4
  %8 = getelementptr inbounds i8, i8* %5, i64 1023
  store i8 0, i8* %8, align 1, !tbaa !14
  br label %9

9:                                                ; preds = %7, %4
  %10 = phi i8* [ %8, %7 ], [ null, %4 ]
  %11 = icmp eq i8* %1, null
  br i1 %11, label %12, label %14

12:                                               ; preds = %9
  %13 = tail call i8* @halide_string_to_string(i8* %5, i8* %10, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.30.166, i64 0, i64 0)) #12
  br label %16

14:                                               ; preds = %9
  %15 = tail call i8* @halide_string_to_string(i8* %5, i8* %10, i8* nonnull %1) #12
  br label %16

16:                                               ; preds = %14, %12
  %17 = phi i8* [ %15, %14 ], [ %13, %12 ]
  %18 = tail call i8* @halide_string_to_string(i8* %17, i8* %10, i8* nonnull getelementptr inbounds ([31 x i8], [31 x i8]* @.str.11.123, i64 0, i64 0)) #12
  %19 = sext i32 %3 to i64
  %20 = tail call i8* @halide_int64_to_string(i8* %18, i8* %10, i64 %19, i32 1) #12
  %21 = tail call i8* @halide_string_to_string(i8* %20, i8* %10, i8* nonnull getelementptr inbounds ([43 x i8], [43 x i8]* @.str.12.124, i64 0, i64 0)) #12
  %22 = sext i32 %2 to i64
  %23 = tail call i8* @halide_int64_to_string(i8* %21, i8* %10, i64 %22, i32 1) #12
  %24 = tail call i8* @halide_string_to_string(i8* %23, i8* %10, i8* nonnull getelementptr inbounds ([12 x i8], [12 x i8]* @.str.13.125, i64 0, i64 0)) #12
  br i1 %6, label %25, label %26

25:                                               ; preds = %16
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.29.165, i64 0, i64 0)) #12
  br label %32

26:                                               ; preds = %16
  %27 = ptrtoint i8* %24 to i64
  %28 = ptrtoint i8* %5 to i64
  %29 = sub i64 1, %28
  %30 = add i64 %29, %27
  %31 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %5, i64 %30) #12
  tail call void @halide_error(i8* %0, i8* nonnull %5) #12
  br label %32

32:                                               ; preds = %26, %25
  tail call void @free(i8* %5) #12
  ret i32 -43
}

; Function Attrs: nounwind
define weak i32 @halide_error_access_out_of_bounds(i8* %0, i8* %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #4 {
  %8 = icmp slt i32 %3, %5
  br i1 %8, label %9, label %39

9:                                                ; preds = %7
  %10 = tail call i8* @malloc(i64 1024) #12
  %11 = icmp eq i8* %10, null
  br i1 %11, label %14, label %12

12:                                               ; preds = %9
  %13 = getelementptr inbounds i8, i8* %10, i64 1023
  store i8 0, i8* %13, align 1, !tbaa !14
  br label %14

14:                                               ; preds = %12, %9
  %15 = phi i8* [ %13, %12 ], [ null, %9 ]
  %16 = icmp eq i8* %1, null
  br i1 %16, label %17, label %19

17:                                               ; preds = %14
  %18 = tail call i8* @halide_string_to_string(i8* %10, i8* %15, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.30.166, i64 0, i64 0)) #12
  br label %21

19:                                               ; preds = %14
  %20 = tail call i8* @halide_string_to_string(i8* %10, i8* %15, i8* nonnull %1) #12
  br label %21

21:                                               ; preds = %19, %17
  %22 = phi i8* [ %20, %19 ], [ %18, %17 ]
  %23 = tail call i8* @halide_string_to_string(i8* %22, i8* %15, i8* nonnull getelementptr inbounds ([17 x i8], [17 x i8]* @.str.14.126, i64 0, i64 0)) #12
  %24 = sext i32 %3 to i64
  %25 = tail call i8* @halide_int64_to_string(i8* %23, i8* %15, i64 %24, i32 1) #12
  %26 = tail call i8* @halide_string_to_string(i8* %25, i8* %15, i8* nonnull getelementptr inbounds ([28 x i8], [28 x i8]* @.str.15.127, i64 0, i64 0)) #12
  %27 = sext i32 %5 to i64
  %28 = tail call i8* @halide_int64_to_string(i8* %26, i8* %15, i64 %27, i32 1) #12
  %29 = tail call i8* @halide_string_to_string(i8* %28, i8* %15, i8* nonnull getelementptr inbounds ([16 x i8], [16 x i8]* @.str.16.128, i64 0, i64 0)) #12
  %30 = sext i32 %2 to i64
  %31 = tail call i8* @halide_int64_to_string(i8* %29, i8* %15, i64 %30, i32 1) #12
  br i1 %11, label %32, label %33

32:                                               ; preds = %21
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.29.165, i64 0, i64 0)) #12
  br label %71

33:                                               ; preds = %21
  %34 = ptrtoint i8* %31 to i64
  %35 = ptrtoint i8* %10 to i64
  %36 = sub i64 1, %35
  %37 = add i64 %36, %34
  %38 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %10, i64 %37) #12
  tail call void @halide_error(i8* %0, i8* nonnull %10) #12
  br label %71

39:                                               ; preds = %7
  %40 = icmp sgt i32 %4, %6
  br i1 %40, label %41, label %73

41:                                               ; preds = %39
  %42 = tail call i8* @malloc(i64 1024) #12
  %43 = icmp eq i8* %42, null
  br i1 %43, label %46, label %44

44:                                               ; preds = %41
  %45 = getelementptr inbounds i8, i8* %42, i64 1023
  store i8 0, i8* %45, align 1, !tbaa !14
  br label %46

46:                                               ; preds = %44, %41
  %47 = phi i8* [ %45, %44 ], [ null, %41 ]
  %48 = icmp eq i8* %1, null
  br i1 %48, label %49, label %51

49:                                               ; preds = %46
  %50 = tail call i8* @halide_string_to_string(i8* %42, i8* %47, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.30.166, i64 0, i64 0)) #12
  br label %53

51:                                               ; preds = %46
  %52 = tail call i8* @halide_string_to_string(i8* %42, i8* %47, i8* nonnull %1) #12
  br label %53

53:                                               ; preds = %51, %49
  %54 = phi i8* [ %52, %51 ], [ %50, %49 ]
  %55 = tail call i8* @halide_string_to_string(i8* %54, i8* %47, i8* nonnull getelementptr inbounds ([17 x i8], [17 x i8]* @.str.14.126, i64 0, i64 0)) #12
  %56 = sext i32 %4 to i64
  %57 = tail call i8* @halide_int64_to_string(i8* %55, i8* %47, i64 %56, i32 1) #12
  %58 = tail call i8* @halide_string_to_string(i8* %57, i8* %47, i8* nonnull getelementptr inbounds ([28 x i8], [28 x i8]* @.str.17.129, i64 0, i64 0)) #12
  %59 = sext i32 %6 to i64
  %60 = tail call i8* @halide_int64_to_string(i8* %58, i8* %47, i64 %59, i32 1) #12
  %61 = tail call i8* @halide_string_to_string(i8* %60, i8* %47, i8* nonnull getelementptr inbounds ([16 x i8], [16 x i8]* @.str.16.128, i64 0, i64 0)) #12
  %62 = sext i32 %2 to i64
  %63 = tail call i8* @halide_int64_to_string(i8* %61, i8* %47, i64 %62, i32 1) #12
  br i1 %43, label %64, label %65

64:                                               ; preds = %53
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.29.165, i64 0, i64 0)) #12
  br label %71

65:                                               ; preds = %53
  %66 = ptrtoint i8* %63 to i64
  %67 = ptrtoint i8* %42 to i64
  %68 = sub i64 1, %67
  %69 = add i64 %68, %66
  %70 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %42, i64 %69) #12
  tail call void @halide_error(i8* %0, i8* nonnull %42) #12
  br label %71

71:                                               ; preds = %65, %64, %33, %32
  %72 = phi i8* [ null, %32 ], [ %10, %33 ], [ null, %64 ], [ %42, %65 ]
  tail call void @free(i8* %72) #12
  br label %73

73:                                               ; preds = %71, %39
  ret i32 -4
}

; Function Attrs: nounwind
define weak i32 @halide_error_buffer_allocation_too_large(i8* %0, i8* %1, i64 %2, i64 %3) local_unnamed_addr #4 {
  %5 = tail call i8* @malloc(i64 1024) #12
  %6 = icmp eq i8* %5, null
  br i1 %6, label %.split, label %.split2

.split:                                           ; preds = %4
  %7 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([29 x i8], [29 x i8]* @.str.18.130, i64 0, i64 0)) #12
  br label %10

.split2:                                          ; preds = %4
  %8 = getelementptr inbounds i8, i8* %5, i64 1023
  store i8 0, i8* %8, align 1, !tbaa !14
  %9 = tail call i8* @halide_string_to_string(i8* nonnull %5, i8* nonnull %8, i8* nonnull getelementptr inbounds ([29 x i8], [29 x i8]* @.str.18.130, i64 0, i64 0)) #12
  br label %10

10:                                               ; preds = %.split2, %.split
  %phi.call = phi i8* [ %7, %.split ], [ %9, %.split2 ]
  %11 = phi i8* [ null, %.split ], [ %8, %.split2 ]
  %12 = icmp eq i8* %1, null
  br i1 %12, label %13, label %15

13:                                               ; preds = %10
  %14 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.30.166, i64 0, i64 0)) #12
  br label %17

15:                                               ; preds = %10
  %16 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* nonnull %1) #12
  br label %17

17:                                               ; preds = %15, %13
  %18 = phi i8* [ %16, %15 ], [ %14, %13 ]
  %19 = tail call i8* @halide_string_to_string(i8* %18, i8* %11, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.131, i64 0, i64 0)) #12
  %20 = tail call i8* @halide_uint64_to_string(i8* %19, i8* %11, i64 %2, i32 1) #12
  %21 = tail call i8* @halide_string_to_string(i8* %20, i8* %11, i8* nonnull getelementptr inbounds ([37 x i8], [37 x i8]* @.str.20.132, i64 0, i64 0)) #12
  %22 = tail call i8* @halide_uint64_to_string(i8* %21, i8* %11, i64 %3, i32 1) #12
  br i1 %6, label %23, label %24

23:                                               ; preds = %17
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.29.165, i64 0, i64 0)) #12
  br label %30

24:                                               ; preds = %17
  %25 = ptrtoint i8* %22 to i64
  %26 = ptrtoint i8* %5 to i64
  %27 = sub i64 1, %26
  %28 = add i64 %27, %25
  %29 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %5, i64 %28) #12
  tail call void @halide_error(i8* %0, i8* nonnull %5) #12
  br label %30

30:                                               ; preds = %24, %23
  tail call void @free(i8* %5) #12
  ret i32 -5
}

; Function Attrs: nounwind
define weak i32 @halide_error_buffer_extents_negative(i8* %0, i8* %1, i32 %2, i32 %3) local_unnamed_addr #4 {
  %5 = tail call i8* @malloc(i64 1024) #12
  %6 = icmp eq i8* %5, null
  br i1 %6, label %.split, label %.split2

.split:                                           ; preds = %4
  %7 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([24 x i8], [24 x i8]* @.str.21.133, i64 0, i64 0)) #12
  br label %10

.split2:                                          ; preds = %4
  %8 = getelementptr inbounds i8, i8* %5, i64 1023
  store i8 0, i8* %8, align 1, !tbaa !14
  %9 = tail call i8* @halide_string_to_string(i8* nonnull %5, i8* nonnull %8, i8* nonnull getelementptr inbounds ([24 x i8], [24 x i8]* @.str.21.133, i64 0, i64 0)) #12
  br label %10

10:                                               ; preds = %.split2, %.split
  %phi.call = phi i8* [ %7, %.split ], [ %9, %.split2 ]
  %11 = phi i8* [ null, %.split ], [ %8, %.split2 ]
  %12 = icmp eq i8* %1, null
  br i1 %12, label %13, label %15

13:                                               ; preds = %10
  %14 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.30.166, i64 0, i64 0)) #12
  br label %17

15:                                               ; preds = %10
  %16 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* nonnull %1) #12
  br label %17

17:                                               ; preds = %15, %13
  %18 = phi i8* [ %16, %15 ], [ %14, %13 ]
  %19 = tail call i8* @halide_string_to_string(i8* %18, i8* %11, i8* nonnull getelementptr inbounds ([12 x i8], [12 x i8]* @.str.22.134, i64 0, i64 0)) #12
  %20 = sext i32 %2 to i64
  %21 = tail call i8* @halide_int64_to_string(i8* %19, i8* %11, i64 %20, i32 1) #12
  %22 = tail call i8* @halide_string_to_string(i8* %21, i8* %11, i8* nonnull getelementptr inbounds ([15 x i8], [15 x i8]* @.str.23.135, i64 0, i64 0)) #12
  %23 = sext i32 %3 to i64
  %24 = tail call i8* @halide_int64_to_string(i8* %22, i8* %11, i64 %23, i32 1) #12
  %25 = tail call i8* @halide_string_to_string(i8* %24, i8* %11, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8.120, i64 0, i64 0)) #12
  br i1 %6, label %26, label %27

26:                                               ; preds = %17
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.29.165, i64 0, i64 0)) #12
  br label %33

27:                                               ; preds = %17
  %28 = ptrtoint i8* %25 to i64
  %29 = ptrtoint i8* %5 to i64
  %30 = sub i64 1, %29
  %31 = add i64 %30, %28
  %32 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %5, i64 %31) #12
  tail call void @halide_error(i8* %0, i8* nonnull %5) #12
  br label %33

33:                                               ; preds = %27, %26
  tail call void @free(i8* %5) #12
  ret i32 -28
}

; Function Attrs: nounwind
define weak i32 @halide_error_buffer_extents_too_large(i8* %0, i8* %1, i64 %2, i64 %3) local_unnamed_addr #4 {
  %5 = tail call i8* @malloc(i64 1024) #12
  %6 = icmp eq i8* %5, null
  br i1 %6, label %.split, label %.split2

.split:                                           ; preds = %4
  %7 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([31 x i8], [31 x i8]* @.str.24.136, i64 0, i64 0)) #12
  br label %10

.split2:                                          ; preds = %4
  %8 = getelementptr inbounds i8, i8* %5, i64 1023
  store i8 0, i8* %8, align 1, !tbaa !14
  %9 = tail call i8* @halide_string_to_string(i8* nonnull %5, i8* nonnull %8, i8* nonnull getelementptr inbounds ([31 x i8], [31 x i8]* @.str.24.136, i64 0, i64 0)) #12
  br label %10

10:                                               ; preds = %.split2, %.split
  %phi.call = phi i8* [ %7, %.split ], [ %9, %.split2 ]
  %11 = phi i8* [ null, %.split ], [ %8, %.split2 ]
  %12 = icmp eq i8* %1, null
  br i1 %12, label %13, label %15

13:                                               ; preds = %10
  %14 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.30.166, i64 0, i64 0)) #12
  br label %17

15:                                               ; preds = %10
  %16 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* nonnull %1) #12
  br label %17

17:                                               ; preds = %15, %13
  %18 = phi i8* [ %16, %15 ], [ %14, %13 ]
  %19 = tail call i8* @halide_string_to_string(i8* %18, i8* %11, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.131, i64 0, i64 0)) #12
  %20 = tail call i8* @halide_int64_to_string(i8* %19, i8* %11, i64 %2, i32 1) #12
  %21 = tail call i8* @halide_string_to_string(i8* %20, i8* %11, i8* nonnull getelementptr inbounds ([37 x i8], [37 x i8]* @.str.20.132, i64 0, i64 0)) #12
  %22 = tail call i8* @halide_int64_to_string(i8* %21, i8* %11, i64 %3, i32 1) #12
  br i1 %6, label %23, label %24

23:                                               ; preds = %17
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.29.165, i64 0, i64 0)) #12
  br label %30

24:                                               ; preds = %17
  %25 = ptrtoint i8* %22 to i64
  %26 = ptrtoint i8* %5 to i64
  %27 = sub i64 1, %26
  %28 = add i64 %27, %25
  %29 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %5, i64 %28) #12
  tail call void @halide_error(i8* %0, i8* nonnull %5) #12
  br label %30

30:                                               ; preds = %24, %23
  tail call void @free(i8* %5) #12
  ret i32 -6
}

; Function Attrs: nounwind
define weak i32 @halide_error_constraints_make_required_region_smaller(i8* %0, i8* %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #4 {
  %8 = add i32 %5, -1
  %9 = add i32 %8, %6
  %10 = add i32 %3, -1
  %11 = add i32 %10, %4
  %12 = tail call i8* @malloc(i64 1024) #12
  %13 = icmp eq i8* %12, null
  br i1 %13, label %.split, label %.split2

.split:                                           ; preds = %7
  %14 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([29 x i8], [29 x i8]* @.str.25.137, i64 0, i64 0)) #12
  br label %17

.split2:                                          ; preds = %7
  %15 = getelementptr inbounds i8, i8* %12, i64 1023
  store i8 0, i8* %15, align 1, !tbaa !14
  %16 = tail call i8* @halide_string_to_string(i8* nonnull %12, i8* nonnull %15, i8* nonnull getelementptr inbounds ([29 x i8], [29 x i8]* @.str.25.137, i64 0, i64 0)) #12
  br label %17

17:                                               ; preds = %.split2, %.split
  %phi.call = phi i8* [ %14, %.split ], [ %16, %.split2 ]
  %18 = phi i8* [ null, %.split ], [ %15, %.split2 ]
  %19 = icmp eq i8* %1, null
  br i1 %19, label %20, label %22

20:                                               ; preds = %17
  %21 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %18, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.30.166, i64 0, i64 0)) #12
  br label %24

22:                                               ; preds = %17
  %23 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %18, i8* nonnull %1) #12
  br label %24

24:                                               ; preds = %22, %20
  %25 = phi i8* [ %23, %22 ], [ %21, %20 ]
  %26 = tail call i8* @halide_string_to_string(i8* %25, i8* %18, i8* nonnull getelementptr inbounds ([54 x i8], [54 x i8]* @.str.26.138, i64 0, i64 0)) #12
  %27 = sext i32 %2 to i64
  %28 = tail call i8* @halide_int64_to_string(i8* %26, i8* %18, i64 %27, i32 1) #12
  %29 = tail call i8* @halide_string_to_string(i8* %28, i8* %18, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.27.139, i64 0, i64 0)) #12
  %30 = tail call i8* @halide_string_to_string(i8* %29, i8* %18, i8* nonnull getelementptr inbounds ([16 x i8], [16 x i8]* @.str.28.140, i64 0, i64 0)) #12
  %31 = sext i32 %5 to i64
  %32 = tail call i8* @halide_int64_to_string(i8* %30, i8* %18, i64 %31, i32 1) #12
  %33 = tail call i8* @halide_string_to_string(i8* %32, i8* %18, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6.118, i64 0, i64 0)) #12
  %34 = sext i32 %9 to i64
  %35 = tail call i8* @halide_int64_to_string(i8* %33, i8* %18, i64 %34, i32 1) #12
  %36 = tail call i8* @halide_string_to_string(i8* %35, i8* %18, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.27.139, i64 0, i64 0)) #12
  %37 = tail call i8* @halide_string_to_string(i8* %36, i8* %18, i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str.29.141, i64 0, i64 0)) #12
  %38 = sext i32 %3 to i64
  %39 = tail call i8* @halide_int64_to_string(i8* %37, i8* %18, i64 %38, i32 1) #12
  %40 = tail call i8* @halide_string_to_string(i8* %39, i8* %18, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6.118, i64 0, i64 0)) #12
  %41 = sext i32 %11 to i64
  %42 = tail call i8* @halide_int64_to_string(i8* %40, i8* %18, i64 %41, i32 1) #12
  %43 = tail call i8* @halide_string_to_string(i8* %42, i8* %18, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30.142, i64 0, i64 0)) #12
  br i1 %13, label %44, label %45

44:                                               ; preds = %24
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.29.165, i64 0, i64 0)) #12
  br label %51

45:                                               ; preds = %24
  %46 = ptrtoint i8* %43 to i64
  %47 = ptrtoint i8* %12 to i64
  %48 = sub i64 1, %47
  %49 = add i64 %48, %46
  %50 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %12, i64 %49) #12
  tail call void @halide_error(i8* %0, i8* nonnull %12) #12
  br label %51

51:                                               ; preds = %45, %44
  tail call void @free(i8* %12) #12
  ret i32 -7
}

; Function Attrs: nounwind
define weak i32 @halide_error_constraint_violated(i8* %0, i8* %1, i32 %2, i8* %3, i32 %4) local_unnamed_addr #4 {
  %6 = tail call i8* @malloc(i64 1024) #12
  %7 = icmp eq i8* %6, null
  br i1 %7, label %.split, label %.split2

.split:                                           ; preds = %5
  %8 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.31.143, i64 0, i64 0)) #12
  br label %11

.split2:                                          ; preds = %5
  %9 = getelementptr inbounds i8, i8* %6, i64 1023
  store i8 0, i8* %9, align 1, !tbaa !14
  %10 = tail call i8* @halide_string_to_string(i8* nonnull %6, i8* nonnull %9, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.31.143, i64 0, i64 0)) #12
  br label %11

11:                                               ; preds = %.split2, %.split
  %phi.call = phi i8* [ %8, %.split ], [ %10, %.split2 ]
  %12 = phi i8* [ null, %.split ], [ %9, %.split2 ]
  %13 = icmp eq i8* %1, null
  br i1 %13, label %14, label %16

14:                                               ; preds = %11
  %15 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %12, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.30.166, i64 0, i64 0)) #12
  br label %18

16:                                               ; preds = %11
  %17 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %12, i8* nonnull %1) #12
  br label %18

18:                                               ; preds = %16, %14
  %19 = phi i8* [ %17, %16 ], [ %15, %14 ]
  %20 = tail call i8* @halide_string_to_string(i8* %19, i8* %12, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.32.144, i64 0, i64 0)) #12
  %21 = sext i32 %2 to i64
  %22 = tail call i8* @halide_int64_to_string(i8* %20, i8* %12, i64 %21, i32 1) #12
  %23 = tail call i8* @halide_string_to_string(i8* %22, i8* %12, i8* nonnull getelementptr inbounds ([6 x i8], [6 x i8]* @.str.33.145, i64 0, i64 0)) #12
  %24 = icmp eq i8* %3, null
  br i1 %24, label %25, label %27

25:                                               ; preds = %18
  %26 = tail call i8* @halide_string_to_string(i8* %23, i8* %12, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.30.166, i64 0, i64 0)) #12
  br label %29

27:                                               ; preds = %18
  %28 = tail call i8* @halide_string_to_string(i8* %23, i8* %12, i8* nonnull %3) #12
  br label %29

29:                                               ; preds = %27, %25
  %30 = phi i8* [ %28, %27 ], [ %26, %25 ]
  %31 = tail call i8* @halide_string_to_string(i8* %30, i8* %12, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.32.144, i64 0, i64 0)) #12
  %32 = sext i32 %4 to i64
  %33 = tail call i8* @halide_int64_to_string(i8* %31, i8* %12, i64 %32, i32 1) #12
  %34 = tail call i8* @halide_string_to_string(i8* %33, i8* %12, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8.120, i64 0, i64 0)) #12
  br i1 %7, label %35, label %36

35:                                               ; preds = %29
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.29.165, i64 0, i64 0)) #12
  br label %42

36:                                               ; preds = %29
  %37 = ptrtoint i8* %34 to i64
  %38 = ptrtoint i8* %6 to i64
  %39 = sub i64 1, %38
  %40 = add i64 %39, %37
  %41 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %6, i64 %40) #12
  tail call void @halide_error(i8* %0, i8* nonnull %6) #12
  br label %42

42:                                               ; preds = %36, %35
  tail call void @free(i8* %6) #12
  ret i32 -8
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_small_i64(i8* %0, i8* %1, i64 %2, i64 %3) local_unnamed_addr #4 {
  %5 = tail call i8* @malloc(i64 1024) #12
  %6 = icmp eq i8* %5, null
  br i1 %6, label %.split, label %.split2

.split:                                           ; preds = %4
  %7 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.146, i64 0, i64 0)) #12
  br label %10

.split2:                                          ; preds = %4
  %8 = getelementptr inbounds i8, i8* %5, i64 1023
  store i8 0, i8* %8, align 1, !tbaa !14
  %9 = tail call i8* @halide_string_to_string(i8* nonnull %5, i8* nonnull %8, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.146, i64 0, i64 0)) #12
  br label %10

10:                                               ; preds = %.split2, %.split
  %phi.call = phi i8* [ %7, %.split ], [ %9, %.split2 ]
  %11 = phi i8* [ null, %.split ], [ %8, %.split2 ]
  %12 = icmp eq i8* %1, null
  br i1 %12, label %13, label %15

13:                                               ; preds = %10
  %14 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.30.166, i64 0, i64 0)) #12
  br label %17

15:                                               ; preds = %10
  %16 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* nonnull %1) #12
  br label %17

17:                                               ; preds = %15, %13
  %18 = phi i8* [ %16, %15 ], [ %14, %13 ]
  %19 = tail call i8* @halide_string_to_string(i8* %18, i8* %11, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.131, i64 0, i64 0)) #12
  %20 = tail call i8* @halide_int64_to_string(i8* %19, i8* %11, i64 %2, i32 1) #12
  %21 = tail call i8* @halide_string_to_string(i8* %20, i8* %11, i8* nonnull getelementptr inbounds ([23 x i8], [23 x i8]* @.str.35.147, i64 0, i64 0)) #12
  %22 = tail call i8* @halide_int64_to_string(i8* %21, i8* %11, i64 %3, i32 1) #12
  br i1 %6, label %23, label %24

23:                                               ; preds = %17
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.29.165, i64 0, i64 0)) #12
  br label %30

24:                                               ; preds = %17
  %25 = ptrtoint i8* %22 to i64
  %26 = ptrtoint i8* %5 to i64
  %27 = sub i64 1, %26
  %28 = add i64 %27, %25
  %29 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %5, i64 %28) #12
  tail call void @halide_error(i8* %0, i8* nonnull %5) #12
  br label %30

30:                                               ; preds = %24, %23
  tail call void @free(i8* %5) #12
  ret i32 -9
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_small_u64(i8* %0, i8* %1, i64 %2, i64 %3) local_unnamed_addr #4 {
  %5 = tail call i8* @malloc(i64 1024) #12
  %6 = icmp eq i8* %5, null
  br i1 %6, label %.split, label %.split2

.split:                                           ; preds = %4
  %7 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.146, i64 0, i64 0)) #12
  br label %10

.split2:                                          ; preds = %4
  %8 = getelementptr inbounds i8, i8* %5, i64 1023
  store i8 0, i8* %8, align 1, !tbaa !14
  %9 = tail call i8* @halide_string_to_string(i8* nonnull %5, i8* nonnull %8, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.146, i64 0, i64 0)) #12
  br label %10

10:                                               ; preds = %.split2, %.split
  %phi.call = phi i8* [ %7, %.split ], [ %9, %.split2 ]
  %11 = phi i8* [ null, %.split ], [ %8, %.split2 ]
  %12 = icmp eq i8* %1, null
  br i1 %12, label %13, label %15

13:                                               ; preds = %10
  %14 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.30.166, i64 0, i64 0)) #12
  br label %17

15:                                               ; preds = %10
  %16 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* nonnull %1) #12
  br label %17

17:                                               ; preds = %15, %13
  %18 = phi i8* [ %16, %15 ], [ %14, %13 ]
  %19 = tail call i8* @halide_string_to_string(i8* %18, i8* %11, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.131, i64 0, i64 0)) #12
  %20 = tail call i8* @halide_uint64_to_string(i8* %19, i8* %11, i64 %2, i32 1) #12
  %21 = tail call i8* @halide_string_to_string(i8* %20, i8* %11, i8* nonnull getelementptr inbounds ([23 x i8], [23 x i8]* @.str.35.147, i64 0, i64 0)) #12
  %22 = tail call i8* @halide_uint64_to_string(i8* %21, i8* %11, i64 %3, i32 1) #12
  br i1 %6, label %23, label %24

23:                                               ; preds = %17
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.29.165, i64 0, i64 0)) #12
  br label %30

24:                                               ; preds = %17
  %25 = ptrtoint i8* %22 to i64
  %26 = ptrtoint i8* %5 to i64
  %27 = sub i64 1, %26
  %28 = add i64 %27, %25
  %29 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %5, i64 %28) #12
  tail call void @halide_error(i8* %0, i8* nonnull %5) #12
  br label %30

30:                                               ; preds = %24, %23
  tail call void @free(i8* %5) #12
  ret i32 -9
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_small_f64(i8* %0, i8* %1, double %2, double %3) local_unnamed_addr #4 {
  %5 = tail call i8* @malloc(i64 1024) #12
  %6 = icmp eq i8* %5, null
  br i1 %6, label %.split, label %.split2

.split:                                           ; preds = %4
  %7 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.146, i64 0, i64 0)) #12
  br label %10

.split2:                                          ; preds = %4
  %8 = getelementptr inbounds i8, i8* %5, i64 1023
  store i8 0, i8* %8, align 1, !tbaa !14
  %9 = tail call i8* @halide_string_to_string(i8* nonnull %5, i8* nonnull %8, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.146, i64 0, i64 0)) #12
  br label %10

10:                                               ; preds = %.split2, %.split
  %phi.call = phi i8* [ %7, %.split ], [ %9, %.split2 ]
  %11 = phi i8* [ null, %.split ], [ %8, %.split2 ]
  %12 = icmp eq i8* %1, null
  br i1 %12, label %13, label %15

13:                                               ; preds = %10
  %14 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.30.166, i64 0, i64 0)) #12
  br label %17

15:                                               ; preds = %10
  %16 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* nonnull %1) #12
  br label %17

17:                                               ; preds = %15, %13
  %18 = phi i8* [ %16, %15 ], [ %14, %13 ]
  %19 = tail call i8* @halide_string_to_string(i8* %18, i8* %11, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.131, i64 0, i64 0)) #12
  %20 = tail call i8* @halide_double_to_string(i8* %19, i8* %11, double %2, i32 1) #12
  %21 = tail call i8* @halide_string_to_string(i8* %20, i8* %11, i8* nonnull getelementptr inbounds ([23 x i8], [23 x i8]* @.str.35.147, i64 0, i64 0)) #12
  %22 = tail call i8* @halide_double_to_string(i8* %21, i8* %11, double %3, i32 1) #12
  br i1 %6, label %23, label %24

23:                                               ; preds = %17
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.29.165, i64 0, i64 0)) #12
  br label %30

24:                                               ; preds = %17
  %25 = ptrtoint i8* %22 to i64
  %26 = ptrtoint i8* %5 to i64
  %27 = sub i64 1, %26
  %28 = add i64 %27, %25
  %29 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %5, i64 %28) #12
  tail call void @halide_error(i8* %0, i8* nonnull %5) #12
  br label %30

30:                                               ; preds = %24, %23
  tail call void @free(i8* %5) #12
  ret i32 -9
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_large_i64(i8* %0, i8* %1, i64 %2, i64 %3) local_unnamed_addr #4 {
  %5 = tail call i8* @malloc(i64 1024) #12
  %6 = icmp eq i8* %5, null
  br i1 %6, label %.split, label %.split2

.split:                                           ; preds = %4
  %7 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.146, i64 0, i64 0)) #12
  br label %10

.split2:                                          ; preds = %4
  %8 = getelementptr inbounds i8, i8* %5, i64 1023
  store i8 0, i8* %8, align 1, !tbaa !14
  %9 = tail call i8* @halide_string_to_string(i8* nonnull %5, i8* nonnull %8, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.146, i64 0, i64 0)) #12
  br label %10

10:                                               ; preds = %.split2, %.split
  %phi.call = phi i8* [ %7, %.split ], [ %9, %.split2 ]
  %11 = phi i8* [ null, %.split ], [ %8, %.split2 ]
  %12 = icmp eq i8* %1, null
  br i1 %12, label %13, label %15

13:                                               ; preds = %10
  %14 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.30.166, i64 0, i64 0)) #12
  br label %17

15:                                               ; preds = %10
  %16 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* nonnull %1) #12
  br label %17

17:                                               ; preds = %15, %13
  %18 = phi i8* [ %16, %15 ], [ %14, %13 ]
  %19 = tail call i8* @halide_string_to_string(i8* %18, i8* %11, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.131, i64 0, i64 0)) #12
  %20 = tail call i8* @halide_int64_to_string(i8* %19, i8* %11, i64 %2, i32 1) #12
  %21 = tail call i8* @halide_string_to_string(i8* %20, i8* %11, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.36.148, i64 0, i64 0)) #12
  %22 = tail call i8* @halide_int64_to_string(i8* %21, i8* %11, i64 %3, i32 1) #12
  br i1 %6, label %23, label %24

23:                                               ; preds = %17
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.29.165, i64 0, i64 0)) #12
  br label %30

24:                                               ; preds = %17
  %25 = ptrtoint i8* %22 to i64
  %26 = ptrtoint i8* %5 to i64
  %27 = sub i64 1, %26
  %28 = add i64 %27, %25
  %29 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %5, i64 %28) #12
  tail call void @halide_error(i8* %0, i8* nonnull %5) #12
  br label %30

30:                                               ; preds = %24, %23
  tail call void @free(i8* %5) #12
  ret i32 -10
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_large_u64(i8* %0, i8* %1, i64 %2, i64 %3) local_unnamed_addr #4 {
  %5 = tail call i8* @malloc(i64 1024) #12
  %6 = icmp eq i8* %5, null
  br i1 %6, label %.split, label %.split2

.split:                                           ; preds = %4
  %7 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.146, i64 0, i64 0)) #12
  br label %10

.split2:                                          ; preds = %4
  %8 = getelementptr inbounds i8, i8* %5, i64 1023
  store i8 0, i8* %8, align 1, !tbaa !14
  %9 = tail call i8* @halide_string_to_string(i8* nonnull %5, i8* nonnull %8, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.146, i64 0, i64 0)) #12
  br label %10

10:                                               ; preds = %.split2, %.split
  %phi.call = phi i8* [ %7, %.split ], [ %9, %.split2 ]
  %11 = phi i8* [ null, %.split ], [ %8, %.split2 ]
  %12 = icmp eq i8* %1, null
  br i1 %12, label %13, label %15

13:                                               ; preds = %10
  %14 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.30.166, i64 0, i64 0)) #12
  br label %17

15:                                               ; preds = %10
  %16 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* nonnull %1) #12
  br label %17

17:                                               ; preds = %15, %13
  %18 = phi i8* [ %16, %15 ], [ %14, %13 ]
  %19 = tail call i8* @halide_string_to_string(i8* %18, i8* %11, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.131, i64 0, i64 0)) #12
  %20 = tail call i8* @halide_uint64_to_string(i8* %19, i8* %11, i64 %2, i32 1) #12
  %21 = tail call i8* @halide_string_to_string(i8* %20, i8* %11, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.36.148, i64 0, i64 0)) #12
  %22 = tail call i8* @halide_uint64_to_string(i8* %21, i8* %11, i64 %3, i32 1) #12
  br i1 %6, label %23, label %24

23:                                               ; preds = %17
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.29.165, i64 0, i64 0)) #12
  br label %30

24:                                               ; preds = %17
  %25 = ptrtoint i8* %22 to i64
  %26 = ptrtoint i8* %5 to i64
  %27 = sub i64 1, %26
  %28 = add i64 %27, %25
  %29 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %5, i64 %28) #12
  tail call void @halide_error(i8* %0, i8* nonnull %5) #12
  br label %30

30:                                               ; preds = %24, %23
  tail call void @free(i8* %5) #12
  ret i32 -10
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_large_f64(i8* %0, i8* %1, double %2, double %3) local_unnamed_addr #4 {
  %5 = tail call i8* @malloc(i64 1024) #12
  %6 = icmp eq i8* %5, null
  br i1 %6, label %.split, label %.split2

.split:                                           ; preds = %4
  %7 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.146, i64 0, i64 0)) #12
  br label %10

.split2:                                          ; preds = %4
  %8 = getelementptr inbounds i8, i8* %5, i64 1023
  store i8 0, i8* %8, align 1, !tbaa !14
  %9 = tail call i8* @halide_string_to_string(i8* nonnull %5, i8* nonnull %8, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.146, i64 0, i64 0)) #12
  br label %10

10:                                               ; preds = %.split2, %.split
  %phi.call = phi i8* [ %7, %.split ], [ %9, %.split2 ]
  %11 = phi i8* [ null, %.split ], [ %8, %.split2 ]
  %12 = icmp eq i8* %1, null
  br i1 %12, label %13, label %15

13:                                               ; preds = %10
  %14 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.30.166, i64 0, i64 0)) #12
  br label %17

15:                                               ; preds = %10
  %16 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* nonnull %1) #12
  br label %17

17:                                               ; preds = %15, %13
  %18 = phi i8* [ %16, %15 ], [ %14, %13 ]
  %19 = tail call i8* @halide_string_to_string(i8* %18, i8* %11, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.131, i64 0, i64 0)) #12
  %20 = tail call i8* @halide_double_to_string(i8* %19, i8* %11, double %2, i32 1) #12
  %21 = tail call i8* @halide_string_to_string(i8* %20, i8* %11, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.36.148, i64 0, i64 0)) #12
  %22 = tail call i8* @halide_double_to_string(i8* %21, i8* %11, double %3, i32 1) #12
  br i1 %6, label %23, label %24

23:                                               ; preds = %17
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.29.165, i64 0, i64 0)) #12
  br label %30

24:                                               ; preds = %17
  %25 = ptrtoint i8* %22 to i64
  %26 = ptrtoint i8* %5 to i64
  %27 = sub i64 1, %26
  %28 = add i64 %27, %25
  %29 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %5, i64 %28) #12
  tail call void @halide_error(i8* %0, i8* nonnull %5) #12
  br label %30

30:                                               ; preds = %24, %23
  tail call void @free(i8* %5) #12
  ret i32 -10
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_error_out_of_memory(i8* %0) local_unnamed_addr #0 {
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.37, i64 0, i64 0)) #12
  ret i32 -11
}

; Function Attrs: nounwind
define weak i32 @halide_error_buffer_argument_is_null(i8* %0, i8* %1) local_unnamed_addr #4 {
  %3 = tail call i8* @malloc(i64 1024) #12
  %4 = icmp eq i8* %3, null
  br i1 %4, label %.split, label %.split2

.split:                                           ; preds = %2
  %5 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([17 x i8], [17 x i8]* @.str.38, i64 0, i64 0)) #12
  br label %8

.split2:                                          ; preds = %2
  %6 = getelementptr inbounds i8, i8* %3, i64 1023
  store i8 0, i8* %6, align 1, !tbaa !14
  %7 = tail call i8* @halide_string_to_string(i8* nonnull %3, i8* nonnull %6, i8* nonnull getelementptr inbounds ([17 x i8], [17 x i8]* @.str.38, i64 0, i64 0)) #12
  br label %8

8:                                                ; preds = %.split2, %.split
  %phi.call = phi i8* [ %5, %.split ], [ %7, %.split2 ]
  %9 = phi i8* [ null, %.split ], [ %6, %.split2 ]
  %10 = icmp eq i8* %1, null
  br i1 %10, label %11, label %13

11:                                               ; preds = %8
  %12 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %9, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.30.166, i64 0, i64 0)) #12
  br label %15

13:                                               ; preds = %8
  %14 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %9, i8* nonnull %1) #12
  br label %15

15:                                               ; preds = %13, %11
  %16 = phi i8* [ %14, %13 ], [ %12, %11 ]
  %17 = tail call i8* @halide_string_to_string(i8* %16, i8* %9, i8* nonnull getelementptr inbounds ([12 x i8], [12 x i8]* @.str.39, i64 0, i64 0)) #12
  br i1 %4, label %18, label %19

18:                                               ; preds = %15
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.29.165, i64 0, i64 0)) #12
  br label %25

19:                                               ; preds = %15
  %20 = ptrtoint i8* %17 to i64
  %21 = ptrtoint i8* %3 to i64
  %22 = sub i64 1, %21
  %23 = add i64 %22, %20
  %24 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %3, i64 %23) #12
  tail call void @halide_error(i8* %0, i8* nonnull %3) #12
  br label %25

25:                                               ; preds = %19, %18
  tail call void @free(i8* %3) #12
  ret i32 -12
}

; Function Attrs: nounwind
define weak i32 @halide_error_debug_to_file_failed(i8* %0, i8* %1, i8* %2, i32 %3) local_unnamed_addr #4 {
  %5 = tail call i8* @malloc(i64 1024) #12
  %6 = icmp eq i8* %5, null
  br i1 %6, label %.split, label %.split2

.split:                                           ; preds = %4
  %7 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([25 x i8], [25 x i8]* @.str.40, i64 0, i64 0)) #12
  br label %10

.split2:                                          ; preds = %4
  %8 = getelementptr inbounds i8, i8* %5, i64 1023
  store i8 0, i8* %8, align 1, !tbaa !14
  %9 = tail call i8* @halide_string_to_string(i8* nonnull %5, i8* nonnull %8, i8* nonnull getelementptr inbounds ([25 x i8], [25 x i8]* @.str.40, i64 0, i64 0)) #12
  br label %10

10:                                               ; preds = %.split2, %.split
  %phi.call = phi i8* [ %7, %.split ], [ %9, %.split2 ]
  %11 = phi i8* [ null, %.split ], [ %8, %.split2 ]
  %12 = icmp eq i8* %1, null
  br i1 %12, label %13, label %15

13:                                               ; preds = %10
  %14 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.30.166, i64 0, i64 0)) #12
  br label %17

15:                                               ; preds = %10
  %16 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* nonnull %1) #12
  br label %17

17:                                               ; preds = %15, %13
  %18 = phi i8* [ %16, %15 ], [ %14, %13 ]
  %19 = tail call i8* @halide_string_to_string(i8* %18, i8* %11, i8* nonnull getelementptr inbounds ([10 x i8], [10 x i8]* @.str.41, i64 0, i64 0)) #12
  %20 = icmp eq i8* %2, null
  br i1 %20, label %21, label %23

21:                                               ; preds = %17
  %22 = tail call i8* @halide_string_to_string(i8* %19, i8* %11, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.30.166, i64 0, i64 0)) #12
  br label %25

23:                                               ; preds = %17
  %24 = tail call i8* @halide_string_to_string(i8* %19, i8* %11, i8* nonnull %2) #12
  br label %25

25:                                               ; preds = %23, %21
  %26 = phi i8* [ %24, %23 ], [ %22, %21 ]
  %27 = tail call i8* @halide_string_to_string(i8* %26, i8* %11, i8* nonnull getelementptr inbounds ([13 x i8], [13 x i8]* @.str.42.149, i64 0, i64 0)) #12
  %28 = sext i32 %3 to i64
  %29 = tail call i8* @halide_int64_to_string(i8* %27, i8* %11, i64 %28, i32 1) #12
  br i1 %6, label %30, label %31

30:                                               ; preds = %25
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.29.165, i64 0, i64 0)) #12
  br label %37

31:                                               ; preds = %25
  %32 = ptrtoint i8* %29 to i64
  %33 = ptrtoint i8* %5 to i64
  %34 = sub i64 1, %33
  %35 = add i64 %34, %32
  %36 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %5, i64 %35) #12
  tail call void @halide_error(i8* %0, i8* nonnull %5) #12
  br label %37

37:                                               ; preds = %31, %30
  tail call void @free(i8* %5) #12
  ret i32 -13
}

; Function Attrs: nounwind
define weak i32 @halide_error_unaligned_host_ptr(i8* %0, i8* %1, i32 %2) local_unnamed_addr #4 {
  %4 = tail call i8* @malloc(i64 1024) #12
  %5 = icmp eq i8* %4, null
  br i1 %5, label %.split, label %.split2

.split:                                           ; preds = %3
  %6 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([21 x i8], [21 x i8]* @.str.43, i64 0, i64 0)) #12
  br label %9

.split2:                                          ; preds = %3
  %7 = getelementptr inbounds i8, i8* %4, i64 1023
  store i8 0, i8* %7, align 1, !tbaa !14
  %8 = tail call i8* @halide_string_to_string(i8* nonnull %4, i8* nonnull %7, i8* nonnull getelementptr inbounds ([21 x i8], [21 x i8]* @.str.43, i64 0, i64 0)) #12
  br label %9

9:                                                ; preds = %.split2, %.split
  %phi.call = phi i8* [ %6, %.split ], [ %8, %.split2 ]
  %10 = phi i8* [ null, %.split ], [ %7, %.split2 ]
  %11 = icmp eq i8* %1, null
  br i1 %11, label %12, label %14

12:                                               ; preds = %9
  %13 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %10, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.30.166, i64 0, i64 0)) #12
  br label %16

14:                                               ; preds = %9
  %15 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %10, i8* nonnull %1) #12
  br label %16

16:                                               ; preds = %14, %12
  %17 = phi i8* [ %15, %14 ], [ %13, %12 ]
  %18 = tail call i8* @halide_string_to_string(i8* %17, i8* %10, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.44, i64 0, i64 0)) #12
  %19 = sext i32 %2 to i64
  %20 = tail call i8* @halide_int64_to_string(i8* %18, i8* %10, i64 %19, i32 1) #12
  %21 = tail call i8* @halide_string_to_string(i8* %20, i8* %10, i8* nonnull getelementptr inbounds ([17 x i8], [17 x i8]* @.str.45, i64 0, i64 0)) #12
  br i1 %5, label %22, label %23

22:                                               ; preds = %16
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.29.165, i64 0, i64 0)) #12
  br label %29

23:                                               ; preds = %16
  %24 = ptrtoint i8* %21 to i64
  %25 = ptrtoint i8* %4 to i64
  %26 = sub i64 1, %25
  %27 = add i64 %26, %24
  %28 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %4, i64 %27) #12
  tail call void @halide_error(i8* %0, i8* nonnull %4) #12
  br label %29

29:                                               ; preds = %23, %22
  tail call void @free(i8* %4) #12
  ret i32 -24
}

; Function Attrs: nounwind
define weak i32 @halide_error_device_dirty_with_no_device_support(i8* %0, i8* %1) local_unnamed_addr #4 {
  %3 = tail call i8* @malloc(i64 1024) #12
  %4 = icmp eq i8* %3, null
  br i1 %4, label %.split, label %.split2

.split:                                           ; preds = %2
  %5 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([12 x i8], [12 x i8]* @.str.46, i64 0, i64 0)) #12
  br label %8

.split2:                                          ; preds = %2
  %6 = getelementptr inbounds i8, i8* %3, i64 1023
  store i8 0, i8* %6, align 1, !tbaa !14
  %7 = tail call i8* @halide_string_to_string(i8* nonnull %3, i8* nonnull %6, i8* nonnull getelementptr inbounds ([12 x i8], [12 x i8]* @.str.46, i64 0, i64 0)) #12
  br label %8

8:                                                ; preds = %.split2, %.split
  %phi.call = phi i8* [ %5, %.split ], [ %7, %.split2 ]
  %9 = phi i8* [ null, %.split ], [ %6, %.split2 ]
  %10 = icmp eq i8* %1, null
  br i1 %10, label %11, label %13

11:                                               ; preds = %8
  %12 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %9, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.30.166, i64 0, i64 0)) #12
  br label %15

13:                                               ; preds = %8
  %14 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %9, i8* nonnull %1) #12
  br label %15

15:                                               ; preds = %13, %11
  %16 = phi i8* [ %14, %13 ], [ %12, %11 ]
  %17 = tail call i8* @halide_string_to_string(i8* %16, i8* %9, i8* nonnull getelementptr inbounds ([53 x i8], [53 x i8]* @.str.47, i64 0, i64 0)) #12
  %18 = tail call i8* @halide_string_to_string(i8* %17, i8* %9, i8* nonnull getelementptr inbounds ([43 x i8], [43 x i8]* @.str.48, i64 0, i64 0)) #12
  br i1 %4, label %19, label %20

19:                                               ; preds = %15
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.29.165, i64 0, i64 0)) #12
  br label %26

20:                                               ; preds = %15
  %21 = ptrtoint i8* %18 to i64
  %22 = ptrtoint i8* %3 to i64
  %23 = sub i64 1, %22
  %24 = add i64 %23, %21
  %25 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %3, i64 %24) #12
  tail call void @halide_error(i8* %0, i8* nonnull %3) #12
  br label %26

26:                                               ; preds = %20, %19
  tail call void @free(i8* %3) #12
  ret i32 -44
}

; Function Attrs: nounwind
define weak i32 @halide_error_host_is_null(i8* %0, i8* %1) local_unnamed_addr #4 {
  %3 = tail call i8* @malloc(i64 1024) #12
  %4 = icmp eq i8* %3, null
  br i1 %4, label %.split, label %.split2

.split:                                           ; preds = %2
  %5 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([21 x i8], [21 x i8]* @.str.43, i64 0, i64 0)) #12
  br label %8

.split2:                                          ; preds = %2
  %6 = getelementptr inbounds i8, i8* %3, i64 1023
  store i8 0, i8* %6, align 1, !tbaa !14
  %7 = tail call i8* @halide_string_to_string(i8* nonnull %3, i8* nonnull %6, i8* nonnull getelementptr inbounds ([21 x i8], [21 x i8]* @.str.43, i64 0, i64 0)) #12
  br label %8

8:                                                ; preds = %.split2, %.split
  %phi.call = phi i8* [ %5, %.split ], [ %7, %.split2 ]
  %9 = phi i8* [ null, %.split ], [ %6, %.split2 ]
  %10 = icmp eq i8* %1, null
  br i1 %10, label %11, label %13

11:                                               ; preds = %8
  %12 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %9, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.30.166, i64 0, i64 0)) #12
  br label %15

13:                                               ; preds = %8
  %14 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %9, i8* nonnull %1) #12
  br label %15

15:                                               ; preds = %13, %11
  %16 = phi i8* [ %14, %13 ], [ %12, %11 ]
  %17 = tail call i8* @halide_string_to_string(i8* %16, i8* %9, i8* nonnull getelementptr inbounds ([55 x i8], [55 x i8]* @.str.49, i64 0, i64 0)) #12
  br i1 %4, label %18, label %19

18:                                               ; preds = %15
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.29.165, i64 0, i64 0)) #12
  br label %25

19:                                               ; preds = %15
  %20 = ptrtoint i8* %17 to i64
  %21 = ptrtoint i8* %3 to i64
  %22 = sub i64 1, %21
  %23 = add i64 %22, %20
  %24 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %3, i64 %23) #12
  tail call void @halide_error(i8* %0, i8* nonnull %3) #12
  br label %25

25:                                               ; preds = %19, %18
  tail call void @free(i8* %3) #12
  ret i32 -34
}

; Function Attrs: nounwind
define weak i32 @halide_error_bad_fold(i8* %0, i8* %1, i8* %2, i8* %3) local_unnamed_addr #4 {
  %5 = tail call i8* @malloc(i64 1024) #12
  %6 = icmp eq i8* %5, null
  br i1 %6, label %.split, label %.split2

.split:                                           ; preds = %4
  %7 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([30 x i8], [30 x i8]* @.str.50, i64 0, i64 0)) #12
  br label %10

.split2:                                          ; preds = %4
  %8 = getelementptr inbounds i8, i8* %5, i64 1023
  store i8 0, i8* %8, align 1, !tbaa !14
  %9 = tail call i8* @halide_string_to_string(i8* nonnull %5, i8* nonnull %8, i8* nonnull getelementptr inbounds ([30 x i8], [30 x i8]* @.str.50, i64 0, i64 0)) #12
  br label %10

10:                                               ; preds = %.split2, %.split
  %phi.call = phi i8* [ %7, %.split ], [ %9, %.split2 ]
  %11 = phi i8* [ null, %.split ], [ %8, %.split2 ]
  %12 = icmp eq i8* %2, null
  br i1 %12, label %13, label %15

13:                                               ; preds = %10
  %14 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.30.166, i64 0, i64 0)) #12
  br label %17

15:                                               ; preds = %10
  %16 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* nonnull %2) #12
  br label %17

17:                                               ; preds = %15, %13
  %18 = phi i8* [ %16, %15 ], [ %14, %13 ]
  %19 = tail call i8* @halide_string_to_string(i8* %18, i8* %11, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.51, i64 0, i64 0)) #12
  %20 = icmp eq i8* %1, null
  br i1 %20, label %21, label %23

21:                                               ; preds = %17
  %22 = tail call i8* @halide_string_to_string(i8* %19, i8* %11, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.30.166, i64 0, i64 0)) #12
  br label %25

23:                                               ; preds = %17
  %24 = tail call i8* @halide_string_to_string(i8* %19, i8* %11, i8* nonnull %1) #12
  br label %25

25:                                               ; preds = %23, %21
  %26 = phi i8* [ %24, %23 ], [ %22, %21 ]
  %27 = tail call i8* @halide_string_to_string(i8* %26, i8* %11, i8* nonnull getelementptr inbounds ([36 x i8], [36 x i8]* @.str.52, i64 0, i64 0)) #12
  %28 = icmp eq i8* %3, null
  br i1 %28, label %29, label %31

29:                                               ; preds = %25
  %30 = tail call i8* @halide_string_to_string(i8* %27, i8* %11, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.30.166, i64 0, i64 0)) #12
  br label %33

31:                                               ; preds = %25
  %32 = tail call i8* @halide_string_to_string(i8* %27, i8* %11, i8* nonnull %3) #12
  br label %33

33:                                               ; preds = %31, %29
  %34 = phi i8* [ %32, %31 ], [ %30, %29 ]
  %35 = tail call i8* @halide_string_to_string(i8* %34, i8* %11, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30.142, i64 0, i64 0)) #12
  br i1 %6, label %36, label %37

36:                                               ; preds = %33
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.29.165, i64 0, i64 0)) #12
  br label %43

37:                                               ; preds = %33
  %38 = ptrtoint i8* %35 to i64
  %39 = ptrtoint i8* %5 to i64
  %40 = sub i64 1, %39
  %41 = add i64 %40, %38
  %42 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %5, i64 %41) #12
  tail call void @halide_error(i8* %0, i8* nonnull %5) #12
  br label %43

43:                                               ; preds = %37, %36
  tail call void @free(i8* %5) #12
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
  %14 = tail call i8* @malloc(i64 1024) #12
  %15 = icmp eq i8* %14, null
  br i1 %15, label %.split, label %.split2

.split:                                           ; preds = %13
  %16 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([23 x i8], [23 x i8]* @.str.53, i64 0, i64 0)) #12
  br label %19

.split2:                                          ; preds = %13
  %17 = getelementptr inbounds i8, i8* %14, i64 1023
  store i8 0, i8* %17, align 1, !tbaa !14
  %18 = tail call i8* @halide_string_to_string(i8* nonnull %14, i8* nonnull %17, i8* nonnull getelementptr inbounds ([23 x i8], [23 x i8]* @.str.53, i64 0, i64 0)) #12
  br label %19

19:                                               ; preds = %.split2, %.split
  %phi.call = phi i8* [ %16, %.split ], [ %18, %.split2 ]
  %20 = phi i8* [ null, %.split ], [ %17, %.split2 ]
  %21 = sext i32 %2 to i64
  %22 = tail call i8* @halide_int64_to_string(i8* %phi.call, i8* %20, i64 %21, i32 1) #12
  %23 = tail call i8* @halide_string_to_string(i8* %22, i8* %20, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.51, i64 0, i64 0)) #12
  %24 = icmp eq i8* %1, null
  br i1 %24, label %25, label %27

25:                                               ; preds = %19
  %26 = tail call i8* @halide_string_to_string(i8* %23, i8* %20, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.30.166, i64 0, i64 0)) #12
  br label %29

27:                                               ; preds = %19
  %28 = tail call i8* @halide_string_to_string(i8* %23, i8* %20, i8* nonnull %1) #12
  br label %29

29:                                               ; preds = %27, %25
  %30 = phi i8* [ %28, %27 ], [ %26, %25 ]
  %31 = tail call i8* @halide_string_to_string(i8* %30, i8* %20, i8* nonnull getelementptr inbounds ([36 x i8], [36 x i8]* @.str.54, i64 0, i64 0)) #12
  %32 = sext i32 %3 to i64
  %33 = tail call i8* @halide_int64_to_string(i8* %31, i8* %20, i64 %32, i32 1) #12
  %34 = tail call i8* @halide_string_to_string(i8* %33, i8* %20, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i64 0, i64 0)) #12
  %35 = add nsw i32 %4, %3
  %36 = add nsw i32 %35, -1
  %37 = sext i32 %36 to i64
  %38 = tail call i8* @halide_int64_to_string(i8* %34, i8* %20, i64 %37, i32 1) #12
  %39 = tail call i8* @halide_string_to_string(i8* %38, i8* %20, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.56, i64 0, i64 0)) #12
  %40 = tail call i8* @halide_string_to_string(i8* %39, i8* %20, i8* nonnull getelementptr inbounds ([47 x i8], [47 x i8]* @.str.57.150, i64 0, i64 0)) #12
  %41 = sext i32 %5 to i64
  %42 = tail call i8* @halide_int64_to_string(i8* %40, i8* %20, i64 %41, i32 1) #12
  %43 = tail call i8* @halide_string_to_string(i8* %42, i8* %20, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i64 0, i64 0)) #12
  %44 = add nsw i32 %6, %5
  %45 = add nsw i32 %44, -1
  %46 = sext i32 %45 to i64
  %47 = tail call i8* @halide_int64_to_string(i8* %43, i8* %20, i64 %46, i32 1) #12
  %48 = tail call i8* @halide_string_to_string(i8* %47, i8* %20, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.58.151, i64 0, i64 0)) #12
  br i1 %15, label %49, label %50

49:                                               ; preds = %29
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.29.165, i64 0, i64 0)) #12
  br label %94

50:                                               ; preds = %29
  %51 = ptrtoint i8* %48 to i64
  %52 = ptrtoint i8* %14 to i64
  %53 = sub i64 1, %52
  %54 = add i64 %53, %51
  %55 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %14, i64 %54) #12
  tail call void @halide_error(i8* %0, i8* nonnull %14) #12
  br label %94

56:                                               ; preds = %9
  %57 = tail call i8* @malloc(i64 1024) #12
  %58 = icmp eq i8* %57, null
  br i1 %58, label %.split3, label %.split5

.split3:                                          ; preds = %56
  %59 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([23 x i8], [23 x i8]* @.str.53, i64 0, i64 0)) #12
  br label %62

.split5:                                          ; preds = %56
  %60 = getelementptr inbounds i8, i8* %57, i64 1023
  store i8 0, i8* %60, align 1, !tbaa !14
  %61 = tail call i8* @halide_string_to_string(i8* nonnull %57, i8* nonnull %60, i8* nonnull getelementptr inbounds ([23 x i8], [23 x i8]* @.str.53, i64 0, i64 0)) #12
  br label %62

62:                                               ; preds = %.split5, %.split3
  %phi.call6 = phi i8* [ %59, %.split3 ], [ %61, %.split5 ]
  %63 = phi i8* [ null, %.split3 ], [ %60, %.split5 ]
  %64 = sext i32 %2 to i64
  %65 = tail call i8* @halide_int64_to_string(i8* %phi.call6, i8* %63, i64 %64, i32 1) #12
  %66 = tail call i8* @halide_string_to_string(i8* %65, i8* %63, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.51, i64 0, i64 0)) #12
  %67 = icmp eq i8* %1, null
  br i1 %67, label %68, label %70

68:                                               ; preds = %62
  %69 = tail call i8* @halide_string_to_string(i8* %66, i8* %63, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.30.166, i64 0, i64 0)) #12
  br label %72

70:                                               ; preds = %62
  %71 = tail call i8* @halide_string_to_string(i8* %66, i8* %63, i8* nonnull %1) #12
  br label %72

72:                                               ; preds = %70, %68
  %73 = phi i8* [ %71, %70 ], [ %69, %68 ]
  %74 = tail call i8* @halide_string_to_string(i8* %73, i8* %63, i8* nonnull getelementptr inbounds ([36 x i8], [36 x i8]* @.str.54, i64 0, i64 0)) #12
  %75 = sext i32 %3 to i64
  %76 = tail call i8* @halide_int64_to_string(i8* %74, i8* %63, i64 %75, i32 1) #12
  %77 = tail call i8* @halide_string_to_string(i8* %76, i8* %63, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i64 0, i64 0)) #12
  %78 = add nsw i32 %10, -1
  %79 = sext i32 %78 to i64
  %80 = tail call i8* @halide_int64_to_string(i8* %77, i8* %63, i64 %79, i32 1) #12
  %81 = tail call i8* @halide_string_to_string(i8* %80, i8* %63, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.56, i64 0, i64 0)) #12
  %82 = tail call i8* @halide_string_to_string(i8* %81, i8* %63, i8* nonnull getelementptr inbounds ([47 x i8], [47 x i8]* @.str.59.152, i64 0, i64 0)) #12
  %83 = tail call i8* @halide_string_to_string(i8* %82, i8* %63, i8* nonnull getelementptr inbounds ([30 x i8], [30 x i8]* @.str.60.153, i64 0, i64 0)) #12
  %84 = sext i32 %6 to i64
  %85 = tail call i8* @halide_int64_to_string(i8* %83, i8* %63, i64 %84, i32 1) #12
  %86 = tail call i8* @halide_string_to_string(i8* %85, i8* %63, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30.142, i64 0, i64 0)) #12
  br i1 %58, label %87, label %88

87:                                               ; preds = %72
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.29.165, i64 0, i64 0)) #12
  br label %94

88:                                               ; preds = %72
  %89 = ptrtoint i8* %86 to i64
  %90 = ptrtoint i8* %57 to i64
  %91 = sub i64 1, %90
  %92 = add i64 %91, %89
  %93 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %57, i64 %92) #12
  tail call void @halide_error(i8* %0, i8* nonnull %57) #12
  br label %94

94:                                               ; preds = %88, %87, %50, %49
  %95 = phi i8* [ null, %49 ], [ %14, %50 ], [ null, %87 ], [ %57, %88 ]
  tail call void @free(i8* %95) #12
  ret i32 -35
}

; Function Attrs: nounwind
define weak i32 @halide_error_fold_factor_too_small(i8* %0, i8* %1, i8* %2, i32 %3, i8* %4, i32 %5) local_unnamed_addr #4 {
  %7 = tail call i8* @malloc(i64 1024) #12
  %8 = icmp eq i8* %7, null
  br i1 %8, label %.split, label %.split2

.split:                                           ; preds = %6
  %9 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([18 x i8], [18 x i8]* @.str.61.154, i64 0, i64 0)) #12
  br label %12

.split2:                                          ; preds = %6
  %10 = getelementptr inbounds i8, i8* %7, i64 1023
  store i8 0, i8* %10, align 1, !tbaa !14
  %11 = tail call i8* @halide_string_to_string(i8* nonnull %7, i8* nonnull %10, i8* nonnull getelementptr inbounds ([18 x i8], [18 x i8]* @.str.61.154, i64 0, i64 0)) #12
  br label %12

12:                                               ; preds = %.split2, %.split
  %phi.call = phi i8* [ %9, %.split ], [ %11, %.split2 ]
  %13 = phi i8* [ null, %.split ], [ %10, %.split2 ]
  %14 = sext i32 %3 to i64
  %15 = tail call i8* @halide_int64_to_string(i8* %phi.call, i8* %13, i64 %14, i32 1) #12
  %16 = tail call i8* @halide_string_to_string(i8* %15, i8* %13, i8* nonnull getelementptr inbounds ([16 x i8], [16 x i8]* @.str.62, i64 0, i64 0)) #12
  %17 = icmp eq i8* %2, null
  br i1 %17, label %18, label %20

18:                                               ; preds = %12
  %19 = tail call i8* @halide_string_to_string(i8* %16, i8* %13, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.30.166, i64 0, i64 0)) #12
  br label %22

20:                                               ; preds = %12
  %21 = tail call i8* @halide_string_to_string(i8* %16, i8* %13, i8* nonnull %2) #12
  br label %22

22:                                               ; preds = %20, %18
  %23 = phi i8* [ %21, %20 ], [ %19, %18 ]
  %24 = tail call i8* @halide_string_to_string(i8* %23, i8* %13, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.51, i64 0, i64 0)) #12
  %25 = icmp eq i8* %1, null
  br i1 %25, label %26, label %28

26:                                               ; preds = %22
  %27 = tail call i8* @halide_string_to_string(i8* %24, i8* %13, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.30.166, i64 0, i64 0)) #12
  br label %30

28:                                               ; preds = %22
  %29 = tail call i8* @halide_string_to_string(i8* %24, i8* %13, i8* nonnull %1) #12
  br label %30

30:                                               ; preds = %28, %26
  %31 = phi i8* [ %29, %28 ], [ %27, %26 ]
  %32 = tail call i8* @halide_string_to_string(i8* %31, i8* %13, i8* nonnull getelementptr inbounds ([61 x i8], [61 x i8]* @.str.63, i64 0, i64 0)) #12
  %33 = icmp eq i8* %4, null
  br i1 %33, label %34, label %36

34:                                               ; preds = %30
  %35 = tail call i8* @halide_string_to_string(i8* %32, i8* %13, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.30.166, i64 0, i64 0)) #12
  br label %38

36:                                               ; preds = %30
  %37 = tail call i8* @halide_string_to_string(i8* %32, i8* %13, i8* nonnull %4) #12
  br label %38

38:                                               ; preds = %36, %34
  %39 = phi i8* [ %37, %36 ], [ %35, %34 ]
  %40 = tail call i8* @halide_string_to_string(i8* %39, i8* %13, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.32.144, i64 0, i64 0)) #12
  %41 = sext i32 %5 to i64
  %42 = tail call i8* @halide_int64_to_string(i8* %40, i8* %13, i64 %41, i32 1) #12
  %43 = tail call i8* @halide_string_to_string(i8* %42, i8* %13, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.64.155, i64 0, i64 0)) #12
  br i1 %8, label %44, label %45

44:                                               ; preds = %38
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.29.165, i64 0, i64 0)) #12
  br label %51

45:                                               ; preds = %38
  %46 = ptrtoint i8* %43 to i64
  %47 = ptrtoint i8* %7 to i64
  %48 = sub i64 1, %47
  %49 = add i64 %48, %46
  %50 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %7, i64 %49) #12
  tail call void @halide_error(i8* %0, i8* nonnull %7) #12
  br label %51

51:                                               ; preds = %45, %44
  tail call void @free(i8* %7) #12
  ret i32 -26
}

; Function Attrs: nounwind
define weak i32 @halide_error_requirement_failed(i8* %0, i8* %1, i8* %2) local_unnamed_addr #4 {
  %4 = tail call i8* @malloc(i64 1024) #12
  %5 = icmp eq i8* %4, null
  br i1 %5, label %.split, label %.split2

.split:                                           ; preds = %3
  %6 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.65, i64 0, i64 0)) #12
  br label %9

.split2:                                          ; preds = %3
  %7 = getelementptr inbounds i8, i8* %4, i64 1023
  store i8 0, i8* %7, align 1, !tbaa !14
  %8 = tail call i8* @halide_string_to_string(i8* nonnull %4, i8* nonnull %7, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.65, i64 0, i64 0)) #12
  br label %9

9:                                                ; preds = %.split2, %.split
  %phi.call = phi i8* [ %6, %.split ], [ %8, %.split2 ]
  %10 = phi i8* [ null, %.split ], [ %7, %.split2 ]
  %11 = icmp eq i8* %1, null
  br i1 %11, label %12, label %14

12:                                               ; preds = %9
  %13 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %10, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.30.166, i64 0, i64 0)) #12
  br label %16

14:                                               ; preds = %9
  %15 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %10, i8* nonnull %1) #12
  br label %16

16:                                               ; preds = %14, %12
  %17 = phi i8* [ %15, %14 ], [ %13, %12 ]
  %18 = tail call i8* @halide_string_to_string(i8* %17, i8* %10, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.66, i64 0, i64 0)) #12
  %19 = icmp eq i8* %2, null
  br i1 %19, label %20, label %22

20:                                               ; preds = %16
  %21 = tail call i8* @halide_string_to_string(i8* %18, i8* %10, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.30.166, i64 0, i64 0)) #12
  br label %24

22:                                               ; preds = %16
  %23 = tail call i8* @halide_string_to_string(i8* %18, i8* %10, i8* nonnull %2) #12
  br label %24

24:                                               ; preds = %22, %20
  %25 = phi i8* [ %23, %22 ], [ %21, %20 ]
  br i1 %5, label %26, label %27

26:                                               ; preds = %24
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.29.165, i64 0, i64 0)) #12
  br label %33

27:                                               ; preds = %24
  %28 = ptrtoint i8* %25 to i64
  %29 = ptrtoint i8* %4 to i64
  %30 = sub i64 1, %29
  %31 = add i64 %30, %28
  %32 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %4, i64 %31) #12
  tail call void @halide_error(i8* %0, i8* nonnull %4) #12
  br label %33

33:                                               ; preds = %27, %26
  tail call void @free(i8* %4) #12
  ret i32 -27
}

; Function Attrs: nounwind
define weak i32 @halide_error_specialize_fail(i8* %0, i8* %1) local_unnamed_addr #4 {
  %3 = tail call i8* @malloc(i64 1024) #12
  %4 = icmp eq i8* %3, null
  br i1 %4, label %.split, label %.split2

.split:                                           ; preds = %2
  %5 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([59 x i8], [59 x i8]* @.str.67, i64 0, i64 0)) #12
  br label %8

.split2:                                          ; preds = %2
  %6 = getelementptr inbounds i8, i8* %3, i64 1023
  store i8 0, i8* %6, align 1, !tbaa !14
  %7 = tail call i8* @halide_string_to_string(i8* nonnull %3, i8* nonnull %6, i8* nonnull getelementptr inbounds ([59 x i8], [59 x i8]* @.str.67, i64 0, i64 0)) #12
  br label %8

8:                                                ; preds = %.split2, %.split
  %phi.call = phi i8* [ %5, %.split ], [ %7, %.split2 ]
  %9 = phi i8* [ null, %.split ], [ %6, %.split2 ]
  %10 = icmp eq i8* %1, null
  br i1 %10, label %11, label %13

11:                                               ; preds = %8
  %12 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %9, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.30.166, i64 0, i64 0)) #12
  br label %15

13:                                               ; preds = %8
  %14 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %9, i8* nonnull %1) #12
  br label %15

15:                                               ; preds = %13, %11
  %16 = phi i8* [ %14, %13 ], [ %12, %11 ]
  br i1 %4, label %17, label %18

17:                                               ; preds = %15
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.29.165, i64 0, i64 0)) #12
  br label %24

18:                                               ; preds = %15
  %19 = ptrtoint i8* %16 to i64
  %20 = ptrtoint i8* %3 to i64
  %21 = sub i64 1, %20
  %22 = add i64 %21, %19
  %23 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %3, i64 %22) #12
  tail call void @halide_error(i8* %0, i8* nonnull %3) #12
  br label %24

24:                                               ; preds = %18, %17
  tail call void @free(i8* %3) #12
  ret i32 -31
}

; Function Attrs: nounwind
define weak i32 @halide_error_no_device_interface(i8* %0) local_unnamed_addr #4 {
  %2 = tail call i8* @malloc(i64 1024) #12
  %3 = icmp eq i8* %2, null
  br i1 %3, label %4, label %6

4:                                                ; preds = %1
  %5 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([55 x i8], [55 x i8]* @.str.68, i64 0, i64 0)) #12
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.29.165, i64 0, i64 0)) #12
  br label %14

6:                                                ; preds = %1
  %7 = getelementptr inbounds i8, i8* %2, i64 1023
  store i8 0, i8* %7, align 1, !tbaa !14
  %8 = tail call i8* @halide_string_to_string(i8* nonnull %2, i8* nonnull %7, i8* nonnull getelementptr inbounds ([55 x i8], [55 x i8]* @.str.68, i64 0, i64 0)) #12
  %9 = ptrtoint i8* %8 to i64
  %10 = ptrtoint i8* %2 to i64
  %11 = sub i64 1, %10
  %12 = add i64 %11, %9
  %13 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %2, i64 %12) #12
  tail call void @halide_error(i8* %0, i8* nonnull %2) #12
  br label %14

14:                                               ; preds = %6, %4
  tail call void @free(i8* %2) #12
  ret i32 -19
}

; Function Attrs: nounwind
define weak i32 @halide_error_device_interface_no_device(i8* %0) local_unnamed_addr #4 {
  %2 = tail call i8* @malloc(i64 1024) #12
  %3 = icmp eq i8* %2, null
  br i1 %3, label %4, label %6

4:                                                ; preds = %1
  %5 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([57 x i8], [57 x i8]* @.str.69, i64 0, i64 0)) #12
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.29.165, i64 0, i64 0)) #12
  br label %14

6:                                                ; preds = %1
  %7 = getelementptr inbounds i8, i8* %2, i64 1023
  store i8 0, i8* %7, align 1, !tbaa !14
  %8 = tail call i8* @halide_string_to_string(i8* nonnull %2, i8* nonnull %7, i8* nonnull getelementptr inbounds ([57 x i8], [57 x i8]* @.str.69, i64 0, i64 0)) #12
  %9 = ptrtoint i8* %8 to i64
  %10 = ptrtoint i8* %2 to i64
  %11 = sub i64 1, %10
  %12 = add i64 %11, %9
  %13 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %2, i64 %12) #12
  tail call void @halide_error(i8* %0, i8* nonnull %2) #12
  br label %14

14:                                               ; preds = %6, %4
  tail call void @free(i8* %2) #12
  ret i32 -36
}

; Function Attrs: nounwind
define weak i32 @halide_error_host_and_device_dirty(i8* %0) local_unnamed_addr #4 {
  %2 = tail call i8* @malloc(i64 1024) #12
  %3 = icmp eq i8* %2, null
  br i1 %3, label %4, label %6

4:                                                ; preds = %1
  %5 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([49 x i8], [49 x i8]* @.str.70, i64 0, i64 0)) #12
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.29.165, i64 0, i64 0)) #12
  br label %14

6:                                                ; preds = %1
  %7 = getelementptr inbounds i8, i8* %2, i64 1023
  store i8 0, i8* %7, align 1, !tbaa !14
  %8 = tail call i8* @halide_string_to_string(i8* nonnull %2, i8* nonnull %7, i8* nonnull getelementptr inbounds ([49 x i8], [49 x i8]* @.str.70, i64 0, i64 0)) #12
  %9 = ptrtoint i8* %8 to i64
  %10 = ptrtoint i8* %2 to i64
  %11 = sub i64 1, %10
  %12 = add i64 %11, %9
  %13 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %2, i64 %12) #12
  tail call void @halide_error(i8* %0, i8* nonnull %2) #12
  br label %14

14:                                               ; preds = %6, %4
  tail call void @free(i8* %2) #12
  ret i32 -37
}

; Function Attrs: nounwind
define weak i32 @halide_error_buffer_is_null(i8* %0, i8* %1) local_unnamed_addr #4 {
  %3 = tail call i8* @malloc(i64 1024) #12
  %4 = icmp eq i8* %3, null
  br i1 %4, label %.split, label %.split2

.split:                                           ; preds = %2
  %5 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([26 x i8], [26 x i8]* @.str.71, i64 0, i64 0)) #12
  br label %8

.split2:                                          ; preds = %2
  %6 = getelementptr inbounds i8, i8* %3, i64 1023
  store i8 0, i8* %6, align 1, !tbaa !14
  %7 = tail call i8* @halide_string_to_string(i8* nonnull %3, i8* nonnull %6, i8* nonnull getelementptr inbounds ([26 x i8], [26 x i8]* @.str.71, i64 0, i64 0)) #12
  br label %8

8:                                                ; preds = %.split2, %.split
  %phi.call = phi i8* [ %5, %.split ], [ %7, %.split2 ]
  %9 = phi i8* [ null, %.split ], [ %6, %.split2 ]
  %10 = icmp eq i8* %1, null
  br i1 %10, label %11, label %13

11:                                               ; preds = %8
  %12 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %9, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.30.166, i64 0, i64 0)) #12
  br label %15

13:                                               ; preds = %8
  %14 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %9, i8* nonnull %1) #12
  br label %15

15:                                               ; preds = %13, %11
  %16 = phi i8* [ %14, %13 ], [ %12, %11 ]
  %17 = tail call i8* @halide_string_to_string(i8* %16, i8* %9, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.72, i64 0, i64 0)) #12
  br i1 %4, label %18, label %19

18:                                               ; preds = %15
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.29.165, i64 0, i64 0)) #12
  br label %25

19:                                               ; preds = %15
  %20 = ptrtoint i8* %17 to i64
  %21 = ptrtoint i8* %3 to i64
  %22 = sub i64 1, %21
  %23 = add i64 %22, %20
  %24 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %3, i64 %23) #12
  tail call void @halide_error(i8* %0, i8* nonnull %3) #12
  br label %25

25:                                               ; preds = %19, %18
  tail call void @free(i8* %3) #12
  ret i32 -38
}

; Function Attrs: nounwind mustprogress
define weak void @halide_profiler_shutdown() #0 {
  %1 = tail call %struct.halide_profiler_state* @halide_profiler_get_state() #13
  %2 = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %1, i64 0, i32 7
  %3 = load %struct.halide_thread*, %struct.halide_thread** %2, align 8, !tbaa !313
  %4 = icmp eq %struct.halide_thread* %3, null
  br i1 %4, label %7, label %5

5:                                                ; preds = %0
  %6 = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %1, i64 0, i32 3
  store i32 -2, i32* %6, align 8, !tbaa !315
  tail call void @halide_join_thread(%struct.halide_thread* nonnull %3) #12
  store %struct.halide_thread* null, %struct.halide_thread** %2, align 8, !tbaa !313
  store i32 -1, i32* %6, align 8, !tbaa !315
  tail call void @halide_profiler_report_unlocked(i8* null, %struct.halide_profiler_state* nonnull %1) #13
  tail call void @halide_profiler_reset_unlocked(%struct.halide_profiler_state* nonnull %1) #13
  br label %7

7:                                                ; preds = %5, %0
  ret void
}

; Function Attrs: nounwind willreturn mustprogress
define weak %struct.halide_profiler_state* @halide_profiler_get_state() local_unnamed_addr #2 {
  ret %struct.halide_profiler_state* @_ZZ25halide_profiler_get_stateE1s
}

; Function Attrs: nounwind
define weak void @halide_profiler_report_unlocked(i8* %0, %struct.halide_profiler_state* %1) local_unnamed_addr #4 {
  %3 = alloca [1024 x i8], align 1
  %4 = alloca %"class.Halide::Runtime::Internal::(anonymous namespace)::Printer.0", align 8
  %5 = getelementptr inbounds [1024 x i8], [1024 x i8]* %3, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 1024, i8* nonnull %5) #10
  %6 = bitcast %"class.Halide::Runtime::Internal::(anonymous namespace)::Printer.0"* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %6) #10
  %7 = getelementptr inbounds %"class.Halide::Runtime::Internal::(anonymous namespace)::Printer.0", %"class.Halide::Runtime::Internal::(anonymous namespace)::Printer.0"* %4, i64 0, i32 3
  store i8* %0, i8** %7, align 8, !tbaa !316
  %8 = getelementptr inbounds %"class.Halide::Runtime::Internal::(anonymous namespace)::Printer.0", %"class.Halide::Runtime::Internal::(anonymous namespace)::Printer.0"* %4, i64 0, i32 4
  store i8 0, i8* %8, align 8, !tbaa !318
  %9 = getelementptr inbounds %"class.Halide::Runtime::Internal::(anonymous namespace)::Printer.0", %"class.Halide::Runtime::Internal::(anonymous namespace)::Printer.0"* %4, i64 0, i32 0
  store i8* %5, i8** %9, align 8
  %10 = getelementptr inbounds %"class.Halide::Runtime::Internal::(anonymous namespace)::Printer.0", %"class.Halide::Runtime::Internal::(anonymous namespace)::Printer.0"* %4, i64 0, i32 1
  store i8* %5, i8** %10, align 8, !tbaa !319
  %11 = getelementptr inbounds [1024 x i8], [1024 x i8]* %3, i64 0, i64 1023
  %12 = getelementptr inbounds %"class.Halide::Runtime::Internal::(anonymous namespace)::Printer.0", %"class.Halide::Runtime::Internal::(anonymous namespace)::Printer.0"* %4, i64 0, i32 2
  store i8* %11, i8** %12, align 8, !tbaa !320
  store i8 0, i8* %11, align 1, !tbaa !14
  %13 = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %1, i64 0, i32 5
  %14 = load %struct.halide_profiler_pipeline_stats*, %struct.halide_profiler_pipeline_stats** %13, align 8, !tbaa !10
  %15 = icmp eq %struct.halide_profiler_pipeline_stats* %14, null
  br i1 %15, label %21, label %.preheader34

16:                                               ; preds = %.loopexit31
  %17 = load i8*, i8** %9, align 8, !tbaa !321
  %18 = icmp eq i8* %17, null
  br i1 %18, label %19, label %._crit_edge

._crit_edge:                                      ; preds = %16
  %.pre46 = load i8*, i8** %10, align 8, !tbaa !319
  %.pre47 = load i8*, i8** %7, align 8, !tbaa !316
  br label %21

19:                                               ; preds = %16
  %20 = load i8*, i8** %7, align 8, !tbaa !316
  call void @halide_error(i8* %20, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.29.165, i64 0, i64 0)) #12
  br label %30

21:                                               ; preds = %._crit_edge, %2
  %22 = phi i8* [ %.pre47, %._crit_edge ], [ %0, %2 ]
  %23 = phi i8* [ %.pre46, %._crit_edge ], [ %5, %2 ]
  %24 = phi i8* [ %17, %._crit_edge ], [ %5, %2 ]
  %25 = ptrtoint i8* %23 to i64
  %26 = ptrtoint i8* %24 to i64
  %27 = sub i64 1, %26
  %28 = add i64 %27, %25
  %29 = call i32 @halide_msan_annotate_memory_is_initialized(i8* %22, i8* nonnull %24, i64 %28) #12
  br label %30

30:                                               ; preds = %21, %19
  %31 = load i8, i8* %8, align 8, !tbaa !318, !range !17
  %32 = icmp eq i8 %31, 0
  br i1 %32, label %38, label %33

33:                                               ; preds = %30
  %34 = load i8*, i8** %9, align 8, !tbaa !321
  %35 = getelementptr inbounds %"class.Halide::Runtime::Internal::(anonymous namespace)::Printer.0", %"class.Halide::Runtime::Internal::(anonymous namespace)::Printer.0"* %4, i64 0, i32 5, i64 0
  %36 = icmp eq i8* %34, %35
  br i1 %36, label %38, label %37

37:                                               ; preds = %33
  call void @free(i8* %34) #12
  br label %38

38:                                               ; preds = %37, %33, %30
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %6) #10
  call void @llvm.lifetime.end.p0i8(i64 1024, i8* nonnull %5) #10
  ret void

.preheader34:                                     ; preds = %.loopexit31, %2
  %39 = phi %struct.halide_profiler_pipeline_stats* [ %409, %.loopexit31 ], [ %14, %2 ]
  %40 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %39, i64 0, i32 0
  %41 = load i64, i64* %40, align 8, !tbaa !322
  %42 = uitofp i64 %41 to float
  %43 = fdiv float %42, 1.000000e+06
  %44 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %39, i64 0, i32 11
  %45 = load i32, i32* %44, align 8, !tbaa !324
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %.loopexit31, label %47

47:                                               ; preds = %.preheader34
  %48 = load i8*, i8** %9, align 8, !tbaa !321
  store i8* %48, i8** %10, align 8, !tbaa !319
  %49 = icmp eq i8* %48, null
  br i1 %49, label %51, label %50

50:                                               ; preds = %47
  store i8 0, i8* %48, align 1, !tbaa !14
  %.pre = load i8*, i8** %10, align 8, !tbaa !319
  br label %51

51:                                               ; preds = %50, %47
  %52 = phi i8* [ %.pre, %50 ], [ null, %47 ]
  %53 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %39, i64 0, i32 4
  %54 = load i64, i64* %53, align 8, !tbaa !325
  %55 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %39, i64 0, i32 5
  %56 = load i64, i64* %55, align 8, !tbaa !326
  %57 = icmp eq i64 %54, %56
  %58 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %39, i64 0, i32 6
  %59 = load i8*, i8** %58, align 8, !tbaa !327
  %60 = icmp eq i8* %59, null
  %61 = load i8*, i8** %12, align 8, !tbaa !320
  br i1 %60, label %62, label %64

62:                                               ; preds = %51
  %63 = call i8* @halide_string_to_string(i8* %52, i8* %61, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.30.166, i64 0, i64 0)) #12
  br label %66

64:                                               ; preds = %51
  %65 = call i8* @halide_string_to_string(i8* %52, i8* %61, i8* nonnull %59) #12
  br label %66

66:                                               ; preds = %64, %62
  %67 = phi i8* [ %65, %64 ], [ %63, %62 ]
  store i8* %67, i8** %10, align 8, !tbaa !319
  %68 = load i8*, i8** %12, align 8, !tbaa !320
  %69 = call i8* @halide_string_to_string(i8* %67, i8* %68, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7.167, i64 0, i64 0)) #12
  store i8* %69, i8** %10, align 8, !tbaa !319
  %70 = load i8*, i8** %12, align 8, !tbaa !320
  %71 = call i8* @halide_string_to_string(i8* %69, i8* %70, i8* nonnull getelementptr inbounds ([14 x i8], [14 x i8]* @.str.8.168, i64 0, i64 0)) #12
  store i8* %71, i8** %10, align 8, !tbaa !319
  %72 = load i8*, i8** %12, align 8, !tbaa !320
  %73 = fpext float %43 to double
  %74 = call i8* @halide_double_to_string(i8* %71, i8* %72, double %73, i32 0) #12
  store i8* %74, i8** %10, align 8, !tbaa !319
  %75 = load i8*, i8** %12, align 8, !tbaa !320
  %76 = call i8* @halide_string_to_string(i8* %74, i8* %75, i8* nonnull getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9.169, i64 0, i64 0)) #12
  store i8* %76, i8** %10, align 8, !tbaa !319
  %77 = load i8*, i8** %12, align 8, !tbaa !320
  %78 = call i8* @halide_string_to_string(i8* %76, i8* %77, i8* nonnull getelementptr inbounds ([12 x i8], [12 x i8]* @.str.10.170, i64 0, i64 0)) #12
  store i8* %78, i8** %10, align 8, !tbaa !319
  %79 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %39, i64 0, i32 12
  %80 = load i32, i32* %79, align 4, !tbaa !328
  %81 = load i8*, i8** %12, align 8, !tbaa !320
  %82 = sext i32 %80 to i64
  %83 = call i8* @halide_int64_to_string(i8* %78, i8* %81, i64 %82, i32 1) #12
  store i8* %83, i8** %10, align 8, !tbaa !319
  %84 = load i8*, i8** %12, align 8, !tbaa !320
  %85 = call i8* @halide_string_to_string(i8* %83, i8* %84, i8* nonnull getelementptr inbounds ([9 x i8], [9 x i8]* @.str.11.171, i64 0, i64 0)) #12
  store i8* %85, i8** %10, align 8, !tbaa !319
  %86 = load i32, i32* %44, align 8, !tbaa !324
  %87 = load i8*, i8** %12, align 8, !tbaa !320
  %88 = sext i32 %86 to i64
  %89 = call i8* @halide_int64_to_string(i8* %85, i8* %87, i64 %88, i32 1) #12
  store i8* %89, i8** %10, align 8, !tbaa !319
  %90 = load i8*, i8** %12, align 8, !tbaa !320
  %91 = call i8* @halide_string_to_string(i8* %89, i8* %90, i8* nonnull getelementptr inbounds ([13 x i8], [13 x i8]* @.str.12.172, i64 0, i64 0)) #12
  store i8* %91, i8** %10, align 8, !tbaa !319
  %92 = load i32, i32* %44, align 8, !tbaa !324
  %93 = sitofp i32 %92 to float
  %94 = fdiv float %43, %93
  %95 = load i8*, i8** %12, align 8, !tbaa !320
  %96 = fpext float %94 to double
  %97 = call i8* @halide_double_to_string(i8* %91, i8* %95, double %96, i32 0) #12
  store i8* %97, i8** %10, align 8, !tbaa !319
  %98 = load i8*, i8** %12, align 8, !tbaa !320
  %99 = call i8* @halide_string_to_string(i8* %97, i8* %98, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.13.173, i64 0, i64 0)) #12
  store i8* %99, i8** %10, align 8, !tbaa !319
  br i1 %57, label %113, label %100

100:                                              ; preds = %66
  %101 = uitofp i64 %54 to double
  %102 = uitofp i64 %56 to double
  %103 = fadd double %102, 1.000000e-10
  %104 = fdiv double %101, %103
  %105 = fptrunc double %104 to float
  %106 = load i8*, i8** %12, align 8, !tbaa !320
  %107 = call i8* @halide_string_to_string(i8* %99, i8* %106, i8* nonnull getelementptr inbounds ([24 x i8], [24 x i8]* @.str.14.174, i64 0, i64 0)) #12
  store i8* %107, i8** %10, align 8, !tbaa !319
  %108 = load i8*, i8** %12, align 8, !tbaa !320
  %109 = fpext float %105 to double
  %110 = call i8* @halide_double_to_string(i8* %107, i8* %108, double %109, i32 0) #12
  store i8* %110, i8** %10, align 8, !tbaa !319
  %111 = load i8*, i8** %12, align 8, !tbaa !320
  %112 = call i8* @halide_string_to_string(i8* %110, i8* %111, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7.167, i64 0, i64 0)) #12
  store i8* %112, i8** %10, align 8, !tbaa !319
  br label %113

113:                                              ; preds = %100, %66
  %114 = phi i8* [ %112, %100 ], [ %99, %66 ]
  %115 = load i8*, i8** %12, align 8, !tbaa !320
  %116 = call i8* @halide_string_to_string(i8* %114, i8* %115, i8* nonnull getelementptr inbounds ([20 x i8], [20 x i8]* @.str.15.175, i64 0, i64 0)) #12
  store i8* %116, i8** %10, align 8, !tbaa !319
  %117 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %39, i64 0, i32 13
  %118 = load i32, i32* %117, align 8, !tbaa !329
  %119 = load i8*, i8** %12, align 8, !tbaa !320
  %120 = sext i32 %118 to i64
  %121 = call i8* @halide_int64_to_string(i8* %116, i8* %119, i64 %120, i32 1) #12
  store i8* %121, i8** %10, align 8, !tbaa !319
  %122 = load i8*, i8** %12, align 8, !tbaa !320
  %123 = call i8* @halide_string_to_string(i8* %121, i8* %122, i8* nonnull getelementptr inbounds ([20 x i8], [20 x i8]* @.str.16.176, i64 0, i64 0)) #12
  store i8* %123, i8** %10, align 8, !tbaa !319
  %124 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %39, i64 0, i32 2
  %125 = load i64, i64* %124, align 8, !tbaa !330
  %126 = load i8*, i8** %12, align 8, !tbaa !320
  %127 = call i8* @halide_uint64_to_string(i8* %123, i8* %126, i64 %125, i32 1) #12
  store i8* %127, i8** %10, align 8, !tbaa !319
  %128 = load i8*, i8** %12, align 8, !tbaa !320
  %129 = call i8* @halide_string_to_string(i8* %127, i8* %128, i8* nonnull getelementptr inbounds ([8 x i8], [8 x i8]* @.str.17.177, i64 0, i64 0)) #12
  store i8* %129, i8** %10, align 8, !tbaa !319
  %130 = load i8*, i8** %9, align 8, !tbaa !321
  %131 = icmp eq i8* %130, null
  br i1 %131, label %140, label %132

132:                                              ; preds = %113
  %133 = load i8*, i8** %7, align 8, !tbaa !316
  %134 = ptrtoint i8* %129 to i64
  %135 = ptrtoint i8* %130 to i64
  %136 = add i64 %134, 1
  %137 = sub i64 %136, %135
  %138 = call i32 @halide_msan_annotate_memory_is_initialized(i8* %133, i8* nonnull %130, i64 %137) #12
  %139 = load i8*, i8** %9, align 8, !tbaa !321
  br label %140

140:                                              ; preds = %132, %113
  %141 = phi i8* [ %139, %132 ], [ getelementptr inbounds ([35 x i8], [35 x i8]* @.str.29.165, i64 0, i64 0), %113 ]
  call void @halide_print(i8* %0, i8* %141) #12
  %142 = load i64, i64* %40, align 8, !tbaa !322
  %143 = icmp eq i64 %142, 0
  br i1 %143, label %144, label %.loopexit32

144:                                              ; preds = %140
  %145 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %39, i64 0, i32 3
  %146 = load i64, i64* %145, align 8, !tbaa !331
  %147 = icmp eq i64 %146, 0
  br i1 %147, label %148, label %.loopexit32

148:                                              ; preds = %144
  %149 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %39, i64 0, i32 9
  %150 = load i32, i32* %149, align 8, !tbaa !332
  %151 = icmp sgt i32 %150, 0
  br i1 %151, label %152, label %.loopexit31

152:                                              ; preds = %148
  %153 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %39, i64 0, i32 7
  %154 = load %struct.halide_profiler_func_stats*, %struct.halide_profiler_func_stats** %153, align 8, !tbaa !333
  %155 = zext i32 %150 to i64
  br label %157

156:                                              ; preds = %157
  %exitcond.not = icmp eq i64 %162, %155
  br i1 %exitcond.not, label %.loopexit31, label %157, !llvm.loop !334

157:                                              ; preds = %156, %152
  %158 = phi i64 [ 0, %152 ], [ %162, %156 ]
  %159 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %154, i64 %158, i32 4
  %160 = load i64, i64* %159, align 8, !tbaa !335
  %161 = icmp eq i64 %160, 0
  %162 = add nuw nsw i64 %158, 1
  br i1 %161, label %156, label %.loopexit32

.loopexit32:                                      ; preds = %157, %144, %140
  %163 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %39, i64 0, i32 9
  %164 = load i32, i32* %163, align 8, !tbaa !332
  %165 = icmp sgt i32 %164, 0
  br i1 %165, label %166, label %.loopexit31

166:                                              ; preds = %.loopexit32
  %167 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %39, i64 0, i32 7
  br label %168

168:                                              ; preds = %402, %166
  %169 = phi i64 [ 0, %166 ], [ %403, %402 ]
  %170 = load i8*, i8** %9, align 8, !tbaa !321
  store i8* %170, i8** %10, align 8, !tbaa !319
  %171 = icmp eq i8* %170, null
  br i1 %171, label %173, label %172

172:                                              ; preds = %168
  store i8 0, i8* %170, align 1, !tbaa !14
  br label %173

173:                                              ; preds = %172, %168
  %174 = load %struct.halide_profiler_func_stats*, %struct.halide_profiler_func_stats** %167, align 8, !tbaa !333
  %175 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %174, i64 %169
  %176 = icmp eq i64 %169, 0
  br i1 %176, label %177, label %181

177:                                              ; preds = %173
  %178 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %175, i64 0, i32 0
  %179 = load i64, i64* %178, align 8, !tbaa !337
  %180 = icmp eq i64 %179, 0
  br i1 %180, label %402, label %181

181:                                              ; preds = %177, %173
  %182 = load i8*, i8** %10, align 8, !tbaa !319
  %183 = load i8*, i8** %12, align 8, !tbaa !320
  %184 = call i8* @halide_string_to_string(i8* %182, i8* %183, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.18.178, i64 0, i64 0)) #12
  store i8* %184, i8** %10, align 8, !tbaa !319
  %185 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %174, i64 %169, i32 7
  %186 = load i8*, i8** %185, align 8, !tbaa !338
  %187 = icmp eq i8* %186, null
  %188 = load i8*, i8** %12, align 8, !tbaa !320
  br i1 %187, label %189, label %191

189:                                              ; preds = %181
  %190 = call i8* @halide_string_to_string(i8* %184, i8* %188, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.30.166, i64 0, i64 0)) #12
  br label %193

191:                                              ; preds = %181
  %192 = call i8* @halide_string_to_string(i8* %184, i8* %188, i8* nonnull %186) #12
  br label %193

193:                                              ; preds = %191, %189
  %194 = phi i8* [ %192, %191 ], [ %190, %189 ]
  store i8* %194, i8** %10, align 8, !tbaa !319
  %195 = load i8*, i8** %12, align 8, !tbaa !320
  %196 = call i8* @halide_string_to_string(i8* %194, i8* %195, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.19.179, i64 0, i64 0)) #12
  store i8* %196, i8** %10, align 8, !tbaa !319
  %197 = load i8*, i8** %9, align 8, !tbaa !321
  %198 = ptrtoint i8* %196 to i64
  %199 = ptrtoint i8* %197 to i64
  %200 = sub i64 %198, %199
  %201 = icmp ult i64 %200, 25
  br i1 %201, label %.preheader29, label %.loopexit30

.preheader29:                                     ; preds = %.preheader29, %193
  %202 = phi i8* [ %204, %.preheader29 ], [ %196, %193 ]
  %203 = load i8*, i8** %12, align 8, !tbaa !320
  %204 = call i8* @halide_string_to_string(i8* %202, i8* %203, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.20.180, i64 0, i64 0)) #12
  store i8* %204, i8** %10, align 8, !tbaa !319
  %205 = load i8*, i8** %9, align 8, !tbaa !321
  %206 = ptrtoint i8* %204 to i64
  %207 = ptrtoint i8* %205 to i64
  %208 = sub i64 %206, %207
  %209 = icmp ult i64 %208, 25
  br i1 %209, label %.preheader29, label %.loopexit30, !llvm.loop !339

.loopexit30:                                      ; preds = %.preheader29, %193
  %210 = phi i8* [ %196, %193 ], [ %204, %.preheader29 ]
  %211 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %175, i64 0, i32 0
  %212 = load i64, i64* %211, align 8, !tbaa !337
  %213 = uitofp i64 %212 to float
  %214 = load i32, i32* %44, align 8, !tbaa !324
  %215 = sitofp i32 %214 to float
  %216 = fmul float %215, 1.000000e+06
  %217 = fdiv float %213, %216
  %218 = load i8*, i8** %12, align 8, !tbaa !320
  %219 = fpext float %217 to double
  %220 = call i8* @halide_double_to_string(i8* %210, i8* %218, double %219, i32 0) #12
  store i8* %220, i8** %10, align 8, !tbaa !319
  %221 = icmp eq i8* %220, null
  br i1 %221, label %228, label %222

222:                                              ; preds = %.loopexit30
  %223 = getelementptr inbounds i8, i8* %220, i64 -3
  %224 = load i8*, i8** %9, align 8, !tbaa !321
  %225 = icmp ult i8* %223, %224
  %226 = select i1 %225, i8* %224, i8* %223
  store i8* %226, i8** %10, align 8
  store i8 0, i8* %226, align 1, !tbaa !14
  %227 = load i8*, i8** %10, align 8, !tbaa !319
  br label %228

228:                                              ; preds = %222, %.loopexit30
  %229 = phi i8* [ null, %.loopexit30 ], [ %227, %222 ]
  %230 = load i8*, i8** %12, align 8, !tbaa !320
  %231 = call i8* @halide_string_to_string(i8* %229, i8* %230, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.21.181, i64 0, i64 0)) #12
  store i8* %231, i8** %10, align 8, !tbaa !319
  %232 = load i8*, i8** %9, align 8, !tbaa !321
  %233 = ptrtoint i8* %231 to i64
  %234 = ptrtoint i8* %232 to i64
  %235 = sub i64 %233, %234
  %236 = icmp ult i64 %235, 35
  br i1 %236, label %.preheader27, label %.loopexit28

.preheader27:                                     ; preds = %.preheader27, %228
  %237 = phi i8* [ %239, %.preheader27 ], [ %231, %228 ]
  %238 = load i8*, i8** %12, align 8, !tbaa !320
  %239 = call i8* @halide_string_to_string(i8* %237, i8* %238, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.20.180, i64 0, i64 0)) #12
  store i8* %239, i8** %10, align 8, !tbaa !319
  %240 = load i8*, i8** %9, align 8, !tbaa !321
  %241 = ptrtoint i8* %239 to i64
  %242 = ptrtoint i8* %240 to i64
  %243 = sub i64 %241, %242
  %244 = icmp ult i64 %243, 35
  br i1 %244, label %.preheader27, label %.loopexit28, !llvm.loop !340

.loopexit28:                                      ; preds = %.preheader27, %228
  %245 = phi i8* [ %231, %228 ], [ %239, %.preheader27 ]
  %246 = load i64, i64* %40, align 8, !tbaa !322
  %247 = icmp eq i64 %246, 0
  br i1 %247, label %252, label %248

248:                                              ; preds = %.loopexit28
  %249 = load i64, i64* %211, align 8, !tbaa !337
  %250 = mul i64 %249, 100
  %251 = udiv i64 %250, %246
  br label %252

252:                                              ; preds = %248, %.loopexit28
  %253 = phi i64 [ %251, %248 ], [ 0, %.loopexit28 ]
  %254 = load i8*, i8** %12, align 8, !tbaa !320
  %255 = call i8* @halide_string_to_string(i8* %245, i8* %254, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.22.182, i64 0, i64 0)) #12
  store i8* %255, i8** %10, align 8, !tbaa !319
  %256 = load i8*, i8** %12, align 8, !tbaa !320
  %257 = shl i64 %253, 32
  %258 = ashr exact i64 %257, 32
  %259 = call i8* @halide_int64_to_string(i8* %255, i8* %256, i64 %258, i32 1) #12
  store i8* %259, i8** %10, align 8, !tbaa !319
  %260 = load i8*, i8** %12, align 8, !tbaa !320
  %261 = call i8* @halide_string_to_string(i8* %259, i8* %260, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.23.183, i64 0, i64 0)) #12
  store i8* %261, i8** %10, align 8, !tbaa !319
  %262 = load i8*, i8** %9, align 8, !tbaa !321
  %263 = ptrtoint i8* %261 to i64
  %264 = ptrtoint i8* %262 to i64
  %265 = sub i64 %263, %264
  %266 = icmp ult i64 %265, 43
  br i1 %266, label %.preheader25, label %.loopexit26

.preheader25:                                     ; preds = %.preheader25, %252
  %267 = phi i8* [ %269, %.preheader25 ], [ %261, %252 ]
  %268 = load i8*, i8** %12, align 8, !tbaa !320
  %269 = call i8* @halide_string_to_string(i8* %267, i8* %268, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.20.180, i64 0, i64 0)) #12
  store i8* %269, i8** %10, align 8, !tbaa !319
  %270 = load i8*, i8** %9, align 8, !tbaa !321
  %271 = ptrtoint i8* %269 to i64
  %272 = ptrtoint i8* %270 to i64
  %273 = sub i64 %271, %272
  %274 = icmp ult i64 %273, 43
  br i1 %274, label %.preheader25, label %.loopexit26, !llvm.loop !341

.loopexit26:                                      ; preds = %.preheader25, %252
  %275 = phi i8* [ %261, %252 ], [ %269, %.preheader25 ]
  br i1 %57, label %.loopexit24, label %276

276:                                              ; preds = %.loopexit26
  %277 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %174, i64 %169, i32 5
  %278 = load i64, i64* %277, align 8, !tbaa !342
  %279 = uitofp i64 %278 to double
  %280 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %174, i64 %169, i32 6
  %281 = load i64, i64* %280, align 8, !tbaa !343
  %282 = uitofp i64 %281 to double
  %283 = fadd double %282, 1.000000e-10
  %284 = fdiv double %279, %283
  %285 = fptrunc double %284 to float
  %286 = load i8*, i8** %12, align 8, !tbaa !320
  %287 = call i8* @halide_string_to_string(i8* %275, i8* %286, i8* nonnull getelementptr inbounds ([10 x i8], [10 x i8]* @.str.24.184, i64 0, i64 0)) #12
  store i8* %287, i8** %10, align 8, !tbaa !319
  %288 = load i8*, i8** %12, align 8, !tbaa !320
  %289 = fpext float %285 to double
  %290 = call i8* @halide_double_to_string(i8* %287, i8* %288, double %289, i32 0) #12
  store i8* %290, i8** %10, align 8, !tbaa !319
  %291 = icmp eq i8* %290, null
  br i1 %291, label %298, label %292

292:                                              ; preds = %276
  %293 = getelementptr inbounds i8, i8* %290, i64 -3
  %294 = load i8*, i8** %9, align 8, !tbaa !321
  %295 = icmp ult i8* %293, %294
  %296 = select i1 %295, i8* %294, i8* %293
  store i8* %296, i8** %10, align 8
  store i8 0, i8* %296, align 1, !tbaa !14
  %297 = load i8*, i8** %10, align 8, !tbaa !319
  br label %298

298:                                              ; preds = %292, %276
  %299 = phi i8* [ null, %276 ], [ %297, %292 ]
  %300 = load i8*, i8** %9, align 8, !tbaa !321
  %301 = ptrtoint i8* %299 to i64
  %302 = ptrtoint i8* %300 to i64
  %303 = sub i64 %301, %302
  %304 = icmp ult i64 %303, 58
  br i1 %304, label %.preheader23, label %.loopexit24

.preheader23:                                     ; preds = %.preheader23, %298
  %305 = phi i8* [ %307, %.preheader23 ], [ %299, %298 ]
  %306 = load i8*, i8** %12, align 8, !tbaa !320
  %307 = call i8* @halide_string_to_string(i8* %305, i8* %306, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.20.180, i64 0, i64 0)) #12
  store i8* %307, i8** %10, align 8, !tbaa !319
  %308 = load i8*, i8** %9, align 8, !tbaa !321
  %309 = ptrtoint i8* %307 to i64
  %310 = ptrtoint i8* %308 to i64
  %311 = sub i64 %309, %310
  %312 = icmp ult i64 %311, 58
  br i1 %312, label %.preheader23, label %.loopexit24, !llvm.loop !344

.loopexit24:                                      ; preds = %.preheader23, %298, %.loopexit26
  %313 = phi i8* [ %275, %.loopexit26 ], [ %299, %298 ], [ %307, %.preheader23 ]
  %314 = phi i64 [ 58, %.loopexit26 ], [ 73, %298 ], [ 73, %.preheader23 ]
  %315 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %174, i64 %169, i32 2
  %316 = load i64, i64* %315, align 8, !tbaa !345
  %317 = icmp eq i64 %316, 0
  br i1 %317, label %375, label %318

318:                                              ; preds = %.loopexit24
  %319 = load i8*, i8** %12, align 8, !tbaa !320
  %320 = call i8* @halide_string_to_string(i8* %313, i8* %319, i8* nonnull getelementptr inbounds ([8 x i8], [8 x i8]* @.str.25.185, i64 0, i64 0)) #12
  store i8* %320, i8** %10, align 8, !tbaa !319
  %321 = load i64, i64* %315, align 8, !tbaa !345
  %322 = load i8*, i8** %12, align 8, !tbaa !320
  %323 = call i8* @halide_uint64_to_string(i8* %320, i8* %322, i64 %321, i32 1) #12
  store i8* %323, i8** %10, align 8, !tbaa !319
  %324 = load i8*, i8** %9, align 8, !tbaa !321
  %325 = ptrtoint i8* %323 to i64
  %326 = ptrtoint i8* %324 to i64
  %327 = sub i64 %325, %326
  %328 = icmp ult i64 %327, %314
  br i1 %328, label %.preheader21, label %.loopexit22

.preheader21:                                     ; preds = %.preheader21, %318
  %329 = phi i8* [ %331, %.preheader21 ], [ %323, %318 ]
  %330 = load i8*, i8** %12, align 8, !tbaa !320
  %331 = call i8* @halide_string_to_string(i8* %329, i8* %330, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.20.180, i64 0, i64 0)) #12
  store i8* %331, i8** %10, align 8, !tbaa !319
  %332 = load i8*, i8** %9, align 8, !tbaa !321
  %333 = ptrtoint i8* %331 to i64
  %334 = ptrtoint i8* %332 to i64
  %335 = sub i64 %333, %334
  %336 = icmp ult i64 %335, %314
  br i1 %336, label %.preheader21, label %.loopexit22, !llvm.loop !346

.loopexit22:                                      ; preds = %.preheader21, %318
  %337 = phi i8* [ %323, %318 ], [ %331, %.preheader21 ]
  %338 = load i8*, i8** %12, align 8, !tbaa !320
  %339 = call i8* @halide_string_to_string(i8* %337, i8* %338, i8* nonnull getelementptr inbounds ([7 x i8], [7 x i8]* @.str.26.186, i64 0, i64 0)) #12
  store i8* %339, i8** %10, align 8, !tbaa !319
  %340 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %174, i64 %169, i32 8
  %341 = load i32, i32* %340, align 8, !tbaa !347
  %342 = load i8*, i8** %12, align 8, !tbaa !320
  %343 = sext i32 %341 to i64
  %344 = call i8* @halide_int64_to_string(i8* %339, i8* %342, i64 %343, i32 1) #12
  store i8* %344, i8** %10, align 8, !tbaa !319
  %345 = add nuw nsw i64 %314, 15
  %346 = load i8*, i8** %9, align 8, !tbaa !321
  %347 = ptrtoint i8* %344 to i64
  %348 = ptrtoint i8* %346 to i64
  %349 = sub i64 %347, %348
  %350 = icmp ult i64 %349, %345
  br i1 %350, label %.preheader, label %.loopexit

.preheader:                                       ; preds = %.preheader, %.loopexit22
  %351 = phi i8* [ %353, %.preheader ], [ %344, %.loopexit22 ]
  %352 = load i8*, i8** %12, align 8, !tbaa !320
  %353 = call i8* @halide_string_to_string(i8* %351, i8* %352, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.20.180, i64 0, i64 0)) #12
  store i8* %353, i8** %10, align 8, !tbaa !319
  %354 = load i8*, i8** %9, align 8, !tbaa !321
  %355 = ptrtoint i8* %353 to i64
  %356 = ptrtoint i8* %354 to i64
  %357 = sub i64 %355, %356
  %358 = icmp ult i64 %357, %345
  br i1 %358, label %.preheader, label %.loopexit, !llvm.loop !348

.loopexit:                                        ; preds = %.preheader, %.loopexit22
  %359 = phi i8* [ %344, %.loopexit22 ], [ %353, %.preheader ]
  %360 = load i32, i32* %340, align 8, !tbaa !347
  %361 = icmp eq i32 %360, 0
  br i1 %361, label %367, label %362

362:                                              ; preds = %.loopexit
  %363 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %174, i64 %169, i32 3
  %364 = load i64, i64* %363, align 8, !tbaa !349
  %365 = sext i32 %360 to i64
  %366 = udiv i64 %364, %365
  br label %367

367:                                              ; preds = %362, %.loopexit
  %368 = phi i64 [ %366, %362 ], [ 0, %.loopexit ]
  %369 = load i8*, i8** %12, align 8, !tbaa !320
  %370 = call i8* @halide_string_to_string(i8* %359, i8* %369, i8* nonnull getelementptr inbounds ([7 x i8], [7 x i8]* @.str.27.187, i64 0, i64 0)) #12
  store i8* %370, i8** %10, align 8, !tbaa !319
  %371 = load i8*, i8** %12, align 8, !tbaa !320
  %372 = shl i64 %368, 32
  %373 = ashr exact i64 %372, 32
  %374 = call i8* @halide_int64_to_string(i8* %370, i8* %371, i64 %373, i32 1) #12
  store i8* %374, i8** %10, align 8, !tbaa !319
  br label %375

375:                                              ; preds = %367, %.loopexit24
  %376 = phi i8* [ %374, %367 ], [ %313, %.loopexit24 ]
  %377 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %174, i64 %169, i32 4
  %378 = load i64, i64* %377, align 8, !tbaa !335
  %379 = icmp eq i64 %378, 0
  br i1 %379, label %386, label %380

380:                                              ; preds = %375
  %381 = load i8*, i8** %12, align 8, !tbaa !320
  %382 = call i8* @halide_string_to_string(i8* %376, i8* %381, i8* nonnull getelementptr inbounds ([9 x i8], [9 x i8]* @.str.28.188, i64 0, i64 0)) #12
  store i8* %382, i8** %10, align 8, !tbaa !319
  %383 = load i64, i64* %377, align 8, !tbaa !335
  %384 = load i8*, i8** %12, align 8, !tbaa !320
  %385 = call i8* @halide_uint64_to_string(i8* %382, i8* %384, i64 %383, i32 1) #12
  store i8* %385, i8** %10, align 8, !tbaa !319
  br label %386

386:                                              ; preds = %380, %375
  %387 = phi i8* [ %385, %380 ], [ %376, %375 ]
  %388 = load i8*, i8** %12, align 8, !tbaa !320
  %389 = call i8* @halide_string_to_string(i8* %387, i8* %388, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7.167, i64 0, i64 0)) #12
  store i8* %389, i8** %10, align 8, !tbaa !319
  %390 = load i8*, i8** %9, align 8, !tbaa !321
  %391 = icmp eq i8* %390, null
  br i1 %391, label %400, label %392

392:                                              ; preds = %386
  %393 = load i8*, i8** %7, align 8, !tbaa !316
  %394 = ptrtoint i8* %389 to i64
  %395 = ptrtoint i8* %390 to i64
  %396 = add i64 %394, 1
  %397 = sub i64 %396, %395
  %398 = call i32 @halide_msan_annotate_memory_is_initialized(i8* %393, i8* nonnull %390, i64 %397) #12
  %399 = load i8*, i8** %9, align 8, !tbaa !321
  br label %400

400:                                              ; preds = %392, %386
  %401 = phi i8* [ %399, %392 ], [ getelementptr inbounds ([35 x i8], [35 x i8]* @.str.29.165, i64 0, i64 0), %386 ]
  call void @halide_print(i8* %0, i8* %401) #12
  br label %402

402:                                              ; preds = %400, %177
  %403 = add nuw nsw i64 %169, 1
  %404 = load i32, i32* %163, align 8, !tbaa !332
  %405 = sext i32 %404 to i64
  %406 = icmp slt i64 %403, %405
  br i1 %406, label %168, label %.loopexit31, !llvm.loop !350

.loopexit31:                                      ; preds = %402, %.loopexit32, %156, %148, %.preheader34
  %407 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %39, i64 0, i32 8
  %408 = bitcast i8** %407 to %struct.halide_profiler_pipeline_stats**
  %409 = load %struct.halide_profiler_pipeline_stats*, %struct.halide_profiler_pipeline_stats** %408, align 8, !tbaa !10
  %410 = icmp eq %struct.halide_profiler_pipeline_stats* %409, null
  br i1 %410, label %16, label %.preheader34, !llvm.loop !351
}

; Function Attrs: nounwind mustprogress
define weak void @halide_profiler_reset_unlocked(%struct.halide_profiler_state* %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %0, i64 0, i32 5
  %3 = load %struct.halide_profiler_pipeline_stats*, %struct.halide_profiler_pipeline_stats** %2, align 8, !tbaa !352
  %4 = icmp eq %struct.halide_profiler_pipeline_stats* %3, null
  br i1 %4, label %.loopexit, label %.preheader

.preheader:                                       ; preds = %.preheader, %1
  %5 = phi %struct.halide_profiler_pipeline_stats* [ %13, %.preheader ], [ %3, %1 ]
  %6 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %5, i64 0, i32 8
  %7 = bitcast i8** %6 to %struct.halide_profiler_pipeline_stats**
  %8 = load %struct.halide_profiler_pipeline_stats*, %struct.halide_profiler_pipeline_stats** %7, align 8, !tbaa !353
  store %struct.halide_profiler_pipeline_stats* %8, %struct.halide_profiler_pipeline_stats** %2, align 8, !tbaa !352
  %9 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %5, i64 0, i32 7
  %10 = bitcast %struct.halide_profiler_func_stats** %9 to i8**
  %11 = load i8*, i8** %10, align 8, !tbaa !333
  tail call void @free(i8* %11) #12
  %12 = bitcast %struct.halide_profiler_pipeline_stats* %5 to i8*
  tail call void @free(i8* nonnull %12) #12
  %13 = load %struct.halide_profiler_pipeline_stats*, %struct.halide_profiler_pipeline_stats** %2, align 8, !tbaa !352
  %14 = icmp eq %struct.halide_profiler_pipeline_stats* %13, null
  br i1 %14, label %.loopexit, label %.preheader, !llvm.loop !354

.loopexit:                                        ; preds = %.preheader, %1
  %15 = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %0, i64 0, i32 2
  store i32 0, i32* %15, align 4, !tbaa !355
  ret void
}

; Function Attrs: nounwind mustprogress
define linkonce %struct.halide_profiler_pipeline_stats* @_ZN6Halide7Runtime8Internal23find_or_create_pipelineEPKciPKy(i8* %0, i32 %1, i64* %2) local_unnamed_addr #0 {
  %4 = tail call %struct.halide_profiler_state* @halide_profiler_get_state() #13
  %5 = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %4, i64 0, i32 5
  %6 = load %struct.halide_profiler_pipeline_stats*, %struct.halide_profiler_pipeline_stats** %5, align 8, !tbaa !10
  %7 = icmp eq %struct.halide_profiler_pipeline_stats* %6, null
  br i1 %7, label %.loopexit5, label %.preheader

.preheader:                                       ; preds = %16, %3
  %8 = phi %struct.halide_profiler_pipeline_stats* [ %19, %16 ], [ %6, %3 ]
  %9 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %8, i64 0, i32 6
  %10 = load i8*, i8** %9, align 8, !tbaa !327
  %11 = icmp eq i8* %10, %0
  br i1 %11, label %12, label %16

12:                                               ; preds = %.preheader
  %13 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %8, i64 0, i32 9
  %14 = load i32, i32* %13, align 8, !tbaa !332
  %15 = icmp eq i32 %14, %1
  br i1 %15, label %.loopexit4, label %16

16:                                               ; preds = %12, %.preheader
  %17 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %8, i64 0, i32 8
  %18 = bitcast i8** %17 to %struct.halide_profiler_pipeline_stats**
  %19 = load %struct.halide_profiler_pipeline_stats*, %struct.halide_profiler_pipeline_stats** %18, align 8, !tbaa !10
  %20 = icmp eq %struct.halide_profiler_pipeline_stats* %19, null
  br i1 %20, label %.loopexit5, label %.preheader, !llvm.loop !356

.loopexit5:                                       ; preds = %16, %3
  %21 = tail call i8* @malloc(i64 96) #12
  %22 = bitcast i8* %21 to %struct.halide_profiler_pipeline_stats*
  %23 = icmp eq i8* %21, null
  br i1 %23, label %.loopexit4, label %24

24:                                               ; preds = %.loopexit5
  %25 = bitcast %struct.halide_profiler_pipeline_stats** %5 to i8**
  %26 = load i8*, i8** %25, align 8, !tbaa !352
  %27 = getelementptr inbounds i8, i8* %21, i64 64
  %28 = bitcast i8* %27 to i8**
  store i8* %26, i8** %28, align 8, !tbaa !353
  %29 = getelementptr inbounds i8, i8* %21, i64 48
  %30 = bitcast i8* %29 to i8**
  store i8* %0, i8** %30, align 8, !tbaa !327
  %31 = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %4, i64 0, i32 2
  %32 = load i32, i32* %31, align 4, !tbaa !355
  %33 = getelementptr inbounds i8, i8* %21, i64 76
  %34 = bitcast i8* %33 to i32*
  store i32 %32, i32* %34, align 4, !tbaa !357
  %35 = getelementptr inbounds i8, i8* %21, i64 72
  %36 = bitcast i8* %35 to i32*
  store i32 %1, i32* %36, align 8, !tbaa !332
  %37 = getelementptr inbounds i8, i8* %21, i64 80
  %38 = bitcast i8* %37 to i32*
  store i32 0, i32* %38, align 8, !tbaa !324
  %39 = getelementptr inbounds i8, i8* %21, i64 84
  %40 = bitcast i8* %39 to i32*
  store i32 0, i32* %40, align 4, !tbaa !328
  %41 = bitcast i8* %21 to <4 x i64>*
  store <4 x i64> zeroinitializer, <4 x i64>* %41, align 8, !tbaa !113
  %42 = getelementptr inbounds i8, i8* %21, i64 88
  %43 = bitcast i8* %42 to i32*
  store i32 0, i32* %43, align 8, !tbaa !329
  %44 = getelementptr inbounds i8, i8* %21, i64 32
  %45 = bitcast i8* %44 to <2 x i64>*
  store <2 x i64> zeroinitializer, <2 x i64>* %45, align 8, !tbaa !113
  %46 = sext i32 %1 to i64
  %47 = mul nsw i64 %46, 72
  %48 = tail call i8* @malloc(i64 %47) #12
  %49 = getelementptr inbounds i8, i8* %21, i64 56
  %50 = bitcast i8* %49 to i8**
  store i8* %48, i8** %50, align 8, !tbaa !333
  %51 = icmp eq i8* %48, null
  %52 = bitcast i8* %48 to %struct.halide_profiler_func_stats*
  br i1 %51, label %57, label %53

53:                                               ; preds = %24
  %54 = icmp sgt i32 %1, 0
  br i1 %54, label %55, label %.loopexit

55:                                               ; preds = %53
  %56 = zext i32 %1 to i64
  br label %60

57:                                               ; preds = %24
  tail call void @free(i8* nonnull %21) #12
  br label %.loopexit4

.loopexit:                                        ; preds = %60, %53
  %58 = load i32, i32* %31, align 4, !tbaa !355
  %59 = add nsw i32 %58, %1
  store i32 %59, i32* %31, align 4, !tbaa !355
  store i8* %21, i8** %25, align 8, !tbaa !352
  br label %.loopexit4

60:                                               ; preds = %60, %55
  %61 = phi i64 [ 0, %55 ], [ %72, %60 ]
  %62 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %52, i64 %61, i32 0
  store i64 0, i64* %62, align 8, !tbaa !337
  %63 = getelementptr inbounds i64, i64* %2, i64 %61
  %64 = load i64, i64* %63, align 8, !tbaa !113
  %65 = inttoptr i64 %64 to i8*
  %66 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %52, i64 %61, i32 7
  store i8* %65, i8** %66, align 8, !tbaa !338
  %67 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %52, i64 %61, i32 1
  %68 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %52, i64 %61, i32 8
  store i32 0, i32* %68, align 8, !tbaa !347
  %69 = bitcast i64* %67 to <4 x i64>*
  store <4 x i64> zeroinitializer, <4 x i64>* %69, align 8, !tbaa !113
  %70 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %52, i64 %61, i32 5
  %71 = bitcast i64* %70 to <2 x i64>*
  store <2 x i64> zeroinitializer, <2 x i64>* %71, align 8, !tbaa !113
  %72 = add nuw nsw i64 %61, 1
  %73 = icmp eq i64 %72, %56
  br i1 %73, label %.loopexit, label %60, !llvm.loop !358

.loopexit4:                                       ; preds = %.loopexit, %57, %.loopexit5, %12
  %74 = phi %struct.halide_profiler_pipeline_stats* [ %22, %.loopexit ], [ null, %57 ], [ null, %.loopexit5 ], [ %8, %12 ]
  ret %struct.halide_profiler_pipeline_stats* %74
}

; Function Attrs: nounwind mustprogress
define linkonce void @_ZN6Halide7Runtime8Internal9bill_funcEP21halide_profiler_stateiyi(%struct.halide_profiler_state* %0, i32 %1, i64 %2, i32 %3) local_unnamed_addr #0 {
  %5 = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %0, i64 0, i32 5
  %6 = load %struct.halide_profiler_pipeline_stats*, %struct.halide_profiler_pipeline_stats** %5, align 8, !tbaa !10
  %7 = icmp eq %struct.halide_profiler_pipeline_stats* %6, null
  br i1 %7, label %.loopexit, label %.preheader

.preheader:                                       ; preds = %54, %4
  %8 = phi %struct.halide_profiler_pipeline_stats* [ %57, %54 ], [ %6, %4 ]
  %9 = phi %struct.halide_profiler_pipeline_stats* [ %8, %54 ], [ null, %4 ]
  %10 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %8, i64 0, i32 10
  %11 = load i32, i32* %10, align 4, !tbaa !357
  %12 = icmp sgt i32 %11, %1
  br i1 %12, label %54, label %13

13:                                               ; preds = %.preheader
  %14 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %8, i64 0, i32 9
  %15 = load i32, i32* %14, align 8, !tbaa !332
  %16 = add nsw i32 %15, %11
  %17 = icmp sgt i32 %16, %1
  br i1 %17, label %18, label %54

18:                                               ; preds = %13
  %19 = icmp eq %struct.halide_profiler_pipeline_stats* %9, null
  br i1 %19, label %25, label %20

20:                                               ; preds = %18
  %21 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %8, i64 0, i32 8
  %22 = load i8*, i8** %21, align 8, !tbaa !353
  %23 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %9, i64 0, i32 8
  store i8* %22, i8** %23, align 8, !tbaa !353
  %24 = bitcast i8** %21 to %struct.halide_profiler_pipeline_stats**
  store %struct.halide_profiler_pipeline_stats* %6, %struct.halide_profiler_pipeline_stats** %24, align 8, !tbaa !353
  store %struct.halide_profiler_pipeline_stats* %8, %struct.halide_profiler_pipeline_stats** %5, align 8, !tbaa !352
  br label %25

25:                                               ; preds = %20, %18
  %26 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %8, i64 0, i32 7
  %27 = load %struct.halide_profiler_func_stats*, %struct.halide_profiler_func_stats** %26, align 8, !tbaa !333
  %28 = sext i32 %1 to i64
  %29 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %27, i64 %28
  %30 = sext i32 %11 to i64
  %31 = sub nsw i64 0, %30
  %32 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %29, i64 %31
  %33 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %32, i64 0, i32 0
  %34 = load i64, i64* %33, align 8, !tbaa !337
  %35 = add i64 %34, %2
  store i64 %35, i64* %33, align 8, !tbaa !337
  %36 = sext i32 %3 to i64
  %37 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %32, i64 0, i32 5
  %38 = bitcast i64* %37 to <2 x i64>*
  %39 = load <2 x i64>, <2 x i64>* %38, align 8, !tbaa !113
  %40 = insertelement <2 x i64> <i64 poison, i64 1>, i64 %36, i32 0
  %41 = add <2 x i64> %39, %40
  %42 = bitcast i64* %37 to <2 x i64>*
  store <2 x i64> %41, <2 x i64>* %42, align 8, !tbaa !113
  %43 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %8, i64 0, i32 0
  %44 = load i64, i64* %43, align 8, !tbaa !322
  %45 = add i64 %44, %2
  store i64 %45, i64* %43, align 8, !tbaa !322
  %46 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %8, i64 0, i32 12
  %47 = load i32, i32* %46, align 4, !tbaa !328
  %48 = add nsw i32 %47, 1
  store i32 %48, i32* %46, align 4, !tbaa !328
  %49 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %8, i64 0, i32 4
  %50 = bitcast i64* %49 to <2 x i64>*
  %51 = load <2 x i64>, <2 x i64>* %50, align 8, !tbaa !113
  %52 = add <2 x i64> %51, %40
  %53 = bitcast i64* %49 to <2 x i64>*
  store <2 x i64> %52, <2 x i64>* %53, align 8, !tbaa !113
  ret void

54:                                               ; preds = %13, %.preheader
  %55 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %8, i64 0, i32 8
  %56 = bitcast i8** %55 to %struct.halide_profiler_pipeline_stats**
  %57 = load %struct.halide_profiler_pipeline_stats*, %struct.halide_profiler_pipeline_stats** %56, align 8, !tbaa !10
  %58 = icmp eq %struct.halide_profiler_pipeline_stats* %57, null
  br i1 %58, label %.loopexit, label %.preheader, !llvm.loop !359

.loopexit:                                        ; preds = %54, %4
  ret void
}

; Function Attrs: nounwind
define linkonce void @_ZN6Halide7Runtime8Internal24sampling_profiler_threadEPv(i8* %0) #4 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = tail call %struct.halide_profiler_state* @halide_profiler_get_state() #13
  %5 = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %4, i64 0, i32 0
  tail call void @halide_mutex_lock(%struct.halide_mutex* %5) #12
  %6 = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %4, i64 0, i32 3
  %7 = load i32, i32* %6, align 8, !tbaa !315
  %8 = icmp eq i32 %7, -2
  br i1 %8, label %.loopexit, label %9

9:                                                ; preds = %1
  %10 = bitcast i32* %2 to i8*
  %11 = bitcast i32* %3 to i8*
  %12 = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %4, i64 0, i32 6
  %13 = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %4, i64 0, i32 4
  %14 = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %4, i64 0, i32 1
  br label %18

15:                                               ; preds = %28
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %11) #10
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %10) #10
  %16 = load i32, i32* %6, align 8, !tbaa !315
  %17 = icmp eq i32 %16, -2
  br i1 %17, label %.loopexit, label %18, !llvm.loop !360

18:                                               ; preds = %15, %9
  %19 = call i64 @halide_current_time_ns(i8* null) #12
  br label %20

20:                                               ; preds = %37, %18
  %21 = phi i64 [ %19, %18 ], [ %29, %37 ]
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %10) #10
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %11) #10
  %22 = load void (i32*, i32*)*, void (i32*, i32*)** %12, align 8, !tbaa !361
  %23 = icmp eq void (i32*, i32*)* %22, null
  br i1 %23, label %25, label %24

24:                                               ; preds = %20
  call void %22(i32* nonnull %2, i32* nonnull %3) #12
  br label %28

25:                                               ; preds = %20
  %26 = load i32, i32* %6, align 8, !tbaa !315
  store i32 %26, i32* %2, align 4, !tbaa !76
  %27 = load i32, i32* %13, align 4, !tbaa !362
  store i32 %27, i32* %3, align 4, !tbaa !76
  br label %28

28:                                               ; preds = %25, %24
  %29 = call i64 @halide_current_time_ns(i8* null) #12
  %30 = load i32, i32* %2, align 4, !tbaa !76
  %31 = icmp eq i32 %30, -2
  br i1 %31, label %15, label %32

32:                                               ; preds = %28
  %33 = icmp sgt i32 %30, -1
  br i1 %33, label %34, label %37

34:                                               ; preds = %32
  %35 = sub i64 %29, %21
  %36 = load i32, i32* %3, align 4, !tbaa !76
  call void @_ZN6Halide7Runtime8Internal9bill_funcEP21halide_profiler_stateiyi(%struct.halide_profiler_state* nonnull %4, i32 %30, i64 %35, i32 %36) #13
  br label %37

37:                                               ; preds = %34, %32
  %38 = load i32, i32* %14, align 8, !tbaa !363
  call void @halide_mutex_unlock(%struct.halide_mutex* nonnull %5) #12
  call void @halide_sleep_ms(i8* null, i32 %38) #12
  call void @halide_mutex_lock(%struct.halide_mutex* nonnull %5) #12
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %11) #10
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %10) #10
  br label %20

.loopexit:                                        ; preds = %15, %1
  call void @halide_mutex_unlock(%struct.halide_mutex* nonnull %5) #12
  ret void
}

; Function Attrs: nounwind
define weak %struct.halide_profiler_pipeline_stats* @halide_profiler_get_pipeline_state(i8* %0) local_unnamed_addr #4 {
  %2 = tail call %struct.halide_profiler_state* @halide_profiler_get_state() #13
  %3 = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %2, i64 0, i32 0
  tail call void @halide_mutex_lock(%struct.halide_mutex* %3) #12
  %4 = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %2, i64 0, i32 5
  %5 = load %struct.halide_profiler_pipeline_stats*, %struct.halide_profiler_pipeline_stats** %4, align 8, !tbaa !10
  %6 = icmp eq %struct.halide_profiler_pipeline_stats* %5, null
  br i1 %6, label %.loopexit, label %.preheader

.preheader:                                       ; preds = %11, %1
  %7 = phi %struct.halide_profiler_pipeline_stats* [ %14, %11 ], [ %5, %1 ]
  %8 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %7, i64 0, i32 6
  %9 = load i8*, i8** %8, align 8, !tbaa !327
  %10 = icmp eq i8* %9, %0
  br i1 %10, label %.loopexit, label %11

11:                                               ; preds = %.preheader
  %12 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %7, i64 0, i32 8
  %13 = bitcast i8** %12 to %struct.halide_profiler_pipeline_stats**
  %14 = load %struct.halide_profiler_pipeline_stats*, %struct.halide_profiler_pipeline_stats** %13, align 8, !tbaa !10
  %15 = icmp eq %struct.halide_profiler_pipeline_stats* %14, null
  br i1 %15, label %.loopexit, label %.preheader, !llvm.loop !364

.loopexit:                                        ; preds = %11, %.preheader, %1
  %16 = phi %struct.halide_profiler_pipeline_stats* [ null, %1 ], [ null, %11 ], [ %7, %.preheader ]
  tail call void @halide_mutex_unlock(%struct.halide_mutex* %3) #12
  ret %struct.halide_profiler_pipeline_stats* %16
}

; Function Attrs: nounwind
define weak i32 @halide_profiler_pipeline_start(i8* %0, i8* %1, i32 %2, i64* %3) local_unnamed_addr #4 {
  %5 = tail call %struct.halide_profiler_state* @halide_profiler_get_state() #13
  %6 = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %5, i64 0, i32 0
  tail call void @halide_mutex_lock(%struct.halide_mutex* %6) #12
  %7 = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %5, i64 0, i32 7
  %8 = load %struct.halide_thread*, %struct.halide_thread** %7, align 8, !tbaa !313
  %9 = icmp eq %struct.halide_thread* %8, null
  br i1 %9, label %10, label %13

10:                                               ; preds = %4
  %11 = tail call i32 @halide_start_clock(i8* %0) #12
  %12 = tail call %struct.halide_thread* @halide_spawn_thread(void (i8*)* nonnull @_ZN6Halide7Runtime8Internal24sampling_profiler_threadEPv, i8* null) #12
  store %struct.halide_thread* %12, %struct.halide_thread** %7, align 8, !tbaa !313
  br label %13

13:                                               ; preds = %10, %4
  %14 = tail call %struct.halide_profiler_pipeline_stats* @_ZN6Halide7Runtime8Internal23find_or_create_pipelineEPKciPKy(i8* %1, i32 %2, i64* %3) #13
  %15 = icmp eq %struct.halide_profiler_pipeline_stats* %14, null
  br i1 %15, label %16, label %18

16:                                               ; preds = %13
  %17 = tail call i32 @halide_error_out_of_memory(i8* %0) #12
  br label %24

18:                                               ; preds = %13
  %19 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %14, i64 0, i32 11
  %20 = load i32, i32* %19, align 8, !tbaa !324
  %21 = add nsw i32 %20, 1
  store i32 %21, i32* %19, align 8, !tbaa !324
  %22 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %14, i64 0, i32 10
  %23 = load i32, i32* %22, align 4, !tbaa !357
  br label %24

24:                                               ; preds = %18, %16
  %25 = phi i32 [ %23, %18 ], [ %17, %16 ]
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull %6) #12
  ret i32 %25
}

; Function Attrs: nounwind mustprogress
define weak void @halide_profiler_stack_peak_update(i8* %0, i8* %1, i64* %2) local_unnamed_addr #0 {
  %4 = icmp eq i8* %1, null
  br i1 %4, label %5, label %6

5:                                                ; preds = %3
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([85 x i8], [85 x i8]* @.str.189, i64 0, i64 0)) #12
  tail call void @abort() #12
  br label %6

6:                                                ; preds = %5, %3
  %7 = getelementptr inbounds i8, i8* %1, i64 72
  %8 = bitcast i8* %7 to i32*
  %9 = load i32, i32* %8, align 8, !tbaa !332
  %10 = icmp sgt i32 %9, 0
  br i1 %10, label %11, label %.loopexit

11:                                               ; preds = %6
  %12 = getelementptr inbounds i8, i8* %1, i64 56
  %13 = bitcast i8* %12 to %struct.halide_profiler_func_stats**
  br label %14

.loopexit:                                        ; preds = %33, %6
  ret void

14:                                               ; preds = %33, %11
  %15 = phi i32 [ %9, %11 ], [ %34, %33 ]
  %16 = phi i64 [ 0, %11 ], [ %35, %33 ]
  %17 = getelementptr inbounds i64, i64* %2, i64 %16
  %18 = load i64, i64* %17, align 8, !tbaa !113
  %19 = icmp eq i64 %18, 0
  br i1 %19, label %33, label %20

20:                                               ; preds = %14
  %21 = load %struct.halide_profiler_func_stats*, %struct.halide_profiler_func_stats** %13, align 8, !tbaa !333
  %22 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %21, i64 %16, i32 4
  %23 = load i64, i64* %22, align 8, !tbaa !113
  br label %24

24:                                               ; preds = %27, %20
  %25 = phi i64 [ %23, %20 ], [ %29, %27 ]
  %26 = icmp ult i64 %25, %18
  br i1 %26, label %27, label %31

27:                                               ; preds = %24
  %28 = cmpxchg i64* %22, i64 %25, i64 %18 seq_cst seq_cst
  %29 = extractvalue { i64, i1 } %28, 0
  %30 = icmp eq i64 %25, %29
  br i1 %30, label %31, label %24, !llvm.loop !365

31:                                               ; preds = %27, %24
  %32 = load i32, i32* %8, align 8, !tbaa !332
  br label %33

33:                                               ; preds = %31, %14
  %34 = phi i32 [ %32, %31 ], [ %15, %14 ]
  %35 = add nuw nsw i64 %16, 1
  %36 = sext i32 %34 to i64
  %37 = icmp slt i64 %35, %36
  br i1 %37, label %14, label %.loopexit, !llvm.loop !366
}

; Function Attrs: nounwind mustprogress
define weak void @halide_profiler_memory_allocate(i8* %0, i8* %1, i32 %2, i64 %3) local_unnamed_addr #0 {
  %5 = icmp eq i64 %3, 0
  br i1 %5, label %.loopexit, label %6

6:                                                ; preds = %4
  %7 = icmp eq i8* %1, null
  br i1 %7, label %8, label %9

8:                                                ; preds = %6
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([85 x i8], [85 x i8]* @.str.1.190, i64 0, i64 0)) #12
  tail call void @abort() #12
  br label %9

9:                                                ; preds = %8, %6
  %10 = icmp sgt i32 %2, -1
  br i1 %10, label %12, label %11

11:                                               ; preds = %9
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([79 x i8], [79 x i8]* @.str.2.191, i64 0, i64 0)) #12
  tail call void @abort() #12
  br label %12

12:                                               ; preds = %11, %9
  %13 = getelementptr inbounds i8, i8* %1, i64 72
  %14 = bitcast i8* %13 to i32*
  %15 = load i32, i32* %14, align 8, !tbaa !332
  %16 = icmp sgt i32 %15, %2
  br i1 %16, label %18, label %17

17:                                               ; preds = %12
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([95 x i8], [95 x i8]* @.str.3.192, i64 0, i64 0)) #12
  tail call void @abort() #12
  br label %18

18:                                               ; preds = %17, %12
  %19 = getelementptr inbounds i8, i8* %1, i64 56
  %20 = bitcast i8* %19 to %struct.halide_profiler_func_stats**
  %21 = load %struct.halide_profiler_func_stats*, %struct.halide_profiler_func_stats** %20, align 8, !tbaa !333
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
  %35 = load i64, i64* %34, align 8, !tbaa !113
  br label %36

36:                                               ; preds = %39, %18
  %37 = phi i64 [ %35, %18 ], [ %41, %39 ]
  %38 = icmp ult i64 %37, %32
  br i1 %38, label %39, label %43

39:                                               ; preds = %36
  %40 = cmpxchg i64* %34, i64 %37, i64 %32 seq_cst seq_cst
  %41 = extractvalue { i64, i1 } %40, 0
  %42 = icmp eq i64 %37, %41
  br i1 %42, label %43, label %36, !llvm.loop !365

43:                                               ; preds = %39, %36
  %44 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %21, i64 %22, i32 8
  %45 = atomicrmw add i32* %44, i32 1 seq_cst
  %46 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %21, i64 %22, i32 3
  %47 = atomicrmw add i64* %46, i64 %3 seq_cst
  %48 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %21, i64 %22, i32 1
  %49 = atomicrmw add i64* %48, i64 %3 seq_cst
  %50 = add i64 %49, %3
  %51 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %21, i64 %22, i32 2
  %52 = load i64, i64* %51, align 8, !tbaa !113
  br label %53

53:                                               ; preds = %56, %43
  %54 = phi i64 [ %52, %43 ], [ %58, %56 ]
  %55 = icmp ult i64 %54, %50
  br i1 %55, label %56, label %.loopexit

56:                                               ; preds = %53
  %57 = cmpxchg i64* %51, i64 %54, i64 %50 seq_cst seq_cst
  %58 = extractvalue { i64, i1 } %57, 0
  %59 = icmp eq i64 %54, %58
  br i1 %59, label %.loopexit, label %53, !llvm.loop !365

.loopexit:                                        ; preds = %56, %53, %4
  ret void
}

; Function Attrs: nounwind mustprogress
define weak void @halide_profiler_memory_free(i8* %0, i8* %1, i32 %2, i64 %3) local_unnamed_addr #0 {
  %5 = icmp eq i64 %3, 0
  br i1 %5, label %28, label %6

6:                                                ; preds = %4
  %7 = icmp eq i8* %1, null
  br i1 %7, label %8, label %9

8:                                                ; preds = %6
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([85 x i8], [85 x i8]* @.str.4.193, i64 0, i64 0)) #12
  tail call void @abort() #12
  br label %9

9:                                                ; preds = %8, %6
  %10 = icmp sgt i32 %2, -1
  br i1 %10, label %12, label %11

11:                                               ; preds = %9
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([79 x i8], [79 x i8]* @.str.5.194, i64 0, i64 0)) #12
  tail call void @abort() #12
  br label %12

12:                                               ; preds = %11, %9
  %13 = getelementptr inbounds i8, i8* %1, i64 72
  %14 = bitcast i8* %13 to i32*
  %15 = load i32, i32* %14, align 8, !tbaa !332
  %16 = icmp sgt i32 %15, %2
  br i1 %16, label %18, label %17

17:                                               ; preds = %12
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([95 x i8], [95 x i8]* @.str.6.195, i64 0, i64 0)) #12
  tail call void @abort() #12
  br label %18

18:                                               ; preds = %17, %12
  %19 = getelementptr inbounds i8, i8* %1, i64 56
  %20 = bitcast i8* %19 to %struct.halide_profiler_func_stats**
  %21 = load %struct.halide_profiler_func_stats*, %struct.halide_profiler_func_stats** %20, align 8, !tbaa !333
  %22 = sext i32 %2 to i64
  %23 = getelementptr inbounds i8, i8* %1, i64 8
  %24 = bitcast i8* %23 to i64*
  %25 = atomicrmw sub i64* %24, i64 %3 seq_cst
  %26 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %21, i64 %22, i32 1
  %27 = atomicrmw sub i64* %26, i64 %3 seq_cst
  br label %28

28:                                               ; preds = %18, %4
  ret void
}

; Function Attrs: nounwind
define weak void @halide_profiler_report(i8* %0) local_unnamed_addr #4 {
  %2 = tail call %struct.halide_profiler_state* @halide_profiler_get_state() #13
  %3 = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %2, i64 0, i32 0
  tail call void @halide_mutex_lock(%struct.halide_mutex* %3) #12
  tail call void @halide_profiler_report_unlocked(i8* %0, %struct.halide_profiler_state* %2) #13
  tail call void @halide_mutex_unlock(%struct.halide_mutex* %3) #12
  ret void
}

; Function Attrs: nounwind
define weak void @halide_profiler_reset() local_unnamed_addr #4 {
  %1 = tail call %struct.halide_profiler_state* @halide_profiler_get_state() #13
  %2 = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %1, i64 0, i32 0
  tail call void @halide_mutex_lock(%struct.halide_mutex* %2) #12
  tail call void @halide_profiler_reset_unlocked(%struct.halide_profiler_state* %1) #13
  tail call void @halide_mutex_unlock(%struct.halide_mutex* %2) #12
  ret void
}

; Function Attrs: nounwind willreturn mustprogress
define weak void @halide_profiler_pipeline_end(i8* %0, i8* %1) local_unnamed_addr #2 {
  %3 = getelementptr inbounds i8, i8* %1, i64 16
  %4 = bitcast i8* %3 to i32*
  store i32 -1, i32* %4, align 8, !tbaa !315
  ret void
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
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE) #12
  %4 = load i8, i8* @_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE, align 1, !tbaa !15, !range !17
  %5 = icmp eq i8 %4, 0
  br i1 %5, label %6, label %9

6:                                                ; preds = %2
  %7 = bitcast %"struct.Halide::Runtime::Internal::CpuFeatures"* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %7) #10
  call void @_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv(%"struct.Halide::Runtime::Internal::CpuFeatures"* nonnull sret(%"struct.Halide::Runtime::Internal::CpuFeatures") align 8 %3) #12
  %8 = call i8* @memcpy(i8* bitcast ([4 x i64]* @_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE to i8*), i8* nonnull %7, i64 32) #12
  store i8 1, i8* @_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE, align 1, !tbaa !15
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %7) #10
  br label %9

9:                                                ; preds = %6, %2
  call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE) #12
  %10 = icmp eq i32 %0, 2
  br i1 %10, label %12, label %11

11:                                               ; preds = %9
  call void @halide_error(i8* null, i8* getelementptr inbounds ([81 x i8], [81 x i8]* @.str.200, i64 0, i64 0)) #12
  br label %12

12:                                               ; preds = %11, %9
  %13 = load i64, i64* %1, align 8, !tbaa !113
  %14 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE, i64 0, i64 0), align 8, !tbaa !113
  %15 = and i64 %14, %13
  %16 = icmp eq i64 %15, 0
  br i1 %16, label %21, label %17

17:                                               ; preds = %12
  %18 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE, i64 0, i64 2), align 8, !tbaa !113
  %19 = and i64 %18, %15
  %20 = icmp eq i64 %19, %15
  br i1 %20, label %21, label %27

21:                                               ; preds = %17, %12
  %22 = getelementptr inbounds i64, i64* %1, i64 1
  %23 = load i64, i64* %22, align 8, !tbaa !113
  %24 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE, i64 0, i64 1), align 8, !tbaa !113
  %25 = and i64 %24, %23
  %26 = icmp eq i64 %25, 0
  br i1 %26, label %33, label %29

27:                                               ; preds = %33, %29, %17
  %28 = phi i32 [ 0, %17 ], [ 0, %29 ], [ 1, %33 ]
  ret i32 %28

29:                                               ; preds = %21
  %30 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE, i64 0, i64 3), align 8, !tbaa !113
  %31 = and i64 %30, %25
  %32 = icmp eq i64 %31, %25
  br i1 %32, label %33, label %27

33:                                               ; preds = %29, %21
  br label %27
}

; Function Attrs: nounwind willreturn mustprogress
define weak i32 (i32, i64*)* @halide_set_custom_can_use_target_features(i32 (i32, i64*)* %0) local_unnamed_addr #2 {
  %2 = load i32 (i32, i64*)*, i32 (i32, i64*)** @_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE, align 8, !tbaa !10
  store i32 (i32, i64*)* %0, i32 (i32, i64*)** @_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE, align 8, !tbaa !10
  ret i32 (i32, i64*)* %2
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_can_use_target_features(i32 %0, i64* %1) local_unnamed_addr #0 {
  %3 = load i32 (i32, i64*)*, i32 (i32, i64*)** @_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE, align 8, !tbaa !10
  %4 = tail call i32 %3(i32 %0, i64* %1) #12
  ret i32 %4
}

; Function Attrs: nounwind
define linkonce void @_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv(%"struct.Halide::Runtime::Internal::CpuFeatures"* noalias sret(%"struct.Halide::Runtime::Internal::CpuFeatures") align 8 %0) local_unnamed_addr #8 {
  %2 = alloca [4 x i32], align 4
  %3 = alloca [4 x i32], align 4
  %4 = alloca [4 x i32], align 4
  %5 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CpuFeatures", %"struct.Halide::Runtime::Internal::CpuFeatures"* %0, i64 0, i32 1, i64 0
  %6 = bitcast %"struct.Halide::Runtime::Internal::CpuFeatures"* %0 to <4 x i64>*
  store <4 x i64> <i64 17042430231280, i64 0, i64 0, i64 0>, <4 x i64>* %6, align 8, !tbaa !113
  %7 = bitcast [4 x i32]* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %7) #10
  %8 = getelementptr inbounds [4 x i32], [4 x i32]* %2, i64 0, i64 0
  store i32 1, i32* %8, align 4, !tbaa !76
  %9 = getelementptr inbounds [4 x i32], [4 x i32]* %2, i64 0, i64 1
  store i32 0, i32* %9, align 4, !tbaa !76
  call void asm sideeffect inteldialect "xchg ebx, esi\0A\09mov eax, dword ptr $$0 $0\0A\09mov ecx, dword ptr $$4 $0\0A\09cpuid\0A\09mov dword ptr $$0 $0, eax\0A\09mov dword ptr $$4 $0, ebx\0A\09mov dword ptr $$8 $0, ecx\0A\09mov dword ptr $$12 $0, edx\0A\09xchg ebx, esi", "=*m,~{eax},~{ebx},~{ecx},~{edx},~{esi},~{dirflag},~{fpsr},~{flags}"(i32* nonnull %8) #10
  %10 = getelementptr inbounds [4 x i32], [4 x i32]* %2, i64 0, i64 2
  %11 = load i32, i32* %10, align 4, !tbaa !76
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
  store i64 %23, i64* %5, align 8, !tbaa !113
  br label %27

27:                                               ; preds = %26, %1
  %28 = and i32 %11, 1879048192
  %29 = icmp eq i32 %28, 1879048192
  br i1 %29, label %30, label %71

30:                                               ; preds = %27
  %31 = bitcast [4 x i32]* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %31) #10
  %32 = getelementptr inbounds [4 x i32], [4 x i32]* %3, i64 0, i64 0
  store i32 7, i32* %32, align 4, !tbaa !76
  %33 = getelementptr inbounds [4 x i32], [4 x i32]* %3, i64 0, i64 1
  store i32 0, i32* %33, align 4, !tbaa !76
  call void asm sideeffect inteldialect "xchg ebx, esi\0A\09mov eax, dword ptr $$0 $0\0A\09mov ecx, dword ptr $$4 $0\0A\09cpuid\0A\09mov dword ptr $$0 $0, eax\0A\09mov dword ptr $$4 $0, ebx\0A\09mov dword ptr $$8 $0, ecx\0A\09mov dword ptr $$12 $0, edx\0A\09xchg ebx, esi", "=*m,~{eax},~{ebx},~{ecx},~{edx},~{esi},~{dirflag},~{fpsr},~{flags}"(i32* nonnull %32) #10
  %34 = load i32, i32* %33, align 4, !tbaa !76
  %35 = and i32 %34, 32
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %39, label %37

37:                                               ; preds = %30
  %38 = or i64 %23, 64
  store i64 %38, i64* %5, align 8, !tbaa !113
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
  store i64 %51, i64* %5, align 8, !tbaa !113
  %52 = and i32 %34, -803012608
  %53 = icmp eq i32 %52, -803012608
  br i1 %53, label %54, label %70

54:                                               ; preds = %43
  %55 = or i64 %51, 4398046511104
  store i64 %55, i64* %5, align 8, !tbaa !113
  %56 = bitcast [4 x i32]* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %56) #10
  %57 = getelementptr inbounds [4 x i32], [4 x i32]* %4, i64 0, i64 0
  store i32 7, i32* %57, align 4, !tbaa !76
  %58 = getelementptr inbounds [4 x i32], [4 x i32]* %4, i64 0, i64 1
  store i32 1, i32* %58, align 4, !tbaa !76
  call void asm sideeffect inteldialect "xchg ebx, esi\0A\09mov eax, dword ptr $$0 $0\0A\09mov ecx, dword ptr $$4 $0\0A\09cpuid\0A\09mov dword ptr $$0 $0, eax\0A\09mov dword ptr $$4 $0, ebx\0A\09mov dword ptr $$8 $0, ecx\0A\09mov dword ptr $$12 $0, edx\0A\09xchg ebx, esi", "=*m,~{eax},~{ebx},~{ecx},~{edx},~{esi},~{dirflag},~{fpsr},~{flags}"(i32* nonnull %57) #10
  %59 = getelementptr inbounds [4 x i32], [4 x i32]* %3, i64 0, i64 2
  %60 = load i32, i32* %59, align 4, !tbaa !76
  %61 = and i32 %60, 2048
  %62 = icmp eq i32 %61, 0
  br i1 %62, label %69, label %63

63:                                               ; preds = %54
  %64 = load i32, i32* %57, align 4, !tbaa !76
  %65 = and i32 %64, 32
  %66 = icmp eq i32 %65, 0
  br i1 %66, label %69, label %67

67:                                               ; preds = %63
  %68 = or i64 %51, 13194139533312
  store i64 %68, i64* %5, align 8, !tbaa !113
  br label %69

69:                                               ; preds = %67, %63, %54
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %56) #10
  br label %70

70:                                               ; preds = %69, %43, %39
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %31) #10
  br label %71

71:                                               ; preds = %70, %27
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %7) #10
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

; Function Attrs: nounwind
define i32 @sobel3x3_batch_0058_sample_0015(%struct.halide_buffer_t* noalias %input.buffer, %struct.halide_buffer_t* noalias %output.buffer) local_unnamed_addr #9 {
entry:
  %0 = alloca i32, align 4
  %1 = alloca i32, align 4
  %2 = alloca %closure_t, align 8
  %3 = alloca [8 x i32], align 4
  %4 = alloca [8 x i32], align 4
  %.not = icmp eq %struct.halide_buffer_t* %output.buffer, null
  br i1 %.not, label %destructor_block.sink.split, label %"assert succeeded", !prof !367

"assert succeeded":                               ; preds = %entry
  %.not33 = icmp eq %struct.halide_buffer_t* %input.buffer, null
  br i1 %.not33, label %destructor_block.sink.split, label %"assert succeeded2", !prof !367

destructor_block.sink.split:                      ; preds = %"assert succeeded", %entry
  %.sink = phi i8* [ getelementptr inbounds ([6 x i8], [6 x i8]* @str.203, i64 0, i64 0), %"assert succeeded" ], [ getelementptr inbounds ([7 x i8], [7 x i8]* @str, i64 0, i64 0), %entry ]
  %5 = tail call i32 @halide_error_buffer_argument_is_null(i8* null, i8* %.sink) #10
  br label %destructor_block

destructor_block:                                 ; preds = %_halide_buffer_is_bounds_query.exit45, %destructor_block.sink.split
  %6 = phi i32 [ 0, %_halide_buffer_is_bounds_query.exit45 ], [ %5, %destructor_block.sink.split ]
  ret i32 %6

"assert succeeded2":                              ; preds = %"assert succeeded"
  %7 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %input.buffer, i64 0, i32 2
  %8 = load i8*, i8** %7, align 8, !tbaa !181
  %9 = bitcast i32* %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %9) #10
  %10 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %input.buffer, i64 0, i32 4, i32 0
  %11 = call i8* @memcpy(i8* nonnull %9, i8* nonnull %10, i64 4) #12
  %12 = load i32, i32* %1, align 4, !tbaa !76
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %9) #10
  %13 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %input.buffer, i64 0, i32 3
  %14 = load i64, i64* %13, align 8, !tbaa !285
  %15 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %input.buffer, i64 0, i32 5
  %16 = load i32, i32* %15, align 4, !tbaa !184
  %17 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %input.buffer, i64 0, i32 6
  %18 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %17, align 8, !tbaa !185
  %19 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %18, i64 0, i32 0
  %20 = load i32, i32* %19, align 4, !tbaa !190
  %21 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %18, i64 0, i32 1
  %22 = load i32, i32* %21, align 4, !tbaa !187
  %23 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %18, i64 0, i32 2
  %24 = load i32, i32* %23, align 4, !tbaa !191
  %25 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %18, i64 1, i32 0
  %26 = load i32, i32* %25, align 4, !tbaa !190
  %27 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %18, i64 1, i32 1
  %28 = load i32, i32* %27, align 4, !tbaa !187
  %29 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %18, i64 1, i32 2
  %30 = load i32, i32* %29, align 4, !tbaa !191
  %31 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %output.buffer, i64 0, i32 2
  %32 = load i8*, i8** %31, align 8, !tbaa !181
  %33 = bitcast i32* %0 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %33) #10
  %34 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %output.buffer, i64 0, i32 4, i32 0
  %35 = call i8* @memcpy(i8* nonnull %33, i8* nonnull %34, i64 4) #12
  %36 = load i32, i32* %0, align 4, !tbaa !76
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %33) #10
  %37 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %output.buffer, i64 0, i32 3
  %38 = load i64, i64* %37, align 8, !tbaa !285
  %39 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %output.buffer, i64 0, i32 5
  %40 = load i32, i32* %39, align 4, !tbaa !184
  %41 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %output.buffer, i64 0, i32 6
  %42 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %41, align 8, !tbaa !185
  %43 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %42, i64 0, i32 0
  %44 = load i32, i32* %43, align 4, !tbaa !190
  %45 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %42, i64 0, i32 1
  %46 = load i32, i32* %45, align 4, !tbaa !187
  %47 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %42, i64 0, i32 2
  %48 = load i32, i32* %47, align 4, !tbaa !191
  %49 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %42, i64 1, i32 0
  %50 = load i32, i32* %49, align 4, !tbaa !190
  %51 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %42, i64 1, i32 1
  %52 = load i32, i32* %51, align 4, !tbaa !187
  %53 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %42, i64 1, i32 2
  %54 = load i32, i32* %53, align 4, !tbaa !191
  %55 = icmp slt i32 %46, 64
  %56 = select i1 %55, i32 %46, i32 64
  %57 = icmp sgt i32 %46, 64
  %58 = select i1 %57, i32 %46, i32 64
  %59 = add nuw nsw i32 %58, 1
  %60 = and i32 %59, 2147483616
  %61 = add i32 %56, -34
  %a2 = add i32 %61, %60
  %62 = icmp sgt i32 %46, %a2
  %63 = select i1 %62, i32 %a2, i32 %46
  %a1 = add nsw i32 %63, %44
  %64 = add nsw i32 %22, %20
  %b3 = add nsw i32 %64, -1
  %65 = icmp sgt i32 %b3, %a1
  %a0 = select i1 %65, i32 %a1, i32 %b3
  %66 = icmp sgt i32 %a0, %20
  %67 = select i1 %66, i32 %a0, i32 %20
  %a6 = add nsw i32 %56, %44
  %b8 = add nsw i32 %64, 64
  %68 = icmp sgt i32 %b8, %a6
  %69 = select i1 %68, i32 %a6, i32 %b8
  %a5 = add nsw i32 %69, -65
  %70 = icmp sgt i32 %a5, %20
  %71 = select i1 %70, i32 %a5, i32 %20
  %a12 = add nsw i32 %52, %50
  %72 = add nsw i32 %28, %26
  %b14 = add nsw i32 %72, -1
  %73 = icmp sgt i32 %b14, %a12
  %a11 = select i1 %73, i32 %a12, i32 %b14
  %74 = icmp sgt i32 %a11, %26
  %75 = select i1 %74, i32 %a11, i32 %26
  %76 = icmp slt i32 %52, 36
  %77 = select i1 %76, i32 %52, i32 36
  %a14 = add nsw i32 %77, %50
  %b16 = add nsw i32 %72, 36
  %78 = icmp sgt i32 %b16, %a14
  %79 = select i1 %78, i32 %a14, i32 %b16
  %a13 = add nsw i32 %79, -37
  %80 = icmp sgt i32 %a13, %26
  %81 = select i1 %80, i32 %a13, i32 %26
  %82 = load i8*, i8** %7, align 8, !tbaa !181
  %83 = icmp eq i8* %82, null
  br i1 %83, label %_halide_buffer_is_bounds_query.exit, label %after_bb

_halide_buffer_is_bounds_query.exit:              ; preds = %"assert succeeded2"
  %84 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %input.buffer, i64 0, i32 0
  %85 = load i64, i64* %84, align 8, !tbaa !183
  %86 = icmp eq i64 %85, 0
  br i1 %86, label %_halide_buffer_init.exit, label %after_bb

after_bb:                                         ; preds = %_halide_buffer_init.exit, %_halide_buffer_is_bounds_query.exit, %"assert succeeded2"
  %87 = load i8*, i8** %31, align 8, !tbaa !181
  %88 = icmp eq i8* %87, null
  br i1 %88, label %_halide_buffer_is_bounds_query.exit43, label %after_bb3

_halide_buffer_is_bounds_query.exit43:            ; preds = %after_bb
  %89 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %output.buffer, i64 0, i32 0
  %90 = load i64, i64* %89, align 8, !tbaa !183
  %91 = icmp eq i64 %90, 0
  br i1 %91, label %_halide_buffer_init.exit47, label %after_bb3

_halide_buffer_init.exit:                         ; preds = %_halide_buffer_is_bounds_query.exit
  %input.extent.0.required.s = sub nsw i32 %67, %71
  %92 = bitcast %struct.halide_dimension_t** %17 to i8**
  %93 = load i8*, i8** %92, align 8, !tbaa !185
  %94 = add nsw i32 %input.extent.0.required.s, 1
  %input.extent.1.required.s = add i32 %75, 1
  %95 = sub i32 %input.extent.1.required.s, %81
  %96 = getelementptr inbounds [8 x i32], [8 x i32]* %4, i64 0, i64 0
  store i32 %71, i32* %96, align 4
  %97 = getelementptr inbounds [8 x i32], [8 x i32]* %4, i64 0, i64 1
  store i32 %94, i32* %97, align 4
  %98 = getelementptr inbounds [8 x i32], [8 x i32]* %4, i64 0, i64 2
  store i32 1, i32* %98, align 4
  %99 = getelementptr inbounds [8 x i32], [8 x i32]* %4, i64 0, i64 3
  store i32 0, i32* %99, align 4
  %100 = getelementptr inbounds [8 x i32], [8 x i32]* %4, i64 0, i64 4
  store i32 %81, i32* %100, align 4
  %101 = getelementptr inbounds [8 x i32], [8 x i32]* %4, i64 0, i64 5
  store i32 %95, i32* %101, align 4
  %102 = getelementptr inbounds [8 x i32], [8 x i32]* %4, i64 0, i64 6
  store i32 %94, i32* %102, align 4
  %103 = getelementptr inbounds [8 x i32], [8 x i32]* %4, i64 0, i64 7
  store i32 0, i32* %103, align 4
  %104 = bitcast %struct.halide_buffer_t* %input.buffer to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %104, i8 0, i64 24, i1 false)
  store i8 1, i8* %10, align 8, !tbaa !368
  %105 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %input.buffer, i64 0, i32 4, i32 1
  store i8 8, i8* %105, align 1, !tbaa !369
  %106 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %input.buffer, i64 0, i32 4, i32 2
  store i16 1, i16* %106, align 2, !tbaa !370
  store i32 2, i32* %15, align 4, !tbaa !184
  %107 = bitcast [8 x i32]* %4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %93, i8* nonnull align 4 dereferenceable(16) %107, i64 16, i1 false) #10, !tbaa.struct !186
  %108 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %17, align 8, !tbaa !185
  %109 = getelementptr inbounds [8 x i32], [8 x i32]* %4, i64 0, i64 4
  %110 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %108, i64 1
  %111 = bitcast %struct.halide_dimension_t* %110 to i8*
  %112 = bitcast i32* %109 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %111, i8* nonnull align 4 dereferenceable(16) %112, i64 16, i1 false) #10, !tbaa.struct !186
  store i64 0, i64* %13, align 8, !tbaa !285
  br label %after_bb

after_bb3:                                        ; preds = %_halide_buffer_init.exit47, %_halide_buffer_is_bounds_query.exit43, %after_bb
  %113 = load i8*, i8** %7, align 8, !tbaa !181
  %114 = icmp eq i8* %113, null
  br i1 %114, label %115, label %_halide_buffer_is_bounds_query.exit44

115:                                              ; preds = %after_bb3
  %116 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %input.buffer, i64 0, i32 0
  %117 = load i64, i64* %116, align 8, !tbaa !183
  %118 = icmp eq i64 %117, 0
  br label %_halide_buffer_is_bounds_query.exit44

_halide_buffer_is_bounds_query.exit44:            ; preds = %115, %after_bb3
  %119 = phi i1 [ false, %after_bb3 ], [ %118, %115 ]
  %120 = load i8*, i8** %31, align 8, !tbaa !181
  %121 = icmp eq i8* %120, null
  br i1 %121, label %122, label %_halide_buffer_is_bounds_query.exit45

122:                                              ; preds = %_halide_buffer_is_bounds_query.exit44
  %123 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %output.buffer, i64 0, i32 0
  %124 = load i64, i64* %123, align 8, !tbaa !183
  %125 = icmp eq i64 %124, 0
  br label %_halide_buffer_is_bounds_query.exit45

_halide_buffer_is_bounds_query.exit45:            ; preds = %122, %_halide_buffer_is_bounds_query.exit44
  %126 = phi i1 [ false, %_halide_buffer_is_bounds_query.exit44 ], [ %125, %122 ]
  %127 = or i1 %119, %126
  br i1 %127, label %destructor_block, label %then_bb7

_halide_buffer_init.exit47:                       ; preds = %_halide_buffer_is_bounds_query.exit43
  %128 = bitcast %struct.halide_dimension_t** %41 to i8**
  %129 = load i8*, i8** %128, align 8, !tbaa !185
  %130 = add nsw i32 %a6, -64
  %131 = add nsw i32 %a14, -36
  %132 = icmp sgt i32 %52, 36
  %133 = select i1 %132, i32 %52, i32 36
  %134 = getelementptr inbounds [8 x i32], [8 x i32]* %3, i64 0, i64 0
  store i32 %130, i32* %134, align 4
  %135 = getelementptr inbounds [8 x i32], [8 x i32]* %3, i64 0, i64 1
  store i32 %58, i32* %135, align 4
  %136 = getelementptr inbounds [8 x i32], [8 x i32]* %3, i64 0, i64 2
  store i32 1, i32* %136, align 4
  %137 = getelementptr inbounds [8 x i32], [8 x i32]* %3, i64 0, i64 3
  store i32 0, i32* %137, align 4
  %138 = getelementptr inbounds [8 x i32], [8 x i32]* %3, i64 0, i64 4
  store i32 %131, i32* %138, align 4
  %139 = getelementptr inbounds [8 x i32], [8 x i32]* %3, i64 0, i64 5
  store i32 %133, i32* %139, align 4
  %140 = getelementptr inbounds [8 x i32], [8 x i32]* %3, i64 0, i64 6
  store i32 %58, i32* %140, align 4
  %141 = getelementptr inbounds [8 x i32], [8 x i32]* %3, i64 0, i64 7
  store i32 0, i32* %141, align 4
  %142 = bitcast %struct.halide_buffer_t* %output.buffer to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %142, i8 0, i64 24, i1 false)
  store i8 1, i8* %34, align 8, !tbaa !368
  %143 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %output.buffer, i64 0, i32 4, i32 1
  store i8 8, i8* %143, align 1, !tbaa !369
  %144 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %output.buffer, i64 0, i32 4, i32 2
  store i16 1, i16* %144, align 2, !tbaa !370
  store i32 2, i32* %39, align 4, !tbaa !184
  %145 = bitcast [8 x i32]* %3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %129, i8* nonnull align 4 dereferenceable(16) %145, i64 16, i1 false) #10, !tbaa.struct !186
  %146 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %41, align 8, !tbaa !185
  %147 = getelementptr inbounds [8 x i32], [8 x i32]* %3, i64 0, i64 4
  %148 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %146, i64 1
  %149 = bitcast %struct.halide_dimension_t* %148 to i8*
  %150 = bitcast i32* %147 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %149, i8* nonnull align 4 dereferenceable(16) %150, i64 16, i1 false) #10, !tbaa.struct !186
  store i64 0, i64* %37, align 8, !tbaa !285
  br label %after_bb3

then_bb7:                                         ; preds = %_halide_buffer_is_bounds_query.exit45
  %151 = icmp ne i32 %12, 67585
  %152 = zext i1 %151 to i64
  %.not34 = icmp eq i32 %16, 2
  %153 = select i1 %.not34, i64 0, i64 2
  %.not35 = icmp eq i32 %36, 67585
  %154 = select i1 %.not35, i64 0, i64 4
  %.not36 = icmp eq i32 %40, 2
  %155 = select i1 %.not36, i64 0, i64 8
  %.not37 = icmp slt i32 %67, %64
  %156 = select i1 %.not37, i64 0, i64 16
  %157 = lshr i32 %22, 26
  %158 = and i32 %157, 32
  %159 = zext i32 %158 to i64
  %.not38 = icmp slt i32 %75, %72
  %160 = select i1 %.not38, i64 0, i64 64
  %161 = lshr i32 %28, 24
  %162 = and i32 %161, 128
  %163 = zext i32 %162 to i64
  %164 = select i1 %55, i64 256, i64 0
  %165 = select i1 %76, i64 512, i64 0
  %.not39 = icmp eq i32 %24, 1
  %166 = select i1 %.not39, i64 0, i64 1024
  %.not40 = icmp eq i32 %48, 1
  %167 = select i1 %.not40, i64 0, i64 2048
  %168 = or i64 %153, %152
  %169 = or i64 %168, %159
  %170 = or i64 %169, %166
  %171 = or i64 %170, %163
  %172 = or i64 %171, %154
  %173 = or i64 %172, %155
  %174 = or i64 %173, %164
  %175 = or i64 %174, %167
  %176 = or i64 %175, %165
  %177 = or i64 %176, %160
  %178 = or i64 %177, %156
  %179 = or i64 %178, -9223372036854775808
  %180 = call i64 @llvm.cttz.i64(i64 %179, i1 true), !range !371
  %181 = trunc i64 %180 to i32
  switch i32 %181, label %no_errors_bb [
    i32 0, label %assert_failed
    i32 1, label %assert_failed9
    i32 2, label %assert_failed10
    i32 3, label %assert_failed11
    i32 4, label %assert_failed12
    i32 5, label %assert_failed13
    i32 6, label %assert_failed14
    i32 7, label %assert_failed15
    i32 8, label %assert_failed16
    i32 9, label %assert_failed17
    i32 10, label %assert_failed18
    i32 11, label %assert_failed19
  ], !prof !372

no_errors_bb:                                     ; preds = %then_bb7
  %182 = sext i32 %28 to i64
  %183 = sext i32 %22 to i64
  %input.total_extent.1 = mul nsw i64 %182, %183
  %184 = sext i32 %52 to i64
  %185 = sext i32 %46 to i64
  %output.total_extent.1 = mul nsw i64 %184, %185
  %input.extent.0.lobit = lshr i32 %22, 31
  %186 = zext i32 %input.extent.0.lobit to i64
  %187 = sext i32 %30 to i64
  %x1 = mul nsw i64 %187, %182
  %188 = call i64 @llvm.abs.i64(i64 %x1, i1 true)
  %189 = icmp ugt i64 %188, 2147483647
  %190 = select i1 %189, i64 2, i64 0
  %191 = icmp sgt i64 %input.total_extent.1, 2147483647
  %192 = select i1 %191, i64 4, i64 0
  %193 = lshr i32 %46, 28
  %194 = and i32 %193, 8
  %195 = zext i32 %194 to i64
  %196 = sext i32 %54 to i64
  %x2 = mul nsw i64 %196, %184
  %197 = call i64 @llvm.abs.i64(i64 %x2, i1 true)
  %198 = icmp ugt i64 %197, 2147483647
  %199 = select i1 %198, i64 16, i64 0
  %200 = icmp sgt i64 %output.total_extent.1, 2147483647
  %201 = select i1 %200, i64 32, i64 0
  %202 = shl i64 %14, 5
  %203 = and i64 %202, 64
  %204 = shl i64 %38, 6
  %205 = and i64 %204, 128
  %206 = icmp eq i8* %8, null
  %207 = icmp eq i8* %32, null
  %208 = select i1 %207, i64 512, i64 0
  %209 = select i1 %206, i64 -9223372036854775552, i64 -9223372036854775808
  %210 = or i64 %209, %203
  %211 = or i64 %210, %186
  %212 = or i64 %211, %192
  %213 = or i64 %212, %208
  %214 = or i64 %213, %190
  %215 = or i64 %214, %205
  %216 = or i64 %215, %195
  %217 = or i64 %216, %201
  %218 = or i64 %217, %199
  %219 = call i64 @llvm.cttz.i64(i64 %218, i1 true), !range !371
  %220 = trunc i64 %219 to i32
  switch i32 %220, label %"produce output" [
    i32 0, label %assert_failed21
    i32 1, label %assert_failed22
    i32 2, label %assert_failed23
    i32 3, label %assert_failed24
    i32 4, label %assert_failed25
    i32 5, label %assert_failed26
    i32 6, label %assert_failed27
    i32 7, label %assert_failed28
    i32 8, label %assert_failed29
    i32 9, label %assert_failed30
  ], !prof !373

assert_failed:                                    ; preds = %then_bb7
  %221 = call i32 @halide_error_bad_type(i8* null, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @str.204, i64 0, i64 0), i32 %12, i32 67585) #10
  ret i32 %221

assert_failed9:                                   ; preds = %then_bb7
  %222 = call i32 @halide_error_bad_dimensions(i8* null, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @str.204, i64 0, i64 0), i32 %16, i32 2) #10
  ret i32 %222

assert_failed10:                                  ; preds = %then_bb7
  %223 = call i32 @halide_error_bad_type(i8* null, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @str.205, i64 0, i64 0), i32 %36, i32 67585) #10
  ret i32 %223

assert_failed11:                                  ; preds = %then_bb7
  %224 = call i32 @halide_error_bad_dimensions(i8* null, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @str.205, i64 0, i64 0), i32 %40, i32 2) #10
  ret i32 %224

assert_failed12:                                  ; preds = %then_bb7
  %225 = call i32 @halide_error_access_out_of_bounds(i8* null, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @str.204, i64 0, i64 0), i32 0, i32 %71, i32 %67, i32 %20, i32 %b3) #10
  ret i32 %225

assert_failed13:                                  ; preds = %then_bb7
  %226 = call i32 @halide_error_buffer_extents_negative(i8* null, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @str.204, i64 0, i64 0), i32 0, i32 %22) #10
  ret i32 %226

assert_failed14:                                  ; preds = %then_bb7
  %227 = call i32 @halide_error_access_out_of_bounds(i8* null, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @str.204, i64 0, i64 0), i32 1, i32 %81, i32 %75, i32 %26, i32 %b14) #10
  ret i32 %227

assert_failed15:                                  ; preds = %then_bb7
  %228 = call i32 @halide_error_buffer_extents_negative(i8* null, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @str.204, i64 0, i64 0), i32 1, i32 %28) #10
  ret i32 %228

assert_failed16:                                  ; preds = %then_bb7
  %229 = add nsw i32 %a6, -64
  %230 = add i32 %46, -1
  %231 = add i32 %230, %44
  %232 = call i32 @halide_error_access_out_of_bounds(i8* null, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @str.205, i64 0, i64 0), i32 0, i32 %229, i32 %231, i32 %44, i32 %231) #10
  ret i32 %232

assert_failed17:                                  ; preds = %then_bb7
  %233 = add nsw i32 %a14, -36
  %234 = add nsw i32 %a12, -1
  %235 = call i32 @halide_error_access_out_of_bounds(i8* null, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @str.205, i64 0, i64 0), i32 1, i32 %233, i32 %234, i32 %50, i32 %234) #10
  ret i32 %235

assert_failed18:                                  ; preds = %then_bb7
  %236 = call i32 @halide_error_constraint_violated(i8* null, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @str.206, i64 0, i64 0), i32 %24, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.207, i64 0, i64 0), i32 1) #10
  ret i32 %236

assert_failed19:                                  ; preds = %then_bb7
  %237 = call i32 @halide_error_constraint_violated(i8* null, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @str.208, i64 0, i64 0), i32 %48, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.207, i64 0, i64 0), i32 1) #10
  ret i32 %237

assert_failed21:                                  ; preds = %no_errors_bb
  %238 = call i32 @halide_error_buffer_allocation_too_large(i8* null, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @str.203, i64 0, i64 0), i64 %183, i64 2147483647) #10
  ret i32 %238

assert_failed22:                                  ; preds = %no_errors_bb
  %239 = call i32 @halide_error_buffer_allocation_too_large(i8* null, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @str.203, i64 0, i64 0), i64 %188, i64 2147483647) #10
  ret i32 %239

assert_failed23:                                  ; preds = %no_errors_bb
  %240 = call i32 @halide_error_buffer_extents_too_large(i8* null, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @str.203, i64 0, i64 0), i64 %input.total_extent.1, i64 2147483647) #10
  ret i32 %240

assert_failed24:                                  ; preds = %no_errors_bb
  %241 = call i32 @halide_error_buffer_allocation_too_large(i8* null, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @str, i64 0, i64 0), i64 %185, i64 2147483647) #10
  ret i32 %241

assert_failed25:                                  ; preds = %no_errors_bb
  %242 = call i32 @halide_error_buffer_allocation_too_large(i8* null, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @str, i64 0, i64 0), i64 %197, i64 2147483647) #10
  ret i32 %242

assert_failed26:                                  ; preds = %no_errors_bb
  %243 = call i32 @halide_error_buffer_extents_too_large(i8* null, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @str, i64 0, i64 0), i64 %output.total_extent.1, i64 2147483647) #10
  ret i32 %243

assert_failed27:                                  ; preds = %no_errors_bb
  %244 = call i32 @halide_error_device_dirty_with_no_device_support(i8* null, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @str.204, i64 0, i64 0)) #10
  ret i32 %244

assert_failed28:                                  ; preds = %no_errors_bb
  %245 = call i32 @halide_error_device_dirty_with_no_device_support(i8* null, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @str.205, i64 0, i64 0)) #10
  ret i32 %245

assert_failed29:                                  ; preds = %no_errors_bb
  %246 = call i32 @halide_error_host_is_null(i8* null, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @str.204, i64 0, i64 0)) #10
  ret i32 %246

assert_failed30:                                  ; preds = %no_errors_bb
  %247 = call i32 @halide_error_host_is_null(i8* null, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @str.205, i64 0, i64 0)) #10
  ret i32 %247

"produce output":                                 ; preds = %no_errors_bb
  %t397 = mul nsw i32 %54, %50
  %248 = add nsw i32 %46, -1
  %t398 = and i32 %248, -128
  %b31 = add nsw i32 %46, 1
  %b35 = and i32 %b31, -32
  %249 = add nsw i32 %46, 33
  %b28 = ashr i32 %249, 5
  %250 = sub nsw i32 %20, %44
  %a27 = ashr i32 %250, 5
  %251 = icmp sgt i32 %a27, -1
  %252 = select i1 %251, i32 %a27, i32 -1
  %a26 = add nsw i32 %252, 1
  %253 = icmp sgt i32 %b28, %a26
  %b30 = select i1 %253, i32 %a26, i32 %b28
  %b34 = sub nsw i32 %64, %44
  %254 = and i32 %46, 63
  %255 = icmp ne i32 %254, 0
  %a31 = add nsw i32 %46, -30
  %256 = icmp sgt i32 %b34, %a31
  %a30 = select i1 %256, i32 %a31, i32 %b34
  %257 = icmp sgt i32 %b34, %b31
  %258 = select i1 %257, i32 %b31, i32 %b34
  %b32 = add nsw i32 %258, -31
  %259 = icmp sgt i32 %b32, %a30
  %a29 = select i1 %259, i32 %a30, i32 %b32
  %.not41 = icmp slt i32 %46, %a29
  %260 = select i1 %.not41, i32 %b31, i32 %a29
  %261 = ashr i32 %260, 5
  %a28 = add nsw i32 %261, 1
  %.not42 = icmp slt i32 %261, %b30
  %t386 = select i1 %.not42, i32 %b30, i32 %a28
  %a33 = or i32 %t398, 112
  %262 = icmp sgt i32 %a33, %b35
  %t379 = select i1 %262, i32 %a33, i32 %b35
  %263 = add nsw i32 %52, 35
  %264 = ashr i32 %263, 31
  %265 = xor i32 %264, %263
  %266 = zext i32 %265 to i64
  %267 = mul nuw nsw i64 %266, 954437177
  %268 = lshr i64 %267, 35
  %269 = trunc i64 %268 to i32
  %t377 = xor i32 %264, %269
  %270 = add nsw i32 %46, 127
  %t390 = ashr i32 %270, 7
  %t391 = ashr i32 %46, 6
  %t394 = sub nsw i32 %46, %t397
  %t392 = sub nsw i32 0, %t397
  %271 = getelementptr inbounds %closure_t, %closure_t* %2, i64 0, i32 0
  store i32 %28, i32* %271, align 8
  %272 = getelementptr inbounds %closure_t, %closure_t* %2, i64 0, i32 1
  store i32 %20, i32* %272, align 4
  %273 = getelementptr inbounds %closure_t, %closure_t* %2, i64 0, i32 2
  store i32 %26, i32* %273, align 8
  %274 = getelementptr inbounds %closure_t, %closure_t* %2, i64 0, i32 3
  store i32 %30, i32* %274, align 4
  %275 = getelementptr inbounds %closure_t, %closure_t* %2, i64 0, i32 4
  store i32 %46, i32* %275, align 8
  %276 = getelementptr inbounds %closure_t, %closure_t* %2, i64 0, i32 5
  store i32 %52, i32* %276, align 4
  %277 = getelementptr inbounds %closure_t, %closure_t* %2, i64 0, i32 6
  store i32 %44, i32* %277, align 8
  %278 = getelementptr inbounds %closure_t, %closure_t* %2, i64 0, i32 7
  store i32 %50, i32* %278, align 4
  %279 = getelementptr inbounds %closure_t, %closure_t* %2, i64 0, i32 8
  store i32 %54, i32* %279, align 8
  %280 = getelementptr inbounds %closure_t, %closure_t* %2, i64 0, i32 9
  store i32 %t379, i32* %280, align 4
  %281 = getelementptr inbounds %closure_t, %closure_t* %2, i64 0, i32 10
  store i32 %t386, i32* %281, align 8
  %282 = getelementptr inbounds %closure_t, %closure_t* %2, i64 0, i32 11
  store i32 %t390, i32* %282, align 4
  %283 = getelementptr inbounds %closure_t, %closure_t* %2, i64 0, i32 12
  store i32 %t391, i32* %283, align 8
  %284 = getelementptr inbounds %closure_t, %closure_t* %2, i64 0, i32 13
  store i32 %t392, i32* %284, align 4
  %285 = getelementptr inbounds %closure_t, %closure_t* %2, i64 0, i32 14
  store i1 %255, i1* %285, align 8
  %286 = getelementptr inbounds %closure_t, %closure_t* %2, i64 0, i32 15
  store i32 %t394, i32* %286, align 4
  %287 = getelementptr inbounds %closure_t, %closure_t* %2, i64 0, i32 16
  store i32 %64, i32* %287, align 8
  %288 = getelementptr inbounds %closure_t, %closure_t* %2, i64 0, i32 17
  store i32 %72, i32* %288, align 4
  %289 = getelementptr inbounds %closure_t, %closure_t* %2, i64 0, i32 18
  store i32 %t398, i32* %289, align 8
  %290 = getelementptr inbounds %closure_t, %closure_t* %2, i64 0, i32 19
  store i32 %b35, i32* %290, align 4
  %291 = getelementptr inbounds %closure_t, %closure_t* %2, i64 0, i32 20
  store i32 %b28, i32* %291, align 8
  %292 = getelementptr inbounds %closure_t, %closure_t* %2, i64 0, i32 21
  store i32 %b30, i32* %292, align 4
  %293 = getelementptr inbounds %closure_t, %closure_t* %2, i64 0, i32 22
  store i8* %8, i8** %293, align 8
  %294 = getelementptr inbounds %closure_t, %closure_t* %2, i64 0, i32 23
  store %struct.halide_buffer_t* %input.buffer, %struct.halide_buffer_t** %294, align 8
  %295 = getelementptr inbounds %closure_t, %closure_t* %2, i64 0, i32 24
  store i8* %32, i8** %295, align 8
  %296 = getelementptr inbounds %closure_t, %closure_t* %2, i64 0, i32 25
  store %struct.halide_buffer_t* %output.buffer, %struct.halide_buffer_t** %296, align 8
  %297 = bitcast %closure_t* %2 to i8*
  %298 = call i32 @halide_do_par_for(i8* null, i32 (i8*, i32, i8*)* nonnull @sobel3x3_batch_0058_sample_0015.par_for.output.s0.y.y, i32 0, i32 %t377, i8* nonnull %297)
  ret i32 %298
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.cttz.i64(i64, i1 immarg) #7

; Function Attrs: nounwind
define internal i32 @sobel3x3_batch_0058_sample_0015.par_for.output.s0.y.y(i8* %__user_context, i32 %output.s0.y.y, i8* noalias readonly %closure) #9 {
entry:
  %sobel_x54 = alloca [144 x i16], align 32
  %sobel_y.pseudostack_slot = alloca %struct.halide_pseudostack_slot_t, align 8
  %.fca.0.gep46 = getelementptr inbounds %struct.halide_pseudostack_slot_t, %struct.halide_pseudostack_slot_t* %sobel_y.pseudostack_slot, i64 0, i32 0
  %.fca.1.gep47 = getelementptr inbounds %struct.halide_pseudostack_slot_t, %struct.halide_pseudostack_slot_t* %sobel_y.pseudostack_slot, i64 0, i32 1
  %0 = bitcast i8* %closure to i32*
  %1 = bitcast %struct.halide_pseudostack_slot_t* %sobel_y.pseudostack_slot to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %1, i8 0, i64 16, i1 false)
  %b59 = load i32, i32* %0, align 4
  %2 = getelementptr inbounds i8, i8* %closure, i64 4
  %3 = bitcast i8* %2 to i32*
  %input.min.0 = load i32, i32* %3, align 4
  %4 = getelementptr inbounds i8, i8* %closure, i64 8
  %5 = bitcast i8* %4 to i32*
  %a64 = load i32, i32* %5, align 4
  %6 = getelementptr inbounds i8, i8* %closure, i64 12
  %7 = bitcast i8* %6 to i32*
  %input.stride.1 = load i32, i32* %7, align 4
  %8 = getelementptr inbounds i8, i8* %closure, i64 16
  %9 = bitcast i8* %8 to i32*
  %b77 = load i32, i32* %9, align 4
  %10 = getelementptr inbounds i8, i8* %closure, i64 20
  %11 = bitcast i8* %10 to i32*
  %output.extent.1 = load i32, i32* %11, align 4
  %12 = getelementptr inbounds i8, i8* %closure, i64 24
  %13 = bitcast i8* %12 to i32*
  %output.min.0 = load i32, i32* %13, align 4
  %14 = getelementptr inbounds i8, i8* %closure, i64 28
  %15 = bitcast i8* %14 to i32*
  %output.min.1 = load i32, i32* %15, align 4
  %16 = getelementptr inbounds i8, i8* %closure, i64 32
  %17 = bitcast i8* %16 to i32*
  %output.stride.1 = load i32, i32* %17, align 4
  %18 = getelementptr inbounds i8, i8* %closure, i64 36
  %19 = bitcast i8* %18 to i32*
  %a42 = load i32, i32* %19, align 4
  %20 = getelementptr inbounds i8, i8* %closure, i64 40
  %21 = bitcast i8* %20 to i32*
  %t386 = load i32, i32* %21, align 4
  %22 = getelementptr inbounds i8, i8* %closure, i64 44
  %23 = bitcast i8* %22 to i32*
  %t390 = load i32, i32* %23, align 4
  %24 = getelementptr inbounds i8, i8* %closure, i64 48
  %25 = bitcast i8* %24 to i32*
  %t391 = load i32, i32* %25, align 4
  %26 = getelementptr inbounds i8, i8* %closure, i64 52
  %27 = bitcast i8* %26 to i32*
  %t392 = load i32, i32* %27, align 4
  %28 = getelementptr inbounds i8, i8* %closure, i64 56
  %29 = bitcast i8* %28 to i1*
  %t393 = load i1, i1* %29, align 1
  %30 = getelementptr inbounds i8, i8* %closure, i64 60
  %31 = bitcast i8* %30 to i32*
  %t394 = load i32, i32* %31, align 4
  %32 = getelementptr inbounds i8, i8* %closure, i64 64
  %33 = bitcast i8* %32 to i32*
  %t395 = load i32, i32* %33, align 4
  %34 = getelementptr inbounds i8, i8* %closure, i64 68
  %35 = bitcast i8* %34 to i32*
  %a62 = load i32, i32* %35, align 4
  %36 = getelementptr inbounds i8, i8* %closure, i64 72
  %37 = bitcast i8* %36 to i32*
  %a81 = load i32, i32* %37, align 4
  %38 = getelementptr inbounds i8, i8* %closure, i64 76
  %39 = bitcast i8* %38 to i32*
  %a38 = load i32, i32* %39, align 4
  %40 = getelementptr inbounds i8, i8* %closure, i64 80
  %41 = bitcast i8* %40 to i32*
  %t401 = load i32, i32* %41, align 4
  %42 = getelementptr inbounds i8, i8* %closure, i64 84
  %43 = bitcast i8* %42 to i32*
  %t402 = load i32, i32* %43, align 4
  %44 = getelementptr inbounds i8, i8* %closure, i64 88
  %45 = bitcast i8* %44 to i8**
  %input = load i8*, i8** %45, align 8
  %46 = getelementptr inbounds i8, i8* %closure, i64 104
  %47 = bitcast i8* %46 to i8**
  %output = load i8*, i8** %47, align 8
  %a34 = mul nsw i32 %output.s0.y.y, 36
  %b36 = add nsw i32 %output.extent.1, -36
  %48 = icmp sgt i32 %b36, %a34
  %output.s0.y.yi.base.s = select i1 %48, i32 %a34, i32 %b36
  %49 = icmp sgt i32 %a38, -32
  %t487 = select i1 %49, i32 %a38, i32 -32
  %50 = add nsw i32 %t487, 32
  %51 = icmp ult i32 %50, 134217728
  %52 = zext i32 %50 to i64
  %53 = shl nuw nsw i64 %52, 4
  br i1 %51, label %pseudostack_alloc.exit, label %call_destructor.exit73, !prof !374

pseudostack_alloc.exit:                           ; preds = %entry
  %54 = or i64 %53, 3
  %55 = tail call i8* @halide_malloc(i8* %__user_context, i64 %54) #12
  %56 = icmp sgt i32 %a42, -32
  %t488 = select i1 %56, i32 %a42, i32 -32
  %57 = add nsw i32 %t488, 32
  %58 = icmp ult i32 %57, 67108864
  %59 = zext i32 %57 to i64
  %60 = shl nuw nsw i64 %59, 5
  br i1 %58, label %pseudostack_alloc.exit75, label %"assert failed1", !prof !374

destructor_block:                                 ; preds = %"consume input_16"
  %61 = tail call i32 @halide_error_buffer_allocation_too_large(i8* %__user_context, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @str.211, i64 0, i64 0), i64 %332, i64 2147483647) #10
  br label %67

destructor_block.thread143:                       ; preds = %"end for output.s0.y.yi.yii"
  %62 = getelementptr inbounds %struct.halide_pseudostack_slot_t, %struct.halide_pseudostack_slot_t* %sobel_y.pseudostack_slot, i64 0, i32 1
  store i64 0, i64* %62, align 8, !tbaa !375
  %63 = getelementptr inbounds %struct.halide_pseudostack_slot_t, %struct.halide_pseudostack_slot_t* %sobel_y.pseudostack_slot, i64 0, i32 0
  %64 = load i8*, i8** %63, align 8, !tbaa !377
  %65 = icmp eq i8* %64, null
  br i1 %65, label %pseudostack_free.exit, label %66

66:                                               ; preds = %destructor_block.thread143
  call void @halide_free(i8* %__user_context, i8* nonnull %64) #12
  br label %pseudostack_free.exit

pseudostack_free.exit:                            ; preds = %66, %destructor_block.thread143
  store i8* null, i8** %63, align 8, !tbaa !377
  br label %67

67:                                               ; preds = %pseudostack_free.exit, %destructor_block
  %.ph150 = phi i32 [ 0, %pseudostack_free.exit ], [ %61, %destructor_block ]
  %68 = icmp eq i8* %76, null
  br i1 %68, label %pseudostack_free.exit77, label %69

69:                                               ; preds = %67
  call void @halide_free(i8* %__user_context, i8* nonnull %76) #12
  br label %pseudostack_free.exit77

call_destructor.exit73:                           ; preds = %entry
  %70 = tail call i32 @halide_error_buffer_allocation_too_large(i8* %__user_context, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @str.209, i64 0, i64 0), i64 %53, i64 2147483647) #10
  br label %call_destructor.exit74

pseudostack_free.exit77:                          ; preds = %"assert failed1", %69, %67
  %.ph = phi i32 [ %74, %"assert failed1" ], [ %.ph150, %67 ], [ %.ph150, %69 ]
  %71 = icmp eq i8* %55, null
  br i1 %71, label %call_destructor.exit74, label %72

72:                                               ; preds = %pseudostack_free.exit77
  call void @halide_free(i8* %__user_context, i8* nonnull %55) #12
  br label %call_destructor.exit74

call_destructor.exit74:                           ; preds = %72, %pseudostack_free.exit77, %call_destructor.exit73
  %73 = phi i32 [ %70, %call_destructor.exit73 ], [ %.ph, %pseudostack_free.exit77 ], [ %.ph, %72 ]
  ret i32 %73

"assert failed1":                                 ; preds = %pseudostack_alloc.exit
  %74 = tail call i32 @halide_error_buffer_allocation_too_large(i8* %__user_context, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @str.210, i64 0, i64 0), i64 %60, i64 2147483647) #10
  br label %pseudostack_free.exit77

pseudostack_alloc.exit75:                         ; preds = %pseudostack_alloc.exit
  %75 = or i64 %60, 6
  %76 = tail call i8* @halide_malloc(i8* %__user_context, i64 %75) #12
  %input_16 = bitcast i8* %76 to i16*
  %77 = sub i32 %output.min.1, %a64
  %t404 = add nsw i32 %77, %output.s0.y.yi.base.s
  %t405 = add i32 %output.s0.y.yi.base.s, %output.min.1
  %78 = add i32 %t405, 15
  %79 = add nsw i32 %a38, 32
  %80 = icmp sgt i32 %t401, 0
  %81 = add i32 %output.min.0, -31
  %82 = add nsw i32 %t395, -1
  %83 = insertelement <32 x i32> undef, i32 %82, i32 0
  %84 = shufflevector <32 x i32> %83, <32 x i32> undef, <8 x i32> zeroinitializer
  %85 = insertelement <32 x i32> undef, i32 %input.min.0, i32 0
  %86 = shufflevector <32 x i32> %85, <32 x i32> undef, <8 x i32> zeroinitializer
  br i1 %80, label %"for repeat_edge.s0._1.rebased.us.preheader", label %"consume repeat_edge.thread", !prof !374

"consume repeat_edge.thread":                     ; preds = %pseudostack_alloc.exit75
  %t414258 = add nsw i32 %a42, 32
  br label %"consume repeat_edge.end for input_16.s0.x.x_crit_edge"

"for repeat_edge.s0._1.rebased.us.preheader":     ; preds = %pseudostack_alloc.exit75
  %87 = getelementptr inbounds i8, i8* %55, i64 -30
  br label %"for repeat_edge.s0._1.rebased.us"

"for repeat_edge.s0._1.rebased.us":               ; preds = %"end for repeat_edge.s0._0._0.loopexit.us", %"for repeat_edge.s0._1.rebased.us.preheader"
  %.not.us = phi i1 [ true, %"end for repeat_edge.s0._0._0.loopexit.us" ], [ false, %"for repeat_edge.s0._1.rebased.us.preheader" ]
  %repeat_edge.s0._1.rebased.us = phi i32 [ 1, %"end for repeat_edge.s0._0._0.loopexit.us" ], [ 0, %"for repeat_edge.s0._1.rebased.us.preheader" ]
  %88 = add i32 %78, %repeat_edge.s0._1.rebased.us
  %89 = and i32 %88, 15
  %t407.us = mul nsw i32 %89, %79
  %a44.us = add nsw i32 %t404, %repeat_edge.s0._1.rebased.us
  %90 = icmp sgt i32 %b59, %a44.us
  %a43.us = select i1 %90, i32 %a44.us, i32 %b59
  %91 = icmp sgt i32 %a43.us, 1
  %92 = select i1 %91, i32 %a43.us, i32 1
  %93 = add nsw i32 %92, -1
  %94 = mul nsw i32 %93, %input.stride.1
  %t406.us = sub nsw i32 %94, %input.min.0
  %95 = insertelement <32 x i32> undef, i32 %t406.us, i32 0
  %96 = shufflevector <32 x i32> %95, <32 x i32> undef, <32 x i32> zeroinitializer
  %97 = sext i32 %t407.us to i64
  br label %"for repeat_edge.s0._0._0.us"

"for repeat_edge.s0._0._0.us":                    ; preds = %"for repeat_edge.s0._0._0.us", %"for repeat_edge.s0._1.rebased.us"
  %repeat_edge.s0._0._0.us = phi i32 [ %291, %"for repeat_edge.s0._0._0.us" ], [ 0, %"for repeat_edge.s0._1.rebased.us" ]
  %98 = shl nsw i32 %repeat_edge.s0._0._0.us, 5
  %a45.us = or i32 %98, 30
  %99 = icmp sgt i32 %b77, %a45.us
  %repeat_edge.s0._0._0i.base.s.us = select i1 %99, i32 %a45.us, i32 %b77
  %100 = add i32 %81, %repeat_edge.s0._0._0i.base.s.us
  %101 = insertelement <32 x i32> undef, i32 %100, i32 0
  %102 = shufflevector <32 x i32> %101, <32 x i32> undef, <32 x i32> zeroinitializer
  %a47.us = add nsw <32 x i32> %102, <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %103 = shufflevector <32 x i32> %a47.us, <32 x i32> undef, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %104 = icmp sgt <8 x i32> %84, %103
  %105 = shufflevector <32 x i32> %a47.us, <32 x i32> undef, <8 x i32> <i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %106 = icmp sgt <8 x i32> %84, %105
  %107 = shufflevector <32 x i32> %a47.us, <32 x i32> undef, <8 x i32> <i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23>
  %108 = icmp sgt <8 x i32> %84, %107
  %109 = shufflevector <32 x i32> %a47.us, <32 x i32> undef, <8 x i32> <i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %110 = icmp sgt <8 x i32> %84, %109
  %111 = select <8 x i1> %104, <8 x i32> %103, <8 x i32> %84
  %112 = select <8 x i1> %106, <8 x i32> %105, <8 x i32> %84
  %113 = select <8 x i1> %108, <8 x i32> %107, <8 x i32> %84
  %114 = select <8 x i1> %110, <8 x i32> %109, <8 x i32> %84
  %115 = icmp sgt <8 x i32> %111, %86
  %116 = icmp sgt <8 x i32> %112, %86
  %117 = icmp sgt <8 x i32> %113, %86
  %118 = icmp sgt <8 x i32> %114, %86
  %119 = select <8 x i1> %115, <8 x i32> %111, <8 x i32> %86
  %120 = select <8 x i1> %116, <8 x i32> %112, <8 x i32> %86
  %121 = select <8 x i1> %117, <8 x i32> %113, <8 x i32> %86
  %122 = select <8 x i1> %118, <8 x i32> %114, <8 x i32> %86
  %123 = shufflevector <8 x i32> %119, <8 x i32> %120, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %124 = shufflevector <8 x i32> %121, <8 x i32> %122, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %125 = shufflevector <16 x i32> %123, <16 x i32> %124, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %126 = add nsw <32 x i32> %125, %96
  %127 = extractelement <32 x i32> %126, i32 0
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds i8, i8* %input, i64 %128
  %130 = load i8, i8* %129, align 1, !tbaa !378
  %131 = insertelement <32 x i8> undef, i8 %130, i32 0
  %132 = extractelement <32 x i32> %126, i32 1
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds i8, i8* %input, i64 %133
  %135 = load i8, i8* %134, align 1, !tbaa !378
  %136 = insertelement <32 x i8> %131, i8 %135, i32 1
  %137 = extractelement <32 x i32> %126, i32 2
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds i8, i8* %input, i64 %138
  %140 = load i8, i8* %139, align 1, !tbaa !378
  %141 = insertelement <32 x i8> %136, i8 %140, i32 2
  %142 = extractelement <32 x i32> %126, i32 3
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds i8, i8* %input, i64 %143
  %145 = load i8, i8* %144, align 1, !tbaa !378
  %146 = insertelement <32 x i8> %141, i8 %145, i32 3
  %147 = extractelement <32 x i32> %126, i32 4
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds i8, i8* %input, i64 %148
  %150 = load i8, i8* %149, align 1, !tbaa !378
  %151 = insertelement <32 x i8> %146, i8 %150, i32 4
  %152 = extractelement <32 x i32> %126, i32 5
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds i8, i8* %input, i64 %153
  %155 = load i8, i8* %154, align 1, !tbaa !378
  %156 = insertelement <32 x i8> %151, i8 %155, i32 5
  %157 = extractelement <32 x i32> %126, i32 6
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds i8, i8* %input, i64 %158
  %160 = load i8, i8* %159, align 1, !tbaa !378
  %161 = insertelement <32 x i8> %156, i8 %160, i32 6
  %162 = extractelement <32 x i32> %126, i32 7
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds i8, i8* %input, i64 %163
  %165 = load i8, i8* %164, align 1, !tbaa !378
  %166 = insertelement <32 x i8> %161, i8 %165, i32 7
  %167 = extractelement <32 x i32> %126, i32 8
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds i8, i8* %input, i64 %168
  %170 = load i8, i8* %169, align 1, !tbaa !378
  %171 = insertelement <32 x i8> %166, i8 %170, i32 8
  %172 = extractelement <32 x i32> %126, i32 9
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds i8, i8* %input, i64 %173
  %175 = load i8, i8* %174, align 1, !tbaa !378
  %176 = insertelement <32 x i8> %171, i8 %175, i32 9
  %177 = extractelement <32 x i32> %126, i32 10
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds i8, i8* %input, i64 %178
  %180 = load i8, i8* %179, align 1, !tbaa !378
  %181 = insertelement <32 x i8> %176, i8 %180, i32 10
  %182 = extractelement <32 x i32> %126, i32 11
  %183 = sext i32 %182 to i64
  %184 = getelementptr inbounds i8, i8* %input, i64 %183
  %185 = load i8, i8* %184, align 1, !tbaa !378
  %186 = insertelement <32 x i8> %181, i8 %185, i32 11
  %187 = extractelement <32 x i32> %126, i32 12
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds i8, i8* %input, i64 %188
  %190 = load i8, i8* %189, align 1, !tbaa !378
  %191 = insertelement <32 x i8> %186, i8 %190, i32 12
  %192 = extractelement <32 x i32> %126, i32 13
  %193 = sext i32 %192 to i64
  %194 = getelementptr inbounds i8, i8* %input, i64 %193
  %195 = load i8, i8* %194, align 1, !tbaa !378
  %196 = insertelement <32 x i8> %191, i8 %195, i32 13
  %197 = extractelement <32 x i32> %126, i32 14
  %198 = sext i32 %197 to i64
  %199 = getelementptr inbounds i8, i8* %input, i64 %198
  %200 = load i8, i8* %199, align 1, !tbaa !378
  %201 = insertelement <32 x i8> %196, i8 %200, i32 14
  %202 = extractelement <32 x i32> %126, i32 15
  %203 = sext i32 %202 to i64
  %204 = getelementptr inbounds i8, i8* %input, i64 %203
  %205 = load i8, i8* %204, align 1, !tbaa !378
  %206 = insertelement <32 x i8> %201, i8 %205, i32 15
  %207 = extractelement <32 x i32> %126, i32 16
  %208 = sext i32 %207 to i64
  %209 = getelementptr inbounds i8, i8* %input, i64 %208
  %210 = load i8, i8* %209, align 1, !tbaa !378
  %211 = insertelement <32 x i8> %206, i8 %210, i32 16
  %212 = extractelement <32 x i32> %126, i32 17
  %213 = sext i32 %212 to i64
  %214 = getelementptr inbounds i8, i8* %input, i64 %213
  %215 = load i8, i8* %214, align 1, !tbaa !378
  %216 = insertelement <32 x i8> %211, i8 %215, i32 17
  %217 = extractelement <32 x i32> %126, i32 18
  %218 = sext i32 %217 to i64
  %219 = getelementptr inbounds i8, i8* %input, i64 %218
  %220 = load i8, i8* %219, align 1, !tbaa !378
  %221 = insertelement <32 x i8> %216, i8 %220, i32 18
  %222 = extractelement <32 x i32> %126, i32 19
  %223 = sext i32 %222 to i64
  %224 = getelementptr inbounds i8, i8* %input, i64 %223
  %225 = load i8, i8* %224, align 1, !tbaa !378
  %226 = insertelement <32 x i8> %221, i8 %225, i32 19
  %227 = extractelement <32 x i32> %126, i32 20
  %228 = sext i32 %227 to i64
  %229 = getelementptr inbounds i8, i8* %input, i64 %228
  %230 = load i8, i8* %229, align 1, !tbaa !378
  %231 = insertelement <32 x i8> %226, i8 %230, i32 20
  %232 = extractelement <32 x i32> %126, i32 21
  %233 = sext i32 %232 to i64
  %234 = getelementptr inbounds i8, i8* %input, i64 %233
  %235 = load i8, i8* %234, align 1, !tbaa !378
  %236 = insertelement <32 x i8> %231, i8 %235, i32 21
  %237 = extractelement <32 x i32> %126, i32 22
  %238 = sext i32 %237 to i64
  %239 = getelementptr inbounds i8, i8* %input, i64 %238
  %240 = load i8, i8* %239, align 1, !tbaa !378
  %241 = insertelement <32 x i8> %236, i8 %240, i32 22
  %242 = extractelement <32 x i32> %126, i32 23
  %243 = sext i32 %242 to i64
  %244 = getelementptr inbounds i8, i8* %input, i64 %243
  %245 = load i8, i8* %244, align 1, !tbaa !378
  %246 = insertelement <32 x i8> %241, i8 %245, i32 23
  %247 = extractelement <32 x i32> %126, i32 24
  %248 = sext i32 %247 to i64
  %249 = getelementptr inbounds i8, i8* %input, i64 %248
  %250 = load i8, i8* %249, align 1, !tbaa !378
  %251 = insertelement <32 x i8> %246, i8 %250, i32 24
  %252 = extractelement <32 x i32> %126, i32 25
  %253 = sext i32 %252 to i64
  %254 = getelementptr inbounds i8, i8* %input, i64 %253
  %255 = load i8, i8* %254, align 1, !tbaa !378
  %256 = insertelement <32 x i8> %251, i8 %255, i32 25
  %257 = extractelement <32 x i32> %126, i32 26
  %258 = sext i32 %257 to i64
  %259 = getelementptr inbounds i8, i8* %input, i64 %258
  %260 = load i8, i8* %259, align 1, !tbaa !378
  %261 = insertelement <32 x i8> %256, i8 %260, i32 26
  %262 = extractelement <32 x i32> %126, i32 27
  %263 = sext i32 %262 to i64
  %264 = getelementptr inbounds i8, i8* %input, i64 %263
  %265 = load i8, i8* %264, align 1, !tbaa !378
  %266 = insertelement <32 x i8> %261, i8 %265, i32 27
  %267 = extractelement <32 x i32> %126, i32 28
  %268 = sext i32 %267 to i64
  %269 = getelementptr inbounds i8, i8* %input, i64 %268
  %270 = load i8, i8* %269, align 1, !tbaa !378
  %271 = insertelement <32 x i8> %266, i8 %270, i32 28
  %272 = extractelement <32 x i32> %126, i32 29
  %273 = sext i32 %272 to i64
  %274 = getelementptr inbounds i8, i8* %input, i64 %273
  %275 = load i8, i8* %274, align 1, !tbaa !378
  %276 = insertelement <32 x i8> %271, i8 %275, i32 29
  %277 = extractelement <32 x i32> %126, i32 30
  %278 = sext i32 %277 to i64
  %279 = getelementptr inbounds i8, i8* %input, i64 %278
  %280 = load i8, i8* %279, align 1, !tbaa !378
  %281 = insertelement <32 x i8> %276, i8 %280, i32 30
  %282 = extractelement <32 x i32> %126, i32 31
  %283 = sext i32 %282 to i64
  %284 = getelementptr inbounds i8, i8* %input, i64 %283
  %285 = load i8, i8* %284, align 1, !tbaa !378
  %286 = insertelement <32 x i8> %281, i8 %285, i32 31
  %287 = sext i32 %repeat_edge.s0._0._0i.base.s.us to i64
  %288 = add nsw i64 %287, %97
  %289 = getelementptr inbounds i8, i8* %87, i64 %288
  %290 = bitcast i8* %289 to <32 x i8>*
  store <32 x i8> %286, <32 x i8>* %290, align 1, !tbaa !381
  %291 = add nuw nsw i32 %repeat_edge.s0._0._0.us, 1
  %.not72.us = icmp eq i32 %291, %t401
  br i1 %.not72.us, label %"end for repeat_edge.s0._0._0.loopexit.us", label %"for repeat_edge.s0._0._0.us"

"end for repeat_edge.s0._0._0.loopexit.us":       ; preds = %"for repeat_edge.s0._0._0.us"
  br i1 %.not.us, label %"consume repeat_edge", label %"for repeat_edge.s0._1.rebased.us"

"consume repeat_edge":                            ; preds = %"end for repeat_edge.s0._0._0.loopexit.us"
  %t413 = and i32 %t405, 15
  %t414 = add nsw i32 %a42, 32
  %t416 = and i32 %78, 15
  br i1 %80, label %"for input_16.s0.x.x.preheader", label %"consume repeat_edge.end for input_16.s0.x.x_crit_edge", !prof !374

"consume repeat_edge.end for input_16.s0.x.x_crit_edge": ; preds = %"consume repeat_edge", %"consume repeat_edge.thread"
  %t414261 = phi i32 [ %t414258, %"consume repeat_edge.thread" ], [ %t414, %"consume repeat_edge" ]
  %.pre = zext i32 %t401 to i64
  br label %"end for input_16.s0.x.x"

"for input_16.s0.x.x.preheader":                  ; preds = %"consume repeat_edge"
  %t411 = mul nsw i32 %t413, %t414
  %t409 = mul nsw i32 %79, %t413
  %t410 = mul nsw i32 %t416, %t414
  %t408 = mul nsw i32 %79, %t416
  %292 = sext i32 %t408 to i64
  %293 = sext i32 %t409 to i64
  %294 = sext i32 %t410 to i64
  %295 = sext i32 %t411 to i64
  %296 = zext i32 %t401 to i64
  br label %"for input_16.s0.x.x"

"for input_16.s0.x.x":                            ; preds = %"for input_16.s0.x.x", %"for input_16.s0.x.x.preheader"
  %indvars.iv = phi i64 [ 0, %"for input_16.s0.x.x.preheader" ], [ %indvars.iv.next, %"for input_16.s0.x.x" ]
  %297 = shl nuw nsw i64 %indvars.iv, 5
  %298 = add nsw i64 %297, %292
  %299 = getelementptr inbounds i8, i8* %55, i64 %298
  %300 = bitcast i8* %299 to <32 x i8>*
  %301 = load <32 x i8>, <32 x i8>* %300, align 32, !tbaa !381
  %302 = add nsw i64 %297, %293
  %303 = getelementptr inbounds i8, i8* %55, i64 %302
  %304 = bitcast i8* %303 to <32 x i8>*
  %305 = load <32 x i8>, <32 x i8>* %304, align 32, !tbaa !381
  %306 = zext <32 x i8> %301 to <32 x i16>
  %307 = shufflevector <32 x i16> %306, <32 x i16> undef, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %308 = add nsw i64 %297, %294
  %309 = getelementptr inbounds i16, i16* %input_16, i64 %308
  %310 = bitcast i16* %309 to <16 x i16>*
  store <16 x i16> %307, <16 x i16>* %310, align 32, !tbaa !383
  %311 = shufflevector <32 x i16> %306, <32 x i16> undef, <16 x i32> <i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %312 = getelementptr inbounds i16, i16* %309, i64 16
  %313 = bitcast i16* %312 to <16 x i16>*
  store <16 x i16> %311, <16 x i16>* %313, align 32, !tbaa !383
  %314 = zext <32 x i8> %305 to <32 x i16>
  %315 = shufflevector <32 x i16> %314, <32 x i16> undef, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %316 = add nsw i64 %297, %295
  %317 = getelementptr inbounds i16, i16* %input_16, i64 %316
  %318 = bitcast i16* %317 to <16 x i16>*
  store <16 x i16> %315, <16 x i16>* %318, align 32, !tbaa !383
  %319 = shufflevector <32 x i16> %314, <32 x i16> undef, <16 x i32> <i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %320 = getelementptr inbounds i16, i16* %317, i64 16
  %321 = bitcast i16* %320 to <16 x i16>*
  store <16 x i16> %319, <16 x i16>* %321, align 32, !tbaa !383
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %.not71 = icmp eq i64 %indvars.iv.next, %296
  br i1 %.not71, label %"end for input_16.s0.x.x", label %"for input_16.s0.x.x"

"end for input_16.s0.x.x":                        ; preds = %"for input_16.s0.x.x", %"consume repeat_edge.end for input_16.s0.x.x_crit_edge"
  %t414260 = phi i32 [ %t414261, %"consume repeat_edge.end for input_16.s0.x.x_crit_edge" ], [ %t414, %"for input_16.s0.x.x" ]
  %.pre-phi = phi i64 [ %.pre, %"consume repeat_edge.end for input_16.s0.x.x_crit_edge" ], [ %296, %"for input_16.s0.x.x" ]
  %322 = sub i32 %a64, %output.min.1
  %t418 = sub i32 %322, %output.s0.y.yi.base.s
  %323 = sub i32 2, %a64
  %t434 = sub nsw i32 %t401, %t386
  %324 = icmp sgt i32 %t402, 0
  %t440 = sub nsw i32 %t386, %t402
  %325 = sub i32 %output.min.0, %input.min.0
  %326 = icmp sgt i32 %t440, 0
  %327 = icmp sgt i32 %t434, 0
  %t423 = sub i32 %t405, %a62
  %b76 = add nsw i32 %b59, -1
  %328 = icmp sgt i32 %a81, -128
  %t489 = select i1 %328, i32 %a81, i32 -128
  %329 = add nsw i32 %t489, 128
  %330 = icmp ult i32 %329, 1073741824
  %331 = zext i32 %329 to i64
  %332 = shl nuw nsw i64 %331, 1
  %333 = add nuw nsw i64 %332, 6
  %334 = icmp sgt i32 %t390, 0
  %335 = sext i32 %a42 to i64
  %336 = add nsw i64 %335, 32
  %337 = icmp sgt i32 %t391, 0
  %338 = sext i32 %b77 to i64
  %339 = sext i32 %output.stride.1 to i64
  %340 = sext i32 %t394 to i64
  %341 = sext i32 %t402 to i64
  %342 = zext i32 %t440 to i64
  %343 = sext i32 %input.stride.1 to i64
  %344 = zext i32 %input.min.0 to i64
  %345 = sext i32 %325 to i64
  %346 = zext i32 %t390 to i64
  %347 = zext i32 %t391 to i64
  %348 = sext i32 %t405 to i64
  %349 = sext i32 %a62 to i64
  %350 = sext i32 %a64 to i64
  %351 = getelementptr inbounds i8, i8* %55, i64 -30
  %352 = getelementptr inbounds i8, i8* %55, i64 -30
  %353 = getelementptr inbounds i8, i8* %input, i64 -1
  %354 = getelementptr inbounds i8, i8* %55, i64 -30
  %355 = getelementptr inbounds i8, i8* %55, i64 -30
  %sobel_x54.0.sroa_cast204 = bitcast [144 x i16]* %sobel_x54 to <16 x i16>*
  %sobel_x54.32.sroa_idx211 = getelementptr inbounds [144 x i16], [144 x i16]* %sobel_x54, i64 0, i64 16
  %sobel_x54.32.sroa_cast212 = bitcast i16* %sobel_x54.32.sroa_idx211 to <16 x i16>*
  %sobel_x54.64.sroa_idx219 = getelementptr inbounds [144 x i16], [144 x i16]* %sobel_x54, i64 0, i64 32
  %sobel_x54.64.sroa_cast220 = bitcast i16* %sobel_x54.64.sroa_idx219 to <16 x i16>*
  %sobel_x54.96.sroa_idx227 = getelementptr inbounds [144 x i16], [144 x i16]* %sobel_x54, i64 0, i64 48
  %sobel_x54.96.sroa_cast228 = bitcast i16* %sobel_x54.96.sroa_idx227 to <16 x i16>*
  %sobel_x54.128.sroa_idx231 = getelementptr inbounds [144 x i16], [144 x i16]* %sobel_x54, i64 0, i64 64
  %sobel_x54.128.sroa_cast232 = bitcast i16* %sobel_x54.128.sroa_idx231 to <16 x i16>*
  %sobel_x54.160.sroa_idx235 = getelementptr inbounds [144 x i16], [144 x i16]* %sobel_x54, i64 0, i64 80
  %sobel_x54.160.sroa_cast236 = bitcast i16* %sobel_x54.160.sroa_idx235 to <16 x i16>*
  %sobel_x54.192.sroa_idx239 = getelementptr inbounds [144 x i16], [144 x i16]* %sobel_x54, i64 0, i64 96
  %sobel_x54.192.sroa_cast240 = bitcast i16* %sobel_x54.192.sroa_idx239 to <16 x i16>*
  %sobel_x54.224.sroa_idx243 = getelementptr inbounds [144 x i16], [144 x i16]* %sobel_x54, i64 0, i64 112
  %sobel_x54.224.sroa_cast244 = bitcast i16* %sobel_x54.224.sroa_idx243 to <16 x i16>*
  %sobel_x54.256.sroa_idx247 = getelementptr inbounds [144 x i16], [144 x i16]* %sobel_x54, i64 0, i64 128
  %sobel_x54.256.sroa_cast248 = bitcast i16* %sobel_x54.256.sroa_idx247 to <16 x i16>*
  %sobel_x54.4.sroa_idx205 = getelementptr inbounds [144 x i16], [144 x i16]* %sobel_x54, i64 0, i64 2
  %sobel_x54.4.sroa_cast206 = bitcast i16* %sobel_x54.4.sroa_idx205 to <16 x i16>*
  %sobel_x54.36.sroa_idx213 = getelementptr inbounds [144 x i16], [144 x i16]* %sobel_x54, i64 0, i64 18
  %sobel_x54.36.sroa_cast214 = bitcast i16* %sobel_x54.36.sroa_idx213 to <16 x i16>*
  %sobel_x54.68.sroa_idx221 = getelementptr inbounds [144 x i16], [144 x i16]* %sobel_x54, i64 0, i64 34
  %sobel_x54.68.sroa_cast222 = bitcast i16* %sobel_x54.68.sroa_idx221 to <16 x i16>*
  %sobel_x54.100.sroa_idx229 = getelementptr inbounds [144 x i16], [144 x i16]* %sobel_x54, i64 0, i64 50
  %sobel_x54.100.sroa_cast230 = bitcast i16* %sobel_x54.100.sroa_idx229 to <16 x i16>*
  %sobel_x54.132.sroa_idx233 = getelementptr inbounds [144 x i16], [144 x i16]* %sobel_x54, i64 0, i64 66
  %sobel_x54.132.sroa_cast234 = bitcast i16* %sobel_x54.132.sroa_idx233 to <16 x i16>*
  %sobel_x54.164.sroa_idx237 = getelementptr inbounds [144 x i16], [144 x i16]* %sobel_x54, i64 0, i64 82
  %sobel_x54.164.sroa_cast238 = bitcast i16* %sobel_x54.164.sroa_idx237 to <16 x i16>*
  %sobel_x54.196.sroa_idx241 = getelementptr inbounds [144 x i16], [144 x i16]* %sobel_x54, i64 0, i64 98
  %sobel_x54.196.sroa_cast242 = bitcast i16* %sobel_x54.196.sroa_idx241 to <16 x i16>*
  %sobel_x54.228.sroa_idx245 = getelementptr inbounds [144 x i16], [144 x i16]* %sobel_x54, i64 0, i64 114
  %sobel_x54.228.sroa_cast246 = bitcast i16* %sobel_x54.228.sroa_idx245 to <16 x i16>*
  %sobel_x54.0.sroa_cast203 = bitcast [144 x i16]* %sobel_x54 to <16 x i16>*
  %sobel_x54.32.sroa_idx209 = getelementptr inbounds [144 x i16], [144 x i16]* %sobel_x54, i64 0, i64 16
  %sobel_x54.32.sroa_cast210 = bitcast i16* %sobel_x54.32.sroa_idx209 to <16 x i16>*
  %sobel_x54.64.sroa_idx217 = getelementptr inbounds [144 x i16], [144 x i16]* %sobel_x54, i64 0, i64 32
  %sobel_x54.64.sroa_cast218 = bitcast i16* %sobel_x54.64.sroa_idx217 to <16 x i16>*
  %sobel_x54.96.sroa_idx225 = getelementptr inbounds [144 x i16], [144 x i16]* %sobel_x54, i64 0, i64 48
  %sobel_x54.96.sroa_cast226 = bitcast i16* %sobel_x54.96.sroa_idx225 to <16 x i16>*
  %sobel_x54.0.sroa_cast202 = bitcast [144 x i16]* %sobel_x54 to <16 x i16>*
  %sobel_x54.32.sroa_idx207 = getelementptr inbounds [144 x i16], [144 x i16]* %sobel_x54, i64 0, i64 16
  %sobel_x54.32.sroa_cast208 = bitcast i16* %sobel_x54.32.sroa_idx207 to <16 x i16>*
  %sobel_x54.64.sroa_idx215 = getelementptr inbounds [144 x i16], [144 x i16]* %sobel_x54, i64 0, i64 32
  %sobel_x54.64.sroa_cast216 = bitcast i16* %sobel_x54.64.sroa_idx215 to <16 x i16>*
  %sobel_x54.96.sroa_idx223 = getelementptr inbounds [144 x i16], [144 x i16]* %sobel_x54, i64 0, i64 48
  %sobel_x54.96.sroa_cast224 = bitcast i16* %sobel_x54.96.sroa_idx223 to <16 x i16>*
  br label %"for output.s0.y.yi.yi.$n"

"for output.s0.y.yi.yi.$n":                       ; preds = %"end for output.s0.y.yi.yii", %"end for input_16.s0.x.x"
  %indvars.iv197 = phi i64 [ 0, %"end for input_16.s0.x.x" ], [ %indvars.iv.next198, %"end for output.s0.y.yi.yii" ]
  %356 = mul nuw nsw i64 %indvars.iv197, 9
  %357 = add nsw i64 %356, %348
  %358 = add nsw i64 %357, 1
  %.not57 = icmp slt i64 %357, %350
  %359 = trunc i64 %358 to i32
  %a49 = select i1 %.not57, i32 %a64, i32 %359
  %360 = add nsw i64 %357, 10
  %361 = sext i32 %a49 to i64
  %362 = icmp sgt i64 %360, %361
  %363 = trunc i64 %360 to i32
  %repeat_edge.s0._1.prologue = select i1 %362, i32 %a49, i32 %363
  %364 = icmp sgt i32 %a49, %a62
  %a51 = select i1 %364, i32 %a49, i32 %a62
  %365 = sext i32 %a51 to i64
  %366 = icmp sgt i64 %360, %365
  %repeat_edge.s0._1.epilogue = select i1 %366, i32 %a51, i32 %363
  %367 = trunc i64 %356 to i32
  %a55 = sub i32 %t418, %367
  %368 = icmp slt i32 %a55, 10
  %a54 = select i1 %368, i32 %a55, i32 10
  %369 = icmp sgt i32 %a54, 1
  %a54.op = add i32 %a54, -1
  %370 = select i1 %369, i32 %a54.op, i32 0
  br i1 %369, label %"for repeat_edge.s0._1.rebased4.preheader", label %"end for repeat_edge.s0._1.rebased5", !prof !374

"for repeat_edge.s0._1.rebased4.preheader":       ; preds = %"for output.s0.y.yi.yi.$n"
  %371 = trunc i64 %357 to i32
  %372 = add i32 %371, 1
  %373 = add i32 %323, %371
  br label %"for repeat_edge.s0._1.rebased4"

"for repeat_edge.s0._1.rebased4":                 ; preds = %"end for repeat_edge.s0._0._08", %"for repeat_edge.s0._1.rebased4.preheader"
  %repeat_edge.s0._1.rebased6 = phi i32 [ %585, %"end for repeat_edge.s0._0._08" ], [ 0, %"for repeat_edge.s0._1.rebased4.preheader" ]
  %a57 = add i32 %373, %repeat_edge.s0._1.rebased6
  %374 = icmp sgt i32 %b59, %a57
  %a56 = select i1 %374, i32 %a57, i32 %b59
  br i1 %80, label %"for repeat_edge.s0._0._07.preheader", label %"end for repeat_edge.s0._0._08", !prof !374

"for repeat_edge.s0._0._07.preheader":            ; preds = %"for repeat_edge.s0._1.rebased4"
  %375 = icmp sgt i32 %a56, 1
  %376 = select i1 %375, i32 %a56, i32 1
  %377 = add nsw i32 %376, -1
  %378 = mul nsw i32 %377, %input.stride.1
  %t428 = sub nsw i32 %378, %input.min.0
  %379 = add i32 %372, %repeat_edge.s0._1.rebased6
  %380 = and i32 %379, 15
  %t429 = mul nsw i32 %380, %79
  %381 = insertelement <32 x i32> undef, i32 %t428, i32 0
  %382 = shufflevector <32 x i32> %381, <32 x i32> undef, <32 x i32> zeroinitializer
  %383 = sext i32 %t429 to i64
  br label %"for repeat_edge.s0._0._07"

"end for repeat_edge.s0._1.rebased5":             ; preds = %"end for repeat_edge.s0._0._08", %"for output.s0.y.yi.yi.$n"
  %384 = icmp slt i64 %358, %349
  %a61 = select i1 %384, i32 %a62, i32 %359
  %385 = sext i32 %a61 to i64
  %386 = icmp sgt i64 %360, %385
  %387 = select i1 %386, i32 %a61, i32 %363
  %t430 = sub nsw i32 %387, %repeat_edge.s0._1.prologue
  %388 = icmp sgt i32 %t430, 0
  br i1 %388, label %"for repeat_edge.s0._1.rebased11.preheader", label %"end for repeat_edge.s0._1.rebased12", !prof !374

"for repeat_edge.s0._1.rebased11.preheader":      ; preds = %"end for repeat_edge.s0._1.rebased5"
  %t431 = sub i32 %repeat_edge.s0._1.prologue, %a64
  %389 = sext i32 %t431 to i64
  %390 = zext i32 %t430 to i64
  br label %"for repeat_edge.s0._1.rebased11"

"for repeat_edge.s0._0._07":                      ; preds = %"for repeat_edge.s0._0._07", %"for repeat_edge.s0._0._07.preheader"
  %repeat_edge.s0._0._09 = phi i32 [ %584, %"for repeat_edge.s0._0._07" ], [ 0, %"for repeat_edge.s0._0._07.preheader" ]
  %391 = shl nsw i32 %repeat_edge.s0._0._09, 5
  %a58 = or i32 %391, 30
  %392 = icmp sgt i32 %b77, %a58
  %repeat_edge.s0._0._0i.base.s10 = select i1 %392, i32 %a58, i32 %b77
  %393 = add i32 %81, %repeat_edge.s0._0._0i.base.s10
  %394 = insertelement <32 x i32> undef, i32 %393, i32 0
  %395 = shufflevector <32 x i32> %394, <32 x i32> undef, <32 x i32> zeroinitializer
  %a60 = add nsw <32 x i32> %395, <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %396 = shufflevector <32 x i32> %a60, <32 x i32> undef, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %397 = icmp sgt <8 x i32> %84, %396
  %398 = shufflevector <32 x i32> %a60, <32 x i32> undef, <8 x i32> <i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %399 = icmp sgt <8 x i32> %84, %398
  %400 = shufflevector <32 x i32> %a60, <32 x i32> undef, <8 x i32> <i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23>
  %401 = icmp sgt <8 x i32> %84, %400
  %402 = shufflevector <32 x i32> %a60, <32 x i32> undef, <8 x i32> <i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %403 = icmp sgt <8 x i32> %84, %402
  %404 = select <8 x i1> %397, <8 x i32> %396, <8 x i32> %84
  %405 = select <8 x i1> %399, <8 x i32> %398, <8 x i32> %84
  %406 = select <8 x i1> %401, <8 x i32> %400, <8 x i32> %84
  %407 = select <8 x i1> %403, <8 x i32> %402, <8 x i32> %84
  %408 = icmp sgt <8 x i32> %404, %86
  %409 = icmp sgt <8 x i32> %405, %86
  %410 = icmp sgt <8 x i32> %406, %86
  %411 = icmp sgt <8 x i32> %407, %86
  %412 = select <8 x i1> %408, <8 x i32> %404, <8 x i32> %86
  %413 = select <8 x i1> %409, <8 x i32> %405, <8 x i32> %86
  %414 = select <8 x i1> %410, <8 x i32> %406, <8 x i32> %86
  %415 = select <8 x i1> %411, <8 x i32> %407, <8 x i32> %86
  %416 = shufflevector <8 x i32> %412, <8 x i32> %413, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %417 = shufflevector <8 x i32> %414, <8 x i32> %415, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %418 = shufflevector <16 x i32> %416, <16 x i32> %417, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %419 = add nsw <32 x i32> %418, %382
  %420 = extractelement <32 x i32> %419, i32 0
  %421 = sext i32 %420 to i64
  %422 = getelementptr inbounds i8, i8* %input, i64 %421
  %423 = load i8, i8* %422, align 1, !tbaa !378
  %424 = insertelement <32 x i8> undef, i8 %423, i32 0
  %425 = extractelement <32 x i32> %419, i32 1
  %426 = sext i32 %425 to i64
  %427 = getelementptr inbounds i8, i8* %input, i64 %426
  %428 = load i8, i8* %427, align 1, !tbaa !378
  %429 = insertelement <32 x i8> %424, i8 %428, i32 1
  %430 = extractelement <32 x i32> %419, i32 2
  %431 = sext i32 %430 to i64
  %432 = getelementptr inbounds i8, i8* %input, i64 %431
  %433 = load i8, i8* %432, align 1, !tbaa !378
  %434 = insertelement <32 x i8> %429, i8 %433, i32 2
  %435 = extractelement <32 x i32> %419, i32 3
  %436 = sext i32 %435 to i64
  %437 = getelementptr inbounds i8, i8* %input, i64 %436
  %438 = load i8, i8* %437, align 1, !tbaa !378
  %439 = insertelement <32 x i8> %434, i8 %438, i32 3
  %440 = extractelement <32 x i32> %419, i32 4
  %441 = sext i32 %440 to i64
  %442 = getelementptr inbounds i8, i8* %input, i64 %441
  %443 = load i8, i8* %442, align 1, !tbaa !378
  %444 = insertelement <32 x i8> %439, i8 %443, i32 4
  %445 = extractelement <32 x i32> %419, i32 5
  %446 = sext i32 %445 to i64
  %447 = getelementptr inbounds i8, i8* %input, i64 %446
  %448 = load i8, i8* %447, align 1, !tbaa !378
  %449 = insertelement <32 x i8> %444, i8 %448, i32 5
  %450 = extractelement <32 x i32> %419, i32 6
  %451 = sext i32 %450 to i64
  %452 = getelementptr inbounds i8, i8* %input, i64 %451
  %453 = load i8, i8* %452, align 1, !tbaa !378
  %454 = insertelement <32 x i8> %449, i8 %453, i32 6
  %455 = extractelement <32 x i32> %419, i32 7
  %456 = sext i32 %455 to i64
  %457 = getelementptr inbounds i8, i8* %input, i64 %456
  %458 = load i8, i8* %457, align 1, !tbaa !378
  %459 = insertelement <32 x i8> %454, i8 %458, i32 7
  %460 = extractelement <32 x i32> %419, i32 8
  %461 = sext i32 %460 to i64
  %462 = getelementptr inbounds i8, i8* %input, i64 %461
  %463 = load i8, i8* %462, align 1, !tbaa !378
  %464 = insertelement <32 x i8> %459, i8 %463, i32 8
  %465 = extractelement <32 x i32> %419, i32 9
  %466 = sext i32 %465 to i64
  %467 = getelementptr inbounds i8, i8* %input, i64 %466
  %468 = load i8, i8* %467, align 1, !tbaa !378
  %469 = insertelement <32 x i8> %464, i8 %468, i32 9
  %470 = extractelement <32 x i32> %419, i32 10
  %471 = sext i32 %470 to i64
  %472 = getelementptr inbounds i8, i8* %input, i64 %471
  %473 = load i8, i8* %472, align 1, !tbaa !378
  %474 = insertelement <32 x i8> %469, i8 %473, i32 10
  %475 = extractelement <32 x i32> %419, i32 11
  %476 = sext i32 %475 to i64
  %477 = getelementptr inbounds i8, i8* %input, i64 %476
  %478 = load i8, i8* %477, align 1, !tbaa !378
  %479 = insertelement <32 x i8> %474, i8 %478, i32 11
  %480 = extractelement <32 x i32> %419, i32 12
  %481 = sext i32 %480 to i64
  %482 = getelementptr inbounds i8, i8* %input, i64 %481
  %483 = load i8, i8* %482, align 1, !tbaa !378
  %484 = insertelement <32 x i8> %479, i8 %483, i32 12
  %485 = extractelement <32 x i32> %419, i32 13
  %486 = sext i32 %485 to i64
  %487 = getelementptr inbounds i8, i8* %input, i64 %486
  %488 = load i8, i8* %487, align 1, !tbaa !378
  %489 = insertelement <32 x i8> %484, i8 %488, i32 13
  %490 = extractelement <32 x i32> %419, i32 14
  %491 = sext i32 %490 to i64
  %492 = getelementptr inbounds i8, i8* %input, i64 %491
  %493 = load i8, i8* %492, align 1, !tbaa !378
  %494 = insertelement <32 x i8> %489, i8 %493, i32 14
  %495 = extractelement <32 x i32> %419, i32 15
  %496 = sext i32 %495 to i64
  %497 = getelementptr inbounds i8, i8* %input, i64 %496
  %498 = load i8, i8* %497, align 1, !tbaa !378
  %499 = insertelement <32 x i8> %494, i8 %498, i32 15
  %500 = extractelement <32 x i32> %419, i32 16
  %501 = sext i32 %500 to i64
  %502 = getelementptr inbounds i8, i8* %input, i64 %501
  %503 = load i8, i8* %502, align 1, !tbaa !378
  %504 = insertelement <32 x i8> %499, i8 %503, i32 16
  %505 = extractelement <32 x i32> %419, i32 17
  %506 = sext i32 %505 to i64
  %507 = getelementptr inbounds i8, i8* %input, i64 %506
  %508 = load i8, i8* %507, align 1, !tbaa !378
  %509 = insertelement <32 x i8> %504, i8 %508, i32 17
  %510 = extractelement <32 x i32> %419, i32 18
  %511 = sext i32 %510 to i64
  %512 = getelementptr inbounds i8, i8* %input, i64 %511
  %513 = load i8, i8* %512, align 1, !tbaa !378
  %514 = insertelement <32 x i8> %509, i8 %513, i32 18
  %515 = extractelement <32 x i32> %419, i32 19
  %516 = sext i32 %515 to i64
  %517 = getelementptr inbounds i8, i8* %input, i64 %516
  %518 = load i8, i8* %517, align 1, !tbaa !378
  %519 = insertelement <32 x i8> %514, i8 %518, i32 19
  %520 = extractelement <32 x i32> %419, i32 20
  %521 = sext i32 %520 to i64
  %522 = getelementptr inbounds i8, i8* %input, i64 %521
  %523 = load i8, i8* %522, align 1, !tbaa !378
  %524 = insertelement <32 x i8> %519, i8 %523, i32 20
  %525 = extractelement <32 x i32> %419, i32 21
  %526 = sext i32 %525 to i64
  %527 = getelementptr inbounds i8, i8* %input, i64 %526
  %528 = load i8, i8* %527, align 1, !tbaa !378
  %529 = insertelement <32 x i8> %524, i8 %528, i32 21
  %530 = extractelement <32 x i32> %419, i32 22
  %531 = sext i32 %530 to i64
  %532 = getelementptr inbounds i8, i8* %input, i64 %531
  %533 = load i8, i8* %532, align 1, !tbaa !378
  %534 = insertelement <32 x i8> %529, i8 %533, i32 22
  %535 = extractelement <32 x i32> %419, i32 23
  %536 = sext i32 %535 to i64
  %537 = getelementptr inbounds i8, i8* %input, i64 %536
  %538 = load i8, i8* %537, align 1, !tbaa !378
  %539 = insertelement <32 x i8> %534, i8 %538, i32 23
  %540 = extractelement <32 x i32> %419, i32 24
  %541 = sext i32 %540 to i64
  %542 = getelementptr inbounds i8, i8* %input, i64 %541
  %543 = load i8, i8* %542, align 1, !tbaa !378
  %544 = insertelement <32 x i8> %539, i8 %543, i32 24
  %545 = extractelement <32 x i32> %419, i32 25
  %546 = sext i32 %545 to i64
  %547 = getelementptr inbounds i8, i8* %input, i64 %546
  %548 = load i8, i8* %547, align 1, !tbaa !378
  %549 = insertelement <32 x i8> %544, i8 %548, i32 25
  %550 = extractelement <32 x i32> %419, i32 26
  %551 = sext i32 %550 to i64
  %552 = getelementptr inbounds i8, i8* %input, i64 %551
  %553 = load i8, i8* %552, align 1, !tbaa !378
  %554 = insertelement <32 x i8> %549, i8 %553, i32 26
  %555 = extractelement <32 x i32> %419, i32 27
  %556 = sext i32 %555 to i64
  %557 = getelementptr inbounds i8, i8* %input, i64 %556
  %558 = load i8, i8* %557, align 1, !tbaa !378
  %559 = insertelement <32 x i8> %554, i8 %558, i32 27
  %560 = extractelement <32 x i32> %419, i32 28
  %561 = sext i32 %560 to i64
  %562 = getelementptr inbounds i8, i8* %input, i64 %561
  %563 = load i8, i8* %562, align 1, !tbaa !378
  %564 = insertelement <32 x i8> %559, i8 %563, i32 28
  %565 = extractelement <32 x i32> %419, i32 29
  %566 = sext i32 %565 to i64
  %567 = getelementptr inbounds i8, i8* %input, i64 %566
  %568 = load i8, i8* %567, align 1, !tbaa !378
  %569 = insertelement <32 x i8> %564, i8 %568, i32 29
  %570 = extractelement <32 x i32> %419, i32 30
  %571 = sext i32 %570 to i64
  %572 = getelementptr inbounds i8, i8* %input, i64 %571
  %573 = load i8, i8* %572, align 1, !tbaa !378
  %574 = insertelement <32 x i8> %569, i8 %573, i32 30
  %575 = extractelement <32 x i32> %419, i32 31
  %576 = sext i32 %575 to i64
  %577 = getelementptr inbounds i8, i8* %input, i64 %576
  %578 = load i8, i8* %577, align 1, !tbaa !378
  %579 = insertelement <32 x i8> %574, i8 %578, i32 31
  %580 = sext i32 %repeat_edge.s0._0._0i.base.s10 to i64
  %581 = add nsw i64 %580, %383
  %582 = getelementptr inbounds i8, i8* %351, i64 %581
  %583 = bitcast i8* %582 to <32 x i8>*
  store <32 x i8> %579, <32 x i8>* %583, align 1, !tbaa !381
  %584 = add nuw nsw i32 %repeat_edge.s0._0._09, 1
  %.not70 = icmp eq i32 %584, %t401
  br i1 %.not70, label %"end for repeat_edge.s0._0._08", label %"for repeat_edge.s0._0._07"

"end for repeat_edge.s0._0._08":                  ; preds = %"for repeat_edge.s0._0._07", %"for repeat_edge.s0._1.rebased4"
  %585 = add nuw nsw i32 %repeat_edge.s0._1.rebased6, 1
  %.not69 = icmp eq i32 %585, %370
  br i1 %.not69, label %"end for repeat_edge.s0._1.rebased5", label %"for repeat_edge.s0._1.rebased4"

"for repeat_edge.s0._1.rebased11":                ; preds = %"end for repeat_edge.s0._0._0.rebased19", %"for repeat_edge.s0._1.rebased11.preheader"
  %indvars.iv183 = phi i64 [ 0, %"for repeat_edge.s0._1.rebased11.preheader" ], [ %indvars.iv.next184, %"end for repeat_edge.s0._0._0.rebased19" ]
  %586 = trunc i64 %indvars.iv183 to i32
  %587 = add i32 %repeat_edge.s0._1.prologue, %586
  %588 = and i32 %587, 15
  %t439 = mul nsw i32 %588, %79
  %589 = add nsw i64 %indvars.iv183, %389
  %590 = mul nsw i64 %589, %343
  %591 = sub i64 %590, %344
  br i1 %324, label %"for repeat_edge.s0._0._014.preheader", label %"end for repeat_edge.s0._0._015", !prof !374

"for repeat_edge.s0._0._014.preheader":           ; preds = %"for repeat_edge.s0._1.rebased11"
  %592 = trunc i64 %591 to i32
  %593 = insertelement <32 x i32> undef, i32 %592, i32 0
  %594 = shufflevector <32 x i32> %593, <32 x i32> undef, <32 x i32> zeroinitializer
  %595 = sext i32 %t439 to i64
  br label %"for repeat_edge.s0._0._014"

"end for repeat_edge.s0._1.rebased12":            ; preds = %"end for repeat_edge.s0._0._0.rebased19", %"end for repeat_edge.s0._1.rebased5"
  %a72 = add i32 %t423, %367
  %596 = icmp slt i32 %a72, -1
  %a71 = select i1 %596, i32 %a72, i32 -1
  %597 = icmp sgt i32 %a71, -10
  %t446 = sub nsw i32 %repeat_edge.s0._1.epilogue, %a64
  br i1 %597, label %"for repeat_edge.s0._1.rebased22.preheader", label %"consume repeat_edge30", !prof !374

"for repeat_edge.s0._1.rebased22.preheader":      ; preds = %"end for repeat_edge.s0._1.rebased12"
  %a71.op = add nsw i32 %a71, 9
  br label %"for repeat_edge.s0._1.rebased22"

"for repeat_edge.s0._0._014":                     ; preds = %"for repeat_edge.s0._0._014", %"for repeat_edge.s0._0._014.preheader"
  %repeat_edge.s0._0._016 = phi i32 [ %791, %"for repeat_edge.s0._0._014" ], [ 0, %"for repeat_edge.s0._0._014.preheader" ]
  %598 = shl nsw i32 %repeat_edge.s0._0._016, 5
  %a65 = or i32 %598, 30
  %599 = icmp sgt i32 %b77, %a65
  %repeat_edge.s0._0._0i.base.s17 = select i1 %599, i32 %a65, i32 %b77
  %600 = add i32 %81, %repeat_edge.s0._0._0i.base.s17
  %601 = insertelement <32 x i32> undef, i32 %600, i32 0
  %602 = shufflevector <32 x i32> %601, <32 x i32> undef, <32 x i32> zeroinitializer
  %a67 = add nsw <32 x i32> %602, <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %603 = shufflevector <32 x i32> %a67, <32 x i32> undef, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %604 = icmp sgt <8 x i32> %84, %603
  %605 = shufflevector <32 x i32> %a67, <32 x i32> undef, <8 x i32> <i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %606 = icmp sgt <8 x i32> %84, %605
  %607 = shufflevector <32 x i32> %a67, <32 x i32> undef, <8 x i32> <i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23>
  %608 = icmp sgt <8 x i32> %84, %607
  %609 = shufflevector <32 x i32> %a67, <32 x i32> undef, <8 x i32> <i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %610 = icmp sgt <8 x i32> %84, %609
  %611 = select <8 x i1> %604, <8 x i32> %603, <8 x i32> %84
  %612 = select <8 x i1> %606, <8 x i32> %605, <8 x i32> %84
  %613 = select <8 x i1> %608, <8 x i32> %607, <8 x i32> %84
  %614 = select <8 x i1> %610, <8 x i32> %609, <8 x i32> %84
  %615 = icmp sgt <8 x i32> %611, %86
  %616 = icmp sgt <8 x i32> %612, %86
  %617 = icmp sgt <8 x i32> %613, %86
  %618 = icmp sgt <8 x i32> %614, %86
  %619 = select <8 x i1> %615, <8 x i32> %611, <8 x i32> %86
  %620 = select <8 x i1> %616, <8 x i32> %612, <8 x i32> %86
  %621 = select <8 x i1> %617, <8 x i32> %613, <8 x i32> %86
  %622 = select <8 x i1> %618, <8 x i32> %614, <8 x i32> %86
  %623 = shufflevector <8 x i32> %619, <8 x i32> %620, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %624 = shufflevector <8 x i32> %621, <8 x i32> %622, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %625 = shufflevector <16 x i32> %623, <16 x i32> %624, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %626 = add nsw <32 x i32> %625, %594
  %627 = extractelement <32 x i32> %626, i32 0
  %628 = sext i32 %627 to i64
  %629 = getelementptr inbounds i8, i8* %input, i64 %628
  %630 = load i8, i8* %629, align 1, !tbaa !378
  %631 = insertelement <32 x i8> undef, i8 %630, i32 0
  %632 = extractelement <32 x i32> %626, i32 1
  %633 = sext i32 %632 to i64
  %634 = getelementptr inbounds i8, i8* %input, i64 %633
  %635 = load i8, i8* %634, align 1, !tbaa !378
  %636 = insertelement <32 x i8> %631, i8 %635, i32 1
  %637 = extractelement <32 x i32> %626, i32 2
  %638 = sext i32 %637 to i64
  %639 = getelementptr inbounds i8, i8* %input, i64 %638
  %640 = load i8, i8* %639, align 1, !tbaa !378
  %641 = insertelement <32 x i8> %636, i8 %640, i32 2
  %642 = extractelement <32 x i32> %626, i32 3
  %643 = sext i32 %642 to i64
  %644 = getelementptr inbounds i8, i8* %input, i64 %643
  %645 = load i8, i8* %644, align 1, !tbaa !378
  %646 = insertelement <32 x i8> %641, i8 %645, i32 3
  %647 = extractelement <32 x i32> %626, i32 4
  %648 = sext i32 %647 to i64
  %649 = getelementptr inbounds i8, i8* %input, i64 %648
  %650 = load i8, i8* %649, align 1, !tbaa !378
  %651 = insertelement <32 x i8> %646, i8 %650, i32 4
  %652 = extractelement <32 x i32> %626, i32 5
  %653 = sext i32 %652 to i64
  %654 = getelementptr inbounds i8, i8* %input, i64 %653
  %655 = load i8, i8* %654, align 1, !tbaa !378
  %656 = insertelement <32 x i8> %651, i8 %655, i32 5
  %657 = extractelement <32 x i32> %626, i32 6
  %658 = sext i32 %657 to i64
  %659 = getelementptr inbounds i8, i8* %input, i64 %658
  %660 = load i8, i8* %659, align 1, !tbaa !378
  %661 = insertelement <32 x i8> %656, i8 %660, i32 6
  %662 = extractelement <32 x i32> %626, i32 7
  %663 = sext i32 %662 to i64
  %664 = getelementptr inbounds i8, i8* %input, i64 %663
  %665 = load i8, i8* %664, align 1, !tbaa !378
  %666 = insertelement <32 x i8> %661, i8 %665, i32 7
  %667 = extractelement <32 x i32> %626, i32 8
  %668 = sext i32 %667 to i64
  %669 = getelementptr inbounds i8, i8* %input, i64 %668
  %670 = load i8, i8* %669, align 1, !tbaa !378
  %671 = insertelement <32 x i8> %666, i8 %670, i32 8
  %672 = extractelement <32 x i32> %626, i32 9
  %673 = sext i32 %672 to i64
  %674 = getelementptr inbounds i8, i8* %input, i64 %673
  %675 = load i8, i8* %674, align 1, !tbaa !378
  %676 = insertelement <32 x i8> %671, i8 %675, i32 9
  %677 = extractelement <32 x i32> %626, i32 10
  %678 = sext i32 %677 to i64
  %679 = getelementptr inbounds i8, i8* %input, i64 %678
  %680 = load i8, i8* %679, align 1, !tbaa !378
  %681 = insertelement <32 x i8> %676, i8 %680, i32 10
  %682 = extractelement <32 x i32> %626, i32 11
  %683 = sext i32 %682 to i64
  %684 = getelementptr inbounds i8, i8* %input, i64 %683
  %685 = load i8, i8* %684, align 1, !tbaa !378
  %686 = insertelement <32 x i8> %681, i8 %685, i32 11
  %687 = extractelement <32 x i32> %626, i32 12
  %688 = sext i32 %687 to i64
  %689 = getelementptr inbounds i8, i8* %input, i64 %688
  %690 = load i8, i8* %689, align 1, !tbaa !378
  %691 = insertelement <32 x i8> %686, i8 %690, i32 12
  %692 = extractelement <32 x i32> %626, i32 13
  %693 = sext i32 %692 to i64
  %694 = getelementptr inbounds i8, i8* %input, i64 %693
  %695 = load i8, i8* %694, align 1, !tbaa !378
  %696 = insertelement <32 x i8> %691, i8 %695, i32 13
  %697 = extractelement <32 x i32> %626, i32 14
  %698 = sext i32 %697 to i64
  %699 = getelementptr inbounds i8, i8* %input, i64 %698
  %700 = load i8, i8* %699, align 1, !tbaa !378
  %701 = insertelement <32 x i8> %696, i8 %700, i32 14
  %702 = extractelement <32 x i32> %626, i32 15
  %703 = sext i32 %702 to i64
  %704 = getelementptr inbounds i8, i8* %input, i64 %703
  %705 = load i8, i8* %704, align 1, !tbaa !378
  %706 = insertelement <32 x i8> %701, i8 %705, i32 15
  %707 = extractelement <32 x i32> %626, i32 16
  %708 = sext i32 %707 to i64
  %709 = getelementptr inbounds i8, i8* %input, i64 %708
  %710 = load i8, i8* %709, align 1, !tbaa !378
  %711 = insertelement <32 x i8> %706, i8 %710, i32 16
  %712 = extractelement <32 x i32> %626, i32 17
  %713 = sext i32 %712 to i64
  %714 = getelementptr inbounds i8, i8* %input, i64 %713
  %715 = load i8, i8* %714, align 1, !tbaa !378
  %716 = insertelement <32 x i8> %711, i8 %715, i32 17
  %717 = extractelement <32 x i32> %626, i32 18
  %718 = sext i32 %717 to i64
  %719 = getelementptr inbounds i8, i8* %input, i64 %718
  %720 = load i8, i8* %719, align 1, !tbaa !378
  %721 = insertelement <32 x i8> %716, i8 %720, i32 18
  %722 = extractelement <32 x i32> %626, i32 19
  %723 = sext i32 %722 to i64
  %724 = getelementptr inbounds i8, i8* %input, i64 %723
  %725 = load i8, i8* %724, align 1, !tbaa !378
  %726 = insertelement <32 x i8> %721, i8 %725, i32 19
  %727 = extractelement <32 x i32> %626, i32 20
  %728 = sext i32 %727 to i64
  %729 = getelementptr inbounds i8, i8* %input, i64 %728
  %730 = load i8, i8* %729, align 1, !tbaa !378
  %731 = insertelement <32 x i8> %726, i8 %730, i32 20
  %732 = extractelement <32 x i32> %626, i32 21
  %733 = sext i32 %732 to i64
  %734 = getelementptr inbounds i8, i8* %input, i64 %733
  %735 = load i8, i8* %734, align 1, !tbaa !378
  %736 = insertelement <32 x i8> %731, i8 %735, i32 21
  %737 = extractelement <32 x i32> %626, i32 22
  %738 = sext i32 %737 to i64
  %739 = getelementptr inbounds i8, i8* %input, i64 %738
  %740 = load i8, i8* %739, align 1, !tbaa !378
  %741 = insertelement <32 x i8> %736, i8 %740, i32 22
  %742 = extractelement <32 x i32> %626, i32 23
  %743 = sext i32 %742 to i64
  %744 = getelementptr inbounds i8, i8* %input, i64 %743
  %745 = load i8, i8* %744, align 1, !tbaa !378
  %746 = insertelement <32 x i8> %741, i8 %745, i32 23
  %747 = extractelement <32 x i32> %626, i32 24
  %748 = sext i32 %747 to i64
  %749 = getelementptr inbounds i8, i8* %input, i64 %748
  %750 = load i8, i8* %749, align 1, !tbaa !378
  %751 = insertelement <32 x i8> %746, i8 %750, i32 24
  %752 = extractelement <32 x i32> %626, i32 25
  %753 = sext i32 %752 to i64
  %754 = getelementptr inbounds i8, i8* %input, i64 %753
  %755 = load i8, i8* %754, align 1, !tbaa !378
  %756 = insertelement <32 x i8> %751, i8 %755, i32 25
  %757 = extractelement <32 x i32> %626, i32 26
  %758 = sext i32 %757 to i64
  %759 = getelementptr inbounds i8, i8* %input, i64 %758
  %760 = load i8, i8* %759, align 1, !tbaa !378
  %761 = insertelement <32 x i8> %756, i8 %760, i32 26
  %762 = extractelement <32 x i32> %626, i32 27
  %763 = sext i32 %762 to i64
  %764 = getelementptr inbounds i8, i8* %input, i64 %763
  %765 = load i8, i8* %764, align 1, !tbaa !378
  %766 = insertelement <32 x i8> %761, i8 %765, i32 27
  %767 = extractelement <32 x i32> %626, i32 28
  %768 = sext i32 %767 to i64
  %769 = getelementptr inbounds i8, i8* %input, i64 %768
  %770 = load i8, i8* %769, align 1, !tbaa !378
  %771 = insertelement <32 x i8> %766, i8 %770, i32 28
  %772 = extractelement <32 x i32> %626, i32 29
  %773 = sext i32 %772 to i64
  %774 = getelementptr inbounds i8, i8* %input, i64 %773
  %775 = load i8, i8* %774, align 1, !tbaa !378
  %776 = insertelement <32 x i8> %771, i8 %775, i32 29
  %777 = extractelement <32 x i32> %626, i32 30
  %778 = sext i32 %777 to i64
  %779 = getelementptr inbounds i8, i8* %input, i64 %778
  %780 = load i8, i8* %779, align 1, !tbaa !378
  %781 = insertelement <32 x i8> %776, i8 %780, i32 30
  %782 = extractelement <32 x i32> %626, i32 31
  %783 = sext i32 %782 to i64
  %784 = getelementptr inbounds i8, i8* %input, i64 %783
  %785 = load i8, i8* %784, align 1, !tbaa !378
  %786 = insertelement <32 x i8> %781, i8 %785, i32 31
  %787 = sext i32 %repeat_edge.s0._0._0i.base.s17 to i64
  %788 = add nsw i64 %787, %595
  %789 = getelementptr inbounds i8, i8* %352, i64 %788
  %790 = bitcast i8* %789 to <32 x i8>*
  store <32 x i8> %786, <32 x i8>* %790, align 1, !tbaa !381
  %791 = add nuw nsw i32 %repeat_edge.s0._0._016, 1
  %.not68 = icmp eq i32 %791, %t402
  br i1 %.not68, label %"end for repeat_edge.s0._0._015", label %"for repeat_edge.s0._0._014"

"end for repeat_edge.s0._0._015":                 ; preds = %"for repeat_edge.s0._0._014", %"for repeat_edge.s0._1.rebased11"
  br i1 %326, label %"for repeat_edge.s0._0._0.rebased.preheader", label %"end for repeat_edge.s0._0._0.rebased", !prof !374

"for repeat_edge.s0._0._0.rebased.preheader":     ; preds = %"end for repeat_edge.s0._0._015"
  %792 = add nsw i64 %590, %345
  %793 = sext i32 %t439 to i64
  br label %"for repeat_edge.s0._0._0.rebased"

"for repeat_edge.s0._0._0.rebased":               ; preds = %"for repeat_edge.s0._0._0.rebased", %"for repeat_edge.s0._0._0.rebased.preheader"
  %indvars.iv180 = phi i64 [ 0, %"for repeat_edge.s0._0._0.rebased.preheader" ], [ %indvars.iv.next181, %"for repeat_edge.s0._0._0.rebased" ]
  %794 = add nsw i64 %indvars.iv180, %341
  %795 = shl nsw i64 %794, 5
  %796 = add nsw i64 %795, %792
  %797 = getelementptr inbounds i8, i8* %353, i64 %796
  %798 = bitcast i8* %797 to <32 x i8>*
  %799 = load <32 x i8>, <32 x i8>* %798, align 1, !tbaa !378
  %800 = add nsw i64 %795, %793
  %801 = getelementptr inbounds i8, i8* %55, i64 %800
  %802 = bitcast i8* %801 to <32 x i8>*
  store <32 x i8> %799, <32 x i8>* %802, align 32, !tbaa !381
  %indvars.iv.next181 = add nuw nsw i64 %indvars.iv180, 1
  %.not67 = icmp eq i64 %indvars.iv.next181, %342
  br i1 %.not67, label %"end for repeat_edge.s0._0._0.rebased", label %"for repeat_edge.s0._0._0.rebased"

"end for repeat_edge.s0._0._0.rebased":           ; preds = %"for repeat_edge.s0._0._0.rebased", %"end for repeat_edge.s0._0._015"
  br i1 %327, label %"for repeat_edge.s0._0._0.rebased18.preheader", label %"end for repeat_edge.s0._0._0.rebased19", !prof !374

"for repeat_edge.s0._0._0.rebased18.preheader":   ; preds = %"end for repeat_edge.s0._0._0.rebased"
  %803 = trunc i64 %591 to i32
  %804 = insertelement <32 x i32> undef, i32 %803, i32 0
  %805 = shufflevector <32 x i32> %804, <32 x i32> undef, <32 x i32> zeroinitializer
  %806 = sext i32 %t439 to i64
  br label %"for repeat_edge.s0._0._0.rebased18"

"for repeat_edge.s0._0._0.rebased18":             ; preds = %"for repeat_edge.s0._0._0.rebased18", %"for repeat_edge.s0._0._0.rebased18.preheader"
  %repeat_edge.s0._0._0.rebased20 = phi i32 [ %1001, %"for repeat_edge.s0._0._0.rebased18" ], [ 0, %"for repeat_edge.s0._0._0.rebased18.preheader" ]
  %807 = add nsw i32 %repeat_edge.s0._0._0.rebased20, %t386
  %808 = shl nsw i32 %807, 5
  %a68 = or i32 %808, 30
  %809 = icmp sgt i32 %b77, %a68
  %repeat_edge.s0._0._0i.base.s21 = select i1 %809, i32 %a68, i32 %b77
  %810 = add i32 %81, %repeat_edge.s0._0._0i.base.s21
  %811 = insertelement <32 x i32> undef, i32 %810, i32 0
  %812 = shufflevector <32 x i32> %811, <32 x i32> undef, <32 x i32> zeroinitializer
  %a70 = add nsw <32 x i32> %812, <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %813 = shufflevector <32 x i32> %a70, <32 x i32> undef, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %814 = icmp sgt <8 x i32> %84, %813
  %815 = shufflevector <32 x i32> %a70, <32 x i32> undef, <8 x i32> <i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %816 = icmp sgt <8 x i32> %84, %815
  %817 = shufflevector <32 x i32> %a70, <32 x i32> undef, <8 x i32> <i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23>
  %818 = icmp sgt <8 x i32> %84, %817
  %819 = shufflevector <32 x i32> %a70, <32 x i32> undef, <8 x i32> <i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %820 = icmp sgt <8 x i32> %84, %819
  %821 = select <8 x i1> %814, <8 x i32> %813, <8 x i32> %84
  %822 = select <8 x i1> %816, <8 x i32> %815, <8 x i32> %84
  %823 = select <8 x i1> %818, <8 x i32> %817, <8 x i32> %84
  %824 = select <8 x i1> %820, <8 x i32> %819, <8 x i32> %84
  %825 = icmp sgt <8 x i32> %821, %86
  %826 = icmp sgt <8 x i32> %822, %86
  %827 = icmp sgt <8 x i32> %823, %86
  %828 = icmp sgt <8 x i32> %824, %86
  %829 = select <8 x i1> %825, <8 x i32> %821, <8 x i32> %86
  %830 = select <8 x i1> %826, <8 x i32> %822, <8 x i32> %86
  %831 = select <8 x i1> %827, <8 x i32> %823, <8 x i32> %86
  %832 = select <8 x i1> %828, <8 x i32> %824, <8 x i32> %86
  %833 = shufflevector <8 x i32> %829, <8 x i32> %830, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %834 = shufflevector <8 x i32> %831, <8 x i32> %832, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %835 = shufflevector <16 x i32> %833, <16 x i32> %834, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %836 = add nsw <32 x i32> %835, %805
  %837 = extractelement <32 x i32> %836, i32 0
  %838 = sext i32 %837 to i64
  %839 = getelementptr inbounds i8, i8* %input, i64 %838
  %840 = load i8, i8* %839, align 1, !tbaa !378
  %841 = insertelement <32 x i8> undef, i8 %840, i32 0
  %842 = extractelement <32 x i32> %836, i32 1
  %843 = sext i32 %842 to i64
  %844 = getelementptr inbounds i8, i8* %input, i64 %843
  %845 = load i8, i8* %844, align 1, !tbaa !378
  %846 = insertelement <32 x i8> %841, i8 %845, i32 1
  %847 = extractelement <32 x i32> %836, i32 2
  %848 = sext i32 %847 to i64
  %849 = getelementptr inbounds i8, i8* %input, i64 %848
  %850 = load i8, i8* %849, align 1, !tbaa !378
  %851 = insertelement <32 x i8> %846, i8 %850, i32 2
  %852 = extractelement <32 x i32> %836, i32 3
  %853 = sext i32 %852 to i64
  %854 = getelementptr inbounds i8, i8* %input, i64 %853
  %855 = load i8, i8* %854, align 1, !tbaa !378
  %856 = insertelement <32 x i8> %851, i8 %855, i32 3
  %857 = extractelement <32 x i32> %836, i32 4
  %858 = sext i32 %857 to i64
  %859 = getelementptr inbounds i8, i8* %input, i64 %858
  %860 = load i8, i8* %859, align 1, !tbaa !378
  %861 = insertelement <32 x i8> %856, i8 %860, i32 4
  %862 = extractelement <32 x i32> %836, i32 5
  %863 = sext i32 %862 to i64
  %864 = getelementptr inbounds i8, i8* %input, i64 %863
  %865 = load i8, i8* %864, align 1, !tbaa !378
  %866 = insertelement <32 x i8> %861, i8 %865, i32 5
  %867 = extractelement <32 x i32> %836, i32 6
  %868 = sext i32 %867 to i64
  %869 = getelementptr inbounds i8, i8* %input, i64 %868
  %870 = load i8, i8* %869, align 1, !tbaa !378
  %871 = insertelement <32 x i8> %866, i8 %870, i32 6
  %872 = extractelement <32 x i32> %836, i32 7
  %873 = sext i32 %872 to i64
  %874 = getelementptr inbounds i8, i8* %input, i64 %873
  %875 = load i8, i8* %874, align 1, !tbaa !378
  %876 = insertelement <32 x i8> %871, i8 %875, i32 7
  %877 = extractelement <32 x i32> %836, i32 8
  %878 = sext i32 %877 to i64
  %879 = getelementptr inbounds i8, i8* %input, i64 %878
  %880 = load i8, i8* %879, align 1, !tbaa !378
  %881 = insertelement <32 x i8> %876, i8 %880, i32 8
  %882 = extractelement <32 x i32> %836, i32 9
  %883 = sext i32 %882 to i64
  %884 = getelementptr inbounds i8, i8* %input, i64 %883
  %885 = load i8, i8* %884, align 1, !tbaa !378
  %886 = insertelement <32 x i8> %881, i8 %885, i32 9
  %887 = extractelement <32 x i32> %836, i32 10
  %888 = sext i32 %887 to i64
  %889 = getelementptr inbounds i8, i8* %input, i64 %888
  %890 = load i8, i8* %889, align 1, !tbaa !378
  %891 = insertelement <32 x i8> %886, i8 %890, i32 10
  %892 = extractelement <32 x i32> %836, i32 11
  %893 = sext i32 %892 to i64
  %894 = getelementptr inbounds i8, i8* %input, i64 %893
  %895 = load i8, i8* %894, align 1, !tbaa !378
  %896 = insertelement <32 x i8> %891, i8 %895, i32 11
  %897 = extractelement <32 x i32> %836, i32 12
  %898 = sext i32 %897 to i64
  %899 = getelementptr inbounds i8, i8* %input, i64 %898
  %900 = load i8, i8* %899, align 1, !tbaa !378
  %901 = insertelement <32 x i8> %896, i8 %900, i32 12
  %902 = extractelement <32 x i32> %836, i32 13
  %903 = sext i32 %902 to i64
  %904 = getelementptr inbounds i8, i8* %input, i64 %903
  %905 = load i8, i8* %904, align 1, !tbaa !378
  %906 = insertelement <32 x i8> %901, i8 %905, i32 13
  %907 = extractelement <32 x i32> %836, i32 14
  %908 = sext i32 %907 to i64
  %909 = getelementptr inbounds i8, i8* %input, i64 %908
  %910 = load i8, i8* %909, align 1, !tbaa !378
  %911 = insertelement <32 x i8> %906, i8 %910, i32 14
  %912 = extractelement <32 x i32> %836, i32 15
  %913 = sext i32 %912 to i64
  %914 = getelementptr inbounds i8, i8* %input, i64 %913
  %915 = load i8, i8* %914, align 1, !tbaa !378
  %916 = insertelement <32 x i8> %911, i8 %915, i32 15
  %917 = extractelement <32 x i32> %836, i32 16
  %918 = sext i32 %917 to i64
  %919 = getelementptr inbounds i8, i8* %input, i64 %918
  %920 = load i8, i8* %919, align 1, !tbaa !378
  %921 = insertelement <32 x i8> %916, i8 %920, i32 16
  %922 = extractelement <32 x i32> %836, i32 17
  %923 = sext i32 %922 to i64
  %924 = getelementptr inbounds i8, i8* %input, i64 %923
  %925 = load i8, i8* %924, align 1, !tbaa !378
  %926 = insertelement <32 x i8> %921, i8 %925, i32 17
  %927 = extractelement <32 x i32> %836, i32 18
  %928 = sext i32 %927 to i64
  %929 = getelementptr inbounds i8, i8* %input, i64 %928
  %930 = load i8, i8* %929, align 1, !tbaa !378
  %931 = insertelement <32 x i8> %926, i8 %930, i32 18
  %932 = extractelement <32 x i32> %836, i32 19
  %933 = sext i32 %932 to i64
  %934 = getelementptr inbounds i8, i8* %input, i64 %933
  %935 = load i8, i8* %934, align 1, !tbaa !378
  %936 = insertelement <32 x i8> %931, i8 %935, i32 19
  %937 = extractelement <32 x i32> %836, i32 20
  %938 = sext i32 %937 to i64
  %939 = getelementptr inbounds i8, i8* %input, i64 %938
  %940 = load i8, i8* %939, align 1, !tbaa !378
  %941 = insertelement <32 x i8> %936, i8 %940, i32 20
  %942 = extractelement <32 x i32> %836, i32 21
  %943 = sext i32 %942 to i64
  %944 = getelementptr inbounds i8, i8* %input, i64 %943
  %945 = load i8, i8* %944, align 1, !tbaa !378
  %946 = insertelement <32 x i8> %941, i8 %945, i32 21
  %947 = extractelement <32 x i32> %836, i32 22
  %948 = sext i32 %947 to i64
  %949 = getelementptr inbounds i8, i8* %input, i64 %948
  %950 = load i8, i8* %949, align 1, !tbaa !378
  %951 = insertelement <32 x i8> %946, i8 %950, i32 22
  %952 = extractelement <32 x i32> %836, i32 23
  %953 = sext i32 %952 to i64
  %954 = getelementptr inbounds i8, i8* %input, i64 %953
  %955 = load i8, i8* %954, align 1, !tbaa !378
  %956 = insertelement <32 x i8> %951, i8 %955, i32 23
  %957 = extractelement <32 x i32> %836, i32 24
  %958 = sext i32 %957 to i64
  %959 = getelementptr inbounds i8, i8* %input, i64 %958
  %960 = load i8, i8* %959, align 1, !tbaa !378
  %961 = insertelement <32 x i8> %956, i8 %960, i32 24
  %962 = extractelement <32 x i32> %836, i32 25
  %963 = sext i32 %962 to i64
  %964 = getelementptr inbounds i8, i8* %input, i64 %963
  %965 = load i8, i8* %964, align 1, !tbaa !378
  %966 = insertelement <32 x i8> %961, i8 %965, i32 25
  %967 = extractelement <32 x i32> %836, i32 26
  %968 = sext i32 %967 to i64
  %969 = getelementptr inbounds i8, i8* %input, i64 %968
  %970 = load i8, i8* %969, align 1, !tbaa !378
  %971 = insertelement <32 x i8> %966, i8 %970, i32 26
  %972 = extractelement <32 x i32> %836, i32 27
  %973 = sext i32 %972 to i64
  %974 = getelementptr inbounds i8, i8* %input, i64 %973
  %975 = load i8, i8* %974, align 1, !tbaa !378
  %976 = insertelement <32 x i8> %971, i8 %975, i32 27
  %977 = extractelement <32 x i32> %836, i32 28
  %978 = sext i32 %977 to i64
  %979 = getelementptr inbounds i8, i8* %input, i64 %978
  %980 = load i8, i8* %979, align 1, !tbaa !378
  %981 = insertelement <32 x i8> %976, i8 %980, i32 28
  %982 = extractelement <32 x i32> %836, i32 29
  %983 = sext i32 %982 to i64
  %984 = getelementptr inbounds i8, i8* %input, i64 %983
  %985 = load i8, i8* %984, align 1, !tbaa !378
  %986 = insertelement <32 x i8> %981, i8 %985, i32 29
  %987 = extractelement <32 x i32> %836, i32 30
  %988 = sext i32 %987 to i64
  %989 = getelementptr inbounds i8, i8* %input, i64 %988
  %990 = load i8, i8* %989, align 1, !tbaa !378
  %991 = insertelement <32 x i8> %986, i8 %990, i32 30
  %992 = extractelement <32 x i32> %836, i32 31
  %993 = sext i32 %992 to i64
  %994 = getelementptr inbounds i8, i8* %input, i64 %993
  %995 = load i8, i8* %994, align 1, !tbaa !378
  %996 = insertelement <32 x i8> %991, i8 %995, i32 31
  %997 = sext i32 %repeat_edge.s0._0._0i.base.s21 to i64
  %998 = add nsw i64 %997, %806
  %999 = getelementptr inbounds i8, i8* %354, i64 %998
  %1000 = bitcast i8* %999 to <32 x i8>*
  store <32 x i8> %996, <32 x i8>* %1000, align 1, !tbaa !381
  %1001 = add nuw nsw i32 %repeat_edge.s0._0._0.rebased20, 1
  %.not66 = icmp eq i32 %1001, %t434
  br i1 %.not66, label %"end for repeat_edge.s0._0._0.rebased19", label %"for repeat_edge.s0._0._0.rebased18"

"end for repeat_edge.s0._0._0.rebased19":         ; preds = %"for repeat_edge.s0._0._0.rebased18", %"end for repeat_edge.s0._0._0.rebased"
  %indvars.iv.next184 = add nuw nsw i64 %indvars.iv183, 1
  %.not65 = icmp eq i64 %indvars.iv.next184, %390
  br i1 %.not65, label %"end for repeat_edge.s0._1.rebased12", label %"for repeat_edge.s0._1.rebased11"

"for repeat_edge.s0._1.rebased22":                ; preds = %"end for repeat_edge.s0._0._026", %"for repeat_edge.s0._1.rebased22.preheader"
  %repeat_edge.s0._1.rebased24 = phi i32 [ %1205, %"end for repeat_edge.s0._0._026" ], [ 0, %"for repeat_edge.s0._1.rebased22.preheader" ]
  %a74 = add nsw i32 %repeat_edge.s0._1.rebased24, %t446
  %1002 = icmp sgt i32 %b76, %a74
  %a73 = select i1 %1002, i32 %a74, i32 %b76
  br i1 %80, label %"for repeat_edge.s0._0._025.preheader", label %"end for repeat_edge.s0._0._026", !prof !374

"for repeat_edge.s0._0._025.preheader":           ; preds = %"for repeat_edge.s0._1.rebased22"
  %1003 = icmp sgt i32 %a73, 0
  %1004 = select i1 %1003, i32 %a73, i32 0
  %1005 = mul nsw i32 %1004, %input.stride.1
  %t447 = sub nsw i32 %1005, %input.min.0
  %1006 = add nsw i32 %repeat_edge.s0._1.rebased24, %repeat_edge.s0._1.epilogue
  %1007 = and i32 %1006, 15
  %t448 = mul nsw i32 %1007, %79
  %1008 = insertelement <32 x i32> undef, i32 %t447, i32 0
  %1009 = shufflevector <32 x i32> %1008, <32 x i32> undef, <32 x i32> zeroinitializer
  %1010 = sext i32 %t448 to i64
  br label %"for repeat_edge.s0._0._025"

"for repeat_edge.s0._0._025":                     ; preds = %"for repeat_edge.s0._0._025", %"for repeat_edge.s0._0._025.preheader"
  %repeat_edge.s0._0._027 = phi i32 [ %1204, %"for repeat_edge.s0._0._025" ], [ 0, %"for repeat_edge.s0._0._025.preheader" ]
  %1011 = shl nsw i32 %repeat_edge.s0._0._027, 5
  %a75 = or i32 %1011, 30
  %1012 = icmp sgt i32 %b77, %a75
  %repeat_edge.s0._0._0i.base.s28 = select i1 %1012, i32 %a75, i32 %b77
  %1013 = add i32 %81, %repeat_edge.s0._0._0i.base.s28
  %1014 = insertelement <32 x i32> undef, i32 %1013, i32 0
  %1015 = shufflevector <32 x i32> %1014, <32 x i32> undef, <32 x i32> zeroinitializer
  %a77 = add nsw <32 x i32> %1015, <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %1016 = shufflevector <32 x i32> %a77, <32 x i32> undef, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %1017 = icmp sgt <8 x i32> %84, %1016
  %1018 = shufflevector <32 x i32> %a77, <32 x i32> undef, <8 x i32> <i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %1019 = icmp sgt <8 x i32> %84, %1018
  %1020 = shufflevector <32 x i32> %a77, <32 x i32> undef, <8 x i32> <i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23>
  %1021 = icmp sgt <8 x i32> %84, %1020
  %1022 = shufflevector <32 x i32> %a77, <32 x i32> undef, <8 x i32> <i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %1023 = icmp sgt <8 x i32> %84, %1022
  %1024 = select <8 x i1> %1017, <8 x i32> %1016, <8 x i32> %84
  %1025 = select <8 x i1> %1019, <8 x i32> %1018, <8 x i32> %84
  %1026 = select <8 x i1> %1021, <8 x i32> %1020, <8 x i32> %84
  %1027 = select <8 x i1> %1023, <8 x i32> %1022, <8 x i32> %84
  %1028 = icmp sgt <8 x i32> %1024, %86
  %1029 = icmp sgt <8 x i32> %1025, %86
  %1030 = icmp sgt <8 x i32> %1026, %86
  %1031 = icmp sgt <8 x i32> %1027, %86
  %1032 = select <8 x i1> %1028, <8 x i32> %1024, <8 x i32> %86
  %1033 = select <8 x i1> %1029, <8 x i32> %1025, <8 x i32> %86
  %1034 = select <8 x i1> %1030, <8 x i32> %1026, <8 x i32> %86
  %1035 = select <8 x i1> %1031, <8 x i32> %1027, <8 x i32> %86
  %1036 = shufflevector <8 x i32> %1032, <8 x i32> %1033, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %1037 = shufflevector <8 x i32> %1034, <8 x i32> %1035, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %1038 = shufflevector <16 x i32> %1036, <16 x i32> %1037, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %1039 = add nsw <32 x i32> %1038, %1009
  %1040 = extractelement <32 x i32> %1039, i32 0
  %1041 = sext i32 %1040 to i64
  %1042 = getelementptr inbounds i8, i8* %input, i64 %1041
  %1043 = load i8, i8* %1042, align 1, !tbaa !378
  %1044 = insertelement <32 x i8> undef, i8 %1043, i32 0
  %1045 = extractelement <32 x i32> %1039, i32 1
  %1046 = sext i32 %1045 to i64
  %1047 = getelementptr inbounds i8, i8* %input, i64 %1046
  %1048 = load i8, i8* %1047, align 1, !tbaa !378
  %1049 = insertelement <32 x i8> %1044, i8 %1048, i32 1
  %1050 = extractelement <32 x i32> %1039, i32 2
  %1051 = sext i32 %1050 to i64
  %1052 = getelementptr inbounds i8, i8* %input, i64 %1051
  %1053 = load i8, i8* %1052, align 1, !tbaa !378
  %1054 = insertelement <32 x i8> %1049, i8 %1053, i32 2
  %1055 = extractelement <32 x i32> %1039, i32 3
  %1056 = sext i32 %1055 to i64
  %1057 = getelementptr inbounds i8, i8* %input, i64 %1056
  %1058 = load i8, i8* %1057, align 1, !tbaa !378
  %1059 = insertelement <32 x i8> %1054, i8 %1058, i32 3
  %1060 = extractelement <32 x i32> %1039, i32 4
  %1061 = sext i32 %1060 to i64
  %1062 = getelementptr inbounds i8, i8* %input, i64 %1061
  %1063 = load i8, i8* %1062, align 1, !tbaa !378
  %1064 = insertelement <32 x i8> %1059, i8 %1063, i32 4
  %1065 = extractelement <32 x i32> %1039, i32 5
  %1066 = sext i32 %1065 to i64
  %1067 = getelementptr inbounds i8, i8* %input, i64 %1066
  %1068 = load i8, i8* %1067, align 1, !tbaa !378
  %1069 = insertelement <32 x i8> %1064, i8 %1068, i32 5
  %1070 = extractelement <32 x i32> %1039, i32 6
  %1071 = sext i32 %1070 to i64
  %1072 = getelementptr inbounds i8, i8* %input, i64 %1071
  %1073 = load i8, i8* %1072, align 1, !tbaa !378
  %1074 = insertelement <32 x i8> %1069, i8 %1073, i32 6
  %1075 = extractelement <32 x i32> %1039, i32 7
  %1076 = sext i32 %1075 to i64
  %1077 = getelementptr inbounds i8, i8* %input, i64 %1076
  %1078 = load i8, i8* %1077, align 1, !tbaa !378
  %1079 = insertelement <32 x i8> %1074, i8 %1078, i32 7
  %1080 = extractelement <32 x i32> %1039, i32 8
  %1081 = sext i32 %1080 to i64
  %1082 = getelementptr inbounds i8, i8* %input, i64 %1081
  %1083 = load i8, i8* %1082, align 1, !tbaa !378
  %1084 = insertelement <32 x i8> %1079, i8 %1083, i32 8
  %1085 = extractelement <32 x i32> %1039, i32 9
  %1086 = sext i32 %1085 to i64
  %1087 = getelementptr inbounds i8, i8* %input, i64 %1086
  %1088 = load i8, i8* %1087, align 1, !tbaa !378
  %1089 = insertelement <32 x i8> %1084, i8 %1088, i32 9
  %1090 = extractelement <32 x i32> %1039, i32 10
  %1091 = sext i32 %1090 to i64
  %1092 = getelementptr inbounds i8, i8* %input, i64 %1091
  %1093 = load i8, i8* %1092, align 1, !tbaa !378
  %1094 = insertelement <32 x i8> %1089, i8 %1093, i32 10
  %1095 = extractelement <32 x i32> %1039, i32 11
  %1096 = sext i32 %1095 to i64
  %1097 = getelementptr inbounds i8, i8* %input, i64 %1096
  %1098 = load i8, i8* %1097, align 1, !tbaa !378
  %1099 = insertelement <32 x i8> %1094, i8 %1098, i32 11
  %1100 = extractelement <32 x i32> %1039, i32 12
  %1101 = sext i32 %1100 to i64
  %1102 = getelementptr inbounds i8, i8* %input, i64 %1101
  %1103 = load i8, i8* %1102, align 1, !tbaa !378
  %1104 = insertelement <32 x i8> %1099, i8 %1103, i32 12
  %1105 = extractelement <32 x i32> %1039, i32 13
  %1106 = sext i32 %1105 to i64
  %1107 = getelementptr inbounds i8, i8* %input, i64 %1106
  %1108 = load i8, i8* %1107, align 1, !tbaa !378
  %1109 = insertelement <32 x i8> %1104, i8 %1108, i32 13
  %1110 = extractelement <32 x i32> %1039, i32 14
  %1111 = sext i32 %1110 to i64
  %1112 = getelementptr inbounds i8, i8* %input, i64 %1111
  %1113 = load i8, i8* %1112, align 1, !tbaa !378
  %1114 = insertelement <32 x i8> %1109, i8 %1113, i32 14
  %1115 = extractelement <32 x i32> %1039, i32 15
  %1116 = sext i32 %1115 to i64
  %1117 = getelementptr inbounds i8, i8* %input, i64 %1116
  %1118 = load i8, i8* %1117, align 1, !tbaa !378
  %1119 = insertelement <32 x i8> %1114, i8 %1118, i32 15
  %1120 = extractelement <32 x i32> %1039, i32 16
  %1121 = sext i32 %1120 to i64
  %1122 = getelementptr inbounds i8, i8* %input, i64 %1121
  %1123 = load i8, i8* %1122, align 1, !tbaa !378
  %1124 = insertelement <32 x i8> %1119, i8 %1123, i32 16
  %1125 = extractelement <32 x i32> %1039, i32 17
  %1126 = sext i32 %1125 to i64
  %1127 = getelementptr inbounds i8, i8* %input, i64 %1126
  %1128 = load i8, i8* %1127, align 1, !tbaa !378
  %1129 = insertelement <32 x i8> %1124, i8 %1128, i32 17
  %1130 = extractelement <32 x i32> %1039, i32 18
  %1131 = sext i32 %1130 to i64
  %1132 = getelementptr inbounds i8, i8* %input, i64 %1131
  %1133 = load i8, i8* %1132, align 1, !tbaa !378
  %1134 = insertelement <32 x i8> %1129, i8 %1133, i32 18
  %1135 = extractelement <32 x i32> %1039, i32 19
  %1136 = sext i32 %1135 to i64
  %1137 = getelementptr inbounds i8, i8* %input, i64 %1136
  %1138 = load i8, i8* %1137, align 1, !tbaa !378
  %1139 = insertelement <32 x i8> %1134, i8 %1138, i32 19
  %1140 = extractelement <32 x i32> %1039, i32 20
  %1141 = sext i32 %1140 to i64
  %1142 = getelementptr inbounds i8, i8* %input, i64 %1141
  %1143 = load i8, i8* %1142, align 1, !tbaa !378
  %1144 = insertelement <32 x i8> %1139, i8 %1143, i32 20
  %1145 = extractelement <32 x i32> %1039, i32 21
  %1146 = sext i32 %1145 to i64
  %1147 = getelementptr inbounds i8, i8* %input, i64 %1146
  %1148 = load i8, i8* %1147, align 1, !tbaa !378
  %1149 = insertelement <32 x i8> %1144, i8 %1148, i32 21
  %1150 = extractelement <32 x i32> %1039, i32 22
  %1151 = sext i32 %1150 to i64
  %1152 = getelementptr inbounds i8, i8* %input, i64 %1151
  %1153 = load i8, i8* %1152, align 1, !tbaa !378
  %1154 = insertelement <32 x i8> %1149, i8 %1153, i32 22
  %1155 = extractelement <32 x i32> %1039, i32 23
  %1156 = sext i32 %1155 to i64
  %1157 = getelementptr inbounds i8, i8* %input, i64 %1156
  %1158 = load i8, i8* %1157, align 1, !tbaa !378
  %1159 = insertelement <32 x i8> %1154, i8 %1158, i32 23
  %1160 = extractelement <32 x i32> %1039, i32 24
  %1161 = sext i32 %1160 to i64
  %1162 = getelementptr inbounds i8, i8* %input, i64 %1161
  %1163 = load i8, i8* %1162, align 1, !tbaa !378
  %1164 = insertelement <32 x i8> %1159, i8 %1163, i32 24
  %1165 = extractelement <32 x i32> %1039, i32 25
  %1166 = sext i32 %1165 to i64
  %1167 = getelementptr inbounds i8, i8* %input, i64 %1166
  %1168 = load i8, i8* %1167, align 1, !tbaa !378
  %1169 = insertelement <32 x i8> %1164, i8 %1168, i32 25
  %1170 = extractelement <32 x i32> %1039, i32 26
  %1171 = sext i32 %1170 to i64
  %1172 = getelementptr inbounds i8, i8* %input, i64 %1171
  %1173 = load i8, i8* %1172, align 1, !tbaa !378
  %1174 = insertelement <32 x i8> %1169, i8 %1173, i32 26
  %1175 = extractelement <32 x i32> %1039, i32 27
  %1176 = sext i32 %1175 to i64
  %1177 = getelementptr inbounds i8, i8* %input, i64 %1176
  %1178 = load i8, i8* %1177, align 1, !tbaa !378
  %1179 = insertelement <32 x i8> %1174, i8 %1178, i32 27
  %1180 = extractelement <32 x i32> %1039, i32 28
  %1181 = sext i32 %1180 to i64
  %1182 = getelementptr inbounds i8, i8* %input, i64 %1181
  %1183 = load i8, i8* %1182, align 1, !tbaa !378
  %1184 = insertelement <32 x i8> %1179, i8 %1183, i32 28
  %1185 = extractelement <32 x i32> %1039, i32 29
  %1186 = sext i32 %1185 to i64
  %1187 = getelementptr inbounds i8, i8* %input, i64 %1186
  %1188 = load i8, i8* %1187, align 1, !tbaa !378
  %1189 = insertelement <32 x i8> %1184, i8 %1188, i32 29
  %1190 = extractelement <32 x i32> %1039, i32 30
  %1191 = sext i32 %1190 to i64
  %1192 = getelementptr inbounds i8, i8* %input, i64 %1191
  %1193 = load i8, i8* %1192, align 1, !tbaa !378
  %1194 = insertelement <32 x i8> %1189, i8 %1193, i32 30
  %1195 = extractelement <32 x i32> %1039, i32 31
  %1196 = sext i32 %1195 to i64
  %1197 = getelementptr inbounds i8, i8* %input, i64 %1196
  %1198 = load i8, i8* %1197, align 1, !tbaa !378
  %1199 = insertelement <32 x i8> %1194, i8 %1198, i32 31
  %1200 = sext i32 %repeat_edge.s0._0._0i.base.s28 to i64
  %1201 = add nsw i64 %1200, %1010
  %1202 = getelementptr inbounds i8, i8* %355, i64 %1201
  %1203 = bitcast i8* %1202 to <32 x i8>*
  store <32 x i8> %1199, <32 x i8>* %1203, align 1, !tbaa !381
  %1204 = add nuw nsw i32 %repeat_edge.s0._0._027, 1
  %.not64 = icmp eq i32 %1204, %t401
  br i1 %.not64, label %"end for repeat_edge.s0._0._026", label %"for repeat_edge.s0._0._025"

"end for repeat_edge.s0._0._026":                 ; preds = %"for repeat_edge.s0._0._025", %"for repeat_edge.s0._1.rebased22"
  %1205 = add nuw nsw i32 %repeat_edge.s0._1.rebased24, 1
  %.not63 = icmp eq i32 %repeat_edge.s0._1.rebased24, %a71.op
  br i1 %.not63, label %"consume repeat_edge30", label %"for repeat_edge.s0._1.rebased22"

"consume repeat_edge30":                          ; preds = %"end for repeat_edge.s0._0._026", %"end for repeat_edge.s0._1.rebased12"
  %t468 = and i32 %359, 15
  %1206 = trunc i64 %357 to i32
  %1207 = add i32 %1206, 2
  %t471 = and i32 %1207, 15
  %1208 = trunc i64 %357 to i32
  %1209 = add i32 %1208, 3
  %t472 = and i32 %1209, 15
  %1210 = trunc i64 %357 to i32
  %1211 = add i32 %1210, 4
  %t473 = and i32 %1211, 15
  %1212 = trunc i64 %357 to i32
  %1213 = add i32 %1212, 5
  %t474 = and i32 %1213, 15
  %1214 = trunc i64 %357 to i32
  %1215 = add i32 %1214, 6
  %t475 = and i32 %1215, 15
  %1216 = trunc i64 %357 to i32
  %1217 = add i32 %1216, 7
  %t476 = and i32 %1217, 15
  %1218 = trunc i64 %357 to i32
  %1219 = add i32 %1218, 8
  %t477 = and i32 %1219, 15
  %1220 = trunc i64 %357 to i32
  %1221 = add i32 %1220, 9
  %t478 = and i32 %1221, 15
  br i1 %80, label %"for input_16.s0.x.x31.preheader", label %"consume input_16", !prof !374

"for input_16.s0.x.x31.preheader":                ; preds = %"consume repeat_edge30"
  %t458 = mul nsw i32 %t468, %t414260
  %t449 = mul nsw i32 %t468, %79
  %t459 = mul nsw i32 %t471, %t414260
  %t450 = mul nsw i32 %t471, %79
  %t460 = mul nsw i32 %t472, %t414260
  %t451 = mul nsw i32 %t472, %79
  %t461 = mul nsw i32 %t473, %t414260
  %t452 = mul nsw i32 %t473, %79
  %t462 = mul nsw i32 %t474, %t414260
  %t453 = mul nsw i32 %t474, %79
  %t463 = mul nsw i32 %t475, %t414260
  %t454 = mul nsw i32 %t475, %79
  %t464 = mul nsw i32 %t476, %t414260
  %t455 = mul nsw i32 %t476, %79
  %t465 = mul nsw i32 %t477, %t414260
  %t456 = mul nsw i32 %t477, %79
  %t466 = mul nsw i32 %t478, %t414260
  %t457 = mul nsw i32 %t478, %79
  %1222 = sext i32 %t449 to i64
  %1223 = sext i32 %t450 to i64
  %1224 = sext i32 %t451 to i64
  %1225 = sext i32 %t452 to i64
  %1226 = sext i32 %t453 to i64
  %1227 = sext i32 %t454 to i64
  %1228 = sext i32 %t455 to i64
  %1229 = sext i32 %t456 to i64
  %1230 = sext i32 %t457 to i64
  %1231 = sext i32 %t458 to i64
  %1232 = sext i32 %t459 to i64
  %1233 = sext i32 %t460 to i64
  %1234 = sext i32 %t461 to i64
  %1235 = sext i32 %t462 to i64
  %1236 = sext i32 %t463 to i64
  %1237 = sext i32 %t464 to i64
  %1238 = sext i32 %t465 to i64
  %1239 = sext i32 %t466 to i64
  br label %"for input_16.s0.x.x31"

"for input_16.s0.x.x31":                          ; preds = %"for input_16.s0.x.x31", %"for input_16.s0.x.x31.preheader"
  %indvars.iv187 = phi i64 [ 0, %"for input_16.s0.x.x31.preheader" ], [ %indvars.iv.next188, %"for input_16.s0.x.x31" ]
  %1240 = shl nuw nsw i64 %indvars.iv187, 5
  %1241 = add nsw i64 %1240, %1222
  %1242 = getelementptr inbounds i8, i8* %55, i64 %1241
  %1243 = bitcast i8* %1242 to <32 x i8>*
  %1244 = load <32 x i8>, <32 x i8>* %1243, align 32, !tbaa !381
  %1245 = add nsw i64 %1240, %1223
  %1246 = getelementptr inbounds i8, i8* %55, i64 %1245
  %1247 = bitcast i8* %1246 to <32 x i8>*
  %1248 = load <32 x i8>, <32 x i8>* %1247, align 32, !tbaa !381
  %1249 = add nsw i64 %1240, %1224
  %1250 = getelementptr inbounds i8, i8* %55, i64 %1249
  %1251 = bitcast i8* %1250 to <32 x i8>*
  %1252 = load <32 x i8>, <32 x i8>* %1251, align 32, !tbaa !381
  %1253 = add nsw i64 %1240, %1225
  %1254 = getelementptr inbounds i8, i8* %55, i64 %1253
  %1255 = bitcast i8* %1254 to <32 x i8>*
  %1256 = load <32 x i8>, <32 x i8>* %1255, align 32, !tbaa !381
  %1257 = add nsw i64 %1240, %1226
  %1258 = getelementptr inbounds i8, i8* %55, i64 %1257
  %1259 = bitcast i8* %1258 to <32 x i8>*
  %1260 = load <32 x i8>, <32 x i8>* %1259, align 32, !tbaa !381
  %1261 = add nsw i64 %1240, %1227
  %1262 = getelementptr inbounds i8, i8* %55, i64 %1261
  %1263 = bitcast i8* %1262 to <32 x i8>*
  %1264 = load <32 x i8>, <32 x i8>* %1263, align 32, !tbaa !381
  %1265 = add nsw i64 %1240, %1228
  %1266 = getelementptr inbounds i8, i8* %55, i64 %1265
  %1267 = bitcast i8* %1266 to <32 x i8>*
  %1268 = load <32 x i8>, <32 x i8>* %1267, align 32, !tbaa !381
  %1269 = add nsw i64 %1240, %1229
  %1270 = getelementptr inbounds i8, i8* %55, i64 %1269
  %1271 = bitcast i8* %1270 to <32 x i8>*
  %1272 = load <32 x i8>, <32 x i8>* %1271, align 32, !tbaa !381
  %1273 = add nsw i64 %1240, %1230
  %1274 = getelementptr inbounds i8, i8* %55, i64 %1273
  %1275 = bitcast i8* %1274 to <32 x i8>*
  %1276 = load <32 x i8>, <32 x i8>* %1275, align 32, !tbaa !381
  %1277 = zext <32 x i8> %1244 to <32 x i16>
  %1278 = shufflevector <32 x i16> %1277, <32 x i16> undef, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %1279 = add nsw i64 %1240, %1231
  %1280 = getelementptr inbounds i16, i16* %input_16, i64 %1279
  %1281 = bitcast i16* %1280 to <16 x i16>*
  store <16 x i16> %1278, <16 x i16>* %1281, align 32, !tbaa !383
  %1282 = shufflevector <32 x i16> %1277, <32 x i16> undef, <16 x i32> <i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %1283 = getelementptr inbounds i16, i16* %1280, i64 16
  %1284 = bitcast i16* %1283 to <16 x i16>*
  store <16 x i16> %1282, <16 x i16>* %1284, align 32, !tbaa !383
  %1285 = zext <32 x i8> %1248 to <32 x i16>
  %1286 = shufflevector <32 x i16> %1285, <32 x i16> undef, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %1287 = add nsw i64 %1240, %1232
  %1288 = getelementptr inbounds i16, i16* %input_16, i64 %1287
  %1289 = bitcast i16* %1288 to <16 x i16>*
  store <16 x i16> %1286, <16 x i16>* %1289, align 32, !tbaa !383
  %1290 = shufflevector <32 x i16> %1285, <32 x i16> undef, <16 x i32> <i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %1291 = getelementptr inbounds i16, i16* %1288, i64 16
  %1292 = bitcast i16* %1291 to <16 x i16>*
  store <16 x i16> %1290, <16 x i16>* %1292, align 32, !tbaa !383
  %1293 = zext <32 x i8> %1252 to <32 x i16>
  %1294 = shufflevector <32 x i16> %1293, <32 x i16> undef, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %1295 = add nsw i64 %1240, %1233
  %1296 = getelementptr inbounds i16, i16* %input_16, i64 %1295
  %1297 = bitcast i16* %1296 to <16 x i16>*
  store <16 x i16> %1294, <16 x i16>* %1297, align 32, !tbaa !383
  %1298 = shufflevector <32 x i16> %1293, <32 x i16> undef, <16 x i32> <i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %1299 = getelementptr inbounds i16, i16* %1296, i64 16
  %1300 = bitcast i16* %1299 to <16 x i16>*
  store <16 x i16> %1298, <16 x i16>* %1300, align 32, !tbaa !383
  %1301 = zext <32 x i8> %1256 to <32 x i16>
  %1302 = shufflevector <32 x i16> %1301, <32 x i16> undef, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %1303 = add nsw i64 %1240, %1234
  %1304 = getelementptr inbounds i16, i16* %input_16, i64 %1303
  %1305 = bitcast i16* %1304 to <16 x i16>*
  store <16 x i16> %1302, <16 x i16>* %1305, align 32, !tbaa !383
  %1306 = shufflevector <32 x i16> %1301, <32 x i16> undef, <16 x i32> <i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %1307 = getelementptr inbounds i16, i16* %1304, i64 16
  %1308 = bitcast i16* %1307 to <16 x i16>*
  store <16 x i16> %1306, <16 x i16>* %1308, align 32, !tbaa !383
  %1309 = zext <32 x i8> %1260 to <32 x i16>
  %1310 = shufflevector <32 x i16> %1309, <32 x i16> undef, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %1311 = add nsw i64 %1240, %1235
  %1312 = getelementptr inbounds i16, i16* %input_16, i64 %1311
  %1313 = bitcast i16* %1312 to <16 x i16>*
  store <16 x i16> %1310, <16 x i16>* %1313, align 32, !tbaa !383
  %1314 = shufflevector <32 x i16> %1309, <32 x i16> undef, <16 x i32> <i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %1315 = getelementptr inbounds i16, i16* %1312, i64 16
  %1316 = bitcast i16* %1315 to <16 x i16>*
  store <16 x i16> %1314, <16 x i16>* %1316, align 32, !tbaa !383
  %1317 = zext <32 x i8> %1264 to <32 x i16>
  %1318 = shufflevector <32 x i16> %1317, <32 x i16> undef, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %1319 = add nsw i64 %1240, %1236
  %1320 = getelementptr inbounds i16, i16* %input_16, i64 %1319
  %1321 = bitcast i16* %1320 to <16 x i16>*
  store <16 x i16> %1318, <16 x i16>* %1321, align 32, !tbaa !383
  %1322 = shufflevector <32 x i16> %1317, <32 x i16> undef, <16 x i32> <i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %1323 = getelementptr inbounds i16, i16* %1320, i64 16
  %1324 = bitcast i16* %1323 to <16 x i16>*
  store <16 x i16> %1322, <16 x i16>* %1324, align 32, !tbaa !383
  %1325 = zext <32 x i8> %1268 to <32 x i16>
  %1326 = shufflevector <32 x i16> %1325, <32 x i16> undef, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %1327 = add nsw i64 %1240, %1237
  %1328 = getelementptr inbounds i16, i16* %input_16, i64 %1327
  %1329 = bitcast i16* %1328 to <16 x i16>*
  store <16 x i16> %1326, <16 x i16>* %1329, align 32, !tbaa !383
  %1330 = shufflevector <32 x i16> %1325, <32 x i16> undef, <16 x i32> <i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %1331 = getelementptr inbounds i16, i16* %1328, i64 16
  %1332 = bitcast i16* %1331 to <16 x i16>*
  store <16 x i16> %1330, <16 x i16>* %1332, align 32, !tbaa !383
  %1333 = zext <32 x i8> %1272 to <32 x i16>
  %1334 = shufflevector <32 x i16> %1333, <32 x i16> undef, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %1335 = add nsw i64 %1240, %1238
  %1336 = getelementptr inbounds i16, i16* %input_16, i64 %1335
  %1337 = bitcast i16* %1336 to <16 x i16>*
  store <16 x i16> %1334, <16 x i16>* %1337, align 32, !tbaa !383
  %1338 = shufflevector <32 x i16> %1333, <32 x i16> undef, <16 x i32> <i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %1339 = getelementptr inbounds i16, i16* %1336, i64 16
  %1340 = bitcast i16* %1339 to <16 x i16>*
  store <16 x i16> %1338, <16 x i16>* %1340, align 32, !tbaa !383
  %1341 = zext <32 x i8> %1276 to <32 x i16>
  %1342 = shufflevector <32 x i16> %1341, <32 x i16> undef, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %1343 = add nsw i64 %1240, %1239
  %1344 = getelementptr inbounds i16, i16* %input_16, i64 %1343
  %1345 = bitcast i16* %1344 to <16 x i16>*
  store <16 x i16> %1342, <16 x i16>* %1345, align 32, !tbaa !383
  %1346 = shufflevector <32 x i16> %1341, <32 x i16> undef, <16 x i32> <i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %1347 = getelementptr inbounds i16, i16* %1344, i64 16
  %1348 = bitcast i16* %1347 to <16 x i16>*
  store <16 x i16> %1346, <16 x i16>* %1348, align 32, !tbaa !383
  %indvars.iv.next188 = add nuw nsw i64 %indvars.iv187, 1
  %.not62 = icmp eq i64 %indvars.iv.next188, %.pre-phi
  br i1 %.not62, label %"consume input_16", label %"for input_16.s0.x.x31"

"consume input_16":                               ; preds = %"for input_16.s0.x.x31", %"consume repeat_edge30"
  br i1 %330, label %"assert succeeded39.lr.ph", label %destructor_block, !prof !374

"assert succeeded39.lr.ph":                       ; preds = %"consume input_16"
  %1349 = trunc i64 %357 to i32
  %.fca.1.gep47.promoted = load i64, i64* %.fca.1.gep47, align 8, !tbaa !375
  %.fca.0.gep46.promoted = load i8*, i8** %.fca.0.gep46, align 8, !tbaa !377
  br label %"assert succeeded39"

"end for output.s0.y.yi.yii":                     ; preds = %after_bb
  store i64 %1359, i64* %.fca.1.gep47, align 8, !tbaa !375
  store i8* %1358, i8** %.fca.0.gep46, align 8, !tbaa !377
  %indvars.iv.next198 = add nuw nsw i64 %indvars.iv197, 1
  %.not59 = icmp eq i64 %indvars.iv.next198, 4
  br i1 %.not59, label %destructor_block.thread143, label %"for output.s0.y.yi.yi.$n"

"assert succeeded39":                             ; preds = %after_bb, %"assert succeeded39.lr.ph"
  %1350 = phi i8* [ %.fca.0.gep46.promoted, %"assert succeeded39.lr.ph" ], [ %1358, %after_bb ]
  %1351 = phi i64 [ %.fca.1.gep47.promoted, %"assert succeeded39.lr.ph" ], [ %1359, %after_bb ]
  %indvars.iv195 = phi i64 [ 0, %"assert succeeded39.lr.ph" ], [ %indvars.iv.next196, %after_bb ]
  %1352 = icmp ult i64 %1351, %333
  br i1 %1352, label %1353, label %pseudostack_alloc.exit76, !prof !385

1353:                                             ; preds = %"assert succeeded39"
  %1354 = icmp eq i8* %1350, null
  br i1 %1354, label %1356, label %1355

1355:                                             ; preds = %1353
  tail call void @halide_free(i8* %__user_context, i8* nonnull %1350) #12
  br label %1356

1356:                                             ; preds = %1355, %1353
  %1357 = tail call i8* @halide_malloc(i8* %__user_context, i64 %333) #12
  br label %pseudostack_alloc.exit76

pseudostack_alloc.exit76:                         ; preds = %1356, %"assert succeeded39"
  %1358 = phi i8* [ %1357, %1356 ], [ %1350, %"assert succeeded39" ]
  %1359 = phi i64 [ %333, %1356 ], [ %1351, %"assert succeeded39" ]
  %sobel_y = bitcast i8* %1358 to i16*
  %1360 = trunc i64 %indvars.iv195 to i32
  %t480 = add nsw i32 %1360, %1349
  br i1 %334, label %"for sobel_y.s0.x.x.preheader", label %"pseudostack_alloc.exit76.consume sobel_y_crit_edge", !prof !374

"pseudostack_alloc.exit76.consume sobel_y_crit_edge": ; preds = %pseudostack_alloc.exit76
  %.pre249 = add nsw i32 %t480, 15
  %.pre251 = and i32 %.pre249, 15
  %.pre253 = add nsw i32 %t480, 1
  %.pre255 = and i32 %.pre253, 15
  br label %"consume sobel_y"

"for sobel_y.s0.x.x.preheader":                   ; preds = %pseudostack_alloc.exit76
  %1361 = and i32 %t480, 15
  %1362 = zext i32 %1361 to i64
  %1363 = mul nsw i64 %336, %1362
  %1364 = add nsw i32 %t480, 1
  %1365 = and i32 %1364, 15
  %1366 = zext i32 %1365 to i64
  %1367 = mul nsw i64 %336, %1366
  %1368 = add nsw i32 %t480, 15
  %1369 = and i32 %1368, 15
  %1370 = zext i32 %1369 to i64
  %1371 = mul nsw i64 %336, %1370
  br label %"for sobel_y.s0.x.x"

"for sobel_y.s0.x.x":                             ; preds = %"for sobel_y.s0.x.x", %"for sobel_y.s0.x.x.preheader"
  %indvars.iv189 = phi i64 [ 0, %"for sobel_y.s0.x.x.preheader" ], [ %indvars.iv.next190, %"for sobel_y.s0.x.x" ]
  %1372 = shl nuw nsw i64 %indvars.iv189, 7
  %1373 = add nsw i64 %1372, %1363
  %1374 = getelementptr inbounds i16, i16* %input_16, i64 %1373
  %1375 = bitcast i16* %1374 to <16 x i16>*
  %1376 = load <16 x i16>, <16 x i16>* %1375, align 32, !tbaa !383
  %1377 = shl <16 x i16> %1376, <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>
  %1378 = add nsw i64 %1372, %1367
  %1379 = getelementptr inbounds i16, i16* %input_16, i64 %1378
  %1380 = bitcast i16* %1379 to <16 x i16>*
  %1381 = load <16 x i16>, <16 x i16>* %1380, align 32, !tbaa !383
  %1382 = add nsw i64 %1372, %1371
  %1383 = getelementptr inbounds i16, i16* %input_16, i64 %1382
  %1384 = bitcast i16* %1383 to <16 x i16>*
  %1385 = load <16 x i16>, <16 x i16>* %1384, align 32, !tbaa !383
  %1386 = add <16 x i16> %1377, %1381
  %1387 = add <16 x i16> %1386, %1385
  store <16 x i16> %1387, <16 x i16>* %sobel_x54.0.sroa_cast204, align 32, !tbaa !386
  %1388 = getelementptr inbounds i16, i16* %1374, i64 16
  %1389 = bitcast i16* %1388 to <16 x i16>*
  %1390 = load <16 x i16>, <16 x i16>* %1389, align 32, !tbaa !383
  %1391 = shl <16 x i16> %1390, <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>
  %1392 = getelementptr inbounds i16, i16* %1379, i64 16
  %1393 = bitcast i16* %1392 to <16 x i16>*
  %1394 = load <16 x i16>, <16 x i16>* %1393, align 32, !tbaa !383
  %1395 = getelementptr inbounds i16, i16* %1383, i64 16
  %1396 = bitcast i16* %1395 to <16 x i16>*
  %1397 = load <16 x i16>, <16 x i16>* %1396, align 32, !tbaa !383
  %1398 = add <16 x i16> %1391, %1394
  %1399 = add <16 x i16> %1398, %1397
  store <16 x i16> %1399, <16 x i16>* %sobel_x54.32.sroa_cast212, align 32, !tbaa !395
  %1400 = getelementptr inbounds i16, i16* %1374, i64 32
  %1401 = bitcast i16* %1400 to <16 x i16>*
  %1402 = load <16 x i16>, <16 x i16>* %1401, align 32, !tbaa !383
  %1403 = shl <16 x i16> %1402, <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>
  %1404 = getelementptr inbounds i16, i16* %1379, i64 32
  %1405 = bitcast i16* %1404 to <16 x i16>*
  %1406 = load <16 x i16>, <16 x i16>* %1405, align 32, !tbaa !383
  %1407 = getelementptr inbounds i16, i16* %1383, i64 32
  %1408 = bitcast i16* %1407 to <16 x i16>*
  %1409 = load <16 x i16>, <16 x i16>* %1408, align 32, !tbaa !383
  %1410 = add <16 x i16> %1403, %1406
  %1411 = add <16 x i16> %1410, %1409
  store <16 x i16> %1411, <16 x i16>* %sobel_x54.64.sroa_cast220, align 32, !tbaa !397
  %1412 = getelementptr inbounds i16, i16* %1374, i64 48
  %1413 = bitcast i16* %1412 to <16 x i16>*
  %1414 = load <16 x i16>, <16 x i16>* %1413, align 32, !tbaa !383
  %1415 = shl <16 x i16> %1414, <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>
  %1416 = getelementptr inbounds i16, i16* %1379, i64 48
  %1417 = bitcast i16* %1416 to <16 x i16>*
  %1418 = load <16 x i16>, <16 x i16>* %1417, align 32, !tbaa !383
  %1419 = getelementptr inbounds i16, i16* %1383, i64 48
  %1420 = bitcast i16* %1419 to <16 x i16>*
  %1421 = load <16 x i16>, <16 x i16>* %1420, align 32, !tbaa !383
  %1422 = add <16 x i16> %1415, %1418
  %1423 = add <16 x i16> %1422, %1421
  store <16 x i16> %1423, <16 x i16>* %sobel_x54.96.sroa_cast228, align 32, !tbaa !400
  %1424 = getelementptr inbounds i16, i16* %1374, i64 64
  %1425 = bitcast i16* %1424 to <16 x i16>*
  %1426 = load <16 x i16>, <16 x i16>* %1425, align 32, !tbaa !383
  %1427 = shl <16 x i16> %1426, <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>
  %1428 = getelementptr inbounds i16, i16* %1379, i64 64
  %1429 = bitcast i16* %1428 to <16 x i16>*
  %1430 = load <16 x i16>, <16 x i16>* %1429, align 32, !tbaa !383
  %1431 = getelementptr inbounds i16, i16* %1383, i64 64
  %1432 = bitcast i16* %1431 to <16 x i16>*
  %1433 = load <16 x i16>, <16 x i16>* %1432, align 32, !tbaa !383
  %1434 = add <16 x i16> %1427, %1430
  %1435 = add <16 x i16> %1434, %1433
  store <16 x i16> %1435, <16 x i16>* %sobel_x54.128.sroa_cast232, align 32, !tbaa !402
  %1436 = getelementptr inbounds i16, i16* %1374, i64 80
  %1437 = bitcast i16* %1436 to <16 x i16>*
  %1438 = load <16 x i16>, <16 x i16>* %1437, align 32, !tbaa !383
  %1439 = shl <16 x i16> %1438, <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>
  %1440 = getelementptr inbounds i16, i16* %1379, i64 80
  %1441 = bitcast i16* %1440 to <16 x i16>*
  %1442 = load <16 x i16>, <16 x i16>* %1441, align 32, !tbaa !383
  %1443 = getelementptr inbounds i16, i16* %1383, i64 80
  %1444 = bitcast i16* %1443 to <16 x i16>*
  %1445 = load <16 x i16>, <16 x i16>* %1444, align 32, !tbaa !383
  %1446 = add <16 x i16> %1439, %1442
  %1447 = add <16 x i16> %1446, %1445
  store <16 x i16> %1447, <16 x i16>* %sobel_x54.160.sroa_cast236, align 32, !tbaa !406
  %1448 = getelementptr inbounds i16, i16* %1374, i64 96
  %1449 = bitcast i16* %1448 to <16 x i16>*
  %1450 = load <16 x i16>, <16 x i16>* %1449, align 32, !tbaa !383
  %1451 = shl <16 x i16> %1450, <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>
  %1452 = getelementptr inbounds i16, i16* %1379, i64 96
  %1453 = bitcast i16* %1452 to <16 x i16>*
  %1454 = load <16 x i16>, <16 x i16>* %1453, align 32, !tbaa !383
  %1455 = getelementptr inbounds i16, i16* %1383, i64 96
  %1456 = bitcast i16* %1455 to <16 x i16>*
  %1457 = load <16 x i16>, <16 x i16>* %1456, align 32, !tbaa !383
  %1458 = add <16 x i16> %1451, %1454
  %1459 = add <16 x i16> %1458, %1457
  store <16 x i16> %1459, <16 x i16>* %sobel_x54.192.sroa_cast240, align 32, !tbaa !408
  %1460 = getelementptr inbounds i16, i16* %1374, i64 112
  %1461 = bitcast i16* %1460 to <16 x i16>*
  %1462 = load <16 x i16>, <16 x i16>* %1461, align 32, !tbaa !383
  %1463 = shl <16 x i16> %1462, <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>
  %1464 = getelementptr inbounds i16, i16* %1379, i64 112
  %1465 = bitcast i16* %1464 to <16 x i16>*
  %1466 = load <16 x i16>, <16 x i16>* %1465, align 32, !tbaa !383
  %1467 = getelementptr inbounds i16, i16* %1383, i64 112
  %1468 = bitcast i16* %1467 to <16 x i16>*
  %1469 = load <16 x i16>, <16 x i16>* %1468, align 32, !tbaa !383
  %1470 = add <16 x i16> %1463, %1466
  %1471 = add <16 x i16> %1470, %1469
  store <16 x i16> %1471, <16 x i16>* %sobel_x54.224.sroa_cast244, align 32, !tbaa !411
  %1472 = getelementptr inbounds i16, i16* %1374, i64 128
  %1473 = bitcast i16* %1472 to <16 x i16>*
  %1474 = load <16 x i16>, <16 x i16>* %1473, align 32, !tbaa !383
  %1475 = shl <16 x i16> %1474, <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>
  %1476 = getelementptr inbounds i16, i16* %1379, i64 128
  %1477 = bitcast i16* %1476 to <16 x i16>*
  %1478 = load <16 x i16>, <16 x i16>* %1477, align 32, !tbaa !383
  %1479 = getelementptr inbounds i16, i16* %1383, i64 128
  %1480 = bitcast i16* %1479 to <16 x i16>*
  %1481 = load <16 x i16>, <16 x i16>* %1480, align 32, !tbaa !383
  %1482 = add <16 x i16> %1475, %1478
  %1483 = add <16 x i16> %1482, %1481
  store <16 x i16> %1483, <16 x i16>* %sobel_x54.256.sroa_cast248, align 32, !tbaa !413
  %sobel_x54.4.sobel_x54.4.b84 = load <16 x i16>, <16 x i16>* %sobel_x54.4.sroa_cast206, align 4, !tbaa !418
  %1484 = icmp ugt <16 x i16> %sobel_x54.4.sobel_x54.4.b84, %1387
  %1485 = sub <16 x i16> %sobel_x54.4.sobel_x54.4.b84, %1387
  %1486 = sub <16 x i16> %1387, %sobel_x54.4.sobel_x54.4.b84
  %1487 = select <16 x i1> %1484, <16 x i16> %1485, <16 x i16> %1486
  %1488 = getelementptr inbounds i16, i16* %sobel_y, i64 %1372
  %1489 = bitcast i16* %1488 to <16 x i16>*
  store <16 x i16> %1487, <16 x i16>* %1489, align 32, !tbaa !419
  %sobel_x54.36.sobel_x54.36.b85 = load <16 x i16>, <16 x i16>* %sobel_x54.36.sroa_cast214, align 4, !tbaa !421
  %1490 = icmp ugt <16 x i16> %sobel_x54.36.sobel_x54.36.b85, %1399
  %1491 = sub <16 x i16> %sobel_x54.36.sobel_x54.36.b85, %1399
  %1492 = sub <16 x i16> %1399, %sobel_x54.36.sobel_x54.36.b85
  %1493 = select <16 x i1> %1490, <16 x i16> %1491, <16 x i16> %1492
  %1494 = getelementptr inbounds i16, i16* %1488, i64 16
  %1495 = bitcast i16* %1494 to <16 x i16>*
  store <16 x i16> %1493, <16 x i16>* %1495, align 32, !tbaa !419
  %sobel_x54.68.sobel_x54.68.b86 = load <16 x i16>, <16 x i16>* %sobel_x54.68.sroa_cast222, align 4, !tbaa !422
  %1496 = icmp ugt <16 x i16> %sobel_x54.68.sobel_x54.68.b86, %1411
  %1497 = sub <16 x i16> %sobel_x54.68.sobel_x54.68.b86, %1411
  %1498 = sub <16 x i16> %1411, %sobel_x54.68.sobel_x54.68.b86
  %1499 = select <16 x i1> %1496, <16 x i16> %1497, <16 x i16> %1498
  %1500 = getelementptr inbounds i16, i16* %1488, i64 32
  %1501 = bitcast i16* %1500 to <16 x i16>*
  store <16 x i16> %1499, <16 x i16>* %1501, align 32, !tbaa !419
  %sobel_x54.100.sobel_x54.100.b87 = load <16 x i16>, <16 x i16>* %sobel_x54.100.sroa_cast230, align 4, !tbaa !423
  %1502 = icmp ugt <16 x i16> %sobel_x54.100.sobel_x54.100.b87, %1423
  %1503 = sub <16 x i16> %sobel_x54.100.sobel_x54.100.b87, %1423
  %1504 = sub <16 x i16> %1423, %sobel_x54.100.sobel_x54.100.b87
  %1505 = select <16 x i1> %1502, <16 x i16> %1503, <16 x i16> %1504
  %1506 = getelementptr inbounds i16, i16* %1488, i64 48
  %1507 = bitcast i16* %1506 to <16 x i16>*
  store <16 x i16> %1505, <16 x i16>* %1507, align 32, !tbaa !419
  %sobel_x54.132.sobel_x54.132.b88 = load <16 x i16>, <16 x i16>* %sobel_x54.132.sroa_cast234, align 4, !tbaa !424
  %1508 = icmp ugt <16 x i16> %sobel_x54.132.sobel_x54.132.b88, %1435
  %1509 = sub <16 x i16> %sobel_x54.132.sobel_x54.132.b88, %1435
  %1510 = sub <16 x i16> %1435, %sobel_x54.132.sobel_x54.132.b88
  %1511 = select <16 x i1> %1508, <16 x i16> %1509, <16 x i16> %1510
  %1512 = getelementptr inbounds i16, i16* %1488, i64 64
  %1513 = bitcast i16* %1512 to <16 x i16>*
  store <16 x i16> %1511, <16 x i16>* %1513, align 32, !tbaa !419
  %sobel_x54.164.sobel_x54.164.b89 = load <16 x i16>, <16 x i16>* %sobel_x54.164.sroa_cast238, align 4, !tbaa !425
  %1514 = icmp ugt <16 x i16> %sobel_x54.164.sobel_x54.164.b89, %1447
  %1515 = sub <16 x i16> %sobel_x54.164.sobel_x54.164.b89, %1447
  %1516 = sub <16 x i16> %1447, %sobel_x54.164.sobel_x54.164.b89
  %1517 = select <16 x i1> %1514, <16 x i16> %1515, <16 x i16> %1516
  %1518 = getelementptr inbounds i16, i16* %1488, i64 80
  %1519 = bitcast i16* %1518 to <16 x i16>*
  store <16 x i16> %1517, <16 x i16>* %1519, align 32, !tbaa !419
  %sobel_x54.196.sobel_x54.196.b90 = load <16 x i16>, <16 x i16>* %sobel_x54.196.sroa_cast242, align 4, !tbaa !426
  %1520 = icmp ugt <16 x i16> %sobel_x54.196.sobel_x54.196.b90, %1459
  %1521 = sub <16 x i16> %sobel_x54.196.sobel_x54.196.b90, %1459
  %1522 = sub <16 x i16> %1459, %sobel_x54.196.sobel_x54.196.b90
  %1523 = select <16 x i1> %1520, <16 x i16> %1521, <16 x i16> %1522
  %1524 = getelementptr inbounds i16, i16* %1488, i64 96
  %1525 = bitcast i16* %1524 to <16 x i16>*
  store <16 x i16> %1523, <16 x i16>* %1525, align 32, !tbaa !419
  %sobel_x54.228.sobel_x54.228.b91 = load <16 x i16>, <16 x i16>* %sobel_x54.228.sroa_cast246, align 4, !tbaa !427
  %1526 = icmp ugt <16 x i16> %sobel_x54.228.sobel_x54.228.b91, %1471
  %1527 = sub <16 x i16> %sobel_x54.228.sobel_x54.228.b91, %1471
  %1528 = sub <16 x i16> %1471, %sobel_x54.228.sobel_x54.228.b91
  %1529 = select <16 x i1> %1526, <16 x i16> %1527, <16 x i16> %1528
  %1530 = getelementptr inbounds i16, i16* %1488, i64 112
  %1531 = bitcast i16* %1530 to <16 x i16>*
  store <16 x i16> %1529, <16 x i16>* %1531, align 32, !tbaa !419
  %indvars.iv.next190 = add nuw nsw i64 %indvars.iv189, 1
  %.not61 = icmp eq i64 %indvars.iv.next190, %346
  br i1 %.not61, label %"consume sobel_y", label %"for sobel_y.s0.x.x"

"consume sobel_y":                                ; preds = %"for sobel_y.s0.x.x", %"pseudostack_alloc.exit76.consume sobel_y_crit_edge"
  %.pre-phi256 = phi i32 [ %.pre255, %"pseudostack_alloc.exit76.consume sobel_y_crit_edge" ], [ %1365, %"for sobel_y.s0.x.x" ]
  %.pre-phi252 = phi i32 [ %.pre251, %"pseudostack_alloc.exit76.consume sobel_y_crit_edge" ], [ %1369, %"for sobel_y.s0.x.x" ]
  %t481 = mul nsw i32 %.pre-phi252, %t414260
  %t483 = mul nsw i32 %.pre-phi256, %t414260
  br i1 %337, label %"for output.s0.x.x.preheader", label %"end for output.s0.x.x", !prof !374

"for output.s0.x.x.preheader":                    ; preds = %"consume sobel_y"
  %1532 = mul nsw i32 %t480, %output.stride.1
  %t484 = add nsw i32 %1532, %t392
  %1533 = sext i32 %t484 to i64
  %1534 = sext i32 %t483 to i64
  %1535 = sext i32 %t481 to i64
  br label %"for output.s0.x.x"

"for output.s0.x.x":                              ; preds = %"for output.s0.x.x", %"for output.s0.x.x.preheader"
  %indvars.iv191 = phi i64 [ 0, %"for output.s0.x.x.preheader" ], [ %indvars.iv.next192, %"for output.s0.x.x" ]
  %1536 = shl nsw i64 %indvars.iv191, 6
  %1537 = add nsw i64 %1536, %1535
  %1538 = getelementptr inbounds i16, i16* %input_16, i64 %1537
  %1539 = getelementptr inbounds i16, i16* %1538, i64 1
  %1540 = bitcast i16* %1539 to <16 x i16>*
  %1541 = load <16 x i16>, <16 x i16>* %1540, align 2, !tbaa !383
  %1542 = shl <16 x i16> %1541, <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>
  %1543 = getelementptr inbounds i16, i16* %1538, i64 2
  %1544 = bitcast i16* %1543 to <16 x i16>*
  %1545 = load <16 x i16>, <16 x i16>* %1544, align 4, !tbaa !383
  %1546 = bitcast i16* %1538 to <16 x i16>*
  %1547 = load <16 x i16>, <16 x i16>* %1546, align 32, !tbaa !383
  %1548 = add <16 x i16> %1542, %1545
  %1549 = add <16 x i16> %1548, %1547
  %1550 = getelementptr inbounds i16, i16* %1538, i64 17
  %1551 = bitcast i16* %1550 to <16 x i16>*
  %1552 = load <16 x i16>, <16 x i16>* %1551, align 2, !tbaa !383
  %1553 = shl <16 x i16> %1552, <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>
  %1554 = getelementptr inbounds i16, i16* %1538, i64 18
  %1555 = bitcast i16* %1554 to <16 x i16>*
  %1556 = load <16 x i16>, <16 x i16>* %1555, align 4, !tbaa !383
  %1557 = getelementptr inbounds i16, i16* %1538, i64 16
  %1558 = bitcast i16* %1557 to <16 x i16>*
  %1559 = load <16 x i16>, <16 x i16>* %1558, align 32, !tbaa !383
  %1560 = add <16 x i16> %1553, %1556
  %1561 = add <16 x i16> %1560, %1559
  %1562 = getelementptr inbounds i16, i16* %1538, i64 33
  %1563 = bitcast i16* %1562 to <16 x i16>*
  %1564 = load <16 x i16>, <16 x i16>* %1563, align 2, !tbaa !383
  %1565 = shl <16 x i16> %1564, <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>
  %1566 = getelementptr inbounds i16, i16* %1538, i64 34
  %1567 = bitcast i16* %1566 to <16 x i16>*
  %1568 = load <16 x i16>, <16 x i16>* %1567, align 4, !tbaa !383
  %1569 = getelementptr inbounds i16, i16* %1538, i64 32
  %1570 = bitcast i16* %1569 to <16 x i16>*
  %1571 = load <16 x i16>, <16 x i16>* %1570, align 32, !tbaa !383
  %1572 = add <16 x i16> %1565, %1568
  %1573 = add <16 x i16> %1572, %1571
  %1574 = getelementptr inbounds i16, i16* %1538, i64 49
  %1575 = bitcast i16* %1574 to <16 x i16>*
  %1576 = load <16 x i16>, <16 x i16>* %1575, align 2, !tbaa !383
  %1577 = shl <16 x i16> %1576, <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>
  %1578 = getelementptr inbounds i16, i16* %1538, i64 50
  %1579 = bitcast i16* %1578 to <16 x i16>*
  %1580 = load <16 x i16>, <16 x i16>* %1579, align 4, !tbaa !383
  %1581 = getelementptr inbounds i16, i16* %1538, i64 48
  %1582 = bitcast i16* %1581 to <16 x i16>*
  %1583 = load <16 x i16>, <16 x i16>* %1582, align 32, !tbaa !383
  %1584 = add <16 x i16> %1577, %1580
  %1585 = add <16 x i16> %1584, %1583
  %1586 = add nsw i64 %1536, %1534
  %1587 = getelementptr inbounds i16, i16* %input_16, i64 %1586
  %1588 = getelementptr inbounds i16, i16* %1587, i64 1
  %1589 = bitcast i16* %1588 to <16 x i16>*
  %1590 = load <16 x i16>, <16 x i16>* %1589, align 2, !tbaa !383
  %1591 = shl <16 x i16> %1590, <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>
  %1592 = getelementptr inbounds i16, i16* %1587, i64 2
  %1593 = bitcast i16* %1592 to <16 x i16>*
  %1594 = load <16 x i16>, <16 x i16>* %1593, align 4, !tbaa !383
  %1595 = bitcast i16* %1587 to <16 x i16>*
  %1596 = load <16 x i16>, <16 x i16>* %1595, align 32, !tbaa !383
  %1597 = add <16 x i16> %1591, %1594
  %1598 = add <16 x i16> %1597, %1596
  %1599 = getelementptr inbounds i16, i16* %1587, i64 17
  %1600 = bitcast i16* %1599 to <16 x i16>*
  %1601 = load <16 x i16>, <16 x i16>* %1600, align 2, !tbaa !383
  %1602 = shl <16 x i16> %1601, <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>
  %1603 = getelementptr inbounds i16, i16* %1587, i64 18
  %1604 = bitcast i16* %1603 to <16 x i16>*
  %1605 = load <16 x i16>, <16 x i16>* %1604, align 4, !tbaa !383
  %1606 = getelementptr inbounds i16, i16* %1587, i64 16
  %1607 = bitcast i16* %1606 to <16 x i16>*
  %1608 = load <16 x i16>, <16 x i16>* %1607, align 32, !tbaa !383
  %1609 = add <16 x i16> %1602, %1605
  %1610 = add <16 x i16> %1609, %1608
  %1611 = getelementptr inbounds i16, i16* %1587, i64 33
  %1612 = bitcast i16* %1611 to <16 x i16>*
  %1613 = load <16 x i16>, <16 x i16>* %1612, align 2, !tbaa !383
  %1614 = shl <16 x i16> %1613, <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>
  %1615 = getelementptr inbounds i16, i16* %1587, i64 34
  %1616 = bitcast i16* %1615 to <16 x i16>*
  %1617 = load <16 x i16>, <16 x i16>* %1616, align 4, !tbaa !383
  %1618 = getelementptr inbounds i16, i16* %1587, i64 32
  %1619 = bitcast i16* %1618 to <16 x i16>*
  %1620 = load <16 x i16>, <16 x i16>* %1619, align 32, !tbaa !383
  %1621 = add <16 x i16> %1614, %1617
  %1622 = add <16 x i16> %1621, %1620
  %1623 = getelementptr inbounds i16, i16* %1587, i64 49
  %1624 = bitcast i16* %1623 to <16 x i16>*
  %1625 = load <16 x i16>, <16 x i16>* %1624, align 2, !tbaa !383
  %1626 = shl <16 x i16> %1625, <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>
  %1627 = getelementptr inbounds i16, i16* %1587, i64 50
  %1628 = bitcast i16* %1627 to <16 x i16>*
  %1629 = load <16 x i16>, <16 x i16>* %1628, align 4, !tbaa !383
  %1630 = getelementptr inbounds i16, i16* %1587, i64 48
  %1631 = bitcast i16* %1630 to <16 x i16>*
  %1632 = load <16 x i16>, <16 x i16>* %1631, align 32, !tbaa !383
  %1633 = add <16 x i16> %1626, %1629
  %1634 = add <16 x i16> %1633, %1632
  %1635 = icmp ugt <16 x i16> %1598, %1549
  %1636 = sub <16 x i16> %1598, %1549
  %1637 = sub <16 x i16> %1549, %1598
  %1638 = select <16 x i1> %1635, <16 x i16> %1636, <16 x i16> %1637
  %1639 = icmp ugt <16 x i16> %1610, %1561
  %1640 = sub <16 x i16> %1610, %1561
  %1641 = sub <16 x i16> %1561, %1610
  %1642 = select <16 x i1> %1639, <16 x i16> %1640, <16 x i16> %1641
  %1643 = icmp ugt <16 x i16> %1622, %1573
  %1644 = sub <16 x i16> %1622, %1573
  %1645 = sub <16 x i16> %1573, %1622
  %1646 = select <16 x i1> %1643, <16 x i16> %1644, <16 x i16> %1645
  %1647 = icmp ugt <16 x i16> %1634, %1585
  %1648 = sub <16 x i16> %1634, %1585
  %1649 = sub <16 x i16> %1585, %1634
  %1650 = select <16 x i1> %1647, <16 x i16> %1648, <16 x i16> %1649
  %1651 = getelementptr inbounds i16, i16* %sobel_y, i64 %1536
  %1652 = bitcast i16* %1651 to <16 x i16>*
  %1653 = load <16 x i16>, <16 x i16>* %1652, align 32, !tbaa !419
  %1654 = getelementptr inbounds i16, i16* %1651, i64 16
  %1655 = bitcast i16* %1654 to <16 x i16>*
  %1656 = load <16 x i16>, <16 x i16>* %1655, align 32, !tbaa !419
  %1657 = add <16 x i16> %1653, %1638
  %1658 = add <16 x i16> %1656, %1642
  %1659 = icmp ult <16 x i16> %1657, <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>
  %1660 = icmp ult <16 x i16> %1658, <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>
  %1661 = select <16 x i1> %1659, <16 x i16> %1657, <16 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>
  %1662 = select <16 x i1> %1660, <16 x i16> %1658, <16 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>
  %1663 = shufflevector <16 x i16> %1661, <16 x i16> %1662, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %1664 = trunc <32 x i16> %1663 to <32 x i8>
  %1665 = add nsw i64 %1536, %1533
  %1666 = getelementptr inbounds i8, i8* %output, i64 %1665
  %1667 = bitcast i8* %1666 to <32 x i8>*
  store <32 x i8> %1664, <32 x i8>* %1667, align 1, !tbaa !428
  %1668 = getelementptr inbounds i16, i16* %1651, i64 32
  %1669 = bitcast i16* %1668 to <16 x i16>*
  %1670 = load <16 x i16>, <16 x i16>* %1669, align 32, !tbaa !419
  %1671 = getelementptr inbounds i16, i16* %1651, i64 48
  %1672 = bitcast i16* %1671 to <16 x i16>*
  %1673 = load <16 x i16>, <16 x i16>* %1672, align 32, !tbaa !419
  %1674 = add <16 x i16> %1670, %1646
  %1675 = add <16 x i16> %1673, %1650
  %1676 = icmp ult <16 x i16> %1674, <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>
  %1677 = icmp ult <16 x i16> %1675, <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>
  %1678 = select <16 x i1> %1676, <16 x i16> %1674, <16 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>
  %1679 = select <16 x i1> %1677, <16 x i16> %1675, <16 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>
  %1680 = shufflevector <16 x i16> %1678, <16 x i16> %1679, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %1681 = trunc <32 x i16> %1680 to <32 x i8>
  %1682 = getelementptr inbounds i8, i8* %1666, i64 32
  %1683 = bitcast i8* %1682 to <32 x i8>*
  store <32 x i8> %1681, <32 x i8>* %1683, align 1, !tbaa !428
  %indvars.iv.next192 = add nuw nsw i64 %indvars.iv191, 1
  %.not60 = icmp eq i64 %indvars.iv.next192, %347
  br i1 %.not60, label %"end for output.s0.x.x.loopexit", label %"for output.s0.x.x"

"end for output.s0.x.x.loopexit":                 ; preds = %"for output.s0.x.x"
  store <16 x i16> %1638, <16 x i16>* %sobel_x54.0.sroa_cast203, align 32, !tbaa !386
  store <16 x i16> %1642, <16 x i16>* %sobel_x54.32.sroa_cast210, align 32, !tbaa !395
  store <16 x i16> %1646, <16 x i16>* %sobel_x54.64.sroa_cast218, align 32, !tbaa !397
  store <16 x i16> %1650, <16 x i16>* %sobel_x54.96.sroa_cast226, align 32, !tbaa !400
  br label %"end for output.s0.x.x"

"end for output.s0.x.x":                          ; preds = %"end for output.s0.x.x.loopexit", %"consume sobel_y"
  br i1 %t393, label %"produce sobel_x_avg40", label %after_bb

after_bb:                                         ; preds = %"produce sobel_x_avg40", %"end for output.s0.x.x"
  %indvars.iv.next196 = add nuw nsw i64 %indvars.iv195, 1
  %.not58 = icmp eq i64 %indvars.iv.next196, 9
  br i1 %.not58, label %"end for output.s0.y.yi.yii", label %"assert succeeded39"

"produce sobel_x_avg40":                          ; preds = %"end for output.s0.x.x"
  %t365 = add nsw i32 %t481, %b77
  %1684 = sext i32 %t365 to i64
  %1685 = getelementptr inbounds i16, i16* %input_16, i64 %1684
  %1686 = getelementptr inbounds i16, i16* %1685, i64 -63
  %1687 = bitcast i16* %1686 to <16 x i16>*
  %1688 = load <16 x i16>, <16 x i16>* %1687, align 2, !tbaa !383
  %1689 = shl <16 x i16> %1688, <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>
  %1690 = getelementptr inbounds i16, i16* %1685, i64 -62
  %1691 = bitcast i16* %1690 to <16 x i16>*
  %1692 = load <16 x i16>, <16 x i16>* %1691, align 2, !tbaa !383
  %1693 = getelementptr inbounds i16, i16* %1685, i64 -64
  %1694 = bitcast i16* %1693 to <16 x i16>*
  %1695 = load <16 x i16>, <16 x i16>* %1694, align 2, !tbaa !383
  %1696 = add <16 x i16> %1689, %1692
  %1697 = add <16 x i16> %1696, %1695
  %1698 = getelementptr inbounds i16, i16* %1685, i64 -47
  %1699 = bitcast i16* %1698 to <16 x i16>*
  %1700 = load <16 x i16>, <16 x i16>* %1699, align 2, !tbaa !383
  %1701 = shl <16 x i16> %1700, <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>
  %1702 = getelementptr inbounds i16, i16* %1685, i64 -46
  %1703 = bitcast i16* %1702 to <16 x i16>*
  %1704 = load <16 x i16>, <16 x i16>* %1703, align 2, !tbaa !383
  %1705 = getelementptr inbounds i16, i16* %1685, i64 -48
  %1706 = bitcast i16* %1705 to <16 x i16>*
  %1707 = load <16 x i16>, <16 x i16>* %1706, align 2, !tbaa !383
  %1708 = add <16 x i16> %1701, %1704
  %1709 = add <16 x i16> %1708, %1707
  %1710 = getelementptr inbounds i16, i16* %1685, i64 -31
  %1711 = bitcast i16* %1710 to <16 x i16>*
  %1712 = load <16 x i16>, <16 x i16>* %1711, align 2, !tbaa !383
  %1713 = shl <16 x i16> %1712, <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>
  %1714 = getelementptr inbounds i16, i16* %1685, i64 -30
  %1715 = bitcast i16* %1714 to <16 x i16>*
  %1716 = load <16 x i16>, <16 x i16>* %1715, align 2, !tbaa !383
  %1717 = getelementptr inbounds i16, i16* %1685, i64 -32
  %1718 = bitcast i16* %1717 to <16 x i16>*
  %1719 = load <16 x i16>, <16 x i16>* %1718, align 2, !tbaa !383
  %1720 = add <16 x i16> %1713, %1716
  %1721 = add <16 x i16> %1720, %1719
  %1722 = getelementptr inbounds i16, i16* %1685, i64 -15
  %1723 = bitcast i16* %1722 to <16 x i16>*
  %1724 = load <16 x i16>, <16 x i16>* %1723, align 2, !tbaa !383
  %1725 = shl <16 x i16> %1724, <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>
  %1726 = getelementptr inbounds i16, i16* %1685, i64 -14
  %1727 = bitcast i16* %1726 to <16 x i16>*
  %1728 = load <16 x i16>, <16 x i16>* %1727, align 2, !tbaa !383
  %1729 = getelementptr inbounds i16, i16* %1685, i64 -16
  %1730 = bitcast i16* %1729 to <16 x i16>*
  %1731 = load <16 x i16>, <16 x i16>* %1730, align 2, !tbaa !383
  %1732 = add <16 x i16> %1725, %1728
  %1733 = add <16 x i16> %1732, %1731
  %t373 = add nsw i32 %t483, %b77
  %1734 = sext i32 %t373 to i64
  %1735 = getelementptr inbounds i16, i16* %input_16, i64 %1734
  %1736 = getelementptr inbounds i16, i16* %1735, i64 -63
  %1737 = bitcast i16* %1736 to <16 x i16>*
  %1738 = load <16 x i16>, <16 x i16>* %1737, align 2, !tbaa !383
  %1739 = shl <16 x i16> %1738, <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>
  %1740 = getelementptr inbounds i16, i16* %1735, i64 -62
  %1741 = bitcast i16* %1740 to <16 x i16>*
  %1742 = load <16 x i16>, <16 x i16>* %1741, align 2, !tbaa !383
  %1743 = getelementptr inbounds i16, i16* %1735, i64 -64
  %1744 = bitcast i16* %1743 to <16 x i16>*
  %1745 = load <16 x i16>, <16 x i16>* %1744, align 2, !tbaa !383
  %1746 = add <16 x i16> %1739, %1742
  %1747 = add <16 x i16> %1746, %1745
  %1748 = getelementptr inbounds i16, i16* %1735, i64 -47
  %1749 = bitcast i16* %1748 to <16 x i16>*
  %1750 = load <16 x i16>, <16 x i16>* %1749, align 2, !tbaa !383
  %1751 = shl <16 x i16> %1750, <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>
  %1752 = getelementptr inbounds i16, i16* %1735, i64 -46
  %1753 = bitcast i16* %1752 to <16 x i16>*
  %1754 = load <16 x i16>, <16 x i16>* %1753, align 2, !tbaa !383
  %1755 = getelementptr inbounds i16, i16* %1735, i64 -48
  %1756 = bitcast i16* %1755 to <16 x i16>*
  %1757 = load <16 x i16>, <16 x i16>* %1756, align 2, !tbaa !383
  %1758 = add <16 x i16> %1751, %1754
  %1759 = add <16 x i16> %1758, %1757
  %1760 = getelementptr inbounds i16, i16* %1735, i64 -31
  %1761 = bitcast i16* %1760 to <16 x i16>*
  %1762 = load <16 x i16>, <16 x i16>* %1761, align 2, !tbaa !383
  %1763 = shl <16 x i16> %1762, <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>
  %1764 = getelementptr inbounds i16, i16* %1735, i64 -30
  %1765 = bitcast i16* %1764 to <16 x i16>*
  %1766 = load <16 x i16>, <16 x i16>* %1765, align 2, !tbaa !383
  %1767 = getelementptr inbounds i16, i16* %1735, i64 -32
  %1768 = bitcast i16* %1767 to <16 x i16>*
  %1769 = load <16 x i16>, <16 x i16>* %1768, align 2, !tbaa !383
  %1770 = add <16 x i16> %1763, %1766
  %1771 = add <16 x i16> %1770, %1769
  %1772 = getelementptr inbounds i16, i16* %1735, i64 -15
  %1773 = bitcast i16* %1772 to <16 x i16>*
  %1774 = load <16 x i16>, <16 x i16>* %1773, align 2, !tbaa !383
  %1775 = shl <16 x i16> %1774, <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>
  %1776 = getelementptr inbounds i16, i16* %1735, i64 -14
  %1777 = bitcast i16* %1776 to <16 x i16>*
  %1778 = load <16 x i16>, <16 x i16>* %1777, align 2, !tbaa !383
  %1779 = getelementptr inbounds i16, i16* %1735, i64 -16
  %1780 = bitcast i16* %1779 to <16 x i16>*
  %1781 = load <16 x i16>, <16 x i16>* %1780, align 2, !tbaa !383
  %1782 = add <16 x i16> %1775, %1778
  %1783 = add <16 x i16> %1782, %1781
  %1784 = icmp ugt <16 x i16> %1747, %1697
  %1785 = sub <16 x i16> %1747, %1697
  %1786 = sub <16 x i16> %1697, %1747
  %1787 = select <16 x i1> %1784, <16 x i16> %1785, <16 x i16> %1786
  store <16 x i16> %1787, <16 x i16>* %sobel_x54.0.sroa_cast202, align 32, !tbaa !386
  %1788 = icmp ugt <16 x i16> %1759, %1709
  %1789 = sub <16 x i16> %1759, %1709
  %1790 = sub <16 x i16> %1709, %1759
  %1791 = select <16 x i1> %1788, <16 x i16> %1789, <16 x i16> %1790
  store <16 x i16> %1791, <16 x i16>* %sobel_x54.32.sroa_cast208, align 32, !tbaa !395
  %1792 = icmp ugt <16 x i16> %1771, %1721
  %1793 = sub <16 x i16> %1771, %1721
  %1794 = sub <16 x i16> %1721, %1771
  %1795 = select <16 x i1> %1792, <16 x i16> %1793, <16 x i16> %1794
  store <16 x i16> %1795, <16 x i16>* %sobel_x54.64.sroa_cast216, align 32, !tbaa !397
  %1796 = icmp ugt <16 x i16> %1783, %1733
  %1797 = sub <16 x i16> %1783, %1733
  %1798 = sub <16 x i16> %1733, %1783
  %1799 = select <16 x i1> %1796, <16 x i16> %1797, <16 x i16> %1798
  store <16 x i16> %1799, <16 x i16>* %sobel_x54.96.sroa_cast224, align 32, !tbaa !400
  %1800 = getelementptr inbounds i16, i16* %sobel_y, i64 %338
  %1801 = getelementptr inbounds i16, i16* %1800, i64 -64
  %1802 = bitcast i16* %1801 to <16 x i16>*
  %1803 = load <16 x i16>, <16 x i16>* %1802, align 2, !tbaa !419
  %1804 = getelementptr inbounds i16, i16* %1800, i64 -48
  %1805 = bitcast i16* %1804 to <16 x i16>*
  %1806 = load <16 x i16>, <16 x i16>* %1805, align 2, !tbaa !419
  %1807 = add <16 x i16> %1803, %1787
  %1808 = add <16 x i16> %1806, %1791
  %1809 = icmp ult <16 x i16> %1807, <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>
  %1810 = icmp ult <16 x i16> %1808, <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>
  %1811 = select <16 x i1> %1809, <16 x i16> %1807, <16 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>
  %1812 = select <16 x i1> %1810, <16 x i16> %1808, <16 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>
  %1813 = shufflevector <16 x i16> %1811, <16 x i16> %1812, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %1814 = trunc <32 x i16> %1813 to <32 x i8>
  %1815 = add nsw i64 %indvars.iv195, %357
  %1816 = mul nsw i64 %1815, %339
  %1817 = add nsw i64 %1816, %340
  %1818 = getelementptr inbounds i8, i8* %output, i64 %1817
  %1819 = getelementptr inbounds i8, i8* %1818, i64 -64
  %1820 = bitcast i8* %1819 to <32 x i8>*
  store <32 x i8> %1814, <32 x i8>* %1820, align 1, !tbaa !428
  %1821 = getelementptr inbounds i16, i16* %1800, i64 -32
  %1822 = bitcast i16* %1821 to <16 x i16>*
  %1823 = load <16 x i16>, <16 x i16>* %1822, align 2, !tbaa !419
  %1824 = getelementptr inbounds i16, i16* %1800, i64 -16
  %1825 = bitcast i16* %1824 to <16 x i16>*
  %1826 = load <16 x i16>, <16 x i16>* %1825, align 2, !tbaa !419
  %1827 = add <16 x i16> %1823, %1795
  %1828 = add <16 x i16> %1826, %1799
  %1829 = icmp ult <16 x i16> %1827, <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>
  %1830 = icmp ult <16 x i16> %1828, <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>
  %1831 = select <16 x i1> %1829, <16 x i16> %1827, <16 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>
  %1832 = select <16 x i1> %1830, <16 x i16> %1828, <16 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>
  %1833 = shufflevector <16 x i16> %1831, <16 x i16> %1832, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %1834 = trunc <32 x i16> %1833 to <32 x i8>
  %1835 = getelementptr inbounds i8, i8* %1818, i64 -32
  %1836 = bitcast i8* %1835 to <32 x i8>*
  store <32 x i8> %1834, <32 x i8>* %1836, align 1, !tbaa !428
  br label %after_bb
}

; Function Attrs: nounwind
define i32 @sobel3x3_batch_0058_sample_0015_argv(i8** nocapture readonly %0) local_unnamed_addr #10 {
entry:
  %1 = bitcast i8** %0 to %struct.halide_buffer_t**
  %2 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %1, align 8
  %3 = getelementptr i8*, i8** %0, i64 1
  %4 = bitcast i8** %3 to %struct.halide_buffer_t**
  %5 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %4, align 8
  %6 = tail call i32 @sobel3x3_batch_0058_sample_0015(%struct.halide_buffer_t* %2, %struct.halide_buffer_t* %5) #14
  ret i32 %6
}

; Function Attrs: norecurse nounwind readnone willreturn
define nonnull %struct.halide_filter_metadata_t* @sobel3x3_batch_0058_sample_0015_metadata() local_unnamed_addr #11 {
entry:
  ret %struct.halide_filter_metadata_t* @sobel3x3_batch_0058_sample_0015_metadata_storage
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.abs.i64(i64, i1 immarg) #7

attributes #0 = { nounwind mustprogress "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-builtins" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-builtins" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind willreturn mustprogress "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-builtins" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nofree nosync nounwind willreturn }
attributes #4 = { nounwind "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-builtins" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly nofree nosync nounwind willreturn writeonly }
attributes #6 = { alwaysinline nounwind willreturn mustprogress "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-builtins" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #8 = { nounwind "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-builtins" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { nounwind "reciprocal-estimates"="none" }
attributes #10 = { nounwind }
attributes #11 = { norecurse nounwind readnone willreturn }
attributes #12 = { nobuiltin nounwind "no-builtins" }
attributes #13 = { nobuiltin "no-builtins" }
attributes #14 = { noinline }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9, !9, !9, !9, !9, !9, !9, !9, !9, !9, !9, !9, !9, !9, !9, !9, !9, !9, !9, !9, !9, !9, !9, !9, !9, !9, !9, !9, !9, !9}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, !"halide_use_soft_float_abi", i32 0}
!3 = !{i32 2, !"halide_mcpu", !"haswell"}
!4 = !{i32 2, !"halide_mattrs", !"+fma,+f16c"}
!5 = !{i32 2, !"halide_mabi", !""}
!6 = !{i32 2, !"halide_use_pic", i32 1}
!7 = !{i32 2, !"halide_use_large_code_model", i32 0}
!8 = !{i32 2, !"halide_per_instruction_fast_math_flags", i32 0}
!9 = !{!"clang version 12.0.0"}
!10 = !{!11, !11, i64 0}
!11 = !{!"any pointer", !12, i64 0}
!12 = !{!"omnipotent char", !13, i64 0}
!13 = !{!"Simple C++ TBAA"}
!14 = !{!12, !12, i64 0}
!15 = !{!16, !16, i64 0}
!16 = !{!"bool", !12, i64 0}
!17 = !{i8 0, i8 2}
!18 = !{!19, !19, i64 0}
!19 = !{!"long", !12, i64 0}
!20 = !{!21, !11, i64 0}
!21 = !{!"_ZTSN6Halide7Runtime8Internal4workE", !22, i64 0, !11, i64 56, !11, i64 64, !11, i64 72, !23, i64 80, !11, i64 88, !23, i64 96, !11, i64 104, !23, i64 112, !23, i64 116, !23, i64 120, !16, i64 124}
!22 = !{!"_ZTS22halide_parallel_task_t", !11, i64 0, !11, i64 8, !11, i64 16, !11, i64 24, !23, i64 32, !23, i64 36, !23, i64 40, !23, i64 44, !16, i64 48}
!23 = !{!"int", !12, i64 0}
!24 = !{!21, !23, i64 36}
!25 = !{!21, !23, i64 40}
!26 = !{!21, !16, i64 48}
!27 = !{!21, !11, i64 24}
!28 = !{!21, !23, i64 32}
!29 = !{!21, !11, i64 8}
!30 = !{!21, !23, i64 44}
!31 = !{!21, !11, i64 16}
!32 = !{!21, !11, i64 56}
!33 = !{!21, !11, i64 104}
!34 = !{!21, !23, i64 116}
!35 = !{!21, !23, i64 112}
!36 = !{!21, !23, i64 120}
!37 = !{!21, !16, i64 124}
!38 = !{!21, !11, i64 72}
!39 = !{!21, !23, i64 80}
!40 = !{!21, !11, i64 88}
!41 = !{!42, !11, i64 8}
!42 = !{!"_ZTSN6Halide7Runtime8Internal15Synchronization15parking_controlE", !11, i64 0, !11, i64 8, !11, i64 16, !11, i64 24}
!43 = !{!42, !11, i64 24}
!44 = !{!45, !11, i64 32}
!45 = !{!"_ZTSN6Halide7Runtime8Internal15Synchronization21mutex_parking_controlE", !11, i64 32}
!46 = !{!42, !11, i64 0}
!47 = !{!42, !11, i64 16}
!48 = !{!49, !16, i64 2121}
!49 = !{!"_ZTSN6Halide7Runtime8Internal12work_queue_tE", !50, i64 0, !23, i64 8, !23, i64 12, !11, i64 16, !23, i64 24, !23, i64 28, !23, i64 32, !51, i64 40, !51, i64 48, !51, i64 56, !23, i64 64, !23, i64 68, !12, i64 72, !16, i64 2120, !16, i64 2121, !23, i64 2124}
!50 = !{!"_ZTS12halide_mutex", !12, i64 0}
!51 = !{!"_ZTS11halide_cond", !12, i64 0}
!52 = distinct !{!52, !53}
!53 = !{!"llvm.loop.mustprogress"}
!54 = !{!49, !23, i64 8}
!55 = distinct !{!55, !53}
!56 = !{!49, !23, i64 24}
!57 = !{!49, !23, i64 2124}
!58 = !{!49, !23, i64 28}
!59 = distinct !{!59, !53}
!60 = !{!21, !23, i64 96}
!61 = !{!49, !11, i64 16}
!62 = !{!49, !23, i64 68}
!63 = !{!49, !23, i64 32}
!64 = !{!21, !11, i64 64}
!65 = distinct !{!65, !53}
!66 = !{!49, !16, i64 2120}
!67 = distinct !{!67, !53}
!68 = !{!69, !11, i64 0}
!69 = !{!"_ZTS26halide_semaphore_acquire_t", !11, i64 0, !23, i64 8}
!70 = !{!69, !23, i64 8}
!71 = distinct !{!71, !53}
!72 = !{!49, !23, i64 64}
!73 = distinct !{!73, !53}
!74 = distinct !{!74, !53}
!75 = !{i64 0, i64 8, !10, i64 8, i64 8, !10, i64 16, i64 8, !10, i64 24, i64 8, !10, i64 32, i64 4, !76, i64 36, i64 4, !76, i64 40, i64 4, !76, i64 44, i64 4, !76, i64 48, i64 1, !15, i64 56, i64 8, !10, i64 64, i64 8, !10, i64 72, i64 8, !10, i64 80, i64 4, !76, i64 88, i64 8, !10, i64 96, i64 4, !76, i64 104, i64 8, !10, i64 112, i64 4, !76, i64 116, i64 4, !76, i64 120, i64 4, !76, i64 124, i64 1, !15}
!76 = !{!23, !23, i64 0}
!77 = !{i64 0, i64 8, !10, i64 8, i64 8, !10, i64 16, i64 8, !10, i64 24, i64 4, !76, i64 28, i64 4, !76, i64 32, i64 4, !76, i64 36, i64 4, !76, i64 40, i64 1, !15, i64 48, i64 8, !10, i64 56, i64 8, !10, i64 64, i64 8, !10, i64 72, i64 4, !76, i64 80, i64 8, !10, i64 88, i64 4, !76, i64 96, i64 8, !10, i64 104, i64 4, !76, i64 108, i64 4, !76, i64 112, i64 4, !76, i64 116, i64 1, !15}
!78 = !{i64 0, i64 8, !10, i64 8, i64 8, !10, i64 16, i64 8, !10, i64 24, i64 4, !76, i64 32, i64 8, !10, i64 40, i64 4, !76, i64 48, i64 8, !10, i64 56, i64 4, !76, i64 60, i64 4, !76, i64 64, i64 4, !76, i64 68, i64 1, !15}
!79 = !{i64 0, i64 8, !10, i64 8, i64 4, !76, i64 12, i64 4, !76, i64 16, i64 4, !76, i64 20, i64 1, !15}
!80 = distinct !{!80, !53}
!81 = distinct !{!81, !53}
!82 = !{!83, !11, i64 144}
!83 = !{!"_ZTSN6Halide7Runtime8Internal15Synchronization10queue_dataE", !84, i64 0, !87, i64 136, !11, i64 144, !87, i64 152}
!84 = !{!"_ZTSN6Halide7Runtime8Internal15Synchronization13thread_parkerE", !85, i64 0, !86, i64 64, !16, i64 128}
!85 = !{!"_ZTS15pthread_mutex_t", !12, i64 0}
!86 = !{!"_ZTS14pthread_cond_t", !12, i64 0}
!87 = !{!"long long", !12, i64 0}
!88 = !{!89, !11, i64 16}
!89 = !{!"_ZTSN6Halide7Runtime8Internal15Synchronization11hash_bucketE", !90, i64 0, !11, i64 8, !11, i64 16}
!90 = !{!"_ZTSN6Halide7Runtime8Internal15Synchronization9word_lockE", !87, i64 0}
!91 = distinct !{!91, !53}
!92 = !{!83, !87, i64 152}
!93 = !{!84, !16, i64 128}
!94 = distinct !{!94, !53}
!95 = !{!96, !11, i64 152}
!96 = !{!"_ZTSN6Halide7Runtime8Internal15Synchronization20word_lock_queue_dataE", !84, i64 0, !11, i64 136, !11, i64 144, !11, i64 152}
!97 = !{!96, !11, i64 136}
!98 = !{!96, !11, i64 144}
!99 = distinct !{!99, !53}
!100 = distinct !{!100, !53}
!101 = distinct !{!101, !53}
!102 = !{!103, !11, i64 32}
!103 = !{!"_ZTSN6Halide7Runtime8Internal15Synchronization25broadcast_parking_controlE", !11, i64 32, !11, i64 40}
!104 = !{!103, !11, i64 40}
!105 = !{!106, !11, i64 32}
!106 = !{!"_ZTSN6Halide7Runtime8Internal15Synchronization20wait_parking_controlE", !11, i64 32, !11, i64 40}
!107 = !{!106, !11, i64 40}
!108 = !{!109, !87, i64 8}
!109 = !{!"_ZTSN6Halide7Runtime8Internal15Synchronization15validate_actionE", !16, i64 0, !87, i64 8}
!110 = !{!83, !87, i64 136}
!111 = !{!109, !16, i64 0}
!112 = !{!89, !11, i64 8}
!113 = !{!87, !87, i64 0}
!114 = !{!115, !11, i64 0}
!115 = !{!"_ZTSN6Halide7Runtime8Internal15Synchronization11bucket_pairE", !11, i64 0, !11, i64 8}
!116 = distinct !{!116, !53}
!117 = !{!115, !11, i64 8}
!118 = !{!119, !11, i64 0}
!119 = !{!"_ZTSN6Halide7Runtime8Internal14spawned_threadE", !11, i64 0, !11, i64 8, !19, i64 16}
!120 = !{!119, !11, i64 8}
!121 = !{!119, !19, i64 16}
!122 = !{!22, !23, i64 40}
!123 = !{i64 0, i64 8, !10, i64 8, i64 8, !10, i64 16, i64 8, !10, i64 24, i64 8, !10, i64 32, i64 4, !76, i64 36, i64 4, !76, i64 40, i64 4, !76, i64 44, i64 4, !76, i64 48, i64 1, !15}
!124 = distinct !{!124, !53}
!125 = distinct !{!125, !53}
!126 = distinct !{!126, !53}
!127 = !{!128, !11, i64 32}
!128 = !{!"_ZTSN6Halide7Runtime8Internal15Synchronization22signal_parking_controlE", !11, i64 32, !11, i64 40}
!129 = !{!128, !11, i64 40}
!130 = !{!131, !11, i64 0}
!131 = !{!"_ZTS18halide_mutex_array", !11, i64 0}
!132 = distinct !{!132, !53}
!133 = !{!134, !137, i64 34}
!134 = !{!"_ZTS20halide_trace_event_t", !11, i64 0, !11, i64 8, !11, i64 16, !11, i64 24, !135, i64 32, !138, i64 36, !23, i64 40, !23, i64 44, !23, i64 48}
!135 = !{!"_ZTS13halide_type_t", !136, i64 0, !12, i64 1, !137, i64 2}
!136 = !{!"_ZTS18halide_type_code_t", !12, i64 0}
!137 = !{!"short", !12, i64 0}
!138 = !{!"_ZTS25halide_trace_event_code_t", !12, i64 0}
!139 = !{!135, !12, i64 1}
!140 = !{!134, !23, i64 48}
!141 = !{!134, !11, i64 0}
!142 = !{!134, !11, i64 24}
!143 = !{!144, !23, i64 0}
!144 = !{!"_ZTSN6Halide7Runtime8Internal23SharedExclusiveSpinLockE", !23, i64 0}
!145 = !{!146, !23, i64 4}
!146 = !{!"_ZTSN6Halide7Runtime8Internal11TraceBufferE", !144, i64 0, !23, i64 4, !23, i64 8, !12, i64 12}
!147 = !{!146, !23, i64 8}
!148 = distinct !{!148, !53}
!149 = !{!150, !23, i64 0}
!150 = !{!"_ZTS21halide_trace_packet_t", !23, i64 0, !23, i64 4, !135, i64 8, !138, i64 12, !23, i64 16, !23, i64 20, !23, i64 24}
!151 = !{!150, !23, i64 4}
!152 = !{!134, !11, i64 16}
!153 = !{!134, !11, i64 8}
!154 = !{!150, !23, i64 24}
!155 = !{!150, !137, i64 10}
!156 = distinct !{!156, !53}
!157 = !{!134, !138, i64 36}
!158 = !{!159, !11, i64 24}
!159 = !{!"_ZTSN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi2ELy4096EEE", !11, i64 0, !11, i64 8, !11, i64 16, !11, i64 24, !16, i64 32, !12, i64 33}
!160 = !{!159, !16, i64 32}
!161 = !{!159, !11, i64 8}
!162 = !{!159, !11, i64 16}
!163 = !{!134, !12, i64 33}
!164 = distinct !{!164, !53}
!165 = !{!134, !23, i64 44}
!166 = distinct !{!166, !53, !167}
!167 = !{!"llvm.loop.peeled.count", i32 1}
!168 = !{!134, !136, i64 32}
!169 = !{!137, !137, i64 0}
!170 = !{!171, !171, i64 0}
!171 = !{!"float", !12, i64 0}
!172 = !{!173, !173, i64 0}
!173 = !{!"double", !12, i64 0}
!174 = distinct !{!174, !53}
!175 = !{!159, !11, i64 0}
!176 = distinct !{!176, !53}
!177 = !{!134, !23, i64 40}
!178 = distinct !{!178, !53}
!179 = distinct !{!179, !53}
!180 = distinct !{!180, !53}
!181 = !{!182, !11, i64 16}
!182 = !{!"_ZTS15halide_buffer_t", !87, i64 0, !11, i64 8, !11, i64 16, !87, i64 24, !135, i64 32, !23, i64 36, !11, i64 40, !11, i64 48}
!183 = !{!182, !87, i64 0}
!184 = !{!182, !23, i64 36}
!185 = !{!182, !11, i64 40}
!186 = !{i64 0, i64 4, !76, i64 4, i64 4, !76, i64 8, i64 4, !76, i64 12, i64 4, !76}
!187 = !{!188, !23, i64 4}
!188 = !{!"_ZTS18halide_dimension_t", !23, i64 0, !23, i64 4, !23, i64 8, !23, i64 12}
!189 = distinct !{!189, !53}
!190 = !{!188, !23, i64 0}
!191 = !{!188, !23, i64 8}
!192 = distinct !{!192, !53}
!193 = !{!194, !137, i64 0}
!194 = !{!"_ZTSN6Halide7Runtime8Internal18halide_tiff_headerE", !137, i64 0, !137, i64 2, !23, i64 4, !137, i64 8, !12, i64 10, !23, i64 190, !12, i64 194, !12, i64 202}
!195 = !{!194, !137, i64 2}
!196 = !{!194, !23, i64 4}
!197 = !{!194, !137, i64 8}
!198 = !{!199, !137, i64 0}
!199 = !{!"_ZTSN6Halide7Runtime8Internal8tiff_tagE", !137, i64 0, !137, i64 2, !23, i64 4, !12, i64 8}
!200 = !{!199, !137, i64 2}
!201 = !{!199, !23, i64 4}
!202 = distinct !{!202, !53}
!203 = distinct !{!203, !53}
!204 = distinct !{!204, !53}
!205 = distinct !{!205, !53}
!206 = distinct !{!206, !53}
!207 = distinct !{!207, !53}
!208 = distinct !{!208, !53}
!209 = distinct !{!209, !53}
!210 = distinct !{!210, !53}
!211 = distinct !{!211, !53}
!212 = distinct !{!212, !53}
!213 = distinct !{!213, !53}
!214 = distinct !{!214, !53}
!215 = distinct !{!215, !53}
!216 = !{!217, !11, i64 0}
!217 = !{!"_ZTSN6Halide7Runtime8Internal10CacheEntryE", !11, i64 0, !11, i64 8, !11, i64 16, !11, i64 24, !19, i64 32, !11, i64 40, !23, i64 48, !23, i64 52, !23, i64 56, !23, i64 60, !11, i64 64, !11, i64 72, !87, i64 80, !16, i64 88}
!218 = distinct !{!218, !53}
!219 = distinct !{!219, !53}
!220 = !{!217, !23, i64 56}
!221 = !{!217, !11, i64 24}
!222 = !{!217, !11, i64 72}
!223 = distinct !{!223, !53}
!224 = distinct !{!224, !53}
!225 = !{!226, !87, i64 0}
!226 = !{!"_ZTSN6Halide7Runtime8Internal11device_copyE", !87, i64 0, !87, i64 8, !87, i64 16, !12, i64 24, !12, i64 152, !12, i64 280, !87, i64 408}
!227 = !{!226, !87, i64 8}
!228 = !{!226, !87, i64 408}
!229 = distinct !{!229, !53}
!230 = !{!226, !87, i64 16}
!231 = distinct !{!231, !53}
!232 = distinct !{!232, !53}
!233 = distinct !{!233, !53}
!234 = distinct !{!234, !53}
!235 = distinct !{!235, !53}
!236 = !{i64 0, i64 8, !113, i64 8, i64 8, !113, i64 16, i64 8, !113, i64 24, i64 128, !14, i64 152, i64 128, !14, i64 280, i64 128, !14, i64 408, i64 8, !113}
!237 = distinct !{!237, !53}
!238 = !{!188, !23, i64 12}
!239 = !{!217, !11, i64 16}
!240 = !{!217, !19, i64 32}
!241 = !{!217, !23, i64 48}
!242 = !{!217, !23, i64 52}
!243 = !{!217, !23, i64 60}
!244 = !{!217, !11, i64 64}
!245 = !{!217, !11, i64 40}
!246 = distinct !{!246, !53}
!247 = distinct !{!247, !53}
!248 = distinct !{!248, !53}
!249 = !{!217, !16, i64 88}
!250 = !{!217, !87, i64 80}
!251 = !{i64 0, i64 8, !113, i64 8, i64 8, !10, i64 16, i64 8, !10, i64 24, i64 8, !113, i64 32, i64 1, !252, i64 33, i64 1, !14, i64 34, i64 2, !169, i64 36, i64 4, !76, i64 40, i64 8, !10, i64 48, i64 8, !10}
!252 = !{!136, !136, i64 0}
!253 = distinct !{!253, !53}
!254 = distinct !{!254, !53}
!255 = !{!217, !11, i64 8}
!256 = distinct !{!256, !53}
!257 = distinct !{!257, !53}
!258 = distinct !{!258, !53}
!259 = distinct !{!259, !53}
!260 = distinct !{!260, !53}
!261 = distinct !{!261, !53}
!262 = distinct !{!262, !53}
!263 = distinct !{!263, !53}
!264 = distinct !{!264, !53}
!265 = !{!266, !23, i64 8}
!266 = !{!"_ZTSN6Halide7Runtime8Internal16CacheBlockHeaderE", !11, i64 0, !23, i64 8}
!267 = !{!266, !11, i64 0}
!268 = distinct !{!268, !53}
!269 = distinct !{!269, !53}
!270 = distinct !{!270, !53}
!271 = distinct !{!271, !53}
!272 = distinct !{!272, !53}
!273 = distinct !{!273, !53}
!274 = distinct !{!274, !53}
!275 = distinct !{!275, !53}
!276 = distinct !{!276, !53}
!277 = distinct !{!277, !53}
!278 = distinct !{!278, !53}
!279 = distinct !{!279, !53}
!280 = distinct !{!280, !53}
!281 = distinct !{!281, !53}
!282 = !{!135, !136, i64 0}
!283 = !{!135, !137, i64 2}
!284 = !{!182, !11, i64 8}
!285 = !{!182, !87, i64 24}
!286 = distinct !{!286, !53}
!287 = !{!288, !11, i64 0}
!288 = !{!"_ZTS29halide_device_allocation_pool", !11, i64 0, !11, i64 8}
!289 = distinct !{!289, !53}
!290 = !{!288, !11, i64 8}
!291 = !{!292, !11, i64 120}
!292 = !{!"_ZTS25halide_device_interface_t", !11, i64 0, !11, i64 8, !11, i64 16, !11, i64 24, !11, i64 32, !11, i64 40, !11, i64 48, !11, i64 56, !11, i64 64, !11, i64 72, !11, i64 80, !11, i64 88, !11, i64 96, !11, i64 104, !11, i64 112, !11, i64 120}
!293 = !{!294, !11, i64 48}
!294 = !{!"_ZTS30halide_device_interface_impl_t", !11, i64 0, !11, i64 8, !11, i64 16, !11, i64 24, !11, i64 32, !11, i64 40, !11, i64 48, !11, i64 56, !11, i64 64, !11, i64 72, !11, i64 80, !11, i64 88, !11, i64 96, !11, i64 104, !11, i64 112, !11, i64 120}
!295 = !{!294, !11, i64 40}
!296 = !{!294, !11, i64 56}
!297 = !{!294, !11, i64 0}
!298 = !{!294, !11, i64 16}
!299 = !{!294, !11, i64 8}
!300 = !{!294, !11, i64 32}
!301 = !{!294, !11, i64 24}
!302 = !{!294, !11, i64 64}
!303 = !{!294, !11, i64 72}
!304 = distinct !{!304, !53}
!305 = distinct !{!305, !53}
!306 = !{!294, !11, i64 112}
!307 = !{!294, !11, i64 120}
!308 = !{!294, !11, i64 80}
!309 = !{!294, !11, i64 88}
!310 = !{!294, !11, i64 96}
!311 = !{!294, !11, i64 104}
!312 = !{i32 22, i32 33}
!313 = !{!314, !11, i64 40}
!314 = !{!"_ZTS21halide_profiler_state", !50, i64 0, !23, i64 8, !23, i64 12, !23, i64 16, !23, i64 20, !11, i64 24, !11, i64 32, !11, i64 40}
!315 = !{!314, !23, i64 16}
!316 = !{!317, !11, i64 24}
!317 = !{!"_ZTSN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi2ELy1024EEE", !11, i64 0, !11, i64 8, !11, i64 16, !11, i64 24, !16, i64 32, !12, i64 33}
!318 = !{!317, !16, i64 32}
!319 = !{!317, !11, i64 8}
!320 = !{!317, !11, i64 16}
!321 = !{!317, !11, i64 0}
!322 = !{!323, !87, i64 0}
!323 = !{!"_ZTS30halide_profiler_pipeline_stats", !87, i64 0, !87, i64 8, !87, i64 16, !87, i64 24, !87, i64 32, !87, i64 40, !11, i64 48, !11, i64 56, !11, i64 64, !23, i64 72, !23, i64 76, !23, i64 80, !23, i64 84, !23, i64 88}
!324 = !{!323, !23, i64 80}
!325 = !{!323, !87, i64 32}
!326 = !{!323, !87, i64 40}
!327 = !{!323, !11, i64 48}
!328 = !{!323, !23, i64 84}
!329 = !{!323, !23, i64 88}
!330 = !{!323, !87, i64 16}
!331 = !{!323, !87, i64 24}
!332 = !{!323, !23, i64 72}
!333 = !{!323, !11, i64 56}
!334 = distinct !{!334, !53}
!335 = !{!336, !87, i64 32}
!336 = !{!"_ZTS26halide_profiler_func_stats", !87, i64 0, !87, i64 8, !87, i64 16, !87, i64 24, !87, i64 32, !87, i64 40, !87, i64 48, !11, i64 56, !23, i64 64}
!337 = !{!336, !87, i64 0}
!338 = !{!336, !11, i64 56}
!339 = distinct !{!339, !53}
!340 = distinct !{!340, !53}
!341 = distinct !{!341, !53}
!342 = !{!336, !87, i64 40}
!343 = !{!336, !87, i64 48}
!344 = distinct !{!344, !53}
!345 = !{!336, !87, i64 16}
!346 = distinct !{!346, !53}
!347 = !{!336, !23, i64 64}
!348 = distinct !{!348, !53}
!349 = !{!336, !87, i64 24}
!350 = distinct !{!350, !53}
!351 = distinct !{!351, !53}
!352 = !{!314, !11, i64 24}
!353 = !{!323, !11, i64 64}
!354 = distinct !{!354, !53}
!355 = !{!314, !23, i64 12}
!356 = distinct !{!356, !53}
!357 = !{!323, !23, i64 76}
!358 = distinct !{!358, !53}
!359 = distinct !{!359, !53}
!360 = distinct !{!360, !53}
!361 = !{!314, !11, i64 32}
!362 = !{!314, !23, i64 20}
!363 = !{!314, !23, i64 8}
!364 = distinct !{!364, !53}
!365 = distinct !{!365, !53}
!366 = distinct !{!366, !53}
!367 = !{!"branch_weights", i32 0, i32 1073741824}
!368 = !{!182, !136, i64 32}
!369 = !{!182, !12, i64 33}
!370 = !{!182, !137, i64 34}
!371 = !{i64 0, i64 64}
!372 = !{!"branch_weights", i32 1073741824, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0}
!373 = !{!"branch_weights", i32 1073741824, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0}
!374 = !{!"branch_weights", i32 1073741824, i32 0}
!375 = !{!376, !19, i64 8}
!376 = !{!"_ZTS25halide_pseudostack_slot_t", !11, i64 0, !19, i64 8}
!377 = !{!376, !11, i64 0}
!378 = !{!379, !379, i64 0}
!379 = !{!"input", !380, i64 0}
!380 = !{!"Halide buffer"}
!381 = !{!382, !382, i64 0}
!382 = !{!"repeat_edge", !380, i64 0}
!383 = !{!384, !384, i64 0}
!384 = !{!"input_16", !380, i64 0}
!385 = !{!"branch_weights", i32 1, i32 2000}
!386 = !{!387, !387, i64 0}
!387 = !{!"sobel_y_avg.width16.base0", !388, i64 0}
!388 = !{!"sobel_y_avg.width32.base0", !389, i64 0}
!389 = !{!"sobel_y_avg.width64.base0", !390, i64 0}
!390 = !{!"sobel_y_avg.width128.base0", !391, i64 0}
!391 = !{!"sobel_y_avg.width256.base0", !392, i64 0}
!392 = !{!"sobel_y_avg.width512.base0", !393, i64 0}
!393 = !{!"sobel_y_avg.width1024.base0", !394, i64 0}
!394 = !{!"sobel_y_avg", !380, i64 0}
!395 = !{!396, !396, i64 0}
!396 = !{!"sobel_y_avg.width16.base16", !388, i64 0}
!397 = !{!398, !398, i64 0}
!398 = !{!"sobel_y_avg.width16.base32", !399, i64 0}
!399 = !{!"sobel_y_avg.width32.base32", !389, i64 0}
!400 = !{!401, !401, i64 0}
!401 = !{!"sobel_y_avg.width16.base48", !399, i64 0}
!402 = !{!403, !403, i64 0}
!403 = !{!"sobel_y_avg.width16.base64", !404, i64 0}
!404 = !{!"sobel_y_avg.width32.base64", !405, i64 0}
!405 = !{!"sobel_y_avg.width64.base64", !390, i64 0}
!406 = !{!407, !407, i64 0}
!407 = !{!"sobel_y_avg.width16.base80", !404, i64 0}
!408 = !{!409, !409, i64 0}
!409 = !{!"sobel_y_avg.width16.base96", !410, i64 0}
!410 = !{!"sobel_y_avg.width32.base96", !405, i64 0}
!411 = !{!412, !412, i64 0}
!412 = !{!"sobel_y_avg.width16.base112", !410, i64 0}
!413 = !{!414, !414, i64 0}
!414 = !{!"sobel_y_avg.width16.base128", !415, i64 0}
!415 = !{!"sobel_y_avg.width32.base128", !416, i64 0}
!416 = !{!"sobel_y_avg.width64.base128", !417, i64 0}
!417 = !{!"sobel_y_avg.width128.base128", !391, i64 0}
!418 = !{!388, !388, i64 0}
!419 = !{!420, !420, i64 0}
!420 = !{!"sobel_y", !380, i64 0}
!421 = !{!389, !389, i64 0}
!422 = !{!399, !399, i64 0}
!423 = !{!390, !390, i64 0}
!424 = !{!404, !404, i64 0}
!425 = !{!405, !405, i64 0}
!426 = !{!410, !410, i64 0}
!427 = !{!391, !391, i64 0}
!428 = !{!429, !429, i64 0}
!429 = !{!"output", !380, i64 0}