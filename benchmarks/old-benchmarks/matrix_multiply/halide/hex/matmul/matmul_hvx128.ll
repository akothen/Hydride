; ModuleID = 'matmul.bc'
source_filename = "/home/hassamu2/Halide/src/runtime/posix_allocator.cpp"
target datalayout = "e-m:e-p:32:32:32-a:0-n16:32-i64:64:64-i32:32:32-i16:16:16-i1:8:8-f32:32:32-f64:64:64-v32:32:32-v64:64:64-v512:512:512-v1024:1024:1024-v2048:2048:2048"
target triple = "hexagon-unknown--elf"

%struct.timeval = type { i64, i64 }
%"struct.Halide::Runtime::Internal::Synchronization::hash_table" = type { [1024 x %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"] }
%"struct.Halide::Runtime::Internal::Synchronization::hash_bucket" = type { %"class.Halide::Runtime::Internal::Synchronization::word_lock", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"*, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* }
%"class.Halide::Runtime::Internal::Synchronization::word_lock" = type { i64 }
%"struct.Halide::Runtime::Internal::Synchronization::queue_data" = type { %"struct.Halide::Runtime::Internal::Synchronization::thread_parker", i64, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"*, i64 }
%"struct.Halide::Runtime::Internal::Synchronization::thread_parker" = type <{ %struct.pthread_mutex_t, %struct.pthread_mutex_t, i8, [7 x i8] }>
%struct.pthread_mutex_t = type { [8 x i64] }
%"struct.Halide::Runtime::Internal::work_queue_t" = type { %struct.halide_mutex, i32, i32, %"struct.Halide::Runtime::Internal::work"*, i32, i32, i32, [4 x i8], %struct.halide_mutex, %struct.halide_mutex, %struct.halide_mutex, i32, i32, [256 x %struct.halide_thread*], i8, i8, i32 }
%"struct.Halide::Runtime::Internal::work" = type { %struct.halide_parallel_task_t, i32 (i8*, i32, i8*)*, %"struct.Halide::Runtime::Internal::work"*, %"struct.Halide::Runtime::Internal::work"*, i32, %"struct.Halide::Runtime::Internal::work"*, i32, i8*, i32, i32, i32, i8 }
%struct.halide_parallel_task_t = type { i32 (i8*, i32, i32, i8*, i8*)*, i8*, i8*, %struct.halide_semaphore_acquire_t*, i32, i32, i32, i32, i8, [7 x i8] }
%struct.halide_semaphore_acquire_t = type { %struct.halide_semaphore_t*, i32, [4 x i8] }
%struct.halide_semaphore_t = type { [2 x i64] }
%struct.halide_mutex = type { [1 x i64] }
%struct.halide_thread = type opaque
%struct.halide_device_allocation_pool = type { i32 (i8*)*, %struct.halide_device_allocation_pool* }
%struct.halide_profiler_state = type { %struct.halide_mutex, i32, i32, i32, i32, %struct.halide_profiler_pipeline_stats*, void (i32*, i32*)*, %struct.halide_thread* }
%struct.halide_profiler_pipeline_stats = type { i64, i64, i64, i64, i64, i64, i8*, %struct.halide_profiler_func_stats*, i8*, i32, i32, i32, i32, i32, [4 x i8] }
%struct.halide_profiler_func_stats = type { i64, i64, i64, i64, i64, i64, i64, i8*, i32, [4 x i8] }
%struct.halide_filter_argument_t = type { i8*, i32, i32, %struct.halide_type_t, %struct.halide_scalar_value_t*, %struct.halide_scalar_value_t*, %struct.halide_scalar_value_t*, %struct.halide_scalar_value_t*, i64** }
%struct.halide_type_t = type { i8, i8, i16 }
%struct.halide_scalar_value_t = type { %union.anon }
%union.anon = type { double }
%struct.halide_filter_metadata_t = type { i32, i32, %struct.halide_filter_argument_t*, i8*, i8* }
%"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control" = type { %"struct.Halide::Runtime::Internal::Synchronization::parking_control", i64* }
%"struct.Halide::Runtime::Internal::Synchronization::parking_control" = type { i32 (...)** }
%"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data" = type { %"struct.Halide::Runtime::Internal::Synchronization::thread_parker", %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"*, %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"*, %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* }
%"struct.Halide::Runtime::Internal::Synchronization::validate_action" = type { i8, [7 x i8], i64 }
%"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control" = type { %"struct.Halide::Runtime::Internal::Synchronization::parking_control", i64*, %"class.Halide::Runtime::Internal::Synchronization::word_lock"* }
%"struct.Halide::Runtime::Internal::Synchronization::bucket_pair" = type { %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"*, %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* }
%"struct.Halide::Runtime::Internal::spawned_thread" = type { void (i8*)*, i8*, i64 }
%struct.halide_mutex_array = type { %struct.halide_mutex* }
%struct.halide_buffer_t = type { i64, %struct.halide_device_interface_t*, i8*, i64, %struct.halide_type_t, i32, %struct.halide_dimension_t*, i8* }
%struct.halide_device_interface_t = type { i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, void (i8*, %struct.halide_device_interface_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, i32, i32, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, i64, %struct.halide_device_interface_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, i32*, i32*)*, %struct.halide_device_interface_impl_t* }
%struct.halide_device_interface_impl_t = type { void ()*, void ()*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, i32, i32, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, i64)*, i32 (i8*, %struct.halide_buffer_t*)* }
%struct.halide_dimension_t = type { i32, i32, i32, i32 }
%"struct.Halide::Runtime::Internal::device_copy" = type { i64, i64, i64, [16 x i64], [16 x i64], [16 x i64], i64 }
%"struct.Halide::Runtime::Internal::CpuFeatures" = type { [2 x i64], [2 x i64] }
%closure_t = type { i32, i32, i32, i32, i32, i32, i32, i16*, %struct.halide_buffer_t*, i16*, %struct.halide_buffer_t*, i16*, %struct.halide_buffer_t* }

$_ZN6Halide7Runtime8Internal15Synchronization21mutex_parking_control8validateERNS2_15validate_actionE = comdat any

$_ZN6Halide7Runtime8Internal15Synchronization15parking_control12before_sleepEv = comdat any

$_ZN6Halide7Runtime8Internal15Synchronization21mutex_parking_control6unparkEib = comdat any

$_ZN6Halide7Runtime8Internal15Synchronization15parking_control16requeue_callbackERKNS2_15validate_actionEbb = comdat any

$_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control8validateERNS2_15validate_actionE = comdat any

$_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control12before_sleepEv = comdat any

$_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control6unparkEib = comdat any

$_ZN6Halide7Runtime8Internal15Synchronization25broadcast_parking_control8validateERNS2_15validate_actionE = comdat any

$_ZN6Halide7Runtime8Internal15Synchronization15parking_control6unparkEib = comdat any

$_ZN6Halide7Runtime8Internal15Synchronization25broadcast_parking_control16requeue_callbackERKNS2_15validate_actionEbb = comdat any

$_ZN6Halide7Runtime8Internal15Synchronization15parking_control8validateERNS2_15validate_actionE = comdat any

$_ZN6Halide7Runtime8Internal15Synchronization22signal_parking_control6unparkEib = comdat any

$_ZTVN6Halide7Runtime8Internal15Synchronization21mutex_parking_controlE = comdat any

$_ZTVN6Halide7Runtime8Internal15Synchronization25broadcast_parking_controlE = comdat any

$_ZTVN6Halide7Runtime8Internal15Synchronization22signal_parking_controlE = comdat any

$_ZTVN6Halide7Runtime8Internal15Synchronization20wait_parking_controlE = comdat any

@_ZN6Halide7Runtime8Internal13custom_mallocE = linkonce local_unnamed_addr global i8* (i8*, i64)* @halide_default_malloc, align 8
@_ZN6Halide7Runtime8Internal11custom_freeE = linkonce local_unnamed_addr global void (i8*, i8*)* @halide_default_free, align 8
@.str = private unnamed_addr constant [8 x i8] c"Error: \00", align 1
@_ZN6Halide7Runtime8Internal13error_handlerE = linkonce local_unnamed_addr global void (i8*, i8*)* @halide_default_error, align 8
@_ZN6Halide7Runtime8Internal12custom_printE = linkonce local_unnamed_addr global void (i8*, i8*)* @halide_default_print, align 8
@_ZN6Halide7Runtime8Internal29halide_reference_clock_initedE = linkonce local_unnamed_addr global i8 0, align 1
@_ZN6Halide7Runtime8Internal22halide_reference_clockE = linkonce global %struct.timeval zeroinitializer, align 8
@llvm.global_dtors = appending global [2 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @halide_thread_pool_cleanup, i8* null }, { i32, void ()*, i8* } { i32 65535, void ()* @halide_profiler_shutdown, i8* null }]
@.str.5 = private unnamed_addr constant [112 x i8] c"/home/hassamu2/Halide/src/runtime/synchronization_common.h:387 halide_abort_if_false() failed: next != nullptr\0A\00", align 1
@_ZN6Halide7Runtime8Internal15Synchronization5tableE = linkonce global %"struct.Halide::Runtime::Internal::Synchronization::hash_table" zeroinitializer, align 8
@.str.1 = private unnamed_addr constant [15 x i8] c"HL_NUM_THREADS\00", align 1
@.str.2 = private unnamed_addr constant [14 x i8] c"HL_NUMTHREADS\00", align 1
@_ZN6Halide7Runtime8Internal10work_queueE = linkonce global %"struct.Halide::Runtime::Internal::work_queue_t" { %struct.halide_mutex zeroinitializer, i32 0, i32 0, %"struct.Halide::Runtime::Internal::work"* null, i32 0, i32 0, i32 0, [4 x i8] undef, %struct.halide_mutex zeroinitializer, %struct.halide_mutex zeroinitializer, %struct.halide_mutex zeroinitializer, i32 0, i32 0, [256 x %struct.halide_thread*] zeroinitializer, i8 0, i8 0, i32 0 }, align 8
@.str.3 = private unnamed_addr constant [245 x i8] c"/home/hassamu2/Halide/src/runtime/thread_pool_common.h:527 halide_abort_if_false() failed: (min_threads <= ((task_parent->task.min_threads * task_parent->active_workers) - task_parent->threads_reserved)) && \22Logic error: thread over commit.\\n\22\0A\00", align 1
@_ZN6Halide7Runtime8Internal14custom_do_taskE = linkonce local_unnamed_addr global i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)* @halide_default_do_task, align 8
@_ZN6Halide7Runtime8Internal19custom_do_loop_taskE = linkonce local_unnamed_addr global i32 (i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*)* @halide_default_do_loop_task, align 8
@_ZN6Halide7Runtime8Internal17custom_do_par_forE = linkonce local_unnamed_addr global i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)* @halide_default_do_par_for, align 8
@_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE = linkonce local_unnamed_addr global i32 (i8*, i32, %struct.halide_parallel_task_t*, i8*)* @halide_default_do_parallel_tasks, align 8
@_ZN6Halide7Runtime8Internal21custom_semaphore_initE = linkonce local_unnamed_addr global i32 (%struct.halide_semaphore_t*, i32)* @halide_default_semaphore_init, align 8
@_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE = linkonce local_unnamed_addr global i1 (%struct.halide_semaphore_t*, i32)* @halide_default_semaphore_try_acquire, align 8
@_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE = linkonce local_unnamed_addr global i32 (%struct.halide_semaphore_t*, i32)* @halide_default_semaphore_release, align 8
@.str.4 = private unnamed_addr constant [38 x i8] c"halide_set_num_threads: must be >= 0.\00", align 1
@_ZTVN6Halide7Runtime8Internal15Synchronization21mutex_parking_controlE = linkonce_odr unnamed_addr constant { [6 x i8*] } { [6 x i8*] [i8* null, i8* null, i8* bitcast (i1 (%"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)* @_ZN6Halide7Runtime8Internal15Synchronization21mutex_parking_control8validateERNS2_15validate_actionE to i8*), i8* bitcast (void (%"struct.Halide::Runtime::Internal::Synchronization::parking_control"*)* @_ZN6Halide7Runtime8Internal15Synchronization15parking_control12before_sleepEv to i8*), i8* bitcast (i64 (%"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"*, i32, i1)* @_ZN6Halide7Runtime8Internal15Synchronization21mutex_parking_control6unparkEib to i8*), i8* bitcast (void (%"struct.Halide::Runtime::Internal::Synchronization::parking_control"*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*, i1, i1)* @_ZN6Halide7Runtime8Internal15Synchronization15parking_control16requeue_callbackERKNS2_15validate_actionEbb to i8*)] }, comdat, align 8
@_ZTVN6Halide7Runtime8Internal15Synchronization25broadcast_parking_controlE = linkonce_odr unnamed_addr constant { [6 x i8*] } { [6 x i8*] [i8* null, i8* null, i8* bitcast (i1 (%"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)* @_ZN6Halide7Runtime8Internal15Synchronization25broadcast_parking_control8validateERNS2_15validate_actionE to i8*), i8* bitcast (void (%"struct.Halide::Runtime::Internal::Synchronization::parking_control"*)* @_ZN6Halide7Runtime8Internal15Synchronization15parking_control12before_sleepEv to i8*), i8* bitcast (i64 (%"struct.Halide::Runtime::Internal::Synchronization::parking_control"*, i32, i1)* @_ZN6Halide7Runtime8Internal15Synchronization15parking_control6unparkEib to i8*), i8* bitcast (void (%"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*, i1, i1)* @_ZN6Halide7Runtime8Internal15Synchronization25broadcast_parking_control16requeue_callbackERKNS2_15validate_actionEbb to i8*)] }, comdat, align 8
@_ZTVN6Halide7Runtime8Internal15Synchronization22signal_parking_controlE = linkonce_odr unnamed_addr constant { [6 x i8*] } { [6 x i8*] [i8* null, i8* null, i8* bitcast (i1 (%"struct.Halide::Runtime::Internal::Synchronization::parking_control"*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)* @_ZN6Halide7Runtime8Internal15Synchronization15parking_control8validateERNS2_15validate_actionE to i8*), i8* bitcast (void (%"struct.Halide::Runtime::Internal::Synchronization::parking_control"*)* @_ZN6Halide7Runtime8Internal15Synchronization15parking_control12before_sleepEv to i8*), i8* bitcast (i64 (%"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"*, i32, i1)* @_ZN6Halide7Runtime8Internal15Synchronization22signal_parking_control6unparkEib to i8*), i8* bitcast (void (%"struct.Halide::Runtime::Internal::Synchronization::parking_control"*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*, i1, i1)* @_ZN6Halide7Runtime8Internal15Synchronization15parking_control16requeue_callbackERKNS2_15validate_actionEbb to i8*)] }, comdat, align 8
@.str.5.6 = private unnamed_addr constant [106 x i8] c"/home/hassamu2/Halide/src/runtime/synchronization_common.h:996 halide_abort_if_false() failed: val & 0x1\0A\00", align 1
@_ZTVN6Halide7Runtime8Internal15Synchronization20wait_parking_controlE = linkonce_odr unnamed_addr constant { [6 x i8*] } { [6 x i8*] [i8* null, i8* null, i8* bitcast (i1 (%"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)* @_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control8validateERNS2_15validate_actionE to i8*), i8* bitcast (void (%"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"*)* @_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control12before_sleepEv to i8*), i8* bitcast (i64 (%"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"*, i32, i1)* @_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control6unparkEib to i8*), i8* bitcast (void (%"struct.Halide::Runtime::Internal::Synchronization::parking_control"*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*, i1, i1)* @_ZN6Halide7Runtime8Internal15Synchronization15parking_control16requeue_callbackERKNS2_15validate_actionEbb to i8*)] }, comdat, align 8
@.str.6 = private unnamed_addr constant [168 x i8] c"/home/hassamu2/Halide/src/runtime/thread_pool_common.h:155 halide_abort_if_false() failed: bytes == limit && \22Logic error in thread pool work queue initialization.\\n\22\0A\00", align 1
@_ZN6Halide7Runtime8Internal17custom_get_symbolE = linkonce local_unnamed_addr global i8* (i8*)* @halide_default_get_symbol, align 8
@_ZN6Halide7Runtime8Internal19custom_load_libraryE = linkonce local_unnamed_addr global i8* (i8*)* @halide_default_load_library, align 8
@_ZN6Halide7Runtime8Internal25custom_get_library_symbolE = linkonce local_unnamed_addr global i8* (i8*, i8*)* @halide_default_get_library_symbol, align 8
@_ZN6Halide7Runtime8Internal17halide_gpu_deviceE = linkonce local_unnamed_addr global i32 0, align 4
@_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE = linkonce global i8 0, align 1
@_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE = linkonce local_unnamed_addr global i8 0, align 1
@.str.8 = private unnamed_addr constant [14 x i8] c"HL_GPU_DEVICE\00", align 1
@.str.11 = private unnamed_addr constant [10 x i8] c"<nullptr>\00", align 1
@.str.1.12 = private unnamed_addr constant [5 x i8] c"-nan\00", align 1
@.str.2.13 = private unnamed_addr constant [4 x i8] c"nan\00", align 1
@.str.3.14 = private unnamed_addr constant [5 x i8] c"-inf\00", align 1
@.str.4.15 = private unnamed_addr constant [4 x i8] c"inf\00", align 1
@.str.5.16 = private unnamed_addr constant [14 x i8] c"-0.000000e+00\00", align 1
@.str.6.17 = private unnamed_addr constant [13 x i8] c"0.000000e+00\00", align 1
@.str.7 = private unnamed_addr constant [10 x i8] c"-0.000000\00", align 1
@.str.8.18 = private unnamed_addr constant [9 x i8] c"0.000000\00", align 1
@.str.9 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@.str.11.19 = private unnamed_addr constant [3 x i8] c"e+\00", align 1
@.str.12 = private unnamed_addr constant [3 x i8] c"e-\00", align 1
@.str.13 = private unnamed_addr constant [17 x i8] c"0123456789abcdef\00", align 1
@.str.14 = private unnamed_addr constant [4 x i8] c"int\00", align 1
@.str.15 = private unnamed_addr constant [5 x i8] c"uint\00", align 1
@.str.16 = private unnamed_addr constant [6 x i8] c"float\00", align 1
@.str.17 = private unnamed_addr constant [7 x i8] c"handle\00", align 1
@.str.18 = private unnamed_addr constant [14 x i8] c"bad_type_code\00", align 1
@.str.19 = private constant [2 x i8] c"x\00", align 32
@.str.20 = private unnamed_addr constant [8 x i8] c"nullptr\00", align 1
@.str.21 = private unnamed_addr constant [8 x i8] c"buffer(\00", align 1
@.str.23 = private unnamed_addr constant [4 x i8] c", {\00", align 1
@.str.24 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE = linkonce local_unnamed_addr global i8 1, align 1
@_ZN6Halide7Runtime8Internal21allocation_pools_lockE = linkonce global %struct.halide_mutex zeroinitializer, align 8
@_ZN6Halide7Runtime8Internal23device_allocation_poolsE = linkonce local_unnamed_addr global %struct.halide_device_allocation_pool* null, align 8
@_ZN6Halide7Runtime8Internal17device_copy_mutexE = linkonce global %struct.halide_mutex zeroinitializer, align 8
@.str.6.22 = private unnamed_addr constant [20 x i8] c"halide_copy_to_host\00", align 1
@.str.7.23 = private unnamed_addr constant [22 x i8] c"halide_copy_to_device\00", align 1
@.str.9.24 = private unnamed_addr constant [61 x i8] c"halide_copy_to_device does not support switching interfaces\0A\00", align 1
@.str.16.27 = private unnamed_addr constant [19 x i8] c"halide_device_sync\00", align 1
@.str.17.25 = private unnamed_addr constant [21 x i8] c"halide_device_malloc\00", align 1
@.str.20.26 = private unnamed_addr constant [59 x i8] c"halide_device_malloc doesn't support switching interfaces\0A\00", align 1
@.str.21.28 = private unnamed_addr constant [19 x i8] c"halide_device_free\00", align 1
@.str.22.29 = private unnamed_addr constant [109 x i8] c"/home/hassamu2/Halide/src/runtime/device_interface.cpp:252 halide_abort_if_false() failed: buf->device == 0\0A\00", align 1
@.str.23.30 = private unnamed_addr constant [30 x i8] c"halide_device_and_host_malloc\00", align 1
@.str.25.31 = private unnamed_addr constant [68 x i8] c"halide_device_and_host_malloc doesn't support switching interfaces\0A\00", align 1
@.str.26 = private unnamed_addr constant [42 x i8] c"allocating host and device memory failed\0A\00", align 1
@.str.27 = private unnamed_addr constant [28 x i8] c"halide_device_and_host_free\00", align 1
@.str.28 = private unnamed_addr constant [109 x i8] c"/home/hassamu2/Halide/src/runtime/device_interface.cpp:317 halide_abort_if_false() failed: buf->device == 0\0A\00", align 1
@.str.29 = private unnamed_addr constant [38 x i8] c"halide_default_device_and_host_malloc\00", align 1
@.str.30 = private unnamed_addr constant [36 x i8] c"halide_default_device_and_host_free\00", align 1
@.str.31 = private unnamed_addr constant [26 x i8] c"halide_device_wrap_native\00", align 1
@.str.32 = private unnamed_addr constant [64 x i8] c"halide_device_wrap_native doesn't support switching interfaces\0A\00", align 1
@.str.33 = private unnamed_addr constant [28 x i8] c"halide_device_detach_native\00", align 1
@.str.34 = private unnamed_addr constant [109 x i8] c"/home/hassamu2/Halide/src/runtime/device_interface.cpp:403 halide_abort_if_false() failed: buf->device == 0\0A\00", align 1
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
@_ZZ25halide_profiler_get_stateE1s = internal global %struct.halide_profiler_state { %struct.halide_mutex zeroinitializer, i32 1, i32 0, i32 0, i32 0, %struct.halide_profiler_pipeline_stats* null, void (i32*, i32*)* null, %struct.halide_thread* null }, align 8
@.str.111 = private unnamed_addr constant [103 x i8] c"/home/hassamu2/Halide/src/runtime/profiler.cpp:207 halide_abort_if_false() failed: p_stats != nullptr\0A\00", align 1
@.str.1.112 = private unnamed_addr constant [103 x i8] c"/home/hassamu2/Halide/src/runtime/profiler.cpp:234 halide_abort_if_false() failed: p_stats != nullptr\0A\00", align 1
@.str.2.113 = private unnamed_addr constant [97 x i8] c"/home/hassamu2/Halide/src/runtime/profiler.cpp:235 halide_abort_if_false() failed: func_id >= 0\0A\00", align 1
@.str.3.114 = private unnamed_addr constant [113 x i8] c"/home/hassamu2/Halide/src/runtime/profiler.cpp:236 halide_abort_if_false() failed: func_id < p_stats->num_funcs\0A\00", align 1
@.str.4.115 = private unnamed_addr constant [103 x i8] c"/home/hassamu2/Halide/src/runtime/profiler.cpp:270 halide_abort_if_false() failed: p_stats != nullptr\0A\00", align 1
@.str.5.116 = private unnamed_addr constant [97 x i8] c"/home/hassamu2/Halide/src/runtime/profiler.cpp:271 halide_abort_if_false() failed: func_id >= 0\0A\00", align 1
@.str.6.117 = private unnamed_addr constant [113 x i8] c"/home/hassamu2/Halide/src/runtime/profiler.cpp:272 halide_abort_if_false() failed: func_id < p_stats->num_funcs\0A\00", align 1
@.str.7.89 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.8.90 = private unnamed_addr constant [14 x i8] c" total time: \00", align 1
@.str.9.91 = private unnamed_addr constant [4 x i8] c" ms\00", align 1
@.str.10.92 = private unnamed_addr constant [12 x i8] c"  samples: \00", align 1
@.str.11.93 = private unnamed_addr constant [9 x i8] c"  runs: \00", align 1
@.str.12.94 = private unnamed_addr constant [13 x i8] c"  time/run: \00", align 1
@.str.13.95 = private unnamed_addr constant [5 x i8] c" ms\0A\00", align 1
@.str.14.96 = private unnamed_addr constant [24 x i8] c" average threads used: \00", align 1
@.str.15.97 = private unnamed_addr constant [20 x i8] c" heap allocations: \00", align 1
@.str.16.98 = private unnamed_addr constant [20 x i8] c"  peak heap usage: \00", align 1
@.str.17.99 = private unnamed_addr constant [8 x i8] c" bytes\0A\00", align 1
@.str.18.100 = private unnamed_addr constant [3 x i8] c"  \00", align 1
@.str.19.101 = private unnamed_addr constant [3 x i8] c": \00", align 1
@.str.20.102 = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.21.103 = private unnamed_addr constant [3 x i8] c"ms\00", align 1
@.str.22.104 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@.str.23.105 = private unnamed_addr constant [3 x i8] c"%)\00", align 1
@.str.24.106 = private unnamed_addr constant [10 x i8] c"threads: \00", align 1
@.str.25.107 = private unnamed_addr constant [8 x i8] c" peak: \00", align 1
@.str.26.108 = private unnamed_addr constant [7 x i8] c" num: \00", align 1
@.str.27.109 = private unnamed_addr constant [7 x i8] c" avg: \00", align 1
@.str.28.110 = private unnamed_addr constant [9 x i8] c" stack: \00", align 1
@.str.4.122 = private unnamed_addr constant [22 x i8] c"qurt_hvx_lock failed\0A\00", align 1
@.str.6.124 = private unnamed_addr constant [24 x i8] c"qurt_hvx_unlock failed\0A\00", align 1
@.str.7.123 = private unnamed_addr constant [35 x i8] c"Printer buffer allocation failed.\0A\00", align 1
@_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE = linkonce local_unnamed_addr global i32 (i32, i64*)* @halide_default_can_use_target_features, align 8
@_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE = linkonce global [4 x i64] zeroinitializer, align 8
@_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE = linkonce local_unnamed_addr global i8 0, align 1
@_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE = linkonce global %struct.halide_mutex zeroinitializer, align 8
@.str.125 = private unnamed_addr constant [81 x i8] c"Internal error: wrong structure size passed to halide_can_use_target_features()\0A\00", align 1
@str = private constant [4 x i8] c"out\00", align 32
@str.132 = private constant [2 x i8] c"B\00", align 32
@str.133 = private constant [2 x i8] c"A\00", align 32
@str.134 = private constant [15 x i8] c"Input buffer A\00", align 32
@str.135 = private constant [15 x i8] c"Input buffer B\00", align 32
@str.136 = private constant [18 x i8] c"Output buffer out\00", align 32
@str.137 = private constant [11 x i8] c"A.stride.0\00", align 32
@str.138 = private constant [2 x i8] c"1\00", align 32
@str.139 = private constant [11 x i8] c"B.stride.0\00", align 32
@str.140 = private constant [13 x i8] c"out.stride.0\00", align 32
@str.141 = private constant [2 x i8] c"y\00", align 32
@0 = private constant [4 x i64*] zeroinitializer
@1 = private constant [4 x i64*] zeroinitializer
@2 = private constant i64 0
@3 = private constant i64 128
@4 = private constant i64 0
@5 = private constant i64 128
@6 = private constant [4 x i64*] [i64* @2, i64* @3, i64* @4, i64* @5]
@7 = private constant [3 x %struct.halide_filter_argument_t] [%struct.halide_filter_argument_t { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.133, i32 0, i32 0), i32 1, i32 2, %struct.halide_type_t { i8 1, i8 16, i16 1 }, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, i64** getelementptr inbounds ([4 x i64*], [4 x i64*]* @0, i32 0, i32 0) }, %struct.halide_filter_argument_t { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.132, i32 0, i32 0), i32 1, i32 2, %struct.halide_type_t { i8 1, i8 16, i16 1 }, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, i64** getelementptr inbounds ([4 x i64*], [4 x i64*]* @1, i32 0, i32 0) }, %struct.halide_filter_argument_t { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str, i32 0, i32 0), i32 2, i32 2, %struct.halide_type_t { i8 1, i8 16, i16 1 }, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, i64** getelementptr inbounds ([4 x i64*], [4 x i64*]* @6, i32 0, i32 0) }]
@str.143 = private constant [29 x i8] c"hexagon-64-linux-hvx-hvx_128\00", align 32
@str.144 = private constant [7 x i8] c"matmul\00", align 32
@matmul_metadata_storage = private constant %struct.halide_filter_metadata_t { i32 1, i32 3, %struct.halide_filter_argument_t* getelementptr inbounds ([3 x %struct.halide_filter_argument_t], [3 x %struct.halide_filter_argument_t]* @7, i32 0, i32 0), i8* getelementptr inbounds ([29 x i8], [29 x i8]* @str.143, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @str.144, i32 0, i32 0) }
@switch.table.halide_type_to_string = private unnamed_addr constant [4 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.14, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.15, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.16, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.17, i32 0, i32 0)], align 4

; Function Attrs: mustprogress nounwind
define weak i8* @halide_default_malloc(i8* %user_context, i64 %x) #0 {
entry:
  %add = add i64 %x, 128
  %call1 = tail call i8* @malloc(i64 %add) #12
  %cmp = icmp eq i8* %call1, null
  br i1 %cmp, label %cleanup, label %if.end

if.end:                                           ; preds = %entry
  %0 = ptrtoint i8* %call1 to i32
  %sub = add i32 %0, 135
  %and = and i32 %sub, -128
  %1 = inttoptr i32 %and to i8*
  %2 = inttoptr i32 %and to i8**
  %arrayidx = getelementptr inbounds i8*, i8** %2, i32 -1
  store i8* %call1, i8** %arrayidx, align 8, !tbaa !11
  br label %cleanup

cleanup:                                          ; preds = %if.end, %entry
  %retval.0 = phi i8* [ %1, %if.end ], [ null, %entry ]
  ret i8* %retval.0
}

declare i8* @malloc(i64) local_unnamed_addr #1

; Function Attrs: mustprogress nounwind
define weak void @halide_default_free(i8* %user_context, i8* %ptr) #0 {
entry:
  %arrayidx = getelementptr inbounds i8, i8* %ptr, i32 -8
  %0 = bitcast i8* %arrayidx to i8**
  %1 = load i8*, i8** %0, align 8, !tbaa !11
  tail call void @free(i8* %1) #12
  ret void
}

declare void @free(i8*) local_unnamed_addr #1

; Function Attrs: mustprogress nounwind
define weak i8* (i8*, i64)* @halide_set_custom_malloc(i8* (i8*, i64)* %user_malloc) local_unnamed_addr #0 {
entry:
  %0 = load i8* (i8*, i64)*, i8* (i8*, i64)** @_ZN6Halide7Runtime8Internal13custom_mallocE, align 8, !tbaa !11
  store i8* (i8*, i64)* %user_malloc, i8* (i8*, i64)** @_ZN6Halide7Runtime8Internal13custom_mallocE, align 8, !tbaa !11
  ret i8* (i8*, i64)* %0
}

; Function Attrs: mustprogress nounwind
define weak void (i8*, i8*)* @halide_set_custom_free(void (i8*, i8*)* %user_free) local_unnamed_addr #0 {
entry:
  %0 = load void (i8*, i8*)*, void (i8*, i8*)** @_ZN6Halide7Runtime8Internal11custom_freeE, align 8, !tbaa !11
  store void (i8*, i8*)* %user_free, void (i8*, i8*)** @_ZN6Halide7Runtime8Internal11custom_freeE, align 8, !tbaa !11
  ret void (i8*, i8*)* %0
}

; Function Attrs: mustprogress nounwind
define weak i8* @halide_malloc(i8* %user_context, i64 %x) local_unnamed_addr #0 {
entry:
  %0 = load i8* (i8*, i64)*, i8* (i8*, i64)** @_ZN6Halide7Runtime8Internal13custom_mallocE, align 8, !tbaa !11
  %call = tail call i8* %0(i8* %user_context, i64 %x) #12
  ret i8* %call
}

; Function Attrs: mustprogress nounwind
define weak void @halide_free(i8* %user_context, i8* %ptr) local_unnamed_addr #0 {
entry:
  %0 = load void (i8*, i8*)*, void (i8*, i8*)** @_ZN6Halide7Runtime8Internal11custom_freeE, align 8, !tbaa !11
  tail call void %0(i8* %user_context, i8* %ptr) #12
  ret void
}

; Function Attrs: mustprogress nounwind
define weak void @halide_default_error(i8* %user_context, i8* %msg) #0 {
entry:
  %buf = alloca [4096 x i8], align 1
  %0 = getelementptr inbounds [4096 x i8], [4096 x i8]* %buf, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 4096, i8* nonnull %0) #10
  %add.ptr = getelementptr inbounds [4096 x i8], [4096 x i8]* %buf, i32 0, i32 4094
  %call = call i8* @halide_string_to_string(i8* nonnull %0, i8* nonnull %add.ptr, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0)) #12
  %add.ptr2 = getelementptr inbounds i8, i8* %call, i32 4094
  %call3 = call i8* @halide_string_to_string(i8* %call, i8* nonnull %add.ptr2, i8* %msg) #12
  %arrayidx = getelementptr inbounds i8, i8* %call3, i32 -1
  %1 = load i8, i8* %arrayidx, align 1, !tbaa !15
  %cmp.not = icmp eq i8 %1, 10
  br i1 %cmp.not, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store i8 10, i8* %call3, align 1, !tbaa !15
  %arrayidx5 = getelementptr inbounds i8, i8* %call3, i32 1
  store i8 0, i8* %arrayidx5, align 1, !tbaa !15
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %dst.0 = phi i8* [ %arrayidx5, %if.then ], [ %call3, %entry ]
  %2 = ptrtoint i8* %dst.0 to i32
  %sub.ptr.lhs.cast = zext i32 %2 to i64
  %3 = ptrtoint [4096 x i8]* %buf to i32
  %sub.ptr.rhs.cast = zext i32 %3 to i64
  %sub.ptr.sub = sub nsw i64 1, %sub.ptr.rhs.cast
  %add = add nsw i64 %sub.ptr.sub, %sub.ptr.lhs.cast
  %call9 = call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %0, i64 %add) #12
  call void @halide_print(i8* %user_context, i8* nonnull %0) #12
  call void @abort() #12
  call void @llvm.lifetime.end.p0i8(i64 4096, i8* nonnull %0) #10
  ret void
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

declare void @abort() local_unnamed_addr #1

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: mustprogress nounwind
define weak void @halide_error(i8* %user_context, i8* %msg) local_unnamed_addr #0 {
entry:
  %0 = load void (i8*, i8*)*, void (i8*, i8*)** @_ZN6Halide7Runtime8Internal13error_handlerE, align 8, !tbaa !11
  tail call void %0(i8* %user_context, i8* %msg) #12
  ret void
}

; Function Attrs: mustprogress nounwind
define weak void (i8*, i8*)* @halide_set_error_handler(void (i8*, i8*)* %handler) local_unnamed_addr #0 {
entry:
  %0 = load void (i8*, i8*)*, void (i8*, i8*)** @_ZN6Halide7Runtime8Internal13error_handlerE, align 8, !tbaa !11
  store void (i8*, i8*)* %handler, void (i8*, i8*)** @_ZN6Halide7Runtime8Internal13error_handlerE, align 8, !tbaa !11
  ret void (i8*, i8*)* %0
}

; Function Attrs: mustprogress nounwind
define weak void @halide_print(i8* %user_context, i8* %msg) local_unnamed_addr #0 {
entry:
  %0 = load void (i8*, i8*)*, void (i8*, i8*)** @_ZN6Halide7Runtime8Internal12custom_printE, align 8, !tbaa !11
  tail call void %0(i8* %user_context, i8* %msg) #12
  ret void
}

; Function Attrs: mustprogress nounwind
define weak void (i8*, i8*)* @halide_set_custom_print(void (i8*, i8*)* %print) local_unnamed_addr #0 {
entry:
  %0 = load void (i8*, i8*)*, void (i8*, i8*)** @_ZN6Halide7Runtime8Internal12custom_printE, align 8, !tbaa !11
  store void (i8*, i8*)* %print, void (i8*, i8*)** @_ZN6Halide7Runtime8Internal12custom_printE, align 8, !tbaa !11
  ret void (i8*, i8*)* %0
}

; Function Attrs: mustprogress nounwind
define weak i32 @halide_start_clock(i8* %user_context) local_unnamed_addr #0 {
entry:
  %0 = load i8, i8* @_ZN6Halide7Runtime8Internal29halide_reference_clock_initedE, align 1, !tbaa !16, !range !18
  %tobool.not = icmp eq i8 %0, 0
  br i1 %tobool.not, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = tail call i32 @gettimeofday(%struct.timeval* nonnull @_ZN6Halide7Runtime8Internal22halide_reference_clockE, i8* null) #12
  store i8 1, i8* @_ZN6Halide7Runtime8Internal29halide_reference_clock_initedE, align 1, !tbaa !16
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret i32 0
}

declare i32 @gettimeofday(%struct.timeval*, i8*) local_unnamed_addr #1

; Function Attrs: mustprogress nounwind
define weak i64 @halide_current_time_ns(i8* %user_context) local_unnamed_addr #0 {
entry:
  %now = alloca <2 x i64>, align 16
  %tmpcast = bitcast <2 x i64>* %now to %struct.timeval*
  %0 = bitcast <2 x i64>* %now to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %0) #10
  %call = call i32 @gettimeofday(%struct.timeval* nonnull %tmpcast, i8* null) #12
  %1 = load <2 x i64>, <2 x i64>* %now, align 16, !tbaa !19
  %2 = load <2 x i64>, <2 x i64>* bitcast (%struct.timeval* @_ZN6Halide7Runtime8Internal22halide_reference_clockE to <2 x i64>*), align 8, !tbaa !19
  %3 = sub <2 x i64> %1, %2
  %4 = extractelement <2 x i64> %3, i32 0
  %mul = mul nsw i64 %4, 1000000
  %5 = extractelement <2 x i64> %3, i32 1
  %add = add nsw i64 %mul, %5
  %mul2 = mul nsw i64 %add, 1000
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %0) #10
  ret i64 %mul2
}

; Function Attrs: mustprogress nounwind
define weak void @halide_sleep_ms(i8* %user_context, i32 %ms) local_unnamed_addr #0 {
entry:
  %mul = mul nsw i32 %ms, 1000
  %call = tail call i32 @usleep(i32 %mul) #12
  ret void
}

declare i32 @usleep(i32) local_unnamed_addr #1

; Function Attrs: mustprogress nounwind
define weak void @halide_default_print(i8* %user_context, i8* %str) #0 {
entry:
  %call = tail call i64 @strlen(i8* %str) #12
  %call1 = tail call i64 @write(i32 1, i8* %str, i64 %call) #12
  ret void
}

declare i64 @strlen(i8*) local_unnamed_addr #1

declare i64 @write(i32, i8*, i64) local_unnamed_addr #1

; Function Attrs: mustprogress nounwind
define weak i32 @halide_host_cpu_count() local_unnamed_addr #0 {
entry:
  %call = tail call i64 @sysconf(i32 84) #12
  %conv = trunc i64 %call to i32
  ret i32 %conv
}

declare i64 @sysconf(i32) local_unnamed_addr #1

; Function Attrs: mustprogress nounwind
define weak void @halide_thread_yield() local_unnamed_addr #0 {
entry:
  %call = tail call i32 @sched_yield() #12
  ret void
}

declare i32 @sched_yield() local_unnamed_addr #1

; Function Attrs: mustprogress nounwind
define weak i32 @halide_default_do_task(i8* %user_context, i32 (i8*, i32, i8*)* %f, i32 %idx, i8* %closure) #0 {
entry:
  %call = tail call i32 %f(i8* %user_context, i32 %idx, i8* %closure) #12
  ret i32 %call
}

; Function Attrs: mustprogress nounwind
define weak i32 @halide_default_do_loop_task(i8* %user_context, i32 (i8*, i32, i32, i8*, i8*)* %f, i32 %min, i32 %extent, i8* %closure, i8* %task_parent) #0 {
entry:
  %call = tail call i32 %f(i8* %user_context, i32 %min, i32 %extent, i8* %closure, i8* %task_parent) #12
  ret i32 %call
}

; Function Attrs: mustprogress nounwind
define weak i32 @halide_default_do_par_for(i8* %user_context, i32 (i8*, i32, i8*)* %f, i32 %min, i32 %size, i8* %closure) #0 {
entry:
  %job = alloca %"struct.Halide::Runtime::Internal::work", align 8
  %cmp = icmp slt i32 %size, 1
  br i1 %cmp, label %return, label %if.end

if.end:                                           ; preds = %entry
  %0 = bitcast %"struct.Halide::Runtime::Internal::work"* %job to i8*
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %0) #10
  %fn = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %job, i32 0, i32 0, i32 0
  store i32 (i8*, i32, i32, i8*, i8*)* null, i32 (i8*, i32, i32, i8*, i8*)** %fn, align 8, !tbaa !21
  %min2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %job, i32 0, i32 0, i32 5
  store i32 %min, i32* %min2, align 4, !tbaa !25
  %extent = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %job, i32 0, i32 0, i32 6
  store i32 %size, i32* %extent, align 8, !tbaa !26
  %serial = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %job, i32 0, i32 0, i32 8
  store i8 0, i8* %serial, align 8, !tbaa !27
  %semaphores = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %job, i32 0, i32 0, i32 3
  store %struct.halide_semaphore_acquire_t* null, %struct.halide_semaphore_acquire_t** %semaphores, align 8, !tbaa !28
  %num_semaphores = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %job, i32 0, i32 0, i32 4
  store i32 0, i32* %num_semaphores, align 8, !tbaa !29
  %closure8 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %job, i32 0, i32 0, i32 1
  store i8* %closure, i8** %closure8, align 8, !tbaa !30
  %min_threads = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %job, i32 0, i32 0, i32 7
  store i32 0, i32* %min_threads, align 4, !tbaa !31
  %name = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %job, i32 0, i32 0, i32 2
  store i8* null, i8** %name, align 8, !tbaa !32
  %task_fn = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %job, i32 0, i32 1
  store i32 (i8*, i32, i8*)* %f, i32 (i8*, i32, i8*)** %task_fn, align 8, !tbaa !33
  %user_context11 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %job, i32 0, i32 7
  store i8* %user_context, i8** %user_context11, align 8, !tbaa !34
  %exit_status = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %job, i32 0, i32 9
  store i32 0, i32* %exit_status, align 8, !tbaa !35
  %active_workers = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %job, i32 0, i32 8
  store i32 0, i32* %active_workers, align 8, !tbaa !36
  %next_semaphore = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %job, i32 0, i32 10
  store i32 0, i32* %next_semaphore, align 8, !tbaa !37
  %owner_is_sleeping = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %job, i32 0, i32 11
  store i8 0, i8* %owner_is_sleeping, align 8, !tbaa !38
  %siblings = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %job, i32 0, i32 3
  store %"struct.Halide::Runtime::Internal::work"* %job, %"struct.Halide::Runtime::Internal::work"** %siblings, align 8, !tbaa !39
  %sibling_count = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %job, i32 0, i32 4
  store i32 0, i32* %sibling_count, align 8, !tbaa !40
  %parent_job = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %job, i32 0, i32 5
  store %"struct.Halide::Runtime::Internal::work"* null, %"struct.Halide::Runtime::Internal::work"** %parent_job, align 8, !tbaa !41
  call void @halide_mutex_lock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 0)) #13
  call void @_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_(i32 1, %"struct.Halide::Runtime::Internal::work"* nonnull %job, %"struct.Halide::Runtime::Internal::work"* null) #13
  call void @_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE(%"struct.Halide::Runtime::Internal::work"* nonnull %job) #13
  call void @halide_mutex_unlock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 0)) #13
  %1 = load i32, i32* %exit_status, align 8, !tbaa !35
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %0) #10
  br label %return

return:                                           ; preds = %if.end, %entry
  %retval.0 = phi i32 [ %1, %if.end ], [ 0, %entry ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define weak void @halide_mutex_lock(%struct.halide_mutex* %mutex) local_unnamed_addr #3 {
entry:
  %control.i.i = alloca %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", align 8
  %state.i = getelementptr %struct.halide_mutex, %struct.halide_mutex* %mutex, i32 0, i32 0, i32 0
  %0 = cmpxchg weak i64* %state.i, i64 0, i64 1 acquire monotonic, align 8
  %1 = extractvalue { i64, i1 } %0, 1
  br i1 %1, label %_ZN6Halide7Runtime8Internal15Synchronization10fast_mutex4lockEv.exit, label %if.then.i

if.then.i:                                        ; preds = %entry
  %2 = load atomic i64, i64* %state.i monotonic, align 8
  %3 = bitcast %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %control.i.i to i8*
  %4 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %control.i.i, i32 0, i32 0, i32 0
  %lock_state2.i.i.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %control.i.i, i32 0, i32 1
  %5 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %control.i.i, i32 0, i32 0
  %6 = ptrtoint %struct.halide_mutex* %mutex to i32
  %7 = zext i32 %6 to i64
  br label %while.cond.outer.i.i

while.cond.outer.i.i:                             ; preds = %while.cond.outer.i.i.backedge, %if.then.i
  %expected.0.ph.i.i = phi i64 [ %2, %if.then.i ], [ %expected.0.ph.i.i.be, %while.cond.outer.i.i.backedge ]
  %spinner.sroa.0.0.ph.i.i = phi i32 [ 40, %if.then.i ], [ %spinner.sroa.0.0.ph.i.i.be, %while.cond.outer.i.i.backedge ]
  %and55.i.i = and i64 %expected.0.ph.i.i, 1
  %tobool.not56.i.i = icmp eq i64 %and55.i.i, 0
  br i1 %tobool.not56.i.i, label %if.then.i.i, label %if.end4.i.i

if.then.i.i:                                      ; preds = %_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_131atomic_cas_weak_acquire_relaxedEPyS4_S4_.exit.i.i, %while.cond.outer.i.i
  %expected.057.i.i = phi i64 [ %10, %_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_131atomic_cas_weak_acquire_relaxedEPyS4_S4_.exit.i.i ], [ %expected.0.ph.i.i, %while.cond.outer.i.i ]
  %or.i.i = or i64 %expected.057.i.i, 1
  %8 = cmpxchg weak i64* %state.i, i64 %expected.057.i.i, i64 %or.i.i acquire monotonic, align 8
  %9 = extractvalue { i64, i1 } %8, 1
  br i1 %9, label %_ZN6Halide7Runtime8Internal15Synchronization10fast_mutex4lockEv.exit, label %_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_131atomic_cas_weak_acquire_relaxedEPyS4_S4_.exit.i.i

_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_131atomic_cas_weak_acquire_relaxedEPyS4_S4_.exit.i.i: ; preds = %if.then.i.i
  %10 = extractvalue { i64, i1 } %8, 0
  %and.i.i = and i64 %10, 1
  %tobool.not.i.i = icmp eq i64 %and.i.i, 0
  br i1 %tobool.not.i.i, label %if.then.i.i, label %if.end4.i.i.loopexit

if.end4.i.i.loopexit:                             ; preds = %_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_131atomic_cas_weak_acquire_relaxedEPyS4_S4_.exit.i.i
  %11 = extractvalue { i64, i1 } %8, 0
  br label %if.end4.i.i

if.end4.i.i:                                      ; preds = %if.end4.i.i.loopexit, %while.cond.outer.i.i
  %expected.0.lcssa.i.i = phi i64 [ %expected.0.ph.i.i, %while.cond.outer.i.i ], [ %11, %if.end4.i.i.loopexit ]
  %cmp.i.i.i = icmp sgt i32 %spinner.sroa.0.0.ph.i.i, 0
  br i1 %cmp.i.i.i, label %_ZN6Halide7Runtime8Internal15Synchronization12spin_control11should_spinEv.exit.i.i, label %if.end8.i.i

_ZN6Halide7Runtime8Internal15Synchronization12spin_control11should_spinEv.exit.i.i: ; preds = %if.end4.i.i
  %cmp4.i.not.i.i = icmp eq i32 %spinner.sroa.0.0.ph.i.i, 1
  br i1 %cmp4.i.not.i.i, label %if.end8.i.i, label %if.then6.i.i

if.then6.i.i:                                     ; preds = %_ZN6Halide7Runtime8Internal15Synchronization12spin_control11should_spinEv.exit.i.i
  %dec.i.i.i = add nsw i32 %spinner.sroa.0.0.ph.i.i, -1
  call void @halide_thread_yield() #12
  %12 = load atomic i64, i64* %state.i monotonic, align 8
  br label %while.cond.outer.i.i.backedge

if.end8.i.i:                                      ; preds = %_ZN6Halide7Runtime8Internal15Synchronization12spin_control11should_spinEv.exit.i.i, %if.end4.i.i
  %spinner.sroa.0.152.i.i = phi i32 [ 0, %_ZN6Halide7Runtime8Internal15Synchronization12spin_control11should_spinEv.exit.i.i ], [ %spinner.sroa.0.0.ph.i.i, %if.end4.i.i ]
  %and9.i.i = and i64 %expected.0.lcssa.i.i, 2
  %cmp.i.i = icmp eq i64 %and9.i.i, 0
  br i1 %cmp.i.i, label %if.then10.i.i, label %if.end19.i.i

if.then10.i.i:                                    ; preds = %if.end8.i.i
  %or12.i.i = or i64 %expected.0.lcssa.i.i, 2
  %13 = cmpxchg weak i64* %state.i, i64 %expected.0.lcssa.i.i, i64 %or12.i.i monotonic monotonic, align 8
  %14 = extractvalue { i64, i1 } %13, 1
  br i1 %14, label %if.end19.i.i, label %_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_131atomic_cas_weak_relaxed_relaxedEPyS4_S4_.exit.i.i

_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_131atomic_cas_weak_relaxed_relaxedEPyS4_S4_.exit.i.i: ; preds = %if.then10.i.i
  %15 = extractvalue { i64, i1 } %13, 0
  br label %while.cond.outer.i.i.backedge

if.end19.i.i:                                     ; preds = %if.then10.i.i, %if.end8.i.i
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %3) #10
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [6 x i8*] }, { [6 x i8*] }* @_ZTVN6Halide7Runtime8Internal15Synchronization21mutex_parking_controlE, i32 0, inrange i32 0, i32 2) to i32 (...)**), i32 (...)*** %4, align 8, !tbaa !42
  store i64* %state.i, i64** %lock_state2.i.i.i, align 8, !tbaa !44
  %call21.i.i = call i64 @_ZN6Halide7Runtime8Internal15Synchronization15parking_control4parkEy(%"struct.Halide::Runtime::Internal::Synchronization::parking_control"* nonnull align 8 dereferenceable(8) %5, i64 %7) #12
  %cmp22.i.i = icmp eq i64 %call21.i.i, %7
  br i1 %cmp22.i.i, label %cleanup30.critedge.i.i, label %if.end24.i.i

if.end24.i.i:                                     ; preds = %if.end19.i.i
  %16 = load atomic i64, i64* %state.i monotonic, align 8
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %3) #10
  br label %while.cond.outer.i.i.backedge

while.cond.outer.i.i.backedge:                    ; preds = %if.end24.i.i, %_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_131atomic_cas_weak_relaxed_relaxedEPyS4_S4_.exit.i.i, %if.then6.i.i
  %expected.0.ph.i.i.be = phi i64 [ %15, %_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_131atomic_cas_weak_relaxed_relaxedEPyS4_S4_.exit.i.i ], [ %16, %if.end24.i.i ], [ %12, %if.then6.i.i ]
  %spinner.sroa.0.0.ph.i.i.be = phi i32 [ %spinner.sroa.0.152.i.i, %_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_131atomic_cas_weak_relaxed_relaxedEPyS4_S4_.exit.i.i ], [ 40, %if.end24.i.i ], [ %dec.i.i.i, %if.then6.i.i ]
  br label %while.cond.outer.i.i, !llvm.loop !46

cleanup30.critedge.i.i:                           ; preds = %if.end19.i.i
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %3) #10
  br label %_ZN6Halide7Runtime8Internal15Synchronization10fast_mutex4lockEv.exit

_ZN6Halide7Runtime8Internal15Synchronization10fast_mutex4lockEv.exit: ; preds = %cleanup30.critedge.i.i, %if.then.i.i, %entry
  ret void
}

; Function Attrs: mustprogress nounwind
define linkonce void @_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_(i32 %num_jobs, %"struct.Halide::Runtime::Internal::work"* %jobs, %"struct.Halide::Runtime::Internal::work"* %task_parent) local_unnamed_addr #0 {
entry:
  %0 = load i8, i8* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 15), align 1, !tbaa !48, !range !18
  %tobool.not = icmp eq i8 %0, 0
  br i1 %tobool.not, label %land.rhs.i, label %if.end4

land.rhs.i:                                       ; preds = %while.body.i.27, %entry
  %bytes.011.i = phi i8* [ %incdec.ptr.i.27, %while.body.i.27 ], [ bitcast (i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 2) to i8*), %entry ]
  %1 = load i8, i8* %bytes.011.i, align 1, !tbaa !15
  %cmp2.i = icmp eq i8 %1, 0
  br i1 %cmp2.i, label %while.body.i, label %do.body.i

while.body.i:                                     ; preds = %land.rhs.i
  %incdec.ptr.i = getelementptr inbounds i8, i8* %bytes.011.i, i32 1
  %2 = load i8, i8* %incdec.ptr.i, align 1, !tbaa !15
  %cmp2.i.1 = icmp eq i8 %2, 0
  br i1 %cmp2.i.1, label %while.body.i.1, label %do.body.i.split.loop.exit64

do.body.i.split.loop.exit:                        ; preds = %while.body.i.26
  %incdec.ptr.i.26.le = getelementptr inbounds i8, i8* %bytes.011.i, i32 27
  br label %do.body.i

do.body.i.split.loop.exit14:                      ; preds = %while.body.i.25
  %incdec.ptr.i.25.le = getelementptr inbounds i8, i8* %bytes.011.i, i32 26
  br label %do.body.i

do.body.i.split.loop.exit16:                      ; preds = %while.body.i.24
  %incdec.ptr.i.24.le = getelementptr inbounds i8, i8* %bytes.011.i, i32 25
  br label %do.body.i

do.body.i.split.loop.exit18:                      ; preds = %while.body.i.23
  %incdec.ptr.i.23.le = getelementptr inbounds i8, i8* %bytes.011.i, i32 24
  br label %do.body.i

do.body.i.split.loop.exit20:                      ; preds = %while.body.i.22
  %incdec.ptr.i.22.le = getelementptr inbounds i8, i8* %bytes.011.i, i32 23
  br label %do.body.i

do.body.i.split.loop.exit22:                      ; preds = %while.body.i.21
  %incdec.ptr.i.21.le = getelementptr inbounds i8, i8* %bytes.011.i, i32 22
  br label %do.body.i

do.body.i.split.loop.exit24:                      ; preds = %while.body.i.20
  %incdec.ptr.i.20.le = getelementptr inbounds i8, i8* %bytes.011.i, i32 21
  br label %do.body.i

do.body.i.split.loop.exit26:                      ; preds = %while.body.i.19
  %incdec.ptr.i.19.le = getelementptr inbounds i8, i8* %bytes.011.i, i32 20
  br label %do.body.i

do.body.i.split.loop.exit28:                      ; preds = %while.body.i.18
  %incdec.ptr.i.18.le = getelementptr inbounds i8, i8* %bytes.011.i, i32 19
  br label %do.body.i

do.body.i.split.loop.exit30:                      ; preds = %while.body.i.17
  %incdec.ptr.i.17.le = getelementptr inbounds i8, i8* %bytes.011.i, i32 18
  br label %do.body.i

do.body.i.split.loop.exit32:                      ; preds = %while.body.i.16
  %incdec.ptr.i.16.le = getelementptr inbounds i8, i8* %bytes.011.i, i32 17
  br label %do.body.i

do.body.i.split.loop.exit34:                      ; preds = %while.body.i.15
  %incdec.ptr.i.15.le = getelementptr inbounds i8, i8* %bytes.011.i, i32 16
  br label %do.body.i

do.body.i.split.loop.exit36:                      ; preds = %while.body.i.14
  %incdec.ptr.i.14.le = getelementptr inbounds i8, i8* %bytes.011.i, i32 15
  br label %do.body.i

do.body.i.split.loop.exit38:                      ; preds = %while.body.i.13
  %incdec.ptr.i.13.le = getelementptr inbounds i8, i8* %bytes.011.i, i32 14
  br label %do.body.i

do.body.i.split.loop.exit40:                      ; preds = %while.body.i.12
  %incdec.ptr.i.12.le = getelementptr inbounds i8, i8* %bytes.011.i, i32 13
  br label %do.body.i

do.body.i.split.loop.exit42:                      ; preds = %while.body.i.11
  %incdec.ptr.i.11.le = getelementptr inbounds i8, i8* %bytes.011.i, i32 12
  br label %do.body.i

do.body.i.split.loop.exit44:                      ; preds = %while.body.i.10
  %incdec.ptr.i.10.le = getelementptr inbounds i8, i8* %bytes.011.i, i32 11
  br label %do.body.i

do.body.i.split.loop.exit46:                      ; preds = %while.body.i.9
  %incdec.ptr.i.9.le = getelementptr inbounds i8, i8* %bytes.011.i, i32 10
  br label %do.body.i

do.body.i.split.loop.exit48:                      ; preds = %while.body.i.8
  %incdec.ptr.i.8.le = getelementptr inbounds i8, i8* %bytes.011.i, i32 9
  br label %do.body.i

do.body.i.split.loop.exit50:                      ; preds = %while.body.i.7
  %incdec.ptr.i.7.le = getelementptr inbounds i8, i8* %bytes.011.i, i32 8
  br label %do.body.i

do.body.i.split.loop.exit52:                      ; preds = %while.body.i.6
  %incdec.ptr.i.6.le = getelementptr inbounds i8, i8* %bytes.011.i, i32 7
  br label %do.body.i

do.body.i.split.loop.exit54:                      ; preds = %while.body.i.5
  %incdec.ptr.i.5.le = getelementptr inbounds i8, i8* %bytes.011.i, i32 6
  br label %do.body.i

do.body.i.split.loop.exit56:                      ; preds = %while.body.i.4
  %incdec.ptr.i.4.le = getelementptr inbounds i8, i8* %bytes.011.i, i32 5
  br label %do.body.i

do.body.i.split.loop.exit58:                      ; preds = %while.body.i.3
  %incdec.ptr.i.3.le = getelementptr inbounds i8, i8* %bytes.011.i, i32 4
  br label %do.body.i

do.body.i.split.loop.exit60:                      ; preds = %while.body.i.2
  %incdec.ptr.i.2.le = getelementptr inbounds i8, i8* %bytes.011.i, i32 3
  br label %do.body.i

do.body.i.split.loop.exit62:                      ; preds = %while.body.i.1
  %incdec.ptr.i.1.le = getelementptr inbounds i8, i8* %bytes.011.i, i32 2
  br label %do.body.i

do.body.i.split.loop.exit64:                      ; preds = %while.body.i
  %incdec.ptr.i.le = getelementptr inbounds i8, i8* %bytes.011.i, i32 1
  br label %do.body.i

do.body.i:                                        ; preds = %do.body.i.split.loop.exit64, %do.body.i.split.loop.exit62, %do.body.i.split.loop.exit60, %do.body.i.split.loop.exit58, %do.body.i.split.loop.exit56, %do.body.i.split.loop.exit54, %do.body.i.split.loop.exit52, %do.body.i.split.loop.exit50, %do.body.i.split.loop.exit48, %do.body.i.split.loop.exit46, %do.body.i.split.loop.exit44, %do.body.i.split.loop.exit42, %do.body.i.split.loop.exit40, %do.body.i.split.loop.exit38, %do.body.i.split.loop.exit36, %do.body.i.split.loop.exit34, %do.body.i.split.loop.exit32, %do.body.i.split.loop.exit30, %do.body.i.split.loop.exit28, %do.body.i.split.loop.exit26, %do.body.i.split.loop.exit24, %do.body.i.split.loop.exit22, %do.body.i.split.loop.exit20, %do.body.i.split.loop.exit18, %do.body.i.split.loop.exit16, %do.body.i.split.loop.exit14, %do.body.i.split.loop.exit, %land.rhs.i
  %bytes.011.i.lcssa = phi i8* [ %incdec.ptr.i.26.le, %do.body.i.split.loop.exit ], [ %incdec.ptr.i.25.le, %do.body.i.split.loop.exit14 ], [ %incdec.ptr.i.24.le, %do.body.i.split.loop.exit16 ], [ %incdec.ptr.i.23.le, %do.body.i.split.loop.exit18 ], [ %incdec.ptr.i.22.le, %do.body.i.split.loop.exit20 ], [ %incdec.ptr.i.21.le, %do.body.i.split.loop.exit22 ], [ %incdec.ptr.i.20.le, %do.body.i.split.loop.exit24 ], [ %incdec.ptr.i.19.le, %do.body.i.split.loop.exit26 ], [ %incdec.ptr.i.18.le, %do.body.i.split.loop.exit28 ], [ %incdec.ptr.i.17.le, %do.body.i.split.loop.exit30 ], [ %incdec.ptr.i.16.le, %do.body.i.split.loop.exit32 ], [ %incdec.ptr.i.15.le, %do.body.i.split.loop.exit34 ], [ %incdec.ptr.i.14.le, %do.body.i.split.loop.exit36 ], [ %incdec.ptr.i.13.le, %do.body.i.split.loop.exit38 ], [ %incdec.ptr.i.12.le, %do.body.i.split.loop.exit40 ], [ %incdec.ptr.i.11.le, %do.body.i.split.loop.exit42 ], [ %incdec.ptr.i.10.le, %do.body.i.split.loop.exit44 ], [ %incdec.ptr.i.9.le, %do.body.i.split.loop.exit46 ], [ %incdec.ptr.i.8.le, %do.body.i.split.loop.exit48 ], [ %incdec.ptr.i.7.le, %do.body.i.split.loop.exit50 ], [ %incdec.ptr.i.6.le, %do.body.i.split.loop.exit52 ], [ %incdec.ptr.i.5.le, %do.body.i.split.loop.exit54 ], [ %incdec.ptr.i.4.le, %do.body.i.split.loop.exit56 ], [ %incdec.ptr.i.3.le, %do.body.i.split.loop.exit58 ], [ %incdec.ptr.i.2.le, %do.body.i.split.loop.exit60 ], [ %incdec.ptr.i.1.le, %do.body.i.split.loop.exit62 ], [ %incdec.ptr.i.le, %do.body.i.split.loop.exit64 ], [ %bytes.011.i, %land.rhs.i ]
  %cmp3.i = icmp eq i8* %bytes.011.i.lcssa, bitcast (%"struct.Halide::Runtime::Internal::work_queue_t"* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 1) to i8*)
  br i1 %cmp3.i, label %_ZNK6Halide7Runtime8Internal12work_queue_t13assert_zeroedEv.exit, label %if.then.i

if.then.i:                                        ; preds = %do.body.i
  tail call void @halide_print(i8* null, i8* getelementptr inbounds ([168 x i8], [168 x i8]* @.str.6, i32 0, i32 0)) #12
  tail call void @abort() #12
  br label %_ZNK6Halide7Runtime8Internal12work_queue_t13assert_zeroedEv.exit

_ZNK6Halide7Runtime8Internal12work_queue_t13assert_zeroedEv.exit: ; preds = %while.body.i.27, %if.then.i, %do.body.i
  %3 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 1), align 8, !tbaa !52
  %tobool1.not = icmp eq i32 %3, 0
  br i1 %tobool1.not, label %if.then2, label %if.end

if.then2:                                         ; preds = %_ZNK6Halide7Runtime8Internal12work_queue_t13assert_zeroedEv.exit
  %call = tail call i32 @_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv() #13
  br label %if.end

if.end:                                           ; preds = %if.then2, %_ZNK6Halide7Runtime8Internal12work_queue_t13assert_zeroedEv.exit
  %4 = phi i32 [ %call, %if.then2 ], [ %3, %_ZNK6Halide7Runtime8Internal12work_queue_t13assert_zeroedEv.exit ]
  %5 = icmp sgt i32 %4, 1
  %.threads.i = select i1 %5, i32 %4, i32 1
  %6 = icmp slt i32 %.threads.i, 256
  %retval.0.i = select i1 %6, i32 %.threads.i, i32 256
  store i32 %retval.0.i, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 1), align 8, !tbaa !52
  store i8 1, i8* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 15), align 1, !tbaa !48
  br label %if.end4

if.end4:                                          ; preds = %if.end, %entry
  %cmp178 = icmp sgt i32 %num_jobs, 0
  br i1 %cmp178, label %for.body.preheader, label %for.cond.cleanup

for.body.preheader:                               ; preds = %if.end4
  %wide.trip.count = zext i32 %num_jobs to i64
  %7 = add nsw i64 %wide.trip.count, -1
  %xtraiter = and i64 %wide.trip.count, 3
  %8 = icmp ult i64 %7, 3
  br i1 %8, label %for.cond.cleanup.loopexit.unr-lcssa, label %for.body.preheader.new

for.body.preheader.new:                           ; preds = %for.body.preheader
  %unroll_iter = and i64 %wide.trip.count, 4294967292
  br label %for.body

for.cond.cleanup.loopexit.unr-lcssa:              ; preds = %for.inc.3, %for.body.preheader
  %workers_to_wake.1.lcssa.ph = phi i32 [ undef, %for.body.preheader ], [ %workers_to_wake.1.3, %for.inc.3 ]
  %add.lcssa.ph = phi i32 [ undef, %for.body.preheader ], [ %add.3, %for.inc.3 ]
  %stealable_jobs.1.lcssa.ph = phi i8 [ undef, %for.body.preheader ], [ %stealable_jobs.1.3, %for.inc.3 ]
  %job_may_block.1.lcssa.ph = phi i8 [ undef, %for.body.preheader ], [ %job_may_block.1.3, %for.inc.3 ]
  %spec.select.lcssa.ph = phi i8 [ undef, %for.body.preheader ], [ %spec.select.3, %for.inc.3 ]
  %indvars.iv.unr = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next.3, %for.inc.3 ]
  %min_threads.0184.unr = phi i32 [ 0, %for.body.preheader ], [ %add.3, %for.inc.3 ]
  %job_may_block.0182.unr = phi i8 [ 0, %for.body.preheader ], [ %job_may_block.1.3, %for.inc.3 ]
  %job_has_acquires.0181.unr = phi i8 [ 0, %for.body.preheader ], [ %spec.select.3, %for.inc.3 ]
  %stealable_jobs.0180.unr = phi i8 [ 0, %for.body.preheader ], [ %stealable_jobs.1.3, %for.inc.3 ]
  %workers_to_wake.0179.unr = phi i32 [ -1, %for.body.preheader ], [ %workers_to_wake.1.3, %for.inc.3 ]
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod.not, label %for.cond.cleanup.loopexit, label %for.body.epil

for.body.epil:                                    ; preds = %for.inc.epil, %for.cond.cleanup.loopexit.unr-lcssa
  %indvars.iv.epil = phi i64 [ %indvars.iv.next.epil, %for.inc.epil ], [ %indvars.iv.unr, %for.cond.cleanup.loopexit.unr-lcssa ]
  %min_threads.0184.epil = phi i32 [ %add.epil, %for.inc.epil ], [ %min_threads.0184.unr, %for.cond.cleanup.loopexit.unr-lcssa ]
  %job_may_block.0182.epil = phi i8 [ %job_may_block.1.epil, %for.inc.epil ], [ %job_may_block.0182.unr, %for.cond.cleanup.loopexit.unr-lcssa ]
  %job_has_acquires.0181.epil = phi i8 [ %spec.select.epil, %for.inc.epil ], [ %job_has_acquires.0181.unr, %for.cond.cleanup.loopexit.unr-lcssa ]
  %stealable_jobs.0180.epil = phi i8 [ %stealable_jobs.1.epil, %for.inc.epil ], [ %stealable_jobs.0180.unr, %for.cond.cleanup.loopexit.unr-lcssa ]
  %workers_to_wake.0179.epil = phi i32 [ %workers_to_wake.1.epil, %for.inc.epil ], [ %workers_to_wake.0179.unr, %for.cond.cleanup.loopexit.unr-lcssa ]
  %epil.iter = phi i64 [ %epil.iter.sub, %for.inc.epil ], [ %xtraiter, %for.cond.cleanup.loopexit.unr-lcssa ]
  %9 = trunc i64 %indvars.iv.epil to i32
  %min_threads5.epil = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %9, i32 0, i32 7
  %10 = load i32, i32* %min_threads5.epil, align 4, !tbaa !31
  %cmp6.epil = icmp eq i32 %10, 0
  %add.epil = add nsw i32 %10, %min_threads.0184.epil
  %stealable_jobs.1.epil = select i1 %cmp6.epil, i8 1, i8 %stealable_jobs.0180.epil
  %job_may_block.1.epil = select i1 %cmp6.epil, i8 %job_may_block.0182.epil, i8 1
  %num_semaphores.epil = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %9, i32 0, i32 4
  %11 = load i32, i32* %num_semaphores.epil, align 8, !tbaa !29
  %cmp16.not.epil = icmp eq i32 %11, 0
  %spec.select.epil = select i1 %cmp16.not.epil, i8 %job_has_acquires.0181.epil, i8 1
  %serial.epil = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %9, i32 0, i32 8
  %12 = load i8, i8* %serial.epil, align 8, !tbaa !27, !range !18
  %tobool22.not.epil = icmp eq i8 %12, 0
  br i1 %tobool22.not.epil, label %if.else24.epil, label %if.then23.epil

if.then23.epil:                                   ; preds = %for.body.epil
  %inc.epil = add nsw i32 %workers_to_wake.0179.epil, 1
  br label %for.inc.epil

if.else24.epil:                                   ; preds = %for.body.epil
  %extent.epil = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %9, i32 0, i32 6
  %13 = load i32, i32* %extent.epil, align 8, !tbaa !26
  %add28.epil = add nsw i32 %13, %workers_to_wake.0179.epil
  br label %for.inc.epil

for.inc.epil:                                     ; preds = %if.else24.epil, %if.then23.epil
  %workers_to_wake.1.epil = phi i32 [ %inc.epil, %if.then23.epil ], [ %add28.epil, %if.else24.epil ]
  %indvars.iv.next.epil = add nuw nsw i64 %indvars.iv.epil, 1
  %epil.iter.sub = add i64 %epil.iter, -1
  %epil.iter.cmp.not = icmp eq i64 %epil.iter.sub, 0
  br i1 %epil.iter.cmp.not, label %for.cond.cleanup.loopexit, label %for.body.epil, !llvm.loop !53

for.cond.cleanup.loopexit:                        ; preds = %for.inc.epil, %for.cond.cleanup.loopexit.unr-lcssa
  %workers_to_wake.1.lcssa = phi i32 [ %workers_to_wake.1.lcssa.ph, %for.cond.cleanup.loopexit.unr-lcssa ], [ %workers_to_wake.1.epil, %for.inc.epil ]
  %add.lcssa = phi i32 [ %add.lcssa.ph, %for.cond.cleanup.loopexit.unr-lcssa ], [ %add.epil, %for.inc.epil ]
  %stealable_jobs.1.lcssa = phi i8 [ %stealable_jobs.1.lcssa.ph, %for.cond.cleanup.loopexit.unr-lcssa ], [ %stealable_jobs.1.epil, %for.inc.epil ]
  %job_may_block.1.lcssa = phi i8 [ %job_may_block.1.lcssa.ph, %for.cond.cleanup.loopexit.unr-lcssa ], [ %job_may_block.1.epil, %for.inc.epil ]
  %spec.select.lcssa = phi i8 [ %spec.select.lcssa.ph, %for.cond.cleanup.loopexit.unr-lcssa ], [ %spec.select.epil, %for.inc.epil ]
  %phi.bo = and i8 %spec.select.lcssa, 1
  %phi.bo197 = and i8 %job_may_block.1.lcssa, 1
  %phi.bo198 = and i8 %stealable_jobs.1.lcssa, 1
  br label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit, %if.end4
  %workers_to_wake.0.lcssa = phi i32 [ -1, %if.end4 ], [ %workers_to_wake.1.lcssa, %for.cond.cleanup.loopexit ]
  %stealable_jobs.0.lcssa = phi i8 [ 0, %if.end4 ], [ %phi.bo198, %for.cond.cleanup.loopexit ]
  %job_has_acquires.0.lcssa = phi i8 [ 0, %if.end4 ], [ %phi.bo, %for.cond.cleanup.loopexit ]
  %job_may_block.0.lcssa = phi i8 [ 0, %if.end4 ], [ %phi.bo197, %for.cond.cleanup.loopexit ]
  %min_threads.0.lcssa = phi i32 [ 0, %if.end4 ], [ %add.lcssa, %for.cond.cleanup.loopexit ]
  %cmp31 = icmp eq %"struct.Halide::Runtime::Internal::work"* %task_parent, null
  br i1 %cmp31, label %if.then32, label %do.body61

for.body:                                         ; preds = %for.inc.3, %for.body.preheader.new
  %indvars.iv = phi i64 [ 0, %for.body.preheader.new ], [ %indvars.iv.next.3, %for.inc.3 ]
  %min_threads.0184 = phi i32 [ 0, %for.body.preheader.new ], [ %add.3, %for.inc.3 ]
  %job_may_block.0182 = phi i8 [ 0, %for.body.preheader.new ], [ %job_may_block.1.3, %for.inc.3 ]
  %job_has_acquires.0181 = phi i8 [ 0, %for.body.preheader.new ], [ %spec.select.3, %for.inc.3 ]
  %stealable_jobs.0180 = phi i8 [ 0, %for.body.preheader.new ], [ %stealable_jobs.1.3, %for.inc.3 ]
  %workers_to_wake.0179 = phi i32 [ -1, %for.body.preheader.new ], [ %workers_to_wake.1.3, %for.inc.3 ]
  %niter = phi i64 [ %unroll_iter, %for.body.preheader.new ], [ %niter.nsub.3, %for.inc.3 ]
  %14 = trunc i64 %indvars.iv to i32
  %min_threads5 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %14, i32 0, i32 7
  %15 = load i32, i32* %min_threads5, align 4, !tbaa !31
  %cmp6 = icmp eq i32 %15, 0
  %add = add nsw i32 %15, %min_threads.0184
  %num_semaphores = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %14, i32 0, i32 4
  %16 = load i32, i32* %num_semaphores, align 8, !tbaa !29
  %cmp16.not = icmp eq i32 %16, 0
  %serial = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %14, i32 0, i32 8
  %17 = load i8, i8* %serial, align 8, !tbaa !27, !range !18
  %tobool22.not = icmp eq i8 %17, 0
  br i1 %tobool22.not, label %if.else24, label %if.then23

if.then23:                                        ; preds = %for.body
  %inc = add nsw i32 %workers_to_wake.0179, 1
  br label %for.inc

if.else24:                                        ; preds = %for.body
  %extent = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %14, i32 0, i32 6
  %18 = load i32, i32* %extent, align 8, !tbaa !26
  %add28 = add nsw i32 %18, %workers_to_wake.0179
  br label %for.inc

for.inc:                                          ; preds = %if.else24, %if.then23
  %workers_to_wake.1 = phi i32 [ %inc, %if.then23 ], [ %add28, %if.else24 ]
  %19 = trunc i64 %indvars.iv to i32
  %20 = or i32 %19, 1
  %min_threads5.1 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %20, i32 0, i32 7
  %21 = load i32, i32* %min_threads5.1, align 4, !tbaa !31
  %cmp6.1 = icmp eq i32 %21, 0
  %add.1 = add nsw i32 %21, %add
  %num_semaphores.1 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %20, i32 0, i32 4
  %22 = load i32, i32* %num_semaphores.1, align 8, !tbaa !29
  %cmp16.not.1 = icmp eq i32 %22, 0
  %serial.1 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %20, i32 0, i32 8
  %23 = load i8, i8* %serial.1, align 8, !tbaa !27, !range !18
  %tobool22.not.1 = icmp eq i8 %23, 0
  br i1 %tobool22.not.1, label %if.else24.1, label %if.then23.1

if.then32:                                        ; preds = %for.cond.cleanup
  %tobool33.not = icmp eq i8 %job_has_acquires.0.lcssa, 0
  %tobool34.not = icmp eq i8 %job_may_block.0.lcssa, 0
  %or.cond = select i1 %tobool33.not, i1 %tobool34.not, i1 false
  %not.or.cond = xor i1 %or.cond, true
  %add36 = zext i1 %not.or.cond to i32
  %min_threads.2 = add nsw i32 %min_threads.0.lcssa, %add36
  %.pr = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 4), align 8, !tbaa !55
  %cmp38189 = icmp slt i32 %.pr, 256
  br i1 %cmp38189, label %land.rhs, label %do.end50

land.rhs:                                         ; preds = %while.body, %if.then32
  %24 = phi i32 [ %inc45, %while.body ], [ %.pr, %if.then32 ]
  %25 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 1), align 8, !tbaa !52
  %sub = add nsw i32 %25, -1
  %cmp39 = icmp slt i32 %24, %sub
  br i1 %cmp39, label %while.body, label %lor.rhs

lor.rhs:                                          ; preds = %land.rhs
  %add40 = add nsw i32 %24, 1
  %26 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 16), align 4, !tbaa !56
  %sub41 = sub i32 %add40, %26
  %cmp42 = icmp slt i32 %sub41, %min_threads.2
  br i1 %cmp42, label %while.body, label %do.end50

while.body:                                       ; preds = %lor.rhs, %land.rhs
  %27 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 5), align 8, !tbaa !57
  %inc43 = add nsw i32 %27, 1
  store i32 %inc43, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 5), align 8, !tbaa !57
  %call44 = tail call %struct.halide_thread* @halide_spawn_thread(void (i8*)* nonnull @_ZN6Halide7Runtime8Internal13worker_threadEPv, i8* null) #13
  %28 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 4), align 8, !tbaa !55
  %inc45 = add nsw i32 %28, 1
  store i32 %inc45, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 4), align 8, !tbaa !55
  %arrayidx47 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 13, i32 %28
  store %struct.halide_thread* %call44, %struct.halide_thread** %arrayidx47, align 8, !tbaa !11
  %cmp38 = icmp slt i32 %28, 255
  br i1 %cmp38, label %land.rhs, label %do.end50, !llvm.loop !58

do.end50:                                         ; preds = %while.body, %lor.rhs, %if.then32
  br i1 %or.cond, label %if.end77, label %if.then54

if.then54:                                        ; preds = %do.end50
  %29 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 16), align 4, !tbaa !56
  %inc55 = add nsw i32 %29, 1
  store i32 %inc55, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 16), align 4, !tbaa !56
  br label %if.end77

do.body61:                                        ; preds = %for.cond.cleanup
  %min_threads63 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %task_parent, i32 0, i32 0, i32 7
  %30 = load i32, i32* %min_threads63, align 4, !tbaa !31
  %active_workers = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %task_parent, i32 0, i32 8
  %31 = load i32, i32* %active_workers, align 8, !tbaa !36
  %mul = mul nsw i32 %31, %30
  %threads_reserved = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %task_parent, i32 0, i32 6
  %32 = load i32, i32* %threads_reserved, align 8, !tbaa !59
  %sub64 = sub nsw i32 %mul, %32
  %cmp65.not = icmp sgt i32 %min_threads.0.lcssa, %sub64
  br i1 %cmp65.not, label %if.then66, label %do.end69

if.then66:                                        ; preds = %do.body61
  tail call void @halide_print(i8* null, i8* getelementptr inbounds ([245 x i8], [245 x i8]* @.str.3, i32 0, i32 0)) #12
  tail call void @abort() #12
  br label %do.end69

do.end69:                                         ; preds = %if.then66, %do.body61
  %tobool70.not = icmp eq i8 %job_has_acquires.0.lcssa, 0
  %tobool72.not = icmp eq i8 %job_may_block.0.lcssa, 0
  %or.cond173 = select i1 %tobool70.not, i1 %tobool72.not, i1 false
  br i1 %or.cond173, label %if.end77, label %if.then73

if.then73:                                        ; preds = %do.end69
  %33 = load i32, i32* %threads_reserved, align 8, !tbaa !59
  %inc75 = add nsw i32 %33, 1
  store i32 %inc75, i32* %threads_reserved, align 8, !tbaa !59
  br label %if.end77

if.end77:                                         ; preds = %if.then73, %do.end69, %if.then54, %do.end50
  br i1 %cmp178, label %for.body83.lr.ph, label %for.cond.cleanup82

for.body83.lr.ph:                                 ; preds = %if.end77
  %.promoted = load %"struct.Halide::Runtime::Internal::work"*, %"struct.Halide::Runtime::Internal::work"** getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 3), align 8, !tbaa !60
  %34 = zext i32 %num_jobs to i64
  %35 = add nsw i64 %34, -1
  %xtraiter12 = and i64 %34, 7
  %lcmp.mod13.not = icmp eq i64 %xtraiter12, 0
  br i1 %lcmp.mod13.not, label %for.body83.prol.loopexit, label %for.body83.prol

for.body83.prol:                                  ; preds = %for.body83.prol, %for.body83.lr.ph
  %indvars.iv195.prol = phi i64 [ %indvars.iv.next196.prol, %for.body83.prol ], [ %34, %for.body83.lr.ph ]
  %arrayidx85193.prol = phi %"struct.Halide::Runtime::Internal::work"* [ %arrayidx85.prol, %for.body83.prol ], [ %.promoted, %for.body83.lr.ph ]
  %i78.0192.in.prol = phi i32 [ %i78.0192.prol, %for.body83.prol ], [ %num_jobs, %for.body83.lr.ph ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body83.prol ], [ %xtraiter12, %for.body83.lr.ph ]
  %i78.0192.prol = add nsw i32 %i78.0192.in.prol, -1
  %arrayidx85.prol = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %i78.0192.prol
  %next_job.prol = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %i78.0192.prol, i32 2
  store %"struct.Halide::Runtime::Internal::work"* %arrayidx85193.prol, %"struct.Halide::Runtime::Internal::work"** %next_job.prol, align 8, !tbaa !61
  %siblings.prol = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %i78.0192.prol, i32 3
  store %"struct.Halide::Runtime::Internal::work"* %jobs, %"struct.Halide::Runtime::Internal::work"** %siblings.prol, align 8, !tbaa !39
  %sibling_count.prol = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %i78.0192.prol, i32 4
  store i32 %num_jobs, i32* %sibling_count.prol, align 8, !tbaa !40
  %threads_reserved93.prol = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %i78.0192.prol, i32 6
  store i32 0, i32* %threads_reserved93.prol, align 8, !tbaa !59
  %indvars.iv.next196.prol = add nsw i64 %indvars.iv195.prol, -1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp.not = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp.not, label %for.body83.prol.loopexit, label %for.body83.prol, !llvm.loop !62

for.body83.prol.loopexit:                         ; preds = %for.body83.prol, %for.body83.lr.ph
  %indvars.iv195.unr = phi i64 [ %34, %for.body83.lr.ph ], [ %indvars.iv.next196.prol, %for.body83.prol ]
  %arrayidx85193.unr = phi %"struct.Halide::Runtime::Internal::work"* [ %.promoted, %for.body83.lr.ph ], [ %arrayidx85.prol, %for.body83.prol ]
  %i78.0192.in.unr = phi i32 [ %num_jobs, %for.body83.lr.ph ], [ %i78.0192.prol, %for.body83.prol ]
  %36 = icmp ult i64 %35, 7
  br i1 %36, label %for.cond80.for.cond.cleanup82_crit_edge, label %for.body83

for.cond80.for.cond.cleanup82_crit_edge:          ; preds = %for.body83, %for.body83.prol.loopexit
  store %"struct.Halide::Runtime::Internal::work"* %jobs, %"struct.Halide::Runtime::Internal::work"** getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 3), align 8, !tbaa !60
  br label %for.cond.cleanup82

for.cond.cleanup82:                               ; preds = %for.cond80.for.cond.cleanup82_crit_edge, %if.end77
  %37 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 12), align 4, !tbaa !63
  %tobool96 = icmp ne i32 %37, 0
  %38 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 11), align 8
  %39 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 4), align 8
  %cmp98 = icmp slt i32 %38, %39
  %40 = select i1 %tobool96, i1 true, i1 %cmp98
  %cmp102 = icmp sgt i32 %workers_to_wake.0.lcssa, %38
  %or.cond174 = select i1 %40, i1 true, i1 %cmp102
  %storemerge = select i1 %or.cond174, i32 %39, i32 %workers_to_wake.0.lcssa
  store i32 %storemerge, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 6), align 8, !tbaa !64
  tail call void @halide_cond_broadcast(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 8)) #13
  %41 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 6), align 8, !tbaa !64
  %42 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 5), align 8, !tbaa !57
  %cmp106 = icmp sgt i32 %41, %42
  br i1 %cmp106, label %if.then107, label %if.end111

for.body83:                                       ; preds = %for.body83, %for.body83.prol.loopexit
  %indvars.iv195 = phi i64 [ %indvars.iv.next196.7, %for.body83 ], [ %indvars.iv195.unr, %for.body83.prol.loopexit ]
  %arrayidx85193 = phi %"struct.Halide::Runtime::Internal::work"* [ %arrayidx85.7, %for.body83 ], [ %arrayidx85193.unr, %for.body83.prol.loopexit ]
  %i78.0192.in = phi i32 [ %i78.0192.7, %for.body83 ], [ %i78.0192.in.unr, %for.body83.prol.loopexit ]
  %i78.0192 = add nsw i32 %i78.0192.in, -1
  %arrayidx85 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %i78.0192
  %next_job = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %i78.0192, i32 2
  store %"struct.Halide::Runtime::Internal::work"* %arrayidx85193, %"struct.Halide::Runtime::Internal::work"** %next_job, align 8, !tbaa !61
  %siblings = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %i78.0192, i32 3
  store %"struct.Halide::Runtime::Internal::work"* %jobs, %"struct.Halide::Runtime::Internal::work"** %siblings, align 8, !tbaa !39
  %sibling_count = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %i78.0192, i32 4
  store i32 %num_jobs, i32* %sibling_count, align 8, !tbaa !40
  %threads_reserved93 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %i78.0192, i32 6
  store i32 0, i32* %threads_reserved93, align 8, !tbaa !59
  %i78.0192.1 = add nsw i32 %i78.0192.in, -2
  %arrayidx85.1 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %i78.0192.1
  %next_job.1 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %i78.0192.1, i32 2
  store %"struct.Halide::Runtime::Internal::work"* %arrayidx85, %"struct.Halide::Runtime::Internal::work"** %next_job.1, align 8, !tbaa !61
  %siblings.1 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %i78.0192.1, i32 3
  store %"struct.Halide::Runtime::Internal::work"* %jobs, %"struct.Halide::Runtime::Internal::work"** %siblings.1, align 8, !tbaa !39
  %sibling_count.1 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %i78.0192.1, i32 4
  store i32 %num_jobs, i32* %sibling_count.1, align 8, !tbaa !40
  %threads_reserved93.1 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %i78.0192.1, i32 6
  store i32 0, i32* %threads_reserved93.1, align 8, !tbaa !59
  %i78.0192.2 = add nsw i32 %i78.0192.in, -3
  %arrayidx85.2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %i78.0192.2
  %next_job.2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %i78.0192.2, i32 2
  store %"struct.Halide::Runtime::Internal::work"* %arrayidx85.1, %"struct.Halide::Runtime::Internal::work"** %next_job.2, align 8, !tbaa !61
  %siblings.2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %i78.0192.2, i32 3
  store %"struct.Halide::Runtime::Internal::work"* %jobs, %"struct.Halide::Runtime::Internal::work"** %siblings.2, align 8, !tbaa !39
  %sibling_count.2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %i78.0192.2, i32 4
  store i32 %num_jobs, i32* %sibling_count.2, align 8, !tbaa !40
  %threads_reserved93.2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %i78.0192.2, i32 6
  store i32 0, i32* %threads_reserved93.2, align 8, !tbaa !59
  %i78.0192.3 = add nsw i32 %i78.0192.in, -4
  %arrayidx85.3 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %i78.0192.3
  %next_job.3 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %i78.0192.3, i32 2
  store %"struct.Halide::Runtime::Internal::work"* %arrayidx85.2, %"struct.Halide::Runtime::Internal::work"** %next_job.3, align 8, !tbaa !61
  %siblings.3 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %i78.0192.3, i32 3
  store %"struct.Halide::Runtime::Internal::work"* %jobs, %"struct.Halide::Runtime::Internal::work"** %siblings.3, align 8, !tbaa !39
  %sibling_count.3 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %i78.0192.3, i32 4
  store i32 %num_jobs, i32* %sibling_count.3, align 8, !tbaa !40
  %threads_reserved93.3 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %i78.0192.3, i32 6
  store i32 0, i32* %threads_reserved93.3, align 8, !tbaa !59
  %i78.0192.4 = add nsw i32 %i78.0192.in, -5
  %arrayidx85.4 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %i78.0192.4
  %next_job.4 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %i78.0192.4, i32 2
  store %"struct.Halide::Runtime::Internal::work"* %arrayidx85.3, %"struct.Halide::Runtime::Internal::work"** %next_job.4, align 8, !tbaa !61
  %siblings.4 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %i78.0192.4, i32 3
  store %"struct.Halide::Runtime::Internal::work"* %jobs, %"struct.Halide::Runtime::Internal::work"** %siblings.4, align 8, !tbaa !39
  %sibling_count.4 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %i78.0192.4, i32 4
  store i32 %num_jobs, i32* %sibling_count.4, align 8, !tbaa !40
  %threads_reserved93.4 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %i78.0192.4, i32 6
  store i32 0, i32* %threads_reserved93.4, align 8, !tbaa !59
  %i78.0192.5 = add nsw i32 %i78.0192.in, -6
  %arrayidx85.5 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %i78.0192.5
  %next_job.5 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %i78.0192.5, i32 2
  store %"struct.Halide::Runtime::Internal::work"* %arrayidx85.4, %"struct.Halide::Runtime::Internal::work"** %next_job.5, align 8, !tbaa !61
  %siblings.5 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %i78.0192.5, i32 3
  store %"struct.Halide::Runtime::Internal::work"* %jobs, %"struct.Halide::Runtime::Internal::work"** %siblings.5, align 8, !tbaa !39
  %sibling_count.5 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %i78.0192.5, i32 4
  store i32 %num_jobs, i32* %sibling_count.5, align 8, !tbaa !40
  %threads_reserved93.5 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %i78.0192.5, i32 6
  store i32 0, i32* %threads_reserved93.5, align 8, !tbaa !59
  %i78.0192.6 = add nsw i32 %i78.0192.in, -7
  %arrayidx85.6 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %i78.0192.6
  %next_job.6 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %i78.0192.6, i32 2
  store %"struct.Halide::Runtime::Internal::work"* %arrayidx85.5, %"struct.Halide::Runtime::Internal::work"** %next_job.6, align 8, !tbaa !61
  %siblings.6 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %i78.0192.6, i32 3
  store %"struct.Halide::Runtime::Internal::work"* %jobs, %"struct.Halide::Runtime::Internal::work"** %siblings.6, align 8, !tbaa !39
  %sibling_count.6 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %i78.0192.6, i32 4
  store i32 %num_jobs, i32* %sibling_count.6, align 8, !tbaa !40
  %threads_reserved93.6 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %i78.0192.6, i32 6
  store i32 0, i32* %threads_reserved93.6, align 8, !tbaa !59
  %i78.0192.7 = add nsw i32 %i78.0192.in, -8
  %arrayidx85.7 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %i78.0192.7
  %next_job.7 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %i78.0192.7, i32 2
  store %"struct.Halide::Runtime::Internal::work"* %arrayidx85.6, %"struct.Halide::Runtime::Internal::work"** %next_job.7, align 8, !tbaa !61
  %siblings.7 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %i78.0192.7, i32 3
  store %"struct.Halide::Runtime::Internal::work"* %jobs, %"struct.Halide::Runtime::Internal::work"** %siblings.7, align 8, !tbaa !39
  %sibling_count.7 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %i78.0192.7, i32 4
  store i32 %num_jobs, i32* %sibling_count.7, align 8, !tbaa !40
  %threads_reserved93.7 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %i78.0192.7, i32 6
  store i32 0, i32* %threads_reserved93.7, align 8, !tbaa !59
  %cmp81.7 = icmp sgt i64 %indvars.iv195, 8
  %indvars.iv.next196.7 = add nsw i64 %indvars.iv195, -8
  br i1 %cmp81.7, label %for.body83, label %for.cond80.for.cond.cleanup82_crit_edge, !llvm.loop !65

if.then107:                                       ; preds = %for.cond.cleanup82
  tail call void @halide_cond_broadcast(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 9)) #13
  %tobool108.not = icmp eq i8 %stealable_jobs.0.lcssa, 0
  br i1 %tobool108.not, label %if.end111, label %if.then109

if.then109:                                       ; preds = %if.then107
  tail call void @halide_cond_broadcast(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 10)) #13
  br label %if.end111

if.end111:                                        ; preds = %if.then109, %if.then107, %for.cond.cleanup82
  %tobool112.not = icmp eq i8 %job_has_acquires.0.lcssa, 0
  %tobool114.not = icmp eq i8 %job_may_block.0.lcssa, 0
  %or.cond175 = select i1 %tobool112.not, i1 %tobool114.not, i1 false
  br i1 %or.cond175, label %if.end123, label %if.then115

if.then115:                                       ; preds = %if.end111
  br i1 %cmp31, label %if.else120, label %if.then117

if.then117:                                       ; preds = %if.then115
  %threads_reserved118 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %task_parent, i32 0, i32 6
  %43 = load i32, i32* %threads_reserved118, align 8, !tbaa !59
  %dec119 = add nsw i32 %43, -1
  store i32 %dec119, i32* %threads_reserved118, align 8, !tbaa !59
  br label %if.end123

if.else120:                                       ; preds = %if.then115
  %44 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 16), align 4, !tbaa !56
  %dec121 = add nsw i32 %44, -1
  store i32 %dec121, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 16), align 4, !tbaa !56
  br label %if.end123

if.end123:                                        ; preds = %if.else120, %if.then117, %if.end111
  ret void

while.body.i.1:                                   ; preds = %while.body.i
  %incdec.ptr.i.1 = getelementptr inbounds i8, i8* %bytes.011.i, i32 2
  %45 = load i8, i8* %incdec.ptr.i.1, align 1, !tbaa !15
  %cmp2.i.2 = icmp eq i8 %45, 0
  br i1 %cmp2.i.2, label %while.body.i.2, label %do.body.i.split.loop.exit62

while.body.i.2:                                   ; preds = %while.body.i.1
  %incdec.ptr.i.2 = getelementptr inbounds i8, i8* %bytes.011.i, i32 3
  %46 = load i8, i8* %incdec.ptr.i.2, align 1, !tbaa !15
  %cmp2.i.3 = icmp eq i8 %46, 0
  br i1 %cmp2.i.3, label %while.body.i.3, label %do.body.i.split.loop.exit60

while.body.i.3:                                   ; preds = %while.body.i.2
  %incdec.ptr.i.3 = getelementptr inbounds i8, i8* %bytes.011.i, i32 4
  %47 = load i8, i8* %incdec.ptr.i.3, align 1, !tbaa !15
  %cmp2.i.4 = icmp eq i8 %47, 0
  br i1 %cmp2.i.4, label %while.body.i.4, label %do.body.i.split.loop.exit58

while.body.i.4:                                   ; preds = %while.body.i.3
  %incdec.ptr.i.4 = getelementptr inbounds i8, i8* %bytes.011.i, i32 5
  %48 = load i8, i8* %incdec.ptr.i.4, align 1, !tbaa !15
  %cmp2.i.5 = icmp eq i8 %48, 0
  br i1 %cmp2.i.5, label %while.body.i.5, label %do.body.i.split.loop.exit56

while.body.i.5:                                   ; preds = %while.body.i.4
  %incdec.ptr.i.5 = getelementptr inbounds i8, i8* %bytes.011.i, i32 6
  %49 = load i8, i8* %incdec.ptr.i.5, align 1, !tbaa !15
  %cmp2.i.6 = icmp eq i8 %49, 0
  br i1 %cmp2.i.6, label %while.body.i.6, label %do.body.i.split.loop.exit54

while.body.i.6:                                   ; preds = %while.body.i.5
  %incdec.ptr.i.6 = getelementptr inbounds i8, i8* %bytes.011.i, i32 7
  %50 = load i8, i8* %incdec.ptr.i.6, align 1, !tbaa !15
  %cmp2.i.7 = icmp eq i8 %50, 0
  br i1 %cmp2.i.7, label %while.body.i.7, label %do.body.i.split.loop.exit52

while.body.i.7:                                   ; preds = %while.body.i.6
  %incdec.ptr.i.7 = getelementptr inbounds i8, i8* %bytes.011.i, i32 8
  %51 = load i8, i8* %incdec.ptr.i.7, align 1, !tbaa !15
  %cmp2.i.8 = icmp eq i8 %51, 0
  br i1 %cmp2.i.8, label %while.body.i.8, label %do.body.i.split.loop.exit50

while.body.i.8:                                   ; preds = %while.body.i.7
  %incdec.ptr.i.8 = getelementptr inbounds i8, i8* %bytes.011.i, i32 9
  %52 = load i8, i8* %incdec.ptr.i.8, align 1, !tbaa !15
  %cmp2.i.9 = icmp eq i8 %52, 0
  br i1 %cmp2.i.9, label %while.body.i.9, label %do.body.i.split.loop.exit48

while.body.i.9:                                   ; preds = %while.body.i.8
  %incdec.ptr.i.9 = getelementptr inbounds i8, i8* %bytes.011.i, i32 10
  %53 = load i8, i8* %incdec.ptr.i.9, align 1, !tbaa !15
  %cmp2.i.10 = icmp eq i8 %53, 0
  br i1 %cmp2.i.10, label %while.body.i.10, label %do.body.i.split.loop.exit46

while.body.i.10:                                  ; preds = %while.body.i.9
  %incdec.ptr.i.10 = getelementptr inbounds i8, i8* %bytes.011.i, i32 11
  %54 = load i8, i8* %incdec.ptr.i.10, align 1, !tbaa !15
  %cmp2.i.11 = icmp eq i8 %54, 0
  br i1 %cmp2.i.11, label %while.body.i.11, label %do.body.i.split.loop.exit44

while.body.i.11:                                  ; preds = %while.body.i.10
  %incdec.ptr.i.11 = getelementptr inbounds i8, i8* %bytes.011.i, i32 12
  %55 = load i8, i8* %incdec.ptr.i.11, align 1, !tbaa !15
  %cmp2.i.12 = icmp eq i8 %55, 0
  br i1 %cmp2.i.12, label %while.body.i.12, label %do.body.i.split.loop.exit42

while.body.i.12:                                  ; preds = %while.body.i.11
  %incdec.ptr.i.12 = getelementptr inbounds i8, i8* %bytes.011.i, i32 13
  %56 = load i8, i8* %incdec.ptr.i.12, align 1, !tbaa !15
  %cmp2.i.13 = icmp eq i8 %56, 0
  br i1 %cmp2.i.13, label %while.body.i.13, label %do.body.i.split.loop.exit40

while.body.i.13:                                  ; preds = %while.body.i.12
  %incdec.ptr.i.13 = getelementptr inbounds i8, i8* %bytes.011.i, i32 14
  %57 = load i8, i8* %incdec.ptr.i.13, align 1, !tbaa !15
  %cmp2.i.14 = icmp eq i8 %57, 0
  br i1 %cmp2.i.14, label %while.body.i.14, label %do.body.i.split.loop.exit38

while.body.i.14:                                  ; preds = %while.body.i.13
  %incdec.ptr.i.14 = getelementptr inbounds i8, i8* %bytes.011.i, i32 15
  %58 = load i8, i8* %incdec.ptr.i.14, align 1, !tbaa !15
  %cmp2.i.15 = icmp eq i8 %58, 0
  br i1 %cmp2.i.15, label %while.body.i.15, label %do.body.i.split.loop.exit36

while.body.i.15:                                  ; preds = %while.body.i.14
  %incdec.ptr.i.15 = getelementptr inbounds i8, i8* %bytes.011.i, i32 16
  %59 = load i8, i8* %incdec.ptr.i.15, align 1, !tbaa !15
  %cmp2.i.16 = icmp eq i8 %59, 0
  br i1 %cmp2.i.16, label %while.body.i.16, label %do.body.i.split.loop.exit34

while.body.i.16:                                  ; preds = %while.body.i.15
  %incdec.ptr.i.16 = getelementptr inbounds i8, i8* %bytes.011.i, i32 17
  %60 = load i8, i8* %incdec.ptr.i.16, align 1, !tbaa !15
  %cmp2.i.17 = icmp eq i8 %60, 0
  br i1 %cmp2.i.17, label %while.body.i.17, label %do.body.i.split.loop.exit32

while.body.i.17:                                  ; preds = %while.body.i.16
  %incdec.ptr.i.17 = getelementptr inbounds i8, i8* %bytes.011.i, i32 18
  %61 = load i8, i8* %incdec.ptr.i.17, align 1, !tbaa !15
  %cmp2.i.18 = icmp eq i8 %61, 0
  br i1 %cmp2.i.18, label %while.body.i.18, label %do.body.i.split.loop.exit30

while.body.i.18:                                  ; preds = %while.body.i.17
  %incdec.ptr.i.18 = getelementptr inbounds i8, i8* %bytes.011.i, i32 19
  %62 = load i8, i8* %incdec.ptr.i.18, align 1, !tbaa !15
  %cmp2.i.19 = icmp eq i8 %62, 0
  br i1 %cmp2.i.19, label %while.body.i.19, label %do.body.i.split.loop.exit28

while.body.i.19:                                  ; preds = %while.body.i.18
  %incdec.ptr.i.19 = getelementptr inbounds i8, i8* %bytes.011.i, i32 20
  %63 = load i8, i8* %incdec.ptr.i.19, align 1, !tbaa !15
  %cmp2.i.20 = icmp eq i8 %63, 0
  br i1 %cmp2.i.20, label %while.body.i.20, label %do.body.i.split.loop.exit26

while.body.i.20:                                  ; preds = %while.body.i.19
  %incdec.ptr.i.20 = getelementptr inbounds i8, i8* %bytes.011.i, i32 21
  %64 = load i8, i8* %incdec.ptr.i.20, align 1, !tbaa !15
  %cmp2.i.21 = icmp eq i8 %64, 0
  br i1 %cmp2.i.21, label %while.body.i.21, label %do.body.i.split.loop.exit24

while.body.i.21:                                  ; preds = %while.body.i.20
  %incdec.ptr.i.21 = getelementptr inbounds i8, i8* %bytes.011.i, i32 22
  %65 = load i8, i8* %incdec.ptr.i.21, align 1, !tbaa !15
  %cmp2.i.22 = icmp eq i8 %65, 0
  br i1 %cmp2.i.22, label %while.body.i.22, label %do.body.i.split.loop.exit22

while.body.i.22:                                  ; preds = %while.body.i.21
  %incdec.ptr.i.22 = getelementptr inbounds i8, i8* %bytes.011.i, i32 23
  %66 = load i8, i8* %incdec.ptr.i.22, align 1, !tbaa !15
  %cmp2.i.23 = icmp eq i8 %66, 0
  br i1 %cmp2.i.23, label %while.body.i.23, label %do.body.i.split.loop.exit20

while.body.i.23:                                  ; preds = %while.body.i.22
  %incdec.ptr.i.23 = getelementptr inbounds i8, i8* %bytes.011.i, i32 24
  %67 = load i8, i8* %incdec.ptr.i.23, align 1, !tbaa !15
  %cmp2.i.24 = icmp eq i8 %67, 0
  br i1 %cmp2.i.24, label %while.body.i.24, label %do.body.i.split.loop.exit18

while.body.i.24:                                  ; preds = %while.body.i.23
  %incdec.ptr.i.24 = getelementptr inbounds i8, i8* %bytes.011.i, i32 25
  %68 = load i8, i8* %incdec.ptr.i.24, align 1, !tbaa !15
  %cmp2.i.25 = icmp eq i8 %68, 0
  br i1 %cmp2.i.25, label %while.body.i.25, label %do.body.i.split.loop.exit16

while.body.i.25:                                  ; preds = %while.body.i.24
  %incdec.ptr.i.25 = getelementptr inbounds i8, i8* %bytes.011.i, i32 26
  %69 = load i8, i8* %incdec.ptr.i.25, align 1, !tbaa !15
  %cmp2.i.26 = icmp eq i8 %69, 0
  br i1 %cmp2.i.26, label %while.body.i.26, label %do.body.i.split.loop.exit14

while.body.i.26:                                  ; preds = %while.body.i.25
  %incdec.ptr.i.26 = getelementptr inbounds i8, i8* %bytes.011.i, i32 27
  %70 = load i8, i8* %incdec.ptr.i.26, align 1, !tbaa !15
  %cmp2.i.27 = icmp eq i8 %70, 0
  br i1 %cmp2.i.27, label %while.body.i.27, label %do.body.i.split.loop.exit

while.body.i.27:                                  ; preds = %while.body.i.26
  %incdec.ptr.i.27 = getelementptr inbounds i8, i8* %bytes.011.i, i32 28
  %exitcond.not.i.27 = icmp eq i8* %incdec.ptr.i.27, bitcast (%"struct.Halide::Runtime::Internal::work_queue_t"* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 1) to i8*)
  br i1 %exitcond.not.i.27, label %_ZNK6Halide7Runtime8Internal12work_queue_t13assert_zeroedEv.exit, label %land.rhs.i, !llvm.loop !66

if.then23.1:                                      ; preds = %for.inc
  %inc.1 = add nsw i32 %workers_to_wake.1, 1
  br label %for.inc.1

if.else24.1:                                      ; preds = %for.inc
  %extent.1 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %20, i32 0, i32 6
  %71 = load i32, i32* %extent.1, align 8, !tbaa !26
  %add28.1 = add nsw i32 %71, %workers_to_wake.1
  br label %for.inc.1

for.inc.1:                                        ; preds = %if.else24.1, %if.then23.1
  %workers_to_wake.1.1 = phi i32 [ %inc.1, %if.then23.1 ], [ %add28.1, %if.else24.1 ]
  %72 = trunc i64 %indvars.iv to i32
  %73 = or i32 %72, 2
  %min_threads5.2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %73, i32 0, i32 7
  %74 = load i32, i32* %min_threads5.2, align 4, !tbaa !31
  %cmp6.2 = icmp eq i32 %74, 0
  %add.2 = add nsw i32 %74, %add.1
  %num_semaphores.2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %73, i32 0, i32 4
  %75 = load i32, i32* %num_semaphores.2, align 8, !tbaa !29
  %cmp16.not.2 = icmp eq i32 %75, 0
  %serial.2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %73, i32 0, i32 8
  %76 = load i8, i8* %serial.2, align 8, !tbaa !27, !range !18
  %tobool22.not.2 = icmp eq i8 %76, 0
  br i1 %tobool22.not.2, label %if.else24.2, label %if.then23.2

if.then23.2:                                      ; preds = %for.inc.1
  %inc.2 = add nsw i32 %workers_to_wake.1.1, 1
  br label %for.inc.2

if.else24.2:                                      ; preds = %for.inc.1
  %extent.2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %73, i32 0, i32 6
  %77 = load i32, i32* %extent.2, align 8, !tbaa !26
  %add28.2 = add nsw i32 %77, %workers_to_wake.1.1
  br label %for.inc.2

for.inc.2:                                        ; preds = %if.else24.2, %if.then23.2
  %workers_to_wake.1.2 = phi i32 [ %inc.2, %if.then23.2 ], [ %add28.2, %if.else24.2 ]
  %78 = trunc i64 %indvars.iv to i32
  %79 = or i32 %78, 3
  %min_threads5.3 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %79, i32 0, i32 7
  %80 = load i32, i32* %min_threads5.3, align 4, !tbaa !31
  %cmp6.3 = icmp eq i32 %80, 0
  %add.3 = add nsw i32 %80, %add.2
  %81 = select i1 %cmp6.3, i1 true, i1 %cmp6.2
  %82 = select i1 %81, i1 true, i1 %cmp6.1
  %83 = select i1 %82, i1 true, i1 %cmp6
  %stealable_jobs.1.3 = select i1 %83, i8 1, i8 %stealable_jobs.0180
  %84 = select i1 %cmp6.3, i1 %cmp6.2, i1 false
  %85 = select i1 %84, i1 %cmp6.1, i1 false
  %86 = select i1 %85, i1 %cmp6, i1 false
  %job_may_block.1.3 = select i1 %86, i8 %job_may_block.0182, i8 1
  %num_semaphores.3 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %79, i32 0, i32 4
  %87 = load i32, i32* %num_semaphores.3, align 8, !tbaa !29
  %cmp16.not.3 = icmp eq i32 %87, 0
  %88 = select i1 %cmp16.not.3, i1 %cmp16.not.2, i1 false
  %89 = select i1 %88, i1 %cmp16.not.1, i1 false
  %90 = select i1 %89, i1 %cmp16.not, i1 false
  %spec.select.3 = select i1 %90, i8 %job_has_acquires.0181, i8 1
  %serial.3 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %79, i32 0, i32 8
  %91 = load i8, i8* %serial.3, align 8, !tbaa !27, !range !18
  %tobool22.not.3 = icmp eq i8 %91, 0
  br i1 %tobool22.not.3, label %if.else24.3, label %if.then23.3

if.then23.3:                                      ; preds = %for.inc.2
  %inc.3 = add nsw i32 %workers_to_wake.1.2, 1
  br label %for.inc.3

if.else24.3:                                      ; preds = %for.inc.2
  %extent.3 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %jobs, i32 %79, i32 0, i32 6
  %92 = load i32, i32* %extent.3, align 8, !tbaa !26
  %add28.3 = add nsw i32 %92, %workers_to_wake.1.2
  br label %for.inc.3

for.inc.3:                                        ; preds = %if.else24.3, %if.then23.3
  %workers_to_wake.1.3 = phi i32 [ %inc.3, %if.then23.3 ], [ %add28.3, %if.else24.3 ]
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %niter.nsub.3 = add i64 %niter, -4
  %niter.ncmp.3 = icmp eq i64 %niter.nsub.3, 0
  br i1 %niter.ncmp.3, label %for.cond.cleanup.loopexit.unr-lcssa, label %for.body, !llvm.loop !67
}

; Function Attrs: mustprogress nounwind
define linkonce void @_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE(%"struct.Halide::Runtime::Internal::work"* %owned_job) local_unnamed_addr #0 {
entry:
  %tobool.not = icmp eq %"struct.Halide::Runtime::Internal::work"* %owned_job, null
  %extent.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %owned_job, i32 0, i32 0, i32 6
  %active_workers.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %owned_job, i32 0, i32 8
  %exit_status = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %owned_job, i32 0, i32 9
  %parent_job = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %owned_job, i32 0, i32 5
  %siblings56 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %owned_job, i32 0, i32 3
  %owner_is_sleeping = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %owned_job, i32 0, i32 11
  %next_job10 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %owned_job, i32 0, i32 2
  br label %while.cond

while.cond:                                       ; preds = %while.cond.backedge, %entry
  %spin_count.0 = phi i32 [ 0, %entry ], [ %spin_count.0.be, %while.cond.backedge ]
  br i1 %tobool.not, label %cond.end, label %cond.true

cond.true:                                        ; preds = %while.cond
  %0 = load i32, i32* %extent.i, align 8, !tbaa !26
  %tobool.not.i = icmp ne i32 %0, 0
  %1 = load i32, i32* %active_workers.i, align 8
  %tobool2.i = icmp ne i32 %1, 0
  %2 = select i1 %tobool.not.i, i1 true, i1 %tobool2.i
  br i1 %2, label %if.then, label %while.end316

cond.end:                                         ; preds = %while.cond
  %3 = load i8, i8* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 14), align 8, !tbaa !68, !range !18
  %tobool1.not = icmp eq i8 %3, 0
  br i1 %tobool1.not, label %while.body.thread, label %while.end316

while.body.thread:                                ; preds = %cond.end
  %4 = load %"struct.Halide::Runtime::Internal::work"*, %"struct.Halide::Runtime::Internal::work"** getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 3), align 8, !tbaa !60
  br label %do.end

if.then:                                          ; preds = %cond.true
  %5 = load %"struct.Halide::Runtime::Internal::work"*, %"struct.Halide::Runtime::Internal::work"** getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 3), align 8, !tbaa !60
  %6 = load i32, i32* %exit_status, align 4, !tbaa !35
  %cmp.not = icmp eq i32 %6, 0
  br i1 %cmp.not, label %if.else, label %if.then3

if.then3:                                         ; preds = %if.then
  %cmp4 = icmp eq i32 %1, 0
  br i1 %cmp4, label %while.cond6.preheader, label %do.end

while.cond6.preheader:                            ; preds = %if.then3
  %cmp7.not534 = icmp eq %"struct.Halide::Runtime::Internal::work"* %5, %owned_job
  br i1 %cmp7.not534, label %while.end, label %while.body8

while.body8:                                      ; preds = %while.body8, %while.cond6.preheader
  %job.0535 = phi %"struct.Halide::Runtime::Internal::work"* [ %7, %while.body8 ], [ %5, %while.cond6.preheader ]
  %next_job = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %job.0535, i32 0, i32 2
  %7 = load %"struct.Halide::Runtime::Internal::work"*, %"struct.Halide::Runtime::Internal::work"** %next_job, align 8, !tbaa !61
  %cmp7.not = icmp eq %"struct.Halide::Runtime::Internal::work"* %7, %owned_job
  br i1 %cmp7.not, label %while.end.loopexit, label %while.body8, !llvm.loop !69

while.end.loopexit:                               ; preds = %while.body8
  %next_job.le = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %job.0535, i32 0, i32 2
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %while.cond6.preheader
  %prev_ptr.0.lcssa = phi %"struct.Halide::Runtime::Internal::work"** [ getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 3), %while.cond6.preheader ], [ %next_job.le, %while.end.loopexit ]
  %8 = load %"struct.Halide::Runtime::Internal::work"*, %"struct.Halide::Runtime::Internal::work"** %next_job10, align 8, !tbaa !61
  store %"struct.Halide::Runtime::Internal::work"* %8, %"struct.Halide::Runtime::Internal::work"** %prev_ptr.0.lcssa, align 8, !tbaa !11
  store i32 0, i32* %extent.i, align 8, !tbaa !26
  br label %while.cond.backedge

if.else:                                          ; preds = %if.then
  %9 = load %"struct.Halide::Runtime::Internal::work"*, %"struct.Halide::Runtime::Internal::work"** %parent_job, align 8, !tbaa !41
  %tobool11.not = icmp eq %"struct.Halide::Runtime::Internal::work"* %9, null
  br i1 %tobool11.not, label %do.end, label %land.lhs.true

land.lhs.true:                                    ; preds = %if.else
  %exit_status13 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %9, i32 0, i32 9
  %10 = load i32, i32* %exit_status13, align 4, !tbaa !35
  %cmp14.not = icmp eq i32 %10, 0
  br i1 %cmp14.not, label %do.end, label %if.then15

if.then15:                                        ; preds = %land.lhs.true
  store i32 %10, i32* %exit_status, align 4, !tbaa !35
  tail call void @halide_cond_broadcast(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 10)) #13
  br label %while.cond.backedge

do.end:                                           ; preds = %land.lhs.true, %if.else, %if.then3, %while.body.thread
  %11 = phi %"struct.Halide::Runtime::Internal::work"* [ %4, %while.body.thread ], [ %5, %if.else ], [ %5, %land.lhs.true ], [ %5, %if.then3 ]
  %tobool23.old.not = icmp eq %"struct.Halide::Runtime::Internal::work"* %11, null
  br i1 %tobool23.old.not, label %if.then103, label %do.end27

do.end27:                                         ; preds = %cleanup, %do.end
  %prev_ptr.1 = phi %"struct.Halide::Runtime::Internal::work"** [ %next_job95, %cleanup ], [ getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 3), %do.end ]
  %job.1 = phi %"struct.Halide::Runtime::Internal::work"* [ %37, %cleanup ], [ %11, %do.end ]
  %parent_job29 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %job.1, i32 0, i32 5
  %12 = load %"struct.Halide::Runtime::Internal::work"*, %"struct.Halide::Runtime::Internal::work"** %parent_job29, align 8, !tbaa !41
  %cmp30 = icmp eq %"struct.Halide::Runtime::Internal::work"* %12, null
  br i1 %cmp30, label %if.then31, label %if.else32

if.then31:                                        ; preds = %do.end27
  %13 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 4), align 8, !tbaa !55
  %add = add nsw i32 %13, 1
  %14 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 16), align 4, !tbaa !56
  %sub = sub i32 %add, %14
  br label %if.end45

if.else32:                                        ; preds = %do.end27
  %active_workers33 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %12, i32 0, i32 8
  %15 = load i32, i32* %active_workers33, align 8, !tbaa !36
  %cmp34 = icmp eq i32 %15, 0
  %min_threads = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %12, i32 0, i32 0, i32 7
  %16 = load i32, i32* %min_threads, align 4, !tbaa !31
  br i1 %cmp34, label %if.then35, label %if.else38

if.then35:                                        ; preds = %if.else32
  %threads_reserved = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %12, i32 0, i32 6
  %17 = load i32, i32* %threads_reserved, align 8, !tbaa !59
  %sub37 = sub nsw i32 %16, %17
  br label %if.end45

if.else38:                                        ; preds = %if.else32
  %mul = mul nsw i32 %16, %15
  %threads_reserved42 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %12, i32 0, i32 6
  %18 = load i32, i32* %threads_reserved42, align 8, !tbaa !59
  %sub43 = sub nsw i32 %mul, %18
  br label %if.end45

if.end45:                                         ; preds = %if.else38, %if.then35, %if.then31
  %threads_available.0 = phi i32 [ %sub, %if.then31 ], [ %sub37, %if.then35 ], [ %sub43, %if.else38 ]
  %min_threads47 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %job.1, i32 0, i32 0, i32 7
  %19 = load i32, i32* %min_threads47, align 4, !tbaa !31
  %cmp48.not = icmp slt i32 %threads_available.0, %19
  br i1 %tobool.not, label %lor.end, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end45
  %siblings = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %job.1, i32 0, i32 3
  %20 = load %"struct.Halide::Runtime::Internal::work"*, %"struct.Halide::Runtime::Internal::work"** %siblings, align 8, !tbaa !39
  %21 = load %"struct.Halide::Runtime::Internal::work"*, %"struct.Halide::Runtime::Internal::work"** %siblings56, align 8, !tbaa !39
  %cmp57 = icmp eq %"struct.Halide::Runtime::Internal::work"* %20, %21
  %cmp60 = icmp eq i32 %19, 0
  %spec.select = select i1 %cmp57, i1 true, i1 %cmp60
  br label %lor.end

lor.end:                                          ; preds = %lor.lhs.false, %if.end45
  %22 = phi i1 [ true, %if.end45 ], [ %spec.select, %lor.lhs.false ]
  %serial = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %job.1, i32 0, i32 0, i32 8
  %23 = load i8, i8* %serial, align 8, !tbaa !27, !range !18
  %tobool69.not = icmp eq i8 %23, 0
  br i1 %tobool69.not, label %lor.end73, label %lor.rhs70

lor.rhs70:                                        ; preds = %lor.end
  %active_workers71 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %job.1, i32 0, i32 8
  %24 = load i32, i32* %active_workers71, align 8, !tbaa !36
  %cmp72 = icmp eq i32 %24, 0
  br label %lor.end73

lor.end73:                                        ; preds = %lor.rhs70, %lor.end
  %25 = phi i1 [ true, %lor.end ], [ %cmp72, %lor.rhs70 ]
  %.not = xor i1 %22, true
  %brmerge = select i1 %cmp48.not, i1 true, i1 %.not
  %.not473 = xor i1 %25, true
  %brmerge474 = select i1 %brmerge, i1 true, i1 %.not473
  br i1 %brmerge474, label %cleanup, label %if.then86

if.then86:                                        ; preds = %lor.end73
  %next_semaphore.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %job.1, i32 0, i32 10
  %num_semaphores.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %job.1, i32 0, i32 0, i32 4
  %semaphores.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %job.1, i32 0, i32 0, i32 3
  %26 = load i32, i32* %next_semaphore.i, align 8, !tbaa !37
  %27 = load i32, i32* %num_semaphores.i, align 8, !tbaa !29
  %cmp14.i = icmp slt i32 %26, %27
  br i1 %cmp14.i, label %for.body.i, label %while.end101.thread502.loopexit67

for.body.i:                                       ; preds = %for.inc.i, %if.then86
  %28 = phi i32 [ %inc.i, %for.inc.i ], [ %26, %if.then86 ]
  %29 = load %struct.halide_semaphore_acquire_t*, %struct.halide_semaphore_acquire_t** %semaphores.i, align 8, !tbaa !28
  %semaphore.i = getelementptr inbounds %struct.halide_semaphore_acquire_t, %struct.halide_semaphore_acquire_t* %29, i32 %28, i32 0
  %30 = load %struct.halide_semaphore_t*, %struct.halide_semaphore_t** %semaphore.i, align 8, !tbaa !70
  %count.i = getelementptr inbounds %struct.halide_semaphore_acquire_t, %struct.halide_semaphore_acquire_t* %29, i32 %28, i32 1
  %31 = load i32, i32* %count.i, align 8, !tbaa !72
  %call.i = tail call zeroext i1 @halide_default_semaphore_try_acquire(%struct.halide_semaphore_t* %30, i32 %31) #12
  br i1 %call.i, label %for.inc.i, label %cleanup

for.inc.i:                                        ; preds = %for.body.i
  %32 = load i32, i32* %next_semaphore.i, align 8, !tbaa !37
  %inc.i = add nsw i32 %32, 1
  store i32 %inc.i, i32* %next_semaphore.i, align 8, !tbaa !37
  %33 = load i32, i32* %num_semaphores.i, align 8, !tbaa !29
  %cmp.i = icmp slt i32 %inc.i, %33
  br i1 %cmp.i, label %for.body.i, label %while.end101.thread502.loopexit, !llvm.loop !73

while.end101.thread502.loopexit:                  ; preds = %for.inc.i
  %parent_job29.le = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %job.1, i32 0, i32 5
  %min_threads47.le = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %job.1, i32 0, i32 0, i32 7
  %.pre = load %"struct.Halide::Runtime::Internal::work"*, %"struct.Halide::Runtime::Internal::work"** %parent_job29.le, align 8, !tbaa !41
  %.pre66 = load i32, i32* %min_threads47.le, align 4, !tbaa !31
  br label %while.end101.thread502

while.end101.thread502.loopexit67:                ; preds = %if.then86
  %parent_job29.le103 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %job.1, i32 0, i32 5
  %min_threads47.le100 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %job.1, i32 0, i32 0, i32 7
  br label %while.end101.thread502

while.end101.thread502:                           ; preds = %while.end101.thread502.loopexit67, %while.end101.thread502.loopexit
  %min_threads4790 = phi i32* [ %min_threads47.le, %while.end101.thread502.loopexit ], [ %min_threads47.le100, %while.end101.thread502.loopexit67 ]
  %parent_job2978 = phi %"struct.Halide::Runtime::Internal::work"** [ %parent_job29.le, %while.end101.thread502.loopexit ], [ %parent_job29.le103, %while.end101.thread502.loopexit67 ]
  %34 = phi i32 [ %.pre66, %while.end101.thread502.loopexit ], [ %19, %while.end101.thread502.loopexit67 ]
  %35 = phi %"struct.Halide::Runtime::Internal::work"* [ %.pre, %while.end101.thread502.loopexit ], [ %12, %while.end101.thread502.loopexit67 ]
  %serial93 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %job.1, i32 0, i32 0, i32 8
  store i32 0, i32* %next_semaphore.i, align 8, !tbaa !37
  %active_workers132 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %job.1, i32 0, i32 8
  %36 = load i32, i32* %active_workers132, align 8, !tbaa !36
  %inc133 = add nsw i32 %36, 1
  store i32 %inc133, i32* %active_workers132, align 8, !tbaa !36
  %cmp135 = icmp eq %"struct.Halide::Runtime::Internal::work"* %35, null
  br i1 %cmp135, label %if.then136, label %if.else143

cleanup:                                          ; preds = %for.body.i, %lor.end73
  %next_job95 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %job.1, i32 0, i32 2
  %37 = load %"struct.Halide::Runtime::Internal::work"*, %"struct.Halide::Runtime::Internal::work"** %next_job95, align 8, !tbaa !61
  %tobool23.not = icmp eq %"struct.Halide::Runtime::Internal::work"* %37, null
  br i1 %tobool23.not, label %if.then103, label %do.end27, !llvm.loop !74

if.then103:                                       ; preds = %cleanup, %do.end
  br i1 %tobool.not, label %if.else112, label %if.then105

if.then105:                                       ; preds = %if.then103
  %inc = add nsw i32 %spin_count.0, 1
  %cmp106 = icmp slt i32 %spin_count.0, 40
  br i1 %cmp106, label %if.then107, label %if.else108

if.then107:                                       ; preds = %if.then105
  tail call void @halide_mutex_unlock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 0)) #13
  tail call void @halide_thread_yield() #12
  tail call void @halide_mutex_lock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 0)) #13
  br label %while.cond.backedge

if.else108:                                       ; preds = %if.then105
  %38 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 12), align 4, !tbaa !63
  %inc109 = add nsw i32 %38, 1
  store i32 %inc109, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 12), align 4, !tbaa !63
  store i8 1, i8* %owner_is_sleeping, align 4, !tbaa !38
  tail call void @halide_cond_wait(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 10), %struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 0)) #13
  store i8 0, i8* %owner_is_sleeping, align 4, !tbaa !38
  %39 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 12), align 4, !tbaa !63
  %dec = add nsw i32 %39, -1
  store i32 %dec, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 12), align 4, !tbaa !63
  br label %while.cond.backedge

if.else112:                                       ; preds = %if.then103
  %40 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 11), align 8, !tbaa !75
  %inc113 = add nsw i32 %40, 1
  store i32 %inc113, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 11), align 8, !tbaa !75
  %41 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 5), align 8, !tbaa !57
  %42 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 6), align 8, !tbaa !64
  %cmp114 = icmp sgt i32 %41, %42
  br i1 %cmp114, label %if.then115, label %if.else118

if.then115:                                       ; preds = %if.else112
  %dec116 = add nsw i32 %41, -1
  store i32 %dec116, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 5), align 8, !tbaa !57
  tail call void @halide_cond_wait(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 9), %struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 0)) #13
  %43 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 5), align 8, !tbaa !57
  %inc117 = add nsw i32 %43, 1
  store i32 %inc117, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 5), align 8, !tbaa !57
  br label %if.end124

if.else118:                                       ; preds = %if.else112
  %inc119 = add nsw i32 %spin_count.0, 1
  %cmp120 = icmp slt i32 %spin_count.0, 40
  br i1 %cmp120, label %if.then121, label %if.else122

if.then121:                                       ; preds = %if.else118
  tail call void @halide_mutex_unlock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 0)) #13
  tail call void @halide_thread_yield() #12
  tail call void @halide_mutex_lock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 0)) #13
  br label %if.end124

if.else122:                                       ; preds = %if.else118
  tail call void @halide_cond_wait(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 8), %struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 0)) #13
  br label %if.end124

if.end124:                                        ; preds = %if.else122, %if.then121, %if.then115
  %spin_count.1 = phi i32 [ %spin_count.0, %if.then115 ], [ %inc119, %if.then121 ], [ %inc119, %if.else122 ]
  %44 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 11), align 8, !tbaa !75
  %dec125 = add nsw i32 %44, -1
  store i32 %dec125, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 11), align 8, !tbaa !75
  br label %while.cond.backedge

if.then136:                                       ; preds = %while.end101.thread502
  %45 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 16), align 4, !tbaa !56
  %add139 = add nsw i32 %45, %34
  store i32 %add139, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 16), align 4, !tbaa !56
  br label %if.end152

if.else143:                                       ; preds = %while.end101.thread502
  %threads_reserved147 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %35, i32 0, i32 6
  %46 = load i32, i32* %threads_reserved147, align 8, !tbaa !59
  %add148 = add nsw i32 %46, %34
  store i32 %add148, i32* %threads_reserved147, align 8, !tbaa !59
  br label %if.end152

if.end152:                                        ; preds = %if.else143, %if.then136
  %47 = load i8, i8* %serial93, align 8, !tbaa !27, !range !18
  %tobool155.not = icmp eq i8 %47, 0
  br i1 %tobool155.not, label %if.else198, label %if.then156

if.then156:                                       ; preds = %if.end152
  %next_job157 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %job.1, i32 0, i32 2
  %48 = load %"struct.Halide::Runtime::Internal::work"*, %"struct.Halide::Runtime::Internal::work"** %next_job157, align 8, !tbaa !61
  store %"struct.Halide::Runtime::Internal::work"* %48, %"struct.Halide::Runtime::Internal::work"** %prev_ptr.1, align 8, !tbaa !11
  tail call void @halide_mutex_unlock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 0)) #13
  %extent163 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %job.1, i32 0, i32 0, i32 6
  %user_context = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %job.1, i32 0, i32 7
  %fn = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %job.1, i32 0, i32 0, i32 0
  %min = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %job.1, i32 0, i32 0, i32 5
  %closure = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %job.1, i32 0, i32 0, i32 1
  %49 = bitcast %"struct.Halide::Runtime::Internal::work"* %job.1 to i8*
  br label %while.cond161.preheader

while.cond161.preheader:                          ; preds = %if.end172, %if.then156
  %iters.0544 = phi i32 [ 1, %if.then156 ], [ 0, %if.end172 ]
  %total_iters.0543 = phi i32 [ 0, %if.then156 ], [ %add178, %if.end172 ]
  %50 = load i32, i32* %extent163, align 8, !tbaa !26
  %sub164537 = sub nsw i32 %50, %total_iters.0543
  %cmp165538 = icmp sgt i32 %sub164537, %iters.0544
  br i1 %cmp165538, label %land.rhs.preheader, label %while.end169

land.rhs.preheader:                               ; preds = %while.cond161.preheader
  %.pre565 = load i32, i32* %next_semaphore.i, align 8, !tbaa !37
  %.pre566 = load i32, i32* %num_semaphores.i, align 8, !tbaa !29
  br label %land.rhs

land.rhs:                                         ; preds = %while.body167, %land.rhs.preheader
  %51 = phi i32 [ %60, %while.body167 ], [ %50, %land.rhs.preheader ]
  %52 = phi i32 [ %61, %while.body167 ], [ %.pre566, %land.rhs.preheader ]
  %53 = phi i32 [ 0, %while.body167 ], [ %.pre565, %land.rhs.preheader ]
  %iters.1539 = phi i32 [ %inc168, %while.body167 ], [ %iters.0544, %land.rhs.preheader ]
  %cmp14.i478 = icmp slt i32 %53, %52
  br i1 %cmp14.i478, label %for.body.i483, label %while.body167

for.body.i483:                                    ; preds = %for.inc.i486, %land.rhs
  %54 = phi i32 [ %inc.i484, %for.inc.i486 ], [ %53, %land.rhs ]
  %55 = load %struct.halide_semaphore_acquire_t*, %struct.halide_semaphore_acquire_t** %semaphores.i, align 8, !tbaa !28
  %semaphore.i480 = getelementptr inbounds %struct.halide_semaphore_acquire_t, %struct.halide_semaphore_acquire_t* %55, i32 %54, i32 0
  %56 = load %struct.halide_semaphore_t*, %struct.halide_semaphore_t** %semaphore.i480, align 8, !tbaa !70
  %count.i481 = getelementptr inbounds %struct.halide_semaphore_acquire_t, %struct.halide_semaphore_acquire_t* %55, i32 %54, i32 1
  %57 = load i32, i32* %count.i481, align 8, !tbaa !72
  %call.i482 = tail call zeroext i1 @halide_default_semaphore_try_acquire(%struct.halide_semaphore_t* %56, i32 %57) #12
  br i1 %call.i482, label %for.inc.i486, label %while.end169

for.inc.i486:                                     ; preds = %for.body.i483
  %58 = load i32, i32* %next_semaphore.i, align 8, !tbaa !37
  %inc.i484 = add nsw i32 %58, 1
  store i32 %inc.i484, i32* %next_semaphore.i, align 8, !tbaa !37
  %59 = load i32, i32* %num_semaphores.i, align 8, !tbaa !29
  %cmp.i485 = icmp slt i32 %inc.i484, %59
  br i1 %cmp.i485, label %for.body.i483, label %while.body167.loopexit, !llvm.loop !73

while.body167.loopexit:                           ; preds = %for.inc.i486
  %.pre567 = load i32, i32* %extent163, align 8, !tbaa !26
  br label %while.body167

while.body167:                                    ; preds = %while.body167.loopexit, %land.rhs
  %60 = phi i32 [ %.pre567, %while.body167.loopexit ], [ %51, %land.rhs ]
  %61 = phi i32 [ %59, %while.body167.loopexit ], [ %52, %land.rhs ]
  store i32 0, i32* %next_semaphore.i, align 8, !tbaa !37
  %inc168 = add nuw nsw i32 %iters.1539, 1
  %sub164 = sub nsw i32 %60, %total_iters.0543
  %cmp165 = icmp sgt i32 %sub164, %inc168
  br i1 %cmp165, label %land.rhs, label %if.end172, !llvm.loop !76

while.end169:                                     ; preds = %for.body.i483, %while.cond161.preheader
  %iters.1533 = phi i32 [ %iters.0544, %while.cond161.preheader ], [ %iters.1539, %for.body.i483 ]
  %cmp170 = icmp eq i32 %iters.1533, 0
  br i1 %cmp170, label %while.end179, label %if.end172

if.end172:                                        ; preds = %while.end169, %while.body167
  %iters.1533570 = phi i32 [ %iters.1533, %while.end169 ], [ %inc168, %while.body167 ]
  %62 = load i8*, i8** %user_context, align 8, !tbaa !34
  %63 = load i32 (i8*, i32, i32, i8*, i8*)*, i32 (i8*, i32, i32, i8*, i8*)** %fn, align 8, !tbaa !21
  %64 = load i32, i32* %min, align 4, !tbaa !25
  %add175 = add nsw i32 %64, %total_iters.0543
  %65 = load i8*, i8** %closure, align 8, !tbaa !30
  %call177 = tail call i32 @halide_do_loop_task(i8* %62, i32 (i8*, i32, i32, i8*, i8*)* %63, i32 %add175, i32 %iters.1533570, i8* %65, i8* nonnull %49) #13
  %add178 = add nuw nsw i32 %iters.1533570, %total_iters.0543
  %cmp159 = icmp eq i32 %call177, 0
  br i1 %cmp159, label %while.cond161.preheader, label %while.end179, !llvm.loop !77

while.end179:                                     ; preds = %if.end172, %while.end169
  %cmp170572 = phi i1 [ true, %while.end169 ], [ false, %if.end172 ]
  %result.0.lcssa = phi i32 [ 0, %while.end169 ], [ %call177, %if.end172 ]
  %total_iters.0.lcssa = phi i32 [ %total_iters.0543, %while.end169 ], [ %add178, %if.end172 ]
  tail call void @halide_mutex_lock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 0)) #13
  %66 = load i32, i32* %min, align 4, !tbaa !25
  %add182 = add nsw i32 %66, %total_iters.0.lcssa
  store i32 %add182, i32* %min, align 4, !tbaa !25
  %67 = load i32, i32* %extent163, align 8, !tbaa !26
  %sub185 = sub nsw i32 %67, %total_iters.0.lcssa
  store i32 %sub185, i32* %extent163, align 8, !tbaa !26
  br i1 %cmp170572, label %if.else190, label %if.end230.thread513

if.end230.thread513:                              ; preds = %while.end179
  store i32 0, i32* %extent163, align 8, !tbaa !26
  br label %if.then238

if.else190:                                       ; preds = %while.end179
  %cmp193 = icmp sgt i32 %sub185, 0
  br i1 %cmp193, label %if.then194, label %if.end271

if.then194:                                       ; preds = %if.else190
  %68 = load %"struct.Halide::Runtime::Internal::work"*, %"struct.Halide::Runtime::Internal::work"** getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 3), align 8, !tbaa !60
  store %"struct.Halide::Runtime::Internal::work"* %68, %"struct.Halide::Runtime::Internal::work"** %next_job157, align 8, !tbaa !61
  store %"struct.Halide::Runtime::Internal::work"* %job.1, %"struct.Halide::Runtime::Internal::work"** getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 3), align 8, !tbaa !60
  br label %if.end271

if.else198:                                       ; preds = %if.end152
  %myjob.sroa.0.0..sroa_idx = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %job.1, i32 0, i32 0, i32 0
  %myjob.sroa.0.0.copyload = load i32 (i8*, i32, i32, i8*, i8*)*, i32 (i8*, i32, i32, i8*, i8*)** %myjob.sroa.0.0..sroa_idx, align 8, !tbaa.struct !78
  %myjob.sroa.4.0..sroa_idx327 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %job.1, i32 0, i32 0, i32 1
  %myjob.sroa.4.0.copyload = load i8*, i8** %myjob.sroa.4.0..sroa_idx327, align 8, !tbaa.struct !80
  %myjob.sroa.6333.0..sroa_idx334 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %job.1, i32 0, i32 0, i32 5
  %myjob.sroa.6333.0.copyload = load i32, i32* %myjob.sroa.6333.0..sroa_idx334, align 4
  %myjob.sroa.8340.0..sroa_idx341 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %job.1, i32 0, i32 1
  %myjob.sroa.8340.0.copyload = load i32 (i8*, i32, i8*)*, i32 (i8*, i32, i8*)** %myjob.sroa.8340.0..sroa_idx341, align 8, !tbaa.struct !81
  %myjob.sroa.10347.0..sroa_idx348 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %job.1, i32 0, i32 7
  %myjob.sroa.10347.0.copyload = load i8*, i8** %myjob.sroa.10347.0..sroa_idx348, align 8, !tbaa.struct !82
  %inc201 = add nsw i32 %myjob.sroa.6333.0.copyload, 1
  store i32 %inc201, i32* %myjob.sroa.6333.0..sroa_idx334, align 4, !tbaa !25
  %extent203 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %job.1, i32 0, i32 0, i32 6
  %69 = load i32, i32* %extent203, align 8, !tbaa !26
  %dec204 = add nsw i32 %69, -1
  store i32 %dec204, i32* %extent203, align 8, !tbaa !26
  %cmp207 = icmp eq i32 %dec204, 0
  br i1 %cmp207, label %if.then208, label %if.end210

if.then208:                                       ; preds = %if.else198
  %next_job209 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %job.1, i32 0, i32 2
  %70 = load %"struct.Halide::Runtime::Internal::work"*, %"struct.Halide::Runtime::Internal::work"** %next_job209, align 8, !tbaa !61
  store %"struct.Halide::Runtime::Internal::work"* %70, %"struct.Halide::Runtime::Internal::work"** %prev_ptr.1, align 8, !tbaa !11
  br label %if.end210

if.end210:                                        ; preds = %if.then208, %if.else198
  tail call void @halide_mutex_unlock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 0)) #13
  %tobool211.not = icmp eq i32 (i8*, i32, i8*)* %myjob.sroa.8340.0.copyload, null
  br i1 %tobool211.not, label %if.else220, label %if.then212

if.then212:                                       ; preds = %if.end210
  %call219 = tail call i32 @halide_do_task(i8* %myjob.sroa.10347.0.copyload, i32 (i8*, i32, i8*)* nonnull %myjob.sroa.8340.0.copyload, i32 %myjob.sroa.6333.0.copyload, i8* %myjob.sroa.4.0.copyload) #13
  br label %if.end230

if.else220:                                       ; preds = %if.end210
  %71 = bitcast %"struct.Halide::Runtime::Internal::work"* %job.1 to i8*
  %call228 = tail call i32 @halide_do_loop_task(i8* %myjob.sroa.10347.0.copyload, i32 (i8*, i32, i32, i8*, i8*)* %myjob.sroa.0.0.copyload, i32 %myjob.sroa.6333.0.copyload, i32 1, i8* %myjob.sroa.4.0.copyload, i8* %71) #13
  br label %if.end230

if.end230:                                        ; preds = %if.else220, %if.then212
  %result.1 = phi i32 [ %call219, %if.then212 ], [ %call228, %if.else220 ]
  tail call void @halide_mutex_lock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 0)) #13
  %cmp237.not = icmp eq i32 %result.1, 0
  br i1 %cmp237.not, label %if.end271, label %if.then238

if.then238:                                       ; preds = %if.end230, %if.end230.thread513
  %result.2518 = phi i32 [ %result.0.lcssa, %if.end230.thread513 ], [ %result.1, %if.end230 ]
  %exit_status239 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %job.1, i32 0, i32 9
  store i32 %result.2518, i32* %exit_status239, align 4, !tbaa !35
  %sibling_count = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %job.1, i32 0, i32 4
  %72 = load i32, i32* %sibling_count, align 8, !tbaa !40
  %cmp240546 = icmp sgt i32 %72, 0
  br i1 %cmp240546, label %do.end243.lr.ph, label %if.end271

do.end243.lr.ph:                                  ; preds = %if.then238
  %siblings244 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %job.1, i32 0, i32 3
  %73 = load %"struct.Halide::Runtime::Internal::work"*, %"struct.Halide::Runtime::Internal::work"** %siblings244, align 8, !tbaa !39
  %wide.trip.count = zext i32 %72 to i64
  %74 = add nsw i64 %wide.trip.count, -1
  %xtraiter = and i64 %wide.trip.count, 3
  %75 = icmp ult i64 %74, 3
  br i1 %75, label %if.end271.loopexit.unr-lcssa, label %do.end243.lr.ph.new

do.end243.lr.ph.new:                              ; preds = %do.end243.lr.ph
  %unroll_iter = and i64 %wide.trip.count, 4294967292
  br label %do.end243

do.end243:                                        ; preds = %for.inc.3, %do.end243.lr.ph.new
  %indvars.iv = phi i64 [ 0, %do.end243.lr.ph.new ], [ %indvars.iv.next.3, %for.inc.3 ]
  %wake_owners.0547 = phi i8 [ 0, %do.end243.lr.ph.new ], [ %wake_owners.1.3, %for.inc.3 ]
  %niter = phi i64 [ %unroll_iter, %do.end243.lr.ph.new ], [ %niter.nsub.3, %for.inc.3 ]
  %76 = trunc i64 %indvars.iv to i32
  %exit_status245 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %73, i32 %76, i32 9
  %77 = load i32, i32* %exit_status245, align 4, !tbaa !35
  %cmp246 = icmp eq i32 %77, 0
  br i1 %cmp246, label %if.then247, label %for.inc

if.then247:                                       ; preds = %do.end243
  store i32 %result.2518, i32* %exit_status245, align 4, !tbaa !35
  %78 = load i32, i32* %active_workers132, align 8, !tbaa !36
  %cmp253 = icmp eq i32 %78, 0
  br i1 %cmp253, label %land.rhs254, label %land.end260

land.rhs254:                                      ; preds = %if.then247
  %owner_is_sleeping258 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %73, i32 %76, i32 11
  %79 = load i8, i8* %owner_is_sleeping258, align 4, !tbaa !38, !range !18
  br label %land.end260

land.end260:                                      ; preds = %land.rhs254, %if.then247
  %80 = phi i8 [ 0, %if.then247 ], [ %79, %land.rhs254 ]
  %81 = and i8 %wake_owners.0547, 1
  %or = or i8 %80, %81
  br label %for.inc

for.inc:                                          ; preds = %land.end260, %do.end243
  %wake_owners.1 = phi i8 [ %or, %land.end260 ], [ %wake_owners.0547, %do.end243 ]
  %82 = trunc i64 %indvars.iv to i32
  %83 = or i32 %82, 1
  %exit_status245.1 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %73, i32 %83, i32 9
  %84 = load i32, i32* %exit_status245.1, align 4, !tbaa !35
  %cmp246.1 = icmp eq i32 %84, 0
  br i1 %cmp246.1, label %if.then247.1, label %for.inc.1

if.end271.loopexit.unr-lcssa:                     ; preds = %for.inc.3, %do.end243.lr.ph
  %wake_owners.1.lcssa.ph = phi i8 [ undef, %do.end243.lr.ph ], [ %wake_owners.1.3, %for.inc.3 ]
  %indvars.iv.unr = phi i64 [ 0, %do.end243.lr.ph ], [ %indvars.iv.next.3, %for.inc.3 ]
  %wake_owners.0547.unr = phi i8 [ 0, %do.end243.lr.ph ], [ %wake_owners.1.3, %for.inc.3 ]
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod.not, label %if.end271, label %do.end243.epil

do.end243.epil:                                   ; preds = %for.inc.epil, %if.end271.loopexit.unr-lcssa
  %indvars.iv.epil = phi i64 [ %indvars.iv.next.epil, %for.inc.epil ], [ %indvars.iv.unr, %if.end271.loopexit.unr-lcssa ]
  %wake_owners.0547.epil = phi i8 [ %wake_owners.1.epil, %for.inc.epil ], [ %wake_owners.0547.unr, %if.end271.loopexit.unr-lcssa ]
  %epil.iter = phi i64 [ %epil.iter.sub, %for.inc.epil ], [ %xtraiter, %if.end271.loopexit.unr-lcssa ]
  %85 = trunc i64 %indvars.iv.epil to i32
  %exit_status245.epil = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %73, i32 %85, i32 9
  %86 = load i32, i32* %exit_status245.epil, align 4, !tbaa !35
  %cmp246.epil = icmp eq i32 %86, 0
  br i1 %cmp246.epil, label %if.then247.epil, label %for.inc.epil

if.then247.epil:                                  ; preds = %do.end243.epil
  store i32 %result.2518, i32* %exit_status245.epil, align 4, !tbaa !35
  %87 = load i32, i32* %active_workers132, align 8, !tbaa !36
  %cmp253.epil = icmp eq i32 %87, 0
  br i1 %cmp253.epil, label %land.rhs254.epil, label %land.end260.epil

land.rhs254.epil:                                 ; preds = %if.then247.epil
  %owner_is_sleeping258.epil = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %73, i32 %85, i32 11
  %88 = load i8, i8* %owner_is_sleeping258.epil, align 4, !tbaa !38, !range !18
  br label %land.end260.epil

land.end260.epil:                                 ; preds = %land.rhs254.epil, %if.then247.epil
  %89 = phi i8 [ 0, %if.then247.epil ], [ %88, %land.rhs254.epil ]
  %90 = and i8 %wake_owners.0547.epil, 1
  %or.epil = or i8 %89, %90
  br label %for.inc.epil

for.inc.epil:                                     ; preds = %land.end260.epil, %do.end243.epil
  %wake_owners.1.epil = phi i8 [ %or.epil, %land.end260.epil ], [ %wake_owners.0547.epil, %do.end243.epil ]
  %indvars.iv.next.epil = add nuw nsw i64 %indvars.iv.epil, 1
  %epil.iter.sub = add i64 %epil.iter, -1
  %epil.iter.cmp.not = icmp eq i64 %epil.iter.sub, 0
  br i1 %epil.iter.cmp.not, label %if.end271, label %do.end243.epil, !llvm.loop !83

if.end271:                                        ; preds = %for.inc.epil, %if.end271.loopexit.unr-lcssa, %if.then238, %if.end230, %if.then194, %if.else190
  %wake_owners.2 = phi i8 [ 0, %if.end230 ], [ 0, %if.else190 ], [ 0, %if.then194 ], [ 0, %if.then238 ], [ %wake_owners.1.lcssa.ph, %if.end271.loopexit.unr-lcssa ], [ %wake_owners.1.epil, %for.inc.epil ]
  %91 = load %"struct.Halide::Runtime::Internal::work"*, %"struct.Halide::Runtime::Internal::work"** %parent_job2978, align 8, !tbaa !41
  %cmp273 = icmp eq %"struct.Halide::Runtime::Internal::work"* %91, null
  %92 = load i32, i32* %min_threads4790, align 4, !tbaa !31
  br i1 %cmp273, label %if.then274, label %if.else281

if.then274:                                       ; preds = %if.end271
  %93 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 16), align 4, !tbaa !56
  %sub277 = sub nsw i32 %93, %92
  store i32 %sub277, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 16), align 4, !tbaa !56
  br label %if.end290

if.else281:                                       ; preds = %if.end271
  %threads_reserved285 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %91, i32 0, i32 6
  %94 = load i32, i32* %threads_reserved285, align 8, !tbaa !59
  %sub286 = sub nsw i32 %94, %92
  store i32 %sub286, i32* %threads_reserved285, align 8, !tbaa !59
  br label %if.end290

if.end290:                                        ; preds = %if.else281, %if.then274
  %95 = load i32, i32* %active_workers132, align 8, !tbaa !36
  %dec292 = add nsw i32 %95, -1
  store i32 %dec292, i32* %active_workers132, align 8, !tbaa !36
  %96 = and i8 %wake_owners.2, 1
  %tobool296.not = icmp eq i8 %96, 0
  br i1 %tobool296.not, label %lor.lhs.false297, label %if.then310

lor.lhs.false297:                                 ; preds = %if.end290
  %cmp299 = icmp eq i32 %dec292, 0
  br i1 %cmp299, label %land.lhs.true300, label %while.cond.backedge

land.lhs.true300:                                 ; preds = %lor.lhs.false297
  %extent302 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %job.1, i32 0, i32 0, i32 6
  %97 = load i32, i32* %extent302, align 8, !tbaa !26
  %cmp303 = icmp eq i32 %97, 0
  br i1 %cmp303, label %land.lhs.true307, label %lor.lhs.false304

lor.lhs.false304:                                 ; preds = %land.lhs.true300
  %exit_status305 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %job.1, i32 0, i32 9
  %98 = load i32, i32* %exit_status305, align 4, !tbaa !35
  %cmp306.not = icmp eq i32 %98, 0
  br i1 %cmp306.not, label %while.cond.backedge, label %land.lhs.true307

land.lhs.true307:                                 ; preds = %lor.lhs.false304, %land.lhs.true300
  %owner_is_sleeping308 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %job.1, i32 0, i32 11
  %99 = load i8, i8* %owner_is_sleeping308, align 4, !tbaa !38, !range !18
  %tobool309.not = icmp eq i8 %99, 0
  br i1 %tobool309.not, label %while.cond.backedge, label %if.then310

if.then310:                                       ; preds = %land.lhs.true307, %if.end290
  tail call void @halide_cond_broadcast(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 10)) #13
  br label %while.cond.backedge

while.cond.backedge:                              ; preds = %if.then310, %land.lhs.true307, %lor.lhs.false304, %lor.lhs.false297, %if.end124, %if.else108, %if.then107, %if.then15, %while.end
  %spin_count.0.be = phi i32 [ %spin_count.0, %while.end ], [ %spin_count.0, %if.then15 ], [ %inc, %if.then107 ], [ %inc, %if.else108 ], [ %spin_count.1, %if.end124 ], [ 0, %if.then310 ], [ 0, %land.lhs.true307 ], [ 0, %lor.lhs.false304 ], [ 0, %lor.lhs.false297 ]
  br label %while.cond, !llvm.loop !84

while.end316:                                     ; preds = %cond.end, %cond.true
  ret void

if.then247.1:                                     ; preds = %for.inc
  store i32 %result.2518, i32* %exit_status245.1, align 4, !tbaa !35
  %100 = load i32, i32* %active_workers132, align 8, !tbaa !36
  %cmp253.1 = icmp eq i32 %100, 0
  br i1 %cmp253.1, label %land.rhs254.1, label %land.end260.1

land.rhs254.1:                                    ; preds = %if.then247.1
  %owner_is_sleeping258.1 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %73, i32 %83, i32 11
  %101 = load i8, i8* %owner_is_sleeping258.1, align 4, !tbaa !38, !range !18
  br label %land.end260.1

land.end260.1:                                    ; preds = %land.rhs254.1, %if.then247.1
  %102 = phi i8 [ 0, %if.then247.1 ], [ %101, %land.rhs254.1 ]
  %103 = and i8 %wake_owners.1, 1
  %or.1 = or i8 %102, %103
  br label %for.inc.1

for.inc.1:                                        ; preds = %land.end260.1, %for.inc
  %wake_owners.1.1 = phi i8 [ %or.1, %land.end260.1 ], [ %wake_owners.1, %for.inc ]
  %104 = trunc i64 %indvars.iv to i32
  %105 = or i32 %104, 2
  %exit_status245.2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %73, i32 %105, i32 9
  %106 = load i32, i32* %exit_status245.2, align 4, !tbaa !35
  %cmp246.2 = icmp eq i32 %106, 0
  br i1 %cmp246.2, label %if.then247.2, label %for.inc.2

if.then247.2:                                     ; preds = %for.inc.1
  store i32 %result.2518, i32* %exit_status245.2, align 4, !tbaa !35
  %107 = load i32, i32* %active_workers132, align 8, !tbaa !36
  %cmp253.2 = icmp eq i32 %107, 0
  br i1 %cmp253.2, label %land.rhs254.2, label %land.end260.2

land.rhs254.2:                                    ; preds = %if.then247.2
  %owner_is_sleeping258.2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %73, i32 %105, i32 11
  %108 = load i8, i8* %owner_is_sleeping258.2, align 4, !tbaa !38, !range !18
  br label %land.end260.2

land.end260.2:                                    ; preds = %land.rhs254.2, %if.then247.2
  %109 = phi i8 [ 0, %if.then247.2 ], [ %108, %land.rhs254.2 ]
  %110 = and i8 %wake_owners.1.1, 1
  %or.2 = or i8 %109, %110
  br label %for.inc.2

for.inc.2:                                        ; preds = %land.end260.2, %for.inc.1
  %wake_owners.1.2 = phi i8 [ %or.2, %land.end260.2 ], [ %wake_owners.1.1, %for.inc.1 ]
  %111 = trunc i64 %indvars.iv to i32
  %112 = or i32 %111, 3
  %exit_status245.3 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %73, i32 %112, i32 9
  %113 = load i32, i32* %exit_status245.3, align 4, !tbaa !35
  %cmp246.3 = icmp eq i32 %113, 0
  br i1 %cmp246.3, label %if.then247.3, label %for.inc.3

if.then247.3:                                     ; preds = %for.inc.2
  store i32 %result.2518, i32* %exit_status245.3, align 4, !tbaa !35
  %114 = load i32, i32* %active_workers132, align 8, !tbaa !36
  %cmp253.3 = icmp eq i32 %114, 0
  br i1 %cmp253.3, label %land.rhs254.3, label %land.end260.3

land.rhs254.3:                                    ; preds = %if.then247.3
  %owner_is_sleeping258.3 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %73, i32 %112, i32 11
  %115 = load i8, i8* %owner_is_sleeping258.3, align 4, !tbaa !38, !range !18
  br label %land.end260.3

land.end260.3:                                    ; preds = %land.rhs254.3, %if.then247.3
  %116 = phi i8 [ 0, %if.then247.3 ], [ %115, %land.rhs254.3 ]
  %117 = and i8 %wake_owners.1.2, 1
  %or.3 = or i8 %116, %117
  br label %for.inc.3

for.inc.3:                                        ; preds = %land.end260.3, %for.inc.2
  %wake_owners.1.3 = phi i8 [ %or.3, %land.end260.3 ], [ %wake_owners.1.2, %for.inc.2 ]
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %niter.nsub.3 = add i64 %niter, -4
  %niter.ncmp.3 = icmp eq i64 %niter.nsub.3, 0
  br i1 %niter.ncmp.3, label %if.end271.loopexit.unr-lcssa, label %do.end243, !llvm.loop !85
}

; Function Attrs: nounwind
define weak void @halide_mutex_unlock(%struct.halide_mutex* %mutex) local_unnamed_addr #3 {
entry:
  %control.i.i = alloca %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", align 8
  %state.i = getelementptr %struct.halide_mutex, %struct.halide_mutex* %mutex, i32 0, i32 0, i32 0
  %0 = cmpxchg weak i64* %state.i, i64 1, i64 0 release monotonic, align 8
  %1 = extractvalue { i64, i1 } %0, 1
  br i1 %1, label %_ZN6Halide7Runtime8Internal15Synchronization10fast_mutex6unlockEv.exit, label %if.then.i

if.then.i:                                        ; preds = %entry
  %2 = cmpxchg i64* %state.i, i64 1, i64 0 release monotonic, align 8
  %3 = extractvalue { i64, i1 } %2, 1
  br i1 %3, label %_ZN6Halide7Runtime8Internal15Synchronization10fast_mutex6unlockEv.exit, label %if.end.i.i

if.end.i.i:                                       ; preds = %if.then.i
  %4 = bitcast %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %control.i.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %4) #10
  %5 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %control.i.i, i32 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [6 x i8*] }, { [6 x i8*] }* @_ZTVN6Halide7Runtime8Internal15Synchronization21mutex_parking_controlE, i32 0, inrange i32 0, i32 2) to i32 (...)**), i32 (...)*** %5, align 8, !tbaa !42
  %lock_state2.i.i.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %control.i.i, i32 0, i32 1
  store i64* %state.i, i64** %lock_state2.i.i.i, align 8, !tbaa !44
  %6 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %control.i.i, i32 0, i32 0
  %7 = ptrtoint %struct.halide_mutex* %mutex to i32
  %8 = zext i32 %7 to i64
  %call3.i.i = call i64 @_ZN6Halide7Runtime8Internal15Synchronization15parking_control10unpark_oneEy(%"struct.Halide::Runtime::Internal::Synchronization::parking_control"* nonnull align 8 dereferenceable(8) %6, i64 %8) #12
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %4) #10
  br label %_ZN6Halide7Runtime8Internal15Synchronization10fast_mutex6unlockEv.exit

_ZN6Halide7Runtime8Internal15Synchronization10fast_mutex6unlockEv.exit: ; preds = %if.end.i.i, %if.then.i, %entry
  ret void
}

; Function Attrs: mustprogress nounwind
define linkonce i64 @_ZN6Halide7Runtime8Internal15Synchronization15parking_control10unpark_oneEy(%"struct.Halide::Runtime::Internal::Synchronization::parking_control"* nonnull align 8 dereferenceable(8) %this, i64 %addr) local_unnamed_addr #0 align 2 {
entry:
  %call = tail call nonnull align 8 dereferenceable(24) %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* @_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy(i64 %addr) #13
  %head = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %call, i32 0, i32 1
  %0 = load %"struct.Halide::Runtime::Internal::Synchronization::queue_data"*, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %head, align 8, !tbaa !11
  %tail = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %call, i32 0, i32 2
  %1 = bitcast %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* %this to i64 (%"struct.Halide::Runtime::Internal::Synchronization::parking_control"*, i32, i1)***
  %state.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %call, i32 0, i32 0, i32 0
  %mutex = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %call, i32 0, i32 0
  br label %while.cond

while.cond:                                       ; preds = %cleanup, %entry
  %data_location.0 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** [ %head, %entry ], [ %data_location.1, %cleanup ]
  %prev.0 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ null, %entry ], [ %prev.1, %cleanup ]
  %data.0 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ %0, %entry ], [ %data.1, %cleanup ]
  %retval.0 = phi i64 [ undef, %entry ], [ %retval.1, %cleanup ]
  %cmp.not = icmp eq %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %data.0, null
  br i1 %cmp.not, label %while.end22, label %while.body

while.body:                                       ; preds = %while.cond
  %sleep_address = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %data.0, i32 0, i32 1
  %2 = load atomic i64, i64* %sleep_address monotonic, align 8
  %cmp2 = icmp eq i64 %2, %addr
  %next3 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %data.0, i32 0, i32 2
  %3 = load %"struct.Halide::Runtime::Internal::Synchronization::queue_data"*, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %next3, align 8, !tbaa !86
  br i1 %cmp2, label %if.then, label %cleanup

if.then:                                          ; preds = %while.body
  store %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %3, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %data_location.0, align 8, !tbaa !11
  %4 = load %"struct.Halide::Runtime::Internal::Synchronization::queue_data"*, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %tail, align 8, !tbaa !91
  %cmp4 = icmp eq %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %4, %data.0
  br i1 %cmp4, label %if.then5, label %while.cond7.preheader

while.cond7.preheader:                            ; preds = %if.then
  %cmp872.not = icmp eq %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %3, null
  br i1 %cmp872.not, label %if.end, label %while.body9

if.then5:                                         ; preds = %if.then
  store %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %prev.0, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %tail, align 8, !tbaa !91
  br label %if.end

while.body9:                                      ; preds = %while.body9, %while.cond7.preheader
  %data2.073 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ %6, %while.body9 ], [ %3, %while.cond7.preheader ]
  %sleep_address10 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %data2.073, i32 0, i32 1
  %5 = load atomic i64, i64* %sleep_address10 monotonic, align 8
  %cmp11 = icmp eq i64 %5, %addr
  %next12 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %data2.073, i32 0, i32 2
  %6 = load %"struct.Halide::Runtime::Internal::Synchronization::queue_data"*, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %next12, align 8, !tbaa !86
  %cmp8 = icmp ne %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %6, null
  %tobool.not = xor i1 %cmp11, true
  %7 = select i1 %cmp8, i1 %tobool.not, i1 false
  br i1 %7, label %while.body9, label %if.end.loopexit, !llvm.loop !94

if.end.loopexit:                                  ; preds = %while.body9
  %frombool = zext i1 %cmp11 to i8
  br label %if.end

if.end:                                           ; preds = %if.end.loopexit, %if.then5, %while.cond7.preheader
  %more_waiters.1 = phi i8 [ 0, %if.then5 ], [ 0, %while.cond7.preheader ], [ %frombool, %if.end.loopexit ]
  %tobool13 = icmp ne i8 %more_waiters.1, 0
  %vtable = load i64 (%"struct.Halide::Runtime::Internal::Synchronization::parking_control"*, i32, i1)**, i64 (%"struct.Halide::Runtime::Internal::Synchronization::parking_control"*, i32, i1)*** %1, align 8, !tbaa !42
  %vfn = getelementptr inbounds i64 (%"struct.Halide::Runtime::Internal::Synchronization::parking_control"*, i32, i1)*, i64 (%"struct.Halide::Runtime::Internal::Synchronization::parking_control"*, i32, i1)** %vtable, i32 2
  %8 = load i64 (%"struct.Halide::Runtime::Internal::Synchronization::parking_control"*, i32, i1)*, i64 (%"struct.Halide::Runtime::Internal::Synchronization::parking_control"*, i32, i1)** %vfn, align 8
  %call14 = tail call i64 %8(%"struct.Halide::Runtime::Internal::Synchronization::parking_control"* nonnull align 8 dereferenceable(8) %this, i32 1, i1 zeroext %tobool13) #12
  %unpark_info = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %data.0, i32 0, i32 3
  store i64 %call14, i64* %unpark_info, align 8, !tbaa !95
  %mutex.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %data.0, i32 0, i32 0, i32 0
  %call.i = tail call i32 @pthread_mutex_lock(%struct.pthread_mutex_t* nonnull %mutex.i) #12
  %9 = atomicrmw and i64* %state.i, i64 -2 release, align 8
  %and.i = and i64 %9, 2
  %cmp.i = icmp ne i64 %and.i, 0
  %cmp3.not.i = icmp ult i64 %9, 4
  %or.cond.i = or i1 %cmp3.not.i, %cmp.i
  br i1 %or.cond.i, label %_ZN6Halide7Runtime8Internal15Synchronization9word_lock6unlockEv.exit, label %if.then.i

if.then.i:                                        ; preds = %if.end
  tail call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* nonnull align 8 dereferenceable(8) %mutex) #12
  br label %_ZN6Halide7Runtime8Internal15Synchronization9word_lock6unlockEv.exit

_ZN6Halide7Runtime8Internal15Synchronization9word_lock6unlockEv.exit: ; preds = %if.then.i, %if.end
  %should_park.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %data.0, i32 0, i32 0, i32 2
  store i8 0, i8* %should_park.i, align 8, !tbaa !96
  %condvar.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %data.0, i32 0, i32 0, i32 1
  %call.i60 = tail call i32 @pthread_cond_signal(%struct.pthread_mutex_t* nonnull %condvar.i) #12
  %call.i62 = tail call i32 @pthread_mutex_unlock(%struct.pthread_mutex_t* nonnull %mutex.i) #12
  %10 = zext i8 %more_waiters.1 to i64
  br label %cleanup

cleanup:                                          ; preds = %_ZN6Halide7Runtime8Internal15Synchronization9word_lock6unlockEv.exit, %while.body
  %data_location.1 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** [ %data_location.0, %_ZN6Halide7Runtime8Internal15Synchronization9word_lock6unlockEv.exit ], [ %next3, %while.body ]
  %prev.1 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ %prev.0, %_ZN6Halide7Runtime8Internal15Synchronization9word_lock6unlockEv.exit ], [ %data.0, %while.body ]
  %data.1 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ %data.0, %_ZN6Halide7Runtime8Internal15Synchronization9word_lock6unlockEv.exit ], [ %3, %while.body ]
  %retval.1 = phi i64 [ %10, %_ZN6Halide7Runtime8Internal15Synchronization9word_lock6unlockEv.exit ], [ %retval.0, %while.body ]
  br i1 %cmp2, label %cleanup27, label %while.cond, !llvm.loop !97

while.end22:                                      ; preds = %while.cond
  %vtable23 = load i64 (%"struct.Halide::Runtime::Internal::Synchronization::parking_control"*, i32, i1)**, i64 (%"struct.Halide::Runtime::Internal::Synchronization::parking_control"*, i32, i1)*** %1, align 8, !tbaa !42
  %vfn24 = getelementptr inbounds i64 (%"struct.Halide::Runtime::Internal::Synchronization::parking_control"*, i32, i1)*, i64 (%"struct.Halide::Runtime::Internal::Synchronization::parking_control"*, i32, i1)** %vtable23, i32 2
  %11 = load i64 (%"struct.Halide::Runtime::Internal::Synchronization::parking_control"*, i32, i1)*, i64 (%"struct.Halide::Runtime::Internal::Synchronization::parking_control"*, i32, i1)** %vfn24, align 8
  %call25 = tail call i64 %11(%"struct.Halide::Runtime::Internal::Synchronization::parking_control"* nonnull align 8 dereferenceable(8) %this, i32 0, i1 zeroext false) #12
  %12 = atomicrmw and i64* %state.i, i64 -2 release, align 8
  %and.i64 = and i64 %12, 2
  %cmp.i65 = icmp ne i64 %and.i64, 0
  %cmp3.not.i66 = icmp ult i64 %12, 4
  %or.cond.i67 = or i1 %cmp3.not.i66, %cmp.i65
  br i1 %or.cond.i67, label %cleanup27, label %if.then.i68

if.then.i68:                                      ; preds = %while.end22
  tail call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* nonnull align 8 dereferenceable(8) %mutex) #12
  br label %cleanup27

cleanup27:                                        ; preds = %if.then.i68, %while.end22, %cleanup
  %retval.2 = phi i64 [ 0, %while.end22 ], [ 0, %if.then.i68 ], [ %retval.1, %cleanup ]
  ret i64 %retval.2
}

; Function Attrs: mustprogress nounwind
define linkonce nonnull align 8 dereferenceable(24) %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* @_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy(i64 %addr) local_unnamed_addr #0 {
entry:
  %mul.i = mul i64 %addr, -7046029254386353131
  %shr.i = lshr i64 %mul.i, 54
  %0 = trunc i64 %shr.i to i32
  %arrayidx = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_table", %"struct.Halide::Runtime::Internal::Synchronization::hash_table"* @_ZN6Halide7Runtime8Internal15Synchronization5tableE, i32 0, i32 0, i32 %0
  %state.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %arrayidx, i32 0, i32 0, i32 0
  %1 = cmpxchg weak i64* %state.i, i64 0, i64 1 acquire monotonic, align 8
  %2 = extractvalue { i64, i1 } %1, 1
  br i1 %2, label %_ZN6Halide7Runtime8Internal15Synchronization9word_lock4lockEv.exit, label %if.then.i

if.then.i:                                        ; preds = %entry
  %mutex = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %arrayidx, i32 0, i32 0
  tail call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* nonnull align 8 dereferenceable(8) %mutex) #12
  br label %_ZN6Halide7Runtime8Internal15Synchronization9word_lock4lockEv.exit

_ZN6Halide7Runtime8Internal15Synchronization9word_lock4lockEv.exit: ; preds = %if.then.i, %entry
  ret %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %arrayidx
}

declare i32 @pthread_mutex_lock(%struct.pthread_mutex_t*) local_unnamed_addr #1

; Function Attrs: mustprogress nounwind
define linkonce void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* nonnull align 8 dereferenceable(8) %this) local_unnamed_addr #0 align 2 {
entry:
  %state = getelementptr inbounds %"class.Halide::Runtime::Internal::Synchronization::word_lock", %"class.Halide::Runtime::Internal::Synchronization::word_lock"* %this, i32 0, i32 0
  %0 = load atomic i64, i64* %state monotonic, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %expected.0 = phi i64 [ %0, %entry ], [ %3, %if.end ]
  %and = and i64 %expected.0, 2
  %tobool.not = icmp ne i64 %and, 0
  %cmp = icmp ult i64 %expected.0, 4
  %or.cond = or i1 %cmp, %tobool.not
  br i1 %or.cond, label %cleanup76, label %if.end

if.end:                                           ; preds = %while.cond
  %or = or i64 %expected.0, 2
  %1 = cmpxchg weak i64* %state, i64 %expected.0, i64 %or acquire monotonic, align 8
  %2 = extractvalue { i64, i1 } %1, 1
  %3 = extractvalue { i64, i1 } %1, 0
  br i1 %2, label %while.cond11, label %while.cond

while.cond11:                                     ; preds = %cleanup70, %if.end
  %.lcssa189.sink.pn = phi { i64, i1 } [ %.lcssa189.sink, %cleanup70 ], [ %1, %if.end ]
  %expected.3 = extractvalue { i64, i1 } %.lcssa189.sink.pn, 0
  %4 = trunc i64 %expected.3 to i32
  %5 = and i32 %4, -4
  %6 = inttoptr i32 %5 to %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"*
  %tail14 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data", %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %6, i32 0, i32 3
  %tail.0147 = load %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"*, %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"** %tail14, align 8, !tbaa !98
  %cmp16148 = icmp eq %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %tail.0147, null
  br i1 %cmp16148, label %while.body17, label %while.end23

while.body17:                                     ; preds = %do.end, %while.cond11
  %current.0149 = phi %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* [ %7, %do.end ], [ %6, %while.cond11 ]
  %next18 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data", %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %current.0149, i32 0, i32 1
  %7 = load %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"*, %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"** %next18, align 8, !tbaa !100
  %cmp19.not = icmp eq %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %7, null
  br i1 %cmp19.not, label %if.then20, label %do.end

if.then20:                                        ; preds = %while.body17
  tail call void @halide_print(i8* null, i8* getelementptr inbounds ([112 x i8], [112 x i8]* @.str.5, i32 0, i32 0)) #12
  tail call void @abort() #12
  br label %do.end

do.end:                                           ; preds = %if.then20, %while.body17
  %prev = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data", %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %7, i32 0, i32 2
  store %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %current.0149, %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"** %prev, align 8, !tbaa !101
  %tail22 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data", %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %7, i32 0, i32 3
  %tail.0 = load %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"*, %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"** %tail22, align 8, !tbaa !98
  %cmp16 = icmp eq %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %tail.0, null
  br i1 %cmp16, label %while.body17, label %while.end23, !llvm.loop !102

while.end23:                                      ; preds = %do.end, %while.cond11
  %tail.0.lcssa = phi %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* [ %tail.0147, %while.cond11 ], [ %tail.0, %do.end ]
  store %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %tail.0.lcssa, %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"** %tail14, align 8, !tbaa !98
  %and25 = and i64 %expected.3, 1
  %tobool26.not = icmp eq i64 %and25, 0
  br i1 %tobool26.not, label %if.end35, label %if.then27

if.then27:                                        ; preds = %while.end23
  %and29 = and i64 %expected.3, -3
  %8 = cmpxchg weak i64* %state, i64 %expected.3, i64 %and29 acq_rel monotonic, align 8
  %9 = extractvalue { i64, i1 } %8, 1
  br i1 %9, label %cleanup76, label %cleanup70, !llvm.loop !103

if.end35:                                         ; preds = %while.end23
  %prev36 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data", %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %tail.0.lcssa, i32 0, i32 2
  %10 = load %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"*, %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"** %prev36, align 8, !tbaa !101
  %cmp37 = icmp eq %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %10, null
  br i1 %cmp37, label %while.body41, label %if.else62

while.body41:                                     ; preds = %if.end47, %if.end35
  %expected.5150 = phi i64 [ %13, %if.end47 ], [ %expected.3, %if.end35 ]
  %and43 = and i64 %expected.5150, 1
  %11 = cmpxchg weak i64* %state, i64 %expected.5150, i64 %and43 acq_rel monotonic, align 8
  %12 = extractvalue { i64, i1 } %11, 1
  br i1 %12, label %if.end66, label %if.end47

if.end47:                                         ; preds = %while.body41
  %13 = extractvalue { i64, i1 } %11, 0
  %cmp49 = icmp ult i64 %13, 4
  br i1 %cmp49, label %while.body41, label %cleanup70, !llvm.loop !104

if.else62:                                        ; preds = %if.end35
  store %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %10, %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"** %tail14, align 8, !tbaa !98
  %14 = atomicrmw and i64* %state, i64 -3 release, align 8
  br label %if.end66

if.end66:                                         ; preds = %if.else62, %while.body41
  %mutex.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data", %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %tail.0.lcssa, i32 0, i32 0, i32 0
  %call.i = tail call i32 @pthread_mutex_lock(%struct.pthread_mutex_t* nonnull %mutex.i) #12
  %should_park.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data", %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %tail.0.lcssa, i32 0, i32 0, i32 2
  store i8 0, i8* %should_park.i, align 8, !tbaa !96
  %condvar.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data", %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %tail.0.lcssa, i32 0, i32 0, i32 1
  %call.i107 = tail call i32 @pthread_cond_signal(%struct.pthread_mutex_t* nonnull %condvar.i) #12
  %call.i109 = tail call i32 @pthread_mutex_unlock(%struct.pthread_mutex_t* nonnull %mutex.i) #12
  br label %cleanup76

cleanup70:                                        ; preds = %if.end47, %if.then27
  %.lcssa189.sink = phi { i64, i1 } [ %8, %if.then27 ], [ %11, %if.end47 ]
  fence acquire
  br label %while.cond11

cleanup76:                                        ; preds = %if.end66, %if.then27, %while.cond
  ret void
}

declare i32 @pthread_cond_signal(%struct.pthread_mutex_t*) local_unnamed_addr #1

declare i32 @pthread_mutex_unlock(%struct.pthread_mutex_t*) local_unnamed_addr #1

; Function Attrs: nounwind
define linkonce void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* nonnull align 8 dereferenceable(8) %this) local_unnamed_addr #3 align 2 {
entry:
  %node = alloca %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data", align 8
  %state = getelementptr inbounds %"class.Halide::Runtime::Internal::Synchronization::word_lock", %"class.Halide::Runtime::Internal::Synchronization::word_lock"* %this, i32 0, i32 0
  %0 = load atomic i64, i64* %state monotonic, align 8
  %1 = bitcast %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %node to i8*
  %should_park.i.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data", %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %node, i32 0, i32 0, i32 2
  %mutex2.i.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data", %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %node, i32 0, i32 0, i32 0
  %condvar3.i.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data", %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %node, i32 0, i32 0, i32 1
  %next.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data", %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %node, i32 0, i32 1
  %prev.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data", %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %node, i32 0, i32 2
  %tail.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data", %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %node, i32 0, i32 3
  %2 = ptrtoint %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %node to i32
  %3 = zext i32 %2 to i64
  br label %while.cond.outer

while.cond.outer:                                 ; preds = %while.cond.outer.backedge, %entry
  %expected.0.ph = phi i64 [ %0, %entry ], [ %expected.0.ph.be, %while.cond.outer.backedge ]
  %spinner.sroa.0.0.ph = phi i32 [ 40, %entry ], [ %spinner.sroa.0.0.ph.be, %while.cond.outer.backedge ]
  %and46 = and i64 %expected.0.ph, 1
  %tobool.not47 = icmp eq i64 %and46, 0
  br i1 %tobool.not47, label %if.then, label %if.end4

if.then:                                          ; preds = %_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_131atomic_cas_weak_acquire_relaxedEPyS4_S4_.exit, %while.cond.outer
  %expected.048 = phi i64 [ %6, %_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_131atomic_cas_weak_acquire_relaxedEPyS4_S4_.exit ], [ %expected.0.ph, %while.cond.outer ]
  %or = or i64 %expected.048, 1
  %4 = cmpxchg weak i64* %state, i64 %expected.048, i64 %or acquire monotonic, align 8
  %5 = extractvalue { i64, i1 } %4, 1
  br i1 %5, label %cleanup23, label %_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_131atomic_cas_weak_acquire_relaxedEPyS4_S4_.exit

_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_131atomic_cas_weak_acquire_relaxedEPyS4_S4_.exit: ; preds = %if.then
  %6 = extractvalue { i64, i1 } %4, 0
  %and = and i64 %6, 1
  %tobool.not = icmp eq i64 %and, 0
  br i1 %tobool.not, label %if.then, label %if.end4.loopexit

if.end4.loopexit:                                 ; preds = %_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_131atomic_cas_weak_acquire_relaxedEPyS4_S4_.exit
  %7 = extractvalue { i64, i1 } %4, 0
  br label %if.end4

if.end4:                                          ; preds = %if.end4.loopexit, %while.cond.outer
  %expected.0.lcssa = phi i64 [ %expected.0.ph, %while.cond.outer ], [ %7, %if.end4.loopexit ]
  %cmp.not = icmp ugt i64 %expected.0.lcssa, 3
  %cmp.i = icmp sgt i32 %spinner.sroa.0.0.ph, 0
  %or.cond = select i1 %cmp.not, i1 %cmp.i, i1 false
  br i1 %or.cond, label %_ZN6Halide7Runtime8Internal15Synchronization12spin_control11should_spinEv.exit, label %if.end9

_ZN6Halide7Runtime8Internal15Synchronization12spin_control11should_spinEv.exit: ; preds = %if.end4
  %cmp4.i = icmp sgt i32 %spinner.sroa.0.0.ph, 1
  br i1 %cmp4.i, label %if.then7, label %if.end9

if.then7:                                         ; preds = %_ZN6Halide7Runtime8Internal15Synchronization12spin_control11should_spinEv.exit
  %dec.i = add nsw i32 %spinner.sroa.0.0.ph, -1
  call void @halide_thread_yield() #12
  %8 = load atomic i64, i64* %state monotonic, align 8
  br label %while.cond.outer.backedge

if.end9:                                          ; preds = %_ZN6Halide7Runtime8Internal15Synchronization12spin_control11should_spinEv.exit, %if.end4
  %spinner.sroa.0.2 = phi i32 [ %spinner.sroa.0.0.ph, %if.end4 ], [ 0, %_ZN6Halide7Runtime8Internal15Synchronization12spin_control11should_spinEv.exit ]
  call void @llvm.lifetime.start.p0i8(i64 160, i8* nonnull %1) #10
  store i8 0, i8* %should_park.i.i, align 8, !tbaa !96
  %call.i.i = call i32 @pthread_mutex_init(%struct.pthread_mutex_t* nonnull %mutex2.i.i, i8* null) #12
  %call4.i.i = call i32 @pthread_cond_init(%struct.pthread_mutex_t* nonnull %condvar3.i.i, i8* null) #12
  store %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* null, %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"** %next.i, align 8, !tbaa !100
  store %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* null, %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"** %prev.i, align 8, !tbaa !101
  store %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* null, %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"** %tail.i, align 8, !tbaa !98
  store i8 1, i8* %should_park.i.i, align 8, !tbaa !96
  %and10 = and i64 %expected.0.lcssa, -4
  %cmp11 = icmp eq i64 %and10, 0
  br i1 %cmp11, label %if.then12, label %if.else

if.then12:                                        ; preds = %if.end9
  store %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %node, %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"** %tail.i, align 8, !tbaa !98
  br label %if.end13

if.else:                                          ; preds = %if.end9
  %9 = trunc i64 %and10 to i32
  %10 = inttoptr i32 %9 to %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"*
  store %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %10, %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"** %next.i, align 8, !tbaa !100
  br label %if.end13

if.end13:                                         ; preds = %if.else, %if.then12
  %and15 = and i64 %expected.0.lcssa, 3
  %or16 = or i64 %and15, %3
  %11 = cmpxchg weak i64* %state, i64 %expected.0.lcssa, i64 %or16 release monotonic, align 8
  %12 = extractvalue { i64, i1 } %11, 1
  br i1 %12, label %if.then19, label %_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_131atomic_cas_weak_release_relaxedEPyS4_S4_.exit

_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_131atomic_cas_weak_release_relaxedEPyS4_S4_.exit: ; preds = %if.end13
  %13 = extractvalue { i64, i1 } %11, 0
  br label %if.end22

if.then19:                                        ; preds = %if.end13
  %call.i = call i32 @pthread_mutex_lock(%struct.pthread_mutex_t* nonnull %mutex2.i.i) #12
  %14 = load i8, i8* %should_park.i.i, align 8, !tbaa !96, !range !18
  %tobool.not6.i = icmp eq i8 %14, 0
  br i1 %tobool.not6.i, label %_ZN6Halide7Runtime8Internal15Synchronization13thread_parker4parkEv.exit, label %while.body.i

while.body.i:                                     ; preds = %while.body.i, %if.then19
  %call3.i = call i32 @pthread_cond_wait(%struct.pthread_mutex_t* nonnull %condvar3.i.i, %struct.pthread_mutex_t* nonnull %mutex2.i.i) #12
  %15 = load i8, i8* %should_park.i.i, align 8, !tbaa !96, !range !18
  %tobool.not.i = icmp eq i8 %15, 0
  br i1 %tobool.not.i, label %_ZN6Halide7Runtime8Internal15Synchronization13thread_parker4parkEv.exit, label %while.body.i, !llvm.loop !105

_ZN6Halide7Runtime8Internal15Synchronization13thread_parker4parkEv.exit: ; preds = %while.body.i, %if.then19
  %call5.i = call i32 @pthread_mutex_unlock(%struct.pthread_mutex_t* nonnull %mutex2.i.i) #12
  %16 = load atomic i64, i64* %state monotonic, align 8
  br label %if.end22

if.end22:                                         ; preds = %_ZN6Halide7Runtime8Internal15Synchronization13thread_parker4parkEv.exit, %_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_131atomic_cas_weak_release_relaxedEPyS4_S4_.exit
  %expected.3 = phi i64 [ %16, %_ZN6Halide7Runtime8Internal15Synchronization13thread_parker4parkEv.exit ], [ %13, %_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_131atomic_cas_weak_release_relaxedEPyS4_S4_.exit ]
  %spinner.sroa.0.3 = phi i32 [ 40, %_ZN6Halide7Runtime8Internal15Synchronization13thread_parker4parkEv.exit ], [ %spinner.sroa.0.2, %_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_131atomic_cas_weak_release_relaxedEPyS4_S4_.exit ]
  %call.i.i31 = call i32 @pthread_cond_destroy(%struct.pthread_mutex_t* nonnull %condvar3.i.i) #12
  %call2.i.i = call i32 @pthread_mutex_destroy(%struct.pthread_mutex_t* nonnull %mutex2.i.i) #12
  call void @llvm.lifetime.end.p0i8(i64 160, i8* nonnull %1) #10
  br label %while.cond.outer.backedge

while.cond.outer.backedge:                        ; preds = %if.end22, %if.then7
  %expected.0.ph.be = phi i64 [ %8, %if.then7 ], [ %expected.3, %if.end22 ]
  %spinner.sroa.0.0.ph.be = phi i32 [ %dec.i, %if.then7 ], [ %spinner.sroa.0.3, %if.end22 ]
  br label %while.cond.outer, !llvm.loop !106

cleanup23:                                        ; preds = %if.then
  ret void
}

declare i32 @pthread_mutex_init(%struct.pthread_mutex_t*, i8*) local_unnamed_addr #1

declare i32 @pthread_cond_init(%struct.pthread_mutex_t*, i8*) local_unnamed_addr #1

declare i32 @pthread_cond_wait(%struct.pthread_mutex_t*, %struct.pthread_mutex_t*) local_unnamed_addr #1

declare i32 @pthread_cond_destroy(%struct.pthread_mutex_t*) local_unnamed_addr #1

declare i32 @pthread_mutex_destroy(%struct.pthread_mutex_t*) local_unnamed_addr #1

; Function Attrs: mustprogress nounwind
define linkonce_odr zeroext i1 @_ZN6Halide7Runtime8Internal15Synchronization21mutex_parking_control8validateERNS2_15validate_actionE(%"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* nonnull align 8 dereferenceable(16) %this, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"* nonnull align 8 dereferenceable(16) %action) unnamed_addr #0 comdat align 2 {
entry:
  %lock_state = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %this, i32 0, i32 1
  %0 = load i64*, i64** %lock_state, align 8, !tbaa !44
  %1 = load atomic i64, i64* %0 monotonic, align 8
  %cmp = icmp eq i64 %1, 3
  ret i1 %cmp
}

; Function Attrs: mustprogress nounwind
define linkonce_odr void @_ZN6Halide7Runtime8Internal15Synchronization15parking_control12before_sleepEv(%"struct.Halide::Runtime::Internal::Synchronization::parking_control"* nonnull align 8 dereferenceable(8) %this) unnamed_addr #0 comdat align 2 {
entry:
  ret void
}

; Function Attrs: mustprogress nounwind
define linkonce_odr i64 @_ZN6Halide7Runtime8Internal15Synchronization21mutex_parking_control6unparkEib(%"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* nonnull align 8 dereferenceable(16) %this, i32 %unparked, i1 zeroext %more_waiters) unnamed_addr #0 comdat align 2 {
entry:
  %0 = select i1 %more_waiters, i64 2, i64 0
  %lock_state = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %this, i32 0, i32 1
  %1 = load i64*, i64** %lock_state, align 8, !tbaa !44
  store atomic i64 %0, i64* %1 release, align 8
  ret i64 0
}

; Function Attrs: mustprogress nounwind
define linkonce_odr void @_ZN6Halide7Runtime8Internal15Synchronization15parking_control16requeue_callbackERKNS2_15validate_actionEbb(%"struct.Halide::Runtime::Internal::Synchronization::parking_control"* nonnull align 8 dereferenceable(8) %this, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"* nonnull align 8 dereferenceable(16) %action, i1 zeroext %one_to_wake, i1 zeroext %some_requeued) unnamed_addr #0 comdat align 2 {
entry:
  ret void
}

; Function Attrs: nounwind
define weak void @halide_cond_broadcast(%struct.halide_mutex* %cond) local_unnamed_addr #3 {
entry:
  %control.i = alloca %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", align 8
  %state.i = getelementptr %struct.halide_mutex, %struct.halide_mutex* %cond, i32 0, i32 0, i32 0
  %0 = load atomic i64, i64* %state.i monotonic, align 8
  %cmp.i = icmp eq i64 %0, 0
  br i1 %cmp.i, label %_ZN6Halide7Runtime8Internal15Synchronization9fast_cond9broadcastEv.exit, label %if.end.i

if.end.i:                                         ; preds = %entry
  %1 = bitcast %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %control.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %1) #10
  %2 = trunc i64 %0 to i32
  %3 = inttoptr i32 %2 to %"class.Halide::Runtime::Internal::Synchronization::word_lock"*
  %4 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %control.i, i32 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [6 x i8*] }, { [6 x i8*] }* @_ZTVN6Halide7Runtime8Internal15Synchronization25broadcast_parking_controlE, i32 0, inrange i32 0, i32 2) to i32 (...)**), i32 (...)*** %4, align 8, !tbaa !42
  %cond_state2.i.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %control.i, i32 0, i32 1
  store i64* %state.i, i64** %cond_state2.i.i, align 8, !tbaa !107
  %mutex3.i.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %control.i, i32 0, i32 2
  store %"class.Halide::Runtime::Internal::Synchronization::word_lock"* %3, %"class.Halide::Runtime::Internal::Synchronization::word_lock"** %mutex3.i.i, align 8, !tbaa !109
  %5 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %control.i, i32 0, i32 0
  %6 = ptrtoint %struct.halide_mutex* %cond to i32
  %7 = zext i32 %6 to i64
  %call.i = call i32 @_ZN6Halide7Runtime8Internal15Synchronization15parking_control14unpark_requeueEyyy(%"struct.Halide::Runtime::Internal::Synchronization::parking_control"* nonnull align 8 dereferenceable(8) %5, i64 %7, i64 %0, i64 0) #12
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %1) #10
  br label %_ZN6Halide7Runtime8Internal15Synchronization9fast_cond9broadcastEv.exit

_ZN6Halide7Runtime8Internal15Synchronization9fast_cond9broadcastEv.exit: ; preds = %if.end.i, %entry
  ret void
}

; Function Attrs: mustprogress nounwind
define weak zeroext i1 @halide_default_semaphore_try_acquire(%struct.halide_semaphore_t* %s, i32 %n) #0 {
entry:
  %cmp = icmp eq i32 %n, 0
  br i1 %cmp, label %return, label %if.end

if.end:                                           ; preds = %entry
  %value = bitcast %struct.halide_semaphore_t* %s to i32*
  %0 = load atomic i32, i32* %value acquire, align 4
  %sub12 = sub nsw i32 %0, %n
  %cmp113 = icmp sgt i32 %sub12, -1
  br i1 %cmp113, label %land.rhs, label %return

land.rhs:                                         ; preds = %_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_130atomic_cas_weak_relacq_relaxedIiEEbPT_S6_S6_.exit, %if.end
  %sub15 = phi i32 [ %sub, %_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_130atomic_cas_weak_relacq_relaxedIiEEbPT_S6_S6_.exit ], [ %sub12, %if.end ]
  %expected.014 = phi i32 [ %3, %_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_130atomic_cas_weak_relacq_relaxedIiEEbPT_S6_S6_.exit ], [ %0, %if.end ]
  %1 = cmpxchg weak i32* %value, i32 %expected.014, i32 %sub15 acq_rel monotonic, align 4
  %2 = extractvalue { i32, i1 } %1, 1
  br i1 %2, label %return.loopexit, label %_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_130atomic_cas_weak_relacq_relaxedIiEEbPT_S6_S6_.exit

_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_130atomic_cas_weak_relacq_relaxedIiEEbPT_S6_S6_.exit: ; preds = %land.rhs
  %3 = extractvalue { i32, i1 } %1, 0
  %sub = sub nsw i32 %3, %n
  %cmp1 = icmp sgt i32 %sub, -1
  br i1 %cmp1, label %land.rhs, label %return.loopexit

return.loopexit:                                  ; preds = %_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_130atomic_cas_weak_relacq_relaxedIiEEbPT_S6_S6_.exit, %land.rhs
  %4 = extractvalue { i32, i1 } %1, 1
  br label %return

return:                                           ; preds = %return.loopexit, %if.end, %entry
  %retval.0 = phi i1 [ true, %entry ], [ false, %if.end ], [ %4, %return.loopexit ]
  ret i1 %retval.0
}

; Function Attrs: nounwind
define weak void @halide_cond_wait(%struct.halide_mutex* %cond, %struct.halide_mutex* %mutex) local_unnamed_addr #3 {
entry:
  %control.i.i.i = alloca %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", align 8
  %control.i = alloca %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", align 8
  %0 = bitcast %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %control.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %0) #10
  %state.i = getelementptr %struct.halide_mutex, %struct.halide_mutex* %cond, i32 0, i32 0, i32 0
  %1 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %control.i, i32 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [6 x i8*] }, { [6 x i8*] }* @_ZTVN6Halide7Runtime8Internal15Synchronization20wait_parking_controlE, i32 0, inrange i32 0, i32 2) to i32 (...)**), i32 (...)*** %1, align 8, !tbaa !42
  %cond_state2.i.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %control.i, i32 0, i32 1
  store i64* %state.i, i64** %cond_state2.i.i, align 8, !tbaa !110
  %mutex3.i.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %control.i, i32 0, i32 2
  %2 = bitcast %"class.Halide::Runtime::Internal::Synchronization::word_lock"** %mutex3.i.i to %struct.halide_mutex**
  store %struct.halide_mutex* %mutex, %struct.halide_mutex** %2, align 8, !tbaa !112
  %3 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %control.i, i32 0, i32 0
  %4 = ptrtoint %struct.halide_mutex* %cond to i32
  %5 = zext i32 %4 to i64
  %call.i = call i64 @_ZN6Halide7Runtime8Internal15Synchronization15parking_control4parkEy(%"struct.Halide::Runtime::Internal::Synchronization::parking_control"* nonnull align 8 dereferenceable(8) %3, i64 %5) #12
  %6 = ptrtoint %struct.halide_mutex* %mutex to i32
  %7 = zext i32 %6 to i64
  %cmp.not.i = icmp eq i64 %call.i, %7
  %8 = getelementptr %struct.halide_mutex, %struct.halide_mutex* %mutex, i32 0, i32 0, i32 0
  br i1 %cmp.not.i, label %if.else.i, label %if.then.i

if.then.i:                                        ; preds = %entry
  %9 = cmpxchg weak i64* %8, i64 0, i64 1 acquire monotonic, align 8
  %10 = extractvalue { i64, i1 } %9, 1
  br i1 %10, label %_ZN6Halide7Runtime8Internal15Synchronization9fast_cond4waitEPNS2_10fast_mutexE.exit, label %if.then.i.i

if.then.i.i:                                      ; preds = %if.then.i
  %11 = load atomic i64, i64* %8 monotonic, align 8
  %12 = bitcast %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %control.i.i.i to i8*
  %13 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %control.i.i.i, i32 0, i32 0, i32 0
  %lock_state2.i.i.i.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %control.i.i.i, i32 0, i32 1
  %14 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %control.i.i.i, i32 0, i32 0
  br label %while.cond.outer.i.i.i

while.cond.outer.i.i.i:                           ; preds = %while.cond.outer.i.i.i.backedge, %if.then.i.i
  %expected.0.ph.i.i.i = phi i64 [ %11, %if.then.i.i ], [ %expected.0.ph.i.i.i.be, %while.cond.outer.i.i.i.backedge ]
  %spinner.sroa.0.0.ph.i.i.i = phi i32 [ 40, %if.then.i.i ], [ %spinner.sroa.0.0.ph.i.i.i.be, %while.cond.outer.i.i.i.backedge ]
  %and55.i.i.i = and i64 %expected.0.ph.i.i.i, 1
  %tobool.not56.i.i.i = icmp eq i64 %and55.i.i.i, 0
  br i1 %tobool.not56.i.i.i, label %if.then.i.i.i, label %if.end4.i.i.i

if.then.i.i.i:                                    ; preds = %_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_131atomic_cas_weak_acquire_relaxedEPyS4_S4_.exit.i.i.i, %while.cond.outer.i.i.i
  %expected.057.i.i.i = phi i64 [ %17, %_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_131atomic_cas_weak_acquire_relaxedEPyS4_S4_.exit.i.i.i ], [ %expected.0.ph.i.i.i, %while.cond.outer.i.i.i ]
  %or.i.i.i = or i64 %expected.057.i.i.i, 1
  %15 = cmpxchg weak i64* %8, i64 %expected.057.i.i.i, i64 %or.i.i.i acquire monotonic, align 8
  %16 = extractvalue { i64, i1 } %15, 1
  br i1 %16, label %_ZN6Halide7Runtime8Internal15Synchronization9fast_cond4waitEPNS2_10fast_mutexE.exit, label %_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_131atomic_cas_weak_acquire_relaxedEPyS4_S4_.exit.i.i.i

_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_131atomic_cas_weak_acquire_relaxedEPyS4_S4_.exit.i.i.i: ; preds = %if.then.i.i.i
  %17 = extractvalue { i64, i1 } %15, 0
  %and.i.i.i = and i64 %17, 1
  %tobool.not.i.i.i = icmp eq i64 %and.i.i.i, 0
  br i1 %tobool.not.i.i.i, label %if.then.i.i.i, label %if.end4.i.i.i.loopexit

if.end4.i.i.i.loopexit:                           ; preds = %_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_131atomic_cas_weak_acquire_relaxedEPyS4_S4_.exit.i.i.i
  %18 = extractvalue { i64, i1 } %15, 0
  br label %if.end4.i.i.i

if.end4.i.i.i:                                    ; preds = %if.end4.i.i.i.loopexit, %while.cond.outer.i.i.i
  %expected.0.lcssa.i.i.i = phi i64 [ %expected.0.ph.i.i.i, %while.cond.outer.i.i.i ], [ %18, %if.end4.i.i.i.loopexit ]
  %cmp.i.i.i.i = icmp sgt i32 %spinner.sroa.0.0.ph.i.i.i, 0
  br i1 %cmp.i.i.i.i, label %_ZN6Halide7Runtime8Internal15Synchronization12spin_control11should_spinEv.exit.i.i.i, label %if.end8.i.i.i

_ZN6Halide7Runtime8Internal15Synchronization12spin_control11should_spinEv.exit.i.i.i: ; preds = %if.end4.i.i.i
  %cmp4.i.not.i.i.i = icmp eq i32 %spinner.sroa.0.0.ph.i.i.i, 1
  br i1 %cmp4.i.not.i.i.i, label %if.end8.i.i.i, label %if.then6.i.i.i

if.then6.i.i.i:                                   ; preds = %_ZN6Halide7Runtime8Internal15Synchronization12spin_control11should_spinEv.exit.i.i.i
  %dec.i.i.i.i = add nsw i32 %spinner.sroa.0.0.ph.i.i.i, -1
  call void @halide_thread_yield() #12
  %19 = load atomic i64, i64* %8 monotonic, align 8
  br label %while.cond.outer.i.i.i.backedge

if.end8.i.i.i:                                    ; preds = %_ZN6Halide7Runtime8Internal15Synchronization12spin_control11should_spinEv.exit.i.i.i, %if.end4.i.i.i
  %spinner.sroa.0.152.i.i.i = phi i32 [ 0, %_ZN6Halide7Runtime8Internal15Synchronization12spin_control11should_spinEv.exit.i.i.i ], [ %spinner.sroa.0.0.ph.i.i.i, %if.end4.i.i.i ]
  %and9.i.i.i = and i64 %expected.0.lcssa.i.i.i, 2
  %cmp.i.i.i = icmp eq i64 %and9.i.i.i, 0
  br i1 %cmp.i.i.i, label %if.then10.i.i.i, label %if.end19.i.i.i

if.then10.i.i.i:                                  ; preds = %if.end8.i.i.i
  %or12.i.i.i = or i64 %expected.0.lcssa.i.i.i, 2
  %20 = cmpxchg weak i64* %8, i64 %expected.0.lcssa.i.i.i, i64 %or12.i.i.i monotonic monotonic, align 8
  %21 = extractvalue { i64, i1 } %20, 1
  br i1 %21, label %if.end19.i.i.i, label %_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_131atomic_cas_weak_relaxed_relaxedEPyS4_S4_.exit.i.i.i

_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_131atomic_cas_weak_relaxed_relaxedEPyS4_S4_.exit.i.i.i: ; preds = %if.then10.i.i.i
  %22 = extractvalue { i64, i1 } %20, 0
  br label %while.cond.outer.i.i.i.backedge

if.end19.i.i.i:                                   ; preds = %if.then10.i.i.i, %if.end8.i.i.i
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %12) #10
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [6 x i8*] }, { [6 x i8*] }* @_ZTVN6Halide7Runtime8Internal15Synchronization21mutex_parking_controlE, i32 0, inrange i32 0, i32 2) to i32 (...)**), i32 (...)*** %13, align 8, !tbaa !42
  store i64* %8, i64** %lock_state2.i.i.i.i, align 8, !tbaa !44
  %call21.i.i.i = call i64 @_ZN6Halide7Runtime8Internal15Synchronization15parking_control4parkEy(%"struct.Halide::Runtime::Internal::Synchronization::parking_control"* nonnull align 8 dereferenceable(8) %14, i64 %7) #12
  %cmp22.i.i.i = icmp eq i64 %call21.i.i.i, %7
  br i1 %cmp22.i.i.i, label %cleanup30.critedge.i.i.i, label %if.end24.i.i.i

if.end24.i.i.i:                                   ; preds = %if.end19.i.i.i
  %23 = load atomic i64, i64* %8 monotonic, align 8
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %12) #10
  br label %while.cond.outer.i.i.i.backedge

while.cond.outer.i.i.i.backedge:                  ; preds = %if.end24.i.i.i, %_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_131atomic_cas_weak_relaxed_relaxedEPyS4_S4_.exit.i.i.i, %if.then6.i.i.i
  %expected.0.ph.i.i.i.be = phi i64 [ %22, %_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_131atomic_cas_weak_relaxed_relaxedEPyS4_S4_.exit.i.i.i ], [ %23, %if.end24.i.i.i ], [ %19, %if.then6.i.i.i ]
  %spinner.sroa.0.0.ph.i.i.i.be = phi i32 [ %spinner.sroa.0.152.i.i.i, %_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_131atomic_cas_weak_relaxed_relaxedEPyS4_S4_.exit.i.i.i ], [ 40, %if.end24.i.i.i ], [ %dec.i.i.i.i, %if.then6.i.i.i ]
  br label %while.cond.outer.i.i.i, !llvm.loop !46

cleanup30.critedge.i.i.i:                         ; preds = %if.end19.i.i.i
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %12) #10
  br label %_ZN6Halide7Runtime8Internal15Synchronization9fast_cond4waitEPNS2_10fast_mutexE.exit

if.else.i:                                        ; preds = %entry
  %24 = load atomic i64, i64* %8 monotonic, align 8
  %and.i = and i64 %24, 1
  %tobool.not.i = icmp eq i64 %and.i, 0
  br i1 %tobool.not.i, label %if.then2.i, label %_ZN6Halide7Runtime8Internal15Synchronization9fast_cond4waitEPNS2_10fast_mutexE.exit

if.then2.i:                                       ; preds = %if.else.i
  call void @halide_print(i8* null, i8* getelementptr inbounds ([106 x i8], [106 x i8]* @.str.5.6, i32 0, i32 0)) #12
  call void @abort() #12
  br label %_ZN6Halide7Runtime8Internal15Synchronization9fast_cond4waitEPNS2_10fast_mutexE.exit

_ZN6Halide7Runtime8Internal15Synchronization9fast_cond4waitEPNS2_10fast_mutexE.exit: ; preds = %if.then2.i, %if.else.i, %cleanup30.critedge.i.i.i, %if.then.i.i.i, %if.then.i
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %0) #10
  ret void
}

; Function Attrs: mustprogress nounwind
define weak i32 @halide_do_loop_task(i8* %user_context, i32 (i8*, i32, i32, i8*, i8*)* %f, i32 %min, i32 %size, i8* %closure, i8* %task_parent) local_unnamed_addr #0 {
entry:
  %0 = load i32 (i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*)*, i32 (i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*)** @_ZN6Halide7Runtime8Internal19custom_do_loop_taskE, align 8, !tbaa !11
  %call = tail call i32 %0(i8* %user_context, i32 (i8*, i32, i32, i8*, i8*)* %f, i32 %min, i32 %size, i8* %closure, i8* %task_parent) #12
  ret i32 %call
}

; Function Attrs: mustprogress nounwind
define weak i32 @halide_do_task(i8* %user_context, i32 (i8*, i32, i8*)* %f, i32 %idx, i8* %closure) local_unnamed_addr #0 {
entry:
  %0 = load i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)*, i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)** @_ZN6Halide7Runtime8Internal14custom_do_taskE, align 8, !tbaa !11
  %call = tail call i32 %0(i8* %user_context, i32 (i8*, i32, i8*)* %f, i32 %idx, i8* %closure) #12
  ret i32 %call
}

; Function Attrs: nounwind
define linkonce i64 @_ZN6Halide7Runtime8Internal15Synchronization15parking_control4parkEy(%"struct.Halide::Runtime::Internal::Synchronization::parking_control"* nonnull align 8 dereferenceable(8) %this, i64 %addr) local_unnamed_addr #3 align 2 {
entry:
  %queue_data = alloca %"struct.Halide::Runtime::Internal::Synchronization::queue_data", align 8
  %action = alloca %"struct.Halide::Runtime::Internal::Synchronization::validate_action", align 8
  %0 = bitcast %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %queue_data to i8*
  call void @llvm.lifetime.start.p0i8(i64 160, i8* nonnull %0) #10
  %should_park.i.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %queue_data, i32 0, i32 0, i32 2
  store i8 0, i8* %should_park.i.i, align 8, !tbaa !96
  %mutex2.i.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %queue_data, i32 0, i32 0, i32 0
  %call.i.i = call i32 @pthread_mutex_init(%struct.pthread_mutex_t* nonnull %mutex2.i.i, i8* null) #12
  %condvar3.i.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %queue_data, i32 0, i32 0, i32 1
  %call4.i.i = call i32 @pthread_cond_init(%struct.pthread_mutex_t* nonnull %condvar3.i.i, i8* null) #12
  %sleep_address.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %queue_data, i32 0, i32 1
  store i64 0, i64* %sleep_address.i, align 8, !tbaa !113
  %next.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %queue_data, i32 0, i32 2
  store %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* null, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %next.i, align 8, !tbaa !86
  %unpark_info.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %queue_data, i32 0, i32 3
  store i64 0, i64* %unpark_info.i, align 8, !tbaa !95
  %call = call nonnull align 8 dereferenceable(24) %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* @_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy(i64 %addr) #13
  %1 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::validate_action", %"struct.Halide::Runtime::Internal::Synchronization::validate_action"* %action, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %1) #10
  store i8 0, i8* %1, align 8, !tbaa !114
  %invalid_unpark_info.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::validate_action", %"struct.Halide::Runtime::Internal::Synchronization::validate_action"* %action, i32 0, i32 2
  store i64 0, i64* %invalid_unpark_info.i, align 8, !tbaa !116
  %2 = bitcast %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* %this to i1 (%"struct.Halide::Runtime::Internal::Synchronization::parking_control"*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)***
  %vtable = load i1 (%"struct.Halide::Runtime::Internal::Synchronization::parking_control"*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)**, i1 (%"struct.Halide::Runtime::Internal::Synchronization::parking_control"*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)*** %2, align 8, !tbaa !42
  %3 = load i1 (%"struct.Halide::Runtime::Internal::Synchronization::parking_control"*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)*, i1 (%"struct.Halide::Runtime::Internal::Synchronization::parking_control"*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)** %vtable, align 8
  %call2 = call zeroext i1 %3(%"struct.Halide::Runtime::Internal::Synchronization::parking_control"* nonnull align 8 dereferenceable(8) %this, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"* nonnull align 8 dereferenceable(16) %action) #12
  br i1 %call2, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %state.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %call, i32 0, i32 0, i32 0
  %4 = atomicrmw and i64* %state.i, i64 -2 release, align 8
  %and.i = and i64 %4, 2
  %cmp.i = icmp ne i64 %and.i, 0
  %cmp3.not.i = icmp ult i64 %4, 4
  %or.cond.i = or i1 %cmp3.not.i, %cmp.i
  br i1 %or.cond.i, label %cleanup, label %if.then.i

if.then.i:                                        ; preds = %if.then
  %mutex = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %call, i32 0, i32 0
  call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* nonnull align 8 dereferenceable(8) %mutex) #12
  br label %cleanup

if.end:                                           ; preds = %entry
  store %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* null, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %next.i, align 8, !tbaa !86
  store i64 %addr, i64* %sleep_address.i, align 8, !tbaa !113
  store i8 1, i8* %should_park.i.i, align 8, !tbaa !96
  %head = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %call, i32 0, i32 1
  %5 = load %"struct.Halide::Runtime::Internal::Synchronization::queue_data"*, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %head, align 8, !tbaa !117
  %cmp.not = icmp eq %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %5, null
  %tail = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %call, i32 0, i32 2
  %6 = load %"struct.Halide::Runtime::Internal::Synchronization::queue_data"*, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %tail, align 8
  %next4 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %6, i32 0, i32 2
  %head.sink = select i1 %cmp.not, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %head, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %next4
  store %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %queue_data, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %head.sink, align 8, !tbaa !11
  store %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %queue_data, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %tail, align 8, !tbaa !91
  %state.i22 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %call, i32 0, i32 0, i32 0
  %7 = atomicrmw and i64* %state.i22, i64 -2 release, align 8
  %and.i23 = and i64 %7, 2
  %cmp.i24 = icmp ne i64 %and.i23, 0
  %cmp3.not.i25 = icmp ult i64 %7, 4
  %or.cond.i26 = or i1 %cmp3.not.i25, %cmp.i24
  br i1 %or.cond.i26, label %_ZN6Halide7Runtime8Internal15Synchronization9word_lock6unlockEv.exit28, label %if.then.i27

if.then.i27:                                      ; preds = %if.end
  %mutex8 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %call, i32 0, i32 0
  call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* nonnull align 8 dereferenceable(8) %mutex8) #12
  br label %_ZN6Halide7Runtime8Internal15Synchronization9word_lock6unlockEv.exit28

_ZN6Halide7Runtime8Internal15Synchronization9word_lock6unlockEv.exit28: ; preds = %if.then.i27, %if.end
  %8 = bitcast %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* %this to void (%"struct.Halide::Runtime::Internal::Synchronization::parking_control"*)***
  %vtable9 = load void (%"struct.Halide::Runtime::Internal::Synchronization::parking_control"*)**, void (%"struct.Halide::Runtime::Internal::Synchronization::parking_control"*)*** %8, align 8, !tbaa !42
  %vfn10 = getelementptr inbounds void (%"struct.Halide::Runtime::Internal::Synchronization::parking_control"*)*, void (%"struct.Halide::Runtime::Internal::Synchronization::parking_control"*)** %vtable9, i32 1
  %9 = load void (%"struct.Halide::Runtime::Internal::Synchronization::parking_control"*)*, void (%"struct.Halide::Runtime::Internal::Synchronization::parking_control"*)** %vfn10, align 8
  call void %9(%"struct.Halide::Runtime::Internal::Synchronization::parking_control"* nonnull align 8 dereferenceable(8) %this) #12
  %call.i = call i32 @pthread_mutex_lock(%struct.pthread_mutex_t* nonnull %mutex2.i.i) #12
  %10 = load i8, i8* %should_park.i.i, align 8, !tbaa !96, !range !18
  %tobool.not6.i = icmp eq i8 %10, 0
  br i1 %tobool.not6.i, label %_ZN6Halide7Runtime8Internal15Synchronization13thread_parker4parkEv.exit, label %while.body.i

while.body.i:                                     ; preds = %while.body.i, %_ZN6Halide7Runtime8Internal15Synchronization9word_lock6unlockEv.exit28
  %call3.i = call i32 @pthread_cond_wait(%struct.pthread_mutex_t* nonnull %condvar3.i.i, %struct.pthread_mutex_t* nonnull %mutex2.i.i) #12
  %11 = load i8, i8* %should_park.i.i, align 8, !tbaa !96, !range !18
  %tobool.not.i = icmp eq i8 %11, 0
  br i1 %tobool.not.i, label %_ZN6Halide7Runtime8Internal15Synchronization13thread_parker4parkEv.exit, label %while.body.i, !llvm.loop !105

_ZN6Halide7Runtime8Internal15Synchronization13thread_parker4parkEv.exit: ; preds = %while.body.i, %_ZN6Halide7Runtime8Internal15Synchronization9word_lock6unlockEv.exit28
  %call5.i = call i32 @pthread_mutex_unlock(%struct.pthread_mutex_t* nonnull %mutex2.i.i) #12
  br label %cleanup

cleanup:                                          ; preds = %_ZN6Halide7Runtime8Internal15Synchronization13thread_parker4parkEv.exit, %if.then.i, %if.then
  %unpark_info.i.sink = phi i64* [ %unpark_info.i, %_ZN6Halide7Runtime8Internal15Synchronization13thread_parker4parkEv.exit ], [ %invalid_unpark_info.i, %if.then ], [ %invalid_unpark_info.i, %if.then.i ]
  %12 = load i64, i64* %unpark_info.i.sink, align 8, !tbaa !19
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %1) #10
  %call.i.i30 = call i32 @pthread_cond_destroy(%struct.pthread_mutex_t* nonnull %condvar3.i.i) #12
  %call2.i.i = call i32 @pthread_mutex_destroy(%struct.pthread_mutex_t* nonnull %mutex2.i.i) #12
  call void @llvm.lifetime.end.p0i8(i64 160, i8* nonnull %0) #10
  ret i64 %12
}

; Function Attrs: mustprogress nounwind
define linkonce_odr zeroext i1 @_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control8validateERNS2_15validate_actionE(%"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* nonnull align 8 dereferenceable(24) %this, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"* nonnull align 8 dereferenceable(16) %action) unnamed_addr #0 comdat align 2 {
entry:
  %cond_state = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %this, i32 0, i32 1
  %0 = load i64*, i64** %cond_state, align 8, !tbaa !110
  %1 = load atomic i64, i64* %0 monotonic, align 8
  %cmp = icmp eq i64 %1, 0
  %mutex = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %this, i32 0, i32 2
  %2 = load %"class.Halide::Runtime::Internal::Synchronization::word_lock"*, %"class.Halide::Runtime::Internal::Synchronization::word_lock"** %mutex, align 8, !tbaa !112
  %3 = ptrtoint %"class.Halide::Runtime::Internal::Synchronization::word_lock"* %2 to i32
  %4 = zext i32 %3 to i64
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store atomic i64 %4, i64* %0 monotonic, align 8
  br label %cleanup

if.else:                                          ; preds = %entry
  %cmp4.not = icmp eq i64 %1, %4
  br i1 %cmp4.not, label %cleanup, label %if.then5

if.then5:                                         ; preds = %if.else
  %invalid_unpark_info = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::validate_action", %"struct.Halide::Runtime::Internal::Synchronization::validate_action"* %action, i32 0, i32 2
  store i64 %4, i64* %invalid_unpark_info, align 8, !tbaa !116
  br label %cleanup

cleanup:                                          ; preds = %if.then5, %if.else, %if.then
  %retval.0 = phi i1 [ false, %if.then5 ], [ true, %if.else ], [ true, %if.then ]
  ret i1 %retval.0
}

; Function Attrs: nounwind
define linkonce_odr void @_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control12before_sleepEv(%"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* nonnull align 8 dereferenceable(24) %this) unnamed_addr #3 comdat align 2 {
entry:
  %control.i.i = alloca %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", align 8
  %mutex = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %this, i32 0, i32 2
  %0 = load %"class.Halide::Runtime::Internal::Synchronization::word_lock"*, %"class.Halide::Runtime::Internal::Synchronization::word_lock"** %mutex, align 8, !tbaa !112
  %state.i = getelementptr inbounds %"class.Halide::Runtime::Internal::Synchronization::word_lock", %"class.Halide::Runtime::Internal::Synchronization::word_lock"* %0, i32 0, i32 0
  %1 = cmpxchg weak i64* %state.i, i64 1, i64 0 release monotonic, align 8
  %2 = extractvalue { i64, i1 } %1, 1
  br i1 %2, label %_ZN6Halide7Runtime8Internal15Synchronization10fast_mutex6unlockEv.exit, label %if.then.i

if.then.i:                                        ; preds = %entry
  %3 = cmpxchg i64* %state.i, i64 1, i64 0 release monotonic, align 8
  %4 = extractvalue { i64, i1 } %3, 1
  br i1 %4, label %_ZN6Halide7Runtime8Internal15Synchronization10fast_mutex6unlockEv.exit, label %if.end.i.i

if.end.i.i:                                       ; preds = %if.then.i
  %5 = bitcast %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %control.i.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %5) #10
  %6 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %control.i.i, i32 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [6 x i8*] }, { [6 x i8*] }* @_ZTVN6Halide7Runtime8Internal15Synchronization21mutex_parking_controlE, i32 0, inrange i32 0, i32 2) to i32 (...)**), i32 (...)*** %6, align 8, !tbaa !42
  %lock_state2.i.i.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %control.i.i, i32 0, i32 1
  store i64* %state.i, i64** %lock_state2.i.i.i, align 8, !tbaa !44
  %7 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %control.i.i, i32 0, i32 0
  %8 = ptrtoint %"class.Halide::Runtime::Internal::Synchronization::word_lock"* %0 to i32
  %9 = zext i32 %8 to i64
  %call3.i.i = call i64 @_ZN6Halide7Runtime8Internal15Synchronization15parking_control10unpark_oneEy(%"struct.Halide::Runtime::Internal::Synchronization::parking_control"* nonnull align 8 dereferenceable(8) %7, i64 %9) #12
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %5) #10
  br label %_ZN6Halide7Runtime8Internal15Synchronization10fast_mutex6unlockEv.exit

_ZN6Halide7Runtime8Internal15Synchronization10fast_mutex6unlockEv.exit: ; preds = %if.end.i.i, %if.then.i, %entry
  ret void
}

; Function Attrs: mustprogress nounwind
define linkonce_odr i64 @_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control6unparkEib(%"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* nonnull align 8 dereferenceable(24) %this, i32 %unparked, i1 zeroext %more_waiters) unnamed_addr #0 comdat align 2 {
entry:
  br i1 %more_waiters, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %cond_state = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %this, i32 0, i32 1
  %0 = load i64*, i64** %cond_state, align 8, !tbaa !110
  store atomic i64 0, i64* %0 monotonic, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret i64 0
}

; Function Attrs: nounwind
define linkonce i32 @_ZN6Halide7Runtime8Internal15Synchronization15parking_control14unpark_requeueEyyy(%"struct.Halide::Runtime::Internal::Synchronization::parking_control"* nonnull align 8 dereferenceable(8) %this, i64 %addr_from, i64 %addr_to, i64 %unpark_info) local_unnamed_addr #3 align 2 {
entry:
  %buckets = alloca %"struct.Halide::Runtime::Internal::Synchronization::bucket_pair", align 8
  %action = alloca %"struct.Halide::Runtime::Internal::Synchronization::validate_action", align 8
  %0 = bitcast %"struct.Halide::Runtime::Internal::Synchronization::bucket_pair"* %buckets to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %0) #10
  call void @_ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEyy(%"struct.Halide::Runtime::Internal::Synchronization::bucket_pair"* nonnull sret(%"struct.Halide::Runtime::Internal::Synchronization::bucket_pair") align 8 %buckets, i64 %addr_from, i64 %addr_to) #13
  %1 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::validate_action", %"struct.Halide::Runtime::Internal::Synchronization::validate_action"* %action, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %1) #10
  store i8 0, i8* %1, align 8, !tbaa !114
  %invalid_unpark_info.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::validate_action", %"struct.Halide::Runtime::Internal::Synchronization::validate_action"* %action, i32 0, i32 2
  store i64 0, i64* %invalid_unpark_info.i, align 8, !tbaa !116
  %2 = bitcast %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* %this to i1 (%"struct.Halide::Runtime::Internal::Synchronization::parking_control"*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)***
  %vtable = load i1 (%"struct.Halide::Runtime::Internal::Synchronization::parking_control"*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)**, i1 (%"struct.Halide::Runtime::Internal::Synchronization::parking_control"*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)*** %2, align 8, !tbaa !42
  %3 = load i1 (%"struct.Halide::Runtime::Internal::Synchronization::parking_control"*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)*, i1 (%"struct.Halide::Runtime::Internal::Synchronization::parking_control"*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)** %vtable, align 8
  %call = call zeroext i1 %3(%"struct.Halide::Runtime::Internal::Synchronization::parking_control"* nonnull align 8 dereferenceable(8) %this, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"* nonnull align 8 dereferenceable(16) %action) #12
  br i1 %call, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  call void @_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE(%"struct.Halide::Runtime::Internal::Synchronization::bucket_pair"* nonnull align 8 dereferenceable(16) %buckets) #13
  br label %cleanup

if.end:                                           ; preds = %entry
  %from = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::bucket_pair", %"struct.Halide::Runtime::Internal::Synchronization::bucket_pair"* %buckets, i32 0, i32 0
  %4 = load %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"*, %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"** %from, align 8, !tbaa !118
  %head = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %4, i32 0, i32 1
  %5 = load %"struct.Halide::Runtime::Internal::Synchronization::queue_data"*, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %head, align 8, !tbaa !11
  %cmp.not92 = icmp eq %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %5, null
  br i1 %cmp.not92, label %if.end38, label %while.body

while.body:                                       ; preds = %if.end22, %if.end
  %wakeup.098 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ %wakeup.2, %if.end22 ], [ null, %if.end ]
  %requeue_tail.097 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ %requeue_tail.2, %if.end22 ], [ null, %if.end ]
  %requeue.096 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ %requeue.3, %if.end22 ], [ null, %if.end ]
  %data.095 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ %7, %if.end22 ], [ %5, %if.end ]
  %prev.094 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ %prev.1, %if.end22 ], [ null, %if.end ]
  %data_location.093 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** [ %data_location.1, %if.end22 ], [ %head, %if.end ]
  %sleep_address = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %data.095, i32 0, i32 1
  %6 = load atomic i64, i64* %sleep_address monotonic, align 8
  %next2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %data.095, i32 0, i32 2
  %7 = load %"struct.Halide::Runtime::Internal::Synchronization::queue_data"*, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %next2, align 8, !tbaa !86
  %cmp3 = icmp eq i64 %6, %addr_from
  br i1 %cmp3, label %if.then4, label %if.end22

if.then4:                                         ; preds = %while.body
  store %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %7, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %data_location.093, align 8, !tbaa !11
  %8 = load %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"*, %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"** %from, align 8, !tbaa !118
  %tail = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %8, i32 0, i32 2
  %9 = load %"struct.Halide::Runtime::Internal::Synchronization::queue_data"*, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %tail, align 8, !tbaa !91
  %cmp6 = icmp eq %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %9, %data.095
  br i1 %cmp6, label %if.then7, label %if.end10

if.then7:                                         ; preds = %if.then4
  store %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %prev.094, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %tail, align 8, !tbaa !91
  br label %if.end10

if.end10:                                         ; preds = %if.then7, %if.then4
  %10 = load i8, i8* %1, align 8, !tbaa !114, !range !18
  %tobool = icmp ne i8 %10, 0
  %cmp11 = icmp eq %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %wakeup.098, null
  %or.cond = select i1 %tobool, i1 %cmp11, i1 false
  br i1 %or.cond, label %if.end22, label %if.else

if.else:                                          ; preds = %if.end10
  %cmp13 = icmp eq %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %requeue.096, null
  br i1 %cmp13, label %if.end17, label %if.else15

if.else15:                                        ; preds = %if.else
  %next16 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %requeue_tail.097, i32 0, i32 2
  store %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %data.095, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %next16, align 8, !tbaa !86
  br label %if.end17

if.end17:                                         ; preds = %if.else15, %if.else
  %requeue.1 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ %requeue.096, %if.else15 ], [ %data.095, %if.else ]
  store atomic i64 %addr_to, i64* %sleep_address monotonic, align 8
  br label %if.end22

if.end22:                                         ; preds = %if.end17, %if.end10, %while.body
  %data_location.1 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** [ %data_location.093, %if.end10 ], [ %data_location.093, %if.end17 ], [ %next2, %while.body ]
  %prev.1 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ %prev.094, %if.end10 ], [ %prev.094, %if.end17 ], [ %data.095, %while.body ]
  %requeue.3 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ %requeue.096, %if.end10 ], [ %requeue.1, %if.end17 ], [ %requeue.096, %while.body ]
  %requeue_tail.2 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ %requeue_tail.097, %if.end10 ], [ %data.095, %if.end17 ], [ %requeue_tail.097, %while.body ]
  %wakeup.2 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ %data.095, %if.end10 ], [ %wakeup.098, %if.end17 ], [ %wakeup.098, %while.body ]
  %cmp.not = icmp eq %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %7, null
  br i1 %cmp.not, label %while.end, label %while.body, !llvm.loop !120

while.end:                                        ; preds = %if.end22
  %cmp23.not = icmp eq %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %requeue.3, null
  br i1 %cmp23.not, label %if.end38, label %if.then24

if.then24:                                        ; preds = %while.end
  %next25 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %requeue_tail.2, i32 0, i32 2
  store %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* null, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %next25, align 8, !tbaa !86
  %to = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::bucket_pair", %"struct.Halide::Runtime::Internal::Synchronization::bucket_pair"* %buckets, i32 0, i32 1
  %11 = load %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"*, %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"** %to, align 8, !tbaa !121
  %head26 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %11, i32 0, i32 1
  %12 = load %"struct.Halide::Runtime::Internal::Synchronization::queue_data"*, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %head26, align 8, !tbaa !117
  %cmp27 = icmp eq %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %12, null
  br i1 %cmp27, label %if.end35, label %if.else31

if.else31:                                        ; preds = %if.then24
  %tail33 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %11, i32 0, i32 2
  %13 = load %"struct.Halide::Runtime::Internal::Synchronization::queue_data"*, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %tail33, align 8, !tbaa !91
  %next34 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %13, i32 0, i32 2
  br label %if.end35

if.end35:                                         ; preds = %if.else31, %if.then24
  %next34.sink = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** [ %next34, %if.else31 ], [ %head26, %if.then24 ]
  store %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %requeue.3, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %next34.sink, align 8, !tbaa !11
  %tail37 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %11, i32 0, i32 2
  store %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %requeue_tail.2, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %tail37, align 8, !tbaa !91
  br label %if.end38

if.end38:                                         ; preds = %if.end35, %while.end, %if.end
  %cmp23106 = phi i1 [ true, %if.end35 ], [ false, %while.end ], [ false, %if.end ]
  %wakeup.0.lcssa105 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ %wakeup.2, %if.end35 ], [ %wakeup.2, %while.end ], [ null, %if.end ]
  %cmp39 = icmp ne %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %wakeup.0.lcssa105, null
  %14 = bitcast %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* %this to void (%"struct.Halide::Runtime::Internal::Synchronization::parking_control"*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*, i1, i1)***
  %vtable41 = load void (%"struct.Halide::Runtime::Internal::Synchronization::parking_control"*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*, i1, i1)**, void (%"struct.Halide::Runtime::Internal::Synchronization::parking_control"*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*, i1, i1)*** %14, align 8, !tbaa !42
  %vfn42 = getelementptr inbounds void (%"struct.Halide::Runtime::Internal::Synchronization::parking_control"*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*, i1, i1)*, void (%"struct.Halide::Runtime::Internal::Synchronization::parking_control"*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*, i1, i1)** %vtable41, i32 3
  %15 = load void (%"struct.Halide::Runtime::Internal::Synchronization::parking_control"*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*, i1, i1)*, void (%"struct.Halide::Runtime::Internal::Synchronization::parking_control"*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*, i1, i1)** %vfn42, align 8
  call void %15(%"struct.Halide::Runtime::Internal::Synchronization::parking_control"* nonnull align 8 dereferenceable(8) %this, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"* nonnull align 8 dereferenceable(16) %action, i1 zeroext %cmp39, i1 zeroext %cmp23106) #12
  br i1 %cmp39, label %if.then44, label %if.else48

if.then44:                                        ; preds = %if.end38
  %unpark_info45 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %wakeup.0.lcssa105, i32 0, i32 3
  store i64 %unpark_info, i64* %unpark_info45, align 8, !tbaa !95
  %mutex.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %wakeup.0.lcssa105, i32 0, i32 0, i32 0
  %call.i = call i32 @pthread_mutex_lock(%struct.pthread_mutex_t* nonnull %mutex.i) #12
  call void @_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE(%"struct.Halide::Runtime::Internal::Synchronization::bucket_pair"* nonnull align 8 dereferenceable(16) %buckets) #13
  %should_park.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %wakeup.0.lcssa105, i32 0, i32 0, i32 2
  store i8 0, i8* %should_park.i, align 8, !tbaa !96
  %condvar.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %wakeup.0.lcssa105, i32 0, i32 0, i32 1
  %call.i88 = call i32 @pthread_cond_signal(%struct.pthread_mutex_t* nonnull %condvar.i) #12
  %call.i90 = call i32 @pthread_mutex_unlock(%struct.pthread_mutex_t* nonnull %mutex.i) #12
  br label %if.end49

if.else48:                                        ; preds = %if.end38
  call void @_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE(%"struct.Halide::Runtime::Internal::Synchronization::bucket_pair"* nonnull align 8 dereferenceable(16) %buckets) #13
  br label %if.end49

if.end49:                                         ; preds = %if.else48, %if.then44
  %16 = load i8, i8* %1, align 8
  %17 = and i8 %16, 1
  %tobool52 = icmp ne i8 %17, 0
  %18 = select i1 %cmp39, i1 %tobool52, i1 false
  %conv = zext i1 %18 to i32
  br label %cleanup

cleanup:                                          ; preds = %if.end49, %if.then
  %retval.0 = phi i32 [ %conv, %if.end49 ], [ 0, %if.then ]
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %1) #10
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %0) #10
  ret i32 %retval.0
}

; Function Attrs: nounwind
define linkonce void @_ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEyy(%"struct.Halide::Runtime::Internal::Synchronization::bucket_pair"* noalias sret(%"struct.Halide::Runtime::Internal::Synchronization::bucket_pair") align 8 %agg.result, i64 %addr_from, i64 %addr_to) local_unnamed_addr #3 {
entry:
  %mul.i = mul i64 %addr_from, -7046029254386353131
  %shr.i = lshr i64 %mul.i, 54
  %mul.i37 = mul i64 %addr_to, -7046029254386353131
  %shr.i38 = lshr i64 %mul.i37, 54
  %cmp = icmp eq i64 %shr.i, %shr.i38
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %0 = trunc i64 %shr.i to i32
  %arrayidx = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_table", %"struct.Halide::Runtime::Internal::Synchronization::hash_table"* @_ZN6Halide7Runtime8Internal15Synchronization5tableE, i32 0, i32 0, i32 %0
  %state.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %arrayidx, i32 0, i32 0, i32 0
  %1 = cmpxchg weak i64* %state.i, i64 0, i64 1 acquire monotonic, align 8
  %2 = extractvalue { i64, i1 } %1, 1
  br i1 %2, label %cleanup, label %cleanup.sink.split

if.else:                                          ; preds = %entry
  %cmp2 = icmp ult i64 %shr.i, %shr.i38
  br i1 %cmp2, label %if.then3, label %if.else9

if.then3:                                         ; preds = %if.else
  %3 = trunc i64 %shr.i to i32
  %arrayidx5 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_table", %"struct.Halide::Runtime::Internal::Synchronization::hash_table"* @_ZN6Halide7Runtime8Internal15Synchronization5tableE, i32 0, i32 0, i32 %3
  %4 = trunc i64 %shr.i38 to i32
  %arrayidx6 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_table", %"struct.Halide::Runtime::Internal::Synchronization::hash_table"* @_ZN6Halide7Runtime8Internal15Synchronization5tableE, i32 0, i32 0, i32 %4
  %state.i39 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %arrayidx5, i32 0, i32 0, i32 0
  %5 = cmpxchg weak i64* %state.i39, i64 0, i64 1 acquire monotonic, align 8
  %6 = extractvalue { i64, i1 } %5, 1
  br i1 %6, label %_ZN6Halide7Runtime8Internal15Synchronization9word_lock4lockEv.exit41, label %if.then.i40

if.then.i40:                                      ; preds = %if.then3
  %mutex7 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %arrayidx5, i32 0, i32 0
  tail call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* nonnull align 8 dereferenceable(8) %mutex7) #12
  br label %_ZN6Halide7Runtime8Internal15Synchronization9word_lock4lockEv.exit41

_ZN6Halide7Runtime8Internal15Synchronization9word_lock4lockEv.exit41: ; preds = %if.then.i40, %if.then3
  %state.i42 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %arrayidx6, i32 0, i32 0, i32 0
  %7 = cmpxchg weak i64* %state.i42, i64 0, i64 1 acquire monotonic, align 8
  %8 = extractvalue { i64, i1 } %7, 1
  br i1 %8, label %cleanup, label %cleanup.sink.split

if.else9:                                         ; preds = %if.else
  %9 = trunc i64 %shr.i38 to i32
  %arrayidx11 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_table", %"struct.Halide::Runtime::Internal::Synchronization::hash_table"* @_ZN6Halide7Runtime8Internal15Synchronization5tableE, i32 0, i32 0, i32 %9
  %10 = trunc i64 %shr.i to i32
  %arrayidx13 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_table", %"struct.Halide::Runtime::Internal::Synchronization::hash_table"* @_ZN6Halide7Runtime8Internal15Synchronization5tableE, i32 0, i32 0, i32 %10
  %state.i47 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %arrayidx11, i32 0, i32 0, i32 0
  %11 = cmpxchg weak i64* %state.i47, i64 0, i64 1 acquire monotonic, align 8
  %12 = extractvalue { i64, i1 } %11, 1
  br i1 %12, label %_ZN6Halide7Runtime8Internal15Synchronization9word_lock4lockEv.exit49, label %if.then.i48

if.then.i48:                                      ; preds = %if.else9
  %mutex14 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %arrayidx11, i32 0, i32 0
  tail call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* nonnull align 8 dereferenceable(8) %mutex14) #12
  br label %_ZN6Halide7Runtime8Internal15Synchronization9word_lock4lockEv.exit49

_ZN6Halide7Runtime8Internal15Synchronization9word_lock4lockEv.exit49: ; preds = %if.then.i48, %if.else9
  %state.i50 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %arrayidx13, i32 0, i32 0, i32 0
  %13 = cmpxchg weak i64* %state.i50, i64 0, i64 1 acquire monotonic, align 8
  %14 = extractvalue { i64, i1 } %13, 1
  br i1 %14, label %cleanup, label %cleanup.sink.split

cleanup.sink.split:                               ; preds = %_ZN6Halide7Runtime8Internal15Synchronization9word_lock4lockEv.exit49, %_ZN6Halide7Runtime8Internal15Synchronization9word_lock4lockEv.exit41, %if.then
  %.off0 = phi i32 [ %0, %if.then ], [ %4, %_ZN6Halide7Runtime8Internal15Synchronization9word_lock4lockEv.exit41 ], [ %10, %_ZN6Halide7Runtime8Internal15Synchronization9word_lock4lockEv.exit49 ]
  %arrayidx13.sink.ph = phi %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* [ %arrayidx, %if.then ], [ %arrayidx5, %_ZN6Halide7Runtime8Internal15Synchronization9word_lock4lockEv.exit41 ], [ %arrayidx13, %_ZN6Halide7Runtime8Internal15Synchronization9word_lock4lockEv.exit49 ]
  %arrayidx11.sink.ph = phi %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* [ %arrayidx, %if.then ], [ %arrayidx6, %_ZN6Halide7Runtime8Internal15Synchronization9word_lock4lockEv.exit41 ], [ %arrayidx11, %_ZN6Halide7Runtime8Internal15Synchronization9word_lock4lockEv.exit49 ]
  %mutex15 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_table", %"struct.Halide::Runtime::Internal::Synchronization::hash_table"* @_ZN6Halide7Runtime8Internal15Synchronization5tableE, i32 0, i32 0, i32 %.off0, i32 0
  tail call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* nonnull align 8 dereferenceable(8) %mutex15) #12
  br label %cleanup

cleanup:                                          ; preds = %cleanup.sink.split, %_ZN6Halide7Runtime8Internal15Synchronization9word_lock4lockEv.exit49, %_ZN6Halide7Runtime8Internal15Synchronization9word_lock4lockEv.exit41, %if.then
  %arrayidx13.sink = phi %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* [ %arrayidx, %if.then ], [ %arrayidx5, %_ZN6Halide7Runtime8Internal15Synchronization9word_lock4lockEv.exit41 ], [ %arrayidx13, %_ZN6Halide7Runtime8Internal15Synchronization9word_lock4lockEv.exit49 ], [ %arrayidx13.sink.ph, %cleanup.sink.split ]
  %arrayidx11.sink = phi %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* [ %arrayidx, %if.then ], [ %arrayidx6, %_ZN6Halide7Runtime8Internal15Synchronization9word_lock4lockEv.exit41 ], [ %arrayidx11, %_ZN6Halide7Runtime8Internal15Synchronization9word_lock4lockEv.exit49 ], [ %arrayidx11.sink.ph, %cleanup.sink.split ]
  %from2.i53 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::bucket_pair", %"struct.Halide::Runtime::Internal::Synchronization::bucket_pair"* %agg.result, i32 0, i32 0
  store %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %arrayidx13.sink, %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"** %from2.i53, align 8, !tbaa !11
  %to3.i54 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::bucket_pair", %"struct.Halide::Runtime::Internal::Synchronization::bucket_pair"* %agg.result, i32 0, i32 1
  store %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %arrayidx11.sink, %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"** %to3.i54, align 8, !tbaa !11
  ret void
}

; Function Attrs: mustprogress nounwind
define linkonce void @_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE(%"struct.Halide::Runtime::Internal::Synchronization::bucket_pair"* nonnull align 8 dereferenceable(16) %buckets) local_unnamed_addr #0 {
entry:
  %from = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::bucket_pair", %"struct.Halide::Runtime::Internal::Synchronization::bucket_pair"* %buckets, i32 0, i32 0
  %0 = load %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"*, %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"** %from, align 8, !tbaa !118
  %to = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::bucket_pair", %"struct.Halide::Runtime::Internal::Synchronization::bucket_pair"* %buckets, i32 0, i32 1
  %1 = load %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"*, %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"** %to, align 8, !tbaa !121
  %cmp = icmp eq %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %0, %1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %state.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %0, i32 0, i32 0, i32 0
  %2 = atomicrmw and i64* %state.i, i64 -2 release, align 8
  %and.i = and i64 %2, 2
  %cmp.i = icmp ne i64 %and.i, 0
  %cmp3.not.i = icmp ult i64 %2, 4
  %or.cond.i = or i1 %cmp3.not.i, %cmp.i
  br i1 %or.cond.i, label %if.end15, label %if.end15.sink.split

if.else:                                          ; preds = %entry
  %cmp4 = icmp ugt %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %0, %1
  br i1 %cmp4, label %if.then5, label %if.else10

if.then5:                                         ; preds = %if.else
  %state.i25 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %0, i32 0, i32 0, i32 0
  %3 = atomicrmw and i64* %state.i25, i64 -2 release, align 8
  %and.i26 = and i64 %3, 2
  %cmp.i27 = icmp ne i64 %and.i26, 0
  %cmp3.not.i28 = icmp ult i64 %3, 4
  %or.cond.i29 = or i1 %cmp3.not.i28, %cmp.i27
  br i1 %or.cond.i29, label %_ZN6Halide7Runtime8Internal15Synchronization9word_lock6unlockEv.exit31, label %if.then.i30

if.then.i30:                                      ; preds = %if.then5
  %mutex7 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %0, i32 0, i32 0
  tail call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* nonnull align 8 dereferenceable(8) %mutex7) #12
  br label %_ZN6Halide7Runtime8Internal15Synchronization9word_lock6unlockEv.exit31

_ZN6Halide7Runtime8Internal15Synchronization9word_lock6unlockEv.exit31: ; preds = %if.then.i30, %if.then5
  %4 = load %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"*, %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"** %to, align 8, !tbaa !121
  %state.i32 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %4, i32 0, i32 0, i32 0
  %5 = atomicrmw and i64* %state.i32, i64 -2 release, align 8
  %and.i33 = and i64 %5, 2
  %cmp.i34 = icmp ne i64 %and.i33, 0
  %cmp3.not.i35 = icmp ult i64 %5, 4
  %or.cond.i36 = or i1 %cmp3.not.i35, %cmp.i34
  br i1 %or.cond.i36, label %if.end15, label %if.end15.sink.split

if.else10:                                        ; preds = %if.else
  %state.i39 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %1, i32 0, i32 0, i32 0
  %6 = atomicrmw and i64* %state.i39, i64 -2 release, align 8
  %and.i40 = and i64 %6, 2
  %cmp.i41 = icmp ne i64 %and.i40, 0
  %cmp3.not.i42 = icmp ult i64 %6, 4
  %or.cond.i43 = or i1 %cmp3.not.i42, %cmp.i41
  br i1 %or.cond.i43, label %_ZN6Halide7Runtime8Internal15Synchronization9word_lock6unlockEv.exit45, label %if.then.i44

if.then.i44:                                      ; preds = %if.else10
  %mutex12 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %1, i32 0, i32 0
  tail call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* nonnull align 8 dereferenceable(8) %mutex12) #12
  br label %_ZN6Halide7Runtime8Internal15Synchronization9word_lock6unlockEv.exit45

_ZN6Halide7Runtime8Internal15Synchronization9word_lock6unlockEv.exit45: ; preds = %if.then.i44, %if.else10
  %7 = load %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"*, %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"** %from, align 8, !tbaa !118
  %state.i46 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %7, i32 0, i32 0, i32 0
  %8 = atomicrmw and i64* %state.i46, i64 -2 release, align 8
  %and.i47 = and i64 %8, 2
  %cmp.i48 = icmp ne i64 %and.i47, 0
  %cmp3.not.i49 = icmp ult i64 %8, 4
  %or.cond.i50 = or i1 %cmp3.not.i49, %cmp.i48
  br i1 %or.cond.i50, label %if.end15, label %if.end15.sink.split

if.end15.sink.split:                              ; preds = %_ZN6Halide7Runtime8Internal15Synchronization9word_lock6unlockEv.exit45, %_ZN6Halide7Runtime8Internal15Synchronization9word_lock6unlockEv.exit31, %if.then
  %.sink = phi %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* [ %0, %if.then ], [ %4, %_ZN6Halide7Runtime8Internal15Synchronization9word_lock6unlockEv.exit31 ], [ %7, %_ZN6Halide7Runtime8Internal15Synchronization9word_lock6unlockEv.exit45 ]
  %mutex14 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %.sink, i32 0, i32 0
  tail call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* nonnull align 8 dereferenceable(8) %mutex14) #12
  br label %if.end15

if.end15:                                         ; preds = %if.end15.sink.split, %_ZN6Halide7Runtime8Internal15Synchronization9word_lock6unlockEv.exit45, %_ZN6Halide7Runtime8Internal15Synchronization9word_lock6unlockEv.exit31, %if.then
  ret void
}

; Function Attrs: mustprogress nounwind
define linkonce_odr zeroext i1 @_ZN6Halide7Runtime8Internal15Synchronization25broadcast_parking_control8validateERNS2_15validate_actionE(%"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* nonnull align 8 dereferenceable(24) %this, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"* nonnull align 8 dereferenceable(16) %action) unnamed_addr #0 comdat align 2 {
entry:
  %cond_state = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %this, i32 0, i32 1
  %0 = load i64*, i64** %cond_state, align 8, !tbaa !107
  %1 = load atomic i64, i64* %0 monotonic, align 8
  %mutex = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %this, i32 0, i32 2
  %2 = load %"class.Halide::Runtime::Internal::Synchronization::word_lock"*, %"class.Halide::Runtime::Internal::Synchronization::word_lock"** %mutex, align 8, !tbaa !109
  %3 = ptrtoint %"class.Halide::Runtime::Internal::Synchronization::word_lock"* %2 to i32
  %4 = zext i32 %3 to i64
  %cmp.not = icmp eq i64 %1, %4
  br i1 %cmp.not, label %if.end, label %cleanup

if.end:                                           ; preds = %entry
  store atomic i64 0, i64* %0 monotonic, align 8
  %5 = load %"class.Halide::Runtime::Internal::Synchronization::word_lock"*, %"class.Halide::Runtime::Internal::Synchronization::word_lock"** %mutex, align 8, !tbaa !109
  %state.i = getelementptr inbounds %"class.Halide::Runtime::Internal::Synchronization::word_lock", %"class.Halide::Runtime::Internal::Synchronization::word_lock"* %5, i32 0, i32 0
  %6 = load atomic i64, i64* %state.i monotonic, align 8
  %and11.i = and i64 %6, 1
  %tobool.not12.i = icmp eq i64 %and11.i, 0
  br i1 %tobool.not12.i, label %_ZN6Halide7Runtime8Internal15Synchronization10fast_mutex21make_parked_if_lockedEv.exit, label %if.end.i

if.end.i:                                         ; preds = %_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_131atomic_cas_weak_relaxed_relaxedEPyS4_S4_.exit.i, %if.end
  %val.013.i = phi i64 [ %9, %_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_131atomic_cas_weak_relaxed_relaxedEPyS4_S4_.exit.i ], [ %6, %if.end ]
  %or.i = or i64 %val.013.i, 2
  %7 = cmpxchg weak i64* %state.i, i64 %val.013.i, i64 %or.i monotonic monotonic, align 8
  %8 = extractvalue { i64, i1 } %7, 1
  br i1 %8, label %_ZN6Halide7Runtime8Internal15Synchronization10fast_mutex21make_parked_if_lockedEv.exit, label %_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_131atomic_cas_weak_relaxed_relaxedEPyS4_S4_.exit.i

_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_131atomic_cas_weak_relaxed_relaxedEPyS4_S4_.exit.i: ; preds = %if.end.i
  %9 = extractvalue { i64, i1 } %7, 0
  %and.i = and i64 %9, 1
  %tobool.not.i = icmp eq i64 %and.i, 0
  br i1 %tobool.not.i, label %_ZN6Halide7Runtime8Internal15Synchronization10fast_mutex21make_parked_if_lockedEv.exit, label %if.end.i

_ZN6Halide7Runtime8Internal15Synchronization10fast_mutex21make_parked_if_lockedEv.exit: ; preds = %_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_131atomic_cas_weak_relaxed_relaxedEPyS4_S4_.exit.i, %if.end.i, %if.end
  %tobool.not.lcssa.i = phi i8 [ 1, %if.end ], [ 1, %_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_131atomic_cas_weak_relaxed_relaxedEPyS4_S4_.exit.i ], [ 0, %if.end.i ]
  %unpark_one = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::validate_action", %"struct.Halide::Runtime::Internal::Synchronization::validate_action"* %action, i32 0, i32 0
  store i8 %tobool.not.lcssa.i, i8* %unpark_one, align 8, !tbaa !114
  br label %cleanup

cleanup:                                          ; preds = %_ZN6Halide7Runtime8Internal15Synchronization10fast_mutex21make_parked_if_lockedEv.exit, %entry
  ret i1 %cmp.not
}

; Function Attrs: mustprogress nounwind
define linkonce_odr i64 @_ZN6Halide7Runtime8Internal15Synchronization15parking_control6unparkEib(%"struct.Halide::Runtime::Internal::Synchronization::parking_control"* nonnull align 8 dereferenceable(8) %this, i32 %unparked, i1 zeroext %more_waiters) unnamed_addr #0 comdat align 2 {
entry:
  ret i64 0
}

; Function Attrs: mustprogress nounwind
define linkonce_odr void @_ZN6Halide7Runtime8Internal15Synchronization25broadcast_parking_control16requeue_callbackERKNS2_15validate_actionEbb(%"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* nonnull align 8 dereferenceable(24) %this, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"* nonnull align 8 dereferenceable(16) %action, i1 zeroext %one_to_wake, i1 zeroext %some_requeued) unnamed_addr #0 comdat align 2 {
entry:
  %unpark_one = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::validate_action", %"struct.Halide::Runtime::Internal::Synchronization::validate_action"* %action, i32 0, i32 0
  %0 = load i8, i8* %unpark_one, align 8, !tbaa !114, !range !18
  %tobool.not = icmp eq i8 %0, 0
  %some_requeued.not = xor i1 %some_requeued, true
  %brmerge = select i1 %tobool.not, i1 true, i1 %some_requeued.not
  br i1 %brmerge, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %mutex = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %this, i32 0, i32 2
  %1 = load %"class.Halide::Runtime::Internal::Synchronization::word_lock"*, %"class.Halide::Runtime::Internal::Synchronization::word_lock"** %mutex, align 8, !tbaa !109
  %state.i = getelementptr inbounds %"class.Halide::Runtime::Internal::Synchronization::word_lock", %"class.Halide::Runtime::Internal::Synchronization::word_lock"* %1, i32 0, i32 0
  %2 = atomicrmw or i64* %state.i, i64 2 monotonic, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: mustprogress nounwind
define linkonce i32 @_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv() local_unnamed_addr #0 {
entry:
  %call = tail call i8* @getenv(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i32 0, i32 0)) #12
  %tobool.not = icmp eq i8* %call, null
  br i1 %tobool.not, label %if.end, label %cond.true

if.end:                                           ; preds = %entry
  %call1 = tail call i8* @getenv(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i32 0, i32 0)) #12
  %tobool2.not = icmp eq i8* %call1, null
  br i1 %tobool2.not, label %cond.false, label %cond.true

cond.true:                                        ; preds = %if.end, %entry
  %threads_str.010 = phi i8* [ %call1, %if.end ], [ %call, %entry ]
  %call3 = tail call i32 @atoi(i8* nonnull %threads_str.010) #12
  br label %cond.end

cond.false:                                       ; preds = %if.end
  %call4 = tail call i32 @halide_host_cpu_count() #12
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call3, %cond.true ], [ %call4, %cond.false ]
  ret i32 %cond
}

; Function Attrs: mustprogress nounwind
define linkonce void @_ZN6Halide7Runtime8Internal13worker_threadEPv(i8* %arg) #0 {
entry:
  tail call void @halide_mutex_lock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 0)) #13
  %0 = bitcast i8* %arg to %"struct.Halide::Runtime::Internal::work"*
  tail call void @_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE(%"struct.Halide::Runtime::Internal::work"* %0) #13
  tail call void @halide_mutex_unlock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 0)) #13
  ret void
}

; Function Attrs: mustprogress nounwind
define weak %struct.halide_thread* @halide_spawn_thread(void (i8*)* %f, i8* %closure) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @malloc(i64 24) #12
  %f1 = bitcast i8* %call to void (i8*)**
  store void (i8*)* %f, void (i8*)** %f1, align 8, !tbaa !122
  %closure2 = getelementptr inbounds i8, i8* %call, i32 8
  %0 = bitcast i8* %closure2 to i8**
  store i8* %closure, i8** %0, align 8, !tbaa !125
  %handle = getelementptr inbounds i8, i8* %call, i32 16
  %1 = bitcast i8* %handle to i64*
  store i64 0, i64* %1, align 8, !tbaa !126
  %call4 = tail call i32 @pthread_create(i64* nonnull %1, i8* null, i8* (i8*)* nonnull @_ZN6Halide7Runtime8Internal19spawn_thread_helperEPv, i8* %call) #12
  %2 = bitcast i8* %call to %struct.halide_thread*
  ret %struct.halide_thread* %2
}

; Function Attrs: mustprogress nounwind
define linkonce i8* @_ZN6Halide7Runtime8Internal19spawn_thread_helperEPv(i8* %arg) #0 {
entry:
  %f = bitcast i8* %arg to void (i8*)**
  %0 = load void (i8*)*, void (i8*)** %f, align 8, !tbaa !122
  %closure = getelementptr inbounds i8, i8* %arg, i32 8
  %1 = bitcast i8* %closure to i8**
  %2 = load i8*, i8** %1, align 8, !tbaa !125
  tail call void %0(i8* %2) #12
  ret i8* null
}

declare i32 @pthread_create(i64*, i8*, i8* (i8*)*, i8*) local_unnamed_addr #1

declare i8* @getenv(i8*) local_unnamed_addr #1

declare i32 @atoi(i8*) local_unnamed_addr #1

; Function Attrs: mustprogress nounwind
define weak i32 @halide_default_do_parallel_tasks(i8* %user_context, i32 %num_tasks, %struct.halide_parallel_task_t* %tasks, i8* %task_parent) #0 {
entry:
  %0 = alloca %"struct.Halide::Runtime::Internal::work", i32 %num_tasks, align 8
  %cmp73 = icmp sgt i32 %num_tasks, 0
  br i1 %cmp73, label %for.body, label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.inc, %entry
  %num_tasks.addr.0.lcssa = phi i32 [ %num_tasks, %entry ], [ %num_tasks.addr.1, %for.inc ]
  %cmp17 = icmp eq i32 %num_tasks.addr.0.lcssa, 0
  br i1 %cmp17, label %cleanup, label %if.end19

for.body:                                         ; preds = %for.inc, %entry
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %entry ]
  %num_tasks.addr.075 = phi i32 [ %num_tasks.addr.1, %for.inc ], [ %num_tasks, %entry ]
  %tasks.addr.074 = phi %struct.halide_parallel_task_t* [ %tasks.addr.1, %for.inc ], [ %tasks, %entry ]
  %extent = getelementptr inbounds %struct.halide_parallel_task_t, %struct.halide_parallel_task_t* %tasks.addr.074, i32 0, i32 6
  %1 = load i32, i32* %extent, align 8, !tbaa !127
  %cmp1 = icmp slt i32 %1, 1
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %dec = add nsw i32 %num_tasks.addr.075, -1
  br label %for.inc

if.end:                                           ; preds = %for.body
  %incdec.ptr = getelementptr inbounds %struct.halide_parallel_task_t, %struct.halide_parallel_task_t* %tasks.addr.074, i32 1
  %2 = trunc i64 %indvars.iv to i32
  %arrayidx = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %0, i32 %2
  %3 = bitcast %"struct.Halide::Runtime::Internal::work"* %arrayidx to i8*
  %4 = bitcast %struct.halide_parallel_task_t* %tasks.addr.074 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(56) %3, i8* noundef nonnull align 8 dereferenceable(56) %4, i64 56, i1 false), !tbaa.struct !128
  %task_fn = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %0, i32 %2, i32 1
  store i32 (i8*, i32, i8*)* null, i32 (i8*, i32, i8*)** %task_fn, align 8, !tbaa !33
  %user_context6 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %0, i32 %2, i32 7
  store i8* %user_context, i8** %user_context6, align 8, !tbaa !34
  %exit_status = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %0, i32 %2, i32 9
  store i32 0, i32* %exit_status, align 4, !tbaa !35
  %active_workers = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %0, i32 %2, i32 8
  store i32 0, i32* %active_workers, align 8, !tbaa !36
  %next_semaphore = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %0, i32 %2, i32 10
  store i32 0, i32* %next_semaphore, align 8, !tbaa !37
  %owner_is_sleeping = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %0, i32 %2, i32 11
  store i8 0, i8* %owner_is_sleeping, align 4, !tbaa !38
  %parent_job = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %0, i32 %2, i32 5
  %5 = bitcast %"struct.Halide::Runtime::Internal::work"** %parent_job to i8**
  store i8* %task_parent, i8** %5, align 8, !tbaa !41
  br label %for.inc

for.inc:                                          ; preds = %if.end, %if.then
  %tasks.addr.1 = phi %struct.halide_parallel_task_t* [ %tasks.addr.074, %if.then ], [ %incdec.ptr, %if.end ]
  %num_tasks.addr.1 = phi i32 [ %dec, %if.then ], [ %num_tasks.addr.075, %if.end ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %6 = sext i32 %num_tasks.addr.1 to i64
  %cmp = icmp slt i64 %indvars.iv.next, %6
  br i1 %cmp, label %for.body, label %for.cond.cleanup, !llvm.loop !129

if.end19:                                         ; preds = %for.cond.cleanup
  tail call void @halide_mutex_lock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 0)) #13
  %7 = bitcast i8* %task_parent to %"struct.Halide::Runtime::Internal::work"*
  call void @_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_(i32 %num_tasks.addr.0.lcssa, %"struct.Halide::Runtime::Internal::work"* nonnull %0, %"struct.Halide::Runtime::Internal::work"* %7) #13
  %cmp2378 = icmp sgt i32 %num_tasks.addr.0.lcssa, 0
  br i1 %cmp2378, label %for.body25.preheader, label %for.cond.cleanup24

for.body25.preheader:                             ; preds = %if.end19
  %wide.trip.count = zext i32 %num_tasks.addr.0.lcssa to i64
  %8 = add nsw i64 %wide.trip.count, -1
  %xtraiter = and i64 %wide.trip.count, 7
  %9 = icmp ult i64 %8, 7
  br i1 %9, label %for.cond.cleanup24.loopexit.unr-lcssa, label %for.body25.preheader.new

for.body25.preheader.new:                         ; preds = %for.body25.preheader
  %unroll_iter = and i64 %wide.trip.count, 4294967288
  br label %for.body25

for.cond.cleanup24.loopexit.unr-lcssa:            ; preds = %for.body25, %for.body25.preheader
  %spec.select.lcssa.ph = phi i32 [ undef, %for.body25.preheader ], [ %spec.select.7, %for.body25 ]
  %indvars.iv82.unr = phi i64 [ 0, %for.body25.preheader ], [ %indvars.iv.next83.7, %for.body25 ]
  %exit_status20.079.unr = phi i32 [ 0, %for.body25.preheader ], [ %spec.select.7, %for.body25 ]
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod.not, label %for.cond.cleanup24, label %for.body25.epil

for.body25.epil:                                  ; preds = %for.body25.epil, %for.cond.cleanup24.loopexit.unr-lcssa
  %indvars.iv82.epil = phi i64 [ %indvars.iv.next83.epil, %for.body25.epil ], [ %indvars.iv82.unr, %for.cond.cleanup24.loopexit.unr-lcssa ]
  %exit_status20.079.epil = phi i32 [ %spec.select.epil, %for.body25.epil ], [ %exit_status20.079.unr, %for.cond.cleanup24.loopexit.unr-lcssa ]
  %epil.iter = phi i64 [ %epil.iter.sub, %for.body25.epil ], [ %xtraiter, %for.cond.cleanup24.loopexit.unr-lcssa ]
  %10 = trunc i64 %indvars.iv82.epil to i32
  %add.ptr.epil = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %0, i32 %10
  call void @_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE(%"struct.Halide::Runtime::Internal::work"* nonnull %add.ptr.epil) #13
  %exit_status28.epil = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %0, i32 %10, i32 9
  %11 = load i32, i32* %exit_status28.epil, align 4, !tbaa !35
  %cmp29.not.epil = icmp eq i32 %11, 0
  %spec.select.epil = select i1 %cmp29.not.epil, i32 %exit_status20.079.epil, i32 %11
  %indvars.iv.next83.epil = add nuw nsw i64 %indvars.iv82.epil, 1
  %epil.iter.sub = add i64 %epil.iter, -1
  %epil.iter.cmp.not = icmp eq i64 %epil.iter.sub, 0
  br i1 %epil.iter.cmp.not, label %for.cond.cleanup24, label %for.body25.epil, !llvm.loop !130

for.cond.cleanup24:                               ; preds = %for.body25.epil, %for.cond.cleanup24.loopexit.unr-lcssa, %if.end19
  %exit_status20.0.lcssa = phi i32 [ 0, %if.end19 ], [ %spec.select.lcssa.ph, %for.cond.cleanup24.loopexit.unr-lcssa ], [ %spec.select.epil, %for.body25.epil ]
  call void @halide_mutex_unlock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 0)) #13
  br label %cleanup

for.body25:                                       ; preds = %for.body25, %for.body25.preheader.new
  %indvars.iv82 = phi i64 [ 0, %for.body25.preheader.new ], [ %indvars.iv.next83.7, %for.body25 ]
  %exit_status20.079 = phi i32 [ 0, %for.body25.preheader.new ], [ %spec.select.7, %for.body25 ]
  %niter = phi i64 [ %unroll_iter, %for.body25.preheader.new ], [ %niter.nsub.7, %for.body25 ]
  %12 = trunc i64 %indvars.iv82 to i32
  %add.ptr = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %0, i32 %12
  call void @_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE(%"struct.Halide::Runtime::Internal::work"* nonnull %add.ptr) #13
  %exit_status28 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %0, i32 %12, i32 9
  %13 = load i32, i32* %exit_status28, align 8, !tbaa !35
  %cmp29.not = icmp eq i32 %13, 0
  %spec.select = select i1 %cmp29.not, i32 %exit_status20.079, i32 %13
  %14 = trunc i64 %indvars.iv82 to i32
  %15 = or i32 %14, 1
  %add.ptr.1 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %0, i32 %15
  call void @_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE(%"struct.Halide::Runtime::Internal::work"* nonnull %add.ptr.1) #13
  %exit_status28.1 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %0, i32 %15, i32 9
  %16 = load i32, i32* %exit_status28.1, align 4, !tbaa !35
  %cmp29.not.1 = icmp eq i32 %16, 0
  %spec.select.1 = select i1 %cmp29.not.1, i32 %spec.select, i32 %16
  %17 = trunc i64 %indvars.iv82 to i32
  %18 = or i32 %17, 2
  %add.ptr.2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %0, i32 %18
  call void @_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE(%"struct.Halide::Runtime::Internal::work"* nonnull %add.ptr.2) #13
  %exit_status28.2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %0, i32 %18, i32 9
  %19 = load i32, i32* %exit_status28.2, align 8, !tbaa !35
  %cmp29.not.2 = icmp eq i32 %19, 0
  %spec.select.2 = select i1 %cmp29.not.2, i32 %spec.select.1, i32 %19
  %20 = trunc i64 %indvars.iv82 to i32
  %21 = or i32 %20, 3
  %add.ptr.3 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %0, i32 %21
  call void @_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE(%"struct.Halide::Runtime::Internal::work"* nonnull %add.ptr.3) #13
  %exit_status28.3 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %0, i32 %21, i32 9
  %22 = load i32, i32* %exit_status28.3, align 4, !tbaa !35
  %cmp29.not.3 = icmp eq i32 %22, 0
  %spec.select.3 = select i1 %cmp29.not.3, i32 %spec.select.2, i32 %22
  %23 = trunc i64 %indvars.iv82 to i32
  %24 = or i32 %23, 4
  %add.ptr.4 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %0, i32 %24
  call void @_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE(%"struct.Halide::Runtime::Internal::work"* nonnull %add.ptr.4) #13
  %exit_status28.4 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %0, i32 %24, i32 9
  %25 = load i32, i32* %exit_status28.4, align 8, !tbaa !35
  %cmp29.not.4 = icmp eq i32 %25, 0
  %spec.select.4 = select i1 %cmp29.not.4, i32 %spec.select.3, i32 %25
  %26 = trunc i64 %indvars.iv82 to i32
  %27 = or i32 %26, 5
  %add.ptr.5 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %0, i32 %27
  call void @_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE(%"struct.Halide::Runtime::Internal::work"* nonnull %add.ptr.5) #13
  %exit_status28.5 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %0, i32 %27, i32 9
  %28 = load i32, i32* %exit_status28.5, align 4, !tbaa !35
  %cmp29.not.5 = icmp eq i32 %28, 0
  %spec.select.5 = select i1 %cmp29.not.5, i32 %spec.select.4, i32 %28
  %29 = trunc i64 %indvars.iv82 to i32
  %30 = or i32 %29, 6
  %add.ptr.6 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %0, i32 %30
  call void @_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE(%"struct.Halide::Runtime::Internal::work"* nonnull %add.ptr.6) #13
  %exit_status28.6 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %0, i32 %30, i32 9
  %31 = load i32, i32* %exit_status28.6, align 8, !tbaa !35
  %cmp29.not.6 = icmp eq i32 %31, 0
  %spec.select.6 = select i1 %cmp29.not.6, i32 %spec.select.5, i32 %31
  %32 = trunc i64 %indvars.iv82 to i32
  %33 = or i32 %32, 7
  %add.ptr.7 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %0, i32 %33
  call void @_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE(%"struct.Halide::Runtime::Internal::work"* nonnull %add.ptr.7) #13
  %exit_status28.7 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %0, i32 %33, i32 9
  %34 = load i32, i32* %exit_status28.7, align 4, !tbaa !35
  %cmp29.not.7 = icmp eq i32 %34, 0
  %spec.select.7 = select i1 %cmp29.not.7, i32 %spec.select.6, i32 %34
  %indvars.iv.next83.7 = add nuw nsw i64 %indvars.iv82, 8
  %niter.nsub.7 = add i64 %niter, -8
  %niter.ncmp.7 = icmp eq i64 %niter.nsub.7, 0
  br i1 %niter.ncmp.7, label %for.cond.cleanup24.loopexit.unr-lcssa, label %for.body25, !llvm.loop !131

cleanup:                                          ; preds = %for.cond.cleanup24, %for.cond.cleanup
  %retval.0 = phi i32 [ %exit_status20.0.lcssa, %for.cond.cleanup24 ], [ 0, %for.cond.cleanup ]
  ret i32 %retval.0
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: mustprogress nounwind
define weak i32 @halide_default_semaphore_init(%struct.halide_semaphore_t* %s, i32 %n) #0 {
entry:
  %value = bitcast %struct.halide_semaphore_t* %s to i32*
  store atomic i32 %n, i32* %value release, align 4
  ret i32 %n
}

; Function Attrs: mustprogress nounwind
define weak i32 @halide_default_semaphore_release(%struct.halide_semaphore_t* %s, i32 %n) #0 {
entry:
  %value = bitcast %struct.halide_semaphore_t* %s to i32*
  %0 = atomicrmw add i32* %value, i32 %n acq_rel, align 4
  %cmp = icmp eq i32 %0, 0
  %cmp1 = icmp ne i32 %n, 0
  %or.cond = select i1 %cmp, i1 %cmp1, i1 false
  br i1 %or.cond, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @halide_mutex_lock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 0)) #13
  tail call void @halide_cond_broadcast(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 8)) #13
  tail call void @halide_cond_broadcast(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 10)) #13
  tail call void @halide_mutex_unlock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 0)) #13
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %add = add nsw i32 %0, %n
  ret i32 %add
}

; Function Attrs: mustprogress nounwind
define weak void @halide_thread_pool_cleanup() #0 {
entry:
  tail call void @halide_shutdown_thread_pool() #13
  ret void
}

; Function Attrs: mustprogress nounwind
define weak void @halide_shutdown_thread_pool() local_unnamed_addr #0 {
entry:
  %0 = load i8, i8* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 15), align 1, !tbaa !48, !range !18
  %tobool.not = icmp eq i8 %0, 0
  br i1 %tobool.not, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @halide_mutex_lock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 0)) #13
  store i8 1, i8* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 14), align 8, !tbaa !68
  tail call void @halide_cond_broadcast(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 10)) #13
  tail call void @halide_cond_broadcast(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 8)) #13
  tail call void @halide_cond_broadcast(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 9)) #13
  tail call void @halide_mutex_unlock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 0)) #13
  %1 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 4), align 8, !tbaa !55
  %cmp4 = icmp sgt i32 %1, 0
  br i1 %cmp4, label %for.body, label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.body, %if.then
  %call.i = tail call i8* @memset(i8* nonnull bitcast (i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 2) to i8*), i32 0, i64 2116) #12
  br label %if.end

for.body:                                         ; preds = %for.body, %if.then
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ 0, %if.then ]
  %2 = trunc i64 %indvars.iv to i32
  %arrayidx = getelementptr inbounds %"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 13, i32 %2
  %3 = load %struct.halide_thread*, %struct.halide_thread** %arrayidx, align 8, !tbaa !11
  tail call void @halide_join_thread(%struct.halide_thread* %3) #13
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %4 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 4), align 8, !tbaa !55
  %5 = sext i32 %4 to i64
  %cmp = icmp slt i64 %indvars.iv.next, %5
  br i1 %cmp, label %for.body, label %for.cond.cleanup, !llvm.loop !132

if.end:                                           ; preds = %for.cond.cleanup, %entry
  ret void
}

declare i8* @memset(i8*, i32, i64) local_unnamed_addr #1

; Function Attrs: mustprogress nounwind
define weak void @halide_join_thread(%struct.halide_thread* %thread_arg) local_unnamed_addr #0 {
entry:
  %ret = alloca i8*, align 8
  %0 = bitcast %struct.halide_thread* %thread_arg to %"struct.Halide::Runtime::Internal::spawned_thread"*
  %1 = bitcast i8** %ret to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %1) #10
  store i8* null, i8** %ret, align 8, !tbaa !11
  %handle = getelementptr inbounds %"struct.Halide::Runtime::Internal::spawned_thread", %"struct.Halide::Runtime::Internal::spawned_thread"* %0, i32 0, i32 2
  %2 = load i64, i64* %handle, align 8, !tbaa !126
  %call = call i32 @pthread_join(i64 %2, i8** nonnull %ret) #12
  %3 = bitcast %struct.halide_thread* %thread_arg to i8*
  call void @free(i8* %3) #12
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %1) #10
  ret void
}

declare i32 @pthread_join(i64, i8**) local_unnamed_addr #1

; Function Attrs: nounwind
define weak void @halide_cond_signal(%struct.halide_mutex* %cond) local_unnamed_addr #3 {
entry:
  %control.i = alloca %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", align 8
  %state.i = getelementptr %struct.halide_mutex, %struct.halide_mutex* %cond, i32 0, i32 0, i32 0
  %0 = load atomic i64, i64* %state.i monotonic, align 8
  %cmp.i = icmp eq i64 %0, 0
  br i1 %cmp.i, label %_ZN6Halide7Runtime8Internal15Synchronization9fast_cond6signalEv.exit, label %if.end.i

if.end.i:                                         ; preds = %entry
  %1 = bitcast %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %control.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %1) #10
  %2 = trunc i64 %0 to i32
  %3 = inttoptr i32 %2 to %"class.Halide::Runtime::Internal::Synchronization::word_lock"*
  %4 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %control.i, i32 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [6 x i8*] }, { [6 x i8*] }* @_ZTVN6Halide7Runtime8Internal15Synchronization22signal_parking_controlE, i32 0, inrange i32 0, i32 2) to i32 (...)**), i32 (...)*** %4, align 8, !tbaa !42
  %cond_state2.i.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %control.i, i32 0, i32 1
  store i64* %state.i, i64** %cond_state2.i.i, align 8, !tbaa !133
  %mutex3.i.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %control.i, i32 0, i32 2
  store %"class.Halide::Runtime::Internal::Synchronization::word_lock"* %3, %"class.Halide::Runtime::Internal::Synchronization::word_lock"** %mutex3.i.i, align 8, !tbaa !135
  %5 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %control.i, i32 0, i32 0
  %6 = ptrtoint %struct.halide_mutex* %cond to i32
  %7 = zext i32 %6 to i64
  %call.i = call i64 @_ZN6Halide7Runtime8Internal15Synchronization15parking_control10unpark_oneEy(%"struct.Halide::Runtime::Internal::Synchronization::parking_control"* nonnull align 8 dereferenceable(8) %5, i64 %7) #12
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %1) #10
  br label %_ZN6Halide7Runtime8Internal15Synchronization9fast_cond6signalEv.exit

_ZN6Halide7Runtime8Internal15Synchronization9fast_cond6signalEv.exit: ; preds = %if.end.i, %entry
  ret void
}

; Function Attrs: mustprogress nounwind
define linkonce_odr zeroext i1 @_ZN6Halide7Runtime8Internal15Synchronization15parking_control8validateERNS2_15validate_actionE(%"struct.Halide::Runtime::Internal::Synchronization::parking_control"* nonnull align 8 dereferenceable(8) %this, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"* nonnull align 8 dereferenceable(16) %action) unnamed_addr #0 comdat align 2 {
entry:
  ret i1 true
}

; Function Attrs: mustprogress nounwind
define linkonce_odr i64 @_ZN6Halide7Runtime8Internal15Synchronization22signal_parking_control6unparkEib(%"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* nonnull align 8 dereferenceable(24) %this, i32 %unparked, i1 zeroext %more_waiters) unnamed_addr #0 comdat align 2 {
entry:
  br i1 %more_waiters, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %cond_state = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %this, i32 0, i32 1
  %0 = load i64*, i64** %cond_state, align 8, !tbaa !133
  store atomic i64 0, i64* %0 monotonic, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret i64 0
}

; Function Attrs: mustprogress nounwind
define weak %struct.halide_mutex_array* @halide_mutex_array_create(i32 %sz) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @halide_malloc(i8* null, i64 8) #12
  %0 = bitcast i8* %call to %struct.halide_mutex_array*
  %cmp = icmp eq i8* %call, null
  br i1 %cmp, label %cleanup, label %if.end

if.end:                                           ; preds = %entry
  %conv = sext i32 %sz to i64
  %mul = shl nsw i64 %conv, 3
  %call1 = tail call i8* @halide_malloc(i8* null, i64 %mul) #12
  %1 = bitcast i8* %call to i8**
  store i8* %call1, i8** %1, align 8, !tbaa !136
  %cmp4 = icmp eq i8* %call1, null
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  tail call void @halide_free(i8* null, i8* nonnull %call) #12
  br label %cleanup

if.end6:                                          ; preds = %if.end
  %call10 = tail call i8* @memset(i8* nonnull %call1, i32 0, i64 %mul) #12
  br label %cleanup

cleanup:                                          ; preds = %if.end6, %if.then5, %entry
  %retval.0 = phi %struct.halide_mutex_array* [ null, %if.then5 ], [ %0, %if.end6 ], [ null, %entry ]
  ret %struct.halide_mutex_array* %retval.0
}

; Function Attrs: mustprogress nounwind
define weak void @halide_mutex_array_destroy(i8* %user_context, i8* %array) local_unnamed_addr #0 {
entry:
  %0 = bitcast i8* %array to i8**
  %1 = load i8*, i8** %0, align 8, !tbaa !136
  tail call void @halide_free(i8* %user_context, i8* %1) #12
  tail call void @halide_free(i8* %user_context, i8* %array) #12
  ret void
}

; Function Attrs: mustprogress nounwind
define weak i32 @halide_mutex_array_lock(%struct.halide_mutex_array* %array, i32 %entry1) local_unnamed_addr #0 {
entry:
  %array2 = getelementptr inbounds %struct.halide_mutex_array, %struct.halide_mutex_array* %array, i32 0, i32 0
  %0 = load %struct.halide_mutex*, %struct.halide_mutex** %array2, align 8, !tbaa !136
  %arrayidx = getelementptr inbounds %struct.halide_mutex, %struct.halide_mutex* %0, i32 %entry1
  tail call void @halide_mutex_lock(%struct.halide_mutex* %arrayidx) #13
  ret i32 0
}

; Function Attrs: mustprogress nounwind
define weak i32 @halide_mutex_array_unlock(%struct.halide_mutex_array* %array, i32 %entry1) local_unnamed_addr #0 {
entry:
  %array2 = getelementptr inbounds %struct.halide_mutex_array, %struct.halide_mutex_array* %array, i32 0, i32 0
  %0 = load %struct.halide_mutex*, %struct.halide_mutex** %array2, align 8, !tbaa !136
  %arrayidx = getelementptr inbounds %struct.halide_mutex, %struct.halide_mutex* %0, i32 %entry1
  tail call void @halide_mutex_unlock(%struct.halide_mutex* %arrayidx) #13
  ret i32 0
}

; Function Attrs: mustprogress nounwind
define weak i32 @halide_set_num_threads(i32 %n) local_unnamed_addr #0 {
entry:
  %cmp = icmp slt i32 %n, 0
  br i1 %cmp, label %if.end.thread, label %if.end

if.end.thread:                                    ; preds = %entry
  tail call void @halide_error(i8* null, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.4, i32 0, i32 0)) #12
  tail call void @halide_mutex_lock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 0)) #13
  br label %if.end3

if.end:                                           ; preds = %entry
  tail call void @halide_mutex_lock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 0)) #13
  %cmp1 = icmp eq i32 %n, 0
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  %call = tail call i32 @_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv() #13
  br label %if.end3

if.end3:                                          ; preds = %if.then2, %if.end, %if.end.thread
  %n.addr.0 = phi i32 [ %call, %if.then2 ], [ %n, %if.end ], [ %n, %if.end.thread ]
  %0 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 1), align 8, !tbaa !52
  %1 = icmp sgt i32 %n.addr.0, 1
  %.threads.i = select i1 %1, i32 %n.addr.0, i32 1
  %2 = icmp slt i32 %.threads.i, 256
  %retval.0.i = select i1 %2, i32 %.threads.i, i32 256
  store i32 %retval.0.i, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 1), align 8, !tbaa !52
  tail call void @halide_mutex_unlock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i32 0, i32 0)) #13
  ret i32 %0
}

; Function Attrs: mustprogress nounwind
define weak i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)* @halide_set_custom_do_task(i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)* %f) local_unnamed_addr #0 {
entry:
  %0 = load i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)*, i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)** @_ZN6Halide7Runtime8Internal14custom_do_taskE, align 8, !tbaa !11
  store i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)* %f, i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)** @_ZN6Halide7Runtime8Internal14custom_do_taskE, align 8, !tbaa !11
  ret i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)* %0
}

; Function Attrs: mustprogress nounwind
define weak i32 (i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*)* @halide_set_custom_do_loop_task(i32 (i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*)* %f) local_unnamed_addr #0 {
entry:
  %0 = load i32 (i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*)*, i32 (i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*)** @_ZN6Halide7Runtime8Internal19custom_do_loop_taskE, align 8, !tbaa !11
  store i32 (i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*)* %f, i32 (i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*)** @_ZN6Halide7Runtime8Internal19custom_do_loop_taskE, align 8, !tbaa !11
  ret i32 (i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*)* %0
}

; Function Attrs: mustprogress nounwind
define weak i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)* @halide_set_custom_do_par_for(i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)* %f) local_unnamed_addr #0 {
entry:
  %0 = load i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)*, i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)** @_ZN6Halide7Runtime8Internal17custom_do_par_forE, align 8, !tbaa !11
  store i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)* %f, i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)** @_ZN6Halide7Runtime8Internal17custom_do_par_forE, align 8, !tbaa !11
  ret i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)* %0
}

; Function Attrs: mustprogress nounwind
define weak void @halide_set_custom_parallel_runtime(i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)* %do_par_for, i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)* %do_task, i32 (i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*)* %do_loop_task, i32 (i8*, i32, %struct.halide_parallel_task_t*, i8*)* %do_parallel_tasks, i32 (%struct.halide_semaphore_t*, i32)* %semaphore_init, i1 (%struct.halide_semaphore_t*, i32)* %semaphore_try_acquire, i32 (%struct.halide_semaphore_t*, i32)* %semaphore_release) local_unnamed_addr #0 {
entry:
  store i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)* %do_par_for, i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)** @_ZN6Halide7Runtime8Internal17custom_do_par_forE, align 8, !tbaa !11
  store i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)* %do_task, i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)** @_ZN6Halide7Runtime8Internal14custom_do_taskE, align 8, !tbaa !11
  store i32 (i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*)* %do_loop_task, i32 (i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*)** @_ZN6Halide7Runtime8Internal19custom_do_loop_taskE, align 8, !tbaa !11
  store i32 (i8*, i32, %struct.halide_parallel_task_t*, i8*)* %do_parallel_tasks, i32 (i8*, i32, %struct.halide_parallel_task_t*, i8*)** @_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE, align 8, !tbaa !11
  store i32 (%struct.halide_semaphore_t*, i32)* %semaphore_init, i32 (%struct.halide_semaphore_t*, i32)** @_ZN6Halide7Runtime8Internal21custom_semaphore_initE, align 8, !tbaa !11
  store i1 (%struct.halide_semaphore_t*, i32)* %semaphore_try_acquire, i1 (%struct.halide_semaphore_t*, i32)** @_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE, align 8, !tbaa !11
  store i32 (%struct.halide_semaphore_t*, i32)* %semaphore_release, i32 (%struct.halide_semaphore_t*, i32)** @_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE, align 8, !tbaa !11
  ret void
}

; Function Attrs: mustprogress nounwind
define weak i32 @halide_do_par_for(i8* %user_context, i32 (i8*, i32, i8*)* %f, i32 %min, i32 %size, i8* noalias %closure) local_unnamed_addr #0 {
entry:
  %0 = load i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)*, i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)** @_ZN6Halide7Runtime8Internal17custom_do_par_forE, align 8, !tbaa !11
  %call = tail call i32 %0(i8* %user_context, i32 (i8*, i32, i8*)* %f, i32 %min, i32 %size, i8* %closure) #12
  ret i32 %call
}

; Function Attrs: mustprogress nounwind
define weak i32 @halide_do_parallel_tasks(i8* %user_context, i32 %num_tasks, %struct.halide_parallel_task_t* %tasks, i8* %task_parent) local_unnamed_addr #0 {
entry:
  %0 = load i32 (i8*, i32, %struct.halide_parallel_task_t*, i8*)*, i32 (i8*, i32, %struct.halide_parallel_task_t*, i8*)** @_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE, align 8, !tbaa !11
  %call = tail call i32 %0(i8* %user_context, i32 %num_tasks, %struct.halide_parallel_task_t* %tasks, i8* %task_parent) #12
  ret i32 %call
}

; Function Attrs: mustprogress nounwind
define weak i32 @halide_semaphore_init(%struct.halide_semaphore_t* %sema, i32 %count) local_unnamed_addr #0 {
entry:
  %0 = load i32 (%struct.halide_semaphore_t*, i32)*, i32 (%struct.halide_semaphore_t*, i32)** @_ZN6Halide7Runtime8Internal21custom_semaphore_initE, align 8, !tbaa !11
  %call = tail call i32 %0(%struct.halide_semaphore_t* %sema, i32 %count) #12
  ret i32 %call
}

; Function Attrs: mustprogress nounwind
define weak i32 @halide_semaphore_release(%struct.halide_semaphore_t* %sema, i32 %count) local_unnamed_addr #0 {
entry:
  %0 = load i32 (%struct.halide_semaphore_t*, i32)*, i32 (%struct.halide_semaphore_t*, i32)** @_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE, align 8, !tbaa !11
  %call = tail call i32 %0(%struct.halide_semaphore_t* %sema, i32 %count) #12
  ret i32 %call
}

; Function Attrs: mustprogress nounwind
define weak zeroext i1 @halide_semaphore_try_acquire(%struct.halide_semaphore_t* %sema, i32 %count) local_unnamed_addr #0 {
entry:
  %0 = load i1 (%struct.halide_semaphore_t*, i32)*, i1 (%struct.halide_semaphore_t*, i32)** @_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE, align 8, !tbaa !11
  %call = tail call zeroext i1 %0(%struct.halide_semaphore_t* %sema, i32 %count) #12
  ret i1 %call
}

; Function Attrs: mustprogress nounwind
define weak i8* @halide_default_get_symbol(i8* %name) #0 {
entry:
  %call = tail call i8* @dlsym(i8* null, i8* %name) #12
  ret i8* %call
}

declare i8* @dlsym(i8*, i8*) local_unnamed_addr #1

; Function Attrs: mustprogress nounwind
define weak i8* @halide_default_load_library(i8* %name) #0 {
entry:
  %call = tail call i8* @dlopen(i8* %name, i32 1) #12
  %tobool.not = icmp eq i8* %call, null
  br i1 %tobool.not, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call3 = tail call i8* @dlerror() #12
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret i8* %call
}

declare i8* @dlopen(i8*, i32) local_unnamed_addr #1

declare i8* @dlerror() local_unnamed_addr #1

; Function Attrs: mustprogress nounwind
define weak i8* @halide_default_get_library_symbol(i8* %lib, i8* %name) #0 {
entry:
  %call = tail call i8* @dlsym(i8* %lib, i8* %name) #12
  ret i8* %call
}

; Function Attrs: mustprogress nounwind
define weak i8* (i8*)* @halide_set_custom_get_symbol(i8* (i8*)* %f) local_unnamed_addr #0 {
entry:
  %0 = load i8* (i8*)*, i8* (i8*)** @_ZN6Halide7Runtime8Internal17custom_get_symbolE, align 8, !tbaa !11
  store i8* (i8*)* %f, i8* (i8*)** @_ZN6Halide7Runtime8Internal17custom_get_symbolE, align 8, !tbaa !11
  ret i8* (i8*)* %0
}

; Function Attrs: mustprogress nounwind
define weak i8* (i8*)* @halide_set_custom_load_library(i8* (i8*)* %f) local_unnamed_addr #0 {
entry:
  %0 = load i8* (i8*)*, i8* (i8*)** @_ZN6Halide7Runtime8Internal19custom_load_libraryE, align 8, !tbaa !11
  store i8* (i8*)* %f, i8* (i8*)** @_ZN6Halide7Runtime8Internal19custom_load_libraryE, align 8, !tbaa !11
  ret i8* (i8*)* %0
}

; Function Attrs: mustprogress nounwind
define weak i8* (i8*, i8*)* @halide_set_custom_get_library_symbol(i8* (i8*, i8*)* %f) local_unnamed_addr #0 {
entry:
  %0 = load i8* (i8*, i8*)*, i8* (i8*, i8*)** @_ZN6Halide7Runtime8Internal25custom_get_library_symbolE, align 8, !tbaa !11
  store i8* (i8*, i8*)* %f, i8* (i8*, i8*)** @_ZN6Halide7Runtime8Internal25custom_get_library_symbolE, align 8, !tbaa !11
  ret i8* (i8*, i8*)* %0
}

; Function Attrs: mustprogress nounwind
define weak i8* @halide_get_symbol(i8* %name) local_unnamed_addr #0 {
entry:
  %0 = load i8* (i8*)*, i8* (i8*)** @_ZN6Halide7Runtime8Internal17custom_get_symbolE, align 8, !tbaa !11
  %call = tail call i8* %0(i8* %name) #12
  ret i8* %call
}

; Function Attrs: mustprogress nounwind
define weak i8* @halide_load_library(i8* %name) local_unnamed_addr #0 {
entry:
  %0 = load i8* (i8*)*, i8* (i8*)** @_ZN6Halide7Runtime8Internal19custom_load_libraryE, align 8, !tbaa !11
  %call = tail call i8* %0(i8* %name) #12
  ret i8* %call
}

; Function Attrs: mustprogress nounwind
define weak i8* @halide_get_library_symbol(i8* %lib, i8* %name) local_unnamed_addr #0 {
entry:
  %0 = load i8* (i8*, i8*)*, i8* (i8*, i8*)** @_ZN6Halide7Runtime8Internal25custom_get_library_symbolE, align 8, !tbaa !11
  %call = tail call i8* %0(i8* %lib, i8* %name) #12
  ret i8* %call
}

; Function Attrs: mustprogress nounwind
define weak void @halide_set_gpu_device(i32 %d) local_unnamed_addr #0 {
entry:
  store i32 %d, i32* @_ZN6Halide7Runtime8Internal17halide_gpu_deviceE, align 4, !tbaa !79
  store i8 1, i8* @_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE, align 1, !tbaa !16
  ret void
}

; Function Attrs: nounwind
define weak i32 @halide_get_gpu_device(i8* %user_context) local_unnamed_addr #3 {
entry:
  br label %while.cond.i

while.cond.i:                                     ; preds = %while.cond.i, %entry
  %0 = atomicrmw volatile xchg i8* @_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE, i8 1 acquire, align 1
  %tobool.not.i = icmp eq i8 %0, 0
  br i1 %tobool.not.i, label %_ZN6Halide7Runtime8Internal14ScopedSpinLockC2EPVc.exit, label %while.cond.i, !llvm.loop !138

_ZN6Halide7Runtime8Internal14ScopedSpinLockC2EPVc.exit: ; preds = %while.cond.i
  %1 = load i8, i8* @_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE, align 1, !tbaa !16, !range !18
  %tobool.not = icmp eq i8 %1, 0
  br i1 %tobool.not, label %if.then, label %_ZN6Halide7Runtime8Internal14ScopedSpinLockC2EPVc.exit.if.end4_crit_edge

_ZN6Halide7Runtime8Internal14ScopedSpinLockC2EPVc.exit.if.end4_crit_edge: ; preds = %_ZN6Halide7Runtime8Internal14ScopedSpinLockC2EPVc.exit
  %.pre = load i32, i32* @_ZN6Halide7Runtime8Internal17halide_gpu_deviceE, align 4, !tbaa !79
  br label %if.end4

if.then:                                          ; preds = %_ZN6Halide7Runtime8Internal14ScopedSpinLockC2EPVc.exit
  %call = tail call i8* @getenv(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.8, i32 0, i32 0)) #12
  %tobool1.not = icmp eq i8* %call, null
  br i1 %tobool1.not, label %if.end, label %if.then2

if.then2:                                         ; preds = %if.then
  %call3 = tail call i32 @atoi(i8* nonnull %call) #12
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.then
  %storemerge = phi i32 [ %call3, %if.then2 ], [ -1, %if.then ]
  store i32 %storemerge, i32* @_ZN6Halide7Runtime8Internal17halide_gpu_deviceE, align 4, !tbaa !79
  store i8 1, i8* @_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE, align 1, !tbaa !16
  br label %if.end4

if.end4:                                          ; preds = %if.end, %_ZN6Halide7Runtime8Internal14ScopedSpinLockC2EPVc.exit.if.end4_crit_edge
  %2 = phi i32 [ %.pre, %_ZN6Halide7Runtime8Internal14ScopedSpinLockC2EPVc.exit.if.end4_crit_edge ], [ %storemerge, %if.end ]
  store atomic volatile i8 0, i8* @_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE release, align 1
  ret i32 %2
}

; Function Attrs: mustprogress nounwind
define weak i8* @halide_string_to_string(i8* %dst, i8* %end, i8* %arg) local_unnamed_addr #0 {
entry:
  %cmp.not = icmp ult i8* %dst, %end
  br i1 %cmp.not, label %if.end, label %return

if.end:                                           ; preds = %entry
  %tobool.not = icmp eq i8* %arg, null
  %spec.select = select i1 %tobool.not, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.11, i32 0, i32 0), i8* %arg
  br label %if.end5

if.then4:                                         ; preds = %if.end8
  store i8 0, i8* %dst.addr.023, align 1, !tbaa !15
  br label %return

if.end5:                                          ; preds = %if.end8, %if.end
  %arg.addr.124 = phi i8* [ %spec.select, %if.end ], [ %incdec.ptr9, %if.end8 ]
  %dst.addr.023 = phi i8* [ %dst, %if.end ], [ %incdec.ptr, %if.end8 ]
  %0 = load i8, i8* %arg.addr.124, align 1, !tbaa !15
  store i8 %0, i8* %dst.addr.023, align 1, !tbaa !15
  %cmp6 = icmp eq i8 %0, 0
  br i1 %cmp6, label %return, label %if.end8

if.end8:                                          ; preds = %if.end5
  %incdec.ptr = getelementptr inbounds i8, i8* %dst.addr.023, i32 1
  %incdec.ptr9 = getelementptr inbounds i8, i8* %arg.addr.124, i32 1
  %cmp3 = icmp eq i8* %incdec.ptr, %end
  br i1 %cmp3, label %if.then4, label %if.end5, !llvm.loop !139

return:                                           ; preds = %if.end5, %if.then4, %entry
  %retval.0 = phi i8* [ %end, %if.then4 ], [ %dst, %entry ], [ %dst.addr.023, %if.end5 ]
  ret i8* %retval.0
}

; Function Attrs: mustprogress nounwind
define weak i8* @halide_uint64_to_string(i8* %dst, i8* %end, i64 %arg, i32 %min_digits) local_unnamed_addr #0 {
entry:
  %buf = alloca [32 x i8], align 1
  %0 = getelementptr inbounds [32 x i8], [32 x i8]* %buf, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %0) #10
  %arrayidx = getelementptr inbounds [32 x i8], [32 x i8]* %buf, i32 0, i32 31
  store i8 0, i8* %arrayidx, align 1, !tbaa !15
  %add.ptr = getelementptr inbounds [32 x i8], [32 x i8]* %buf, i32 0, i32 30
  %cmp13 = icmp sgt i32 %min_digits, 0
  %tobool14 = icmp ne i64 %arg, 0
  %1 = select i1 %cmp13, i1 true, i1 %tobool14
  br i1 %1, label %for.body, label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.body, %entry
  %digits.0.lcssa = phi i8* [ %add.ptr, %entry ], [ %incdec.ptr, %for.body ]
  %incdec.ptr1 = getelementptr inbounds i8, i8* %digits.0.lcssa, i32 1
  %call = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* nonnull %incdec.ptr1) #13
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %0) #10
  ret i8* %call

for.body:                                         ; preds = %for.body, %entry
  %arg.addr.017 = phi i64 [ %div, %for.body ], [ %arg, %entry ]
  %digits.016 = phi i8* [ %incdec.ptr, %for.body ], [ %add.ptr, %entry ]
  %i.015 = phi i32 [ %inc, %for.body ], [ 0, %entry ]
  %div = udiv i64 %arg.addr.017, 10
  %mul.neg = mul i64 %div, -10
  %sub = add i64 %mul.neg, %arg.addr.017
  %2 = trunc i64 %sub to i8
  %conv = add i8 %2, 48
  store i8 %conv, i8* %digits.016, align 1, !tbaa !15
  %incdec.ptr = getelementptr inbounds i8, i8* %digits.016, i32 -1
  %inc = add nuw nsw i32 %i.015, 1
  %cmp = icmp slt i32 %inc, %min_digits
  %3 = icmp ugt i64 %arg.addr.017, 9
  %4 = select i1 %cmp, i1 true, i1 %3
  br i1 %4, label %for.body, label %for.cond.cleanup, !llvm.loop !140
}

; Function Attrs: mustprogress nounwind
define weak i8* @halide_int64_to_string(i8* %dst, i8* %end, i64 %arg, i32 %min_digits) local_unnamed_addr #0 {
entry:
  %cmp = icmp slt i64 %arg, 0
  %cmp1 = icmp ult i8* %dst, %end
  %or.cond = select i1 %cmp, i1 %cmp1, i1 false
  br i1 %or.cond, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %incdec.ptr = getelementptr inbounds i8, i8* %dst, i32 1
  store i8 45, i8* %dst, align 1, !tbaa !15
  %sub = sub nsw i64 0, %arg
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %arg.addr.0 = phi i64 [ %sub, %if.then ], [ %arg, %entry ]
  %dst.addr.0 = phi i8* [ %incdec.ptr, %if.then ], [ %dst, %entry ]
  %call = tail call i8* @halide_uint64_to_string(i8* %dst.addr.0, i8* %end, i64 %arg.addr.0, i32 %min_digits) #13
  ret i8* %call
}

; Function Attrs: mustprogress nounwind
define weak i8* @halide_double_to_string(i8* %dst, i8* %end, double %arg, i32 %scientific) local_unnamed_addr #0 {
entry:
  %arg.addr = alloca double, align 8
  %bits = alloca i64, align 8
  %buf = alloca [512 x i8], align 1
  store double %arg, double* %arg.addr, align 8, !tbaa !141
  %0 = bitcast i64* %bits to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %0) #10
  store i64 0, i64* %bits, align 8, !tbaa !19
  %1 = bitcast double* %arg.addr to i8*
  %call = call i8* @memcpy(i8* nonnull %0, i8* nonnull %1, i64 8) #12
  %2 = load i64, i64* %bits, align 8, !tbaa !19
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
  %call7 = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1.12, i32 0, i32 0)) #13
  br label %cleanup147

if.else:                                          ; preds = %if.then4
  %call8 = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2.13, i32 0, i32 0)) #13
  br label %cleanup147

if.else9:                                         ; preds = %if.then
  br i1 %tobool10.not, label %if.else13, label %if.then11

if.then11:                                        ; preds = %if.else9
  %call12 = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3.14, i32 0, i32 0)) #13
  br label %cleanup147

if.else13:                                        ; preds = %if.else9
  %call14 = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4.15, i32 0, i32 0)) #13
  br label %cleanup147

if.else15:                                        ; preds = %entry
  %cmp16 = icmp eq i32 %conv, 0
  %cmp17 = icmp eq i64 %and, 0
  %or.cond = select i1 %cmp16, i1 %cmp17, i1 false
  br i1 %or.cond, label %if.then18, label %if.end32

if.then18:                                        ; preds = %if.else15
  %tobool19.not = icmp eq i32 %scientific, 0
  %tobool27.not = icmp sgt i64 %2, -1
  br i1 %tobool19.not, label %if.else26, label %if.then20

if.then20:                                        ; preds = %if.then18
  br i1 %tobool27.not, label %if.else24, label %if.then22

if.then22:                                        ; preds = %if.then20
  %call23 = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.5.16, i32 0, i32 0)) #13
  br label %cleanup147

if.else24:                                        ; preds = %if.then20
  %call25 = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.6.17, i32 0, i32 0)) #13
  br label %cleanup147

if.else26:                                        ; preds = %if.then18
  br i1 %tobool27.not, label %if.else30, label %if.then28

if.then28:                                        ; preds = %if.else26
  %call29 = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.7, i32 0, i32 0)) #13
  br label %cleanup147

if.else30:                                        ; preds = %if.else26
  %call31 = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.8.18, i32 0, i32 0)) #13
  br label %cleanup147

if.end32:                                         ; preds = %if.else15
  %tobool33.not = icmp sgt i64 %2, -1
  br i1 %tobool33.not, label %if.end36, label %if.then34

if.then34:                                        ; preds = %if.end32
  %call35 = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0)) #13
  %4 = load double, double* %arg.addr, align 8, !tbaa !141
  %fneg = fneg double %4
  store double %fneg, double* %arg.addr, align 8, !tbaa !141
  br label %if.end36

if.end36:                                         ; preds = %if.then34, %if.end32
  %dst.addr.0 = phi i8* [ %call35, %if.then34 ], [ %dst, %if.end32 ]
  %tobool37.not = icmp eq i32 %scientific, 0
  br i1 %tobool37.not, label %if.else61, label %while.condthread-pre-split

while.condthread-pre-split:                       ; preds = %if.end36
  %.pr = load double, double* %arg.addr, align 8, !tbaa !141
  %cmp39263 = fcmp olt double %.pr, 1.000000e+00
  br i1 %cmp39263, label %while.body, label %while.cond40thread-pre-split

while.body:                                       ; preds = %while.body, %while.condthread-pre-split
  %exponent_base_10.0264 = phi i32 [ %dec, %while.body ], [ 0, %while.condthread-pre-split ]
  %5 = phi double [ %mul, %while.body ], [ %.pr, %while.condthread-pre-split ]
  %mul = fmul double %5, 1.000000e+01
  %dec = add nsw i32 %exponent_base_10.0264, -1
  %cmp39 = fcmp olt double %mul, 1.000000e+00
  br i1 %cmp39, label %while.body, label %while.cond.while.cond40thread-pre-split_crit_edge, !llvm.loop !143

while.cond.while.cond40thread-pre-split_crit_edge: ; preds = %while.body
  store double %mul, double* %arg.addr, align 8, !tbaa !141
  br label %while.cond40thread-pre-split

while.cond40thread-pre-split:                     ; preds = %while.cond.while.cond40thread-pre-split_crit_edge, %while.condthread-pre-split
  %.pr261 = phi double [ %mul, %while.cond.while.cond40thread-pre-split_crit_edge ], [ %.pr, %while.condthread-pre-split ]
  %exponent_base_10.0.lcssa = phi i32 [ %dec, %while.cond.while.cond40thread-pre-split_crit_edge ], [ 0, %while.condthread-pre-split ]
  %cmp41265 = fcmp ult double %.pr261, 1.000000e+01
  br i1 %cmp41265, label %while.end43, label %while.body42

while.body42:                                     ; preds = %while.body42, %while.cond40thread-pre-split
  %exponent_base_10.1266 = phi i32 [ %inc, %while.body42 ], [ %exponent_base_10.0.lcssa, %while.cond40thread-pre-split ]
  %6 = phi double [ %div, %while.body42 ], [ %.pr261, %while.cond40thread-pre-split ]
  %div = fdiv double %6, 1.000000e+01
  %inc = add nsw i32 %exponent_base_10.1266, 1
  %cmp41 = fcmp ult double %div, 1.000000e+01
  br i1 %cmp41, label %while.cond40.while.end43_crit_edge, label %while.body42, !llvm.loop !144

while.cond40.while.end43_crit_edge:               ; preds = %while.body42
  store double %div, double* %arg.addr, align 8, !tbaa !141
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
  %call49 = call i8* @halide_int64_to_string(i8* %dst.addr.0, i8* %end, i64 %div46, i32 1) #13
  %call50 = call i8* @halide_string_to_string(i8* %call49, i8* %end, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30.66, i32 0, i32 0)) #13
  %call51 = call i8* @halide_int64_to_string(i8* %call50, i8* %end, i64 %sub48, i32 6) #13
  %cmp52 = icmp sgt i32 %exponent_base_10.1.lcssa, -1
  br i1 %cmp52, label %if.then53, label %if.else55

if.then53:                                        ; preds = %while.end43
  %call54 = call i8* @halide_string_to_string(i8* %call51, i8* %end, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.11.19, i32 0, i32 0)) #13
  br label %if.end58

if.else55:                                        ; preds = %while.end43
  %call56 = call i8* @halide_string_to_string(i8* %call51, i8* %end, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.12, i32 0, i32 0)) #13
  %sub57 = sub nsw i32 0, %exponent_base_10.1.lcssa
  br label %if.end58

if.end58:                                         ; preds = %if.else55, %if.then53
  %exponent_base_10.2 = phi i32 [ %exponent_base_10.1.lcssa, %if.then53 ], [ %sub57, %if.else55 ]
  %dst.addr.1 = phi i8* [ %call54, %if.then53 ], [ %call56, %if.else55 ]
  %conv59262 = zext i32 %exponent_base_10.2 to i64
  %call60 = call i8* @halide_int64_to_string(i8* %dst.addr.1, i8* %end, i64 %conv59262, i32 2) #13
  br label %cleanup147

if.else61:                                        ; preds = %if.end36
  br i1 %cmp16, label %if.then63, label %if.end65

if.then63:                                        ; preds = %if.else61
  %call64 = call i8* @halide_double_to_string(i8* %dst.addr.0, i8* %end, double 0.000000e+00, i32 0) #13
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

if.end104:                                        ; preds = %if.end83, %if.end65
  %integer_part.2 = phi i64 [ %spec.select, %if.end83 ], [ %add67, %if.end65 ]
  %integer_exponent.0 = phi i32 [ 0, %if.end83 ], [ %sub69, %if.end65 ]
  %fractional_part.2 = phi i64 [ %spec.select260, %if.end83 ], [ 0, %if.end65 ]
  %8 = getelementptr inbounds [512 x i8], [512 x i8]* %buf, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 512, i8* nonnull %8) #10
  %add.ptr = getelementptr inbounds [512 x i8], [512 x i8]* %buf, i32 0, i32 512
  %add.ptr105 = getelementptr inbounds [512 x i8], [512 x i8]* %buf, i32 0, i32 480
  %call108 = call i8* @halide_int64_to_string(i8* nonnull %add.ptr105, i8* nonnull %add.ptr, i64 %integer_part.2, i32 1) #13
  %call1081 = ptrtoint i8* %call108 to i32
  %cmp109274 = icmp sgt i32 %integer_exponent.0, 0
  br i1 %cmp109274, label %for.cond111.preheader, label %for.cond.cleanup

for.cond111.preheader:                            ; preds = %if.end137, %if.end104
  %i.0277 = phi i32 [ %inc139, %if.end137 ], [ 0, %if.end104 ]
  %int_part_ptr.0275 = phi i8* [ %int_part_ptr.1, %if.end137 ], [ %add.ptr105, %if.end104 ]
  %int_part_ptr.02752 = ptrtoint i8* %int_part_ptr.0275 to i32
  %cmp113.not270 = icmp eq i8* %call108, %int_part_ptr.0275
  br i1 %cmp113.not270, label %if.end137, label %for.body115.preheader

for.body115.preheader:                            ; preds = %for.cond111.preheader
  %9 = sub i32 %call1081, %int_part_ptr.02752
  %10 = xor i32 %int_part_ptr.02752, -1
  %11 = add i32 %10, %call1081
  %xtraiter = and i32 %9, 7
  %12 = icmp ult i32 %11, 7
  br i1 %12, label %for.cond.cleanup114.unr-lcssa, label %for.body115.preheader.new

for.body115.preheader.new:                        ; preds = %for.body115.preheader
  %unroll_iter = and i32 %9, -8
  br label %for.body115

for.cond.cleanup:                                 ; preds = %if.end137, %if.end104
  %int_part_ptr.0.lcssa = phi i8* [ %add.ptr105, %if.end104 ], [ %int_part_ptr.1, %if.end137 ]
  %call141 = call i8* @halide_string_to_string(i8* %dst.addr.0, i8* %end, i8* %int_part_ptr.0.lcssa) #13
  %call142 = call i8* @halide_string_to_string(i8* %call141, i8* %end, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30.66, i32 0, i32 0)) #13
  %call143 = call i8* @halide_int64_to_string(i8* %call142, i8* %end, i64 %fractional_part.2, i32 6) #13
  call void @llvm.lifetime.end.p0i8(i64 512, i8* nonnull %8) #10
  br label %cleanup147

for.cond.cleanup114.unr-lcssa:                    ; preds = %for.body115, %for.body115.preheader
  %cmp124.lcssa.ph = phi i1 [ undef, %for.body115.preheader ], [ %cmp124.7, %for.body115 ]
  %p.0272.pn.unr = phi i8* [ %call108, %for.body115.preheader ], [ %p.0272.7, %for.body115 ]
  %carry.0271.unr = phi i32 [ 0, %for.body115.preheader ], [ %carry.1.7, %for.body115 ]
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %for.cond.cleanup114, label %for.body115.epil

for.body115.epil:                                 ; preds = %for.body115.epil, %for.cond.cleanup114.unr-lcssa
  %p.0272.pn.epil = phi i8* [ %p.0272.epil, %for.body115.epil ], [ %p.0272.pn.unr, %for.cond.cleanup114.unr-lcssa ]
  %carry.0271.epil = phi i32 [ %carry.1.epil, %for.body115.epil ], [ %carry.0271.unr, %for.cond.cleanup114.unr-lcssa ]
  %epil.iter = phi i32 [ %epil.iter.sub, %for.body115.epil ], [ %xtraiter, %for.cond.cleanup114.unr-lcssa ]
  %p.0272.epil = getelementptr inbounds i8, i8* %p.0272.pn.epil, i32 -1
  %13 = load i8, i8* %p.0272.epil, align 1, !tbaa !15
  %sub117.epil = add i8 %13, -48
  %conv119.epil = sext i8 %sub117.epil to i32
  %mul120.epil = shl nsw i32 %conv119.epil, 1
  %add121.epil = or i32 %mul120.epil, %carry.0271.epil
  %14 = trunc i32 %add121.epil to i8
  %cmp124.epil = icmp sgt i8 %14, 9
  %sub127.epil = add nsw i32 %add121.epil, 246
  %carry.1.epil = zext i1 %cmp124.epil to i32
  %new_digit.0.in.epil = select i1 %cmp124.epil, i32 %sub127.epil, i32 %add121.epil
  %15 = trunc i32 %new_digit.0.in.epil to i8
  %conv133.epil = add i8 %15, 48
  store i8 %conv133.epil, i8* %p.0272.epil, align 1, !tbaa !15
  %epil.iter.sub = add i32 %epil.iter, -1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.sub, 0
  br i1 %epil.iter.cmp.not, label %for.cond.cleanup114, label %for.body115.epil, !llvm.loop !145

for.cond.cleanup114:                              ; preds = %for.body115.epil, %for.cond.cleanup114.unr-lcssa
  %cmp124.lcssa = phi i1 [ %cmp124.lcssa.ph, %for.cond.cleanup114.unr-lcssa ], [ %cmp124.epil, %for.body115.epil ]
  br i1 %cmp124.lcssa, label %if.then135, label %if.end137

for.body115:                                      ; preds = %for.body115, %for.body115.preheader.new
  %p.0272.pn = phi i8* [ %call108, %for.body115.preheader.new ], [ %p.0272.7, %for.body115 ]
  %carry.0271 = phi i32 [ 0, %for.body115.preheader.new ], [ %carry.1.7, %for.body115 ]
  %niter = phi i32 [ %unroll_iter, %for.body115.preheader.new ], [ %niter.nsub.7, %for.body115 ]
  %p.0272 = getelementptr inbounds i8, i8* %p.0272.pn, i32 -1
  %16 = load i8, i8* %p.0272, align 1, !tbaa !15
  %sub117 = add i8 %16, -48
  %conv119 = sext i8 %sub117 to i32
  %mul120 = shl nsw i32 %conv119, 1
  %add121 = or i32 %mul120, %carry.0271
  %17 = trunc i32 %add121 to i8
  %cmp124 = icmp sgt i8 %17, 9
  %sub127 = add nsw i32 %add121, 246
  %carry.1 = zext i1 %cmp124 to i32
  %new_digit.0.in = select i1 %cmp124, i32 %sub127, i32 %add121
  %18 = trunc i32 %new_digit.0.in to i8
  %conv133 = add i8 %18, 48
  store i8 %conv133, i8* %p.0272, align 1, !tbaa !15
  %p.0272.1 = getelementptr inbounds i8, i8* %p.0272.pn, i32 -2
  %19 = load i8, i8* %p.0272.1, align 1, !tbaa !15
  %sub117.1 = add i8 %19, -48
  %conv119.1 = sext i8 %sub117.1 to i32
  %mul120.1 = shl nsw i32 %conv119.1, 1
  %add121.1 = or i32 %mul120.1, %carry.1
  %20 = trunc i32 %add121.1 to i8
  %cmp124.1 = icmp sgt i8 %20, 9
  %sub127.1 = add nsw i32 %add121.1, 246
  %carry.1.1 = zext i1 %cmp124.1 to i32
  %new_digit.0.in.1 = select i1 %cmp124.1, i32 %sub127.1, i32 %add121.1
  %21 = trunc i32 %new_digit.0.in.1 to i8
  %conv133.1 = add i8 %21, 48
  store i8 %conv133.1, i8* %p.0272.1, align 1, !tbaa !15
  %p.0272.2 = getelementptr inbounds i8, i8* %p.0272.pn, i32 -3
  %22 = load i8, i8* %p.0272.2, align 1, !tbaa !15
  %sub117.2 = add i8 %22, -48
  %conv119.2 = sext i8 %sub117.2 to i32
  %mul120.2 = shl nsw i32 %conv119.2, 1
  %add121.2 = or i32 %mul120.2, %carry.1.1
  %23 = trunc i32 %add121.2 to i8
  %cmp124.2 = icmp sgt i8 %23, 9
  %sub127.2 = add nsw i32 %add121.2, 246
  %carry.1.2 = zext i1 %cmp124.2 to i32
  %new_digit.0.in.2 = select i1 %cmp124.2, i32 %sub127.2, i32 %add121.2
  %24 = trunc i32 %new_digit.0.in.2 to i8
  %conv133.2 = add i8 %24, 48
  store i8 %conv133.2, i8* %p.0272.2, align 1, !tbaa !15
  %p.0272.3 = getelementptr inbounds i8, i8* %p.0272.pn, i32 -4
  %25 = load i8, i8* %p.0272.3, align 1, !tbaa !15
  %sub117.3 = add i8 %25, -48
  %conv119.3 = sext i8 %sub117.3 to i32
  %mul120.3 = shl nsw i32 %conv119.3, 1
  %add121.3 = or i32 %mul120.3, %carry.1.2
  %26 = trunc i32 %add121.3 to i8
  %cmp124.3 = icmp sgt i8 %26, 9
  %sub127.3 = add nsw i32 %add121.3, 246
  %carry.1.3 = zext i1 %cmp124.3 to i32
  %new_digit.0.in.3 = select i1 %cmp124.3, i32 %sub127.3, i32 %add121.3
  %27 = trunc i32 %new_digit.0.in.3 to i8
  %conv133.3 = add i8 %27, 48
  store i8 %conv133.3, i8* %p.0272.3, align 1, !tbaa !15
  %p.0272.4 = getelementptr inbounds i8, i8* %p.0272.pn, i32 -5
  %28 = load i8, i8* %p.0272.4, align 1, !tbaa !15
  %sub117.4 = add i8 %28, -48
  %conv119.4 = sext i8 %sub117.4 to i32
  %mul120.4 = shl nsw i32 %conv119.4, 1
  %add121.4 = or i32 %mul120.4, %carry.1.3
  %29 = trunc i32 %add121.4 to i8
  %cmp124.4 = icmp sgt i8 %29, 9
  %sub127.4 = add nsw i32 %add121.4, 246
  %carry.1.4 = zext i1 %cmp124.4 to i32
  %new_digit.0.in.4 = select i1 %cmp124.4, i32 %sub127.4, i32 %add121.4
  %30 = trunc i32 %new_digit.0.in.4 to i8
  %conv133.4 = add i8 %30, 48
  store i8 %conv133.4, i8* %p.0272.4, align 1, !tbaa !15
  %p.0272.5 = getelementptr inbounds i8, i8* %p.0272.pn, i32 -6
  %31 = load i8, i8* %p.0272.5, align 1, !tbaa !15
  %sub117.5 = add i8 %31, -48
  %conv119.5 = sext i8 %sub117.5 to i32
  %mul120.5 = shl nsw i32 %conv119.5, 1
  %add121.5 = or i32 %mul120.5, %carry.1.4
  %32 = trunc i32 %add121.5 to i8
  %cmp124.5 = icmp sgt i8 %32, 9
  %sub127.5 = add nsw i32 %add121.5, 246
  %carry.1.5 = zext i1 %cmp124.5 to i32
  %new_digit.0.in.5 = select i1 %cmp124.5, i32 %sub127.5, i32 %add121.5
  %33 = trunc i32 %new_digit.0.in.5 to i8
  %conv133.5 = add i8 %33, 48
  store i8 %conv133.5, i8* %p.0272.5, align 1, !tbaa !15
  %p.0272.6 = getelementptr inbounds i8, i8* %p.0272.pn, i32 -7
  %34 = load i8, i8* %p.0272.6, align 1, !tbaa !15
  %sub117.6 = add i8 %34, -48
  %conv119.6 = sext i8 %sub117.6 to i32
  %mul120.6 = shl nsw i32 %conv119.6, 1
  %add121.6 = or i32 %mul120.6, %carry.1.5
  %35 = trunc i32 %add121.6 to i8
  %cmp124.6 = icmp sgt i8 %35, 9
  %sub127.6 = add nsw i32 %add121.6, 246
  %carry.1.6 = zext i1 %cmp124.6 to i32
  %new_digit.0.in.6 = select i1 %cmp124.6, i32 %sub127.6, i32 %add121.6
  %36 = trunc i32 %new_digit.0.in.6 to i8
  %conv133.6 = add i8 %36, 48
  store i8 %conv133.6, i8* %p.0272.6, align 1, !tbaa !15
  %p.0272.7 = getelementptr inbounds i8, i8* %p.0272.pn, i32 -8
  %37 = load i8, i8* %p.0272.7, align 1, !tbaa !15
  %sub117.7 = add i8 %37, -48
  %conv119.7 = sext i8 %sub117.7 to i32
  %mul120.7 = shl nsw i32 %conv119.7, 1
  %add121.7 = or i32 %mul120.7, %carry.1.6
  %38 = trunc i32 %add121.7 to i8
  %cmp124.7 = icmp sgt i8 %38, 9
  %sub127.7 = add nsw i32 %add121.7, 246
  %carry.1.7 = zext i1 %cmp124.7 to i32
  %new_digit.0.in.7 = select i1 %cmp124.7, i32 %sub127.7, i32 %add121.7
  %39 = trunc i32 %new_digit.0.in.7 to i8
  %conv133.7 = add i8 %39, 48
  store i8 %conv133.7, i8* %p.0272.7, align 1, !tbaa !15
  %niter.nsub.7 = add i32 %niter, -8
  %niter.ncmp.7 = icmp eq i32 %niter.nsub.7, 0
  br i1 %niter.ncmp.7, label %for.cond.cleanup114.unr-lcssa, label %for.body115, !llvm.loop !146

if.then135:                                       ; preds = %for.cond.cleanup114
  %incdec.ptr136 = getelementptr inbounds i8, i8* %int_part_ptr.0275, i32 -1
  store i8 49, i8* %incdec.ptr136, align 1, !tbaa !15
  br label %if.end137

if.end137:                                        ; preds = %if.then135, %for.cond.cleanup114, %for.cond111.preheader
  %int_part_ptr.1 = phi i8* [ %incdec.ptr136, %if.then135 ], [ %int_part_ptr.0275, %for.cond.cleanup114 ], [ %call108, %for.cond111.preheader ]
  %inc139 = add nuw nsw i32 %i.0277, 1
  %exitcond.not = icmp eq i32 %inc139, %integer_exponent.0
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.cond111.preheader, !llvm.loop !147

cleanup147:                                       ; preds = %for.cond.cleanup, %if.then63, %if.end58, %if.else30, %if.then28, %if.else24, %if.then22, %if.else13, %if.then11, %if.else, %if.then6
  %retval.1 = phi i8* [ %call7, %if.then6 ], [ %call8, %if.else ], [ %call12, %if.then11 ], [ %call14, %if.else13 ], [ %call23, %if.then22 ], [ %call25, %if.else24 ], [ %call29, %if.then28 ], [ %call31, %if.else30 ], [ %call64, %if.then63 ], [ %call60, %if.end58 ], [ %call143, %for.cond.cleanup ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %0) #10
  ret i8* %retval.1
}

declare i8* @memcpy(i8*, i8*, i64) local_unnamed_addr #1

; Function Attrs: mustprogress nounwind
define weak i8* @halide_pointer_to_string(i8* %dst, i8* %end, i8* %arg) local_unnamed_addr #0 {
entry:
  %buf = alloca [20 x i8], align 1
  %0 = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 20, i8* nonnull %0) #10
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(20) %0, i8 0, i64 20, i1 false)
  %add.ptr = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i32 0, i32 18
  %1 = ptrtoint i8* %arg to i32
  %and = and i32 %1, 15
  %arrayidx = getelementptr inbounds [17 x i8], [17 x i8]* @.str.13, i32 0, i32 %and
  %2 = load i8, i8* %arrayidx, align 1, !tbaa !15
  %incdec.ptr = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i32 0, i32 17
  store i8 %2, i8* %add.ptr, align 1, !tbaa !15
  %tobool.not = icmp ult i8* %arg, inttoptr (i64 16 to i8*)
  br i1 %tobool.not, label %cleanup, label %for.inc

for.inc:                                          ; preds = %entry
  %shr = lshr i32 %1, 4
  %and.1 = and i32 %shr, 15
  %arrayidx.1 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.13, i32 0, i32 %and.1
  %3 = load i8, i8* %arrayidx.1, align 1, !tbaa !15
  %incdec.ptr.1 = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i32 0, i32 16
  store i8 %3, i8* %incdec.ptr, align 1, !tbaa !15
  %tobool.not.1 = icmp ult i8* %arg, inttoptr (i64 256 to i8*)
  br i1 %tobool.not.1, label %cleanup, label %for.inc.1

cleanup:                                          ; preds = %for.inc.6, %for.inc.5, %for.inc.4, %for.inc.3, %for.inc.2, %for.inc.1, %for.inc, %entry
  %buf_ptr.016.lcssa = phi i8* [ %add.ptr, %entry ], [ %incdec.ptr, %for.inc ], [ %incdec.ptr.1, %for.inc.1 ], [ %incdec.ptr.2, %for.inc.2 ], [ %incdec.ptr.3, %for.inc.3 ], [ %incdec.ptr.4, %for.inc.4 ], [ %incdec.ptr.5, %for.inc.5 ], [ %incdec.ptr.14, %for.inc.6 ]
  %incdec.ptr.lcssa = phi i8* [ %incdec.ptr, %entry ], [ %incdec.ptr.1, %for.inc ], [ %incdec.ptr.2, %for.inc.1 ], [ %incdec.ptr.3, %for.inc.2 ], [ %incdec.ptr.4, %for.inc.3 ], [ %incdec.ptr.5, %for.inc.4 ], [ %incdec.ptr.6, %for.inc.5 ], [ %incdec.ptr.15, %for.inc.6 ]
  %incdec.ptr1 = getelementptr inbounds i8, i8* %buf_ptr.016.lcssa, i32 -2
  store i8 120, i8* %incdec.ptr.lcssa, align 1, !tbaa !15
  store i8 48, i8* %incdec.ptr1, align 1, !tbaa !15
  %call = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* nonnull %incdec.ptr1) #13
  call void @llvm.lifetime.end.p0i8(i64 20, i8* nonnull %0) #10
  ret i8* %call

for.inc.1:                                        ; preds = %for.inc
  %shr.1 = lshr i32 %1, 8
  %and.2 = and i32 %shr.1, 15
  %arrayidx.2 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.13, i32 0, i32 %and.2
  %4 = load i8, i8* %arrayidx.2, align 1, !tbaa !15
  %incdec.ptr.2 = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i32 0, i32 15
  store i8 %4, i8* %incdec.ptr.1, align 1, !tbaa !15
  %tobool.not.2 = icmp ult i8* %arg, inttoptr (i64 4096 to i8*)
  br i1 %tobool.not.2, label %cleanup, label %for.inc.2

for.inc.2:                                        ; preds = %for.inc.1
  %shr.2 = lshr i32 %1, 12
  %and.3 = and i32 %shr.2, 15
  %arrayidx.3 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.13, i32 0, i32 %and.3
  %5 = load i8, i8* %arrayidx.3, align 1, !tbaa !15
  %incdec.ptr.3 = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i32 0, i32 14
  store i8 %5, i8* %incdec.ptr.2, align 1, !tbaa !15
  %tobool.not.3 = icmp ult i8* %arg, inttoptr (i64 65536 to i8*)
  br i1 %tobool.not.3, label %cleanup, label %for.inc.3

for.inc.3:                                        ; preds = %for.inc.2
  %shr.3 = lshr i32 %1, 16
  %and.4 = and i32 %shr.3, 15
  %arrayidx.4 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.13, i32 0, i32 %and.4
  %6 = load i8, i8* %arrayidx.4, align 1, !tbaa !15
  %incdec.ptr.4 = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i32 0, i32 13
  store i8 %6, i8* %incdec.ptr.3, align 1, !tbaa !15
  %tobool.not.4 = icmp ult i8* %arg, inttoptr (i64 1048576 to i8*)
  br i1 %tobool.not.4, label %cleanup, label %for.inc.4

for.inc.4:                                        ; preds = %for.inc.3
  %shr.4 = lshr i32 %1, 20
  %and.5 = and i32 %shr.4, 15
  %arrayidx.5 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.13, i32 0, i32 %and.5
  %7 = load i8, i8* %arrayidx.5, align 1, !tbaa !15
  %incdec.ptr.5 = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i32 0, i32 12
  store i8 %7, i8* %incdec.ptr.4, align 1, !tbaa !15
  %tobool.not.5 = icmp ult i8* %arg, inttoptr (i64 16777216 to i8*)
  br i1 %tobool.not.5, label %cleanup, label %for.inc.5

for.inc.5:                                        ; preds = %for.inc.4
  %shr.5 = lshr i32 %1, 24
  %and.6 = and i32 %shr.5, 15
  %arrayidx.6 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.13, i32 0, i32 %and.6
  %8 = load i8, i8* %arrayidx.6, align 1, !tbaa !15
  %incdec.ptr.6 = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i32 0, i32 11
  store i8 %8, i8* %incdec.ptr.5, align 1, !tbaa !15
  %tobool.not.6 = icmp ult i8* %arg, inttoptr (i64 268435456 to i8*)
  br i1 %tobool.not.6, label %cleanup, label %for.inc.6

for.inc.6:                                        ; preds = %for.inc.5
  %shr.6 = lshr i32 %1, 28
  %arrayidx.7 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.13, i32 0, i32 %shr.6
  %9 = load i8, i8* %arrayidx.7, align 1, !tbaa !15
  %incdec.ptr.7 = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i32 0, i32 10
  store i8 %9, i8* %incdec.ptr.6, align 1, !tbaa !15
  %incdec.ptr.8 = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i32 0, i32 9
  store i8 48, i8* %incdec.ptr.7, align 1, !tbaa !15
  %incdec.ptr.9 = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i32 0, i32 8
  store i8 48, i8* %incdec.ptr.8, align 1, !tbaa !15
  %incdec.ptr.10 = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i32 0, i32 7
  store i8 48, i8* %incdec.ptr.9, align 1, !tbaa !15
  %incdec.ptr.11 = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i32 0, i32 6
  store i8 48, i8* %incdec.ptr.10, align 1, !tbaa !15
  %incdec.ptr.12 = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i32 0, i32 5
  store i8 48, i8* %incdec.ptr.11, align 1, !tbaa !15
  %incdec.ptr.13 = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i32 0, i32 4
  store i8 48, i8* %incdec.ptr.12, align 1, !tbaa !15
  %incdec.ptr.14 = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i32 0, i32 3
  store i8 48, i8* %incdec.ptr.13, align 1, !tbaa !15
  %incdec.ptr.15 = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i32 0, i32 2
  store i8 48, i8* %incdec.ptr.14, align 1, !tbaa !15
  br label %cleanup
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: mustprogress nounwind
define weak i8* @halide_type_to_string(i8* %dst, i8* %end, %struct.halide_type_t* %t) local_unnamed_addr #0 {
entry:
  %code = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %t, i32 0, i32 0
  %0 = load i8, i8* %code, align 2, !tbaa !148
  %1 = icmp ult i8 %0, 4
  br i1 %1, label %switch.lookup, label %sw.epilog

switch.lookup:                                    ; preds = %entry
  %2 = sext i8 %0 to i32
  %switch.gep = getelementptr inbounds [4 x i8*], [4 x i8*]* @switch.table.halide_type_to_string, i32 0, i32 %2
  %switch.load = load i8*, i8** %switch.gep, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %switch.lookup, %entry
  %code_name.0 = phi i8* [ %switch.load, %switch.lookup ], [ getelementptr inbounds ([14 x i8], [14 x i8]* @.str.18, i32 0, i32 0), %entry ]
  %call = tail call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* nonnull %code_name.0) #13
  %bits = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %t, i32 0, i32 1
  %3 = load i8, i8* %bits, align 1, !tbaa !152
  %conv4 = zext i8 %3 to i64
  %call5 = tail call i8* @halide_uint64_to_string(i8* %call, i8* %end, i64 %conv4, i32 1) #13
  %lanes = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %t, i32 0, i32 2
  %4 = load i16, i16* %lanes, align 2, !tbaa !153
  %cmp.not = icmp eq i16 %4, 1
  br i1 %cmp.not, label %if.end, label %if.then

if.then:                                          ; preds = %sw.epilog
  %call7 = tail call i8* @halide_string_to_string(i8* %call5, i8* %end, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.19, i32 0, i32 0)) #13
  %5 = load i16, i16* %lanes, align 2, !tbaa !153
  %conv9 = zext i16 %5 to i64
  %call10 = tail call i8* @halide_uint64_to_string(i8* %call7, i8* %end, i64 %conv9, i32 1) #13
  br label %if.end

if.end:                                           ; preds = %if.then, %sw.epilog
  %dst.addr.0 = phi i8* [ %call10, %if.then ], [ %call5, %sw.epilog ]
  ret i8* %dst.addr.0
}

; Function Attrs: mustprogress nounwind
define weak i8* @halide_buffer_to_string(i8* %dst, i8* %end, %struct.halide_buffer_t* %buf) local_unnamed_addr #0 {
entry:
  %cmp = icmp eq %struct.halide_buffer_t* %buf, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = tail call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.20, i32 0, i32 0)) #13
  br label %return

if.end:                                           ; preds = %entry
  %call1 = tail call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.21, i32 0, i32 0)) #13
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %0 = load i64, i64* %device, align 8, !tbaa !154
  %call2 = tail call i8* @halide_uint64_to_string(i8* %call1, i8* %end, i64 %0, i32 1) #13
  %call3 = tail call i8* @halide_string_to_string(i8* %call2, i8* %end, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i32 0, i32 0)) #13
  %device_interface = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %1 = bitcast %struct.halide_device_interface_t** %device_interface to i8**
  %2 = load i8*, i8** %1, align 8, !tbaa !156
  %call4 = tail call i8* @halide_pointer_to_string(i8* %call3, i8* %end, i8* %2) #13
  %call5 = tail call i8* @halide_string_to_string(i8* %call4, i8* %end, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i32 0, i32 0)) #13
  %host = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 2
  %3 = load i8*, i8** %host, align 8, !tbaa !157
  %call6 = tail call i8* @halide_pointer_to_string(i8* %call5, i8* %end, i8* %3) #13
  %call7 = tail call i8* @halide_string_to_string(i8* %call6, i8* %end, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i32 0, i32 0)) #13
  %flags = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %4 = load i64, i64* %flags, align 8, !tbaa !158
  %call8 = tail call i8* @halide_uint64_to_string(i8* %call7, i8* %end, i64 %4, i32 1) #13
  %call9 = tail call i8* @halide_string_to_string(i8* %call8, i8* %end, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i32 0, i32 0)) #13
  %type = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 4
  %call10 = tail call i8* @halide_type_to_string(i8* %call9, i8* %end, %struct.halide_type_t* nonnull %type) #13
  %dimensions = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 5
  %dim = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 6
  %5 = load i32, i32* %dimensions, align 4, !tbaa !159
  %cmp1179 = icmp sgt i32 %5, 0
  br i1 %cmp1179, label %for.body, label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.body, %if.end
  %dst.addr.0.lcssa = phi i8* [ %call10, %if.end ], [ %call26, %for.body ]
  %call27 = tail call i8* @halide_string_to_string(i8* %dst.addr.0.lcssa, i8* %end, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8.44, i32 0, i32 0)) #13
  br label %return

for.body:                                         ; preds = %for.body, %if.end
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ 0, %if.end ]
  %dst.addr.080 = phi i8* [ %call26, %for.body ], [ %call10, %if.end ]
  %call12 = tail call i8* @halide_string_to_string(i8* %dst.addr.080, i8* %end, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.23, i32 0, i32 0)) #13
  %6 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim, align 8, !tbaa !160
  %7 = trunc i64 %indvars.iv to i32
  %min = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %6, i32 %7, i32 0
  %8 = load i32, i32* %min, align 4, !tbaa !161
  %conv = sext i32 %8 to i64
  %call13 = tail call i8* @halide_int64_to_string(i8* %call12, i8* %end, i64 %conv, i32 1) #13
  %call14 = tail call i8* @halide_string_to_string(i8* %call13, i8* %end, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i32 0, i32 0)) #13
  %9 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim, align 8, !tbaa !160
  %extent = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %9, i32 %7, i32 1
  %10 = load i32, i32* %extent, align 4, !tbaa !163
  %conv18 = sext i32 %10 to i64
  %call19 = tail call i8* @halide_int64_to_string(i8* %call14, i8* %end, i64 %conv18, i32 1) #13
  %call20 = tail call i8* @halide_string_to_string(i8* %call19, i8* %end, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i32 0, i32 0)) #13
  %11 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim, align 8, !tbaa !160
  %stride = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %11, i32 %7, i32 2
  %12 = load i32, i32* %stride, align 4, !tbaa !164
  %conv24 = sext i32 %12 to i64
  %call25 = tail call i8* @halide_int64_to_string(i8* %call20, i8* %end, i64 %conv24, i32 1) #13
  %call26 = tail call i8* @halide_string_to_string(i8* %call25, i8* %end, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.24, i32 0, i32 0)) #13
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %13 = load i32, i32* %dimensions, align 4, !tbaa !159
  %14 = sext i32 %13 to i64
  %cmp11 = icmp slt i64 %indvars.iv.next, %14
  br i1 %cmp11, label %for.body, label %for.cond.cleanup, !llvm.loop !165

return:                                           ; preds = %for.cond.cleanup, %if.then
  %retval.0 = phi i8* [ %call, %if.then ], [ %call27, %for.cond.cleanup ]
  ret i8* %retval.0
}

; Function Attrs: alwaysinline mustprogress nounwind
define weak i32 @halide_malloc_alignment() local_unnamed_addr #6 {
entry:
  ret i32 128
}

; Function Attrs: nounwind
define weak i32 @halide_reuse_device_allocations(i8* %user_context, i1 zeroext %flag) local_unnamed_addr #3 {
entry:
  %frombool = zext i1 %flag to i8
  store i8 %frombool, i8* @_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE, align 1, !tbaa !16
  br i1 %flag, label %if.end5, label %if.then

if.then:                                          ; preds = %entry
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal21allocation_pools_lockE) #12
  %p.014 = load %struct.halide_device_allocation_pool*, %struct.halide_device_allocation_pool** @_ZN6Halide7Runtime8Internal23device_allocation_poolsE, align 8, !tbaa !11
  %cmp.not15 = icmp eq %struct.halide_device_allocation_pool* %p.014, null
  br i1 %cmp.not15, label %for.cond.cleanup, label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %if.then
  %err.0.lcssa = phi i32 [ 0, %if.then ], [ %spec.select, %for.body ]
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal21allocation_pools_lockE) #12
  br label %if.end5

for.body:                                         ; preds = %for.body, %if.then
  %p.017 = phi %struct.halide_device_allocation_pool* [ %p.0, %for.body ], [ %p.014, %if.then ]
  %err.016 = phi i32 [ %spec.select, %for.body ], [ 0, %if.then ]
  %release_unused = getelementptr inbounds %struct.halide_device_allocation_pool, %struct.halide_device_allocation_pool* %p.017, i32 0, i32 0
  %0 = load i32 (i8*)*, i32 (i8*)** %release_unused, align 8, !tbaa !166
  %call = tail call i32 %0(i8* %user_context) #12
  %tobool3.not = icmp eq i32 %call, 0
  %spec.select = select i1 %tobool3.not, i32 %err.016, i32 %call
  %next = getelementptr inbounds %struct.halide_device_allocation_pool, %struct.halide_device_allocation_pool* %p.017, i32 0, i32 1
  %p.0 = load %struct.halide_device_allocation_pool*, %struct.halide_device_allocation_pool** %next, align 8, !tbaa !11
  %cmp.not = icmp eq %struct.halide_device_allocation_pool* %p.0, null
  br i1 %cmp.not, label %for.cond.cleanup, label %for.body, !llvm.loop !168

if.end5:                                          ; preds = %for.cond.cleanup, %entry
  %err.2 = phi i32 [ 0, %entry ], [ %err.0.lcssa, %for.cond.cleanup ]
  ret i32 %err.2
}

; Function Attrs: mustprogress nounwind
define weak zeroext i1 @halide_can_reuse_device_allocations(i8* %user_context) local_unnamed_addr #0 {
entry:
  %0 = load i8, i8* @_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE, align 1, !tbaa !16, !range !18
  %tobool = icmp ne i8 %0, 0
  ret i1 %tobool
}

; Function Attrs: nounwind
define weak void @halide_register_device_allocation_pool(%struct.halide_device_allocation_pool* %pool) local_unnamed_addr #3 {
entry:
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal21allocation_pools_lockE) #12
  %0 = load %struct.halide_device_allocation_pool*, %struct.halide_device_allocation_pool** @_ZN6Halide7Runtime8Internal23device_allocation_poolsE, align 8, !tbaa !11
  %next = getelementptr inbounds %struct.halide_device_allocation_pool, %struct.halide_device_allocation_pool* %pool, i32 0, i32 1
  store %struct.halide_device_allocation_pool* %0, %struct.halide_device_allocation_pool** %next, align 8, !tbaa !169
  store %struct.halide_device_allocation_pool* %pool, %struct.halide_device_allocation_pool** @_ZN6Halide7Runtime8Internal23device_allocation_poolsE, align 8, !tbaa !11
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal21allocation_pools_lockE) #12
  ret void
}

; Function Attrs: mustprogress nounwind
define linkonce void @_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx(%"struct.Halide::Runtime::Internal::device_copy"* nonnull align 8 dereferenceable(416) %copy, i32 %d, i64 %src_off, i64 %dst_off) local_unnamed_addr #0 {
entry:
  %cmp37 = icmp sgt i32 %d, -1
  br i1 %cmp37, label %land.rhs, label %while.end

land.rhs:                                         ; preds = %while.body, %entry
  %d.addr.038 = phi i32 [ %dec, %while.body ], [ %d, %entry ]
  %arrayidx = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %copy, i32 0, i32 3, i32 %d.addr.038
  %0 = load i64, i64* %arrayidx, align 8, !tbaa !19
  %cmp1 = icmp eq i64 %0, 1
  br i1 %cmp1, label %while.body, label %for.cond.preheader

while.body:                                       ; preds = %land.rhs
  %dec = add nsw i32 %d.addr.038, -1
  %cmp = icmp sgt i32 %d.addr.038, 0
  br i1 %cmp, label %land.rhs, label %if.then, !llvm.loop !170

while.end:                                        ; preds = %entry
  %cmp2 = icmp eq i32 %d, -1
  br i1 %cmp2, label %if.then, label %while.end.for.cond.preheader_crit_edge

while.end.for.cond.preheader_crit_edge:           ; preds = %while.end
  %arrayidx6.phi.trans.insert = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %copy, i32 0, i32 3, i32 %d
  %.pre = load i64, i64* %arrayidx6.phi.trans.insert, align 8, !tbaa !19
  br label %for.cond.preheader

for.cond.preheader:                               ; preds = %while.end.for.cond.preheader_crit_edge, %land.rhs
  %1 = phi i64 [ %.pre, %while.end.for.cond.preheader_crit_edge ], [ %0, %land.rhs ]
  %d.addr.0.lcssa49 = phi i32 [ %d, %while.end.for.cond.preheader_crit_edge ], [ %d.addr.038, %land.rhs ]
  %arrayidx6 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %copy, i32 0, i32 3, i32 %d.addr.0.lcssa49
  %sub = add nsw i32 %d.addr.0.lcssa49, -1
  %arrayidx9 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %copy, i32 0, i32 4, i32 %d.addr.0.lcssa49
  %arrayidx12 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %copy, i32 0, i32 5, i32 %d.addr.0.lcssa49
  %cmp740.not = icmp eq i64 %1, 0
  br i1 %cmp740.not, label %if.end, label %for.body

if.then:                                          ; preds = %while.end, %while.body
  %src = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %copy, i32 0, i32 0
  %2 = load i64, i64* %src, align 8, !tbaa !171
  %add = add i64 %2, %src_off
  %3 = trunc i64 %add to i32
  %4 = inttoptr i32 %3 to i8*
  %dst = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %copy, i32 0, i32 1
  %5 = load i64, i64* %dst, align 8, !tbaa !173
  %add3 = add i64 %5, %dst_off
  %6 = trunc i64 %add3 to i32
  %7 = inttoptr i32 %6 to i8*
  %chunk_size = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %copy, i32 0, i32 6
  %8 = load i64, i64* %chunk_size, align 8, !tbaa !174
  %call = tail call i8* @memcpy(i8* %7, i8* %4, i64 %8) #12
  br label %if.end

for.body:                                         ; preds = %for.body, %for.cond.preheader
  %i.043 = phi i64 [ %inc, %for.body ], [ 0, %for.cond.preheader ]
  %src_off.addr.042 = phi i64 [ %add10, %for.body ], [ %src_off, %for.cond.preheader ]
  %dst_off.addr.041 = phi i64 [ %add13, %for.body ], [ %dst_off, %for.cond.preheader ]
  tail call void @_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx(%"struct.Halide::Runtime::Internal::device_copy"* nonnull align 8 dereferenceable(416) %copy, i32 %sub, i64 %src_off.addr.042, i64 %dst_off.addr.041) #13
  %9 = load i64, i64* %arrayidx9, align 8, !tbaa !19
  %add10 = add i64 %9, %src_off.addr.042
  %10 = load i64, i64* %arrayidx12, align 8, !tbaa !19
  %add13 = add i64 %10, %dst_off.addr.041
  %inc = add nuw i64 %i.043, 1
  %11 = load i64, i64* %arrayidx6, align 8, !tbaa !19
  %cmp7 = icmp ult i64 %inc, %11
  br i1 %cmp7, label %for.body, label %if.end, !llvm.loop !175

if.end:                                           ; preds = %for.body, %if.then, %for.cond.preheader
  ret void
}

; Function Attrs: mustprogress nounwind
define linkonce void @_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv(%"struct.Halide::Runtime::Internal::device_copy"* nonnull align 8 dereferenceable(416) %copy, i8* %user_context) local_unnamed_addr #0 {
entry:
  %src = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %copy, i32 0, i32 0
  %0 = load i64, i64* %src, align 8, !tbaa !171
  %dst = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %copy, i32 0, i32 1
  %1 = load i64, i64* %dst, align 8, !tbaa !173
  %cmp.not = icmp eq i64 %0, %1
  br i1 %cmp.not, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %src_begin = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %copy, i32 0, i32 2
  %2 = load i64, i64* %src_begin, align 8, !tbaa !176
  tail call void @_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx(%"struct.Halide::Runtime::Internal::device_copy"* nonnull align 8 dereferenceable(416) %copy, i32 15, i64 %2, i64 0) #13
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: mustprogress nounwind
define linkonce void @_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b(%"struct.Halide::Runtime::Internal::device_copy"* noalias sret(%"struct.Halide::Runtime::Internal::device_copy") align 8 %agg.result, %struct.halide_buffer_t* %src, i1 zeroext %src_host, %struct.halide_buffer_t* %dst, i1 zeroext %dst_host) local_unnamed_addr #0 {
entry:
  %c = alloca %"struct.Halide::Runtime::Internal::device_copy", align 8
  %0 = bitcast %"struct.Halide::Runtime::Internal::device_copy"* %c to i8*
  call void @llvm.lifetime.start.p0i8(i64 416, i8* nonnull %0) #10
  br i1 %src_host, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %host = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 2
  %1 = load i8*, i8** %host, align 8, !tbaa !157
  %2 = ptrtoint i8* %1 to i32
  %3 = zext i32 %2 to i64
  br label %cond.end

cond.false:                                       ; preds = %entry
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 0
  %4 = load i64, i64* %device, align 8, !tbaa !154
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %3, %cond.true ], [ %4, %cond.false ]
  %src2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 0
  store i64 %cond, i64* %src2, align 8, !tbaa !171
  br i1 %dst_host, label %cond.true4, label %cond.false6

cond.true4:                                       ; preds = %cond.end
  %host5 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i32 0, i32 2
  %5 = load i8*, i8** %host5, align 8, !tbaa !157
  %6 = ptrtoint i8* %5 to i32
  %7 = zext i32 %6 to i64
  br label %cond.end8

cond.false6:                                      ; preds = %cond.end
  %device7 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i32 0, i32 0
  %8 = load i64, i64* %device7, align 8, !tbaa !154
  br label %cond.end8

cond.end8:                                        ; preds = %cond.false6, %cond.true4
  %cond9 = phi i64 [ %7, %cond.true4 ], [ %8, %cond.false6 ]
  %dst10 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 1
  store i64 %cond9, i64* %dst10, align 8, !tbaa !173
  %bits.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 4, i32 1
  %9 = load i8, i8* %bits.i, align 1, !tbaa !152
  %conv.i = zext i8 %9 to i32
  %add.i = add nuw nsw i32 %conv.i, 7
  %div.i = lshr i32 %add.i, 3
  %conv261 = zext i32 %div.i to i64
  %chunk_size = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 6
  store i64 %conv261, i64* %chunk_size, align 8, !tbaa !174
  %arrayidx = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 0
  store i64 1, i64* %arrayidx, align 8, !tbaa !19
  %arrayidx12 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 0
  store i64 0, i64* %arrayidx12, align 8, !tbaa !19
  %arrayidx14 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 0
  store i64 0, i64* %arrayidx14, align 8, !tbaa !19
  %arrayidx.1 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 1
  store i64 1, i64* %arrayidx.1, align 8, !tbaa !19
  %arrayidx12.1 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 1
  store i64 0, i64* %arrayidx12.1, align 8, !tbaa !19
  %arrayidx14.1 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 1
  store i64 0, i64* %arrayidx14.1, align 8, !tbaa !19
  %arrayidx.2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 2
  store i64 1, i64* %arrayidx.2, align 8, !tbaa !19
  %arrayidx12.2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 2
  store i64 0, i64* %arrayidx12.2, align 8, !tbaa !19
  %arrayidx14.2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 2
  store i64 0, i64* %arrayidx14.2, align 8, !tbaa !19
  %arrayidx.3 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 3
  store i64 1, i64* %arrayidx.3, align 8, !tbaa !19
  %arrayidx12.3 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 3
  store i64 0, i64* %arrayidx12.3, align 8, !tbaa !19
  %arrayidx14.3 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 3
  store i64 0, i64* %arrayidx14.3, align 8, !tbaa !19
  %arrayidx.4 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 4
  store i64 1, i64* %arrayidx.4, align 8, !tbaa !19
  %arrayidx12.4 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 4
  store i64 0, i64* %arrayidx12.4, align 8, !tbaa !19
  %arrayidx14.4 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 4
  store i64 0, i64* %arrayidx14.4, align 8, !tbaa !19
  %arrayidx.5 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 5
  store i64 1, i64* %arrayidx.5, align 8, !tbaa !19
  %arrayidx12.5 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 5
  store i64 0, i64* %arrayidx12.5, align 8, !tbaa !19
  %arrayidx14.5 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 5
  store i64 0, i64* %arrayidx14.5, align 8, !tbaa !19
  %arrayidx.6 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 6
  store i64 1, i64* %arrayidx.6, align 8, !tbaa !19
  %arrayidx12.6 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 6
  store i64 0, i64* %arrayidx12.6, align 8, !tbaa !19
  %arrayidx14.6 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 6
  store i64 0, i64* %arrayidx14.6, align 8, !tbaa !19
  %arrayidx.7 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 7
  store i64 1, i64* %arrayidx.7, align 8, !tbaa !19
  %arrayidx12.7 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 7
  store i64 0, i64* %arrayidx12.7, align 8, !tbaa !19
  %arrayidx14.7 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 7
  store i64 0, i64* %arrayidx14.7, align 8, !tbaa !19
  %arrayidx.8 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 8
  store i64 1, i64* %arrayidx.8, align 8, !tbaa !19
  %arrayidx12.8 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 8
  store i64 0, i64* %arrayidx12.8, align 8, !tbaa !19
  %arrayidx14.8 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 8
  store i64 0, i64* %arrayidx14.8, align 8, !tbaa !19
  %arrayidx.9 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 9
  store i64 1, i64* %arrayidx.9, align 8, !tbaa !19
  %arrayidx12.9 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 9
  store i64 0, i64* %arrayidx12.9, align 8, !tbaa !19
  %arrayidx14.9 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 9
  store i64 0, i64* %arrayidx14.9, align 8, !tbaa !19
  %arrayidx.10 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 10
  store i64 1, i64* %arrayidx.10, align 8, !tbaa !19
  %arrayidx12.10 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 10
  store i64 0, i64* %arrayidx12.10, align 8, !tbaa !19
  %arrayidx14.10 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 10
  store i64 0, i64* %arrayidx14.10, align 8, !tbaa !19
  %arrayidx.11 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 11
  store i64 1, i64* %arrayidx.11, align 8, !tbaa !19
  %arrayidx12.11 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 11
  store i64 0, i64* %arrayidx12.11, align 8, !tbaa !19
  %arrayidx14.11 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 11
  store i64 0, i64* %arrayidx14.11, align 8, !tbaa !19
  %arrayidx.12 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 12
  store i64 1, i64* %arrayidx.12, align 8, !tbaa !19
  %arrayidx12.12 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 12
  store i64 0, i64* %arrayidx12.12, align 8, !tbaa !19
  %arrayidx14.12 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 12
  store i64 0, i64* %arrayidx14.12, align 8, !tbaa !19
  %arrayidx.13 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 13
  store i64 1, i64* %arrayidx.13, align 8, !tbaa !19
  %arrayidx12.13 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 13
  store i64 0, i64* %arrayidx12.13, align 8, !tbaa !19
  %arrayidx14.13 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 13
  store i64 0, i64* %arrayidx14.13, align 8, !tbaa !19
  %arrayidx.14 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 14
  store i64 1, i64* %arrayidx.14, align 8, !tbaa !19
  %arrayidx12.14 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 14
  store i64 0, i64* %arrayidx12.14, align 8, !tbaa !19
  %arrayidx14.14 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 14
  store i64 0, i64* %arrayidx14.14, align 8, !tbaa !19
  %arrayidx.15 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 15
  store i64 1, i64* %arrayidx.15, align 8, !tbaa !19
  %arrayidx12.15 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 15
  store i64 0, i64* %arrayidx12.15, align 8, !tbaa !19
  %arrayidx14.15 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 15
  store i64 0, i64* %arrayidx14.15, align 8, !tbaa !19
  %src_begin = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 2
  %dimensions = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 5
  %10 = load i32, i32* %dimensions, align 4, !tbaa !159
  %cmp17264 = icmp sgt i32 %10, 0
  br i1 %cmp17264, label %for.body19.lr.ph, label %for.cond.cleanup18

for.body19.lr.ph:                                 ; preds = %cond.end8
  %dim23 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i32 0, i32 6
  %dim = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 6
  %11 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim, align 8, !tbaa !160
  %12 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim23, align 8, !tbaa !160
  %wide.trip.count = zext i32 %10 to i64
  %13 = add nsw i64 %wide.trip.count, -1
  %xtraiter = and i64 %wide.trip.count, 7
  %14 = icmp ult i64 %13, 7
  br i1 %14, label %for.cond.cleanup18.loopexit.unr-lcssa, label %for.body19.lr.ph.new

for.body19.lr.ph.new:                             ; preds = %for.body19.lr.ph
  %unroll_iter = and i64 %wide.trip.count, 4294967288
  br label %for.body19

for.cond.cleanup18.loopexit.unr-lcssa:            ; preds = %for.body19, %for.body19.lr.ph
  %add.lcssa.ph = phi i64 [ undef, %for.body19.lr.ph ], [ %add.7, %for.body19 ]
  %indvars.iv.unr = phi i64 [ 0, %for.body19.lr.ph ], [ %indvars.iv.next.7, %for.body19 ]
  %.unr = phi i64 [ 0, %for.body19.lr.ph ], [ %add.7, %for.body19 ]
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod.not, label %for.cond.cleanup18, label %for.body19.epil

for.body19.epil:                                  ; preds = %for.body19.epil, %for.cond.cleanup18.loopexit.unr-lcssa
  %indvars.iv.epil = phi i64 [ %indvars.iv.next.epil, %for.body19.epil ], [ %indvars.iv.unr, %for.cond.cleanup18.loopexit.unr-lcssa ]
  %15 = phi i64 [ %add.epil, %for.body19.epil ], [ %.unr, %for.cond.cleanup18.loopexit.unr-lcssa ]
  %epil.iter = phi i64 [ %epil.iter.sub, %for.body19.epil ], [ %xtraiter, %for.cond.cleanup18.loopexit.unr-lcssa ]
  %16 = trunc i64 %indvars.iv.epil to i32
  %stride.epil = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %11, i32 %16, i32 2
  %17 = load i32, i32* %stride.epil, align 4, !tbaa !164
  %conv22.epil = sext i32 %17 to i64
  %min.epil = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %12, i32 %16, i32 0
  %18 = load i32, i32* %min.epil, align 4, !tbaa !161
  %min29.epil = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %11, i32 %16, i32 0
  %19 = load i32, i32* %min29.epil, align 4, !tbaa !161
  %sub.epil = sub nsw i32 %18, %19
  %conv30.epil = sext i32 %sub.epil to i64
  %mul.epil = mul nsw i64 %conv30.epil, %conv22.epil
  %add.epil = add i64 %mul.epil, %15
  %indvars.iv.next.epil = add nuw nsw i64 %indvars.iv.epil, 1
  %epil.iter.sub = add i64 %epil.iter, -1
  %epil.iter.cmp.not = icmp eq i64 %epil.iter.sub, 0
  br i1 %epil.iter.cmp.not, label %for.cond.cleanup18, label %for.body19.epil, !llvm.loop !177

for.cond.cleanup18:                               ; preds = %for.body19.epil, %for.cond.cleanup18.loopexit.unr-lcssa, %cond.end8
  %20 = phi i64 [ 0, %cond.end8 ], [ %add.lcssa.ph, %for.cond.cleanup18.loopexit.unr-lcssa ], [ %add.epil, %for.body19.epil ]
  %mul37 = mul i64 %20, %conv261
  store i64 %mul37, i64* %src_begin, align 8, !tbaa !176
  %dimensions39 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i32 0, i32 5
  %21 = load i32, i32* %dimensions39, align 4, !tbaa !159
  %cmp40.not = icmp eq i32 %10, %21
  br i1 %cmp40.not, label %lor.lhs.false, label %if.then

for.body19:                                       ; preds = %for.body19, %for.body19.lr.ph.new
  %indvars.iv = phi i64 [ 0, %for.body19.lr.ph.new ], [ %indvars.iv.next.7, %for.body19 ]
  %22 = phi i64 [ 0, %for.body19.lr.ph.new ], [ %add.7, %for.body19 ]
  %niter = phi i64 [ %unroll_iter, %for.body19.lr.ph.new ], [ %niter.nsub.7, %for.body19 ]
  %23 = trunc i64 %indvars.iv to i32
  %stride = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %11, i32 %23, i32 2
  %24 = load i32, i32* %stride, align 4, !tbaa !164
  %conv22 = sext i32 %24 to i64
  %min = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %12, i32 %23, i32 0
  %25 = load i32, i32* %min, align 4, !tbaa !161
  %min29 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %11, i32 %23, i32 0
  %26 = load i32, i32* %min29, align 4, !tbaa !161
  %sub = sub nsw i32 %25, %26
  %conv30 = sext i32 %sub to i64
  %mul = mul nsw i64 %conv30, %conv22
  %add = add i64 %mul, %22
  %27 = trunc i64 %indvars.iv to i32
  %28 = or i32 %27, 1
  %stride.1 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %11, i32 %28, i32 2
  %29 = load i32, i32* %stride.1, align 4, !tbaa !164
  %conv22.1 = sext i32 %29 to i64
  %min.1 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %12, i32 %28, i32 0
  %30 = load i32, i32* %min.1, align 4, !tbaa !161
  %min29.1 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %11, i32 %28, i32 0
  %31 = load i32, i32* %min29.1, align 4, !tbaa !161
  %sub.1 = sub nsw i32 %30, %31
  %conv30.1 = sext i32 %sub.1 to i64
  %mul.1 = mul nsw i64 %conv30.1, %conv22.1
  %add.1 = add i64 %mul.1, %add
  %32 = trunc i64 %indvars.iv to i32
  %33 = or i32 %32, 2
  %stride.2 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %11, i32 %33, i32 2
  %34 = load i32, i32* %stride.2, align 4, !tbaa !164
  %conv22.2 = sext i32 %34 to i64
  %min.2 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %12, i32 %33, i32 0
  %35 = load i32, i32* %min.2, align 4, !tbaa !161
  %min29.2 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %11, i32 %33, i32 0
  %36 = load i32, i32* %min29.2, align 4, !tbaa !161
  %sub.2 = sub nsw i32 %35, %36
  %conv30.2 = sext i32 %sub.2 to i64
  %mul.2 = mul nsw i64 %conv30.2, %conv22.2
  %add.2 = add i64 %mul.2, %add.1
  %37 = trunc i64 %indvars.iv to i32
  %38 = or i32 %37, 3
  %stride.3 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %11, i32 %38, i32 2
  %39 = load i32, i32* %stride.3, align 4, !tbaa !164
  %conv22.3 = sext i32 %39 to i64
  %min.3 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %12, i32 %38, i32 0
  %40 = load i32, i32* %min.3, align 4, !tbaa !161
  %min29.3 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %11, i32 %38, i32 0
  %41 = load i32, i32* %min29.3, align 4, !tbaa !161
  %sub.3 = sub nsw i32 %40, %41
  %conv30.3 = sext i32 %sub.3 to i64
  %mul.3 = mul nsw i64 %conv30.3, %conv22.3
  %add.3 = add i64 %mul.3, %add.2
  %42 = trunc i64 %indvars.iv to i32
  %43 = or i32 %42, 4
  %stride.4 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %11, i32 %43, i32 2
  %44 = load i32, i32* %stride.4, align 4, !tbaa !164
  %conv22.4 = sext i32 %44 to i64
  %min.4 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %12, i32 %43, i32 0
  %45 = load i32, i32* %min.4, align 4, !tbaa !161
  %min29.4 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %11, i32 %43, i32 0
  %46 = load i32, i32* %min29.4, align 4, !tbaa !161
  %sub.4 = sub nsw i32 %45, %46
  %conv30.4 = sext i32 %sub.4 to i64
  %mul.4 = mul nsw i64 %conv30.4, %conv22.4
  %add.4 = add i64 %mul.4, %add.3
  %47 = trunc i64 %indvars.iv to i32
  %48 = or i32 %47, 5
  %stride.5 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %11, i32 %48, i32 2
  %49 = load i32, i32* %stride.5, align 4, !tbaa !164
  %conv22.5 = sext i32 %49 to i64
  %min.5 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %12, i32 %48, i32 0
  %50 = load i32, i32* %min.5, align 4, !tbaa !161
  %min29.5 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %11, i32 %48, i32 0
  %51 = load i32, i32* %min29.5, align 4, !tbaa !161
  %sub.5 = sub nsw i32 %50, %51
  %conv30.5 = sext i32 %sub.5 to i64
  %mul.5 = mul nsw i64 %conv30.5, %conv22.5
  %add.5 = add i64 %mul.5, %add.4
  %52 = trunc i64 %indvars.iv to i32
  %53 = or i32 %52, 6
  %stride.6 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %11, i32 %53, i32 2
  %54 = load i32, i32* %stride.6, align 4, !tbaa !164
  %conv22.6 = sext i32 %54 to i64
  %min.6 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %12, i32 %53, i32 0
  %55 = load i32, i32* %min.6, align 4, !tbaa !161
  %min29.6 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %11, i32 %53, i32 0
  %56 = load i32, i32* %min29.6, align 4, !tbaa !161
  %sub.6 = sub nsw i32 %55, %56
  %conv30.6 = sext i32 %sub.6 to i64
  %mul.6 = mul nsw i64 %conv30.6, %conv22.6
  %add.6 = add i64 %mul.6, %add.5
  %57 = trunc i64 %indvars.iv to i32
  %58 = or i32 %57, 7
  %stride.7 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %11, i32 %58, i32 2
  %59 = load i32, i32* %stride.7, align 4, !tbaa !164
  %conv22.7 = sext i32 %59 to i64
  %min.7 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %12, i32 %58, i32 0
  %60 = load i32, i32* %min.7, align 4, !tbaa !161
  %min29.7 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %11, i32 %58, i32 0
  %61 = load i32, i32* %min29.7, align 4, !tbaa !161
  %sub.7 = sub nsw i32 %60, %61
  %conv30.7 = sext i32 %sub.7 to i64
  %mul.7 = mul nsw i64 %conv30.7, %conv22.7
  %add.7 = add i64 %mul.7, %add.6
  %indvars.iv.next.7 = add nuw nsw i64 %indvars.iv, 8
  %niter.nsub.7 = add i64 %niter, -8
  %niter.ncmp.7 = icmp eq i64 %niter.nsub.7, 0
  br i1 %niter.ncmp.7, label %for.cond.cleanup18.loopexit.unr-lcssa, label %for.body19, !llvm.loop !178

lor.lhs.false:                                    ; preds = %for.cond.cleanup18
  %bits.i249 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i32 0, i32 4, i32 1
  %62 = load i8, i8* %bits.i249, align 1, !tbaa !152
  %conv.i250 = zext i8 %62 to i32
  %add.i251 = add nuw nsw i32 %conv.i250, 7
  %div.i252 = lshr i32 %add.i251, 3
  %cmp45.not = icmp ne i32 %div.i, %div.i252
  %cmp48 = icmp sgt i32 %10, 16
  %or.cond262 = select i1 %cmp45.not, i1 true, i1 %cmp48
  br i1 %or.cond262, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %for.cond.cleanup18
  %63 = bitcast %"struct.Halide::Runtime::Internal::device_copy"* %agg.result to i8*
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(416) %63, i8 0, i64 416, i1 false)
  br label %cleanup

if.end:                                           ; preds = %lor.lhs.false
  %cmp50 = icmp eq i8 %9, 0
  br i1 %cmp50, label %if.then51, label %for.cond54.preheader

for.cond54.preheader:                             ; preds = %if.end
  br i1 %cmp17264, label %for.body58.lr.ph, label %while.end

for.body58.lr.ph:                                 ; preds = %for.cond54.preheader
  %dim70 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 6
  %dim60 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i32 0, i32 6
  %64 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim60, align 8, !tbaa !160
  %65 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim70, align 8, !tbaa !160
  %wide.trip.count286 = zext i32 %10 to i64
  br label %for.body58

if.then51:                                        ; preds = %if.end
  %66 = bitcast %"struct.Halide::Runtime::Internal::device_copy"* %agg.result to i8*
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(416) %66, i8 0, i64 416, i1 false)
  br label %cleanup

while.cond.preheader:                             ; preds = %for.cond.cleanup94
  %.pre = load i64, i64* %chunk_size, align 8, !tbaa !174
  %.pre292 = load i64, i64* %arrayidx12, align 8, !tbaa !19
  %cmp139276 = icmp eq i64 %.pre, %.pre292
  br i1 %cmp139276, label %land.rhs.preheader, label %while.end

land.rhs.preheader:                               ; preds = %while.cond.preheader
  %.pre293 = load i64, i64* %arrayidx14, align 8, !tbaa !19
  br label %land.rhs

for.body58:                                       ; preds = %for.cond.cleanup94, %for.body58.lr.ph
  %indvars.iv282 = phi i64 [ 0, %for.body58.lr.ph ], [ %indvars.iv.next283, %for.cond.cleanup94 ]
  %67 = trunc i64 %indvars.iv282 to i32
  %stride63 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %64, i32 %67, i32 2
  %68 = load i32, i32* %stride63, align 4, !tbaa !164
  %conv64 = sext i32 %68 to i64
  %mul68 = mul nsw i64 %conv64, %conv261
  %stride73 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %65, i32 %67, i32 2
  %69 = load i32, i32* %stride73, align 4, !tbaa !164
  %conv74 = sext i32 %69 to i64
  %mul78 = mul nsw i64 %conv74, %conv261
  %cmp80266.not = icmp eq i64 %indvars.iv282, 0
  br i1 %cmp80266.not, label %for.end91, label %for.body81.lr.ph

for.body81.lr.ph:                                 ; preds = %for.body58
  %cmp86.not = icmp eq i64 %mul68, 0
  br i1 %cmp86.not, label %for.end91, label %for.body81

for.body81:                                       ; preds = %for.inc89, %for.body81.lr.ph
  %indvars.iv278 = phi i64 [ %indvars.iv.next279, %for.inc89 ], [ 0, %for.body81.lr.ph ]
  %70 = trunc i64 %indvars.iv278 to i32
  %arrayidx84 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 %70
  %71 = load i64, i64* %arrayidx84, align 8, !tbaa !19
  %cmp85 = icmp ult i64 %mul68, %71
  br i1 %cmp85, label %for.end91, label %for.inc89

for.inc89:                                        ; preds = %for.body81
  %indvars.iv.next279 = add nuw nsw i64 %indvars.iv278, 1
  %exitcond281.not = icmp eq i64 %indvars.iv.next279, %indvars.iv282
  br i1 %exitcond281.not, label %for.end91, label %for.body81, !llvm.loop !179

for.end91:                                        ; preds = %for.inc89, %for.body81, %for.body81.lr.ph, %for.body58
  %insert.0.lcssa = phi i32 [ 0, %for.body58 ], [ %67, %for.body81.lr.ph ], [ %70, %for.body81 ], [ %67, %for.inc89 ]
  %72 = zext i32 %insert.0.lcssa to i64
  %cmp93270 = icmp ugt i64 %indvars.iv282, %72
  br i1 %cmp93270, label %for.body95.preheader, label %for.cond.cleanup94

for.body95.preheader:                             ; preds = %for.end91
  %73 = sext i32 %insert.0.lcssa to i64
  %74 = sub i64 %indvars.iv282, %73
  %75 = xor i64 %73, -1
  %76 = add i64 %indvars.iv282, %75
  %xtraiter4 = and i64 %74, 7
  %lcmp.mod5.not = icmp eq i64 %xtraiter4, 0
  br i1 %lcmp.mod5.not, label %for.body95.prol.loopexit, label %for.body95.prol

for.body95.prol:                                  ; preds = %for.body95.prol, %for.body95.preheader
  %indvars.iv284.prol = phi i64 [ %indvars.iv.next285.prol, %for.body95.prol ], [ %indvars.iv282, %for.body95.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body95.prol ], [ %xtraiter4, %for.body95.preheader ]
  %indvars.iv.next285.prol = add nsw i64 %indvars.iv284.prol, -1
  %77 = trunc i64 %indvars.iv.next285.prol to i32
  %arrayidx99.prol = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 %77
  %78 = load i64, i64* %arrayidx99.prol, align 8, !tbaa !19
  %79 = trunc i64 %indvars.iv284.prol to i32
  %arrayidx102.prol = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 %79
  store i64 %78, i64* %arrayidx102.prol, align 8, !tbaa !19
  %arrayidx106.prol = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 %77
  %80 = load i64, i64* %arrayidx106.prol, align 8, !tbaa !19
  %arrayidx109.prol = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 %79
  store i64 %80, i64* %arrayidx109.prol, align 8, !tbaa !19
  %arrayidx113.prol = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 %77
  %81 = load i64, i64* %arrayidx113.prol, align 8, !tbaa !19
  %arrayidx116.prol = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 %79
  store i64 %81, i64* %arrayidx116.prol, align 8, !tbaa !19
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp.not = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp.not, label %for.body95.prol.loopexit, label %for.body95.prol, !llvm.loop !180

for.body95.prol.loopexit:                         ; preds = %for.body95.prol, %for.body95.preheader
  %indvars.iv284.unr = phi i64 [ %indvars.iv282, %for.body95.preheader ], [ %indvars.iv.next285.prol, %for.body95.prol ]
  %82 = icmp ult i64 %76, 7
  br i1 %82, label %for.cond.cleanup94, label %for.body95

for.cond.cleanup94:                               ; preds = %for.body95, %for.body95.prol.loopexit, %for.end91
  %extent122 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %64, i32 %67, i32 1
  %83 = load i32, i32* %extent122, align 4, !tbaa !163
  %conv123 = sext i32 %83 to i64
  %arrayidx126 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 %insert.0.lcssa
  store i64 %conv123, i64* %arrayidx126, align 8, !tbaa !19
  %arrayidx129 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 %insert.0.lcssa
  store i64 %mul68, i64* %arrayidx129, align 8, !tbaa !19
  %arrayidx132 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 %insert.0.lcssa
  store i64 %mul78, i64* %arrayidx132, align 8, !tbaa !19
  %indvars.iv.next283 = add nuw nsw i64 %indvars.iv282, 1
  %exitcond287.not = icmp eq i64 %indvars.iv.next283, %wide.trip.count286
  br i1 %exitcond287.not, label %while.cond.preheader, label %for.body58, !llvm.loop !181

for.body95:                                       ; preds = %for.body95, %for.body95.prol.loopexit
  %indvars.iv284 = phi i64 [ %indvars.iv.next285.7, %for.body95 ], [ %indvars.iv284.unr, %for.body95.prol.loopexit ]
  %indvars.iv.next285 = add nsw i64 %indvars.iv284, -1
  %84 = trunc i64 %indvars.iv.next285 to i32
  %arrayidx99 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 %84
  %85 = load i64, i64* %arrayidx99, align 8, !tbaa !19
  %86 = trunc i64 %indvars.iv284 to i32
  %arrayidx102 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 %86
  store i64 %85, i64* %arrayidx102, align 8, !tbaa !19
  %arrayidx106 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 %84
  %87 = load i64, i64* %arrayidx106, align 8, !tbaa !19
  %arrayidx109 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 %86
  store i64 %87, i64* %arrayidx109, align 8, !tbaa !19
  %arrayidx113 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 %84
  %88 = load i64, i64* %arrayidx113, align 8, !tbaa !19
  %arrayidx116 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 %86
  store i64 %88, i64* %arrayidx116, align 8, !tbaa !19
  %indvars.iv.next285.1 = add nsw i64 %indvars.iv284, -2
  %89 = trunc i64 %indvars.iv.next285.1 to i32
  %arrayidx99.1 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 %89
  %90 = load i64, i64* %arrayidx99.1, align 8, !tbaa !19
  %91 = trunc i64 %indvars.iv.next285 to i32
  %arrayidx102.1 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 %91
  store i64 %90, i64* %arrayidx102.1, align 8, !tbaa !19
  %arrayidx106.1 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 %89
  %92 = load i64, i64* %arrayidx106.1, align 8, !tbaa !19
  %arrayidx109.1 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 %91
  store i64 %92, i64* %arrayidx109.1, align 8, !tbaa !19
  %arrayidx113.1 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 %89
  %93 = load i64, i64* %arrayidx113.1, align 8, !tbaa !19
  %arrayidx116.1 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 %91
  store i64 %93, i64* %arrayidx116.1, align 8, !tbaa !19
  %indvars.iv.next285.2 = add nsw i64 %indvars.iv284, -3
  %94 = trunc i64 %indvars.iv.next285.2 to i32
  %arrayidx99.2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 %94
  %95 = load i64, i64* %arrayidx99.2, align 8, !tbaa !19
  %96 = trunc i64 %indvars.iv.next285.1 to i32
  %arrayidx102.2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 %96
  store i64 %95, i64* %arrayidx102.2, align 8, !tbaa !19
  %arrayidx106.2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 %94
  %97 = load i64, i64* %arrayidx106.2, align 8, !tbaa !19
  %arrayidx109.2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 %96
  store i64 %97, i64* %arrayidx109.2, align 8, !tbaa !19
  %arrayidx113.2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 %94
  %98 = load i64, i64* %arrayidx113.2, align 8, !tbaa !19
  %arrayidx116.2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 %96
  store i64 %98, i64* %arrayidx116.2, align 8, !tbaa !19
  %indvars.iv.next285.3 = add nsw i64 %indvars.iv284, -4
  %99 = trunc i64 %indvars.iv.next285.3 to i32
  %arrayidx99.3 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 %99
  %100 = load i64, i64* %arrayidx99.3, align 8, !tbaa !19
  %101 = trunc i64 %indvars.iv.next285.2 to i32
  %arrayidx102.3 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 %101
  store i64 %100, i64* %arrayidx102.3, align 8, !tbaa !19
  %arrayidx106.3 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 %99
  %102 = load i64, i64* %arrayidx106.3, align 8, !tbaa !19
  %arrayidx109.3 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 %101
  store i64 %102, i64* %arrayidx109.3, align 8, !tbaa !19
  %arrayidx113.3 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 %99
  %103 = load i64, i64* %arrayidx113.3, align 8, !tbaa !19
  %arrayidx116.3 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 %101
  store i64 %103, i64* %arrayidx116.3, align 8, !tbaa !19
  %indvars.iv.next285.4 = add nsw i64 %indvars.iv284, -5
  %104 = trunc i64 %indvars.iv.next285.4 to i32
  %arrayidx99.4 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 %104
  %105 = load i64, i64* %arrayidx99.4, align 8, !tbaa !19
  %106 = trunc i64 %indvars.iv.next285.3 to i32
  %arrayidx102.4 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 %106
  store i64 %105, i64* %arrayidx102.4, align 8, !tbaa !19
  %arrayidx106.4 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 %104
  %107 = load i64, i64* %arrayidx106.4, align 8, !tbaa !19
  %arrayidx109.4 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 %106
  store i64 %107, i64* %arrayidx109.4, align 8, !tbaa !19
  %arrayidx113.4 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 %104
  %108 = load i64, i64* %arrayidx113.4, align 8, !tbaa !19
  %arrayidx116.4 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 %106
  store i64 %108, i64* %arrayidx116.4, align 8, !tbaa !19
  %indvars.iv.next285.5 = add nsw i64 %indvars.iv284, -6
  %109 = trunc i64 %indvars.iv.next285.5 to i32
  %arrayidx99.5 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 %109
  %110 = load i64, i64* %arrayidx99.5, align 8, !tbaa !19
  %111 = trunc i64 %indvars.iv.next285.4 to i32
  %arrayidx102.5 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 %111
  store i64 %110, i64* %arrayidx102.5, align 8, !tbaa !19
  %arrayidx106.5 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 %109
  %112 = load i64, i64* %arrayidx106.5, align 8, !tbaa !19
  %arrayidx109.5 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 %111
  store i64 %112, i64* %arrayidx109.5, align 8, !tbaa !19
  %arrayidx113.5 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 %109
  %113 = load i64, i64* %arrayidx113.5, align 8, !tbaa !19
  %arrayidx116.5 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 %111
  store i64 %113, i64* %arrayidx116.5, align 8, !tbaa !19
  %indvars.iv.next285.6 = add nsw i64 %indvars.iv284, -7
  %114 = trunc i64 %indvars.iv.next285.6 to i32
  %arrayidx99.6 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 %114
  %115 = load i64, i64* %arrayidx99.6, align 8, !tbaa !19
  %116 = trunc i64 %indvars.iv.next285.5 to i32
  %arrayidx102.6 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 %116
  store i64 %115, i64* %arrayidx102.6, align 8, !tbaa !19
  %arrayidx106.6 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 %114
  %117 = load i64, i64* %arrayidx106.6, align 8, !tbaa !19
  %arrayidx109.6 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 %116
  store i64 %117, i64* %arrayidx109.6, align 8, !tbaa !19
  %arrayidx113.6 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 %114
  %118 = load i64, i64* %arrayidx113.6, align 8, !tbaa !19
  %arrayidx116.6 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 %116
  store i64 %118, i64* %arrayidx116.6, align 8, !tbaa !19
  %indvars.iv.next285.7 = add nsw i64 %indvars.iv284, -8
  %119 = trunc i64 %indvars.iv.next285.7 to i32
  %arrayidx99.7 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 %119
  %120 = load i64, i64* %arrayidx99.7, align 8, !tbaa !19
  %121 = trunc i64 %indvars.iv.next285.6 to i32
  %arrayidx102.7 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 %121
  store i64 %120, i64* %arrayidx102.7, align 8, !tbaa !19
  %arrayidx106.7 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 %119
  %122 = load i64, i64* %arrayidx106.7, align 8, !tbaa !19
  %arrayidx109.7 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 %121
  store i64 %122, i64* %arrayidx109.7, align 8, !tbaa !19
  %arrayidx113.7 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 %119
  %123 = load i64, i64* %arrayidx113.7, align 8, !tbaa !19
  %arrayidx116.7 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 %121
  store i64 %123, i64* %arrayidx116.7, align 8, !tbaa !19
  %cmp93.7 = icmp sgt i64 %indvars.iv.next285.7, %73
  br i1 %cmp93.7, label %for.body95, label %for.cond.cleanup94, !llvm.loop !182

land.rhs:                                         ; preds = %while.body, %land.rhs.preheader
  %124 = phi i64 [ %129, %while.body ], [ %.pre293, %land.rhs.preheader ]
  %125 = phi i64 [ %mul147, %while.body ], [ %.pre, %land.rhs.preheader ]
  %cmp143 = icmp eq i64 %125, %124
  br i1 %cmp143, label %while.body, label %while.end

while.body:                                       ; preds = %land.rhs
  %126 = load i64, i64* %arrayidx, align 8, !tbaa !19
  %mul147 = mul i64 %126, %124
  store i64 %mul147, i64* %chunk_size, align 8, !tbaa !174
  %127 = load i64, i64* %arrayidx.1, align 8, !tbaa !19
  store i64 %127, i64* %arrayidx, align 8, !tbaa !19
  %128 = load i64, i64* %arrayidx12.1, align 8, !tbaa !19
  store i64 %128, i64* %arrayidx12, align 8, !tbaa !19
  %129 = load i64, i64* %arrayidx14.1, align 8, !tbaa !19
  store i64 %129, i64* %arrayidx14, align 8, !tbaa !19
  %130 = load i64, i64* %arrayidx.2, align 8, !tbaa !19
  store i64 %130, i64* %arrayidx.1, align 8, !tbaa !19
  %131 = load i64, i64* %arrayidx12.2, align 8, !tbaa !19
  store i64 %131, i64* %arrayidx12.1, align 8, !tbaa !19
  %132 = load i64, i64* %arrayidx14.2, align 8, !tbaa !19
  store i64 %132, i64* %arrayidx14.1, align 8, !tbaa !19
  %133 = load i64, i64* %arrayidx.3, align 8, !tbaa !19
  store i64 %133, i64* %arrayidx.2, align 8, !tbaa !19
  %134 = load i64, i64* %arrayidx12.3, align 8, !tbaa !19
  store i64 %134, i64* %arrayidx12.2, align 8, !tbaa !19
  %135 = load i64, i64* %arrayidx14.3, align 8, !tbaa !19
  store i64 %135, i64* %arrayidx14.2, align 8, !tbaa !19
  %136 = load i64, i64* %arrayidx.4, align 8, !tbaa !19
  store i64 %136, i64* %arrayidx.3, align 8, !tbaa !19
  %137 = load i64, i64* %arrayidx12.4, align 8, !tbaa !19
  store i64 %137, i64* %arrayidx12.3, align 8, !tbaa !19
  %138 = load i64, i64* %arrayidx14.4, align 8, !tbaa !19
  store i64 %138, i64* %arrayidx14.3, align 8, !tbaa !19
  %139 = load i64, i64* %arrayidx.5, align 8, !tbaa !19
  store i64 %139, i64* %arrayidx.4, align 8, !tbaa !19
  %140 = load i64, i64* %arrayidx12.5, align 8, !tbaa !19
  store i64 %140, i64* %arrayidx12.4, align 8, !tbaa !19
  %141 = load i64, i64* %arrayidx14.5, align 8, !tbaa !19
  store i64 %141, i64* %arrayidx14.4, align 8, !tbaa !19
  %142 = load i64, i64* %arrayidx.6, align 8, !tbaa !19
  store i64 %142, i64* %arrayidx.5, align 8, !tbaa !19
  %143 = load i64, i64* %arrayidx12.6, align 8, !tbaa !19
  store i64 %143, i64* %arrayidx12.5, align 8, !tbaa !19
  %144 = load i64, i64* %arrayidx14.6, align 8, !tbaa !19
  store i64 %144, i64* %arrayidx14.5, align 8, !tbaa !19
  %145 = load i64, i64* %arrayidx.7, align 8, !tbaa !19
  store i64 %145, i64* %arrayidx.6, align 8, !tbaa !19
  %146 = load i64, i64* %arrayidx12.7, align 8, !tbaa !19
  store i64 %146, i64* %arrayidx12.6, align 8, !tbaa !19
  %147 = load i64, i64* %arrayidx14.7, align 8, !tbaa !19
  store i64 %147, i64* %arrayidx14.6, align 8, !tbaa !19
  %148 = load i64, i64* %arrayidx.8, align 8, !tbaa !19
  store i64 %148, i64* %arrayidx.7, align 8, !tbaa !19
  %149 = load i64, i64* %arrayidx12.8, align 8, !tbaa !19
  store i64 %149, i64* %arrayidx12.7, align 8, !tbaa !19
  %150 = load i64, i64* %arrayidx14.8, align 8, !tbaa !19
  store i64 %150, i64* %arrayidx14.7, align 8, !tbaa !19
  %151 = load i64, i64* %arrayidx.9, align 8, !tbaa !19
  store i64 %151, i64* %arrayidx.8, align 8, !tbaa !19
  %152 = load i64, i64* %arrayidx12.9, align 8, !tbaa !19
  store i64 %152, i64* %arrayidx12.8, align 8, !tbaa !19
  %153 = load i64, i64* %arrayidx14.9, align 8, !tbaa !19
  store i64 %153, i64* %arrayidx14.8, align 8, !tbaa !19
  %154 = load i64, i64* %arrayidx.10, align 8, !tbaa !19
  store i64 %154, i64* %arrayidx.9, align 8, !tbaa !19
  %155 = load i64, i64* %arrayidx12.10, align 8, !tbaa !19
  store i64 %155, i64* %arrayidx12.9, align 8, !tbaa !19
  %156 = load i64, i64* %arrayidx14.10, align 8, !tbaa !19
  store i64 %156, i64* %arrayidx14.9, align 8, !tbaa !19
  %157 = load i64, i64* %arrayidx.11, align 8, !tbaa !19
  store i64 %157, i64* %arrayidx.10, align 8, !tbaa !19
  %158 = load i64, i64* %arrayidx12.11, align 8, !tbaa !19
  store i64 %158, i64* %arrayidx12.10, align 8, !tbaa !19
  %159 = load i64, i64* %arrayidx14.11, align 8, !tbaa !19
  store i64 %159, i64* %arrayidx14.10, align 8, !tbaa !19
  %160 = load i64, i64* %arrayidx.12, align 8, !tbaa !19
  store i64 %160, i64* %arrayidx.11, align 8, !tbaa !19
  %161 = load i64, i64* %arrayidx12.12, align 8, !tbaa !19
  store i64 %161, i64* %arrayidx12.11, align 8, !tbaa !19
  %162 = load i64, i64* %arrayidx14.12, align 8, !tbaa !19
  store i64 %162, i64* %arrayidx14.11, align 8, !tbaa !19
  %163 = load i64, i64* %arrayidx.13, align 8, !tbaa !19
  store i64 %163, i64* %arrayidx.12, align 8, !tbaa !19
  %164 = load i64, i64* %arrayidx12.13, align 8, !tbaa !19
  store i64 %164, i64* %arrayidx12.12, align 8, !tbaa !19
  %165 = load i64, i64* %arrayidx14.13, align 8, !tbaa !19
  store i64 %165, i64* %arrayidx14.12, align 8, !tbaa !19
  %166 = load i64, i64* %arrayidx.14, align 8, !tbaa !19
  store i64 %166, i64* %arrayidx.13, align 8, !tbaa !19
  %167 = load i64, i64* %arrayidx12.14, align 8, !tbaa !19
  store i64 %167, i64* %arrayidx12.13, align 8, !tbaa !19
  %168 = load i64, i64* %arrayidx14.14, align 8, !tbaa !19
  store i64 %168, i64* %arrayidx14.13, align 8, !tbaa !19
  %169 = load i64, i64* %arrayidx.15, align 8, !tbaa !19
  store i64 %169, i64* %arrayidx.14, align 8, !tbaa !19
  %170 = load i64, i64* %arrayidx12.15, align 8, !tbaa !19
  store i64 %170, i64* %arrayidx12.14, align 8, !tbaa !19
  %171 = load i64, i64* %arrayidx14.15, align 8, !tbaa !19
  store i64 %171, i64* %arrayidx14.14, align 8, !tbaa !19
  store i64 1, i64* %arrayidx.15, align 8, !tbaa !19
  store i64 0, i64* %arrayidx12.15, align 8, !tbaa !19
  store i64 0, i64* %arrayidx14.15, align 8, !tbaa !19
  %cmp139 = icmp eq i64 %mul147, %128
  br i1 %cmp139, label %land.rhs, label %while.end, !llvm.loop !183

while.end:                                        ; preds = %while.body, %land.rhs, %while.cond.preheader, %for.cond54.preheader
  %172 = bitcast %"struct.Halide::Runtime::Internal::device_copy"* %agg.result to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(416) %172, i8* noundef nonnull align 8 dereferenceable(416) %0, i64 416, i1 false), !tbaa.struct !184
  br label %cleanup

cleanup:                                          ; preds = %while.end, %if.then51, %if.then
  call void @llvm.lifetime.end.p0i8(i64 416, i8* nonnull %0) #10
  ret void
}

; Function Attrs: mustprogress nounwind
define linkonce i32 @_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t(i8* %user_context, %struct.halide_buffer_t* %buf) local_unnamed_addr #0 {
entry:
  %flags.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %0 = load i64, i64* %flags.i.i, align 8, !tbaa !158
  %and.i.i = and i64 %0, 2
  %cmp.i.i.not = icmp eq i64 %and.i.i, 0
  br i1 %cmp.i.i.not, label %return, label %if.end

if.end:                                           ; preds = %entry
  %device_interface = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %1 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !156
  %and.i.i45 = and i64 %0, 1
  %cmp.i.i46.not = icmp eq i64 %and.i.i45, 0
  br i1 %cmp.i.i46.not, label %if.end9, label %return

if.end9:                                          ; preds = %if.end
  %cmp = icmp eq %struct.halide_device_interface_t* %1, null
  br i1 %cmp, label %return, label %if.end15

if.end15:                                         ; preds = %if.end9
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %1, i32 0, i32 15
  %2 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !185
  %copy_to_host = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %2, i32 0, i32 6
  %3 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %copy_to_host, align 8, !tbaa !187
  %call16 = tail call i32 %3(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #12
  %cmp17.not = icmp eq i32 %call16, 0
  br i1 %cmp17.not, label %if.end23, label %return

if.end23:                                         ; preds = %if.end15
  %4 = load i64, i64* %flags.i.i, align 8, !tbaa !158
  %and.i.i48 = and i64 %4, -3
  store i64 %and.i.i48, i64* %flags.i.i, align 8, !tbaa !158
  %call24 = tail call i32 @halide_msan_annotate_buffer_is_initialized(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #12
  br label %return

return:                                           ; preds = %if.end23, %if.end15, %if.end9, %if.end, %entry
  %retval.2 = phi i32 [ 0, %entry ], [ 0, %if.end23 ], [ -14, %if.end ], [ -19, %if.end9 ], [ -14, %if.end15 ]
  ret i32 %retval.2
}

; Function Attrs: mustprogress nounwind
define weak void @halide_device_release(i8* %user_context, %struct.halide_device_interface_t* %device_interface) local_unnamed_addr #0 {
entry:
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %device_interface, i32 0, i32 15
  %0 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !185
  %device_release = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %0, i32 0, i32 5
  %1 = load i32 (i8*)*, i32 (i8*)** %device_release, align 8, !tbaa !189
  %call = tail call i32 %1(i8* %user_context) #12
  ret void
}

; Function Attrs: nounwind
define weak i32 @halide_copy_to_host(i8* %user_context, %struct.halide_buffer_t* %buf) local_unnamed_addr #3 {
entry:
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #12
  %cmp.i = icmp eq %struct.halide_buffer_t* %buf, null
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.6.22, i32 0, i32 0)) #12
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end.i:                                         ; preds = %entry
  %device_interface.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %0 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface.i, align 8, !tbaa !156
  %cmp4.not.i = icmp eq %struct.halide_device_interface_t* %0, null
  %device.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %1 = load i64, i64* %device.i, align 8, !tbaa !154
  %cmp5.not.i = icmp eq i64 %1, 0
  %cmp4.not.not.i = xor i1 %cmp4.not.i, true
  %brmerge.i = select i1 %cmp5.not.i, i1 true, i1 %cmp4.not.not.i
  br i1 %brmerge.i, label %if.end10.i, label %if.then8.i

if.then8.i:                                       ; preds = %if.end.i
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #12
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = select i1 %cmp4.not.i, i1 true, i1 %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #12
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i.i, align 8, !tbaa !158
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end16.i.split

if.end16.i.split:                                 ; preds = %if.end16.i
  %call11 = tail call i32 @_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #13
  br label %cleanup

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #12
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit: ; preds = %if.then24.i, %if.then14.i, %if.then8.i, %if.then.i
  %retval.2.i = phi i32 [ %call.i, %if.then.i ], [ %call15.i, %if.then14.i ], [ %call9.i, %if.then8.i ], [ %call25.i, %if.then24.i ]
  %cmp.not = icmp eq i32 %retval.2.i, 0
  br i1 %cmp.not, label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split, label %cleanup

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split: ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %call12 = tail call i32 @_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t(i8* %user_context, %struct.halide_buffer_t* %buf) #13
  br label %cleanup

cleanup:                                          ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit, %if.end16.i.split
  %retval.0 = phi i32 [ %retval.2.i, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit ], [ %call11, %if.end16.i.split ], [ %call12, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split ]
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #12
  ret i32 %retval.0
}

; Function Attrs: mustprogress nounwind
define linkonce i32 @copy_to_device_already_locked(i8* %user_context, %struct.halide_buffer_t* %buf, %struct.halide_device_interface_t* %device_interface) local_unnamed_addr #0 {
entry:
  %cmp.i = icmp eq %struct.halide_buffer_t* %buf, null
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.7.23, i32 0, i32 0)) #12
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end.i:                                         ; preds = %entry
  %device_interface.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %0 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface.i, align 8, !tbaa !156
  %cmp4.not.i = icmp eq %struct.halide_device_interface_t* %0, null
  %device.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %1 = load i64, i64* %device.i, align 8, !tbaa !154
  %cmp5.not.i = icmp eq i64 %1, 0
  %cmp4.not.not.i = xor i1 %cmp4.not.i, true
  %brmerge.i = select i1 %cmp5.not.i, i1 true, i1 %cmp4.not.not.i
  br i1 %brmerge.i, label %if.end10.i, label %if.then8.i

if.then8.i:                                       ; preds = %if.end.i
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #12
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = select i1 %cmp4.not.i, i1 true, i1 %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #12
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i.i, align 8, !tbaa !158
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #12
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
  %4 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface5, align 8, !tbaa !156
  %cmp6 = icmp eq %struct.halide_device_interface_t* %4, null
  br i1 %cmp6, label %if.then7, label %if.end11

if.then7:                                         ; preds = %if.then2
  %call8 = tail call i32 @halide_error_no_device_interface(i8* %user_context) #12
  br label %cleanup

if.end11:                                         ; preds = %if.then2, %if.end
  %device_interface.addr.0 = phi %struct.halide_device_interface_t* [ %device_interface, %if.end ], [ %4, %if.then2 ]
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %5 = load i64, i64* %device, align 8, !tbaa !154
  %tobool.not = icmp eq i64 %5, 0
  br i1 %tobool.not, label %if.then18, label %land.lhs.true

land.lhs.true:                                    ; preds = %if.end11
  %device_interface12 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %6 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface12, align 8, !tbaa !156
  %cmp13.not = icmp eq %struct.halide_device_interface_t* %6, %device_interface.addr.0
  br i1 %cmp13.not, label %if.end27, label %if.then14

if.then14:                                        ; preds = %land.lhs.true
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([61 x i8], [61 x i8]* @.str.9.24, i32 0, i32 0)) #12
  br label %cleanup

if.then18:                                        ; preds = %if.end11
  %call19 = tail call i32 @halide_device_malloc(i8* %user_context, %struct.halide_buffer_t* nonnull %buf, %struct.halide_device_interface_t* nonnull %device_interface.addr.0) #13
  %cmp20.not = icmp eq i32 %call19, 0
  br i1 %cmp20.not, label %if.end27, label %cleanup

if.end27:                                         ; preds = %if.then18, %land.lhs.true
  %flags.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %7 = load i64, i64* %flags.i.i, align 8, !tbaa !158
  %and.i.i = and i64 %7, 1
  %cmp.i.i.not = icmp eq i64 %and.i.i, 0
  br i1 %cmp.i.i.not, label %cleanup, label %if.then29

if.then29:                                        ; preds = %if.end27
  %and.i.i97 = and i64 %7, 2
  %cmp.i.i98.not = icmp eq i64 %and.i.i97, 0
  br i1 %cmp.i.i98.not, label %if.else, label %cleanup

if.else:                                          ; preds = %if.then29
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %device_interface.addr.0, i32 0, i32 15
  %8 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !185
  %copy_to_device = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %8, i32 0, i32 7
  %9 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %copy_to_device, align 8, !tbaa !190
  %call44 = tail call i32 %9(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #12
  %cmp45 = icmp eq i32 %call44, 0
  br i1 %cmp45, label %if.then46, label %cleanup

if.then46:                                        ; preds = %if.else
  %10 = load i64, i64* %flags.i.i, align 8, !tbaa !158
  %and.i.i100 = and i64 %10, -2
  store i64 %and.i.i100, i64* %flags.i.i, align 8, !tbaa !158
  br label %cleanup

cleanup:                                          ; preds = %if.then46, %if.else, %if.then29, %if.end27, %if.then18, %if.then14, %if.then7, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %retval.0 = phi i32 [ %call8, %if.then7 ], [ -42, %if.then14 ], [ %retval.2.i, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit ], [ 0, %if.then46 ], [ %call19, %if.then18 ], [ -15, %if.then29 ], [ -15, %if.else ], [ 0, %if.end27 ]
  ret i32 %retval.0
}

; Function Attrs: mustprogress nounwind
define weak i32 @halide_device_malloc(i8* %user_context, %struct.halide_buffer_t* %buf, %struct.halide_device_interface_t* %device_interface) local_unnamed_addr #0 {
entry:
  %cmp.i = icmp eq %struct.halide_buffer_t* %buf, null
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.17.25, i32 0, i32 0)) #12
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end.i:                                         ; preds = %entry
  %device_interface.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %0 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface.i, align 8, !tbaa !156
  %cmp4.not.i = icmp eq %struct.halide_device_interface_t* %0, null
  %device.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %1 = load i64, i64* %device.i, align 8, !tbaa !154
  %cmp5.not.i = icmp eq i64 %1, 0
  %cmp4.not.not.i = xor i1 %cmp4.not.i, true
  %brmerge.i = select i1 %cmp5.not.i, i1 true, i1 %cmp4.not.not.i
  br i1 %brmerge.i, label %if.end10.i, label %if.then8.i

if.then8.i:                                       ; preds = %if.end.i
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #12
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = select i1 %cmp4.not.i, i1 true, i1 %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #12
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i.i, align 8, !tbaa !158
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #12
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit: ; preds = %if.then24.i, %if.then14.i, %if.then8.i, %if.then.i
  %retval.2.i = phi i32 [ %call.i, %if.then.i ], [ %call15.i, %if.then14.i ], [ %call9.i, %if.then8.i ], [ %call25.i, %if.then24.i ]
  %cmp.not = icmp eq i32 %retval.2.i, 0
  br i1 %cmp.not, label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, label %cleanup12

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge: ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %device_interface3.phi.trans.insert = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %.pre = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface3.phi.trans.insert, align 8, !tbaa !156
  br label %if.end

if.end:                                           ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, %if.end16.i
  %4 = phi %struct.halide_device_interface_t* [ %.pre, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge ], [ %0, %if.end16.i ]
  %cmp4.not = icmp eq %struct.halide_device_interface_t* %4, null
  %cmp5.not = icmp eq %struct.halide_device_interface_t* %4, %device_interface
  %or.cond = select i1 %cmp4.not, i1 true, i1 %cmp5.not
  br i1 %or.cond, label %if.end7, label %if.then6

if.then6:                                         ; preds = %if.end
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.20.26, i32 0, i32 0)) #12
  br label %cleanup12

if.end7:                                          ; preds = %if.end
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %device_interface, i32 0, i32 15
  %5 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !185
  %use_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %5, i32 0, i32 0
  %6 = load void ()*, void ()** %use_module, align 8, !tbaa !191
  tail call void %6() #12
  %7 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !185
  %device_malloc = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %7, i32 0, i32 2
  %8 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %device_malloc, align 8, !tbaa !192
  %call9 = tail call i32 %8(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #12
  %9 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !185
  %release_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %9, i32 0, i32 1
  %10 = load void ()*, void ()** %release_module, align 8, !tbaa !193
  tail call void %10() #12
  %tobool.not = icmp eq i32 %call9, 0
  %. = select i1 %tobool.not, i32 0, i32 -16
  br label %cleanup12

cleanup12:                                        ; preds = %if.end7, %if.then6, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %retval.1 = phi i32 [ %retval.2.i, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit ], [ -42, %if.then6 ], [ %., %if.end7 ]
  ret i32 %retval.1
}

; Function Attrs: nounwind
define weak i32 @halide_copy_to_device(i8* %user_context, %struct.halide_buffer_t* %buf, %struct.halide_device_interface_t* %device_interface) local_unnamed_addr #3 {
entry:
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #12
  %call = tail call i32 @copy_to_device_already_locked(i8* %user_context, %struct.halide_buffer_t* %buf, %struct.halide_device_interface_t* %device_interface) #13
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #12
  ret i32 %call
}

; Function Attrs: mustprogress nounwind
define weak i32 @halide_device_sync(i8* %user_context, %struct.halide_buffer_t* %buf) local_unnamed_addr #0 {
entry:
  %cmp.i = icmp eq %struct.halide_buffer_t* %buf, null
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.16.27, i32 0, i32 0)) #12
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end.i:                                         ; preds = %entry
  %device_interface.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %0 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface.i, align 8, !tbaa !156
  %cmp4.not.i = icmp eq %struct.halide_device_interface_t* %0, null
  %device.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %1 = load i64, i64* %device.i, align 8, !tbaa !154
  %cmp5.not.i = icmp eq i64 %1, 0
  %cmp4.not.not.i = xor i1 %cmp4.not.i, true
  %brmerge.i = select i1 %cmp5.not.i, i1 true, i1 %cmp4.not.not.i
  br i1 %brmerge.i, label %if.end10.i, label %if.then8.i

if.then8.i:                                       ; preds = %if.end.i
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #12
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = select i1 %cmp4.not.i, i1 true, i1 %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #12
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i.i, align 8, !tbaa !158
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #12
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit: ; preds = %if.then24.i, %if.then14.i, %if.then8.i, %if.then.i
  %retval.2.i = phi i32 [ %call.i, %if.then.i ], [ %call15.i, %if.then14.i ], [ %call9.i, %if.then8.i ], [ %call25.i, %if.then24.i ]
  %cmp.not = icmp eq i32 %retval.2.i, 0
  br i1 %cmp.not, label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, label %cleanup8

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge: ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %device_interface1.phi.trans.insert = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %.pre = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface1.phi.trans.insert, align 8, !tbaa !156
  br label %if.end

if.end:                                           ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, %if.end16.i
  %4 = phi %struct.halide_device_interface_t* [ %.pre, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge ], [ %0, %if.end16.i ]
  %cmp2 = icmp eq %struct.halide_device_interface_t* %4, null
  br i1 %cmp2, label %if.then3, label %if.end5

if.then3:                                         ; preds = %if.end
  %call4 = tail call i32 @halide_error_no_device_interface(i8* %user_context) #12
  br label %cleanup8

if.end5:                                          ; preds = %if.end
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %4, i32 0, i32 15
  %5 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !185
  %device_sync = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %5, i32 0, i32 4
  %6 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %device_sync, align 8, !tbaa !194
  %call6 = tail call i32 %6(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #12
  %tobool.not = icmp eq i32 %call6, 0
  %. = select i1 %tobool.not, i32 0, i32 -17
  br label %cleanup8

cleanup8:                                         ; preds = %if.end5, %if.then3, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %retval.1 = phi i32 [ %retval.2.i, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit ], [ %call4, %if.then3 ], [ %., %if.end5 ]
  ret i32 %retval.1
}

; Function Attrs: mustprogress nounwind
define weak i32 @halide_device_free(i8* %user_context, %struct.halide_buffer_t* %buf) local_unnamed_addr #0 {
entry:
  %cmp.i = icmp eq %struct.halide_buffer_t* %buf, null
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.21.28, i32 0, i32 0)) #12
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end.i:                                         ; preds = %entry
  %device_interface.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %0 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface.i, align 8, !tbaa !156
  %cmp4.not.i = icmp eq %struct.halide_device_interface_t* %0, null
  %device.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %1 = load i64, i64* %device.i, align 8, !tbaa !154
  %cmp5.not.i = icmp eq i64 %1, 0
  %cmp4.not.not.i = xor i1 %cmp4.not.i, true
  %brmerge.i = select i1 %cmp5.not.i, i1 true, i1 %cmp4.not.not.i
  br i1 %brmerge.i, label %if.end10.i, label %if.then8.i

if.then8.i:                                       ; preds = %if.end.i
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #12
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = select i1 %cmp4.not.i, i1 true, i1 %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #12
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i.i, align 8, !tbaa !158
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #12
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit: ; preds = %if.then24.i, %if.then14.i, %if.then8.i, %if.then.i
  %retval.2.i = phi i32 [ %call.i, %if.then.i ], [ %call15.i, %if.then14.i ], [ %call9.i, %if.then8.i ], [ %call25.i, %if.then24.i ]
  %cmp.not = icmp eq i32 %retval.2.i, 0
  br i1 %cmp.not, label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, label %cleanup12

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge: ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %device_interface1.phi.trans.insert = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %.pre = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface1.phi.trans.insert, align 8, !tbaa !156
  br label %if.end

if.end:                                           ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, %if.end16.i
  %4 = phi %struct.halide_device_interface_t* [ %.pre, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge ], [ %0, %if.end16.i ]
  %cmp2.not = icmp eq %struct.halide_device_interface_t* %4, null
  br i1 %cmp2.not, label %if.end11, label %if.then3

if.then3:                                         ; preds = %if.end
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %4, i32 0, i32 15
  %5 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !185
  %use_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %5, i32 0, i32 0
  %6 = load void ()*, void ()** %use_module, align 8, !tbaa !191
  tail call void %6() #12
  %7 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !185
  %device_free = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %7, i32 0, i32 3
  %8 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %device_free, align 8, !tbaa !195
  %call5 = tail call i32 %8(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #12
  %9 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !185
  %release_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %9, i32 0, i32 1
  %10 = load void ()*, void ()** %release_module, align 8, !tbaa !193
  tail call void %10() #12
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %11 = load i64, i64* %device, align 8, !tbaa !154
  %cmp7 = icmp eq i64 %11, 0
  br i1 %cmp7, label %do.end, label %if.then8

if.then8:                                         ; preds = %if.then3
  tail call void @halide_print(i8* %user_context, i8* getelementptr inbounds ([109 x i8], [109 x i8]* @.str.22.29, i32 0, i32 0)) #12
  tail call void @abort() #12
  br label %do.end

do.end:                                           ; preds = %if.then8, %if.then3
  %tobool.not = icmp eq i32 %call5, 0
  %. = select i1 %tobool.not, i32 0, i32 -18
  br label %cleanup12

if.end11:                                         ; preds = %if.end
  %flags.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %12 = load i64, i64* %flags.i.i, align 8, !tbaa !158
  %and.i.i = and i64 %12, -3
  store i64 %and.i.i, i64* %flags.i.i, align 8, !tbaa !158
  br label %cleanup12

cleanup12:                                        ; preds = %if.end11, %do.end, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %retval.1 = phi i32 [ %retval.2.i, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit ], [ 0, %if.end11 ], [ %., %do.end ]
  ret i32 %retval.1
}

; Function Attrs: mustprogress nounwind
define weak void @halide_device_free_as_destructor(i8* %user_context, i8* %obj) local_unnamed_addr #0 {
entry:
  %0 = bitcast i8* %obj to %struct.halide_buffer_t*
  %call = tail call i32 @halide_device_free(i8* %user_context, %struct.halide_buffer_t* %0) #13
  ret void
}

; Function Attrs: mustprogress nounwind
define weak i32 @halide_device_and_host_malloc(i8* %user_context, %struct.halide_buffer_t* %buf, %struct.halide_device_interface_t* %device_interface) local_unnamed_addr #0 {
entry:
  %cmp.i = icmp eq %struct.halide_buffer_t* %buf, null
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.23.30, i32 0, i32 0)) #12
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end.i:                                         ; preds = %entry
  %device_interface.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %0 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface.i, align 8, !tbaa !156
  %cmp4.not.i = icmp eq %struct.halide_device_interface_t* %0, null
  %device.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %1 = load i64, i64* %device.i, align 8, !tbaa !154
  %cmp5.not.i = icmp eq i64 %1, 0
  %cmp4.not.not.i = xor i1 %cmp4.not.i, true
  %brmerge.i = select i1 %cmp5.not.i, i1 true, i1 %cmp4.not.not.i
  br i1 %brmerge.i, label %if.end10.i, label %if.then8.i

if.then8.i:                                       ; preds = %if.end.i
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #12
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = select i1 %cmp4.not.i, i1 true, i1 %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #12
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i.i, align 8, !tbaa !158
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #12
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit: ; preds = %if.then24.i, %if.then14.i, %if.then8.i, %if.then.i
  %retval.2.i = phi i32 [ %call.i, %if.then.i ], [ %call15.i, %if.then14.i ], [ %call9.i, %if.then8.i ], [ %call25.i, %if.then24.i ]
  %cmp.not = icmp eq i32 %retval.2.i, 0
  br i1 %cmp.not, label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, label %cleanup14

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge: ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %device_interface3.phi.trans.insert = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %.pre = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface3.phi.trans.insert, align 8, !tbaa !156
  br label %if.end

if.end:                                           ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, %if.end16.i
  %4 = phi %struct.halide_device_interface_t* [ %.pre, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge ], [ %0, %if.end16.i ]
  %cmp4.not = icmp eq %struct.halide_device_interface_t* %4, null
  %cmp5.not = icmp eq %struct.halide_device_interface_t* %4, %device_interface
  %or.cond = select i1 %cmp4.not, i1 true, i1 %cmp5.not
  br i1 %or.cond, label %if.end7, label %cleanup14.sink.split

if.end7:                                          ; preds = %if.end
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %device_interface, i32 0, i32 15
  %5 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !185
  %use_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %5, i32 0, i32 0
  %6 = load void ()*, void ()** %use_module, align 8, !tbaa !191
  tail call void %6() #12
  %7 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !185
  %device_and_host_malloc = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %7, i32 0, i32 8
  %8 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %device_and_host_malloc, align 8, !tbaa !196
  %call9 = tail call i32 %8(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #12
  %9 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !185
  %release_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %9, i32 0, i32 1
  %10 = load void ()*, void ()** %release_module, align 8, !tbaa !193
  tail call void %10() #12
  %cmp11.not = icmp eq i32 %call9, 0
  br i1 %cmp11.not, label %cleanup14, label %cleanup14.sink.split

cleanup14.sink.split:                             ; preds = %if.end7, %if.end
  %.sink = phi i8* [ getelementptr inbounds ([68 x i8], [68 x i8]* @.str.25.31, i32 0, i32 0), %if.end ], [ getelementptr inbounds ([42 x i8], [42 x i8]* @.str.26, i32 0, i32 0), %if.end7 ]
  %retval.1.ph = phi i32 [ -42, %if.end ], [ -16, %if.end7 ]
  tail call void @halide_error(i8* %user_context, i8* %.sink) #12
  br label %cleanup14

cleanup14:                                        ; preds = %cleanup14.sink.split, %if.end7, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %retval.1 = phi i32 [ %retval.2.i, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit ], [ 0, %if.end7 ], [ %retval.1.ph, %cleanup14.sink.split ]
  ret i32 %retval.1
}

; Function Attrs: mustprogress nounwind
define weak i32 @halide_device_and_host_free(i8* %user_context, %struct.halide_buffer_t* %buf) local_unnamed_addr #0 {
entry:
  %cmp.i = icmp eq %struct.halide_buffer_t* %buf, null
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.27, i32 0, i32 0)) #12
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end.i:                                         ; preds = %entry
  %device_interface.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %0 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface.i, align 8, !tbaa !156
  %cmp4.not.i = icmp eq %struct.halide_device_interface_t* %0, null
  %device.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %1 = load i64, i64* %device.i, align 8, !tbaa !154
  %cmp5.not.i = icmp eq i64 %1, 0
  %cmp4.not.not.i = xor i1 %cmp4.not.i, true
  %brmerge.i = select i1 %cmp5.not.i, i1 true, i1 %cmp4.not.not.i
  br i1 %brmerge.i, label %if.end10.i, label %if.then8.i

if.then8.i:                                       ; preds = %if.end.i
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #12
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = select i1 %cmp4.not.i, i1 true, i1 %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #12
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i.i, align 8, !tbaa !158
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #12
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit: ; preds = %if.then24.i, %if.then14.i, %if.then8.i, %if.then.i
  %retval.2.i = phi i32 [ %call.i, %if.then.i ], [ %call15.i, %if.then14.i ], [ %call9.i, %if.then8.i ], [ %call25.i, %if.then24.i ]
  %cmp.not = icmp eq i32 %retval.2.i, 0
  br i1 %cmp.not, label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, label %cleanup18

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge: ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %device_interface1.phi.trans.insert = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %.pre = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface1.phi.trans.insert, align 8, !tbaa !156
  br label %if.end

if.end:                                           ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, %if.end16.i
  %4 = phi %struct.halide_device_interface_t* [ %.pre, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge ], [ %0, %if.end16.i ]
  %cmp2.not = icmp eq %struct.halide_device_interface_t* %4, null
  br i1 %cmp2.not, label %if.else11, label %if.then3

if.then3:                                         ; preds = %if.end
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %4, i32 0, i32 15
  %5 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !185
  %use_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %5, i32 0, i32 0
  %6 = load void ()*, void ()** %use_module, align 8, !tbaa !191
  tail call void %6() #12
  %7 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !185
  %device_and_host_free = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %7, i32 0, i32 9
  %8 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %device_and_host_free, align 8, !tbaa !197
  %call5 = tail call i32 %8(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #12
  %9 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !185
  %release_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %9, i32 0, i32 1
  %10 = load void ()*, void ()** %release_module, align 8, !tbaa !193
  tail call void %10() #12
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %11 = load i64, i64* %device, align 8, !tbaa !154
  %cmp7 = icmp eq i64 %11, 0
  br i1 %cmp7, label %do.end, label %if.then8

if.then8:                                         ; preds = %if.then3
  tail call void @halide_print(i8* %user_context, i8* getelementptr inbounds ([109 x i8], [109 x i8]* @.str.28, i32 0, i32 0)) #12
  tail call void @abort() #12
  br label %do.end

do.end:                                           ; preds = %if.then8, %if.then3
  %tobool.not = icmp eq i32 %call5, 0
  %. = select i1 %tobool.not, i32 0, i32 -18
  br label %cleanup18

if.else11:                                        ; preds = %if.end
  %host = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 2
  %12 = load i8*, i8** %host, align 8, !tbaa !157
  %tobool12.not = icmp eq i8* %12, null
  br i1 %tobool12.not, label %if.end17, label %if.then13

if.then13:                                        ; preds = %if.else11
  tail call void @halide_free(i8* %user_context, i8* nonnull %12) #12
  store i8* null, i8** %host, align 8, !tbaa !157
  br label %if.end17

if.end17:                                         ; preds = %if.then13, %if.else11
  %flags.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %13 = load i64, i64* %flags.i.i, align 8, !tbaa !158
  %and.i.i = and i64 %13, -3
  store i64 %and.i.i, i64* %flags.i.i, align 8, !tbaa !158
  br label %cleanup18

cleanup18:                                        ; preds = %if.end17, %do.end, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %retval.1 = phi i32 [ %retval.2.i, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit ], [ 0, %if.end17 ], [ %., %do.end ]
  ret i32 %retval.1
}

; Function Attrs: mustprogress nounwind
define weak i32 @halide_default_device_and_host_malloc(i8* %user_context, %struct.halide_buffer_t* %buf, %struct.halide_device_interface_t* %device_interface) local_unnamed_addr #0 {
entry:
  %cmp.i = icmp eq %struct.halide_buffer_t* %buf, null
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.29, i32 0, i32 0)) #12
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end.i:                                         ; preds = %entry
  %device_interface.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %0 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface.i, align 8, !tbaa !156
  %cmp4.not.i = icmp eq %struct.halide_device_interface_t* %0, null
  %device.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %1 = load i64, i64* %device.i, align 8, !tbaa !154
  %cmp5.not.i = icmp eq i64 %1, 0
  %cmp4.not.not.i = xor i1 %cmp4.not.i, true
  %brmerge.i = select i1 %cmp5.not.i, i1 true, i1 %cmp4.not.not.i
  br i1 %brmerge.i, label %if.end10.i, label %if.then8.i

if.then8.i:                                       ; preds = %if.end.i
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #12
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = select i1 %cmp4.not.i, i1 true, i1 %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #12
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i.i, align 8, !tbaa !158
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #12
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit: ; preds = %if.then24.i, %if.then14.i, %if.then8.i, %if.then.i
  %retval.2.i = phi i32 [ %call.i, %if.then.i ], [ %call15.i, %if.then14.i ], [ %call9.i, %if.then8.i ], [ %call25.i, %if.then24.i ]
  %cmp.not = icmp eq i32 %retval.2.i, 0
  br i1 %cmp.not, label %if.end, label %cleanup13

if.end:                                           ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit, %if.end16.i
  %dimensions.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 5
  %4 = load i32, i32* %dimensions.i.i, align 4, !tbaa !159
  %dim.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 6
  %5 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim.i.i, align 8
  %cmp19.i.i = icmp sgt i32 %4, 0
  br i1 %cmp19.i.i, label %for.body.preheader.i.i, label %_ZNK15halide_buffer_t13size_in_bytesEv.exit

for.body.preheader.i.i:                           ; preds = %if.end
  %wide.trip.count.i.i = zext i32 %4 to i64
  %6 = add nsw i64 %wide.trip.count.i.i, -1
  %xtraiter = and i64 %wide.trip.count.i.i, 7
  %7 = icmp ult i64 %6, 7
  br i1 %7, label %for.body.i12.i.preheader.unr-lcssa, label %for.body.preheader.i.i.new

for.body.preheader.i.i.new:                       ; preds = %for.body.preheader.i.i
  %unroll_iter = and i64 %wide.trip.count.i.i, 4294967288
  br label %for.body.i.i

for.body.i.i:                                     ; preds = %if.end.i.i.7, %for.body.preheader.i.i.new
  %indvars.iv.i.i = phi i64 [ 0, %for.body.preheader.i.i.new ], [ %indvars.iv.next.i.i.7, %if.end.i.i.7 ]
  %index.021.i.i = phi i64 [ 0, %for.body.preheader.i.i.new ], [ %index.1.i.i.7, %if.end.i.i.7 ]
  %niter = phi i64 [ %unroll_iter, %for.body.preheader.i.i.new ], [ %niter.nsub.7, %if.end.i.i.7 ]
  %8 = trunc i64 %indvars.iv.i.i to i32
  %stride2.i.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %8, i32 2
  %9 = load i32, i32* %stride2.i.i, align 4, !tbaa !164
  %cmp3.i.i = icmp sgt i32 %9, 0
  br i1 %cmp3.i.i, label %if.then.i.i, label %if.end.i.i

if.then.i.i:                                      ; preds = %for.body.i.i
  %conv18.i.i = zext i32 %9 to i64
  %extent.i.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %8, i32 1
  %10 = load i32, i32* %extent.i.i, align 4, !tbaa !163
  %sub.i.i = add nsw i32 %10, -1
  %conv7.i.i = sext i32 %sub.i.i to i64
  %mul.i.i = mul nsw i64 %conv7.i.i, %conv18.i.i
  %add.i.i = add nsw i64 %mul.i.i, %index.021.i.i
  br label %if.end.i.i

if.end.i.i:                                       ; preds = %if.then.i.i, %for.body.i.i
  %index.1.i.i = phi i64 [ %add.i.i, %if.then.i.i ], [ %index.021.i.i, %for.body.i.i ]
  %11 = trunc i64 %indvars.iv.i.i to i32
  %12 = or i32 %11, 1
  %stride2.i.i.1 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %12, i32 2
  %13 = load i32, i32* %stride2.i.i.1, align 4, !tbaa !164
  %cmp3.i.i.1 = icmp sgt i32 %13, 0
  br i1 %cmp3.i.i.1, label %if.then.i.i.1, label %if.end.i.i.1

for.body.i12.i.preheader.unr-lcssa:               ; preds = %if.end.i.i.7, %for.body.preheader.i.i
  %index.1.i.i.lcssa.ph = phi i64 [ undef, %for.body.preheader.i.i ], [ %index.1.i.i.7, %if.end.i.i.7 ]
  %indvars.iv.i.i.unr = phi i64 [ 0, %for.body.preheader.i.i ], [ %indvars.iv.next.i.i.7, %if.end.i.i.7 ]
  %index.021.i.i.unr = phi i64 [ 0, %for.body.preheader.i.i ], [ %index.1.i.i.7, %if.end.i.i.7 ]
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod.not, label %for.body.i12.i.preheader, label %for.body.i.i.epil

for.body.i.i.epil:                                ; preds = %if.end.i.i.epil, %for.body.i12.i.preheader.unr-lcssa
  %indvars.iv.i.i.epil = phi i64 [ %indvars.iv.next.i.i.epil, %if.end.i.i.epil ], [ %indvars.iv.i.i.unr, %for.body.i12.i.preheader.unr-lcssa ]
  %index.021.i.i.epil = phi i64 [ %index.1.i.i.epil, %if.end.i.i.epil ], [ %index.021.i.i.unr, %for.body.i12.i.preheader.unr-lcssa ]
  %epil.iter = phi i64 [ %epil.iter.sub, %if.end.i.i.epil ], [ %xtraiter, %for.body.i12.i.preheader.unr-lcssa ]
  %14 = trunc i64 %indvars.iv.i.i.epil to i32
  %stride2.i.i.epil = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %14, i32 2
  %15 = load i32, i32* %stride2.i.i.epil, align 4, !tbaa !164
  %cmp3.i.i.epil = icmp sgt i32 %15, 0
  br i1 %cmp3.i.i.epil, label %if.then.i.i.epil, label %if.end.i.i.epil

if.then.i.i.epil:                                 ; preds = %for.body.i.i.epil
  %conv18.i.i.epil = zext i32 %15 to i64
  %extent.i.i.epil = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %14, i32 1
  %16 = load i32, i32* %extent.i.i.epil, align 4, !tbaa !163
  %sub.i.i.epil = add nsw i32 %16, -1
  %conv7.i.i.epil = sext i32 %sub.i.i.epil to i64
  %mul.i.i.epil = mul nsw i64 %conv7.i.i.epil, %conv18.i.i.epil
  %add.i.i.epil = add nsw i64 %mul.i.i.epil, %index.021.i.i.epil
  br label %if.end.i.i.epil

if.end.i.i.epil:                                  ; preds = %if.then.i.i.epil, %for.body.i.i.epil
  %index.1.i.i.epil = phi i64 [ %add.i.i.epil, %if.then.i.i.epil ], [ %index.021.i.i.epil, %for.body.i.i.epil ]
  %indvars.iv.next.i.i.epil = add nuw nsw i64 %indvars.iv.i.i.epil, 1
  %epil.iter.sub = add i64 %epil.iter, -1
  %epil.iter.cmp.not = icmp eq i64 %epil.iter.sub, 0
  br i1 %epil.iter.cmp.not, label %for.body.i12.i.preheader, label %for.body.i.i.epil, !llvm.loop !198

for.body.i12.i.preheader:                         ; preds = %if.end.i.i.epil, %for.body.i12.i.preheader.unr-lcssa
  %index.1.i.i.lcssa = phi i64 [ %index.1.i.i.lcssa.ph, %for.body.i12.i.preheader.unr-lcssa ], [ %index.1.i.i.epil, %if.end.i.i.epil ]
  %17 = add nsw i64 %wide.trip.count.i.i, -1
  %xtraiter4 = and i64 %wide.trip.count.i.i, 7
  %18 = icmp ult i64 %17, 7
  br i1 %18, label %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit.unr-lcssa, label %for.body.i12.i.preheader.new

for.body.i12.i.preheader.new:                     ; preds = %for.body.i12.i.preheader
  %unroll_iter8 = and i64 %wide.trip.count.i.i, 4294967288
  br label %for.body.i12.i

for.body.i12.i:                                   ; preds = %if.end.i22.i.7, %for.body.i12.i.preheader.new
  %indvars.iv.i9.i = phi i64 [ 0, %for.body.i12.i.preheader.new ], [ %indvars.iv.next.i20.i.7, %if.end.i22.i.7 ]
  %index.018.i.i = phi i64 [ 0, %for.body.i12.i.preheader.new ], [ %index.1.i19.i.7, %if.end.i22.i.7 ]
  %niter9 = phi i64 [ %unroll_iter8, %for.body.i12.i.preheader.new ], [ %niter9.nsub.7, %if.end.i22.i.7 ]
  %19 = trunc i64 %indvars.iv.i9.i to i32
  %stride2.i10.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %19, i32 2
  %20 = load i32, i32* %stride2.i10.i, align 4, !tbaa !164
  %cmp3.i11.i = icmp slt i32 %20, 0
  br i1 %cmp3.i11.i, label %if.then.i18.i, label %if.end.i22.i

if.then.i18.i:                                    ; preds = %for.body.i12.i
  %conv.i.i = sext i32 %20 to i64
  %extent.i13.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %19, i32 1
  %21 = load i32, i32* %extent.i13.i, align 4, !tbaa !163
  %sub.i14.i = add nsw i32 %21, -1
  %conv7.i15.i = sext i32 %sub.i14.i to i64
  %mul.i16.i = mul nsw i64 %conv7.i15.i, %conv.i.i
  %add.i17.i = add nsw i64 %mul.i16.i, %index.018.i.i
  br label %if.end.i22.i

if.end.i22.i:                                     ; preds = %if.then.i18.i, %for.body.i12.i
  %index.1.i19.i = phi i64 [ %add.i17.i, %if.then.i18.i ], [ %index.018.i.i, %for.body.i12.i ]
  %22 = trunc i64 %indvars.iv.i9.i to i32
  %23 = or i32 %22, 1
  %stride2.i10.i.1 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %23, i32 2
  %24 = load i32, i32* %stride2.i10.i.1, align 4, !tbaa !164
  %cmp3.i11.i.1 = icmp slt i32 %24, 0
  br i1 %cmp3.i11.i.1, label %if.then.i18.i.1, label %if.end.i22.i.1

_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit.unr-lcssa: ; preds = %if.end.i22.i.7, %for.body.i12.i.preheader
  %index.1.i19.i.lcssa.ph = phi i64 [ undef, %for.body.i12.i.preheader ], [ %index.1.i19.i.7, %if.end.i22.i.7 ]
  %indvars.iv.i9.i.unr = phi i64 [ 0, %for.body.i12.i.preheader ], [ %indvars.iv.next.i20.i.7, %if.end.i22.i.7 ]
  %index.018.i.i.unr = phi i64 [ 0, %for.body.i12.i.preheader ], [ %index.1.i19.i.7, %if.end.i22.i.7 ]
  %lcmp.mod6.not = icmp eq i64 %xtraiter4, 0
  br i1 %lcmp.mod6.not, label %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit, label %for.body.i12.i.epil

for.body.i12.i.epil:                              ; preds = %if.end.i22.i.epil, %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit.unr-lcssa
  %indvars.iv.i9.i.epil = phi i64 [ %indvars.iv.next.i20.i.epil, %if.end.i22.i.epil ], [ %indvars.iv.i9.i.unr, %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit.unr-lcssa ]
  %index.018.i.i.epil = phi i64 [ %index.1.i19.i.epil, %if.end.i22.i.epil ], [ %index.018.i.i.unr, %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit.unr-lcssa ]
  %epil.iter5 = phi i64 [ %epil.iter5.sub, %if.end.i22.i.epil ], [ %xtraiter4, %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit.unr-lcssa ]
  %25 = trunc i64 %indvars.iv.i9.i.epil to i32
  %stride2.i10.i.epil = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %25, i32 2
  %26 = load i32, i32* %stride2.i10.i.epil, align 4, !tbaa !164
  %cmp3.i11.i.epil = icmp slt i32 %26, 0
  br i1 %cmp3.i11.i.epil, label %if.then.i18.i.epil, label %if.end.i22.i.epil

if.then.i18.i.epil:                               ; preds = %for.body.i12.i.epil
  %conv.i.i.epil = sext i32 %26 to i64
  %extent.i13.i.epil = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %25, i32 1
  %27 = load i32, i32* %extent.i13.i.epil, align 4, !tbaa !163
  %sub.i14.i.epil = add nsw i32 %27, -1
  %conv7.i15.i.epil = sext i32 %sub.i14.i.epil to i64
  %mul.i16.i.epil = mul nsw i64 %conv7.i15.i.epil, %conv.i.i.epil
  %add.i17.i.epil = add nsw i64 %mul.i16.i.epil, %index.018.i.i.epil
  br label %if.end.i22.i.epil

if.end.i22.i.epil:                                ; preds = %if.then.i18.i.epil, %for.body.i12.i.epil
  %index.1.i19.i.epil = phi i64 [ %add.i17.i.epil, %if.then.i18.i.epil ], [ %index.018.i.i.epil, %for.body.i12.i.epil ]
  %indvars.iv.next.i20.i.epil = add nuw nsw i64 %indvars.iv.i9.i.epil, 1
  %epil.iter5.sub = add i64 %epil.iter5, -1
  %epil.iter5.cmp.not = icmp eq i64 %epil.iter5.sub, 0
  br i1 %epil.iter5.cmp.not, label %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit, label %for.body.i12.i.epil, !llvm.loop !199

_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit: ; preds = %if.end.i22.i.epil, %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit.unr-lcssa
  %index.1.i19.i.lcssa = phi i64 [ %index.1.i19.i.lcssa.ph, %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit.unr-lcssa ], [ %index.1.i19.i.epil, %if.end.i22.i.epil ]
  %add8.i.i = add nsw i64 %index.1.i.i.lcssa, 1
  br label %_ZNK15halide_buffer_t13size_in_bytesEv.exit

_ZNK15halide_buffer_t13size_in_bytesEv.exit:      ; preds = %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit, %if.end
  %add8.i27.i = phi i64 [ 1, %if.end ], [ %add8.i.i, %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit ]
  %index.0.lcssa.i8.i = phi i64 [ 0, %if.end ], [ %index.1.i19.i.lcssa, %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit ]
  %sub.i = sub nsw i64 %add8.i27.i, %index.0.lcssa.i8.i
  %bits.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 4, i32 1
  %28 = load i8, i8* %bits.i.i, align 1, !tbaa !152
  %conv.i23.i = zext i8 %28 to i64
  %add.i24.i = add nuw nsw i64 %conv.i23.i, 7
  %div.i.i = lshr i64 %add.i24.i, 3
  %mul.i = mul i64 %div.i.i, %sub.i
  %call2 = tail call i8* @halide_malloc(i8* %user_context, i64 %mul.i) #12
  %host = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 2
  store i8* %call2, i8** %host, align 8, !tbaa !157
  %cmp4 = icmp eq i8* %call2, null
  br i1 %cmp4, label %cleanup13, label %if.end6

if.end6:                                          ; preds = %_ZNK15halide_buffer_t13size_in_bytesEv.exit
  %call7 = tail call i32 @halide_device_malloc(i8* %user_context, %struct.halide_buffer_t* nonnull %buf, %struct.halide_device_interface_t* %device_interface) #13
  %cmp8.not = icmp eq i32 %call7, 0
  br i1 %cmp8.not, label %cleanup13, label %if.then9

if.then9:                                         ; preds = %if.end6
  %29 = load i8*, i8** %host, align 8, !tbaa !157
  tail call void @halide_free(i8* %user_context, i8* %29) #12
  store i8* null, i8** %host, align 8, !tbaa !157
  br label %cleanup13

cleanup13:                                        ; preds = %if.then9, %if.end6, %_ZNK15halide_buffer_t13size_in_bytesEv.exit, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %retval.1 = phi i32 [ %retval.2.i, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit ], [ -1, %_ZNK15halide_buffer_t13size_in_bytesEv.exit ], [ %call7, %if.then9 ], [ 0, %if.end6 ]
  ret i32 %retval.1

if.then.i.i.1:                                    ; preds = %if.end.i.i
  %conv18.i.i.1 = zext i32 %13 to i64
  %extent.i.i.1 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %12, i32 1
  %30 = load i32, i32* %extent.i.i.1, align 4, !tbaa !163
  %sub.i.i.1 = add nsw i32 %30, -1
  %conv7.i.i.1 = sext i32 %sub.i.i.1 to i64
  %mul.i.i.1 = mul nsw i64 %conv7.i.i.1, %conv18.i.i.1
  %add.i.i.1 = add nsw i64 %mul.i.i.1, %index.1.i.i
  br label %if.end.i.i.1

if.end.i.i.1:                                     ; preds = %if.then.i.i.1, %if.end.i.i
  %index.1.i.i.1 = phi i64 [ %add.i.i.1, %if.then.i.i.1 ], [ %index.1.i.i, %if.end.i.i ]
  %31 = trunc i64 %indvars.iv.i.i to i32
  %32 = or i32 %31, 2
  %stride2.i.i.2 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %32, i32 2
  %33 = load i32, i32* %stride2.i.i.2, align 4, !tbaa !164
  %cmp3.i.i.2 = icmp sgt i32 %33, 0
  br i1 %cmp3.i.i.2, label %if.then.i.i.2, label %if.end.i.i.2

if.then.i.i.2:                                    ; preds = %if.end.i.i.1
  %conv18.i.i.2 = zext i32 %33 to i64
  %extent.i.i.2 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %32, i32 1
  %34 = load i32, i32* %extent.i.i.2, align 4, !tbaa !163
  %sub.i.i.2 = add nsw i32 %34, -1
  %conv7.i.i.2 = sext i32 %sub.i.i.2 to i64
  %mul.i.i.2 = mul nsw i64 %conv7.i.i.2, %conv18.i.i.2
  %add.i.i.2 = add nsw i64 %mul.i.i.2, %index.1.i.i.1
  br label %if.end.i.i.2

if.end.i.i.2:                                     ; preds = %if.then.i.i.2, %if.end.i.i.1
  %index.1.i.i.2 = phi i64 [ %add.i.i.2, %if.then.i.i.2 ], [ %index.1.i.i.1, %if.end.i.i.1 ]
  %35 = trunc i64 %indvars.iv.i.i to i32
  %36 = or i32 %35, 3
  %stride2.i.i.3 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %36, i32 2
  %37 = load i32, i32* %stride2.i.i.3, align 4, !tbaa !164
  %cmp3.i.i.3 = icmp sgt i32 %37, 0
  br i1 %cmp3.i.i.3, label %if.then.i.i.3, label %if.end.i.i.3

if.then.i.i.3:                                    ; preds = %if.end.i.i.2
  %conv18.i.i.3 = zext i32 %37 to i64
  %extent.i.i.3 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %36, i32 1
  %38 = load i32, i32* %extent.i.i.3, align 4, !tbaa !163
  %sub.i.i.3 = add nsw i32 %38, -1
  %conv7.i.i.3 = sext i32 %sub.i.i.3 to i64
  %mul.i.i.3 = mul nsw i64 %conv7.i.i.3, %conv18.i.i.3
  %add.i.i.3 = add nsw i64 %mul.i.i.3, %index.1.i.i.2
  br label %if.end.i.i.3

if.end.i.i.3:                                     ; preds = %if.then.i.i.3, %if.end.i.i.2
  %index.1.i.i.3 = phi i64 [ %add.i.i.3, %if.then.i.i.3 ], [ %index.1.i.i.2, %if.end.i.i.2 ]
  %39 = trunc i64 %indvars.iv.i.i to i32
  %40 = or i32 %39, 4
  %stride2.i.i.4 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %40, i32 2
  %41 = load i32, i32* %stride2.i.i.4, align 4, !tbaa !164
  %cmp3.i.i.4 = icmp sgt i32 %41, 0
  br i1 %cmp3.i.i.4, label %if.then.i.i.4, label %if.end.i.i.4

if.then.i.i.4:                                    ; preds = %if.end.i.i.3
  %conv18.i.i.4 = zext i32 %41 to i64
  %extent.i.i.4 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %40, i32 1
  %42 = load i32, i32* %extent.i.i.4, align 4, !tbaa !163
  %sub.i.i.4 = add nsw i32 %42, -1
  %conv7.i.i.4 = sext i32 %sub.i.i.4 to i64
  %mul.i.i.4 = mul nsw i64 %conv7.i.i.4, %conv18.i.i.4
  %add.i.i.4 = add nsw i64 %mul.i.i.4, %index.1.i.i.3
  br label %if.end.i.i.4

if.end.i.i.4:                                     ; preds = %if.then.i.i.4, %if.end.i.i.3
  %index.1.i.i.4 = phi i64 [ %add.i.i.4, %if.then.i.i.4 ], [ %index.1.i.i.3, %if.end.i.i.3 ]
  %43 = trunc i64 %indvars.iv.i.i to i32
  %44 = or i32 %43, 5
  %stride2.i.i.5 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %44, i32 2
  %45 = load i32, i32* %stride2.i.i.5, align 4, !tbaa !164
  %cmp3.i.i.5 = icmp sgt i32 %45, 0
  br i1 %cmp3.i.i.5, label %if.then.i.i.5, label %if.end.i.i.5

if.then.i.i.5:                                    ; preds = %if.end.i.i.4
  %conv18.i.i.5 = zext i32 %45 to i64
  %extent.i.i.5 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %44, i32 1
  %46 = load i32, i32* %extent.i.i.5, align 4, !tbaa !163
  %sub.i.i.5 = add nsw i32 %46, -1
  %conv7.i.i.5 = sext i32 %sub.i.i.5 to i64
  %mul.i.i.5 = mul nsw i64 %conv7.i.i.5, %conv18.i.i.5
  %add.i.i.5 = add nsw i64 %mul.i.i.5, %index.1.i.i.4
  br label %if.end.i.i.5

if.end.i.i.5:                                     ; preds = %if.then.i.i.5, %if.end.i.i.4
  %index.1.i.i.5 = phi i64 [ %add.i.i.5, %if.then.i.i.5 ], [ %index.1.i.i.4, %if.end.i.i.4 ]
  %47 = trunc i64 %indvars.iv.i.i to i32
  %48 = or i32 %47, 6
  %stride2.i.i.6 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %48, i32 2
  %49 = load i32, i32* %stride2.i.i.6, align 4, !tbaa !164
  %cmp3.i.i.6 = icmp sgt i32 %49, 0
  br i1 %cmp3.i.i.6, label %if.then.i.i.6, label %if.end.i.i.6

if.then.i.i.6:                                    ; preds = %if.end.i.i.5
  %conv18.i.i.6 = zext i32 %49 to i64
  %extent.i.i.6 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %48, i32 1
  %50 = load i32, i32* %extent.i.i.6, align 4, !tbaa !163
  %sub.i.i.6 = add nsw i32 %50, -1
  %conv7.i.i.6 = sext i32 %sub.i.i.6 to i64
  %mul.i.i.6 = mul nsw i64 %conv7.i.i.6, %conv18.i.i.6
  %add.i.i.6 = add nsw i64 %mul.i.i.6, %index.1.i.i.5
  br label %if.end.i.i.6

if.end.i.i.6:                                     ; preds = %if.then.i.i.6, %if.end.i.i.5
  %index.1.i.i.6 = phi i64 [ %add.i.i.6, %if.then.i.i.6 ], [ %index.1.i.i.5, %if.end.i.i.5 ]
  %51 = trunc i64 %indvars.iv.i.i to i32
  %52 = or i32 %51, 7
  %stride2.i.i.7 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %52, i32 2
  %53 = load i32, i32* %stride2.i.i.7, align 4, !tbaa !164
  %cmp3.i.i.7 = icmp sgt i32 %53, 0
  br i1 %cmp3.i.i.7, label %if.then.i.i.7, label %if.end.i.i.7

if.then.i.i.7:                                    ; preds = %if.end.i.i.6
  %conv18.i.i.7 = zext i32 %53 to i64
  %extent.i.i.7 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %52, i32 1
  %54 = load i32, i32* %extent.i.i.7, align 4, !tbaa !163
  %sub.i.i.7 = add nsw i32 %54, -1
  %conv7.i.i.7 = sext i32 %sub.i.i.7 to i64
  %mul.i.i.7 = mul nsw i64 %conv7.i.i.7, %conv18.i.i.7
  %add.i.i.7 = add nsw i64 %mul.i.i.7, %index.1.i.i.6
  br label %if.end.i.i.7

if.end.i.i.7:                                     ; preds = %if.then.i.i.7, %if.end.i.i.6
  %index.1.i.i.7 = phi i64 [ %add.i.i.7, %if.then.i.i.7 ], [ %index.1.i.i.6, %if.end.i.i.6 ]
  %indvars.iv.next.i.i.7 = add nuw nsw i64 %indvars.iv.i.i, 8
  %niter.nsub.7 = add i64 %niter, -8
  %niter.ncmp.7 = icmp eq i64 %niter.nsub.7, 0
  br i1 %niter.ncmp.7, label %for.body.i12.i.preheader.unr-lcssa, label %for.body.i.i, !llvm.loop !200

if.then.i18.i.1:                                  ; preds = %if.end.i22.i
  %conv.i.i.1 = sext i32 %24 to i64
  %extent.i13.i.1 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %23, i32 1
  %55 = load i32, i32* %extent.i13.i.1, align 4, !tbaa !163
  %sub.i14.i.1 = add nsw i32 %55, -1
  %conv7.i15.i.1 = sext i32 %sub.i14.i.1 to i64
  %mul.i16.i.1 = mul nsw i64 %conv7.i15.i.1, %conv.i.i.1
  %add.i17.i.1 = add nsw i64 %mul.i16.i.1, %index.1.i19.i
  br label %if.end.i22.i.1

if.end.i22.i.1:                                   ; preds = %if.then.i18.i.1, %if.end.i22.i
  %index.1.i19.i.1 = phi i64 [ %add.i17.i.1, %if.then.i18.i.1 ], [ %index.1.i19.i, %if.end.i22.i ]
  %56 = trunc i64 %indvars.iv.i9.i to i32
  %57 = or i32 %56, 2
  %stride2.i10.i.2 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %57, i32 2
  %58 = load i32, i32* %stride2.i10.i.2, align 4, !tbaa !164
  %cmp3.i11.i.2 = icmp slt i32 %58, 0
  br i1 %cmp3.i11.i.2, label %if.then.i18.i.2, label %if.end.i22.i.2

if.then.i18.i.2:                                  ; preds = %if.end.i22.i.1
  %conv.i.i.2 = sext i32 %58 to i64
  %extent.i13.i.2 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %57, i32 1
  %59 = load i32, i32* %extent.i13.i.2, align 4, !tbaa !163
  %sub.i14.i.2 = add nsw i32 %59, -1
  %conv7.i15.i.2 = sext i32 %sub.i14.i.2 to i64
  %mul.i16.i.2 = mul nsw i64 %conv7.i15.i.2, %conv.i.i.2
  %add.i17.i.2 = add nsw i64 %mul.i16.i.2, %index.1.i19.i.1
  br label %if.end.i22.i.2

if.end.i22.i.2:                                   ; preds = %if.then.i18.i.2, %if.end.i22.i.1
  %index.1.i19.i.2 = phi i64 [ %add.i17.i.2, %if.then.i18.i.2 ], [ %index.1.i19.i.1, %if.end.i22.i.1 ]
  %60 = trunc i64 %indvars.iv.i9.i to i32
  %61 = or i32 %60, 3
  %stride2.i10.i.3 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %61, i32 2
  %62 = load i32, i32* %stride2.i10.i.3, align 4, !tbaa !164
  %cmp3.i11.i.3 = icmp slt i32 %62, 0
  br i1 %cmp3.i11.i.3, label %if.then.i18.i.3, label %if.end.i22.i.3

if.then.i18.i.3:                                  ; preds = %if.end.i22.i.2
  %conv.i.i.3 = sext i32 %62 to i64
  %extent.i13.i.3 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %61, i32 1
  %63 = load i32, i32* %extent.i13.i.3, align 4, !tbaa !163
  %sub.i14.i.3 = add nsw i32 %63, -1
  %conv7.i15.i.3 = sext i32 %sub.i14.i.3 to i64
  %mul.i16.i.3 = mul nsw i64 %conv7.i15.i.3, %conv.i.i.3
  %add.i17.i.3 = add nsw i64 %mul.i16.i.3, %index.1.i19.i.2
  br label %if.end.i22.i.3

if.end.i22.i.3:                                   ; preds = %if.then.i18.i.3, %if.end.i22.i.2
  %index.1.i19.i.3 = phi i64 [ %add.i17.i.3, %if.then.i18.i.3 ], [ %index.1.i19.i.2, %if.end.i22.i.2 ]
  %64 = trunc i64 %indvars.iv.i9.i to i32
  %65 = or i32 %64, 4
  %stride2.i10.i.4 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %65, i32 2
  %66 = load i32, i32* %stride2.i10.i.4, align 4, !tbaa !164
  %cmp3.i11.i.4 = icmp slt i32 %66, 0
  br i1 %cmp3.i11.i.4, label %if.then.i18.i.4, label %if.end.i22.i.4

if.then.i18.i.4:                                  ; preds = %if.end.i22.i.3
  %conv.i.i.4 = sext i32 %66 to i64
  %extent.i13.i.4 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %65, i32 1
  %67 = load i32, i32* %extent.i13.i.4, align 4, !tbaa !163
  %sub.i14.i.4 = add nsw i32 %67, -1
  %conv7.i15.i.4 = sext i32 %sub.i14.i.4 to i64
  %mul.i16.i.4 = mul nsw i64 %conv7.i15.i.4, %conv.i.i.4
  %add.i17.i.4 = add nsw i64 %mul.i16.i.4, %index.1.i19.i.3
  br label %if.end.i22.i.4

if.end.i22.i.4:                                   ; preds = %if.then.i18.i.4, %if.end.i22.i.3
  %index.1.i19.i.4 = phi i64 [ %add.i17.i.4, %if.then.i18.i.4 ], [ %index.1.i19.i.3, %if.end.i22.i.3 ]
  %68 = trunc i64 %indvars.iv.i9.i to i32
  %69 = or i32 %68, 5
  %stride2.i10.i.5 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %69, i32 2
  %70 = load i32, i32* %stride2.i10.i.5, align 4, !tbaa !164
  %cmp3.i11.i.5 = icmp slt i32 %70, 0
  br i1 %cmp3.i11.i.5, label %if.then.i18.i.5, label %if.end.i22.i.5

if.then.i18.i.5:                                  ; preds = %if.end.i22.i.4
  %conv.i.i.5 = sext i32 %70 to i64
  %extent.i13.i.5 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %69, i32 1
  %71 = load i32, i32* %extent.i13.i.5, align 4, !tbaa !163
  %sub.i14.i.5 = add nsw i32 %71, -1
  %conv7.i15.i.5 = sext i32 %sub.i14.i.5 to i64
  %mul.i16.i.5 = mul nsw i64 %conv7.i15.i.5, %conv.i.i.5
  %add.i17.i.5 = add nsw i64 %mul.i16.i.5, %index.1.i19.i.4
  br label %if.end.i22.i.5

if.end.i22.i.5:                                   ; preds = %if.then.i18.i.5, %if.end.i22.i.4
  %index.1.i19.i.5 = phi i64 [ %add.i17.i.5, %if.then.i18.i.5 ], [ %index.1.i19.i.4, %if.end.i22.i.4 ]
  %72 = trunc i64 %indvars.iv.i9.i to i32
  %73 = or i32 %72, 6
  %stride2.i10.i.6 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %73, i32 2
  %74 = load i32, i32* %stride2.i10.i.6, align 4, !tbaa !164
  %cmp3.i11.i.6 = icmp slt i32 %74, 0
  br i1 %cmp3.i11.i.6, label %if.then.i18.i.6, label %if.end.i22.i.6

if.then.i18.i.6:                                  ; preds = %if.end.i22.i.5
  %conv.i.i.6 = sext i32 %74 to i64
  %extent.i13.i.6 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %73, i32 1
  %75 = load i32, i32* %extent.i13.i.6, align 4, !tbaa !163
  %sub.i14.i.6 = add nsw i32 %75, -1
  %conv7.i15.i.6 = sext i32 %sub.i14.i.6 to i64
  %mul.i16.i.6 = mul nsw i64 %conv7.i15.i.6, %conv.i.i.6
  %add.i17.i.6 = add nsw i64 %mul.i16.i.6, %index.1.i19.i.5
  br label %if.end.i22.i.6

if.end.i22.i.6:                                   ; preds = %if.then.i18.i.6, %if.end.i22.i.5
  %index.1.i19.i.6 = phi i64 [ %add.i17.i.6, %if.then.i18.i.6 ], [ %index.1.i19.i.5, %if.end.i22.i.5 ]
  %76 = trunc i64 %indvars.iv.i9.i to i32
  %77 = or i32 %76, 7
  %stride2.i10.i.7 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %77, i32 2
  %78 = load i32, i32* %stride2.i10.i.7, align 4, !tbaa !164
  %cmp3.i11.i.7 = icmp slt i32 %78, 0
  br i1 %cmp3.i11.i.7, label %if.then.i18.i.7, label %if.end.i22.i.7

if.then.i18.i.7:                                  ; preds = %if.end.i22.i.6
  %conv.i.i.7 = sext i32 %78 to i64
  %extent.i13.i.7 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %77, i32 1
  %79 = load i32, i32* %extent.i13.i.7, align 4, !tbaa !163
  %sub.i14.i.7 = add nsw i32 %79, -1
  %conv7.i15.i.7 = sext i32 %sub.i14.i.7 to i64
  %mul.i16.i.7 = mul nsw i64 %conv7.i15.i.7, %conv.i.i.7
  %add.i17.i.7 = add nsw i64 %mul.i16.i.7, %index.1.i19.i.6
  br label %if.end.i22.i.7

if.end.i22.i.7:                                   ; preds = %if.then.i18.i.7, %if.end.i22.i.6
  %index.1.i19.i.7 = phi i64 [ %add.i17.i.7, %if.then.i18.i.7 ], [ %index.1.i19.i.6, %if.end.i22.i.6 ]
  %indvars.iv.next.i20.i.7 = add nuw nsw i64 %indvars.iv.i9.i, 8
  %niter9.nsub.7 = add i64 %niter9, -8
  %niter9.ncmp.7 = icmp eq i64 %niter9.nsub.7, 0
  br i1 %niter9.ncmp.7, label %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit.unr-lcssa, label %for.body.i12.i, !llvm.loop !201
}

; Function Attrs: mustprogress nounwind
define weak i32 @halide_default_device_and_host_free(i8* %user_context, %struct.halide_buffer_t* %buf, %struct.halide_device_interface_t* %device_interface) local_unnamed_addr #0 {
entry:
  %cmp.i = icmp eq %struct.halide_buffer_t* %buf, null
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.30, i32 0, i32 0)) #12
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end.i:                                         ; preds = %entry
  %device_interface.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %0 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface.i, align 8, !tbaa !156
  %cmp4.not.i = icmp eq %struct.halide_device_interface_t* %0, null
  %device.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %1 = load i64, i64* %device.i, align 8, !tbaa !154
  %cmp5.not.i = icmp eq i64 %1, 0
  %cmp4.not.not.i = xor i1 %cmp4.not.i, true
  %brmerge.i = select i1 %cmp5.not.i, i1 true, i1 %cmp4.not.not.i
  br i1 %brmerge.i, label %if.end10.i, label %if.then8.i

if.then8.i:                                       ; preds = %if.end.i
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #12
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = select i1 %cmp4.not.i, i1 true, i1 %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #12
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i.i, align 8, !tbaa !158
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end16.i.split

if.end16.i.split:                                 ; preds = %if.end16.i
  %call11 = tail call i32 @halide_device_free(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #13
  br label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #12
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit: ; preds = %if.then24.i, %if.then14.i, %if.then8.i, %if.then.i
  %retval.2.i = phi i32 [ %call.i, %if.then.i ], [ %call15.i, %if.then14.i ], [ %call9.i, %if.then8.i ], [ %call25.i, %if.then24.i ]
  %cmp.not = icmp eq i32 %retval.2.i, 0
  br i1 %cmp.not, label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split, label %cleanup

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split: ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %call12 = tail call i32 @halide_device_free(i8* %user_context, %struct.halide_buffer_t* %buf) #13
  br label %if.end

if.end:                                           ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split, %if.end16.i.split
  %phi.call = phi i32 [ %call11, %if.end16.i.split ], [ %call12, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split ]
  %host = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 2
  %4 = load i8*, i8** %host, align 8, !tbaa !157
  %tobool.not = icmp eq i8* %4, null
  br i1 %tobool.not, label %if.end5, label %if.then2

if.then2:                                         ; preds = %if.end
  tail call void @halide_free(i8* %user_context, i8* nonnull %4) #12
  store i8* null, i8** %host, align 8, !tbaa !157
  br label %if.end5

if.end5:                                          ; preds = %if.then2, %if.end
  %flags.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %5 = load i64, i64* %flags.i.i, align 8, !tbaa !158
  %and.i.i18 = and i64 %5, -4
  store i64 %and.i.i18, i64* %flags.i.i, align 8, !tbaa !158
  br label %cleanup

cleanup:                                          ; preds = %if.end5, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %retval.0 = phi i32 [ %phi.call, %if.end5 ], [ %retval.2.i, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit ]
  ret i32 %retval.0
}

; Function Attrs: mustprogress nounwind
define weak i32 @halide_device_wrap_native(i8* %user_context, %struct.halide_buffer_t* %buf, i64 %handle, %struct.halide_device_interface_t* %device_interface) local_unnamed_addr #0 {
entry:
  %cmp.i = icmp eq %struct.halide_buffer_t* %buf, null
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.31, i32 0, i32 0)) #12
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end.i:                                         ; preds = %entry
  %device_interface.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %0 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface.i, align 8, !tbaa !156
  %cmp4.not.i = icmp eq %struct.halide_device_interface_t* %0, null
  %device.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %1 = load i64, i64* %device.i, align 8, !tbaa !154
  %cmp5.not.i = icmp eq i64 %1, 0
  %cmp4.not.not.i = xor i1 %cmp4.not.i, true
  %brmerge.i = select i1 %cmp5.not.i, i1 true, i1 %cmp4.not.not.i
  br i1 %brmerge.i, label %if.end10.i, label %if.then8.i

if.then8.i:                                       ; preds = %if.end.i
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #12
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = select i1 %cmp4.not.i, i1 true, i1 %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #12
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i.i, align 8, !tbaa !158
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #12
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit: ; preds = %if.then24.i, %if.then14.i, %if.then8.i, %if.then.i
  %retval.2.i = phi i32 [ %call.i, %if.then.i ], [ %call15.i, %if.then14.i ], [ %call9.i, %if.then8.i ], [ %call25.i, %if.then24.i ]
  %cmp.not = icmp eq i32 %retval.2.i, 0
  br i1 %cmp.not, label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, label %cleanup12

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge: ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %device_interface1.phi.trans.insert = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %.pre = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface1.phi.trans.insert, align 8, !tbaa !156
  br label %if.end

if.end:                                           ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, %if.end16.i
  %4 = phi %struct.halide_device_interface_t* [ %.pre, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge ], [ %0, %if.end16.i ]
  %cmp2.not = icmp eq %struct.halide_device_interface_t* %4, null
  %cmp3.not = icmp eq %struct.halide_device_interface_t* %4, %device_interface
  %or.cond = select i1 %cmp2.not, i1 true, i1 %cmp3.not
  br i1 %or.cond, label %if.end5, label %if.then4

if.then4:                                         ; preds = %if.end
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.32, i32 0, i32 0)) #12
  br label %cleanup12

if.end5:                                          ; preds = %if.end
  %device_interface1 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %device_interface, i32 0, i32 15
  %5 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !185
  %use_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %5, i32 0, i32 0
  %6 = load void ()*, void ()** %use_module, align 8, !tbaa !191
  tail call void %6() #12
  store %struct.halide_device_interface_t* %device_interface, %struct.halide_device_interface_t** %device_interface1, align 8, !tbaa !156
  %7 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !185
  %wrap_native = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %7, i32 0, i32 14
  %8 = load i32 (i8*, %struct.halide_buffer_t*, i64)*, i32 (i8*, %struct.halide_buffer_t*, i64)** %wrap_native, align 8, !tbaa !202
  %call8 = tail call i32 %8(i8* %user_context, %struct.halide_buffer_t* nonnull %buf, i64 %handle) #12
  %9 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !185
  %release_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %9, i32 0, i32 1
  %10 = load void ()*, void ()** %release_module, align 8, !tbaa !193
  tail call void %10() #12
  %tobool.not = icmp eq i32 %call8, 0
  %. = select i1 %tobool.not, i32 0, i32 -16
  br label %cleanup12

cleanup12:                                        ; preds = %if.end5, %if.then4, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %retval.1 = phi i32 [ %retval.2.i, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit ], [ -42, %if.then4 ], [ %., %if.end5 ]
  ret i32 %retval.1
}

; Function Attrs: mustprogress nounwind
define weak i32 @halide_device_detach_native(i8* %user_context, %struct.halide_buffer_t* %buf) local_unnamed_addr #0 {
entry:
  %cmp.i = icmp eq %struct.halide_buffer_t* %buf, null
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.33, i32 0, i32 0)) #12
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end.i:                                         ; preds = %entry
  %device_interface.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %0 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface.i, align 8, !tbaa !156
  %cmp4.not.i = icmp eq %struct.halide_device_interface_t* %0, null
  %device.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %1 = load i64, i64* %device.i, align 8, !tbaa !154
  %cmp5.not.i = icmp eq i64 %1, 0
  %cmp4.not.not.i = xor i1 %cmp4.not.i, true
  %brmerge.i = select i1 %cmp5.not.i, i1 true, i1 %cmp4.not.not.i
  br i1 %brmerge.i, label %if.end10.i, label %if.then8.i

if.then8.i:                                       ; preds = %if.end.i
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #12
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = select i1 %cmp4.not.i, i1 true, i1 %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #12
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i.i, align 8, !tbaa !158
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #12
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit: ; preds = %if.then24.i, %if.then14.i, %if.then8.i, %if.then.i
  %retval.2.i = phi i32 [ %call.i, %if.then.i ], [ %call15.i, %if.then14.i ], [ %call9.i, %if.then8.i ], [ %call25.i, %if.then24.i ]
  %cmp.not = icmp eq i32 %retval.2.i, 0
  br i1 %cmp.not, label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, label %cleanup

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge: ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %device_interface1.phi.trans.insert = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %.pre = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface1.phi.trans.insert, align 8, !tbaa !156
  br label %if.end

if.end:                                           ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, %if.end16.i
  %4 = phi %struct.halide_device_interface_t* [ %.pre, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge ], [ %0, %if.end16.i ]
  %cmp2.not = icmp eq %struct.halide_device_interface_t* %4, null
  br i1 %cmp2.not, label %cleanup, label %if.then3

if.then3:                                         ; preds = %if.end
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %4, i32 0, i32 15
  %5 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !185
  %use_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %5, i32 0, i32 0
  %6 = load void ()*, void ()** %use_module, align 8, !tbaa !191
  tail call void %6() #12
  %7 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !185
  %detach_native = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %7, i32 0, i32 15
  %8 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %detach_native, align 8, !tbaa !203
  %call5 = tail call i32 %8(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #12
  %9 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !185
  %release_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %9, i32 0, i32 1
  %10 = load void ()*, void ()** %release_module, align 8, !tbaa !193
  tail call void %10() #12
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %11 = load i64, i64* %device, align 8, !tbaa !154
  %cmp7 = icmp eq i64 %11, 0
  br i1 %cmp7, label %do.end, label %if.then8

if.then8:                                         ; preds = %if.then3
  tail call void @halide_print(i8* %user_context, i8* getelementptr inbounds ([109 x i8], [109 x i8]* @.str.34, i32 0, i32 0)) #12
  tail call void @abort() #12
  br label %do.end

do.end:                                           ; preds = %if.then8, %if.then3
  %tobool.not = icmp eq i32 %call5, 0
  %spec.select = select i1 %tobool.not, i32 0, i32 -33
  br label %cleanup

cleanup:                                          ; preds = %do.end, %if.end, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %retval.0 = phi i32 [ %retval.2.i, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit ], [ 0, %if.end ], [ %spec.select, %do.end ]
  ret i32 %retval.0
}

; Function Attrs: mustprogress nounwind
define weak i32 @halide_default_device_wrap_native(i8* %user_context, %struct.halide_buffer_t* %buf, i64 %handle) local_unnamed_addr #0 {
entry:
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %0 = load i64, i64* %device, align 8, !tbaa !154
  %cmp.not = icmp eq i64 %0, 0
  br i1 %cmp.not, label %if.end, label %return

if.end:                                           ; preds = %entry
  %device_interface = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %1 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !156
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %1, i32 0, i32 15
  %2 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !185
  %use_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %2, i32 0, i32 0
  %3 = load void ()*, void ()** %use_module, align 8, !tbaa !191
  tail call void %3() #12
  store i64 %handle, i64* %device, align 8, !tbaa !154
  br label %return

return:                                           ; preds = %if.end, %entry
  %retval.0 = phi i32 [ 0, %if.end ], [ -32, %entry ]
  ret i32 %retval.0
}

; Function Attrs: mustprogress nounwind
define weak i32 @halide_default_device_detach_native(i8* %user_context, %struct.halide_buffer_t* %buf) local_unnamed_addr #0 {
entry:
  %cmp.i = icmp eq %struct.halide_buffer_t* %buf, null
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.35, i32 0, i32 0)) #12
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end.i:                                         ; preds = %entry
  %device_interface.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %0 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface.i, align 8, !tbaa !156
  %cmp4.not.i = icmp eq %struct.halide_device_interface_t* %0, null
  %device.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %1 = load i64, i64* %device.i, align 8, !tbaa !154
  %cmp5.not.i = icmp eq i64 %1, 0
  %cmp4.not.not.i = xor i1 %cmp4.not.i, true
  %brmerge.i = select i1 %cmp5.not.i, i1 true, i1 %cmp4.not.not.i
  br i1 %brmerge.i, label %if.end10.i, label %if.then8.i

if.then8.i:                                       ; preds = %if.end.i
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #12
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = select i1 %cmp4.not.i, i1 true, i1 %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #12
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i.i, align 8, !tbaa !158
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #12
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit: ; preds = %if.then24.i, %if.then14.i, %if.then8.i, %if.then.i
  %retval.2.i = phi i32 [ %call.i, %if.then.i ], [ %call15.i, %if.then14.i ], [ %call9.i, %if.then8.i ], [ %call25.i, %if.then24.i ]
  %cmp.not = icmp eq i32 %retval.2.i, 0
  br i1 %cmp.not, label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, label %cleanup

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge: ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %device.phi.trans.insert = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %.pre = load i64, i64* %device.phi.trans.insert, align 8, !tbaa !154
  br label %if.end

if.end:                                           ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, %if.end16.i
  %4 = phi i64 [ %.pre, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge ], [ %1, %if.end16.i ]
  %cmp1 = icmp eq i64 %4, 0
  br i1 %cmp1, label %cleanup, label %if.end3

if.end3:                                          ; preds = %if.end
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %device_interface = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %5 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !156
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %5, i32 0, i32 15
  %6 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !185
  %release_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %6, i32 0, i32 1
  %7 = load void ()*, void ()** %release_module, align 8, !tbaa !193
  tail call void %7() #12
  store i64 0, i64* %device, align 8, !tbaa !154
  store %struct.halide_device_interface_t* null, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !156
  br label %cleanup

cleanup:                                          ; preds = %if.end3, %if.end, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %retval.0 = phi i32 [ 0, %if.end3 ], [ %retval.2.i, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit ], [ 0, %if.end ]
  ret i32 %retval.0
}

; Function Attrs: mustprogress nounwind
define weak void @halide_device_and_host_free_as_destructor(i8* %user_context, i8* %obj) local_unnamed_addr #0 {
entry:
  %0 = bitcast i8* %obj to %struct.halide_buffer_t*
  %call = tail call i32 @halide_device_and_host_free(i8* %user_context, %struct.halide_buffer_t* %0) #13
  ret void
}

; Function Attrs: mustprogress nounwind
define weak void @halide_device_host_nop_free(i8* %user_context, i8* %obj) local_unnamed_addr #0 {
entry:
  ret void
}

; Function Attrs: mustprogress nounwind
define weak i32 @halide_default_buffer_copy(i8* %user_context, %struct.halide_buffer_t* %src, %struct.halide_device_interface_t* %dst_device_interface, %struct.halide_buffer_t* %dst) local_unnamed_addr #0 {
entry:
  ret i32 -39
}

; Function Attrs: mustprogress nounwind
define weak i32 @halide_buffer_copy_already_locked(i8* %user_context, %struct.halide_buffer_t* %src, %struct.halide_device_interface_t* %dst_device_interface, %struct.halide_buffer_t* %dst) local_unnamed_addr #0 {
entry:
  %c = alloca %"struct.Halide::Runtime::Internal::device_copy", align 8
  %tobool.not = icmp eq %struct.halide_device_interface_t* %dst_device_interface, null
  br i1 %tobool.not, label %if.end13, label %land.lhs.true

land.lhs.true:                                    ; preds = %entry
  %device_interface = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i32 0, i32 1
  %0 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !156
  %tobool1.not = icmp eq %struct.halide_device_interface_t* %0, null
  %cmp.not = icmp eq %struct.halide_device_interface_t* %0, %dst_device_interface
  %or.cond = select i1 %tobool1.not, i1 true, i1 %cmp.not
  br i1 %or.cond, label %land.lhs.true5, label %if.then

if.then:                                          ; preds = %land.lhs.true
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.41, i32 0, i32 0)) #12
  br label %cleanup143

land.lhs.true5:                                   ; preds = %land.lhs.true
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i32 0, i32 0
  %1 = load i64, i64* %device, align 8, !tbaa !154
  %tobool6.not = icmp eq i64 %1, 0
  br i1 %tobool6.not, label %if.then7, label %if.end13

if.then7:                                         ; preds = %land.lhs.true5
  %call = tail call i32 @halide_device_malloc(i8* %user_context, %struct.halide_buffer_t* nonnull %dst, %struct.halide_device_interface_t* nonnull %dst_device_interface) #13
  %tobool10.not = icmp eq i32 %call, 0
  br i1 %tobool10.not, label %if.end13, label %cleanup143

if.end13:                                         ; preds = %if.then7, %land.lhs.true5, %entry
  %device14 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 0
  %2 = load i64, i64* %device14, align 8, !tbaa !154
  %cmp15.not = icmp eq i64 %2, 0
  %host22.phi.trans.insert = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 2
  %.pre = load i8*, i8** %host22.phi.trans.insert, align 8, !tbaa !157
  %cmp23.not = icmp eq i8* %.pre, null
  br i1 %cmp15.not, label %land.end, label %land.rhs

land.rhs:                                         ; preds = %if.end13
  br i1 %cmp23.not, label %land.end32, label %land.end.thread268

land.end.thread268:                               ; preds = %land.rhs
  %flags.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 3
  %3 = load i64, i64* %flags.i.i, align 8, !tbaa !158
  %and.i.i = and i64 %3, 1
  %cmp.i.i.not = icmp ne i64 %and.i.i, 0
  br label %land.rhs26

land.end:                                         ; preds = %if.end13
  br i1 %cmp23.not, label %land.end32, label %land.end.land.rhs26_crit_edge

land.end.land.rhs26_crit_edge:                    ; preds = %land.end
  %flags.i.i241.phi.trans.insert = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 3
  %.pre1 = load i64, i64* %flags.i.i241.phi.trans.insert, align 8, !tbaa !158
  br label %land.rhs26

land.rhs26:                                       ; preds = %land.end.land.rhs26_crit_edge, %land.end.thread268
  %4 = phi i64 [ %3, %land.end.thread268 ], [ %.pre1, %land.end.land.rhs26_crit_edge ]
  %5 = phi i1 [ %cmp.i.i.not, %land.end.thread268 ], [ true, %land.end.land.rhs26_crit_edge ]
  %and.i.i242 = and i64 %4, 2
  %cmp.i.i243.not = icmp eq i64 %and.i.i242, 0
  br i1 %cmp.i.i243.not, label %land.end32, label %lor.rhs28

lor.rhs28:                                        ; preds = %land.rhs26
  %device_interface29 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 1
  %6 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface29, align 8, !tbaa !156
  %cmp30 = icmp ne %struct.halide_device_interface_t* %6, null
  br label %land.end32

land.end32:                                       ; preds = %lor.rhs28, %land.rhs26, %land.end, %land.rhs
  %cmp23.not267 = phi i1 [ true, %land.end ], [ false, %land.rhs26 ], [ false, %lor.rhs28 ], [ true, %land.rhs ]
  %7 = phi i1 [ true, %land.end ], [ %5, %land.rhs26 ], [ %5, %lor.rhs28 ], [ false, %land.rhs ]
  %8 = phi i1 [ true, %land.end ], [ false, %land.rhs26 ], [ %cmp30, %lor.rhs28 ], [ true, %land.rhs ]
  %host34 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i32 0, i32 2
  %9 = load i8*, i8** %host34, align 8, !tbaa !157
  %cmp35.not = icmp eq i8* %9, null
  %cmp20.not = xor i1 %tobool.not, true
  %10 = select i1 %tobool.not, i1 %cmp35.not, i1 false
  br i1 %10, label %cleanup143, label %if.end41

if.end41:                                         ; preds = %land.end32
  %brmerge229 = select i1 %7, i1 true, i1 %tobool.not
  br i1 %brmerge229, label %if.then51, label %if.end49

if.end49:                                         ; preds = %if.end41
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %dst_device_interface, i32 0, i32 15
  %11 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !185
  %buffer_copy = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %11, i32 0, i32 10
  %12 = load i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)** %buffer_copy, align 8, !tbaa !204
  %call48 = tail call i32 %12(i8* %user_context, %struct.halide_buffer_t* nonnull %src, %struct.halide_device_interface_t* nonnull %dst_device_interface, %struct.halide_buffer_t* nonnull %dst) #12
  %cmp50 = icmp eq i32 %call48, -42
  br i1 %cmp50, label %if.then51, label %if.end117

if.then51:                                        ; preds = %if.end49, %if.end41
  %13 = select i1 %cmp23.not267, i1 %cmp35.not, i1 false
  br i1 %13, label %cleanup143, label %if.end58

if.end58:                                         ; preds = %if.then51
  %brmerge234 = select i1 %cmp20.not, i1 true, i1 %8
  br i1 %brmerge234, label %if.else, label %if.end117.thread262

if.end117.thread262:                              ; preds = %if.end58
  %14 = bitcast %"struct.Halide::Runtime::Internal::device_copy"* %c to i8*
  call void @llvm.lifetime.start.p0i8(i64 416, i8* nonnull %14) #10
  call void @_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b(%"struct.Halide::Runtime::Internal::device_copy"* nonnull sret(%"struct.Halide::Runtime::Internal::device_copy") align 8 %c, %struct.halide_buffer_t* nonnull %src, i1 zeroext true, %struct.halide_buffer_t* nonnull %dst, i1 zeroext true) #13
  call void @_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv(%"struct.Halide::Runtime::Internal::device_copy"* nonnull align 8 dereferenceable(416) %c, i8* %user_context) #13
  call void @llvm.lifetime.end.p0i8(i64 416, i8* nonnull %14) #10
  br label %land.lhs.true126

if.else:                                          ; preds = %if.end58
  %brmerge237 = select i1 %cmp20.not, i1 true, i1 %7
  br i1 %brmerge237, label %if.else81, label %if.then66

if.then66:                                        ; preds = %if.else
  %device_interface69 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 1
  %15 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface69, align 8, !tbaa !156
  %impl70 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %15, i32 0, i32 15
  %16 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl70, align 8, !tbaa !185
  %buffer_copy71 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %16, i32 0, i32 10
  %17 = load i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)** %buffer_copy71, align 8, !tbaa !204
  %call72 = tail call i32 %17(i8* %user_context, %struct.halide_buffer_t* nonnull %src, %struct.halide_device_interface_t* null, %struct.halide_buffer_t* nonnull %dst) #12
  %cmp73 = icmp eq i32 %call72, -42
  br i1 %cmp73, label %if.then74, label %if.end117

if.then74:                                        ; preds = %if.then66
  %call75 = tail call i32 @_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t(i8* %user_context, %struct.halide_buffer_t* nonnull %src) #13
  %tobool76.not = icmp eq i32 %call75, 0
  br i1 %tobool76.not, label %if.then77, label %cleanup143

if.then77:                                        ; preds = %if.then74
  %call78 = tail call i32 @halide_buffer_copy_already_locked(i8* %user_context, %struct.halide_buffer_t* nonnull %src, %struct.halide_device_interface_t* null, %struct.halide_buffer_t* nonnull %dst) #13
  br label %if.end117

if.else81:                                        ; preds = %if.else
  %brmerge239 = select i1 %7, i1 true, i1 %cmp35.not
  br i1 %brmerge239, label %if.else98, label %if.then85

if.then85:                                        ; preds = %if.else81
  %device_interface90 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 1
  %18 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface90, align 8, !tbaa !156
  %impl91 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %18, i32 0, i32 15
  %19 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl91, align 8, !tbaa !185
  %buffer_copy92 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %19, i32 0, i32 10
  %20 = load i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)** %buffer_copy92, align 8, !tbaa !204
  %call93 = tail call i32 %20(i8* %user_context, %struct.halide_buffer_t* nonnull %src, %struct.halide_device_interface_t* null, %struct.halide_buffer_t* nonnull %dst) #12
  %cmp94 = icmp eq i32 %call93, 0
  br i1 %cmp94, label %if.then95, label %cleanup143

if.then95:                                        ; preds = %if.then85
  %flags.i.i244 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i32 0, i32 3
  %21 = load i64, i64* %flags.i.i244, align 8, !tbaa !158
  %or.i.sink.i = or i64 %21, 1
  store i64 %or.i.sink.i, i64* %flags.i.i244, align 8, !tbaa !158
  %call96 = tail call i32 @copy_to_device_already_locked(i8* %user_context, %struct.halide_buffer_t* nonnull %dst, %struct.halide_device_interface_t* %dst_device_interface) #13
  br label %if.end117

if.else98:                                        ; preds = %if.else81
  br i1 %tobool.not, label %cleanup143, label %if.then100

if.then100:                                       ; preds = %if.else98
  %call103 = tail call i32 @_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t(i8* %user_context, %struct.halide_buffer_t* nonnull %src) #13
  %cmp104 = icmp eq i32 %call103, 0
  br i1 %cmp104, label %if.then105, label %cleanup143

if.then105:                                       ; preds = %if.then100
  %impl106 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %dst_device_interface, i32 0, i32 15
  %22 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl106, align 8, !tbaa !185
  %buffer_copy107 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %22, i32 0, i32 10
  %23 = load i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)** %buffer_copy107, align 8, !tbaa !204
  %call108 = tail call i32 %23(i8* %user_context, %struct.halide_buffer_t* nonnull %src, %struct.halide_device_interface_t* nonnull %dst_device_interface, %struct.halide_buffer_t* nonnull %dst) #12
  br label %if.end117

if.end117:                                        ; preds = %if.then105, %if.then95, %if.then77, %if.then66, %if.end49
  %err.1 = phi i32 [ %call78, %if.then77 ], [ %call72, %if.then66 ], [ %call96, %if.then95 ], [ %call108, %if.then105 ], [ %call48, %if.end49 ]
  %cond = icmp eq i32 %err.1, 0
  br i1 %cond, label %land.lhs.true126, label %cleanup143

land.lhs.true126:                                 ; preds = %if.end117, %if.end117.thread262
  %cmp127.not.old = icmp eq %struct.halide_buffer_t* %dst, %src
  br i1 %cmp127.not.old, label %cleanup143, label %if.then128

if.then128:                                       ; preds = %land.lhs.true126
  %flags.i.i251 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i32 0, i32 3
  %24 = load i64, i64* %flags.i.i251, align 8, !tbaa !158
  %or.i.sink.i253 = and i64 %24, -4
  br i1 %tobool.not, label %if.else133, label %if.then130

if.then130:                                       ; preds = %if.then128
  %or.i.sink.i250 = or i64 %or.i.sink.i253, 2
  store i64 %or.i.sink.i250, i64* %flags.i.i251, align 8, !tbaa !158
  br label %cleanup143

if.else133:                                       ; preds = %if.then128
  %and.i.i255 = or i64 %or.i.sink.i253, 1
  store i64 %and.i.i255, i64* %flags.i.i251, align 8, !tbaa !158
  br label %cleanup143

cleanup143:                                       ; preds = %if.else133, %if.then130, %land.lhs.true126, %if.end117, %if.then100, %if.else98, %if.then85, %if.then74, %if.then51, %land.end32, %if.then7, %if.then
  %retval.1 = phi i32 [ -42, %if.then ], [ %call, %if.then7 ], [ -34, %land.end32 ], [ 0, %if.then130 ], [ 0, %if.else133 ], [ 0, %land.lhs.true126 ], [ -42, %if.then51 ], [ %err.1, %if.end117 ], [ -42, %if.else98 ], [ %call103, %if.then100 ], [ %call93, %if.then85 ], [ %call75, %if.then74 ]
  ret i32 %retval.1
}

; Function Attrs: nounwind
define weak i32 @halide_buffer_copy(i8* %user_context, %struct.halide_buffer_t* %src, %struct.halide_device_interface_t* %dst_device_interface, %struct.halide_buffer_t* %dst) local_unnamed_addr #3 {
entry:
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #12
  %tobool.not = icmp eq %struct.halide_device_interface_t* %dst_device_interface, null
  br i1 %tobool.not, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %dst_device_interface, i32 0, i32 15
  %0 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !185
  %use_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %0, i32 0, i32 0
  %1 = load void ()*, void ()** %use_module, align 8, !tbaa !191
  tail call void %1() #12
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %device_interface = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 1
  %2 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !156
  %tobool11.not = icmp eq %struct.halide_device_interface_t* %2, null
  br i1 %tobool11.not, label %if.end16, label %if.then12

if.then12:                                        ; preds = %if.end
  %impl14 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %2, i32 0, i32 15
  %3 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl14, align 8, !tbaa !185
  %use_module15 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %3, i32 0, i32 0
  %4 = load void ()*, void ()** %use_module15, align 8, !tbaa !191
  tail call void %4() #12
  br label %if.end16

if.end16:                                         ; preds = %if.then12, %if.end
  %call = tail call i32 @halide_buffer_copy_already_locked(i8* %user_context, %struct.halide_buffer_t* nonnull %src, %struct.halide_device_interface_t* %dst_device_interface, %struct.halide_buffer_t* %dst) #13
  br i1 %tobool.not, label %if.end20, label %if.then18

if.then18:                                        ; preds = %if.end16
  %impl19 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %dst_device_interface, i32 0, i32 15
  %5 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl19, align 8, !tbaa !185
  %release_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %5, i32 0, i32 1
  %6 = load void ()*, void ()** %release_module, align 8, !tbaa !193
  tail call void %6() #12
  br label %if.end20

if.end20:                                         ; preds = %if.then18, %if.end16
  %7 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !156
  %tobool22.not = icmp eq %struct.halide_device_interface_t* %7, null
  br i1 %tobool22.not, label %if.end27, label %if.then23

if.then23:                                        ; preds = %if.end20
  %impl25 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %7, i32 0, i32 15
  %8 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl25, align 8, !tbaa !185
  %release_module26 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %8, i32 0, i32 1
  %9 = load void ()*, void ()** %release_module26, align 8, !tbaa !193
  tail call void %9() #12
  br label %if.end27

if.end27:                                         ; preds = %if.then23, %if.end20
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #12
  ret i32 %call
}

; Function Attrs: mustprogress nounwind
define weak i32 @halide_default_device_crop(i8* %user_context, %struct.halide_buffer_t* %src, %struct.halide_buffer_t* %dst) local_unnamed_addr #0 {
entry:
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.58, i32 0, i32 0)) #12
  ret i32 -40
}

; Function Attrs: mustprogress nounwind
define weak i32 @halide_default_device_slice(i8* %user_context, %struct.halide_buffer_t* %src, i32 %slice_dim, i32 %slice_pos, %struct.halide_buffer_t* %dst) local_unnamed_addr #0 {
entry:
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.59, i32 0, i32 0)) #12
  ret i32 -40
}

; Function Attrs: nounwind
define weak i32 @halide_device_crop(i8* %user_context, %struct.halide_buffer_t* %src, %struct.halide_buffer_t* %dst) local_unnamed_addr #3 {
entry:
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #12
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 0
  %0 = load i64, i64* %device, align 8, !tbaa !154
  %tobool.not = icmp eq i64 %0, 0
  br i1 %tobool.not, label %cleanup, label %if.end

if.end:                                           ; preds = %entry
  %device1 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i32 0, i32 0
  %1 = load i64, i64* %device1, align 8, !tbaa !154
  %tobool2.not = icmp eq i64 %1, 0
  br i1 %tobool2.not, label %if.end4, label %if.then3

if.then3:                                         ; preds = %if.end
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.60, i32 0, i32 0)) #12
  br label %cleanup

if.end4:                                          ; preds = %if.end
  %dimensions = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 5
  %2 = load i32, i32* %dimensions, align 4, !tbaa !159
  %dimensions5 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i32 0, i32 5
  %3 = load i32, i32* %dimensions5, align 4, !tbaa !159
  %cmp.not = icmp eq i32 %2, %3
  br i1 %cmp.not, label %if.end7, label %if.then6

if.then6:                                         ; preds = %if.end4
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.61, i32 0, i32 0)) #12
  br label %cleanup

if.end7:                                          ; preds = %if.end4
  %device_interface = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 1
  %4 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !156
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %4, i32 0, i32 15
  %5 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !185
  %use_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %5, i32 0, i32 0
  %6 = load void ()*, void ()** %use_module, align 8, !tbaa !191
  tail call void %6() #12
  %7 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !156
  %impl9 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %7, i32 0, i32 15
  %8 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl9, align 8, !tbaa !185
  %device_crop = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %8, i32 0, i32 11
  %9 = load i32 (i8*, %struct.halide_buffer_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_buffer_t*)** %device_crop, align 8, !tbaa !205
  %call = tail call i32 %9(i8* %user_context, %struct.halide_buffer_t* nonnull %src, %struct.halide_buffer_t* nonnull %dst) #12
  br label %cleanup

cleanup:                                          ; preds = %if.end7, %if.then6, %if.then3, %entry
  %retval.0 = phi i32 [ -41, %if.then3 ], [ -41, %if.then6 ], [ %call, %if.end7 ], [ 0, %entry ]
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #12
  ret i32 %retval.0
}

; Function Attrs: nounwind
define weak i32 @halide_device_slice(i8* %user_context, %struct.halide_buffer_t* %src, i32 %slice_dim, i32 %slice_pos, %struct.halide_buffer_t* %dst) local_unnamed_addr #3 {
entry:
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #12
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 0
  %0 = load i64, i64* %device, align 8, !tbaa !154
  %tobool.not = icmp eq i64 %0, 0
  br i1 %tobool.not, label %cleanup, label %if.end

if.end:                                           ; preds = %entry
  %device1 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i32 0, i32 0
  %1 = load i64, i64* %device1, align 8, !tbaa !154
  %tobool2.not = icmp eq i64 %1, 0
  br i1 %tobool2.not, label %if.end4, label %if.then3

if.then3:                                         ; preds = %if.end
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.60, i32 0, i32 0)) #12
  br label %cleanup

if.end4:                                          ; preds = %if.end
  %dimensions = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 5
  %2 = load i32, i32* %dimensions, align 4, !tbaa !159
  %dimensions5 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i32 0, i32 5
  %3 = load i32, i32* %dimensions5, align 4, !tbaa !159
  %add = add nsw i32 %3, 1
  %cmp.not = icmp eq i32 %2, %add
  br i1 %cmp.not, label %if.end7, label %if.then6

if.then6:                                         ; preds = %if.end4
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.64, i32 0, i32 0)) #12
  br label %cleanup

if.end7:                                          ; preds = %if.end4
  %device_interface = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 1
  %4 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !156
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %4, i32 0, i32 15
  %5 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !185
  %use_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %5, i32 0, i32 0
  %6 = load void ()*, void ()** %use_module, align 8, !tbaa !191
  tail call void %6() #12
  %7 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !156
  %impl9 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %7, i32 0, i32 15
  %8 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl9, align 8, !tbaa !185
  %device_slice = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %8, i32 0, i32 12
  %9 = load i32 (i8*, %struct.halide_buffer_t*, i32, i32, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, i32, i32, %struct.halide_buffer_t*)** %device_slice, align 8, !tbaa !206
  %call = tail call i32 %9(i8* %user_context, %struct.halide_buffer_t* nonnull %src, i32 %slice_dim, i32 %slice_pos, %struct.halide_buffer_t* nonnull %dst) #12
  br label %cleanup

cleanup:                                          ; preds = %if.end7, %if.then6, %if.then3, %entry
  %retval.0 = phi i32 [ -41, %if.then3 ], [ -41, %if.then6 ], [ %call, %if.end7 ], [ 0, %entry ]
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #12
  ret i32 %retval.0
}

; Function Attrs: mustprogress nounwind
define weak i32 @halide_default_device_release_crop(i8* %user_context, %struct.halide_buffer_t* %buf) local_unnamed_addr #0 {
entry:
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %0 = load i64, i64* %device, align 8, !tbaa !154
  %tobool.not = icmp eq i64 %0, 0
  br i1 %tobool.not, label %return, label %if.end

if.end:                                           ; preds = %entry
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.58, i32 0, i32 0)) #12
  br label %return

return:                                           ; preds = %if.end, %entry
  %retval.0 = phi i32 [ -40, %if.end ], [ 0, %entry ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define weak i32 @halide_device_release_crop(i8* %user_context, %struct.halide_buffer_t* %buf) local_unnamed_addr #3 {
entry:
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %0 = load i64, i64* %device, align 8, !tbaa !154
  %tobool.not = icmp eq i64 %0, 0
  br i1 %tobool.not, label %return, label %if.then

if.then:                                          ; preds = %entry
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #12
  %device_interface = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %1 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !156
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %1, i32 0, i32 15
  %2 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !185
  %device_release_crop = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %2, i32 0, i32 13
  %3 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %device_release_crop, align 8, !tbaa !207
  %call = tail call i32 %3(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #12
  store i64 0, i64* %device, align 8, !tbaa !154
  %4 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !185
  %release_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %4, i32 0, i32 1
  %5 = load void ()*, void ()** %release_module, align 8, !tbaa !193
  tail call void %5() #12
  store %struct.halide_device_interface_t* null, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !156
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #12
  br label %return

return:                                           ; preds = %if.then, %entry
  %retval.0 = phi i32 [ %call, %if.then ], [ 0, %entry ]
  ret i32 %retval.0
}

; Function Attrs: mustprogress nounwind
define weak float @halide_float16_bits_to_float(i16 zeroext %bits) local_unnamed_addr #0 {
entry:
  %conv = zext i16 %bits to i32
  %and2 = and i32 %conv, 1023
  %and4 = lshr i32 %conv, 10
  %0 = and i32 %and4, 31
  %cmp = icmp eq i32 %0, 0
  %cmp5 = icmp ne i32 %and2, 0
  %or.cond = select i1 %cmp, i1 %cmp5, i1 false
  br i1 %or.cond, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = tail call i32 @llvm.ctlz.i32(i32 %and2, i1 true), !range !208
  %sub6 = xor i32 %1, 31
  %shl7 = shl nuw i32 1, %sub6
  %neg = xor i32 %shl7, -1
  %and8 = and i32 %and2, %neg
  %sub9 = sub nsw i32 23, %sub6
  %shl10 = shl i32 %and8, %sub9
  %add11.neg = mul nsw i32 %1, -8388608
  %shl12 = add nsw i32 %add11.neg, 1124073472
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
declare i32 @llvm.ctlz.i32(i32, i1 immarg) #7

; Function Attrs: mustprogress nounwind
define weak double @halide_float16_bits_to_double(i16 zeroext %bits) local_unnamed_addr #0 {
entry:
  %call = tail call float @halide_float16_bits_to_float(i16 zeroext %bits) #13
  %conv = fpext float %call to double
  ret double %conv
}

; Function Attrs: nounwind
define weak i32 @halide_error_bounds_inference_call_failed(i8* %user_context, i8* %extern_stage_name, i32 %result) local_unnamed_addr #3 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #12
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i71 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.36, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !15
  %call.i72 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.36, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %if.then6.i, %entry.split
  %phi.call = phi i8* [ %call.i71, %entry.split ], [ %call.i72, %if.then6.i ]
  %ref.tmp.sroa.16.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i10 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.16.0, i8* %extern_stage_name) #12
  %call.i13 = tail call i8* @halide_string_to_string(i8* %call.i10, i8* %ref.tmp.sroa.16.0, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.1.37, i32 0, i32 0)) #12
  %conv.i = sext i32 %result to i64
  %call.i16 = tail call i8* @halide_int64_to_string(i8* %call.i13, i8* %ref.tmp.sroa.16.0, i64 %conv.i, i32 1) #12
  br i1 %tobool.not.i, label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit, label %if.else.i

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %0 = ptrtoint i8* %call.i16 to i32
  %sub.ptr.lhs.cast.i.i = zext i32 %0 to i64
  %1 = ptrtoint i8* %call.i to i32
  %sub.ptr.rhs.cast.i.i = zext i32 %1 to i64
  %sub.ptr.sub.i.i = sub nsw i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add nsw i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %.sink10.i = phi i8* [ %call.i, %if.else.i ], [ getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.123, i32 0, i32 0), %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit ]
  tail call void @halide_error(i8* %user_context, i8* nonnull %.sink10.i) #12
  tail call void @free(i8* %call.i) #12
  ret i32 %result
}

; Function Attrs: nounwind
define weak i32 @halide_error_extern_stage_failed(i8* %user_context, i8* %extern_stage_name, i32 %result) local_unnamed_addr #3 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #12
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i71 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.2.38, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !15
  %call.i72 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.2.38, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %if.then6.i, %entry.split
  %phi.call = phi i8* [ %call.i71, %entry.split ], [ %call.i72, %if.then6.i ]
  %ref.tmp.sroa.16.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i10 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.16.0, i8* %extern_stage_name) #12
  %call.i13 = tail call i8* @halide_string_to_string(i8* %call.i10, i8* %ref.tmp.sroa.16.0, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.1.37, i32 0, i32 0)) #12
  %conv.i = sext i32 %result to i64
  %call.i16 = tail call i8* @halide_int64_to_string(i8* %call.i13, i8* %ref.tmp.sroa.16.0, i64 %conv.i, i32 1) #12
  br i1 %tobool.not.i, label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit, label %if.else.i

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %0 = ptrtoint i8* %call.i16 to i32
  %sub.ptr.lhs.cast.i.i = zext i32 %0 to i64
  %1 = ptrtoint i8* %call.i to i32
  %sub.ptr.rhs.cast.i.i = zext i32 %1 to i64
  %sub.ptr.sub.i.i = sub nsw i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add nsw i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %.sink10.i = phi i8* [ %call.i, %if.else.i ], [ getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.123, i32 0, i32 0), %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit ]
  tail call void @halide_error(i8* %user_context, i8* nonnull %.sink10.i) #12
  tail call void @free(i8* %call.i) #12
  ret i32 %result
}

; Function Attrs: nounwind
define weak i32 @halide_error_explicit_bounds_too_small(i8* %user_context, i8* %func_name, i8* %var_name, i32 %min_bound, i32 %max_bound, i32 %min_required, i32 %max_required) local_unnamed_addr #3 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #12
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i151 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3.39, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !15
  %call.i152 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3.39, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %if.then6.i, %entry.split
  %phi.call = phi i8* [ %call.i151, %entry.split ], [ %call.i152, %if.then6.i ]
  %ref.tmp.sroa.34.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i18 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.34.0, i8* %var_name) #12
  %call.i21 = tail call i8* @halide_string_to_string(i8* %call.i18, i8* %ref.tmp.sroa.34.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4.40, i32 0, i32 0)) #12
  %call.i24 = tail call i8* @halide_string_to_string(i8* %call.i21, i8* %ref.tmp.sroa.34.0, i8* %func_name) #12
  %call.i27 = tail call i8* @halide_string_to_string(i8* %call.i24, i8* %ref.tmp.sroa.34.0, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5.41, i32 0, i32 0)) #12
  %conv.i = sext i32 %min_bound to i64
  %call.i30 = tail call i8* @halide_int64_to_string(i8* %call.i27, i8* %ref.tmp.sroa.34.0, i64 %conv.i, i32 1) #12
  %call.i33 = tail call i8* @halide_string_to_string(i8* %call.i30, i8* %ref.tmp.sroa.34.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6.42, i32 0, i32 0)) #12
  %conv.i36 = sext i32 %max_bound to i64
  %call.i37 = tail call i8* @halide_int64_to_string(i8* %call.i33, i8* %ref.tmp.sroa.34.0, i64 %conv.i36, i32 1) #12
  %call.i40 = tail call i8* @halide_string_to_string(i8* %call.i37, i8* %ref.tmp.sroa.34.0, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.7.43, i32 0, i32 0)) #12
  %conv.i43 = sext i32 %min_required to i64
  %call.i44 = tail call i8* @halide_int64_to_string(i8* %call.i40, i8* %ref.tmp.sroa.34.0, i64 %conv.i43, i32 1) #12
  %call.i47 = tail call i8* @halide_string_to_string(i8* %call.i44, i8* %ref.tmp.sroa.34.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6.42, i32 0, i32 0)) #12
  %conv.i50 = sext i32 %max_required to i64
  %call.i51 = tail call i8* @halide_int64_to_string(i8* %call.i47, i8* %ref.tmp.sroa.34.0, i64 %conv.i50, i32 1) #12
  %call.i54 = tail call i8* @halide_string_to_string(i8* %call.i51, i8* %ref.tmp.sroa.34.0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8.44, i32 0, i32 0)) #12
  br i1 %tobool.not.i, label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit, label %if.else.i

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %0 = ptrtoint i8* %call.i54 to i32
  %sub.ptr.lhs.cast.i.i = zext i32 %0 to i64
  %1 = ptrtoint i8* %call.i to i32
  %sub.ptr.rhs.cast.i.i = zext i32 %1 to i64
  %sub.ptr.sub.i.i = sub nsw i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add nsw i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %.sink10.i = phi i8* [ %call.i, %if.else.i ], [ getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.123, i32 0, i32 0), %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit ]
  tail call void @halide_error(i8* %user_context, i8* nonnull %.sink10.i) #12
  tail call void @free(i8* %call.i) #12
  ret i32 -2
}

; Function Attrs: nounwind
define weak i32 @halide_error_bad_type(i8* %user_context, i8* %func_name, i32 %type_given_bits, i32 %correct_type_bits) local_unnamed_addr #3 {
entry:
  %type_given_bits.addr = alloca i32, align 4
  %correct_type_bits.addr = alloca i32, align 4
  %correct_type = alloca %struct.halide_type_t, align 2
  %type_given = alloca %struct.halide_type_t, align 2
  store i32 %type_given_bits, i32* %type_given_bits.addr, align 4, !tbaa !79
  store i32 %correct_type_bits, i32* %correct_type_bits.addr, align 4, !tbaa !79
  %0 = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %correct_type, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %0) #10
  store i8 0, i8* %0, align 2, !tbaa !148
  %bits.i = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %correct_type, i32 0, i32 1
  store i8 0, i8* %bits.i, align 1, !tbaa !152
  %lanes.i = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %correct_type, i32 0, i32 2
  store i16 0, i16* %lanes.i, align 2, !tbaa !153
  %1 = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %type_given, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %1) #10
  store i8 0, i8* %1, align 2, !tbaa !148
  %bits.i8 = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %type_given, i32 0, i32 1
  store i8 0, i8* %bits.i8, align 1, !tbaa !152
  %lanes.i9 = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %type_given, i32 0, i32 2
  store i16 0, i16* %lanes.i9, align 2, !tbaa !153
  %2 = bitcast i32* %correct_type_bits.addr to i8*
  %call = call i8* @memcpy(i8* nonnull %0, i8* nonnull %2, i64 4) #12
  %3 = bitcast i32* %type_given_bits.addr to i8*
  %call1 = call i8* @memcpy(i8* nonnull %1, i8* nonnull %3, i64 4) #12
  %call.i = call i8* @malloc(i64 1024) #12
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i121 = call i8* @halide_string_to_string(i8* null, i8* null, i8* %func_name) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !15
  %call.i122 = call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* %func_name) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %if.then6.i, %entry.split
  %phi.call = phi i8* [ %call.i121, %entry.split ], [ %call.i122, %if.then6.i ]
  %ref.tmp.sroa.18.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i15 = call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.18.0, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.9.45, i32 0, i32 0)) #12
  %call.i18 = call i8* @halide_type_to_string(i8* %call.i15, i8* %ref.tmp.sroa.18.0, %struct.halide_type_t* nonnull %correct_type) #12
  %call.i21 = call i8* @halide_string_to_string(i8* %call.i18, i8* %ref.tmp.sroa.18.0, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.10.46, i32 0, i32 0)) #12
  %call.i24 = call i8* @halide_type_to_string(i8* %call.i21, i8* %ref.tmp.sroa.18.0, %struct.halide_type_t* nonnull %type_given) #12
  br i1 %tobool.not.i, label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit, label %if.else.i

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %4 = ptrtoint i8* %call.i24 to i32
  %sub.ptr.lhs.cast.i.i = zext i32 %4 to i64
  %5 = ptrtoint i8* %call.i to i32
  %sub.ptr.rhs.cast.i.i = zext i32 %5 to i64
  %sub.ptr.sub.i.i = sub nsw i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add nsw i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %.sink10.i = phi i8* [ %call.i, %if.else.i ], [ getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.123, i32 0, i32 0), %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit ]
  call void @halide_error(i8* %user_context, i8* nonnull %.sink10.i) #12
  call void @free(i8* %call.i) #12
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1) #10
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %0) #10
  ret i32 -3
}

; Function Attrs: nounwind
define weak i32 @halide_error_bad_dimensions(i8* %user_context, i8* %func_name, i32 %dimensions_given, i32 %correct_dimensions) local_unnamed_addr #3 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #12
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i81 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* %func_name) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !15
  %call.i82 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* %func_name) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %if.then6.i, %entry.split
  %phi.call = phi i8* [ %call.i81, %entry.split ], [ %call.i82, %if.then6.i ]
  %ref.tmp.sroa.20.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i11 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.11.47, i32 0, i32 0)) #12
  %conv.i = sext i32 %correct_dimensions to i64
  %call.i14 = tail call i8* @halide_int64_to_string(i8* %call.i11, i8* %ref.tmp.sroa.20.0, i64 %conv.i, i32 1) #12
  %call.i17 = tail call i8* @halide_string_to_string(i8* %call.i14, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.12.48, i32 0, i32 0)) #12
  %conv.i20 = sext i32 %dimensions_given to i64
  %call.i21 = tail call i8* @halide_int64_to_string(i8* %call.i17, i8* %ref.tmp.sroa.20.0, i64 %conv.i20, i32 1) #12
  %call.i24 = tail call i8* @halide_string_to_string(i8* %call.i21, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.13.49, i32 0, i32 0)) #12
  br i1 %tobool.not.i, label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit, label %if.else.i

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %0 = ptrtoint i8* %call.i24 to i32
  %sub.ptr.lhs.cast.i.i = zext i32 %0 to i64
  %1 = ptrtoint i8* %call.i to i32
  %sub.ptr.rhs.cast.i.i = zext i32 %1 to i64
  %sub.ptr.sub.i.i = sub nsw i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add nsw i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %.sink10.i = phi i8* [ %call.i, %if.else.i ], [ getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.123, i32 0, i32 0), %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit ]
  tail call void @halide_error(i8* %user_context, i8* nonnull %.sink10.i) #12
  tail call void @free(i8* %call.i) #12
  ret i32 -43
}

; Function Attrs: nounwind
define weak i32 @halide_error_access_out_of_bounds(i8* %user_context, i8* %func_name, i32 %dimension, i32 %min_touched, i32 %max_touched, i32 %min_valid, i32 %max_valid) local_unnamed_addr #3 {
entry:
  %cmp = icmp slt i32 %min_touched, %min_valid
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call.i = tail call i8* @malloc(i64 1024) #12
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %if.then.split, label %if.then6.i

if.then.split:                                    ; preds = %if.then
  %call.i271 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* %func_name) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %if.then
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !15
  %call.i272 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* %func_name) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %if.then6.i, %if.then.split
  %phi.call = phi i8* [ %call.i271, %if.then.split ], [ %call.i272, %if.then6.i ]
  %ref.tmp.sroa.22.0 = phi i8* [ null, %if.then.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i30 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.22.0, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.14.50, i32 0, i32 0)) #12
  %conv.i = sext i32 %min_touched to i64
  %call.i33 = tail call i8* @halide_int64_to_string(i8* %call.i30, i8* %ref.tmp.sroa.22.0, i64 %conv.i, i32 1) #12
  %call.i36 = tail call i8* @halide_string_to_string(i8* %call.i33, i8* %ref.tmp.sroa.22.0, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.15.51, i32 0, i32 0)) #12
  %conv.i39 = sext i32 %min_valid to i64
  %call.i40 = tail call i8* @halide_int64_to_string(i8* %call.i36, i8* %ref.tmp.sroa.22.0, i64 %conv.i39, i32 1) #12
  %call.i43 = tail call i8* @halide_string_to_string(i8* %call.i40, i8* %ref.tmp.sroa.22.0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.16.52, i32 0, i32 0)) #12
  %conv.i46 = sext i32 %dimension to i64
  %call.i47 = tail call i8* @halide_int64_to_string(i8* %call.i43, i8* %ref.tmp.sroa.22.0, i64 %conv.i46, i32 1) #12
  br i1 %tobool.not.i, label %if.end17.sink.split, label %if.end17.sink.split.sink.split

if.else:                                          ; preds = %entry
  %cmp7 = icmp sgt i32 %max_touched, %max_valid
  br i1 %cmp7, label %if.then8, label %if.end17

if.then8:                                         ; preds = %if.else
  %call.i53 = tail call i8* @malloc(i64 1024) #12
  %tobool.not.i56 = icmp eq i8* %call.i53, null
  br i1 %tobool.not.i56, label %if.then8.split, label %if.then6.i59

if.then8.split:                                   ; preds = %if.then8
  %call.i653 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* %func_name) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit62

if.then6.i59:                                     ; preds = %if.then8
  %add.ptr.i57 = getelementptr inbounds i8, i8* %call.i53, i32 1023
  store i8 0, i8* %add.ptr.i57, align 1, !tbaa !15
  %call.i654 = tail call i8* @halide_string_to_string(i8* nonnull %call.i53, i8* nonnull %add.ptr.i57, i8* %func_name) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit62

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit62: ; preds = %if.then6.i59, %if.then8.split
  %phi.call5 = phi i8* [ %call.i653, %if.then8.split ], [ %call.i654, %if.then6.i59 ]
  %ref.tmp9.sroa.22.0 = phi i8* [ null, %if.then8.split ], [ %add.ptr.i57, %if.then6.i59 ]
  %call.i68 = tail call i8* @halide_string_to_string(i8* %phi.call5, i8* %ref.tmp9.sroa.22.0, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.14.50, i32 0, i32 0)) #12
  %conv.i71 = sext i32 %max_touched to i64
  %call.i72 = tail call i8* @halide_int64_to_string(i8* %call.i68, i8* %ref.tmp9.sroa.22.0, i64 %conv.i71, i32 1) #12
  %call.i75 = tail call i8* @halide_string_to_string(i8* %call.i72, i8* %ref.tmp9.sroa.22.0, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.17.53, i32 0, i32 0)) #12
  %conv.i78 = sext i32 %max_valid to i64
  %call.i79 = tail call i8* @halide_int64_to_string(i8* %call.i75, i8* %ref.tmp9.sroa.22.0, i64 %conv.i78, i32 1) #12
  %call.i82 = tail call i8* @halide_string_to_string(i8* %call.i79, i8* %ref.tmp9.sroa.22.0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.16.52, i32 0, i32 0)) #12
  %conv.i85 = sext i32 %dimension to i64
  %call.i86 = tail call i8* @halide_int64_to_string(i8* %call.i82, i8* %ref.tmp9.sroa.22.0, i64 %conv.i85, i32 1) #12
  br i1 %tobool.not.i56, label %if.end17.sink.split, label %if.end17.sink.split.sink.split

if.end17.sink.split.sink.split:                   ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit62, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %call.i86.sink = phi i8* [ %call.i47, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit ], [ %call.i86, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit62 ]
  %call.i53.sink152 = phi i8* [ %call.i, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit ], [ %call.i53, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit62 ]
  %0 = ptrtoint i8* %call.i86.sink to i32
  %sub.ptr.lhs.cast.i.i95 = zext i32 %0 to i64
  %1 = ptrtoint i8* %call.i53.sink152 to i32
  %sub.ptr.rhs.cast.i.i96 = zext i32 %1 to i64
  %sub.ptr.sub.i.i97 = add nuw nsw i64 %sub.ptr.lhs.cast.i.i95, 1
  %add.i.i98 = sub nsw i64 %sub.ptr.sub.i.i97, %sub.ptr.rhs.cast.i.i96
  %call.i.i99 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i53.sink152, i64 %add.i.i98) #12
  br label %if.end17.sink.split

if.end17.sink.split:                              ; preds = %if.end17.sink.split.sink.split, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit62, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %.sink10.i101.sink = phi i8* [ getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.123, i32 0, i32 0), %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit ], [ getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.123, i32 0, i32 0), %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit62 ], [ %call.i53.sink152, %if.end17.sink.split.sink.split ]
  %call.i53.sink = phi i8* [ null, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit ], [ null, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit62 ], [ %call.i53.sink152, %if.end17.sink.split.sink.split ]
  tail call void @halide_error(i8* %user_context, i8* nonnull %.sink10.i101.sink) #12
  tail call void @free(i8* %call.i53.sink) #12
  br label %if.end17

if.end17:                                         ; preds = %if.end17.sink.split, %if.else
  ret i32 -4
}

; Function Attrs: nounwind
define weak i32 @halide_error_buffer_allocation_too_large(i8* %user_context, i8* %buffer_name, i64 %allocation_size, i64 %max_size) local_unnamed_addr #3 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #12
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i81 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.18.54, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !15
  %call.i82 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.18.54, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %if.then6.i, %entry.split
  %phi.call = phi i8* [ %call.i81, %entry.split ], [ %call.i82, %if.then6.i ]
  %ref.tmp.sroa.20.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i11 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.20.0, i8* %buffer_name) #12
  %call.i14 = tail call i8* @halide_string_to_string(i8* %call.i11, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.55, i32 0, i32 0)) #12
  %call.i17 = tail call i8* @halide_uint64_to_string(i8* %call.i14, i8* %ref.tmp.sroa.20.0, i64 %allocation_size, i32 1) #12
  %call.i20 = tail call i8* @halide_string_to_string(i8* %call.i17, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.20.56, i32 0, i32 0)) #12
  %call.i23 = tail call i8* @halide_uint64_to_string(i8* %call.i20, i8* %ref.tmp.sroa.20.0, i64 %max_size, i32 1) #12
  br i1 %tobool.not.i, label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit, label %if.else.i

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %0 = ptrtoint i8* %call.i23 to i32
  %sub.ptr.lhs.cast.i.i = zext i32 %0 to i64
  %1 = ptrtoint i8* %call.i to i32
  %sub.ptr.rhs.cast.i.i = zext i32 %1 to i64
  %sub.ptr.sub.i.i = sub nsw i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add nsw i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %.sink10.i = phi i8* [ %call.i, %if.else.i ], [ getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.123, i32 0, i32 0), %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit ]
  tail call void @halide_error(i8* %user_context, i8* nonnull %.sink10.i) #12
  tail call void @free(i8* %call.i) #12
  ret i32 -5
}

; Function Attrs: nounwind
define weak i32 @halide_error_buffer_extents_negative(i8* %user_context, i8* %buffer_name, i32 %dimension, i32 %extent) local_unnamed_addr #3 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #12
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i91 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.21.57, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !15
  %call.i92 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.21.57, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %if.then6.i, %entry.split
  %phi.call = phi i8* [ %call.i91, %entry.split ], [ %call.i92, %if.then6.i ]
  %ref.tmp.sroa.22.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i12 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.22.0, i8* %buffer_name) #12
  %call.i15 = tail call i8* @halide_string_to_string(i8* %call.i12, i8* %ref.tmp.sroa.22.0, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.22.58, i32 0, i32 0)) #12
  %conv.i = sext i32 %dimension to i64
  %call.i18 = tail call i8* @halide_int64_to_string(i8* %call.i15, i8* %ref.tmp.sroa.22.0, i64 %conv.i, i32 1) #12
  %call.i21 = tail call i8* @halide_string_to_string(i8* %call.i18, i8* %ref.tmp.sroa.22.0, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.23.59, i32 0, i32 0)) #12
  %conv.i24 = sext i32 %extent to i64
  %call.i25 = tail call i8* @halide_int64_to_string(i8* %call.i21, i8* %ref.tmp.sroa.22.0, i64 %conv.i24, i32 1) #12
  %call.i28 = tail call i8* @halide_string_to_string(i8* %call.i25, i8* %ref.tmp.sroa.22.0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8.44, i32 0, i32 0)) #12
  br i1 %tobool.not.i, label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit, label %if.else.i

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %0 = ptrtoint i8* %call.i28 to i32
  %sub.ptr.lhs.cast.i.i = zext i32 %0 to i64
  %1 = ptrtoint i8* %call.i to i32
  %sub.ptr.rhs.cast.i.i = zext i32 %1 to i64
  %sub.ptr.sub.i.i = sub nsw i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add nsw i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %.sink10.i = phi i8* [ %call.i, %if.else.i ], [ getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.123, i32 0, i32 0), %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit ]
  tail call void @halide_error(i8* %user_context, i8* nonnull %.sink10.i) #12
  tail call void @free(i8* %call.i) #12
  ret i32 -28
}

; Function Attrs: nounwind
define weak i32 @halide_error_buffer_extents_too_large(i8* %user_context, i8* %buffer_name, i64 %actual_size, i64 %max_size) local_unnamed_addr #3 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #12
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i81 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.24.60, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !15
  %call.i82 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.24.60, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %if.then6.i, %entry.split
  %phi.call = phi i8* [ %call.i81, %entry.split ], [ %call.i82, %if.then6.i ]
  %ref.tmp.sroa.20.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i11 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.20.0, i8* %buffer_name) #12
  %call.i14 = tail call i8* @halide_string_to_string(i8* %call.i11, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.55, i32 0, i32 0)) #12
  %call.i17 = tail call i8* @halide_int64_to_string(i8* %call.i14, i8* %ref.tmp.sroa.20.0, i64 %actual_size, i32 1) #12
  %call.i20 = tail call i8* @halide_string_to_string(i8* %call.i17, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.20.56, i32 0, i32 0)) #12
  %call.i23 = tail call i8* @halide_int64_to_string(i8* %call.i20, i8* %ref.tmp.sroa.20.0, i64 %max_size, i32 1) #12
  br i1 %tobool.not.i, label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit, label %if.else.i

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %0 = ptrtoint i8* %call.i23 to i32
  %sub.ptr.lhs.cast.i.i = zext i32 %0 to i64
  %1 = ptrtoint i8* %call.i to i32
  %sub.ptr.rhs.cast.i.i = zext i32 %1 to i64
  %sub.ptr.sub.i.i = sub nsw i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add nsw i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %.sink10.i = phi i8* [ %call.i, %if.else.i ], [ getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.123, i32 0, i32 0), %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit ]
  tail call void @halide_error(i8* %user_context, i8* nonnull %.sink10.i) #12
  tail call void @free(i8* %call.i) #12
  ret i32 -6
}

; Function Attrs: nounwind
define weak i32 @halide_error_constraints_make_required_region_smaller(i8* %user_context, i8* %buffer_name, i32 %dimension, i32 %constrained_min, i32 %constrained_extent, i32 %required_min, i32 %required_extent) local_unnamed_addr #3 {
entry:
  %add = add i32 %required_min, -1
  %sub = add i32 %add, %required_extent
  %add1 = add i32 %constrained_min, -1
  %sub2 = add i32 %add1, %constrained_extent
  %call.i = tail call i8* @malloc(i64 1024) #12
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i231 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.25.61, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !15
  %call.i232 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.25.61, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %if.then6.i, %entry.split
  %phi.call = phi i8* [ %call.i231, %entry.split ], [ %call.i232, %if.then6.i ]
  %ref.tmp.sroa.38.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i26 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.38.0, i8* %buffer_name) #12
  %call.i29 = tail call i8* @halide_string_to_string(i8* %call.i26, i8* %ref.tmp.sroa.38.0, i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.26.62, i32 0, i32 0)) #12
  %conv.i = sext i32 %dimension to i64
  %call.i32 = tail call i8* @halide_int64_to_string(i8* %call.i29, i8* %ref.tmp.sroa.38.0, i64 %conv.i, i32 1) #12
  %call.i35 = tail call i8* @halide_string_to_string(i8* %call.i32, i8* %ref.tmp.sroa.38.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.27.63, i32 0, i32 0)) #12
  %call.i38 = tail call i8* @halide_string_to_string(i8* %call.i35, i8* %ref.tmp.sroa.38.0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.28.64, i32 0, i32 0)) #12
  %conv.i41 = sext i32 %required_min to i64
  %call.i42 = tail call i8* @halide_int64_to_string(i8* %call.i38, i8* %ref.tmp.sroa.38.0, i64 %conv.i41, i32 1) #12
  %call.i45 = tail call i8* @halide_string_to_string(i8* %call.i42, i8* %ref.tmp.sroa.38.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6.42, i32 0, i32 0)) #12
  %conv.i48 = sext i32 %sub to i64
  %call.i49 = tail call i8* @halide_int64_to_string(i8* %call.i45, i8* %ref.tmp.sroa.38.0, i64 %conv.i48, i32 1) #12
  %call.i52 = tail call i8* @halide_string_to_string(i8* %call.i49, i8* %ref.tmp.sroa.38.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.27.63, i32 0, i32 0)) #12
  %call.i55 = tail call i8* @halide_string_to_string(i8* %call.i52, i8* %ref.tmp.sroa.38.0, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.29.65, i32 0, i32 0)) #12
  %conv.i58 = sext i32 %constrained_min to i64
  %call.i59 = tail call i8* @halide_int64_to_string(i8* %call.i55, i8* %ref.tmp.sroa.38.0, i64 %conv.i58, i32 1) #12
  %call.i62 = tail call i8* @halide_string_to_string(i8* %call.i59, i8* %ref.tmp.sroa.38.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6.42, i32 0, i32 0)) #12
  %conv.i65 = sext i32 %sub2 to i64
  %call.i66 = tail call i8* @halide_int64_to_string(i8* %call.i62, i8* %ref.tmp.sroa.38.0, i64 %conv.i65, i32 1) #12
  %call.i69 = tail call i8* @halide_string_to_string(i8* %call.i66, i8* %ref.tmp.sroa.38.0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30.66, i32 0, i32 0)) #12
  br i1 %tobool.not.i, label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit, label %if.else.i

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %0 = ptrtoint i8* %call.i69 to i32
  %sub.ptr.lhs.cast.i.i = zext i32 %0 to i64
  %1 = ptrtoint i8* %call.i to i32
  %sub.ptr.rhs.cast.i.i = zext i32 %1 to i64
  %sub.ptr.sub.i.i = sub nsw i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add nsw i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %.sink10.i = phi i8* [ %call.i, %if.else.i ], [ getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.123, i32 0, i32 0), %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit ]
  tail call void @halide_error(i8* %user_context, i8* nonnull %.sink10.i) #12
  tail call void @free(i8* %call.i) #12
  ret i32 -7
}

; Function Attrs: nounwind
define weak i32 @halide_error_constraint_violated(i8* %user_context, i8* %var, i32 %val, i8* %constrained_var, i32 %constrained_val) local_unnamed_addr #3 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #12
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i111 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.31.67, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !15
  %call.i112 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.31.67, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %if.then6.i, %entry.split
  %phi.call = phi i8* [ %call.i111, %entry.split ], [ %call.i112, %if.then6.i ]
  %ref.tmp.sroa.26.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i14 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.26.0, i8* %var) #12
  %call.i17 = tail call i8* @halide_string_to_string(i8* %call.i14, i8* %ref.tmp.sroa.26.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.32.68, i32 0, i32 0)) #12
  %conv.i = sext i32 %val to i64
  %call.i20 = tail call i8* @halide_int64_to_string(i8* %call.i17, i8* %ref.tmp.sroa.26.0, i64 %conv.i, i32 1) #12
  %call.i23 = tail call i8* @halide_string_to_string(i8* %call.i20, i8* %ref.tmp.sroa.26.0, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.33.69, i32 0, i32 0)) #12
  %call.i26 = tail call i8* @halide_string_to_string(i8* %call.i23, i8* %ref.tmp.sroa.26.0, i8* %constrained_var) #12
  %call.i29 = tail call i8* @halide_string_to_string(i8* %call.i26, i8* %ref.tmp.sroa.26.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.32.68, i32 0, i32 0)) #12
  %conv.i32 = sext i32 %constrained_val to i64
  %call.i33 = tail call i8* @halide_int64_to_string(i8* %call.i29, i8* %ref.tmp.sroa.26.0, i64 %conv.i32, i32 1) #12
  %call.i36 = tail call i8* @halide_string_to_string(i8* %call.i33, i8* %ref.tmp.sroa.26.0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8.44, i32 0, i32 0)) #12
  br i1 %tobool.not.i, label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit, label %if.else.i

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %0 = ptrtoint i8* %call.i36 to i32
  %sub.ptr.lhs.cast.i.i = zext i32 %0 to i64
  %1 = ptrtoint i8* %call.i to i32
  %sub.ptr.rhs.cast.i.i = zext i32 %1 to i64
  %sub.ptr.sub.i.i = sub nsw i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add nsw i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %.sink10.i = phi i8* [ %call.i, %if.else.i ], [ getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.123, i32 0, i32 0), %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit ]
  tail call void @halide_error(i8* %user_context, i8* nonnull %.sink10.i) #12
  tail call void @free(i8* %call.i) #12
  ret i32 -8
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_small_i64(i8* %user_context, i8* %param_name, i64 %val, i64 %min_val) local_unnamed_addr #3 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #12
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i81 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.70, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !15
  %call.i82 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.70, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %if.then6.i, %entry.split
  %phi.call = phi i8* [ %call.i81, %entry.split ], [ %call.i82, %if.then6.i ]
  %ref.tmp.sroa.20.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i11 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.20.0, i8* %param_name) #12
  %call.i14 = tail call i8* @halide_string_to_string(i8* %call.i11, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.55, i32 0, i32 0)) #12
  %call.i17 = tail call i8* @halide_int64_to_string(i8* %call.i14, i8* %ref.tmp.sroa.20.0, i64 %val, i32 1) #12
  %call.i20 = tail call i8* @halide_string_to_string(i8* %call.i17, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.35.71, i32 0, i32 0)) #12
  %call.i23 = tail call i8* @halide_int64_to_string(i8* %call.i20, i8* %ref.tmp.sroa.20.0, i64 %min_val, i32 1) #12
  br i1 %tobool.not.i, label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit, label %if.else.i

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %0 = ptrtoint i8* %call.i23 to i32
  %sub.ptr.lhs.cast.i.i = zext i32 %0 to i64
  %1 = ptrtoint i8* %call.i to i32
  %sub.ptr.rhs.cast.i.i = zext i32 %1 to i64
  %sub.ptr.sub.i.i = sub nsw i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add nsw i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %.sink10.i = phi i8* [ %call.i, %if.else.i ], [ getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.123, i32 0, i32 0), %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit ]
  tail call void @halide_error(i8* %user_context, i8* nonnull %.sink10.i) #12
  tail call void @free(i8* %call.i) #12
  ret i32 -9
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_small_u64(i8* %user_context, i8* %param_name, i64 %val, i64 %min_val) local_unnamed_addr #3 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #12
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i81 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.70, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !15
  %call.i82 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.70, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %if.then6.i, %entry.split
  %phi.call = phi i8* [ %call.i81, %entry.split ], [ %call.i82, %if.then6.i ]
  %ref.tmp.sroa.20.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i11 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.20.0, i8* %param_name) #12
  %call.i14 = tail call i8* @halide_string_to_string(i8* %call.i11, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.55, i32 0, i32 0)) #12
  %call.i17 = tail call i8* @halide_uint64_to_string(i8* %call.i14, i8* %ref.tmp.sroa.20.0, i64 %val, i32 1) #12
  %call.i20 = tail call i8* @halide_string_to_string(i8* %call.i17, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.35.71, i32 0, i32 0)) #12
  %call.i23 = tail call i8* @halide_uint64_to_string(i8* %call.i20, i8* %ref.tmp.sroa.20.0, i64 %min_val, i32 1) #12
  br i1 %tobool.not.i, label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit, label %if.else.i

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %0 = ptrtoint i8* %call.i23 to i32
  %sub.ptr.lhs.cast.i.i = zext i32 %0 to i64
  %1 = ptrtoint i8* %call.i to i32
  %sub.ptr.rhs.cast.i.i = zext i32 %1 to i64
  %sub.ptr.sub.i.i = sub nsw i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add nsw i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %.sink10.i = phi i8* [ %call.i, %if.else.i ], [ getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.123, i32 0, i32 0), %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit ]
  tail call void @halide_error(i8* %user_context, i8* nonnull %.sink10.i) #12
  tail call void @free(i8* %call.i) #12
  ret i32 -9
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_small_f64(i8* %user_context, i8* %param_name, double %val, double %min_val) local_unnamed_addr #3 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #12
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i81 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.70, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !15
  %call.i82 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.70, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %if.then6.i, %entry.split
  %phi.call = phi i8* [ %call.i81, %entry.split ], [ %call.i82, %if.then6.i ]
  %ref.tmp.sroa.20.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i11 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.20.0, i8* %param_name) #12
  %call.i14 = tail call i8* @halide_string_to_string(i8* %call.i11, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.55, i32 0, i32 0)) #12
  %call.i17 = tail call i8* @halide_double_to_string(i8* %call.i14, i8* %ref.tmp.sroa.20.0, double %val, i32 1) #12
  %call.i20 = tail call i8* @halide_string_to_string(i8* %call.i17, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.35.71, i32 0, i32 0)) #12
  %call.i23 = tail call i8* @halide_double_to_string(i8* %call.i20, i8* %ref.tmp.sroa.20.0, double %min_val, i32 1) #12
  br i1 %tobool.not.i, label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit, label %if.else.i

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %0 = ptrtoint i8* %call.i23 to i32
  %sub.ptr.lhs.cast.i.i = zext i32 %0 to i64
  %1 = ptrtoint i8* %call.i to i32
  %sub.ptr.rhs.cast.i.i = zext i32 %1 to i64
  %sub.ptr.sub.i.i = sub nsw i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add nsw i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %.sink10.i = phi i8* [ %call.i, %if.else.i ], [ getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.123, i32 0, i32 0), %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit ]
  tail call void @halide_error(i8* %user_context, i8* nonnull %.sink10.i) #12
  tail call void @free(i8* %call.i) #12
  ret i32 -9
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_large_i64(i8* %user_context, i8* %param_name, i64 %val, i64 %max_val) local_unnamed_addr #3 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #12
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i81 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.70, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !15
  %call.i82 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.70, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %if.then6.i, %entry.split
  %phi.call = phi i8* [ %call.i81, %entry.split ], [ %call.i82, %if.then6.i ]
  %ref.tmp.sroa.20.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i11 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.20.0, i8* %param_name) #12
  %call.i14 = tail call i8* @halide_string_to_string(i8* %call.i11, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.55, i32 0, i32 0)) #12
  %call.i17 = tail call i8* @halide_int64_to_string(i8* %call.i14, i8* %ref.tmp.sroa.20.0, i64 %val, i32 1) #12
  %call.i20 = tail call i8* @halide_string_to_string(i8* %call.i17, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.36.72, i32 0, i32 0)) #12
  %call.i23 = tail call i8* @halide_int64_to_string(i8* %call.i20, i8* %ref.tmp.sroa.20.0, i64 %max_val, i32 1) #12
  br i1 %tobool.not.i, label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit, label %if.else.i

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %0 = ptrtoint i8* %call.i23 to i32
  %sub.ptr.lhs.cast.i.i = zext i32 %0 to i64
  %1 = ptrtoint i8* %call.i to i32
  %sub.ptr.rhs.cast.i.i = zext i32 %1 to i64
  %sub.ptr.sub.i.i = sub nsw i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add nsw i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %.sink10.i = phi i8* [ %call.i, %if.else.i ], [ getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.123, i32 0, i32 0), %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit ]
  tail call void @halide_error(i8* %user_context, i8* nonnull %.sink10.i) #12
  tail call void @free(i8* %call.i) #12
  ret i32 -10
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_large_u64(i8* %user_context, i8* %param_name, i64 %val, i64 %max_val) local_unnamed_addr #3 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #12
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i81 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.70, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !15
  %call.i82 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.70, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %if.then6.i, %entry.split
  %phi.call = phi i8* [ %call.i81, %entry.split ], [ %call.i82, %if.then6.i ]
  %ref.tmp.sroa.20.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i11 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.20.0, i8* %param_name) #12
  %call.i14 = tail call i8* @halide_string_to_string(i8* %call.i11, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.55, i32 0, i32 0)) #12
  %call.i17 = tail call i8* @halide_uint64_to_string(i8* %call.i14, i8* %ref.tmp.sroa.20.0, i64 %val, i32 1) #12
  %call.i20 = tail call i8* @halide_string_to_string(i8* %call.i17, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.36.72, i32 0, i32 0)) #12
  %call.i23 = tail call i8* @halide_uint64_to_string(i8* %call.i20, i8* %ref.tmp.sroa.20.0, i64 %max_val, i32 1) #12
  br i1 %tobool.not.i, label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit, label %if.else.i

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %0 = ptrtoint i8* %call.i23 to i32
  %sub.ptr.lhs.cast.i.i = zext i32 %0 to i64
  %1 = ptrtoint i8* %call.i to i32
  %sub.ptr.rhs.cast.i.i = zext i32 %1 to i64
  %sub.ptr.sub.i.i = sub nsw i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add nsw i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %.sink10.i = phi i8* [ %call.i, %if.else.i ], [ getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.123, i32 0, i32 0), %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit ]
  tail call void @halide_error(i8* %user_context, i8* nonnull %.sink10.i) #12
  tail call void @free(i8* %call.i) #12
  ret i32 -10
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_large_f64(i8* %user_context, i8* %param_name, double %val, double %max_val) local_unnamed_addr #3 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #12
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i81 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.70, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !15
  %call.i82 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.70, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %if.then6.i, %entry.split
  %phi.call = phi i8* [ %call.i81, %entry.split ], [ %call.i82, %if.then6.i ]
  %ref.tmp.sroa.20.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i11 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.20.0, i8* %param_name) #12
  %call.i14 = tail call i8* @halide_string_to_string(i8* %call.i11, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.55, i32 0, i32 0)) #12
  %call.i17 = tail call i8* @halide_double_to_string(i8* %call.i14, i8* %ref.tmp.sroa.20.0, double %val, i32 1) #12
  %call.i20 = tail call i8* @halide_string_to_string(i8* %call.i17, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.36.72, i32 0, i32 0)) #12
  %call.i23 = tail call i8* @halide_double_to_string(i8* %call.i20, i8* %ref.tmp.sroa.20.0, double %max_val, i32 1) #12
  br i1 %tobool.not.i, label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit, label %if.else.i

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %0 = ptrtoint i8* %call.i23 to i32
  %sub.ptr.lhs.cast.i.i = zext i32 %0 to i64
  %1 = ptrtoint i8* %call.i to i32
  %sub.ptr.rhs.cast.i.i = zext i32 %1 to i64
  %sub.ptr.sub.i.i = sub nsw i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add nsw i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %.sink10.i = phi i8* [ %call.i, %if.else.i ], [ getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.123, i32 0, i32 0), %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit ]
  tail call void @halide_error(i8* %user_context, i8* nonnull %.sink10.i) #12
  tail call void @free(i8* %call.i) #12
  ret i32 -10
}

; Function Attrs: mustprogress nounwind
define weak i32 @halide_error_out_of_memory(i8* %user_context) local_unnamed_addr #0 {
entry:
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.37, i32 0, i32 0)) #12
  ret i32 -11
}

; Function Attrs: nounwind
define weak i32 @halide_error_buffer_argument_is_null(i8* %user_context, i8* %buffer_name) local_unnamed_addr #3 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #12
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i51 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.38, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !15
  %call.i52 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.38, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %if.then6.i, %entry.split
  %phi.call = phi i8* [ %call.i51, %entry.split ], [ %call.i52, %if.then6.i ]
  %ref.tmp.sroa.14.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i8 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.14.0, i8* %buffer_name) #12
  %call.i11 = tail call i8* @halide_string_to_string(i8* %call.i8, i8* %ref.tmp.sroa.14.0, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.39, i32 0, i32 0)) #12
  br i1 %tobool.not.i, label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit, label %if.else.i

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %0 = ptrtoint i8* %call.i11 to i32
  %sub.ptr.lhs.cast.i.i = zext i32 %0 to i64
  %1 = ptrtoint i8* %call.i to i32
  %sub.ptr.rhs.cast.i.i = zext i32 %1 to i64
  %sub.ptr.sub.i.i = sub nsw i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add nsw i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %.sink10.i = phi i8* [ %call.i, %if.else.i ], [ getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.123, i32 0, i32 0), %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit ]
  tail call void @halide_error(i8* %user_context, i8* nonnull %.sink10.i) #12
  tail call void @free(i8* %call.i) #12
  ret i32 -12
}

; Function Attrs: nounwind
define weak i32 @halide_error_debug_to_file_failed(i8* %user_context, i8* %func, i8* %filename, i32 %error_code) local_unnamed_addr #3 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #12
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i81 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.40, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !15
  %call.i82 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.40, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %if.then6.i, %entry.split
  %phi.call = phi i8* [ %call.i81, %entry.split ], [ %call.i82, %if.then6.i ]
  %ref.tmp.sroa.20.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i11 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.20.0, i8* %func) #12
  %call.i14 = tail call i8* @halide_string_to_string(i8* %call.i11, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.41.73, i32 0, i32 0)) #12
  %call.i17 = tail call i8* @halide_string_to_string(i8* %call.i14, i8* %ref.tmp.sroa.20.0, i8* %filename) #12
  %call.i20 = tail call i8* @halide_string_to_string(i8* %call.i17, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.42, i32 0, i32 0)) #12
  %conv.i = sext i32 %error_code to i64
  %call.i23 = tail call i8* @halide_int64_to_string(i8* %call.i20, i8* %ref.tmp.sroa.20.0, i64 %conv.i, i32 1) #12
  br i1 %tobool.not.i, label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit, label %if.else.i

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %0 = ptrtoint i8* %call.i23 to i32
  %sub.ptr.lhs.cast.i.i = zext i32 %0 to i64
  %1 = ptrtoint i8* %call.i to i32
  %sub.ptr.rhs.cast.i.i = zext i32 %1 to i64
  %sub.ptr.sub.i.i = sub nsw i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add nsw i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %.sink10.i = phi i8* [ %call.i, %if.else.i ], [ getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.123, i32 0, i32 0), %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit ]
  tail call void @halide_error(i8* %user_context, i8* nonnull %.sink10.i) #12
  tail call void @free(i8* %call.i) #12
  ret i32 -13
}

; Function Attrs: nounwind
define weak i32 @halide_error_unaligned_host_ptr(i8* %user_context, i8* %func, i32 %alignment) local_unnamed_addr #3 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #12
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i71 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.43, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !15
  %call.i72 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.43, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %if.then6.i, %entry.split
  %phi.call = phi i8* [ %call.i71, %entry.split ], [ %call.i72, %if.then6.i ]
  %ref.tmp.sroa.18.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i10 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.18.0, i8* %func) #12
  %call.i13 = tail call i8* @halide_string_to_string(i8* %call.i10, i8* %ref.tmp.sroa.18.0, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.44, i32 0, i32 0)) #12
  %conv.i = sext i32 %alignment to i64
  %call.i16 = tail call i8* @halide_int64_to_string(i8* %call.i13, i8* %ref.tmp.sroa.18.0, i64 %conv.i, i32 1) #12
  %call.i19 = tail call i8* @halide_string_to_string(i8* %call.i16, i8* %ref.tmp.sroa.18.0, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.45, i32 0, i32 0)) #12
  br i1 %tobool.not.i, label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit, label %if.else.i

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %0 = ptrtoint i8* %call.i19 to i32
  %sub.ptr.lhs.cast.i.i = zext i32 %0 to i64
  %1 = ptrtoint i8* %call.i to i32
  %sub.ptr.rhs.cast.i.i = zext i32 %1 to i64
  %sub.ptr.sub.i.i = sub nsw i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add nsw i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %.sink10.i = phi i8* [ %call.i, %if.else.i ], [ getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.123, i32 0, i32 0), %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit ]
  tail call void @halide_error(i8* %user_context, i8* nonnull %.sink10.i) #12
  tail call void @free(i8* %call.i) #12
  ret i32 -24
}

; Function Attrs: nounwind
define weak i32 @halide_error_device_dirty_with_no_device_support(i8* %user_context, i8* %func) local_unnamed_addr #3 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #12
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i61 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.46, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !15
  %call.i62 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.46, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %if.then6.i, %entry.split
  %phi.call = phi i8* [ %call.i61, %entry.split ], [ %call.i62, %if.then6.i ]
  %ref.tmp.sroa.16.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i9 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.16.0, i8* %func) #12
  %call.i12 = tail call i8* @halide_string_to_string(i8* %call.i9, i8* %ref.tmp.sroa.16.0, i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.47, i32 0, i32 0)) #12
  %call.i15 = tail call i8* @halide_string_to_string(i8* %call.i12, i8* %ref.tmp.sroa.16.0, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.48, i32 0, i32 0)) #12
  br i1 %tobool.not.i, label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit, label %if.else.i

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %0 = ptrtoint i8* %call.i15 to i32
  %sub.ptr.lhs.cast.i.i = zext i32 %0 to i64
  %1 = ptrtoint i8* %call.i to i32
  %sub.ptr.rhs.cast.i.i = zext i32 %1 to i64
  %sub.ptr.sub.i.i = sub nsw i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add nsw i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %.sink10.i = phi i8* [ %call.i, %if.else.i ], [ getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.123, i32 0, i32 0), %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit ]
  tail call void @halide_error(i8* %user_context, i8* nonnull %.sink10.i) #12
  tail call void @free(i8* %call.i) #12
  ret i32 -44
}

; Function Attrs: nounwind
define weak i32 @halide_error_host_is_null(i8* %user_context, i8* %func) local_unnamed_addr #3 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #12
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i51 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.43, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !15
  %call.i52 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.43, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %if.then6.i, %entry.split
  %phi.call = phi i8* [ %call.i51, %entry.split ], [ %call.i52, %if.then6.i ]
  %ref.tmp.sroa.14.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i8 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.14.0, i8* %func) #12
  %call.i11 = tail call i8* @halide_string_to_string(i8* %call.i8, i8* %ref.tmp.sroa.14.0, i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.49, i32 0, i32 0)) #12
  br i1 %tobool.not.i, label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit, label %if.else.i

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %0 = ptrtoint i8* %call.i11 to i32
  %sub.ptr.lhs.cast.i.i = zext i32 %0 to i64
  %1 = ptrtoint i8* %call.i to i32
  %sub.ptr.rhs.cast.i.i = zext i32 %1 to i64
  %sub.ptr.sub.i.i = sub nsw i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add nsw i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %.sink10.i = phi i8* [ %call.i, %if.else.i ], [ getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.123, i32 0, i32 0), %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit ]
  tail call void @halide_error(i8* %user_context, i8* nonnull %.sink10.i) #12
  tail call void @free(i8* %call.i) #12
  ret i32 -34
}

; Function Attrs: nounwind
define weak i32 @halide_error_bad_fold(i8* %user_context, i8* %func_name, i8* %var_name, i8* %loop_name) local_unnamed_addr #3 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #12
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i91 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.50, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !15
  %call.i92 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.50, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %if.then6.i, %entry.split
  %phi.call = phi i8* [ %call.i91, %entry.split ], [ %call.i92, %if.then6.i ]
  %ref.tmp.sroa.22.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i12 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.22.0, i8* %var_name) #12
  %call.i15 = tail call i8* @halide_string_to_string(i8* %call.i12, i8* %ref.tmp.sroa.22.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.51, i32 0, i32 0)) #12
  %call.i18 = tail call i8* @halide_string_to_string(i8* %call.i15, i8* %ref.tmp.sroa.22.0, i8* %func_name) #12
  %call.i21 = tail call i8* @halide_string_to_string(i8* %call.i18, i8* %ref.tmp.sroa.22.0, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.52, i32 0, i32 0)) #12
  %call.i24 = tail call i8* @halide_string_to_string(i8* %call.i21, i8* %ref.tmp.sroa.22.0, i8* %loop_name) #12
  %call.i27 = tail call i8* @halide_string_to_string(i8* %call.i24, i8* %ref.tmp.sroa.22.0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30.66, i32 0, i32 0)) #12
  br i1 %tobool.not.i, label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit, label %if.else.i

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %0 = ptrtoint i8* %call.i27 to i32
  %sub.ptr.lhs.cast.i.i = zext i32 %0 to i64
  %1 = ptrtoint i8* %call.i to i32
  %sub.ptr.rhs.cast.i.i = zext i32 %1 to i64
  %sub.ptr.sub.i.i = sub nsw i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add nsw i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %.sink10.i = phi i8* [ %call.i, %if.else.i ], [ getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.123, i32 0, i32 0), %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit ]
  tail call void @halide_error(i8* %user_context, i8* nonnull %.sink10.i) #12
  tail call void @free(i8* %call.i) #12
  ret i32 -25
}

; Function Attrs: nounwind
define weak i32 @halide_error_bad_extern_fold(i8* %user_context, i8* %func_name, i32 %dim, i32 %min, i32 %extent, i32 %valid_min, i32 %fold_factor) local_unnamed_addr #3 {
entry:
  %cmp = icmp slt i32 %min, %valid_min
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %add = add nsw i32 %extent, %min
  %add1 = add nsw i32 %fold_factor, %valid_min
  %cmp2 = icmp sgt i32 %add, %add1
  br i1 %cmp2, label %if.then, label %if.else

if.then:                                          ; preds = %lor.lhs.false, %entry
  %call.i = tail call i8* @malloc(i64 1024) #12
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %if.then.split, label %if.then6.i

if.then.split:                                    ; preds = %if.then
  %call.i521 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.53, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %if.then
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !15
  %call.i522 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.53, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %if.then6.i, %if.then.split
  %phi.call = phi i8* [ %call.i521, %if.then.split ], [ %call.i522, %if.then6.i ]
  %ref.tmp.sroa.36.0 = phi i8* [ null, %if.then.split ], [ %add.ptr.i, %if.then6.i ]
  %conv.i = sext i32 %dim to i64
  %call.i55 = tail call i8* @halide_int64_to_string(i8* %phi.call, i8* %ref.tmp.sroa.36.0, i64 %conv.i, i32 1) #12
  %call.i58 = tail call i8* @halide_string_to_string(i8* %call.i55, i8* %ref.tmp.sroa.36.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.51, i32 0, i32 0)) #12
  %call.i61 = tail call i8* @halide_string_to_string(i8* %call.i58, i8* %ref.tmp.sroa.36.0, i8* %func_name) #12
  %call.i64 = tail call i8* @halide_string_to_string(i8* %call.i61, i8* %ref.tmp.sroa.36.0, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.54, i32 0, i32 0)) #12
  %conv.i67 = sext i32 %min to i64
  %call.i68 = tail call i8* @halide_int64_to_string(i8* %call.i64, i8* %ref.tmp.sroa.36.0, i64 %conv.i67, i32 1) #12
  %call.i71 = tail call i8* @halide_string_to_string(i8* %call.i68, i8* %ref.tmp.sroa.36.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i32 0, i32 0)) #12
  %add9 = add nsw i32 %extent, %min
  %sub = add nsw i32 %add9, -1
  %conv.i74 = sext i32 %sub to i64
  %call.i75 = tail call i8* @halide_int64_to_string(i8* %call.i71, i8* %ref.tmp.sroa.36.0, i64 %conv.i74, i32 1) #12
  %call.i78 = tail call i8* @halide_string_to_string(i8* %call.i75, i8* %ref.tmp.sroa.36.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.56, i32 0, i32 0)) #12
  %call.i81 = tail call i8* @halide_string_to_string(i8* %call.i78, i8* %ref.tmp.sroa.36.0, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.57, i32 0, i32 0)) #12
  %conv.i84 = sext i32 %valid_min to i64
  %call.i85 = tail call i8* @halide_int64_to_string(i8* %call.i81, i8* %ref.tmp.sroa.36.0, i64 %conv.i84, i32 1) #12
  %call.i88 = tail call i8* @halide_string_to_string(i8* %call.i85, i8* %ref.tmp.sroa.36.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i32 0, i32 0)) #12
  %add15 = add nsw i32 %fold_factor, %valid_min
  %sub16 = add nsw i32 %add15, -1
  %conv.i91 = sext i32 %sub16 to i64
  %call.i92 = tail call i8* @halide_int64_to_string(i8* %call.i88, i8* %ref.tmp.sroa.36.0, i64 %conv.i91, i32 1) #12
  %call.i95 = tail call i8* @halide_string_to_string(i8* %call.i92, i8* %ref.tmp.sroa.36.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.58.74, i32 0, i32 0)) #12
  br i1 %tobool.not.i, label %if.end, label %if.end.sink.split

if.else:                                          ; preds = %lor.lhs.false
  %call.i101 = tail call i8* @malloc(i64 1024) #12
  %tobool.not.i104 = icmp eq i8* %call.i101, null
  br i1 %tobool.not.i104, label %if.else.split, label %if.then6.i107

if.else.split:                                    ; preds = %if.else
  %call.i1133 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.53, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit110

if.then6.i107:                                    ; preds = %if.else
  %add.ptr.i105 = getelementptr inbounds i8, i8* %call.i101, i32 1023
  store i8 0, i8* %add.ptr.i105, align 1, !tbaa !15
  %call.i1134 = tail call i8* @halide_string_to_string(i8* nonnull %call.i101, i8* nonnull %add.ptr.i105, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.53, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit110

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit110: ; preds = %if.then6.i107, %if.else.split
  %phi.call5 = phi i8* [ %call.i1133, %if.else.split ], [ %call.i1134, %if.then6.i107 ]
  %ref.tmp19.sroa.34.0 = phi i8* [ null, %if.else.split ], [ %add.ptr.i105, %if.then6.i107 ]
  %conv.i116 = sext i32 %dim to i64
  %call.i117 = tail call i8* @halide_int64_to_string(i8* %phi.call5, i8* %ref.tmp19.sroa.34.0, i64 %conv.i116, i32 1) #12
  %call.i120 = tail call i8* @halide_string_to_string(i8* %call.i117, i8* %ref.tmp19.sroa.34.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.51, i32 0, i32 0)) #12
  %call.i123 = tail call i8* @halide_string_to_string(i8* %call.i120, i8* %ref.tmp19.sroa.34.0, i8* %func_name) #12
  %call.i126 = tail call i8* @halide_string_to_string(i8* %call.i123, i8* %ref.tmp19.sroa.34.0, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.54, i32 0, i32 0)) #12
  %conv.i129 = sext i32 %min to i64
  %call.i130 = tail call i8* @halide_int64_to_string(i8* %call.i126, i8* %ref.tmp19.sroa.34.0, i64 %conv.i129, i32 1) #12
  %call.i133 = tail call i8* @halide_string_to_string(i8* %call.i130, i8* %ref.tmp19.sroa.34.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i32 0, i32 0)) #12
  %sub28 = add nsw i32 %add, -1
  %conv.i136 = sext i32 %sub28 to i64
  %call.i137 = tail call i8* @halide_int64_to_string(i8* %call.i133, i8* %ref.tmp19.sroa.34.0, i64 %conv.i136, i32 1) #12
  %call.i140 = tail call i8* @halide_string_to_string(i8* %call.i137, i8* %ref.tmp19.sroa.34.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.56, i32 0, i32 0)) #12
  %call.i143 = tail call i8* @halide_string_to_string(i8* %call.i140, i8* %ref.tmp19.sroa.34.0, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.59.75, i32 0, i32 0)) #12
  %call.i146 = tail call i8* @halide_string_to_string(i8* %call.i143, i8* %ref.tmp19.sroa.34.0, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.60.76, i32 0, i32 0)) #12
  %conv.i149 = sext i32 %fold_factor to i64
  %call.i150 = tail call i8* @halide_int64_to_string(i8* %call.i146, i8* %ref.tmp19.sroa.34.0, i64 %conv.i149, i32 1) #12
  %call.i153 = tail call i8* @halide_string_to_string(i8* %call.i150, i8* %ref.tmp19.sroa.34.0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30.66, i32 0, i32 0)) #12
  br i1 %tobool.not.i104, label %if.end, label %if.end.sink.split

if.end.sink.split:                                ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit110, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %call.i153.sink = phi i8* [ %call.i95, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit ], [ %call.i153, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit110 ]
  %call.i101.sink245 = phi i8* [ %call.i, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit ], [ %call.i101, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit110 ]
  %0 = ptrtoint i8* %call.i153.sink to i32
  %sub.ptr.lhs.cast.i.i162 = zext i32 %0 to i64
  %1 = ptrtoint i8* %call.i101.sink245 to i32
  %sub.ptr.rhs.cast.i.i163 = zext i32 %1 to i64
  %sub.ptr.sub.i.i164 = add nuw nsw i64 %sub.ptr.lhs.cast.i.i162, 1
  %add.i.i165 = sub nsw i64 %sub.ptr.sub.i.i164, %sub.ptr.rhs.cast.i.i163
  %call.i.i166 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i101.sink245, i64 %add.i.i165) #12
  br label %if.end

if.end:                                           ; preds = %if.end.sink.split, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit110, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %.sink10.i168.sink = phi i8* [ getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.123, i32 0, i32 0), %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit ], [ getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.123, i32 0, i32 0), %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit110 ], [ %call.i101.sink245, %if.end.sink.split ]
  %call.i101.sink = phi i8* [ null, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit ], [ null, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit110 ], [ %call.i101.sink245, %if.end.sink.split ]
  tail call void @halide_error(i8* %user_context, i8* nonnull %.sink10.i168.sink) #12
  tail call void @free(i8* %call.i101.sink) #12
  ret i32 -35
}

; Function Attrs: nounwind
define weak i32 @halide_error_fold_factor_too_small(i8* %user_context, i8* %func_name, i8* %var_name, i32 %fold_factor, i8* %loop_name, i32 %required_extent) local_unnamed_addr #3 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #12
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i131 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.61.77, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !15
  %call.i132 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.61.77, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %if.then6.i, %entry.split
  %phi.call = phi i8* [ %call.i131, %entry.split ], [ %call.i132, %if.then6.i ]
  %ref.tmp.sroa.30.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %conv.i = sext i32 %fold_factor to i64
  %call.i16 = tail call i8* @halide_int64_to_string(i8* %phi.call, i8* %ref.tmp.sroa.30.0, i64 %conv.i, i32 1) #12
  %call.i19 = tail call i8* @halide_string_to_string(i8* %call.i16, i8* %ref.tmp.sroa.30.0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.62, i32 0, i32 0)) #12
  %call.i22 = tail call i8* @halide_string_to_string(i8* %call.i19, i8* %ref.tmp.sroa.30.0, i8* %var_name) #12
  %call.i25 = tail call i8* @halide_string_to_string(i8* %call.i22, i8* %ref.tmp.sroa.30.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.51, i32 0, i32 0)) #12
  %call.i28 = tail call i8* @halide_string_to_string(i8* %call.i25, i8* %ref.tmp.sroa.30.0, i8* %func_name) #12
  %call.i31 = tail call i8* @halide_string_to_string(i8* %call.i28, i8* %ref.tmp.sroa.30.0, i8* getelementptr inbounds ([61 x i8], [61 x i8]* @.str.63, i32 0, i32 0)) #12
  %call.i34 = tail call i8* @halide_string_to_string(i8* %call.i31, i8* %ref.tmp.sroa.30.0, i8* %loop_name) #12
  %call.i37 = tail call i8* @halide_string_to_string(i8* %call.i34, i8* %ref.tmp.sroa.30.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.32.68, i32 0, i32 0)) #12
  %conv.i40 = sext i32 %required_extent to i64
  %call.i41 = tail call i8* @halide_int64_to_string(i8* %call.i37, i8* %ref.tmp.sroa.30.0, i64 %conv.i40, i32 1) #12
  %call.i44 = tail call i8* @halide_string_to_string(i8* %call.i41, i8* %ref.tmp.sroa.30.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.64.78, i32 0, i32 0)) #12
  br i1 %tobool.not.i, label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit, label %if.else.i

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %0 = ptrtoint i8* %call.i44 to i32
  %sub.ptr.lhs.cast.i.i = zext i32 %0 to i64
  %1 = ptrtoint i8* %call.i to i32
  %sub.ptr.rhs.cast.i.i = zext i32 %1 to i64
  %sub.ptr.sub.i.i = sub nsw i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add nsw i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %.sink10.i = phi i8* [ %call.i, %if.else.i ], [ getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.123, i32 0, i32 0), %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit ]
  tail call void @halide_error(i8* %user_context, i8* nonnull %.sink10.i) #12
  tail call void @free(i8* %call.i) #12
  ret i32 -26
}

; Function Attrs: nounwind
define weak i32 @halide_error_requirement_failed(i8* %user_context, i8* %condition, i8* %message) local_unnamed_addr #3 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #12
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i61 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.65, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !15
  %call.i62 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.65, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %if.then6.i, %entry.split
  %phi.call = phi i8* [ %call.i61, %entry.split ], [ %call.i62, %if.then6.i ]
  %ref.tmp.sroa.16.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i9 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.16.0, i8* %condition) #12
  %call.i12 = tail call i8* @halide_string_to_string(i8* %call.i9, i8* %ref.tmp.sroa.16.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.66, i32 0, i32 0)) #12
  %call.i15 = tail call i8* @halide_string_to_string(i8* %call.i12, i8* %ref.tmp.sroa.16.0, i8* %message) #12
  br i1 %tobool.not.i, label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit, label %if.else.i

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %0 = ptrtoint i8* %call.i15 to i32
  %sub.ptr.lhs.cast.i.i = zext i32 %0 to i64
  %1 = ptrtoint i8* %call.i to i32
  %sub.ptr.rhs.cast.i.i = zext i32 %1 to i64
  %sub.ptr.sub.i.i = sub nsw i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add nsw i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %.sink10.i = phi i8* [ %call.i, %if.else.i ], [ getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.123, i32 0, i32 0), %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit ]
  tail call void @halide_error(i8* %user_context, i8* nonnull %.sink10.i) #12
  tail call void @free(i8* %call.i) #12
  ret i32 -27
}

; Function Attrs: nounwind
define weak i32 @halide_error_specialize_fail(i8* %user_context, i8* %message) local_unnamed_addr #3 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #12
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit.thread, label %if.else.i

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit.thread: ; preds = %entry
  %call.i41 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.67, i32 0, i32 0)) #12
  %call.i75 = tail call i8* @halide_string_to_string(i8* %call.i41, i8* null, i8* %message) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !15
  %call.i42 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.67, i32 0, i32 0)) #12
  %call.i7 = tail call i8* @halide_string_to_string(i8* %call.i42, i8* nonnull %add.ptr.i, i8* %message) #12
  %0 = ptrtoint i8* %call.i7 to i32
  %sub.ptr.lhs.cast.i.i = zext i32 %0 to i64
  %1 = ptrtoint i8* %call.i to i32
  %sub.ptr.rhs.cast.i.i = zext i32 %1 to i64
  %sub.ptr.sub.i.i = sub nsw i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add nsw i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit.thread
  %.sink10.i = phi i8* [ %call.i, %if.else.i ], [ getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.123, i32 0, i32 0), %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit.thread ]
  tail call void @halide_error(i8* %user_context, i8* nonnull %.sink10.i) #12
  tail call void @free(i8* %call.i) #12
  ret i32 -31
}

; Function Attrs: nounwind
define weak i32 @halide_error_no_device_interface(i8* %user_context) local_unnamed_addr #3 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #12
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %entry
  %call.i317 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.68, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !15
  %call.i3 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.68, i32 0, i32 0)) #12
  %0 = ptrtoint i8* %call.i3 to i32
  %sub.ptr.lhs.cast.i.i = zext i32 %0 to i64
  %1 = ptrtoint i8* %call.i to i32
  %sub.ptr.rhs.cast.i.i = zext i32 %1 to i64
  %sub.ptr.sub.i.i = sub nsw i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add nsw i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  %.sink10.i = phi i8* [ %call.i, %if.else.i ], [ getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.123, i32 0, i32 0), %if.then.i ]
  tail call void @halide_error(i8* %user_context, i8* nonnull %.sink10.i) #12
  tail call void @free(i8* %call.i) #12
  ret i32 -19
}

; Function Attrs: nounwind
define weak i32 @halide_error_device_interface_no_device(i8* %user_context) local_unnamed_addr #3 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #12
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %entry
  %call.i317 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.69, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !15
  %call.i3 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.69, i32 0, i32 0)) #12
  %0 = ptrtoint i8* %call.i3 to i32
  %sub.ptr.lhs.cast.i.i = zext i32 %0 to i64
  %1 = ptrtoint i8* %call.i to i32
  %sub.ptr.rhs.cast.i.i = zext i32 %1 to i64
  %sub.ptr.sub.i.i = sub nsw i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add nsw i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  %.sink10.i = phi i8* [ %call.i, %if.else.i ], [ getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.123, i32 0, i32 0), %if.then.i ]
  tail call void @halide_error(i8* %user_context, i8* nonnull %.sink10.i) #12
  tail call void @free(i8* %call.i) #12
  ret i32 -36
}

; Function Attrs: nounwind
define weak i32 @halide_error_host_and_device_dirty(i8* %user_context) local_unnamed_addr #3 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #12
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %entry
  %call.i317 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.70, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !15
  %call.i3 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.70, i32 0, i32 0)) #12
  %0 = ptrtoint i8* %call.i3 to i32
  %sub.ptr.lhs.cast.i.i = zext i32 %0 to i64
  %1 = ptrtoint i8* %call.i to i32
  %sub.ptr.rhs.cast.i.i = zext i32 %1 to i64
  %sub.ptr.sub.i.i = sub nsw i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add nsw i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  %.sink10.i = phi i8* [ %call.i, %if.else.i ], [ getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.123, i32 0, i32 0), %if.then.i ]
  tail call void @halide_error(i8* %user_context, i8* nonnull %.sink10.i) #12
  tail call void @free(i8* %call.i) #12
  ret i32 -37
}

; Function Attrs: nounwind
define weak i32 @halide_error_buffer_is_null(i8* %user_context, i8* %routine) local_unnamed_addr #3 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #12
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i51 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.71, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !15
  %call.i52 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.71, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %if.then6.i, %entry.split
  %phi.call = phi i8* [ %call.i51, %entry.split ], [ %call.i52, %if.then6.i ]
  %ref.tmp.sroa.14.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i8 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.14.0, i8* %routine) #12
  %call.i11 = tail call i8* @halide_string_to_string(i8* %call.i8, i8* %ref.tmp.sroa.14.0, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.72, i32 0, i32 0)) #12
  br i1 %tobool.not.i, label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit, label %if.else.i

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %0 = ptrtoint i8* %call.i11 to i32
  %sub.ptr.lhs.cast.i.i = zext i32 %0 to i64
  %1 = ptrtoint i8* %call.i to i32
  %sub.ptr.rhs.cast.i.i = zext i32 %1 to i64
  %sub.ptr.sub.i.i = sub nsw i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add nsw i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %.sink10.i = phi i8* [ %call.i, %if.else.i ], [ getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.123, i32 0, i32 0), %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit ]
  tail call void @halide_error(i8* %user_context, i8* nonnull %.sink10.i) #12
  tail call void @free(i8* %call.i) #12
  ret i32 -38
}

; Function Attrs: nounwind
define weak i32 @halide_error_storage_bound_too_small(i8* %user_context, i8* %func_name, i8* %var_name, i32 %provided_size, i32 %required_size) local_unnamed_addr #3 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #12
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i111 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.73, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !15
  %call.i112 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.73, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %if.then6.i, %entry.split
  %phi.call = phi i8* [ %call.i111, %entry.split ], [ %call.i112, %if.then6.i ]
  %ref.tmp.sroa.26.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %conv.i = sext i32 %provided_size to i64
  %call.i14 = tail call i8* @halide_int64_to_string(i8* %phi.call, i8* %ref.tmp.sroa.26.0, i64 %conv.i, i32 1) #12
  %call.i17 = tail call i8* @halide_string_to_string(i8* %call.i14, i8* %ref.tmp.sroa.26.0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.62, i32 0, i32 0)) #12
  %call.i20 = tail call i8* @halide_string_to_string(i8* %call.i17, i8* %ref.tmp.sroa.26.0, i8* %var_name) #12
  %call.i23 = tail call i8* @halide_string_to_string(i8* %call.i20, i8* %ref.tmp.sroa.26.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.51, i32 0, i32 0)) #12
  %call.i26 = tail call i8* @halide_string_to_string(i8* %call.i23, i8* %ref.tmp.sroa.26.0, i8* %func_name) #12
  %call.i29 = tail call i8* @halide_string_to_string(i8* %call.i26, i8* %ref.tmp.sroa.26.0, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.74, i32 0, i32 0)) #12
  %conv.i32 = sext i32 %required_size to i64
  %call.i33 = tail call i8* @halide_int64_to_string(i8* %call.i29, i8* %ref.tmp.sroa.26.0, i64 %conv.i32, i32 1) #12
  %call.i36 = tail call i8* @halide_string_to_string(i8* %call.i33, i8* %ref.tmp.sroa.26.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.64.78, i32 0, i32 0)) #12
  br i1 %tobool.not.i, label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit, label %if.else.i

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %0 = ptrtoint i8* %call.i36 to i32
  %sub.ptr.lhs.cast.i.i = zext i32 %0 to i64
  %1 = ptrtoint i8* %call.i to i32
  %sub.ptr.rhs.cast.i.i = zext i32 %1 to i64
  %sub.ptr.sub.i.i = sub nsw i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add nsw i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %.sink10.i = phi i8* [ %call.i, %if.else.i ], [ getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.123, i32 0, i32 0), %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit ]
  tail call void @halide_error(i8* %user_context, i8* nonnull %.sink10.i) #12
  tail call void @free(i8* %call.i) #12
  ret i32 -45
}

; Function Attrs: nounwind
define weak i32 @halide_error_device_crop_failed(i8* %user_context) local_unnamed_addr #3 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #12
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %entry
  %call.i317 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([77 x i8], [77 x i8]* @.str.75, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !15
  %call.i3 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([77 x i8], [77 x i8]* @.str.75, i32 0, i32 0)) #12
  %0 = ptrtoint i8* %call.i3 to i32
  %sub.ptr.lhs.cast.i.i = zext i32 %0 to i64
  %1 = ptrtoint i8* %call.i to i32
  %sub.ptr.rhs.cast.i.i = zext i32 %1 to i64
  %sub.ptr.sub.i.i = sub nsw i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add nsw i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  %.sink10.i = phi i8* [ %call.i, %if.else.i ], [ getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.123, i32 0, i32 0), %if.then.i ]
  tail call void @halide_error(i8* %user_context, i8* nonnull %.sink10.i) #12
  tail call void @free(i8* %call.i) #12
  ret i32 -41
}

; Function Attrs: mustprogress nounwind
define weak void @halide_profiler_shutdown() #0 {
entry:
  %call = tail call %struct.halide_profiler_state* @halide_profiler_get_state() #13
  %sampling_thread = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %call, i32 0, i32 7
  %0 = load %struct.halide_thread*, %struct.halide_thread** %sampling_thread, align 8, !tbaa !209
  %tobool.not = icmp eq %struct.halide_thread* %0, null
  br i1 %tobool.not, label %cleanup, label %if.end

if.end:                                           ; preds = %entry
  %current_func = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %call, i32 0, i32 3
  store i32 -2, i32* %current_func, align 8, !tbaa !211
  tail call void @halide_join_thread(%struct.halide_thread* nonnull %0) #12
  store %struct.halide_thread* null, %struct.halide_thread** %sampling_thread, align 8, !tbaa !209
  store i32 -1, i32* %current_func, align 8, !tbaa !211
  tail call void @halide_profiler_report_unlocked(i8* null, %struct.halide_profiler_state* nonnull %call) #13
  tail call void @halide_profiler_reset_unlocked(%struct.halide_profiler_state* nonnull %call) #13
  br label %cleanup

cleanup:                                          ; preds = %if.end, %entry
  ret void
}

; Function Attrs: mustprogress nounwind
define weak %struct.halide_profiler_state* @halide_profiler_get_state() local_unnamed_addr #0 {
entry:
  ret %struct.halide_profiler_state* @_ZZ25halide_profiler_get_stateE1s
}

; Function Attrs: nounwind
define weak void @halide_profiler_report_unlocked(i8* %user_context, %struct.halide_profiler_state* %s) local_unnamed_addr #3 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #12
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EEC2EPvPc.exit, label %if.then6.i

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EEC2EPvPc.exit: ; preds = %if.then6.i, %entry
  %sstr.sroa.125.0 = phi i8* [ %add.ptr.i, %if.then6.i ], [ null, %entry ]
  %pipelines = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %s, i32 0, i32 5
  %0 = ptrtoint i8* %call.i to i32
  %sub.ptr.rhs.cast.i.i348 = zext i32 %0 to i64
  %sub.ptr.sub.i.i349 = sub nsw i64 1, %sub.ptr.rhs.cast.i.i348
  %p.0623 = load %struct.halide_profiler_pipeline_stats*, %struct.halide_profiler_pipeline_stats** %pipelines, align 8, !tbaa !11
  %tobool.not624 = icmp eq %struct.halide_profiler_pipeline_stats* %p.0623, null
  br i1 %tobool.not624, label %for.cond.cleanup, label %for.body

for.cond.cleanup:                                 ; preds = %cleanup181, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EEC2EPvPc.exit
  %sstr.sroa.19.0.lcssa = phi i8* [ %call.i, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EEC2EPvPc.exit ], [ %sstr.sroa.19.15, %cleanup181 ]
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %for.cond.cleanup
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.123, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %for.cond.cleanup
  %1 = ptrtoint i8* %sstr.sroa.19.0.lcssa to i32
  %sub.ptr.lhs.cast.i.i = zext i32 %1 to i64
  %add.i.i = add nsw i64 %sub.ptr.sub.i.i349, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #12
  ret void

for.body:                                         ; preds = %cleanup181, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EEC2EPvPc.exit
  %p.0626 = phi %struct.halide_profiler_pipeline_stats* [ %p.0, %cleanup181 ], [ %p.0623, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EEC2EPvPc.exit ]
  %sstr.sroa.19.0625 = phi i8* [ %sstr.sroa.19.15, %cleanup181 ], [ %call.i, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EEC2EPvPc.exit ]
  %time = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %p.0626, i32 0, i32 0
  %2 = load i64, i64* %time, align 8, !tbaa !212
  %conv = uitofp i64 %2 to float
  %div = fdiv float %conv, 1.000000e+06
  %runs = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %p.0626, i32 0, i32 11
  %3 = load i32, i32* %runs, align 8, !tbaa !214
  %tobool1.not = icmp eq i32 %3, 0
  br i1 %tobool1.not, label %cleanup181, label %if.end

if.end:                                           ; preds = %for.body
  br i1 %tobool.not.i, label %if.end.split, label %if.then.i278

if.end.split:                                     ; preds = %if.end
  %active_threads_numerator1 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %p.0626, i32 0, i32 4
  %4 = load i64, i64* %active_threads_numerator1, align 8, !tbaa !215
  %active_threads_denominator2 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %p.0626, i32 0, i32 5
  %5 = load i64, i64* %active_threads_denominator2, align 8, !tbaa !216
  %cmp3 = icmp eq i64 %4, %5
  %name4 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %p.0626, i32 0, i32 6
  %6 = load i8*, i8** %name4, align 8, !tbaa !217
  %call.i2825 = tail call i8* @halide_string_to_string(i8* null, i8* %sstr.sroa.125.0, i8* %6) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EE5clearEv.exit

if.then.i278:                                     ; preds = %if.end
  store i8 0, i8* %call.i, align 1, !tbaa !15
  %active_threads_numerator6 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %p.0626, i32 0, i32 4
  %7 = load i64, i64* %active_threads_numerator6, align 8, !tbaa !215
  %active_threads_denominator7 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %p.0626, i32 0, i32 5
  %8 = load i64, i64* %active_threads_denominator7, align 8, !tbaa !216
  %cmp8 = icmp eq i64 %7, %8
  %name9 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %p.0626, i32 0, i32 6
  %9 = load i8*, i8** %name9, align 8, !tbaa !217
  %call.i28210 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* %sstr.sroa.125.0, i8* %9) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EE5clearEv.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EE5clearEv.exit: ; preds = %if.then.i278, %if.end.split
  %10 = phi i64 [ %4, %if.end.split ], [ %7, %if.then.i278 ]
  %11 = phi i64 [ %5, %if.end.split ], [ %8, %if.then.i278 ]
  %12 = phi i1 [ %cmp3, %if.end.split ], [ %cmp8, %if.then.i278 ]
  %phi.call = phi i8* [ %call.i2825, %if.end.split ], [ %call.i28210, %if.then.i278 ]
  %call.i285 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %sstr.sroa.125.0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7.89, i32 0, i32 0)) #12
  %call.i288 = tail call i8* @halide_string_to_string(i8* %call.i285, i8* %sstr.sroa.125.0, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.8.90, i32 0, i32 0)) #12
  %conv.i = fpext float %div to double
  %call.i291 = tail call i8* @halide_double_to_string(i8* %call.i288, i8* %sstr.sroa.125.0, double %conv.i, i32 0) #12
  %call.i294 = tail call i8* @halide_string_to_string(i8* %call.i291, i8* %sstr.sroa.125.0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9.91, i32 0, i32 0)) #12
  %call.i297 = tail call i8* @halide_string_to_string(i8* %call.i294, i8* %sstr.sroa.125.0, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.10.92, i32 0, i32 0)) #12
  %samples = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %p.0626, i32 0, i32 12
  %13 = load i32, i32* %samples, align 4, !tbaa !218
  %conv.i300 = sext i32 %13 to i64
  %call.i301 = tail call i8* @halide_int64_to_string(i8* %call.i297, i8* %sstr.sroa.125.0, i64 %conv.i300, i32 1) #12
  %call.i304 = tail call i8* @halide_string_to_string(i8* %call.i301, i8* %sstr.sroa.125.0, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.11.93, i32 0, i32 0)) #12
  %14 = load i32, i32* %runs, align 8, !tbaa !214
  %conv.i307 = sext i32 %14 to i64
  %call.i308 = tail call i8* @halide_int64_to_string(i8* %call.i304, i8* %sstr.sroa.125.0, i64 %conv.i307, i32 1) #12
  %call.i311 = tail call i8* @halide_string_to_string(i8* %call.i308, i8* %sstr.sroa.125.0, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.12.94, i32 0, i32 0)) #12
  %15 = load i32, i32* %runs, align 8, !tbaa !214
  %conv19 = sitofp i32 %15 to float
  %div20 = fdiv float %div, %conv19
  %conv.i314 = fpext float %div20 to double
  %call.i315 = tail call i8* @halide_double_to_string(i8* %call.i311, i8* %sstr.sroa.125.0, double %conv.i314, i32 0) #12
  %call.i318 = tail call i8* @halide_string_to_string(i8* %call.i315, i8* %sstr.sroa.125.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.13.95, i32 0, i32 0)) #12
  br i1 %12, label %if.end28, label %if.then24

if.then24:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EE5clearEv.exit
  %conv3 = uitofp i64 %10 to double
  %conv5 = uitofp i64 %11 to double
  %add = fadd double %conv5, 1.000000e-10
  %div6 = fdiv double %conv3, %add
  %conv7 = fptrunc double %div6 to float
  %call.i321 = tail call i8* @halide_string_to_string(i8* %call.i318, i8* %sstr.sroa.125.0, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.14.96, i32 0, i32 0)) #12
  %conv.i324 = fpext float %conv7 to double
  %call.i325 = tail call i8* @halide_double_to_string(i8* %call.i321, i8* %sstr.sroa.125.0, double %conv.i324, i32 0) #12
  %call.i328 = tail call i8* @halide_string_to_string(i8* %call.i325, i8* %sstr.sroa.125.0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7.89, i32 0, i32 0)) #12
  br label %if.end28

if.end28:                                         ; preds = %if.then24, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EE5clearEv.exit
  %sstr.sroa.19.1 = phi i8* [ %call.i318, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EE5clearEv.exit ], [ %call.i328, %if.then24 ]
  %call.i331 = tail call i8* @halide_string_to_string(i8* %sstr.sroa.19.1, i8* %sstr.sroa.125.0, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.15.97, i32 0, i32 0)) #12
  %num_allocs = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %p.0626, i32 0, i32 13
  %16 = load i32, i32* %num_allocs, align 8, !tbaa !219
  %conv.i334 = sext i32 %16 to i64
  %call.i335 = tail call i8* @halide_int64_to_string(i8* %call.i331, i8* %sstr.sroa.125.0, i64 %conv.i334, i32 1) #12
  %call.i338 = tail call i8* @halide_string_to_string(i8* %call.i335, i8* %sstr.sroa.125.0, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.16.98, i32 0, i32 0)) #12
  %memory_peak = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %p.0626, i32 0, i32 2
  %17 = load i64, i64* %memory_peak, align 8, !tbaa !220
  %call.i341 = tail call i8* @halide_uint64_to_string(i8* %call.i338, i8* %sstr.sroa.125.0, i64 %17, i32 1) #12
  %call.i344 = tail call i8* @halide_string_to_string(i8* %call.i341, i8* %sstr.sroa.125.0, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.17.99, i32 0, i32 0)) #12
  br i1 %tobool.not.i, label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EE3strEv.exit, label %if.then.i352

if.then.i352:                                     ; preds = %if.end28
  %18 = ptrtoint i8* %call.i344 to i32
  %sub.ptr.lhs.cast.i.i347 = zext i32 %18 to i64
  %add.i.i350 = add nsw i64 %sub.ptr.sub.i.i349, %sub.ptr.lhs.cast.i.i347
  %call.i.i351 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i350) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EE3strEv.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EE3strEv.exit: ; preds = %if.then.i352, %if.end28
  %retval.0.i = phi i8* [ %call.i, %if.then.i352 ], [ getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.123, i32 0, i32 0), %if.end28 ]
  tail call void @halide_print(i8* %user_context, i8* nonnull %retval.0.i) #12
  %19 = load i64, i64* %time, align 8, !tbaa !212
  %tobool36.not = icmp eq i64 %19, 0
  br i1 %tobool36.not, label %lor.end, label %for.cond53.preheader

lor.end:                                          ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EE3strEv.exit
  %memory_total = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %p.0626, i32 0, i32 3
  %20 = load i64, i64* %memory_total, align 8, !tbaa !221
  %tobool37.not = icmp eq i64 %20, 0
  br i1 %tobool37.not, label %for.cond41.preheader, label %for.cond53.preheader

for.cond41.preheader:                             ; preds = %lor.end
  %num_funcs = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %p.0626, i32 0, i32 9
  %21 = load i32, i32* %num_funcs, align 8, !tbaa !222
  %cmp42589 = icmp sgt i32 %21, 0
  br i1 %cmp42589, label %for.body44.lr.ph, label %cleanup181

for.body44.lr.ph:                                 ; preds = %for.cond41.preheader
  %funcs = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %p.0626, i32 0, i32 7
  %22 = load %struct.halide_profiler_func_stats*, %struct.halide_profiler_func_stats** %funcs, align 8, !tbaa !223
  %wide.trip.count = zext i32 %21 to i64
  br label %for.body44

for.cond41:                                       ; preds = %for.body44
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %cleanup181, label %for.body44, !llvm.loop !224

for.body44:                                       ; preds = %for.cond41, %for.body44.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body44.lr.ph ], [ %indvars.iv.next, %for.cond41 ]
  %23 = trunc i64 %indvars.iv to i32
  %stack_peak = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %22, i32 %23, i32 4
  %24 = load i64, i64* %stack_peak, align 8, !tbaa !225
  %tobool45.not = icmp eq i64 %24, 0
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %tobool45.not, label %for.cond41, label %for.cond53.preheader

for.cond53.preheader:                             ; preds = %for.body44, %lor.end, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EE3strEv.exit
  %num_funcs54 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %p.0626, i32 0, i32 9
  %funcs59 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %p.0626, i32 0, i32 7
  %25 = load i32, i32* %num_funcs54, align 8, !tbaa !222
  %cmp55620 = icmp sgt i32 %25, 0
  br i1 %cmp55620, label %for.body57, label %cleanup181

for.body57:                                       ; preds = %cleanup172, %for.cond53.preheader
  %indvars.iv629 = phi i64 [ %indvars.iv.next630, %cleanup172 ], [ 0, %for.cond53.preheader ]
  br i1 %tobool.not.i, label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EE5clearEv.exit358, label %if.then.i356

if.then.i356:                                     ; preds = %for.body57
  store i8 0, i8* %call.i, align 1, !tbaa !15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EE5clearEv.exit358

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EE5clearEv.exit358: ; preds = %if.then.i356, %for.body57
  %26 = load %struct.halide_profiler_func_stats*, %struct.halide_profiler_func_stats** %funcs59, align 8, !tbaa !223
  %27 = trunc i64 %indvars.iv629 to i32
  %add.ptr61 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %26, i32 %27
  %cmp62 = icmp eq i64 %indvars.iv629, 0
  br i1 %cmp62, label %land.lhs.true, label %if.end66

land.lhs.true:                                    ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EE5clearEv.exit358
  %time63 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %add.ptr61, i32 0, i32 0
  %28 = load i64, i64* %time63, align 8, !tbaa !227
  %cmp64 = icmp eq i64 %28, 0
  br i1 %cmp64, label %cleanup172, label %if.end66

if.end66:                                         ; preds = %land.lhs.true, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EE5clearEv.exit358
  %call.i361 = tail call i8* @halide_string_to_string(i8* %call.i, i8* %sstr.sroa.125.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.18.100, i32 0, i32 0)) #12
  %name68 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %26, i32 %27, i32 7
  %29 = load i8*, i8** %name68, align 8, !tbaa !228
  %call.i364 = tail call i8* @halide_string_to_string(i8* %call.i361, i8* %sstr.sroa.125.0, i8* %29) #12
  %call.i367 = tail call i8* @halide_string_to_string(i8* %call.i364, i8* %sstr.sroa.125.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.19.101, i32 0, i32 0)) #12
  %30 = ptrtoint i8* %call.i367 to i32
  %sub.ptr.lhs.cast.i591 = zext i32 %30 to i64
  %sub.ptr.sub.i592 = sub nsw i64 %sub.ptr.lhs.cast.i591, %sub.ptr.rhs.cast.i.i348
  %cmp73593 = icmp ult i64 %sub.ptr.sub.i592, 25
  br i1 %cmp73593, label %while.body, label %while.end

while.body:                                       ; preds = %while.body, %if.end66
  %sstr.sroa.19.3594 = phi i8* [ %call.i370, %while.body ], [ %call.i367, %if.end66 ]
  %call.i370 = tail call i8* @halide_string_to_string(i8* %sstr.sroa.19.3594, i8* %sstr.sroa.125.0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.20.102, i32 0, i32 0)) #12
  %31 = ptrtoint i8* %call.i370 to i32
  %sub.ptr.lhs.cast.i = zext i32 %31 to i64
  %sub.ptr.sub.i = sub nsw i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i.i348
  %cmp73 = icmp ult i64 %sub.ptr.sub.i, 25
  br i1 %cmp73, label %while.body, label %while.end, !llvm.loop !229

while.end:                                        ; preds = %while.body, %if.end66
  %sstr.sroa.19.3.lcssa = phi i8* [ %call.i367, %if.end66 ], [ %call.i370, %while.body ]
  %time75 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %add.ptr61, i32 0, i32 0
  %32 = load i64, i64* %time75, align 8, !tbaa !227
  %conv76 = uitofp i64 %32 to float
  %33 = load i32, i32* %runs, align 8, !tbaa !214
  %conv78 = sitofp i32 %33 to float
  %mul = fmul float %conv78, 1.000000e+06
  %div79 = fdiv float %conv76, %mul
  %conv.i373 = fpext float %div79 to double
  %call.i374 = tail call i8* @halide_double_to_string(i8* %sstr.sroa.19.3.lcssa, i8* %sstr.sroa.125.0, double %conv.i373, i32 0) #12
  %tobool.not.i376 = icmp eq i8* %call.i374, null
  br i1 %tobool.not.i376, label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EE5eraseEi.exit, label %if.then.i379

if.then.i379:                                     ; preds = %while.end
  %add.ptr.i377 = getelementptr inbounds i8, i8* %call.i374, i32 -3
  %cmp.i = icmp ult i8* %add.ptr.i377, %call.i
  %spec.store.select.i = select i1 %cmp.i, i8* %call.i, i8* %add.ptr.i377
  store i8 0, i8* %spec.store.select.i, align 1, !tbaa !15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EE5eraseEi.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EE5eraseEi.exit: ; preds = %if.then.i379, %while.end
  %sstr.sroa.19.4 = phi i8* [ null, %while.end ], [ %spec.store.select.i, %if.then.i379 ]
  %call.i382 = tail call i8* @halide_string_to_string(i8* %sstr.sroa.19.4, i8* %sstr.sroa.125.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.21.103, i32 0, i32 0)) #12
  %34 = ptrtoint i8* %call.i382 to i32
  %sub.ptr.lhs.cast.i383595 = zext i32 %34 to i64
  %sub.ptr.sub.i385596 = sub nsw i64 %sub.ptr.lhs.cast.i383595, %sub.ptr.rhs.cast.i.i348
  %cmp85597 = icmp ult i64 %sub.ptr.sub.i385596, 35
  br i1 %cmp85597, label %while.body86, label %while.end88

while.body86:                                     ; preds = %while.body86, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EE5eraseEi.exit
  %sstr.sroa.19.5598 = phi i8* [ %call.i388, %while.body86 ], [ %call.i382, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EE5eraseEi.exit ]
  %call.i388 = tail call i8* @halide_string_to_string(i8* %sstr.sroa.19.5598, i8* %sstr.sroa.125.0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.20.102, i32 0, i32 0)) #12
  %35 = ptrtoint i8* %call.i388 to i32
  %sub.ptr.lhs.cast.i383 = zext i32 %35 to i64
  %sub.ptr.sub.i385 = sub nsw i64 %sub.ptr.lhs.cast.i383, %sub.ptr.rhs.cast.i.i348
  %cmp85 = icmp ult i64 %sub.ptr.sub.i385, 35
  br i1 %cmp85, label %while.body86, label %while.end88, !llvm.loop !230

while.end88:                                      ; preds = %while.body86, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EE5eraseEi.exit
  %sstr.sroa.19.5.lcssa = phi i8* [ %call.i382, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EE5eraseEi.exit ], [ %call.i388, %while.body86 ]
  %36 = load i64, i64* %time, align 8, !tbaa !212
  %cmp90.not = icmp eq i64 %36, 0
  br i1 %cmp90.not, label %if.end97, label %if.then91

if.then91:                                        ; preds = %while.end88
  %37 = load i64, i64* %time75, align 8, !tbaa !227
  %mul93 = mul i64 %37, 100
  %div95 = udiv i64 %mul93, %36
  br label %if.end97

if.end97:                                         ; preds = %if.then91, %while.end88
  %percent.0 = phi i64 [ %div95, %if.then91 ], [ 0, %while.end88 ]
  %call.i391 = tail call i8* @halide_string_to_string(i8* %sstr.sroa.19.5.lcssa, i8* %sstr.sroa.125.0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.22.104, i32 0, i32 0)) #12
  %sext = shl i64 %percent.0, 32
  %conv.i394 = ashr exact i64 %sext, 32
  %call.i395 = tail call i8* @halide_int64_to_string(i8* %call.i391, i8* %sstr.sroa.125.0, i64 %conv.i394, i32 1) #12
  %call.i398 = tail call i8* @halide_string_to_string(i8* %call.i395, i8* %sstr.sroa.125.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.23.105, i32 0, i32 0)) #12
  %38 = ptrtoint i8* %call.i398 to i32
  %sub.ptr.lhs.cast.i399600 = zext i32 %38 to i64
  %sub.ptr.sub.i401601 = sub nsw i64 %sub.ptr.lhs.cast.i399600, %sub.ptr.rhs.cast.i.i348
  %cmp104602 = icmp ult i64 %sub.ptr.sub.i401601, 43
  br i1 %cmp104602, label %while.body105, label %while.end107

while.body105:                                    ; preds = %while.body105, %if.end97
  %sstr.sroa.19.6603 = phi i8* [ %call.i404, %while.body105 ], [ %call.i398, %if.end97 ]
  %call.i404 = tail call i8* @halide_string_to_string(i8* %sstr.sroa.19.6603, i8* %sstr.sroa.125.0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.20.102, i32 0, i32 0)) #12
  %39 = ptrtoint i8* %call.i404 to i32
  %sub.ptr.lhs.cast.i399 = zext i32 %39 to i64
  %sub.ptr.sub.i401 = sub nsw i64 %sub.ptr.lhs.cast.i399, %sub.ptr.rhs.cast.i.i348
  %cmp104 = icmp ult i64 %sub.ptr.sub.i401, 43
  br i1 %cmp104, label %while.body105, label %while.end107, !llvm.loop !231

while.end107:                                     ; preds = %while.body105, %if.end97
  %sstr.sroa.19.6.lcssa = phi i8* [ %call.i398, %if.end97 ], [ %call.i404, %while.body105 ]
  br i1 %12, label %if.end127, label %if.then109

if.then109:                                       ; preds = %while.end107
  %active_threads_numerator111 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %26, i32 %27, i32 5
  %40 = load i64, i64* %active_threads_numerator111, align 8, !tbaa !232
  %conv112 = uitofp i64 %40 to double
  %active_threads_denominator113 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %26, i32 %27, i32 6
  %41 = load i64, i64* %active_threads_denominator113, align 8, !tbaa !233
  %conv114 = uitofp i64 %41 to double
  %add115 = fadd double %conv114, 1.000000e-10
  %div116 = fdiv double %conv112, %add115
  %conv117 = fptrunc double %div116 to float
  %call.i407 = tail call i8* @halide_string_to_string(i8* %sstr.sroa.19.6.lcssa, i8* %sstr.sroa.125.0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.24.106, i32 0, i32 0)) #12
  %conv.i410 = fpext float %conv117 to double
  %call.i411 = tail call i8* @halide_double_to_string(i8* %call.i407, i8* %sstr.sroa.125.0, double %conv.i410, i32 0) #12
  %tobool.not.i413 = icmp eq i8* %call.i411, null
  br i1 %tobool.not.i413, label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EE5eraseEi.exit419, label %if.then.i418

if.then.i418:                                     ; preds = %if.then109
  %add.ptr.i414 = getelementptr inbounds i8, i8* %call.i411, i32 -3
  %cmp.i416 = icmp ult i8* %add.ptr.i414, %call.i
  %spec.store.select.i417 = select i1 %cmp.i416, i8* %call.i, i8* %add.ptr.i414
  store i8 0, i8* %spec.store.select.i417, align 1, !tbaa !15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EE5eraseEi.exit419

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EE5eraseEi.exit419: ; preds = %if.then.i418, %if.then109
  %sstr.sroa.19.7 = phi i8* [ null, %if.then109 ], [ %spec.store.select.i417, %if.then.i418 ]
  %42 = ptrtoint i8* %sstr.sroa.19.7 to i32
  %sub.ptr.lhs.cast.i420605 = zext i32 %42 to i64
  %sub.ptr.sub.i422606 = sub nsw i64 %sub.ptr.lhs.cast.i420605, %sub.ptr.rhs.cast.i.i348
  %cmp123607 = icmp ult i64 %sub.ptr.sub.i422606, 58
  br i1 %cmp123607, label %while.body124, label %if.end127

while.body124:                                    ; preds = %while.body124, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EE5eraseEi.exit419
  %sstr.sroa.19.8608 = phi i8* [ %call.i425, %while.body124 ], [ %sstr.sroa.19.7, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EE5eraseEi.exit419 ]
  %call.i425 = tail call i8* @halide_string_to_string(i8* %sstr.sroa.19.8608, i8* %sstr.sroa.125.0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.20.102, i32 0, i32 0)) #12
  %43 = ptrtoint i8* %call.i425 to i32
  %sub.ptr.lhs.cast.i420 = zext i32 %43 to i64
  %sub.ptr.sub.i422 = sub nsw i64 %sub.ptr.lhs.cast.i420, %sub.ptr.rhs.cast.i.i348
  %cmp123 = icmp ult i64 %sub.ptr.sub.i422, 58
  br i1 %cmp123, label %while.body124, label %if.end127, !llvm.loop !234

if.end127:                                        ; preds = %while.body124, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EE5eraseEi.exit419, %while.end107
  %sstr.sroa.19.9 = phi i8* [ %sstr.sroa.19.6.lcssa, %while.end107 ], [ %sstr.sroa.19.7, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EE5eraseEi.exit419 ], [ %call.i425, %while.body124 ]
  %cursor.0 = phi i64 [ 58, %while.end107 ], [ 73, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EE5eraseEi.exit419 ], [ 73, %while.body124 ]
  %memory_peak128 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %26, i32 %27, i32 2
  %44 = load i64, i64* %memory_peak128, align 8, !tbaa !235
  %tobool129.not = icmp eq i64 %44, 0
  br i1 %tobool129.not, label %if.end162, label %if.then130

if.then130:                                       ; preds = %if.end127
  %call.i428 = tail call i8* @halide_string_to_string(i8* %sstr.sroa.19.9, i8* %sstr.sroa.125.0, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.25.107, i32 0, i32 0)) #12
  %45 = load i64, i64* %memory_peak128, align 8, !tbaa !235
  %call.i431 = tail call i8* @halide_uint64_to_string(i8* %call.i428, i8* %sstr.sroa.125.0, i64 %45, i32 1) #12
  %46 = ptrtoint i8* %call.i431 to i32
  %sub.ptr.lhs.cast.i432610 = zext i32 %46 to i64
  %sub.ptr.sub.i434611 = sub nsw i64 %sub.ptr.lhs.cast.i432610, %sub.ptr.rhs.cast.i.i348
  %cmp137612 = icmp ult i64 %sub.ptr.sub.i434611, %cursor.0
  br i1 %cmp137612, label %while.body138, label %while.end140

while.body138:                                    ; preds = %while.body138, %if.then130
  %sstr.sroa.19.10613 = phi i8* [ %call.i437, %while.body138 ], [ %call.i431, %if.then130 ]
  %call.i437 = tail call i8* @halide_string_to_string(i8* %sstr.sroa.19.10613, i8* %sstr.sroa.125.0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.20.102, i32 0, i32 0)) #12
  %47 = ptrtoint i8* %call.i437 to i32
  %sub.ptr.lhs.cast.i432 = zext i32 %47 to i64
  %sub.ptr.sub.i434 = sub nsw i64 %sub.ptr.lhs.cast.i432, %sub.ptr.rhs.cast.i.i348
  %cmp137 = icmp ult i64 %sub.ptr.sub.i434, %cursor.0
  br i1 %cmp137, label %while.body138, label %while.end140, !llvm.loop !236

while.end140:                                     ; preds = %while.body138, %if.then130
  %sstr.sroa.19.10.lcssa = phi i8* [ %call.i431, %if.then130 ], [ %call.i437, %while.body138 ]
  %call.i440 = tail call i8* @halide_string_to_string(i8* %sstr.sroa.19.10.lcssa, i8* %sstr.sroa.125.0, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.26.108, i32 0, i32 0)) #12
  %num_allocs142 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %26, i32 %27, i32 8
  %48 = load i32, i32* %num_allocs142, align 8, !tbaa !237
  %conv.i443 = sext i32 %48 to i64
  %call.i444 = tail call i8* @halide_int64_to_string(i8* %call.i440, i8* %sstr.sroa.125.0, i64 %conv.i443, i32 1) #12
  %add144 = add nuw nsw i64 %cursor.0, 15
  %49 = ptrtoint i8* %call.i444 to i32
  %sub.ptr.lhs.cast.i445615 = zext i32 %49 to i64
  %sub.ptr.sub.i447616 = sub nsw i64 %sub.ptr.lhs.cast.i445615, %sub.ptr.rhs.cast.i.i348
  %cmp147617 = icmp ult i64 %sub.ptr.sub.i447616, %add144
  br i1 %cmp147617, label %while.body148, label %while.end150

while.body148:                                    ; preds = %while.body148, %while.end140
  %sstr.sroa.19.11618 = phi i8* [ %call.i450, %while.body148 ], [ %call.i444, %while.end140 ]
  %call.i450 = tail call i8* @halide_string_to_string(i8* %sstr.sroa.19.11618, i8* %sstr.sroa.125.0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.20.102, i32 0, i32 0)) #12
  %50 = ptrtoint i8* %call.i450 to i32
  %sub.ptr.lhs.cast.i445 = zext i32 %50 to i64
  %sub.ptr.sub.i447 = sub nsw i64 %sub.ptr.lhs.cast.i445, %sub.ptr.rhs.cast.i.i348
  %cmp147 = icmp ult i64 %sub.ptr.sub.i447, %add144
  br i1 %cmp147, label %while.body148, label %while.end150, !llvm.loop !238

while.end150:                                     ; preds = %while.body148, %while.end140
  %sstr.sroa.19.11.lcssa = phi i8* [ %call.i444, %while.end140 ], [ %call.i450, %while.body148 ]
  %51 = load i32, i32* %num_allocs142, align 8, !tbaa !237
  %cmp152.not = icmp eq i32 %51, 0
  br i1 %cmp152.not, label %if.end159, label %if.then153

if.then153:                                       ; preds = %while.end150
  %memory_total154 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %26, i32 %27, i32 3
  %52 = load i64, i64* %memory_total154, align 8, !tbaa !239
  %conv156 = sext i32 %51 to i64
  %div157 = udiv i64 %52, %conv156
  br label %if.end159

if.end159:                                        ; preds = %if.then153, %while.end150
  %alloc_avg.0 = phi i64 [ %div157, %if.then153 ], [ 0, %while.end150 ]
  %call.i453 = tail call i8* @halide_string_to_string(i8* %sstr.sroa.19.11.lcssa, i8* %sstr.sroa.125.0, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.27.109, i32 0, i32 0)) #12
  %sext586 = shl i64 %alloc_avg.0, 32
  %conv.i456 = ashr exact i64 %sext586, 32
  %call.i457 = tail call i8* @halide_int64_to_string(i8* %call.i453, i8* %sstr.sroa.125.0, i64 %conv.i456, i32 1) #12
  br label %if.end162

if.end162:                                        ; preds = %if.end159, %if.end127
  %sstr.sroa.19.12 = phi i8* [ %sstr.sroa.19.9, %if.end127 ], [ %call.i457, %if.end159 ]
  %stack_peak163 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %26, i32 %27, i32 4
  %53 = load i64, i64* %stack_peak163, align 8, !tbaa !225
  %cmp164.not = icmp eq i64 %53, 0
  br i1 %cmp164.not, label %if.end169, label %if.then165

if.then165:                                       ; preds = %if.end162
  %call.i460 = tail call i8* @halide_string_to_string(i8* %sstr.sroa.19.12, i8* %sstr.sroa.125.0, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.28.110, i32 0, i32 0)) #12
  %54 = load i64, i64* %stack_peak163, align 8, !tbaa !225
  %call.i463 = tail call i8* @halide_uint64_to_string(i8* %call.i460, i8* %sstr.sroa.125.0, i64 %54, i32 1) #12
  br label %if.end169

if.end169:                                        ; preds = %if.then165, %if.end162
  %sstr.sroa.19.13 = phi i8* [ %sstr.sroa.19.12, %if.end162 ], [ %call.i463, %if.then165 ]
  %call.i466 = tail call i8* @halide_string_to_string(i8* %sstr.sroa.19.13, i8* %sstr.sroa.125.0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7.89, i32 0, i32 0)) #12
  br i1 %tobool.not.i, label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EE3strEv.exit480, label %if.then.i478

if.then.i478:                                     ; preds = %if.end169
  %55 = ptrtoint i8* %call.i466 to i32
  %sub.ptr.lhs.cast.i.i473 = zext i32 %55 to i64
  %add.i.i476 = add nsw i64 %sub.ptr.sub.i.i349, %sub.ptr.lhs.cast.i.i473
  %call.i.i477 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i476) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EE3strEv.exit480

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EE3strEv.exit480: ; preds = %if.then.i478, %if.end169
  %retval.0.i479 = phi i8* [ %call.i, %if.then.i478 ], [ getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.123, i32 0, i32 0), %if.end169 ]
  tail call void @halide_print(i8* %user_context, i8* nonnull %retval.0.i479) #12
  br label %cleanup172

cleanup172:                                       ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EE3strEv.exit480, %land.lhs.true
  %sstr.sroa.19.14 = phi i8* [ %call.i, %land.lhs.true ], [ %call.i466, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EE3strEv.exit480 ]
  %indvars.iv.next630 = add nuw nsw i64 %indvars.iv629, 1
  %56 = load i32, i32* %num_funcs54, align 8, !tbaa !222
  %57 = sext i32 %56 to i64
  %cmp55 = icmp slt i64 %indvars.iv.next630, %57
  br i1 %cmp55, label %for.body57, label %cleanup181, !llvm.loop !240

cleanup181:                                       ; preds = %cleanup172, %for.cond53.preheader, %for.cond41, %for.cond41.preheader, %for.body
  %sstr.sroa.19.15 = phi i8* [ %sstr.sroa.19.0625, %for.body ], [ %call.i344, %for.cond53.preheader ], [ %call.i344, %for.cond41.preheader ], [ %sstr.sroa.19.14, %cleanup172 ], [ %call.i344, %for.cond41 ]
  %next = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %p.0626, i32 0, i32 8
  %58 = bitcast i8** %next to %struct.halide_profiler_pipeline_stats**
  %p.0 = load %struct.halide_profiler_pipeline_stats*, %struct.halide_profiler_pipeline_stats** %58, align 8, !tbaa !11
  %tobool.not = icmp eq %struct.halide_profiler_pipeline_stats* %p.0, null
  br i1 %tobool.not, label %for.cond.cleanup, label %for.body, !llvm.loop !241
}

; Function Attrs: mustprogress nounwind
define weak void @halide_profiler_reset_unlocked(%struct.halide_profiler_state* %s) local_unnamed_addr #0 {
entry:
  %pipelines = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %s, i32 0, i32 5
  %0 = load %struct.halide_profiler_pipeline_stats*, %struct.halide_profiler_pipeline_stats** %pipelines, align 8, !tbaa !242
  %tobool.not9 = icmp eq %struct.halide_profiler_pipeline_stats* %0, null
  br i1 %tobool.not9, label %while.end, label %while.body

while.body:                                       ; preds = %while.body, %entry
  %1 = phi %struct.halide_profiler_pipeline_stats* [ %7, %while.body ], [ %0, %entry ]
  %next = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %1, i32 0, i32 8
  %2 = bitcast i8** %next to %struct.halide_profiler_pipeline_stats**
  %3 = load %struct.halide_profiler_pipeline_stats*, %struct.halide_profiler_pipeline_stats** %2, align 8, !tbaa !243
  store %struct.halide_profiler_pipeline_stats* %3, %struct.halide_profiler_pipeline_stats** %pipelines, align 8, !tbaa !242
  %funcs = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %1, i32 0, i32 7
  %4 = bitcast %struct.halide_profiler_func_stats** %funcs to i8**
  %5 = load i8*, i8** %4, align 8, !tbaa !223
  tail call void @free(i8* %5) #12
  %6 = bitcast %struct.halide_profiler_pipeline_stats* %1 to i8*
  tail call void @free(i8* nonnull %6) #12
  %7 = load %struct.halide_profiler_pipeline_stats*, %struct.halide_profiler_pipeline_stats** %pipelines, align 8, !tbaa !242
  %tobool.not = icmp eq %struct.halide_profiler_pipeline_stats* %7, null
  br i1 %tobool.not, label %while.end, label %while.body, !llvm.loop !244

while.end:                                        ; preds = %while.body, %entry
  %first_free_id = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %s, i32 0, i32 2
  store i32 0, i32* %first_free_id, align 4, !tbaa !245
  ret void
}

; Function Attrs: mustprogress nounwind
define linkonce %struct.halide_profiler_pipeline_stats* @_ZN6Halide7Runtime8Internal23find_or_create_pipelineEPKciPKy(i8* %pipeline_name, i32 %num_funcs, i64* %func_names) local_unnamed_addr #0 {
entry:
  %call = tail call %struct.halide_profiler_state* @halide_profiler_get_state() #13
  %pipelines = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %call, i32 0, i32 5
  %p.0119 = load %struct.halide_profiler_pipeline_stats*, %struct.halide_profiler_pipeline_stats** %pipelines, align 8, !tbaa !11
  %tobool.not120 = icmp eq %struct.halide_profiler_pipeline_stats* %p.0119, null
  br i1 %tobool.not120, label %for.end, label %for.body

for.body:                                         ; preds = %for.inc, %entry
  %p.0121 = phi %struct.halide_profiler_pipeline_stats* [ %p.0, %for.inc ], [ %p.0119, %entry ]
  %name = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %p.0121, i32 0, i32 6
  %0 = load i8*, i8** %name, align 8, !tbaa !217
  %cmp = icmp eq i8* %0, %pipeline_name
  br i1 %cmp, label %land.lhs.true, label %for.inc

land.lhs.true:                                    ; preds = %for.body
  %num_funcs1 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %p.0121, i32 0, i32 9
  %1 = load i32, i32* %num_funcs1, align 8, !tbaa !222
  %cmp2 = icmp eq i32 %1, %num_funcs
  br i1 %cmp2, label %cleanup62, label %for.inc

for.inc:                                          ; preds = %land.lhs.true, %for.body
  %next = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %p.0121, i32 0, i32 8
  %2 = bitcast i8** %next to %struct.halide_profiler_pipeline_stats**
  %p.0 = load %struct.halide_profiler_pipeline_stats*, %struct.halide_profiler_pipeline_stats** %2, align 8, !tbaa !11
  %tobool.not = icmp eq %struct.halide_profiler_pipeline_stats* %p.0, null
  br i1 %tobool.not, label %for.end, label %for.body, !llvm.loop !246

for.end:                                          ; preds = %for.inc, %entry
  %call4 = tail call i8* @malloc(i64 96) #12
  %3 = bitcast i8* %call4 to %struct.halide_profiler_pipeline_stats*
  %tobool5.not = icmp eq i8* %call4, null
  br i1 %tobool5.not, label %cleanup62, label %if.end7

if.end7:                                          ; preds = %for.end
  %4 = bitcast %struct.halide_profiler_pipeline_stats** %pipelines to i8**
  %5 = load i8*, i8** %4, align 8, !tbaa !242
  %next9 = getelementptr inbounds i8, i8* %call4, i32 64
  %6 = bitcast i8* %next9 to i8**
  store i8* %5, i8** %6, align 8, !tbaa !243
  %name10 = getelementptr inbounds i8, i8* %call4, i32 48
  %7 = bitcast i8* %name10 to i8**
  store i8* %pipeline_name, i8** %7, align 8, !tbaa !217
  %first_free_id = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %call, i32 0, i32 2
  %8 = load i32, i32* %first_free_id, align 4, !tbaa !245
  %first_func_id = getelementptr inbounds i8, i8* %call4, i32 76
  %9 = bitcast i8* %first_func_id to i32*
  store i32 %8, i32* %9, align 4, !tbaa !247
  %num_funcs11 = getelementptr inbounds i8, i8* %call4, i32 72
  %10 = bitcast i8* %num_funcs11 to i32*
  store i32 %num_funcs, i32* %10, align 8, !tbaa !222
  %runs = getelementptr inbounds i8, i8* %call4, i32 80
  %11 = bitcast i8* %runs to i32*
  store i32 0, i32* %11, align 8, !tbaa !214
  %time = bitcast i8* %call4 to i64*
  store i64 0, i64* %time, align 8, !tbaa !212
  %samples = getelementptr inbounds i8, i8* %call4, i32 84
  %12 = bitcast i8* %samples to i32*
  store i32 0, i32* %12, align 4, !tbaa !218
  %memory_current = getelementptr inbounds i8, i8* %call4, i32 8
  %13 = bitcast i8* %memory_current to i64*
  store i64 0, i64* %13, align 8, !tbaa !248
  %memory_peak = getelementptr inbounds i8, i8* %call4, i32 16
  %14 = bitcast i8* %memory_peak to i64*
  store i64 0, i64* %14, align 8, !tbaa !220
  %memory_total = getelementptr inbounds i8, i8* %call4, i32 24
  %15 = bitcast i8* %memory_total to i64*
  store i64 0, i64* %15, align 8, !tbaa !221
  %num_allocs = getelementptr inbounds i8, i8* %call4, i32 88
  %16 = bitcast i8* %num_allocs to i32*
  store i32 0, i32* %16, align 8, !tbaa !219
  %active_threads_numerator = getelementptr inbounds i8, i8* %call4, i32 32
  %17 = bitcast i8* %active_threads_numerator to i64*
  store i64 0, i64* %17, align 8, !tbaa !215
  %active_threads_denominator = getelementptr inbounds i8, i8* %call4, i32 40
  %18 = bitcast i8* %active_threads_denominator to i64*
  store i64 0, i64* %18, align 8, !tbaa !216
  %conv = sext i32 %num_funcs to i64
  %mul = mul nsw i64 %conv, 72
  %call12 = tail call i8* @malloc(i64 %mul) #12
  %funcs = getelementptr inbounds i8, i8* %call4, i32 56
  %19 = bitcast i8* %funcs to i8**
  store i8* %call12, i8** %19, align 8, !tbaa !223
  %tobool14.not = icmp eq i8* %call12, null
  %20 = bitcast i8* %call12 to %struct.halide_profiler_func_stats*
  br i1 %tobool14.not, label %if.then15, label %for.cond17.preheader

for.cond17.preheader:                             ; preds = %if.end7
  %cmp18123 = icmp sgt i32 %num_funcs, 0
  br i1 %cmp18123, label %for.body20.lr.ph, label %for.cond.cleanup19

for.body20.lr.ph:                                 ; preds = %for.cond17.preheader
  %wide.trip.count = zext i32 %num_funcs to i64
  %21 = add nsw i64 %wide.trip.count, -1
  %xtraiter = and i64 %wide.trip.count, 3
  %22 = icmp ult i64 %21, 3
  br i1 %22, label %for.cond.cleanup19.loopexit.unr-lcssa, label %for.body20.lr.ph.new

for.body20.lr.ph.new:                             ; preds = %for.body20.lr.ph
  %unroll_iter = and i64 %wide.trip.count, 4294967292
  br label %for.body20

if.then15:                                        ; preds = %if.end7
  tail call void @free(i8* nonnull %call4) #12
  br label %cleanup62

for.cond.cleanup19.loopexit.unr-lcssa:            ; preds = %for.body20, %for.body20.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %for.body20.lr.ph ], [ %indvars.iv.next.3, %for.body20 ]
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod.not, label %for.cond.cleanup19, label %for.body20.epil

for.body20.epil:                                  ; preds = %for.body20.epil, %for.cond.cleanup19.loopexit.unr-lcssa
  %indvars.iv.epil = phi i64 [ %indvars.iv.next.epil, %for.body20.epil ], [ %indvars.iv.unr, %for.cond.cleanup19.loopexit.unr-lcssa ]
  %epil.iter = phi i64 [ %epil.iter.sub, %for.body20.epil ], [ %xtraiter, %for.cond.cleanup19.loopexit.unr-lcssa ]
  %23 = trunc i64 %indvars.iv.epil to i32
  %time22.epil = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %20, i32 %23, i32 0
  store i64 0, i64* %time22.epil, align 8, !tbaa !227
  %arrayidx24.epil = getelementptr inbounds i64, i64* %func_names, i32 %23
  %24 = load i64, i64* %arrayidx24.epil, align 8, !tbaa !19
  %25 = trunc i64 %24 to i32
  %26 = inttoptr i32 %25 to i8*
  %name28.epil = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %20, i32 %23, i32 7
  store i8* %26, i8** %name28.epil, align 8, !tbaa !228
  %memory_current32.epil = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %20, i32 %23, i32 1
  store i64 0, i64* %memory_current32.epil, align 8, !tbaa !249
  %memory_peak36.epil = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %20, i32 %23, i32 2
  store i64 0, i64* %memory_peak36.epil, align 8, !tbaa !235
  %memory_total40.epil = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %20, i32 %23, i32 3
  store i64 0, i64* %memory_total40.epil, align 8, !tbaa !239
  %num_allocs44.epil = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %20, i32 %23, i32 8
  store i32 0, i32* %num_allocs44.epil, align 8, !tbaa !237
  %stack_peak.epil = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %20, i32 %23, i32 4
  store i64 0, i64* %stack_peak.epil, align 8, !tbaa !225
  %active_threads_numerator51.epil = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %20, i32 %23, i32 5
  store i64 0, i64* %active_threads_numerator51.epil, align 8, !tbaa !232
  %active_threads_denominator55.epil = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %20, i32 %23, i32 6
  store i64 0, i64* %active_threads_denominator55.epil, align 8, !tbaa !233
  %indvars.iv.next.epil = add nuw nsw i64 %indvars.iv.epil, 1
  %epil.iter.sub = add i64 %epil.iter, -1
  %epil.iter.cmp.not = icmp eq i64 %epil.iter.sub, 0
  br i1 %epil.iter.cmp.not, label %for.cond.cleanup19, label %for.body20.epil, !llvm.loop !250

for.cond.cleanup19:                               ; preds = %for.body20.epil, %for.cond.cleanup19.loopexit.unr-lcssa, %for.cond17.preheader
  %27 = load i32, i32* %first_free_id, align 4, !tbaa !245
  %add = add nsw i32 %27, %num_funcs
  store i32 %add, i32* %first_free_id, align 4, !tbaa !245
  store i8* %call4, i8** %4, align 8, !tbaa !242
  br label %cleanup62

for.body20:                                       ; preds = %for.body20, %for.body20.lr.ph.new
  %indvars.iv = phi i64 [ 0, %for.body20.lr.ph.new ], [ %indvars.iv.next.3, %for.body20 ]
  %niter = phi i64 [ %unroll_iter, %for.body20.lr.ph.new ], [ %niter.nsub.3, %for.body20 ]
  %28 = trunc i64 %indvars.iv to i32
  %time22 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %20, i32 %28, i32 0
  store i64 0, i64* %time22, align 8, !tbaa !227
  %arrayidx24 = getelementptr inbounds i64, i64* %func_names, i32 %28
  %29 = load i64, i64* %arrayidx24, align 8, !tbaa !19
  %30 = trunc i64 %29 to i32
  %31 = inttoptr i32 %30 to i8*
  %name28 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %20, i32 %28, i32 7
  store i8* %31, i8** %name28, align 8, !tbaa !228
  %memory_current32 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %20, i32 %28, i32 1
  store i64 0, i64* %memory_current32, align 8, !tbaa !249
  %memory_peak36 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %20, i32 %28, i32 2
  store i64 0, i64* %memory_peak36, align 8, !tbaa !235
  %memory_total40 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %20, i32 %28, i32 3
  store i64 0, i64* %memory_total40, align 8, !tbaa !239
  %num_allocs44 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %20, i32 %28, i32 8
  store i32 0, i32* %num_allocs44, align 8, !tbaa !237
  %stack_peak = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %20, i32 %28, i32 4
  store i64 0, i64* %stack_peak, align 8, !tbaa !225
  %active_threads_numerator51 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %20, i32 %28, i32 5
  store i64 0, i64* %active_threads_numerator51, align 8, !tbaa !232
  %active_threads_denominator55 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %20, i32 %28, i32 6
  store i64 0, i64* %active_threads_denominator55, align 8, !tbaa !233
  %32 = trunc i64 %indvars.iv to i32
  %33 = or i32 %32, 1
  %time22.1 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %20, i32 %33, i32 0
  store i64 0, i64* %time22.1, align 8, !tbaa !227
  %arrayidx24.1 = getelementptr inbounds i64, i64* %func_names, i32 %33
  %34 = load i64, i64* %arrayidx24.1, align 8, !tbaa !19
  %35 = trunc i64 %34 to i32
  %36 = inttoptr i32 %35 to i8*
  %name28.1 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %20, i32 %33, i32 7
  store i8* %36, i8** %name28.1, align 8, !tbaa !228
  %memory_current32.1 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %20, i32 %33, i32 1
  store i64 0, i64* %memory_current32.1, align 8, !tbaa !249
  %memory_peak36.1 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %20, i32 %33, i32 2
  store i64 0, i64* %memory_peak36.1, align 8, !tbaa !235
  %memory_total40.1 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %20, i32 %33, i32 3
  store i64 0, i64* %memory_total40.1, align 8, !tbaa !239
  %num_allocs44.1 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %20, i32 %33, i32 8
  store i32 0, i32* %num_allocs44.1, align 8, !tbaa !237
  %stack_peak.1 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %20, i32 %33, i32 4
  store i64 0, i64* %stack_peak.1, align 8, !tbaa !225
  %active_threads_numerator51.1 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %20, i32 %33, i32 5
  store i64 0, i64* %active_threads_numerator51.1, align 8, !tbaa !232
  %active_threads_denominator55.1 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %20, i32 %33, i32 6
  store i64 0, i64* %active_threads_denominator55.1, align 8, !tbaa !233
  %37 = trunc i64 %indvars.iv to i32
  %38 = or i32 %37, 2
  %time22.2 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %20, i32 %38, i32 0
  store i64 0, i64* %time22.2, align 8, !tbaa !227
  %arrayidx24.2 = getelementptr inbounds i64, i64* %func_names, i32 %38
  %39 = load i64, i64* %arrayidx24.2, align 8, !tbaa !19
  %40 = trunc i64 %39 to i32
  %41 = inttoptr i32 %40 to i8*
  %name28.2 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %20, i32 %38, i32 7
  store i8* %41, i8** %name28.2, align 8, !tbaa !228
  %memory_current32.2 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %20, i32 %38, i32 1
  store i64 0, i64* %memory_current32.2, align 8, !tbaa !249
  %memory_peak36.2 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %20, i32 %38, i32 2
  store i64 0, i64* %memory_peak36.2, align 8, !tbaa !235
  %memory_total40.2 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %20, i32 %38, i32 3
  store i64 0, i64* %memory_total40.2, align 8, !tbaa !239
  %num_allocs44.2 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %20, i32 %38, i32 8
  store i32 0, i32* %num_allocs44.2, align 8, !tbaa !237
  %stack_peak.2 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %20, i32 %38, i32 4
  store i64 0, i64* %stack_peak.2, align 8, !tbaa !225
  %active_threads_numerator51.2 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %20, i32 %38, i32 5
  store i64 0, i64* %active_threads_numerator51.2, align 8, !tbaa !232
  %active_threads_denominator55.2 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %20, i32 %38, i32 6
  store i64 0, i64* %active_threads_denominator55.2, align 8, !tbaa !233
  %42 = trunc i64 %indvars.iv to i32
  %43 = or i32 %42, 3
  %time22.3 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %20, i32 %43, i32 0
  store i64 0, i64* %time22.3, align 8, !tbaa !227
  %arrayidx24.3 = getelementptr inbounds i64, i64* %func_names, i32 %43
  %44 = load i64, i64* %arrayidx24.3, align 8, !tbaa !19
  %45 = trunc i64 %44 to i32
  %46 = inttoptr i32 %45 to i8*
  %name28.3 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %20, i32 %43, i32 7
  store i8* %46, i8** %name28.3, align 8, !tbaa !228
  %memory_current32.3 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %20, i32 %43, i32 1
  store i64 0, i64* %memory_current32.3, align 8, !tbaa !249
  %memory_peak36.3 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %20, i32 %43, i32 2
  store i64 0, i64* %memory_peak36.3, align 8, !tbaa !235
  %memory_total40.3 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %20, i32 %43, i32 3
  store i64 0, i64* %memory_total40.3, align 8, !tbaa !239
  %num_allocs44.3 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %20, i32 %43, i32 8
  store i32 0, i32* %num_allocs44.3, align 8, !tbaa !237
  %stack_peak.3 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %20, i32 %43, i32 4
  store i64 0, i64* %stack_peak.3, align 8, !tbaa !225
  %active_threads_numerator51.3 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %20, i32 %43, i32 5
  store i64 0, i64* %active_threads_numerator51.3, align 8, !tbaa !232
  %active_threads_denominator55.3 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %20, i32 %43, i32 6
  store i64 0, i64* %active_threads_denominator55.3, align 8, !tbaa !233
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %niter.nsub.3 = add i64 %niter, -4
  %niter.ncmp.3 = icmp eq i64 %niter.nsub.3, 0
  br i1 %niter.ncmp.3, label %for.cond.cleanup19.loopexit.unr-lcssa, label %for.body20, !llvm.loop !251

cleanup62:                                        ; preds = %for.cond.cleanup19, %if.then15, %for.end, %land.lhs.true
  %retval.2 = phi %struct.halide_profiler_pipeline_stats* [ %3, %for.cond.cleanup19 ], [ null, %if.then15 ], [ null, %for.end ], [ %p.0121, %land.lhs.true ]
  ret %struct.halide_profiler_pipeline_stats* %retval.2
}

; Function Attrs: mustprogress nounwind
define linkonce void @_ZN6Halide7Runtime8Internal9bill_funcEP21halide_profiler_stateiyi(%struct.halide_profiler_state* %s, i32 %func_id, i64 %time, i32 %active_threads) local_unnamed_addr #0 {
entry:
  %pipelines = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %s, i32 0, i32 5
  %p.055 = load %struct.halide_profiler_pipeline_stats*, %struct.halide_profiler_pipeline_stats** %pipelines, align 8, !tbaa !11
  %tobool.not56 = icmp eq %struct.halide_profiler_pipeline_stats* %p.055, null
  br i1 %tobool.not56, label %cleanup25, label %for.body

for.body:                                         ; preds = %if.end23, %entry
  %p.058 = phi %struct.halide_profiler_pipeline_stats* [ %p.0, %if.end23 ], [ %p.055, %entry ]
  %p_prev.057 = phi %struct.halide_profiler_pipeline_stats* [ %p.058, %if.end23 ], [ null, %entry ]
  %first_func_id = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %p.058, i32 0, i32 10
  %0 = load i32, i32* %first_func_id, align 4, !tbaa !247
  %cmp.not = icmp sgt i32 %0, %func_id
  br i1 %cmp.not, label %if.end23, label %land.lhs.true

land.lhs.true:                                    ; preds = %for.body
  %num_funcs = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %p.058, i32 0, i32 9
  %1 = load i32, i32* %num_funcs, align 8, !tbaa !222
  %add = add nsw i32 %1, %0
  %cmp2 = icmp sgt i32 %add, %func_id
  br i1 %cmp2, label %if.then, label %if.end23

if.then:                                          ; preds = %land.lhs.true
  %tobool3.not = icmp eq %struct.halide_profiler_pipeline_stats* %p_prev.057, null
  br i1 %tobool3.not, label %if.end, label %if.then4

if.then4:                                         ; preds = %if.then
  %next = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %p.058, i32 0, i32 8
  %2 = load i8*, i8** %next, align 8, !tbaa !243
  %next5 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %p_prev.057, i32 0, i32 8
  store i8* %2, i8** %next5, align 8, !tbaa !243
  %3 = bitcast i8** %next to %struct.halide_profiler_pipeline_stats**
  store %struct.halide_profiler_pipeline_stats* %p.055, %struct.halide_profiler_pipeline_stats** %3, align 8, !tbaa !243
  store %struct.halide_profiler_pipeline_stats* %p.058, %struct.halide_profiler_pipeline_stats** %pipelines, align 8, !tbaa !242
  br label %if.end

if.end:                                           ; preds = %if.then4, %if.then
  %funcs = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %p.058, i32 0, i32 7
  %4 = load %struct.halide_profiler_func_stats*, %struct.halide_profiler_func_stats** %funcs, align 8, !tbaa !223
  %add.ptr11.idx = sub i32 %func_id, %0
  %time12 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %4, i32 %add.ptr11.idx, i32 0
  %5 = load i64, i64* %time12, align 8, !tbaa !227
  %add13 = add i64 %5, %time
  store i64 %add13, i64* %time12, align 8, !tbaa !227
  %conv = sext i32 %active_threads to i64
  %active_threads_numerator = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %4, i32 %add.ptr11.idx, i32 5
  %6 = load i64, i64* %active_threads_numerator, align 8, !tbaa !232
  %add14 = add i64 %6, %conv
  store i64 %add14, i64* %active_threads_numerator, align 8, !tbaa !232
  %active_threads_denominator = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %4, i32 %add.ptr11.idx, i32 6
  %7 = load i64, i64* %active_threads_denominator, align 8, !tbaa !233
  %add15 = add i64 %7, 1
  store i64 %add15, i64* %active_threads_denominator, align 8, !tbaa !233
  %time16 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %p.058, i32 0, i32 0
  %8 = load i64, i64* %time16, align 8, !tbaa !212
  %add17 = add i64 %8, %time
  store i64 %add17, i64* %time16, align 8, !tbaa !212
  %samples = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %p.058, i32 0, i32 12
  %9 = load i32, i32* %samples, align 4, !tbaa !218
  %inc = add nsw i32 %9, 1
  store i32 %inc, i32* %samples, align 4, !tbaa !218
  %active_threads_numerator19 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %p.058, i32 0, i32 4
  %10 = load i64, i64* %active_threads_numerator19, align 8, !tbaa !215
  %add20 = add i64 %10, %conv
  store i64 %add20, i64* %active_threads_numerator19, align 8, !tbaa !215
  %active_threads_denominator21 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %p.058, i32 0, i32 5
  %11 = load i64, i64* %active_threads_denominator21, align 8, !tbaa !216
  %add22 = add i64 %11, 1
  store i64 %add22, i64* %active_threads_denominator21, align 8, !tbaa !216
  br label %cleanup25

if.end23:                                         ; preds = %land.lhs.true, %for.body
  %next24 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %p.058, i32 0, i32 8
  %12 = bitcast i8** %next24 to %struct.halide_profiler_pipeline_stats**
  %p.0 = load %struct.halide_profiler_pipeline_stats*, %struct.halide_profiler_pipeline_stats** %12, align 8, !tbaa !11
  %tobool.not = icmp eq %struct.halide_profiler_pipeline_stats* %p.0, null
  br i1 %tobool.not, label %cleanup25, label %for.body, !llvm.loop !252

cleanup25:                                        ; preds = %if.end23, %if.end, %entry
  ret void
}

; Function Attrs: mustprogress nounwind
define linkonce void @_ZN6Halide7Runtime8Internal24sampling_profiler_threadEPv(i8* %0) #0 {
entry:
  %func = alloca i32, align 4
  %active_threads = alloca i32, align 4
  %call = tail call %struct.halide_profiler_state* @halide_profiler_get_state() #13
  %lock = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %call, i32 0, i32 0
  tail call void @halide_mutex_lock(%struct.halide_mutex* %lock) #12
  %current_func = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %call, i32 0, i32 3
  %1 = bitcast i32* %func to i8*
  %2 = bitcast i32* %active_threads to i8*
  %get_remote_profiler_state = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %call, i32 0, i32 6
  %active_threads6 = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %call, i32 0, i32 4
  %sleep_time = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %call, i32 0, i32 1
  %3 = load i32, i32* %current_func, align 8, !tbaa !211
  %cmp.not39 = icmp eq i32 %3, -2
  br i1 %cmp.not39, label %while.end19, label %while.body

while.cond.loopexit:                              ; preds = %if.end
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %2) #10
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1) #10
  %4 = load i32, i32* %current_func, align 8, !tbaa !211
  %cmp.not = icmp eq i32 %4, -2
  br i1 %cmp.not, label %while.end19, label %while.body, !llvm.loop !253

while.body:                                       ; preds = %while.cond.loopexit, %entry
  %call1 = call i64 @halide_current_time_ns(i8* null) #12
  br label %while.cond2

while.cond2:                                      ; preds = %cleanup, %while.body
  %t.0 = phi i64 [ %call1, %while.body ], [ %call7, %cleanup ]
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %1) #10
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %2) #10
  %5 = load void (i32*, i32*)*, void (i32*, i32*)** %get_remote_profiler_state, align 8, !tbaa !254
  %tobool.not = icmp eq void (i32*, i32*)* %5, null
  br i1 %tobool.not, label %if.else, label %if.then

if.then:                                          ; preds = %while.cond2
  call void %5(i32* nonnull %func, i32* nonnull %active_threads) #12
  br label %if.end

if.else:                                          ; preds = %while.cond2
  %6 = load i32, i32* %current_func, align 8, !tbaa !211
  store i32 %6, i32* %func, align 4, !tbaa !79
  %7 = load i32, i32* %active_threads6, align 4, !tbaa !255
  store i32 %7, i32* %active_threads, align 4, !tbaa !79
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call7 = call i64 @halide_current_time_ns(i8* null) #12
  %8 = load i32, i32* %func, align 4, !tbaa !79
  %cmp8 = icmp eq i32 %8, -2
  br i1 %cmp8, label %while.cond.loopexit, label %if.else10

if.else10:                                        ; preds = %if.end
  %cmp11 = icmp sgt i32 %8, -1
  br i1 %cmp11, label %if.then12, label %cleanup

if.then12:                                        ; preds = %if.else10
  %sub = sub i64 %call7, %t.0
  %9 = load i32, i32* %active_threads, align 4, !tbaa !79
  call void @_ZN6Halide7Runtime8Internal9bill_funcEP21halide_profiler_stateiyi(%struct.halide_profiler_state* nonnull %call, i32 %8, i64 %sub, i32 %9) #13
  br label %cleanup

cleanup:                                          ; preds = %if.then12, %if.else10
  %10 = load i32, i32* %sleep_time, align 8, !tbaa !256
  call void @halide_mutex_unlock(%struct.halide_mutex* nonnull %lock) #12
  call void @halide_sleep_ms(i8* null, i32 %10) #12
  call void @halide_mutex_lock(%struct.halide_mutex* nonnull %lock) #12
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %2) #10
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1) #10
  br label %while.cond2

while.end19:                                      ; preds = %while.cond.loopexit, %entry
  call void @halide_mutex_unlock(%struct.halide_mutex* nonnull %lock) #12
  ret void
}

; Function Attrs: nounwind
define weak %struct.halide_profiler_pipeline_stats* @halide_profiler_get_pipeline_state(i8* %pipeline_name) local_unnamed_addr #3 {
entry:
  %call = tail call %struct.halide_profiler_state* @halide_profiler_get_state() #13
  %lock1 = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %call, i32 0, i32 0
  tail call void @halide_mutex_lock(%struct.halide_mutex* %lock1) #12
  %pipelines = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %call, i32 0, i32 5
  %p.012 = load %struct.halide_profiler_pipeline_stats*, %struct.halide_profiler_pipeline_stats** %pipelines, align 8, !tbaa !11
  %tobool.not13 = icmp eq %struct.halide_profiler_pipeline_stats* %p.012, null
  br i1 %tobool.not13, label %cleanup, label %for.body

for.body:                                         ; preds = %for.inc, %entry
  %p.014 = phi %struct.halide_profiler_pipeline_stats* [ %p.0, %for.inc ], [ %p.012, %entry ]
  %name = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %p.014, i32 0, i32 6
  %0 = load i8*, i8** %name, align 8, !tbaa !217
  %cmp = icmp eq i8* %0, %pipeline_name
  br i1 %cmp, label %cleanup, label %for.inc

for.inc:                                          ; preds = %for.body
  %next = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %p.014, i32 0, i32 8
  %1 = bitcast i8** %next to %struct.halide_profiler_pipeline_stats**
  %p.0 = load %struct.halide_profiler_pipeline_stats*, %struct.halide_profiler_pipeline_stats** %1, align 8, !tbaa !11
  %tobool.not = icmp eq %struct.halide_profiler_pipeline_stats* %p.0, null
  br i1 %tobool.not, label %cleanup, label %for.body, !llvm.loop !257

cleanup:                                          ; preds = %for.inc, %for.body, %entry
  %p.0.lcssa = phi %struct.halide_profiler_pipeline_stats* [ null, %entry ], [ null, %for.inc ], [ %p.014, %for.body ]
  tail call void @halide_mutex_unlock(%struct.halide_mutex* %lock1) #12
  ret %struct.halide_profiler_pipeline_stats* %p.0.lcssa
}

; Function Attrs: nounwind
define weak i32 @halide_profiler_pipeline_start(i8* %user_context, i8* %pipeline_name, i32 %num_funcs, i64* %func_names) local_unnamed_addr #3 {
entry:
  %call = tail call %struct.halide_profiler_state* @halide_profiler_get_state() #13
  %lock1 = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %call, i32 0, i32 0
  tail call void @halide_mutex_lock(%struct.halide_mutex* %lock1) #12
  %sampling_thread = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %call, i32 0, i32 7
  %0 = load %struct.halide_thread*, %struct.halide_thread** %sampling_thread, align 8, !tbaa !209
  %tobool.not = icmp eq %struct.halide_thread* %0, null
  br i1 %tobool.not, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call2 = tail call i32 @halide_start_clock(i8* %user_context) #12
  %call3 = tail call %struct.halide_thread* @halide_spawn_thread(void (i8*)* nonnull @_ZN6Halide7Runtime8Internal24sampling_profiler_threadEPv, i8* null) #12
  store %struct.halide_thread* %call3, %struct.halide_thread** %sampling_thread, align 8, !tbaa !209
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %call5 = tail call %struct.halide_profiler_pipeline_stats* @_ZN6Halide7Runtime8Internal23find_or_create_pipelineEPKciPKy(i8* %pipeline_name, i32 %num_funcs, i64* %func_names) #13
  %tobool6.not = icmp eq %struct.halide_profiler_pipeline_stats* %call5, null
  br i1 %tobool6.not, label %if.then7, label %if.end9

if.then7:                                         ; preds = %if.end
  %call8 = tail call i32 @halide_error_out_of_memory(i8* %user_context) #12
  br label %cleanup

if.end9:                                          ; preds = %if.end
  %runs = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %call5, i32 0, i32 11
  %1 = load i32, i32* %runs, align 8, !tbaa !214
  %inc = add nsw i32 %1, 1
  store i32 %inc, i32* %runs, align 8, !tbaa !214
  %first_func_id = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %call5, i32 0, i32 10
  %2 = load i32, i32* %first_func_id, align 4, !tbaa !247
  br label %cleanup

cleanup:                                          ; preds = %if.end9, %if.then7
  %retval.0 = phi i32 [ %2, %if.end9 ], [ %call8, %if.then7 ]
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull %lock1) #12
  ret i32 %retval.0
}

; Function Attrs: mustprogress nounwind
define weak void @halide_profiler_stack_peak_update(i8* %user_context, i8* %pipeline_state, i64* %f_values) local_unnamed_addr #0 {
entry:
  %cmp.not = icmp eq i8* %pipeline_state, null
  br i1 %cmp.not, label %if.then, label %do.end

if.then:                                          ; preds = %entry
  tail call void @halide_print(i8* %user_context, i8* getelementptr inbounds ([103 x i8], [103 x i8]* @.str.111, i32 0, i32 0)) #12
  tail call void @abort() #12
  br label %do.end

do.end:                                           ; preds = %if.then, %entry
  %num_funcs = getelementptr inbounds i8, i8* %pipeline_state, i32 72
  %0 = bitcast i8* %num_funcs to i32*
  %funcs = getelementptr inbounds i8, i8* %pipeline_state, i32 56
  %1 = bitcast i8* %funcs to %struct.halide_profiler_func_stats**
  %2 = load i32, i32* %0, align 8, !tbaa !222
  %cmp118 = icmp sgt i32 %2, 0
  br i1 %cmp118, label %for.body, label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.inc, %do.end
  ret void

for.body:                                         ; preds = %for.inc, %do.end
  %3 = phi i32 [ %10, %for.inc ], [ %2, %do.end ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %do.end ]
  %4 = trunc i64 %indvars.iv to i32
  %arrayidx = getelementptr inbounds i64, i64* %f_values, i32 %4
  %5 = load i64, i64* %arrayidx, align 8, !tbaa !19
  %cmp2.not = icmp eq i64 %5, 0
  br i1 %cmp2.not, label %for.inc, label %if.then3

if.then3:                                         ; preds = %for.body
  %6 = load %struct.halide_profiler_func_stats*, %struct.halide_profiler_func_stats** %1, align 8, !tbaa !223
  %stack_peak = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %6, i32 %4, i32 4
  %7 = load i64, i64* %stack_peak, align 8, !tbaa !19
  br label %while.cond.i

while.cond.i:                                     ; preds = %while.body.i, %if.then3
  %old_val.0.i = phi i64 [ %7, %if.then3 ], [ %9, %while.body.i ]
  %cmp.i = icmp ult i64 %old_val.0.i, %5
  br i1 %cmp.i, label %while.body.i, label %for.inc.loopexit

while.body.i:                                     ; preds = %while.cond.i
  %8 = cmpxchg i64* %stack_peak, i64 %old_val.0.i, i64 %5 seq_cst seq_cst, align 8
  %9 = extractvalue { i64, i1 } %8, 0
  %cmp1.i = icmp eq i64 %old_val.0.i, %9
  br i1 %cmp1.i, label %for.inc.loopexit, label %while.cond.i, !llvm.loop !258

for.inc.loopexit:                                 ; preds = %while.body.i, %while.cond.i
  %.pre = load i32, i32* %0, align 8, !tbaa !222
  br label %for.inc

for.inc:                                          ; preds = %for.inc.loopexit, %for.body
  %10 = phi i32 [ %.pre, %for.inc.loopexit ], [ %3, %for.body ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %11 = sext i32 %10 to i64
  %cmp1 = icmp slt i64 %indvars.iv.next, %11
  br i1 %cmp1, label %for.body, label %for.cond.cleanup, !llvm.loop !259
}

; Function Attrs: mustprogress nounwind
define weak void @halide_profiler_memory_allocate(i8* %user_context, i8* %pipeline_state, i32 %func_id, i64 %incr) local_unnamed_addr #0 {
entry:
  %cmp = icmp eq i64 %incr, 0
  br i1 %cmp, label %return, label %if.end

if.end:                                           ; preds = %entry
  %cmp1.not = icmp eq i8* %pipeline_state, null
  br i1 %cmp1.not, label %if.then2, label %do.body4

if.then2:                                         ; preds = %if.end
  tail call void @halide_print(i8* %user_context, i8* getelementptr inbounds ([103 x i8], [103 x i8]* @.str.1.112, i32 0, i32 0)) #12
  tail call void @abort() #12
  br label %do.body4

do.body4:                                         ; preds = %if.then2, %if.end
  %cmp5 = icmp sgt i32 %func_id, -1
  br i1 %cmp5, label %do.body10, label %if.then6

if.then6:                                         ; preds = %do.body4
  tail call void @halide_print(i8* %user_context, i8* getelementptr inbounds ([97 x i8], [97 x i8]* @.str.2.113, i32 0, i32 0)) #12
  tail call void @abort() #12
  br label %do.body10

do.body10:                                        ; preds = %if.then6, %do.body4
  %num_funcs = getelementptr inbounds i8, i8* %pipeline_state, i32 72
  %0 = bitcast i8* %num_funcs to i32*
  %1 = load i32, i32* %0, align 8, !tbaa !222
  %cmp11 = icmp sgt i32 %1, %func_id
  br i1 %cmp11, label %do.end15, label %if.then12

if.then12:                                        ; preds = %do.body10
  tail call void @halide_print(i8* %user_context, i8* getelementptr inbounds ([113 x i8], [113 x i8]* @.str.3.114, i32 0, i32 0)) #12
  tail call void @abort() #12
  br label %do.end15

do.end15:                                         ; preds = %if.then12, %do.body10
  %funcs = getelementptr inbounds i8, i8* %pipeline_state, i32 56
  %2 = bitcast i8* %funcs to %struct.halide_profiler_func_stats**
  %3 = load %struct.halide_profiler_func_stats*, %struct.halide_profiler_func_stats** %2, align 8, !tbaa !223
  %num_allocs = getelementptr inbounds i8, i8* %pipeline_state, i32 88
  %4 = bitcast i8* %num_allocs to i32*
  %5 = atomicrmw add i32* %4, i32 1 seq_cst, align 4
  %memory_total = getelementptr inbounds i8, i8* %pipeline_state, i32 24
  %6 = bitcast i8* %memory_total to i64*
  %7 = atomicrmw add i64* %6, i64 %incr seq_cst, align 8
  %memory_current = getelementptr inbounds i8, i8* %pipeline_state, i32 8
  %8 = bitcast i8* %memory_current to i64*
  %9 = atomicrmw add i64* %8, i64 %incr seq_cst, align 8
  %10 = add i64 %9, %incr
  %memory_peak = getelementptr inbounds i8, i8* %pipeline_state, i32 16
  %11 = bitcast i8* %memory_peak to i64*
  %12 = load i64, i64* %11, align 8, !tbaa !19
  br label %while.cond.i

while.cond.i:                                     ; preds = %while.body.i, %do.end15
  %old_val.0.i = phi i64 [ %12, %do.end15 ], [ %14, %while.body.i ]
  %cmp.i = icmp ult i64 %old_val.0.i, %10
  br i1 %cmp.i, label %while.body.i, label %_ZN12_GLOBAL__N_125sync_compare_max_and_swapIyEEvPT_S1_.exit

while.body.i:                                     ; preds = %while.cond.i
  %13 = cmpxchg i64* %11, i64 %old_val.0.i, i64 %10 seq_cst seq_cst, align 8
  %14 = extractvalue { i64, i1 } %13, 0
  %cmp1.i = icmp eq i64 %old_val.0.i, %14
  br i1 %cmp1.i, label %_ZN12_GLOBAL__N_125sync_compare_max_and_swapIyEEvPT_S1_.exit, label %while.cond.i, !llvm.loop !258

_ZN12_GLOBAL__N_125sync_compare_max_and_swapIyEEvPT_S1_.exit: ; preds = %while.body.i, %while.cond.i
  %num_allocs16 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %3, i32 %func_id, i32 8
  %15 = atomicrmw add i32* %num_allocs16, i32 1 seq_cst, align 4
  %memory_total17 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %3, i32 %func_id, i32 3
  %16 = atomicrmw add i64* %memory_total17, i64 %incr seq_cst, align 8
  %memory_current18 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %3, i32 %func_id, i32 1
  %17 = atomicrmw add i64* %memory_current18, i64 %incr seq_cst, align 8
  %18 = add i64 %17, %incr
  %memory_peak19 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %3, i32 %func_id, i32 2
  %19 = load i64, i64* %memory_peak19, align 8, !tbaa !19
  br label %while.cond.i43

while.cond.i43:                                   ; preds = %while.body.i45, %_ZN12_GLOBAL__N_125sync_compare_max_and_swapIyEEvPT_S1_.exit
  %old_val.0.i41 = phi i64 [ %19, %_ZN12_GLOBAL__N_125sync_compare_max_and_swapIyEEvPT_S1_.exit ], [ %21, %while.body.i45 ]
  %cmp.i42 = icmp ult i64 %old_val.0.i41, %18
  br i1 %cmp.i42, label %while.body.i45, label %return

while.body.i45:                                   ; preds = %while.cond.i43
  %20 = cmpxchg i64* %memory_peak19, i64 %old_val.0.i41, i64 %18 seq_cst seq_cst, align 8
  %21 = extractvalue { i64, i1 } %20, 0
  %cmp1.i44 = icmp eq i64 %old_val.0.i41, %21
  br i1 %cmp1.i44, label %return, label %while.cond.i43, !llvm.loop !258

return:                                           ; preds = %while.body.i45, %while.cond.i43, %entry
  ret void
}

; Function Attrs: mustprogress nounwind
define weak void @halide_profiler_memory_free(i8* %user_context, i8* %pipeline_state, i32 %func_id, i64 %decr) local_unnamed_addr #0 {
entry:
  %cmp = icmp eq i64 %decr, 0
  br i1 %cmp, label %return, label %if.end

if.end:                                           ; preds = %entry
  %cmp1.not = icmp eq i8* %pipeline_state, null
  br i1 %cmp1.not, label %if.then2, label %do.body4

if.then2:                                         ; preds = %if.end
  tail call void @halide_print(i8* %user_context, i8* getelementptr inbounds ([103 x i8], [103 x i8]* @.str.4.115, i32 0, i32 0)) #12
  tail call void @abort() #12
  br label %do.body4

do.body4:                                         ; preds = %if.then2, %if.end
  %cmp5 = icmp sgt i32 %func_id, -1
  br i1 %cmp5, label %do.body10, label %if.then6

if.then6:                                         ; preds = %do.body4
  tail call void @halide_print(i8* %user_context, i8* getelementptr inbounds ([97 x i8], [97 x i8]* @.str.5.116, i32 0, i32 0)) #12
  tail call void @abort() #12
  br label %do.body10

do.body10:                                        ; preds = %if.then6, %do.body4
  %num_funcs = getelementptr inbounds i8, i8* %pipeline_state, i32 72
  %0 = bitcast i8* %num_funcs to i32*
  %1 = load i32, i32* %0, align 8, !tbaa !222
  %cmp11 = icmp sgt i32 %1, %func_id
  br i1 %cmp11, label %do.end15, label %if.then12

if.then12:                                        ; preds = %do.body10
  tail call void @halide_print(i8* %user_context, i8* getelementptr inbounds ([113 x i8], [113 x i8]* @.str.6.117, i32 0, i32 0)) #12
  tail call void @abort() #12
  br label %do.end15

do.end15:                                         ; preds = %if.then12, %do.body10
  %funcs = getelementptr inbounds i8, i8* %pipeline_state, i32 56
  %2 = bitcast i8* %funcs to %struct.halide_profiler_func_stats**
  %3 = load %struct.halide_profiler_func_stats*, %struct.halide_profiler_func_stats** %2, align 8, !tbaa !223
  %memory_current = getelementptr inbounds i8, i8* %pipeline_state, i32 8
  %4 = bitcast i8* %memory_current to i64*
  %5 = atomicrmw sub i64* %4, i64 %decr seq_cst, align 8
  %memory_current16 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %3, i32 %func_id, i32 1
  %6 = atomicrmw sub i64* %memory_current16, i64 %decr seq_cst, align 8
  br label %return

return:                                           ; preds = %do.end15, %entry
  ret void
}

; Function Attrs: nounwind
define weak void @halide_profiler_report(i8* %user_context) local_unnamed_addr #3 {
entry:
  %call = tail call %struct.halide_profiler_state* @halide_profiler_get_state() #13
  %lock1 = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %call, i32 0, i32 0
  tail call void @halide_mutex_lock(%struct.halide_mutex* %lock1) #12
  tail call void @halide_profiler_report_unlocked(i8* %user_context, %struct.halide_profiler_state* %call) #13
  tail call void @halide_mutex_unlock(%struct.halide_mutex* %lock1) #12
  ret void
}

; Function Attrs: nounwind
define weak void @halide_profiler_reset() local_unnamed_addr #3 {
entry:
  %call = tail call %struct.halide_profiler_state* @halide_profiler_get_state() #13
  %lock1 = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %call, i32 0, i32 0
  tail call void @halide_mutex_lock(%struct.halide_mutex* %lock1) #12
  tail call void @halide_profiler_reset_unlocked(%struct.halide_profiler_state* %call) #13
  tail call void @halide_mutex_unlock(%struct.halide_mutex* %lock1) #12
  ret void
}

; Function Attrs: mustprogress nounwind
define weak void @halide_profiler_pipeline_end(i8* %user_context, i8* %state) local_unnamed_addr #0 {
entry:
  %current_func = getelementptr inbounds i8, i8* %state, i32 16
  %0 = bitcast i8* %current_func to i32*
  store i32 -1, i32* %0, align 8, !tbaa !211
  ret void
}

; Function Attrs: mustprogress nounwind
define weak i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* %ptr, i64 %len) local_unnamed_addr #0 {
entry:
  ret i32 0
}

; Function Attrs: mustprogress nounwind
define weak i32 @halide_msan_check_memory_is_initialized(i8* %user_context, i8* %ptr, i64 %len, i8* %name) local_unnamed_addr #0 {
entry:
  ret i32 0
}

; Function Attrs: mustprogress nounwind
define weak i32 @halide_msan_check_buffer_is_initialized(i8* %user_context, %struct.halide_buffer_t* %b, i8* %buf_name) local_unnamed_addr #0 {
entry:
  ret i32 0
}

; Function Attrs: mustprogress nounwind
define weak i32 @halide_msan_annotate_buffer_is_initialized(i8* %user_context, %struct.halide_buffer_t* %b) local_unnamed_addr #0 {
entry:
  ret i32 0
}

; Function Attrs: mustprogress nounwind
define weak void @halide_msan_annotate_buffer_is_initialized_as_destructor(i8* %user_context, i8* %b) local_unnamed_addr #0 {
entry:
  ret void
}

; Function Attrs: nounwind
define weak i32 @halide_qurt_hvx_lock(i8* %user_context) local_unnamed_addr #3 {
entry:
  %call = tail call i32 @qurt_hvx_lock(i32 1) #12
  %cmp.not = icmp eq i32 %call, 0
  br i1 %cmp.not, label %cleanup, label %if.then

if.then:                                          ; preds = %entry
  %call.i = tail call i8* @malloc(i64 1024) #12
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %if.then
  %call.i1731 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.4.122, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %if.then
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !15
  %call.i17 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.4.122, i32 0, i32 0)) #12
  %0 = ptrtoint i8* %call.i17 to i32
  %sub.ptr.lhs.cast.i.i = zext i32 %0 to i64
  %1 = ptrtoint i8* %call.i to i32
  %sub.ptr.rhs.cast.i.i = zext i32 %1 to i64
  %sub.ptr.sub.i.i = sub nsw i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add nsw i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  %.sink10.i = phi i8* [ %call.i, %if.else.i ], [ getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.123, i32 0, i32 0), %if.then.i ]
  tail call void @halide_error(i8* %user_context, i8* nonnull %.sink10.i) #12
  tail call void @free(i8* %call.i) #12
  br label %cleanup

cleanup:                                          ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit, %entry
  %retval.0 = phi i32 [ -1, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit ], [ 0, %entry ]
  ret i32 %retval.0
}

declare i32 @qurt_hvx_lock(i32) local_unnamed_addr #1

; Function Attrs: nounwind
define weak i32 @halide_qurt_hvx_unlock(i8* %user_context) local_unnamed_addr #3 {
entry:
  %call = tail call i32 @qurt_hvx_unlock() #12
  %cmp.not = icmp eq i32 %call, 0
  br i1 %cmp.not, label %cleanup, label %if.then

if.then:                                          ; preds = %entry
  %call.i = tail call i8* @malloc(i64 1024) #12
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %if.then
  %call.i1327 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.6.124, i32 0, i32 0)) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %if.then
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !15
  %call.i13 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.6.124, i32 0, i32 0)) #12
  %0 = ptrtoint i8* %call.i13 to i32
  %sub.ptr.lhs.cast.i.i = zext i32 %0 to i64
  %1 = ptrtoint i8* %call.i to i32
  %sub.ptr.rhs.cast.i.i = zext i32 %1 to i64
  %sub.ptr.sub.i.i = sub nsw i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add nsw i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #12
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  %.sink10.i = phi i8* [ %call.i, %if.else.i ], [ getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.123, i32 0, i32 0), %if.then.i ]
  tail call void @halide_error(i8* %user_context, i8* nonnull %.sink10.i) #12
  tail call void @free(i8* %call.i) #12
  br label %cleanup

cleanup:                                          ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit, %entry
  %retval.0 = phi i32 [ -1, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit ], [ 0, %entry ]
  ret i32 %retval.0
}

declare i32 @qurt_hvx_unlock() local_unnamed_addr #1

; Function Attrs: mustprogress nounwind
define weak void @halide_qurt_hvx_unlock_as_destructor(i8* %user_context, i8* %0) local_unnamed_addr #0 {
entry:
  %call = tail call i32 @halide_qurt_hvx_unlock(i8* %user_context) #13
  ret void
}

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32>) #8

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32>) #8

; Function Attrs: nounwind readnone
declare <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32>, <32 x i32>) #8

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.vshufeh.128B(<32 x i32>, <32 x i32>) #8

; Function Attrs: nounwind readnone
declare <64 x i32> @llvm.hexagon.V6.vmpyuhv.128B(<32 x i32>, <32 x i32>) #8

; Function Attrs: nounwind
define weak i32 @halide_default_can_use_target_features(i32 %count, i64* %features) #3 {
entry:
  %tmp = alloca %"struct.Halide::Runtime::Internal::CpuFeatures", align 8
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE) #12
  %0 = load i8, i8* @_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE, align 1, !tbaa !16, !range !18
  %tobool.not = icmp eq i8 %0, 0
  br i1 %tobool.not, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = bitcast %"struct.Halide::Runtime::Internal::CpuFeatures"* %tmp to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %1) #10
  call void @_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv(%"struct.Halide::Runtime::Internal::CpuFeatures"* nonnull sret(%"struct.Halide::Runtime::Internal::CpuFeatures") align 8 %tmp) #12
  %call = call i8* @memcpy(i8* bitcast ([4 x i64]* @_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE to i8*), i8* nonnull %1, i64 32) #12
  store i8 1, i8* @_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE, align 1, !tbaa !16
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %1) #10
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE) #12
  %cmp.not = icmp eq i32 %count, 2
  br i1 %cmp.not, label %if.end2, label %if.then1

if.then1:                                         ; preds = %if.end
  call void @halide_error(i8* null, i8* getelementptr inbounds ([81 x i8], [81 x i8]* @.str.125, i32 0, i32 0)) #12
  br label %if.end2

if.end2:                                          ; preds = %if.then1, %if.end
  %2 = load i64, i64* %features, align 8, !tbaa !19
  %3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE, i32 0, i32 0), align 8, !tbaa !19
  %and = and i64 %3, %2
  %cmp6.not = icmp eq i64 %and, 0
  br i1 %cmp6.not, label %for.inc.critedge, label %if.then7

if.then7:                                         ; preds = %if.end2
  %4 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE, i32 0, i32 2), align 8, !tbaa !19
  %and10 = and i64 %4, %and
  %cmp11.not = icmp eq i64 %and10, %and
  br i1 %cmp11.not, label %for.inc.critedge, label %cleanup15

for.inc.critedge:                                 ; preds = %if.then7, %if.end2
  %arrayidx.1 = getelementptr inbounds i64, i64* %features, i32 1
  %5 = load i64, i64* %arrayidx.1, align 8, !tbaa !19
  %6 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE, i32 0, i32 1), align 8, !tbaa !19
  %and.1 = and i64 %6, %5
  %cmp6.not.1 = icmp eq i64 %and.1, 0
  br i1 %cmp6.not.1, label %for.inc.critedge.1, label %if.then7.1

cleanup15:                                        ; preds = %for.inc.critedge.1, %if.then7.1, %if.then7
  %cmp3.lcssa = phi i32 [ 0, %if.then7 ], [ 0, %if.then7.1 ], [ 1, %for.inc.critedge.1 ]
  ret i32 %cmp3.lcssa

if.then7.1:                                       ; preds = %for.inc.critedge
  %7 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE, i32 0, i32 3), align 8, !tbaa !19
  %and10.1 = and i64 %7, %and.1
  %cmp11.not.1 = icmp eq i64 %and10.1, %and.1
  br i1 %cmp11.not.1, label %for.inc.critedge.1, label %cleanup15

for.inc.critedge.1:                               ; preds = %if.then7.1, %for.inc.critedge
  br label %cleanup15
}

; Function Attrs: mustprogress nounwind
define weak i32 (i32, i64*)* @halide_set_custom_can_use_target_features(i32 (i32, i64*)* %fn) local_unnamed_addr #0 {
entry:
  %0 = load i32 (i32, i64*)*, i32 (i32, i64*)** @_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE, align 8, !tbaa !11
  store i32 (i32, i64*)* %fn, i32 (i32, i64*)** @_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE, align 8, !tbaa !11
  ret i32 (i32, i64*)* %0
}

; Function Attrs: mustprogress nounwind
define weak i32 @halide_can_use_target_features(i32 %count, i64* %features) local_unnamed_addr #0 {
entry:
  %0 = load i32 (i32, i64*)*, i32 (i32, i64*)** @_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE, align 8, !tbaa !11
  %call = tail call i32 %0(i32 %count, i64* %features) #12
  ret i32 %call
}

; Function Attrs: nounwind
define linkonce void @_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv(%"struct.Halide::Runtime::Internal::CpuFeatures"* noalias sret(%"struct.Halide::Runtime::Internal::CpuFeatures") align 8 %agg.result) local_unnamed_addr #3 {
entry:
  %arrayidx.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::CpuFeatures", %"struct.Halide::Runtime::Internal::CpuFeatures"* %agg.result, i32 0, i32 0, i32 0
  store i64 0, i64* %arrayidx.i, align 8, !tbaa !19
  %arrayidx3.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::CpuFeatures", %"struct.Halide::Runtime::Internal::CpuFeatures"* %agg.result, i32 0, i32 1, i32 0
  store i64 0, i64* %arrayidx3.i, align 8, !tbaa !19
  %arrayidx.1.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::CpuFeatures", %"struct.Halide::Runtime::Internal::CpuFeatures"* %agg.result, i32 0, i32 0, i32 1
  store i64 0, i64* %arrayidx.1.i, align 8, !tbaa !19
  %arrayidx3.1.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::CpuFeatures", %"struct.Halide::Runtime::Internal::CpuFeatures"* %agg.result, i32 0, i32 1, i32 1
  store i64 0, i64* %arrayidx3.1.i, align 8, !tbaa !19
  ret void
}

; Function Attrs: mustprogress nounwind
define weak void @halide_use_jit_module() local_unnamed_addr #0 {
entry:
  ret void
}

; Function Attrs: mustprogress nounwind
define weak void @halide_release_jit_module() local_unnamed_addr #0 {
entry:
  ret void
}

; Function Attrs: nounwind
define i32 @matmul(%struct.halide_buffer_t* noalias %A.buffer, %struct.halide_buffer_t* noalias %B.buffer, %struct.halide_buffer_t* noalias %out.buffer) local_unnamed_addr #9 {
entry:
  %0 = alloca %closure_t, align 4
  %1 = alloca [8 x i32], align 4
  %2 = alloca [8 x i32], align 4
  %3 = alloca [8 x i32], align 4
  %.not = icmp eq %struct.halide_buffer_t* %out.buffer, null
  br i1 %.not, label %"assert failed", label %"assert succeeded", !prof !260

"assert failed":                                  ; preds = %entry
  %4 = tail call i32 @halide_error_buffer_argument_is_null(i8* null, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str, i32 0, i32 0)) #10
  br label %common.ret

"assert succeeded":                               ; preds = %entry
  %.not49 = icmp eq %struct.halide_buffer_t* %B.buffer, null
  br i1 %.not49, label %"assert failed1", label %"assert succeeded2", !prof !260

common.ret:                                       ; preds = %"for out.s0.__outermost", %assert_failed45, %assert_failed44, %assert_failed43, %assert_failed42, %assert_failed41, %assert_failed40, %assert_failed39, %assert_failed38, %assert_failed37, %assert_failed36, %assert_failed35, %assert_failed33, %assert_failed32, %assert_failed31, %assert_failed30, %assert_failed29, %assert_failed28, %assert_failed27, %assert_failed26, %assert_failed25, %assert_failed24, %assert_failed23, %assert_failed22, %assert_failed21, %assert_failed20, %assert_failed19, %assert_failed18, %assert_failed17, %assert_failed16, %assert_failed15, %assert_failed14, %assert_failed, %_halide_buffer_is_bounds_query.exit167, %"assert failed3", %"assert failed1", %"assert failed"
  %common.ret.op = phi i32 [ %233, %assert_failed ], [ %234, %assert_failed14 ], [ %235, %assert_failed15 ], [ %236, %assert_failed16 ], [ %237, %assert_failed17 ], [ %238, %assert_failed18 ], [ %240, %assert_failed19 ], [ %241, %assert_failed20 ], [ %243, %assert_failed21 ], [ %244, %assert_failed22 ], [ %246, %assert_failed23 ], [ %247, %assert_failed24 ], [ %249, %assert_failed25 ], [ %250, %assert_failed26 ], [ %252, %assert_failed27 ], [ %253, %assert_failed28 ], [ %255, %assert_failed29 ], [ %256, %assert_failed30 ], [ %257, %assert_failed31 ], [ %258, %assert_failed32 ], [ %259, %assert_failed33 ], [ %260, %assert_failed35 ], [ %261, %assert_failed36 ], [ %262, %assert_failed37 ], [ %263, %assert_failed38 ], [ %264, %assert_failed39 ], [ %265, %assert_failed40 ], [ %266, %assert_failed41 ], [ %267, %assert_failed42 ], [ %268, %assert_failed43 ], [ %270, %assert_failed44 ], [ %272, %assert_failed45 ], [ %4, %"assert failed" ], [ %5, %"assert failed1" ], [ %6, %"assert failed3" ], [ 0, %_halide_buffer_is_bounds_query.exit167 ], [ %287, %"for out.s0.__outermost" ]
  ret i32 %common.ret.op

"assert failed1":                                 ; preds = %"assert succeeded"
  %5 = tail call i32 @halide_error_buffer_argument_is_null(i8* null, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.132, i32 0, i32 0)) #10
  br label %common.ret

"assert succeeded2":                              ; preds = %"assert succeeded"
  %.not50 = icmp eq %struct.halide_buffer_t* %A.buffer, null
  br i1 %.not50, label %"assert failed3", label %"assert succeeded4", !prof !260

"assert failed3":                                 ; preds = %"assert succeeded2"
  %6 = tail call i32 @halide_error_buffer_argument_is_null(i8* null, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.133, i32 0, i32 0)) #10
  br label %common.ret

"assert succeeded4":                              ; preds = %"assert succeeded2"
  %host.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %A.buffer, i32 0, i32 2
  %7 = load i8*, i8** %host.i, align 8, !tbaa !157
  %code.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %A.buffer, i32 0, i32 4, i32 0
  %8 = load i8, i8* %code.i.i, align 2, !tbaa !148
  %conv.i.i = zext i8 %8 to i32
  %bits.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %A.buffer, i32 0, i32 4, i32 1
  %9 = load i8, i8* %bits.i.i, align 1, !tbaa !152
  %conv3.i.i = zext i8 %9 to i32
  %shl.i.i = shl nuw nsw i32 %conv3.i.i, 8
  %or.i.i = or i32 %shl.i.i, %conv.i.i
  %lanes.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %A.buffer, i32 0, i32 4, i32 2
  %10 = load i16, i16* %lanes.i.i, align 2, !tbaa !153
  %conv4.i.i = zext i16 %10 to i32
  %shl5.i.i = shl nuw i32 %conv4.i.i, 16
  %or6.i.i = or i32 %or.i.i, %shl5.i.i
  %dimensions.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %A.buffer, i32 0, i32 5
  %11 = load i32, i32* %dimensions.i, align 4, !tbaa !159
  %dim.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %A.buffer, i32 0, i32 6
  %12 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim.i, align 8, !tbaa !160
  %min.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %12, i32 0, i32 0
  %13 = load i32, i32* %min.i, align 4, !tbaa !161
  %extent.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %12, i32 0, i32 1
  %14 = load i32, i32* %extent.i, align 4, !tbaa !163
  %stride.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %12, i32 0, i32 2
  %15 = load i32, i32* %stride.i, align 4, !tbaa !164
  %min.i62 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %12, i32 1, i32 0
  %16 = load i32, i32* %min.i62, align 4, !tbaa !161
  %extent.i64 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %12, i32 1, i32 1
  %17 = load i32, i32* %extent.i64, align 4, !tbaa !163
  %stride.i66 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %12, i32 1, i32 2
  %18 = load i32, i32* %stride.i66, align 4, !tbaa !164
  %host.i67 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %B.buffer, i32 0, i32 2
  %19 = load i8*, i8** %host.i67, align 8, !tbaa !157
  %code.i.i68 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %B.buffer, i32 0, i32 4, i32 0
  %20 = load i8, i8* %code.i.i68, align 2, !tbaa !148
  %conv.i.i69 = zext i8 %20 to i32
  %bits.i.i70 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %B.buffer, i32 0, i32 4, i32 1
  %21 = load i8, i8* %bits.i.i70, align 1, !tbaa !152
  %conv3.i.i71 = zext i8 %21 to i32
  %shl.i.i72 = shl nuw nsw i32 %conv3.i.i71, 8
  %or.i.i73 = or i32 %shl.i.i72, %conv.i.i69
  %lanes.i.i74 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %B.buffer, i32 0, i32 4, i32 2
  %22 = load i16, i16* %lanes.i.i74, align 2, !tbaa !153
  %conv4.i.i75 = zext i16 %22 to i32
  %shl5.i.i76 = shl nuw i32 %conv4.i.i75, 16
  %or6.i.i77 = or i32 %or.i.i73, %shl5.i.i76
  %dimensions.i78 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %B.buffer, i32 0, i32 5
  %23 = load i32, i32* %dimensions.i78, align 4, !tbaa !159
  %dim.i79 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %B.buffer, i32 0, i32 6
  %24 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim.i79, align 8, !tbaa !160
  %min.i80 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %24, i32 0, i32 0
  %25 = load i32, i32* %min.i80, align 4, !tbaa !161
  %extent.i82 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %24, i32 0, i32 1
  %26 = load i32, i32* %extent.i82, align 4, !tbaa !163
  %stride.i84 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %24, i32 0, i32 2
  %27 = load i32, i32* %stride.i84, align 4, !tbaa !164
  %min.i86 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %24, i32 1, i32 0
  %28 = load i32, i32* %min.i86, align 4, !tbaa !161
  %extent.i88 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %24, i32 1, i32 1
  %29 = load i32, i32* %extent.i88, align 4, !tbaa !163
  %stride.i90 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %24, i32 1, i32 2
  %30 = load i32, i32* %stride.i90, align 4, !tbaa !164
  %host.i91 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %out.buffer, i32 0, i32 2
  %31 = load i8*, i8** %host.i91, align 8, !tbaa !157
  %code.i.i92 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %out.buffer, i32 0, i32 4, i32 0
  %32 = load i8, i8* %code.i.i92, align 2, !tbaa !148
  %conv.i.i93 = zext i8 %32 to i32
  %bits.i.i94 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %out.buffer, i32 0, i32 4, i32 1
  %33 = load i8, i8* %bits.i.i94, align 1, !tbaa !152
  %conv3.i.i95 = zext i8 %33 to i32
  %shl.i.i96 = shl nuw nsw i32 %conv3.i.i95, 8
  %or.i.i97 = or i32 %shl.i.i96, %conv.i.i93
  %lanes.i.i98 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %out.buffer, i32 0, i32 4, i32 2
  %34 = load i16, i16* %lanes.i.i98, align 2, !tbaa !153
  %conv4.i.i99 = zext i16 %34 to i32
  %shl5.i.i100 = shl nuw i32 %conv4.i.i99, 16
  %or6.i.i101 = or i32 %or.i.i97, %shl5.i.i100
  %dimensions.i102 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %out.buffer, i32 0, i32 5
  %35 = load i32, i32* %dimensions.i102, align 4, !tbaa !159
  %dim.i103 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %out.buffer, i32 0, i32 6
  %36 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim.i103, align 8, !tbaa !160
  %min.i104 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %36, i32 0, i32 0
  %37 = load i32, i32* %min.i104, align 4, !tbaa !161
  %extent.i106 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %36, i32 0, i32 1
  %38 = load i32, i32* %extent.i106, align 4, !tbaa !163
  %stride.i108 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %36, i32 0, i32 2
  %39 = load i32, i32* %stride.i108, align 4, !tbaa !164
  %min.i110 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %36, i32 1, i32 0
  %40 = load i32, i32* %min.i110, align 4, !tbaa !161
  %extent.i112 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %36, i32 1, i32 1
  %41 = load i32, i32* %extent.i112, align 4, !tbaa !163
  %stride.i114 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %36, i32 1, i32 2
  %42 = load i32, i32* %stride.i114, align 4, !tbaa !164
  %cmp.i = icmp eq i8* %7, null
  br i1 %cmp.i, label %_halide_buffer_is_bounds_query.exit, label %after_bb

_halide_buffer_is_bounds_query.exit:              ; preds = %"assert succeeded4"
  %device.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %A.buffer, i32 0, i32 0
  %43 = load i64, i64* %device.i, align 8, !tbaa !154
  %cmp1.i = icmp eq i64 %43, 0
  br i1 %cmp1.i, label %_halide_buffer_init.exit, label %after_bb

after_bb:                                         ; preds = %_halide_buffer_init.exit, %_halide_buffer_is_bounds_query.exit, %"assert succeeded4"
  %44 = phi i8* [ %19, %"assert succeeded4" ], [ %19, %_halide_buffer_is_bounds_query.exit ], [ %.pre, %_halide_buffer_init.exit ]
  %cmp.i117 = icmp eq i8* %44, null
  br i1 %cmp.i117, label %_halide_buffer_is_bounds_query.exit121, label %after_bb5

_halide_buffer_is_bounds_query.exit121:           ; preds = %after_bb
  %device.i118 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %B.buffer, i32 0, i32 0
  %45 = load i64, i64* %device.i118, align 8, !tbaa !154
  %cmp1.i119 = icmp eq i64 %45, 0
  br i1 %cmp1.i119, label %_halide_buffer_init.exit149, label %after_bb5

_halide_buffer_init.exit:                         ; preds = %_halide_buffer_is_bounds_query.exit
  %46 = getelementptr inbounds [8 x i32], [8 x i32]* %3, i32 0, i32 0
  store i32 0, i32* %46, align 4
  %47 = getelementptr inbounds [8 x i32], [8 x i32]* %3, i32 0, i32 1
  store i32 128, i32* %47, align 4
  %48 = getelementptr inbounds [8 x i32], [8 x i32]* %3, i32 0, i32 2
  store i32 1, i32* %48, align 4
  %49 = getelementptr inbounds [8 x i32], [8 x i32]* %3, i32 0, i32 3
  store i32 0, i32* %49, align 4
  %50 = getelementptr inbounds [8 x i32], [8 x i32]* %3, i32 0, i32 4
  store i32 0, i32* %50, align 4
  %51 = getelementptr inbounds [8 x i32], [8 x i32]* %3, i32 0, i32 5
  store i32 128, i32* %51, align 4
  %52 = getelementptr inbounds [8 x i32], [8 x i32]* %3, i32 0, i32 6
  store i32 128, i32* %52, align 4
  %53 = getelementptr inbounds [8 x i32], [8 x i32]* %3, i32 0, i32 7
  store i32 0, i32* %53, align 4
  %54 = bitcast %struct.halide_buffer_t* %A.buffer to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %54, i8 0, i64 16, i1 false)
  store i8 1, i8* %code.i.i, align 8, !tbaa !261
  store i8 16, i8* %bits.i.i, align 1, !tbaa !262
  store i16 1, i16* %lanes.i.i, align 2, !tbaa !263
  store i32 2, i32* %dimensions.i, align 4, !tbaa !159
  %55 = bitcast %struct.halide_dimension_t* %12 to i8*
  %56 = bitcast [8 x i32]* %3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %55, i8* noundef nonnull align 4 dereferenceable(16) %56, i64 16, i1 false) #10, !tbaa.struct !264
  %.pre.i = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim.i, align 8, !tbaa !160
  %arrayidx.i = getelementptr inbounds [8 x i32], [8 x i32]* %3, i32 0, i32 4
  %arrayidx12.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %.pre.i, i32 1
  %57 = bitcast %struct.halide_dimension_t* %arrayidx12.i to i8*
  %58 = bitcast i32* %arrayidx.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %57, i8* noundef nonnull align 4 dereferenceable(16) %58, i64 16, i1 false) #10, !tbaa.struct !264
  %flags13.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %A.buffer, i32 0, i32 3
  store i64 0, i64* %flags13.i, align 8, !tbaa !158
  %.pre = load i8*, i8** %host.i67, align 8, !tbaa !157
  br label %after_bb

after_bb5:                                        ; preds = %_halide_buffer_init.exit149, %_halide_buffer_is_bounds_query.exit121, %after_bb
  %59 = load i8*, i8** %host.i91, align 8, !tbaa !157
  %cmp.i125 = icmp eq i8* %59, null
  br i1 %cmp.i125, label %_halide_buffer_is_bounds_query.exit129, label %_halide_buffer_is_bounds_query.exit155

_halide_buffer_is_bounds_query.exit129:           ; preds = %after_bb5
  %device.i126 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %out.buffer, i32 0, i32 0
  %60 = load i64, i64* %device.i126, align 8, !tbaa !154
  %cmp1.i127 = icmp eq i64 %60, 0
  br i1 %cmp1.i127, label %after_bb8, label %land.rhs.i154

_halide_buffer_init.exit149:                      ; preds = %_halide_buffer_is_bounds_query.exit121
  %61 = bitcast %struct.halide_dimension_t** %dim.i79 to i8**
  %62 = load i8*, i8** %61, align 8, !tbaa !160
  %63 = getelementptr inbounds [8 x i32], [8 x i32]* %2, i32 0, i32 0
  store i32 0, i32* %63, align 4
  %64 = getelementptr inbounds [8 x i32], [8 x i32]* %2, i32 0, i32 1
  store i32 144, i32* %64, align 4
  %65 = getelementptr inbounds [8 x i32], [8 x i32]* %2, i32 0, i32 2
  store i32 1, i32* %65, align 4
  %66 = getelementptr inbounds [8 x i32], [8 x i32]* %2, i32 0, i32 3
  store i32 0, i32* %66, align 4
  %67 = getelementptr inbounds [8 x i32], [8 x i32]* %2, i32 0, i32 4
  store i32 0, i32* %67, align 4
  %68 = getelementptr inbounds [8 x i32], [8 x i32]* %2, i32 0, i32 5
  store i32 128, i32* %68, align 4
  %69 = getelementptr inbounds [8 x i32], [8 x i32]* %2, i32 0, i32 6
  store i32 144, i32* %69, align 4
  %70 = getelementptr inbounds [8 x i32], [8 x i32]* %2, i32 0, i32 7
  store i32 0, i32* %70, align 4
  %71 = bitcast %struct.halide_buffer_t* %B.buffer to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %71, i8 0, i64 16, i1 false)
  store i8 1, i8* %code.i.i68, align 8, !tbaa !261
  store i8 16, i8* %bits.i.i70, align 1, !tbaa !262
  store i16 1, i16* %lanes.i.i74, align 2, !tbaa !263
  store i32 2, i32* %dimensions.i78, align 4, !tbaa !159
  %72 = bitcast [8 x i32]* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %62, i8* noundef nonnull align 4 dereferenceable(16) %72, i64 16, i1 false) #10, !tbaa.struct !264
  %.pre.i142 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim.i79, align 8, !tbaa !160
  %arrayidx.i143 = getelementptr inbounds [8 x i32], [8 x i32]* %2, i32 0, i32 4
  %arrayidx12.i144 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %.pre.i142, i32 1
  %73 = bitcast %struct.halide_dimension_t* %arrayidx12.i144 to i8*
  %74 = bitcast i32* %arrayidx.i143 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %73, i8* noundef nonnull align 4 dereferenceable(16) %74, i64 16, i1 false) #10, !tbaa.struct !264
  %flags13.i148 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %B.buffer, i32 0, i32 3
  store i64 0, i64* %flags13.i148, align 8, !tbaa !158
  br label %after_bb5

after_bb8:                                        ; preds = %_halide_buffer_is_bounds_query.exit129
  %75 = bitcast %struct.halide_dimension_t** %dim.i103 to i8**
  %76 = load i8*, i8** %75, align 8, !tbaa !160
  %77 = getelementptr inbounds [8 x i32], [8 x i32]* %1, i32 0, i32 0
  store i32 0, i32* %77, align 4
  %78 = getelementptr inbounds [8 x i32], [8 x i32]* %1, i32 0, i32 1
  store i32 128, i32* %78, align 4
  %79 = getelementptr inbounds [8 x i32], [8 x i32]* %1, i32 0, i32 2
  store i32 1, i32* %79, align 4
  %80 = getelementptr inbounds [8 x i32], [8 x i32]* %1, i32 0, i32 3
  store i32 0, i32* %80, align 4
  %81 = getelementptr inbounds [8 x i32], [8 x i32]* %1, i32 0, i32 4
  store i32 0, i32* %81, align 4
  %82 = getelementptr inbounds [8 x i32], [8 x i32]* %1, i32 0, i32 5
  store i32 128, i32* %82, align 4
  %83 = getelementptr inbounds [8 x i32], [8 x i32]* %1, i32 0, i32 6
  store i32 128, i32* %83, align 4
  %84 = getelementptr inbounds [8 x i32], [8 x i32]* %1, i32 0, i32 7
  store i32 0, i32* %84, align 4
  %85 = bitcast %struct.halide_buffer_t* %out.buffer to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %85, i8 0, i64 16, i1 false)
  store i8 1, i8* %code.i.i92, align 8, !tbaa !261
  store i8 16, i8* %bits.i.i94, align 1, !tbaa !262
  store i16 1, i16* %lanes.i.i98, align 2, !tbaa !263
  store i32 2, i32* %dimensions.i102, align 4, !tbaa !159
  %86 = bitcast [8 x i32]* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %76, i8* noundef nonnull align 4 dereferenceable(16) %86, i64 16, i1 false) #10, !tbaa.struct !264
  %.pre.i180 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim.i103, align 8, !tbaa !160
  %arrayidx.i181 = getelementptr inbounds [8 x i32], [8 x i32]* %1, i32 0, i32 4
  %arrayidx12.i182 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %.pre.i180, i32 1
  %87 = bitcast %struct.halide_dimension_t* %arrayidx12.i182 to i8*
  %88 = bitcast i32* %arrayidx.i181 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %87, i8* noundef nonnull align 4 dereferenceable(16) %88, i64 16, i1 false) #10, !tbaa.struct !264
  %flags13.i186 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %out.buffer, i32 0, i32 3
  store i64 0, i64* %flags13.i186, align 8, !tbaa !158
  %.pr.pre = load i8*, i8** %host.i91, align 8, !tbaa !157
  %cmp.i151 = icmp eq i8* %.pr.pre, null
  br i1 %cmp.i151, label %land.rhs.i154, label %_halide_buffer_is_bounds_query.exit155

land.rhs.i154:                                    ; preds = %after_bb8, %_halide_buffer_is_bounds_query.exit129
  %89 = load i64, i64* %device.i126, align 8, !tbaa !154
  %cmp1.i153 = icmp eq i64 %89, 0
  br label %_halide_buffer_is_bounds_query.exit155

_halide_buffer_is_bounds_query.exit155:           ; preds = %land.rhs.i154, %after_bb8, %after_bb5
  %90 = phi i1 [ false, %after_bb8 ], [ %cmp1.i153, %land.rhs.i154 ], [ false, %after_bb5 ]
  %91 = load i8*, i8** %host.i, align 8, !tbaa !157
  %cmp.i157 = icmp eq i8* %91, null
  br i1 %cmp.i157, label %land.rhs.i160, label %_halide_buffer_is_bounds_query.exit161

land.rhs.i160:                                    ; preds = %_halide_buffer_is_bounds_query.exit155
  %device.i158 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %A.buffer, i32 0, i32 0
  %92 = load i64, i64* %device.i158, align 8, !tbaa !154
  %cmp1.i159 = icmp eq i64 %92, 0
  br label %_halide_buffer_is_bounds_query.exit161

_halide_buffer_is_bounds_query.exit161:           ; preds = %land.rhs.i160, %_halide_buffer_is_bounds_query.exit155
  %93 = phi i1 [ false, %_halide_buffer_is_bounds_query.exit155 ], [ %cmp1.i159, %land.rhs.i160 ]
  %94 = load i8*, i8** %host.i67, align 8, !tbaa !157
  %cmp.i163 = icmp eq i8* %94, null
  br i1 %cmp.i163, label %land.rhs.i166, label %_halide_buffer_is_bounds_query.exit167

land.rhs.i166:                                    ; preds = %_halide_buffer_is_bounds_query.exit161
  %device.i164 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %B.buffer, i32 0, i32 0
  %95 = load i64, i64* %device.i164, align 8, !tbaa !154
  %cmp1.i165 = icmp eq i64 %95, 0
  br label %_halide_buffer_is_bounds_query.exit167

_halide_buffer_is_bounds_query.exit167:           ; preds = %land.rhs.i166, %_halide_buffer_is_bounds_query.exit161
  %96 = phi i1 [ false, %_halide_buffer_is_bounds_query.exit161 ], [ %cmp1.i165, %land.rhs.i166 ]
  %97 = or i1 %93, %96
  %98 = or i1 %90, %97
  br i1 %98, label %common.ret, label %then_bb12

then_bb12:                                        ; preds = %_halide_buffer_is_bounds_query.exit167
  %99 = icmp ne i32 %or6.i.i, 69633
  %100 = zext i1 %99 to i64
  %.not51 = icmp eq i32 %11, 2
  %.not52 = icmp eq i32 %or6.i.i77, 69633
  %101 = select i1 %.not52, i64 0, i64 4
  %.not53 = icmp eq i32 %23, 2
  %102 = select i1 %.not53, i64 0, i64 8
  %.not54 = icmp eq i32 %or6.i.i101, 69633
  %103 = select i1 %.not54, i64 0, i64 16
  %.not55 = icmp eq i32 %35, 2
  %104 = select i1 %.not55, i64 0, i64 32
  %105 = icmp sgt i32 %13, 0
  %106 = add nsw i32 %14, %13
  %107 = icmp slt i32 %106, 128
  %108 = or i1 %105, %107
  %109 = select i1 %108, i64 64, i64 0
  %110 = lshr i32 %14, 24
  %111 = and i32 %110, 128
  %112 = zext i32 %111 to i64
  %113 = icmp sgt i32 %16, 0
  %114 = add nsw i32 %17, %16
  %115 = icmp slt i32 %114, 128
  %116 = or i1 %113, %115
  %117 = select i1 %116, i64 256, i64 0
  %118 = lshr i32 %17, 22
  %119 = and i32 %118, 512
  %120 = zext i32 %119 to i64
  %121 = icmp sgt i32 %25, 0
  %122 = add nsw i32 %26, %25
  %123 = icmp slt i32 %122, 144
  %124 = or i1 %121, %123
  %125 = select i1 %124, i64 1024, i64 0
  %126 = lshr i32 %26, 20
  %127 = and i32 %126, 2048
  %128 = zext i32 %127 to i64
  %129 = icmp sgt i32 %28, 0
  %130 = add nsw i32 %29, %28
  %131 = icmp slt i32 %130, 128
  %132 = or i1 %129, %131
  %133 = select i1 %132, i64 4096, i64 0
  %134 = lshr i32 %29, 18
  %135 = and i32 %134, 8192
  %136 = zext i32 %135 to i64
  %137 = icmp sgt i32 %37, 0
  %138 = add nsw i32 %38, %37
  %139 = icmp slt i32 %138, 128
  %140 = or i1 %137, %139
  %141 = select i1 %140, i64 16384, i64 0
  %142 = lshr i32 %38, 16
  %143 = and i32 %142, 32768
  %144 = zext i32 %143 to i64
  %145 = icmp sgt i32 %40, 0
  %146 = add nsw i32 %41, %40
  %147 = icmp slt i32 %146, 128
  %148 = or i1 %145, %147
  %149 = select i1 %148, i64 65536, i64 0
  %150 = lshr i32 %41, 14
  %151 = and i32 %150, 131072
  %152 = zext i32 %151 to i64
  %.not56 = icmp eq i32 %15, 1
  %153 = select i1 %.not56, i64 0, i64 262144
  %.not57 = icmp eq i32 %27, 1
  %154 = select i1 %.not57, i64 0, i64 524288
  %.not58 = icmp eq i32 %39, 1
  %155 = select i1 %.not58, i64 0, i64 1048576
  %156 = select i1 %.not51, i64 -9223372036854775808, i64 -9223372036854775806
  %157 = or i64 %156, %100
  %158 = or i64 %157, %112
  %159 = or i64 %158, %153
  %160 = or i64 %159, %109
  %161 = or i64 %160, %120
  %162 = or i64 %161, %117
  %163 = or i64 %162, %102
  %164 = or i64 %163, %101
  %165 = or i64 %164, %128
  %166 = or i64 %165, %154
  %167 = or i64 %166, %125
  %168 = or i64 %167, %136
  %169 = or i64 %168, %133
  %170 = or i64 %169, %104
  %171 = or i64 %170, %103
  %172 = or i64 %171, %144
  %173 = or i64 %172, %155
  %174 = or i64 %173, %141
  %175 = or i64 %174, %152
  %176 = or i64 %175, %149
  %177 = tail call i64 @llvm.cttz.i64(i64 %176, i1 true), !range !265
  %178 = trunc i64 %177 to i32
  switch i32 %178, label %no_errors_bb [
    i32 0, label %assert_failed
    i32 1, label %assert_failed14
    i32 2, label %assert_failed15
    i32 3, label %assert_failed16
    i32 4, label %assert_failed17
    i32 5, label %assert_failed18
    i32 6, label %assert_failed19
    i32 7, label %assert_failed20
    i32 8, label %assert_failed21
    i32 9, label %assert_failed22
    i32 10, label %assert_failed23
    i32 11, label %assert_failed24
    i32 12, label %assert_failed25
    i32 13, label %assert_failed26
    i32 14, label %assert_failed27
    i32 15, label %assert_failed28
    i32 16, label %assert_failed29
    i32 17, label %assert_failed30
    i32 18, label %assert_failed31
    i32 19, label %assert_failed32
    i32 20, label %assert_failed33
  ], !prof !266

no_errors_bb:                                     ; preds = %then_bb12
  %179 = sext i32 %17 to i64
  %180 = sext i32 %14 to i64
  %A.total_extent.1 = mul nsw i64 %179, %180
  %181 = sext i32 %29 to i64
  %182 = sext i32 %26 to i64
  %B.total_extent.1 = mul nsw i64 %181, %182
  %183 = sext i32 %41 to i64
  %184 = sext i32 %38 to i64
  %out.total_extent.1 = mul nsw i64 %183, %184
  %A.extent.0.lobit = lshr i32 %14, 31
  %185 = zext i32 %A.extent.0.lobit to i64
  %186 = sext i32 %18 to i64
  %x0 = mul nsw i64 %186, %179
  %187 = tail call i64 @llvm.abs.i64(i64 %x0, i1 true)
  %188 = icmp ugt i64 %187, 2147483647
  %189 = select i1 %188, i64 2, i64 0
  %190 = icmp sgt i64 %A.total_extent.1, 2147483647
  %191 = select i1 %190, i64 4, i64 0
  %192 = lshr i32 %26, 28
  %193 = and i32 %192, 8
  %194 = zext i32 %193 to i64
  %195 = sext i32 %30 to i64
  %x1 = mul nsw i64 %195, %181
  %196 = tail call i64 @llvm.abs.i64(i64 %x1, i1 true)
  %197 = icmp ugt i64 %196, 2147483647
  %198 = select i1 %197, i64 16, i64 0
  %199 = icmp sgt i64 %B.total_extent.1, 2147483647
  %200 = select i1 %199, i64 32, i64 0
  %201 = lshr i32 %38, 25
  %202 = and i32 %201, 64
  %203 = zext i32 %202 to i64
  %204 = sext i32 %42 to i64
  %x2 = mul nsw i64 %204, %183
  %205 = tail call i64 @llvm.abs.i64(i64 %x2, i1 true)
  %206 = icmp ugt i64 %205, 2147483647
  %207 = select i1 %206, i64 128, i64 0
  %208 = icmp sgt i64 %out.total_extent.1, 2147483647
  %209 = select i1 %208, i64 256, i64 0
  %210 = icmp sgt i32 %146, 128
  %211 = zext i1 %210 to i64
  %out.min.1.lobit = lshr i32 %40, 31
  %212 = zext i32 %out.min.1.lobit to i64
  %213 = or i64 %211, %212
  %214 = shl nuw nsw i64 %213, 9
  %215 = icmp sgt i32 %138, 128
  %216 = zext i1 %215 to i64
  %out.min.0.lobit = lshr i32 %37, 31
  %217 = zext i32 %out.min.0.lobit to i64
  %218 = or i64 %216, %217
  %219 = shl nuw nsw i64 %218, 10
  %220 = or i64 %191, %185
  %221 = or i64 %220, %189
  %222 = or i64 %221, %194
  %223 = or i64 %222, %200
  %224 = or i64 %223, %198
  %225 = or i64 %224, %203
  %226 = or i64 %225, %219
  %227 = or i64 %226, %209
  %228 = or i64 %227, %214
  %229 = or i64 %228, %207
  %230 = or i64 %229, -9223372036854775808
  %231 = tail call i64 @llvm.cttz.i64(i64 %230, i1 true), !range !265
  %232 = trunc i64 %231 to i32
  switch i32 %232, label %"for out.s0.__outermost" [
    i32 0, label %assert_failed35
    i32 1, label %assert_failed36
    i32 2, label %assert_failed37
    i32 3, label %assert_failed38
    i32 4, label %assert_failed39
    i32 5, label %assert_failed40
    i32 6, label %assert_failed41
    i32 7, label %assert_failed42
    i32 8, label %assert_failed43
    i32 9, label %assert_failed44
    i32 10, label %assert_failed45
  ], !prof !267

assert_failed:                                    ; preds = %then_bb12
  %233 = tail call i32 @halide_error_bad_type(i8* null, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @str.134, i32 0, i32 0), i32 %or6.i.i, i32 69633) #10
  br label %common.ret

assert_failed14:                                  ; preds = %then_bb12
  %234 = tail call i32 @halide_error_bad_dimensions(i8* null, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @str.134, i32 0, i32 0), i32 %11, i32 2) #10
  br label %common.ret

assert_failed15:                                  ; preds = %then_bb12
  %235 = tail call i32 @halide_error_bad_type(i8* null, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @str.135, i32 0, i32 0), i32 %or6.i.i77, i32 69633) #10
  br label %common.ret

assert_failed16:                                  ; preds = %then_bb12
  %236 = tail call i32 @halide_error_bad_dimensions(i8* null, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @str.135, i32 0, i32 0), i32 %23, i32 2) #10
  br label %common.ret

assert_failed17:                                  ; preds = %then_bb12
  %237 = tail call i32 @halide_error_bad_type(i8* null, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @str.136, i32 0, i32 0), i32 %or6.i.i101, i32 69633) #10
  br label %common.ret

assert_failed18:                                  ; preds = %then_bb12
  %238 = tail call i32 @halide_error_bad_dimensions(i8* null, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @str.136, i32 0, i32 0), i32 %35, i32 2) #10
  br label %common.ret

assert_failed19:                                  ; preds = %then_bb12
  %239 = add nsw i32 %106, -1
  %240 = tail call i32 @halide_error_access_out_of_bounds(i8* null, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @str.134, i32 0, i32 0), i32 0, i32 0, i32 127, i32 %13, i32 %239) #10
  br label %common.ret

assert_failed20:                                  ; preds = %then_bb12
  %241 = tail call i32 @halide_error_buffer_extents_negative(i8* null, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @str.134, i32 0, i32 0), i32 0, i32 %14) #10
  br label %common.ret

assert_failed21:                                  ; preds = %then_bb12
  %242 = add nsw i32 %114, -1
  %243 = tail call i32 @halide_error_access_out_of_bounds(i8* null, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @str.134, i32 0, i32 0), i32 1, i32 0, i32 127, i32 %16, i32 %242) #10
  br label %common.ret

assert_failed22:                                  ; preds = %then_bb12
  %244 = tail call i32 @halide_error_buffer_extents_negative(i8* null, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @str.134, i32 0, i32 0), i32 1, i32 %17) #10
  br label %common.ret

assert_failed23:                                  ; preds = %then_bb12
  %245 = add nsw i32 %122, -1
  %246 = tail call i32 @halide_error_access_out_of_bounds(i8* null, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @str.135, i32 0, i32 0), i32 0, i32 0, i32 143, i32 %25, i32 %245) #10
  br label %common.ret

assert_failed24:                                  ; preds = %then_bb12
  %247 = tail call i32 @halide_error_buffer_extents_negative(i8* null, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @str.135, i32 0, i32 0), i32 0, i32 %26) #10
  br label %common.ret

assert_failed25:                                  ; preds = %then_bb12
  %248 = add nsw i32 %130, -1
  %249 = tail call i32 @halide_error_access_out_of_bounds(i8* null, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @str.135, i32 0, i32 0), i32 1, i32 0, i32 127, i32 %28, i32 %248) #10
  br label %common.ret

assert_failed26:                                  ; preds = %then_bb12
  %250 = tail call i32 @halide_error_buffer_extents_negative(i8* null, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @str.135, i32 0, i32 0), i32 1, i32 %29) #10
  br label %common.ret

assert_failed27:                                  ; preds = %then_bb12
  %251 = add nsw i32 %138, -1
  %252 = tail call i32 @halide_error_access_out_of_bounds(i8* null, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @str.136, i32 0, i32 0), i32 0, i32 0, i32 127, i32 %37, i32 %251) #10
  br label %common.ret

assert_failed28:                                  ; preds = %then_bb12
  %253 = tail call i32 @halide_error_buffer_extents_negative(i8* null, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @str.136, i32 0, i32 0), i32 0, i32 %38) #10
  br label %common.ret

assert_failed29:                                  ; preds = %then_bb12
  %254 = add nsw i32 %146, -1
  %255 = tail call i32 @halide_error_access_out_of_bounds(i8* null, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @str.136, i32 0, i32 0), i32 1, i32 0, i32 127, i32 %40, i32 %254) #10
  br label %common.ret

assert_failed30:                                  ; preds = %then_bb12
  %256 = tail call i32 @halide_error_buffer_extents_negative(i8* null, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @str.136, i32 0, i32 0), i32 1, i32 %41) #10
  br label %common.ret

assert_failed31:                                  ; preds = %then_bb12
  %257 = tail call i32 @halide_error_constraint_violated(i8* null, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @str.137, i32 0, i32 0), i32 %15, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.138, i32 0, i32 0), i32 1) #10
  br label %common.ret

assert_failed32:                                  ; preds = %then_bb12
  %258 = tail call i32 @halide_error_constraint_violated(i8* null, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @str.139, i32 0, i32 0), i32 %27, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.138, i32 0, i32 0), i32 1) #10
  br label %common.ret

assert_failed33:                                  ; preds = %then_bb12
  %259 = tail call i32 @halide_error_constraint_violated(i8* null, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @str.140, i32 0, i32 0), i32 %39, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.138, i32 0, i32 0), i32 1) #10
  br label %common.ret

assert_failed35:                                  ; preds = %no_errors_bb
  %260 = tail call i32 @halide_error_buffer_allocation_too_large(i8* null, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.133, i32 0, i32 0), i64 %180, i64 2147483647) #10
  br label %common.ret

assert_failed36:                                  ; preds = %no_errors_bb
  %261 = tail call i32 @halide_error_buffer_allocation_too_large(i8* null, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.133, i32 0, i32 0), i64 %187, i64 2147483647) #10
  br label %common.ret

assert_failed37:                                  ; preds = %no_errors_bb
  %262 = tail call i32 @halide_error_buffer_extents_too_large(i8* null, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.133, i32 0, i32 0), i64 %A.total_extent.1, i64 2147483647) #10
  br label %common.ret

assert_failed38:                                  ; preds = %no_errors_bb
  %263 = tail call i32 @halide_error_buffer_allocation_too_large(i8* null, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.132, i32 0, i32 0), i64 %182, i64 2147483647) #10
  br label %common.ret

assert_failed39:                                  ; preds = %no_errors_bb
  %264 = tail call i32 @halide_error_buffer_allocation_too_large(i8* null, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.132, i32 0, i32 0), i64 %196, i64 2147483647) #10
  br label %common.ret

assert_failed40:                                  ; preds = %no_errors_bb
  %265 = tail call i32 @halide_error_buffer_extents_too_large(i8* null, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.132, i32 0, i32 0), i64 %B.total_extent.1, i64 2147483647) #10
  br label %common.ret

assert_failed41:                                  ; preds = %no_errors_bb
  %266 = tail call i32 @halide_error_buffer_allocation_too_large(i8* null, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str, i32 0, i32 0), i64 %184, i64 2147483647) #10
  br label %common.ret

assert_failed42:                                  ; preds = %no_errors_bb
  %267 = tail call i32 @halide_error_buffer_allocation_too_large(i8* null, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str, i32 0, i32 0), i64 %205, i64 2147483647) #10
  br label %common.ret

assert_failed43:                                  ; preds = %no_errors_bb
  %268 = tail call i32 @halide_error_buffer_extents_too_large(i8* null, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str, i32 0, i32 0), i64 %out.total_extent.1, i64 2147483647) #10
  br label %common.ret

assert_failed44:                                  ; preds = %no_errors_bb
  %269 = add nsw i32 %146, -1
  %270 = tail call i32 @halide_error_explicit_bounds_too_small(i8* null, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.141, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str, i32 0, i32 0), i32 0, i32 127, i32 %40, i32 %269) #10
  br label %common.ret

assert_failed45:                                  ; preds = %no_errors_bb
  %271 = add nsw i32 %138, -1
  %272 = tail call i32 @halide_error_explicit_bounds_too_small(i8* null, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.19, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str, i32 0, i32 0), i32 0, i32 127, i32 %37, i32 %271) #10
  br label %common.ret

"for out.s0.__outermost":                         ; preds = %no_errors_bb
  %273 = getelementptr inbounds %closure_t, %closure_t* %0, i32 0, i32 0
  store i32 %13, i32* %273, align 4
  %274 = getelementptr inbounds %closure_t, %closure_t* %0, i32 0, i32 1
  store i32 %16, i32* %274, align 4
  %275 = getelementptr inbounds %closure_t, %closure_t* %0, i32 0, i32 2
  store i32 %18, i32* %275, align 4
  %276 = getelementptr inbounds %closure_t, %closure_t* %0, i32 0, i32 3
  store i32 %25, i32* %276, align 4
  %277 = getelementptr inbounds %closure_t, %closure_t* %0, i32 0, i32 4
  store i32 %28, i32* %277, align 4
  %278 = getelementptr inbounds %closure_t, %closure_t* %0, i32 0, i32 5
  store i32 %30, i32* %278, align 4
  %279 = getelementptr inbounds %closure_t, %closure_t* %0, i32 0, i32 6
  store i32 %42, i32* %279, align 4
  %280 = getelementptr inbounds %closure_t, %closure_t* %0, i32 0, i32 7
  %281 = bitcast i16** %280 to i8**
  store i8* %7, i8** %281, align 4
  %282 = getelementptr inbounds %closure_t, %closure_t* %0, i32 0, i32 8
  %283 = bitcast %struct.halide_buffer_t** %282 to i8**
  store i8* %19, i8** %283, align 4
  %284 = getelementptr inbounds %closure_t, %closure_t* %0, i32 0, i32 9
  %285 = bitcast i16** %284 to i8**
  store i8* %31, i8** %285, align 4
  %286 = bitcast %closure_t* %0 to i8*
  %287 = call i32 @halide_do_par_for(i8* null, i32 (i8*, i32, i8*)* nonnull @matmul.par_for.out.s0.x.x.xy, i32 0, i32 9, i8* nonnull %286)
  br label %common.ret
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.cttz.i64(i64, i1 immarg) #7

; Function Attrs: nounwind
define internal i32 @matmul.par_for.out.s0.x.x.xy(i8* %__user_context, i32 %out.s0.x.x.xy, i8* noalias nocapture readonly %closure) #9 {
entry:
  %0 = bitcast i8* %closure to i32*
  %A.min.0 = load i32, i32* %0, align 4
  %1 = getelementptr inbounds i8, i8* %closure, i32 4
  %2 = bitcast i8* %1 to i32*
  %A.min.1 = load i32, i32* %2, align 4
  %3 = getelementptr inbounds i8, i8* %closure, i32 8
  %4 = bitcast i8* %3 to i32*
  %A.stride.1 = load i32, i32* %4, align 4
  %5 = getelementptr inbounds i8, i8* %closure, i32 12
  %6 = bitcast i8* %5 to i32*
  %B.min.0 = load i32, i32* %6, align 4
  %7 = getelementptr inbounds i8, i8* %closure, i32 16
  %8 = bitcast i8* %7 to i32*
  %B.min.1 = load i32, i32* %8, align 4
  %9 = getelementptr inbounds i8, i8* %closure, i32 20
  %10 = bitcast i8* %9 to i32*
  %B.stride.1 = load i32, i32* %10, align 4
  %11 = getelementptr inbounds i8, i8* %closure, i32 24
  %12 = bitcast i8* %11 to i32*
  %out.stride.1 = load i32, i32* %12, align 4
  %13 = getelementptr inbounds i8, i8* %closure, i32 28
  %14 = bitcast i8* %13 to i16**
  %A = load i16*, i16** %14, align 4
  %15 = getelementptr inbounds i8, i8* %closure, i32 32
  %16 = bitcast i8* %15 to i16**
  %B2 = load i16*, i16** %16, align 4
  %17 = getelementptr inbounds i8, i8* %closure, i32 36
  %18 = bitcast i8* %17 to i16**
  %out = load i16*, i16** %18, align 4
  %hvx_lock_result = tail call i32 @halide_qurt_hvx_lock(i8* %__user_context) #10
  %19 = icmp eq i32 %hvx_lock_result, 0
  br i1 %19, label %"assert succeeded", label %call_destructor.exit, !prof !268

"assert succeeded":                               ; preds = %entry
  %20 = ashr i32 %out.s0.x.x.xy, 31
  %21 = xor i32 %20, %out.s0.x.x.xy
  %22 = zext i32 %21 to i64
  %23 = mul nuw i64 %22, 2863311531
  %24 = lshr i64 %23, 33
  %25 = trunc i64 %24 to i32
  %26 = xor i32 %20, %25
  %.neg = mul i32 %26, -3
  %27 = add i32 %.neg, %out.s0.x.x.xy
  %a0 = mul nsw i32 %27, 48
  %28 = icmp slt i32 %a0, 80
  %29 = select i1 %28, i32 %a0, i32 80
  %30 = mul nsw i32 %B.stride.1, %B.min.1
  %31 = add i32 %B.min.0, %30
  %t193 = sub i32 %29, %31
  %a1 = mul nsw i32 %26, 48
  %32 = icmp slt i32 %a1, 80
  %33 = select i1 %32, i32 %a1, i32 80
  %34 = shl i32 %B.stride.1, 2
  br label %"for out.s0.y.yi.yi"

if.then.i:                                        ; preds = %"consume matrix_mul"
  tail call void @halide_qurt_hvx_unlock_as_destructor(i8* %__user_context, i8* nonnull inttoptr (i32 1 to i8*)) #12
  br label %call_destructor.exit

call_destructor.exit:                             ; preds = %if.then.i, %entry
  %35 = phi i32 [ 0, %if.then.i ], [ %hvx_lock_result, %entry ]
  ret i32 %35

"for out.s0.y.yi.yi":                             ; preds = %"consume matrix_mul", %"assert succeeded"
  %matrix_mul1.sroa.60.0 = phi <16 x i64> [ undef, %"assert succeeded" ], [ %matrix_mul1.sroa.60.448.vecblend123, %"consume matrix_mul" ]
  %matrix_mul1.sroa.40.0 = phi <16 x i64> [ undef, %"assert succeeded" ], [ %matrix_mul1.sroa.40.320.vecblend93, %"consume matrix_mul" ]
  %matrix_mul1.sroa.20.0 = phi <16 x i64> [ undef, %"assert succeeded" ], [ %matrix_mul1.sroa.20.192.vecblend63, %"consume matrix_mul" ]
  %matrix_mul1.sroa.0.0 = phi <16 x i64> [ undef, %"assert succeeded" ], [ %matrix_mul1.sroa.0.64.vecblend33, %"consume matrix_mul" ]
  %out.s0.y.yi.yi = phi i32 [ 0, %"assert succeeded" ], [ %545, %"consume matrix_mul" ]
  %36 = shl nsw i32 %out.s0.y.yi.yi, 2
  %out.s0.y.min_2 = add nsw i32 %36, %33
  %matrix_mul1.sroa.0.0.vecblend = shufflevector <16 x i64> <i64 0, i64 0, i64 0, i64 0, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison>, <16 x i64> %matrix_mul1.sroa.0.0, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 28, i32 29, i32 30, i32 31>
  %matrix_mul1.sroa.0.32.vecblend = shufflevector <16 x i64> %matrix_mul1.sroa.0.0.vecblend, <16 x i64> <i64 poison, i64 poison, i64 poison, i64 poison, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 poison, i64 poison, i64 poison, i64 poison>, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 12, i32 13, i32 14, i32 15>
  %matrix_mul1.sroa.20.128.vecblend = shufflevector <16 x i64> <i64 0, i64 0, i64 0, i64 0, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison>, <16 x i64> %matrix_mul1.sroa.20.0, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 28, i32 29, i32 30, i32 31>
  %matrix_mul1.sroa.20.160.vecblend = shufflevector <16 x i64> %matrix_mul1.sroa.20.128.vecblend, <16 x i64> <i64 poison, i64 poison, i64 poison, i64 poison, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 poison, i64 poison, i64 poison, i64 poison>, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 12, i32 13, i32 14, i32 15>
  %matrix_mul1.sroa.40.256.vecblend = shufflevector <16 x i64> <i64 0, i64 0, i64 0, i64 0, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison>, <16 x i64> %matrix_mul1.sroa.40.0, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 28, i32 29, i32 30, i32 31>
  %matrix_mul1.sroa.40.288.vecblend = shufflevector <16 x i64> %matrix_mul1.sroa.40.256.vecblend, <16 x i64> <i64 poison, i64 poison, i64 poison, i64 poison, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 poison, i64 poison, i64 poison, i64 poison>, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 12, i32 13, i32 14, i32 15>
  %matrix_mul1.sroa.60.384.vecblend = shufflevector <16 x i64> <i64 0, i64 0, i64 0, i64 0, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison>, <16 x i64> %matrix_mul1.sroa.60.0, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 28, i32 29, i32 30, i32 31>
  %matrix_mul1.sroa.60.416.vecblend = shufflevector <16 x i64> %matrix_mul1.sroa.60.384.vecblend, <16 x i64> <i64 poison, i64 poison, i64 poison, i64 poison, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 poison, i64 poison, i64 poison, i64 poison>, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 12, i32 13, i32 14, i32 15>
  %37 = sub nsw i32 %out.s0.y.min_2, %A.min.1
  %38 = mul nsw i32 %37, %A.stride.1
  %39 = sub i32 %38, %A.min.0
  %40 = add nsw i32 %37, 1
  %41 = mul nsw i32 %40, %A.stride.1
  %42 = sub i32 %41, %A.min.0
  %43 = add nsw i32 %37, 2
  %44 = mul nsw i32 %43, %A.stride.1
  %45 = sub i32 %44, %A.min.0
  %46 = add nsw i32 %37, 3
  %47 = mul nsw i32 %46, %A.stride.1
  %48 = sub i32 %47, %A.min.0
  br label %"for matrix_mul.s1.k$x.k$x"

"for matrix_mul.s1.k$x.k$x":                      ; preds = %"for matrix_mul.s1.k$x.k$x", %"for out.s0.y.yi.yi"
  %matrix_mul1.sroa.60.1 = phi <16 x i64> [ %matrix_mul1.sroa.60.416.vecblend, %"for out.s0.y.yi.yi" ], [ %matrix_mul1.sroa.60.448.vecblend123, %"for matrix_mul.s1.k$x.k$x" ]
  %matrix_mul1.sroa.40.1 = phi <16 x i64> [ %matrix_mul1.sroa.40.288.vecblend, %"for out.s0.y.yi.yi" ], [ %matrix_mul1.sroa.40.320.vecblend93, %"for matrix_mul.s1.k$x.k$x" ]
  %matrix_mul1.sroa.20.1 = phi <16 x i64> [ %matrix_mul1.sroa.20.160.vecblend, %"for out.s0.y.yi.yi" ], [ %matrix_mul1.sroa.20.192.vecblend63, %"for matrix_mul.s1.k$x.k$x" ]
  %matrix_mul1.sroa.0.1 = phi <16 x i64> [ %matrix_mul1.sroa.0.32.vecblend, %"for out.s0.y.yi.yi" ], [ %matrix_mul1.sroa.0.64.vecblend33, %"for matrix_mul.s1.k$x.k$x" ]
  %"matrix_mul.s1.k$x.k$x" = phi i32 [ 0, %"for out.s0.y.yi.yi" ], [ %513, %"for matrix_mul.s1.k$x.k$x" ]
  %49 = shufflevector <16 x i64> %matrix_mul1.sroa.0.1, <16 x i64> undef, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %50 = bitcast <8 x i64> %49 to <32 x i16>
  %51 = mul i32 %34, %"matrix_mul.s1.k$x.k$x"
  %52 = add nsw i32 %51, %t193
  %53 = getelementptr inbounds i16, i16* %B2, i32 %52
  %54 = bitcast i16* %53 to <16 x i64>*
  %55 = load <16 x i64>, <16 x i64>* %54, align 2, !tbaa !269
  %56 = shufflevector <16 x i64> %55, <16 x i64> undef, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %57 = bitcast <8 x i64> %56 to <32 x i16>
  %58 = shl nsw i32 %"matrix_mul.s1.k$x.k$x", 2
  %59 = add nsw i32 %39, %58
  %60 = getelementptr inbounds i16, i16* %A, i32 %59
  %61 = load i16, i16* %60, align 2, !tbaa !272
  %62 = insertelement <32 x i16> undef, i16 %61, i32 0
  %63 = shufflevector <32 x i16> %57, <32 x i16> undef, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %64 = shufflevector <32 x i16> %62, <32 x i16> undef, <64 x i32> <i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %65 = bitcast <64 x i16> %63 to <32 x i32>
  %66 = bitcast <64 x i16> %64 to <32 x i32>
  %67 = tail call <64 x i32> @llvm.hexagon.V6.vmpyuhv.128B(<32 x i32> %65, <32 x i32> %66) #10
  %68 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %67)
  %69 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %68)
  %70 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %69) #10
  %71 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %69) #10
  %72 = tail call <32 x i32> @llvm.hexagon.V6.vshufeh.128B(<32 x i32> %71, <32 x i32> %70) #10
  %73 = bitcast <32 x i32> %72 to <64 x i16>
  %74 = shufflevector <64 x i16> %73, <64 x i16> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %75 = add <32 x i16> %74, %50
  %76 = shufflevector <16 x i64> %matrix_mul1.sroa.0.1, <16 x i64> undef, <8 x i32> <i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %77 = bitcast <8 x i64> %76 to <32 x i16>
  %78 = getelementptr inbounds i16, i16* %53, i32 32
  %79 = bitcast i16* %78 to <16 x i64>*
  %80 = load <16 x i64>, <16 x i64>* %79, align 2, !tbaa !269
  %81 = shufflevector <16 x i64> %80, <16 x i64> undef, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %82 = bitcast <8 x i64> %81 to <32 x i16>
  %83 = shufflevector <32 x i16> %82, <32 x i16> undef, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %84 = bitcast <64 x i16> %83 to <32 x i32>
  %85 = tail call <64 x i32> @llvm.hexagon.V6.vmpyuhv.128B(<32 x i32> %84, <32 x i32> %66) #10
  %86 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %85)
  %87 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %86)
  %88 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %87) #10
  %89 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %87) #10
  %90 = tail call <32 x i32> @llvm.hexagon.V6.vshufeh.128B(<32 x i32> %89, <32 x i32> %88) #10
  %91 = bitcast <32 x i32> %90 to <64 x i16>
  %92 = shufflevector <64 x i16> %91, <64 x i16> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %93 = add <32 x i16> %92, %77
  %94 = shufflevector <16 x i64> %matrix_mul1.sroa.20.1, <16 x i64> undef, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %95 = bitcast <8 x i64> %94 to <32 x i16>
  %96 = add nsw i32 %42, %58
  %97 = getelementptr inbounds i16, i16* %A, i32 %96
  %98 = load i16, i16* %97, align 2, !tbaa !272
  %99 = insertelement <32 x i16> undef, i16 %98, i32 0
  %100 = shufflevector <32 x i16> %99, <32 x i16> undef, <64 x i32> <i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %101 = bitcast <64 x i16> %100 to <32 x i32>
  %102 = tail call <64 x i32> @llvm.hexagon.V6.vmpyuhv.128B(<32 x i32> %65, <32 x i32> %101) #10
  %103 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %102)
  %104 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %103)
  %105 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %104) #10
  %106 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %104) #10
  %107 = tail call <32 x i32> @llvm.hexagon.V6.vshufeh.128B(<32 x i32> %106, <32 x i32> %105) #10
  %108 = bitcast <32 x i32> %107 to <64 x i16>
  %109 = shufflevector <64 x i16> %108, <64 x i16> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %110 = add <32 x i16> %109, %95
  %111 = shufflevector <16 x i64> %matrix_mul1.sroa.20.1, <16 x i64> undef, <8 x i32> <i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %112 = bitcast <8 x i64> %111 to <32 x i16>
  %113 = tail call <64 x i32> @llvm.hexagon.V6.vmpyuhv.128B(<32 x i32> %84, <32 x i32> %101) #10
  %114 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %113)
  %115 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %114)
  %116 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %115) #10
  %117 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %115) #10
  %118 = tail call <32 x i32> @llvm.hexagon.V6.vshufeh.128B(<32 x i32> %117, <32 x i32> %116) #10
  %119 = bitcast <32 x i32> %118 to <64 x i16>
  %120 = shufflevector <64 x i16> %119, <64 x i16> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %121 = add <32 x i16> %120, %112
  %122 = shufflevector <16 x i64> %matrix_mul1.sroa.40.1, <16 x i64> undef, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %123 = bitcast <8 x i64> %122 to <32 x i16>
  %124 = add nsw i32 %45, %58
  %125 = getelementptr inbounds i16, i16* %A, i32 %124
  %126 = load i16, i16* %125, align 2, !tbaa !272
  %127 = insertelement <32 x i16> undef, i16 %126, i32 0
  %128 = shufflevector <32 x i16> %127, <32 x i16> undef, <64 x i32> <i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %129 = bitcast <64 x i16> %128 to <32 x i32>
  %130 = tail call <64 x i32> @llvm.hexagon.V6.vmpyuhv.128B(<32 x i32> %65, <32 x i32> %129) #10
  %131 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %130)
  %132 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %131)
  %133 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %132) #10
  %134 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %132) #10
  %135 = tail call <32 x i32> @llvm.hexagon.V6.vshufeh.128B(<32 x i32> %134, <32 x i32> %133) #10
  %136 = bitcast <32 x i32> %135 to <64 x i16>
  %137 = shufflevector <64 x i16> %136, <64 x i16> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %138 = add <32 x i16> %137, %123
  %139 = shufflevector <16 x i64> %matrix_mul1.sroa.40.1, <16 x i64> undef, <8 x i32> <i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %140 = bitcast <8 x i64> %139 to <32 x i16>
  %141 = tail call <64 x i32> @llvm.hexagon.V6.vmpyuhv.128B(<32 x i32> %84, <32 x i32> %129) #10
  %142 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %141)
  %143 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %142)
  %144 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %143) #10
  %145 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %143) #10
  %146 = tail call <32 x i32> @llvm.hexagon.V6.vshufeh.128B(<32 x i32> %145, <32 x i32> %144) #10
  %147 = bitcast <32 x i32> %146 to <64 x i16>
  %148 = shufflevector <64 x i16> %147, <64 x i16> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %149 = add <32 x i16> %148, %140
  %150 = shufflevector <16 x i64> %matrix_mul1.sroa.60.1, <16 x i64> undef, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %151 = bitcast <8 x i64> %150 to <32 x i16>
  %152 = add nsw i32 %48, %58
  %153 = getelementptr inbounds i16, i16* %A, i32 %152
  %154 = load i16, i16* %153, align 2, !tbaa !272
  %155 = insertelement <32 x i16> undef, i16 %154, i32 0
  %156 = shufflevector <32 x i16> %155, <32 x i16> undef, <64 x i32> <i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %157 = bitcast <64 x i16> %156 to <32 x i32>
  %158 = tail call <64 x i32> @llvm.hexagon.V6.vmpyuhv.128B(<32 x i32> %65, <32 x i32> %157) #10
  %159 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %158)
  %160 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %159)
  %161 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %160) #10
  %162 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %160) #10
  %163 = tail call <32 x i32> @llvm.hexagon.V6.vshufeh.128B(<32 x i32> %162, <32 x i32> %161) #10
  %164 = bitcast <32 x i32> %163 to <64 x i16>
  %165 = shufflevector <64 x i16> %164, <64 x i16> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %166 = add <32 x i16> %165, %151
  %167 = shufflevector <16 x i64> %matrix_mul1.sroa.60.1, <16 x i64> undef, <8 x i32> <i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %168 = bitcast <8 x i64> %167 to <32 x i16>
  %169 = tail call <64 x i32> @llvm.hexagon.V6.vmpyuhv.128B(<32 x i32> %84, <32 x i32> %157) #10
  %170 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %169)
  %171 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %170)
  %172 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %171) #10
  %173 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %171) #10
  %174 = tail call <32 x i32> @llvm.hexagon.V6.vshufeh.128B(<32 x i32> %173, <32 x i32> %172) #10
  %175 = bitcast <32 x i32> %174 to <64 x i16>
  %176 = shufflevector <64 x i16> %175, <64 x i16> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %177 = add <32 x i16> %176, %168
  %178 = or i32 %58, 1
  %179 = mul nsw i32 %178, %B.stride.1
  %180 = add nsw i32 %179, %t193
  %181 = getelementptr inbounds i16, i16* %B2, i32 %180
  %182 = bitcast i16* %181 to <16 x i64>*
  %183 = load <16 x i64>, <16 x i64>* %182, align 2, !tbaa !269
  %184 = shufflevector <16 x i64> %183, <16 x i64> undef, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %185 = bitcast <8 x i64> %184 to <32 x i16>
  %186 = getelementptr inbounds i16, i16* %60, i32 1
  %187 = load i16, i16* %186, align 2, !tbaa !272
  %188 = insertelement <32 x i16> undef, i16 %187, i32 0
  %189 = shufflevector <32 x i16> %185, <32 x i16> undef, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %190 = shufflevector <32 x i16> %188, <32 x i16> undef, <64 x i32> <i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %191 = bitcast <64 x i16> %189 to <32 x i32>
  %192 = bitcast <64 x i16> %190 to <32 x i32>
  %193 = tail call <64 x i32> @llvm.hexagon.V6.vmpyuhv.128B(<32 x i32> %191, <32 x i32> %192) #10
  %194 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %193)
  %195 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %194)
  %196 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %195) #10
  %197 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %195) #10
  %198 = tail call <32 x i32> @llvm.hexagon.V6.vshufeh.128B(<32 x i32> %197, <32 x i32> %196) #10
  %199 = bitcast <32 x i32> %198 to <64 x i16>
  %200 = shufflevector <64 x i16> %199, <64 x i16> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %201 = add <32 x i16> %75, %200
  %202 = getelementptr inbounds i16, i16* %181, i32 32
  %203 = bitcast i16* %202 to <16 x i64>*
  %204 = load <16 x i64>, <16 x i64>* %203, align 2, !tbaa !269
  %205 = shufflevector <16 x i64> %204, <16 x i64> undef, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %206 = bitcast <8 x i64> %205 to <32 x i16>
  %207 = shufflevector <32 x i16> %206, <32 x i16> undef, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %208 = bitcast <64 x i16> %207 to <32 x i32>
  %209 = tail call <64 x i32> @llvm.hexagon.V6.vmpyuhv.128B(<32 x i32> %208, <32 x i32> %192) #10
  %210 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %209)
  %211 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %210)
  %212 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %211) #10
  %213 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %211) #10
  %214 = tail call <32 x i32> @llvm.hexagon.V6.vshufeh.128B(<32 x i32> %213, <32 x i32> %212) #10
  %215 = bitcast <32 x i32> %214 to <64 x i16>
  %216 = shufflevector <64 x i16> %215, <64 x i16> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %217 = add <32 x i16> %93, %216
  %218 = getelementptr inbounds i16, i16* %97, i32 1
  %219 = load i16, i16* %218, align 2, !tbaa !272
  %220 = insertelement <32 x i16> undef, i16 %219, i32 0
  %221 = shufflevector <32 x i16> %220, <32 x i16> undef, <64 x i32> <i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %222 = bitcast <64 x i16> %221 to <32 x i32>
  %223 = tail call <64 x i32> @llvm.hexagon.V6.vmpyuhv.128B(<32 x i32> %191, <32 x i32> %222) #10
  %224 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %223)
  %225 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %224)
  %226 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %225) #10
  %227 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %225) #10
  %228 = tail call <32 x i32> @llvm.hexagon.V6.vshufeh.128B(<32 x i32> %227, <32 x i32> %226) #10
  %229 = bitcast <32 x i32> %228 to <64 x i16>
  %230 = shufflevector <64 x i16> %229, <64 x i16> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %231 = add <32 x i16> %110, %230
  %232 = tail call <64 x i32> @llvm.hexagon.V6.vmpyuhv.128B(<32 x i32> %208, <32 x i32> %222) #10
  %233 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %232)
  %234 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %233)
  %235 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %234) #10
  %236 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %234) #10
  %237 = tail call <32 x i32> @llvm.hexagon.V6.vshufeh.128B(<32 x i32> %236, <32 x i32> %235) #10
  %238 = bitcast <32 x i32> %237 to <64 x i16>
  %239 = shufflevector <64 x i16> %238, <64 x i16> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %240 = add <32 x i16> %121, %239
  %241 = getelementptr inbounds i16, i16* %125, i32 1
  %242 = load i16, i16* %241, align 2, !tbaa !272
  %243 = insertelement <32 x i16> undef, i16 %242, i32 0
  %244 = shufflevector <32 x i16> %243, <32 x i16> undef, <64 x i32> <i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %245 = bitcast <64 x i16> %244 to <32 x i32>
  %246 = tail call <64 x i32> @llvm.hexagon.V6.vmpyuhv.128B(<32 x i32> %191, <32 x i32> %245) #10
  %247 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %246)
  %248 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %247)
  %249 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %248) #10
  %250 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %248) #10
  %251 = tail call <32 x i32> @llvm.hexagon.V6.vshufeh.128B(<32 x i32> %250, <32 x i32> %249) #10
  %252 = bitcast <32 x i32> %251 to <64 x i16>
  %253 = shufflevector <64 x i16> %252, <64 x i16> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %254 = add <32 x i16> %138, %253
  %255 = tail call <64 x i32> @llvm.hexagon.V6.vmpyuhv.128B(<32 x i32> %208, <32 x i32> %245) #10
  %256 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %255)
  %257 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %256)
  %258 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %257) #10
  %259 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %257) #10
  %260 = tail call <32 x i32> @llvm.hexagon.V6.vshufeh.128B(<32 x i32> %259, <32 x i32> %258) #10
  %261 = bitcast <32 x i32> %260 to <64 x i16>
  %262 = shufflevector <64 x i16> %261, <64 x i16> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %263 = add <32 x i16> %149, %262
  %264 = getelementptr inbounds i16, i16* %153, i32 1
  %265 = load i16, i16* %264, align 2, !tbaa !272
  %266 = insertelement <32 x i16> undef, i16 %265, i32 0
  %267 = shufflevector <32 x i16> %266, <32 x i16> undef, <64 x i32> <i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %268 = bitcast <64 x i16> %267 to <32 x i32>
  %269 = tail call <64 x i32> @llvm.hexagon.V6.vmpyuhv.128B(<32 x i32> %191, <32 x i32> %268) #10
  %270 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %269)
  %271 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %270)
  %272 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %271) #10
  %273 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %271) #10
  %274 = tail call <32 x i32> @llvm.hexagon.V6.vshufeh.128B(<32 x i32> %273, <32 x i32> %272) #10
  %275 = bitcast <32 x i32> %274 to <64 x i16>
  %276 = shufflevector <64 x i16> %275, <64 x i16> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %277 = add <32 x i16> %166, %276
  %278 = tail call <64 x i32> @llvm.hexagon.V6.vmpyuhv.128B(<32 x i32> %208, <32 x i32> %268) #10
  %279 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %278)
  %280 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %279)
  %281 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %280) #10
  %282 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %280) #10
  %283 = tail call <32 x i32> @llvm.hexagon.V6.vshufeh.128B(<32 x i32> %282, <32 x i32> %281) #10
  %284 = bitcast <32 x i32> %283 to <64 x i16>
  %285 = shufflevector <64 x i16> %284, <64 x i16> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %286 = add <32 x i16> %177, %285
  %287 = or i32 %58, 2
  %288 = mul nsw i32 %287, %B.stride.1
  %289 = add nsw i32 %288, %t193
  %290 = getelementptr inbounds i16, i16* %B2, i32 %289
  %291 = bitcast i16* %290 to <16 x i64>*
  %292 = load <16 x i64>, <16 x i64>* %291, align 2, !tbaa !269
  %293 = shufflevector <16 x i64> %292, <16 x i64> undef, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %294 = bitcast <8 x i64> %293 to <32 x i16>
  %295 = getelementptr inbounds i16, i16* %60, i32 2
  %296 = load i16, i16* %295, align 2, !tbaa !272
  %297 = insertelement <32 x i16> undef, i16 %296, i32 0
  %298 = shufflevector <32 x i16> %294, <32 x i16> undef, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %299 = shufflevector <32 x i16> %297, <32 x i16> undef, <64 x i32> <i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %300 = bitcast <64 x i16> %298 to <32 x i32>
  %301 = bitcast <64 x i16> %299 to <32 x i32>
  %302 = tail call <64 x i32> @llvm.hexagon.V6.vmpyuhv.128B(<32 x i32> %300, <32 x i32> %301) #10
  %303 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %302)
  %304 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %303)
  %305 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %304) #10
  %306 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %304) #10
  %307 = tail call <32 x i32> @llvm.hexagon.V6.vshufeh.128B(<32 x i32> %306, <32 x i32> %305) #10
  %308 = bitcast <32 x i32> %307 to <64 x i16>
  %309 = shufflevector <64 x i16> %308, <64 x i16> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %310 = add <32 x i16> %201, %309
  %311 = getelementptr inbounds i16, i16* %290, i32 32
  %312 = bitcast i16* %311 to <16 x i64>*
  %313 = load <16 x i64>, <16 x i64>* %312, align 2, !tbaa !269
  %314 = shufflevector <16 x i64> %313, <16 x i64> undef, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %315 = bitcast <8 x i64> %314 to <32 x i16>
  %316 = shufflevector <32 x i16> %315, <32 x i16> undef, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %317 = bitcast <64 x i16> %316 to <32 x i32>
  %318 = tail call <64 x i32> @llvm.hexagon.V6.vmpyuhv.128B(<32 x i32> %317, <32 x i32> %301) #10
  %319 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %318)
  %320 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %319)
  %321 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %320) #10
  %322 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %320) #10
  %323 = tail call <32 x i32> @llvm.hexagon.V6.vshufeh.128B(<32 x i32> %322, <32 x i32> %321) #10
  %324 = bitcast <32 x i32> %323 to <64 x i16>
  %325 = shufflevector <64 x i16> %324, <64 x i16> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %326 = add <32 x i16> %217, %325
  %327 = getelementptr inbounds i16, i16* %97, i32 2
  %328 = load i16, i16* %327, align 2, !tbaa !272
  %329 = insertelement <32 x i16> undef, i16 %328, i32 0
  %330 = shufflevector <32 x i16> %329, <32 x i16> undef, <64 x i32> <i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %331 = bitcast <64 x i16> %330 to <32 x i32>
  %332 = tail call <64 x i32> @llvm.hexagon.V6.vmpyuhv.128B(<32 x i32> %300, <32 x i32> %331) #10
  %333 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %332)
  %334 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %333)
  %335 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %334) #10
  %336 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %334) #10
  %337 = tail call <32 x i32> @llvm.hexagon.V6.vshufeh.128B(<32 x i32> %336, <32 x i32> %335) #10
  %338 = bitcast <32 x i32> %337 to <64 x i16>
  %339 = shufflevector <64 x i16> %338, <64 x i16> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %340 = add <32 x i16> %231, %339
  %341 = tail call <64 x i32> @llvm.hexagon.V6.vmpyuhv.128B(<32 x i32> %317, <32 x i32> %331) #10
  %342 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %341)
  %343 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %342)
  %344 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %343) #10
  %345 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %343) #10
  %346 = tail call <32 x i32> @llvm.hexagon.V6.vshufeh.128B(<32 x i32> %345, <32 x i32> %344) #10
  %347 = bitcast <32 x i32> %346 to <64 x i16>
  %348 = shufflevector <64 x i16> %347, <64 x i16> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %349 = add <32 x i16> %240, %348
  %350 = getelementptr inbounds i16, i16* %125, i32 2
  %351 = load i16, i16* %350, align 2, !tbaa !272
  %352 = insertelement <32 x i16> undef, i16 %351, i32 0
  %353 = shufflevector <32 x i16> %352, <32 x i16> undef, <64 x i32> <i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %354 = bitcast <64 x i16> %353 to <32 x i32>
  %355 = tail call <64 x i32> @llvm.hexagon.V6.vmpyuhv.128B(<32 x i32> %300, <32 x i32> %354) #10
  %356 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %355)
  %357 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %356)
  %358 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %357) #10
  %359 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %357) #10
  %360 = tail call <32 x i32> @llvm.hexagon.V6.vshufeh.128B(<32 x i32> %359, <32 x i32> %358) #10
  %361 = bitcast <32 x i32> %360 to <64 x i16>
  %362 = shufflevector <64 x i16> %361, <64 x i16> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %363 = add <32 x i16> %254, %362
  %364 = tail call <64 x i32> @llvm.hexagon.V6.vmpyuhv.128B(<32 x i32> %317, <32 x i32> %354) #10
  %365 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %364)
  %366 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %365)
  %367 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %366) #10
  %368 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %366) #10
  %369 = tail call <32 x i32> @llvm.hexagon.V6.vshufeh.128B(<32 x i32> %368, <32 x i32> %367) #10
  %370 = bitcast <32 x i32> %369 to <64 x i16>
  %371 = shufflevector <64 x i16> %370, <64 x i16> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %372 = add <32 x i16> %263, %371
  %373 = getelementptr inbounds i16, i16* %153, i32 2
  %374 = load i16, i16* %373, align 2, !tbaa !272
  %375 = insertelement <32 x i16> undef, i16 %374, i32 0
  %376 = shufflevector <32 x i16> %375, <32 x i16> undef, <64 x i32> <i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %377 = bitcast <64 x i16> %376 to <32 x i32>
  %378 = tail call <64 x i32> @llvm.hexagon.V6.vmpyuhv.128B(<32 x i32> %300, <32 x i32> %377) #10
  %379 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %378)
  %380 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %379)
  %381 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %380) #10
  %382 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %380) #10
  %383 = tail call <32 x i32> @llvm.hexagon.V6.vshufeh.128B(<32 x i32> %382, <32 x i32> %381) #10
  %384 = bitcast <32 x i32> %383 to <64 x i16>
  %385 = shufflevector <64 x i16> %384, <64 x i16> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %386 = add <32 x i16> %277, %385
  %387 = tail call <64 x i32> @llvm.hexagon.V6.vmpyuhv.128B(<32 x i32> %317, <32 x i32> %377) #10
  %388 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %387)
  %389 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %388)
  %390 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %389) #10
  %391 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %389) #10
  %392 = tail call <32 x i32> @llvm.hexagon.V6.vshufeh.128B(<32 x i32> %391, <32 x i32> %390) #10
  %393 = bitcast <32 x i32> %392 to <64 x i16>
  %394 = shufflevector <64 x i16> %393, <64 x i16> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %395 = add <32 x i16> %286, %394
  %396 = or i32 %58, 3
  %397 = mul nsw i32 %396, %B.stride.1
  %398 = add nsw i32 %397, %t193
  %399 = getelementptr inbounds i16, i16* %B2, i32 %398
  %400 = bitcast i16* %399 to <16 x i64>*
  %401 = load <16 x i64>, <16 x i64>* %400, align 2, !tbaa !269
  %402 = shufflevector <16 x i64> %401, <16 x i64> undef, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %403 = bitcast <8 x i64> %402 to <32 x i16>
  %404 = getelementptr inbounds i16, i16* %60, i32 3
  %405 = load i16, i16* %404, align 2, !tbaa !272
  %406 = insertelement <32 x i16> undef, i16 %405, i32 0
  %407 = shufflevector <32 x i16> %403, <32 x i16> undef, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %408 = shufflevector <32 x i16> %406, <32 x i16> undef, <64 x i32> <i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %409 = bitcast <64 x i16> %407 to <32 x i32>
  %410 = bitcast <64 x i16> %408 to <32 x i32>
  %411 = tail call <64 x i32> @llvm.hexagon.V6.vmpyuhv.128B(<32 x i32> %409, <32 x i32> %410) #10
  %412 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %411)
  %413 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %412)
  %414 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %413) #10
  %415 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %413) #10
  %416 = tail call <32 x i32> @llvm.hexagon.V6.vshufeh.128B(<32 x i32> %415, <32 x i32> %414) #10
  %417 = bitcast <32 x i32> %416 to <64 x i16>
  %418 = shufflevector <64 x i16> %417, <64 x i16> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %419 = add <32 x i16> %310, %418
  %420 = bitcast <32 x i16> %419 to <8 x i64>
  %matrix_mul1.sroa.0.0.vec.expand23 = shufflevector <8 x i64> %420, <8 x i64> poison, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %421 = getelementptr inbounds i16, i16* %399, i32 32
  %422 = bitcast i16* %421 to <16 x i64>*
  %423 = load <16 x i64>, <16 x i64>* %422, align 2, !tbaa !269
  %424 = shufflevector <16 x i64> %423, <16 x i64> undef, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %425 = bitcast <8 x i64> %424 to <32 x i16>
  %426 = shufflevector <32 x i16> %425, <32 x i16> undef, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %427 = bitcast <64 x i16> %426 to <32 x i32>
  %428 = tail call <64 x i32> @llvm.hexagon.V6.vmpyuhv.128B(<32 x i32> %427, <32 x i32> %410) #10
  %429 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %428)
  %430 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %429)
  %431 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %430) #10
  %432 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %430) #10
  %433 = tail call <32 x i32> @llvm.hexagon.V6.vshufeh.128B(<32 x i32> %432, <32 x i32> %431) #10
  %434 = bitcast <32 x i32> %433 to <64 x i16>
  %435 = shufflevector <64 x i16> %434, <64 x i16> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %436 = add <32 x i16> %326, %435
  %437 = bitcast <32 x i16> %436 to <8 x i64>
  %matrix_mul1.sroa.0.64.vec.expand32 = shufflevector <8 x i64> %437, <8 x i64> poison, <16 x i32> <i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %matrix_mul1.sroa.0.64.vecblend33 = shufflevector <16 x i64> %matrix_mul1.sroa.0.0.vec.expand23, <16 x i64> %matrix_mul1.sroa.0.64.vec.expand32, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %438 = getelementptr inbounds i16, i16* %97, i32 3
  %439 = load i16, i16* %438, align 2, !tbaa !272
  %440 = insertelement <32 x i16> undef, i16 %439, i32 0
  %441 = shufflevector <32 x i16> %440, <32 x i16> undef, <64 x i32> <i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %442 = bitcast <64 x i16> %441 to <32 x i32>
  %443 = tail call <64 x i32> @llvm.hexagon.V6.vmpyuhv.128B(<32 x i32> %409, <32 x i32> %442) #10
  %444 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %443)
  %445 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %444)
  %446 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %445) #10
  %447 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %445) #10
  %448 = tail call <32 x i32> @llvm.hexagon.V6.vshufeh.128B(<32 x i32> %447, <32 x i32> %446) #10
  %449 = bitcast <32 x i32> %448 to <64 x i16>
  %450 = shufflevector <64 x i16> %449, <64 x i16> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %451 = add <32 x i16> %340, %450
  %452 = bitcast <32 x i16> %451 to <8 x i64>
  %matrix_mul1.sroa.20.128.vec.expand53 = shufflevector <8 x i64> %452, <8 x i64> poison, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %453 = tail call <64 x i32> @llvm.hexagon.V6.vmpyuhv.128B(<32 x i32> %427, <32 x i32> %442) #10
  %454 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %453)
  %455 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %454)
  %456 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %455) #10
  %457 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %455) #10
  %458 = tail call <32 x i32> @llvm.hexagon.V6.vshufeh.128B(<32 x i32> %457, <32 x i32> %456) #10
  %459 = bitcast <32 x i32> %458 to <64 x i16>
  %460 = shufflevector <64 x i16> %459, <64 x i16> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %461 = add <32 x i16> %349, %460
  %462 = bitcast <32 x i16> %461 to <8 x i64>
  %matrix_mul1.sroa.20.192.vec.expand62 = shufflevector <8 x i64> %462, <8 x i64> poison, <16 x i32> <i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %matrix_mul1.sroa.20.192.vecblend63 = shufflevector <16 x i64> %matrix_mul1.sroa.20.128.vec.expand53, <16 x i64> %matrix_mul1.sroa.20.192.vec.expand62, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %463 = getelementptr inbounds i16, i16* %125, i32 3
  %464 = load i16, i16* %463, align 2, !tbaa !272
  %465 = insertelement <32 x i16> undef, i16 %464, i32 0
  %466 = shufflevector <32 x i16> %465, <32 x i16> undef, <64 x i32> <i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %467 = bitcast <64 x i16> %466 to <32 x i32>
  %468 = tail call <64 x i32> @llvm.hexagon.V6.vmpyuhv.128B(<32 x i32> %409, <32 x i32> %467) #10
  %469 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %468)
  %470 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %469)
  %471 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %470) #10
  %472 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %470) #10
  %473 = tail call <32 x i32> @llvm.hexagon.V6.vshufeh.128B(<32 x i32> %472, <32 x i32> %471) #10
  %474 = bitcast <32 x i32> %473 to <64 x i16>
  %475 = shufflevector <64 x i16> %474, <64 x i16> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %476 = add <32 x i16> %363, %475
  %477 = bitcast <32 x i16> %476 to <8 x i64>
  %matrix_mul1.sroa.40.256.vec.expand83 = shufflevector <8 x i64> %477, <8 x i64> poison, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %478 = tail call <64 x i32> @llvm.hexagon.V6.vmpyuhv.128B(<32 x i32> %427, <32 x i32> %467) #10
  %479 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %478)
  %480 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %479)
  %481 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %480) #10
  %482 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %480) #10
  %483 = tail call <32 x i32> @llvm.hexagon.V6.vshufeh.128B(<32 x i32> %482, <32 x i32> %481) #10
  %484 = bitcast <32 x i32> %483 to <64 x i16>
  %485 = shufflevector <64 x i16> %484, <64 x i16> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %486 = add <32 x i16> %372, %485
  %487 = bitcast <32 x i16> %486 to <8 x i64>
  %matrix_mul1.sroa.40.320.vec.expand92 = shufflevector <8 x i64> %487, <8 x i64> poison, <16 x i32> <i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %matrix_mul1.sroa.40.320.vecblend93 = shufflevector <16 x i64> %matrix_mul1.sroa.40.256.vec.expand83, <16 x i64> %matrix_mul1.sroa.40.320.vec.expand92, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %488 = getelementptr inbounds i16, i16* %153, i32 3
  %489 = load i16, i16* %488, align 2, !tbaa !272
  %490 = insertelement <32 x i16> undef, i16 %489, i32 0
  %491 = shufflevector <32 x i16> %490, <32 x i16> undef, <64 x i32> <i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %492 = bitcast <64 x i16> %491 to <32 x i32>
  %493 = tail call <64 x i32> @llvm.hexagon.V6.vmpyuhv.128B(<32 x i32> %409, <32 x i32> %492) #10
  %494 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %493)
  %495 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %494)
  %496 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %495) #10
  %497 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %495) #10
  %498 = tail call <32 x i32> @llvm.hexagon.V6.vshufeh.128B(<32 x i32> %497, <32 x i32> %496) #10
  %499 = bitcast <32 x i32> %498 to <64 x i16>
  %500 = shufflevector <64 x i16> %499, <64 x i16> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %501 = add <32 x i16> %386, %500
  %502 = bitcast <32 x i16> %501 to <8 x i64>
  %matrix_mul1.sroa.60.384.vec.expand113 = shufflevector <8 x i64> %502, <8 x i64> poison, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %503 = tail call <64 x i32> @llvm.hexagon.V6.vmpyuhv.128B(<32 x i32> %427, <32 x i32> %492) #10
  %504 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %503)
  %505 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %504)
  %506 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %505) #10
  %507 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %505) #10
  %508 = tail call <32 x i32> @llvm.hexagon.V6.vshufeh.128B(<32 x i32> %507, <32 x i32> %506) #10
  %509 = bitcast <32 x i32> %508 to <64 x i16>
  %510 = shufflevector <64 x i16> %509, <64 x i16> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %511 = add <32 x i16> %395, %510
  %512 = bitcast <32 x i16> %511 to <8 x i64>
  %matrix_mul1.sroa.60.448.vec.expand122 = shufflevector <8 x i64> %512, <8 x i64> poison, <16 x i32> <i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %matrix_mul1.sroa.60.448.vecblend123 = shufflevector <16 x i64> %matrix_mul1.sroa.60.384.vec.expand113, <16 x i64> %matrix_mul1.sroa.60.448.vec.expand122, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %513 = add nuw nsw i32 %"matrix_mul.s1.k$x.k$x", 1
  %.not = icmp eq i32 %513, 32
  br i1 %.not, label %"consume matrix_mul", label %"for matrix_mul.s1.k$x.k$x"

"consume matrix_mul":                             ; preds = %"for matrix_mul.s1.k$x.k$x"
  %514 = mul nsw i32 %out.s0.y.min_2, %out.stride.1
  %515 = add nsw i32 %514, %29
  %516 = getelementptr inbounds i16, i16* %out, i32 %515
  %517 = bitcast i16* %516 to <32 x i16>*
  store <32 x i16> %419, <32 x i16>* %517, align 2, !tbaa !274
  %518 = shufflevector <16 x i64> %matrix_mul1.sroa.0.64.vecblend33, <16 x i64> undef, <8 x i32> <i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11>
  %519 = getelementptr inbounds i16, i16* %516, i32 16
  %520 = bitcast i16* %519 to <8 x i64>*
  store <8 x i64> %518, <8 x i64>* %520, align 2, !tbaa !274
  %521 = or i32 %out.s0.y.min_2, 1
  %522 = mul nsw i32 %521, %out.stride.1
  %523 = add nsw i32 %522, %29
  %524 = getelementptr inbounds i16, i16* %out, i32 %523
  %525 = bitcast i16* %524 to <32 x i16>*
  store <32 x i16> %451, <32 x i16>* %525, align 2, !tbaa !274
  %526 = shufflevector <16 x i64> %matrix_mul1.sroa.20.192.vecblend63, <16 x i64> undef, <8 x i32> <i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11>
  %527 = getelementptr inbounds i16, i16* %524, i32 16
  %528 = bitcast i16* %527 to <8 x i64>*
  store <8 x i64> %526, <8 x i64>* %528, align 2, !tbaa !274
  %529 = or i32 %out.s0.y.min_2, 2
  %530 = mul nsw i32 %529, %out.stride.1
  %531 = add nsw i32 %530, %29
  %532 = getelementptr inbounds i16, i16* %out, i32 %531
  %533 = bitcast i16* %532 to <32 x i16>*
  store <32 x i16> %476, <32 x i16>* %533, align 2, !tbaa !274
  %534 = shufflevector <16 x i64> %matrix_mul1.sroa.40.320.vecblend93, <16 x i64> undef, <8 x i32> <i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11>
  %535 = getelementptr inbounds i16, i16* %532, i32 16
  %536 = bitcast i16* %535 to <8 x i64>*
  store <8 x i64> %534, <8 x i64>* %536, align 2, !tbaa !274
  %537 = or i32 %out.s0.y.min_2, 3
  %538 = mul nsw i32 %537, %out.stride.1
  %539 = add nsw i32 %538, %29
  %540 = getelementptr inbounds i16, i16* %out, i32 %539
  %541 = bitcast i16* %540 to <32 x i16>*
  store <32 x i16> %501, <32 x i16>* %541, align 2, !tbaa !274
  %542 = shufflevector <16 x i64> %matrix_mul1.sroa.60.448.vecblend123, <16 x i64> undef, <8 x i32> <i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11>
  %543 = getelementptr inbounds i16, i16* %540, i32 16
  %544 = bitcast i16* %543 to <8 x i64>*
  store <8 x i64> %542, <8 x i64>* %544, align 2, !tbaa !274
  %545 = add nuw nsw i32 %out.s0.y.yi.yi, 1
  %.not3 = icmp eq i32 %545, 12
  br i1 %.not3, label %if.then.i, label %"for out.s0.y.yi.yi"
}

; Function Attrs: nounwind
define i32 @matmul_argv(i8** nocapture readonly %0) local_unnamed_addr #10 {
entry:
  %1 = bitcast i8** %0 to %struct.halide_buffer_t**
  %2 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %1, align 4
  %3 = getelementptr i8*, i8** %0, i32 1
  %4 = bitcast i8** %3 to %struct.halide_buffer_t**
  %5 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %4, align 4
  %6 = getelementptr i8*, i8** %0, i32 2
  %7 = bitcast i8** %6 to %struct.halide_buffer_t**
  %8 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %7, align 4
  %9 = tail call i32 @matmul(%struct.halide_buffer_t* %2, %struct.halide_buffer_t* %5, %struct.halide_buffer_t* %8) #14
  ret i32 %9
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define nonnull %struct.halide_filter_metadata_t* @matmul_metadata() local_unnamed_addr #11 {
entry:
  ret %struct.halide_filter_metadata_t* @matmul_metadata_storage
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.abs.i64(i64, i1 immarg) #7

attributes #0 = { mustprogress nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { "frame-pointer"="all" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #2 = { argmemonly nofree nosync nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { alwaysinline mustprogress nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #7 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #8 = { nounwind readnone }
attributes #9 = { nounwind "reciprocal-estimates"="none" }
attributes #10 = { nounwind }
attributes #11 = { mustprogress nofree norecurse nosync nounwind readnone willreturn }
attributes #12 = { nobuiltin nounwind "no-builtins" }
attributes #13 = { nobuiltin "no-builtins" }
attributes #14 = { noinline }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10, !10, !10, !10, !10, !10, !10, !10, !10, !10, !10, !10, !10, !10, !10, !10, !10, !10, !10, !10, !10, !10, !10, !10, !10, !10}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 7, !"frame-pointer", i32 2}
!3 = !{i32 2, !"halide_use_soft_float_abi", i32 0}
!4 = !{i32 2, !"halide_mcpu", !"hexagonv62"}
!5 = !{i32 2, !"halide_mattrs", !"+hvx-length128b,+long-calls,+hvxv62"}
!6 = !{i32 2, !"halide_mabi", !""}
!7 = !{i32 2, !"halide_use_pic", i32 1}
!8 = !{i32 2, !"halide_use_large_code_model", i32 0}
!9 = !{i32 2, !"halide_per_instruction_fast_math_flags", i32 0}
!10 = !{!"clang version 13.0.0 (https://github.com/llvm/llvm-project.git d7b669b3a30345cfcdb2fde2af6f48aa4b94845d)"}
!11 = !{!12, !12, i64 0}
!12 = !{!"any pointer", !13, i64 0}
!13 = !{!"omnipotent char", !14, i64 0}
!14 = !{!"Simple C++ TBAA"}
!15 = !{!13, !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"bool", !13, i64 0}
!18 = !{i8 0, i8 2}
!19 = !{!20, !20, i64 0}
!20 = !{!"long long", !13, i64 0}
!21 = !{!22, !12, i64 0}
!22 = !{!"_ZTSN6Halide7Runtime8Internal4workE", !23, i64 0, !12, i64 56, !12, i64 64, !12, i64 72, !24, i64 80, !12, i64 88, !24, i64 96, !12, i64 104, !24, i64 112, !24, i64 116, !24, i64 120, !17, i64 124}
!23 = !{!"_ZTS22halide_parallel_task_t", !12, i64 0, !12, i64 8, !12, i64 16, !12, i64 24, !24, i64 32, !24, i64 36, !24, i64 40, !24, i64 44, !17, i64 48}
!24 = !{!"int", !13, i64 0}
!25 = !{!22, !24, i64 36}
!26 = !{!22, !24, i64 40}
!27 = !{!22, !17, i64 48}
!28 = !{!22, !12, i64 24}
!29 = !{!22, !24, i64 32}
!30 = !{!22, !12, i64 8}
!31 = !{!22, !24, i64 44}
!32 = !{!22, !12, i64 16}
!33 = !{!22, !12, i64 56}
!34 = !{!22, !12, i64 104}
!35 = !{!22, !24, i64 116}
!36 = !{!22, !24, i64 112}
!37 = !{!22, !24, i64 120}
!38 = !{!22, !17, i64 124}
!39 = !{!22, !12, i64 72}
!40 = !{!22, !24, i64 80}
!41 = !{!22, !12, i64 88}
!42 = !{!43, !43, i64 0}
!43 = !{!"vtable pointer", !14, i64 0}
!44 = !{!45, !12, i64 8}
!45 = !{!"_ZTSN6Halide7Runtime8Internal15Synchronization21mutex_parking_controlE", !12, i64 8}
!46 = distinct !{!46, !47}
!47 = !{!"llvm.loop.mustprogress"}
!48 = !{!49, !17, i64 2121}
!49 = !{!"_ZTSN6Halide7Runtime8Internal12work_queue_tE", !50, i64 0, !24, i64 8, !24, i64 12, !12, i64 16, !24, i64 24, !24, i64 28, !24, i64 32, !51, i64 40, !51, i64 48, !51, i64 56, !24, i64 64, !24, i64 68, !13, i64 72, !17, i64 2120, !17, i64 2121, !24, i64 2124}
!50 = !{!"_ZTS12halide_mutex", !13, i64 0}
!51 = !{!"_ZTS11halide_cond", !13, i64 0}
!52 = !{!49, !24, i64 8}
!53 = distinct !{!53, !54}
!54 = !{!"llvm.loop.unroll.disable"}
!55 = !{!49, !24, i64 24}
!56 = !{!49, !24, i64 2124}
!57 = !{!49, !24, i64 28}
!58 = distinct !{!58, !47}
!59 = !{!22, !24, i64 96}
!60 = !{!49, !12, i64 16}
!61 = !{!22, !12, i64 64}
!62 = distinct !{!62, !54}
!63 = !{!49, !24, i64 68}
!64 = !{!49, !24, i64 32}
!65 = distinct !{!65, !47}
!66 = distinct !{!66, !47}
!67 = distinct !{!67, !47}
!68 = !{!49, !17, i64 2120}
!69 = distinct !{!69, !47}
!70 = !{!71, !12, i64 0}
!71 = !{!"_ZTS26halide_semaphore_acquire_t", !12, i64 0, !24, i64 8}
!72 = !{!71, !24, i64 8}
!73 = distinct !{!73, !47}
!74 = distinct !{!74, !47}
!75 = !{!49, !24, i64 64}
!76 = distinct !{!76, !47}
!77 = distinct !{!77, !47}
!78 = !{i64 0, i64 8, !11, i64 8, i64 8, !11, i64 16, i64 8, !11, i64 24, i64 8, !11, i64 32, i64 4, !79, i64 36, i64 4, !79, i64 40, i64 4, !79, i64 44, i64 4, !79, i64 48, i64 1, !16, i64 56, i64 8, !11, i64 64, i64 8, !11, i64 72, i64 8, !11, i64 80, i64 4, !79, i64 88, i64 8, !11, i64 96, i64 4, !79, i64 104, i64 8, !11, i64 112, i64 4, !79, i64 116, i64 4, !79, i64 120, i64 4, !79, i64 124, i64 1, !16}
!79 = !{!24, !24, i64 0}
!80 = !{i64 0, i64 8, !11, i64 8, i64 8, !11, i64 16, i64 8, !11, i64 24, i64 4, !79, i64 28, i64 4, !79, i64 32, i64 4, !79, i64 36, i64 4, !79, i64 40, i64 1, !16, i64 48, i64 8, !11, i64 56, i64 8, !11, i64 64, i64 8, !11, i64 72, i64 4, !79, i64 80, i64 8, !11, i64 88, i64 4, !79, i64 96, i64 8, !11, i64 104, i64 4, !79, i64 108, i64 4, !79, i64 112, i64 4, !79, i64 116, i64 1, !16}
!81 = !{i64 0, i64 8, !11, i64 8, i64 8, !11, i64 16, i64 8, !11, i64 24, i64 4, !79, i64 32, i64 8, !11, i64 40, i64 4, !79, i64 48, i64 8, !11, i64 56, i64 4, !79, i64 60, i64 4, !79, i64 64, i64 4, !79, i64 68, i64 1, !16}
!82 = !{i64 0, i64 8, !11, i64 8, i64 4, !79, i64 12, i64 4, !79, i64 16, i64 4, !79, i64 20, i64 1, !16}
!83 = distinct !{!83, !54}
!84 = distinct !{!84, !47}
!85 = distinct !{!85, !47}
!86 = !{!87, !12, i64 144}
!87 = !{!"_ZTSN6Halide7Runtime8Internal15Synchronization10queue_dataE", !88, i64 0, !20, i64 136, !12, i64 144, !20, i64 152}
!88 = !{!"_ZTSN6Halide7Runtime8Internal15Synchronization13thread_parkerE", !89, i64 0, !90, i64 64, !17, i64 128}
!89 = !{!"_ZTS15pthread_mutex_t", !13, i64 0}
!90 = !{!"_ZTS14pthread_cond_t", !13, i64 0}
!91 = !{!92, !12, i64 16}
!92 = !{!"_ZTSN6Halide7Runtime8Internal15Synchronization11hash_bucketE", !93, i64 0, !12, i64 8, !12, i64 16}
!93 = !{!"_ZTSN6Halide7Runtime8Internal15Synchronization9word_lockE", !20, i64 0}
!94 = distinct !{!94, !47}
!95 = !{!87, !20, i64 152}
!96 = !{!88, !17, i64 128}
!97 = distinct !{!97, !47}
!98 = !{!99, !12, i64 152}
!99 = !{!"_ZTSN6Halide7Runtime8Internal15Synchronization20word_lock_queue_dataE", !88, i64 0, !12, i64 136, !12, i64 144, !12, i64 152}
!100 = !{!99, !12, i64 136}
!101 = !{!99, !12, i64 144}
!102 = distinct !{!102, !47}
!103 = distinct !{!103, !47}
!104 = distinct !{!104, !47}
!105 = distinct !{!105, !47}
!106 = distinct !{!106, !47}
!107 = !{!108, !12, i64 8}
!108 = !{!"_ZTSN6Halide7Runtime8Internal15Synchronization25broadcast_parking_controlE", !12, i64 8, !12, i64 16}
!109 = !{!108, !12, i64 16}
!110 = !{!111, !12, i64 8}
!111 = !{!"_ZTSN6Halide7Runtime8Internal15Synchronization20wait_parking_controlE", !12, i64 8, !12, i64 16}
!112 = !{!111, !12, i64 16}
!113 = !{!87, !20, i64 136}
!114 = !{!115, !17, i64 0}
!115 = !{!"_ZTSN6Halide7Runtime8Internal15Synchronization15validate_actionE", !17, i64 0, !20, i64 8}
!116 = !{!115, !20, i64 8}
!117 = !{!92, !12, i64 8}
!118 = !{!119, !12, i64 0}
!119 = !{!"_ZTSN6Halide7Runtime8Internal15Synchronization11bucket_pairE", !12, i64 0, !12, i64 8}
!120 = distinct !{!120, !47}
!121 = !{!119, !12, i64 8}
!122 = !{!123, !12, i64 0}
!123 = !{!"_ZTSN6Halide7Runtime8Internal14spawned_threadE", !12, i64 0, !12, i64 8, !124, i64 16}
!124 = !{!"long", !13, i64 0}
!125 = !{!123, !12, i64 8}
!126 = !{!123, !124, i64 16}
!127 = !{!23, !24, i64 40}
!128 = !{i64 0, i64 8, !11, i64 8, i64 8, !11, i64 16, i64 8, !11, i64 24, i64 8, !11, i64 32, i64 4, !79, i64 36, i64 4, !79, i64 40, i64 4, !79, i64 44, i64 4, !79, i64 48, i64 1, !16}
!129 = distinct !{!129, !47}
!130 = distinct !{!130, !54}
!131 = distinct !{!131, !47}
!132 = distinct !{!132, !47}
!133 = !{!134, !12, i64 8}
!134 = !{!"_ZTSN6Halide7Runtime8Internal15Synchronization22signal_parking_controlE", !12, i64 8, !12, i64 16}
!135 = !{!134, !12, i64 16}
!136 = !{!137, !12, i64 0}
!137 = !{!"_ZTS18halide_mutex_array", !12, i64 0}
!138 = distinct !{!138, !47}
!139 = distinct !{!139, !47}
!140 = distinct !{!140, !47}
!141 = !{!142, !142, i64 0}
!142 = !{!"double", !13, i64 0}
!143 = distinct !{!143, !47}
!144 = distinct !{!144, !47}
!145 = distinct !{!145, !54}
!146 = distinct !{!146, !47}
!147 = distinct !{!147, !47}
!148 = !{!149, !150, i64 0}
!149 = !{!"_ZTS13halide_type_t", !150, i64 0, !13, i64 1, !151, i64 2}
!150 = !{!"_ZTS18halide_type_code_t", !13, i64 0}
!151 = !{!"short", !13, i64 0}
!152 = !{!149, !13, i64 1}
!153 = !{!149, !151, i64 2}
!154 = !{!155, !20, i64 0}
!155 = !{!"_ZTS15halide_buffer_t", !20, i64 0, !12, i64 8, !12, i64 16, !20, i64 24, !149, i64 32, !24, i64 36, !12, i64 40, !12, i64 48}
!156 = !{!155, !12, i64 8}
!157 = !{!155, !12, i64 16}
!158 = !{!155, !20, i64 24}
!159 = !{!155, !24, i64 36}
!160 = !{!155, !12, i64 40}
!161 = !{!162, !24, i64 0}
!162 = !{!"_ZTS18halide_dimension_t", !24, i64 0, !24, i64 4, !24, i64 8, !24, i64 12}
!163 = !{!162, !24, i64 4}
!164 = !{!162, !24, i64 8}
!165 = distinct !{!165, !47}
!166 = !{!167, !12, i64 0}
!167 = !{!"_ZTS29halide_device_allocation_pool", !12, i64 0, !12, i64 8}
!168 = distinct !{!168, !47}
!169 = !{!167, !12, i64 8}
!170 = distinct !{!170, !47}
!171 = !{!172, !20, i64 0}
!172 = !{!"_ZTSN6Halide7Runtime8Internal11device_copyE", !20, i64 0, !20, i64 8, !20, i64 16, !13, i64 24, !13, i64 152, !13, i64 280, !20, i64 408}
!173 = !{!172, !20, i64 8}
!174 = !{!172, !20, i64 408}
!175 = distinct !{!175, !47}
!176 = !{!172, !20, i64 16}
!177 = distinct !{!177, !54}
!178 = distinct !{!178, !47}
!179 = distinct !{!179, !47}
!180 = distinct !{!180, !54}
!181 = distinct !{!181, !47}
!182 = distinct !{!182, !47}
!183 = distinct !{!183, !47}
!184 = !{i64 0, i64 8, !19, i64 8, i64 8, !19, i64 16, i64 8, !19, i64 24, i64 128, !15, i64 152, i64 128, !15, i64 280, i64 128, !15, i64 408, i64 8, !19}
!185 = !{!186, !12, i64 120}
!186 = !{!"_ZTS25halide_device_interface_t", !12, i64 0, !12, i64 8, !12, i64 16, !12, i64 24, !12, i64 32, !12, i64 40, !12, i64 48, !12, i64 56, !12, i64 64, !12, i64 72, !12, i64 80, !12, i64 88, !12, i64 96, !12, i64 104, !12, i64 112, !12, i64 120}
!187 = !{!188, !12, i64 48}
!188 = !{!"_ZTS30halide_device_interface_impl_t", !12, i64 0, !12, i64 8, !12, i64 16, !12, i64 24, !12, i64 32, !12, i64 40, !12, i64 48, !12, i64 56, !12, i64 64, !12, i64 72, !12, i64 80, !12, i64 88, !12, i64 96, !12, i64 104, !12, i64 112, !12, i64 120}
!189 = !{!188, !12, i64 40}
!190 = !{!188, !12, i64 56}
!191 = !{!188, !12, i64 0}
!192 = !{!188, !12, i64 16}
!193 = !{!188, !12, i64 8}
!194 = !{!188, !12, i64 32}
!195 = !{!188, !12, i64 24}
!196 = !{!188, !12, i64 64}
!197 = !{!188, !12, i64 72}
!198 = distinct !{!198, !54}
!199 = distinct !{!199, !54}
!200 = distinct !{!200, !47}
!201 = distinct !{!201, !47}
!202 = !{!188, !12, i64 112}
!203 = !{!188, !12, i64 120}
!204 = !{!188, !12, i64 80}
!205 = !{!188, !12, i64 88}
!206 = !{!188, !12, i64 96}
!207 = !{!188, !12, i64 104}
!208 = !{i32 22, i32 33}
!209 = !{!210, !12, i64 40}
!210 = !{!"_ZTS21halide_profiler_state", !50, i64 0, !24, i64 8, !24, i64 12, !24, i64 16, !24, i64 20, !12, i64 24, !12, i64 32, !12, i64 40}
!211 = !{!210, !24, i64 16}
!212 = !{!213, !20, i64 0}
!213 = !{!"_ZTS30halide_profiler_pipeline_stats", !20, i64 0, !20, i64 8, !20, i64 16, !20, i64 24, !20, i64 32, !20, i64 40, !12, i64 48, !12, i64 56, !12, i64 64, !24, i64 72, !24, i64 76, !24, i64 80, !24, i64 84, !24, i64 88}
!214 = !{!213, !24, i64 80}
!215 = !{!213, !20, i64 32}
!216 = !{!213, !20, i64 40}
!217 = !{!213, !12, i64 48}
!218 = !{!213, !24, i64 84}
!219 = !{!213, !24, i64 88}
!220 = !{!213, !20, i64 16}
!221 = !{!213, !20, i64 24}
!222 = !{!213, !24, i64 72}
!223 = !{!213, !12, i64 56}
!224 = distinct !{!224, !47}
!225 = !{!226, !20, i64 32}
!226 = !{!"_ZTS26halide_profiler_func_stats", !20, i64 0, !20, i64 8, !20, i64 16, !20, i64 24, !20, i64 32, !20, i64 40, !20, i64 48, !12, i64 56, !24, i64 64}
!227 = !{!226, !20, i64 0}
!228 = !{!226, !12, i64 56}
!229 = distinct !{!229, !47}
!230 = distinct !{!230, !47}
!231 = distinct !{!231, !47}
!232 = !{!226, !20, i64 40}
!233 = !{!226, !20, i64 48}
!234 = distinct !{!234, !47}
!235 = !{!226, !20, i64 16}
!236 = distinct !{!236, !47}
!237 = !{!226, !24, i64 64}
!238 = distinct !{!238, !47}
!239 = !{!226, !20, i64 24}
!240 = distinct !{!240, !47}
!241 = distinct !{!241, !47}
!242 = !{!210, !12, i64 24}
!243 = !{!213, !12, i64 64}
!244 = distinct !{!244, !47}
!245 = !{!210, !24, i64 12}
!246 = distinct !{!246, !47}
!247 = !{!213, !24, i64 76}
!248 = !{!213, !20, i64 8}
!249 = !{!226, !20, i64 8}
!250 = distinct !{!250, !54}
!251 = distinct !{!251, !47}
!252 = distinct !{!252, !47}
!253 = distinct !{!253, !47}
!254 = !{!210, !12, i64 32}
!255 = !{!210, !24, i64 20}
!256 = !{!210, !24, i64 8}
!257 = distinct !{!257, !47}
!258 = distinct !{!258, !47}
!259 = distinct !{!259, !47}
!260 = !{!"branch_weights", i32 0, i32 1073741824}
!261 = !{!155, !150, i64 32}
!262 = !{!155, !13, i64 33}
!263 = !{!155, !151, i64 34}
!264 = !{i64 0, i64 4, !79, i64 4, i64 4, !79, i64 8, i64 4, !79, i64 12, i64 4, !79}
!265 = !{i64 0, i64 64}
!266 = !{!"branch_weights", i32 1073741824, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0}
!267 = !{!"branch_weights", i32 1073741824, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0}
!268 = !{!"branch_weights", i32 1073741824, i32 0}
!269 = !{!270, !270, i64 0}
!270 = !{!"B", !271, i64 0}
!271 = !{!"Halide buffer"}
!272 = !{!273, !273, i64 0}
!273 = !{!"A", !271, i64 0}
!274 = !{!275, !275, i64 0}
!275 = !{!"out", !271, i64 0}
