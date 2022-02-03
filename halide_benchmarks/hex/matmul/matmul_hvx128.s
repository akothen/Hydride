	.text
	.file	"posix_allocator.cpp"
	.section	.text.halide_default_malloc,"ax",@progbits
	.weak	halide_default_malloc           // -- Begin function halide_default_malloc
	.p2align	4
	.type	halide_default_malloc,@function
halide_default_malloc:                  // @halide_default_malloc
// %bb.0:                               // %entry
	{
		r0 = #128
		r1 = #0
		allocframe(#0)
	}
	{
		call ##malloc
		r1:0 = add(r3:2,r1:0)
	}
	{
		r1 = add(r0,#135)
		p0 = cmp.eq(r0,#0)
	}
	{
		r1 = and(r1,#-128)
	}
	{
		if (p0) r1 = #0
		if (!p0) memw(r1+##-4) = r0
	}
	{
		r0 = r1
		dealloc_return
	}
.Lfunc_end0:
	.size	halide_default_malloc, .Lfunc_end0-halide_default_malloc
                                        // -- End function
	.section	.text.halide_default_free,"ax",@progbits
	.weak	halide_default_free             // -- Begin function halide_default_free
	.p2align	4
	.type	halide_default_free,@function
halide_default_free:                    // @halide_default_free
// %bb.0:                               // %entry
	{
		jump ##free
		r0 = memw(r1+#-8)
	}
.Lfunc_end1:
	.size	halide_default_free, .Lfunc_end1-halide_default_free
                                        // -- End function
	.section	.text.halide_set_custom_malloc,"ax",@progbits
	.weak	halide_set_custom_malloc        // -- Begin function halide_set_custom_malloc
	.p2align	4
	.type	halide_set_custom_malloc,@function
halide_set_custom_malloc:               // @halide_set_custom_malloc
// %bb.0:                               // %entry
	{
		r1 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
	}
	{
		r2 = memw(r1+##_ZN6Halide7Runtime8Internal13custom_mallocE@GOT)
	}
	{
		r1 = memw(r2+#0)
		memw(r2+#0) = r0
	}
	{
		r0 = r1
		jumpr r31
	}
.Lfunc_end2:
	.size	halide_set_custom_malloc, .Lfunc_end2-halide_set_custom_malloc
                                        // -- End function
	.section	.text.halide_set_custom_free,"ax",@progbits
	.weak	halide_set_custom_free          // -- Begin function halide_set_custom_free
	.p2align	4
	.type	halide_set_custom_free,@function
halide_set_custom_free:                 // @halide_set_custom_free
// %bb.0:                               // %entry
	{
		r1 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
	}
	{
		r2 = memw(r1+##_ZN6Halide7Runtime8Internal11custom_freeE@GOT)
	}
	{
		r1 = memw(r2+#0)
		memw(r2+#0) = r0
	}
	{
		r0 = r1
		jumpr r31
	}
.Lfunc_end3:
	.size	halide_set_custom_free, .Lfunc_end3-halide_set_custom_free
                                        // -- End function
	.section	.text.halide_malloc,"ax",@progbits
	.weak	halide_malloc                   // -- Begin function halide_malloc
	.p2align	4
	.type	halide_malloc,@function
halide_malloc:                          // @halide_malloc
// %bb.0:                               // %entry
	{
		r1 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		allocframe(r29,#0):raw
	}
	{
		r1 = memw(r1+##_ZN6Halide7Runtime8Internal13custom_mallocE@GOT)
	}
	{
		r1 = memw(r1+#0)
	}
	{
		callr r1
	}
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end4:
	.size	halide_malloc, .Lfunc_end4-halide_malloc
                                        // -- End function
	.section	.text.halide_free,"ax",@progbits
	.weak	halide_free                     // -- Begin function halide_free
	.p2align	4
	.type	halide_free,@function
halide_free:                            // @halide_free
// %bb.0:                               // %entry
	{
		r2 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		allocframe(r29,#0):raw
	}
	{
		r2 = memw(r2+##_ZN6Halide7Runtime8Internal11custom_freeE@GOT)
	}
	{
		r2 = memw(r2+#0)
	}
	{
		callr r2
	}
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end5:
	.size	halide_free, .Lfunc_end5-halide_free
                                        // -- End function
	.section	.text.halide_default_error,"ax",@progbits
	.weak	halide_default_error            // -- Begin function halide_default_error
	.p2align	4
	.type	halide_default_error,@function
halide_default_error:                   // @halide_default_error
// %bb.0:                               // %entry
	{
		r17:16 = combine(r0,r1)
		memd(r29+#-16) = r17:16
		allocframe(r29,#4120):raw
	}                                       // 8-byte Folded Spill
	{
		r2 = add(pc,##.L.str@PCREL)
		r0 = add(r29,#0)
	}
	{
		r18 = add(r29,#0)
		memd(r29+#4104) = r19:18
	}                                       // 8-byte Folded Spill
	{
		call ##halide_string_to_string
		r1 = add(r18,#4094)
	}
	{
		call ##halide_string_to_string
		r1 = add(r0,#4094)
		r2 = r16
	}
	{
		r4 = r0
		r1 = #0
		r3:2 = combine(#0,#1)
		r0 = memb(r0+#-1)
	}
	{
		r19 = r1
	}
	{
		p0 = cmp.eq(r0,#10)
		if (p0.new) r0 = add(r4,#0)
		if (!p0.new) memb(r4+#0) = #10
		if (!p0.new) memb(r4+#1) = #0
	}
	{
		if (!p0) r0 = add(r4,#1)
	}
	{
		r7:6 = sub(r1:0,r19:18)
		r1 = add(r29,#0)
		r0 = r17
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = add(r7:6,r3:2)
	}
	{
		call ##halide_print
		r1 = add(r29,#0)
		r0 = r17
	}
	{
		call ##abort
	}
	{
		r17:16 = memd(r29+#4112)
		r19:18 = memd(r29+#4104)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end6:
	.size	halide_default_error, .Lfunc_end6-halide_default_error
                                        // -- End function
	.section	.text.halide_error,"ax",@progbits
	.weak	halide_error                    // -- Begin function halide_error
	.p2align	4
	.type	halide_error,@function
halide_error:                           // @halide_error
// %bb.0:                               // %entry
	{
		r2 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		allocframe(r29,#0):raw
	}
	{
		r2 = memw(r2+##_ZN6Halide7Runtime8Internal13error_handlerE@GOT)
	}
	{
		r2 = memw(r2+#0)
	}
	{
		callr r2
	}
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end7:
	.size	halide_error, .Lfunc_end7-halide_error
                                        // -- End function
	.section	.text.halide_set_error_handler,"ax",@progbits
	.weak	halide_set_error_handler        // -- Begin function halide_set_error_handler
	.p2align	4
	.type	halide_set_error_handler,@function
halide_set_error_handler:               // @halide_set_error_handler
// %bb.0:                               // %entry
	{
		r1 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
	}
	{
		r2 = memw(r1+##_ZN6Halide7Runtime8Internal13error_handlerE@GOT)
	}
	{
		r1 = memw(r2+#0)
		memw(r2+#0) = r0
	}
	{
		r0 = r1
		jumpr r31
	}
.Lfunc_end8:
	.size	halide_set_error_handler, .Lfunc_end8-halide_set_error_handler
                                        // -- End function
	.section	.text.halide_print,"ax",@progbits
	.weak	halide_print                    // -- Begin function halide_print
	.p2align	4
	.type	halide_print,@function
halide_print:                           // @halide_print
// %bb.0:                               // %entry
	{
		r2 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		allocframe(r29,#0):raw
	}
	{
		r2 = memw(r2+##_ZN6Halide7Runtime8Internal12custom_printE@GOT)
	}
	{
		r2 = memw(r2+#0)
	}
	{
		callr r2
	}
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end9:
	.size	halide_print, .Lfunc_end9-halide_print
                                        // -- End function
	.section	.text.halide_set_custom_print,"ax",@progbits
	.weak	halide_set_custom_print         // -- Begin function halide_set_custom_print
	.p2align	4
	.type	halide_set_custom_print,@function
halide_set_custom_print:                // @halide_set_custom_print
// %bb.0:                               // %entry
	{
		r1 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
	}
	{
		r2 = memw(r1+##_ZN6Halide7Runtime8Internal12custom_printE@GOT)
	}
	{
		r1 = memw(r2+#0)
		memw(r2+#0) = r0
	}
	{
		r0 = r1
		jumpr r31
	}
.Lfunc_end10:
	.size	halide_set_custom_print, .Lfunc_end10-halide_set_custom_print
                                        // -- End function
	.section	.text.halide_start_clock,"ax",@progbits
	.weak	halide_start_clock              // -- Begin function halide_start_clock
	.p2align	4
	.type	halide_start_clock,@function
halide_start_clock:                     // @halide_start_clock
// %bb.0:                               // %entry
	{
		r16 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		memd(r29+#-16) = r17:16
		allocframe(#8)
	}                                       // 8-byte Folded Spill
	{
		r0 = memw(r16+##_ZN6Halide7Runtime8Internal29halide_reference_clock_initedE@GOT)
	}
	{
		r0 = memb(r0+#0)
	}
	{
		p0 = cmp.eq(r0,#0)
		if (!p0.new) r0 = #0
		if (!p0.new) r17:16 = memd(r29+#0)
		if (!p0.new) r31:30 = dealloc_return(r30):t:raw
	}                                       // 8-byte Folded Reload
.LBB11_1:                               // %if.then
	{
		r1 = #0
		r0 = memw(r16+##_ZN6Halide7Runtime8Internal22halide_reference_clockE@GOT)
	}
	{
		call ##gettimeofday
	}
	{
		r0 = memw(r16+##_ZN6Halide7Runtime8Internal29halide_reference_clock_initedE@GOT)
		r17:16 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r0 = #0
		memb(r0+#0) = #1
	}
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end11:
	.size	halide_start_clock, .Lfunc_end11-halide_start_clock
                                        // -- End function
	.section	.text.halide_current_time_ns,"ax",@progbits
	.weak	halide_current_time_ns          // -- Begin function halide_current_time_ns
	.p2align	4
	.type	halide_current_time_ns,@function
halide_current_time_ns:                 // @halide_current_time_ns
// %bb.0:                               // %entry
	{
		r1 = #0
		allocframe(#16)
	}
	{
		r29 = and(r29,#-16)
	}
	{
		call ##gettimeofday
		r0 = add(r29,#0)
	}
	{
		r0 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		r3:2 = memd(r29+#0)
	}
	{
		r1 = ##1000000
		r5:4 = memd(r29+#8)
	}
	{
		r0 = memw(r0+##_ZN6Halide7Runtime8Internal22halide_reference_clockE@GOT)
	}
	{
		r7:6 = memd(r0+#0)
	}
	{
		r3:2 = sub(r3:2,r7:6)
		r7:6 = memd(r0+#8)
	}
	{
		r9:8 = mpyu(r2,r1)
		r5:4 = sub(r5:4,r7:6)
		r6 = #1000
	}
	{
		r9 += mpyi(r1,r3)
	}
	{
		r5:4 = add(r9:8,r5:4)
	}
	{
		r1:0 = mpyu(r4,r6)
	}
	{
		r1 += mpyi(r6,r5)
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end12:
	.size	halide_current_time_ns, .Lfunc_end12-halide_current_time_ns
                                        // -- End function
	.section	.text.halide_sleep_ms,"ax",@progbits
	.weak	halide_sleep_ms                 // -- Begin function halide_sleep_ms
	.p2align	4
	.type	halide_sleep_ms,@function
halide_sleep_ms:                        // @halide_sleep_ms
// %bb.0:                               // %entry
	{
		r0 = +mpyi(r1,##1000)
		jump ##usleep
	}
.Lfunc_end13:
	.size	halide_sleep_ms, .Lfunc_end13-halide_sleep_ms
                                        // -- End function
	.section	.text.halide_default_print,"ax",@progbits
	.weak	halide_default_print            // -- Begin function halide_default_print
	.p2align	4
	.type	halide_default_print,@function
halide_default_print:                   // @halide_default_print
// %bb.0:                               // %entry
	{
		r0 = r1
		r16 = r1
		memd(r29+#-16) = r17:16
		allocframe(#8)
	}                                       // 8-byte Folded Spill
	{
		call ##strlen
	}
	{
		r3:2 = combine(r1,r0)
		r1:0 = combine(r16,#1)
		r17:16 = memd(r29+#0)
		deallocframe
	}                                       // 8-byte Folded Reload
	{
		jump ##write
	}
.Lfunc_end14:
	.size	halide_default_print, .Lfunc_end14-halide_default_print
                                        // -- End function
	.section	.text.halide_host_cpu_count,"ax",@progbits
	.weak	halide_host_cpu_count           // -- Begin function halide_host_cpu_count
	.p2align	4
	.type	halide_host_cpu_count,@function
halide_host_cpu_count:                  // @halide_host_cpu_count
// %bb.0:                               // %entry
	{
		call ##sysconf
		r0 = #84
		allocframe(r29,#0):raw
	}
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end15:
	.size	halide_host_cpu_count, .Lfunc_end15-halide_host_cpu_count
                                        // -- End function
	.section	.text.halide_thread_yield,"ax",@progbits
	.weak	halide_thread_yield             // -- Begin function halide_thread_yield
	.p2align	4
	.type	halide_thread_yield,@function
halide_thread_yield:                    // @halide_thread_yield
// %bb.0:                               // %entry
	{
		jump ##sched_yield
	}
.Lfunc_end16:
	.size	halide_thread_yield, .Lfunc_end16-halide_thread_yield
                                        // -- End function
	.section	.text.halide_default_do_task,"ax",@progbits
	.weak	halide_default_do_task          // -- Begin function halide_default_do_task
	.p2align	4
	.type	halide_default_do_task,@function
halide_default_do_task:                 // @halide_default_do_task
// %bb.0:                               // %entry
	{
		r1 = r2
		r2 = r3
		r4 = r1
		allocframe(#0)
	}
	{
		callr r4
	}
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end17:
	.size	halide_default_do_task, .Lfunc_end17-halide_default_do_task
                                        // -- End function
	.section	.text.halide_default_do_loop_task,"ax",@progbits
	.weak	halide_default_do_loop_task     // -- Begin function halide_default_do_loop_task
	.p2align	4
	.type	halide_default_do_loop_task,@function
halide_default_do_loop_task:            // @halide_default_do_loop_task
// %bb.0:                               // %entry
	{
		r1 = r2
		r2 = r3
		r6 = r1
		r3 = r4
	}
	{
		callr r6
		r4 = r5
		allocframe(#0)
	}
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end18:
	.size	halide_default_do_loop_task, .Lfunc_end18-halide_default_do_loop_task
                                        // -- End function
	.section	.text.halide_default_do_par_for,"ax",@progbits
	.weak	halide_default_do_par_for       // -- Begin function halide_default_do_par_for
	.p2align	4
	.type	halide_default_do_par_for,@function
halide_default_do_par_for:              // @halide_default_do_par_for
// %bb.0:                               // %entry
	{
		p0 = cmp.gt(r3,#0)
		if (!p0.new) r0 = #0
		if (!p0.new) jumpr:nt r31
	}
.LBB19_1:                               // %if.end
	{
		r7:6 = combine(#0,#0)
		memd(r29+#-16) = r17:16
		allocframe(#96)
	}                                       // 8-byte Folded Spill
	{
		r5 = add(r29,#0)
	}
	{
		r2 = #0
		memw(r29+#20) = r2
		memw(r29+#24) = r3
	}
	{
		r3 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		r4 = add(r5,#4)
		memw(r29+#4) = r4
	}
	{
		memw(r29+#0) = #0
		memb(r29+#32) = r2
	}
	{
		memw(r29+#16) = #0
		memw(r29+#40) = r1
	}
	{
		memw(r29+#64) = r0
		memw(r29+#28) = #0
	}
	{
		memb(r29+#80) = r2
		memd(r29+#8) = r7:6
	}
	{
		memd(r4+#64) = r7:6
		memw(r29+#76) = #0
	}
	{
		memw(r29+#48) = r5
		memd(r4+#48) = r7:6
	}
	{
		r16 = memw(r3+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
	{
		call ##halide_mutex_lock
		r0 = r16
	}
	{
		r1 = add(r29,#0)
		r0 = #1
		r2 = #0
	}
	{
		call ##_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_
	}
	{
		call ##_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE
		r0 = add(r29,#0)
	}
	{
		call ##halide_mutex_unlock
		r0 = r16
	}
	{
		r0 = memw(r29+#72)
		r17:16 = memd(r29+#88)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = deallocframe(r30):raw
	}
	{
		jumpr r31
	}
.Lfunc_end19:
	.size	halide_default_do_par_for, .Lfunc_end19-halide_default_do_par_for
                                        // -- End function
	.section	.text.halide_mutex_lock,"ax",@progbits
	.weak	halide_mutex_lock               // -- Begin function halide_mutex_lock
	.p2align	4
	.type	halide_mutex_lock,@function
halide_mutex_lock:                      // @halide_mutex_lock
// %bb.0:                               // %entry
	{
		r3:2 = combine(#0,#0)
		r16 = r0
		memd(r29+#-16) = r17:16
		allocframe(#24)
	}                                       // 8-byte Folded Spill
	{
		memd(r29+#8) = r19:18
	}                                       // 8-byte Folded Spill
	{
		r5:4 = memd_locked(r0)
	}
	{
		p0 = cmp.eq(r5:4,r3:2)
		if (!p0.new) jump:t .LBB20_2
	}
// %bb.1:                               // %cmpxchg.trystore
	{
		r1:0 = combine(#0,#1)
	}
	{
		memd_locked(r16,p0) = r1:0
	}
	{
		if (p0) jump:nt .LBB20_8
	}
.LBB20_2:                               // %if.then.i.critedge
	{
		r18 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		p2 = or(p2,!p2)
		r3:2 = memd(r16+#0)
	}
	{
		p3 = and(p3,!p3)
		r19 = #40 ; jump .LBB20_3
		r17 = #0
	}
	.p2align	4
.LBB20_6:                               // %cmpxchg.failure3
                                        //   in Loop: Header=BB20_3 Depth=1
	{
		p0 = or(p3,p3)
	}
.LBB20_7:                               // %cmpxchg.end2
                                        //   in Loop: Header=BB20_3 Depth=1
	{
		if (p0) jump:nt .LBB20_8
	}
.LBB20_3:                               // %while.cond.outer.i.i
                                        // =>This Inner Loop Header: Depth=1
	{
		r1:0 = combine(r3,r2)
		p0 = tstbit(r2,#0); if (p0.new) jump:nt .LBB20_9
	}
// %bb.4:                               // %if.then.i.i
                                        //   in Loop: Header=BB20_3 Depth=1
	{
		r3:2 = memd_locked(r16)
	}
	{
		p0 = cmp.eq(r3:2,r1:0)
		if (!p0.new) jump:t .LBB20_6
	}
// %bb.5:                               // %cmpxchg.trystore7
                                        //   in Loop: Header=BB20_3 Depth=1
	{
		r0 = setbit(r0,#0)
		p0 = or(p2,p2)
	}
	{
		memd_locked(r16,p1) = r1:0
	}
	{
		if (!p1) jump:nt .LBB20_6
	}
	{
		jump .LBB20_7
	}
.LBB20_9:                               // %if.end4.i.i
                                        //   in Loop: Header=BB20_3 Depth=1
	{
		p0 = cmp.gt(r19,#0); if (p0.new) jump:nt .LBB20_18
	}
// %bb.10:                              //   in Loop: Header=BB20_3 Depth=1
	{
		r4 = r19
	}
.LBB20_11:                              // %if.end8.i.i
                                        //   in Loop: Header=BB20_3 Depth=1
	{
		p0 = tstbit(r0,#1)
		if (p0.new) jump:t .LBB20_16
	}
// %bb.12:                              // %if.then10.i.i
                                        //   in Loop: Header=BB20_3 Depth=1
	{
		r3:2 = memd_locked(r16)
	}
	{
		p0 = cmp.eq(r3:2,r1:0)
		if (!p0.new) jump:t .LBB20_14
	}
// %bb.13:                              // %cmpxchg.trystore24
                                        //   in Loop: Header=BB20_3 Depth=1
	{
		r0 = setbit(r0,#1)
		p0 = or(p2,p2)
	}
	{
		memd_locked(r16,p1) = r1:0
	}
	{
		if (p1) jump:nt .LBB20_15
	}
.LBB20_14:                              // %cmpxchg.failure20
                                        //   in Loop: Header=BB20_3 Depth=1
	{
		p0 = or(p3,p3)
	}
.LBB20_15:                              // %cmpxchg.end19
                                        //   in Loop: Header=BB20_3 Depth=1
	{
		r19 = r4
		if (!p0) jump:nt .LBB20_3
	}
.LBB20_16:                              // %if.end19.i.i
                                        //   in Loop: Header=BB20_3 Depth=1
	{
		r0 = add(r29,#0)
		r3:2 = combine(r17,r16)
		r1 = memw(r18+##_ZTVN6Halide7Runtime8Internal15Synchronization21mutex_parking_controlE@GOT)
	}
	{
		r1 = add(r1,#8)
		memw(r29+#4) = r16
	}
	{
		call ##_ZN6Halide7Runtime8Internal15Synchronization15parking_control4parkEy
		memw(r29+#0) = r1
	}
	{
		p0 = cmp.eq(r1:0,r17:16)
		if (p0.new) r17:16 = memd(r29+#16)
		if (p0.new) r19:18 = memd(r29+#8)
	}                                       // 8-byte Folded Reload
	{
		if (p0) r31:30 = dealloc_return(r30):raw
	}
.LBB20_17:                              // %if.end24.i.i
                                        //   in Loop: Header=BB20_3 Depth=1
	{
		p2 = or(p2,!p2)
		p3 = and(p3,!p3)
		r19 = #40
		r3:2 = memd(r16+#0)
	}
	{
		jump .LBB20_3
	}
.LBB20_18:                              // %_ZN6Halide7Runtime8Internal15Synchronization12spin_control11should_spinEv.exit.i.i
                                        //   in Loop: Header=BB20_3 Depth=1
	{
		r4 = #0
		p0 = cmp.eq(r19,#1); if (p0.new) jump:t .LBB20_11
	}
// %bb.19:                              // %if.then6.i.i
                                        //   in Loop: Header=BB20_3 Depth=1
	{
		call ##halide_thread_yield
		r19 = add(r19,#-1)
	}
	{
		p3 = and(p3,!p3)
		p2 = or(p2,!p2)
		jump .LBB20_3
		r3:2 = memd(r16+#0)
	}
.LBB20_8:                               // %_ZN6Halide7Runtime8Internal15Synchronization10fast_mutex4lockEv.exit
	{
		r17:16 = memd(r29+#16)
		r19:18 = memd(r29+#8)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end20:
	.size	halide_mutex_lock, .Lfunc_end20-halide_mutex_lock
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_ // -- Begin function _ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_
	.p2align	4
	.type	_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_,@function
_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_: // @_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_
// %bb.0:                               // %entry
	{
		r17 = r1
		memd(r29+#-16) = r17:16
		allocframe(#72)
	}                                       // 8-byte Folded Spill
	{
		r21 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		memd(r29+#48) = r21:20
		memd(r29+#56) = r19:18
	}                                       // 8-byte Folded Spill
	{
		r18 = r0
		memd(r29+#40) = r23:22
		memd(r29+#32) = r25:24
	}                                       // 8-byte Folded Spill
	{
		r20 = add(r21,##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
		memd(r29+#24) = r27:26
	}                                       // 8-byte Folded Spill
	{
		r3 = memw(r20+#0)
		memw(r29+#12) = r2
	}                                       // 4-byte Folded Spill
	{
		r4 = memb(r3+##1097)
		if (cmp.eq(r4.new,#0)) jump:nt .LBB21_1
	}
// %bb.11:                              // %if.end4
	{
		p0 = cmp.gt(r18,#0)
	}
	{
		r0 = p0
		if (!p0) jump:nt .LBB21_12
		memw(r29+#8) = r0.new
	}                                       // 4-byte Folded Spill
.LBB21_13:                              // %for.body.preheader
	{
		r3:2 = combine(#-1,#-1)
		r0 = and(r18,#3)
		r1 = #0
		r5:4 = combine(#0,#3)
	}
	{
		r19 = r1
	}
	{
		r3:2 = add(r19:18,r3:2)
	}
	{
		p0 = cmp.gtu(r5:4,r3:2)
		if (!p0.new) jump:t .LBB21_27
	}
// %bb.14:
	{
		r19 = #-1
		r5:4 = combine(#0,#0)
		r7:6 = combine(#0,#0)
		r3:2 = combine(r1,#0)
	}
	{
		jump .LBB21_15
	}
.LBB21_1:
	{
		loop0(.LBB21_2,#39)
		r0 = add(r3,#39)
	}
.Ltmp0:                                 // Block address taken
.LBB21_2:                               // %land.rhs.i
                                        // =>This Inner Loop Header: Depth=1
	{
		r1 = memb(r0+#-27)
		if (!cmp.eq(r1.new,#0)) jump:nt .LBB21_3
	}
// %bb.4:                               // %while.body.i
                                        //   in Loop: Header=BB21_2 Depth=1
	{
		r1 = memb(r0+#-26)
		if (!cmp.eq(r1.new,#0)) jump:nt .LBB21_5
	}
// %bb.51:                              // %while.body.i.1
                                        //   in Loop: Header=BB21_2 Depth=1
	{
		r1 = memb(r0+#-25)
		if (!cmp.eq(r1.new,#0)) jump:nt .LBB21_52
	}
// %bb.53:                              // %while.body.i.2
                                        //   in Loop: Header=BB21_2 Depth=1
	{
		r1 = memb(r0+#-24)
		if (!cmp.eq(r1.new,#0)) jump:nt .LBB21_54
	}
// %bb.55:                              // %while.body.i.3
                                        //   in Loop: Header=BB21_2 Depth=1
	{
		r1 = memb(r0+#-23)
		if (!cmp.eq(r1.new,#0)) jump:nt .LBB21_56
	}
// %bb.57:                              // %while.body.i.4
                                        //   in Loop: Header=BB21_2 Depth=1
	{
		r1 = memb(r0+#-22)
		if (!cmp.eq(r1.new,#0)) jump:nt .LBB21_58
	}
// %bb.59:                              // %while.body.i.5
                                        //   in Loop: Header=BB21_2 Depth=1
	{
		r1 = memb(r0+#-21)
		if (!cmp.eq(r1.new,#0)) jump:nt .LBB21_60
	}
// %bb.61:                              // %while.body.i.6
                                        //   in Loop: Header=BB21_2 Depth=1
	{
		r1 = memb(r0+#-20)
		if (!cmp.eq(r1.new,#0)) jump:nt .LBB21_62
	}
// %bb.63:                              // %while.body.i.7
                                        //   in Loop: Header=BB21_2 Depth=1
	{
		r1 = memb(r0+#-19)
		if (!cmp.eq(r1.new,#0)) jump:nt .LBB21_64
	}
// %bb.65:                              // %while.body.i.8
                                        //   in Loop: Header=BB21_2 Depth=1
	{
		r1 = memb(r0+#-18)
		if (!cmp.eq(r1.new,#0)) jump:nt .LBB21_66
	}
// %bb.67:                              // %while.body.i.9
                                        //   in Loop: Header=BB21_2 Depth=1
	{
		r1 = memb(r0+#-17)
		if (!cmp.eq(r1.new,#0)) jump:nt .LBB21_68
	}
// %bb.69:                              // %while.body.i.10
                                        //   in Loop: Header=BB21_2 Depth=1
	{
		r1 = memb(r0+#-16)
		if (!cmp.eq(r1.new,#0)) jump:nt .LBB21_70
	}
// %bb.71:                              // %while.body.i.11
                                        //   in Loop: Header=BB21_2 Depth=1
	{
		r1 = memb(r0+#-15)
		if (!cmp.eq(r1.new,#0)) jump:nt .LBB21_72
	}
// %bb.73:                              // %while.body.i.12
                                        //   in Loop: Header=BB21_2 Depth=1
	{
		r1 = memb(r0+#-14)
		if (!cmp.eq(r1.new,#0)) jump:nt .LBB21_74
	}
// %bb.75:                              // %while.body.i.13
                                        //   in Loop: Header=BB21_2 Depth=1
	{
		r1 = memb(r0+#-13)
		if (!cmp.eq(r1.new,#0)) jump:nt .LBB21_76
	}
// %bb.77:                              // %while.body.i.14
                                        //   in Loop: Header=BB21_2 Depth=1
	{
		r1 = memb(r0+#-12)
		if (!cmp.eq(r1.new,#0)) jump:nt .LBB21_78
	}
// %bb.79:                              // %while.body.i.15
                                        //   in Loop: Header=BB21_2 Depth=1
	{
		r1 = memb(r0+#-11)
		if (!cmp.eq(r1.new,#0)) jump:nt .LBB21_80
	}
// %bb.81:                              // %while.body.i.16
                                        //   in Loop: Header=BB21_2 Depth=1
	{
		r1 = memb(r0+#-10)
		if (!cmp.eq(r1.new,#0)) jump:nt .LBB21_82
	}
// %bb.83:                              // %while.body.i.17
                                        //   in Loop: Header=BB21_2 Depth=1
	{
		r1 = memb(r0+#-9)
		if (!cmp.eq(r1.new,#0)) jump:nt .LBB21_84
	}
// %bb.85:                              // %while.body.i.18
                                        //   in Loop: Header=BB21_2 Depth=1
	{
		r1 = memb(r0+#-8)
		if (!cmp.eq(r1.new,#0)) jump:nt .LBB21_86
	}
// %bb.87:                              // %while.body.i.19
                                        //   in Loop: Header=BB21_2 Depth=1
	{
		r1 = memb(r0+#-7)
		if (!cmp.eq(r1.new,#0)) jump:nt .LBB21_88
	}
// %bb.89:                              // %while.body.i.20
                                        //   in Loop: Header=BB21_2 Depth=1
	{
		r1 = memb(r0+#-6)
		if (!cmp.eq(r1.new,#0)) jump:nt .LBB21_90
	}
// %bb.91:                              // %while.body.i.21
                                        //   in Loop: Header=BB21_2 Depth=1
	{
		r1 = memb(r0+#-5)
		if (!cmp.eq(r1.new,#0)) jump:nt .LBB21_92
	}
// %bb.93:                              // %while.body.i.22
                                        //   in Loop: Header=BB21_2 Depth=1
	{
		r1 = memb(r0+#-4)
		if (!cmp.eq(r1.new,#0)) jump:nt .LBB21_94
	}
// %bb.95:                              // %while.body.i.23
                                        //   in Loop: Header=BB21_2 Depth=1
	{
		r1 = memb(r0+#-3)
		if (!cmp.eq(r1.new,#0)) jump:nt .LBB21_96
	}
// %bb.97:                              // %while.body.i.24
                                        //   in Loop: Header=BB21_2 Depth=1
	{
		r1 = memb(r0+#-2)
		if (!cmp.eq(r1.new,#0)) jump:nt .LBB21_98
	}
// %bb.99:                              // %while.body.i.25
                                        //   in Loop: Header=BB21_2 Depth=1
	{
		r1 = memb(r0+#-1)
		if (!cmp.eq(r1.new,#0)) jump:nt .LBB21_100
	}
// %bb.101:                             // %while.body.i.26
                                        //   in Loop: Header=BB21_2 Depth=1
	{
		r1 = memb(r0+#0)
		if (!cmp.eq(r1.new,#0)) jump:t .LBB21_6
	}
// %bb.102:                             // %while.body.i.27
                                        //   in Loop: Header=BB21_2 Depth=1
	{
		r0 = add(r0,#28)
		nop
	} :endloop0
	{
		jump .LBB21_8
	}
.LBB21_27:                              // %for.body.preheader.new
	{
		r3:2 = combine(#-4,#0)
		r9:8 = combine(#0,#4)
		r19 = #-1
		r5:4 = combine(#0,#0)
	}
	{
		r14 = and(r18,r3)
		r13:12 = combine(#-1,#-4)
		r11:10 = combine(#0,#0)
		r7:6 = combine(#0,#0)
	}
	{
		r3 = #0
		r15 = #0
	}
	.p2align	4
.LBB21_28:                              // %for.body
                                        // =>This Inner Loop Header: Depth=1
	{
		r23 = setbit(r2,#0)
		r24 = setbit(r2,#1)
		r22 = r17
		r25 = or(r2,#3)
	}
	{
		r22 += mpyi(r2,#84)
		r15:14 = add(r15:14,r13:12)
	}
	{
		r3:2 = add(r3:2,r9:8)
	}
	{
		r28 = memb(r22+#32)
	}
	{
		p0 = cmp.eq(r28,#0)
		if (p0.new) r28 = memw(r22+#24)
	}
	{
		if (p0) r19 = add(r28,r19)
		r28 = r17
	}
	{
		r28 += mpyi(r23,#84)
		if (!p0) r19 = add(r19,#1)
	}
	{
		r23 = memb(r28+#32)
	}
	{
		p0 = cmp.eq(r23,#0)
		if (p0.new) r23 = memw(r28+#24)
	}
	{
		if (p0) r19 = add(r23,r19)
		r23 = r17
		r26 = memw(r28+#28)
		r28 = memw(r28+#16)
	}
	{
		r23 += mpyi(r24,#84)
		if (!p0) r19 = add(r19,#1)
	}
	{
		p3 = cmp.eq(r26,#0)
	}
	{
		r24 = memb(r23+#32)
	}
	{
		p0 = cmp.eq(r24,#0)
		if (p0.new) r24 = memw(r23+#24)
	}
	{
		if (p0) r19 = add(r24,r19)
		r24 = r17
		r27 = memw(r23+#28)
		r23 = memw(r23+#16)
	}
	{
		r24 += mpyi(r25,#84)
		if (!p0) r19 = add(r19,#1)
	}
	{
		p2 = cmp.eq(r27,#0)
	}
	{
		r25 = memb(r24+#32)
	}
	{
		p0 = cmp.eq(r25,#0)
		if (p0.new) r25 = memw(r24+#24)
	}
	{
		if (p0) r19 = add(r25,r19)
		r25 = memw(r22+#28)
		r16 = memw(r24+#28)
	}
	{
		r4 = add(r25,r4)
		if (!p0) r19 = add(r19,#1)
		r24 = memw(r24+#16)
		r22 = memw(r22+#16)
	}
	{
		r23 = or(r24,r23)
		r24 = or(r16,r27)
		p1 = cmp.eq(r25,#0)
		r4 = add(r26,r4)
	}
	{
		r24 |= or(r26,r25)
		r23 |= or(r28,r22)
		if (p1) r6 = #1
		r4 = add(r27,r4)
	}
	{
		p0 = cmp.eq(r15:14,r11:10)
		if (p3) r6 = #1
		p1 = cmp.eq(r16,#0)
		r4 = add(r16,r4)
	}
	{
		if (p2) r6 = #1
		p3 = cmp.eq(r24,#0)
		p2 = cmp.eq(r23,#0)
		if (!p3.new) r5 = #1
	}
	{
		if (!p2) r7 = #1
		if (p1) r6 = #1
		if (!p0) jump:nt .LBB21_28
	}
.LBB21_15:                              // %for.cond.cleanup.loopexit.unr-lcssa
	{
		r9:8 = combine(#0,#0)
	}
	{
		p0 = cmp.eq(r1:0,r9:8)
		if (p0.new) jump:nt .LBB21_18
	}
// %bb.16:
	{
		r13:12 = combine(#0,#1)
		r15:14 = combine(#-1,#-1)
	}
	.p2align	4
.LBB21_17:                              // %for.body.epil
                                        // =>This Inner Loop Header: Depth=1
	{
		r1:0 = add(r1:0,r15:14)
		r28 = r17
	}
	{
		r28 += mpyi(r2,#84)
		r3:2 = add(r3:2,r13:12)
	}
	{
		r10 = memb(r28+#32)
	}
	{
		p0 = cmp.eq(r10,#0)
		if (p0.new) r10 = memw(r28+#24)
		r27 = memw(r28+#28)
	}
	{
		p0 = cmp.eq(r1:0,r9:8)
		if (p0) r19 = add(r10,r19)
		if (!p0) r19 = add(r19,#1)
		r28 = memw(r28+#16)
	}
	{
		r4 = add(r27,r4)
		p1 = cmp.eq(r27,#0)
	}
	{
		p2 = cmp.eq(r28,#0)
		if (p1) r6 = #1
		if (!p1) r5 = #1
		if (!p2.new) r7 = #1
	}
	{
		if (!p0) jump:nt .LBB21_17
	}
.LBB21_18:                              // %for.cond.cleanup.loopexit
	{
		r1 = and(r5,#1)
		jump .LBB21_19
		r0 = and(r7,#1)
		r22 = and(r6,#1)
	}
.LBB21_3:
	{
		r0 = add(r0,#-27)
		jump .LBB21_6
	}
.LBB21_5:
	{
		r0 = add(r0,#-26)
		jump .LBB21_6
	}
.LBB21_52:
	{
		r0 = add(r0,#-25)
		jump .LBB21_6
	}
.LBB21_54:
	{
		r0 = add(r0,#-24)
		jump .LBB21_6
	}
.LBB21_56:
	{
		r0 = add(r0,#-23)
		jump .LBB21_6
	}
.LBB21_58:
	{
		r0 = add(r0,#-22)
		jump .LBB21_6
	}
.LBB21_60:
	{
		r0 = add(r0,#-21)
		jump .LBB21_6
	}
.LBB21_62:
	{
		r0 = add(r0,#-20)
		jump .LBB21_6
	}
.LBB21_64:
	{
		r0 = add(r0,#-19)
		jump .LBB21_6
	}
.LBB21_66:
	{
		r0 = add(r0,#-18)
		jump .LBB21_6
	}
.LBB21_68:
	{
		r0 = add(r0,#-17)
		jump .LBB21_6
	}
.LBB21_70:
	{
		r0 = add(r0,#-16)
		jump .LBB21_6
	}
.LBB21_72:
	{
		r0 = add(r0,#-15)
		jump .LBB21_6
	}
.LBB21_74:
	{
		r0 = add(r0,#-14)
		jump .LBB21_6
	}
.LBB21_76:
	{
		r0 = add(r0,#-13)
		jump .LBB21_6
	}
.LBB21_78:
	{
		r0 = add(r0,#-12)
		jump .LBB21_6
	}
.LBB21_80:
	{
		r0 = add(r0,#-11)
		jump .LBB21_6
	}
.LBB21_82:
	{
		r0 = add(r0,#-10)
		jump .LBB21_6
	}
.LBB21_84:
	{
		r0 = add(r0,#-9)
		jump .LBB21_6
	}
.LBB21_86:
	{
		r0 = add(r0,#-8)
		jump .LBB21_6
	}
.LBB21_88:
	{
		r0 = add(r0,#-7)
		jump .LBB21_6
	}
.LBB21_90:
	{
		r0 = add(r0,#-6)
		jump .LBB21_6
	}
.LBB21_92:
	{
		r0 = add(r0,#-5)
		jump .LBB21_6
	}
.LBB21_94:
	{
		r0 = add(r0,#-4)
		jump .LBB21_6
	}
.LBB21_96:
	{
		r0 = add(r0,#-3)
		jump .LBB21_6
	}
.LBB21_98:
	{
		r0 = add(r0,#-2)
		jump .LBB21_6
	}
.LBB21_100:
	{
		r0 = add(r0,#-1)
	}
.LBB21_6:                               // %do.body.i
	{
		r1 = memw(r20+#0)
	}
	{
		r1 = add(r1,#1104)
		if (cmp.eq(r1.new,r0)) jump:nt .LBB21_8
	}
// %bb.7:                               // %if.then.i
	{
		r1 = add(pc,##.L.str.6@PCREL)
		r0 = #0
	}
	{
		call ##halide_print
	}
	{
		call ##abort
	}
.LBB21_8:                               // %_ZNK6Halide7Runtime8Internal12work_queue_t13assert_zeroedEv.exit
	{
		r0 = memw(r20+#0)
	}
	{
		r0 = memw(r0+#8)
		if (!cmp.eq(r0.new,#0)) jump:t .LBB21_10
	}
// %bb.9:                               // %if.then2
	{
		call ##_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv
	}
.LBB21_10:                              // %if.end
	{
		r3 = #256
		r2 = #1
		r1 = memw(r20+#0)
	}
	{
		r0 = max(r0,r2)
	}
	{
		r0 = min(r0,r3)
		memb(r1+##1097) = r2
	}
	{
		p0 = cmp.gt(r18,#0)
		memw(r1+#8) = r0
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB21_13
		memw(r29+#8) = r0.new
	}                                       // 4-byte Folded Spill
.LBB21_12:
	{
		r22 = #0
		r19 = #-1
		r4 = #0
		r1:0 = combine(#0,#0)
	}
.LBB21_19:                              // %for.cond.cleanup
	{
		r23 = or(r0,r1)
		r16 = memw(r29+#12)
	}                                       // 4-byte Folded Reload
	{
		p0 = cmp.eq(r16,#0)
	}
	{
		r2 = p0
		if (p0) jump:nt .LBB21_20
		memw(r29+#4) = r2.new
	}                                       // 4-byte Folded Spill
// %bb.29:                              // %do.body61
	{
		r0 = memw(r16+#28)
		r1 = memw(r16+#68)
	}
	{
		r2 = memw(r16+#60)
	}
	{
		r0 = mpyi(r1,r0)
	}
	{
		r0 = sub(r0,r2)
		if (!cmp.gt(r4,r0.new)) jump:t .LBB21_31
	}
// %bb.30:                              // %if.then66
	{
		r1 = add(pc,##.L.str.3@PCREL)
		r0 = #0
	}
	{
		call ##halide_print
	}
	{
		call ##abort
	}
.LBB21_31:                              // %do.end69
	{
		p0 = cmp.eq(r23,#0); if (p0.new) jump:t .LBB21_33
	}
// %bb.32:                              // %if.then73
	{
		jump .LBB21_33
		memw(r16+#60) += #1
	}
.LBB21_20:                              // %if.then32
	{
		p1 = cmp.eq(r23,#0)
		r0 = memw(r20+#0)
	}
	{
		r2 = p1
		memw(r29+#0) = r2.new
	}                                       // 4-byte Folded Spill
	{
		r1 = memw(r0+#20)
	}
	{
		p0 = cmp.gt(r1,#255)
		if (p0.new) jump:t .LBB21_25
	}
// %bb.21:
	{
		r24 = add(r4,r23)
		r25 = add(r0,#72)
		jump .LBB21_22
	}
	.p2align	4
.LBB21_24:                              // %while.body
                                        //   in Loop: Header=BB21_22 Depth=1
	{
		r1 = #0
		r26 = memw(r20+#0)
	}
	{
		memw(r26+#24) += #1
	}
	{
		call ##halide_spawn_thread
		r0 = memw(r21+##_ZN6Halide7Runtime8Internal13worker_threadEPv@GOT)
	}
	{
		r2 = memw(r26+#20)
	}
	{
		r1 = add(r2,#1)
		memw(r26+#20) = r1.new
	}
	{
		p0 = cmp.gt(r2,#254)
		if (p0.new) jump:nt .LBB21_25
		memw(r25+r2<<#2) = r0
	}
.LBB21_22:                              // %land.rhs
                                        // =>This Inner Loop Header: Depth=1
	{
		r0 = memw(r20+#0)
	}
	{
		r0 = memw(r0+#8)
	}
	{
		r0 = add(r0,#-1)
		if (cmp.gt(r0.new,r1)) jump:t .LBB21_24
	}
// %bb.23:                              // %lor.rhs
                                        //   in Loop: Header=BB21_22 Depth=1
	{
		r0 = memw(r20+#0)
	}
	{
		r0 = memw(r0+#1100)
	}
	{
		r0 = add(r1,sub(#1,r0))
		if (cmp.gt(r24,r0.new)) jump:t .LBB21_24
	}
.LBB21_25:                              // %do.end50
	{
		r0 = memw(r29+#0)
		r16 = memw(r29+#12)
	}                                       // 4-byte Folded Reload
	{
		p0 = r0
		if (p0.new) jump:t .LBB21_33
	}
// %bb.26:                              // %if.then54
	{
		r0 = memw(r20+#0)
	}
	{
		r0 = add(r0,#1100)
	}
	{
		memw(r0+#0) += #1
	}
.LBB21_33:                              // %if.end77
	{
		r0 = memw(r29+#8)
	}                                       // 4-byte Folded Reload
	{
		p0 = r0
		if (!p0.new) jump:nt .LBB21_43
	}
// %bb.34:                              // %for.body83.lr.ph
	{
		r5:4 = combine(#0,#7)
		r15:14 = combine(#-1,#-1)
		r1:0 = combine(#0,r18)
		r2 = memw(r20+#0)
	}
	{
		r13:12 = and(r1:0,r5:4)
		r7:6 = add(r1:0,r15:14)
		r9:8 = combine(#0,#0)
	}
	{
		p0 = cmp.eq(r13:12,r9:8)
		if (p0.new) jump:nt .LBB21_35
		r2 = memw(r2+#16)
	}
// %bb.36:                              // %for.body83.prol.preheader
	{
		r3 = +mpyi(r18,#84)
	}
	{
		r3 = add(r17,add(r3,##-40))
	}
	.p2align	4
.LBB21_37:                              // %for.body83.prol
                                        // =>This Inner Loop Header: Depth=1
	{
		r13:12 = add(r13:12,r15:14)
		r1:0 = add(r1:0,r15:14)
		r2 = r17
		memw(r3+#0) = r2
	}
	{
		r2 += mpyi(r0,#84)
		p0 = cmp.eq(r13:12,r9:8)
		memw(r3+#4) = r17
		memw(r3+#8) = r18
	}
	{
		r3 = add(r3,#-84)
		if (!p0) jump:nt .LBB21_37
		memw(r3+#16) = #0
	}
// %bb.38:                              // %for.body83.prol.loopexit.loopexit
	{
		p0 = cmp.gtu(r5:4,r7:6)
		r2 = add(r3,#40)
		r3 = r0
		if (!p0.new) jump:t .LBB21_40
	}
	{
		jump .LBB21_42
	}
.LBB21_35:
	{
		p0 = cmp.gtu(r5:4,r7:6)
		r3 = r18
		if (p0.new) jump:t .LBB21_42
	}
.LBB21_40:                              // %for.body83.preheader
	{
		r5 = +mpyi(r3,#84)
		r9:8 = combine(#-1,#-8)
		r4 = #0
		r7:6 = combine(#0,#0)
	}
	{
		r5 = add(r5,add(r17,##-628))
	}
	.p2align	4
.LBB21_41:                              // %for.body83
                                        // =>This Inner Loop Header: Depth=1
	{
		r1:0 = add(r1:0,r9:8)
		r2 = r17
		r3 = add(r3,#-8)
		memw(r5+#588) = r2
	}
	{
		r12 = add(r5,#544)
		r24 = add(r5,#460)
		r13 = add(r5,#376)
		r25 = add(r5,#292)
	}
	{
		r26 = add(r5,#208)
		r14 = add(r5,#124)
		r27 = add(r5,#40)
		memw(r5+#504) = r12
	}
	{
		r2 += mpyi(r3,#84)
		p0 = cmp.gt(r1:0,r7:6)
		memw(r5+#592) = r17
		memw(r5+#596) = r18
	}
	{
		memw(r5+#604) = r4
		memw(r5+#508) = r17
	}
	{
		memw(r5+#336) = r13
		memw(r5+#512) = r18
	}
	{
		memw(r5+#252) = r25
		memw(r5+#520) = r4
	}
	{
		memw(r5+#168) = r26
		memw(r5+#0) = r27
	}
	{
		memw(r5+#420) = r24
		memw(r5+#424) = r17
	}
	{
		memw(r5+#428) = r18
		memw(r5+#436) = r4
	}
	{
		memw(r5+#340) = r17
		memw(r5+#344) = r18
	}
	{
		memw(r5+#352) = r4
		memw(r5+#256) = r17
	}
	{
		memw(r5+#260) = r18
		memw(r5+#268) = r4
	}
	{
		memw(r5+#172) = r17
		memw(r5+#176) = r18
	}
	{
		memw(r5+#184) = #0
		memw(r5+#84) = r14
	}
	{
		memw(r5+#88) = r17
		memw(r5+#92) = r18
	}
	{
		memw(r5+#100) = #0
		memw(r5+#4) = r17
	}
	{
		r5 = add(r5,#-672)
		if (p0) jump:nt .LBB21_41
		memw(r5+#8) = r18
		memw(r5+#16) = #0
	}
.LBB21_42:                              // %for.cond80.for.cond.cleanup82_crit_edge
	{
		r0 = memw(r20+#0)
	}
	{
		memw(r0+#16) = r17
	}
.LBB21_43:                              // %for.cond.cleanup82
	{
		r17 = memw(r20+#0)
	}
	{
		r0 = add(r17,#40)
	}
	{
		r2 = memw(r17+#64)
		r1 = memw(r17+#20)
	}
	{
		r3 = memw(r17+#68)
	}
	{
		p0 = cmp.gt(r19,r2)
		p1 = cmp.gt(r1,r2)
		if (p0.new) r19 = add(r1,#0)
	}
	{
		p0 = cmp.eq(r3,#0)
		if (p1) r19 = add(r1,#0)
	}
	{
		if (!p0) r19 = add(r1,#0)
	}
	{
		call ##halide_cond_broadcast
		memw(r17+#28) = r19
	}
	{
		r0 = memw(r17+#28)
	}
	{
		r1 = memw(r17+#24)
		if (!cmp.gt(r0,r1.new)) jump:t .LBB21_46
	}
// %bb.44:                              // %if.then107
	{
		r0 = memw(r20+#0)
	}
	{
		call ##halide_cond_broadcast
		r0 = add(r0,#48)
	}
	{
		p0 = cmp.eq(r22,#0); if (p0.new) jump:nt .LBB21_46
	}
// %bb.45:                              // %if.then109
	{
		r0 = memw(r20+#0)
	}
	{
		call ##halide_cond_broadcast
		r0 = add(r0,#56)
	}
.LBB21_46:                              // %if.end111
	{
		p0 = cmp.eq(r23,#0); if (p0.new) jump:t .LBB21_50
	}
// %bb.47:                              // %if.then115
	{
		r0 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r0
		if (p0.new) jump:nt .LBB21_49
	}
// %bb.48:                              // %if.then117
	{
		jump .LBB21_50
		memw(r16+#60) -= #1
	}
.LBB21_49:                              // %if.else120
	{
		r0 = memw(r20+#0)
	}
	{
		r0 = add(r0,#1100)
	}
	{
		memw(r0+#0) -= #1
	}
.LBB21_50:                              // %if.end123
	{
		r17:16 = memd(r29+#64)
		r19:18 = memd(r29+#56)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#48)
		r23:22 = memd(r29+#40)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#32)
		r27:26 = memd(r29+#24)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end21:
	.size	_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_, .Lfunc_end21-_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE // -- Begin function _ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE
	.p2align	4
	.type	_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE,@function
_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE: // @_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE
// %bb.0:                               // %entry
	{
		r16 = r0
		r1 = #0
		memd(r29+#-16) = r17:16
		allocframe(#80)
	}                                       // 8-byte Folded Spill
	{
		p0 = cmp.eq(r0,#0)
	}
	{
		r21 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		memd(r29+#56) = r21:20
		memd(r29+#40) = r25:24
	}                                       // 8-byte Folded Spill
	{
		r0 = p0
		r25:24 = combine(#0,#0)
		memd(r29+#8) = r1:0
		memd(r29+#64) = r19:18
	}                                       // 8-byte Folded Spill
	{
		memd(r29+#48) = r23:22
		memd(r29+#32) = r27:26
	}                                       // 8-byte Folded Spill
	{
		jump .LBB22_1
		memw(r29+#20) = r0
	}                                       // 4-byte Folded Spill
	.p2align	4
.LBB22_2:                               // %while.cond
                                        //   Parent Loop BB22_1 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB22_14 Depth 3
                                        //       Child Loop BB22_12 Depth 3
                                        //         Child Loop BB22_31 Depth 4
                                        //       Child Loop BB22_50 Depth 3
                                        //         Child Loop BB22_52 Depth 4
                                        //           Child Loop BB22_53 Depth 5
                                        //       Child Loop BB22_80 Depth 3
                                        //       Child Loop BB22_76 Depth 3
	{
		r23 = add(r21,##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
		r0 = memw(r29+#20)
	}                                       // 4-byte Folded Reload
	{
		p0 = r0
		if (p0.new) jump:nt .LBB22_8
	}
// %bb.3:                               // %cond.true
                                        //   in Loop: Header=BB22_2 Depth=2
	{
		r1 = memw(r16+#24)
		r0 = memw(r16+#68)
	}
	{
		r1 = or(r1,r0)
		if (cmp.eq(r1.new,#0)) jump:nt ##.LBB22_96
	}
// %bb.4:                               // %if.then
                                        //   in Loop: Header=BB22_2 Depth=2
	{
		r1 = memw(r23+#0)
	}
	{
		r17 = memw(r1+#16)
	}
	{
		r2 = memw(r16+#72)
		if (cmp.eq(r2.new,#0)) jump:nt .LBB22_17
	}
// %bb.5:                               // %if.then3
                                        //   in Loop: Header=BB22_2 Depth=2
	{
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:nt .LBB22_10
	}
// %bb.6:                               // %while.cond6.preheader
                                        //   in Loop: Header=BB22_2 Depth=2
	{
		p0 = cmp.eq(r17,r16); if (p0.new) jump:nt .LBB22_7
		r0 = memw(r23+#0)
	}
	.p2align	4
.LBB22_14:                              // %while.body8
                                        //   Parent Loop BB22_1 Depth=1
                                        //     Parent Loop BB22_2 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	{
		r0 = r17
		r17 = memw(r17+#44)
		if (!cmp.eq(r17.new,r16)) jump:t .LBB22_14
	}
// %bb.15:                              //   in Loop: Header=BB22_2 Depth=2
	{
		r0 = add(r0,#44)
		jump .LBB22_16
	}
	.p2align	4
.LBB22_8:                               // %cond.end
                                        //   in Loop: Header=BB22_2 Depth=2
	{
		r0 = memw(r23+#0)
	}
	{
		r0 = memb(r0+##1096)
		if (!cmp.eq(r0.new,#0)) jump:nt ##.LBB22_96
	}
// %bb.9:                               // %while.body.thread
                                        //   in Loop: Header=BB22_2 Depth=2
	{
		r0 = memw(r23+#0)
	}
	{
		jump .LBB22_10
		r17 = memw(r0+#16)
	}
	.p2align	4
.LBB22_17:                              // %if.else
                                        //   in Loop: Header=BB22_2 Depth=2
	{
		r0 = memw(r16+#56)
		if (!cmp.eq(r0.new,#0)) jump:nt ##.LBB22_18
	}
.LBB22_10:                              // %do.end
                                        //   in Loop: Header=BB22_2 Depth=2
	{
		p0 = cmp.eq(r17,#0); if (p0.new) jump:nt .LBB22_37
		r0 = memw(r23+#0)
	}
// %bb.11:                              //   in Loop: Header=BB22_2 Depth=2
	{
		r26 = add(r0,#16)
		jump .LBB22_12
	}
	.p2align	4
.LBB22_36:                              // %cleanup
                                        //   in Loop: Header=BB22_12 Depth=3
	{
		r26 = add(r17,#44)
		r17 = memw(r17+#44)
		if (cmp.eq(r17.new,#0)) jump:nt .LBB22_37
	}
.LBB22_12:                              // %do.end27
                                        //   Parent Loop BB22_1 Depth=1
                                        //     Parent Loop BB22_2 Depth=2
                                        // =>    This Loop Header: Depth=3
                                        //         Child Loop BB22_31 Depth 4
	{
		r0 = memw(r17+#56)
		if (cmp.eq(r0.new,#0)) jump:nt .LBB22_13
	}
// %bb.20:                              // %if.else32
                                        //   in Loop: Header=BB22_12 Depth=3
	{
		r2 = memw(r0+#68)
		r1 = memw(r0+#28)
	}
	{
		p0 = cmp.eq(r2,#0); if (p0.new) jump:nt .LBB22_22
	}
// %bb.21:                              // %if.else38
                                        //   in Loop: Header=BB22_12 Depth=3
	{
		r1 = mpyi(r1,r2)
	}
.LBB22_22:                              // %if.end45
                                        //   in Loop: Header=BB22_12 Depth=3
	{
		r2 = memw(r0+#60)
	}
	{
		r2 = sub(r1,r2)
		jump .LBB22_23
	}
	.p2align	4
.LBB22_13:                              // %if.then31
                                        //   in Loop: Header=BB22_12 Depth=3
	{
		r1 = memw(r23+#0)
	}
	{
		r2 = memw(r1+#20)
		r1 = memw(r1+#1100)
	}
	{
		r2 = add(r2,sub(#1,r1))
	}
.LBB22_23:                              // %if.end45
                                        //   in Loop: Header=BB22_12 Depth=3
	{
		p0 = or(p0,!p0)
		r1 = memw(r17+#28)
		r3 = memw(r29+#20)
	}                                       // 4-byte Folded Reload
	{
		p1 = r3
		if (p1.new) jump:nt .LBB22_25
	}
// %bb.24:                              // %lor.lhs.false
                                        //   in Loop: Header=BB22_12 Depth=3
	{
		p0 = cmp.eq(r1,#0)
		r3 = memw(r17+#48)
		r4 = memw(r16+#48)
	}
	{
		p1 = cmp.eq(r3,r4)
	}
	{
		p0 = or(p1,p0)
	}
.LBB22_25:                              // %lor.end
                                        //   in Loop: Header=BB22_12 Depth=3
	{
		p1 = or(p1,!p1)
		r3 = memb(r17+#32)
		if (cmp.eq(r3.new,#0)) jump:nt .LBB22_27
	}
// %bb.26:                              // %lor.rhs70
                                        //   in Loop: Header=BB22_12 Depth=3
	{
		r3 = memw(r17+#68)
	}
	{
		p1 = cmp.eq(r3,#0)
	}
.LBB22_27:                              // %lor.end73
                                        //   in Loop: Header=BB22_12 Depth=3
	{
		p2 = cmp.gt(r1,r2)
		if (p2.new) jump:nt .LBB22_36
	}
// %bb.28:                              // %lor.end73
                                        //   in Loop: Header=BB22_12 Depth=3
	{
		p0 = not(p0)
		if (p0.new) jump:nt .LBB22_36
	}
// %bb.29:                              // %lor.end73
                                        //   in Loop: Header=BB22_12 Depth=3
	{
		if (!p1) jump:nt .LBB22_36
	}
// %bb.30:                              // %if.then86
                                        //   in Loop: Header=BB22_12 Depth=3
	{
		r2 = memw(r17+#76)
	}
	{
		r3 = memw(r17+#16)
		if (!cmp.gt(r3.new,r2)) jump:nt .LBB22_34
	}
	.p2align	4
.LBB22_31:                              // %for.body.i
                                        //   Parent Loop BB22_1 Depth=1
                                        //     Parent Loop BB22_2 Depth=2
                                        //       Parent Loop BB22_12 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	{
		r1 = +mpyi(r2,#12)
		r0 = memw(r17+#12)
	}
	{
		r2 = add(r0,r1)
	}
	{
		call ##halide_default_semaphore_try_acquire
		r0 = memw(r0+r1<<#0)
		r1 = memw(r2+#4)
	}
	{
		p0 = r0
		if (!p0.new) jump:nt .LBB22_36
	}
// %bb.32:                              // %for.inc.i
                                        //   in Loop: Header=BB22_31 Depth=4
	{
		r0 = memw(r17+#76)
		r1 = memw(r17+#16)
	}
	{
		r2 = add(r0,#1)
		memw(r17+#76) = r2.new
	}
	{
		p0 = cmp.gt(r1,r2); if (p0.new) jump:t .LBB22_31
	}
// %bb.33:                              // %while.end101.thread502.loopexit
                                        //   in Loop: Header=BB22_2 Depth=2
	{
		r0 = memw(r17+#56)
		r1 = memw(r17+#28)
	}
.LBB22_34:                              // %while.end101.thread502
                                        //   in Loop: Header=BB22_2 Depth=2
	{
		p0 = cmp.eq(r0,#0)
		memw(r17+#76) = #0
	}
	{
		if (p0) jump:nt .LBB22_35
		memw(r17+#68) += #1
	}
// %bb.47:                              // %if.else143
                                        //   in Loop: Header=BB22_2 Depth=2
	{
		memw(r0+#60) += r1
	}
	{
		r0 = memb(r17+#32)
		if (cmp.eq(r0.new,#0)) jump:nt .LBB22_66
	}
.LBB22_49:                              // %if.then156
                                        //   in Loop: Header=BB22_2 Depth=2
	{
		r0 = memw(r17+#44)
		memw(r26+#0) = r0.new
	}
	{
		call ##halide_mutex_unlock
		r20 = #0
		r0 = memw(r23+#0)
	}
	{
		r19 = #1
		r27:26 = combine(#-1,#-1)
	}
	.p2align	4
.LBB22_50:                              // %while.cond161.preheader
                                        //   Parent Loop BB22_1 Depth=1
                                        //     Parent Loop BB22_2 Depth=2
                                        // =>    This Loop Header: Depth=3
                                        //         Child Loop BB22_52 Depth 4
                                        //           Child Loop BB22_53 Depth 5
	{
		r0 = memw(r17+#24)
	}
	{
		r1 = sub(r0,r20)
		if (cmp.gt(r1.new,r19)) jump:t .LBB22_51
	}
.LBB22_59:                              // %while.end169
                                        //   in Loop: Header=BB22_50 Depth=3
	{
		p0 = cmp.eq(r19,#0); if (p0.new) jump:nt .LBB22_60
	}
.LBB22_57:                              // %if.end172
                                        //   in Loop: Header=BB22_50 Depth=3
	{
		r3 = r19
		r5 = r17
		r0 = memw(r17+#64)
		r2 = memw(r17+#20)
	}
	{
		r2 = add(r2,r20)
		r1 = memw(r17+#0)
		r4 = memw(r17+#4)
	}
	{
		call ##halide_do_loop_task
		r20 = add(r19,r20)
	}
	{
		r19 = #0
		p0 = cmp.eq(r0,#0); if (p0.new) jump:t .LBB22_50
	}
	{
		jump .LBB22_58
	}
	.p2align	4
.LBB22_51:                              // %land.rhs.preheader
                                        //   in Loop: Header=BB22_50 Depth=3
	{
		r2 = memw(r17+#76)
		r1 = memw(r17+#16)
	}
.LBB22_52:                              // %land.rhs
                                        //   Parent Loop BB22_1 Depth=1
                                        //     Parent Loop BB22_2 Depth=2
                                        //       Parent Loop BB22_50 Depth=3
                                        // =>      This Loop Header: Depth=4
                                        //           Child Loop BB22_53 Depth 5
	{
		p0 = cmp.gt(r1,r2); if (!p0.new) jump:t .LBB22_56
	}
.LBB22_53:                              // %for.body.i483
                                        //   Parent Loop BB22_1 Depth=1
                                        //     Parent Loop BB22_2 Depth=2
                                        //       Parent Loop BB22_50 Depth=3
                                        //         Parent Loop BB22_52 Depth=4
                                        // =>        This Inner Loop Header: Depth=5
	{
		r1 = +mpyi(r2,#12)
		r0 = memw(r17+#12)
	}
	{
		r2 = add(r0,r1)
	}
	{
		call ##halide_default_semaphore_try_acquire
		r0 = memw(r0+r1<<#0)
		r1 = memw(r2+#4)
	}
	{
		p0 = r0
		if (!p0.new) jump:t .LBB22_59
	}
// %bb.54:                              // %for.inc.i486
                                        //   in Loop: Header=BB22_53 Depth=5
	{
		r0 = memw(r17+#76)
		r1 = memw(r17+#16)
	}
	{
		r2 = add(r0,#1)
		memw(r17+#76) = r2.new
	}
	{
		p0 = cmp.gt(r1,r2); if (p0.new) jump:t .LBB22_53
	}
// %bb.55:                              // %while.body167.loopexit
                                        //   in Loop: Header=BB22_52 Depth=4
	{
		r0 = memw(r17+#24)
	}
	.p2align	4
.LBB22_56:                              // %while.body167
                                        //   in Loop: Header=BB22_52 Depth=4
	{
		r19 = add(r19,#1)
		r2 = sub(r0,r20)
		memw(r17+#76) = #0
	}
	{
		r2 = #0
		p0 = cmp.gt(r2,r19); if (p0.new) jump:t .LBB22_52
	}
	{
		jump .LBB22_57
	}
	.p2align	4
.LBB22_37:                              // %if.then103
                                        //   in Loop: Header=BB22_2 Depth=2
	{
		r0 = memw(r29+#20)
	}                                       // 4-byte Folded Reload
	{
		p0 = r0
		if (p0.new) jump:nt .LBB22_41
	}
// %bb.38:                              // %if.then105
                                        //   in Loop: Header=BB22_2 Depth=2
	{
		p0 = cmp.gt(r18,#39)
		r18 = add(r18,#1)
		if (p0.new) jump:t .LBB22_40
	}
// %bb.39:                              // %if.then107
                                        //   in Loop: Header=BB22_2 Depth=2
	{
		r17 = memw(r23+#0)
	}
	{
		call ##halide_mutex_unlock
		r0 = r17
	}
	{
		call ##halide_thread_yield
	}
	{
		call ##halide_mutex_lock
		r0 = r17
	}
	{
		jump .LBB22_2
	}
.LBB22_60:                              //   in Loop: Header=BB22_2 Depth=2
	{
		p0 = or(p0,!p0)
		r18 = #0 ; jump .LBB22_61
	}
.LBB22_35:                              // %if.then136
                                        //   in Loop: Header=BB22_2 Depth=2
	{
		r0 = memw(r23+#0)
	}
	{
		r0 = add(r0,#1100)
	}
	{
		memw(r0+#0) += r1
	}
	{
		r0 = memb(r17+#32)
		if (!cmp.eq(r0.new,#0)) jump:t .LBB22_49
	}
.LBB22_66:                              // %if.else198
                                        //   in Loop: Header=BB22_2 Depth=2
	{
		r27 = r21
		r0 = memw(r17+#24)
		r20 = memw(r17+#0)
	}
	{
		r0 = add(r0,#-1)
		r18 = memw(r17+#20)
		memw(r17+#24) = r0.new
	}
	{
		p0 = cmp.eq(r0,#0)
		r0 = add(r18,#1)
		r19 = memw(r17+#4)
		r21 = memw(r17+#40)
	}
	{
		r22 = memw(r17+#64)
		memw(r17+#20) = r0
	}
	{
		if (p0) r0 = memw(r17+#44)
		if (p0) memw(r26+#0) = r0.new
	}
	{
		call ##halide_mutex_unlock
		r0 = memw(r23+#0)
	}
	{
		r0 = r22
		p0 = cmp.eq(r21,#0); if (p0.new) jump:nt .LBB22_68
	}
// %bb.67:                              // %if.then212
                                        //   in Loop: Header=BB22_2 Depth=2
	{
		call ##halide_do_task
		r1 = r21
		r3:2 = combine(r19,r18)
	}
	{
		jump .LBB22_69
	}
.LBB22_41:                              // %if.else112
                                        //   in Loop: Header=BB22_2 Depth=2
	{
		r0 = memw(r23+#0)
	}
	{
		r2 = memw(r0+#24)
		memw(r0+#64) += #1
	}
	{
		r1 = memw(r0+#28)
		if (!cmp.gt(r2,r1.new)) jump:t ##.LBB22_43
	}
// %bb.42:                              // %if.then115
                                        //   in Loop: Header=BB22_2 Depth=2
	{
		r2 = add(r2,#-1)
		r17 = memw(r23+#0)
	}
	{
		r1 = r17
		r0 = add(r17,#48)
	}
	{
		call ##halide_cond_wait
		memw(r17+#24) = r2
	}
	{
		jump .LBB22_46
		memw(r17+#24) += #1
	}
.LBB22_40:                              // %if.else108
                                        //   in Loop: Header=BB22_2 Depth=2
	{
		r2 = #1
		r17 = memw(r23+#0)
		memb(r16+#80) = r2.new
	}
	{
		r1 = r17
		r0 = add(r17,#56)
	}
	{
		call ##halide_cond_wait
		memw(r17+#68) += #1
	}
	{
		r1:0 = memd(r29+#8)
		memw(r17+#68) -= #1
	}                                       // 8-byte Folded Reload
	{
		jump .LBB22_2
		memb(r16+#80) = r1
	}
.LBB22_7:                               //   in Loop: Header=BB22_2 Depth=2
	{
		r0 = add(r0,#16)
	}
.LBB22_16:                              // %while.end
                                        //   in Loop: Header=BB22_2 Depth=2
	{
		r1 = memw(r16+#44)
		memw(r16+#24) = #0
	}
	{
		jump .LBB22_2
		memw(r0+#0) = r1
	}
.LBB22_18:                              // %land.lhs.true
                                        //   in Loop: Header=BB22_2 Depth=2
	{
		r0 = memw(r0+#72)
		if (cmp.eq(r0.new,#0)) jump:nt ##.LBB22_10
	}
// %bb.19:                              // %if.then15
                                        //   in Loop: Header=BB22_2 Depth=2
	{
		memw(r16+#72) = r0
	}
	{
		r0 = memw(r23+#0)
	}
	{
		call ##halide_cond_broadcast
		r0 = add(r0,#56)
	}
	{
		jump .LBB22_2
	}
.LBB22_58:                              //   in Loop: Header=BB22_2 Depth=2
	{
		p0 = and(p0,!p0)
		r18 = r0
	}
.LBB22_61:                              // %while.end179
                                        //   in Loop: Header=BB22_2 Depth=2
	{
		r0 = p0
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
	{
		call ##halide_mutex_lock
		r0 = memw(r23+#0)
	}
	{
		r0 = memw(r17+#24)
		r1 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		r0 = sub(r0,r20)
		memw(r17+#20) += r20
	}
	{
		p0 = r1
		if (!p0.new) jump:t .LBB22_71
		memw(r17+#24) = r0
		if (!p0.new) memw(r17+#24) = #0
	}
// %bb.62:                              // %if.else190
                                        //   in Loop: Header=BB22_2 Depth=2
	{
		r0 = #0
		p0 = cmp.gt(r0,#0); if (!p0.new) jump:t .LBB22_64
	}
// %bb.63:                              // %if.then194
                                        //   in Loop: Header=BB22_2 Depth=2
	{
		r1 = memw(r23+#0)
	}
	{
		r2 = memw(r1+#16)
		memw(r17+#44) = r2.new
	}
	{
		r2 = memw(r17+#56)
		memw(r1+#16) = r17
	}
	{
		r1 = memw(r17+#28)
	}
	{
		p0 = cmp.eq(r2,#0); if (!p0.new) jump:t .LBB22_89
	}
	{
		jump .LBB22_65
	}
.LBB22_68:                              // %if.else220
                                        //   in Loop: Header=BB22_2 Depth=2
	{
		r1 = r20
		r3:2 = combine(#1,r18)
		r5:4 = combine(r17,r19)
	}
	{
		call ##halide_do_loop_task
	}
.LBB22_69:                              // %if.end230
                                        //   in Loop: Header=BB22_2 Depth=2
	{
		r21 = r27
		r18 = r0
		r0 = memw(r23+#0)
	}
	{
		call ##halide_mutex_lock
	}
	{
		r27:26 = combine(#-1,#-1)
		p0 = cmp.eq(r18,#0); if (p0.new) jump:nt .LBB22_70
	}
.LBB22_71:                              // %if.then238
                                        //   in Loop: Header=BB22_2 Depth=2
	{
		r1:0 = memd(r29+#8)
		memw(r17+#72) = r18
	}                                       // 8-byte Folded Reload
	{
		r0 = memw(r17+#52)
	}
	{
		memd(r29+#8) = r1:0
	}                                       // 8-byte Folded Spill
	{
		p0 = cmp.gt(r0,#0); if (!p0.new) jump:nt .LBB22_72
	}
// %bb.73:                              // %do.end243.lr.ph
                                        //   in Loop: Header=BB22_2 Depth=2
	{
		r1:0 = add(r1:0,r27:26)
		r3:2 = combine(r1,r0)
		r5:4 = combine(#0,#3)
	}
	{
		p0 = cmp.gtu(r5:4,r1:0)
		if (!p0.new) jump:t .LBB22_79
		r1 = memw(r17+#48)
	}
// %bb.74:                              //   in Loop: Header=BB22_2 Depth=2
	{
		r0 = #0
		r3:2 = combine(#0,#0)
	}
.LBB22_75:                              // %if.end271.loopexit.unr-lcssa
                                        //   in Loop: Header=BB22_2 Depth=2
	{
		r5:4 = memd(r29+#8)
	}                                       // 8-byte Folded Reload
	{
		r4 = and(r4,#3)
		r5 = #0
	}
	{
		p0 = cmp.eq(r5:4,r25:24)
		if (!p0.new) jump:t .LBB22_76
	}
	{
		jump .LBB22_64
	}
	.p2align	4
.LBB22_78:                              // %for.inc.epil
                                        //   in Loop: Header=BB22_76 Depth=3
	{
		r5:4 = add(r5:4,r27:26)
		r7:6 = combine(#0,#1)
	}
	{
		p0 = cmp.eq(r5:4,r25:24)
		r3:2 = add(r3:2,r7:6)
		if (p0.new) jump:nt .LBB22_64
	}
.LBB22_76:                              // %do.end243.epil
                                        //   Parent Loop BB22_1 Depth=1
                                        //     Parent Loop BB22_2 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	{
		r6 = r1
	}
	{
		r6 += mpyi(r2,#84)
	}
	{
		r7 = memw(r6+#72)
		if (!cmp.eq(r7.new,#0)) jump:nt .LBB22_78
	}
// %bb.77:                              // %if.then247.epil
                                        //   in Loop: Header=BB22_76 Depth=3
	{
		r7 = memw(r17+#68)
		memw(r6+#72) = r18
	}
	{
		r7 = #0
		p0 = cmp.eq(r7,#0)
	}
	{
		if (p0) r7 = memub(r6+##80)
	}
	{
		r0 = or(r7,and(r0,#1))
		jump .LBB22_78
	}
.LBB22_72:                              //   in Loop: Header=BB22_2 Depth=2
	{
		r0 = #0
	}
.LBB22_64:                              // %if.end271
                                        //   in Loop: Header=BB22_2 Depth=2
	{
		r2 = memw(r17+#56)
		r1 = memw(r17+#28)
	}
	{
		p0 = cmp.eq(r2,#0); if (p0.new) jump:nt .LBB22_65
	}
.LBB22_89:                              // %if.else281
                                        //   in Loop: Header=BB22_2 Depth=2
	{
		jump .LBB22_90
		memw(r2+#60) -= r1
	}
.LBB22_79:                              // %do.end243.lr.ph.new
                                        //   in Loop: Header=BB22_2 Depth=2
	{
		r0 = #-4
		r5 = #0
	}
	{
		r0 = #0 ; jump .LBB22_80
		r4 = and(r2,r0)
		r3:2 = combine(#0,#0)
	}
	.p2align	4
.LBB22_88:                              // %for.inc.3
                                        //   in Loop: Header=BB22_80 Depth=3
	{
		r7:6 = combine(#-1,#-4)
	}
	{
		r5:4 = add(r5:4,r7:6)
		r7:6 = combine(#0,#4)
	}
	{
		p0 = cmp.eq(r5:4,r25:24)
		r3:2 = add(r3:2,r7:6)
		if (p0.new) jump:nt .LBB22_75
	}
.LBB22_80:                              // %do.end243
                                        //   Parent Loop BB22_1 Depth=1
                                        //     Parent Loop BB22_2 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	{
		r6 = r1
	}
	{
		r6 += mpyi(r2,#84)
	}
	{
		r7 = memw(r6+#72)
		if (!cmp.eq(r7.new,#0)) jump:nt .LBB22_82
	}
// %bb.81:                              // %if.then247
                                        //   in Loop: Header=BB22_80 Depth=3
	{
		r7 = memw(r17+#68)
		memw(r6+#72) = r18
	}
	{
		r7 = #0
		p0 = cmp.eq(r7,#0)
	}
	{
		if (p0) r7 = memub(r6+##80)
	}
	{
		r0 = or(r7,and(r0,#1))
	}
.LBB22_82:                              // %for.inc
                                        //   in Loop: Header=BB22_80 Depth=3
	{
		r7 = setbit(r2,#0)
		r6 = r1
	}
	{
		r6 += mpyi(r7,#84)
	}
	{
		r7 = memw(r6+#72)
		if (!cmp.eq(r7.new,#0)) jump:t .LBB22_84
	}
// %bb.83:                              // %if.then247.1
                                        //   in Loop: Header=BB22_80 Depth=3
	{
		r7 = memw(r17+#68)
		memw(r6+#72) = r18
	}
	{
		r7 = #0
		p0 = cmp.eq(r7,#0)
	}
	{
		if (p0) r7 = memub(r6+##80)
	}
	{
		r0 = or(r7,and(r0,#1))
	}
.LBB22_84:                              // %for.inc.1
                                        //   in Loop: Header=BB22_80 Depth=3
	{
		r7 = setbit(r2,#1)
		r6 = r1
	}
	{
		r6 += mpyi(r7,#84)
	}
	{
		r7 = memw(r6+#72)
		if (!cmp.eq(r7.new,#0)) jump:nt .LBB22_86
	}
// %bb.85:                              // %if.then247.2
                                        //   in Loop: Header=BB22_80 Depth=3
	{
		r7 = memw(r17+#68)
		memw(r6+#72) = r18
	}
	{
		r7 = #0
		p0 = cmp.eq(r7,#0)
	}
	{
		if (p0) r7 = memub(r6+##80)
	}
	{
		r0 = or(r7,and(r0,#1))
	}
.LBB22_86:                              // %for.inc.2
                                        //   in Loop: Header=BB22_80 Depth=3
	{
		r6 = r1
		r7 = or(r2,#3)
	}
	{
		r6 += mpyi(r7,#84)
	}
	{
		r7 = memw(r6+#72)
		if (!cmp.eq(r7.new,#0)) jump:nt .LBB22_88
	}
// %bb.87:                              // %if.then247.3
                                        //   in Loop: Header=BB22_80 Depth=3
	{
		r7 = memw(r17+#68)
		memw(r6+#72) = r18
	}
	{
		r7 = #0
		p0 = cmp.eq(r7,#0)
	}
	{
		if (p0) r7 = memub(r6+##80)
	}
	{
		r0 = or(r7,and(r0,#1))
		jump .LBB22_88
	}
.LBB22_70:                              //   in Loop: Header=BB22_2 Depth=2
	{
		r0 = #0
		r2 = memw(r17+#56)
		r1 = memw(r17+#28)
	}
	{
		p0 = cmp.eq(r2,#0); if (!p0.new) jump:t .LBB22_89
	}
.LBB22_65:                              // %if.then274
                                        //   in Loop: Header=BB22_2 Depth=2
	{
		r2 = memw(r23+#0)
	}
	{
		r2 = add(r2,#1100)
	}
	{
		memw(r2+#0) -= r1
	}
.LBB22_90:                              // %if.end290
                                        //   in Loop: Header=BB22_2 Depth=2
	{
		p0 = tstbit(r0,#0)
		r1 = memw(r17+#68)
	}
	{
		r0 = add(r1,#-1)
		if (p0) jump:nt .LBB22_95
		memw(r17+#68) = r0.new
	}
// %bb.91:                              // %lor.lhs.false297
                                        //   in Loop: Header=BB22_2 Depth=2
	{
		r18 = #0
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB22_2
	}
// %bb.92:                              // %land.lhs.true300
                                        //   in Loop: Header=BB22_2 Depth=2
	{
		r0 = memw(r17+#24)
		if (cmp.eq(r0.new,#0)) jump:nt .LBB22_94
	}
// %bb.93:                              // %lor.lhs.false304
                                        //   in Loop: Header=BB22_2 Depth=2
	{
		r18 = #0
		r0 = memw(r17+#72)
		if (cmp.eq(r0.new,#0)) jump:nt ##.LBB22_2
	}
.LBB22_94:                              // %land.lhs.true307
                                        //   in Loop: Header=BB22_2 Depth=2
	{
		r18 = #0
		r0 = memb(r17+#80)
		if (!cmp.eq(r0.new,#0)) jump:t .LBB22_95
	}
	{
		jump .LBB22_2
	}
.LBB22_43:                              // %if.else118
                                        //   in Loop: Header=BB22_2 Depth=2
	{
		p0 = cmp.gt(r18,#39)
		r18 = add(r18,#1)
		if (p0.new) jump:t .LBB22_45
	}
// %bb.44:                              // %if.then121
                                        //   in Loop: Header=BB22_2 Depth=2
	{
		r17 = memw(r23+#0)
	}
	{
		call ##halide_mutex_unlock
		r0 = r17
	}
	{
		call ##halide_thread_yield
	}
	{
		call ##halide_mutex_lock
		r0 = r17
	}
	{
		jump .LBB22_46
	}
.LBB22_45:                              // %if.else122
                                        //   in Loop: Header=BB22_2 Depth=2
	{
		r1 = memw(r23+#0)
	}
	{
		call ##halide_cond_wait
		r0 = add(r1,#40)
	}
.LBB22_46:                              // %if.end124
                                        //   in Loop: Header=BB22_2 Depth=2
	{
		r0 = memw(r23+#0)
	}
	{
		jump .LBB22_2
		memw(r0+#64) -= #1
	}
	.p2align	4
.LBB22_95:                              // %if.then310
                                        //   in Loop: Header=BB22_1 Depth=1
	{
		r0 = memw(r23+#0)
	}
	{
		call ##halide_cond_broadcast
		r0 = add(r0,#56)
	}
.LBB22_1:                               // %while.cond
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB22_2 Depth 2
                                        //       Child Loop BB22_14 Depth 3
                                        //       Child Loop BB22_12 Depth 3
                                        //         Child Loop BB22_31 Depth 4
                                        //       Child Loop BB22_50 Depth 3
                                        //         Child Loop BB22_52 Depth 4
                                        //           Child Loop BB22_53 Depth 5
                                        //       Child Loop BB22_80 Depth 3
                                        //       Child Loop BB22_76 Depth 3
	{
		r18 = #0 ; jump .LBB22_2
	}
.LBB22_96:                              // %while.end316
	{
		r17:16 = memd(r29+#72)
		r19:18 = memd(r29+#64)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#56)
		r23:22 = memd(r29+#48)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#40)
		r27:26 = memd(r29+#32)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end22:
	.size	_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE, .Lfunc_end22-_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE
                                        // -- End function
	.section	.text.halide_mutex_unlock,"ax",@progbits
	.weak	halide_mutex_unlock             // -- Begin function halide_mutex_unlock
	.p2align	4
	.type	halide_mutex_unlock,@function
halide_mutex_unlock:                    // @halide_mutex_unlock
// %bb.0:                               // %entry
	{
		r2 = r0
		allocframe(#8)
	}
	{
		r5:4 = memd_locked(r0)
	}
	{
		r1:0 = combine(#0,#1)
	}
	{
		p0 = cmp.eq(r5:4,r1:0)
		if (!p0.new) jump:t .LBB23_2
	}
.LBB23_1:                               // %cmpxchg.trystore
	{
		r5:4 = combine(#0,#0)
	}
	{
		memd_locked(r2,p0) = r5:4
	}
	{
		if (p0) r31:30 = dealloc_return(r30):raw
	}
.LBB23_2:                               // %cmpxchg.start9
	{
		r5:4 = memd_locked(r2)
	}
	{
		p0 = cmp.eq(r5:4,r1:0)
		if (p0.new) jump:t .LBB23_1
	}
// %bb.3:                               // %if.end.i.i
	{
		r1 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		r3 = #0
		r0 = add(r29,#0)
	}
	{
		r1 = memw(r1+##_ZTVN6Halide7Runtime8Internal15Synchronization21mutex_parking_controlE@GOT)
		memw(r29+#4) = r2
	}
	{
		call ##_ZN6Halide7Runtime8Internal15Synchronization15parking_control10unpark_oneEy
		r1 = add(r1,#8)
		memw(r29+#0) = r1.new
	}
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end23:
	.size	halide_mutex_unlock, .Lfunc_end23-halide_mutex_unlock
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization15parking_control10unpark_oneEy,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization15parking_control10unpark_oneEy // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization15parking_control10unpark_oneEy
	.p2align	4
	.type	_ZN6Halide7Runtime8Internal15Synchronization15parking_control10unpark_oneEy,@function
_ZN6Halide7Runtime8Internal15Synchronization15parking_control10unpark_oneEy: // @_ZN6Halide7Runtime8Internal15Synchronization15parking_control10unpark_oneEy
// %bb.0:                               // %entry
	{
		r17 = r0
		r1:0 = combine(r3,r2)
		memd(r29+#-16) = r17:16
		allocframe(#64)
	}                                       // 8-byte Folded Spill
	{
		r21:20 = combine(r3,r2)
		memd(r29+#40) = r21:20
		memd(r29+#48) = r19:18
	}                                       // 8-byte Folded Spill
	{
		memd(r29+#32) = r23:22
		memd(r29+#24) = r25:24
	}                                       // 8-byte Folded Spill
	{
		call ##_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy
		memd(r29+#16) = r27:26
	}                                       // 8-byte Folded Spill
	{
		r23 = add(r0,#8)
		r25 = #0
		r16 = r0
		r22 = memw(r0+#8)
	}
	{
		r26 = #0
		jump .LBB24_1
	}
	.p2align	4
.LBB24_3:                               //   in Loop: Header=BB24_1 Depth=1
	{
		r23 = add(r22,#144)
		r26 = r22
		r22 = r0
		if (p0) jump:nt .LBB24_20
	}
.LBB24_1:                               // %while.cond
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB24_6 Depth 2
                                        //     Child Loop BB24_10 Depth 2
	{
		p0 = cmp.eq(r22,#0); if (p0.new) jump:nt .LBB24_15
	}
// %bb.2:                               // %while.body
                                        //   in Loop: Header=BB24_1 Depth=1
	{
		r1:0 = memd(r22+#136)
	}
	{
		p0 = cmp.eq(r1:0,r21:20)
		if (!p0.new) jump:t .LBB24_3
		r0 = memw(r22+#144)
	}
// %bb.4:                               // %if.then
                                        //   in Loop: Header=BB24_1 Depth=1
	{
		r1 = p0
		memw(r23+#0) = r0
	}
	{
		r18 = #0
		r1 = memw(r16+#12)
		memw(r29+#4) = r1
	}                                       // 4-byte Folded Spill
	{
		p0 = cmp.eq(r1,r22); if (p0.new) jump:t .LBB24_9
		if (p0.new) memw(r16+#12) = r26
	}
// %bb.5:                               // %while.cond7.preheader
                                        //   in Loop: Header=BB24_1 Depth=1
	{
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB24_9
	}
	.p2align	4
.LBB24_6:                               // %while.body9
                                        //   Parent Loop BB24_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	{
		r3:2 = memd(r0+#136)
	}
	{
		p0 = cmp.eq(r3:2,r21:20)
		r0 = memw(r0+#144)
		if (cmp.eq(r0.new,#0)) jump:nt .LBB24_8
	}
// %bb.7:                               // %while.body9
                                        //   in Loop: Header=BB24_6 Depth=2
	{
		if (!p0) jump:nt .LBB24_6
	}
.LBB24_8:                               // %if.end.loopexit
                                        //   in Loop: Header=BB24_1 Depth=1
	{
		r18 = mux(p0,#1,#0)
	}
.LBB24_9:                               // %if.end
                                        //   in Loop: Header=BB24_1 Depth=1
	{
		r1:0 = combine(#1,r17)
		r2 = memw(r17+#0)
	}
	{
		r2 = r18
		r3 = memw(r2+#8)
	}
	{
		callr r3
	}
	{
		call ##pthread_mutex_lock
		r0 = r22
		memd(r22+#152) = r1:0
	}
	.p2align	4
.LBB24_10:                              // %atomicrmw.start
                                        //   Parent Loop BB24_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	{
		r3:2 = memd_locked(r16)
	}
	{
		r0 = clrbit(r2,#0)
		r1 = r3
	}
	{
		memd_locked(r16,p0) = r1:0
	}
	{
		if (!p0) jump:nt .LBB24_10
	}
// %bb.11:                              // %atomicrmw.end
                                        //   in Loop: Header=BB24_1 Depth=1
	{
		r5:4 = combine(#0,#4)
	}
	{
		p0 = cmp.gtu(r5:4,r3:2)
		if (p0.new) jump:nt .LBB24_14
	}
// %bb.12:                              // %atomicrmw.end
                                        //   in Loop: Header=BB24_1 Depth=1
	{
		r24 = and(r0,#3)
		r3:2 = combine(#0,#0)
	}
	{
		p0 = cmp.eq(r25:24,r3:2)
		if (!p0.new) jump:nt .LBB24_14
	}
// %bb.13:                              // %if.then.i
                                        //   in Loop: Header=BB24_1 Depth=1
	{
		call ##_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv
		r0 = r16
	}
.LBB24_14:                              // %_ZN6Halide7Runtime8Internal15Synchronization9word_lock6unlockEv.exit
                                        //   in Loop: Header=BB24_1 Depth=1
	{
		call ##pthread_cond_signal
		r0 = add(r22,#64)
		memb(r22+#128) = r25
	}
	{
		call ##pthread_mutex_unlock
		r0 = r22
	}
	{
		r19 = #0
		r0 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r0
		if (!p0.new) jump:t .LBB24_1
	}
	{
		jump .LBB24_20
	}
.LBB24_15:                              // %while.end22
	{
		r1:0 = combine(#0,r17)
		r2 = memw(r17+#0)
	}
	{
		r2 = #0
		r3 = memw(r2+#8)
	}
	{
		callr r3
	}
	.p2align	4
.LBB24_16:                              // %atomicrmw.start2
                                        // =>This Inner Loop Header: Depth=1
	{
		r3:2 = memd_locked(r16)
	}
	{
		r0 = clrbit(r2,#0)
		r1 = r3
	}
	{
		memd_locked(r16,p0) = r1:0
	}
	{
		if (!p0) jump:nt .LBB24_16
	}
// %bb.17:                              // %atomicrmw.end1
	{
		r5:4 = combine(#0,#4)
		r19:18 = combine(#0,#0)
	}
	{
		p0 = cmp.gtu(r5:4,r3:2)
		if (!p0.new) jump:nt .LBB24_18
	}
.LBB24_20:                              // %cleanup27
	{
		r1:0 = combine(r19,r18)
		r17:16 = memd(r29+#56)
		r19:18 = memd(r29+#48)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#40)
		r23:22 = memd(r29+#32)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#24)
		r27:26 = memd(r29+#16)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB24_18:                              // %atomicrmw.end1
	{
		r0 = and(r0,#3)
		r1 = r18
		r3:2 = combine(#0,#0)
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (!p0.new) jump:nt .LBB24_20
	}
// %bb.19:                              // %if.then.i68
	{
		call ##_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv
		r0 = r16
		r19:18 = combine(#0,#0)
	}
	{
		jump .LBB24_20
	}
.Lfunc_end24:
	.size	_ZN6Halide7Runtime8Internal15Synchronization15parking_control10unpark_oneEy, .Lfunc_end24-_ZN6Halide7Runtime8Internal15Synchronization15parking_control10unpark_oneEy
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy
	.p2align	4
	.type	_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy,@function
_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy: // @_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy
// %bb.0:                               // %entry
	{
		r2 = ##2135587861
		r3 = ##-1640531527
	}
	{
		r4 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		r7:6 = mpyu(r0,r2)
		allocframe(r29,#8):raw
	}
	{
		r7 += mpyi(r0,r3)
		memd(r29+#0) = r17:16
	}                                       // 8-byte Folded Spill
	{
		r7 += mpyi(r2,r1)
		r5:4 = combine(#0,#0)
		r0 = memw(r4+##_ZN6Halide7Runtime8Internal15Synchronization5tableE@GOT)
	}
	{
		r3:2 = lsr(r7:6,#54)
	}
	{
		r16 = addasl(r0,r2,#4)
	}
	{
		r1:0 = memd_locked(r16)
	}
	{
		p0 = cmp.eq(r1:0,r5:4)
		if (!p0.new) jump:t .LBB25_2
	}
// %bb.1:                               // %cmpxchg.trystore
	{
		r1:0 = combine(#0,#1)
	}
	{
		memd_locked(r16,p0) = r1:0
	}
	{
		if (p0) r0 = add(r16,#0)
		if (p0) r17:16 = memd(r29+#0)
		if (p0) r31:30 = dealloc_return(r30):raw
	}                                       // 8-byte Folded Reload
.LBB25_2:                               // %if.then.i.critedge
	{
		call ##_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv
		r0 = r16
	}
	{
		r0 = r16
		r17:16 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end25:
	.size	_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy, .Lfunc_end25-_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv
	.p2align	4
	.type	_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv,@function
_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv: // @_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv
// %bb.0:                               // %entry
	{
		r16 = r0
		r3 = #0
		memd(r29+#-16) = r17:16
		allocframe(#48)
	}                                       // 8-byte Folded Spill
	{
		p0 = or(p0,!p0)
		p1 = and(p1,!p1)
		r5:4 = combine(#0,#4)
		r7:6 = combine(#0,#0)
	}
	{
		memd(r29+#32) = r19:18
		memd(r29+#24) = r21:20
	}                                       // 8-byte Folded Spill
	{
		memd(r29+#16) = r23:22
		memd(r29+#8) = r25:24
	}                                       // 8-byte Folded Spill
	{
		memd(r29+#0) = r27:26
	}                                       // 8-byte Folded Spill
	{
		r0 = #2 ; jump .LBB26_1
		r9:8 = memd(r0+#0)
	}
	.p2align	4
.LBB26_5:                               // %cmpxchg.failure
                                        //   in Loop: Header=BB26_1 Depth=1
	{
		p2 = or(p1,p1)
	}
.LBB26_6:                               // %cmpxchg.end
                                        //   in Loop: Header=BB26_1 Depth=1
	{
		r9:8 = combine(r25,r24)
		if (p2) jump:nt .LBB26_7
	}
.LBB26_1:                               // %while.cond
                                        // =>This Inner Loop Header: Depth=1
	{
		p2 = cmp.gtu(r5:4,r9:8)
		if (p2.new) jump:nt .LBB26_27
	}
// %bb.2:                               // %while.cond
                                        //   in Loop: Header=BB26_1 Depth=1
	{
		r2 = and(r8,r0)
	}
	{
		p2 = cmp.eq(r3:2,r7:6)
		if (!p2.new) jump:nt .LBB26_27
	}
// %bb.3:                               // %if.end
                                        //   in Loop: Header=BB26_1 Depth=1
	{
		r25:24 = memd_locked(r16)
	}
	{
		p2 = cmp.eq(r25:24,r9:8)
		if (!p2.new) jump:t .LBB26_5
	}
// %bb.4:                               // %cmpxchg.trystore
                                        //   in Loop: Header=BB26_1 Depth=1
	{
		r8 = setbit(r8,#1)
		p2 = or(p0,p0)
	}
	{
		memd_locked(r16,p3) = r9:8
	}
	{
		if (!p3) jump:nt .LBB26_5
	}
	{
		jump .LBB26_6
	}
.LBB26_7:
	{
		r17 = add(pc,##.L.str.5@PCREL)
		r21 = #0
		r23:22 = combine(#0,#4)
	}
.LBB26_8:                               // %while.cond11
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB26_9 Depth 2
                                        //     Child Loop BB26_19 Depth 2
	{
		r19 = and(r24,#-4)
	}
	{
		r20 = r19
		r18 = memw(r19+#144)
	}
	{
		p0 = cmp.eq(r18,#0); if (p0.new) jump:nt .LBB26_9
	}
.LBB26_12:                              // %while.end23
                                        //   in Loop: Header=BB26_8 Depth=1
	{
		p0 = tstbit(r24,#0)
		if (p0.new) jump:t .LBB26_13
		memw(r19+#144) = r18
	}
// %bb.18:                              // %if.end35
                                        //   in Loop: Header=BB26_8 Depth=1
	{
		r1 = r25
		r0 = memw(r18+#140)
		if (!cmp.eq(r0.new,#0)) jump:nt .LBB26_24
	}
	.p2align	4
.LBB26_19:                              // %while.body41
                                        //   Parent Loop BB26_8 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	{
		r25 = r1
		r1:0 = memd_locked(r16)
	}
	{
		p0 = cmp.eq(r1:0,r25:24)
		if (!p0.new) jump:t .LBB26_21
	}
// %bb.20:                              // %cmpxchg.trystore25
                                        //   in Loop: Header=BB26_19 Depth=2
	{
		p0 = or(p0,!p0)
		r20 = and(r24,#1)
	}
	{
		memd_locked(r16,p1) = r21:20
	}
	{
		if (p1) jump:nt .LBB26_22
	}
.LBB26_21:                              // %cmpxchg.failure21
                                        //   in Loop: Header=BB26_19 Depth=2
	{
		p0 = and(p0,!p0)
	}
.LBB26_22:                              // %cmpxchg.end20
                                        //   in Loop: Header=BB26_19 Depth=2
	{
		if (p0) jump:nt .LBB26_26
	}
// %bb.23:                              // %if.end47
                                        //   in Loop: Header=BB26_19 Depth=2
	{
		p0 = cmp.gtu(r23:22,r1:0)
		r24 = r0
		if (p0.new) jump:t .LBB26_19
	}
	{
		jump .LBB26_17
	}
	.p2align	4
.LBB26_11:                              // %do.end
                                        //   in Loop: Header=BB26_9 Depth=2
	{
		r20 = r26
		r18 = memw(r26+#144)
		memw(r26+#140) = r20
	}
	{
		p0 = cmp.eq(r18,#0); if (!p0.new) jump:nt .LBB26_12
	}
.LBB26_9:                               // %while.body17
                                        //   Parent Loop BB26_8 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	{
		r26 = memw(r20+#136)
		if (!cmp.eq(r26.new,#0)) jump:t .LBB26_11
	}
// %bb.10:                              // %if.then20
                                        //   in Loop: Header=BB26_9 Depth=2
	{
		call ##halide_print
		r1:0 = combine(r17,#0)
	}
	{
		call ##abort
	}
	{
		jump .LBB26_11
	}
	.p2align	4
.LBB26_13:                              // %if.then27
                                        //   in Loop: Header=BB26_8 Depth=1
	{
		r1:0 = memd_locked(r16)
	}
	{
		p0 = cmp.eq(r1:0,r25:24)
		if (!p0.new) jump:t .LBB26_15
	}
// %bb.14:                              // %cmpxchg.trystore8
                                        //   in Loop: Header=BB26_8 Depth=1
	{
		r24 = clrbit(r24,#1)
		p0 = or(p0,!p0)
	}
	{
		memd_locked(r16,p1) = r25:24
	}
	{
		if (p1) jump:nt .LBB26_16
	}
.LBB26_15:                              // %cmpxchg.failure4
                                        //   in Loop: Header=BB26_8 Depth=1
	{
		p0 = and(p0,!p0)
	}
.LBB26_16:                              // %cmpxchg.end3
                                        //   in Loop: Header=BB26_8 Depth=1
	{
		if (p0) jump:nt .LBB26_27
	}
.LBB26_17:                              // %cleanup70
                                        //   in Loop: Header=BB26_8 Depth=1
	{
		r24 = r0
	}
	{
		barrier
	}
	{
		r25 = r1
		jump .LBB26_8
	}
.LBB26_27:                              // %cleanup76
	{
		r17:16 = memd(r29+#40)
		r19:18 = memd(r29+#32)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#24)
		r23:22 = memd(r29+#16)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#8)
		r27:26 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB26_24:                              // %if.else62
	{
		memw(r19+#144) = r0
	}
	.p2align	4
.LBB26_25:                              // %atomicrmw.start
                                        // =>This Inner Loop Header: Depth=1
	{
		r1:0 = memd_locked(r16)
	}
	{
		r0 = clrbit(r0,#1)
	}
	{
		memd_locked(r16,p0) = r1:0
	}
	{
		if (!p0) jump:nt .LBB26_25
	}
.LBB26_26:                              // %if.end66
	{
		call ##pthread_mutex_lock
		r0 = r18
	}
	{
		r0 = add(r18,#64)
		r1 = #0
		memb(r18+#128) = r1.new
	}
	{
		call ##pthread_cond_signal
	}
	{
		r0 = r18
		r17:16 = memd(r29+#40)
		r19:18 = memd(r29+#32)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#24)
		r23:22 = memd(r29+#16)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#8)
		r27:26 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		jump ##pthread_mutex_unlock
		r31:30 = deallocframe(r30):raw
	}
.Lfunc_end26:
	.size	_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv, .Lfunc_end26-_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv
	.p2align	4
	.type	_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv,@function
_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv: // @_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv
// %bb.0:                               // %entry
	{
		p2 = or(p2,!p2)
		r16 = r0
		memd(r29+#-16) = r17:16
		allocframe(#200)
	}                                       // 8-byte Folded Spill
	{
		p3 = and(p3,!p3)
	}
	{
		r18 = add(r29,#0)
		r23:22 = combine(#0,#40)
		memd(r29+#184) = r19:18
		memd(r29+#168) = r23:22
	}                                       // 8-byte Folded Spill
	{
		r25:24 = combine(#0,#0)
		r17 = add(r18,#64)
		memd(r29+#160) = r25:24
		memd(r29+#176) = r21:20
	}                                       // 8-byte Folded Spill
	{
		memd(r29+#152) = r27:26
	}                                       // 8-byte Folded Spill
	{
		r27:26 = memd(r0+#0)
	}
	{
		p0 = tstbit(r26,#0)
		if (p0.new) jump:t .LBB27_7
	}
	.p2align	4
.LBB27_2:                               // %if.then
                                        // =>This Inner Loop Header: Depth=1
	{
		r1:0 = memd_locked(r16)
	}
	{
		p0 = cmp.eq(r1:0,r27:26)
		if (!p0.new) jump:t .LBB27_4
	}
// %bb.3:                               // %cmpxchg.trystore
                                        //   in Loop: Header=BB27_2 Depth=1
	{
		r26 = setbit(r26,#0)
		p0 = or(p2,p2)
	}
	{
		memd_locked(r16,p1) = r27:26
	}
	{
		if (p1) jump:nt .LBB27_5
	}
.LBB27_4:                               // %cmpxchg.failure
                                        //   in Loop: Header=BB27_2 Depth=1
	{
		p0 = or(p3,p3)
	}
.LBB27_5:                               // %cmpxchg.end
                                        //   in Loop: Header=BB27_2 Depth=1
	{
		if (p0) jump:nt .LBB27_22
	}
// %bb.6:                               // %_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_131atomic_cas_weak_acquire_relaxedEPyS4_S4_.exit
                                        //   in Loop: Header=BB27_2 Depth=1
	{
		r27:26 = combine(r1,r0)
		p0 = tstbit(r0,#0); if (!p0.new) jump:t .LBB27_2
	}
.LBB27_7:                               // %if.end4
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB27_18 Depth 2
	{
		r1:0 = combine(#0,#4)
	}
	{
		p0 = cmp.gtu(r1:0,r27:26)
		if (p0.new) jump:nt .LBB27_8
	}
// %bb.14:                              // %if.end4
                                        //   in Loop: Header=BB27_7 Depth=1
	{
		p0 = cmp.gt(r22,#0); if (!p0.new) jump:nt .LBB27_8
	}
// %bb.15:                              // %_ZN6Halide7Runtime8Internal15Synchronization12spin_control11should_spinEv.exit
                                        //   in Loop: Header=BB27_7 Depth=1
	{
		r19 = #0
		p0 = cmp.gt(r22,#1); if (!p0.new) jump:t .LBB27_9
	}
// %bb.16:                              // %if.then7
                                        //   in Loop: Header=BB27_7 Depth=1
	{
		call ##halide_thread_yield
		r22 = add(r22,#-1)
	}
	{
		jump .LBB27_17
		r27:26 = memd(r16+#0)
	}
.LBB27_8:                               //   in Loop: Header=BB27_7 Depth=1
	{
		r19 = r22
	}
.LBB27_9:                               // %if.end9
                                        //   in Loop: Header=BB27_7 Depth=1
	{
		r0 = add(r29,#0)
		r1 = #0
		memb(r29+#128) = r23
	}
	{
		call ##pthread_mutex_init
	}
	{
		call ##pthread_cond_init
		r1:0 = combine(#0,r17)
	}
	{
		r0 = #-4
		r1 = r27
		r2 = #1
		memd(r29+#136) = r25:24
	}
	{
		p2 = and(p2,!p2)
		r0 = and(r26,r0)
		memw(r29+#144) = #0
		memb(r29+#128) = r2
	}
	{
		p0 = cmp.eq(r1:0,r25:24)
		if (p0.new) memw(r29+#144) = r18
		if (!p0.new) memw(r29+#136) = r0
	}
	{
		r21:20 = memd_locked(r16)
	}
	{
		p0 = cmp.eq(r21:20,r27:26)
		if (!p0.new) jump:t .LBB27_11
	}
// %bb.10:                              // %cmpxchg.trystore7
                                        //   in Loop: Header=BB27_7 Depth=1
	{
		p0 = or(p0,!p0)
		r0 = and(r26,#3)
	}
	{
		r22 = or(r0,r18)
	}
	{
		memd_locked(r16,p1) = r23:22
	}
	{
		if (p1) jump:nt .LBB27_12
	}
.LBB27_11:                              // %cmpxchg.failure3
                                        //   in Loop: Header=BB27_7 Depth=1
	{
		p0 = or(p2,p2)
	}
.LBB27_12:                              // %cmpxchg.end2
                                        //   in Loop: Header=BB27_7 Depth=1
	{
		if (!p0) jump:nt .LBB27_21
	}
// %bb.13:                              // %if.then19
                                        //   in Loop: Header=BB27_7 Depth=1
	{
		call ##pthread_mutex_lock
		r0 = add(r29,#0)
	}
	{
		r0 = memb(r29+#128)
		if (cmp.eq(r0.new,#0)) jump:nt .LBB27_20
	}
	.p2align	4
.LBB27_18:                              // %while.body.i
                                        //   Parent Loop BB27_7 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	{
		call ##pthread_cond_wait
		r1 = add(r29,#0)
		r0 = r17
	}
	{
		r0 = memb(r29+#128)
		if (!cmp.eq(r0.new,#0)) jump:t .LBB27_18
	}
.LBB27_20:                              // %_ZN6Halide7Runtime8Internal15Synchronization13thread_parker4parkEv.exit
                                        //   in Loop: Header=BB27_7 Depth=1
	{
		call ##pthread_mutex_unlock
		r0 = add(r29,#0)
	}
	{
		r19 = #40
		r21:20 = memd(r16+#0)
	}
.LBB27_21:                              // %if.end22
                                        //   in Loop: Header=BB27_7 Depth=1
	{
		call ##pthread_cond_destroy
		r0 = r17
	}
	{
		call ##pthread_mutex_destroy
		r0 = add(r29,#0)
		r27:26 = combine(r21,r20)
	}
	{
		r22 = r19
	}
.LBB27_17:                              // %while.cond.outer
                                        //   in Loop: Header=BB27_7 Depth=1
	{
		p2 = or(p2,!p2)
		p3 = and(p3,!p3)
	}
	{
		p0 = tstbit(r26,#0)
		if (!p0.new) jump:t .LBB27_2
	}
	{
		jump .LBB27_7
	}
.LBB27_22:                              // %cleanup23
	{
		r17:16 = memd(r29+#192)
		r19:18 = memd(r29+#184)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#176)
		r23:22 = memd(r29+#168)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#160)
		r27:26 = memd(r29+#152)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end27:
	.size	_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv, .Lfunc_end27-_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization21mutex_parking_control8validateERNS2_15validate_actionE,"axG",@progbits,_ZN6Halide7Runtime8Internal15Synchronization21mutex_parking_control8validateERNS2_15validate_actionE,comdat
	.weak	_ZN6Halide7Runtime8Internal15Synchronization21mutex_parking_control8validateERNS2_15validate_actionE // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization21mutex_parking_control8validateERNS2_15validate_actionE
	.p2align	4
	.type	_ZN6Halide7Runtime8Internal15Synchronization21mutex_parking_control8validateERNS2_15validate_actionE,@function
_ZN6Halide7Runtime8Internal15Synchronization21mutex_parking_control8validateERNS2_15validate_actionE: // @_ZN6Halide7Runtime8Internal15Synchronization21mutex_parking_control8validateERNS2_15validate_actionE
// %bb.0:                               // %entry
	{
		r3:2 = combine(#0,#3)
		r0 = memw(r0+#4)
	}
	{
		r1:0 = memd(r0+#0)
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
	}
	{
		r0 = mux(p0,#1,#0)
		jumpr r31
	}
.Lfunc_end28:
	.size	_ZN6Halide7Runtime8Internal15Synchronization21mutex_parking_control8validateERNS2_15validate_actionE, .Lfunc_end28-_ZN6Halide7Runtime8Internal15Synchronization21mutex_parking_control8validateERNS2_15validate_actionE
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization15parking_control12before_sleepEv,"axG",@progbits,_ZN6Halide7Runtime8Internal15Synchronization15parking_control12before_sleepEv,comdat
	.weak	_ZN6Halide7Runtime8Internal15Synchronization15parking_control12before_sleepEv // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization15parking_control12before_sleepEv
	.p2align	4
	.type	_ZN6Halide7Runtime8Internal15Synchronization15parking_control12before_sleepEv,@function
_ZN6Halide7Runtime8Internal15Synchronization15parking_control12before_sleepEv: // @_ZN6Halide7Runtime8Internal15Synchronization15parking_control12before_sleepEv
// %bb.0:                               // %entry
	{
		jumpr r31
	}
.Lfunc_end29:
	.size	_ZN6Halide7Runtime8Internal15Synchronization15parking_control12before_sleepEv, .Lfunc_end29-_ZN6Halide7Runtime8Internal15Synchronization15parking_control12before_sleepEv
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization21mutex_parking_control6unparkEib,"axG",@progbits,_ZN6Halide7Runtime8Internal15Synchronization21mutex_parking_control6unparkEib,comdat
	.weak	_ZN6Halide7Runtime8Internal15Synchronization21mutex_parking_control6unparkEib // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization21mutex_parking_control6unparkEib
	.p2align	4
	.type	_ZN6Halide7Runtime8Internal15Synchronization21mutex_parking_control6unparkEib,@function
_ZN6Halide7Runtime8Internal15Synchronization21mutex_parking_control6unparkEib: // @_ZN6Halide7Runtime8Internal15Synchronization21mutex_parking_control6unparkEib
// %bb.0:                               // %entry
	{
		p0 = tstbit(r2,#0)
		r1:0 = combine(#0,#0)
		r3 = #0
		r4 = memw(r0+#4)
	}
	{
		r2 = mux(p0,#2,r3)
	}
	{
		jumpr r31
		memd(r4+#0) = r3:2
	}
.Lfunc_end30:
	.size	_ZN6Halide7Runtime8Internal15Synchronization21mutex_parking_control6unparkEib, .Lfunc_end30-_ZN6Halide7Runtime8Internal15Synchronization21mutex_parking_control6unparkEib
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization15parking_control16requeue_callbackERKNS2_15validate_actionEbb,"axG",@progbits,_ZN6Halide7Runtime8Internal15Synchronization15parking_control16requeue_callbackERKNS2_15validate_actionEbb,comdat
	.weak	_ZN6Halide7Runtime8Internal15Synchronization15parking_control16requeue_callbackERKNS2_15validate_actionEbb // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization15parking_control16requeue_callbackERKNS2_15validate_actionEbb
	.p2align	4
	.type	_ZN6Halide7Runtime8Internal15Synchronization15parking_control16requeue_callbackERKNS2_15validate_actionEbb,@function
_ZN6Halide7Runtime8Internal15Synchronization15parking_control16requeue_callbackERKNS2_15validate_actionEbb: // @_ZN6Halide7Runtime8Internal15Synchronization15parking_control16requeue_callbackERKNS2_15validate_actionEbb
// %bb.0:                               // %entry
	{
		jumpr r31
	}
.Lfunc_end31:
	.size	_ZN6Halide7Runtime8Internal15Synchronization15parking_control16requeue_callbackERKNS2_15validate_actionEbb, .Lfunc_end31-_ZN6Halide7Runtime8Internal15Synchronization15parking_control16requeue_callbackERKNS2_15validate_actionEbb
                                        // -- End function
	.section	.text.halide_cond_broadcast,"ax",@progbits
	.weak	halide_cond_broadcast           // -- Begin function halide_cond_broadcast
	.p2align	4
	.type	halide_cond_broadcast,@function
halide_cond_broadcast:                  // @halide_cond_broadcast
// %bb.0:                               // %entry
	{
		r7:6 = combine(#0,#0)
		r5:4 = memd(r0+#0)
	}
	{
		p0 = cmp.eq(r5:4,r7:6)
		if (p0.new) jumpr:nt r31
	}
.LBB32_1:                               // %if.end.i
	{
		r1 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		r3:2 = combine(#0,r0)
		allocframe(#24)
	}
	{
		r0 = add(r29,#8)
	}
	{
		r1 = memw(r1+##_ZTVN6Halide7Runtime8Internal15Synchronization25broadcast_parking_controlE@GOT)
		memd(r29+#0) = r7:6
	}
	{
		r1 = add(r1,#8)
		memw(r29+#12) = r2
		memw(r29+#16) = r4
	}
	{
		call ##_ZN6Halide7Runtime8Internal15Synchronization15parking_control14unpark_requeueEyyy
		memw(r29+#8) = r1
	}
	{
		r31:30 = deallocframe(r30):raw
	}
	{
		jumpr r31
	}
.Lfunc_end32:
	.size	halide_cond_broadcast, .Lfunc_end32-halide_cond_broadcast
                                        // -- End function
	.section	.text.halide_default_semaphore_try_acquire,"ax",@progbits
	.weak	halide_default_semaphore_try_acquire // -- Begin function halide_default_semaphore_try_acquire
	.p2align	4
	.type	halide_default_semaphore_try_acquire,@function
halide_default_semaphore_try_acquire:   // @halide_default_semaphore_try_acquire
// %bb.0:                               // %entry
	{
		p0 = cmp.eq(r1,#0); if (p0.new) jump:nt .LBB33_1
	}
// %bb.2:                               // %if.end
	{
		r2 = memw(r0+#0)
	}
	{
		r3 = sub(r2,r1)
		if (!cmp.gt(r3.new,#-1)) jump:nt .LBB33_3
	}
// %bb.4:
	{
		p0 = or(p0,!p0)
		p1 = and(p1,!p1)
	}
.LBB33_5:                               // %cmpxchg.start
                                        // =>This Inner Loop Header: Depth=1
	{
		r4 = r2
		r2 = memw_locked(r0)
	}
	{
		p2 = cmp.eq(r2,r4)
		if (!p2.new) jump:t .LBB33_7
	}
// %bb.6:                               // %cmpxchg.trystore
                                        //   in Loop: Header=BB33_5 Depth=1
	{
		memw_locked(r0,p3) = r3
	}
	{
		p2 = or(p0,p0)
		if (p3) jump:nt .LBB33_8
	}
.LBB33_7:                               // %cmpxchg.failure
                                        //   in Loop: Header=BB33_5 Depth=1
	{
		p2 = or(p1,p1)
	}
.LBB33_8:                               // %cmpxchg.end
                                        //   in Loop: Header=BB33_5 Depth=1
	{
		if (p2) jump:nt .LBB33_10
	}
// %bb.9:                               // %cmpxchg.end
                                        //   in Loop: Header=BB33_5 Depth=1
	{
		r3 = sub(r2,r1)
		if (cmp.gt(r3.new,#-1)) jump:t .LBB33_5
	}
	{
		jump .LBB33_10
	}
.LBB33_1:
	{
		p2 = or(p2,!p2)
	}
.LBB33_10:                              // %return
	{
		r0 = mux(p2,#1,#0)
		jumpr r31
	}
.LBB33_3:
	{
		p2 = and(p2,!p2)
	}
	{
		r0 = mux(p2,#1,#0)
		jumpr r31
	}
.Lfunc_end33:
	.size	halide_default_semaphore_try_acquire, .Lfunc_end33-halide_default_semaphore_try_acquire
                                        // -- End function
	.section	.text.halide_cond_wait,"ax",@progbits
	.weak	halide_cond_wait                // -- Begin function halide_cond_wait
	.p2align	4
	.type	halide_cond_wait,@function
halide_cond_wait:                       // @halide_cond_wait
// %bb.0:                               // %entry
	{
		r17:16 = combine(#0,r1)
		r2 = r0
		memd(r29+#-16) = r17:16
		allocframe(#40)
	}                                       // 8-byte Folded Spill
	{
		r3 = r17
	}
	{
		r18 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		memd(r29+#24) = r19:18
	}                                       // 8-byte Folded Spill
	{
		r0 = add(r29,#0)
		r4 = memw(r18+##_ZTVN6Halide7Runtime8Internal15Synchronization20wait_parking_controlE@GOT)
		memw(r29+#4) = r0
	}
	{
		r4 = add(r4,#8)
		memw(r29+#8) = r1
	}
	{
		call ##_ZN6Halide7Runtime8Internal15Synchronization15parking_control4parkEy
		memw(r29+#0) = r4
	}
	{
		p0 = cmp.eq(r1:0,r17:16)
		if (!p0.new) jump:t .LBB34_1
	}
// %bb.19:                              // %if.else.i
	{
		r1:0 = memd(r16+#0)
	}
	{
		p0 = tstbit(r0,#0)
		if (p0.new) r17:16 = memd(r29+#32)
		if (p0.new) r19:18 = memd(r29+#24)
	}                                       // 8-byte Folded Reload
	{
		if (p0) r31:30 = dealloc_return(r30):raw
	}
.LBB34_20:                              // %if.then2.i
	{
		r1 = add(pc,##.L.str.5.6@PCREL)
		r0 = #0
	}
	{
		call ##halide_print
	}
	{
		call ##abort
	}
.LBB34_21:                              // %_ZN6Halide7Runtime8Internal15Synchronization9fast_cond4waitEPNS2_10fast_mutexE.exit
	{
		r17:16 = memd(r29+#32)
		r19:18 = memd(r29+#24)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB34_1:                               // %cmpxchg.start
	{
		r1:0 = memd_locked(r16)
	}
	{
		r3:2 = combine(#0,#0)
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (!p0.new) jump:t .LBB34_3
	}
// %bb.2:                               // %cmpxchg.trystore
	{
		r1:0 = combine(#0,#1)
	}
	{
		memd_locked(r16,p0) = r1:0
	}
	{
		if (!p0) jump:nt .LBB34_3
	}
	{
		jump .LBB34_21
	}
	.p2align	4
.LBB34_16:                              // %if.end19.i.i.i
                                        //   in Loop: Header=BB34_3 Depth=1
	{
		r0 = add(r29,#16)
		r3:2 = combine(r17,r16)
		r1 = memw(r18+##_ZTVN6Halide7Runtime8Internal15Synchronization21mutex_parking_controlE@GOT)
	}
	{
		r1 = add(r1,#8)
		memw(r29+#20) = r16
	}
	{
		call ##_ZN6Halide7Runtime8Internal15Synchronization15parking_control4parkEy
		memw(r29+#16) = r1
	}
	{
		p0 = cmp.eq(r1:0,r17:16)
		if (p0.new) jump:nt .LBB34_21
	}
.LBB34_3:                               // %if.then.i.i.critedge
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB34_4 Depth 2
	{
		p2 = or(p2,!p2)
		p3 = and(p3,!p3)
		r19 = #40
		r3:2 = memd(r16+#0)
	}
	{
		jump .LBB34_4
	}
	.p2align	4
.LBB34_7:                               // %cmpxchg.failure3
                                        //   in Loop: Header=BB34_4 Depth=2
	{
		p0 = or(p3,p3)
	}
.LBB34_8:                               // %cmpxchg.end2
                                        //   in Loop: Header=BB34_4 Depth=2
	{
		if (p0) jump:nt .LBB34_21
	}
.LBB34_4:                               // %while.cond.outer.i.i.i
                                        //   Parent Loop BB34_3 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	{
		r1:0 = combine(r3,r2)
		p0 = tstbit(r2,#0); if (p0.new) jump:nt .LBB34_9
	}
// %bb.5:                               // %if.then.i.i.i
                                        //   in Loop: Header=BB34_4 Depth=2
	{
		r3:2 = memd_locked(r16)
	}
	{
		p0 = cmp.eq(r3:2,r1:0)
		if (!p0.new) jump:t .LBB34_7
	}
// %bb.6:                               // %cmpxchg.trystore7
                                        //   in Loop: Header=BB34_4 Depth=2
	{
		r0 = setbit(r0,#0)
		p0 = or(p2,p2)
	}
	{
		memd_locked(r16,p1) = r1:0
	}
	{
		if (!p1) jump:nt .LBB34_7
	}
	{
		jump .LBB34_8
	}
.LBB34_9:                               // %if.end4.i.i.i
                                        //   in Loop: Header=BB34_4 Depth=2
	{
		p0 = cmp.gt(r19,#0); if (p0.new) jump:nt .LBB34_17
	}
// %bb.10:                              //   in Loop: Header=BB34_4 Depth=2
	{
		r4 = r19 ; jump .LBB34_11
	}
.LBB34_17:                              // %_ZN6Halide7Runtime8Internal15Synchronization12spin_control11should_spinEv.exit.i.i.i
                                        //   in Loop: Header=BB34_4 Depth=2
	{
		r4 = #0
		p0 = cmp.eq(r19,#1); if (!p0.new) jump:t .LBB34_18
	}
.LBB34_11:                              // %if.end8.i.i.i
                                        //   in Loop: Header=BB34_4 Depth=2
	{
		p0 = tstbit(r0,#1)
		if (p0.new) jump:t .LBB34_16
	}
// %bb.12:                              // %if.then10.i.i.i
                                        //   in Loop: Header=BB34_4 Depth=2
	{
		r3:2 = memd_locked(r16)
	}
	{
		p0 = cmp.eq(r3:2,r1:0)
		if (!p0.new) jump:t .LBB34_14
	}
// %bb.13:                              // %cmpxchg.trystore24
                                        //   in Loop: Header=BB34_4 Depth=2
	{
		r0 = setbit(r0,#1)
		p0 = or(p2,p2)
	}
	{
		memd_locked(r16,p1) = r1:0
	}
	{
		if (p1) jump:nt .LBB34_15
	}
.LBB34_14:                              // %cmpxchg.failure20
                                        //   in Loop: Header=BB34_4 Depth=2
	{
		p0 = or(p3,p3)
	}
.LBB34_15:                              // %cmpxchg.end19
                                        //   in Loop: Header=BB34_4 Depth=2
	{
		r19 = r4
		if (!p0) jump:nt .LBB34_4
	}
	{
		jump .LBB34_16
	}
.LBB34_18:                              // %if.then6.i.i.i
                                        //   in Loop: Header=BB34_4 Depth=2
	{
		call ##halide_thread_yield
		r19 = add(r19,#-1)
	}
	{
		p3 = and(p3,!p3)
		p2 = or(p2,!p2)
		jump .LBB34_4
		r3:2 = memd(r16+#0)
	}
.Lfunc_end34:
	.size	halide_cond_wait, .Lfunc_end34-halide_cond_wait
                                        // -- End function
	.section	.text.halide_do_loop_task,"ax",@progbits
	.weak	halide_do_loop_task             // -- Begin function halide_do_loop_task
	.p2align	4
	.type	halide_do_loop_task,@function
halide_do_loop_task:                    // @halide_do_loop_task
// %bb.0:                               // %entry
	{
		r6 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		allocframe(r29,#0):raw
	}
	{
		r6 = memw(r6+##_ZN6Halide7Runtime8Internal19custom_do_loop_taskE@GOT)
	}
	{
		r6 = memw(r6+#0)
	}
	{
		callr r6
	}
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end35:
	.size	halide_do_loop_task, .Lfunc_end35-halide_do_loop_task
                                        // -- End function
	.section	.text.halide_do_task,"ax",@progbits
	.weak	halide_do_task                  // -- Begin function halide_do_task
	.p2align	4
	.type	halide_do_task,@function
halide_do_task:                         // @halide_do_task
// %bb.0:                               // %entry
	{
		r4 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		allocframe(r29,#0):raw
	}
	{
		r4 = memw(r4+##_ZN6Halide7Runtime8Internal14custom_do_taskE@GOT)
	}
	{
		r4 = memw(r4+#0)
	}
	{
		callr r4
	}
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end36:
	.size	halide_do_task, .Lfunc_end36-halide_do_task
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization15parking_control4parkEy,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization15parking_control4parkEy // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization15parking_control4parkEy
	.p2align	4
	.type	_ZN6Halide7Runtime8Internal15Synchronization15parking_control4parkEy,@function
_ZN6Halide7Runtime8Internal15Synchronization15parking_control4parkEy: // @_ZN6Halide7Runtime8Internal15Synchronization15parking_control4parkEy
// %bb.0:                               // %entry
	{
		r17 = r0
		r1 = #0
		memd(r29+#-16) = r17:16
		allocframe(#216)
	}                                       // 8-byte Folded Spill
	{
		r0 = add(r29,#16)
	}
	{
		r18 = #0
		r21:20 = combine(r3,r2)
		memd(r29+#200) = r19:18
		memd(r29+#192) = r21:20
	}                                       // 8-byte Folded Spill
	{
		r22 = add(r29,#16)
		memd(r29+#184) = r23:22
		memd(r29+#176) = r25:24
	}                                       // 8-byte Folded Spill
	{
		call ##pthread_mutex_init
		r16 = add(r22,#64)
		memb(r29+#144) = r18
	}
	{
		call ##pthread_cond_init
		r1:0 = combine(#0,r16)
		r25:24 = combine(#0,#0)
	}
	{
		r1:0 = combine(r21,r20)
		memw(r29+#160) = #0
		memd(r29+#152) = r25:24
	}
	{
		call ##_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy
		memd(r29+#168) = r25:24
	}
	{
		r18 = r0
		r0 = r17
		r1 = memw(r17+#0)
		memb(r29+#0) = r18
	}
	{
		r19 = add(r29,#0)
		memd(r29+#8) = r25:24
	}
	{
		r1 = add(r29,#0)
		r2 = memw(r1+#0)
	}
	{
		callr r2
	}
	{
		p0 = r0
		if (!p0.new) jump:t .LBB37_1
	}
// %bb.6:                               // %if.end
	{
		r0 = #1
		memb(r29+#144) = r0.new
	}
	{
		r19 = add(r22,#152)
		memw(r29+#160) = #0
		memd(r29+#152) = r21:20
	}
	{
		r0 = memw(r18+#8)
		r1 = memw(r18+#12)
	}
	{
		p0 = cmp.eq(r0,#0)
		if (p0.new) r0 = add(r18,#8)
		if (!p0.new) r0 = add(r1,##144)
	}
	{
		memw(r0+#0) = r22
		memw(r18+#12) = r22
	}
	.p2align	4
.LBB37_7:                               // %atomicrmw.start2
                                        // =>This Inner Loop Header: Depth=1
	{
		r3:2 = memd_locked(r18)
	}
	{
		r0 = clrbit(r2,#0)
		r1 = r3
	}
	{
		memd_locked(r18,p0) = r1:0
	}
	{
		if (!p0) jump:nt .LBB37_7
	}
// %bb.8:                               // %atomicrmw.end1
	{
		r5:4 = combine(#0,#4)
	}
	{
		p0 = cmp.gtu(r5:4,r3:2)
		if (p0.new) jump:nt .LBB37_11
	}
// %bb.9:                               // %atomicrmw.end1
	{
		r0 = and(r0,#3)
		r1 = #0
		r3:2 = combine(#0,#0)
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (!p0.new) jump:nt .LBB37_11
	}
// %bb.10:                              // %if.then.i27
	{
		call ##_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv
		r0 = r18
	}
.LBB37_11:                              // %_ZN6Halide7Runtime8Internal15Synchronization9word_lock6unlockEv.exit28
	{
		r0 = memw(r17+#0)
	}
	{
		r0 = r17
		r1 = memw(r0+#4)
	}
	{
		callr r1
	}
	{
		call ##pthread_mutex_lock
		r0 = add(r29,#16)
	}
	{
		r0 = memb(r29+#144)
		if (cmp.eq(r0.new,#0)) jump:nt .LBB37_14
	}
	.p2align	4
.LBB37_12:                              // %while.body.i
                                        // =>This Inner Loop Header: Depth=1
	{
		call ##pthread_cond_wait
		r1 = add(r29,#16)
		r0 = r16
	}
	{
		r0 = memb(r29+#144)
		if (!cmp.eq(r0.new,#0)) jump:t .LBB37_12
	}
.LBB37_14:                              // %_ZN6Halide7Runtime8Internal15Synchronization13thread_parker4parkEv.exit
	{
		call ##pthread_mutex_unlock
		r0 = add(r29,#16)
	}
	{
		jump .LBB37_15
	}
.LBB37_1:                               // %if.then
	{
		r19 = add(r19,#8)
	}
	.p2align	4
.LBB37_2:                               // %atomicrmw.start
                                        // =>This Inner Loop Header: Depth=1
	{
		r3:2 = memd_locked(r18)
	}
	{
		r0 = clrbit(r2,#0)
		r1 = r3
	}
	{
		memd_locked(r18,p0) = r1:0
	}
	{
		if (!p0) jump:nt .LBB37_2
	}
// %bb.3:                               // %atomicrmw.end
	{
		r5:4 = combine(#0,#4)
	}
	{
		p0 = cmp.gtu(r5:4,r3:2)
		if (!p0.new) jump:nt .LBB37_4
	}
.LBB37_15:                              // %cleanup
	{
		call ##pthread_cond_destroy
		r0 = r16
		r17:16 = memd(r19+#0)
	}
	{
		call ##pthread_mutex_destroy
		r0 = add(r29,#16)
	}
	{
		r1:0 = combine(r17,r16)
		r17:16 = memd(r29+#208)
		r19:18 = memd(r29+#200)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#192)
		r23:22 = memd(r29+#184)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#176)
		r31:30 = dealloc_return(r30):raw
	}                                       // 8-byte Folded Reload
.LBB37_4:                               // %atomicrmw.end
	{
		r0 = and(r0,#3)
		r1 = #0
		r3:2 = combine(#0,#0)
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (!p0.new) jump:t .LBB37_15
	}
// %bb.5:                               // %if.then.i
	{
		call ##_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv
		r0 = r18
	}
	{
		jump .LBB37_15
	}
.Lfunc_end37:
	.size	_ZN6Halide7Runtime8Internal15Synchronization15parking_control4parkEy, .Lfunc_end37-_ZN6Halide7Runtime8Internal15Synchronization15parking_control4parkEy
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control8validateERNS2_15validate_actionE,"axG",@progbits,_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control8validateERNS2_15validate_actionE,comdat
	.weak	_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control8validateERNS2_15validate_actionE // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control8validateERNS2_15validate_actionE
	.p2align	4
	.type	_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control8validateERNS2_15validate_actionE,@function
_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control8validateERNS2_15validate_actionE: // @_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control8validateERNS2_15validate_actionE
// %bb.0:                               // %entry
	{
		r9:8 = combine(#0,#0)
		r3 = #0
		r4 = memw(r0+#4)
	}
	{
		r7:6 = memd(r4+#0)
		r2 = memw(r0+#8)
	}
	{
		p0 = cmp.eq(r7:6,r9:8)
		if (p0.new) jump:nt .LBB38_1
	}
// %bb.2:                               // %if.else
	{
		p0 = cmp.eq(r7:6,r3:2)
		if (!p0.new) jump:t .LBB38_4
	}
// %bb.3:
	{
		p0 = or(p0,!p0)
	}
	{
		r0 = mux(p0,#1,#0)
		jumpr r31
	}
.LBB38_1:                               // %if.then
	{
		p0 = or(p0,!p0)
		memd(r4+#0) = r3:2
	}
	{
		r0 = mux(p0,#1,#0)
		jumpr r31
	}
.LBB38_4:                               // %if.then5
	{
		p0 = and(p0,!p0)
		memd(r1+#8) = r3:2
	}
	{
		r0 = mux(p0,#1,#0)
		jumpr r31
	}
.Lfunc_end38:
	.size	_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control8validateERNS2_15validate_actionE, .Lfunc_end38-_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control8validateERNS2_15validate_actionE
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control12before_sleepEv,"axG",@progbits,_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control12before_sleepEv,comdat
	.weak	_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control12before_sleepEv // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control12before_sleepEv
	.p2align	4
	.type	_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control12before_sleepEv,@function
_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control12before_sleepEv: // @_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control12before_sleepEv
// %bb.0:                               // %entry
	{
		allocframe(r29,#8):raw
	}
	{
		r1:0 = combine(#0,#1)
		r2 = memw(r0+#8)
	}
	{
		r5:4 = memd_locked(r2)
	}
	{
		p0 = cmp.eq(r5:4,r1:0)
		if (!p0.new) jump:t .LBB39_2
	}
.LBB39_1:                               // %cmpxchg.trystore
	{
		r5:4 = combine(#0,#0)
	}
	{
		memd_locked(r2,p0) = r5:4
	}
	{
		if (p0) r31:30 = dealloc_return(r30):raw
	}
.LBB39_2:                               // %cmpxchg.start9
	{
		r5:4 = memd_locked(r2)
	}
	{
		p0 = cmp.eq(r5:4,r1:0)
		if (p0.new) jump:t .LBB39_1
	}
// %bb.3:                               // %if.end.i.i
	{
		r1 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		r3 = #0
		r0 = add(r29,#0)
	}
	{
		r1 = memw(r1+##_ZTVN6Halide7Runtime8Internal15Synchronization21mutex_parking_controlE@GOT)
		memw(r29+#4) = r2
	}
	{
		call ##_ZN6Halide7Runtime8Internal15Synchronization15parking_control10unpark_oneEy
		r1 = add(r1,#8)
		memw(r29+#0) = r1.new
	}
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end39:
	.size	_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control12before_sleepEv, .Lfunc_end39-_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control12before_sleepEv
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control6unparkEib,"axG",@progbits,_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control6unparkEib,comdat
	.weak	_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control6unparkEib // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control6unparkEib
	.p2align	4
	.type	_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control6unparkEib,@function
_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control6unparkEib: // @_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control6unparkEib
// %bb.0:                               // %entry
	{
		p0 = tstbit(r2,#0); if (p0.new) jump:t .LBB40_2
	}
// %bb.1:                               // %if.then
	{
		r3:2 = combine(#0,#0)
		r0 = memw(r0+#4)
	}
	{
		memd(r0+#0) = r3:2
	}
.LBB40_2:                               // %if.end
	{
		r1:0 = combine(#0,#0)
		jumpr r31
	}
.Lfunc_end40:
	.size	_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control6unparkEib, .Lfunc_end40-_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control6unparkEib
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization15parking_control14unpark_requeueEyyy,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization15parking_control14unpark_requeueEyyy // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization15parking_control14unpark_requeueEyyy
	.p2align	4
	.type	_ZN6Halide7Runtime8Internal15Synchronization15parking_control14unpark_requeueEyyy,@function
_ZN6Halide7Runtime8Internal15Synchronization15parking_control14unpark_requeueEyyy: // @_ZN6Halide7Runtime8Internal15Synchronization15parking_control14unpark_requeueEyyy
// %bb.0:                               // %entry
	{
		r16 = r0
		memd(r29+#-16) = r17:16
		allocframe(#64)
	}                                       // 8-byte Folded Spill
	{
		r0 = add(r29,#24)
	}
	{
		r19:18 = combine(r5,r4)
		r21:20 = combine(r3,r2)
		memd(r29+#48) = r19:18
		memd(r29+#40) = r21:20
	}                                       // 8-byte Folded Spill
	{
		call ##_ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEyy
	}
	{
		r1:0 = combine(#0,#0)
		r2 = memw(r16+#0)
		memb(r29+#8) = #0
	}
	{
		r1 = add(r29,#8)
		r0 = r16
		memd(r29+#16) = r1:0
	}
	{
		r2 = memw(r2+#0)
	}
	{
		callr r2
	}
	{
		p0 = r0
		if (!p0.new) jump:t .LBB41_1
	}
// %bb.2:                               // %if.end
	{
		p0 = and(p0,!p0)
		r17 = #0
		r0 = memw(r29+#24)
	}
	{
		r2 = memw(r0+#8)
		if (cmp.eq(r2.new,#0)) jump:t .LBB41_13
	}
// %bb.3:
	{
		r4 = #0 ; jump .LBB41_4
		r3 = add(r0,#8)
		r1:0 = combine(#0,#0)
	}
	.p2align	4
.LBB41_5:                               //   in Loop: Header=BB41_4 Depth=1
	{
		r3 = add(r5,#144)
		r4 = r5
	}
.LBB41_10:                              // %if.end22
                                        //   in Loop: Header=BB41_4 Depth=1
	{
		p1 = cmp.eq(r2,#0); if (p1.new) jump:nt .LBB41_11
	}
.LBB41_4:                               // %while.body
                                        // =>This Inner Loop Header: Depth=1
	{
		r5 = r2
		r7:6 = memd(r2+#136)
		r2 = memw(r2+#144)
	}
	{
		p1 = cmp.eq(r7:6,r21:20)
		if (!p1.new) jump:t .LBB41_5
	}
// %bb.6:                               // %if.then4
                                        //   in Loop: Header=BB41_4 Depth=1
	{
		memw(r3+#0) = r2
	}
	{
		r6 = memw(r29+#24)
		r7 = memb(r29+#8)
	}
	{
		p1 = cmp.eq(r7,#0)
		r8 = memw(r6+#12)
	}
	{
		p2 = cmp.eq(r8,r5)
		if (p1) jump:nt .LBB41_9
		if (p2.new) memw(r6+#12) = r4
	}
// %bb.7:                               // %if.end10
                                        //   in Loop: Header=BB41_4 Depth=1
	{
		p1 = cmp.eq(r17,#0); if (!p1.new) jump:nt .LBB41_9
	}
// %bb.8:                               //   in Loop: Header=BB41_4 Depth=1
	{
		r17 = r5 ; jump .LBB41_10
	}
	.p2align	4
.LBB41_9:                               // %if.else
                                        //   in Loop: Header=BB41_4 Depth=1
	{
		p1 = cmp.eq(r0,#0)
		r1 = r5
		if (p1.new) r0 = add(r5,#0)
		if (!p1.new) memw(r1+#144) = r5
	}
	{
		jump .LBB41_10
		memd(r5+#136) = r19:18
	}
.LBB41_1:                               // %if.then
	{
		call ##_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE
		r0 = add(r29,#24)
	}
	{
		r0 = #0
		r17:16 = memd(r29+#56)
		r19:18 = memd(r29+#48)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#40)
		dealloc_return
	}                                       // 8-byte Folded Reload
.LBB41_11:                              // %while.end
	{
		p1 = cmp.eq(r0,#0); if (p1.new) jump:t .LBB41_13
	}
// %bb.12:                              // %if.then24
	{
		r2 = memw(r29+#28)
		memw(r1+#144) = #0
	}
	{
		r3 = memw(r2+#8)
	}
	{
		p0 = cmp.eq(r3,#0)
		if (!p0.new) r3 = memw(r2+#12)
	}
	{
		p0 = or(p0,!p0)
		if (!p0) r3 = add(r3,##144)
		if (p0) r3 = add(r2,#8)
	}
	{
		memw(r3+#0) = r0
		memw(r2+#12) = r1
	}
.LBB41_13:                              // %if.end38
	{
		r2 = !cmp.eq(r17,#0)
		r3 = mux(p0,#1,#0)
		r0 = r16
		r1 = memw(r16+#0)
	}
	{
		p0 = cmp.eq(r17,#0)
	}
	{
		r5 = p0
		r1 = add(r29,#8)
		r4 = memw(r1+#12)
	}
	{
		r16 = r5
		memw(r29+#4) = r16.new
	}                                       // 4-byte Folded Spill
	{
		callr r4
	}
	{
		r0 = r16
	}
	{
		p0 = r0
		if (p0.new) jump:nt .LBB41_15
	}
// %bb.14:                              // %if.then44
	{
		r0 = r17
		r3:2 = memd(r29+#72)
	}
	{
		call ##pthread_mutex_lock
		memd(r17+#152) = r3:2
	}
	{
		call ##_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE
		r0 = add(r29,#24)
	}
	{
		r0 = add(r17,#64)
		r1 = #0
		memb(r17+#128) = r1.new
	}
	{
		call ##pthread_cond_signal
	}
	{
		call ##pthread_mutex_unlock
		r0 = r17
	}
	{
		jump .LBB41_16
	}
.LBB41_15:                              // %if.else48
	{
		call ##_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE
		r0 = add(r29,#24)
	}
.LBB41_16:                              // %if.end49
	{
		r1 = memw(r29+#4)
		r0 = memub(r29+#8)
	}                                       // 4-byte Folded Reload
	{
		p0 = r1
		p1 = tstbit(r0,#0)
	}
	{
		p0 = not(p0)
	}
	{
		p0 = and(p0,p1)
	}
	{
		r0 = mux(p0,#1,#0)
		r17:16 = memd(r29+#56)
		r19:18 = memd(r29+#48)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#40)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end41:
	.size	_ZN6Halide7Runtime8Internal15Synchronization15parking_control14unpark_requeueEyyy, .Lfunc_end41-_ZN6Halide7Runtime8Internal15Synchronization15parking_control14unpark_requeueEyyy
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEyy,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEyy // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEyy
	.p2align	4
	.type	_ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEyy,@function
_ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEyy: // @_ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEyy
// %bb.0:                               // %entry
	{
		r1 = ##2135587861
		allocframe(#32)
	}
	{
		r7 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		r6 = ##-1640531527
	}
	{
		r9:8 = mpyu(r2,r1)
		r13:12 = mpyu(r4,r1)
		r16 = r0
		memd(r29+#24) = r17:16
	}                                       // 8-byte Folded Spill
	{
		r9 += mpyi(r2,r6)
		r13 += mpyi(r4,r6)
		r19 = #0
		memd(r29+#16) = r19:18
	}                                       // 8-byte Folded Spill
	{
		r9 += mpyi(r1,r3)
		r13 += mpyi(r1,r5)
		memd(r29+#8) = r21:20
		memd(r29+#0) = r23:22
	}                                       // 8-byte Folded Spill
	{
		r18 = lsr(r9,#22)
		r20 = lsr(r13,#22)
		r1 = add(r7,##_ZN6Halide7Runtime8Internal15Synchronization5tableE@GOT)
	}
	{
		r21 = r19
	}
	{
		p0 = cmp.eq(r19:18,r21:20)
		if (!p0.new) jump:t .LBB42_4
		r17 = memw(r1+#0)
	}
// %bb.1:                               // %if.then
	{
		r19 = addasl(r17,r18,#4)
		r5:4 = combine(#0,#0)
		r0 = memw(r1+#0)
	}
	{
		r0 = addasl(r0,r18,#4)
	}
	{
		r3:2 = memd_locked(r0)
	}
	{
		p0 = cmp.eq(r3:2,r5:4)
		if (p0.new) jump:nt .LBB42_3
	}
// %bb.2:
	{
		r21 = r19 ; jump .LBB42_16
	}
.LBB42_4:                               // %if.else
	{
		p0 = cmp.gtu(r21:20,r19:18)
		if (!p0.new) jump:t .LBB42_11
	}
// %bb.5:                               // %if.then3
	{
		r5:4 = combine(#0,#0)
		r1 = memw(r1+#0)
	}
	{
		r0 = addasl(r1,r18,#4)
		r22 = addasl(r1,r20,#4)
	}
	{
		r3:2 = memd_locked(r0)
	}
	{
		p0 = cmp.eq(r3:2,r5:4)
		if (!p0.new) jump:t .LBB42_7
	}
// %bb.6:                               // %cmpxchg.trystore7
	{
		r3:2 = combine(#0,#1)
	}
	{
		memd_locked(r0,p0) = r3:2
	}
	{
		if (p0) jump:nt .LBB42_8
	}
.LBB42_7:                               // %if.then.i40.critedge
	{
		call ##_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv
	}
.LBB42_8:                               // %_ZN6Halide7Runtime8Internal15Synchronization9word_lock4lockEv.exit41
	{
		r1:0 = memd_locked(r22)
	}
	{
		r19 = addasl(r17,r18,#4)
		r21 = addasl(r17,r20,#4)
		r3:2 = combine(#0,#0)
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (p0.new) jump:nt .LBB42_10
	}
// %bb.9:
	{
		r18 = r20 ; jump .LBB42_16
	}
.LBB42_11:                              // %if.else9
	{
		r5:4 = combine(#0,#0)
		r1 = memw(r1+#0)
	}
	{
		r0 = addasl(r1,r20,#4)
		r22 = addasl(r1,r18,#4)
	}
	{
		r3:2 = memd_locked(r0)
	}
	{
		p0 = cmp.eq(r3:2,r5:4)
		if (!p0.new) jump:t .LBB42_13
	}
// %bb.12:                              // %cmpxchg.trystore41
	{
		r3:2 = combine(#0,#1)
	}
	{
		memd_locked(r0,p0) = r3:2
	}
	{
		if (p0) jump:nt .LBB42_14
	}
.LBB42_13:                              // %if.then.i48.critedge
	{
		call ##_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv
	}
.LBB42_14:                              // %_ZN6Halide7Runtime8Internal15Synchronization9word_lock4lockEv.exit49
	{
		r1:0 = memd_locked(r22)
	}
	{
		r21 = addasl(r17,r20,#4)
		r19 = addasl(r17,r18,#4)
		r3:2 = combine(#0,#0)
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (!p0.new) jump:nt .LBB42_16
	}
// %bb.15:                              // %cmpxchg.trystore58
	{
		r1:0 = combine(#0,#1)
	}
	{
		memd_locked(r22,p0) = r1:0
	}
	{
		if (!p0) jump:nt .LBB42_16
	}
	{
		jump .LBB42_17
	}
.LBB42_3:                               // %cmpxchg.trystore
	{
		r21 = r19
		r3:2 = combine(#0,#1)
	}
	{
		memd_locked(r0,p0) = r3:2
	}
	{
		if (p0) jump:nt .LBB42_17
	}
.LBB42_16:                              // %cleanup.sink.split
	{
		r0 = addasl(r17,r18,#4)
		call ##_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv
	}
.LBB42_17:                              // %cleanup
	{
		memw(r16+#0) = r19
		memw(r16+#4) = r21
	}
	{
		r17:16 = memd(r29+#24)
		r19:18 = memd(r29+#16)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#8)
		r23:22 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB42_10:                              // %cmpxchg.trystore24
	{
		r18 = r20
		r1:0 = combine(#0,#1)
	}
	{
		memd_locked(r22,p0) = r1:0
	}
	{
		if (!p0) jump:nt .LBB42_16
	}
	{
		jump .LBB42_17
	}
.Lfunc_end42:
	.size	_ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEyy, .Lfunc_end42-_ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEyy
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE
	.p2align	4
	.type	_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE,@function
_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE: // @_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE
// %bb.0:                               // %entry
	{
		r16 = r0
		memd(r29+#-16) = r17:16
		allocframe(#8)
	}                                       // 8-byte Folded Spill
	{
		r0 = memw(r0+#0)
	}
	{
		r1 = memw(r16+#4)
		if (cmp.eq(r1.new,r0)) jump:nt .LBB43_1
	}
// %bb.2:                               // %if.else
	{
		p0 = cmp.gtu(r0,r1); if (!p0.new) jump:t .LBB43_9
	}
	.p2align	4
.LBB43_3:                               // %atomicrmw.start2
                                        // =>This Inner Loop Header: Depth=1
	{
		r5:4 = memd_locked(r0)
	}
	{
		r2 = clrbit(r4,#0)
		r3 = r5
	}
	{
		memd_locked(r0,p0) = r3:2
	}
	{
		if (!p0) jump:nt .LBB43_3
	}
// %bb.4:                               // %atomicrmw.end1
	{
		r7:6 = combine(#0,#4)
	}
	{
		p0 = cmp.gtu(r7:6,r5:4)
		if (p0.new) jump:nt .LBB43_7
	}
// %bb.5:                               // %atomicrmw.end1
	{
		r2 = and(r2,#3)
		r3 = #0
		r5:4 = combine(#0,#0)
	}
	{
		p0 = cmp.eq(r3:2,r5:4)
		if (!p0.new) jump:nt .LBB43_7
	}
// %bb.6:                               // %if.then.i30
	{
		call ##_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv
	}
.LBB43_7:                               // %_ZN6Halide7Runtime8Internal15Synchronization9word_lock6unlockEv.exit31
	{
		r0 = memw(r16+#4)
	}
	.p2align	4
.LBB43_8:                               // %atomicrmw.start8
                                        // =>This Inner Loop Header: Depth=1
	{
		r5:4 = memd_locked(r0)
	}
	{
		r2 = clrbit(r4,#0)
		r3 = r5
	}
	{
		memd_locked(r0,p0) = r3:2
	}
	{
		if (!p0) jump:nt .LBB43_8
	}
	{
		jump .LBB43_15
	}
	.p2align	4
.LBB43_1:                               // %atomicrmw.start
                                        // =>This Inner Loop Header: Depth=1
	{
		r5:4 = memd_locked(r0)
	}
	{
		r2 = clrbit(r4,#0)
		r3 = r5
	}
	{
		memd_locked(r0,p0) = r3:2
	}
	{
		if (!p0) jump:nt .LBB43_1
	}
	{
		jump .LBB43_15
	}
	.p2align	4
.LBB43_9:                               // %atomicrmw.start14
                                        // =>This Inner Loop Header: Depth=1
	{
		r5:4 = memd_locked(r1)
	}
	{
		r2 = clrbit(r4,#0)
		r3 = r5
	}
	{
		memd_locked(r1,p0) = r3:2
	}
	{
		if (!p0) jump:nt .LBB43_9
	}
// %bb.10:                              // %atomicrmw.end13
	{
		r7:6 = combine(#0,#4)
	}
	{
		p0 = cmp.gtu(r7:6,r5:4)
		if (p0.new) jump:nt .LBB43_13
	}
// %bb.11:                              // %atomicrmw.end13
	{
		r2 = and(r2,#3)
		r3 = #0
		r5:4 = combine(#0,#0)
	}
	{
		p0 = cmp.eq(r3:2,r5:4)
		if (!p0.new) jump:nt .LBB43_13
	}
// %bb.12:                              // %if.then.i44
	{
		call ##_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv
		r0 = r1
	}
.LBB43_13:                              // %_ZN6Halide7Runtime8Internal15Synchronization9word_lock6unlockEv.exit45
	{
		r0 = memw(r16+#0)
	}
	.p2align	4
.LBB43_14:                              // %atomicrmw.start20
                                        // =>This Inner Loop Header: Depth=1
	{
		r5:4 = memd_locked(r0)
	}
	{
		r2 = clrbit(r4,#0)
		r3 = r5
	}
	{
		memd_locked(r0,p0) = r3:2
	}
	{
		if (!p0) jump:nt .LBB43_14
	}
.LBB43_15:                              // %atomicrmw.end19
	{
		r7:6 = combine(#0,#4)
	}
	{
		p0 = cmp.gtu(r7:6,r5:4)
		if (p0.new) r17:16 = memd(r29+#0)
		if (p0.new) r31:30 = dealloc_return(r30):t:raw
	}                                       // 8-byte Folded Reload
.LBB43_16:                              // %atomicrmw.end19
	{
		r2 = and(r2,#3)
		r3 = #0
		r5:4 = combine(#0,#0)
	}
	{
		p0 = cmp.eq(r3:2,r5:4)
		if (!p0.new) jump:nt .LBB43_17
	}
// %bb.18:                              // %if.end15.sink.split
	{
		jump ##_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv
		r17:16 = memd(r29+#0)
		deallocframe
	}                                       // 8-byte Folded Reload
.LBB43_17:                              // %if.end15
	{
		r17:16 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end43:
	.size	_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE, .Lfunc_end43-_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization25broadcast_parking_control8validateERNS2_15validate_actionE,"axG",@progbits,_ZN6Halide7Runtime8Internal15Synchronization25broadcast_parking_control8validateERNS2_15validate_actionE,comdat
	.weak	_ZN6Halide7Runtime8Internal15Synchronization25broadcast_parking_control8validateERNS2_15validate_actionE // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization25broadcast_parking_control8validateERNS2_15validate_actionE
	.p2align	4
	.type	_ZN6Halide7Runtime8Internal15Synchronization25broadcast_parking_control8validateERNS2_15validate_actionE,@function
_ZN6Halide7Runtime8Internal15Synchronization25broadcast_parking_control8validateERNS2_15validate_actionE: // @_ZN6Halide7Runtime8Internal15Synchronization25broadcast_parking_control8validateERNS2_15validate_actionE
// %bb.0:                               // %entry
	{
		r7 = #0
		r2 = memw(r0+#4)
	}
	{
		r5:4 = memd(r2+#0)
		r6 = memw(r0+#8)
	}
	{
		p0 = cmp.eq(r5:4,r7:6)
		if (!p0.new) jump:t .LBB44_10
	}
// %bb.1:                               // %if.end
	{
		r5:4 = combine(#0,#0)
	}
	{
		memd(r2+#0) = r5:4
	}
	{
		r0 = #1
		r2 = memw(r0+#8)
	}
	{
		r5:4 = memd(r2+#0)
	}
	{
		p1 = tstbit(r4,#0); if (!p1.new) jump:t .LBB44_9
	}
// %bb.2:
	{
		p2 = and(p2,!p2)
	}
	.p2align	4
.LBB44_3:                               // %if.end.i
                                        // =>This Inner Loop Header: Depth=1
	{
		r7:6 = memd_locked(r2)
	}
	{
		p3 = cmp.eq(r7:6,r5:4)
		if (!p3.new) jump:t .LBB44_5
	}
// %bb.4:                               // %cmpxchg.trystore
                                        //   in Loop: Header=BB44_3 Depth=1
	{
		r4 = setbit(r4,#1)
		p3 = or(p3,!p3)
	}
	{
		memd_locked(r2,p1) = r5:4
	}
	{
		if (p1) jump:nt .LBB44_6
	}
.LBB44_5:                               // %cmpxchg.failure
                                        //   in Loop: Header=BB44_3 Depth=1
	{
		p3 = or(p2,p2)
	}
.LBB44_6:                               // %cmpxchg.end
                                        //   in Loop: Header=BB44_3 Depth=1
	{
		if (p3) jump:nt .LBB44_7
	}
// %bb.8:                               // %_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_131atomic_cas_weak_relaxed_relaxedEPyS4_S4_.exit.i
                                        //   in Loop: Header=BB44_3 Depth=1
	{
		r5:4 = combine(r7,r6)
		p1 = tstbit(r6,#0); if (p1.new) jump:t .LBB44_3
	}
	{
		jump .LBB44_9
	}
.LBB44_7:
	{
		r0 = #0
	}
.LBB44_9:                               // %_ZN6Halide7Runtime8Internal15Synchronization10fast_mutex21make_parked_if_lockedEv.exit
	{
		memb(r1+#0) = r0
	}
.LBB44_10:                              // %cleanup
	{
		r0 = mux(p0,#1,#0)
		jumpr r31
	}
.Lfunc_end44:
	.size	_ZN6Halide7Runtime8Internal15Synchronization25broadcast_parking_control8validateERNS2_15validate_actionE, .Lfunc_end44-_ZN6Halide7Runtime8Internal15Synchronization25broadcast_parking_control8validateERNS2_15validate_actionE
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization15parking_control6unparkEib,"axG",@progbits,_ZN6Halide7Runtime8Internal15Synchronization15parking_control6unparkEib,comdat
	.weak	_ZN6Halide7Runtime8Internal15Synchronization15parking_control6unparkEib // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization15parking_control6unparkEib
	.p2align	4
	.type	_ZN6Halide7Runtime8Internal15Synchronization15parking_control6unparkEib,@function
_ZN6Halide7Runtime8Internal15Synchronization15parking_control6unparkEib: // @_ZN6Halide7Runtime8Internal15Synchronization15parking_control6unparkEib
// %bb.0:                               // %entry
	{
		r1:0 = combine(#0,#0)
		jumpr r31
	}
.Lfunc_end45:
	.size	_ZN6Halide7Runtime8Internal15Synchronization15parking_control6unparkEib, .Lfunc_end45-_ZN6Halide7Runtime8Internal15Synchronization15parking_control6unparkEib
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization25broadcast_parking_control16requeue_callbackERKNS2_15validate_actionEbb,"axG",@progbits,_ZN6Halide7Runtime8Internal15Synchronization25broadcast_parking_control16requeue_callbackERKNS2_15validate_actionEbb,comdat
	.weak	_ZN6Halide7Runtime8Internal15Synchronization25broadcast_parking_control16requeue_callbackERKNS2_15validate_actionEbb // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization25broadcast_parking_control16requeue_callbackERKNS2_15validate_actionEbb
	.p2align	4
	.type	_ZN6Halide7Runtime8Internal15Synchronization25broadcast_parking_control16requeue_callbackERKNS2_15validate_actionEbb,@function
_ZN6Halide7Runtime8Internal15Synchronization25broadcast_parking_control16requeue_callbackERKNS2_15validate_actionEbb: // @_ZN6Halide7Runtime8Internal15Synchronization25broadcast_parking_control16requeue_callbackERKNS2_15validate_actionEbb
// %bb.0:                               // %entry
	{
		r1 = memb(r1+#0)
		if (cmp.eq(r1.new,#0)) jump:nt .LBB46_4
	}
// %bb.1:                               // %entry
	{
		p0 = tstbit(r3,#0)
		if (!p0.new) jumpr:nt r31
	}
.LBB46_2:                               // %if.then
	{
		r0 = memw(r0+#8)
	}
	.p2align	4
.LBB46_3:                               // %atomicrmw.start
                                        // =>This Inner Loop Header: Depth=1
	{
		r3:2 = memd_locked(r0)
	}
	{
		r2 = setbit(r2,#1)
	}
	{
		memd_locked(r0,p0) = r3:2
	}
	{
		if (!p0) jump:nt .LBB46_3
	}
.LBB46_4:                               // %if.end
	{
		jumpr r31
	}
.Lfunc_end46:
	.size	_ZN6Halide7Runtime8Internal15Synchronization25broadcast_parking_control16requeue_callbackERKNS2_15validate_actionEbb, .Lfunc_end46-_ZN6Halide7Runtime8Internal15Synchronization25broadcast_parking_control16requeue_callbackERKNS2_15validate_actionEbb
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal27default_desired_num_threadsEv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv // -- Begin function _ZN6Halide7Runtime8Internal27default_desired_num_threadsEv
	.p2align	4
	.type	_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv,@function
_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv: // @_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv
// %bb.0:                               // %entry
	{
		r0 = add(pc,##.L.str.1@PCREL)
		allocframe(r29,#0):raw
	}
	{
		call ##getenv
	}
	{
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB47_2
	}
// %bb.1:                               // %if.end
	{
		r0 = add(pc,##.L.str.2@PCREL)
		call ##getenv
	}
	{
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB47_3
	}
.LBB47_2:                               // %cond.true
	{
		jump ##atoi
		r31:30 = deallocframe(r30):raw
	}
.LBB47_3:                               // %cond.false
	{
		jump ##halide_host_cpu_count
		r31:30 = deallocframe(r30):raw
	}
.Lfunc_end47:
	.size	_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv, .Lfunc_end47-_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal13worker_threadEPv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal13worker_threadEPv // -- Begin function _ZN6Halide7Runtime8Internal13worker_threadEPv
	.p2align	4
	.type	_ZN6Halide7Runtime8Internal13worker_threadEPv,@function
_ZN6Halide7Runtime8Internal13worker_threadEPv: // @_ZN6Halide7Runtime8Internal13worker_threadEPv
// %bb.0:                               // %entry
	{
		r1 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		memd(r29+#-16) = r17:16
		allocframe(#8)
	}                                       // 8-byte Folded Spill
	{
		r16 = r0
	}
	{
		r17 = memw(r1+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
	{
		call ##halide_mutex_lock
		r0 = r17
	}
	{
		call ##_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE
		r0 = r16
	}
	{
		r0 = r17
		r17:16 = memd(r29+#0)
		deallocframe
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_mutex_unlock
	}
.Lfunc_end48:
	.size	_ZN6Halide7Runtime8Internal13worker_threadEPv, .Lfunc_end48-_ZN6Halide7Runtime8Internal13worker_threadEPv
                                        // -- End function
	.section	.text.halide_spawn_thread,"ax",@progbits
	.weak	halide_spawn_thread             // -- Begin function halide_spawn_thread
	.p2align	4
	.type	halide_spawn_thread,@function
halide_spawn_thread:                    // @halide_spawn_thread
// %bb.0:                               // %entry
	{
		r17:16 = combine(r0,r1)
		r1:0 = combine(#0,#24)
		memd(r29+#-16) = r17:16
		allocframe(#16)
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
		memd(r29+#0) = r19:18
	}                                       // 8-byte Folded Spill
	{
		r2 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		r18 = r0
		r5:4 = combine(#0,#0)
	}
	{
		r1 = #0
		r0 = add(r18,#16)
		memw(r18+#0) = r17
		memd(r18+#16) = r5:4
	}
	{
		r3 = r18
		memw(r18+#8) = r16
	}
	{
		call ##pthread_create
		r2 = memw(r2+##_ZN6Halide7Runtime8Internal19spawn_thread_helperEPv@GOT)
	}
	{
		r0 = r18
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end49:
	.size	halide_spawn_thread, .Lfunc_end49-halide_spawn_thread
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal19spawn_thread_helperEPv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal19spawn_thread_helperEPv // -- Begin function _ZN6Halide7Runtime8Internal19spawn_thread_helperEPv
	.p2align	4
	.type	_ZN6Halide7Runtime8Internal19spawn_thread_helperEPv,@function
_ZN6Halide7Runtime8Internal19spawn_thread_helperEPv: // @_ZN6Halide7Runtime8Internal19spawn_thread_helperEPv
// %bb.0:                               // %entry
	{
		r1 = r0
		allocframe(#0)
	}
	{
		r0 = memw(r0+#8)
		r1 = memw(r1+#0)
	}
	{
		callr r1
	}
	{
		r0 = #0
		dealloc_return
	}
.Lfunc_end50:
	.size	_ZN6Halide7Runtime8Internal19spawn_thread_helperEPv, .Lfunc_end50-_ZN6Halide7Runtime8Internal19spawn_thread_helperEPv
                                        // -- End function
	.section	.text.halide_default_do_parallel_tasks,"ax",@progbits
	.weak	halide_default_do_parallel_tasks // -- Begin function halide_default_do_parallel_tasks
	.p2align	4
	.type	halide_default_do_parallel_tasks,@function
halide_default_do_parallel_tasks:       // @halide_default_do_parallel_tasks
// %bb.0:                               // %entry
	{
		allocframe(r29,#56):raw
	}
	{
		r18 = r1
		r1 = #84
		memd(r30+#-16) = r19:18
		memd(r30+#-8) = r17:16
	}                                       // 8-byte Folded Spill
	{
		r1 = add(#7,mpyi(r18,r1))
		p0 = cmp.gt(r18,#0)
		r17 = r3
		memd(r30+#-24) = r21:20
	}                                       // 8-byte Folded Spill
	{
		r1 = and(r1,#-8)
		memd(r30+#-32) = r23:22
		memd(r30+#-40) = r25:24
	}                                       // 8-byte Folded Spill
	{
		r16 = sub(r29,r1)
		r29 = sub(r29,r1)
		if (p0) jump:nt .LBB51_1
		memd(r30+#-48) = r27:26
	}                                       // 8-byte Folded Spill
.LBB51_4:                               // %for.cond.cleanup
	{
		p0 = cmp.eq(r18,#0); if (p0.new) jump:nt .LBB51_5
	}
// %bb.8:                               // %if.end19
	{
		r19 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
	}
	{
		call ##halide_mutex_lock
		r0 = memw(r19+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
	{
		call ##_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_
		r1:0 = combine(r16,r18)
		r2 = r17
	}
	{
		p0 = cmp.gt(r18,#0); if (!p0.new) jump:nt .LBB51_9
	}
// %bb.10:                              // %for.body25.preheader
	{
		r23 = #0
		r1:0 = combine(#-1,#-1)
		r3:2 = combine(#0,#7)
		memw(r30+#-52) = r19
	}                                       // 4-byte Folded Spill
	{
		r25:24 = combine(r23,#0)
		r22 = and(r18,#7)
		r17 = #0
		r19 = r23
	}
	{
		r1:0 = add(r19:18,r1:0)
	}
	{
		p0 = cmp.gtu(r3:2,r1:0)
		if (p0.new) jump:t .LBB51_13
	}
// %bb.11:                              // %for.body25.preheader.new
	{
		r0 = #-8
		r25:24 = combine(#0,#0)
		r17 = #0
		r27:26 = combine(#0,#0)
	}
	{
		r20 = and(r18,r0)
		r21 = #0
	}
	.p2align	4
.LBB51_12:                              // %for.body25
                                        // =>This Inner Loop Header: Depth=1
	{
		r18 = r16
	}
	{
		r18 += mpyi(r24,#84)
	}
	{
		call ##_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE
		r0 = r18
	}
	{
		r0 = setbit(r24,#0)
		r18 = r16
		r1 = memw(r18+#72)
	}
	{
		r18 += mpyi(r0,#84)
	}
	{
		if (!p0.new) r17 = add(r1,#0)
		r0 = r18
		p0 = cmp.eq(r1,#0)
	}
	{
		call ##_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE
	}
	{
		r0 = setbit(r24,#1)
		r18 = r16
		r1 = memw(r18+#72)
	}
	{
		r18 += mpyi(r0,#84)
	}
	{
		if (!p0.new) r17 = add(r1,#0)
		r0 = r18
		p0 = cmp.eq(r1,#0)
	}
	{
		call ##_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE
	}
	{
		r0 = or(r24,#3)
		r18 = r16
		r1 = memw(r18+#72)
	}
	{
		r18 += mpyi(r0,#84)
	}
	{
		if (!p0.new) r17 = add(r1,#0)
		r0 = r18
		p0 = cmp.eq(r1,#0)
	}
	{
		call ##_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE
	}
	{
		r0 = setbit(r24,#2)
		r18 = r16
		r1 = memw(r18+#72)
	}
	{
		r18 += mpyi(r0,#84)
	}
	{
		if (!p0.new) r17 = add(r1,#0)
		r0 = r18
		p0 = cmp.eq(r1,#0)
	}
	{
		call ##_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE
	}
	{
		r0 = or(r24,#5)
		r18 = r16
		r1 = memw(r18+#72)
	}
	{
		r18 += mpyi(r0,#84)
	}
	{
		if (!p0.new) r17 = add(r1,#0)
		r0 = r18
		p0 = cmp.eq(r1,#0)
	}
	{
		call ##_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE
	}
	{
		r0 = or(r24,#6)
		r18 = r16
		r1 = memw(r18+#72)
	}
	{
		r18 += mpyi(r0,#84)
	}
	{
		if (!p0.new) r17 = add(r1,#0)
		r0 = r18
		p0 = cmp.eq(r1,#0)
	}
	{
		call ##_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE
	}
	{
		r0 = or(r24,#7)
		r18 = r16
		r1 = memw(r18+#72)
	}
	{
		r18 += mpyi(r0,#84)
	}
	{
		if (!p0.new) r17 = add(r1,#0)
		r0 = r18
		p0 = cmp.eq(r1,#0)
	}
	{
		call ##_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE
	}
	{
		r3:2 = combine(#-1,#-8)
		r0 = memw(r18+#72)
	}
	{
		r21:20 = add(r21:20,r3:2)
		r3:2 = combine(#0,#8)
	}
	{
		p0 = cmp.eq(r21:20,r27:26)
		r25:24 = add(r25:24,r3:2)
		p1 = cmp.eq(r0,#0)
		if (!p1.new) r17 = add(r0,#0)
	}
	{
		if (!p0) jump:nt .LBB51_12
	}
.LBB51_13:                              // %for.cond.cleanup24.loopexit.unr-lcssa
	{
		r1:0 = combine(#0,#0)
		r19 = memw(r30+#-52)
	}                                       // 4-byte Folded Reload
	{
		p0 = cmp.eq(r23:22,r1:0)
		if (p0.new) jump:nt .LBB51_16
	}
// %bb.14:
	{
		r27:26 = combine(#0,#1)
		r21:20 = combine(#-1,#-1)
	}
	.p2align	4
.LBB51_15:                              // %for.body25.epil
                                        // =>This Inner Loop Header: Depth=1
	{
		r18 = r16
	}
	{
		r18 += mpyi(r24,#84)
	}
	{
		call ##_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE
		r0 = r18
	}
	{
		r23:22 = add(r23:22,r21:20)
		r25:24 = add(r25:24,r27:26)
		r3:2 = combine(#0,#0)
		r0 = memw(r18+#72)
	}
	{
		p0 = cmp.eq(r23:22,r3:2)
	}
	{
		p1 = cmp.eq(r0,#0)
		if (!p1.new) r17 = add(r0,#0)
		if (!p0) jump:nt .LBB51_15
	}
	{
		jump .LBB51_16
	}
.LBB51_1:
	{
		r20 = r0
		r25:24 = combine(#0,#1)
		r19 = r2
		r23:22 = combine(#0,#0)
	}
	{
		r26 = #0
		jump .LBB51_2
	}
	.p2align	4
.LBB51_6:                               // %if.end
                                        //   in Loop: Header=BB51_2 Depth=1
	{
		r2 = #56
		r21 = r16
	}
	{
		r21 += mpyi(r22,#84)
	}
	{
		call ##__hexagon_memcpy_likely_aligned_min32bytes_mult8bytes
		r1:0 = combine(r19,r21)
		r19 = add(r19,#40)
	}
	{
		r0 = add(r21,#4)
		r3:2 = combine(#0,#0)
		memw(r21+#40) = #0
		memw(r21+#64) = r20
	}
	{
		memd(r0+#64) = r3:2
		memw(r21+#76) = #0
	}
	{
		memb(r21+#80) = r26
		memw(r21+#56) = r17
	}
.LBB51_7:                               // %for.inc
                                        //   in Loop: Header=BB51_2 Depth=1
	{
		r23:22 = add(r23:22,r25:24)
		r1:0 = sxtw(r18)
	}
	{
		p0 = cmp.gt(r1:0,r23:22)
		if (!p0.new) jump:nt .LBB51_4
	}
.LBB51_2:                               // %for.body
                                        // =>This Inner Loop Header: Depth=1
	{
		r0 = memw(r19+#24)
		if (cmp.gt(r0.new,#0)) jump:t .LBB51_6
	}
// %bb.3:                               // %if.then
                                        //   in Loop: Header=BB51_2 Depth=1
	{
		r18 = add(r18,#-1)
		jump .LBB51_7
	}
.LBB51_5:
	{
		r17 = #0 ; jump .LBB51_17
	}
.LBB51_9:
	{
		r17 = #0
	}
.LBB51_16:                              // %for.cond.cleanup24
	{
		call ##halide_mutex_unlock
		r0 = memw(r19+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
.LBB51_17:                              // %cleanup
	{
		r0 = r17
		r17:16 = memd(r30+#-8)
		r19:18 = memd(r30+#-16)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r30+#-24)
		r23:22 = memd(r30+#-32)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r30+#-40)
		r27:26 = memd(r30+#-48)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end51:
	.size	halide_default_do_parallel_tasks, .Lfunc_end51-halide_default_do_parallel_tasks
                                        // -- End function
	.section	.text.halide_default_semaphore_init,"ax",@progbits
	.weak	halide_default_semaphore_init   // -- Begin function halide_default_semaphore_init
	.p2align	4
	.type	halide_default_semaphore_init,@function
halide_default_semaphore_init:          // @halide_default_semaphore_init
// %bb.0:                               // %entry
	{
		jumpr r31
		r0 = r1
		memw(r0+#0) = r1
	}
.Lfunc_end52:
	.size	halide_default_semaphore_init, .Lfunc_end52-halide_default_semaphore_init
                                        // -- End function
	.section	.text.halide_default_semaphore_release,"ax",@progbits
	.weak	halide_default_semaphore_release // -- Begin function halide_default_semaphore_release
	.p2align	4
	.type	halide_default_semaphore_release,@function
halide_default_semaphore_release:       // @halide_default_semaphore_release
// %bb.0:                               // %entry
	{
		memd(r29+#-16) = r17:16
		allocframe(#8)
	}                                       // 8-byte Folded Spill
	.p2align	4
.LBB53_1:                               // %atomicrmw.start
                                        // =>This Inner Loop Header: Depth=1
	{
		r2 = memw_locked(r0)
	}
	{
		r16 = add(r2,r1)
	}
	{
		memw_locked(r0,p0) = r16
	}
	{
		if (!p0) jump:nt .LBB53_1
	}
// %bb.2:                               // %atomicrmw.end
	{
		p0 = cmp.eq(r2,#0); if (!p0.new) jump:nt .LBB53_5
	}
// %bb.3:                               // %atomicrmw.end
	{
		p0 = cmp.eq(r1,#0)
		if (p0.new) r0 = add(r16,#0)
		if (p0.new) r17:16 = memd(r29+#0)
		if (p0.new) r31:30 = dealloc_return(r30):t:raw
	}                                       // 8-byte Folded Reload
.LBB53_4:                               // %if.then
	{
		r0 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
	}
	{
		r17 = memw(r0+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
	{
		call ##halide_mutex_lock
		r0 = r17
	}
	{
		call ##halide_cond_broadcast
		r0 = add(r17,#40)
	}
	{
		call ##halide_cond_broadcast
		r0 = add(r17,#56)
	}
	{
		call ##halide_mutex_unlock
		r0 = r17
	}
.LBB53_5:                               // %if.end
	{
		r0 = r16
		r17:16 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end53:
	.size	halide_default_semaphore_release, .Lfunc_end53-halide_default_semaphore_release
                                        // -- End function
	.section	.text.halide_thread_pool_cleanup,"ax",@progbits
	.weak	halide_thread_pool_cleanup      // -- Begin function halide_thread_pool_cleanup
	.p2align	4
	.type	halide_thread_pool_cleanup,@function
halide_thread_pool_cleanup:             // @halide_thread_pool_cleanup
// %bb.0:                               // %entry
	{
		jump ##halide_shutdown_thread_pool
	}
.Lfunc_end54:
	.size	halide_thread_pool_cleanup, .Lfunc_end54-halide_thread_pool_cleanup
                                        // -- End function
	.section	.text.halide_shutdown_thread_pool,"ax",@progbits
	.weak	halide_shutdown_thread_pool     // -- Begin function halide_shutdown_thread_pool
	.p2align	4
	.type	halide_shutdown_thread_pool,@function
halide_shutdown_thread_pool:            // @halide_shutdown_thread_pool
// %bb.0:                               // %entry
	{
		r0 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		memd(r29+#-16) = r17:16
		allocframe(#24)
	}                                       // 8-byte Folded Spill
	{
		r17 = add(r0,##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
	{
		memd(r29+#8) = r19:18
		memd(r29+#0) = r21:20
	}                                       // 8-byte Folded Spill
	{
		r0 = memw(r17+#0)
	}
	{
		r0 = memb(r0+##1097)
		if (cmp.eq(r0.new,#0)) jump:nt .LBB55_5
	}
// %bb.1:                               // %if.then
	{
		r16 = memw(r17+#0)
	}
	{
		call ##halide_mutex_lock
		r0 = r16
	}
	{
		r0 = add(r16,#56)
		r1 = #1
		memb(r16+##1096) = r1.new
	}
	{
		call ##halide_cond_broadcast
	}
	{
		call ##halide_cond_broadcast
		r0 = add(r16,#40)
	}
	{
		call ##halide_cond_broadcast
		r0 = add(r16,#48)
	}
	{
		call ##halide_mutex_unlock
		r0 = r16
	}
	{
		r0 = memw(r16+#20)
		if (!cmp.gt(r0.new,#0)) jump:nt .LBB55_4
	}
// %bb.2:
	{
		r16 = add(r16,#72)
		r19:18 = combine(#0,#0)
		r21:20 = combine(#0,#1)
	}
	.p2align	4
.LBB55_3:                               // %for.body
                                        // =>This Inner Loop Header: Depth=1
	{
		call ##halide_join_thread
		r0 = memw(r16+r18<<#2)
	}
	{
		r19:18 = add(r19:18,r21:20)
		r0 = memw(r17+#0)
	}
	{
		r0 = memw(r0+#20)
	}
	{
		r1:0 = sxtw(r0)
	}
	{
		p0 = cmp.gt(r1:0,r19:18)
		if (p0.new) jump:t .LBB55_3
	}
.LBB55_4:                               // %for.cond.cleanup
	{
		r2 = #2116
		r1 = #0
		r3 = #0
		r0 = memw(r17+#0)
	}
	{
		r0 = add(r0,#12)
		r17:16 = memd(r29+#16)
		r19:18 = memd(r29+#8)
	}                                       // 8-byte Folded Reload
	{
		jump ##memset
		r21:20 = memd(r29+#0)
		deallocframe
	}                                       // 8-byte Folded Reload
.LBB55_5:                               // %if.end
	{
		r17:16 = memd(r29+#16)
		r19:18 = memd(r29+#8)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end55:
	.size	halide_shutdown_thread_pool, .Lfunc_end55-halide_shutdown_thread_pool
                                        // -- End function
	.section	.text.halide_join_thread,"ax",@progbits
	.weak	halide_join_thread              // -- Begin function halide_join_thread
	.p2align	4
	.type	halide_join_thread,@function
halide_join_thread:                     // @halide_join_thread
// %bb.0:                               // %entry
	{
		r16 = r0
		memd(r29+#-16) = r17:16
		allocframe(#16)
	}                                       // 8-byte Folded Spill
	{
		r2 = add(r29,#0)
		r1:0 = memd(r0+#8)
	}
	{
		call ##pthread_join
		memw(r29+#0) = #0
	}
	{
		call ##free
		r0 = r16
	}
	{
		r17:16 = memd(r29+#8)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end56:
	.size	halide_join_thread, .Lfunc_end56-halide_join_thread
                                        // -- End function
	.section	.text.halide_cond_signal,"ax",@progbits
	.weak	halide_cond_signal              // -- Begin function halide_cond_signal
	.p2align	4
	.type	halide_cond_signal,@function
halide_cond_signal:                     // @halide_cond_signal
// %bb.0:                               // %entry
	{
		r7:6 = combine(#0,#0)
		r2 = r0
		r5:4 = memd(r0+#0)
	}
	{
		p0 = cmp.eq(r5:4,r7:6)
		if (p0.new) jumpr:nt r31
	}
.LBB57_1:                               // %if.end.i
	{
		r1 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		r3 = #0
		allocframe(#16)
	}
	{
		r0 = add(r29,#0)
	}
	{
		r1 = memw(r1+##_ZTVN6Halide7Runtime8Internal15Synchronization22signal_parking_controlE@GOT)
		memw(r29+#4) = r2
	}
	{
		r1 = add(r1,#8)
		memw(r29+#8) = r4
	}
	{
		call ##_ZN6Halide7Runtime8Internal15Synchronization15parking_control10unpark_oneEy
		memw(r29+#0) = r1
	}
	{
		r31:30 = deallocframe(r30):raw
	}
	{
		jumpr r31
	}
.Lfunc_end57:
	.size	halide_cond_signal, .Lfunc_end57-halide_cond_signal
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization15parking_control8validateERNS2_15validate_actionE,"axG",@progbits,_ZN6Halide7Runtime8Internal15Synchronization15parking_control8validateERNS2_15validate_actionE,comdat
	.weak	_ZN6Halide7Runtime8Internal15Synchronization15parking_control8validateERNS2_15validate_actionE // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization15parking_control8validateERNS2_15validate_actionE
	.p2align	4
	.type	_ZN6Halide7Runtime8Internal15Synchronization15parking_control8validateERNS2_15validate_actionE,@function
_ZN6Halide7Runtime8Internal15Synchronization15parking_control8validateERNS2_15validate_actionE: // @_ZN6Halide7Runtime8Internal15Synchronization15parking_control8validateERNS2_15validate_actionE
// %bb.0:                               // %entry
	{
		r0 = #1
		jumpr r31
	}
.Lfunc_end58:
	.size	_ZN6Halide7Runtime8Internal15Synchronization15parking_control8validateERNS2_15validate_actionE, .Lfunc_end58-_ZN6Halide7Runtime8Internal15Synchronization15parking_control8validateERNS2_15validate_actionE
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization22signal_parking_control6unparkEib,"axG",@progbits,_ZN6Halide7Runtime8Internal15Synchronization22signal_parking_control6unparkEib,comdat
	.weak	_ZN6Halide7Runtime8Internal15Synchronization22signal_parking_control6unparkEib // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization22signal_parking_control6unparkEib
	.p2align	4
	.type	_ZN6Halide7Runtime8Internal15Synchronization22signal_parking_control6unparkEib,@function
_ZN6Halide7Runtime8Internal15Synchronization22signal_parking_control6unparkEib: // @_ZN6Halide7Runtime8Internal15Synchronization22signal_parking_control6unparkEib
// %bb.0:                               // %entry
	{
		p0 = tstbit(r2,#0); if (p0.new) jump:t .LBB59_2
	}
// %bb.1:                               // %if.then
	{
		r3:2 = combine(#0,#0)
		r0 = memw(r0+#4)
	}
	{
		memd(r0+#0) = r3:2
	}
.LBB59_2:                               // %if.end
	{
		r1:0 = combine(#0,#0)
		jumpr r31
	}
.Lfunc_end59:
	.size	_ZN6Halide7Runtime8Internal15Synchronization22signal_parking_control6unparkEib, .Lfunc_end59-_ZN6Halide7Runtime8Internal15Synchronization22signal_parking_control6unparkEib
                                        // -- End function
	.section	.text.halide_mutex_array_create,"ax",@progbits
	.weak	halide_mutex_array_create       // -- Begin function halide_mutex_array_create
	.p2align	4
	.type	halide_mutex_array_create,@function
halide_mutex_array_create:              // @halide_mutex_array_create
// %bb.0:                               // %entry
	{
		r3:2 = combine(#0,#8)
		r17 = #0
		memd(r29+#-16) = r17:16
		allocframe(#16)
	}                                       // 8-byte Folded Spill
	{
		r0 = #0
		r18 = r0
		memd(r29+#0) = r19:18
	}                                       // 8-byte Folded Spill
	{
		call ##halide_malloc
	}
	{
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB60_4
	}
// %bb.1:                               // %if.end
	{
		r3:2 = sxtw(r18)
		r0 = #0
		r17:16 = combine(#0,r0)
	}
	{
		r19:18 = asl(r3:2,#3)
	}
	{
		call ##halide_malloc
		r3:2 = combine(r19,r18)
	}
	{
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB60_2
		memw(r16+#0) = r0
	}
// %bb.3:                               // %if.end6
	{
		call ##memset
		r1 = #0
		r3:2 = combine(r19,r18)
	}
	{
		r17 = r16
	}
.LBB60_4:                               // %cleanup
	{
		r0 = r17
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB60_2:                               // %if.then5
	{
		call ##halide_free
		r1:0 = combine(r16,#0)
	}
	{
		r0 = r17
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end60:
	.size	halide_mutex_array_create, .Lfunc_end60-halide_mutex_array_create
                                        // -- End function
	.section	.text.halide_mutex_array_destroy,"ax",@progbits
	.weak	halide_mutex_array_destroy      // -- Begin function halide_mutex_array_destroy
	.p2align	4
	.type	halide_mutex_array_destroy,@function
halide_mutex_array_destroy:             // @halide_mutex_array_destroy
// %bb.0:                               // %entry
	{
		r17:16 = combine(r1,r0)
		memd(r29+#-16) = r17:16
		allocframe(#8)
	}                                       // 8-byte Folded Spill
	{
		call ##halide_free
		r1 = memw(r1+#0)
	}
	{
		r1:0 = combine(r17,r16)
		r17:16 = memd(r29+#0)
		deallocframe
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_free
	}
.Lfunc_end61:
	.size	halide_mutex_array_destroy, .Lfunc_end61-halide_mutex_array_destroy
                                        // -- End function
	.section	.text.halide_mutex_array_lock,"ax",@progbits
	.weak	halide_mutex_array_lock         // -- Begin function halide_mutex_array_lock
	.p2align	4
	.type	halide_mutex_array_lock,@function
halide_mutex_array_lock:                // @halide_mutex_array_lock
// %bb.0:                               // %entry
	{
		allocframe(r29,#0):raw
	}
	{
		r0 = memw(r0+#0)
	}
	{
		r0 = addasl(r0,r1,#3)
		call ##halide_mutex_lock
	}
	{
		r0 = #0
		dealloc_return
	}
.Lfunc_end62:
	.size	halide_mutex_array_lock, .Lfunc_end62-halide_mutex_array_lock
                                        // -- End function
	.section	.text.halide_mutex_array_unlock,"ax",@progbits
	.weak	halide_mutex_array_unlock       // -- Begin function halide_mutex_array_unlock
	.p2align	4
	.type	halide_mutex_array_unlock,@function
halide_mutex_array_unlock:              // @halide_mutex_array_unlock
// %bb.0:                               // %entry
	{
		allocframe(r29,#0):raw
	}
	{
		r0 = memw(r0+#0)
	}
	{
		r0 = addasl(r0,r1,#3)
		call ##halide_mutex_unlock
	}
	{
		r0 = #0
		dealloc_return
	}
.Lfunc_end63:
	.size	halide_mutex_array_unlock, .Lfunc_end63-halide_mutex_array_unlock
                                        // -- End function
	.section	.text.halide_set_num_threads,"ax",@progbits
	.weak	halide_set_num_threads          // -- Begin function halide_set_num_threads
	.p2align	4
	.type	halide_set_num_threads,@function
halide_set_num_threads:                 // @halide_set_num_threads
// %bb.0:                               // %entry
	{
		r2 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		memd(r29+#-16) = r17:16
		allocframe(#8)
	}                                       // 8-byte Folded Spill
	{
		r16 = r0
		p0 = cmp.gt(r0,#-1)
		r17 = add(r2,##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
	{
		if (!p0) jump:nt .LBB64_1
	}
// %bb.2:                               // %if.end
	{
		call ##halide_mutex_lock
		r0 = memw(r17+#0)
	}
	{
		p0 = cmp.eq(r16,#0); if (!p0.new) jump:t .LBB64_4
	}
// %bb.3:                               // %if.then2
	{
		call ##_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv
	}
	{
		r16 = r0 ; jump .LBB64_4
	}
.LBB64_1:                               // %if.end.thread
	{
		r1 = add(pc,##.L.str.4@PCREL)
		r0 = #0
	}
	{
		call ##halide_error
	}
	{
		call ##halide_mutex_lock
		r0 = memw(r17+#0)
	}
.LBB64_4:                               // %if.end3
	{
		r2 = #256
		r1 = #1
		r0 = memw(r17+#0)
	}
	{
		r1 = max(r16,r1)
	}
	{
		r1 = min(r1,r2)
		r16 = memw(r0+#8)
		memw(r0+#8) = r1.new
	}
	{
		call ##halide_mutex_unlock
	}
	{
		r0 = r16
		r17:16 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end64:
	.size	halide_set_num_threads, .Lfunc_end64-halide_set_num_threads
                                        // -- End function
	.section	.text.halide_set_custom_do_task,"ax",@progbits
	.weak	halide_set_custom_do_task       // -- Begin function halide_set_custom_do_task
	.p2align	4
	.type	halide_set_custom_do_task,@function
halide_set_custom_do_task:              // @halide_set_custom_do_task
// %bb.0:                               // %entry
	{
		r1 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
	}
	{
		r2 = memw(r1+##_ZN6Halide7Runtime8Internal14custom_do_taskE@GOT)
	}
	{
		r1 = memw(r2+#0)
		memw(r2+#0) = r0
	}
	{
		r0 = r1
		jumpr r31
	}
.Lfunc_end65:
	.size	halide_set_custom_do_task, .Lfunc_end65-halide_set_custom_do_task
                                        // -- End function
	.section	.text.halide_set_custom_do_loop_task,"ax",@progbits
	.weak	halide_set_custom_do_loop_task  // -- Begin function halide_set_custom_do_loop_task
	.p2align	4
	.type	halide_set_custom_do_loop_task,@function
halide_set_custom_do_loop_task:         // @halide_set_custom_do_loop_task
// %bb.0:                               // %entry
	{
		r1 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
	}
	{
		r2 = memw(r1+##_ZN6Halide7Runtime8Internal19custom_do_loop_taskE@GOT)
	}
	{
		r1 = memw(r2+#0)
		memw(r2+#0) = r0
	}
	{
		r0 = r1
		jumpr r31
	}
.Lfunc_end66:
	.size	halide_set_custom_do_loop_task, .Lfunc_end66-halide_set_custom_do_loop_task
                                        // -- End function
	.section	.text.halide_set_custom_do_par_for,"ax",@progbits
	.weak	halide_set_custom_do_par_for    // -- Begin function halide_set_custom_do_par_for
	.p2align	4
	.type	halide_set_custom_do_par_for,@function
halide_set_custom_do_par_for:           // @halide_set_custom_do_par_for
// %bb.0:                               // %entry
	{
		r1 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
	}
	{
		r2 = memw(r1+##_ZN6Halide7Runtime8Internal17custom_do_par_forE@GOT)
	}
	{
		r1 = memw(r2+#0)
		memw(r2+#0) = r0
	}
	{
		r0 = r1
		jumpr r31
	}
.Lfunc_end67:
	.size	halide_set_custom_do_par_for, .Lfunc_end67-halide_set_custom_do_par_for
                                        // -- End function
	.section	.text.halide_set_custom_parallel_runtime,"ax",@progbits
	.weak	halide_set_custom_parallel_runtime // -- Begin function halide_set_custom_parallel_runtime
	.p2align	4
	.type	halide_set_custom_parallel_runtime,@function
halide_set_custom_parallel_runtime:     // @halide_set_custom_parallel_runtime
// %bb.0:                               // %entry
	{
		r6 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
	}
	{
		r7 = memw(r6+##_ZN6Halide7Runtime8Internal17custom_do_par_forE@GOT)
	}
	{
		memw(r7+#0) = r0
	}
	{
		r0 = memw(r6+##_ZN6Halide7Runtime8Internal14custom_do_taskE@GOT)
	}
	{
		memw(r0+#0) = r1
	}
	{
		r0 = memw(r6+##_ZN6Halide7Runtime8Internal19custom_do_loop_taskE@GOT)
	}
	{
		r2 = memw(r29+#0)
		memw(r0+#0) = r2
	}
	{
		r0 = memw(r6+##_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE@GOT)
	}
	{
		memw(r0+#0) = r3
	}
	{
		r0 = memw(r6+##_ZN6Halide7Runtime8Internal21custom_semaphore_initE@GOT)
	}
	{
		memw(r0+#0) = r4
	}
	{
		r0 = memw(r6+##_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE@GOT)
	}
	{
		memw(r0+#0) = r5
	}
	{
		r0 = memw(r6+##_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE@GOT)
	}
	{
		jumpr r31
		memw(r0+#0) = r2
	}
.Lfunc_end68:
	.size	halide_set_custom_parallel_runtime, .Lfunc_end68-halide_set_custom_parallel_runtime
                                        // -- End function
	.section	.text.halide_do_par_for,"ax",@progbits
	.weak	halide_do_par_for               // -- Begin function halide_do_par_for
	.p2align	4
	.type	halide_do_par_for,@function
halide_do_par_for:                      // @halide_do_par_for
// %bb.0:                               // %entry
	{
		r5 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		allocframe(r29,#0):raw
	}
	{
		r5 = memw(r5+##_ZN6Halide7Runtime8Internal17custom_do_par_forE@GOT)
	}
	{
		r5 = memw(r5+#0)
	}
	{
		callr r5
	}
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end69:
	.size	halide_do_par_for, .Lfunc_end69-halide_do_par_for
                                        // -- End function
	.section	.text.halide_do_parallel_tasks,"ax",@progbits
	.weak	halide_do_parallel_tasks        // -- Begin function halide_do_parallel_tasks
	.p2align	4
	.type	halide_do_parallel_tasks,@function
halide_do_parallel_tasks:               // @halide_do_parallel_tasks
// %bb.0:                               // %entry
	{
		r4 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		allocframe(r29,#0):raw
	}
	{
		r4 = memw(r4+##_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE@GOT)
	}
	{
		r4 = memw(r4+#0)
	}
	{
		callr r4
	}
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end70:
	.size	halide_do_parallel_tasks, .Lfunc_end70-halide_do_parallel_tasks
                                        // -- End function
	.section	.text.halide_semaphore_init,"ax",@progbits
	.weak	halide_semaphore_init           // -- Begin function halide_semaphore_init
	.p2align	4
	.type	halide_semaphore_init,@function
halide_semaphore_init:                  // @halide_semaphore_init
// %bb.0:                               // %entry
	{
		r2 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		allocframe(r29,#0):raw
	}
	{
		r2 = memw(r2+##_ZN6Halide7Runtime8Internal21custom_semaphore_initE@GOT)
	}
	{
		r2 = memw(r2+#0)
	}
	{
		callr r2
	}
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end71:
	.size	halide_semaphore_init, .Lfunc_end71-halide_semaphore_init
                                        // -- End function
	.section	.text.halide_semaphore_release,"ax",@progbits
	.weak	halide_semaphore_release        // -- Begin function halide_semaphore_release
	.p2align	4
	.type	halide_semaphore_release,@function
halide_semaphore_release:               // @halide_semaphore_release
// %bb.0:                               // %entry
	{
		r2 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		allocframe(r29,#0):raw
	}
	{
		r2 = memw(r2+##_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE@GOT)
	}
	{
		r2 = memw(r2+#0)
	}
	{
		callr r2
	}
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end72:
	.size	halide_semaphore_release, .Lfunc_end72-halide_semaphore_release
                                        // -- End function
	.section	.text.halide_semaphore_try_acquire,"ax",@progbits
	.weak	halide_semaphore_try_acquire    // -- Begin function halide_semaphore_try_acquire
	.p2align	4
	.type	halide_semaphore_try_acquire,@function
halide_semaphore_try_acquire:           // @halide_semaphore_try_acquire
// %bb.0:                               // %entry
	{
		r2 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		allocframe(r29,#0):raw
	}
	{
		r2 = memw(r2+##_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE@GOT)
	}
	{
		r2 = memw(r2+#0)
	}
	{
		callr r2
	}
	{
		p0 = r0
	}
	{
		r0 = mux(p0,#1,#0)
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end73:
	.size	halide_semaphore_try_acquire, .Lfunc_end73-halide_semaphore_try_acquire
                                        // -- End function
	.section	.text.halide_default_get_symbol,"ax",@progbits
	.weak	halide_default_get_symbol       // -- Begin function halide_default_get_symbol
	.p2align	4
	.type	halide_default_get_symbol,@function
halide_default_get_symbol:              // @halide_default_get_symbol
// %bb.0:                               // %entry
	{
		r1 = r0 ; jump ##dlsym
		r0 = #0
	}
.Lfunc_end74:
	.size	halide_default_get_symbol, .Lfunc_end74-halide_default_get_symbol
                                        // -- End function
	.section	.text.halide_default_load_library,"ax",@progbits
	.weak	halide_default_load_library     // -- Begin function halide_default_load_library
	.p2align	4
	.type	halide_default_load_library,@function
halide_default_load_library:            // @halide_default_load_library
// %bb.0:                               // %entry
	{
		r1 = #1
		memd(r29+#-16) = r17:16
		allocframe(#8)
	}                                       // 8-byte Folded Spill
	{
		call ##dlopen
	}
	{
		r16 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		if (!p0) r0 = add(r16,#0)
		if (!p0) r17:16 = memd(r29+#0)
		if (!p0) r31:30 = dealloc_return(r30):raw
	}                                       // 8-byte Folded Reload
.LBB75_1:                               // %if.then
	{
		call ##dlerror
	}
	{
		r0 = r16
		r17:16 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end75:
	.size	halide_default_load_library, .Lfunc_end75-halide_default_load_library
                                        // -- End function
	.section	.text.halide_default_get_library_symbol,"ax",@progbits
	.weak	halide_default_get_library_symbol // -- Begin function halide_default_get_library_symbol
	.p2align	4
	.type	halide_default_get_library_symbol,@function
halide_default_get_library_symbol:      // @halide_default_get_library_symbol
// %bb.0:                               // %entry
	{
		jump ##dlsym
	}
.Lfunc_end76:
	.size	halide_default_get_library_symbol, .Lfunc_end76-halide_default_get_library_symbol
                                        // -- End function
	.section	.text.halide_set_custom_get_symbol,"ax",@progbits
	.weak	halide_set_custom_get_symbol    // -- Begin function halide_set_custom_get_symbol
	.p2align	4
	.type	halide_set_custom_get_symbol,@function
halide_set_custom_get_symbol:           // @halide_set_custom_get_symbol
// %bb.0:                               // %entry
	{
		r1 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
	}
	{
		r2 = memw(r1+##_ZN6Halide7Runtime8Internal17custom_get_symbolE@GOT)
	}
	{
		r1 = memw(r2+#0)
		memw(r2+#0) = r0
	}
	{
		r0 = r1
		jumpr r31
	}
.Lfunc_end77:
	.size	halide_set_custom_get_symbol, .Lfunc_end77-halide_set_custom_get_symbol
                                        // -- End function
	.section	.text.halide_set_custom_load_library,"ax",@progbits
	.weak	halide_set_custom_load_library  // -- Begin function halide_set_custom_load_library
	.p2align	4
	.type	halide_set_custom_load_library,@function
halide_set_custom_load_library:         // @halide_set_custom_load_library
// %bb.0:                               // %entry
	{
		r1 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
	}
	{
		r2 = memw(r1+##_ZN6Halide7Runtime8Internal19custom_load_libraryE@GOT)
	}
	{
		r1 = memw(r2+#0)
		memw(r2+#0) = r0
	}
	{
		r0 = r1
		jumpr r31
	}
.Lfunc_end78:
	.size	halide_set_custom_load_library, .Lfunc_end78-halide_set_custom_load_library
                                        // -- End function
	.section	.text.halide_set_custom_get_library_symbol,"ax",@progbits
	.weak	halide_set_custom_get_library_symbol // -- Begin function halide_set_custom_get_library_symbol
	.p2align	4
	.type	halide_set_custom_get_library_symbol,@function
halide_set_custom_get_library_symbol:   // @halide_set_custom_get_library_symbol
// %bb.0:                               // %entry
	{
		r1 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
	}
	{
		r2 = memw(r1+##_ZN6Halide7Runtime8Internal25custom_get_library_symbolE@GOT)
	}
	{
		r1 = memw(r2+#0)
		memw(r2+#0) = r0
	}
	{
		r0 = r1
		jumpr r31
	}
.Lfunc_end79:
	.size	halide_set_custom_get_library_symbol, .Lfunc_end79-halide_set_custom_get_library_symbol
                                        // -- End function
	.section	.text.halide_get_symbol,"ax",@progbits
	.weak	halide_get_symbol               // -- Begin function halide_get_symbol
	.p2align	4
	.type	halide_get_symbol,@function
halide_get_symbol:                      // @halide_get_symbol
// %bb.0:                               // %entry
	{
		r1 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		allocframe(r29,#0):raw
	}
	{
		r1 = memw(r1+##_ZN6Halide7Runtime8Internal17custom_get_symbolE@GOT)
	}
	{
		r1 = memw(r1+#0)
	}
	{
		callr r1
	}
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end80:
	.size	halide_get_symbol, .Lfunc_end80-halide_get_symbol
                                        // -- End function
	.section	.text.halide_load_library,"ax",@progbits
	.weak	halide_load_library             // -- Begin function halide_load_library
	.p2align	4
	.type	halide_load_library,@function
halide_load_library:                    // @halide_load_library
// %bb.0:                               // %entry
	{
		r1 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		allocframe(r29,#0):raw
	}
	{
		r1 = memw(r1+##_ZN6Halide7Runtime8Internal19custom_load_libraryE@GOT)
	}
	{
		r1 = memw(r1+#0)
	}
	{
		callr r1
	}
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end81:
	.size	halide_load_library, .Lfunc_end81-halide_load_library
                                        // -- End function
	.section	.text.halide_get_library_symbol,"ax",@progbits
	.weak	halide_get_library_symbol       // -- Begin function halide_get_library_symbol
	.p2align	4
	.type	halide_get_library_symbol,@function
halide_get_library_symbol:              // @halide_get_library_symbol
// %bb.0:                               // %entry
	{
		r2 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		allocframe(r29,#0):raw
	}
	{
		r2 = memw(r2+##_ZN6Halide7Runtime8Internal25custom_get_library_symbolE@GOT)
	}
	{
		r2 = memw(r2+#0)
	}
	{
		callr r2
	}
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end82:
	.size	halide_get_library_symbol, .Lfunc_end82-halide_get_library_symbol
                                        // -- End function
	.section	.text.halide_set_gpu_device,"ax",@progbits
	.weak	halide_set_gpu_device           // -- Begin function halide_set_gpu_device
	.p2align	4
	.type	halide_set_gpu_device,@function
halide_set_gpu_device:                  // @halide_set_gpu_device
// %bb.0:                               // %entry
	{
		r1 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
	}
	{
		r2 = memw(r1+##_ZN6Halide7Runtime8Internal17halide_gpu_deviceE@GOT)
	}
	{
		memw(r2+#0) = r0
	}
	{
		r0 = memw(r1+##_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE@GOT)
	}
	{
		jumpr r31
		memb(r0+#0) = #1
	}
.Lfunc_end83:
	.size	halide_set_gpu_device, .Lfunc_end83-halide_set_gpu_device
                                        // -- End function
	.section	.text.halide_get_gpu_device,"ax",@progbits
	.weak	halide_get_gpu_device           // -- Begin function halide_get_gpu_device
	.p2align	4
	.type	halide_get_gpu_device,@function
halide_get_gpu_device:                  // @halide_get_gpu_device
// %bb.0:                               // %entry
	{
		r17 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		memd(r29+#-16) = r17:16
		allocframe(#8)
	}                                       // 8-byte Folded Spill
	{
		r0 = #255
	}
	.p2align	4
.LBB84_1:                               // %atomicrmw.start
                                        // =>This Inner Loop Header: Depth=1
	{
		r16 = add(r17,##_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE@GOT)
	}
	{
		r1 = memw(r16+#0)
	}
	{
		r2 = and(r1,#3)
		r3 = and(r1,#-4)
	}
	{
		r1 = asl(r2,#3)
	}
	{
		r2 = memw_locked(r3)
	}
	{
		r4 = asl(r0,r1)
		r5 = lsl(#1,r1)
	}
	{
		r5 |= and(r2,~r4)
	}
	{
		memw_locked(r3,p0) = r5
	}
	{
		if (!p0) jump:nt .LBB84_1
	}
// %bb.2:                               // %atomicrmw.end
                                        //   in Loop: Header=BB84_1 Depth=1
	{
		r3 = memw(r16+#0)
	}
	{
		r1 = insert(r3,#2,#3)
	}
	{
		r1 = lsr(r2,r1)
	}
	{
		p0 = !bitsclr(r1,r0)
		if (p0.new) jump:t .LBB84_1
	}
// %bb.3:                               // %_ZN6Halide7Runtime8Internal14ScopedSpinLockC2EPVc.exit
	{
		r0 = memw(r17+##_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE@GOT)
	}
	{
		r0 = memb(r0+#0)
		if (cmp.eq(r0.new,#0)) jump:nt .LBB84_5
	}
// %bb.4:                               // %_ZN6Halide7Runtime8Internal14ScopedSpinLockC2EPVc.exit.if.end4_crit_edge
	{
		r0 = memw(r17+##_ZN6Halide7Runtime8Internal17halide_gpu_deviceE@GOT)
	}
	{
		r0 = memw(r0+#0)
		r1 = memw(r16+#0)
	}
	{
		memb(r1+#0) = #0
	}
	{
		r17:16 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.LBB84_5:                               // %if.then
	{
		r0 = add(pc,##.L.str.8@PCREL)
		call ##getenv
	}
	{
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB84_6
	}
// %bb.7:                               // %if.then2
	{
		call ##atoi
	}
	{
		jump .LBB84_8
	}
.LBB84_6:
	{
		r0 = #-1
	}
.LBB84_8:                               // %if.end
	{
		r1 = memw(r17+##_ZN6Halide7Runtime8Internal17halide_gpu_deviceE@GOT)
	}
	{
		memw(r1+#0) = r0
	}
	{
		r1 = memw(r17+##_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE@GOT)
	}
	{
		memb(r1+#0) = #1
	}
	{
		r1 = memw(r16+#0)
	}
	{
		memb(r1+#0) = #0
	}
	{
		r17:16 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end84:
	.size	halide_get_gpu_device, .Lfunc_end84-halide_get_gpu_device
                                        // -- End function
	.section	.text.halide_string_to_string,"ax",@progbits
	.weak	halide_string_to_string         // -- Begin function halide_string_to_string
	.p2align	4
	.type	halide_string_to_string,@function
halide_string_to_string:                // @halide_string_to_string
// %bb.0:                               // %entry
	{
		p0 = cmp.gtu(r1,r0); if (!p0.new) jump:t .LBB85_5
	}
// %bb.1:                               // %if.end
	{
		r3 = add(pc,##.L.str.11@PCREL)
		p0 = cmp.eq(r2,#0)
		r4 = sub(r1,r0)
	}
	{
		loop0(.LBB85_2,r4)
		if (!p0) r3 = add(r2,#0)
	}
	.p2align	4
.Ltmp1:                                 // Block address taken
.LBB85_2:                               // %if.end5
                                        // =>This Inner Loop Header: Depth=1
	{
		r4 = memb(r3+#0)
		memb(r0+#0) = r4.new
	}
	{
		p0 = cmp.eq(r4,#0)
		if (p0.new) jumpr:nt r31
	}
.LBB85_3:                               // %if.end8
                                        //   in Loop: Header=BB85_2 Depth=1
	{
		r0 = add(r0,#1)
		r2 = r0
		r3 = add(r3,#1)
	} :endloop0
// %bb.4:                               // %if.then4
	{
		r0 = r1
		memb(r2+#0) = #0
	}
.LBB85_5:
	{
		jumpr r31
	}
.Lfunc_end85:
	.size	halide_string_to_string, .Lfunc_end85-halide_string_to_string
                                        // -- End function
	.section	.text.halide_uint64_to_string,"ax",@progbits
	.weak	halide_uint64_to_string         // -- Begin function halide_uint64_to_string
	.p2align	4
	.type	halide_uint64_to_string,@function
halide_uint64_to_string:                // @halide_uint64_to_string
// %bb.0:                               // %entry
	{
		p0 = cmp.gt(r4,#0)
		r6 = #1
		allocframe(#32)
	}
	{
		r5 = add(r29,#0)
		memb(r29+#31) = #0
	}
	{
		r5 = add(r5,#30)
		if (!p0) jump:nt .LBB86_1
	}
	.p2align	4
.LBB86_2:                               // %for.body
                                        // =>This Inner Loop Header: Depth=1
	{
		r9:8 = combine(r3,r2)
		r2 = ##-858993459
	}
	{
		r11:10 = mpyu(r8,r2)
		r3 = ##-858993460
		r7 = #-10
	}
	{
		r15:14 = mpyu(r8,r3)
		p0 = cmp.gt(r4,r6)
		r6 = add(r6,#1)
		r13:12 = combine(#0,r11)
	}
	{
		r11:10 = combine(r13,r12)
		r12 = r14
	}
	{
		r11:10 += mpyu(r9,r2)
	}
	{
		r11:10 = add(r11:10,r13:12)
	}
	{
		r12 = r11
	}
	{
		r11:10 = combine(r13,r12)
		r12 = r15
	}
	{
		r11:10 += mpyu(r9,r3)
	}
	{
		r3:2 = add(r11:10,r13:12)
	}
	{
		r3:2 = lsr(r3:2,#3)
	}
	{
		r11:10 = mpyu(r2,r7)
	}
	{
		r11 -= mpyi(r2,#1)
	}
	{
		r11 -= mpyi(r3,#10)
	}
	{
		r13:12 = add(r11:10,r9:8)
	}
	{
		r7 = add(r12,#48)
		if (p0) jump:nt .LBB86_2
		memb(r5++#-1) = r7.new
	}
// %bb.3:                               // %for.body
                                        //   in Loop: Header=BB86_2 Depth=1
	{
		r13:12 = combine(#0,#9)
	}
	{
		p0 = cmp.gtu(r9:8,r13:12)
		if (p0.new) jump:t .LBB86_2
	}
.LBB86_4:                               // %for.cond.cleanup
	{
		call ##halide_string_to_string
		r2 = add(r5,#1)
	}
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB86_1:                               // %entry
	{
		r9:8 = combine(#0,#0)
	}
	{
		p0 = cmp.eq(r3:2,r9:8)
		if (p0.new) jump:t .LBB86_4
	}
	{
		jump .LBB86_2
	}
.Lfunc_end86:
	.size	halide_uint64_to_string, .Lfunc_end86-halide_uint64_to_string
                                        // -- End function
	.section	.text.halide_int64_to_string,"ax",@progbits
	.weak	halide_int64_to_string          // -- Begin function halide_int64_to_string
	.p2align	4
	.type	halide_int64_to_string,@function
halide_int64_to_string:                 // @halide_int64_to_string
// %bb.0:                               // %entry
	{
		r7:6 = combine(#-1,#-1)
	}
	{
		p0 = cmp.gt(r3:2,r7:6)
		if (!p0.new) jump:nt .LBB87_1
	}
.LBB87_3:                               // %if.end
	{
		jump ##halide_uint64_to_string
	}
.LBB87_1:                               // %entry
	{
		p0 = cmp.gtu(r1,r0); if (!p0.new) jump:t .LBB87_3
	}
// %bb.2:                               // %if.then
	{
		r3:2 = neg(r3:2)
		r5 = #45
		memb(r0++#1) = r5.new
	}
	{
		jump ##halide_uint64_to_string
	}
.Lfunc_end87:
	.size	halide_int64_to_string, .Lfunc_end87-halide_int64_to_string
                                        // -- End function
	.section	.text.halide_double_to_string,"ax",@progbits
	.weak	halide_double_to_string         // -- Begin function halide_double_to_string
	.p2align	4
	.type	halide_double_to_string,@function
halide_double_to_string:                // @halide_double_to_string
// %bb.0:                               // %entry
	{
		r17:16 = combine(r0,r1)
		memd(r29+#-16) = r17:16
		allocframe(r29,#592):raw
	}                                       // 8-byte Folded Spill
	{
		r0 = add(r29,#520)
		r1 = add(r29,#528)
	}
	{
		r27:26 = combine(#0,#0)
		r3:2 = combine(#0,#8)
		memd(r29+#544) = r27:26
		memd(r29+#528) = r3:2
	}                                       // 8-byte Folded Spill
	{
		r18 = r4
		memd(r29+#576) = r19:18
		memd(r29+#568) = r21:20
	}                                       // 8-byte Folded Spill
	{
		memd(r29+#560) = r23:22
		memd(r29+#552) = r25:24
	}                                       // 8-byte Folded Spill
	{
		call ##memcpy
		memd(r29+#520) = r27:26
	}
	{
		r21:20 = memd(r29+#520)
	}
	{
		r24 = extractu(r21,#11,#20)
		r23 = extractu(r21,#20,#0)
	}
	{
		p0 = cmp.eq(r24,##2047)
		if (!p0.new) jump:t .LBB88_9
	}
// %bb.1:                               // %if.then
	{
		r22 = r20
		r1:0 = combine(#-1,#-1)
	}
	{
		p0 = cmp.eq(r23:22,r27:26)
		if (p0.new) jump:nt .LBB88_6
	}
// %bb.2:                               // %if.then4
	{
		p0 = cmp.gt(r21:20,r1:0)
		if (!p0.new) jump:nt .LBB88_3
	}
// %bb.5:                               // %if.else
	{
		r2 = add(pc,##.L.str.2.13@PCREL)
		jump .LBB88_4
	}
.LBB88_9:                               // %if.else15
	{
		p1 = cmp.eq(r24,#0)
		if (!p1.new) jump:nt .LBB88_18
	}
// %bb.10:                              // %if.else15
	{
		r22 = r20
		r1:0 = combine(#0,#0)
	}
	{
		p0 = cmp.eq(r23:22,r1:0)
		if (!p0.new) jump:nt .LBB88_18
	}
// %bb.11:                              // %if.then18
	{
		r1:0 = combine(#-1,#-1)
		p0 = cmp.eq(r18,#0); if (p0.new) jump:nt .LBB88_15
	}
// %bb.12:                              // %if.then20
	{
		p0 = cmp.gt(r21:20,r1:0)
		if (!p0.new) jump:nt .LBB88_13
	}
// %bb.14:                              // %if.else24
	{
		r2 = add(pc,##.L.str.6.17@PCREL)
		jump .LBB88_4
	}
.LBB88_18:                              // %if.end32
	{
		r1:0 = combine(#-1,#-1)
	}
	{
		p0 = cmp.gt(r21:20,r1:0)
		if (p0.new) jump:nt .LBB88_20
	}
// %bb.19:                              // %if.then34
	{
		r2 = add(pc,##.L.str.9@PCREL)
		r3 = p1
		r1:0 = combine(r16,r17)
	}
	{
		call ##halide_string_to_string
		r17 = r3
	}
	{
		r1 = r17
		r17 = r0
		r3:2 = memd(r29+#528)
	}
	{
		r3 = togglebit(r3,#31)
		p1 = r1
	}
	{
		memd(r29+#528) = r3:2
	}
.LBB88_20:                              // %if.end36
	{
		p0 = cmp.eq(r18,#0); if (p0.new) jump:nt .LBB88_32
	}
// %bb.21:                              // %while.condthread-pre-split
	{
		r22 = #0
		r23 = ##1072693248
		r1:0 = memd(r29+#528)
	}
	{
		r18 = #0
	}
	{
		p0 = dfcmp.ge(r1:0,r23:22)
		p1 = dfcmp.uo(r1:0,r23:22)
	}
	{
		p0 = or(p1,p0)
		if (p0.new) jump:t .LBB88_25
	}
// %bb.22:
	{
		r21 = ##1076101120
		r20 = #0
	}
	.p2align	4
.LBB88_23:                              // %while.body
                                        // =>This Inner Loop Header: Depth=1
	{
		call ##__hexagon_muldf3
		r3:2 = combine(r21,r20)
	}
	{
		p0 = dfcmp.gt(r23:22,r1:0)
		r18 = add(r18,#-1)
		if (p0.new) jump:t .LBB88_23
	}
// %bb.24:                              // %while.cond.while.cond40thread-pre-split_crit_edge
	{
		memd(r29+#528) = r1:0
	}
.LBB88_25:                              // %while.cond40thread-pre-split
	{
		r21 = ##1076101120
		r20 = #0
	}
	{
		p0 = dfcmp.gt(r21:20,r1:0)
		p1 = dfcmp.uo(r21:20,r1:0)
	}
	{
		p0 = or(p1,p0)
		if (p0.new) jump:t .LBB88_28
	}
	.p2align	4
.LBB88_26:                              // %while.body42
                                        // =>This Inner Loop Header: Depth=1
	{
		call ##__hexagon_divdf3
		r3:2 = combine(r21,r20)
	}
	{
		p0 = dfcmp.ge(r1:0,r21:20)
		r18 = add(r18,#1)
		if (p0.new) jump:t .LBB88_26
	}
// %bb.27:                              // %while.cond40.while.end43_crit_edge
	{
		memd(r29+#528) = r1:0
	}
.LBB88_28:                              // %while.end43
	{
		r3 = ##1093567616
		r2 = #0
	}
	{
		call ##__hexagon_muldf3
	}
	{
		r3 = ##1071644672
		r2 = #0
	}
	{
		call ##__hexagon_adddf3
	}
	{
		r7:6 = convert_df2ud(r1:0):chop
		r0 = ##-675924773
	}
	{
		r1 = ##1125899906
	}
	{
		r5:4 = mpyu(r6,r0)
		r9:8 = mpyu(r6,r1)
	}
	{
		r3:2 = combine(#0,r5)
	}
	{
		r5:4 = combine(r3,r2)
		r2 = r8
	}
	{
		r5:4 += mpyu(r7,r0)
	}
	{
		r5:4 = add(r5:4,r3:2)
	}
	{
		r2 = r5
	}
	{
		r5:4 = combine(r3,r2)
		r2 = r9
	}
	{
		r5:4 += mpyu(r7,r1)
	}
	{
		r1:0 = add(r5:4,r3:2)
		r4 = #1
	}
	{
		r2 = lsr(r0,#18)
		r3 = lsr(r1,#18)
		r0 = ##-1000000
	}
	{
		r2 = insert(r1,#18,#14)
	}
	{
		r27:26 = mpyu(r2,r0)
	}
	{
		r27 -= mpyi(r2,#1)
	}
	{
		r27 += mpyi(r0,r3)
		r1:0 = combine(r16,r17)
	}
	{
		call ##halide_int64_to_string
		r21:20 = add(r27:26,r7:6)
	}
	{
		r2 = add(pc,##.L.str.30.66@PCREL)
		r1 = r16
	}
	{
		call ##halide_string_to_string
	}
	{
		r3:2 = combine(r21,r20)
		r4 = #6
		r1 = r16
	}
	{
		call ##halide_int64_to_string
	}
	{
		p0 = cmp.gt(r18,#-1); if (!p0.new) jump:nt .LBB88_30
	}
// %bb.29:                              // %if.then53
	{
		r2 = add(pc,##.L.str.11.19@PCREL)
		r1 = r16
	}
	{
		call ##halide_string_to_string
	}
	{
		jump .LBB88_31
	}
.LBB88_6:                               // %if.else9
	{
		p0 = cmp.gt(r21:20,r1:0)
		if (!p0.new) jump:nt .LBB88_7
	}
// %bb.8:                               // %if.else13
	{
		r2 = add(pc,##.L.str.4.15@PCREL)
		jump .LBB88_4
	}
.LBB88_3:                               // %if.then6
	{
		r2 = add(pc,##.L.str.1.12@PCREL)
		jump .LBB88_4
	}
.LBB88_15:                              // %if.else26
	{
		p0 = cmp.gt(r21:20,r1:0)
		if (!p0.new) jump:nt .LBB88_16
	}
// %bb.17:                              // %if.else30
	{
		r2 = add(pc,##.L.str.8.18@PCREL)
		jump .LBB88_4
	}
.LBB88_32:                              // %if.else61
	{
		if (p1) jump:nt .LBB88_33
	}
// %bb.34:                              // %if.end65
	{
		r21 = setbit(r23,#20)
		p0 = cmp.gtu(r24,##1074)
		r19:18 = combine(#0,#0)
	}
	{
		r22 = add(r24,#-1075)
		if (p0) jump:nt .LBB88_35
	}
// %bb.36:                              // %if.then71
	{
		p0 = cmp.gtu(r24,##1022)
		r26 = #0
		r23 = #0
	}
	{
		if (p0) jump:nt .LBB88_38
	}
// %bb.37:
	{
		r27 = #0
		jump .LBB88_39
	}
.LBB88_7:                               // %if.then11
	{
		r2 = add(pc,##.L.str.3.14@PCREL)
		jump .LBB88_4
	}
.LBB88_13:                              // %if.then22
	{
		r2 = add(pc,##.L.str.5.16@PCREL)
		jump .LBB88_4
	}
.LBB88_30:                              // %if.else55
	{
		r2 = add(pc,##.L.str.12@PCREL)
		r1 = r16
	}
	{
		call ##halide_string_to_string
		r18 = sub(#0,r18)
	}
.LBB88_31:                              // %if.end58
	{
		r1 = r16
		r19 = #0
		r4 = #2
	}
	{
		r3:2 = combine(r19,r18)
		jump .LBB88_54
	}
.LBB88_16:                              // %if.then28
	{
		r2 = add(pc,##.L.str.7@PCREL)
	}
.LBB88_4:                               // %cleanup147
	{
		call ##halide_string_to_string
		r1:0 = combine(r16,r17)
	}
	{
		jump .LBB88_55
	}
.LBB88_33:                              // %if.then63
	{
		r1:0 = combine(r16,r17)
		r4 = #0
		r3:2 = combine(#0,#0)
	}
	{
		call ##halide_double_to_string
	}
	{
		jump .LBB88_55
	}
.LBB88_35:
	{
		r23 = r22 ; jump .LBB88_40
	}
.LBB88_38:                              // %if.else75
	{
		r0 = sub(##1075,r24)
	}
	{
		r27:26 = lsr(r21:20,r0)
	}
	{
		r21:20 -= asl(r27:26,r0)
	}
.LBB88_39:                              // %if.end83
	{
		r3:2 = convert_ud2df(r21:20)
		r1 = ##1093567616
		r0 = #0
	}
	{
		r1:0 += asl(r23:22,#52)
		call ##__hexagon_muldf3
	}
	{
		r3 = ##1071644672
		r2 = #0
	}
	{
		call ##__hexagon_adddf3
	}
	{
		r3:2 = convert_df2ud(r1:0):chop
		r5:4 = combine(#0,#1)
	}
	{
		r5:4 = add(r27:26,r5:4)
	}
	{
		r7:6 = convert_ud2df(r3:2)
		p0 = tstbit(r2,#0)
	}
	{
		p1 = dfcmp.eq(r1:0,r7:6)
	}
	{
		p0 = and(p1,p0)
	}
	{
		r0 = mux(p0,#-1,#0)
	}
	{
		r1:0 = add(r1:0,r3:2):raw:lo
		r2 = ##1000000
		r3 = #0
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
	}
	{
		r20 = mux(p0,r4,r26)
		r18 = mux(p0,r23,r0)
		r21 = mux(p0,r5,r27)
		r19 = mux(p0,r23,r1)
	}
.LBB88_40:                              // %if.end104
	{
		r3:2 = combine(r21,r20)
		r4 = #1
		r0 = add(r29,#8)
	}
	{
		r20 = add(r0,#480)
		r1 = add(r0,#512)
	}
	{
		call ##halide_int64_to_string
		r0 = r20
	}
	{
		p0 = cmp.gt(r23,#0); if (!p0.new) jump:nt .LBB88_41
	}
// %bb.42:
	{
		loop1(.LBB88_43,r23)
		r1 = #49 ; jump .LBB88_43
	}
	.p2align	4
.LBB88_51:                              // %for.cond.cleanup114
                                        //   in Loop: Header=BB88_43 Depth=1
	{
		if (p0) r2 = add(r20,#-1)
		if (!p0) r2 = add(r20,#0)
		if (p0) memb(r20+##-1) = r1
	}
.LBB88_52:                              // %if.end137
                                        //   in Loop: Header=BB88_43 Depth=1
	{
		r20 = r2
		nop
		nop
	} :endloop1
	{
		jump .LBB88_53
	}
.Ltmp2:                                 // Block address taken
.LBB88_43:                              // %for.cond111.preheader
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB88_46 Depth 2
                                        //     Child Loop BB88_50 Depth 2
	{
		r2 = r0
		p0 = cmp.eq(r0,r20); if (p0.new) jump:nt .LBB88_52
	}
// %bb.44:                              // %for.body115.preheader
                                        //   in Loop: Header=BB88_43 Depth=1
	{
		r2 = sub(#-1,r20)
		r3 = sub(r0,r20)
	}
	{
		r4 = r0
		r2 = add(r2,r0)
	}
	{
		r2 = #0
		p1 = cmp.gtu(r2,#6); if (!p1.new) jump:t .LBB88_48
	}
// %bb.45:                              // %for.body115.preheader.new
                                        //   in Loop: Header=BB88_43 Depth=1
	{
		r4 = and(r3,#-8)
		r6 = memub(r0+#-1)
		r7 = memub(r0+#-2)
	}
	{
		r6 = add(r6,#-48)
		r4 = sub(#0,r4)
	}
	{
		r5 = sub(#0,r4)
		r4 = #0
		r7 = add(r7,#-48)
		r6 = sxtb(r6)
	}
	{
		r4 |= asl(r6,#1)
		r5 = lsr(r5,#3)
		r7 = sxtb(r7)
		r8 = memub(r0+#-3)
	}
	{
		r6 = asl(r7,#1)
		r7 = sxtb(r4)
		r8 = add(r8,#-48)
		r9 = memub(r0+#-4)
	}
	{
		r12 = setbit(r6,#0)
		p1 = cmp.gt(r7,#9)
		r7 = sxtb(r8)
		r9 = add(r9,#-48)
	}
	{
		r6 = asl(r7,#1)
		if (!p1) r12 = add(r6,#0)
		if (p1) r4 = add(r4,##246)
	}
	{
		r8 = setbit(r6,#0)
		p0 = cmp.gtu(r5,#1)
		r7 = sxtb(r12)
		r4 = add(r4,#48)
	}
	{
		p2 = cmp.gt(r7,#9)
		r7 = sxtb(r9)
		r5 = add(r5,#-1)
		memb(r0+#-1) = r4
	}
	{
		r6 = asl(r7,#1)
		if (!p2) r8 = add(r6,#0)
		r7 = memub(r0+#-5)
	}
	{
		if (p2) r12 = add(r12,##246)
		r9 = sxtb(r8)
		r7 = add(r7,#-48)
	}
	{
		loop0(##.LBB88_46,r5)
		r13 = setbit(r6,#0)
		p3 = cmp.gt(r9,#9)
	}
	{
		r7 = sxtb(r7)
		r5 = r0
		if (!p3) r13 = add(r6,#0)
		r9 = memub(r0+#-6)
	}
	{
		r6 = asl(r7,#1)
		r7 = add(r9,#-48)
		if (p3) r8 = add(r8,##246)
	}
	{
		r14 = setbit(r6,#0)
		r9 = sxtb(r13)
		r7 = sxtb(r7)
		r8 = add(r8,#48)
	}
	{
		r7 = asl(r7,#1)
		p1 = cmp.gt(r9,#9)
		r9 = memub(r0+#-7)
		memb(r0+#-3) = r8
	}
	{
		r15 = setbit(r7,#0)
		if (!p1) r14 = add(r6,#0)
		r6 = add(r9,#-48)
	}
	{
		if (p1) r13 = add(r13,##246)
		r9 = sxtb(r14)
		r6 = sxtb(r6)
	}
	{
		r4 = asl(r6,#1)
		p2 = cmp.gt(r9,#9)
		r6 = add(r12,#48)
		memb(r0+#-2) = r6.new
	}
	{
		r6 = setbit(r4,#0)
		if (!p2) r15 = add(r7,#0)
		r7 = memub(r0+#-8)
	}
	{
		if (p2) r14 = add(r14,##246)
		r9 = sxtb(r15)
		r7 = add(r7,#-48)
	}
	{
		p1 = cmp.gt(r9,#9)
		r7 = sxtb(r7)
		r9 = add(r14,#48)
		memb(r0+#-5) = r9.new
	}
	{
		if (!p1) r6 = add(r4,#0)
		r4 = add(r13,#48)
		memb(r0+#-4) = r4.new
	}
	{
		r4 = asl(r7,#1)
		if (p1) r15 = add(r15,##246)
		r8 = sxtb(r6)
	}
	{
		r7 = setbit(r4,#0)
		p1 = cmp.gt(r8,#9)
		r8 = add(r15,#48)
		memb(r0+#-6) = r8.new
	}
	{
		if (!p1) r7 = add(r4,#0)
		if (p1) r6 = add(r6,##246)
		r4 = add(r0,#-8)
	}
	{
		r8 = r0
		if (!p0) jump:nt .LBB88_47
	}
	.p2align	4
.LBB88_46:                              // %for.body115
                                        //   Parent Loop BB88_43 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	{
		r9 = sxtb(r7)
		r6 = add(r6,#48)
		r5 = r4
		r12 = memub(r4+#-1)
	}
	{
		p0 = cmp.gt(r9,#9)
		r6 = add(r12,#-48)
		r9 = memub(r5+#-2)
		memb(r8+#-7) = r6
	}
	{
		r6 = sxtb(r6)
		r9 = add(r9,#-48)
		if (p0) r7 = add(r7,##246)
	}
	{
		r12 = mux(p0,#1,#0)
		r7 = add(r7,#48)
		r13 = memub(r5+#-3)
		memb(r8+#-8) = r7.new
	}
	{
		r12 |= asl(r6,#1)
		r6 = sxtb(r9)
		r7 = add(r13,#-48)
		r8 = memub(r5+#-4)
	}
	{
		r6 = asl(r6,#1)
		r9 = sxtb(r12)
		r7 = sxtb(r7)
		r8 = add(r8,#-48)
	}
	{
		r9 = setbit(r6,#0)
		r7 = asl(r7,#1)
		p0 = cmp.gt(r9,#9)
		r8 = sxtb(r8)
	}
	{
		r6 = setbit(r7,#0)
		if (!p0) r9 = add(r6,#0)
		if (p0) r12 = add(r12,##246)
	}
	{
		r11 = sxtb(r9)
		r12 = add(r12,#48)
		r10 = memub(r5+#-5)
	}
	{
		r13 = add(r10,#-48)
		p0 = cmp.gt(r11,#9)
		memb(r5+#-1) = r12
	}
	{
		r22 = sxtb(r13)
		r4 = add(r4,#-8)
		if (!p0) r6 = add(r7,#0)
		r23 = memub(r5+#-6)
	}
	{
		r7 = asl(r8,#1)
		r8 = asl(r22,#1)
		if (p0) r9 = add(r9,##246)
	}
	{
		r12 = setbit(r7,#0)
		r24 = sxtb(r6)
		r13 = add(r23,#-48)
		r9 = add(r9,#48)
	}
	{
		p0 = cmp.gt(r24,#9)
		if (!p0.new) r12 = add(r7,#0)
		r25 = memub(r5+#-7)
		memb(r5+#-2) = r9
	}
	{
		if (p0) r6 = add(r6,##246)
		r7 = sxtb(r12)
		r26 = memub(r5+#-8)
	}
	{
		r7 = setbit(r8,#0)
		r6 = add(r6,#48)
		p1 = cmp.gt(r7,#9)
		memb(r5+#-3) = r6.new
	}
	{
		if (!p1) r7 = add(r8,#0)
		r8 = sxtb(r13)
		r13 = add(r25,#-48)
	}
	{
		r8 = asl(r8,#1)
		if (p1) r12 = add(r12,##246)
		r9 = sxtb(r7)
	}
	{
		r9 = setbit(r8,#0)
		r12 = add(r12,#48)
		p0 = cmp.gt(r9,#9)
		memb(r5+#-4) = r12.new
	}
	{
		if (!p0) r9 = add(r8,#0)
		r8 = sxtb(r13)
		r13 = add(r26,#-48)
	}
	{
		r8 = asl(r8,#1)
		if (p0) r7 = add(r7,##246)
		r6 = sxtb(r9)
	}
	{
		r6 = setbit(r8,#0)
		r7 = add(r7,#48)
		p1 = cmp.gt(r6,#9)
		memb(r5+#-5) = r7.new
	}
	{
		if (!p1) r6 = add(r8,#0)
		r8 = sxtb(r13)
		if (p1) r9 = add(r9,##246)
	}
	{
		r8 = asl(r8,#1)
		r27 = sxtb(r6)
		r9 = add(r9,#48)
		memb(r5+#-6) = r9.new
	}
	{
		r7 = setbit(r8,#0)
		p0 = cmp.gt(r27,#9)
	}
	{
		if (!p0) r7 = add(r8,#0)
		if (p0) r6 = add(r6,##246)
		r8 = r5
	} :endloop0
.LBB88_47:                              //   in Loop: Header=BB88_43 Depth=1
	{
		r8 = sxtb(r7)
		r6 = add(r6,#48)
		memb(r5+#-7) = r6.new
	}
	{
		p0 = cmp.gt(r8,#9)
		if (p0.new) r7 = add(r7,##246)
	}
	{
		r2 = mux(p0,#1,#0)
		r6 = add(r7,#48)
		memb(r5+#-8) = r6.new
	}
.LBB88_48:                              // %for.cond.cleanup114.unr-lcssa
                                        //   in Loop: Header=BB88_43 Depth=1
	{
		r5 = and(r3,#7)
		if (cmp.eq(r5.new,#0)) jump:nt ##.LBB88_51
	}
// %bb.49:                              // %for.body115.epil.preheader
                                        //   in Loop: Header=BB88_43 Depth=1
	{
		loop0(.LBB88_50,r5)
		r3 = add(r4,#-1)
	}
	.p2align	4
.Ltmp3:                                 // Block address taken
.LBB88_50:                              // %for.body115.epil
                                        //   Parent Loop BB88_43 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	{
		r4 = memub(r3+#0)
	}
	{
		r4 = add(r4,#-48)
	}
	{
		r4 = sxtb(r4)
	}
	{
		r2 |= asl(r4,#1)
	}
	{
		r4 = sxtb(r2)
	}
	{
		p0 = cmp.gt(r4,#9)
		if (p0.new) r2 = add(r2,##246)
	}
	{
		r2 = add(r2,#48)
		r4 = mux(p0,#1,#0)
		memb(r3++#-1) = r2.new
	}
	{
		r2 = r4
		nop
	} :endloop0
	{
		jump .LBB88_51
	}
.LBB88_41:
	{
		r2 = r20
	}
.LBB88_53:                              // %for.cond.cleanup
	{
		call ##halide_string_to_string
		r1:0 = combine(r16,r17)
	}
	{
		r2 = add(pc,##.L.str.30.66@PCREL)
		r1 = r16
	}
	{
		call ##halide_string_to_string
	}
	{
		r3:2 = combine(r19,r18)
		r4 = #6
		r1 = r16
	}
.LBB88_54:                              // %cleanup147
	{
		call ##halide_int64_to_string
	}
.LBB88_55:                              // %cleanup147
	{
		r17:16 = memd(r29+#584)
		r19:18 = memd(r29+#576)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#568)
		r23:22 = memd(r29+#560)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#552)
		r27:26 = memd(r29+#544)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Ltmp4:                                 // Address of block that was removed by CodeGen
.Lfunc_end88:
	.size	halide_double_to_string, .Lfunc_end88-halide_double_to_string
                                        // -- End function
	.section	.text.halide_pointer_to_string,"ax",@progbits
	.weak	halide_pointer_to_string        // -- Begin function halide_pointer_to_string
	.p2align	4
	.type	halide_pointer_to_string,@function
halide_pointer_to_string:               // @halide_pointer_to_string
// %bb.0:                               // %entry
	{
		r4 = add(pc,##.L.str.13@PCREL)
		r3 = and(r2,#15)
		allocframe(r29,#24):raw
	}
	{
		r7:6 = combine(#0,#0)
		r5 = add(r29,#0)
		p0 = cmp.gtu(r2,#15)
		memw(r29+#16) = #0
	}
	{
		r3 = memub(r4+r3<<#0)
		memb(r29+#18) = r3.new
	}
	{
		r3 = add(r5,#17)
		if (p0) jump:nt .LBB89_2
		memd(r29+#8) = r7:6
		memd(r29+#0) = r7:6
	}
// %bb.1:
	{
		r4 = add(r5,#18)
		jump .LBB89_10
	}
.LBB89_2:                               // %for.inc
	{
		r6 = extractu(r2,#4,#4)
		p0 = cmp.gtu(r2,#255)
		r5 = add(r5,#16)
	}
	{
		if (!p0) jump:nt .LBB89_9
		r6 = memub(r4+r6<<#0)
		memb(r29+#17) = r6.new
	}
// %bb.3:                               // %for.inc.1
	{
		r3 = extractu(r2,#4,#8)
		r2 = lsr(r2,#12)
		r6 = add(r29,#0)
	}
	{
		p0 = cmp.eq(r2,#0)
	}
	{
		r3 = memub(r4+r3<<#0)
		memb(r29+#16) = r3.new
	}
	{
		r3 = add(r6,#15)
		if (p0) jump:nt .LBB89_4
	}
// %bb.5:                               // %for.inc.2
	{
		r5 = extractu(r2,#16,#4)
		r7 = and(r2,#15)
	}
	{
		p0 = cmp.eq(r5,#0)
		r5 = add(r6,#14)
		r6 = memub(r4+r7<<#0)
		memb(r29+#15) = r6.new
	}
	{
		if (p0) jump:nt .LBB89_9
	}
// %bb.6:                               // %for.inc.3
	{
		r7 = extractu(r2,#12,#8)
		r8 = extractu(r2,#4,#4)
		r6 = add(r29,#0)
	}
	{
		r3 = add(r6,#13)
	}
	{
		p0 = cmp.eq(r7,#0); if (!p0.new) jump:t .LBB89_8
		r7 = memub(r4+r8<<#0)
		memb(r29+#14) = r7.new
	}
.LBB89_4:
	{
		r4 = r5 ; jump .LBB89_10
	}
.LBB89_8:                               // %for.inc.4
	{
		r5 = extractu(r2,#8,#12)
		r7 = extractu(r2,#4,#8)
	}
	{
		p0 = cmp.eq(r5,#0)
		r5 = add(r6,#12)
		r6 = memub(r4+r7<<#0)
		memb(r29+#13) = r6.new
	}
	{
		if (!p0) jump:nt .LBB89_11
	}
.LBB89_9:
	{
		r4 = r3
		r3 = r5
	}
.LBB89_10:                              // %cleanup
	{
		r2 = add(r4,#-2)
		r5 = #48
		memb(r3+#0) = #120
	}
	{
		call ##halide_string_to_string
		memb(r4+#-2) = r5
	}
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB89_11:                              // %for.inc.5
	{
		r3 = extractu(r2,#4,#16)
		r6 = extractu(r2,#4,#12)
		r2 = add(r29,#0)
	}
	{
		p0 = cmp.eq(r3,#0); if (!p0.new) jump:t .LBB89_13
		r6 = memub(r4+r6<<#0)
		memb(r29+#12) = r6.new
	}
// %bb.12:
	{
		r4 = r5 ; jump .LBB89_10
		r3 = add(r2,#11)
	}
.LBB89_13:                              // %for.inc.6
	{
		r4 = add(r29,#3)
		r3 = memub(r4+r3<<#0)
		memb(r29+#11) = r3.new
	}
	{
		r3 = setbit(r2,#1)
		memb(r29+#10) = #48
		memh(r29+#8) = ##12336
	}
	{
		jump .LBB89_10
		memw(r29+#4) = ##808464432
		memb(r29+#3) = #48
	}
.Lfunc_end89:
	.size	halide_pointer_to_string, .Lfunc_end89-halide_pointer_to_string
                                        // -- End function
	.section	.text.halide_type_to_string,"ax",@progbits
	.weak	halide_type_to_string           // -- Begin function halide_type_to_string
	.p2align	4
	.type	halide_type_to_string,@function
halide_type_to_string:                  // @halide_type_to_string
// %bb.0:                               // %entry
	{
		r17:16 = combine(r1,r2)
		memd(r29+#-16) = r17:16
		allocframe(#16)
	}                                       // 8-byte Folded Spill
	{
		r2 = memb(r2+#0)
	}
	{
		memd(r29+#0) = r19:18
	}                                       // 8-byte Folded Spill
	{
		p0 = cmp.gtu(r2,#3); if (p0.new) jump:t .LBB90_1
	}
// %bb.2:                               // %switch.lookup
	{
		r1 = add(pc,##.Lswitch.table.halide_type_to_string@PCREL)
	}
	{
		jump .LBB90_3
		r2 = memw(r1+r2<<#2)
	}
.LBB90_1:
	{
		r2 = add(pc,##.L.str.18@PCREL)
	}
.LBB90_3:                               // %sw.epilog
	{
		call ##halide_string_to_string
		r1 = r17
	}
	{
		r1 = r17
		r4 = #1
		r19 = #0
		r18 = memub(r16+#1)
	}
	{
		call ##halide_uint64_to_string
		r3:2 = combine(r19,r18)
	}
	{
		r1 = memh(r16+#2)
	}
	{
		p0 = cmp.eq(r1,#1)
		if (p0.new) r17:16 = memd(r29+#8)
		if (p0.new) r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		if (p0) r31:30 = dealloc_return(r30):raw
	}
.LBB90_4:                               // %if.then
	{
		r2 = add(pc,##.L.str.19@PCREL)
		r1 = r17
	}
	{
		call ##halide_string_to_string
	}
	{
		r1 = r17
		r4 = #1
		r18 = memuh(r16+#2)
		r17:16 = memd(r29+#8)
	}                                       // 8-byte Folded Reload
	{
		r3:2 = combine(r19,r18)
		r19:18 = memd(r29+#0)
		deallocframe
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_uint64_to_string
	}
.Lfunc_end90:
	.size	halide_type_to_string, .Lfunc_end90-halide_type_to_string
                                        // -- End function
	.section	.text.halide_buffer_to_string,"ax",@progbits
	.weak	halide_buffer_to_string         // -- Begin function halide_buffer_to_string
	.p2align	4
	.type	halide_buffer_to_string,@function
halide_buffer_to_string:                // @halide_buffer_to_string
// %bb.0:                               // %entry
	{
		p0 = cmp.eq(r2,#0)
		r16 = r1
		memd(r29+#-16) = r17:16
		allocframe(#40)
	}                                       // 8-byte Folded Spill
	{
		memd(r29+#24) = r19:18
		memd(r29+#16) = r21:20
	}                                       // 8-byte Folded Spill
	{
		if (p0) jump:nt .LBB91_1
		memd(r29+#8) = r23:22
		memd(r29+#0) = r25:24
	}                                       // 8-byte Folded Spill
// %bb.3:                               // %if.end
	{
		r2 = add(pc,##.L.str.21@PCREL)
		r17 = r2
		r1 = r16
	}
	{
		call ##halide_string_to_string
	}
	{
		r1 = r16
		r4 = #1
		r3:2 = memd(r17+#0)
	}
	{
		r18 = add(pc,##.L.str.55@PCREL)
		call ##halide_uint64_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r16
		r2 = r18
	}
	{
		call ##halide_pointer_to_string
		r1 = r16
		r2 = memw(r17+#8)
	}
	{
		call ##halide_string_to_string
		r1 = r16
		r2 = r18
	}
	{
		call ##halide_pointer_to_string
		r1 = r16
		r2 = memw(r17+#12)
	}
	{
		call ##halide_string_to_string
		r1 = r16
		r2 = r18
	}
	{
		r1 = r16
		r4 = #1
		r3:2 = memd(r17+#16)
	}
	{
		call ##halide_uint64_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r16
		r2 = r18
	}
	{
		call ##halide_type_to_string
		r2 = add(r17,#24)
		r1 = r16
	}
	{
		r1 = memw(r17+#28)
		if (!cmp.gt(r1.new,#0)) jump:t .LBB91_6
	}
// %bb.4:
	{
		r18 = add(pc,##.L.str.23@PCREL)
		r23:22 = combine(#0,#0)
		r25:24 = combine(#0,#1)
	}
	{
		r19 = add(pc,##.L.str.55@PCREL)
	}
	{
		r20 = add(pc,##.L.str.24@PCREL)
	}
	.p2align	4
.LBB91_5:                               // %for.body
                                        // =>This Inner Loop Header: Depth=1
	{
		call ##halide_string_to_string
		r1 = r16
		r2 = r18
	}
	{
		r2 = asl(r22,#4)
		r4 = #1
		r1 = memw(r17+#32)
	}
	{
		r1 = r16
		r2 = memw(r1+r2<<#0)
	}
	{
		call ##halide_int64_to_string
		r3 = asr(r2,#31)
	}
	{
		call ##halide_string_to_string
		r1 = r16
		r2 = r19
	}
	{
		r4 = #1
		r1 = memw(r17+#32)
	}
	{
		r1 = addasl(r1,r22,#4)
	}
	{
		r1 = r16
		r2 = memw(r1+#4)
	}
	{
		call ##halide_int64_to_string
		r3 = asr(r2,#31)
	}
	{
		call ##halide_string_to_string
		r1 = r16
		r2 = r19
	}
	{
		r4 = #1
		r1 = memw(r17+#32)
	}
	{
		r1 = addasl(r1,r22,#4)
	}
	{
		r1 = r16
		r2 = memw(r1+#8)
	}
	{
		call ##halide_int64_to_string
		r3 = asr(r2,#31)
	}
	{
		call ##halide_string_to_string
		r1 = r16
		r2 = r20
	}
	{
		r23:22 = add(r23:22,r25:24)
		r1 = memw(r17+#28)
	}
	{
		r3:2 = sxtw(r1)
	}
	{
		p0 = cmp.gt(r3:2,r23:22)
		if (p0.new) jump:t .LBB91_5
	}
.LBB91_6:                               // %for.cond.cleanup
	{
		r2 = add(pc,##.L.str.8.44@PCREL)
		jump .LBB91_2
	}
.LBB91_1:                               // %if.then
	{
		r2 = add(pc,##.L.str.20@PCREL)
	}
.LBB91_2:                               // %if.then
	{
		r1 = r16
		r17:16 = memd(r29+#32)
		r19:18 = memd(r29+#24)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#16)
		r23:22 = memd(r29+#8)
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_string_to_string
		r25:24 = memd(r29+#0)
		r31:30 = deallocframe(r30):raw
	}                                       // 8-byte Folded Reload
.Lfunc_end91:
	.size	halide_buffer_to_string, .Lfunc_end91-halide_buffer_to_string
                                        // -- End function
	.section	.text.halide_malloc_alignment,"ax",@progbits
	.weak	halide_malloc_alignment         // -- Begin function halide_malloc_alignment
	.p2align	4
	.type	halide_malloc_alignment,@function
halide_malloc_alignment:                // @halide_malloc_alignment
// %bb.0:                               // %entry
	{
		r0 = #128
		jumpr r31
	}
.Lfunc_end92:
	.size	halide_malloc_alignment, .Lfunc_end92-halide_malloc_alignment
                                        // -- End function
	.section	.text.halide_reuse_device_allocations,"ax",@progbits
	.weak	halide_reuse_device_allocations // -- Begin function halide_reuse_device_allocations
	.p2align	4
	.type	halide_reuse_device_allocations,@function
halide_reuse_device_allocations:        // @halide_reuse_device_allocations
// %bb.0:                               // %entry
	{
		p0 = tstbit(r1,#0)
		r17:16 = combine(#0,r0)
		memd(r29+#-16) = r17:16
		allocframe(#16)
	}                                       // 8-byte Folded Spill
	{
		r18 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		memd(r29+#0) = r19:18
	}                                       // 8-byte Folded Spill
	{
		r2 = memw(r18+##_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE@GOT)
	}
	{
		if (p0) jump:nt .LBB93_3
		memb(r2+#0) = r1
	}
// %bb.1:                               // %if.then
	{
		call ##halide_mutex_lock
		r0 = memw(r18+##_ZN6Halide7Runtime8Internal21allocation_pools_lockE@GOT)
	}
	{
		r17 = #0
		r0 = memw(r18+##_ZN6Halide7Runtime8Internal23device_allocation_poolsE@GOT)
	}
	{
		r19 = memw(r0+#0)
		if (cmp.eq(r19.new,#0)) jump:t .LBB93_2
	}
	.p2align	4
.LBB93_4:                               // %for.body
                                        // =>This Inner Loop Header: Depth=1
	{
		r0 = r16
		r1 = memw(r19+#0)
	}
	{
		callr r1
	}
	{
		p0 = cmp.eq(r0,#0)
		if (!p0.new) r17 = add(r0,#0)
		r19 = memw(r19+#4)
		if (!cmp.eq(r19.new,#0)) jump:t .LBB93_4
	}
.LBB93_2:                               // %for.cond.cleanup
	{
		call ##halide_mutex_unlock
		r0 = memw(r18+##_ZN6Halide7Runtime8Internal21allocation_pools_lockE@GOT)
	}
.LBB93_3:                               // %if.end5
	{
		r0 = r17
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end93:
	.size	halide_reuse_device_allocations, .Lfunc_end93-halide_reuse_device_allocations
                                        // -- End function
	.section	.text.halide_can_reuse_device_allocations,"ax",@progbits
	.weak	halide_can_reuse_device_allocations // -- Begin function halide_can_reuse_device_allocations
	.p2align	4
	.type	halide_can_reuse_device_allocations,@function
halide_can_reuse_device_allocations:    // @halide_can_reuse_device_allocations
// %bb.0:                               // %entry
	{
		r0 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
	}
	{
		r0 = memw(r0+##_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE@GOT)
	}
	{
		r0 = memub(r0+#0)
		jumpr r31
	}
.Lfunc_end94:
	.size	halide_can_reuse_device_allocations, .Lfunc_end94-halide_can_reuse_device_allocations
                                        // -- End function
	.section	.text.halide_register_device_allocation_pool,"ax",@progbits
	.weak	halide_register_device_allocation_pool // -- Begin function halide_register_device_allocation_pool
	.p2align	4
	.type	halide_register_device_allocation_pool,@function
halide_register_device_allocation_pool: // @halide_register_device_allocation_pool
// %bb.0:                               // %entry
	{
		r16 = r0
		memd(r29+#-16) = r17:16
		allocframe(#16)
	}                                       // 8-byte Folded Spill
	{
		r18 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		memd(r29+#0) = r19:18
	}                                       // 8-byte Folded Spill
	{
		r17 = memw(r18+##_ZN6Halide7Runtime8Internal21allocation_pools_lockE@GOT)
	}
	{
		call ##halide_mutex_lock
		r0 = r17
	}
	{
		r0 = r17
		r1 = memw(r18+##_ZN6Halide7Runtime8Internal23device_allocation_poolsE@GOT)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r2 = memw(r1+#0)
		memw(r16+#4) = r2.new
	}
	{
		r17:16 = memd(r29+#8)
		memw(r1+#0) = r16
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_mutex_unlock
		r31:30 = deallocframe(r30):raw
	}
.Lfunc_end95:
	.size	halide_register_device_allocation_pool, .Lfunc_end95-halide_register_device_allocation_pool
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx // -- Begin function _ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx
	.p2align	4
	.type	_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx,@function
_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx: // @_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx
// %bb.0:                               // %entry
	{
		p0 = cmp.gt(r1,#-1)
		r17:16 = combine(r5,r4)
		memd(r29+#-16) = r17:16
		allocframe(#48)
	}                                       // 8-byte Folded Spill
	{
		r18 = r0
		r21:20 = combine(r3,r2)
		memd(r29+#32) = r19:18
		memd(r29+#24) = r21:20
	}                                       // 8-byte Folded Spill
	{
		r0 = add(r0,#24)
		memd(r29+#16) = r23:22
		memd(r29+#8) = r25:24
	}                                       // 8-byte Folded Spill
	{
		if (!p0) jump:nt .LBB96_5
		memd(r29+#0) = r27:26
	}                                       // 8-byte Folded Spill
// %bb.1:                               // %land.rhs.preheader
	{
		r4 = asl(r1,#3)
		r5 = add(r1,#1)
		r3:2 = combine(#0,#1)
	}
	{
		loop0(.LBB96_2,r5)
		r4 = add(r4,add(r18,#24))
	}
.Ltmp5:                                 // Block address taken
.LBB96_2:                               // %land.rhs
                                        // =>This Inner Loop Header: Depth=1
	{
		r7:6 = memd(r4+#0)
	}
	{
		p0 = cmp.eq(r7:6,r3:2)
		if (!p0.new) jump:t .LBB96_7
	}
// %bb.3:                               // %while.body
                                        //   in Loop: Header=BB96_2 Depth=1
	{
		nop
		r4 = add(r4,#-8)
		r1 = add(r1,#-1)
	} :endloop0
	{
		jump .LBB96_4
	}
.LBB96_5:                               // %while.end
	{
		p0 = cmp.eq(r1,#-1); if (p0.new) jump:nt .LBB96_4
	}
// %bb.6:                               // %while.end.for.cond.preheader_crit_edge
	{
		r7:6 = memd(r0+r1<<#3)
	}
.LBB96_7:                               // %for.cond.preheader
	{
		r23:22 = combine(#0,#0)
	}
	{
		p0 = cmp.eq(r7:6,r23:22)
		if (p0.new) jump:nt .LBB96_10
	}
// %bb.8:
	{
		r2 = addasl(r18,r1,#3)
		r24 = addasl(r0,r1,#3)
		r19 = add(r1,#-1)
	}
	{
		r25 = add(r2,#152)
		r26 = add(r2,#280)
	}
	.p2align	4
.LBB96_9:                               // %for.body
                                        // =>This Inner Loop Header: Depth=1
	{
		r1:0 = combine(r19,r18)
		r3:2 = combine(r21,r20)
		r5:4 = combine(r17,r16)
	}
	{
		call ##_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx
	}
	{
		r3:2 = combine(#0,#1)
		r1:0 = memd(r24+#0)
		r7:6 = memd(r25+#0)
	}
	{
		r23:22 = add(r23:22,r3:2)
		r21:20 = add(r7:6,r21:20)
		r5:4 = memd(r26+#0)
	}
	{
		p0 = cmp.gtu(r1:0,r23:22)
		r17:16 = add(r5:4,r17:16)
		if (p0.new) jump:t .LBB96_9
	}
.LBB96_10:                              // %if.end
	{
		r17:16 = memd(r29+#40)
		r19:18 = memd(r29+#32)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#24)
		r23:22 = memd(r29+#16)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#8)
		r27:26 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB96_4:                               // %if.then
	{
		r1:0 = memd(r18+#0)
		r3:2 = memd(r18+#8)
	}
	{
		r5:4 = add(r1:0,r21:20)
		r1:0 = add(r3:2,r17:16)
		r3:2 = memd(r18+#408)
		r17:16 = memd(r29+#40)
	}                                       // 8-byte Folded Reload
	{
		r1 = r4
		r19:18 = memd(r29+#32)
		r21:20 = memd(r29+#24)
	}                                       // 8-byte Folded Reload
	{
		r23:22 = memd(r29+#16)
		r25:24 = memd(r29+#8)
	}                                       // 8-byte Folded Reload
	{
		jump ##memcpy
		r27:26 = memd(r29+#0)
		r31:30 = deallocframe(r30):raw
	}                                       // 8-byte Folded Reload
.Lfunc_end96:
	.size	_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx, .Lfunc_end96-_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv // -- Begin function _ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv
	.p2align	4
	.type	_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv,@function
_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv: // @_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv
// %bb.0:                               // %entry
	{
		r3:2 = memd(r0+#0)
		r5:4 = memd(r0+#8)
	}
	{
		p0 = cmp.eq(r3:2,r5:4)
		if (p0.new) jumpr:nt r31
	}
.LBB97_1:                               // %if.then
	{
		r1 = #15
		r5:4 = combine(#0,#0)
		r3:2 = memd(r0+#16)
	}
	{
		jump ##_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx
	}
.Lfunc_end97:
	.size	_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv, .Lfunc_end97-_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b // -- Begin function _ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b
	.p2align	4
	.type	_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b,@function
_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b: // @_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b
// %bb.0:                               // %entry
	{
		p1 = tstbit(r2,#0)
		p0 = tstbit(r4,#0)
		r7:6 = combine(#0,#0)
		allocframe(r29,#512):raw
	}
	{
		r13:12 = combine(#0,#1)
		if (!p1) r5:4 = memd(r1+#0)
		r2 = memub(r1+#25)
	}
	{
		if (p1) r5 = #0
		if (p1) r4 = memw(r1+#12)
		r8 = memw(r1+#28)
	}
	{
		if (!p0) r5:4 = memd(r3+#0)
		memd(r29+#40) = r5:4
	}
	{
		if (p0) r5 = #0
		r2 = add(r2,#7)
		if (p0) r4 = memw(r3+#12)
		memw(r29+#36) = r2
	}                                       // 4-byte Folded Spill
	{
		r4 = lsr(r2,#3)
		p0 = cmp.gt(r8,#0)
		r5 = #0
		memd(r29+#48) = r5:4
	}
	{
		r15:14 = combine(r5,r5)
		memd(r29+#504) = r17:16
		memd(r29+#496) = r19:18
	}                                       // 8-byte Folded Spill
	{
		memd(r29+#488) = r21:20
		memd(r29+#480) = r23:22
	}                                       // 8-byte Folded Spill
	{
		memd(r29+#472) = r25:24
		memd(r29+#464) = r27:26
	}                                       // 8-byte Folded Spill
	{
		memd(r29+#64) = r13:12
		memd(r29+#192) = r7:6
	}
	{
		memd(r29+#320) = r7:6
		memd(r29+#200) = r7:6
	}
	{
		memd(r29+#328) = r7:6
		memd(r29+#72) = r13:12
	}
	{
		memd(r29+#80) = r13:12
		memd(r29+#208) = r7:6
	}
	{
		memd(r29+#336) = r7:6
		memd(r29+#88) = r13:12
	}
	{
		memd(r29+#216) = r7:6
		memd(r29+#344) = r7:6
	}
	{
		memd(r29+#96) = r13:12
		memd(r29+#224) = r7:6
	}
	{
		memd(r29+#352) = r7:6
		memd(r29+#104) = r13:12
	}
	{
		memd(r29+#232) = r7:6
		memd(r29+#360) = r7:6
	}
	{
		memd(r29+#112) = r13:12
		memd(r29+#240) = r7:6
	}
	{
		memd(r29+#368) = r7:6
		memd(r29+#120) = r13:12
	}
	{
		memd(r29+#248) = r7:6
		memd(r29+#376) = r7:6
	}
	{
		memd(r29+#448) = r5:4
		memd(r29+#128) = r13:12
	}
	{
		memd(r29+#256) = r7:6
		memd(r29+#384) = r7:6
	}
	{
		memd(r29+#136) = r13:12
		memd(r29+#264) = r7:6
	}
	{
		memd(r29+#392) = r7:6
		memd(r29+#144) = r13:12
	}
	{
		memd(r29+#272) = r7:6
		memd(r29+#400) = r7:6
	}
	{
		memd(r29+#152) = r13:12
		memd(r29+#280) = r7:6
	}
	{
		memd(r29+#408) = r7:6
		memd(r29+#160) = r13:12
	}
	{
		memd(r29+#288) = r7:6
		memd(r29+#416) = r7:6
	}
	{
		memd(r29+#168) = r13:12
		memd(r29+#296) = r7:6
	}
	{
		memd(r29+#424) = r7:6
		memd(r29+#176) = r13:12
	}
	{
		memd(r29+#304) = r7:6
		memd(r29+#184) = r13:12
	}
	{
		memd(r29+#432) = r7:6
		memd(r29+#312) = r7:6
	}
	{
		if (!p0) jump:nt .LBB98_7
		memd(r29+#440) = r7:6
		memd(r29+#24) = r5:4
	}                                       // 8-byte Folded Spill
// %bb.1:                               // %for.body19.lr.ph
	{
		r13 = #0
		r5:4 = combine(#-1,#-1)
		r15:14 = combine(#0,#7)
		r2 = memw(r3+#32)
	}
	{
		r9 = r13
		r12 = and(r8,#7)
	}
	{
		r5:4 = add(r9:8,r5:4)
	}
	{
		p1 = cmp.gtu(r15:14,r5:4)
		r15:14 = combine(#0,#0)
		if (p1.new) jump:t .LBB98_4
		r5 = memw(r1+#32)
	}
// %bb.2:                               // %for.body19.lr.ph.new
	{
		r4 = #-8
		r11:10 = combine(#0,#0)
		r17:16 = combine(#0,#8)
		r21:20 = combine(#-1,#-8)
	}
	{
		r18 = and(r8,r4)
		r15:14 = combine(#0,#0)
		r19 = #0
		r7:6 = combine(#0,#0)
	}
	.p2align	4
.LBB98_3:                               // %for.body19
                                        // =>This Inner Loop Header: Depth=1
	{
		r4 = addasl(r5,r6,#4)
		r9 = asl(r6,#4)
	}
	{
		r23 = setbit(r9,#4)
		r24 = setbit(r9,#5)
		r28 = memw(r2+r9<<#0)
		r22 = memw(r5+r9<<#0)
	}
	{
		r28 = sub(r28,r22)
		r22 = add(r5,r23)
		r26 = add(r5,r24)
		r4 = memw(r4+#8)
	}
	{
		r27 = setbit(r9,#6)
		r19:18 = add(r19:18,r21:20)
		r25 = memw(r2+r23<<#0)
		r23 = memw(r5+r23<<#0)
	}
	{
		r15:14 += mpy(r28,r4)
		r23 = sub(r25,r23)
		r22 = memw(r22+#8)
		r25 = memw(r26+#8)
	}
	{
		p1 = cmp.eq(r19:18,r11:10)
		r26 = or(r9,#48)
		r4 = memw(r2+r24<<#0)
		r28 = memw(r5+r24<<#0)
	}
	{
		r15:14 += mpy(r23,r22)
		r4 = sub(r4,r28)
		r24 = add(r5,r26)
		r22 = add(r5,r27)
	}
	{
		r15:14 += mpy(r4,r25)
		r7:6 = add(r7:6,r17:16)
		r28 = memw(r24+#8)
		r23 = memw(r2+r26<<#0)
	}
	{
		r26 = or(r9,#80)
		r4 = memw(r5+r26<<#0)
		r22 = memw(r22+#8)
	}
	{
		r4 = sub(r23,r4)
		r23 = memw(r2+r27<<#0)
		r27 = memw(r5+r27<<#0)
	}
	{
		r15:14 += mpy(r4,r28)
		r4 = sub(r23,r27)
		r28 = add(r5,r26)
		r23 = memw(r5+r26<<#0)
	}
	{
		r15:14 += mpy(r4,r22)
		r4 = or(r9,#96)
		r9 = or(r9,#112)
		r22 = memw(r2+r26<<#0)
	}
	{
		r27 = add(r5,r4)
		r22 = sub(r22,r23)
		r26 = add(r5,r9)
		r28 = memw(r28+#8)
	}
	{
		r23 = memw(r27+#8)
		r27 = memw(r2+r4<<#0)
	}
	{
		r15:14 += mpy(r22,r28)
		r4 = memw(r5+r4<<#0)
		r22 = memw(r2+r9<<#0)
	}
	{
		r4 = sub(r27,r4)
		r28 = memw(r26+#8)
		r9 = memw(r5+r9<<#0)
	}
	{
		r15:14 += mpy(r4,r23)
		r4 = sub(r22,r9)
	}
	{
		r15:14 += mpy(r4,r28)
		if (!p1) jump:nt .LBB98_3
	}
.LBB98_4:                               // %for.cond.cleanup18.loopexit.unr-lcssa
	{
		r11:10 = combine(#0,#0)
	}
	{
		p1 = cmp.eq(r13:12,r11:10)
		if (p1.new) jump:nt .LBB98_7
	}
// %bb.5:
	{
		r17:16 = combine(#0,#1)
		r19:18 = combine(#-1,#-1)
	}
	.p2align	4
.LBB98_6:                               // %for.body19.epil
                                        // =>This Inner Loop Header: Depth=1
	{
		r9 = addasl(r5,r6,#4)
		r4 = asl(r6,#4)
	}
	{
		r13:12 = add(r13:12,r19:18)
		r7:6 = add(r7:6,r17:16)
		r28 = memw(r2+r4<<#0)
		r4 = memw(r5+r4<<#0)
	}
	{
		p1 = cmp.eq(r13:12,r11:10)
		r4 = sub(r28,r4)
		r9 = memw(r9+#8)
	}
	{
		r15:14 += mpy(r4,r9)
		if (!p1) jump:nt .LBB98_6
	}
.LBB98_7:                               // %for.cond.cleanup18
	{
		r13:12 = memd(r29+#24)
		r2 = memw(r3+#28)
	}                                       // 8-byte Folded Reload
	{
		r5:4 = mpyu(r14,r12)
		p1 = cmp.eq(r8,r2)
	}
	{
		r5 += mpyi(r12,r15)
	}
	{
		if (!p1) jump:nt .LBB98_10
		memd(r29+#56) = r5:4
	}
// %bb.8:                               // %lor.lhs.false
	{
		r2 = memub(r3+#25)
	}
	{
		r2 = add(r2,#7)
	}
	{
		r2 = lsr(r2,#3)
		if (!cmp.eq(r2.new,r12)) jump:nt .LBB98_10
	}
// %bb.9:                               // %lor.lhs.false
	{
		p1 = cmp.gt(r8,#16)
		if (p1.new) jump:nt .LBB98_10
	}
// %bb.12:                              // %if.end
	{
		r2 = memw(r29+#36)
		if (cmp.eq(r2.new,#0)) jump:nt .LBB98_10
	}                                       // 4-byte Folded Reload
// %bb.13:                              // %for.cond54.preheader
	{
		if (!p0) jump:nt .LBB98_23
	}
// %bb.14:                              // %for.body58.lr.ph
	{
		r7:6 = combine(#0,r8)
		r9:8 = combine(#0,#0)
		r0 = add(r29,#40)
		memw(r29+#4) = r0
	}                                       // 4-byte Folded Spill
	{
		r5 = #0
		r10 = #-40
		r28 = #-48
		r18 = add(r0,#24)
	}
	{
		r19 = add(r0,#152)
		r20 = add(r0,#280)
		r21 = #-56
		r23:22 = combine(#-1,#-8)
	}
	{
		r25:24 = combine(#-1,#-1)
		r27:26 = combine(#0,#0)
		r17:16 = combine(#0,#1)
		r2 = memw(r3+#32)
	}
	{
		r1 = memw(r1+#32)
		memw(r29+#20) = r2
	}                                       // 4-byte Folded Spill
	{
		jump .LBB98_15
		memw(r29+#16) = r1
		memd(r29+#8) = r7:6
	}                                       // 4-byte Folded Spill
	.p2align	4
.LBB98_31:                              // %for.cond.cleanup94
                                        //   in Loop: Header=BB98_15 Depth=1
	{
		r2 = asr(r11,#31)
		r17:16 = combine(#0,#1)
		r0 = memw(r29+#36)
		r13:12 = memd(r29+#24)
	}                                       // 4-byte Folded Reload
	{
		r27:26 = add(r27:26,r17:16)
		r15:14 = memd(r29+#8)
	}                                       // 8-byte Folded Reload
	{
		r7:6 = mpyu(r11,r12)
		r0 = memw(r0+#4)
		memd(r20+r4<<#3) = r7:6
	}
	{
		r1 = asr(r0,#31)
		p0 = cmp.eq(r27:26,r15:14)
	}
	{
		r7 += mpyi(r12,r2)
		memd(r18+r4<<#3) = r1:0
	}
	{
		if (p0) jump:nt .LBB98_19
		memd(r19+r4<<#3) = r7:6
	}
.LBB98_15:                              // %for.body58
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB98_17 Depth 2
                                        //     Child Loop BB98_29 Depth 2
                                        //     Child Loop BB98_32 Depth 2
	{
		p0 = cmp.eq(r27:26,r9:8)
		r4 = r5
		r0 = memw(r29+#20)
	}                                       // 4-byte Folded Reload
	{
		r0 = addasl(r0,r26,#4)
		memw(r29+#36) = r0.new
	}                                       // 4-byte Folded Spill
	{
		r0 = memw(r0+#8)
	}
	{
		r1 = asr(r0,#31)
	}
	{
		r7:6 = mpyu(r0,r12)
	}
	{
		r7 += mpyi(r12,r1)
		if (p0) jump:nt .LBB98_26
	}
// %bb.16:                              // %for.body81.lr.ph
                                        //   in Loop: Header=BB98_15 Depth=1
	{
		r1:0 = combine(#0,#0)
		r4 = r26
	}
	{
		p0 = cmp.eq(r7:6,r1:0)
		if (p0.new) jump:nt .LBB98_26
	}
	.p2align	4
.LBB98_17:                              // %for.body81
                                        //   Parent Loop BB98_15 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	{
		r3:2 = memd(r20+r0<<#3)
	}
	{
		p0 = cmp.gtu(r3:2,r7:6)
		if (p0.new) jump:nt .LBB98_18
	}
// %bb.24:                              // %for.inc89
                                        //   in Loop: Header=BB98_17 Depth=2
	{
		r1:0 = add(r1:0,r17:16)
	}
	{
		p0 = cmp.eq(r1:0,r27:26)
		if (!p0.new) jump:t .LBB98_17
	}
// %bb.25:                              //   in Loop: Header=BB98_15 Depth=1
	{
		r4 = r26
		jump .LBB98_26
	}
.LBB98_18:                              //   in Loop: Header=BB98_15 Depth=1
	{
		r4 = r0
	}
	.p2align	4
.LBB98_26:                              // %for.end91
                                        //   in Loop: Header=BB98_15 Depth=1
	{
		p0 = cmp.gtu(r27:26,r5:4)
		r0 = memw(r29+#16)
	}                                       // 4-byte Folded Reload
	{
		r0 = addasl(r0,r26,#4)
	}
	{
		if (!p0) jump:nt .LBB98_31
		r11 = memw(r0+#8)
	}
// %bb.27:                              // %for.body95.preheader
                                        //   in Loop: Header=BB98_15 Depth=1
	{
		r1:0 = extract(r5:4,#32,#0)
		r13:12 = combine(#0,#7)
	}
	{
		r3:2 = sub(r27:26,r1:0)
	}
	{
		r3:2 = and(r3:2,r13:12)
		r13:12 = combine(r27,r26)
	}
	{
		p0 = cmp.eq(r3:2,r9:8)
		if (p0.new) jump:nt .LBB98_30
	}
// %bb.28:                              //   in Loop: Header=BB98_15 Depth=1
	{
		r15:14 = combine(r27,r26)
	}
	.p2align	4
.LBB98_29:                              // %for.body95.prol
                                        //   Parent Loop BB98_15 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	{
		r13:12 = add(r15:14,r25:24)
		r3:2 = add(r3:2,r25:24)
	}
	{
		p0 = cmp.eq(r3:2,r9:8)
		r17:16 = memd(r18+r12<<#3)
	}
	{
		memd(r18+r14<<#3) = r17:16
	}
	{
		r17:16 = memd(r20+r12<<#3)
	}
	{
		memd(r20+r14<<#3) = r17:16
	}
	{
		r17:16 = memd(r19+r12<<#3)
	}
	{
		r15:14 = combine(r13,r12)
		if (!p0) jump:nt .LBB98_29
		memd(r19+r14<<#3) = r17:16
	}
.LBB98_30:                              // %for.body95.prol.loopexit
                                        //   in Loop: Header=BB98_15 Depth=1
	{
		r3:2 = not(r1:0)
		r15:14 = combine(#0,#6)
		r17 = #-32
	}
	{
		r3:2 = add(r27:26,r3:2)
	}
	{
		p0 = cmp.gtu(r3:2,r15:14)
		r3 = #-16
		if (!p0.new) jump:t .LBB98_31
	}
	.p2align	4
.LBB98_32:                              // %for.body95
                                        //   Parent Loop BB98_15 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	{
		r3 = addasl(r3,r12,#3)
		r2 = r12
		r16 = #-24
	}
	{
		r2 = add(##-8,asl(r2,#3))
		r16 = addasl(r16,r12,#3)
	}
	{
		r15:14 = memd(r18+r2<<#0)
	}
	{
		memd(r18+r12<<#3) = r15:14
	}
	{
		r15:14 = memd(r20+r2<<#0)
	}
	{
		memd(r20+r12<<#3) = r15:14
	}
	{
		r15:14 = memd(r19+r2<<#0)
	}
	{
		memd(r19+r12<<#3) = r15:14
	}
	{
		r15:14 = memd(r18+r3<<#0)
	}
	{
		memd(r18+r2<<#0) = r15:14
	}
	{
		r15:14 = memd(r20+r3<<#0)
	}
	{
		memd(r20+r2<<#0) = r15:14
	}
	{
		r15:14 = memd(r19+r3<<#0)
	}
	{
		r2 = addasl(r17,r12,#3)
		memd(r19+r2<<#0) = r15:14
	}
	{
		r15:14 = memd(r18+r16<<#0)
	}
	{
		memd(r18+r3<<#0) = r15:14
	}
	{
		r15:14 = memd(r20+r16<<#0)
	}
	{
		memd(r20+r3<<#0) = r15:14
	}
	{
		r15:14 = memd(r19+r16<<#0)
	}
	{
		r3 = addasl(r10,r12,#3)
		memd(r19+r3<<#0) = r15:14
	}
	{
		r15:14 = memd(r18+r2<<#0)
	}
	{
		memd(r18+r16<<#0) = r15:14
	}
	{
		r15:14 = memd(r20+r2<<#0)
	}
	{
		memd(r20+r16<<#0) = r15:14
	}
	{
		r15:14 = memd(r19+r2<<#0)
	}
	{
		r16 = addasl(r28,r12,#3)
		memd(r19+r16<<#0) = r15:14
	}
	{
		r15:14 = memd(r18+r3<<#0)
	}
	{
		memd(r18+r2<<#0) = r15:14
	}
	{
		r15:14 = memd(r20+r3<<#0)
	}
	{
		memd(r20+r2<<#0) = r15:14
	}
	{
		r15:14 = memd(r19+r3<<#0)
	}
	{
		r2 = addasl(r21,r12,#3)
		r13:12 = add(r13:12,r23:22)
		memd(r19+r2<<#0) = r15:14
	}
	{
		p0 = cmp.gt(r13:12,r1:0)
		r15:14 = memd(r18+r16<<#0)
	}
	{
		memd(r18+r3<<#0) = r15:14
	}
	{
		r15:14 = memd(r20+r16<<#0)
	}
	{
		memd(r20+r3<<#0) = r15:14
	}
	{
		r15:14 = memd(r19+r16<<#0)
	}
	{
		r3 = #-16
		memd(r19+r3<<#0) = r15:14
	}
	{
		r15:14 = memd(r18+r2<<#0)
	}
	{
		memd(r18+r16<<#0) = r15:14
	}
	{
		r15:14 = memd(r20+r2<<#0)
	}
	{
		memd(r20+r16<<#0) = r15:14
	}
	{
		r15:14 = memd(r19+r2<<#0)
	}
	{
		memd(r19+r16<<#0) = r15:14
	}
	{
		r15:14 = memd(r18+r12<<#3)
	}
	{
		memd(r18+r2<<#0) = r15:14
	}
	{
		r15:14 = memd(r20+r12<<#3)
	}
	{
		memd(r20+r2<<#0) = r15:14
	}
	{
		r15:14 = memd(r19+r12<<#3)
	}
	{
		if (p0) jump:nt .LBB98_32
		memd(r19+r2<<#0) = r15:14
	}
	{
		jump .LBB98_31
	}
.LBB98_10:                              // %if.then
	{
		call ##memset
		r1 = #0
		r2 = #416
	}
.LBB98_11:                              // %if.then
	{
		r17:16 = memd(r29+#504)
		r19:18 = memd(r29+#496)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#488)
		r23:22 = memd(r29+#480)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#472)
		r27:26 = memd(r29+#464)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB98_19:                              // %while.cond.preheader
	{
		r21:20 = memd(r29+#448)
		r3:2 = memd(r29+#192)
	}
	{
		r0 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = cmp.eq(r21:20,r3:2)
		if (!p0.new) jump:t .LBB98_23
	}
// %bb.20:                              // %land.rhs.preheader
	{
		r5:4 = combine(#0,#1)
		r7:6 = combine(#0,#0)
		r3:2 = memd(r29+#320)
	}
	.p2align	4
.LBB98_21:                              // %land.rhs
                                        // =>This Inner Loop Header: Depth=1
	{
		p0 = cmp.eq(r21:20,r3:2)
		if (!p0.new) jump:nt .LBB98_23
	}
// %bb.22:                              // %while.body
                                        //   in Loop: Header=BB98_21 Depth=1
	{
		r13:12 = memd(r29+#64)
		r15:14 = memd(r29+#72)
	}
	{
		r11:10 = memd(r29+#80)
		memd(r29+#64) = r15:14
	}
	{
		r21:20 = mpyu(r12,r2)
		r19:18 = memd(r29+#88)
		r23:22 = memd(r29+#96)
	}
	{
		r21 += mpyi(r12,r3)
		r9:8 = memd(r29+#200)
		memd(r29+#80) = r19:18
	}
	{
		r21 += mpyi(r2,r13)
		r17:16 = memd(r29+#208)
		memd(r29+#88) = r23:22
	}
	{
		r27:26 = memd(r29+#216)
		memd(r29+#200) = r17:16
	}
	{
		p0 = cmp.eq(r21:20,r9:8)
		r25:24 = memd(r29+#224)
		memd(r29+#208) = r27:26
	}
	{
		r27:26 = memd(r29+#104)
		memd(r29+#216) = r25:24
	}
	{
		r15:14 = memd(r29+#336)
		memd(r29+#96) = r27:26
	}
	{
		r19:18 = memd(r29+#344)
		memd(r29+#72) = r11:10
	}
	{
		r23:22 = memd(r29+#352)
		memd(r29+#336) = r19:18
	}
	{
		r19:18 = memd(r29+#232)
		memd(r29+#344) = r23:22
	}
	{
		r25:24 = memd(r29+#112)
		memd(r29+#224) = r19:18
	}
	{
		r23:22 = memd(r29+#360)
		memd(r29+#104) = r25:24
	}
	{
		r19:18 = memd(r29+#240)
		memd(r29+#352) = r23:22
	}
	{
		r27:26 = memd(r29+#120)
		memd(r29+#232) = r19:18
	}
	{
		r23:22 = memd(r29+#368)
		memd(r29+#112) = r27:26
	}
	{
		r19:18 = memd(r29+#248)
		memd(r29+#360) = r23:22
	}
	{
		r25:24 = memd(r29+#128)
		memd(r29+#240) = r19:18
	}
	{
		r27:26 = memd(r29+#136)
		memd(r29+#120) = r25:24
	}
	{
		r23:22 = memd(r29+#376)
		memd(r29+#128) = r27:26
	}
	{
		r19:18 = memd(r29+#256)
		memd(r29+#368) = r23:22
	}
	{
		r17:16 = memd(r29+#264)
		memd(r29+#248) = r19:18
	}
	{
		r3:2 = memd(r29+#328)
		memd(r29+#256) = r17:16
	}
	{
		r23:22 = memd(r29+#384)
		memd(r29+#328) = r15:14
	}
	{
		r23:22 = memd(r29+#144)
		memd(r29+#376) = r23:22
	}
	{
		r19:18 = memd(r29+#392)
		memd(r29+#136) = r23:22
	}
	{
		r17:16 = memd(r29+#152)
		memd(r29+#384) = r19:18
	}
	{
		r25:24 = memd(r29+#272)
		memd(r29+#144) = r17:16
	}
	{
		r19:18 = memd(r29+#280)
		memd(r29+#264) = r25:24
	}
	{
		r27:26 = memd(r29+#400)
		memd(r29+#272) = r19:18
	}
	{
		r23:22 = memd(r29+#408)
		memd(r29+#392) = r27:26
	}
	{
		r25:24 = memd(r29+#160)
		memd(r29+#400) = r23:22
	}
	{
		r19:18 = memd(r29+#168)
		memd(r29+#152) = r25:24
	}
	{
		r27:26 = memd(r29+#288)
		memd(r29+#160) = r19:18
	}
	{
		r23:22 = memd(r29+#296)
		memd(r29+#280) = r27:26
	}
	{
		r17:16 = memd(r29+#416)
		memd(r29+#288) = r23:22
	}
	{
		r25:24 = memd(r29+#424)
		memd(r29+#408) = r17:16
	}
	{
		r27:26 = memd(r29+#176)
		memd(r29+#416) = r25:24
	}
	{
		r23:22 = memd(r29+#184)
		memd(r29+#168) = r27:26
	}
	{
		r17:16 = memd(r29+#304)
		memd(r29+#176) = r23:22
	}
	{
		r25:24 = memd(r29+#312)
		memd(r29+#296) = r17:16
	}
	{
		r19:18 = memd(r29+#432)
		memd(r29+#448) = r21:20
	}
	{
		r27:26 = memd(r29+#440)
		memd(r29+#424) = r19:18
	}
	{
		memd(r29+#192) = r9:8
		memd(r29+#304) = r25:24
	}
	{
		memd(r29+#320) = r3:2
		memd(r29+#432) = r27:26
	}
	{
		memd(r29+#184) = r5:4
		memd(r29+#312) = r7:6
	}
	{
		if (p0) jump:nt .LBB98_21
		memd(r29+#440) = r7:6
	}
.LBB98_23:                              // %while.end
	{
		call ##__hexagon_memcpy_likely_aligned_min32bytes_mult8bytes
		r1 = add(r29,#40)
		r2 = #416
	}
	{
		jump .LBB98_11
	}
.Lfunc_end98:
	.size	_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b, .Lfunc_end98-_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t // -- Begin function _ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t
	.p2align	4
	.type	_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t,@function
_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t: // @_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t
// %bb.0:                               // %entry
	{
		r17 = #0
		memd(r29+#-16) = r17:16
		allocframe(#16)
	}                                       // 8-byte Folded Spill
	{
		r3:2 = memd(r1+#16)
	}
	{
		memd(r29+#0) = r19:18
	}                                       // 8-byte Folded Spill
	{
		p0 = !tstbit(r2,#1)
		if (p0.new) jump:t .LBB99_6
	}
// %bb.1:                               // %if.end
	{
		r17 = #-14
		p0 = tstbit(r2,#0); if (p0.new) jump:t .LBB99_6
	}
// %bb.2:                               // %if.end9
	{
		r16 = r1
		r18 = r0
		r0 = memw(r1+#8)
	}
	{
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB99_3
	}
// %bb.4:                               // %if.end15
	{
		r1 = memw(r0+#60)
	}
	{
		r1:0 = combine(r16,r18)
		r2 = memw(r1+#24)
	}
	{
		callr r2
	}
	{
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB99_5
	}
.LBB99_6:                               // %return
	{
		r0 = r17
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB99_3:
	{
		r17 = #-19
	}
	{
		r0 = r17
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB99_5:                               // %if.end23
	{
		r1:0 = combine(r16,r18)
		r3:2 = memd(r16+#16)
	}
	{
		r2 = clrbit(r2,#1)
	}
	{
		call ##halide_msan_annotate_buffer_is_initialized
		r17 = #0
		memd(r16+#16) = r3:2
	}
	{
		r0 = r17
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end99:
	.size	_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t, .Lfunc_end99-_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t
                                        // -- End function
	.section	.text.halide_device_release,"ax",@progbits
	.weak	halide_device_release           // -- Begin function halide_device_release
	.p2align	4
	.type	halide_device_release,@function
halide_device_release:                  // @halide_device_release
// %bb.0:                               // %entry
	{
		allocframe(r29,#0):raw
	}
	{
		r1 = memw(r1+#60)
	}
	{
		r1 = memw(r1+#20)
	}
	{
		callr r1
	}
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end100:
	.size	halide_device_release, .Lfunc_end100-halide_device_release
                                        // -- End function
	.section	.text.halide_copy_to_host,"ax",@progbits
	.weak	halide_copy_to_host             // -- Begin function halide_copy_to_host
	.p2align	4
	.type	halide_copy_to_host,@function
halide_copy_to_host:                    // @halide_copy_to_host
// %bb.0:                               // %entry
	{
		r17:16 = combine(r1,r0)
		memd(r29+#-16) = r17:16
		allocframe(#16)
	}                                       // 8-byte Folded Spill
	{
		r19 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		memd(r29+#0) = r19:18
	}                                       // 8-byte Folded Spill
	{
		call ##halide_mutex_lock
		r0 = memw(r19+##_ZN6Halide7Runtime8Internal17device_copy_mutexE@GOT)
	}
	{
		p0 = cmp.eq(r17,#0); if (p0.new) jump:nt .LBB101_1
	}
// %bb.2:                               // %if.end.i
	{
		r5:4 = combine(#0,#0)
		r2 = memw(r17+#8)
		r1:0 = memd(r17+#0)
	}
	{
		p1 = cmp.eq(r1:0,r5:4)
		p0 = cmp.eq(r2,#0)
		if (p1.new) jump:nt .LBB101_5
	}
// %bb.3:                               // %if.end.i
	{
		if (!p0) jump:nt .LBB101_5
	}
// %bb.4:                               // %if.then8.i
	{
		call ##halide_error_no_device_interface
		r0 = r16
	}
	{
		r18 = r0
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB101_12
	}
	{
		jump .LBB101_11
	}
.LBB101_1:                              // %if.then.i
	{
		r1 = add(pc,##.L.str.6.22@PCREL)
		r0 = r16
	}
	{
		call ##halide_error_buffer_is_null
	}
	{
		r18 = r0
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB101_12
	}
	{
		jump .LBB101_11
	}
.LBB101_5:                              // %if.end10.i
	{
		if (p0) jump:nt .LBB101_8
	}
// %bb.6:                               // %if.end10.i
	{
		r3:2 = combine(#0,#0)
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (!p0.new) jump:nt .LBB101_8
	}
// %bb.7:                               // %if.then14.i
	{
		call ##halide_error_device_interface_no_device
		r0 = r16
	}
	{
		r18 = r0
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB101_12
	}
	{
		jump .LBB101_11
	}
.LBB101_8:                              // %if.end16.i
	{
		r3:2 = combine(#0,#3)
		r1:0 = memd(r17+#16)
	}
	{
		r0 = and(r0,#3)
		r1 = #0
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (!p0.new) jump:t .LBB101_11
	}
// %bb.9:                               // %if.then24.i
	{
		call ##halide_error_host_and_device_dirty
		r0 = r16
	}
	{
		r18 = r0
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB101_12
	}
.LBB101_11:                             // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split
	{
		call ##_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t
		r1:0 = combine(r17,r16)
	}
	{
		r18 = r0
	}
.LBB101_12:                             // %cleanup
	{
		call ##halide_mutex_unlock
		r0 = memw(r19+##_ZN6Halide7Runtime8Internal17device_copy_mutexE@GOT)
	}
	{
		r0 = r18
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end101:
	.size	halide_copy_to_host, .Lfunc_end101-halide_copy_to_host
                                        // -- End function
	.section	.text.copy_to_device_already_locked,"ax",@progbits
	.weak	copy_to_device_already_locked   // -- Begin function copy_to_device_already_locked
	.p2align	4
	.type	copy_to_device_already_locked,@function
copy_to_device_already_locked:          // @copy_to_device_already_locked
// %bb.0:                               // %entry
	{
		r17:16 = combine(r0,r1)
		p0 = cmp.eq(r1,#0)
		memd(r29+#-16) = r17:16
		allocframe(#16)
	}                                       // 8-byte Folded Spill
	{
		if (p0) jump:nt .LBB102_1
		r18 = r2
		memd(r29+#0) = r19:18
	}                                       // 8-byte Folded Spill
// %bb.2:                               // %if.end.i
	{
		r5:4 = combine(#0,#0)
		r2 = memw(r16+#8)
		r1:0 = memd(r16+#0)
	}
	{
		p1 = cmp.eq(r1:0,r5:4)
		p0 = cmp.eq(r2,#0)
		if (p1.new) jump:nt .LBB102_5
	}
// %bb.3:                               // %if.end.i
	{
		if (!p0) jump:nt .LBB102_5
	}
// %bb.4:                               // %if.then8.i
	{
		call ##halide_error_no_device_interface
		r0 = r17
	}
	{
		r19 = r0
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB102_21
	}
	{
		jump .LBB102_11
	}
.LBB102_1:                              // %if.then.i
	{
		r1 = add(pc,##.L.str.7.23@PCREL)
		r0 = r17
	}
	{
		call ##halide_error_buffer_is_null
	}
	{
		r19 = r0
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB102_21
	}
	{
		jump .LBB102_11
	}
.LBB102_5:                              // %if.end10.i
	{
		if (p0) jump:nt .LBB102_8
	}
// %bb.6:                               // %if.end10.i
	{
		r3:2 = combine(#0,#0)
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (!p0.new) jump:nt .LBB102_8
	}
// %bb.7:                               // %if.then14.i
	{
		call ##halide_error_device_interface_no_device
		r0 = r17
	}
	{
		r19 = r0
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB102_11
	}
.LBB102_21:                             // %cleanup
	{
		r0 = r19
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB102_8:                              // %if.end16.i
	{
		r3:2 = combine(#0,#3)
		r1:0 = memd(r16+#16)
	}
	{
		r0 = and(r0,#3)
		r1 = #0
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (!p0.new) jump:t .LBB102_11
	}
// %bb.9:                               // %if.then24.i
	{
		call ##halide_error_host_and_device_dirty
		r0 = r17
	}
	{
		r19 = r0
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB102_21
	}
.LBB102_11:                             // %if.end
	{
		p0 = cmp.eq(r18,#0); if (!p0.new) jump:t .LBB102_13
	}
// %bb.12:                              // %if.then2
	{
		r18 = memw(r16+#8)
		if (cmp.eq(r18.new,#0)) jump:nt .LBB102_22
	}
.LBB102_13:                             // %if.end11
	{
		r3:2 = combine(#0,#0)
		r1:0 = memd(r16+#0)
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (p0.new) jump:nt .LBB102_16
	}
// %bb.14:                              // %land.lhs.true
	{
		r0 = memw(r16+#8)
		if (cmp.eq(r0.new,r18)) jump:nt .LBB102_17
	}
// %bb.15:                              // %if.then14
	{
		r1 = add(pc,##.L.str.9.24@PCREL)
		r0 = r17
	}
	{
		call ##halide_error
		r19 = #-42
	}
	{
		r0 = r19
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB102_16:                             // %if.then18
	{
		call ##halide_device_malloc
		r1:0 = combine(r16,r17)
		r2 = r18
	}
	{
		r19 = r0
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB102_21
	}
.LBB102_17:                             // %if.end27
	{
		r19 = #0
		r1:0 = memd(r16+#16)
	}
	{
		p0 = tstbit(r0,#0); if (!p0.new) jump:t .LBB102_21
	}
// %bb.18:                              // %if.then29
	{
		p0 = tstbit(r0,#1)
		r19 = #-15
		if (p0.new) jump:t .LBB102_21
	}
// %bb.19:                              // %if.else
	{
		r1 = memw(r18+#60)
	}
	{
		r1:0 = combine(r16,r17)
		r2 = memw(r1+#28)
	}
	{
		callr r2
	}
	{
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB102_21
	}
// %bb.20:                              // %if.then46
	{
		r19 = #0
		r1:0 = memd(r16+#16)
	}
	{
		r0 = clrbit(r0,#0)
	}
	{
		r0 = r19
		r17:16 = memd(r29+#8)
		memd(r16+#16) = r1:0
	}                                       // 8-byte Folded Reload
	{
		r19:18 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.LBB102_22:                             // %if.then7
	{
		r0 = r17
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_error_no_device_interface
		r31:30 = deallocframe(r30):raw
	}
.Lfunc_end102:
	.size	copy_to_device_already_locked, .Lfunc_end102-copy_to_device_already_locked
                                        // -- End function
	.section	.text.halide_device_malloc,"ax",@progbits
	.weak	halide_device_malloc            // -- Begin function halide_device_malloc
	.p2align	4
	.type	halide_device_malloc,@function
halide_device_malloc:                   // @halide_device_malloc
// %bb.0:                               // %entry
	{
		r17:16 = combine(r1,r2)
		p0 = cmp.eq(r1,#0)
		memd(r29+#-16) = r17:16
		allocframe(#16)
	}                                       // 8-byte Folded Spill
	{
		if (p0) jump:nt .LBB103_1
		r18 = r0
		memd(r29+#0) = r19:18
	}                                       // 8-byte Folded Spill
// %bb.2:                               // %if.end.i
	{
		r5:4 = combine(#0,#0)
		r0 = memw(r17+#8)
		r3:2 = memd(r17+#0)
	}
	{
		p1 = cmp.eq(r3:2,r5:4)
		p0 = cmp.eq(r0,#0)
		if (p1.new) jump:nt .LBB103_5
	}
// %bb.3:                               // %if.end.i
	{
		if (!p0) jump:nt .LBB103_5
	}
// %bb.4:                               // %if.then8.i
	{
		call ##halide_error_no_device_interface
		r0 = r18
	}
	{
		jump .LBB103_10
	}
.LBB103_1:                              // %if.then.i
	{
		r1 = add(pc,##.L.str.17.25@PCREL)
		r0 = r18
	}
	{
		call ##halide_error_buffer_is_null
	}
	{
		jump .LBB103_10
	}
.LBB103_5:                              // %if.end10.i
	{
		if (p0) jump:nt .LBB103_8
	}
// %bb.6:                               // %if.end10.i
	{
		r5:4 = combine(#0,#0)
	}
	{
		p0 = cmp.eq(r3:2,r5:4)
		if (!p0.new) jump:nt .LBB103_8
	}
// %bb.7:                               // %if.then14.i
	{
		call ##halide_error_device_interface_no_device
		r0 = r18
	}
	{
		jump .LBB103_10
	}
.LBB103_8:                              // %if.end16.i
	{
		r5:4 = combine(#0,#3)
		r3:2 = memd(r17+#16)
	}
	{
		r2 = and(r2,#3)
		r3 = #0
	}
	{
		p0 = cmp.eq(r3:2,r5:4)
		if (!p0.new) jump:t .LBB103_12
	}
// %bb.9:                               // %if.then24.i
	{
		call ##halide_error_host_and_device_dirty
		r0 = r18
	}
.LBB103_10:                             // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
	{
		p0 = cmp.eq(r0,#0)
		if (!p0.new) r17:16 = memd(r29+#8)
		if (!p0.new) r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		if (!p0) r31:30 = dealloc_return(r30):raw
	}
.LBB103_11:                             // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	{
		r0 = memw(r17+#8)
	}
.LBB103_12:                             // %if.end
	{
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB103_15
	}
// %bb.13:                              // %if.end
	{
		p0 = cmp.eq(r0,r16); if (p0.new) jump:nt .LBB103_15
	}
// %bb.14:                              // %if.then6
	{
		r1 = add(pc,##.L.str.20.26@PCREL)
		r0 = r18
	}
	{
		call ##halide_error
	}
	{
		r0 = #-42
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB103_15:                             // %if.end7
	{
		r0 = memw(r16+#60)
	}
	{
		r0 = memw(r0+#0)
	}
	{
		callr r0
	}
	{
		r0 = memw(r16+#60)
	}
	{
		r1:0 = combine(r17,r18)
		r2 = memw(r0+#8)
	}
	{
		callr r2
	}
	{
		r16 = r0
		r1 = memw(r16+#60)
	}
	{
		r1 = memw(r1+#4)
	}
	{
		callr r1
	}
	{
		p0 = cmp.eq(r16,#0)
	}
	{
		r0 = mux(p0,#0,#-16)
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end103:
	.size	halide_device_malloc, .Lfunc_end103-halide_device_malloc
                                        // -- End function
	.section	.text.halide_copy_to_device,"ax",@progbits
	.weak	halide_copy_to_device           // -- Begin function halide_copy_to_device
	.p2align	4
	.type	halide_copy_to_device,@function
halide_copy_to_device:                  // @halide_copy_to_device
// %bb.0:                               // %entry
	{
		r3 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		memd(r29+#-16) = r17:16
		allocframe(#16)
	}                                       // 8-byte Folded Spill
	{
		r16 = r0
	}
	{
		r19:18 = combine(r1,r2)
		memd(r29+#0) = r19:18
	}                                       // 8-byte Folded Spill
	{
		r17 = memw(r3+##_ZN6Halide7Runtime8Internal17device_copy_mutexE@GOT)
	}
	{
		call ##halide_mutex_lock
		r0 = r17
	}
	{
		call ##copy_to_device_already_locked
		r1:0 = combine(r19,r16)
		r2 = r18
	}
	{
		call ##halide_mutex_unlock
		r16 = r0
		r0 = r17
	}
	{
		r0 = r16
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end104:
	.size	halide_copy_to_device, .Lfunc_end104-halide_copy_to_device
                                        // -- End function
	.section	.text.halide_device_sync,"ax",@progbits
	.weak	halide_device_sync              // -- Begin function halide_device_sync
	.p2align	4
	.type	halide_device_sync,@function
halide_device_sync:                     // @halide_device_sync
// %bb.0:                               // %entry
	{
		r17:16 = combine(r0,r1)
		p0 = cmp.eq(r1,#0)
		memd(r29+#-16) = r17:16
		allocframe(#8)
	}                                       // 8-byte Folded Spill
	{
		if (p0) jump:nt .LBB105_1
	}
// %bb.2:                               // %if.end.i
	{
		r5:4 = combine(#0,#0)
		r0 = memw(r16+#8)
		r3:2 = memd(r16+#0)
	}
	{
		p1 = cmp.eq(r3:2,r5:4)
		p0 = cmp.eq(r0,#0)
		if (p1.new) jump:nt .LBB105_5
	}
// %bb.3:                               // %if.end.i
	{
		if (!p0) jump:nt .LBB105_5
	}
// %bb.4:                               // %if.then8.i
	{
		call ##halide_error_no_device_interface
		r0 = r17
	}
	{
		jump .LBB105_10
	}
.LBB105_1:                              // %if.then.i
	{
		r1 = add(pc,##.L.str.16.27@PCREL)
		r0 = r17
	}
	{
		call ##halide_error_buffer_is_null
	}
	{
		jump .LBB105_10
	}
.LBB105_5:                              // %if.end10.i
	{
		if (p0) jump:nt .LBB105_8
	}
// %bb.6:                               // %if.end10.i
	{
		r5:4 = combine(#0,#0)
	}
	{
		p0 = cmp.eq(r3:2,r5:4)
		if (!p0.new) jump:nt .LBB105_8
	}
// %bb.7:                               // %if.then14.i
	{
		call ##halide_error_device_interface_no_device
		r0 = r17
	}
	{
		jump .LBB105_10
	}
.LBB105_8:                              // %if.end16.i
	{
		r5:4 = combine(#0,#3)
		r3:2 = memd(r16+#16)
	}
	{
		r2 = and(r2,#3)
		r3 = #0
	}
	{
		p0 = cmp.eq(r3:2,r5:4)
		if (!p0.new) jump:t .LBB105_12
	}
// %bb.9:                               // %if.then24.i
	{
		call ##halide_error_host_and_device_dirty
		r0 = r17
	}
.LBB105_10:                             // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
	{
		p0 = cmp.eq(r0,#0)
		if (!p0.new) r17:16 = memd(r29+#0)
		if (!p0.new) r31:30 = dealloc_return(r30):t:raw
	}                                       // 8-byte Folded Reload
.LBB105_11:                             // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	{
		r0 = memw(r16+#8)
	}
.LBB105_12:                             // %if.end
	{
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB105_14
	}
// %bb.13:                              // %if.end5
	{
		r1 = memw(r0+#60)
	}
	{
		r1:0 = combine(r16,r17)
		r2 = memw(r1+#16)
	}
	{
		callr r2
	}
	{
		p0 = cmp.eq(r0,#0)
		r17:16 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r0 = mux(p0,#0,#-17)
		r31:30 = dealloc_return(r30):raw
	}
.LBB105_14:                             // %if.then3
	{
		r0 = r17
		r17:16 = memd(r29+#0)
		deallocframe
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_error_no_device_interface
	}
.Lfunc_end105:
	.size	halide_device_sync, .Lfunc_end105-halide_device_sync
                                        // -- End function
	.section	.text.halide_device_free,"ax",@progbits
	.weak	halide_device_free              // -- Begin function halide_device_free
	.p2align	4
	.type	halide_device_free,@function
halide_device_free:                     // @halide_device_free
// %bb.0:                               // %entry
	{
		r17:16 = combine(r1,r0)
		p0 = cmp.eq(r1,#0)
		memd(r29+#-16) = r17:16
		allocframe(#16)
	}                                       // 8-byte Folded Spill
	{
		if (p0) jump:nt .LBB106_1
		memd(r29+#0) = r19:18
	}                                       // 8-byte Folded Spill
// %bb.2:                               // %if.end.i
	{
		r3:2 = combine(#0,#0)
		r18 = memw(r17+#8)
		r1:0 = memd(r17+#0)
	}
	{
		p1 = cmp.eq(r1:0,r3:2)
		p0 = cmp.eq(r18,#0)
		if (p1.new) jump:nt .LBB106_5
	}
// %bb.3:                               // %if.end.i
	{
		if (!p0) jump:nt .LBB106_5
	}
// %bb.4:                               // %if.then8.i
	{
		call ##halide_error_no_device_interface
		r0 = r16
	}
	{
		jump .LBB106_10
	}
.LBB106_1:                              // %if.then.i
	{
		r1 = add(pc,##.L.str.21.28@PCREL)
		r0 = r16
	}
	{
		call ##halide_error_buffer_is_null
	}
	{
		jump .LBB106_10
	}
.LBB106_5:                              // %if.end10.i
	{
		if (p0) jump:nt .LBB106_8
	}
// %bb.6:                               // %if.end10.i
	{
		r3:2 = combine(#0,#0)
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (!p0.new) jump:nt .LBB106_8
	}
// %bb.7:                               // %if.then14.i
	{
		call ##halide_error_device_interface_no_device
		r0 = r16
	}
	{
		jump .LBB106_10
	}
.LBB106_8:                              // %if.end16.i
	{
		r3:2 = combine(#0,#3)
		r1:0 = memd(r17+#16)
	}
	{
		r0 = and(r0,#3)
		r1 = #0
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (!p0.new) jump:t .LBB106_12
	}
// %bb.9:                               // %if.then24.i
	{
		call ##halide_error_host_and_device_dirty
		r0 = r16
	}
.LBB106_10:                             // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
	{
		p0 = cmp.eq(r0,#0)
		if (!p0.new) r17:16 = memd(r29+#8)
		if (!p0.new) r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		if (!p0) r31:30 = dealloc_return(r30):raw
	}
.LBB106_11:                             // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	{
		r18 = memw(r17+#8)
	}
.LBB106_12:                             // %if.end
	{
		p0 = cmp.eq(r18,#0); if (p0.new) jump:nt .LBB106_16
	}
// %bb.13:                              // %if.then3
	{
		r0 = memw(r18+#60)
	}
	{
		r0 = memw(r0+#0)
	}
	{
		callr r0
	}
	{
		r0 = memw(r18+#60)
	}
	{
		r1:0 = combine(r17,r16)
		r2 = memw(r0+#12)
	}
	{
		callr r2
	}
	{
		r18 = r0
		r1 = memw(r18+#60)
	}
	{
		r1 = memw(r1+#4)
	}
	{
		callr r1
	}
	{
		r3:2 = combine(#0,#0)
		r1:0 = memd(r17+#0)
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (p0.new) jump:nt .LBB106_15
	}
// %bb.14:                              // %if.then8
	{
		r1 = add(pc,##.L.str.22.29@PCREL)
		r0 = r16
	}
	{
		call ##halide_print
	}
	{
		call ##abort
	}
.LBB106_15:                             // %do.end
	{
		p0 = cmp.eq(r18,#0)
	}
	{
		r0 = mux(p0,#0,#-18)
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB106_16:                             // %if.end11
	{
		r0 = #0
		r3:2 = memd(r17+#16)
	}
	{
		r2 = clrbit(r2,#1)
	}
	{
		r17:16 = memd(r29+#8)
		memd(r17+#16) = r3:2
	}                                       // 8-byte Folded Reload
	{
		r19:18 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end106:
	.size	halide_device_free, .Lfunc_end106-halide_device_free
                                        // -- End function
	.section	.text.halide_device_free_as_destructor,"ax",@progbits
	.weak	halide_device_free_as_destructor // -- Begin function halide_device_free_as_destructor
	.p2align	4
	.type	halide_device_free_as_destructor,@function
halide_device_free_as_destructor:       // @halide_device_free_as_destructor
// %bb.0:                               // %entry
	{
		jump ##halide_device_free
	}
.Lfunc_end107:
	.size	halide_device_free_as_destructor, .Lfunc_end107-halide_device_free_as_destructor
                                        // -- End function
	.section	.text.halide_device_and_host_malloc,"ax",@progbits
	.weak	halide_device_and_host_malloc   // -- Begin function halide_device_and_host_malloc
	.p2align	4
	.type	halide_device_and_host_malloc,@function
halide_device_and_host_malloc:          // @halide_device_and_host_malloc
// %bb.0:                               // %entry
	{
		p0 = cmp.eq(r1,#0)
		r17:16 = combine(r2,r0)
		memd(r29+#-16) = r17:16
		allocframe(#16)
	}                                       // 8-byte Folded Spill
	{
		if (p0) jump:nt .LBB108_1
		r18 = r1
		memd(r29+#0) = r19:18
	}                                       // 8-byte Folded Spill
// %bb.2:                               // %if.end.i
	{
		r5:4 = combine(#0,#0)
		r0 = memw(r18+#8)
		r3:2 = memd(r18+#0)
	}
	{
		p1 = cmp.eq(r3:2,r5:4)
		p0 = cmp.eq(r0,#0)
		if (p1.new) jump:nt .LBB108_5
	}
// %bb.3:                               // %if.end.i
	{
		if (!p0) jump:nt .LBB108_5
	}
// %bb.4:                               // %if.then8.i
	{
		call ##halide_error_no_device_interface
		r0 = r16
	}
	{
		r19 = r0
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB108_18
	}
	{
		jump .LBB108_11
	}
.LBB108_1:                              // %if.then.i
	{
		r1 = add(pc,##.L.str.23.30@PCREL)
		r0 = r16
	}
	{
		call ##halide_error_buffer_is_null
	}
	{
		r19 = r0
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB108_18
	}
	{
		jump .LBB108_11
	}
.LBB108_5:                              // %if.end10.i
	{
		if (p0) jump:nt .LBB108_8
	}
// %bb.6:                               // %if.end10.i
	{
		r5:4 = combine(#0,#0)
	}
	{
		p0 = cmp.eq(r3:2,r5:4)
		if (!p0.new) jump:nt .LBB108_8
	}
// %bb.7:                               // %if.then14.i
	{
		call ##halide_error_device_interface_no_device
		r0 = r16
	}
	{
		r19 = r0
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB108_11
	}
.LBB108_18:                             // %cleanup14
	{
		r0 = r19
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB108_8:                              // %if.end16.i
	{
		r5:4 = combine(#0,#3)
		r3:2 = memd(r18+#16)
	}
	{
		r2 = and(r2,#3)
		r3 = #0
	}
	{
		p0 = cmp.eq(r3:2,r5:4)
		if (!p0.new) jump:t .LBB108_12
	}
// %bb.9:                               // %if.then24.i
	{
		call ##halide_error_host_and_device_dirty
		r0 = r16
	}
	{
		r19 = r0
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB108_18
	}
.LBB108_11:                             // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	{
		r0 = memw(r18+#8)
	}
.LBB108_12:                             // %if.end
	{
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB108_15
	}
// %bb.13:                              // %if.end
	{
		p0 = cmp.eq(r0,r17); if (p0.new) jump:nt .LBB108_15
	}
// %bb.14:
	{
		r1 = add(pc,##.L.str.25.31@PCREL)
		r19 = #-42
		jump .LBB108_17
	}
.LBB108_15:                             // %if.end7
	{
		r0 = memw(r17+#60)
	}
	{
		r0 = memw(r0+#0)
	}
	{
		callr r0
	}
	{
		r0 = memw(r17+#60)
	}
	{
		r1:0 = combine(r18,r16)
		r2 = memw(r0+#32)
	}
	{
		callr r2
	}
	{
		r17 = r0
		r1 = memw(r17+#60)
	}
	{
		r1 = memw(r1+#4)
	}
	{
		callr r1
	}
	{
		p0 = cmp.eq(r17,#0); if (p0.new) jump:nt .LBB108_19
	}
// %bb.16:
	{
		r1 = add(pc,##.L.str.26@PCREL)
		r19 = #-16
	}
.LBB108_17:                             // %cleanup14.sink.split
	{
		call ##halide_error
		r0 = r16
	}
	{
		r0 = r19
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB108_19:
	{
		r19 = #0
	}
	{
		r0 = r19
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end108:
	.size	halide_device_and_host_malloc, .Lfunc_end108-halide_device_and_host_malloc
                                        // -- End function
	.section	.text.halide_device_and_host_free,"ax",@progbits
	.weak	halide_device_and_host_free     // -- Begin function halide_device_and_host_free
	.p2align	4
	.type	halide_device_and_host_free,@function
halide_device_and_host_free:            // @halide_device_and_host_free
// %bb.0:                               // %entry
	{
		r17:16 = combine(r0,r1)
		p0 = cmp.eq(r1,#0)
		memd(r29+#-16) = r17:16
		allocframe(#16)
	}                                       // 8-byte Folded Spill
	{
		if (p0) jump:nt .LBB109_1
		memd(r29+#0) = r19:18
	}                                       // 8-byte Folded Spill
// %bb.2:                               // %if.end.i
	{
		r3:2 = combine(#0,#0)
		r18 = memw(r16+#8)
		r1:0 = memd(r16+#0)
	}
	{
		p1 = cmp.eq(r1:0,r3:2)
		p0 = cmp.eq(r18,#0)
		if (p1.new) jump:nt .LBB109_5
	}
// %bb.3:                               // %if.end.i
	{
		if (!p0) jump:nt .LBB109_5
	}
// %bb.4:                               // %if.then8.i
	{
		call ##halide_error_no_device_interface
		r0 = r17
	}
	{
		jump .LBB109_10
	}
.LBB109_1:                              // %if.then.i
	{
		r1 = add(pc,##.L.str.27@PCREL)
		r0 = r17
	}
	{
		call ##halide_error_buffer_is_null
	}
	{
		jump .LBB109_10
	}
.LBB109_5:                              // %if.end10.i
	{
		if (p0) jump:nt .LBB109_8
	}
// %bb.6:                               // %if.end10.i
	{
		r3:2 = combine(#0,#0)
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (!p0.new) jump:nt .LBB109_8
	}
// %bb.7:                               // %if.then14.i
	{
		call ##halide_error_device_interface_no_device
		r0 = r17
	}
	{
		jump .LBB109_10
	}
.LBB109_8:                              // %if.end16.i
	{
		r3:2 = combine(#0,#3)
		r1:0 = memd(r16+#16)
	}
	{
		r0 = and(r0,#3)
		r1 = #0
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (!p0.new) jump:t .LBB109_12
	}
// %bb.9:                               // %if.then24.i
	{
		call ##halide_error_host_and_device_dirty
		r0 = r17
	}
.LBB109_10:                             // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
	{
		p0 = cmp.eq(r0,#0)
		if (!p0.new) r17:16 = memd(r29+#8)
		if (!p0.new) r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		if (!p0) r31:30 = dealloc_return(r30):raw
	}
.LBB109_11:                             // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	{
		r18 = memw(r16+#8)
	}
.LBB109_12:                             // %if.end
	{
		p0 = cmp.eq(r18,#0); if (p0.new) jump:nt .LBB109_16
	}
// %bb.13:                              // %if.then3
	{
		r0 = memw(r18+#60)
	}
	{
		r0 = memw(r0+#0)
	}
	{
		callr r0
	}
	{
		r0 = memw(r18+#60)
	}
	{
		r1:0 = combine(r16,r17)
		r2 = memw(r0+#36)
	}
	{
		callr r2
	}
	{
		r18 = r0
		r1 = memw(r18+#60)
	}
	{
		r1 = memw(r1+#4)
	}
	{
		callr r1
	}
	{
		r3:2 = combine(#0,#0)
		r1:0 = memd(r16+#0)
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (p0.new) jump:nt .LBB109_15
	}
// %bb.14:                              // %if.then8
	{
		r1 = add(pc,##.L.str.28@PCREL)
		r0 = r17
	}
	{
		call ##halide_print
	}
	{
		call ##abort
	}
.LBB109_15:                             // %do.end
	{
		p0 = cmp.eq(r18,#0)
	}
	{
		r0 = mux(p0,#0,#-18)
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB109_16:                             // %if.else11
	{
		r1 = memw(r16+#12)
		if (cmp.eq(r1.new,#0)) jump:nt .LBB109_18
	}
// %bb.17:                              // %if.then13
	{
		call ##halide_free
		r0 = r17
	}
	{
		memw(r16+#12) = #0
	}
.LBB109_18:                             // %if.end17
	{
		r0 = #0
		r3:2 = memd(r16+#16)
	}
	{
		r2 = clrbit(r2,#1)
	}
	{
		r17:16 = memd(r29+#8)
		memd(r16+#16) = r3:2
	}                                       // 8-byte Folded Reload
	{
		r19:18 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end109:
	.size	halide_device_and_host_free, .Lfunc_end109-halide_device_and_host_free
                                        // -- End function
	.section	.text.halide_default_device_and_host_malloc,"ax",@progbits
	.weak	halide_default_device_and_host_malloc // -- Begin function halide_default_device_and_host_malloc
	.p2align	4
	.type	halide_default_device_and_host_malloc,@function
halide_default_device_and_host_malloc:  // @halide_default_device_and_host_malloc
// %bb.0:                               // %entry
	{
		r17:16 = combine(r0,r1)
		p0 = cmp.eq(r1,#0)
		memd(r29+#-16) = r17:16
		allocframe(#32)
	}                                       // 8-byte Folded Spill
	{
		r18 = r2
		memd(r29+#16) = r19:18
		memd(r29+#8) = r21:20
	}                                       // 8-byte Folded Spill
	{
		if (p0) jump:nt .LBB110_1
		memd(r29+#0) = r23:22
	}                                       // 8-byte Folded Spill
// %bb.2:                               // %if.end.i
	{
		r5:4 = combine(#0,#0)
		r2 = memw(r16+#8)
		r1:0 = memd(r16+#0)
	}
	{
		p1 = cmp.eq(r1:0,r5:4)
		p0 = cmp.eq(r2,#0)
		if (p1.new) jump:nt .LBB110_5
	}
// %bb.3:                               // %if.end.i
	{
		if (!p0) jump:nt .LBB110_5
	}
// %bb.4:                               // %if.then8.i
	{
		call ##halide_error_no_device_interface
		r0 = r17
	}
	{
		r19 = r0
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB110_68
	}
	{
		jump .LBB110_11
	}
.LBB110_1:                              // %if.then.i
	{
		r1 = add(pc,##.L.str.29@PCREL)
		r0 = r17
	}
	{
		call ##halide_error_buffer_is_null
	}
	{
		r19 = r0
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB110_68
	}
	{
		jump .LBB110_11
	}
.LBB110_5:                              // %if.end10.i
	{
		if (p0) jump:nt .LBB110_8
	}
// %bb.6:                               // %if.end10.i
	{
		r3:2 = combine(#0,#0)
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (!p0.new) jump:nt .LBB110_8
	}
// %bb.7:                               // %if.then14.i
	{
		call ##halide_error_device_interface_no_device
		r0 = r17
	}
	{
		r19 = r0
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB110_68
	}
	{
		jump .LBB110_11
	}
.LBB110_8:                              // %if.end16.i
	{
		r3:2 = combine(#0,#3)
		r1:0 = memd(r16+#16)
	}
	{
		r0 = and(r0,#3)
		r1 = #0
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (!p0.new) jump:t .LBB110_11
	}
// %bb.9:                               // %if.then24.i
	{
		call ##halide_error_host_and_device_dirty
		r0 = r17
	}
	{
		r19 = r0
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB110_68
	}
.LBB110_11:                             // %if.end
	{
		r1 = #0
		r6 = memw(r16+#28)
		if (!cmp.gt(r6.new,#0)) jump:nt .LBB110_12
	}
// %bb.13:                              // %for.body.preheader.i.i
	{
		r5:4 = combine(#-1,#-1)
		r13:12 = combine(#0,#7)
		r3 = #0
		r0 = memw(r16+#32)
	}
	{
		r7 = r3
		r9:8 = combine(r3,#0)
		r2 = and(r6,#7)
	}
	{
		r5:4 = add(r7:6,r5:4)
	}
	{
		p0 = cmp.gtu(r13:12,r5:4)
		r5:4 = combine(r3,#0)
		if (!p0.new) jump:t .LBB110_14
	}
.LBB110_32:                             // %for.body.i12.i.preheader.unr-lcssa
	{
		r13:12 = combine(#0,#0)
	}
	{
		p0 = cmp.eq(r3:2,r13:12)
		if (p0.new) jump:nt .LBB110_37
	}
// %bb.33:
	{
		r15:14 = combine(r3,r2)
		r11:10 = combine(#0,#1)
		r21:20 = combine(#-1,#-1)
		jump .LBB110_34
	}
	.p2align	4
.LBB110_36:                             // %if.end.i.i.epil
                                        //   in Loop: Header=BB110_34 Depth=1
	{
		r15:14 = add(r15:14,r21:20)
		r9:8 = add(r9:8,r11:10)
	}
	{
		p0 = cmp.eq(r15:14,r13:12)
		if (p0.new) jump:nt .LBB110_37
	}
.LBB110_34:                             // %for.body.i.i.epil
                                        // =>This Inner Loop Header: Depth=1
	{
		r28 = addasl(r0,r8,#4)
	}
	{
		r7 = memw(r28+#8)
		if (!cmp.gt(r7.new,#0)) jump:t .LBB110_36
	}
// %bb.35:                              // %if.then.i.i.epil
                                        //   in Loop: Header=BB110_34 Depth=1
	{
		r28 = memw(r28+#4)
	}
	{
		r28 = add(r28,#-1)
	}
	{
		r23:22 = mpyu(r28,r7)
		r19 = asr(r28,#31)
	}
	{
		r23 += mpyi(r7,r19)
	}
	{
		r5:4 = add(r23:22,r5:4)
		jump .LBB110_36
	}
.LBB110_37:                             // %for.body.i12.i.preheader
	{
		r9:8 = combine(#-1,#-1)
		r13:12 = combine(#0,#7)
		r3 = #0
		r7 = r3
	}
	{
		r9:8 = add(r7:6,r9:8)
	}
	{
		p0 = cmp.gtu(r13:12,r9:8)
		if (!p0.new) jump:t .LBB110_47
	}
// %bb.38:
	{
		r9:8 = combine(#0,#0)
	}
	{
		r7:6 = combine(r9,r8)
	}
.LBB110_39:                             // %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit.unr-lcssa
	{
		r13:12 = combine(#0,#0)
	}
	{
		p0 = cmp.eq(r3:2,r13:12)
		if (p0.new) jump:nt .LBB110_44
	}
// %bb.40:
	{
		r15:14 = combine(#0,#1)
		r11:10 = combine(#-1,#-1)
		jump .LBB110_41
	}
	.p2align	4
.LBB110_43:                             // %if.end.i22.i.epil
                                        //   in Loop: Header=BB110_41 Depth=1
	{
		r3:2 = add(r3:2,r11:10)
		r9:8 = add(r9:8,r15:14)
	}
	{
		p0 = cmp.eq(r3:2,r13:12)
		if (p0.new) jump:nt .LBB110_44
	}
.LBB110_41:                             // %for.body.i12.i.epil
                                        // =>This Inner Loop Header: Depth=1
	{
		r19 = addasl(r0,r8,#4)
	}
	{
		r28 = memw(r19+#8)
		if (cmp.gt(r28.new,#-1)) jump:nt .LBB110_43
	}
// %bb.42:                              // %if.then.i18.i.epil
                                        //   in Loop: Header=BB110_41 Depth=1
	{
		r19 = memw(r19+#4)
	}
	{
		r19 = add(r19,#-1)
	}
	{
		r7:6 += mpy(r19,r28)
		jump .LBB110_43
	}
.LBB110_44:                             // %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit
	{
		r3:2 = combine(#0,#1)
	}
	{
		r3:2 = add(r5:4,r3:2)
		jump .LBB110_45
	}
.LBB110_12:
	{
		r7:6 = combine(#0,#0)
		r3:2 = combine(#0,#1)
	}
.LBB110_45:                             // %_ZNK15halide_buffer_t13size_in_bytesEv.exit
	{
		r5:4 = sub(r3:2,r7:6)
		r7:6 = combine(#0,#7)
		r0 = memub(r16+#25)
	}
	{
		r1:0 = add(r1:0,r7:6)
	}
	{
		r0 = lsr(r0,#3)
	}
	{
		r0 = insert(r1,#3,#29)
		r1 = lsr(r1,#3)
	}
	{
		r3:2 = mpyu(r0,r4)
	}
	{
		r3 += mpyi(r0,r5)
		r0 = r17
	}
	{
		r3 += mpyi(r4,r1)
		call ##halide_malloc
	}
	{
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB110_46
		memw(r16+#12) = r0
	}
// %bb.65:                              // %if.end6
	{
		call ##halide_device_malloc
		r1:0 = combine(r16,r17)
		r2 = r18
	}
	{
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB110_66
	}
// %bb.67:                              // %if.then9
	{
		r0 = r17
		r19 = r0
		r1 = memw(r16+#12)
	}
	{
		call ##halide_free
	}
	{
		jump .LBB110_68
		memw(r16+#12) = #0
	}
.LBB110_46:
	{
		r19 = #-1
		jump .LBB110_68
	}
.LBB110_14:                             // %for.body.preheader.i.i.new
	{
		r4 = #-8
		r9:8 = combine(#0,#0)
		r15:14 = combine(#0,#8)
		r11:10 = combine(#-1,#-8)
	}
	{
		r12 = and(r6,r4)
		r5:4 = combine(r9,r8)
		r21:20 = combine(#0,#0)
		r13 = #0
	}
	{
		jump .LBB110_15
	}
	.p2align	4
.LBB110_31:                             // %if.end.i.i.7
                                        //   in Loop: Header=BB110_15 Depth=1
	{
		r13:12 = add(r13:12,r11:10)
		r9:8 = add(r9:8,r15:14)
	}
	{
		p0 = cmp.eq(r13:12,r21:20)
		if (p0.new) jump:nt .LBB110_32
	}
.LBB110_15:                             // %for.body.i.i
                                        // =>This Inner Loop Header: Depth=1
	{
		r28 = addasl(r0,r8,#4)
	}
	{
		r7 = memw(r28+#8)
		if (!cmp.gt(r7.new,#0)) jump:t .LBB110_17
	}
// %bb.16:                              // %if.then.i.i
                                        //   in Loop: Header=BB110_15 Depth=1
	{
		r28 = memw(r28+#4)
	}
	{
		r28 = add(r28,#-1)
	}
	{
		r23:22 = mpyu(r28,r7)
		r19 = asr(r28,#31)
	}
	{
		r23 += mpyi(r7,r19)
	}
	{
		r5:4 = add(r23:22,r5:4)
	}
.LBB110_17:                             // %if.end.i.i
                                        //   in Loop: Header=BB110_15 Depth=1
	{
		r7 = r8
	}
	{
		r7 = or(#16,asl(r7,#4))
	}
	{
		r28 = add(r0,r7)
	}
	{
		r7 = memw(r28+#8)
		if (!cmp.gt(r7.new,#0)) jump:nt .LBB110_19
	}
// %bb.18:                              // %if.then.i.i.1
                                        //   in Loop: Header=BB110_15 Depth=1
	{
		r28 = memw(r28+#4)
	}
	{
		r28 = add(r28,#-1)
	}
	{
		r23:22 = mpyu(r28,r7)
		r19 = asr(r28,#31)
	}
	{
		r23 += mpyi(r7,r19)
	}
	{
		r5:4 = add(r23:22,r5:4)
	}
.LBB110_19:                             // %if.end.i.i.1
                                        //   in Loop: Header=BB110_15 Depth=1
	{
		r7 = r8
	}
	{
		r7 = or(#32,asl(r7,#4))
	}
	{
		r28 = add(r0,r7)
	}
	{
		r7 = memw(r28+#8)
		if (!cmp.gt(r7.new,#0)) jump:t .LBB110_21
	}
// %bb.20:                              // %if.then.i.i.2
                                        //   in Loop: Header=BB110_15 Depth=1
	{
		r28 = memw(r28+#4)
	}
	{
		r28 = add(r28,#-1)
	}
	{
		r23:22 = mpyu(r28,r7)
		r19 = asr(r28,#31)
	}
	{
		r23 += mpyi(r7,r19)
	}
	{
		r5:4 = add(r23:22,r5:4)
	}
.LBB110_21:                             // %if.end.i.i.2
                                        //   in Loop: Header=BB110_15 Depth=1
	{
		r7 = r8
	}
	{
		r7 = or(#48,asl(r7,#4))
	}
	{
		r28 = add(r0,r7)
	}
	{
		r7 = memw(r28+#8)
		if (!cmp.gt(r7.new,#0)) jump:t .LBB110_23
	}
// %bb.22:                              // %if.then.i.i.3
                                        //   in Loop: Header=BB110_15 Depth=1
	{
		r28 = memw(r28+#4)
	}
	{
		r28 = add(r28,#-1)
	}
	{
		r23:22 = mpyu(r28,r7)
		r19 = asr(r28,#31)
	}
	{
		r23 += mpyi(r7,r19)
	}
	{
		r5:4 = add(r23:22,r5:4)
	}
.LBB110_23:                             // %if.end.i.i.3
                                        //   in Loop: Header=BB110_15 Depth=1
	{
		r7 = r8
	}
	{
		r7 = or(#64,asl(r7,#4))
	}
	{
		r28 = add(r0,r7)
	}
	{
		r7 = memw(r28+#8)
		if (!cmp.gt(r7.new,#0)) jump:t .LBB110_25
	}
// %bb.24:                              // %if.then.i.i.4
                                        //   in Loop: Header=BB110_15 Depth=1
	{
		r28 = memw(r28+#4)
	}
	{
		r28 = add(r28,#-1)
	}
	{
		r23:22 = mpyu(r28,r7)
		r19 = asr(r28,#31)
	}
	{
		r23 += mpyi(r7,r19)
	}
	{
		r5:4 = add(r23:22,r5:4)
	}
.LBB110_25:                             // %if.end.i.i.4
                                        //   in Loop: Header=BB110_15 Depth=1
	{
		r7 = r8
	}
	{
		r7 = or(#80,asl(r7,#4))
	}
	{
		r28 = add(r0,r7)
	}
	{
		r7 = memw(r28+#8)
		if (!cmp.gt(r7.new,#0)) jump:t .LBB110_27
	}
// %bb.26:                              // %if.then.i.i.5
                                        //   in Loop: Header=BB110_15 Depth=1
	{
		r28 = memw(r28+#4)
	}
	{
		r28 = add(r28,#-1)
	}
	{
		r23:22 = mpyu(r28,r7)
		r19 = asr(r28,#31)
	}
	{
		r23 += mpyi(r7,r19)
	}
	{
		r5:4 = add(r23:22,r5:4)
	}
.LBB110_27:                             // %if.end.i.i.5
                                        //   in Loop: Header=BB110_15 Depth=1
	{
		r7 = r8
	}
	{
		r7 = or(#96,asl(r7,#4))
	}
	{
		r28 = add(r0,r7)
	}
	{
		r7 = memw(r28+#8)
		if (!cmp.gt(r7.new,#0)) jump:t .LBB110_29
	}
// %bb.28:                              // %if.then.i.i.6
                                        //   in Loop: Header=BB110_15 Depth=1
	{
		r28 = memw(r28+#4)
	}
	{
		r28 = add(r28,#-1)
	}
	{
		r23:22 = mpyu(r28,r7)
		r19 = asr(r28,#31)
	}
	{
		r23 += mpyi(r7,r19)
	}
	{
		r5:4 = add(r23:22,r5:4)
	}
.LBB110_29:                             // %if.end.i.i.6
                                        //   in Loop: Header=BB110_15 Depth=1
	{
		r7 = r8
	}
	{
		r7 = or(#112,asl(r7,#4))
	}
	{
		r28 = add(r0,r7)
	}
	{
		r7 = memw(r28+#8)
		if (!cmp.gt(r7.new,#0)) jump:t .LBB110_31
	}
// %bb.30:                              // %if.then.i.i.7
                                        //   in Loop: Header=BB110_15 Depth=1
	{
		r28 = memw(r28+#4)
	}
	{
		r28 = add(r28,#-1)
	}
	{
		r23:22 = mpyu(r28,r7)
		r19 = asr(r28,#31)
	}
	{
		r23 += mpyi(r7,r19)
	}
	{
		r5:4 = add(r23:22,r5:4)
		jump .LBB110_31
	}
.LBB110_47:                             // %for.body.i12.i.preheader.new
	{
		r7 = #-8
		r9:8 = combine(#0,#0)
		r15:14 = combine(#0,#8)
		r11:10 = combine(#-1,#-8)
	}
	{
		r12 = and(r6,r7)
		r7:6 = combine(r9,r8)
		r21:20 = combine(#0,#0)
		r13 = #0
	}
	{
		jump .LBB110_48
	}
	.p2align	4
.LBB110_64:                             // %if.end.i22.i.7
                                        //   in Loop: Header=BB110_48 Depth=1
	{
		r13:12 = add(r13:12,r11:10)
		r9:8 = add(r9:8,r15:14)
	}
	{
		p0 = cmp.eq(r13:12,r21:20)
		if (p0.new) jump:nt .LBB110_39
	}
.LBB110_48:                             // %for.body.i12.i
                                        // =>This Inner Loop Header: Depth=1
	{
		r19 = addasl(r0,r8,#4)
	}
	{
		r28 = memw(r19+#8)
		if (cmp.gt(r28.new,#-1)) jump:nt .LBB110_50
	}
// %bb.49:                              // %if.then.i18.i
                                        //   in Loop: Header=BB110_48 Depth=1
	{
		r19 = memw(r19+#4)
	}
	{
		r19 = add(r19,#-1)
	}
	{
		r7:6 += mpy(r19,r28)
	}
.LBB110_50:                             // %if.end.i22.i
                                        //   in Loop: Header=BB110_48 Depth=1
	{
		r28 = r8
	}
	{
		r28 = or(#16,asl(r28,#4))
	}
	{
		r19 = add(r0,r28)
	}
	{
		r28 = memw(r19+#8)
		if (cmp.gt(r28.new,#-1)) jump:t .LBB110_52
	}
// %bb.51:                              // %if.then.i18.i.1
                                        //   in Loop: Header=BB110_48 Depth=1
	{
		r19 = memw(r19+#4)
	}
	{
		r19 = add(r19,#-1)
	}
	{
		r7:6 += mpy(r19,r28)
	}
.LBB110_52:                             // %if.end.i22.i.1
                                        //   in Loop: Header=BB110_48 Depth=1
	{
		r28 = r8
	}
	{
		r28 = or(#32,asl(r28,#4))
	}
	{
		r19 = add(r0,r28)
	}
	{
		r28 = memw(r19+#8)
		if (cmp.gt(r28.new,#-1)) jump:nt .LBB110_54
	}
// %bb.53:                              // %if.then.i18.i.2
                                        //   in Loop: Header=BB110_48 Depth=1
	{
		r19 = memw(r19+#4)
	}
	{
		r19 = add(r19,#-1)
	}
	{
		r7:6 += mpy(r19,r28)
	}
.LBB110_54:                             // %if.end.i22.i.2
                                        //   in Loop: Header=BB110_48 Depth=1
	{
		r28 = r8
	}
	{
		r28 = or(#48,asl(r28,#4))
	}
	{
		r19 = add(r0,r28)
	}
	{
		r28 = memw(r19+#8)
		if (cmp.gt(r28.new,#-1)) jump:nt .LBB110_56
	}
// %bb.55:                              // %if.then.i18.i.3
                                        //   in Loop: Header=BB110_48 Depth=1
	{
		r19 = memw(r19+#4)
	}
	{
		r19 = add(r19,#-1)
	}
	{
		r7:6 += mpy(r19,r28)
	}
.LBB110_56:                             // %if.end.i22.i.3
                                        //   in Loop: Header=BB110_48 Depth=1
	{
		r28 = r8
	}
	{
		r28 = or(#64,asl(r28,#4))
	}
	{
		r19 = add(r0,r28)
	}
	{
		r28 = memw(r19+#8)
		if (cmp.gt(r28.new,#-1)) jump:nt .LBB110_58
	}
// %bb.57:                              // %if.then.i18.i.4
                                        //   in Loop: Header=BB110_48 Depth=1
	{
		r19 = memw(r19+#4)
	}
	{
		r19 = add(r19,#-1)
	}
	{
		r7:6 += mpy(r19,r28)
	}
.LBB110_58:                             // %if.end.i22.i.4
                                        //   in Loop: Header=BB110_48 Depth=1
	{
		r28 = r8
	}
	{
		r28 = or(#80,asl(r28,#4))
	}
	{
		r19 = add(r0,r28)
	}
	{
		r28 = memw(r19+#8)
		if (cmp.gt(r28.new,#-1)) jump:nt .LBB110_60
	}
// %bb.59:                              // %if.then.i18.i.5
                                        //   in Loop: Header=BB110_48 Depth=1
	{
		r19 = memw(r19+#4)
	}
	{
		r19 = add(r19,#-1)
	}
	{
		r7:6 += mpy(r19,r28)
	}
.LBB110_60:                             // %if.end.i22.i.5
                                        //   in Loop: Header=BB110_48 Depth=1
	{
		r28 = r8
	}
	{
		r28 = or(#96,asl(r28,#4))
	}
	{
		r19 = add(r0,r28)
	}
	{
		r28 = memw(r19+#8)
		if (cmp.gt(r28.new,#-1)) jump:nt .LBB110_62
	}
// %bb.61:                              // %if.then.i18.i.6
                                        //   in Loop: Header=BB110_48 Depth=1
	{
		r19 = memw(r19+#4)
	}
	{
		r19 = add(r19,#-1)
	}
	{
		r7:6 += mpy(r19,r28)
	}
.LBB110_62:                             // %if.end.i22.i.6
                                        //   in Loop: Header=BB110_48 Depth=1
	{
		r28 = r8
	}
	{
		r28 = or(#112,asl(r28,#4))
	}
	{
		r19 = add(r0,r28)
	}
	{
		r28 = memw(r19+#8)
		if (cmp.gt(r28.new,#-1)) jump:nt .LBB110_64
	}
// %bb.63:                              // %if.then.i18.i.7
                                        //   in Loop: Header=BB110_48 Depth=1
	{
		r19 = memw(r19+#4)
	}
	{
		r19 = add(r19,#-1)
	}
	{
		r7:6 += mpy(r19,r28)
		jump .LBB110_64
	}
.LBB110_66:
	{
		r19 = #0
	}
.LBB110_68:                             // %cleanup13
	{
		r0 = r19
		r17:16 = memd(r29+#24)
		r19:18 = memd(r29+#16)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#8)
		r23:22 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end110:
	.size	halide_default_device_and_host_malloc, .Lfunc_end110-halide_default_device_and_host_malloc
                                        // -- End function
	.section	.text.halide_default_device_and_host_free,"ax",@progbits
	.weak	halide_default_device_and_host_free // -- Begin function halide_default_device_and_host_free
	.p2align	4
	.type	halide_default_device_and_host_free,@function
halide_default_device_and_host_free:    // @halide_default_device_and_host_free
// %bb.0:                               // %entry
	{
		r17:16 = combine(r0,r1)
		p0 = cmp.eq(r1,#0)
		memd(r29+#-16) = r17:16
		allocframe(#16)
	}                                       // 8-byte Folded Spill
	{
		if (p0) jump:nt .LBB111_1
		memd(r29+#0) = r19:18
	}                                       // 8-byte Folded Spill
// %bb.2:                               // %if.end.i
	{
		r5:4 = combine(#0,#0)
		r2 = memw(r16+#8)
		r1:0 = memd(r16+#0)
	}
	{
		p1 = cmp.eq(r1:0,r5:4)
		p0 = cmp.eq(r2,#0)
		if (p1.new) jump:nt .LBB111_5
	}
// %bb.3:                               // %if.end.i
	{
		if (!p0) jump:nt .LBB111_5
	}
// %bb.4:                               // %if.then8.i
	{
		call ##halide_error_no_device_interface
		r0 = r17
	}
	{
		r18 = r0
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB111_14
	}
	{
		jump .LBB111_11
	}
.LBB111_1:                              // %if.then.i
	{
		r1 = add(pc,##.L.str.30@PCREL)
		r0 = r17
	}
	{
		call ##halide_error_buffer_is_null
	}
	{
		r18 = r0
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB111_14
	}
	{
		jump .LBB111_11
	}
.LBB111_5:                              // %if.end10.i
	{
		if (p0) jump:nt .LBB111_8
	}
// %bb.6:                               // %if.end10.i
	{
		r3:2 = combine(#0,#0)
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (!p0.new) jump:nt .LBB111_8
	}
// %bb.7:                               // %if.then14.i
	{
		call ##halide_error_device_interface_no_device
		r0 = r17
	}
	{
		r18 = r0
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB111_11
	}
.LBB111_14:                             // %cleanup
	{
		r0 = r18
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB111_8:                              // %if.end16.i
	{
		r3:2 = combine(#0,#3)
		r1:0 = memd(r16+#16)
	}
	{
		r0 = and(r0,#3)
		r1 = #0
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (!p0.new) jump:t .LBB111_11
	}
// %bb.9:                               // %if.then24.i
	{
		call ##halide_error_host_and_device_dirty
		r0 = r17
	}
	{
		r18 = r0
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB111_14
	}
.LBB111_11:                             // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split
	{
		call ##halide_device_free
		r1:0 = combine(r16,r17)
	}
	{
		r18 = r0
		r1 = memw(r16+#12)
		if (cmp.eq(r1.new,#0)) jump:nt .LBB111_13
	}
// %bb.12:                              // %if.then2
	{
		call ##halide_free
		r0 = r17
	}
	{
		memw(r16+#12) = #0
	}
.LBB111_13:                             // %if.end5
	{
		r2 = #-4
		r1:0 = memd(r16+#16)
	}
	{
		r0 = and(r0,r2)
	}
	{
		r0 = r18
		r17:16 = memd(r29+#8)
		memd(r16+#16) = r1:0
	}                                       // 8-byte Folded Reload
	{
		r19:18 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end111:
	.size	halide_default_device_and_host_free, .Lfunc_end111-halide_default_device_and_host_free
                                        // -- End function
	.section	.text.halide_device_wrap_native,"ax",@progbits
	.weak	halide_device_wrap_native       // -- Begin function halide_device_wrap_native
	.p2align	4
	.type	halide_device_wrap_native,@function
halide_device_wrap_native:              // @halide_device_wrap_native
// %bb.0:                               // %entry
	{
		r17:16 = combine(r1,r4)
		p0 = cmp.eq(r1,#0)
		memd(r29+#-16) = r17:16
		allocframe(#24)
	}                                       // 8-byte Folded Spill
	{
		r19:18 = combine(r3,r2)
		r20 = r0
		memd(r29+#8) = r19:18
		memd(r29+#0) = r21:20
	}                                       // 8-byte Folded Spill
	{
		if (p0) jump:nt .LBB112_1
	}
// %bb.2:                               // %if.end.i
	{
		r5:4 = combine(#0,#0)
		r0 = memw(r17+#8)
		r3:2 = memd(r17+#0)
	}
	{
		p1 = cmp.eq(r3:2,r5:4)
		p0 = cmp.eq(r0,#0)
		if (p1.new) jump:nt .LBB112_5
	}
// %bb.3:                               // %if.end.i
	{
		if (!p0) jump:nt .LBB112_5
	}
// %bb.4:                               // %if.then8.i
	{
		call ##halide_error_no_device_interface
		r0 = r20
	}
	{
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB112_16
	}
	{
		jump .LBB112_11
	}
.LBB112_1:                              // %if.then.i
	{
		r1 = add(pc,##.L.str.31@PCREL)
		r0 = r20
	}
	{
		call ##halide_error_buffer_is_null
	}
	{
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB112_16
	}
	{
		jump .LBB112_11
	}
.LBB112_5:                              // %if.end10.i
	{
		if (p0) jump:nt .LBB112_8
	}
// %bb.6:                               // %if.end10.i
	{
		r5:4 = combine(#0,#0)
	}
	{
		p0 = cmp.eq(r3:2,r5:4)
		if (!p0.new) jump:nt .LBB112_8
	}
// %bb.7:                               // %if.then14.i
	{
		call ##halide_error_device_interface_no_device
		r0 = r20
	}
	{
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB112_11
	}
.LBB112_16:                             // %cleanup12
	{
		r17:16 = memd(r29+#16)
		r19:18 = memd(r29+#8)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.LBB112_8:                              // %if.end16.i
	{
		r5:4 = combine(#0,#3)
		r3:2 = memd(r17+#16)
	}
	{
		r2 = and(r2,#3)
		r3 = #0
	}
	{
		p0 = cmp.eq(r3:2,r5:4)
		if (!p0.new) jump:t .LBB112_12
	}
// %bb.9:                               // %if.then24.i
	{
		call ##halide_error_host_and_device_dirty
		r0 = r20
	}
	{
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB112_16
	}
.LBB112_11:                             // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	{
		r0 = memw(r17+#8)
	}
.LBB112_12:                             // %if.end
	{
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB112_15
	}
// %bb.13:                              // %if.end
	{
		p0 = cmp.eq(r0,r16); if (p0.new) jump:nt .LBB112_15
	}
// %bb.14:                              // %if.then4
	{
		r1 = add(pc,##.L.str.32@PCREL)
		r0 = r20
	}
	{
		call ##halide_error
	}
	{
		r0 = #-42
		r17:16 = memd(r29+#16)
		r19:18 = memd(r29+#8)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.LBB112_15:                             // %if.end5
	{
		r0 = memw(r16+#60)
	}
	{
		r0 = memw(r0+#0)
	}
	{
		callr r0
	}
	{
		r3:2 = combine(r19,r18)
		r0 = memw(r16+#60)
		memw(r17+#8) = r16
	}
	{
		r1:0 = combine(r17,r20)
		r4 = memw(r0+#56)
	}
	{
		callr r4
	}
	{
		r16 = r0
		r1 = memw(r16+#60)
	}
	{
		r1 = memw(r1+#4)
	}
	{
		callr r1
	}
	{
		p0 = cmp.eq(r16,#0)
	}
	{
		r0 = mux(p0,#0,#-16)
		r17:16 = memd(r29+#16)
		r19:18 = memd(r29+#8)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end112:
	.size	halide_device_wrap_native, .Lfunc_end112-halide_device_wrap_native
                                        // -- End function
	.section	.text.halide_device_detach_native,"ax",@progbits
	.weak	halide_device_detach_native     // -- Begin function halide_device_detach_native
	.p2align	4
	.type	halide_device_detach_native,@function
halide_device_detach_native:            // @halide_device_detach_native
// %bb.0:                               // %entry
	{
		r17:16 = combine(r1,r0)
		p0 = cmp.eq(r1,#0)
		memd(r29+#-16) = r17:16
		allocframe(#16)
	}                                       // 8-byte Folded Spill
	{
		if (p0) jump:nt .LBB113_1
		memd(r29+#0) = r19:18
	}                                       // 8-byte Folded Spill
// %bb.2:                               // %if.end.i
	{
		r3:2 = combine(#0,#0)
		r18 = memw(r17+#8)
		r1:0 = memd(r17+#0)
	}
	{
		p1 = cmp.eq(r1:0,r3:2)
		p0 = cmp.eq(r18,#0)
		if (p1.new) jump:nt .LBB113_5
	}
// %bb.3:                               // %if.end.i
	{
		if (!p0) jump:nt .LBB113_5
	}
// %bb.4:                               // %if.then8.i
	{
		call ##halide_error_no_device_interface
		r0 = r16
	}
	{
		jump .LBB113_10
	}
.LBB113_1:                              // %if.then.i
	{
		r1 = add(pc,##.L.str.33@PCREL)
		r0 = r16
	}
	{
		call ##halide_error_buffer_is_null
	}
	{
		jump .LBB113_10
	}
.LBB113_5:                              // %if.end10.i
	{
		if (p0) jump:nt .LBB113_8
	}
// %bb.6:                               // %if.end10.i
	{
		r3:2 = combine(#0,#0)
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (!p0.new) jump:nt .LBB113_8
	}
// %bb.7:                               // %if.then14.i
	{
		call ##halide_error_device_interface_no_device
		r0 = r16
	}
	{
		jump .LBB113_10
	}
.LBB113_8:                              // %if.end16.i
	{
		r3:2 = combine(#0,#3)
		r1:0 = memd(r17+#16)
	}
	{
		r0 = and(r0,#3)
		r1 = #0
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (!p0.new) jump:t .LBB113_12
	}
// %bb.9:                               // %if.then24.i
	{
		call ##halide_error_host_and_device_dirty
		r0 = r16
	}
.LBB113_10:                             // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
	{
		p0 = cmp.eq(r0,#0)
		if (!p0.new) r17:16 = memd(r29+#8)
		if (!p0.new) r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		if (!p0) r31:30 = dealloc_return(r30):raw
	}
.LBB113_11:                             // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	{
		r18 = memw(r17+#8)
	}
.LBB113_12:                             // %if.end
	{
		p0 = cmp.eq(r18,#0); if (p0.new) jump:nt .LBB113_13
	}
// %bb.14:                              // %if.then3
	{
		r0 = memw(r18+#60)
	}
	{
		r0 = memw(r0+#0)
	}
	{
		callr r0
	}
	{
		r0 = memw(r18+#60)
	}
	{
		r1:0 = combine(r17,r16)
		r2 = memw(r0+#60)
	}
	{
		callr r2
	}
	{
		r18 = r0
		r1 = memw(r18+#60)
	}
	{
		r1 = memw(r1+#4)
	}
	{
		callr r1
	}
	{
		r3:2 = combine(#0,#0)
		r1:0 = memd(r17+#0)
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (p0.new) jump:nt .LBB113_16
	}
// %bb.15:                              // %if.then8
	{
		r1 = add(pc,##.L.str.34@PCREL)
		r0 = r16
	}
	{
		call ##halide_print
	}
	{
		call ##abort
	}
.LBB113_16:                             // %do.end
	{
		p0 = cmp.eq(r18,#0)
	}
	{
		r0 = mux(p0,#0,#-33)
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB113_13:
	{
		r0 = #0
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end113:
	.size	halide_device_detach_native, .Lfunc_end113-halide_device_detach_native
                                        // -- End function
	.section	.text.halide_default_device_wrap_native,"ax",@progbits
	.weak	halide_default_device_wrap_native // -- Begin function halide_default_device_wrap_native
	.p2align	4
	.type	halide_default_device_wrap_native,@function
halide_default_device_wrap_native:      // @halide_default_device_wrap_native
// %bb.0:                               // %entry
	{
		r5:4 = combine(#0,#0)
		r16 = r1
		memd(r29+#-16) = r17:16
		allocframe(#16)
	}                                       // 8-byte Folded Spill
	{
		r0 = #-32
		r7:6 = memd(r1+#0)
	}
	{
		memd(r29+#0) = r19:18
	}                                       // 8-byte Folded Spill
	{
		p0 = cmp.eq(r7:6,r5:4)
		if (!p0.new) r17:16 = memd(r29+#8)
		if (!p0.new) r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		if (!p0) r31:30 = dealloc_return(r30):raw
	}
.LBB114_1:                              // %if.end
	{
		r19:18 = combine(r3,r2)
		r0 = memw(r16+#8)
	}
	{
		r0 = memw(r0+#60)
	}
	{
		r0 = memw(r0+#0)
	}
	{
		callr r0
	}
	{
		r0 = #0
		r17:16 = memd(r29+#8)
		memd(r16+#0) = r19:18
	}                                       // 8-byte Folded Reload
	{
		r19:18 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end114:
	.size	halide_default_device_wrap_native, .Lfunc_end114-halide_default_device_wrap_native
                                        // -- End function
	.section	.text.halide_default_device_detach_native,"ax",@progbits
	.weak	halide_default_device_detach_native // -- Begin function halide_default_device_detach_native
	.p2align	4
	.type	halide_default_device_detach_native,@function
halide_default_device_detach_native:    // @halide_default_device_detach_native
// %bb.0:                               // %entry
	{
		r16 = r1
		p0 = cmp.eq(r1,#0)
		memd(r29+#-16) = r17:16
		allocframe(#16)
	}                                       // 8-byte Folded Spill
	{
		if (p0) jump:nt .LBB115_1
		memd(r29+#0) = r19:18
	}                                       // 8-byte Folded Spill
// %bb.2:                               // %if.end.i
	{
		r5:4 = combine(#0,#0)
		r1 = memw(r16+#8)
		r3:2 = memd(r16+#0)
	}
	{
		p1 = cmp.eq(r3:2,r5:4)
		p0 = cmp.eq(r1,#0)
		if (p1.new) jump:nt .LBB115_5
	}
// %bb.3:                               // %if.end.i
	{
		if (!p0) jump:nt .LBB115_5
	}
// %bb.4:                               // %if.then8.i
	{
		call ##halide_error_no_device_interface
	}
	{
		r17 = r0
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB115_14
	}
	{
		jump .LBB115_11
	}
.LBB115_1:                              // %if.then.i
	{
		r1 = add(pc,##.L.str.35@PCREL)
		call ##halide_error_buffer_is_null
	}
	{
		r17 = r0
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB115_14
	}
	{
		jump .LBB115_11
	}
.LBB115_5:                              // %if.end10.i
	{
		if (p0) jump:nt .LBB115_8
	}
// %bb.6:                               // %if.end10.i
	{
		r5:4 = combine(#0,#0)
	}
	{
		p0 = cmp.eq(r3:2,r5:4)
		if (!p0.new) jump:nt .LBB115_8
	}
// %bb.7:                               // %if.then14.i
	{
		call ##halide_error_device_interface_no_device
	}
	{
		r17 = r0
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB115_11
	}
.LBB115_14:                             // %cleanup
	{
		r0 = r17
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB115_8:                              // %if.end16.i
	{
		r7:6 = combine(#0,#3)
		r5:4 = memd(r16+#16)
	}
	{
		r4 = and(r4,#3)
		r5 = #0
	}
	{
		p0 = cmp.eq(r5:4,r7:6)
		if (!p0.new) jump:t .LBB115_12
	}
// %bb.9:                               // %if.then24.i
	{
		call ##halide_error_host_and_device_dirty
	}
	{
		r17 = r0
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB115_14
	}
.LBB115_11:                             // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	{
		r3:2 = memd(r16+#0)
	}
.LBB115_12:                             // %if.end
	{
		r17 = #0
		r19:18 = combine(#0,#0)
	}
	{
		p0 = cmp.eq(r3:2,r19:18)
		if (p0.new) jump:t .LBB115_14
	}
// %bb.13:                              // %if.end3
	{
		r0 = memw(r16+#8)
	}
	{
		r0 = memw(r0+#60)
	}
	{
		r0 = memw(r0+#4)
	}
	{
		callr r0
	}
	{
		r0 = r17
		memd(r16+#0) = r19:18
		memw(r16+#8) = #0
	}
	{
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end115:
	.size	halide_default_device_detach_native, .Lfunc_end115-halide_default_device_detach_native
                                        // -- End function
	.section	.text.halide_device_and_host_free_as_destructor,"ax",@progbits
	.weak	halide_device_and_host_free_as_destructor // -- Begin function halide_device_and_host_free_as_destructor
	.p2align	4
	.type	halide_device_and_host_free_as_destructor,@function
halide_device_and_host_free_as_destructor: // @halide_device_and_host_free_as_destructor
// %bb.0:                               // %entry
	{
		jump ##halide_device_and_host_free
	}
.Lfunc_end116:
	.size	halide_device_and_host_free_as_destructor, .Lfunc_end116-halide_device_and_host_free_as_destructor
                                        // -- End function
	.section	.text.halide_device_host_nop_free,"ax",@progbits
	.weak	halide_device_host_nop_free     // -- Begin function halide_device_host_nop_free
	.p2align	4
	.type	halide_device_host_nop_free,@function
halide_device_host_nop_free:            // @halide_device_host_nop_free
// %bb.0:                               // %entry
	{
		jumpr r31
	}
.Lfunc_end117:
	.size	halide_device_host_nop_free, .Lfunc_end117-halide_device_host_nop_free
                                        // -- End function
	.section	.text.halide_default_buffer_copy,"ax",@progbits
	.weak	halide_default_buffer_copy      // -- Begin function halide_default_buffer_copy
	.p2align	4
	.type	halide_default_buffer_copy,@function
halide_default_buffer_copy:             // @halide_default_buffer_copy
// %bb.0:                               // %entry
	{
		r0 = #-39
		jumpr r31
	}
.Lfunc_end118:
	.size	halide_default_buffer_copy, .Lfunc_end118-halide_default_buffer_copy
                                        // -- End function
	.section	.text.halide_buffer_copy_already_locked,"ax",@progbits
	.weak	halide_buffer_copy_already_locked // -- Begin function halide_buffer_copy_already_locked
	.p2align	4
	.type	halide_buffer_copy_already_locked,@function
halide_buffer_copy_already_locked:      // @halide_buffer_copy_already_locked
// %bb.0:                               // %entry
	{
		p2 = cmp.eq(r2,#0)
		r17:16 = combine(r1,r3)
		memd(r29+#-16) = r17:16
		allocframe(r29,#472):raw
	}                                       // 8-byte Folded Spill
	{
		r19:18 = combine(r2,r0)
		if (p2) jump:nt .LBB119_6
		memd(r29+#456) = r19:18
		memd(r29+#448) = r21:20
	}                                       // 8-byte Folded Spill
// %bb.1:                               // %land.lhs.true
	{
		r0 = memw(r16+#8)
		if (cmp.eq(r0.new,#0)) jump:nt .LBB119_4
	}
// %bb.2:                               // %land.lhs.true
	{
		p0 = cmp.eq(r0,r19); if (p0.new) jump:nt .LBB119_4
	}
// %bb.3:                               // %if.then
	{
		r1 = add(pc,##.L.str.41@PCREL)
		r0 = r18
	}
	{
		call ##halide_error
	}
	{
		r0 = #-42
	}
.LBB119_41:                             // %cleanup143
	{
		r17:16 = memd(r29+#464)
		r19:18 = memd(r29+#456)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#448)
		r31:30 = dealloc_return(r30):raw
	}                                       // 8-byte Folded Reload
.LBB119_4:                              // %land.lhs.true5
	{
		r3:2 = combine(#0,#0)
		r1:0 = memd(r16+#0)
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (p0.new) jump:nt .LBB119_5
	}
.LBB119_6:                              // %if.end13
	{
		r3:2 = combine(#0,#0)
		r1:0 = memd(r17+#0)
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (p0.new) jump:nt .LBB119_10
		r0 = memw(r17+#12)
	}
// %bb.7:                               // %land.rhs
	{
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB119_8
	}
// %bb.9:                               // %land.end.thread268
	{
		r1:0 = memd(r17+#16)
	}
	{
		p0 = tstbit(r0,#0)
		jump .LBB119_14
	}
.LBB119_10:                             // %land.end
	{
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB119_11
	}
// %bb.13:                              // %land.end.land.rhs26_crit_edge
	{
		p0 = or(p0,!p0)
		r1:0 = memd(r17+#16)
	}
.LBB119_14:                             // %land.rhs26
	{
		r1 = p0
		p0 = !tstbit(r0,#1)
		memw(r29+#20) = r1.new
	}                                       // 4-byte Folded Spill
	{
		p1 = and(p1,!p1)
		if (!p0) jump:nt .LBB119_16
	}
// %bb.15:
	{
		p0 = or(p1,p1)
		r0 = memw(r16+#12)
	}
	{
		p3 = cmp.eq(r0,#0)
		if (p2) jump:nt .LBB119_18
	}
	{
		jump .LBB119_19
	}
.LBB119_16:                             // %lor.rhs28
	{
		r0 = memw(r17+#8)
	}
	{
		p0 = cmp.eq(r0,#0)
	}
	{
		p0 = not(p0)
		r0 = memw(r16+#12)
	}
	{
		p3 = cmp.eq(r0,#0)
		if (p2) jump:nt .LBB119_18
	}
	{
		jump .LBB119_19
	}
.LBB119_8:
	{
		p0 = and(p0,!p0)
		p1 = or(p1,!p1)
	}
	{
		r0 = p0
		jump .LBB119_12
	}
.LBB119_5:                              // %if.then7
	{
		r3 = p2
		r1:0 = combine(r16,r18)
		r2 = r19
	}
	{
		call ##halide_device_malloc
		r20 = r3
		memw(r29+#16) = r20.new
	}                                       // 4-byte Folded Spill
	{
		r1 = r20
		p0 = cmp.eq(r0,#0)
	}
	{
		p2 = r1
		if (!p0) jump:nt .LBB119_41
	}
	{
		jump .LBB119_6
	}
.LBB119_11:
	{
		p1 = or(p1,!p1)
	}
	{
		r0 = p1
	}
.LBB119_12:                             // %land.end32
	{
		p0 = or(p1,p1)
		r0 = memw(r16+#12)
		memw(r29+#20) = r0
	}                                       // 4-byte Folded Spill
	{
		p3 = cmp.eq(r0,#0)
		if (!p2) jump:nt .LBB119_19
	}
.LBB119_18:                             // %land.end32
	{
		r0 = #-34
		if (p3) jump:nt .LBB119_41
	}
.LBB119_19:                             // %if.end41
	{
		r3 = p0
		r0 = p3
		r2 = memw(r29+#20)
		memw(r29+#12) = r0.new
	}                                       // 4-byte Folded Reload
	{
		memw(r29+#8) = r3
	}                                       // 4-byte Folded Spill
	{
		p0 = r2
	}
	{
		p0 = or(p0,p2)
		if (p0.new) jump:t .LBB119_21
	}
// %bb.20:                              // %if.end49
	{
		r5 = p2
		r6 = p1
		r1:0 = combine(r17,r18)
		r3 = memw(r19+#60)
	}
	{
		r20 = r5
		r21 = r6
		memw(r29+#16) = r20.new
	}                                       // 4-byte Folded Spill
	{
		r3:2 = combine(r16,r19)
		r4 = memw(r3+#40)
	}
	{
		callr r4
	}
	{
		r1 = r21
		p0 = cmp.eq(r0,#-42)
	}
	{
		p1 = r1
		r1 = r20
	}
	{
		p2 = r1
		if (!p0) jump:nt .LBB119_35
	}
.LBB119_21:                             // %if.then51
	{
		r0 = memw(r29+#12)
	}                                       // 4-byte Folded Reload
	{
		p0 = r0
		r0 = #-42
	}
	{
		p0 = and(p1,p0)
		if (p0.new) jump:t .LBB119_41
	}
// %bb.22:                              // %if.end58
	{
		p0 = not(p2)
		r1 = memw(r29+#8)
	}                                       // 4-byte Folded Reload
	{
		p1 = r1
		r1 = p2
		memw(r29+#16) = r1.new
	}                                       // 4-byte Folded Spill
	{
		p1 = or(p0,p1)
		if (!p1.new) jump:t .LBB119_23
	}
// %bb.24:                              // %if.else
	{
		r1 = memw(r29+#20)
	}                                       // 4-byte Folded Reload
	{
		p1 = r1
	}
	{
		p0 = or(p0,p1)
		if (!p0.new) jump:t .LBB119_25
	}
// %bb.28:                              // %if.else81
	{
		r1 = memw(r29+#12)
	}                                       // 4-byte Folded Reload
	{
		p0 = r1
		r1 = memw(r29+#20)
	}                                       // 4-byte Folded Reload
	{
		p1 = r1
	}
	{
		p0 = or(p1,p0)
		if (!p0.new) jump:t .LBB119_29
	}
// %bb.31:                              // %if.else98
	{
		if (p2) jump:nt .LBB119_41
	}
// %bb.32:                              // %if.then100
	{
		call ##_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t
		r1:0 = combine(r17,r18)
	}
	{
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB119_41
	}
// %bb.33:                              // %if.then105
	{
		r1:0 = combine(r17,r18)
		r3 = memw(r19+#60)
	}
	{
		r3:2 = combine(r16,r19)
		r4 = memw(r3+#40)
	}
	{
		callr r4
	}
	{
		jump .LBB119_34
	}
.LBB119_23:                             // %if.end117.thread262
	{
		r1 = r17
		r3:2 = combine(r16,#1)
		r4 = #1
		r0 = add(r29,#24)
	}
	{
		call ##_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b
	}
	{
		call ##_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv
		r0 = add(r29,#24)
		r1 = r18
	}
	{
		r0 = memw(r29+#16)
	}                                       // 4-byte Folded Reload
	{
		p2 = r0
		jump .LBB119_36
	}
.LBB119_25:                             // %if.then66
	{
		r1:0 = combine(r17,r18)
		r3 = memw(r17+#8)
	}
	{
		r3 = memw(r3+#60)
	}
	{
		r3:2 = combine(r16,#0)
		r4 = memw(r3+#40)
	}
	{
		callr r4
	}
	{
		p0 = cmp.eq(r0,#-42)
		r1 = memw(r29+#16)
	}                                       // 4-byte Folded Reload
	{
		p2 = r1
		if (!p0) jump:nt .LBB119_35
	}
// %bb.26:                              // %if.then74
	{
		call ##_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t
		r1:0 = combine(r17,r18)
	}
	{
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB119_41
	}
// %bb.27:                              // %if.then77
	{
		call ##halide_buffer_copy_already_locked
		r1:0 = combine(r17,r18)
		r3:2 = combine(r16,#0)
	}
	{
		jump .LBB119_34
	}
.LBB119_29:                             // %if.then85
	{
		r1:0 = combine(r17,r18)
		r3 = memw(r17+#8)
	}
	{
		r3 = memw(r3+#60)
	}
	{
		r3:2 = combine(r16,#0)
		r4 = memw(r3+#40)
	}
	{
		callr r4
	}
	{
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB119_41
	}
// %bb.30:                              // %if.then95
	{
		r1:0 = combine(r16,r18)
		r2 = r19
		r5:4 = memd(r16+#16)
	}
	{
		r4 = setbit(r4,#0)
	}
	{
		call ##copy_to_device_already_locked
		memd(r16+#16) = r5:4
	}
.LBB119_34:                             // %if.end117
	{
		r1 = memw(r29+#16)
	}                                       // 4-byte Folded Reload
	{
		p2 = r1
	}
.LBB119_35:                             // %if.end117
	{
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB119_41
	}
.LBB119_36:                             // %land.lhs.true126
	{
		r0 = #0
		p0 = cmp.eq(r16,r17); if (p0.new) jump:t .LBB119_41
	}
// %bb.37:                              // %if.then128
	{
		r1 = #-4
		r3:2 = memd(r16+#16)
	}
	{
		r1 = and(r2,r1)
		if (p2) jump:nt .LBB119_39
	}
// %bb.38:                              // %if.then130
	{
		r2 = setbit(r1,#1)
		jump .LBB119_40
	}
.LBB119_39:                             // %if.else133
	{
		r2 = setbit(r1,#0)
	}
.LBB119_40:                             // %cleanup143
	{
		r17:16 = memd(r29+#464)
		memd(r16+#16) = r3:2
	}                                       // 8-byte Folded Reload
	{
		r19:18 = memd(r29+#456)
		r21:20 = memd(r29+#448)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end119:
	.size	halide_buffer_copy_already_locked, .Lfunc_end119-halide_buffer_copy_already_locked
                                        // -- End function
	.section	.text.halide_buffer_copy,"ax",@progbits
	.weak	halide_buffer_copy              // -- Begin function halide_buffer_copy
	.p2align	4
	.type	halide_buffer_copy,@function
halide_buffer_copy:                     // @halide_buffer_copy
// %bb.0:                               // %entry
	{
		r17:16 = combine(r2,r1)
		memd(r29+#-16) = r17:16
		allocframe(#40)
	}                                       // 8-byte Folded Spill
	{
		r20 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		memd(r29+#16) = r21:20
		memd(r29+#24) = r19:18
	}                                       // 8-byte Folded Spill
	{
		r19:18 = combine(r3,r0)
	}
	{
		call ##halide_mutex_lock
		r0 = memw(r20+##_ZN6Halide7Runtime8Internal17device_copy_mutexE@GOT)
	}
	{
		p0 = cmp.eq(r17,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB120_2
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.1:                               // %if.then
	{
		r0 = memw(r17+#60)
	}
	{
		r0 = memw(r0+#0)
	}
	{
		callr r0
	}
.LBB120_2:                              // %if.end
	{
		r0 = memw(r16+#8)
		if (cmp.eq(r0.new,#0)) jump:nt .LBB120_4
	}
// %bb.3:                               // %if.then12
	{
		r0 = memw(r0+#60)
	}
	{
		r0 = memw(r0+#0)
	}
	{
		callr r0
	}
.LBB120_4:                              // %if.end16
	{
		call ##halide_buffer_copy_already_locked
		r1:0 = combine(r16,r18)
		r3:2 = combine(r19,r17)
	}
	{
		r18 = r0
		r2 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r2
		if (p0.new) jump:nt .LBB120_6
	}
// %bb.5:                               // %if.then18
	{
		r0 = memw(r17+#60)
	}
	{
		r0 = memw(r0+#4)
	}
	{
		callr r0
	}
.LBB120_6:                              // %if.end20
	{
		r0 = memw(r16+#8)
		if (cmp.eq(r0.new,#0)) jump:nt .LBB120_8
	}
// %bb.7:                               // %if.then23
	{
		r0 = memw(r0+#60)
	}
	{
		r0 = memw(r0+#4)
	}
	{
		callr r0
	}
.LBB120_8:                              // %if.end27
	{
		call ##halide_mutex_unlock
		r0 = memw(r20+##_ZN6Halide7Runtime8Internal17device_copy_mutexE@GOT)
	}
	{
		r0 = r18
		r17:16 = memd(r29+#32)
		r19:18 = memd(r29+#24)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#16)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end120:
	.size	halide_buffer_copy, .Lfunc_end120-halide_buffer_copy
                                        // -- End function
	.section	.text.halide_default_device_crop,"ax",@progbits
	.weak	halide_default_device_crop      // -- Begin function halide_default_device_crop
	.p2align	4
	.type	halide_default_device_crop,@function
halide_default_device_crop:             // @halide_default_device_crop
// %bb.0:                               // %entry
	{
		r1 = add(pc,##.L.str.58@PCREL)
		allocframe(r29,#0):raw
	}
	{
		call ##halide_error
	}
	{
		r0 = #-40
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end121:
	.size	halide_default_device_crop, .Lfunc_end121-halide_default_device_crop
                                        // -- End function
	.section	.text.halide_default_device_slice,"ax",@progbits
	.weak	halide_default_device_slice     // -- Begin function halide_default_device_slice
	.p2align	4
	.type	halide_default_device_slice,@function
halide_default_device_slice:            // @halide_default_device_slice
// %bb.0:                               // %entry
	{
		r1 = add(pc,##.L.str.59@PCREL)
		allocframe(r29,#0):raw
	}
	{
		call ##halide_error
	}
	{
		r0 = #-40
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end122:
	.size	halide_default_device_slice, .Lfunc_end122-halide_default_device_slice
                                        // -- End function
	.section	.text.halide_device_crop,"ax",@progbits
	.weak	halide_device_crop              // -- Begin function halide_device_crop
	.p2align	4
	.type	halide_device_crop,@function
halide_device_crop:                     // @halide_device_crop
// %bb.0:                               // %entry
	{
		r17:16 = combine(r2,r0)
		memd(r29+#-16) = r17:16
		allocframe(#16)
	}                                       // 8-byte Folded Spill
	{
		r19 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		r18 = r1
		memd(r29+#0) = r19:18
	}                                       // 8-byte Folded Spill
	{
		call ##halide_mutex_lock
		r0 = memw(r19+##_ZN6Halide7Runtime8Internal17device_copy_mutexE@GOT)
	}
	{
		r1:0 = combine(#0,#0)
		r3:2 = memd(r18+#0)
	}
	{
		p0 = cmp.eq(r3:2,r1:0)
		if (p0.new) jump:nt .LBB123_1
	}
// %bb.2:                               // %if.end
	{
		r3:2 = memd(r17+#0)
	}
	{
		p0 = cmp.eq(r3:2,r1:0)
		if (p0.new) jump:nt .LBB123_5
	}
// %bb.3:                               // %if.then3
	{
		r1 = add(pc,##.L.str.60@PCREL)
		jump .LBB123_4
	}
.LBB123_1:
	{
		r16 = #0 ; jump .LBB123_8
	}
.LBB123_5:                              // %if.end4
	{
		r0 = memw(r18+#28)
	}
	{
		r1 = memw(r17+#28)
		if (!cmp.eq(r1.new,r0)) jump:t .LBB123_6
	}
// %bb.7:                               // %if.end7
	{
		r0 = memw(r18+#8)
	}
	{
		r0 = memw(r0+#60)
	}
	{
		r0 = memw(r0+#0)
	}
	{
		callr r0
	}
	{
		r2 = r17
		r0 = memw(r18+#8)
	}
	{
		r0 = memw(r0+#60)
	}
	{
		r1:0 = combine(r18,r16)
		r3 = memw(r0+#44)
	}
	{
		callr r3
	}
	{
		r16 = r0 ; jump .LBB123_8
	}
.LBB123_6:                              // %if.then6
	{
		r1 = add(pc,##.L.str.61@PCREL)
	}
.LBB123_4:                              // %cleanup
	{
		call ##halide_error
		r0 = r16
		r16 = #-41
	}
.LBB123_8:                              // %cleanup
	{
		call ##halide_mutex_unlock
		r0 = memw(r19+##_ZN6Halide7Runtime8Internal17device_copy_mutexE@GOT)
	}
	{
		r0 = r16
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end123:
	.size	halide_device_crop, .Lfunc_end123-halide_device_crop
                                        // -- End function
	.section	.text.halide_device_slice,"ax",@progbits
	.weak	halide_device_slice             // -- Begin function halide_device_slice
	.p2align	4
	.type	halide_device_slice,@function
halide_device_slice:                    // @halide_device_slice
// %bb.0:                               // %entry
	{
		r17:16 = combine(r4,r0)
		memd(r29+#-16) = r17:16
		allocframe(#24)
	}                                       // 8-byte Folded Spill
	{
		r21 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		memd(r29+#0) = r21:20
		memd(r29+#8) = r19:18
	}                                       // 8-byte Folded Spill
	{
		r19:18 = combine(r2,r3)
		r20 = r1
	}
	{
		call ##halide_mutex_lock
		r0 = memw(r21+##_ZN6Halide7Runtime8Internal17device_copy_mutexE@GOT)
	}
	{
		r1:0 = combine(#0,#0)
		r3:2 = memd(r20+#0)
	}
	{
		p0 = cmp.eq(r3:2,r1:0)
		if (p0.new) jump:nt .LBB124_1
	}
// %bb.2:                               // %if.end
	{
		r3:2 = memd(r17+#0)
	}
	{
		p0 = cmp.eq(r3:2,r1:0)
		if (p0.new) jump:nt .LBB124_5
	}
// %bb.3:                               // %if.then3
	{
		r1 = add(pc,##.L.str.60@PCREL)
		jump .LBB124_4
	}
.LBB124_1:
	{
		r16 = #0 ; jump .LBB124_8
	}
.LBB124_5:                              // %if.end4
	{
		r1 = memw(r17+#28)
		r0 = memw(r20+#28)
	}
	{
		r1 = add(r1,#1)
		if (!cmp.eq(r1.new,r0)) jump:t .LBB124_6
	}
// %bb.7:                               // %if.end7
	{
		r0 = memw(r20+#8)
	}
	{
		r0 = memw(r0+#60)
	}
	{
		r0 = memw(r0+#0)
	}
	{
		callr r0
	}
	{
		r3:2 = combine(r18,r19)
		r4 = r17
		r1 = memw(r20+#8)
	}
	{
		r1 = memw(r1+#60)
	}
	{
		r1:0 = combine(r20,r16)
		r5 = memw(r1+#48)
	}
	{
		callr r5
	}
	{
		r16 = r0 ; jump .LBB124_8
	}
.LBB124_6:                              // %if.then6
	{
		r1 = add(pc,##.L.str.64@PCREL)
	}
.LBB124_4:                              // %cleanup
	{
		call ##halide_error
		r0 = r16
		r16 = #-41
	}
.LBB124_8:                              // %cleanup
	{
		call ##halide_mutex_unlock
		r0 = memw(r21+##_ZN6Halide7Runtime8Internal17device_copy_mutexE@GOT)
	}
	{
		r0 = r16
		r17:16 = memd(r29+#16)
		r19:18 = memd(r29+#8)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end124:
	.size	halide_device_slice, .Lfunc_end124-halide_device_slice
                                        // -- End function
	.section	.text.halide_default_device_release_crop,"ax",@progbits
	.weak	halide_default_device_release_crop // -- Begin function halide_default_device_release_crop
	.p2align	4
	.type	halide_default_device_release_crop,@function
halide_default_device_release_crop:     // @halide_default_device_release_crop
// %bb.0:                               // %entry
	{
		r5:4 = combine(#0,#0)
		r3:2 = memd(r1+#0)
	}
	{
		p0 = cmp.eq(r3:2,r5:4)
		if (p0.new) r0 = #0
		if (p0.new) jumpr:nt r31
	}
.LBB125_1:                              // %if.end
	{
		r1 = add(pc,##.L.str.58@PCREL)
		allocframe(r29,#0):raw
	}
	{
		call ##halide_error
	}
	{
		r0 = #-40
		r31:30 = deallocframe(r30):raw
	}
	{
		jumpr r31
	}
.Lfunc_end125:
	.size	halide_default_device_release_crop, .Lfunc_end125-halide_default_device_release_crop
                                        // -- End function
	.section	.text.halide_device_release_crop,"ax",@progbits
	.weak	halide_device_release_crop      // -- Begin function halide_device_release_crop
	.p2align	4
	.type	halide_device_release_crop,@function
halide_device_release_crop:             // @halide_device_release_crop
// %bb.0:                               // %entry
	{
		memd(r29+#-16) = r17:16
		allocframe(#24)
	}                                       // 8-byte Folded Spill
	{
		r3:2 = memd(r1+#0)
	}
	{
		r21:20 = combine(#0,#0)
		memd(r29+#0) = r21:20
		memd(r29+#8) = r19:18
	}                                       // 8-byte Folded Spill
	{
		p0 = cmp.eq(r3:2,r21:20)
		if (p0.new) jump:nt .LBB126_2
	}
// %bb.1:                               // %if.then
	{
		r2 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		r17:16 = combine(r0,r1)
	}
	{
		r18 = memw(r2+##_ZN6Halide7Runtime8Internal17device_copy_mutexE@GOT)
	}
	{
		call ##halide_mutex_lock
		r0 = r18
	}
	{
		r19 = memw(r16+#8)
	}
	{
		r0 = memw(r19+#60)
	}
	{
		r1:0 = combine(r16,r17)
		r2 = memw(r0+#52)
	}
	{
		callr r2
	}
	{
		r17 = r0
		r1 = memw(r19+#60)
		memd(r16+#0) = r21:20
	}
	{
		r1 = memw(r1+#4)
	}
	{
		callr r1
	}
	{
		call ##halide_mutex_unlock
		r0 = r18
		memw(r16+#8) = #0
	}
	{
		r0 = r17
		r17:16 = memd(r29+#16)
		r19:18 = memd(r29+#8)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.LBB126_2:                              // %return
	{
		r0 = #0
		r17:16 = memd(r29+#16)
		r19:18 = memd(r29+#8)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end126:
	.size	halide_device_release_crop, .Lfunc_end126-halide_device_release_crop
                                        // -- End function
	.section	.text.halide_float16_bits_to_float,"ax",@progbits
	.weak	halide_float16_bits_to_float    // -- Begin function halide_float16_bits_to_float
	.p2align	4
	.type	halide_float16_bits_to_float,@function
halide_float16_bits_to_float:           // @halide_float16_bits_to_float
// %bb.0:                               // %entry
	{
		r3 = extractu(r0,#5,#10)
		r1 = extractu(r0,#10,#0)
	}
	{
		p0 = cmp.eq(r3,#0); if (!p0.new) jump:nt .LBB127_3
	}
// %bb.1:                               // %entry
	{
		p1 = cmp.eq(r1,#0); if (p1.new) jump:nt .LBB127_3
	}
// %bb.2:                               // %if.then
	{
		r2 = cl0(r1)
		r3 = #31
		r4 = #-2
		r5 = #-2
	}
	{
		r2 = sub(##1124073472,asl(r2,#23))
		r3 = xor(r2,r3)
	}
	{
		r5:4 = asl(r5:4,r3)
		r3 = sub(#23,r3)
	}
	{
		r1 = and(r1,r5)
	}
	{
		r1 = asl(r1,r3)
	}
.LBB127_7:                              // %if.end28
	{
		r0 = and(##-2147483648,asl(r0,#16))
	}
	{
		r1 |= or(r2,r0)
	}
	{
		r0 = r1
		jumpr r31
	}
.LBB127_3:                              // %if.else
	{
		r2 = asl(r1,#13)
		if (p0) jump:nt .LBB127_4
	}
// %bb.5:                               // %if.else18
	{
		r1 = ##2139095040
		p0 = cmp.eq(r3,#31); if (p0.new) jump:t .LBB127_7
	}
// %bb.6:                               // %if.else21
	{
		r3 = add(##939524096,asl(r3,#23))
	}
	{
		r0 = and(##-2147483648,asl(r0,#16))
		r1 = r3
	}
	{
		r1 |= or(r2,r0)
	}
	{
		r0 = r1
		jumpr r31
	}
.LBB127_4:
	{
		r0 = and(##-2147483648,asl(r0,#16))
		r1 = #0
	}
	{
		r1 |= or(r2,r0)
	}
	{
		r0 = r1
		jumpr r31
	}
.Lfunc_end127:
	.size	halide_float16_bits_to_float, .Lfunc_end127-halide_float16_bits_to_float
                                        // -- End function
	.section	.text.halide_float16_bits_to_double,"ax",@progbits
	.weak	halide_float16_bits_to_double   // -- Begin function halide_float16_bits_to_double
	.p2align	4
	.type	halide_float16_bits_to_double,@function
halide_float16_bits_to_double:          // @halide_float16_bits_to_double
// %bb.0:                               // %entry
	{
		call ##halide_float16_bits_to_float
		allocframe(r29,#0):raw
	}
	{
		r1:0 = convert_sf2df(r0)
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end128:
	.size	halide_float16_bits_to_double, .Lfunc_end128-halide_float16_bits_to_double
                                        // -- End function
	.section	.text.halide_error_bounds_inference_call_failed,"ax",@progbits
	.weak	halide_error_bounds_inference_call_failed // -- Begin function halide_error_bounds_inference_call_failed
	.p2align	4
	.type	halide_error_bounds_inference_call_failed,@function
halide_error_bounds_inference_call_failed: // @halide_error_bounds_inference_call_failed
// %bb.0:                               // %entry
	{
		r17:16 = combine(r1,r2)
		r1 = #0
		memd(r29+#-16) = r17:16
		allocframe(#40)
	}                                       // 8-byte Folded Spill
	{
		r18 = r0
		r0 = #1024
		memd(r29+#24) = r19:18
		memd(r29+#16) = r21:20
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
	}
	{
		r20 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB129_1
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.2:                               // %if.then6.i
	{
		r2 = add(pc,##.L.str.36@PCREL)
		r19 = add(r20,#1023)
		r3 = #0
	}
	{
		r1:0 = combine(r19,r20)
		jump .LBB129_3
		memb(r20+#1023) = r3
	}
.LBB129_1:                              // %entry.split
	{
		r2 = add(pc,##.L.str.36@PCREL)
		r19 = #0
		r1:0 = combine(#0,#0)
	}
.LBB129_3:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r19
		r2 = r17
	}
	{
		r2 = add(pc,##.L.str.1.37@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
		r17 = asr(r16,#31)
	}
	{
		r3:2 = combine(r17,r16)
		r4 = #1
		r1 = r19
	}
	{
		call ##halide_int64_to_string
	}
	{
		r1 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r1
		if (p0.new) jump:nt .LBB129_4
	}
// %bb.5:                               // %if.else.i
	{
		r1:0 = combine(r20,r18)
		r5:4 = combine(#0,#1)
		r3:2 = combine(#0,r0)
	}
	{
		r21 = r3
	}
	{
		r3:2 = sub(r3:2,r21:20)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = add(r3:2,r5:4)
	}
	{
		r1 = r20 ; jump .LBB129_6
	}
.LBB129_4:
	{
		r1 = add(pc,##.L.str.7.123@PCREL)
	}
.LBB129_6:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
		r0 = r18
	}
	{
		call ##free
		r0 = r20
	}
	{
		r0 = r16
		r17:16 = memd(r29+#32)
		r19:18 = memd(r29+#24)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#16)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end129:
	.size	halide_error_bounds_inference_call_failed, .Lfunc_end129-halide_error_bounds_inference_call_failed
                                        // -- End function
	.section	.text.halide_error_extern_stage_failed,"ax",@progbits
	.weak	halide_error_extern_stage_failed // -- Begin function halide_error_extern_stage_failed
	.p2align	4
	.type	halide_error_extern_stage_failed,@function
halide_error_extern_stage_failed:       // @halide_error_extern_stage_failed
// %bb.0:                               // %entry
	{
		r17:16 = combine(r1,r2)
		r1 = #0
		memd(r29+#-16) = r17:16
		allocframe(#40)
	}                                       // 8-byte Folded Spill
	{
		r18 = r0
		r0 = #1024
		memd(r29+#24) = r19:18
		memd(r29+#16) = r21:20
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
	}
	{
		r20 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB130_1
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.2:                               // %if.then6.i
	{
		r2 = add(pc,##.L.str.2.38@PCREL)
		r19 = add(r20,#1023)
		r3 = #0
	}
	{
		r1:0 = combine(r19,r20)
		jump .LBB130_3
		memb(r20+#1023) = r3
	}
.LBB130_1:                              // %entry.split
	{
		r2 = add(pc,##.L.str.2.38@PCREL)
		r19 = #0
		r1:0 = combine(#0,#0)
	}
.LBB130_3:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r19
		r2 = r17
	}
	{
		r2 = add(pc,##.L.str.1.37@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
		r17 = asr(r16,#31)
	}
	{
		r3:2 = combine(r17,r16)
		r4 = #1
		r1 = r19
	}
	{
		call ##halide_int64_to_string
	}
	{
		r1 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r1
		if (p0.new) jump:nt .LBB130_4
	}
// %bb.5:                               // %if.else.i
	{
		r1:0 = combine(r20,r18)
		r5:4 = combine(#0,#1)
		r3:2 = combine(#0,r0)
	}
	{
		r21 = r3
	}
	{
		r3:2 = sub(r3:2,r21:20)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = add(r3:2,r5:4)
	}
	{
		r1 = r20 ; jump .LBB130_6
	}
.LBB130_4:
	{
		r1 = add(pc,##.L.str.7.123@PCREL)
	}
.LBB130_6:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
		r0 = r18
	}
	{
		call ##free
		r0 = r20
	}
	{
		r0 = r16
		r17:16 = memd(r29+#32)
		r19:18 = memd(r29+#24)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#16)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end130:
	.size	halide_error_extern_stage_failed, .Lfunc_end130-halide_error_extern_stage_failed
                                        // -- End function
	.section	.text.halide_error_explicit_bounds_too_small,"ax",@progbits
	.weak	halide_error_explicit_bounds_too_small // -- Begin function halide_error_explicit_bounds_too_small
	.p2align	4
	.type	halide_error_explicit_bounds_too_small,@function
halide_error_explicit_bounds_too_small: // @halide_error_explicit_bounds_too_small
// %bb.0:                               // %entry
	{
		r16 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#64)
	}                                       // 8-byte Folded Spill
	{
		r19 = r1
		r1 = #0
		memd(r29+#48) = r19:18
		memd(r29+#40) = r21:20
	}                                       // 8-byte Folded Spill
	{
		r22 = r5
		r24 = r4
		memd(r29+#32) = r23:22
		memd(r29+#24) = r25:24
	}                                       // 8-byte Folded Spill
	{
		r26 = r3
		r21 = r2
		r20 = memw(r29+#72)
		memd(r29+#16) = r27:26
	}
	{
		call ##malloc
	}
	{
		r18 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB131_1
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.2:                               // %if.then6.i
	{
		r2 = add(pc,##.L.str.3.39@PCREL)
		r17 = add(r18,#1023)
		r3 = #0
	}
	{
		r1:0 = combine(r17,r18)
		jump .LBB131_3
		memb(r18+#1023) = r3
	}
.LBB131_1:                              // %entry.split
	{
		r2 = add(pc,##.L.str.3.39@PCREL)
		r17 = #0
		r1:0 = combine(#0,#0)
	}
.LBB131_3:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r17
		r2 = r21
	}
	{
		r2 = add(pc,##.L.str.4.40@PCREL)
		r1 = r17
	}
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r17
		r2 = r19
	}
	{
		r2 = add(pc,##.L.str.5.41@PCREL)
		r1 = r17
	}
	{
		call ##halide_string_to_string
		r27 = asr(r26,#31)
	}
	{
		r3:2 = combine(r27,r26)
		r4 = #1
		r1 = r17
	}
	{
		r19 = add(pc,##.L.str.6.42@PCREL)
		call ##halide_int64_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r17
		r2 = r19
	}
	{
		r25 = asr(r24,#31)
		r4 = #1
		r1 = r17
	}
	{
		call ##halide_int64_to_string
		r3:2 = combine(r25,r24)
	}
	{
		r2 = add(pc,##.L.str.7.43@PCREL)
		r1 = r17
	}
	{
		call ##halide_string_to_string
		r23 = asr(r22,#31)
	}
	{
		r3:2 = combine(r23,r22)
		r4 = #1
		r1 = r17
	}
	{
		call ##halide_int64_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r17
		r2 = r19
	}
	{
		r21 = asr(r20,#31)
		r4 = #1
		r1 = r17
	}
	{
		call ##halide_int64_to_string
		r3:2 = combine(r21,r20)
	}
	{
		r2 = add(pc,##.L.str.8.44@PCREL)
		r1 = r17
	}
	{
		call ##halide_string_to_string
	}
	{
		r1 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r1
		if (p0.new) jump:nt .LBB131_4
	}
// %bb.5:                               // %if.else.i
	{
		r1:0 = combine(r18,r16)
		r5:4 = combine(#0,#1)
		r3:2 = combine(#0,r0)
	}
	{
		r19 = r3
	}
	{
		r3:2 = sub(r3:2,r19:18)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = add(r3:2,r5:4)
	}
	{
		r1 = r18 ; jump .LBB131_6
	}
.LBB131_4:
	{
		r1 = add(pc,##.L.str.7.123@PCREL)
	}
.LBB131_6:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
		r0 = r16
	}
	{
		call ##free
		r0 = r18
	}
	{
		r0 = #-2
		r17:16 = memd(r29+#56)
		r19:18 = memd(r29+#48)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#40)
		r23:22 = memd(r29+#32)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#24)
		r27:26 = memd(r29+#16)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end131:
	.size	halide_error_explicit_bounds_too_small, .Lfunc_end131-halide_error_explicit_bounds_too_small
                                        // -- End function
	.section	.text.halide_error_bad_type,"ax",@progbits
	.weak	halide_error_bad_type           // -- Begin function halide_error_bad_type
	.p2align	4
	.type	halide_error_bad_type,@function
halide_error_bad_type:                  // @halide_error_bad_type
// %bb.0:                               // %entry
	{
		r16 = r0
		memd(r29+#-16) = r17:16
		allocframe(#48)
	}                                       // 8-byte Folded Spill
	{
		r0 = add(r29,#12)
	}
	{
		r19 = r1
		r1 = add(r29,#16)
		memd(r29+#32) = r19:18
		memw(r29+#20) = r2
	}                                       // 8-byte Folded Spill
	{
		r3:2 = combine(#0,#4)
		memw(r29+#16) = r3
		memh(r29+#12) = #0
	}
	{
		memh(r29+#14) = #0
		memh(r29+#8) = #0
	}
	{
		call ##memcpy
		memh(r29+#10) = #0
	}
	{
		r3:2 = combine(#0,#4)
		r0 = add(r29,#8)
		r1 = add(r29,#20)
	}
	{
		call ##memcpy
	}
	{
		call ##malloc
		r0 = #1024
		r1 = #0
	}
	{
		r18 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB132_1
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.2:                               // %if.then6.i
	{
		r17 = add(r18,#1023)
		r3:2 = combine(#0,r19)
	}
	{
		r1:0 = combine(r17,r18)
		jump .LBB132_3
		memb(r18+#1023) = r3
	}
.LBB132_1:                              // %entry.split
	{
		r2 = r19
		r17 = #0
		r1:0 = combine(#0,#0)
	}
.LBB132_3:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
	}
	{
		r2 = add(pc,##.L.str.9.45@PCREL)
		r1 = r17
	}
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_type_to_string
		r2 = add(r29,#12)
		r1 = r17
	}
	{
		r2 = add(pc,##.L.str.10.46@PCREL)
		r1 = r17
	}
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_type_to_string
		r2 = add(r29,#8)
		r1 = r17
	}
	{
		r1 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r1
		if (p0.new) jump:nt .LBB132_4
	}
// %bb.5:                               // %if.else.i
	{
		r1:0 = combine(r18,r16)
		r5:4 = combine(#0,#1)
		r3:2 = combine(#0,r0)
	}
	{
		r19 = r3
	}
	{
		r3:2 = sub(r3:2,r19:18)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = add(r3:2,r5:4)
	}
	{
		r1 = r18 ; jump .LBB132_6
	}
.LBB132_4:
	{
		r1 = add(pc,##.L.str.7.123@PCREL)
	}
.LBB132_6:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
		r0 = r16
	}
	{
		call ##free
		r0 = r18
	}
	{
		r0 = #-3
		r17:16 = memd(r29+#40)
		r19:18 = memd(r29+#32)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end132:
	.size	halide_error_bad_type, .Lfunc_end132-halide_error_bad_type
                                        // -- End function
	.section	.text.halide_error_bad_dimensions,"ax",@progbits
	.weak	halide_error_bad_dimensions     // -- Begin function halide_error_bad_dimensions
	.p2align	4
	.type	halide_error_bad_dimensions,@function
halide_error_bad_dimensions:            // @halide_error_bad_dimensions
// %bb.0:                               // %entry
	{
		r16 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#48)
	}                                       // 8-byte Folded Spill
	{
		r19 = r1
		r1 = #0
		memd(r29+#32) = r19:18
		memd(r29+#24) = r21:20
	}                                       // 8-byte Folded Spill
	{
		r20 = r2
		r22 = r3
		memd(r29+#16) = r23:22
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
	}
	{
		r18 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB133_1
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.2:                               // %if.then6.i
	{
		r17 = add(r18,#1023)
		r3:2 = combine(#0,r19)
	}
	{
		r1:0 = combine(r17,r18)
		jump .LBB133_3
		memb(r18+#1023) = r3
	}
.LBB133_1:                              // %entry.split
	{
		r2 = r19
		r17 = #0
		r1:0 = combine(#0,#0)
	}
.LBB133_3:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
	}
	{
		r2 = add(pc,##.L.str.11.47@PCREL)
		r1 = r17
	}
	{
		call ##halide_string_to_string
		r23 = asr(r22,#31)
	}
	{
		r3:2 = combine(r23,r22)
		r4 = #1
		r1 = r17
	}
	{
		call ##halide_int64_to_string
	}
	{
		r2 = add(pc,##.L.str.12.48@PCREL)
		r1 = r17
	}
	{
		call ##halide_string_to_string
		r21 = asr(r20,#31)
	}
	{
		r3:2 = combine(r21,r20)
		r4 = #1
		r1 = r17
	}
	{
		call ##halide_int64_to_string
	}
	{
		r2 = add(pc,##.L.str.13.49@PCREL)
		r1 = r17
	}
	{
		call ##halide_string_to_string
	}
	{
		r1 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r1
		if (p0.new) jump:nt .LBB133_4
	}
// %bb.5:                               // %if.else.i
	{
		r1:0 = combine(r18,r16)
		r5:4 = combine(#0,#1)
		r3:2 = combine(#0,r0)
	}
	{
		r19 = r3
	}
	{
		r3:2 = sub(r3:2,r19:18)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = add(r3:2,r5:4)
	}
	{
		r1 = r18 ; jump .LBB133_6
	}
.LBB133_4:
	{
		r1 = add(pc,##.L.str.7.123@PCREL)
	}
.LBB133_6:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
		r0 = r16
	}
	{
		call ##free
		r0 = r18
	}
	{
		r0 = #-43
		r17:16 = memd(r29+#40)
		r19:18 = memd(r29+#32)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#24)
		r23:22 = memd(r29+#16)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end133:
	.size	halide_error_bad_dimensions, .Lfunc_end133-halide_error_bad_dimensions
                                        // -- End function
	.section	.text.halide_error_access_out_of_bounds,"ax",@progbits
	.weak	halide_error_access_out_of_bounds // -- Begin function halide_error_access_out_of_bounds
	.p2align	4
	.type	halide_error_access_out_of_bounds,@function
halide_error_access_out_of_bounds:      // @halide_error_access_out_of_bounds
// %bb.0:                               // %entry
	{
		p0 = cmp.gt(r5,r3)
		r16 = r0
		memd(r29+#-16) = r17:16
		allocframe(#64)
	}                                       // 8-byte Folded Spill
	{
		r20 = r2
		r19 = r1
		memd(r29+#48) = r19:18
		memd(r29+#40) = r21:20
	}                                       // 8-byte Folded Spill
	{
		memd(r29+#32) = r23:22
		memd(r29+#24) = r25:24
	}                                       // 8-byte Folded Spill
	{
		if (!p0) jump:nt .LBB134_7
		memd(r29+#16) = r27:26
	}                                       // 8-byte Folded Spill
// %bb.1:                               // %if.then
	{
		r0 = #1024
		r26 = r3
		r1 = #0
		r22 = r5
	}
	{
		call ##malloc
	}
	{
		r18 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB134_2
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.3:                               // %if.then6.i
	{
		r17 = add(r18,#1023)
		r3:2 = combine(#0,r19)
	}
	{
		r1:0 = combine(r17,r18)
		jump .LBB134_4
		memb(r18+#1023) = r3
	}
.LBB134_7:                              // %if.else
	{
		r24 = r4
		r22 = memw(r29+#72)
		if (!cmp.gt(r4,r22.new)) jump:t .LBB134_14
	}
// %bb.8:                               // %if.then8
	{
		call ##malloc
		r0 = #1024
		r1 = #0
	}
	{
		r18 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB134_9
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.10:                              // %if.then6.i59
	{
		r17 = add(r18,#1023)
		r3:2 = combine(#0,r19)
	}
	{
		r1:0 = combine(r17,r18)
		jump .LBB134_11
		memb(r18+#1023) = r3
	}
.LBB134_2:                              // %if.then.split
	{
		r2 = r19
		r17 = #0
		r1:0 = combine(#0,#0)
	}
.LBB134_4:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
	}
	{
		r2 = add(pc,##.L.str.14.50@PCREL)
		r1 = r17
	}
	{
		call ##halide_string_to_string
		r27 = asr(r26,#31)
	}
	{
		r3:2 = combine(r27,r26)
		r4 = #1
		r1 = r17
	}
	{
		call ##halide_int64_to_string
	}
	{
		r2 = add(pc,##.L.str.15.51@PCREL)
		jump .LBB134_5
	}
.LBB134_9:                              // %if.then8.split
	{
		r2 = r19
		r17 = #0
		r1:0 = combine(#0,#0)
	}
.LBB134_11:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit62
	{
		call ##halide_string_to_string
	}
	{
		r2 = add(pc,##.L.str.14.50@PCREL)
		r1 = r17
	}
	{
		call ##halide_string_to_string
		r25 = asr(r24,#31)
	}
	{
		r3:2 = combine(r25,r24)
		r4 = #1
		r1 = r17
	}
	{
		call ##halide_int64_to_string
	}
	{
		r2 = add(pc,##.L.str.17.53@PCREL)
	}
.LBB134_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
		r23 = asr(r22,#31)
		r1 = r17
	}
	{
		r3:2 = combine(r23,r22)
		r4 = #1
		r1 = r17
	}
	{
		call ##halide_int64_to_string
	}
	{
		r2 = add(pc,##.L.str.16.52@PCREL)
		r1 = r17
	}
	{
		call ##halide_string_to_string
		r21 = asr(r20,#31)
	}
	{
		r3:2 = combine(r21,r20)
		r4 = #1
		r1 = r17
	}
	{
		call ##halide_int64_to_string
	}
	{
		r2 = r0
		r4 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r4
		if (p0.new) jump:nt .LBB134_6
	}
// %bb.12:                              // %if.end17.sink.split.sink.split
	{
		r1:0 = combine(r18,r16)
		r3 = #0
		r5:4 = combine(#0,#1)
	}
	{
		r19 = r3
	}
	{
		r3:2 = sub(r3:2,r19:18)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = add(r3:2,r5:4)
		r17 = r18
	}
	{
		jump .LBB134_13
	}
.LBB134_6:
	{
		r18 = add(pc,##.L.str.7.123@PCREL)
		r17 = #0
	}
.LBB134_13:                             // %if.end17.sink.split
	{
		call ##halide_error
		r1:0 = combine(r18,r16)
	}
	{
		call ##free
		r0 = r17
	}
.LBB134_14:                             // %if.end17
	{
		r0 = #-4
		r17:16 = memd(r29+#56)
		r19:18 = memd(r29+#48)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#40)
		r23:22 = memd(r29+#32)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#24)
		r27:26 = memd(r29+#16)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end134:
	.size	halide_error_access_out_of_bounds, .Lfunc_end134-halide_error_access_out_of_bounds
                                        // -- End function
	.section	.text.halide_error_buffer_allocation_too_large,"ax",@progbits
	.weak	halide_error_buffer_allocation_too_large // -- Begin function halide_error_buffer_allocation_too_large
	.p2align	4
	.type	halide_error_buffer_allocation_too_large,@function
halide_error_buffer_allocation_too_large: // @halide_error_buffer_allocation_too_large
// %bb.0:                               // %entry
	{
		r16 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#48)
	}                                       // 8-byte Folded Spill
	{
		r19 = r1
		r1 = #0
		memd(r29+#32) = r19:18
		memd(r29+#24) = r21:20
	}                                       // 8-byte Folded Spill
	{
		r21:20 = combine(r5,r4)
		r23:22 = combine(r3,r2)
		memd(r29+#16) = r23:22
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
	}
	{
		r18 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB135_1
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.2:                               // %if.then6.i
	{
		r2 = add(pc,##.L.str.18.54@PCREL)
		r17 = add(r18,#1023)
		r3 = #0
	}
	{
		r1:0 = combine(r17,r18)
		jump .LBB135_3
		memb(r18+#1023) = r3
	}
.LBB135_1:                              // %entry.split
	{
		r2 = add(pc,##.L.str.18.54@PCREL)
		r17 = #0
		r1:0 = combine(#0,#0)
	}
.LBB135_3:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r17
		r2 = r19
	}
	{
		r2 = add(pc,##.L.str.19.55@PCREL)
		r1 = r17
	}
	{
		call ##halide_string_to_string
	}
	{
		r3:2 = combine(r23,r22)
		r4 = #1
		r1 = r17
	}
	{
		call ##halide_uint64_to_string
	}
	{
		r2 = add(pc,##.L.str.20.56@PCREL)
		r1 = r17
	}
	{
		call ##halide_string_to_string
	}
	{
		r3:2 = combine(r21,r20)
		r4 = #1
		r1 = r17
	}
	{
		call ##halide_uint64_to_string
	}
	{
		r1 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r1
		if (p0.new) jump:nt .LBB135_4
	}
// %bb.5:                               // %if.else.i
	{
		r1:0 = combine(r18,r16)
		r5:4 = combine(#0,#1)
		r3:2 = combine(#0,r0)
	}
	{
		r19 = r3
	}
	{
		r3:2 = sub(r3:2,r19:18)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = add(r3:2,r5:4)
	}
	{
		r1 = r18 ; jump .LBB135_6
	}
.LBB135_4:
	{
		r1 = add(pc,##.L.str.7.123@PCREL)
	}
.LBB135_6:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
		r0 = r16
	}
	{
		call ##free
		r0 = r18
	}
	{
		r0 = #-5
		r17:16 = memd(r29+#40)
		r19:18 = memd(r29+#32)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#24)
		r23:22 = memd(r29+#16)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end135:
	.size	halide_error_buffer_allocation_too_large, .Lfunc_end135-halide_error_buffer_allocation_too_large
                                        // -- End function
	.section	.text.halide_error_buffer_extents_negative,"ax",@progbits
	.weak	halide_error_buffer_extents_negative // -- Begin function halide_error_buffer_extents_negative
	.p2align	4
	.type	halide_error_buffer_extents_negative,@function
halide_error_buffer_extents_negative:   // @halide_error_buffer_extents_negative
// %bb.0:                               // %entry
	{
		r16 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#48)
	}                                       // 8-byte Folded Spill
	{
		r19 = r1
		r1 = #0
		memd(r29+#32) = r19:18
		memd(r29+#24) = r21:20
	}                                       // 8-byte Folded Spill
	{
		r22 = r2
		r20 = r3
		memd(r29+#16) = r23:22
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
	}
	{
		r18 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB136_1
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.2:                               // %if.then6.i
	{
		r2 = add(pc,##.L.str.21.57@PCREL)
		r17 = add(r18,#1023)
		r3 = #0
	}
	{
		r1:0 = combine(r17,r18)
		jump .LBB136_3
		memb(r18+#1023) = r3
	}
.LBB136_1:                              // %entry.split
	{
		r2 = add(pc,##.L.str.21.57@PCREL)
		r17 = #0
		r1:0 = combine(#0,#0)
	}
.LBB136_3:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r17
		r2 = r19
	}
	{
		r2 = add(pc,##.L.str.22.58@PCREL)
		r1 = r17
	}
	{
		call ##halide_string_to_string
		r23 = asr(r22,#31)
	}
	{
		r3:2 = combine(r23,r22)
		r4 = #1
		r1 = r17
	}
	{
		call ##halide_int64_to_string
	}
	{
		r2 = add(pc,##.L.str.23.59@PCREL)
		r1 = r17
	}
	{
		call ##halide_string_to_string
		r21 = asr(r20,#31)
	}
	{
		r3:2 = combine(r21,r20)
		r4 = #1
		r1 = r17
	}
	{
		call ##halide_int64_to_string
	}
	{
		r2 = add(pc,##.L.str.8.44@PCREL)
		r1 = r17
	}
	{
		call ##halide_string_to_string
	}
	{
		r1 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r1
		if (p0.new) jump:nt .LBB136_4
	}
// %bb.5:                               // %if.else.i
	{
		r1:0 = combine(r18,r16)
		r5:4 = combine(#0,#1)
		r3:2 = combine(#0,r0)
	}
	{
		r19 = r3
	}
	{
		r3:2 = sub(r3:2,r19:18)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = add(r3:2,r5:4)
	}
	{
		r1 = r18 ; jump .LBB136_6
	}
.LBB136_4:
	{
		r1 = add(pc,##.L.str.7.123@PCREL)
	}
.LBB136_6:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
		r0 = r16
	}
	{
		call ##free
		r0 = r18
	}
	{
		r0 = #-28
		r17:16 = memd(r29+#40)
		r19:18 = memd(r29+#32)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#24)
		r23:22 = memd(r29+#16)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end136:
	.size	halide_error_buffer_extents_negative, .Lfunc_end136-halide_error_buffer_extents_negative
                                        // -- End function
	.section	.text.halide_error_buffer_extents_too_large,"ax",@progbits
	.weak	halide_error_buffer_extents_too_large // -- Begin function halide_error_buffer_extents_too_large
	.p2align	4
	.type	halide_error_buffer_extents_too_large,@function
halide_error_buffer_extents_too_large:  // @halide_error_buffer_extents_too_large
// %bb.0:                               // %entry
	{
		r16 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#48)
	}                                       // 8-byte Folded Spill
	{
		r19 = r1
		r1 = #0
		memd(r29+#32) = r19:18
		memd(r29+#24) = r21:20
	}                                       // 8-byte Folded Spill
	{
		r21:20 = combine(r5,r4)
		r23:22 = combine(r3,r2)
		memd(r29+#16) = r23:22
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
	}
	{
		r18 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB137_1
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.2:                               // %if.then6.i
	{
		r2 = add(pc,##.L.str.24.60@PCREL)
		r17 = add(r18,#1023)
		r3 = #0
	}
	{
		r1:0 = combine(r17,r18)
		jump .LBB137_3
		memb(r18+#1023) = r3
	}
.LBB137_1:                              // %entry.split
	{
		r2 = add(pc,##.L.str.24.60@PCREL)
		r17 = #0
		r1:0 = combine(#0,#0)
	}
.LBB137_3:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r17
		r2 = r19
	}
	{
		r2 = add(pc,##.L.str.19.55@PCREL)
		r1 = r17
	}
	{
		call ##halide_string_to_string
	}
	{
		r3:2 = combine(r23,r22)
		r4 = #1
		r1 = r17
	}
	{
		call ##halide_int64_to_string
	}
	{
		r2 = add(pc,##.L.str.20.56@PCREL)
		r1 = r17
	}
	{
		call ##halide_string_to_string
	}
	{
		r3:2 = combine(r21,r20)
		r4 = #1
		r1 = r17
	}
	{
		call ##halide_int64_to_string
	}
	{
		r1 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r1
		if (p0.new) jump:nt .LBB137_4
	}
// %bb.5:                               // %if.else.i
	{
		r1:0 = combine(r18,r16)
		r5:4 = combine(#0,#1)
		r3:2 = combine(#0,r0)
	}
	{
		r19 = r3
	}
	{
		r3:2 = sub(r3:2,r19:18)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = add(r3:2,r5:4)
	}
	{
		r1 = r18 ; jump .LBB137_6
	}
.LBB137_4:
	{
		r1 = add(pc,##.L.str.7.123@PCREL)
	}
.LBB137_6:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
		r0 = r16
	}
	{
		call ##free
		r0 = r18
	}
	{
		r0 = #-6
		r17:16 = memd(r29+#40)
		r19:18 = memd(r29+#32)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#24)
		r23:22 = memd(r29+#16)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end137:
	.size	halide_error_buffer_extents_too_large, .Lfunc_end137-halide_error_buffer_extents_too_large
                                        // -- End function
	.section	.text.halide_error_constraints_make_required_region_smaller,"ax",@progbits
	.weak	halide_error_constraints_make_required_region_smaller // -- Begin function halide_error_constraints_make_required_region_smaller
	.p2align	4
	.type	halide_error_constraints_make_required_region_smaller,@function
halide_error_constraints_make_required_region_smaller: // @halide_error_constraints_make_required_region_smaller
// %bb.0:                               // %entry
	{
		r16 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#72)
	}                                       // 8-byte Folded Spill
	{
		r20 = r2
		r2 = memw(r29+#80)
		memd(r29+#48) = r21:20
	}
	{
		r19 = r1
		r1 = #0
		memd(r29+#56) = r19:18
		memd(r29+#32) = r25:24
	}                                       // 8-byte Folded Spill
	{
		r24 = add(r5,add(r2,#-1))
		r2 = add(r3,add(r4,#-1))
		memd(r29+#40) = r23:22
		memd(r29+#24) = r27:26
	}                                       // 8-byte Folded Spill
	{
		r26 = r5
		r22 = r3
		memd(r29+#0) = r3:2
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
	}
	{
		r18 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB138_1
		memw(r29+#12) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.2:                               // %if.then6.i
	{
		r2 = add(pc,##.L.str.25.61@PCREL)
		r17 = add(r18,#1023)
		r3 = #0
	}
	{
		r1:0 = combine(r17,r18)
		jump .LBB138_3
		memb(r18+#1023) = r3
	}
.LBB138_1:                              // %entry.split
	{
		r2 = add(pc,##.L.str.25.61@PCREL)
		r17 = #0
		r1:0 = combine(#0,#0)
	}
.LBB138_3:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r17
		r2 = r19
	}
	{
		r2 = add(pc,##.L.str.26.62@PCREL)
		r1 = r17
	}
	{
		call ##halide_string_to_string
		r21 = asr(r20,#31)
	}
	{
		r3:2 = combine(r21,r20)
		r4 = #1
		r1 = r17
	}
	{
		r19 = add(pc,##.L.str.27.63@PCREL)
		call ##halide_int64_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r17
		r2 = r19
	}
	{
		r2 = add(pc,##.L.str.28.64@PCREL)
		r1 = r17
	}
	{
		call ##halide_string_to_string
		r27 = asr(r26,#31)
	}
	{
		r3:2 = combine(r27,r26)
		r4 = #1
		r1 = r17
	}
	{
		r20 = add(pc,##.L.str.6.42@PCREL)
		call ##halide_int64_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r17
		r2 = r20
	}
	{
		r25 = asr(r24,#31)
		r4 = #1
		r1 = r17
	}
	{
		call ##halide_int64_to_string
		r3:2 = combine(r25,r24)
	}
	{
		call ##halide_string_to_string
		r1 = r17
		r2 = r19
	}
	{
		r2 = add(pc,##.L.str.29.65@PCREL)
		r1 = r17
	}
	{
		call ##halide_string_to_string
		r23 = asr(r22,#31)
	}
	{
		r3:2 = combine(r23,r22)
		r4 = #1
		r1 = r17
	}
	{
		call ##halide_int64_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r17
		r2 = r20
	}
	{
		r4 = #1
		r1 = r17
		r3:2 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		call ##halide_int64_to_string
		r3 = asr(r2,#31)
	}
	{
		r2 = add(pc,##.L.str.30.66@PCREL)
		r1 = r17
	}
	{
		call ##halide_string_to_string
	}
	{
		r1 = memw(r29+#12)
	}                                       // 4-byte Folded Reload
	{
		p0 = r1
		if (p0.new) jump:nt .LBB138_4
	}
// %bb.5:                               // %if.else.i
	{
		r1:0 = combine(r18,r16)
		r5:4 = combine(#0,#1)
		r3:2 = combine(#0,r0)
	}
	{
		r19 = r3
	}
	{
		r3:2 = sub(r3:2,r19:18)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = add(r3:2,r5:4)
	}
	{
		r1 = r18 ; jump .LBB138_6
	}
.LBB138_4:
	{
		r1 = add(pc,##.L.str.7.123@PCREL)
	}
.LBB138_6:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
		r0 = r16
	}
	{
		call ##free
		r0 = r18
	}
	{
		r0 = #-7
		r17:16 = memd(r29+#64)
		r19:18 = memd(r29+#56)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#48)
		r23:22 = memd(r29+#40)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#32)
		r27:26 = memd(r29+#24)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end138:
	.size	halide_error_constraints_make_required_region_smaller, .Lfunc_end138-halide_error_constraints_make_required_region_smaller
                                        // -- End function
	.section	.text.halide_error_constraint_violated,"ax",@progbits
	.weak	halide_error_constraint_violated // -- Begin function halide_error_constraint_violated
	.p2align	4
	.type	halide_error_constraint_violated,@function
halide_error_constraint_violated:       // @halide_error_constraint_violated
// %bb.0:                               // %entry
	{
		r16 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#48)
	}                                       // 8-byte Folded Spill
	{
		r21:20 = combine(r1,r4)
		r1 = #0
		memd(r29+#24) = r21:20
		memd(r29+#32) = r19:18
	}                                       // 8-byte Folded Spill
	{
		r22 = r2
		r19 = r3
		memd(r29+#16) = r23:22
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
	}
	{
		r18 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB139_1
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.2:                               // %if.then6.i
	{
		r2 = add(pc,##.L.str.31.67@PCREL)
		r17 = add(r18,#1023)
		r3 = #0
	}
	{
		r1:0 = combine(r17,r18)
		jump .LBB139_3
		memb(r18+#1023) = r3
	}
.LBB139_1:                              // %entry.split
	{
		r2 = add(pc,##.L.str.31.67@PCREL)
		r17 = #0
		r1:0 = combine(#0,#0)
	}
.LBB139_3:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r17
		r2 = r21
	}
	{
		r21 = add(pc,##.L.str.32.68@PCREL)
		r1 = r17
	}
	{
		call ##halide_string_to_string
		r23 = asr(r22,#31)
		r2 = r21
	}
	{
		r3:2 = combine(r23,r22)
		r4 = #1
		r1 = r17
	}
	{
		call ##halide_int64_to_string
	}
	{
		r2 = add(pc,##.L.str.33.69@PCREL)
		r1 = r17
	}
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r17
		r2 = r19
	}
	{
		call ##halide_string_to_string
		r1 = r17
		r2 = r21
	}
	{
		r21 = asr(r20,#31)
		r4 = #1
		r1 = r17
	}
	{
		call ##halide_int64_to_string
		r3:2 = combine(r21,r20)
	}
	{
		r2 = add(pc,##.L.str.8.44@PCREL)
		r1 = r17
	}
	{
		call ##halide_string_to_string
	}
	{
		r1 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r1
		if (p0.new) jump:nt .LBB139_4
	}
// %bb.5:                               // %if.else.i
	{
		r1:0 = combine(r18,r16)
		r5:4 = combine(#0,#1)
		r3:2 = combine(#0,r0)
	}
	{
		r19 = r3
	}
	{
		r3:2 = sub(r3:2,r19:18)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = add(r3:2,r5:4)
	}
	{
		r1 = r18 ; jump .LBB139_6
	}
.LBB139_4:
	{
		r1 = add(pc,##.L.str.7.123@PCREL)
	}
.LBB139_6:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
		r0 = r16
	}
	{
		call ##free
		r0 = r18
	}
	{
		r0 = #-8
		r17:16 = memd(r29+#40)
		r19:18 = memd(r29+#32)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#24)
		r23:22 = memd(r29+#16)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end139:
	.size	halide_error_constraint_violated, .Lfunc_end139-halide_error_constraint_violated
                                        // -- End function
	.section	.text.halide_error_param_too_small_i64,"ax",@progbits
	.weak	halide_error_param_too_small_i64 // -- Begin function halide_error_param_too_small_i64
	.p2align	4
	.type	halide_error_param_too_small_i64,@function
halide_error_param_too_small_i64:       // @halide_error_param_too_small_i64
// %bb.0:                               // %entry
	{
		r16 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#48)
	}                                       // 8-byte Folded Spill
	{
		r19 = r1
		r1 = #0
		memd(r29+#32) = r19:18
		memd(r29+#24) = r21:20
	}                                       // 8-byte Folded Spill
	{
		r21:20 = combine(r5,r4)
		r23:22 = combine(r3,r2)
		memd(r29+#16) = r23:22
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
	}
	{
		r18 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB140_1
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.2:                               // %if.then6.i
	{
		r2 = add(pc,##.L.str.34.70@PCREL)
		r17 = add(r18,#1023)
		r3 = #0
	}
	{
		r1:0 = combine(r17,r18)
		jump .LBB140_3
		memb(r18+#1023) = r3
	}
.LBB140_1:                              // %entry.split
	{
		r2 = add(pc,##.L.str.34.70@PCREL)
		r17 = #0
		r1:0 = combine(#0,#0)
	}
.LBB140_3:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r17
		r2 = r19
	}
	{
		r2 = add(pc,##.L.str.19.55@PCREL)
		r1 = r17
	}
	{
		call ##halide_string_to_string
	}
	{
		r3:2 = combine(r23,r22)
		r4 = #1
		r1 = r17
	}
	{
		call ##halide_int64_to_string
	}
	{
		r2 = add(pc,##.L.str.35.71@PCREL)
		r1 = r17
	}
	{
		call ##halide_string_to_string
	}
	{
		r3:2 = combine(r21,r20)
		r4 = #1
		r1 = r17
	}
	{
		call ##halide_int64_to_string
	}
	{
		r1 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r1
		if (p0.new) jump:nt .LBB140_4
	}
// %bb.5:                               // %if.else.i
	{
		r1:0 = combine(r18,r16)
		r5:4 = combine(#0,#1)
		r3:2 = combine(#0,r0)
	}
	{
		r19 = r3
	}
	{
		r3:2 = sub(r3:2,r19:18)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = add(r3:2,r5:4)
	}
	{
		r1 = r18 ; jump .LBB140_6
	}
.LBB140_4:
	{
		r1 = add(pc,##.L.str.7.123@PCREL)
	}
.LBB140_6:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
		r0 = r16
	}
	{
		call ##free
		r0 = r18
	}
	{
		r0 = #-9
		r17:16 = memd(r29+#40)
		r19:18 = memd(r29+#32)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#24)
		r23:22 = memd(r29+#16)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end140:
	.size	halide_error_param_too_small_i64, .Lfunc_end140-halide_error_param_too_small_i64
                                        // -- End function
	.section	.text.halide_error_param_too_small_u64,"ax",@progbits
	.weak	halide_error_param_too_small_u64 // -- Begin function halide_error_param_too_small_u64
	.p2align	4
	.type	halide_error_param_too_small_u64,@function
halide_error_param_too_small_u64:       // @halide_error_param_too_small_u64
// %bb.0:                               // %entry
	{
		r16 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#48)
	}                                       // 8-byte Folded Spill
	{
		r19 = r1
		r1 = #0
		memd(r29+#32) = r19:18
		memd(r29+#24) = r21:20
	}                                       // 8-byte Folded Spill
	{
		r21:20 = combine(r5,r4)
		r23:22 = combine(r3,r2)
		memd(r29+#16) = r23:22
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
	}
	{
		r18 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB141_1
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.2:                               // %if.then6.i
	{
		r2 = add(pc,##.L.str.34.70@PCREL)
		r17 = add(r18,#1023)
		r3 = #0
	}
	{
		r1:0 = combine(r17,r18)
		jump .LBB141_3
		memb(r18+#1023) = r3
	}
.LBB141_1:                              // %entry.split
	{
		r2 = add(pc,##.L.str.34.70@PCREL)
		r17 = #0
		r1:0 = combine(#0,#0)
	}
.LBB141_3:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r17
		r2 = r19
	}
	{
		r2 = add(pc,##.L.str.19.55@PCREL)
		r1 = r17
	}
	{
		call ##halide_string_to_string
	}
	{
		r3:2 = combine(r23,r22)
		r4 = #1
		r1 = r17
	}
	{
		call ##halide_uint64_to_string
	}
	{
		r2 = add(pc,##.L.str.35.71@PCREL)
		r1 = r17
	}
	{
		call ##halide_string_to_string
	}
	{
		r3:2 = combine(r21,r20)
		r4 = #1
		r1 = r17
	}
	{
		call ##halide_uint64_to_string
	}
	{
		r1 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r1
		if (p0.new) jump:nt .LBB141_4
	}
// %bb.5:                               // %if.else.i
	{
		r1:0 = combine(r18,r16)
		r5:4 = combine(#0,#1)
		r3:2 = combine(#0,r0)
	}
	{
		r19 = r3
	}
	{
		r3:2 = sub(r3:2,r19:18)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = add(r3:2,r5:4)
	}
	{
		r1 = r18 ; jump .LBB141_6
	}
.LBB141_4:
	{
		r1 = add(pc,##.L.str.7.123@PCREL)
	}
.LBB141_6:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
		r0 = r16
	}
	{
		call ##free
		r0 = r18
	}
	{
		r0 = #-9
		r17:16 = memd(r29+#40)
		r19:18 = memd(r29+#32)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#24)
		r23:22 = memd(r29+#16)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end141:
	.size	halide_error_param_too_small_u64, .Lfunc_end141-halide_error_param_too_small_u64
                                        // -- End function
	.section	.text.halide_error_param_too_small_f64,"ax",@progbits
	.weak	halide_error_param_too_small_f64 // -- Begin function halide_error_param_too_small_f64
	.p2align	4
	.type	halide_error_param_too_small_f64,@function
halide_error_param_too_small_f64:       // @halide_error_param_too_small_f64
// %bb.0:                               // %entry
	{
		r16 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#48)
	}                                       // 8-byte Folded Spill
	{
		r19 = r1
		r1 = #0
		memd(r29+#32) = r19:18
		memd(r29+#24) = r21:20
	}                                       // 8-byte Folded Spill
	{
		r21:20 = combine(r5,r4)
		r23:22 = combine(r3,r2)
		memd(r29+#16) = r23:22
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
	}
	{
		r18 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB142_1
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.2:                               // %if.then6.i
	{
		r2 = add(pc,##.L.str.34.70@PCREL)
		r17 = add(r18,#1023)
		r3 = #0
	}
	{
		r1:0 = combine(r17,r18)
		jump .LBB142_3
		memb(r18+#1023) = r3
	}
.LBB142_1:                              // %entry.split
	{
		r2 = add(pc,##.L.str.34.70@PCREL)
		r17 = #0
		r1:0 = combine(#0,#0)
	}
.LBB142_3:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r17
		r2 = r19
	}
	{
		r2 = add(pc,##.L.str.19.55@PCREL)
		r1 = r17
	}
	{
		call ##halide_string_to_string
	}
	{
		r3:2 = combine(r23,r22)
		r4 = #1
		r1 = r17
	}
	{
		call ##halide_double_to_string
	}
	{
		r2 = add(pc,##.L.str.35.71@PCREL)
		r1 = r17
	}
	{
		call ##halide_string_to_string
	}
	{
		r3:2 = combine(r21,r20)
		r4 = #1
		r1 = r17
	}
	{
		call ##halide_double_to_string
	}
	{
		r1 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r1
		if (p0.new) jump:nt .LBB142_4
	}
// %bb.5:                               // %if.else.i
	{
		r1:0 = combine(r18,r16)
		r5:4 = combine(#0,#1)
		r3:2 = combine(#0,r0)
	}
	{
		r19 = r3
	}
	{
		r3:2 = sub(r3:2,r19:18)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = add(r3:2,r5:4)
	}
	{
		r1 = r18 ; jump .LBB142_6
	}
.LBB142_4:
	{
		r1 = add(pc,##.L.str.7.123@PCREL)
	}
.LBB142_6:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
		r0 = r16
	}
	{
		call ##free
		r0 = r18
	}
	{
		r0 = #-9
		r17:16 = memd(r29+#40)
		r19:18 = memd(r29+#32)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#24)
		r23:22 = memd(r29+#16)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end142:
	.size	halide_error_param_too_small_f64, .Lfunc_end142-halide_error_param_too_small_f64
                                        // -- End function
	.section	.text.halide_error_param_too_large_i64,"ax",@progbits
	.weak	halide_error_param_too_large_i64 // -- Begin function halide_error_param_too_large_i64
	.p2align	4
	.type	halide_error_param_too_large_i64,@function
halide_error_param_too_large_i64:       // @halide_error_param_too_large_i64
// %bb.0:                               // %entry
	{
		r16 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#48)
	}                                       // 8-byte Folded Spill
	{
		r19 = r1
		r1 = #0
		memd(r29+#32) = r19:18
		memd(r29+#24) = r21:20
	}                                       // 8-byte Folded Spill
	{
		r21:20 = combine(r5,r4)
		r23:22 = combine(r3,r2)
		memd(r29+#16) = r23:22
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
	}
	{
		r18 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB143_1
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.2:                               // %if.then6.i
	{
		r2 = add(pc,##.L.str.34.70@PCREL)
		r17 = add(r18,#1023)
		r3 = #0
	}
	{
		r1:0 = combine(r17,r18)
		jump .LBB143_3
		memb(r18+#1023) = r3
	}
.LBB143_1:                              // %entry.split
	{
		r2 = add(pc,##.L.str.34.70@PCREL)
		r17 = #0
		r1:0 = combine(#0,#0)
	}
.LBB143_3:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r17
		r2 = r19
	}
	{
		r2 = add(pc,##.L.str.19.55@PCREL)
		r1 = r17
	}
	{
		call ##halide_string_to_string
	}
	{
		r3:2 = combine(r23,r22)
		r4 = #1
		r1 = r17
	}
	{
		call ##halide_int64_to_string
	}
	{
		r2 = add(pc,##.L.str.36.72@PCREL)
		r1 = r17
	}
	{
		call ##halide_string_to_string
	}
	{
		r3:2 = combine(r21,r20)
		r4 = #1
		r1 = r17
	}
	{
		call ##halide_int64_to_string
	}
	{
		r1 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r1
		if (p0.new) jump:nt .LBB143_4
	}
// %bb.5:                               // %if.else.i
	{
		r1:0 = combine(r18,r16)
		r5:4 = combine(#0,#1)
		r3:2 = combine(#0,r0)
	}
	{
		r19 = r3
	}
	{
		r3:2 = sub(r3:2,r19:18)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = add(r3:2,r5:4)
	}
	{
		r1 = r18 ; jump .LBB143_6
	}
.LBB143_4:
	{
		r1 = add(pc,##.L.str.7.123@PCREL)
	}
.LBB143_6:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
		r0 = r16
	}
	{
		call ##free
		r0 = r18
	}
	{
		r0 = #-10
		r17:16 = memd(r29+#40)
		r19:18 = memd(r29+#32)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#24)
		r23:22 = memd(r29+#16)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end143:
	.size	halide_error_param_too_large_i64, .Lfunc_end143-halide_error_param_too_large_i64
                                        // -- End function
	.section	.text.halide_error_param_too_large_u64,"ax",@progbits
	.weak	halide_error_param_too_large_u64 // -- Begin function halide_error_param_too_large_u64
	.p2align	4
	.type	halide_error_param_too_large_u64,@function
halide_error_param_too_large_u64:       // @halide_error_param_too_large_u64
// %bb.0:                               // %entry
	{
		r16 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#48)
	}                                       // 8-byte Folded Spill
	{
		r19 = r1
		r1 = #0
		memd(r29+#32) = r19:18
		memd(r29+#24) = r21:20
	}                                       // 8-byte Folded Spill
	{
		r21:20 = combine(r5,r4)
		r23:22 = combine(r3,r2)
		memd(r29+#16) = r23:22
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
	}
	{
		r18 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB144_1
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.2:                               // %if.then6.i
	{
		r2 = add(pc,##.L.str.34.70@PCREL)
		r17 = add(r18,#1023)
		r3 = #0
	}
	{
		r1:0 = combine(r17,r18)
		jump .LBB144_3
		memb(r18+#1023) = r3
	}
.LBB144_1:                              // %entry.split
	{
		r2 = add(pc,##.L.str.34.70@PCREL)
		r17 = #0
		r1:0 = combine(#0,#0)
	}
.LBB144_3:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r17
		r2 = r19
	}
	{
		r2 = add(pc,##.L.str.19.55@PCREL)
		r1 = r17
	}
	{
		call ##halide_string_to_string
	}
	{
		r3:2 = combine(r23,r22)
		r4 = #1
		r1 = r17
	}
	{
		call ##halide_uint64_to_string
	}
	{
		r2 = add(pc,##.L.str.36.72@PCREL)
		r1 = r17
	}
	{
		call ##halide_string_to_string
	}
	{
		r3:2 = combine(r21,r20)
		r4 = #1
		r1 = r17
	}
	{
		call ##halide_uint64_to_string
	}
	{
		r1 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r1
		if (p0.new) jump:nt .LBB144_4
	}
// %bb.5:                               // %if.else.i
	{
		r1:0 = combine(r18,r16)
		r5:4 = combine(#0,#1)
		r3:2 = combine(#0,r0)
	}
	{
		r19 = r3
	}
	{
		r3:2 = sub(r3:2,r19:18)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = add(r3:2,r5:4)
	}
	{
		r1 = r18 ; jump .LBB144_6
	}
.LBB144_4:
	{
		r1 = add(pc,##.L.str.7.123@PCREL)
	}
.LBB144_6:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
		r0 = r16
	}
	{
		call ##free
		r0 = r18
	}
	{
		r0 = #-10
		r17:16 = memd(r29+#40)
		r19:18 = memd(r29+#32)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#24)
		r23:22 = memd(r29+#16)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end144:
	.size	halide_error_param_too_large_u64, .Lfunc_end144-halide_error_param_too_large_u64
                                        // -- End function
	.section	.text.halide_error_param_too_large_f64,"ax",@progbits
	.weak	halide_error_param_too_large_f64 // -- Begin function halide_error_param_too_large_f64
	.p2align	4
	.type	halide_error_param_too_large_f64,@function
halide_error_param_too_large_f64:       // @halide_error_param_too_large_f64
// %bb.0:                               // %entry
	{
		r16 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#48)
	}                                       // 8-byte Folded Spill
	{
		r19 = r1
		r1 = #0
		memd(r29+#32) = r19:18
		memd(r29+#24) = r21:20
	}                                       // 8-byte Folded Spill
	{
		r21:20 = combine(r5,r4)
		r23:22 = combine(r3,r2)
		memd(r29+#16) = r23:22
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
	}
	{
		r18 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB145_1
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.2:                               // %if.then6.i
	{
		r2 = add(pc,##.L.str.34.70@PCREL)
		r17 = add(r18,#1023)
		r3 = #0
	}
	{
		r1:0 = combine(r17,r18)
		jump .LBB145_3
		memb(r18+#1023) = r3
	}
.LBB145_1:                              // %entry.split
	{
		r2 = add(pc,##.L.str.34.70@PCREL)
		r17 = #0
		r1:0 = combine(#0,#0)
	}
.LBB145_3:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r17
		r2 = r19
	}
	{
		r2 = add(pc,##.L.str.19.55@PCREL)
		r1 = r17
	}
	{
		call ##halide_string_to_string
	}
	{
		r3:2 = combine(r23,r22)
		r4 = #1
		r1 = r17
	}
	{
		call ##halide_double_to_string
	}
	{
		r2 = add(pc,##.L.str.36.72@PCREL)
		r1 = r17
	}
	{
		call ##halide_string_to_string
	}
	{
		r3:2 = combine(r21,r20)
		r4 = #1
		r1 = r17
	}
	{
		call ##halide_double_to_string
	}
	{
		r1 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r1
		if (p0.new) jump:nt .LBB145_4
	}
// %bb.5:                               // %if.else.i
	{
		r1:0 = combine(r18,r16)
		r5:4 = combine(#0,#1)
		r3:2 = combine(#0,r0)
	}
	{
		r19 = r3
	}
	{
		r3:2 = sub(r3:2,r19:18)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = add(r3:2,r5:4)
	}
	{
		r1 = r18 ; jump .LBB145_6
	}
.LBB145_4:
	{
		r1 = add(pc,##.L.str.7.123@PCREL)
	}
.LBB145_6:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
		r0 = r16
	}
	{
		call ##free
		r0 = r18
	}
	{
		r0 = #-10
		r17:16 = memd(r29+#40)
		r19:18 = memd(r29+#32)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#24)
		r23:22 = memd(r29+#16)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end145:
	.size	halide_error_param_too_large_f64, .Lfunc_end145-halide_error_param_too_large_f64
                                        // -- End function
	.section	.text.halide_error_out_of_memory,"ax",@progbits
	.weak	halide_error_out_of_memory      // -- Begin function halide_error_out_of_memory
	.p2align	4
	.type	halide_error_out_of_memory,@function
halide_error_out_of_memory:             // @halide_error_out_of_memory
// %bb.0:                               // %entry
	{
		r1 = add(pc,##.L.str.37@PCREL)
		allocframe(r29,#0):raw
	}
	{
		call ##halide_error
	}
	{
		r0 = #-11
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end146:
	.size	halide_error_out_of_memory, .Lfunc_end146-halide_error_out_of_memory
                                        // -- End function
	.section	.text.halide_error_buffer_argument_is_null,"ax",@progbits
	.weak	halide_error_buffer_argument_is_null // -- Begin function halide_error_buffer_argument_is_null
	.p2align	4
	.type	halide_error_buffer_argument_is_null,@function
halide_error_buffer_argument_is_null:   // @halide_error_buffer_argument_is_null
// %bb.0:                               // %entry
	{
		r17:16 = combine(r1,r0)
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#32)
	}                                       // 8-byte Folded Spill
	{
		r1 = #0
	}
	{
		call ##malloc
		memd(r29+#16) = r19:18
	}                                       // 8-byte Folded Spill
	{
		r18 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB147_1
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.2:                               // %if.then6.i
	{
		r2 = add(pc,##.L.str.38@PCREL)
		r19 = add(r18,#1023)
		r3 = #0
	}
	{
		r1:0 = combine(r19,r18)
		jump .LBB147_3
		memb(r18+#1023) = r3
	}
.LBB147_1:                              // %entry.split
	{
		r2 = add(pc,##.L.str.38@PCREL)
		r19 = #0
		r1:0 = combine(#0,#0)
	}
.LBB147_3:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r19
		r2 = r17
	}
	{
		r2 = add(pc,##.L.str.39@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	{
		r1 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r1
		if (p0.new) jump:nt .LBB147_4
	}
// %bb.5:                               // %if.else.i
	{
		r1:0 = combine(r18,r16)
		r5:4 = combine(#0,#1)
		r3:2 = combine(#0,r0)
	}
	{
		r19 = r3
	}
	{
		r3:2 = sub(r3:2,r19:18)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = add(r3:2,r5:4)
	}
	{
		r1 = r18 ; jump .LBB147_6
	}
.LBB147_4:
	{
		r1 = add(pc,##.L.str.7.123@PCREL)
	}
.LBB147_6:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
		r0 = r16
	}
	{
		call ##free
		r0 = r18
	}
	{
		r0 = #-12
		r17:16 = memd(r29+#24)
		r19:18 = memd(r29+#16)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end147:
	.size	halide_error_buffer_argument_is_null, .Lfunc_end147-halide_error_buffer_argument_is_null
                                        // -- End function
	.section	.text.halide_error_debug_to_file_failed,"ax",@progbits
	.weak	halide_error_debug_to_file_failed // -- Begin function halide_error_debug_to_file_failed
	.p2align	4
	.type	halide_error_debug_to_file_failed,@function
halide_error_debug_to_file_failed:      // @halide_error_debug_to_file_failed
// %bb.0:                               // %entry
	{
		r17:16 = combine(r2,r0)
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#40)
	}                                       // 8-byte Folded Spill
	{
		r21:20 = combine(r1,r3)
		r1 = #0
		memd(r29+#16) = r21:20
		memd(r29+#24) = r19:18
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
	}
	{
		r18 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB148_1
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.2:                               // %if.then6.i
	{
		r2 = add(pc,##.L.str.40@PCREL)
		r19 = add(r18,#1023)
		r3 = #0
	}
	{
		r1:0 = combine(r19,r18)
		jump .LBB148_3
		memb(r18+#1023) = r3
	}
.LBB148_1:                              // %entry.split
	{
		r2 = add(pc,##.L.str.40@PCREL)
		r19 = #0
		r1:0 = combine(#0,#0)
	}
.LBB148_3:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r19
		r2 = r21
	}
	{
		r2 = add(pc,##.L.str.41.73@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r19
		r2 = r17
	}
	{
		r2 = add(pc,##.L.str.42@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
		r21 = asr(r20,#31)
	}
	{
		r3:2 = combine(r21,r20)
		r4 = #1
		r1 = r19
	}
	{
		call ##halide_int64_to_string
	}
	{
		r1 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r1
		if (p0.new) jump:nt .LBB148_4
	}
// %bb.5:                               // %if.else.i
	{
		r1:0 = combine(r18,r16)
		r5:4 = combine(#0,#1)
		r3:2 = combine(#0,r0)
	}
	{
		r19 = r3
	}
	{
		r3:2 = sub(r3:2,r19:18)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = add(r3:2,r5:4)
	}
	{
		r1 = r18 ; jump .LBB148_6
	}
.LBB148_4:
	{
		r1 = add(pc,##.L.str.7.123@PCREL)
	}
.LBB148_6:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
		r0 = r16
	}
	{
		call ##free
		r0 = r18
	}
	{
		r0 = #-13
		r17:16 = memd(r29+#32)
		r19:18 = memd(r29+#24)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#16)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end148:
	.size	halide_error_debug_to_file_failed, .Lfunc_end148-halide_error_debug_to_file_failed
                                        // -- End function
	.section	.text.halide_error_unaligned_host_ptr,"ax",@progbits
	.weak	halide_error_unaligned_host_ptr // -- Begin function halide_error_unaligned_host_ptr
	.p2align	4
	.type	halide_error_unaligned_host_ptr,@function
halide_error_unaligned_host_ptr:        // @halide_error_unaligned_host_ptr
// %bb.0:                               // %entry
	{
		r16 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#40)
	}                                       // 8-byte Folded Spill
	{
		r19 = r1
		r1 = #0
		memd(r29+#24) = r19:18
		memd(r29+#16) = r21:20
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
		r20 = r2
	}
	{
		r18 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB149_1
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.2:                               // %if.then6.i
	{
		r2 = add(pc,##.L.str.43@PCREL)
		r17 = add(r18,#1023)
		r3 = #0
	}
	{
		r1:0 = combine(r17,r18)
		jump .LBB149_3
		memb(r18+#1023) = r3
	}
.LBB149_1:                              // %entry.split
	{
		r2 = add(pc,##.L.str.43@PCREL)
		r17 = #0
		r1:0 = combine(#0,#0)
	}
.LBB149_3:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r17
		r2 = r19
	}
	{
		r2 = add(pc,##.L.str.44@PCREL)
		r1 = r17
	}
	{
		call ##halide_string_to_string
		r21 = asr(r20,#31)
	}
	{
		r3:2 = combine(r21,r20)
		r4 = #1
		r1 = r17
	}
	{
		call ##halide_int64_to_string
	}
	{
		r2 = add(pc,##.L.str.45@PCREL)
		r1 = r17
	}
	{
		call ##halide_string_to_string
	}
	{
		r1 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r1
		if (p0.new) jump:nt .LBB149_4
	}
// %bb.5:                               // %if.else.i
	{
		r1:0 = combine(r18,r16)
		r5:4 = combine(#0,#1)
		r3:2 = combine(#0,r0)
	}
	{
		r19 = r3
	}
	{
		r3:2 = sub(r3:2,r19:18)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = add(r3:2,r5:4)
	}
	{
		r1 = r18 ; jump .LBB149_6
	}
.LBB149_4:
	{
		r1 = add(pc,##.L.str.7.123@PCREL)
	}
.LBB149_6:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
		r0 = r16
	}
	{
		call ##free
		r0 = r18
	}
	{
		r0 = #-24
		r17:16 = memd(r29+#32)
		r19:18 = memd(r29+#24)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#16)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end149:
	.size	halide_error_unaligned_host_ptr, .Lfunc_end149-halide_error_unaligned_host_ptr
                                        // -- End function
	.section	.text.halide_error_device_dirty_with_no_device_support,"ax",@progbits
	.weak	halide_error_device_dirty_with_no_device_support // -- Begin function halide_error_device_dirty_with_no_device_support
	.p2align	4
	.type	halide_error_device_dirty_with_no_device_support,@function
halide_error_device_dirty_with_no_device_support: // @halide_error_device_dirty_with_no_device_support
// %bb.0:                               // %entry
	{
		r17:16 = combine(r1,r0)
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#32)
	}                                       // 8-byte Folded Spill
	{
		r1 = #0
	}
	{
		call ##malloc
		memd(r29+#16) = r19:18
	}                                       // 8-byte Folded Spill
	{
		r18 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB150_1
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.2:                               // %if.then6.i
	{
		r2 = add(pc,##.L.str.46@PCREL)
		r19 = add(r18,#1023)
		r3 = #0
	}
	{
		r1:0 = combine(r19,r18)
		jump .LBB150_3
		memb(r18+#1023) = r3
	}
.LBB150_1:                              // %entry.split
	{
		r2 = add(pc,##.L.str.46@PCREL)
		r19 = #0
		r1:0 = combine(#0,#0)
	}
.LBB150_3:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r19
		r2 = r17
	}
	{
		r2 = add(pc,##.L.str.47@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	{
		r2 = add(pc,##.L.str.48@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	{
		r1 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r1
		if (p0.new) jump:nt .LBB150_4
	}
// %bb.5:                               // %if.else.i
	{
		r1:0 = combine(r18,r16)
		r5:4 = combine(#0,#1)
		r3:2 = combine(#0,r0)
	}
	{
		r19 = r3
	}
	{
		r3:2 = sub(r3:2,r19:18)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = add(r3:2,r5:4)
	}
	{
		r1 = r18 ; jump .LBB150_6
	}
.LBB150_4:
	{
		r1 = add(pc,##.L.str.7.123@PCREL)
	}
.LBB150_6:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
		r0 = r16
	}
	{
		call ##free
		r0 = r18
	}
	{
		r0 = #-44
		r17:16 = memd(r29+#24)
		r19:18 = memd(r29+#16)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end150:
	.size	halide_error_device_dirty_with_no_device_support, .Lfunc_end150-halide_error_device_dirty_with_no_device_support
                                        // -- End function
	.section	.text.halide_error_host_is_null,"ax",@progbits
	.weak	halide_error_host_is_null       // -- Begin function halide_error_host_is_null
	.p2align	4
	.type	halide_error_host_is_null,@function
halide_error_host_is_null:              // @halide_error_host_is_null
// %bb.0:                               // %entry
	{
		r17:16 = combine(r1,r0)
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#32)
	}                                       // 8-byte Folded Spill
	{
		r1 = #0
	}
	{
		call ##malloc
		memd(r29+#16) = r19:18
	}                                       // 8-byte Folded Spill
	{
		r18 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB151_1
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.2:                               // %if.then6.i
	{
		r2 = add(pc,##.L.str.43@PCREL)
		r19 = add(r18,#1023)
		r3 = #0
	}
	{
		r1:0 = combine(r19,r18)
		jump .LBB151_3
		memb(r18+#1023) = r3
	}
.LBB151_1:                              // %entry.split
	{
		r2 = add(pc,##.L.str.43@PCREL)
		r19 = #0
		r1:0 = combine(#0,#0)
	}
.LBB151_3:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r19
		r2 = r17
	}
	{
		r2 = add(pc,##.L.str.49@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	{
		r1 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r1
		if (p0.new) jump:nt .LBB151_4
	}
// %bb.5:                               // %if.else.i
	{
		r1:0 = combine(r18,r16)
		r5:4 = combine(#0,#1)
		r3:2 = combine(#0,r0)
	}
	{
		r19 = r3
	}
	{
		r3:2 = sub(r3:2,r19:18)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = add(r3:2,r5:4)
	}
	{
		r1 = r18 ; jump .LBB151_6
	}
.LBB151_4:
	{
		r1 = add(pc,##.L.str.7.123@PCREL)
	}
.LBB151_6:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
		r0 = r16
	}
	{
		call ##free
		r0 = r18
	}
	{
		r0 = #-34
		r17:16 = memd(r29+#24)
		r19:18 = memd(r29+#16)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end151:
	.size	halide_error_host_is_null, .Lfunc_end151-halide_error_host_is_null
                                        // -- End function
	.section	.text.halide_error_bad_fold,"ax",@progbits
	.weak	halide_error_bad_fold           // -- Begin function halide_error_bad_fold
	.p2align	4
	.type	halide_error_bad_fold,@function
halide_error_bad_fold:                  // @halide_error_bad_fold
// %bb.0:                               // %entry
	{
		r17:16 = combine(r3,r0)
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#40)
	}                                       // 8-byte Folded Spill
	{
		r21:20 = combine(r2,r1)
		r1 = #0
		memd(r29+#16) = r21:20
		memd(r29+#24) = r19:18
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
	}
	{
		r18 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB152_1
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.2:                               // %if.then6.i
	{
		r2 = add(pc,##.L.str.50@PCREL)
		r19 = add(r18,#1023)
		r3 = #0
	}
	{
		r1:0 = combine(r19,r18)
		jump .LBB152_3
		memb(r18+#1023) = r3
	}
.LBB152_1:                              // %entry.split
	{
		r2 = add(pc,##.L.str.50@PCREL)
		r19 = #0
		r1:0 = combine(#0,#0)
	}
.LBB152_3:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r19
		r2 = r21
	}
	{
		r2 = add(pc,##.L.str.51@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r19
		r2 = r20
	}
	{
		r2 = add(pc,##.L.str.52@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r19
		r2 = r17
	}
	{
		r2 = add(pc,##.L.str.30.66@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	{
		r1 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r1
		if (p0.new) jump:nt .LBB152_4
	}
// %bb.5:                               // %if.else.i
	{
		r1:0 = combine(r18,r16)
		r5:4 = combine(#0,#1)
		r3:2 = combine(#0,r0)
	}
	{
		r19 = r3
	}
	{
		r3:2 = sub(r3:2,r19:18)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = add(r3:2,r5:4)
	}
	{
		r1 = r18 ; jump .LBB152_6
	}
.LBB152_4:
	{
		r1 = add(pc,##.L.str.7.123@PCREL)
	}
.LBB152_6:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
		r0 = r16
	}
	{
		call ##free
		r0 = r18
	}
	{
		r0 = #-25
		r17:16 = memd(r29+#32)
		r19:18 = memd(r29+#24)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#16)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end152:
	.size	halide_error_bad_fold, .Lfunc_end152-halide_error_bad_fold
                                        // -- End function
	.section	.text.halide_error_bad_extern_fold,"ax",@progbits
	.weak	halide_error_bad_extern_fold    // -- Begin function halide_error_bad_extern_fold
	.p2align	4
	.type	halide_error_bad_extern_fold,@function
halide_error_bad_extern_fold:           // @halide_error_bad_extern_fold
// %bb.0:                               // %entry
	{
		p0 = cmp.gt(r5,r3)
		r17:16 = combine(r1,r0)
		memd(r29+#-16) = r17:16
		allocframe(#64)
	}                                       // 8-byte Folded Spill
	{
		r22 = r3
		r21 = r4
		memd(r29+#40) = r21:20
		memd(r29+#32) = r23:22
	}                                       // 8-byte Folded Spill
	{
		r24 = r5
		r26 = r2
		memd(r29+#24) = r25:24
		memd(r29+#16) = r27:26
	}                                       // 8-byte Folded Spill
	{
		if (p0) jump:nt .LBB153_2
		r20 = memw(r29+#72)
		memd(r29+#48) = r19:18
	}
// %bb.1:                               // %lor.lhs.false
	{
		r25 = add(r21,r22)
	}
	{
		r0 = add(r20,r24)
		if (!cmp.gt(r25,r0.new)) jump:t .LBB153_8
	}
.LBB153_2:                              // %if.then
	{
		call ##malloc
		r0 = #1024
		r1 = #0
	}
	{
		r18 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB153_3
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.4:                               // %if.then6.i
	{
		r2 = add(pc,##.L.str.53@PCREL)
		r19 = add(r18,#1023)
		r3 = #0
	}
	{
		r1:0 = combine(r19,r18)
		jump .LBB153_5
		memb(r18+#1023) = r3
	}
.LBB153_3:                              // %if.then.split
	{
		r2 = add(pc,##.L.str.53@PCREL)
		r19 = #0
		r1:0 = combine(#0,#0)
	}
.LBB153_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
		r27 = asr(r26,#31)
	}
	{
		r3:2 = combine(r27,r26)
		r4 = #1
		r1 = r19
	}
	{
		call ##halide_int64_to_string
	}
	{
		r2 = add(pc,##.L.str.51@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r19
		r2 = r17
	}
	{
		r2 = add(pc,##.L.str.54@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
		r23 = asr(r22,#31)
	}
	{
		r3:2 = combine(r23,r22)
		r4 = #1
		r1 = r19
	}
	{
		r17 = add(pc,##.L.str.55@PCREL)
		call ##halide_int64_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r19
		r2 = r17
	}
	{
		r2 = add(r21,add(r22,#-1))
		r4 = #1
		r1 = r19
	}
	{
		call ##halide_int64_to_string
		r3 = asr(r2,#31)
	}
	{
		r2 = add(pc,##.L.str.56@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	{
		r2 = add(pc,##.L.str.57@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
		r25 = asr(r24,#31)
	}
	{
		r3:2 = combine(r25,r24)
		r4 = #1
		r1 = r19
	}
	{
		call ##halide_int64_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r19
		r2 = r17
	}
	{
		r2 = add(r20,add(r24,#-1))
		r4 = #1
		r1 = r19
	}
	{
		call ##halide_int64_to_string
		r3 = asr(r2,#31)
	}
	{
		r2 = add(pc,##.L.str.58.74@PCREL)
		jump .LBB153_6
	}
.LBB153_8:                              // %if.else
	{
		call ##malloc
		r0 = #1024
		r1 = #0
	}
	{
		r18 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB153_9
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.10:                              // %if.then6.i107
	{
		r2 = add(pc,##.L.str.53@PCREL)
		r19 = add(r18,#1023)
		r3 = #0
	}
	{
		r1:0 = combine(r19,r18)
		jump .LBB153_11
		memb(r18+#1023) = r3
	}
.LBB153_9:                              // %if.else.split
	{
		r2 = add(pc,##.L.str.53@PCREL)
		r19 = #0
		r1:0 = combine(#0,#0)
	}
.LBB153_11:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit110
	{
		call ##halide_string_to_string
		r27 = asr(r26,#31)
	}
	{
		r3:2 = combine(r27,r26)
		r4 = #1
		r1 = r19
	}
	{
		call ##halide_int64_to_string
	}
	{
		r2 = add(pc,##.L.str.51@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r19
		r2 = r17
	}
	{
		r2 = add(pc,##.L.str.54@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
		r23 = asr(r22,#31)
	}
	{
		r3:2 = combine(r23,r22)
		r4 = #1
		r1 = r19
	}
	{
		call ##halide_int64_to_string
	}
	{
		r2 = add(pc,##.L.str.55@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	{
		r2 = add(r25,#-1)
		r4 = #1
		r1 = r19
	}
	{
		call ##halide_int64_to_string
		r3 = asr(r2,#31)
	}
	{
		r2 = add(pc,##.L.str.56@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	{
		r2 = add(pc,##.L.str.59.75@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	{
		r2 = add(pc,##.L.str.60.76@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
		r21 = asr(r20,#31)
	}
	{
		r3:2 = combine(r21,r20)
		r4 = #1
		r1 = r19
	}
	{
		call ##halide_int64_to_string
	}
	{
		r2 = add(pc,##.L.str.30.66@PCREL)
	}
.LBB153_6:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
		r1 = r19
	}
	{
		r2 = r0
		r4 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r4
		if (p0.new) jump:nt .LBB153_7
	}
// %bb.12:                              // %if.end.sink.split
	{
		r1:0 = combine(r18,r16)
		r3 = #0
		r5:4 = combine(#0,#1)
	}
	{
		r19 = r3
	}
	{
		r3:2 = sub(r3:2,r19:18)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = add(r3:2,r5:4)
		r17 = r18
	}
	{
		jump .LBB153_13
	}
.LBB153_7:
	{
		r18 = add(pc,##.L.str.7.123@PCREL)
		r17 = #0
	}
.LBB153_13:                             // %if.end
	{
		call ##halide_error
		r1:0 = combine(r18,r16)
	}
	{
		call ##free
		r0 = r17
	}
	{
		r0 = #-35
		r17:16 = memd(r29+#56)
		r19:18 = memd(r29+#48)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#40)
		r23:22 = memd(r29+#32)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#24)
		r27:26 = memd(r29+#16)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end153:
	.size	halide_error_bad_extern_fold, .Lfunc_end153-halide_error_bad_extern_fold
                                        // -- End function
	.section	.text.halide_error_fold_factor_too_small,"ax",@progbits
	.weak	halide_error_fold_factor_too_small // -- Begin function halide_error_fold_factor_too_small
	.p2align	4
	.type	halide_error_fold_factor_too_small,@function
halide_error_fold_factor_too_small:     // @halide_error_fold_factor_too_small
// %bb.0:                               // %entry
	{
		r16 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#56)
	}                                       // 8-byte Folded Spill
	{
		r21:20 = combine(r1,r5)
		r1 = #0
		memd(r29+#32) = r21:20
		memd(r29+#40) = r19:18
	}                                       // 8-byte Folded Spill
	{
		r19 = r4
		r24 = r3
		memd(r29+#24) = r23:22
		memd(r29+#16) = r25:24
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
		r22 = r2
	}
	{
		r18 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB154_1
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.2:                               // %if.then6.i
	{
		r2 = add(pc,##.L.str.61.77@PCREL)
		r17 = add(r18,#1023)
		r3 = #0
	}
	{
		r1:0 = combine(r17,r18)
		jump .LBB154_3
		memb(r18+#1023) = r3
	}
.LBB154_1:                              // %entry.split
	{
		r2 = add(pc,##.L.str.61.77@PCREL)
		r17 = #0
		r1:0 = combine(#0,#0)
	}
.LBB154_3:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
		r25 = asr(r24,#31)
	}
	{
		r3:2 = combine(r25,r24)
		r4 = #1
		r1 = r17
	}
	{
		call ##halide_int64_to_string
	}
	{
		r2 = add(pc,##.L.str.62@PCREL)
		r1 = r17
	}
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r17
		r2 = r22
	}
	{
		r2 = add(pc,##.L.str.51@PCREL)
		r1 = r17
	}
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r17
		r2 = r21
	}
	{
		r2 = add(pc,##.L.str.63@PCREL)
		r1 = r17
	}
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r17
		r2 = r19
	}
	{
		r2 = add(pc,##.L.str.32.68@PCREL)
		r1 = r17
	}
	{
		call ##halide_string_to_string
		r21 = asr(r20,#31)
	}
	{
		r3:2 = combine(r21,r20)
		r4 = #1
		r1 = r17
	}
	{
		call ##halide_int64_to_string
	}
	{
		r2 = add(pc,##.L.str.64.78@PCREL)
		r1 = r17
	}
	{
		call ##halide_string_to_string
	}
	{
		r1 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r1
		if (p0.new) jump:nt .LBB154_4
	}
// %bb.5:                               // %if.else.i
	{
		r1:0 = combine(r18,r16)
		r5:4 = combine(#0,#1)
		r3:2 = combine(#0,r0)
	}
	{
		r19 = r3
	}
	{
		r3:2 = sub(r3:2,r19:18)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = add(r3:2,r5:4)
	}
	{
		r1 = r18 ; jump .LBB154_6
	}
.LBB154_4:
	{
		r1 = add(pc,##.L.str.7.123@PCREL)
	}
.LBB154_6:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
		r0 = r16
	}
	{
		call ##free
		r0 = r18
	}
	{
		r0 = #-26
		r17:16 = memd(r29+#48)
		r19:18 = memd(r29+#40)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#32)
		r23:22 = memd(r29+#24)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#16)
		r31:30 = dealloc_return(r30):raw
	}                                       // 8-byte Folded Reload
.Lfunc_end154:
	.size	halide_error_fold_factor_too_small, .Lfunc_end154-halide_error_fold_factor_too_small
                                        // -- End function
	.section	.text.halide_error_requirement_failed,"ax",@progbits
	.weak	halide_error_requirement_failed // -- Begin function halide_error_requirement_failed
	.p2align	4
	.type	halide_error_requirement_failed,@function
halide_error_requirement_failed:        // @halide_error_requirement_failed
// %bb.0:                               // %entry
	{
		r17:16 = combine(r2,r0)
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#40)
	}                                       // 8-byte Folded Spill
	{
		r19 = r1
		r1 = #0
		memd(r29+#24) = r19:18
		memd(r29+#16) = r21:20
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
	}
	{
		r18 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB155_1
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.2:                               // %if.then6.i
	{
		r2 = add(pc,##.L.str.65@PCREL)
		r20 = add(r18,#1023)
		r3 = #0
	}
	{
		r1:0 = combine(r20,r18)
		jump .LBB155_3
		memb(r18+#1023) = r3
	}
.LBB155_1:                              // %entry.split
	{
		r2 = add(pc,##.L.str.65@PCREL)
		r20 = #0
		r1:0 = combine(#0,#0)
	}
.LBB155_3:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r20
		r2 = r19
	}
	{
		r2 = add(pc,##.L.str.66@PCREL)
		r1 = r20
	}
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r20
		r2 = r17
	}
	{
		r1 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r1
		if (p0.new) jump:nt .LBB155_4
	}
// %bb.5:                               // %if.else.i
	{
		r1:0 = combine(r18,r16)
		r5:4 = combine(#0,#1)
		r3:2 = combine(#0,r0)
	}
	{
		r19 = r3
	}
	{
		r3:2 = sub(r3:2,r19:18)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = add(r3:2,r5:4)
	}
	{
		r1 = r18 ; jump .LBB155_6
	}
.LBB155_4:
	{
		r1 = add(pc,##.L.str.7.123@PCREL)
	}
.LBB155_6:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
		r0 = r16
	}
	{
		call ##free
		r0 = r18
	}
	{
		r0 = #-27
		r17:16 = memd(r29+#32)
		r19:18 = memd(r29+#24)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#16)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end155:
	.size	halide_error_requirement_failed, .Lfunc_end155-halide_error_requirement_failed
                                        // -- End function
	.section	.text.halide_error_specialize_fail,"ax",@progbits
	.weak	halide_error_specialize_fail    // -- Begin function halide_error_specialize_fail
	.p2align	4
	.type	halide_error_specialize_fail,@function
halide_error_specialize_fail:           // @halide_error_specialize_fail
// %bb.0:                               // %entry
	{
		r17:16 = combine(r1,r0)
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#24)
	}                                       // 8-byte Folded Spill
	{
		r1 = #0
	}
	{
		call ##malloc
		memd(r29+#8) = r19:18
		memd(r29+#0) = r21:20
	}                                       // 8-byte Folded Spill
	{
		r18 = r0
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB156_1
	}
// %bb.2:                               // %if.else.i
	{
		r2 = add(pc,##.L.str.67@PCREL)
		r19 = add(r18,#1023)
		r21 = #0
	}
	{
		call ##halide_string_to_string
		r1:0 = combine(r19,r18)
		memb(r18+#1023) = r21
	}
	{
		call ##halide_string_to_string
		r1 = r19
		r2 = r17
	}
	{
		r19 = r21
		r20 = r0
		r3:2 = combine(#0,#1)
	}
	{
		r1:0 = sub(r21:20,r19:18)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = add(r1:0,r3:2)
		r1:0 = combine(r18,r16)
	}
	{
		r1 = r18 ; jump .LBB156_3
	}
.LBB156_1:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit.thread
	{
		r2 = add(pc,##.L.str.67@PCREL)
		r1:0 = combine(#0,#0)
	}
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = #0
		r2 = r17
	}
	{
		r1 = add(pc,##.L.str.7.123@PCREL)
	}
.LBB156_3:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
		r0 = r16
	}
	{
		call ##free
		r0 = r18
	}
	{
		r0 = #-31
		r17:16 = memd(r29+#16)
		r19:18 = memd(r29+#8)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end156:
	.size	halide_error_specialize_fail, .Lfunc_end156-halide_error_specialize_fail
                                        // -- End function
	.section	.text.halide_error_no_device_interface,"ax",@progbits
	.weak	halide_error_no_device_interface // -- Begin function halide_error_no_device_interface
	.p2align	4
	.type	halide_error_no_device_interface,@function
halide_error_no_device_interface:       // @halide_error_no_device_interface
// %bb.0:                               // %entry
	{
		r16 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#24)
	}                                       // 8-byte Folded Spill
	{
		r1 = #0
	}
	{
		call ##malloc
		memd(r29+#8) = r19:18
		memd(r29+#0) = r21:20
	}                                       // 8-byte Folded Spill
	{
		r18 = r0
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB157_1
	}
// %bb.2:                               // %if.else.i
	{
		r2 = add(pc,##.L.str.68@PCREL)
		r1 = add(r18,#1023)
		r0 = r18
	}
	{
		call ##halide_string_to_string
		r21 = #0
		memb(r18+#1023) = r21.new
	}
	{
		r19 = r21
		r1:0 = combine(r18,r16)
		r20 = r0
		r5:4 = combine(#0,#1)
	}
	{
		r3:2 = sub(r21:20,r19:18)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = add(r3:2,r5:4)
	}
	{
		r1 = r18 ; jump .LBB157_3
	}
.LBB157_1:                              // %if.then.i
	{
		r2 = add(pc,##.L.str.68@PCREL)
		r1:0 = combine(#0,#0)
	}
	{
		call ##halide_string_to_string
	}
	{
		r1 = add(pc,##.L.str.7.123@PCREL)
	}
.LBB157_3:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
		r0 = r16
	}
	{
		call ##free
		r0 = r18
	}
	{
		r0 = #-19
		r17:16 = memd(r29+#16)
		r19:18 = memd(r29+#8)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end157:
	.size	halide_error_no_device_interface, .Lfunc_end157-halide_error_no_device_interface
                                        // -- End function
	.section	.text.halide_error_device_interface_no_device,"ax",@progbits
	.weak	halide_error_device_interface_no_device // -- Begin function halide_error_device_interface_no_device
	.p2align	4
	.type	halide_error_device_interface_no_device,@function
halide_error_device_interface_no_device: // @halide_error_device_interface_no_device
// %bb.0:                               // %entry
	{
		r16 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#24)
	}                                       // 8-byte Folded Spill
	{
		r1 = #0
	}
	{
		call ##malloc
		memd(r29+#8) = r19:18
		memd(r29+#0) = r21:20
	}                                       // 8-byte Folded Spill
	{
		r18 = r0
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB158_1
	}
// %bb.2:                               // %if.else.i
	{
		r2 = add(pc,##.L.str.69@PCREL)
		r1 = add(r18,#1023)
		r0 = r18
	}
	{
		call ##halide_string_to_string
		r21 = #0
		memb(r18+#1023) = r21.new
	}
	{
		r19 = r21
		r1:0 = combine(r18,r16)
		r20 = r0
		r5:4 = combine(#0,#1)
	}
	{
		r3:2 = sub(r21:20,r19:18)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = add(r3:2,r5:4)
	}
	{
		r1 = r18 ; jump .LBB158_3
	}
.LBB158_1:                              // %if.then.i
	{
		r2 = add(pc,##.L.str.69@PCREL)
		r1:0 = combine(#0,#0)
	}
	{
		call ##halide_string_to_string
	}
	{
		r1 = add(pc,##.L.str.7.123@PCREL)
	}
.LBB158_3:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
		r0 = r16
	}
	{
		call ##free
		r0 = r18
	}
	{
		r0 = #-36
		r17:16 = memd(r29+#16)
		r19:18 = memd(r29+#8)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end158:
	.size	halide_error_device_interface_no_device, .Lfunc_end158-halide_error_device_interface_no_device
                                        // -- End function
	.section	.text.halide_error_host_and_device_dirty,"ax",@progbits
	.weak	halide_error_host_and_device_dirty // -- Begin function halide_error_host_and_device_dirty
	.p2align	4
	.type	halide_error_host_and_device_dirty,@function
halide_error_host_and_device_dirty:     // @halide_error_host_and_device_dirty
// %bb.0:                               // %entry
	{
		r16 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#24)
	}                                       // 8-byte Folded Spill
	{
		r1 = #0
	}
	{
		call ##malloc
		memd(r29+#8) = r19:18
		memd(r29+#0) = r21:20
	}                                       // 8-byte Folded Spill
	{
		r18 = r0
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB159_1
	}
// %bb.2:                               // %if.else.i
	{
		r2 = add(pc,##.L.str.70@PCREL)
		r1 = add(r18,#1023)
		r0 = r18
	}
	{
		call ##halide_string_to_string
		r21 = #0
		memb(r18+#1023) = r21.new
	}
	{
		r19 = r21
		r1:0 = combine(r18,r16)
		r20 = r0
		r5:4 = combine(#0,#1)
	}
	{
		r3:2 = sub(r21:20,r19:18)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = add(r3:2,r5:4)
	}
	{
		r1 = r18 ; jump .LBB159_3
	}
.LBB159_1:                              // %if.then.i
	{
		r2 = add(pc,##.L.str.70@PCREL)
		r1:0 = combine(#0,#0)
	}
	{
		call ##halide_string_to_string
	}
	{
		r1 = add(pc,##.L.str.7.123@PCREL)
	}
.LBB159_3:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
		r0 = r16
	}
	{
		call ##free
		r0 = r18
	}
	{
		r0 = #-37
		r17:16 = memd(r29+#16)
		r19:18 = memd(r29+#8)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end159:
	.size	halide_error_host_and_device_dirty, .Lfunc_end159-halide_error_host_and_device_dirty
                                        // -- End function
	.section	.text.halide_error_buffer_is_null,"ax",@progbits
	.weak	halide_error_buffer_is_null     // -- Begin function halide_error_buffer_is_null
	.p2align	4
	.type	halide_error_buffer_is_null,@function
halide_error_buffer_is_null:            // @halide_error_buffer_is_null
// %bb.0:                               // %entry
	{
		r17:16 = combine(r1,r0)
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#32)
	}                                       // 8-byte Folded Spill
	{
		r1 = #0
	}
	{
		call ##malloc
		memd(r29+#16) = r19:18
	}                                       // 8-byte Folded Spill
	{
		r18 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB160_1
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.2:                               // %if.then6.i
	{
		r2 = add(pc,##.L.str.71@PCREL)
		r19 = add(r18,#1023)
		r3 = #0
	}
	{
		r1:0 = combine(r19,r18)
		jump .LBB160_3
		memb(r18+#1023) = r3
	}
.LBB160_1:                              // %entry.split
	{
		r2 = add(pc,##.L.str.71@PCREL)
		r19 = #0
		r1:0 = combine(#0,#0)
	}
.LBB160_3:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r19
		r2 = r17
	}
	{
		r2 = add(pc,##.L.str.72@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	{
		r1 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r1
		if (p0.new) jump:nt .LBB160_4
	}
// %bb.5:                               // %if.else.i
	{
		r1:0 = combine(r18,r16)
		r5:4 = combine(#0,#1)
		r3:2 = combine(#0,r0)
	}
	{
		r19 = r3
	}
	{
		r3:2 = sub(r3:2,r19:18)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = add(r3:2,r5:4)
	}
	{
		r1 = r18 ; jump .LBB160_6
	}
.LBB160_4:
	{
		r1 = add(pc,##.L.str.7.123@PCREL)
	}
.LBB160_6:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
		r0 = r16
	}
	{
		call ##free
		r0 = r18
	}
	{
		r0 = #-38
		r17:16 = memd(r29+#24)
		r19:18 = memd(r29+#16)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end160:
	.size	halide_error_buffer_is_null, .Lfunc_end160-halide_error_buffer_is_null
                                        // -- End function
	.section	.text.halide_error_storage_bound_too_small,"ax",@progbits
	.weak	halide_error_storage_bound_too_small // -- Begin function halide_error_storage_bound_too_small
	.p2align	4
	.type	halide_error_storage_bound_too_small,@function
halide_error_storage_bound_too_small:   // @halide_error_storage_bound_too_small
// %bb.0:                               // %entry
	{
		r16 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#48)
	}                                       // 8-byte Folded Spill
	{
		r19 = r1
		r1 = #0
		memd(r29+#32) = r19:18
		memd(r29+#24) = r21:20
	}                                       // 8-byte Folded Spill
	{
		r21:20 = combine(r2,r4)
		r22 = r3
		memd(r29+#16) = r23:22
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
	}
	{
		r18 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB161_1
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.2:                               // %if.then6.i
	{
		r2 = add(pc,##.L.str.73@PCREL)
		r17 = add(r18,#1023)
		r3 = #0
	}
	{
		r1:0 = combine(r17,r18)
		jump .LBB161_3
		memb(r18+#1023) = r3
	}
.LBB161_1:                              // %entry.split
	{
		r2 = add(pc,##.L.str.73@PCREL)
		r17 = #0
		r1:0 = combine(#0,#0)
	}
.LBB161_3:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
		r23 = asr(r22,#31)
	}
	{
		r3:2 = combine(r23,r22)
		r4 = #1
		r1 = r17
	}
	{
		call ##halide_int64_to_string
	}
	{
		r2 = add(pc,##.L.str.62@PCREL)
		r1 = r17
	}
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r17
		r2 = r21
	}
	{
		r2 = add(pc,##.L.str.51@PCREL)
		r1 = r17
	}
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r17
		r2 = r19
	}
	{
		r2 = add(pc,##.L.str.74@PCREL)
		r1 = r17
	}
	{
		call ##halide_string_to_string
		r21 = asr(r20,#31)
	}
	{
		r3:2 = combine(r21,r20)
		r4 = #1
		r1 = r17
	}
	{
		call ##halide_int64_to_string
	}
	{
		r2 = add(pc,##.L.str.64.78@PCREL)
		r1 = r17
	}
	{
		call ##halide_string_to_string
	}
	{
		r1 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r1
		if (p0.new) jump:nt .LBB161_4
	}
// %bb.5:                               // %if.else.i
	{
		r1:0 = combine(r18,r16)
		r5:4 = combine(#0,#1)
		r3:2 = combine(#0,r0)
	}
	{
		r19 = r3
	}
	{
		r3:2 = sub(r3:2,r19:18)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = add(r3:2,r5:4)
	}
	{
		r1 = r18 ; jump .LBB161_6
	}
.LBB161_4:
	{
		r1 = add(pc,##.L.str.7.123@PCREL)
	}
.LBB161_6:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
		r0 = r16
	}
	{
		call ##free
		r0 = r18
	}
	{
		r0 = #-45
		r17:16 = memd(r29+#40)
		r19:18 = memd(r29+#32)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#24)
		r23:22 = memd(r29+#16)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end161:
	.size	halide_error_storage_bound_too_small, .Lfunc_end161-halide_error_storage_bound_too_small
                                        // -- End function
	.section	.text.halide_error_device_crop_failed,"ax",@progbits
	.weak	halide_error_device_crop_failed // -- Begin function halide_error_device_crop_failed
	.p2align	4
	.type	halide_error_device_crop_failed,@function
halide_error_device_crop_failed:        // @halide_error_device_crop_failed
// %bb.0:                               // %entry
	{
		r16 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#24)
	}                                       // 8-byte Folded Spill
	{
		r1 = #0
	}
	{
		call ##malloc
		memd(r29+#8) = r19:18
		memd(r29+#0) = r21:20
	}                                       // 8-byte Folded Spill
	{
		r18 = r0
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB162_1
	}
// %bb.2:                               // %if.else.i
	{
		r2 = add(pc,##.L.str.75@PCREL)
		r1 = add(r18,#1023)
		r0 = r18
	}
	{
		call ##halide_string_to_string
		r21 = #0
		memb(r18+#1023) = r21.new
	}
	{
		r19 = r21
		r1:0 = combine(r18,r16)
		r20 = r0
		r5:4 = combine(#0,#1)
	}
	{
		r3:2 = sub(r21:20,r19:18)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = add(r3:2,r5:4)
	}
	{
		r1 = r18 ; jump .LBB162_3
	}
.LBB162_1:                              // %if.then.i
	{
		r2 = add(pc,##.L.str.75@PCREL)
		r1:0 = combine(#0,#0)
	}
	{
		call ##halide_string_to_string
	}
	{
		r1 = add(pc,##.L.str.7.123@PCREL)
	}
.LBB162_3:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
		r0 = r16
	}
	{
		call ##free
		r0 = r18
	}
	{
		r0 = #-41
		r17:16 = memd(r29+#16)
		r19:18 = memd(r29+#8)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end162:
	.size	halide_error_device_crop_failed, .Lfunc_end162-halide_error_device_crop_failed
                                        // -- End function
	.section	.text.halide_profiler_shutdown,"ax",@progbits
	.weak	halide_profiler_shutdown        // -- Begin function halide_profiler_shutdown
	.p2align	4
	.type	halide_profiler_shutdown,@function
halide_profiler_shutdown:               // @halide_profiler_shutdown
// %bb.0:                               // %entry
	{
		call ##halide_profiler_get_state
		memd(r29+#-16) = r17:16
		allocframe(#8)
	}                                       // 8-byte Folded Spill
	{
		r16 = r0
		r0 = memw(r0+#32)
	}
	{
		p0 = cmp.eq(r0,#0)
		if (p0.new) r17:16 = memd(r29+#0)
		if (p0.new) r31:30 = dealloc_return(r30):t:raw
	}                                       // 8-byte Folded Reload
.LBB163_1:                              // %if.end
	{
		call ##halide_join_thread
		memw(r16+#16) = #-2
	}
	{
		r1:0 = combine(r16,#0)
		memw(r16+#32) = #0
		memw(r16+#16) = #-1
	}
	{
		call ##halide_profiler_report_unlocked
	}
	{
		r0 = r16
		r17:16 = memd(r29+#0)
		deallocframe
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_profiler_reset_unlocked
	}
.Lfunc_end163:
	.size	halide_profiler_shutdown, .Lfunc_end163-halide_profiler_shutdown
                                        // -- End function
	.section	.text.halide_profiler_get_state,"ax",@progbits
	.weak	halide_profiler_get_state       // -- Begin function halide_profiler_get_state
	.p2align	4
	.type	halide_profiler_get_state,@function
halide_profiler_get_state:              // @halide_profiler_get_state
// %bb.0:                               // %entry
	{
		r0 = add(pc,##_ZZ25halide_profiler_get_stateE1s@PCREL)
		jumpr r31
	}
.Lfunc_end164:
	.size	halide_profiler_get_state, .Lfunc_end164-halide_profiler_get_state
                                        // -- End function
	.section	.text.halide_profiler_report_unlocked,"ax",@progbits
	.weak	halide_profiler_report_unlocked // -- Begin function halide_profiler_report_unlocked
	.p2align	4
	.type	halide_profiler_report_unlocked,@function
halide_profiler_report_unlocked:        // @halide_profiler_report_unlocked
// %bb.0:                               // %entry
	{
		r17 = r1
		r1 = #0
		memd(r29+#-16) = r17:16
		allocframe(#128)
	}                                       // 8-byte Folded Spill
	{
		r22 = r0
		r0 = #1024
		memd(r29+#96) = r23:22
		memd(r29+#112) = r19:18
	}                                       // 8-byte Folded Spill
	{
		memd(r29+#104) = r21:20
		memd(r29+#88) = r25:24
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
		memd(r29+#80) = r27:26
	}                                       // 8-byte Folded Spill
	{
		p0 = cmp.eq(r0,#0)
		r16 = r0
		r5:4 = combine(#0,#1)
	}
	{
		r2 = p0
		r21:20 = combine(#0,r16)
		memw(r29+#68) = r2.new
	}                                       // 4-byte Folded Spill
	{
		if (!p0) memb(r16+##1023) = r21
	}
	{
		r17 = r21
		r23 = memw(r17+#24)
	}
	{
		r1:0 = sub(r5:4,r17:16)
	}
	{
		p0 = cmp.eq(r23,#0); if (p0.new) jump:nt .LBB165_49
		memd(r29+#48) = r1:0
	}                                       // 8-byte Folded Spill
// %bb.1:
	{
		r6 = add(pc,##.L.str.7.89@PCREL)
		r20 = r16
		r0 = memw(r29+#68)
	}                                       // 4-byte Folded Reload
	{
		r5 = add(pc,##.L.str.8.90@PCREL)
		memw(r29+#44) = r6
	}                                       // 4-byte Folded Spill
	{
		p0 = r0
		memw(r29+#40) = r5
		memw(r29+#56) = r22
	}                                       // 4-byte Folded Spill
	{
		r4 = add(pc,##.L.str.9.91@PCREL)
		if (p0) r19 = add(r21,#0)
		memw(r29+#36) = r4.new
	}                                       // 4-byte Folded Spill
	{
		r3 = add(pc,##.L.str.10.92@PCREL)
		memw(r29+#32) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r2 = add(pc,##.L.str.11.93@PCREL)
		if (!p0) r19 = add(r16,##1023)
	}
	{
		r7 = add(pc,##.L.str.12.94@PCREL)
		memw(r29+#28) = r2
	}                                       // 4-byte Folded Spill
	{
		r6 = add(pc,##.L.str.13.95@PCREL)
		memw(r29+#24) = r7
	}                                       // 4-byte Folded Spill
	{
		r5 = add(pc,##.L.str.15.97@PCREL)
		memw(r29+#20) = r6
	}                                       // 4-byte Folded Spill
	{
		r4 = add(pc,##.L.str.16.98@PCREL)
		memw(r29+#16) = r5
	}                                       // 4-byte Folded Spill
	{
		r3 = add(pc,##.L.str.17.99@PCREL)
		memw(r29+#12) = r4
	}                                       // 4-byte Folded Spill
	{
		r2 = add(pc,##.L.str.7.123@PCREL)
		memw(r29+#8) = r3
	}                                       // 4-byte Folded Spill
	{
		jump .LBB165_5
		memw(r29+#4) = r2
	}                                       // 4-byte Folded Spill
	.p2align	4
.LBB165_2:                              // %for.body44
                                        //   Parent Loop BB165_5 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	{
		r1 = r0
		r9:8 = combine(#0,#0)
	}
	{
		r1 += mpyi(r4,#72)
	}
	{
		r7:6 = memd(r1+#32)
	}
	{
		p0 = cmp.eq(r7:6,r9:8)
		if (!p0.new) jump:nt .LBB165_16
	}
// %bb.3:                               // %for.cond41
                                        //   in Loop: Header=BB165_2 Depth=2
	{
		r7:6 = combine(#0,#1)
	}
	{
		r5:4 = add(r5:4,r7:6)
	}
	{
		p0 = cmp.eq(r5:4,r3:2)
		if (!p0.new) jump:nt .LBB165_2
	}
	.p2align	4
.LBB165_4:                              // %cleanup181
                                        //   in Loop: Header=BB165_5 Depth=1
	{
		r23 = memw(r23+#56)
		if (cmp.eq(r23.new,#0)) jump:nt ##.LBB165_49
	}
.LBB165_5:                              // %for.body
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB165_2 Depth 2
                                        //     Child Loop BB165_20 Depth 2
                                        //       Child Loop BB165_23 Depth 3
                                        //       Child Loop BB165_25 Depth 3
                                        //       Child Loop BB165_30 Depth 3
                                        //       Child Loop BB165_33 Depth 3
                                        //       Child Loop BB165_36 Depth 3
                                        //       Child Loop BB165_38 Depth 3
	{
		r1 = ##1232348160
		r3:2 = memd(r23+#0)
	}
	{
		call ##__hexagon_divsf3
		r0 = convert_ud2sf(r3:2)
	}
	{
		r1 = memw(r23+#68)
		if (cmp.eq(r1.new,#0)) jump:nt .LBB165_4
	}
// %bb.6:                               // %if.end
                                        //   in Loop: Header=BB165_5 Depth=1
	{
		r17 = r0
		r2 = memw(r29+#68)
	}                                       // 4-byte Folded Reload
	{
		p0 = r2
		if (p0.new) jump:nt .LBB165_8
	}
// %bb.7:                               // %if.then.i278
                                        //   in Loop: Header=BB165_5 Depth=1
	{
		r0 = r16
		r18 = r23
		memb(r16+#0) = #0
	}
	{
		jump .LBB165_9
		r23:22 = memd(r23+#32)
	}
	.p2align	4
.LBB165_8:                              // %if.end.split
                                        //   in Loop: Header=BB165_5 Depth=1
	{
		r18 = r23
		r0 = r21
		r23:22 = memd(r23+#32)
	}
.LBB165_9:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EE5clearEv.exit
                                        //   in Loop: Header=BB165_5 Depth=1
	{
		r25:24 = memd(r18+#40)
	}
	{
		p0 = cmp.eq(r23:22,r25:24)
		r1 = r19
		r2 = memw(r18+#48)
	}
	{
		call ##halide_string_to_string
		r3 = p0
		memw(r29+#60) = r3.new
	}                                       // 4-byte Folded Spill
	{
		call ##halide_string_to_string
		r1 = r19
		r2 = memw(r29+#44)
	}                                       // 4-byte Folded Reload
	{
		call ##halide_string_to_string
		r1 = r19
		r2 = memw(r29+#40)
	}                                       // 4-byte Folded Reload
	{
		r3:2 = convert_sf2df(r17)
		r1 = r19
		r4 = r21
	}
	{
		call ##halide_double_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r19
		r2 = memw(r29+#36)
	}                                       // 4-byte Folded Reload
	{
		call ##halide_string_to_string
		r1 = r19
		r2 = memw(r29+#32)
	}                                       // 4-byte Folded Reload
	{
		r1 = r19
		r4 = #1
		r2 = memw(r18+#72)
	}
	{
		call ##halide_int64_to_string
		r3 = asr(r2,#31)
	}
	{
		call ##halide_string_to_string
		r1 = r19
		r2 = memw(r29+#28)
	}                                       // 4-byte Folded Reload
	{
		r1 = r19
		r4 = #1
		r2 = memw(r18+#68)
	}
	{
		call ##halide_int64_to_string
		r3 = asr(r2,#31)
	}
	{
		call ##halide_string_to_string
		r1 = r19
		r2 = memw(r29+#24)
	}                                       // 4-byte Folded Reload
	{
		r20 = r0
		r0 = r17
		r1 = memw(r18+#68)
		memw(r29+#64) = r18
	}                                       // 4-byte Folded Spill
	{
		call ##__hexagon_divsf3
		r1 = convert_w2sf(r1)
	}
	{
		r3:2 = convert_sf2df(r0)
		r1:0 = combine(r19,r20)
		r4 = r21
	}
	{
		call ##halide_double_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r19
		r2 = memw(r29+#20)
	}                                       // 4-byte Folded Reload
	{
		r17 = r0
		r4 = memw(r29+#60)
	}                                       // 4-byte Folded Reload
	{
		p0 = r4
		if (p0.new) jump:t .LBB165_12
	}
// %bb.11:                              // %if.then24
                                        //   in Loop: Header=BB165_5 Depth=1
	{
		r1:0 = convert_ud2df(r25:24)
		r2 = ##-640172613
	}
	{
		r23:22 = convert_ud2df(r23:22)
		r3 = ##1037794527
	}
	{
		call ##__hexagon_adddf3
	}
	{
		call ##__hexagon_divdf3
		r3:2 = combine(r1,r0)
		r1:0 = combine(r23,r22)
	}
	{
		r2 = add(pc,##.L.str.14.96@PCREL)
		r18 = convert_df2sf(r1:0)
		r1:0 = combine(r19,r17)
	}
	{
		call ##halide_string_to_string
	}
	{
		r3:2 = convert_sf2df(r18)
		r1 = r19
		r4 = r21
	}
	{
		call ##halide_double_to_string
	}
	{
		r2 = add(pc,##.L.str.7.89@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	{
		r17 = r0
	}
.LBB165_12:                             // %if.end28
                                        //   in Loop: Header=BB165_5 Depth=1
	{
		r1:0 = combine(r19,r17)
		r2 = memw(r29+#16)
		r22 = memw(r29+#56)
	}                                       // 4-byte Folded Reload
	{
		call ##halide_string_to_string
	}
	{
		r4 = #1
		r1 = r19
		r23 = memw(r29+#64)
	}                                       // 4-byte Folded Reload
	{
		r2 = memw(r23+#76)
	}
	{
		call ##halide_int64_to_string
		r3 = asr(r2,#31)
	}
	{
		call ##halide_string_to_string
		r1 = r19
		r2 = memw(r29+#12)
	}                                       // 4-byte Folded Reload
	{
		r1 = r19
		r4 = #1
		r3:2 = memd(r23+#16)
	}
	{
		call ##halide_uint64_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r19
		r2 = memw(r29+#8)
	}                                       // 4-byte Folded Reload
	{
		r20 = r0
		r1 = memw(r29+#4)
		r0 = memw(r29+#68)
	}                                       // 4-byte Folded Reload
	{
		p0 = r0
		if (p0.new) jump:nt .LBB165_14
	}
// %bb.13:                              // %if.then.i352
                                        //   in Loop: Header=BB165_5 Depth=1
	{
		r1:0 = memd(r29+#48)
	}                                       // 8-byte Folded Reload
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = add(r1:0,r21:20)
		r1:0 = combine(r16,r22)
	}
	{
		r1 = r16
	}
.LBB165_14:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EE3strEv.exit
                                        //   in Loop: Header=BB165_5 Depth=1
	{
		call ##halide_print
		r0 = r22
	}
	{
		r3:2 = combine(#0,#0)
		r1:0 = memd(r23+#0)
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (!p0.new) jump:t .LBB165_16
	}
// %bb.15:                              // %lor.end
                                        //   in Loop: Header=BB165_5 Depth=1
	{
		r3:2 = combine(#0,#0)
		r1:0 = memd(r23+#24)
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (p0.new) jump:nt .LBB165_47
	}
.LBB165_16:                             // %for.cond53.preheader
                                        //   in Loop: Header=BB165_5 Depth=1
	{
		r25:24 = combine(#0,#0)
		r0 = memw(r23+#60)
		if (cmp.gt(r0.new,#0)) jump:t .LBB165_20
	}
	{
		jump .LBB165_4
	}
	.p2align	4
.LBB165_44:                             // %if.then165
                                        //   in Loop: Header=BB165_20 Depth=2
	{
		r2 = add(pc,##.L.str.28.110@PCREL)
		r1:0 = combine(r19,r20)
	}
	{
		call ##halide_string_to_string
	}
	{
		r1 = r19
		r4 = #1
		r3:2 = memd(r18+#32)
	}
	{
		call ##halide_uint64_to_string
	}
	{
		r20 = r0
	}
.LBB165_45:                             // %if.end169
                                        //   in Loop: Header=BB165_20 Depth=2
	{
		r2 = add(pc,##.L.str.7.89@PCREL)
		r1:0 = combine(r19,r20)
	}
	{
		call ##halide_string_to_string
	}
	{
		r20 = r0
		r2 = memw(r29+#68)
	}                                       // 4-byte Folded Reload
	{
		p0 = r2
		if (p0.new) jump:nt .LBB165_46
	}
// %bb.17:                              // %if.then.i478
                                        //   in Loop: Header=BB165_20 Depth=2
	{
		r1:0 = memd(r29+#48)
	}                                       // 8-byte Folded Reload
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = add(r1:0,r21:20)
		r1:0 = combine(r16,r22)
	}
	{
		r1 = r16
	}
.LBB165_18:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EE3strEv.exit480
                                        //   in Loop: Header=BB165_20 Depth=2
	{
		call ##halide_print
		r0 = r22
	}
.LBB165_19:                             // %cleanup172
                                        //   in Loop: Header=BB165_20 Depth=2
	{
		r3:2 = combine(#0,#1)
		r0 = memw(r23+#60)
	}
	{
		r25:24 = add(r25:24,r3:2)
		r1:0 = sxtw(r0)
	}
	{
		p0 = cmp.gt(r1:0,r25:24)
		if (!p0.new) jump:nt .LBB165_4
	}
.LBB165_20:                             // %for.body57
                                        //   Parent Loop BB165_5 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB165_23 Depth 3
                                        //       Child Loop BB165_25 Depth 3
                                        //       Child Loop BB165_30 Depth 3
                                        //       Child Loop BB165_33 Depth 3
                                        //       Child Loop BB165_36 Depth 3
                                        //       Child Loop BB165_38 Depth 3
	{
		r3:2 = combine(#0,#0)
		r0 = memw(r29+#68)
	}                                       // 4-byte Folded Reload
	{
		p0 = r0
		if (!p0.new) memb(r16+#0) = #0
	}
	{
		p0 = cmp.eq(r25:24,r3:2)
		r18 = memw(r23+#52)
	}
	{
		r18 += mpyi(r24,#72)
		if (!p0) jump:nt .LBB165_22
	}
// %bb.21:                              // %land.lhs.true
                                        //   in Loop: Header=BB165_20 Depth=2
	{
		r3:2 = combine(#0,#0)
		r20 = r16
		r1:0 = memd(r18+#0)
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (p0.new) jump:nt .LBB165_19
	}
.LBB165_22:                             // %if.end66
                                        //   in Loop: Header=BB165_20 Depth=2
	{
		r2 = add(pc,##.L.str.18.100@PCREL)
		r1:0 = combine(r19,r16)
	}
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r19
		r2 = memw(r18+#56)
	}
	{
		r2 = add(pc,##.L.str.19.101@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	{
		r3:2 = combine(#0,#24)
		r27:26 = combine(#0,#25)
		r20 = r0
		r17 = r21
	}
	{
		r1:0 = sub(r21:20,r17:16)
	}
	{
		p0 = cmp.gtu(r1:0,r3:2)
		if (p0.new) jump:t .LBB165_24
	}
	.p2align	4
.LBB165_23:                             // %while.body
                                        //   Parent Loop BB165_5 Depth=1
                                        //     Parent Loop BB165_20 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	{
		r2 = add(pc,##.L.str.20.102@PCREL)
		r1:0 = combine(r19,r20)
	}
	{
		call ##halide_string_to_string
	}
	{
		r20 = r0
	}
	{
		r1:0 = sub(r21:20,r17:16)
	}
	{
		p0 = cmp.gtu(r27:26,r1:0)
		if (p0.new) jump:t .LBB165_23
	}
.LBB165_24:                             // %while.end
                                        //   in Loop: Header=BB165_20 Depth=2
	{
		r4 = ##1232348160
		r0 = memw(r23+#68)
		r3:2 = memd(r18+#0)
	}
	{
		r1 = convert_w2sf(r0)
		r0 = convert_ud2sf(r3:2)
	}
	{
		call ##__hexagon_divsf3
		r1 = sfmpy(r1,r4)
	}
	{
		r3:2 = convert_sf2df(r0)
		r1:0 = combine(r19,r20)
		r4 = r21
	}
	{
		call ##halide_double_to_string
	}
	{
		r2 = add(pc,##.L.str.21.103@PCREL)
		r1 = add(r0,#-3)
		p0 = cmp.eq(r0,#0)
	}
	{
		r3 = maxu(r1,r16)
	}
	{
		if (p0) r3 = add(r21,#0)
		if (!p0) memb(r3+#0) = #0
	}
	{
		call ##halide_string_to_string
		r1:0 = combine(r19,r3)
	}
	{
		r20 = r0
		r3:2 = combine(#0,#34)
		r27:26 = combine(#0,#35)
	}
	{
		r1:0 = sub(r21:20,r17:16)
	}
	{
		p0 = cmp.gtu(r1:0,r3:2)
		if (p0.new) jump:t .LBB165_26
	}
	.p2align	4
.LBB165_25:                             // %while.body86
                                        //   Parent Loop BB165_5 Depth=1
                                        //     Parent Loop BB165_20 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	{
		r2 = add(pc,##.L.str.20.102@PCREL)
		r1:0 = combine(r19,r20)
	}
	{
		call ##halide_string_to_string
	}
	{
		r20 = r0
		r17 = r21
	}
	{
		r1:0 = sub(r21:20,r17:16)
	}
	{
		p0 = cmp.gtu(r27:26,r1:0)
		if (p0.new) jump:t .LBB165_25
	}
.LBB165_26:                             // %while.end88
                                        //   in Loop: Header=BB165_20 Depth=2
	{
		r1:0 = combine(#0,#0)
		r3:2 = memd(r23+#0)
	}
	{
		p0 = cmp.eq(r3:2,r1:0)
		if (p0.new) jump:nt .LBB165_28
	}
// %bb.27:                              // %if.then91
                                        //   in Loop: Header=BB165_20 Depth=2
	{
		r0 = #100
		r5:4 = memd(r18+#0)
	}
	{
		r1:0 = mpyu(r4,r0)
	}
	{
		r1 += mpyi(r5,#100)
		call ##__hexagon_udivdi3
	}
	{
		r23:22 = combine(r1,r0)
		jump .LBB165_29
	}
	.p2align	4
.LBB165_46:                             //   in Loop: Header=BB165_20 Depth=2
	{
		r1 = add(pc,##.L.str.7.123@PCREL)
		jump .LBB165_18
	}
	.p2align	4
.LBB165_28:                             //   in Loop: Header=BB165_20 Depth=2
	{
		r22 = #0
	}
.LBB165_29:                             // %if.end97
                                        //   in Loop: Header=BB165_20 Depth=2
	{
		r2 = add(pc,##.L.str.22.104@PCREL)
		r1:0 = combine(r19,r20)
		r27:26 = combine(#0,#43)
	}
	{
		call ##halide_string_to_string
		r23 = asr(r22,#31)
	}
	{
		r3:2 = combine(r23,r22)
		r4 = #1
		r1 = r19
	}
	{
		call ##halide_int64_to_string
	}
	{
		r2 = add(pc,##.L.str.23.105@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	{
		r3:2 = combine(#0,#42)
		r20 = r0
		r17 = r21
	}
	{
		r1:0 = sub(r21:20,r17:16)
	}
	{
		p0 = cmp.gtu(r1:0,r3:2)
		if (p0.new) jump:t .LBB165_31
	}
	.p2align	4
.LBB165_30:                             // %while.body105
                                        //   Parent Loop BB165_5 Depth=1
                                        //     Parent Loop BB165_20 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	{
		r2 = add(pc,##.L.str.20.102@PCREL)
		r1:0 = combine(r19,r20)
	}
	{
		call ##halide_string_to_string
	}
	{
		r20 = r0
	}
	{
		r1:0 = sub(r21:20,r17:16)
	}
	{
		p0 = cmp.gtu(r27:26,r1:0)
		if (p0.new) jump:t .LBB165_30
	}
.LBB165_31:                             // %while.end107
                                        //   in Loop: Header=BB165_20 Depth=2
	{
		r22 = #58
		r0 = memw(r29+#60)
	}                                       // 4-byte Folded Reload
	{
		p0 = r0
		if (p0.new) jump:t .LBB165_34
	}
// %bb.32:                              // %if.then109
                                        //   in Loop: Header=BB165_20 Depth=2
	{
		r2 = ##-640172613
		r1:0 = memd(r18+#48)
		r5:4 = memd(r18+#40)
	}
	{
		r3 = ##1037794527
	}
	{
		r1:0 = convert_ud2df(r1:0)
		r23:22 = convert_ud2df(r5:4)
	}
	{
		call ##__hexagon_adddf3
	}
	{
		call ##__hexagon_divdf3
		r3:2 = combine(r1,r0)
		r1:0 = combine(r23,r22)
	}
	{
		r2 = add(pc,##.L.str.24.106@PCREL)
		r17 = convert_df2sf(r1:0)
		r1:0 = combine(r19,r20)
	}
	{
		call ##halide_string_to_string
	}
	{
		r3:2 = convert_sf2df(r17)
		r1 = r19
		r4 = r21
	}
	{
		call ##halide_double_to_string
	}
	{
		r2 = add(r0,#-3)
		r5:4 = combine(#0,#57)
		r17 = r21
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = maxu(r2,r16)
		r22 = #73
		r27:26 = combine(#0,#58)
	}
	{
		r20 = mux(p0,r21,r0)
	}
	{
		r3:2 = sub(r21:20,r17:16)
		if (!p0) memb(r0+#0) = #0
	}
	{
		p1 = cmp.gtu(r3:2,r5:4)
		if (p1.new) jump:t .LBB165_34
	}
	.p2align	4
.LBB165_33:                             // %while.body124
                                        //   Parent Loop BB165_5 Depth=1
                                        //     Parent Loop BB165_20 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	{
		r2 = add(pc,##.L.str.20.102@PCREL)
		r1:0 = combine(r19,r20)
	}
	{
		call ##halide_string_to_string
	}
	{
		r20 = r0
	}
	{
		r1:0 = sub(r21:20,r17:16)
	}
	{
		p0 = cmp.gtu(r27:26,r1:0)
		if (p0.new) jump:t .LBB165_33
	}
.LBB165_34:                             //   in Loop: Header=BB165_20 Depth=2
	{
		r3:2 = combine(#0,#0)
		r1:0 = memd(r18+#16)
		r23 = memw(r29+#64)
	}                                       // 4-byte Folded Reload
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (p0.new) jump:nt .LBB165_41
	}
// %bb.35:                              // %if.then130
                                        //   in Loop: Header=BB165_20 Depth=2
	{
		r2 = add(pc,##.L.str.25.107@PCREL)
		r1:0 = combine(r19,r20)
	}
	{
		call ##halide_string_to_string
	}
	{
		r1 = r19
		r4 = #1
		r3:2 = memd(r18+#16)
	}
	{
		call ##halide_uint64_to_string
	}
	{
		r17 = r21
		r20 = r0
		r23 = r21
	}
	{
		r1:0 = sub(r21:20,r17:16)
	}
	{
		p0 = cmp.gtu(r23:22,r1:0)
		if (!p0.new) jump:nt .LBB165_37
	}
	.p2align	4
.LBB165_36:                             // %while.body138
                                        //   Parent Loop BB165_5 Depth=1
                                        //     Parent Loop BB165_20 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	{
		r2 = add(pc,##.L.str.20.102@PCREL)
		r1:0 = combine(r19,r20)
	}
	{
		call ##halide_string_to_string
	}
	{
		r20 = r0
	}
	{
		r1:0 = sub(r21:20,r17:16)
	}
	{
		p0 = cmp.gtu(r23:22,r1:0)
		if (p0.new) jump:t .LBB165_36
	}
.LBB165_37:                             // %while.end140
                                        //   in Loop: Header=BB165_20 Depth=2
	{
		r2 = add(pc,##.L.str.26.108@PCREL)
		r1:0 = combine(r19,r20)
	}
	{
		call ##halide_string_to_string
	}
	{
		r4 = #1
		r1 = r19
		r2 = memw(r18+#60)
	}
	{
		call ##halide_int64_to_string
		r3 = asr(r2,#31)
	}
	{
		r5:4 = combine(#0,#15)
		r20 = r0
	}
	{
		r23:22 = add(r23:22,r5:4)
		r1:0 = sub(r21:20,r17:16)
	}
	{
		p0 = cmp.gtu(r23:22,r1:0)
		if (!p0.new) jump:nt .LBB165_39
	}
	.p2align	4
.LBB165_38:                             // %while.body148
                                        //   Parent Loop BB165_5 Depth=1
                                        //     Parent Loop BB165_20 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	{
		r2 = add(pc,##.L.str.20.102@PCREL)
		r1:0 = combine(r19,r20)
	}
	{
		call ##halide_string_to_string
	}
	{
		r20 = r0
		r17 = r21
	}
	{
		r1:0 = sub(r21:20,r17:16)
	}
	{
		p0 = cmp.gtu(r23:22,r1:0)
		if (p0.new) jump:t .LBB165_38
	}
.LBB165_39:                             // %while.end150
                                        //   in Loop: Header=BB165_20 Depth=2
	{
		r2 = memw(r18+#60)
		if (cmp.eq(r2.new,#0)) jump:nt .LBB165_42
	}
// %bb.40:                              // %if.then153
                                        //   in Loop: Header=BB165_20 Depth=2
	{
		call ##__hexagon_udivdi3
		r3 = asr(r2,#31)
		r1:0 = memd(r18+#24)
	}
	{
		r23:22 = combine(r1,r0)
		jump .LBB165_43
	}
	.p2align	4
.LBB165_41:                             //   in Loop: Header=BB165_20 Depth=2
	{
		r3:2 = combine(#0,#0)
		r22 = memw(r29+#56)
		r1:0 = memd(r18+#32)
	}                                       // 4-byte Folded Reload
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (p0.new) jump:t .LBB165_45
	}
	{
		jump .LBB165_44
	}
	.p2align	4
.LBB165_42:                             //   in Loop: Header=BB165_20 Depth=2
	{
		r22 = #0
	}
.LBB165_43:                             // %if.end159
                                        //   in Loop: Header=BB165_20 Depth=2
	{
		r2 = add(pc,##.L.str.27.109@PCREL)
		r1:0 = combine(r19,r20)
	}
	{
		call ##halide_string_to_string
		r23 = asr(r22,#31)
	}
	{
		r3:2 = combine(r23,r22)
		r4 = #1
		r1 = r19
	}
	{
		call ##halide_int64_to_string
	}
	{
		r20 = r0
		r22 = memw(r29+#56)
		r23 = memw(r29+#64)
	}                                       // 4-byte Folded Reload
	{
		r3:2 = combine(#0,#0)
		r1:0 = memd(r18+#32)
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (p0.new) jump:t .LBB165_45
	}
	{
		jump .LBB165_44
	}
.LBB165_47:                             // %for.cond41.preheader
                                        //   in Loop: Header=BB165_5 Depth=1
	{
		r1 = memw(r23+#60)
		if (!cmp.gt(r1.new,#0)) jump:t ##.LBB165_4
	}
// %bb.48:                              // %for.body44.lr.ph
                                        //   in Loop: Header=BB165_5 Depth=1
	{
		r5:4 = combine(#0,#0)
		jump .LBB165_2
		r3:2 = combine(#0,r1)
		r0 = memw(r23+#52)
	}
.LBB165_49:                             // %for.cond.cleanup
	{
		r0 = memw(r29+#68)
	}                                       // 4-byte Folded Reload
	{
		p0 = r0
		if (p0.new) jump:nt .LBB165_51
	}
// %bb.50:                              // %if.else.i
	{
		r1:0 = combine(r16,r22)
		r21 = #0
		r3:2 = memd(r29+#48)
	}                                       // 8-byte Folded Reload
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = add(r3:2,r21:20)
	}
	{
		jump .LBB165_52
	}
.LBB165_51:                             // %if.then.i
	{
		r1 = add(pc,##.L.str.7.123@PCREL)
		r0 = r22
	}
	{
		call ##halide_error
	}
.LBB165_52:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy1024EED2Ev.exit
	{
		r0 = r16
		r17:16 = memd(r29+#120)
		r19:18 = memd(r29+#112)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#104)
		r23:22 = memd(r29+#96)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#88)
		r27:26 = memd(r29+#80)
	}                                       // 8-byte Folded Reload
	{
		jump ##free
		r31:30 = deallocframe(r30):raw
	}
.Lfunc_end165:
	.size	halide_profiler_report_unlocked, .Lfunc_end165-halide_profiler_report_unlocked
                                        // -- End function
	.section	.text.halide_profiler_reset_unlocked,"ax",@progbits
	.weak	halide_profiler_reset_unlocked  // -- Begin function halide_profiler_reset_unlocked
	.p2align	4
	.type	halide_profiler_reset_unlocked,@function
halide_profiler_reset_unlocked:         // @halide_profiler_reset_unlocked
// %bb.0:                               // %entry
	{
		r16 = r0
		memd(r29+#-16) = r17:16
		allocframe(#8)
	}                                       // 8-byte Folded Spill
	{
		jump .LBB166_2
		r17 = memw(r0+#24)
	}
	.p2align	4
.LBB166_1:                              // %while.body
                                        //   in Loop: Header=BB166_2 Depth=1
	{
		r0 = memw(r17+#52)
		r1 = memw(r17+#56)
	}
	{
		call ##free
		memw(r16+#24) = r1
	}
	{
		call ##free
		r0 = r17
	}
	{
		r17 = memw(r16+#24)
	}
.LBB166_2:                              // %while.body
                                        // =>This Inner Loop Header: Depth=1
	{
		p0 = cmp.eq(r17,#0)
		if (p0.new) r17:16 = memd(r29+#0)
		if (p0.new) memw(r16+#12) = #0
	}                                       // 8-byte Folded Reload
	{
		if (p0) r31:30 = dealloc_return(r30):raw
	}
	{
		jump .LBB166_1
	}
.Lfunc_end166:
	.size	halide_profiler_reset_unlocked, .Lfunc_end166-halide_profiler_reset_unlocked
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal23find_or_create_pipelineEPKciPKy,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal23find_or_create_pipelineEPKciPKy // -- Begin function _ZN6Halide7Runtime8Internal23find_or_create_pipelineEPKciPKy
	.p2align	4
	.type	_ZN6Halide7Runtime8Internal23find_or_create_pipelineEPKciPKy,@function
_ZN6Halide7Runtime8Internal23find_or_create_pipelineEPKciPKy: // @_ZN6Halide7Runtime8Internal23find_or_create_pipelineEPKciPKy
// %bb.0:                               // %entry
	{
		r17 = r2
		memd(r29+#-16) = r17:16
		allocframe(#48)
	}                                       // 8-byte Folded Spill
	{
		r20 = r1
		r19 = r0
		memd(r29+#32) = r19:18
		memd(r29+#24) = r21:20
	}                                       // 8-byte Folded Spill
	{
		memd(r29+#16) = r23:22
		memd(r29+#8) = r25:24
	}                                       // 8-byte Folded Spill
	{
		call ##halide_profiler_get_state
		memd(r29+#0) = r27:26
	}                                       // 8-byte Folded Spill
	{
		r18 = r0
		r16 = memw(r0+#24)
	}
	{
		p0 = cmp.eq(r16,#0); if (p0.new) jump:nt .LBB167_5
	}
.LBB167_2:                              // %for.body
                                        // =>This Inner Loop Header: Depth=1
	{
		r0 = memw(r16+#48)
		if (cmp.eq(r0.new,r19)) jump:nt .LBB167_3
	}
.LBB167_4:                              // %for.inc
                                        //   in Loop: Header=BB167_2 Depth=1
	{
		r16 = memw(r16+#56)
		if (!cmp.eq(r16.new,#0)) jump:t .LBB167_2
	}
	{
		jump .LBB167_5
	}
	.p2align	4
.LBB167_3:                              // %land.lhs.true
                                        //   in Loop: Header=BB167_2 Depth=1
	{
		r0 = memw(r16+#60)
		if (cmp.eq(r0.new,r20)) jump:t .LBB167_17
	}
	{
		jump .LBB167_4
	}
.LBB167_5:                              // %for.end
	{
		call ##malloc
		r1:0 = combine(#0,#96)
	}
	{
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB167_16
	}
// %bb.6:                               // %if.end7
	{
		r2 = asr(r20,#31)
		r0 = #72
		r16 = r0
		r1 = memw(r18+#24)
	}
	{
		r1:0 = mpyu(r20,r0)
		r5:4 = combine(#0,#0)
		r3 = memw(r18+#12)
		memw(r16+#64) = r1
	}
	{
		r1 += mpyi(r2,#72)
		memd(r16+#0) = r5:4
		memd(r16+#8) = r5:4
	}
	{
		memd(r16+#16) = r5:4
		memd(r16+#24) = r5:4
	}
	{
		memd(r16+#32) = r5:4
		memd(r16+#40) = r5:4
	}
	{
		memd(r16+#80) = r5:4
		memw(r16+#48) = r19
	}
	{
		memw(r16+#76) = r3
		memw(r16+#72) = r20
	}
	{
		call ##malloc
		memw(r16+#88) = #0
	}
	{
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB167_15
		memw(r16+#56) = r0
	}
// %bb.7:                               // %for.cond17.preheader
	{
		p0 = cmp.gt(r20,#0); if (!p0.new) jump:nt .LBB167_14
	}
// %bb.8:                               // %for.body20.lr.ph
	{
		r3 = #0
		r7:6 = combine(#-1,#-1)
		r9:8 = combine(#0,#3)
		r2 = and(r20,#3)
	}
	{
		r21 = r3
		r5:4 = combine(r3,#0)
	}
	{
		r7:6 = add(r21:20,r7:6)
	}
	{
		p0 = cmp.gtu(r9:8,r7:6)
		if (p0.new) jump:t .LBB167_11
	}
// %bb.9:                               // %for.body20.lr.ph.new
	{
		r1 = #-4
		r13:12 = combine(#0,#4)
		r5:4 = combine(#0,#0)
		r7:6 = combine(#0,#0)
	}
	{
		r8 = and(r20,r1)
		r15:14 = combine(#-1,#-4)
		r9 = #0
	}
	.p2align	4
.LBB167_10:                             // %for.body20
                                        // =>This Inner Loop Header: Depth=1
	{
		r1 = +mpyi(r4,#72)
		r28 = setbit(r4,#0)
		r10 = or(r4,#3)
	}
	{
		r19 = +mpyi(r28,#72)
		r21 = setbit(r4,#1)
		r11 = add(r0,r1)
	}
	{
		r22 = +mpyi(r21,#72)
		r24 = +mpyi(r10,#72)
		r1 = add(r0,r19)
		memd(r0+r1<<#0) = r7:6
	}
	{
		r9:8 = add(r9:8,r15:14)
		r23 = add(r0,r22)
		r27:26 = memd(r17+r4<<#3)
		memd(r11+#8) = r7:6
	}
	{
		p0 = cmp.eq(r9:8,r7:6)
		r25 = add(r0,r24)
		memd(r11+#16) = r7:6
		memd(r11+#24) = r7:6
	}
	{
		r5:4 = add(r5:4,r13:12)
		memd(r11+#32) = r7:6
		memd(r11+#40) = r7:6
	}
	{
		memd(r11+#48) = r7:6
		memd(r0+r19<<#0) = r7:6
	}
	{
		r27:26 = memd(r17+r28<<#3)
		memw(r11+#56) = r26
	}
	{
		memd(r1+#8) = r7:6
		memd(r1+#16) = r7:6
	}
	{
		memd(r1+#24) = r7:6
		memd(r1+#32) = r7:6
	}
	{
		memd(r1+#40) = r7:6
		memd(r1+#48) = r7:6
	}
	{
		memd(r0+r22<<#0) = r7:6
		memw(r1+#56) = r26
	}
	{
		r27:26 = memd(r17+r21<<#3)
		memd(r0+r24<<#0) = r7:6
	}
	{
		memd(r23+#8) = r7:6
		memd(r23+#16) = r7:6
	}
	{
		memd(r23+#24) = r7:6
		memd(r23+#32) = r7:6
	}
	{
		memd(r23+#40) = r7:6
		memd(r23+#48) = r7:6
	}
	{
		r11:10 = memd(r17+r10<<#3)
		memw(r11+#60) = #0
	}
	{
		memw(r1+#60) = #0
		memw(r23+#56) = r26
	}
	{
		memw(r23+#60) = #0
		memw(r25+#56) = r10
	}
	{
		memd(r25+#8) = r7:6
		memd(r25+#16) = r7:6
	}
	{
		memd(r25+#24) = r7:6
		memw(r25+#60) = #0
	}
	{
		memd(r25+#32) = r7:6
		memd(r25+#40) = r7:6
	}
	{
		if (!p0) jump:nt .LBB167_10
		memd(r25+#48) = r7:6
	}
.LBB167_11:                             // %for.cond.cleanup19.loopexit.unr-lcssa
	{
		r7:6 = combine(#0,#0)
	}
	{
		p0 = cmp.eq(r3:2,r7:6)
		if (p0.new) jump:nt .LBB167_14
	}
// %bb.12:
	{
		r9:8 = combine(#0,#1)
		r13:12 = combine(#-1,#-1)
	}
	.p2align	4
.LBB167_13:                             // %for.body20.epil
                                        // =>This Inner Loop Header: Depth=1
	{
		r1 = +mpyi(r4,#72)
		r3:2 = add(r3:2,r13:12)
	}
	{
		p0 = cmp.eq(r3:2,r7:6)
		r14 = add(r0,r1)
	}
	{
		memd(r0+r1<<#0) = r7:6
		memw(r14+#60) = #0
	}
	{
		r5:4 = add(r5:4,r9:8)
		r11:10 = memd(r17+r4<<#3)
		memd(r14+#8) = r7:6
	}
	{
		memw(r14+#56) = r10
		memd(r14+#16) = r7:6
	}
	{
		memd(r14+#24) = r7:6
		memd(r14+#32) = r7:6
	}
	{
		if (!p0) jump:nt .LBB167_13
		memd(r14+#40) = r7:6
		memd(r14+#48) = r7:6
	}
.LBB167_14:                             // %for.cond.cleanup19
	{
		memw(r18+#12) += r20
	}
	{
		jump .LBB167_17
		memw(r18+#24) = r16
	}
.LBB167_15:                             // %if.then15
	{
		call ##free
		r0 = r16
	}
.LBB167_16:                             // %cleanup62
	{
		r16 = #0
	}
.LBB167_17:                             // %cleanup62
	{
		r0 = r16
		r17:16 = memd(r29+#40)
		r19:18 = memd(r29+#32)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#24)
		r23:22 = memd(r29+#16)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#8)
		r27:26 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end167:
	.size	_ZN6Halide7Runtime8Internal23find_or_create_pipelineEPKciPKy, .Lfunc_end167-_ZN6Halide7Runtime8Internal23find_or_create_pipelineEPKciPKy
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal9bill_funcEP21halide_profiler_stateiyi,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal9bill_funcEP21halide_profiler_stateiyi // -- Begin function _ZN6Halide7Runtime8Internal9bill_funcEP21halide_profiler_stateiyi
	.p2align	4
	.type	_ZN6Halide7Runtime8Internal9bill_funcEP21halide_profiler_stateiyi,@function
_ZN6Halide7Runtime8Internal9bill_funcEP21halide_profiler_stateiyi: // @_ZN6Halide7Runtime8Internal9bill_funcEP21halide_profiler_stateiyi
// %bb.0:                               // %entry
	{
		memd(r29+#-16) = r17:16
		allocframe(#8)
	}                                       // 8-byte Folded Spill
	{
		r6 = memw(r0+#24)
	}
	{
		p0 = cmp.eq(r6,#0)
		if (p0.new) r17:16 = memd(r29+#0)
		if (p0.new) r31:30 = dealloc_return(r30):t:raw
	}                                       // 8-byte Folded Reload
.LBB168_1:
	{
		r7 = #0 ; jump .LBB168_2
		r8 = r6
	}
	.p2align	4
.LBB168_7:                              // %if.end23
                                        //   in Loop: Header=BB168_2 Depth=1
	{
		r7 = r5
		r8 = memw(r5+#56)
	}
	{
		p0 = cmp.eq(r8,#0)
		if (p0.new) jump:nt .LBB168_8
	}
.LBB168_2:                              // %for.body
                                        // =>This Inner Loop Header: Depth=1
	{
		r5 = r8
		r8 = memw(r8+#64)
		if (cmp.gt(r8.new,r1)) jump:t .LBB168_7
	}
// %bb.3:                               // %land.lhs.true
                                        //   in Loop: Header=BB168_2 Depth=1
	{
		r9 = memw(r5+#60)
	}
	{
		r9 = add(r9,r8)
		if (!cmp.gt(r9.new,r1)) jump:t .LBB168_7
	}
// %bb.4:                               // %if.then
	{
		p0 = cmp.eq(r7,#0); if (p0.new) jump:nt .LBB168_6
	}
// %bb.5:                               // %if.then4
	{
		r9 = memw(r5+#56)
		memw(r7+#56) = r9.new
	}
	{
		memw(r0+#24) = r5
		memw(r5+#56) = r6
	}
.LBB168_6:                              // %if.end
	{
		r0 = sub(r1,r8)
		r7:6 = combine(#0,#1)
		r1 = memw(r5+#52)
		r11:10 = memd(r5+#0)
	}
	{
		r0 = +mpyi(r0,#72)
		r9:8 = add(r11:10,r3:2)
		r13:12 = memd(r5+#32)
		r15:14 = memd(r5+#40)
	}
	{
		r9:8 = add(r5:4,r13:12):raw:lo
		r15:14 = add(r15:14,r7:6)
		r28 = add(r1,r0)
		memd(r5+#0) = r9:8
	}
	{
		r17:16 = memd(r28+#40)
		memd(r5+#32) = r9:8
	}
	{
		r13:12 = add(r5:4,r17:16):raw:lo
		r11:10 = memd(r28+#48)
		memd(r5+#40) = r15:14
	}
	{
		r7:6 = add(r11:10,r7:6)
		r17:16 = memd(r1+r0<<#0)
		memw(r5+#72) += #1
	}
	{
		r3:2 = add(r17:16,r3:2)
		r17:16 = memd(r29+#0)
		memd(r28+#40) = r13:12
	}                                       // 8-byte Folded Reload
	{
		memd(r28+#48) = r7:6
		memd(r1+r0<<#0) = r3:2
	}
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB168_8:                              // %cleanup25
	{
		r17:16 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end168:
	.size	_ZN6Halide7Runtime8Internal9bill_funcEP21halide_profiler_stateiyi, .Lfunc_end168-_ZN6Halide7Runtime8Internal9bill_funcEP21halide_profiler_stateiyi
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal24sampling_profiler_threadEPv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal24sampling_profiler_threadEPv // -- Begin function _ZN6Halide7Runtime8Internal24sampling_profiler_threadEPv
	.p2align	4
	.type	_ZN6Halide7Runtime8Internal24sampling_profiler_threadEPv,@function
_ZN6Halide7Runtime8Internal24sampling_profiler_threadEPv: // @_ZN6Halide7Runtime8Internal24sampling_profiler_threadEPv
// %bb.0:                               // %entry
	{
		memd(r29+#-16) = r17:16
		allocframe(#32)
	}                                       // 8-byte Folded Spill
	{
		call ##halide_profiler_get_state
		memd(r29+#16) = r19:18
		memd(r29+#8) = r21:20
	}                                       // 8-byte Folded Spill
	{
		call ##halide_mutex_lock
		r16 = r0
	}
	.p2align	4
.LBB169_1:                              // %entry
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB169_3 Depth 2
	{
		r0 = memw(r16+#16)
	}
	{
		p0 = cmp.eq(r0,#-2)
		if (p0.new) jump:nt .LBB169_10
	}
// %bb.2:                               // %while.body
                                        //   in Loop: Header=BB169_1 Depth=1
	{
		call ##halide_current_time_ns
		r0 = #0
	}
	{
		r19:18 = combine(r1,r0)
		jump .LBB169_3
	}
	.p2align	4
.LBB169_9:                              // %cleanup
                                        //   in Loop: Header=BB169_3 Depth=2
	{
		call ##halide_mutex_unlock
		r0 = r16
		r17 = memw(r16+#8)
	}
	{
		call ##halide_sleep_ms
		r1:0 = combine(r17,#0)
	}
	{
		call ##halide_mutex_lock
		r0 = r16
		r19:18 = combine(r21,r20)
	}
.LBB169_3:                              // %while.cond2
                                        //   Parent Loop BB169_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	{
		r2 = memw(r16+#28)
		if (cmp.eq(r2.new,#0)) jump:nt .LBB169_5
	}
// %bb.4:                               // %if.then
                                        //   in Loop: Header=BB169_3 Depth=2
	{
		callr r2
		r0 = add(r29,#4)
		r1 = add(r29,#0)
	}
	{
		jump .LBB169_6
	}
	.p2align	4
.LBB169_5:                              // %if.else
                                        //   in Loop: Header=BB169_3 Depth=2
	{
		r0 = memw(r16+#16)
		memw(r29+#4) = r0.new
	}
	{
		r2 = memw(r16+#20)
		memw(r29+#0) = r2.new
	}
.LBB169_6:                              // %if.end
                                        //   in Loop: Header=BB169_3 Depth=2
	{
		call ##halide_current_time_ns
		r0 = #0
	}
	{
		r5 = memw(r29+#4)
	}
	{
		p0 = cmp.eq(r5,#-2)
		if (p0.new) jump:nt .LBB169_1
	}
// %bb.7:                               // %if.else10
                                        //   in Loop: Header=BB169_3 Depth=2
	{
		r21:20 = combine(r1,r0)
		p0 = cmp.gt(r5,#-1); if (!p0.new) jump:nt .LBB169_9
	}
// %bb.8:                               // %if.then12
                                        //   in Loop: Header=BB169_3 Depth=2
	{
		r3:2 = sub(r21:20,r19:18)
		r1:0 = combine(r5,r16)
		r4 = memw(r29+#0)
	}
	{
		call ##_ZN6Halide7Runtime8Internal9bill_funcEP21halide_profiler_stateiyi
	}
	{
		jump .LBB169_9
	}
.LBB169_10:                             // %while.end19
	{
		call ##halide_mutex_unlock
		r0 = r16
	}
	{
		r17:16 = memd(r29+#24)
		r19:18 = memd(r29+#16)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#8)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end169:
	.size	_ZN6Halide7Runtime8Internal24sampling_profiler_threadEPv, .Lfunc_end169-_ZN6Halide7Runtime8Internal24sampling_profiler_threadEPv
                                        // -- End function
	.section	.text.halide_profiler_get_pipeline_state,"ax",@progbits
	.weak	halide_profiler_get_pipeline_state // -- Begin function halide_profiler_get_pipeline_state
	.p2align	4
	.type	halide_profiler_get_pipeline_state,@function
halide_profiler_get_pipeline_state:     // @halide_profiler_get_pipeline_state
// %bb.0:                               // %entry
	{
		memd(r29+#-16) = r17:16
		allocframe(#16)
	}                                       // 8-byte Folded Spill
	{
		call ##halide_profiler_get_state
		r18 = r0
		memd(r29+#0) = r19:18
	}                                       // 8-byte Folded Spill
	{
		call ##halide_mutex_lock
		r17 = #0
		r16 = r0
	}
	{
		r0 = memw(r16+#24)
		if (cmp.eq(r0.new,#0)) jump:t .LBB170_4
	}
	{
		jump .LBB170_1
	}
	.p2align	4
.LBB170_3:                              // %for.inc
                                        //   in Loop: Header=BB170_1 Depth=1
	{
		r0 = memw(r0+#56)
		if (cmp.eq(r0.new,#0)) jump:nt .LBB170_4
	}
.LBB170_1:                              // %for.body
                                        // =>This Inner Loop Header: Depth=1
	{
		r1 = memw(r0+#48)
		if (!cmp.eq(r1.new,r18)) jump:t .LBB170_3
	}
// %bb.2:
	{
		r17 = r0
	}
.LBB170_4:                              // %cleanup
	{
		call ##halide_mutex_unlock
		r0 = r16
	}
	{
		r0 = r17
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end170:
	.size	halide_profiler_get_pipeline_state, .Lfunc_end170-halide_profiler_get_pipeline_state
                                        // -- End function
	.section	.text.halide_profiler_pipeline_start,"ax",@progbits
	.weak	halide_profiler_pipeline_start  // -- Begin function halide_profiler_pipeline_start
	.p2align	4
	.type	halide_profiler_pipeline_start,@function
halide_profiler_pipeline_start:         // @halide_profiler_pipeline_start
// %bb.0:                               // %entry
	{
		r17 = r0
		memd(r29+#-16) = r17:16
		allocframe(#24)
	}                                       // 8-byte Folded Spill
	{
		r19:18 = combine(r2,r3)
		r20 = r1
		memd(r29+#8) = r19:18
		memd(r29+#0) = r21:20
	}                                       // 8-byte Folded Spill
	{
		call ##halide_profiler_get_state
	}
	{
		call ##halide_mutex_lock
		r16 = r0
	}
	{
		r0 = memw(r16+#32)
		if (!cmp.eq(r0.new,#0)) jump:t .LBB171_2
	}
// %bb.1:                               // %if.then
	{
		call ##halide_start_clock
		r0 = r17
	}
	{
		r0 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		r1 = #0
	}
	{
		call ##halide_spawn_thread
		r0 = memw(r0+##_ZN6Halide7Runtime8Internal24sampling_profiler_threadEPv@GOT)
	}
	{
		memw(r16+#32) = r0
	}
.LBB171_2:                              // %if.end
	{
		call ##_ZN6Halide7Runtime8Internal23find_or_create_pipelineEPKciPKy
		r1:0 = combine(r19,r20)
		r2 = r18
	}
	{
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB171_3
	}
// %bb.4:                               // %if.end9
	{
		jump .LBB171_5
		r17 = memw(r0+#64)
		memw(r0+#68) += #1
	}
.LBB171_3:                              // %if.then7
	{
		call ##halide_error_out_of_memory
		r0 = r17
	}
	{
		r17 = r0
	}
.LBB171_5:                              // %cleanup
	{
		call ##halide_mutex_unlock
		r0 = r16
	}
	{
		r0 = r17
		r17:16 = memd(r29+#16)
		r19:18 = memd(r29+#8)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end171:
	.size	halide_profiler_pipeline_start, .Lfunc_end171-halide_profiler_pipeline_start
                                        // -- End function
	.section	.text.halide_profiler_stack_peak_update,"ax",@progbits
	.weak	halide_profiler_stack_peak_update // -- Begin function halide_profiler_stack_peak_update
	.p2align	4
	.type	halide_profiler_stack_peak_update,@function
halide_profiler_stack_peak_update:      // @halide_profiler_stack_peak_update
// %bb.0:                               // %entry
	{
		r17:16 = combine(r2,r1)
		p0 = cmp.eq(r1,#0)
		memd(r29+#-16) = r17:16
		allocframe(#8)
	}                                       // 8-byte Folded Spill
	{
		if (!p0) jump:nt .LBB172_2
	}
// %bb.1:                               // %if.then
	{
		r1 = add(pc,##.L.str.111@PCREL)
		call ##halide_print
	}
	{
		call ##abort
	}
.LBB172_2:                              // %do.end
	{
		r8 = memw(r16+#72)
	}
	{
		p0 = cmp.gt(r8,#0)
		if (!p0.new) r17:16 = memd(r29+#0)
		if (!p0.new) r31:30 = dealloc_return(r30):t:raw
	}                                       // 8-byte Folded Reload
.LBB172_3:
	{
		r3:2 = combine(#0,#0)
		jump .LBB172_4
		r1:0 = combine(#0,#0)
		r5:4 = combine(#0,#1)
	}
	.p2align	4
.LBB172_10:                             // %for.inc.loopexit
                                        //   in Loop: Header=BB172_4 Depth=1
	{
		r8 = memw(r16+#72)
	}
.LBB172_11:                             // %for.inc
                                        //   in Loop: Header=BB172_4 Depth=1
	{
		r1:0 = add(r1:0,r5:4)
		r7:6 = sxtw(r8)
	}
	{
		p0 = cmp.gt(r7:6,r1:0)
		if (!p0.new) jump:nt .LBB172_12
	}
.LBB172_4:                              // %for.body
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB172_6 Depth 2
                                        //       Child Loop BB172_7 Depth 3
	{
		r7:6 = memd(r17+r0<<#3)
	}
	{
		p0 = cmp.eq(r7:6,r3:2)
		if (p0.new) jump:nt .LBB172_11
	}
// %bb.5:                               // %if.then3
                                        //   in Loop: Header=BB172_4 Depth=1
	{
		r9 = memw(r16+#56)
	}
	{
		r9 += mpyi(r0,#72)
	}
	{
		r8 = add(r9,#32)
	}
	{
		jump .LBB172_6
		r13:12 = memd(r9+#32)
	}
	.p2align	4
.LBB172_9:                              // %cmpxchg.end
                                        //   in Loop: Header=BB172_6 Depth=2
	{
		r13:12 = combine(r15,r14)
		if (p0) jump:nt .LBB172_10
	}
.LBB172_6:                              // %while.cond.i
                                        //   Parent Loop BB172_4 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB172_7 Depth 3
	{
		p0 = cmp.gtu(r7:6,r13:12)
		if (!p0.new) jump:nt .LBB172_10
	}
	.p2align	4
.LBB172_7:                              // %cmpxchg.start
                                        //   Parent Loop BB172_4 Depth=1
                                        //     Parent Loop BB172_6 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	{
		r15:14 = memd_locked(r8)
	}
	{
		p0 = cmp.eq(r15:14,r13:12)
		if (!p0.new) jump:nt .LBB172_9
	}
// %bb.8:                               // %cmpxchg.trystore
                                        //   in Loop: Header=BB172_7 Depth=3
	{
		memd_locked(r8,p1) = r7:6
	}
	{
		if (!p1) jump:nt .LBB172_7
	}
	{
		jump .LBB172_9
	}
.LBB172_12:                             // %for.cond.cleanup
	{
		r17:16 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end172:
	.size	halide_profiler_stack_peak_update, .Lfunc_end172-halide_profiler_stack_peak_update
                                        // -- End function
	.section	.text.halide_profiler_memory_allocate,"ax",@progbits
	.weak	halide_profiler_memory_allocate // -- Begin function halide_profiler_memory_allocate
	.p2align	4
	.type	halide_profiler_memory_allocate,@function
halide_profiler_memory_allocate:        // @halide_profiler_memory_allocate
// %bb.0:                               // %entry
	{
		r7:6 = combine(#0,#0)
		memd(r29+#-16) = r17:16
		allocframe(#24)
	}                                       // 8-byte Folded Spill
	{
		p0 = cmp.eq(r5:4,r7:6)
	}
	{
		if (p0) jump:nt .LBB173_29
		memd(r29+#8) = r19:18
		memd(r29+#0) = r21:20
	}                                       // 8-byte Folded Spill
// %bb.1:                               // %if.end
	{
		r17:16 = combine(r5,r4)
		r19:18 = combine(r1,r2)
		r20 = r0
		p0 = cmp.eq(r1,#0)
	}
	{
		if (p0) jump:nt .LBB173_2
	}
// %bb.3:                               // %do.body4
	{
		p0 = cmp.gt(r18,#-1); if (!p0.new) jump:nt .LBB173_4
	}
.LBB173_5:                              // %do.body10
	{
		r0 = memw(r19+#72)
		if (cmp.gt(r0.new,r18)) jump:t .LBB173_7
	}
.LBB173_6:                              // %if.then12
	{
		r1 = add(pc,##.L.str.3.114@PCREL)
		r0 = r20
	}
	{
		call ##halide_print
	}
	{
		call ##abort
	}
.LBB173_7:                              // %do.end15
	{
		r1 = add(r19,#88)
		r0 = memw(r19+#56)
	}
	.p2align	4
.LBB173_8:                              // %atomicrmw.start
                                        // =>This Inner Loop Header: Depth=1
	{
		r2 = memw_locked(r1)
	}
	{
		r2 = add(r2,#1)
	}
	{
		memw_locked(r1,p0) = r2
	}
	{
		if (!p0) jump:nt .LBB173_8
	}
// %bb.9:                               // %atomicrmw.end
	{
		r1 = add(r19,#24)
	}
	.p2align	4
.LBB173_10:                             // %atomicrmw.start2
                                        // =>This Inner Loop Header: Depth=1
	{
		r3:2 = memd_locked(r1)
	}
	{
		r3:2 = add(r3:2,r17:16)
	}
	{
		memd_locked(r1,p0) = r3:2
	}
	{
		if (!p0) jump:nt .LBB173_10
	}
// %bb.11:                              // %atomicrmw.end1
	{
		r1 = add(r19,#8)
	}
	.p2align	4
.LBB173_12:                             // %atomicrmw.start8
                                        // =>This Inner Loop Header: Depth=1
	{
		r3:2 = memd_locked(r1)
	}
	{
		r3:2 = add(r3:2,r17:16)
	}
	{
		memd_locked(r1,p0) = r3:2
	}
	{
		if (!p0) jump:nt .LBB173_12
	}
// %bb.13:                              // %atomicrmw.end7
	{
		r1 = add(r19,#16)
		jump .LBB173_14
		r5:4 = memd(r19+#16)
	}
	.p2align	4
.LBB173_17:                             // %cmpxchg.end
                                        //   in Loop: Header=BB173_14 Depth=1
	{
		r5:4 = combine(r7,r6)
		if (p0) jump:nt .LBB173_18
	}
.LBB173_14:                             // %while.cond.i
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB173_15 Depth 2
	{
		p0 = cmp.gtu(r3:2,r5:4)
		if (!p0.new) jump:nt .LBB173_18
	}
	.p2align	4
.LBB173_15:                             // %cmpxchg.start
                                        //   Parent Loop BB173_14 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	{
		r7:6 = memd_locked(r1)
	}
	{
		p0 = cmp.eq(r7:6,r5:4)
		if (!p0.new) jump:nt .LBB173_17
	}
// %bb.16:                              // %cmpxchg.trystore
                                        //   in Loop: Header=BB173_15 Depth=2
	{
		memd_locked(r1,p1) = r3:2
	}
	{
		if (!p1) jump:nt .LBB173_15
	}
	{
		jump .LBB173_17
	}
.LBB173_18:                             // %_ZN12_GLOBAL__N_125sync_compare_max_and_swapIyEEvPT_S1_.exit
	{
		r0 += mpyi(r18,#72)
	}
	{
		r1 = add(r0,#60)
	}
	.p2align	4
.LBB173_19:                             // %atomicrmw.start17
                                        // =>This Inner Loop Header: Depth=1
	{
		r2 = memw_locked(r1)
	}
	{
		r2 = add(r2,#1)
	}
	{
		memw_locked(r1,p0) = r2
	}
	{
		if (!p0) jump:nt .LBB173_19
	}
// %bb.20:                              // %atomicrmw.end16
	{
		r1 = add(r0,#24)
	}
	.p2align	4
.LBB173_21:                             // %atomicrmw.start23
                                        // =>This Inner Loop Header: Depth=1
	{
		r3:2 = memd_locked(r1)
	}
	{
		r3:2 = add(r3:2,r17:16)
	}
	{
		memd_locked(r1,p0) = r3:2
	}
	{
		if (!p0) jump:nt .LBB173_21
	}
// %bb.22:                              // %atomicrmw.end22
	{
		r1 = add(r0,#8)
	}
	.p2align	4
.LBB173_23:                             // %atomicrmw.start29
                                        // =>This Inner Loop Header: Depth=1
	{
		r3:2 = memd_locked(r1)
	}
	{
		r3:2 = add(r3:2,r17:16)
	}
	{
		memd_locked(r1,p0) = r3:2
	}
	{
		if (!p0) jump:nt .LBB173_23
	}
// %bb.24:                              // %atomicrmw.end28
	{
		r1 = add(r0,#16)
		jump .LBB173_25
		r5:4 = memd(r0+#16)
	}
	.p2align	4
.LBB173_28:                             // %cmpxchg.end34
                                        //   in Loop: Header=BB173_25 Depth=1
	{
		r5:4 = combine(r7,r6)
		if (p0) jump:nt .LBB173_29
	}
.LBB173_25:                             // %while.cond.i43
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB173_26 Depth 2
	{
		p0 = cmp.gtu(r3:2,r5:4)
		if (!p0.new) jump:nt .LBB173_29
	}
	.p2align	4
.LBB173_26:                             // %cmpxchg.start41
                                        //   Parent Loop BB173_25 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	{
		r7:6 = memd_locked(r1)
	}
	{
		p0 = cmp.eq(r7:6,r5:4)
		if (!p0.new) jump:nt .LBB173_28
	}
// %bb.27:                              // %cmpxchg.trystore39
                                        //   in Loop: Header=BB173_26 Depth=2
	{
		memd_locked(r1,p1) = r3:2
	}
	{
		if (!p1) jump:nt .LBB173_26
	}
	{
		jump .LBB173_28
	}
.LBB173_29:                             // %return
	{
		r17:16 = memd(r29+#16)
		r19:18 = memd(r29+#8)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.LBB173_2:                              // %if.then2
	{
		r1 = add(pc,##.L.str.1.112@PCREL)
		r0 = r20
	}
	{
		call ##halide_print
	}
	{
		call ##abort
	}
	{
		p0 = cmp.gt(r18,#-1); if (p0.new) jump:t .LBB173_5
	}
.LBB173_4:                              // %if.then6
	{
		r1 = add(pc,##.L.str.2.113@PCREL)
		r0 = r20
	}
	{
		call ##halide_print
	}
	{
		call ##abort
	}
	{
		r0 = memw(r19+#72)
		if (!cmp.gt(r0.new,r18)) jump:t .LBB173_6
	}
	{
		jump .LBB173_7
	}
.Lfunc_end173:
	.size	halide_profiler_memory_allocate, .Lfunc_end173-halide_profiler_memory_allocate
                                        // -- End function
	.section	.text.halide_profiler_memory_free,"ax",@progbits
	.weak	halide_profiler_memory_free     // -- Begin function halide_profiler_memory_free
	.p2align	4
	.type	halide_profiler_memory_free,@function
halide_profiler_memory_free:            // @halide_profiler_memory_free
// %bb.0:                               // %entry
	{
		r7:6 = combine(#0,#0)
		memd(r29+#-16) = r17:16
		allocframe(#24)
	}                                       // 8-byte Folded Spill
	{
		p0 = cmp.eq(r5:4,r7:6)
	}
	{
		if (p0) jump:nt .LBB174_11
		memd(r29+#8) = r19:18
		memd(r29+#0) = r21:20
	}                                       // 8-byte Folded Spill
// %bb.1:                               // %if.end
	{
		r17:16 = combine(r5,r4)
		r19:18 = combine(r1,r2)
		r20 = r0
		p0 = cmp.eq(r1,#0)
	}
	{
		if (p0) jump:nt .LBB174_2
	}
// %bb.3:                               // %do.body4
	{
		p0 = cmp.gt(r18,#-1); if (!p0.new) jump:nt .LBB174_4
	}
.LBB174_5:                              // %do.body10
	{
		r0 = memw(r19+#72)
		if (cmp.gt(r0.new,r18)) jump:t .LBB174_7
	}
.LBB174_6:                              // %if.then12
	{
		r1 = add(pc,##.L.str.6.117@PCREL)
		r0 = r20
	}
	{
		call ##halide_print
	}
	{
		call ##abort
	}
.LBB174_7:                              // %do.end15
	{
		r1 = add(r19,#8)
		r0 = memw(r19+#56)
	}
	.p2align	4
.LBB174_8:                              // %atomicrmw.start
                                        // =>This Inner Loop Header: Depth=1
	{
		r3:2 = memd_locked(r1)
	}
	{
		r3:2 = sub(r3:2,r17:16)
	}
	{
		memd_locked(r1,p0) = r3:2
	}
	{
		if (!p0) jump:nt .LBB174_8
	}
// %bb.9:                               // %atomicrmw.end
	{
		r1 = +mpyi(r18,#72)
	}
	{
		r0 = add(r0,add(r1,#8))
	}
	.p2align	4
.LBB174_10:                             // %atomicrmw.start2
                                        // =>This Inner Loop Header: Depth=1
	{
		r3:2 = memd_locked(r0)
	}
	{
		r3:2 = sub(r3:2,r17:16)
	}
	{
		memd_locked(r0,p0) = r3:2
	}
	{
		if (!p0) jump:nt .LBB174_10
	}
.LBB174_11:                             // %return
	{
		r17:16 = memd(r29+#16)
		r19:18 = memd(r29+#8)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.LBB174_2:                              // %if.then2
	{
		r1 = add(pc,##.L.str.4.115@PCREL)
		r0 = r20
	}
	{
		call ##halide_print
	}
	{
		call ##abort
	}
	{
		p0 = cmp.gt(r18,#-1); if (p0.new) jump:t .LBB174_5
	}
.LBB174_4:                              // %if.then6
	{
		r1 = add(pc,##.L.str.5.116@PCREL)
		r0 = r20
	}
	{
		call ##halide_print
	}
	{
		call ##abort
	}
	{
		r0 = memw(r19+#72)
		if (!cmp.gt(r0.new,r18)) jump:t .LBB174_6
	}
	{
		jump .LBB174_7
	}
.Lfunc_end174:
	.size	halide_profiler_memory_free, .Lfunc_end174-halide_profiler_memory_free
                                        // -- End function
	.section	.text.halide_profiler_report,"ax",@progbits
	.weak	halide_profiler_report          // -- Begin function halide_profiler_report
	.p2align	4
	.type	halide_profiler_report,@function
halide_profiler_report:                 // @halide_profiler_report
// %bb.0:                               // %entry
	{
		r16 = r0
		memd(r29+#-16) = r17:16
		allocframe(#8)
	}                                       // 8-byte Folded Spill
	{
		call ##halide_profiler_get_state
	}
	{
		call ##halide_mutex_lock
		r17 = r0
	}
	{
		call ##halide_profiler_report_unlocked
		r1:0 = combine(r17,r16)
	}
	{
		r0 = r17
		r17:16 = memd(r29+#0)
		deallocframe
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_mutex_unlock
	}
.Lfunc_end175:
	.size	halide_profiler_report, .Lfunc_end175-halide_profiler_report
                                        // -- End function
	.section	.text.halide_profiler_reset,"ax",@progbits
	.weak	halide_profiler_reset           // -- Begin function halide_profiler_reset
	.p2align	4
	.type	halide_profiler_reset,@function
halide_profiler_reset:                  // @halide_profiler_reset
// %bb.0:                               // %entry
	{
		call ##halide_profiler_get_state
		memd(r29+#-16) = r17:16
		allocframe(#8)
	}                                       // 8-byte Folded Spill
	{
		call ##halide_mutex_lock
		r16 = r0
	}
	{
		call ##halide_profiler_reset_unlocked
		r0 = r16
	}
	{
		r0 = r16
		r17:16 = memd(r29+#0)
		deallocframe
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_mutex_unlock
	}
.Lfunc_end176:
	.size	halide_profiler_reset, .Lfunc_end176-halide_profiler_reset
                                        // -- End function
	.section	.text.halide_profiler_pipeline_end,"ax",@progbits
	.weak	halide_profiler_pipeline_end    // -- Begin function halide_profiler_pipeline_end
	.p2align	4
	.type	halide_profiler_pipeline_end,@function
halide_profiler_pipeline_end:           // @halide_profiler_pipeline_end
// %bb.0:                               // %entry
	{
		jumpr r31
		memw(r1+#16) = #-1
	}
.Lfunc_end177:
	.size	halide_profiler_pipeline_end, .Lfunc_end177-halide_profiler_pipeline_end
                                        // -- End function
	.section	.text.halide_msan_annotate_memory_is_initialized,"ax",@progbits
	.weak	halide_msan_annotate_memory_is_initialized // -- Begin function halide_msan_annotate_memory_is_initialized
	.p2align	4
	.type	halide_msan_annotate_memory_is_initialized,@function
halide_msan_annotate_memory_is_initialized: // @halide_msan_annotate_memory_is_initialized
// %bb.0:                               // %entry
	{
		r0 = #0
		jumpr r31
	}
.Lfunc_end178:
	.size	halide_msan_annotate_memory_is_initialized, .Lfunc_end178-halide_msan_annotate_memory_is_initialized
                                        // -- End function
	.section	.text.halide_msan_check_memory_is_initialized,"ax",@progbits
	.weak	halide_msan_check_memory_is_initialized // -- Begin function halide_msan_check_memory_is_initialized
	.p2align	4
	.type	halide_msan_check_memory_is_initialized,@function
halide_msan_check_memory_is_initialized: // @halide_msan_check_memory_is_initialized
// %bb.0:                               // %entry
	{
		r0 = #0
		jumpr r31
	}
.Lfunc_end179:
	.size	halide_msan_check_memory_is_initialized, .Lfunc_end179-halide_msan_check_memory_is_initialized
                                        // -- End function
	.section	.text.halide_msan_check_buffer_is_initialized,"ax",@progbits
	.weak	halide_msan_check_buffer_is_initialized // -- Begin function halide_msan_check_buffer_is_initialized
	.p2align	4
	.type	halide_msan_check_buffer_is_initialized,@function
halide_msan_check_buffer_is_initialized: // @halide_msan_check_buffer_is_initialized
// %bb.0:                               // %entry
	{
		r0 = #0
		jumpr r31
	}
.Lfunc_end180:
	.size	halide_msan_check_buffer_is_initialized, .Lfunc_end180-halide_msan_check_buffer_is_initialized
                                        // -- End function
	.section	.text.halide_msan_annotate_buffer_is_initialized,"ax",@progbits
	.weak	halide_msan_annotate_buffer_is_initialized // -- Begin function halide_msan_annotate_buffer_is_initialized
	.p2align	4
	.type	halide_msan_annotate_buffer_is_initialized,@function
halide_msan_annotate_buffer_is_initialized: // @halide_msan_annotate_buffer_is_initialized
// %bb.0:                               // %entry
	{
		r0 = #0
		jumpr r31
	}
.Lfunc_end181:
	.size	halide_msan_annotate_buffer_is_initialized, .Lfunc_end181-halide_msan_annotate_buffer_is_initialized
                                        // -- End function
	.section	.text.halide_msan_annotate_buffer_is_initialized_as_destructor,"ax",@progbits
	.weak	halide_msan_annotate_buffer_is_initialized_as_destructor // -- Begin function halide_msan_annotate_buffer_is_initialized_as_destructor
	.p2align	4
	.type	halide_msan_annotate_buffer_is_initialized_as_destructor,@function
halide_msan_annotate_buffer_is_initialized_as_destructor: // @halide_msan_annotate_buffer_is_initialized_as_destructor
// %bb.0:                               // %entry
	{
		jumpr r31
	}
.Lfunc_end182:
	.size	halide_msan_annotate_buffer_is_initialized_as_destructor, .Lfunc_end182-halide_msan_annotate_buffer_is_initialized_as_destructor
                                        // -- End function
	.section	.text.halide_qurt_hvx_lock,"ax",@progbits
	.weak	halide_qurt_hvx_lock            // -- Begin function halide_qurt_hvx_lock
	.p2align	4
	.type	halide_qurt_hvx_lock,@function
halide_qurt_hvx_lock:                   // @halide_qurt_hvx_lock
// %bb.0:                               // %entry
	{
		r16 = r0
		r0 = #1
		memd(r29+#-16) = r17:16
		allocframe(#24)
	}                                       // 8-byte Folded Spill
	{
		call ##qurt_hvx_lock
		memd(r29+#8) = r19:18
		memd(r29+#0) = r21:20
	}                                       // 8-byte Folded Spill
	{
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB183_1
	}
// %bb.2:                               // %if.then
	{
		call ##malloc
		r0 = #1024
		r1 = #0
	}
	{
		r18 = r0
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB183_3
	}
// %bb.4:                               // %if.else.i
	{
		r2 = add(pc,##.L.str.4.122@PCREL)
		r1 = add(r18,#1023)
		r0 = r18
	}
	{
		call ##halide_string_to_string
		r21 = #0
		memb(r18+#1023) = r21.new
	}
	{
		r19 = r21
		r1:0 = combine(r18,r16)
		r20 = r0
		r5:4 = combine(#0,#1)
	}
	{
		r3:2 = sub(r21:20,r19:18)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = add(r3:2,r5:4)
	}
	{
		r1 = r18 ; jump .LBB183_5
	}
.LBB183_1:
	{
		r0 = #0
		r17:16 = memd(r29+#16)
		r19:18 = memd(r29+#8)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.LBB183_3:                              // %if.then.i
	{
		r2 = add(pc,##.L.str.4.122@PCREL)
		r1:0 = combine(#0,#0)
	}
	{
		call ##halide_string_to_string
	}
	{
		r1 = add(pc,##.L.str.7.123@PCREL)
	}
.LBB183_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
		r0 = r16
	}
	{
		call ##free
		r0 = r18
	}
	{
		r0 = #-1
		r17:16 = memd(r29+#16)
		r19:18 = memd(r29+#8)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end183:
	.size	halide_qurt_hvx_lock, .Lfunc_end183-halide_qurt_hvx_lock
                                        // -- End function
	.section	.text.halide_qurt_hvx_unlock,"ax",@progbits
	.weak	halide_qurt_hvx_unlock          // -- Begin function halide_qurt_hvx_unlock
	.p2align	4
	.type	halide_qurt_hvx_unlock,@function
halide_qurt_hvx_unlock:                 // @halide_qurt_hvx_unlock
// %bb.0:                               // %entry
	{
		r16 = r0
		memd(r29+#-16) = r17:16
		allocframe(#24)
	}                                       // 8-byte Folded Spill
	{
		call ##qurt_hvx_unlock
		memd(r29+#8) = r19:18
		memd(r29+#0) = r21:20
	}                                       // 8-byte Folded Spill
	{
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB184_1
	}
// %bb.2:                               // %if.then
	{
		call ##malloc
		r0 = #1024
		r1 = #0
	}
	{
		r18 = r0
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB184_3
	}
// %bb.4:                               // %if.else.i
	{
		r2 = add(pc,##.L.str.6.124@PCREL)
		r1 = add(r18,#1023)
		r0 = r18
	}
	{
		call ##halide_string_to_string
		r21 = #0
		memb(r18+#1023) = r21.new
	}
	{
		r19 = r21
		r1:0 = combine(r18,r16)
		r20 = r0
		r5:4 = combine(#0,#1)
	}
	{
		r3:2 = sub(r21:20,r19:18)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = add(r3:2,r5:4)
	}
	{
		r1 = r18 ; jump .LBB184_5
	}
.LBB184_1:
	{
		r0 = #0
		r17:16 = memd(r29+#16)
		r19:18 = memd(r29+#8)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.LBB184_3:                              // %if.then.i
	{
		r2 = add(pc,##.L.str.6.124@PCREL)
		r1:0 = combine(#0,#0)
	}
	{
		call ##halide_string_to_string
	}
	{
		r1 = add(pc,##.L.str.7.123@PCREL)
	}
.LBB184_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
		r0 = r16
	}
	{
		call ##free
		r0 = r18
	}
	{
		r0 = #-1
		r17:16 = memd(r29+#16)
		r19:18 = memd(r29+#8)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end184:
	.size	halide_qurt_hvx_unlock, .Lfunc_end184-halide_qurt_hvx_unlock
                                        // -- End function
	.section	.text.halide_qurt_hvx_unlock_as_destructor,"ax",@progbits
	.weak	halide_qurt_hvx_unlock_as_destructor // -- Begin function halide_qurt_hvx_unlock_as_destructor
	.p2align	4
	.type	halide_qurt_hvx_unlock_as_destructor,@function
halide_qurt_hvx_unlock_as_destructor:   // @halide_qurt_hvx_unlock_as_destructor
// %bb.0:                               // %entry
	{
		jump ##halide_qurt_hvx_unlock
	}
.Lfunc_end185:
	.size	halide_qurt_hvx_unlock_as_destructor, .Lfunc_end185-halide_qurt_hvx_unlock_as_destructor
                                        // -- End function
	.section	.text.halide_default_can_use_target_features,"ax",@progbits
	.weak	halide_default_can_use_target_features // -- Begin function halide_default_can_use_target_features
	.p2align	4
	.type	halide_default_can_use_target_features,@function
halide_default_can_use_target_features: // @halide_default_can_use_target_features
// %bb.0:                               // %entry
	{
		r17:16 = combine(r0,r1)
		memd(r29+#-16) = r17:16
		allocframe(#48)
	}                                       // 8-byte Folded Spill
	{
		r19 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		memd(r29+#32) = r19:18
	}                                       // 8-byte Folded Spill
	{
		call ##halide_mutex_lock
		r0 = memw(r19+##_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE@GOT)
	}
	{
		r18 = add(r19,##_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE@GOT)
		r0 = memw(r19+##_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE@GOT)
	}
	{
		r0 = memb(r0+#0)
		if (cmp.eq(r0.new,#0)) jump:nt .LBB186_1
	}
// %bb.2:                               // %if.end
	{
		call ##halide_mutex_unlock
		r0 = memw(r19+##_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE@GOT)
	}
	{
		p0 = cmp.eq(r17,#2); if (p0.new) jump:t .LBB186_4
	}
.LBB186_3:                              // %if.then1
	{
		r1 = add(pc,##.L.str.125@PCREL)
		r0 = #0
	}
	{
		call ##halide_error
	}
.LBB186_4:                              // %if.end2
	{
		r3:2 = combine(#0,#0)
		r1:0 = memd(r16+#0)
		r4 = memw(r18+#0)
	}
	{
		r5:4 = memd(r4+#0)
	}
	{
		r1:0 = and(r5:4,r1:0)
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (p0.new) jump:nt .LBB186_6
	}
// %bb.5:                               // %if.then7
	{
		r4 = memw(r18+#0)
	}
	{
		r5:4 = memd(r4+#16)
	}
	{
		r5:4 = and(r5:4,r1:0)
	}
	{
		p0 = cmp.eq(r5:4,r1:0)
		r0 = #0
		if (!p0.new) r17:16 = memd(r29+#40)
		if (!p0.new) r19:18 = memd(r29+#32)
	}                                       // 8-byte Folded Reload
	{
		if (!p0) r31:30 = dealloc_return(r30):raw
	}
.LBB186_6:                              // %for.inc.critedge
	{
		r1:0 = memd(r16+#8)
		r4 = memw(r18+#0)
	}
	{
		r5:4 = memd(r4+#8)
	}
	{
		r1:0 = and(r5:4,r1:0)
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (p0.new) jump:nt .LBB186_8
	}
// %bb.7:                               // %if.then7.1
	{
		r2 = memw(r18+#0)
	}
	{
		r3:2 = memd(r2+#24)
	}
	{
		r3:2 = and(r3:2,r1:0)
	}
	{
		p0 = cmp.eq(r3:2,r1:0)
		r0 = #0
	}
	{
		if (p0) r0 = #1
		r17:16 = memd(r29+#40)
		r19:18 = memd(r29+#32)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB186_1:                              // %if.then
	{
		call ##_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv
		r0 = add(r29,#0)
	}
	{
		r3:2 = combine(#0,#32)
		r1 = add(r29,#0)
		r0 = memw(r18+#0)
	}
	{
		call ##memcpy
	}
	{
		r0 = memw(r19+##_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE@GOT)
	}
	{
		memb(r0+#0) = #1
	}
	{
		call ##halide_mutex_unlock
		r0 = memw(r19+##_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE@GOT)
	}
	{
		p0 = cmp.eq(r17,#2); if (!p0.new) jump:t .LBB186_3
	}
	{
		jump .LBB186_4
	}
.LBB186_8:                              // %for.inc.critedge.1
	{
		r0 = #1
		r17:16 = memd(r29+#40)
		r19:18 = memd(r29+#32)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end186:
	.size	halide_default_can_use_target_features, .Lfunc_end186-halide_default_can_use_target_features
                                        // -- End function
	.section	.text.halide_set_custom_can_use_target_features,"ax",@progbits
	.weak	halide_set_custom_can_use_target_features // -- Begin function halide_set_custom_can_use_target_features
	.p2align	4
	.type	halide_set_custom_can_use_target_features,@function
halide_set_custom_can_use_target_features: // @halide_set_custom_can_use_target_features
// %bb.0:                               // %entry
	{
		r1 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
	}
	{
		r2 = memw(r1+##_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE@GOT)
	}
	{
		r1 = memw(r2+#0)
		memw(r2+#0) = r0
	}
	{
		r0 = r1
		jumpr r31
	}
.Lfunc_end187:
	.size	halide_set_custom_can_use_target_features, .Lfunc_end187-halide_set_custom_can_use_target_features
                                        // -- End function
	.section	.text.halide_can_use_target_features,"ax",@progbits
	.weak	halide_can_use_target_features  // -- Begin function halide_can_use_target_features
	.p2align	4
	.type	halide_can_use_target_features,@function
halide_can_use_target_features:         // @halide_can_use_target_features
// %bb.0:                               // %entry
	{
		r2 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		allocframe(r29,#0):raw
	}
	{
		r2 = memw(r2+##_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE@GOT)
	}
	{
		r2 = memw(r2+#0)
	}
	{
		callr r2
	}
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end188:
	.size	halide_can_use_target_features, .Lfunc_end188-halide_can_use_target_features
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv // -- Begin function _ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv
	.p2align	4
	.type	_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv,@function
_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv: // @_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv
// %bb.0:                               // %entry
	{
		r3:2 = combine(#0,#0)
	}
	{
		memd(r0+#0) = r3:2
		memd(r0+#16) = r3:2
	}
	{
		jumpr r31
		memd(r0+#8) = r3:2
		memd(r0+#24) = r3:2
	}
.Lfunc_end189:
	.size	_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv, .Lfunc_end189-_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv
                                        // -- End function
	.section	.text.halide_use_jit_module,"ax",@progbits
	.weak	halide_use_jit_module           // -- Begin function halide_use_jit_module
	.p2align	4
	.type	halide_use_jit_module,@function
halide_use_jit_module:                  // @halide_use_jit_module
// %bb.0:                               // %entry
	{
		jumpr r31
	}
.Lfunc_end190:
	.size	halide_use_jit_module, .Lfunc_end190-halide_use_jit_module
                                        // -- End function
	.section	.text.halide_release_jit_module,"ax",@progbits
	.weak	halide_release_jit_module       // -- Begin function halide_release_jit_module
	.p2align	4
	.type	halide_release_jit_module,@function
halide_release_jit_module:              // @halide_release_jit_module
// %bb.0:                               // %entry
	{
		jumpr r31
	}
.Lfunc_end191:
	.size	halide_release_jit_module, .Lfunc_end191-halide_release_jit_module
                                        // -- End function
	.section	.text.matmul,"ax",@progbits
	.globl	matmul                          // -- Begin function matmul
	.p2align	4
	.type	matmul,@function
matmul:                                 // @matmul
// %bb.0:                               // %entry
	{
		p0 = cmp.eq(r2,#0)
		memd(r29+#-16) = r17:16
		allocframe(r29,#296):raw
	}                                       // 8-byte Folded Spill
	{
		memd(r29+#280) = r19:18
		memd(r29+#272) = r21:20
	}                                       // 8-byte Folded Spill
	{
		memd(r29+#264) = r23:22
		memd(r29+#256) = r25:24
	}                                       // 8-byte Folded Spill
	{
		if (p0) jump:nt .LBB192_1
		memd(r29+#248) = r27:26
	}                                       // 8-byte Folded Spill
// %bb.4:                               // %"assert succeeded"
	{
		p0 = cmp.eq(r1,#0); if (p0.new) jump:nt .LBB192_3
	}
// %bb.5:                               // %"assert succeeded2"
	{
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB192_6
	}
// %bb.7:                               // %"assert succeeded4"
	{
		r19 = r2
		r22 = #128
		r23 = memuh(r1+#24)
		r6 = memw(r0+#32)
	}
	{
		r24 = memuh(r1+#26)
		r25 = memuh(r19+#24)
	}
	{
		r2 = memw(r1+#28)
		memw(r29+#48) = r2.new
	}                                       // 4-byte Folded Spill
	{
		r13 = memuh(r19+#26)
		r4 = memw(r1+#32)
	}
	{
		r3 = memw(r6+#16)
		memw(r29+#80) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r2 = memw(r19+#28)
		memw(r29+#44) = r2.new
	}                                       // 4-byte Folded Spill
	{
		r2 = memw(r6+#24)
		memw(r29+#60) = r2.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memw(r4+#0)
		memw(r29+#84) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r2 = memw(r4+#4)
		r7 = memw(r19+#32)
	}
	{
		r2 = memw(r4+#8)
		memd(r29+#64) = r3:2
	}                                       // 8-byte Folded Spill
	{
		r10 = memw(r0+#12)
		memw(r29+#40) = r2
	}                                       // 4-byte Folded Spill
	{
		r20 = memuh(r0+#24)
		r2 = memw(r4+#24)
	}
	{
		p0 = cmp.eq(r10,#0)
		r21 = memuh(r0+#26)
		memw(r29+#56) = r2
	}                                       // 4-byte Folded Spill
	{
		r3 = memw(r4+#16)
		memw(r29+#76) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r26 = memw(r7+#0)
		r2 = memw(r7+#8)
	}
	{
		r11 = memw(r1+#12)
		memw(r29+#36) = r2
	}                                       // 4-byte Folded Spill
	{
		r16 = memw(r6+#0)
		r5 = memw(r7+#16)
	}
	{
		r3 = memw(r4+#20)
		r2 = memw(r6+#4)
	}
	{
		r18 = memw(r0+#28)
		memd(r29+#88) = r3:2
	}                                       // 8-byte Folded Spill
	{
		r27 = memw(r19+#12)
		r15 = memw(r6+#8)
	}
	{
		r28 = memw(r6+#20)
		r4 = memw(r7+#20)
	}
	{
		r7 = r11
		if (!p0) jump:nt .LBB192_9
		r17 = memw(r7+#24)
		r14 = memw(r7+#4)
	}
// %bb.8:                               // %_halide_buffer_is_bounds_query.exit
	{
		r12 = r14
		r2 = r15
		r9:8 = combine(#0,#0)
		r15:14 = memd(r0+#0)
	}
	{
		r7 = r11
	}
	{
		p0 = cmp.eq(r15:14,r9:8)
		r15:14 = combine(r2,r12)
		if (p0.new) jump:nt .LBB192_66
	}
.LBB192_9:                              // %after_bb
	{
		p0 = cmp.eq(r7,#0); if (!p0.new) jump:t .LBB192_11
	}
.LBB192_10:                             // %_halide_buffer_is_bounds_query.exit121
	{
		r7:6 = combine(#0,#0)
		r9:8 = memd(r1+#0)
	}
	{
		p0 = cmp.eq(r9:8,r7:6)
		if (!p0.new) jump:t .LBB192_11
	}
// %bb.67:                              // %_halide_buffer_init.exit149
	{
		r8 = #144
		r12 = r14
		r2 = r15
		r9 = memw(r1+#32)
	}
	{
		r14 = ##69633
		r15 = #2
		memd(r1+#0) = r7:6
	}
	{
		memd(r1+#8) = r7:6
		memd(r1+#24) = r15:14
	}
	{
		r15:14 = combine(r2,r12)
		memw(r9+#12) = #0
		memw(r9+#8) = #1
	}
	{
		memw(r9+#4) = r8
		memw(r9+#0) = #0
	}
	{
		r9 = memw(r1+#32)
		memw(r29+#136) = r8
	}
	{
		memw(r29+#132) = #0
		memw(r29+#140) = #1
	}
	{
		memw(r29+#144) = #0
		memw(r29+#148) = #0
	}
	{
		memw(r29+#152) = r22
		memw(r29+#160) = #0
	}
	{
		memw(r29+#156) = r8
		memw(r9+#28) = #0
	}
	{
		memw(r9+#20) = r22
		memw(r9+#16) = #0
	}
	{
		jump .LBB192_11
		memw(r9+#24) = r8
		memd(r1+#16) = r7:6
	}
.LBB192_66:                             // %_halide_buffer_init.exit
	{
		r14 = ##69633
		r15 = #2
		memd(r0+#0) = r9:8
	}
	{
		memd(r0+#8) = r9:8
		memd(r0+#24) = r15:14
	}
	{
		r15:14 = combine(r2,r12)
		memw(r6+#12) = #0
		memw(r6+#8) = #1
	}
	{
		memw(r6+#4) = r22
		memw(r6+#0) = #0
	}
	{
		r6 = memw(r0+#32)
		memw(r29+#100) = #0
	}
	{
		memw(r29+#104) = r22
		memw(r29+#108) = #1
	}
	{
		memw(r29+#112) = #0
		memw(r6+#28) = #0
	}
	{
		memw(r6+#24) = r22
		memw(r6+#20) = r22
	}
	{
		memw(r6+#16) = #0
		memw(r29+#116) = #0
	}
	{
		memw(r29+#120) = r22
		memw(r29+#124) = r22
	}
	{
		memw(r29+#128) = #0
		memd(r0+#16) = r9:8
	}
	{
		r7 = memw(r1+#12)
		if (cmp.eq(r7.new,#0)) jump:nt .LBB192_10
	}
.LBB192_11:                             // %after_bb5
	{
		p0 = and(p0,!p0)
	}
	{
		p1 = or(p0,p0)
		r6 = memw(r19+#12)
		if (!cmp.eq(r6.new,#0)) jump:t .LBB192_15
	}
// %bb.12:                              // %_halide_buffer_is_bounds_query.exit129
	{
		r7:6 = combine(#0,#0)
		r9:8 = memd(r19+#0)
	}
	{
		p1 = cmp.eq(r9:8,r7:6)
		if (p1.new) jump:nt .LBB192_13
	}
.LBB192_14:                             // %land.rhs.i154
	{
		r9:8 = memd(r19+#0)
	}
	{
		p1 = cmp.eq(r9:8,r7:6)
		jump .LBB192_15
	}
.LBB192_13:                             // %after_bb8
	{
		r12 = r14
		r2 = r15
		r8 = memw(r19+#32)
	}
	{
		r14 = ##69633
		r15 = #2
		memd(r19+#8) = r7:6
	}
	{
		p1 = or(p0,p0)
		memd(r19+#0) = r7:6
		memd(r19+#24) = r15:14
	}
	{
		r15:14 = combine(r2,r12)
		memw(r8+#12) = #0
		memw(r8+#8) = #1
	}
	{
		memw(r8+#4) = r22
		memw(r8+#0) = #0
	}
	{
		r8 = memw(r19+#32)
		memw(r29+#164) = #0
	}
	{
		memw(r29+#168) = r22
		memw(r29+#172) = #1
	}
	{
		memw(r29+#176) = #0
		memw(r8+#28) = #0
	}
	{
		memw(r8+#24) = r22
		memw(r8+#20) = r22
	}
	{
		memw(r8+#16) = #0
	}
	{
		r8 = memw(r19+#12)
		memw(r29+#180) = #0
	}
	{
		memw(r29+#184) = r22
		memw(r29+#188) = r22
	}
	{
		p2 = cmp.eq(r8,#0)
		if (p2.new) jump:nt .LBB192_14
		memw(r29+#192) = #0
		memd(r19+#16) = r7:6
	}
.LBB192_15:                             // %_halide_buffer_is_bounds_query.exit155
	{
		p2 = or(p0,p0)
		r9:8 = memd(r29+#88)
	}                                       // 8-byte Folded Reload
	{
		r6 = memw(r0+#12)
		if (cmp.eq(r6.new,#0)) jump:nt .LBB192_16
	}
// %bb.17:                              // %_halide_buffer_is_bounds_query.exit161
	{
		r0 = memw(r1+#12)
		if (cmp.eq(r0.new,#0)) jump:nt .LBB192_18
	}
.LBB192_19:                             // %_halide_buffer_is_bounds_query.exit167
	{
		p0 = or(p1,or(p2,p0))
		r0 = #0
		if (!p0.new) jump:t .LBB192_20
	}
	{
		jump .LBB192_65
	}
.LBB192_16:                             // %land.rhs.i160
	{
		r9:8 = combine(#0,#0)
		r7:6 = memd(r0+#0)
	}
	{
		p2 = cmp.eq(r7:6,r9:8)
		r9:8 = memd(r29+#88)
	}                                       // 8-byte Folded Reload
	{
		r0 = memw(r1+#12)
		if (!cmp.eq(r0.new,#0)) jump:t .LBB192_19
	}
.LBB192_18:                             // %land.rhs.i166
	{
		r7:6 = combine(#0,#0)
		r1:0 = memd(r1+#0)
	}
	{
		p0 = cmp.eq(r1:0,r7:6)
	}
	{
		p0 = or(p1,or(p2,p0))
		r0 = #0
		if (p0.new) jump:t .LBB192_65
	}
.LBB192_20:                             // %then_bb12
	{
		r2 = combine(r13.l,r25.l)
		r25 = #0
		p0 = cmp.eq(r18,#2)
		r9 = combine(r21.l,r20.l)
	}
	{
		r21 = combine(r24.l,r23.l)
		r24 = ##69633
		r0 = r8
	}
	{
		r7 = mux(p0,r25,#2)
		r12 = r14
		r1 = add(r8,r16)
		p0 = cmp.eq(r9,r24)
	}
	{
		r14 = setbit(r7,#0)
		r11 = r16
		r16 = memw(r29+#80)
		memw(r29+#28) = r11
	}                                       // 4-byte Folded Reload
	{
		r0 = and(#128,lsr(r0,#24))
		if (!p0) r7 = add(r14,#0)
		p0 = cmp.gt(r1,#127)
		r23:22 = memd(r29+#64)
	}                                       // 8-byte Folded Reload
	{
		r19:18 = combine(r15,r22)
		r6 = #64
		r13 = add(r28,r16)
		memw(r29+#8) = r18
	}                                       // 4-byte Folded Spill
	{
		r7 = or(r7,r0)
		r14 = mux(p0,r25,r6)
		p1 = cmp.gt(r11,#0)
		memw(r29+#20) = r11
	}                                       // 4-byte Folded Spill
	{
		r11 = setbit(r7,#18)
		p0 = cmp.gt(r13,#127)
		p2 = cmp.eq(r19,#1)
		if (p1) r14 = add(r6,#0)
	}
	{
		if (p2) r11 = add(r7,#0)
		r20 = r8
		r8 = r28
		memw(r29+#12) = r9
	}                                       // 4-byte Folded Spill
	{
		r9 = #256
		p1 = cmp.gt(r16,#0)
	}
	{
		r8 = and(##512,lsr(r8,#22))
		r6 = mux(p0,r25,r9)
		r7 = or(r11,r14)
	}
	{
		if (p1) r6 = add(r9,#0)
		r7 = or(r7,r8)
		r27 = memw(r29+#84)
		memw(r29+#24) = r27
	}                                       // 4-byte Folded Reload
	{
		r6 = or(r7,r6)
		r10 = r18
		r7 = memw(r29+#48)
		memw(r29+#32) = r10
	}                                       // 4-byte Folded Reload
	{
		r10 = and(##2048,lsr(r10,#20))
		r22 = add(r22,r27)
		memw(r29+#16) = r17
	}                                       // 4-byte Folded Spill
	{
		r7 = setbit(r6,#3)
		p1 = cmp.gt(r22,#143)
		p0 = cmp.eq(r7,#2)
		r17 = memw(r29+#76)
	}                                       // 4-byte Folded Reload
	{
		r15 = #1024
		if (p0) r7 = add(r6,#0)
		p0 = cmp.eq(r21,r24)
		r23 = add(r3,r17)
	}
	{
		r6 = setbit(r7,#2)
		r8 = mux(p1,r25,r15)
		p1 = cmp.gt(r23,#127)
		r16 = r3
	}
	{
		r9 = #4096
		if (!p0) r7 = add(r6,#0)
		p0 = cmp.gt(r27,#0)
	}
	{
		r16 = and(##8192,lsr(r16,#18))
		r6 = or(r7,r10)
		r7 = memw(r29+#40)
	}                                       // 4-byte Folded Reload
	{
		if (p0) r8 = add(r15,#0)
		p0 = cmp.gt(r17,#0)
		r14 = mux(p1,r25,r9)
		r10 = r12
	}
	{
		r7 = setbit(r6,#19)
		r11 = add(r12,r26)
		r27 = r26
		p2 = cmp.eq(r7,#1)
	}
	{
		r10 = and(##32768,lsr(r10,#16))
		if (p0) r14 = add(r9,#0)
		if (p2) r7 = add(r6,#0)
	}
	{
		p1 = cmp.gt(r11,#127)
		r6 = or(r7,r8)
		r8 = #16384
		r7 = memw(r29+#44)
	}                                       // 4-byte Folded Reload
	{
		r6 = or(r6,r16)
		r9 = mux(p1,r25,r8)
	}
	{
		r6 = or(r6,r14)
		p0 = cmp.eq(r7,#2)
	}
	{
		r7 = setbit(r6,#5)
	}
	{
		if (p0) r7 = add(r6,#0)
		p0 = cmp.eq(r2,r24)
	}
	{
		r6 = setbit(r7,#4)
	}
	{
		if (!p0) r7 = add(r6,#0)
		p0 = cmp.gt(r26,#0)
		r26 = add(r4,r5)
	}
	{
		r6 = or(r7,r10)
		p1 = cmp.gt(r26,#127)
		if (p0) r9 = add(r8,#0)
		r7 = memw(r29+#36)
	}                                       // 4-byte Folded Reload
	{
		if (p1) r8 = add(r25,#0)
		r25 = r4
		p0 = cmp.gt(r5,#0)
	}
	{
		r25 = and(##131072,lsr(r25,#14))
		r7 = setbit(r6,#20)
		p2 = cmp.eq(r7,#1)
	}
	{
		if (p2) r7 = add(r6,#0)
		r6 = add(r24,#-4097)
	}
	{
		if (!p1) r8 = add(r6,#0)
		r7 = or(r7,r9)
	}
	{
		if (p0) r8 = add(r6,#0)
		r6 = or(r7,r25)
		r7 = ##-2147483648
	}
	{
		r6 = or(r6,r8)
	}
	{
		r8 = ct0(r7:6)
		if (!cmp.gtu(r8.new,#20)) jump:nt .LBB192_21
	}
// %bb.22:                              // %no_errors_bb
	{
		r21:20 = mpy(r28,r20)
		r0 = extractu(r0,#1,#7)
		r13 = memw(r29+#60)
	}                                       // 4-byte Folded Reload
	{
		r14 = ##2147483647
		r15 = #0
		memd(r29+#48) = r21:20
	}                                       // 8-byte Folded Spill
	{
		r23:22 = mpy(r13,r28)
		r2 = setbit(r0,#2)
		r9:8 = combine(#0,#0)
	}
	{
		r21:20 = abs(r23:22)
		p2 = cmp.gt(r21:20,r15:14)
		p1 = cmp.gt(r11,#128)
		r28 = #1
	}
	{
		r1 = extractu(r10,#7,#9)
		r23:22 = lsr(r21:20,#31)
		if (!p2) r2 = add(r0,#0)
		r10 = memw(r29+#56)
	}                                       // 4-byte Folded Reload
	{
		r0 = setbit(r2,#1)
		p2 = cmp.eq(r23:22,r9:8)
		p0 = cmp.gt(r26,#128)
		memw(r29+#64) = r27
	}                                       // 4-byte Folded Spill
	{
		r23:22 = mpy(r3,r18)
		r19 = asr(r18,#31)
		if (!p2) r2 = add(r0,#0)
	}
	{
		r25:24 = mpy(r10,r3)
		r2 = insert(r19,#1,#3)
	}
	{
		r25:24 = abs(r25:24)
		p2 = cmp.gt(r23:22,r15:14)
	}
	{
		r0 = setbit(r2,#5)
	}
	{
		r17:16 = mpy(r4,r12)
		r3:2 = lsr(r25:24,#31)
		if (!p2) r0 = add(r2,#0)
	}
	{
		p2 = cmp.eq(r3:2,r9:8)
		r2 = setbit(r0,#4)
	}
	{
		r2 = lsr(r27,#31)
		if (!p2) r0 = add(r2,#0)
		r27 = memw(r29+#16)
	}                                       // 4-byte Folded Reload
	{
		r1 = lsr(r5,#31)
		p1 = cmp.gt(r17:16,r15:14)
		r0 = or(r0,r1)
		if (p1) r2 = add(r28,#0)
	}
	{
		r0 |= asl(r2,#10)
		r3:2 = mpy(r27,r4)
		if (p0) r1 = add(r28,#0)
	}
	{
		r3:2 = abs(r3:2)
		r4 = setbit(r0,#8)
	}
	{
		r15:14 = lsr(r3:2,#31)
		if (!p1) r4 = add(r0,#0)
	}
	{
		r4 = insert(r1,#1,#9)
		p0 = cmp.eq(r15:14,r9:8)
	}
	{
		r0 = setbit(r4,#7)
	}
	{
		r6 = mux(p0,r4,r0)
	}
	{
		r0 = ct0(r7:6)
		if (!cmp.gtu(r0.new,#10)) jump:nt .LBB192_23
	}
// %bb.64:                              // %"for out.s0.__outermost"
	{
		r1 = add(pc,##matmul.par_for.out.s0.x.x.xy@PCREL)
		r0 = memw(r29+#20)
		memw(r29+#196) = r0.new
	}                                       // 4-byte Folded Reload
	{
		r4 = add(r29,#196)
		r0 = memw(r29+#80)
		memw(r29+#200) = r0.new
	}                                       // 4-byte Folded Reload
	{
		r0 = #0
		r3 = memw(r29+#84)
		memw(r29+#208) = r3.new
	}                                       // 4-byte Folded Reload
	{
		r3 = memw(r29+#76)
		memw(r29+#212) = r3.new
	}                                       // 4-byte Folded Reload
	{
		r3:2 = combine(#9,#0)
		r7 = memw(r29+#28)
		r5 = memw(r29+#32)
	}                                       // 4-byte Folded Reload
	{
		r6 = memw(r29+#24)
		memw(r29+#204) = r13
	}                                       // 4-byte Folded Reload
	{
		memw(r29+#216) = r10
		memw(r29+#220) = r27
	}
	{
		memw(r29+#224) = r5
		memw(r29+#228) = r7
	}
	{
		call ##halide_do_par_for
		memw(r29+#232) = r6
	}
.LBB192_65:                             // %common.ret
	{
		r17:16 = memd(r29+#288)
		r19:18 = memd(r29+#280)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#272)
		r23:22 = memd(r29+#264)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#256)
		r27:26 = memd(r29+#248)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB192_1:                              // %"assert failed"
	{
		r1 = add(pc,##.Lstr@PCREL)
		jump .LBB192_2
	}
.LBB192_3:                              // %"assert failed1"
	{
		r1 = add(pc,##.Lstr.132@PCREL)
		jump .LBB192_2
	}
.LBB192_6:                              // %"assert failed3"
	{
		r1 = add(pc,##.Lstr.133@PCREL)
	}
.LBB192_2:                              // %"assert failed"
	{
		r0 = #0
		r17:16 = memd(r29+#288)
		r19:18 = memd(r29+#280)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#272)
		r23:22 = memd(r29+#264)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#256)
		r27:26 = memd(r29+#248)
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_error_buffer_argument_is_null
		r31:30 = deallocframe(r30):raw
	}
.LBB192_21:                             // %then_bb12
	{
		r0 = add(pc,##.LJTI192_0@PCREL)
		r15 = memw(r29+#12)
		r9 = memw(r29+#8)
	}                                       // 4-byte Folded Reload
	{
		r6 = memw(r0+r8<<#2)
	}
	{
		r0 = add(r6,r0)
	}
	{
		jumpr r0
	}
.LBB192_24:                             // %assert_failed
	{
		r1 = add(pc,##.Lstr.134@PCREL)
		r0 = #0
		r2 = r15
	}
	{
		jump .LBB192_30
	}
.LBB192_23:                             // %no_errors_bb
	{
		r1 = add(pc,##.LJTI192_1@PCREL)
		r13 = r5
		r15:14 = memd(r29+#48)
	}                                       // 8-byte Folded Reload
	{
		r5 = memw(r29+#64)
	}                                       // 4-byte Folded Reload
	{
		r0 = memw(r1+r0<<#2)
	}
	{
		r0 = add(r0,r1)
	}
	{
		jumpr r0
	}
.LBB192_50:                             // %assert_failed35
	{
		r1 = add(pc,##.Lstr.133@PCREL)
		r3:2 = memd(r29+#88)
	}                                       // 8-byte Folded Reload
	{
		r3 = asr(r2,#31)
		jump .LBB192_59
	}
.LBB192_51:                             // %assert_failed36
	{
		r1 = add(pc,##.Lstr.133@PCREL)
		r4 = ##2147483647
	}
	{
		r5 = #0 ; jump .LBB192_60
		r0 = #0
		r3:2 = combine(r21,r20)
	}
.LBB192_52:                             // %assert_failed37
	{
		r1 = add(pc,##.Lstr.133@PCREL)
		r4 = ##2147483647
	}
	{
		r5 = #0 ; jump .LBB192_53
		r0 = #0
		r3:2 = combine(r15,r14)
	}
.LBB192_54:                             // %assert_failed38
	{
		r1 = add(pc,##.Lstr.132@PCREL)
		r4 = ##2147483647
	}
	{
		r5 = #0 ; jump .LBB192_60
		r0 = #0
		r3:2 = combine(r19,r18)
	}
.LBB192_55:                             // %assert_failed39
	{
		r1 = add(pc,##.Lstr.132@PCREL)
		r4 = ##2147483647
	}
	{
		r5 = #0 ; jump .LBB192_60
		r0 = #0
		r3:2 = combine(r25,r24)
	}
.LBB192_56:                             // %assert_failed40
	{
		r1 = add(pc,##.Lstr.132@PCREL)
		r4 = ##2147483647
	}
	{
		r5 = #0 ; jump .LBB192_53
		r0 = #0
		r3:2 = combine(r23,r22)
	}
.LBB192_57:                             // %assert_failed41
	{
		r3 = asr(r12,#31)
		r2 = r12
	}
.LBB192_58:                             // %assert_failed42
	{
		r1 = add(pc,##.Lstr@PCREL)
	}
.LBB192_59:                             // %assert_failed42
	{
		r5 = #0
		r4 = ##2147483647
		r0 = #0
	}
.LBB192_60:                             // %assert_failed42
	{
		r17:16 = memd(r29+#288)
		r19:18 = memd(r29+#280)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#272)
		r23:22 = memd(r29+#264)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#256)
		r27:26 = memd(r29+#248)
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_error_buffer_allocation_too_large
		r31:30 = deallocframe(r30):raw
	}
.LBB192_61:                             // %assert_failed43
	{
		r1 = add(pc,##.Lstr@PCREL)
		r4 = ##2147483647
	}
	{
		r3:2 = combine(r17,r16)
		r5 = #0
		r0 = #0
	}
.LBB192_53:                             // %assert_failed37
	{
		r17:16 = memd(r29+#288)
		r19:18 = memd(r29+#280)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#272)
		r23:22 = memd(r29+#264)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#256)
		r27:26 = memd(r29+#248)
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_error_buffer_extents_too_large
		r31:30 = deallocframe(r30):raw
	}
.LBB192_62:                             // %assert_failed44
	{
		r1 = add(pc,##.Lstr.141@PCREL)
		r3 = add(r26,#-1)
		memw(r29+#0) = r3.new
	}
	{
		r2 = add(pc,##.Lstr@PCREL)
		r0 = #0
		r3 = #0
	}
	{
		call ##halide_error_explicit_bounds_too_small
		r5:4 = combine(r13,#127)
	}
	{
		jump .LBB192_65
	}
.LBB192_63:                             // %assert_failed45
	{
		r1 = add(pc,##.L.str.19@PCREL)
		r3 = add(r11,#-1)
		memw(r29+#0) = r3.new
	}
	{
		r2 = add(pc,##.Lstr@PCREL)
		r0 = #0
		r3 = #0
	}
	{
		call ##halide_error_explicit_bounds_too_small
		r4 = #127
	}
	{
		jump .LBB192_65
	}
.LBB192_25:                             // %assert_failed14
	{
		r1 = add(pc,##.Lstr.134@PCREL)
		r0 = #0
		r2 = r9
	}
	{
		jump .LBB192_26
	}
.LBB192_27:                             // %assert_failed15
	{
		r1 = add(pc,##.Lstr.135@PCREL)
		r0 = #0
		r2 = r21
	}
	{
		jump .LBB192_30
	}
.LBB192_28:                             // %assert_failed16
	{
		r1 = add(pc,##.Lstr.135@PCREL)
		r0 = #0
		r2 = memw(r29+#48)
	}                                       // 4-byte Folded Reload
	{
		jump .LBB192_26
	}
.LBB192_29:                             // %assert_failed17
	{
		r1 = add(pc,##.Lstr.136@PCREL)
		r0 = #0
	}
.LBB192_30:                             // %assert_failed17
	{
		r3 = ##69633
		r17:16 = memd(r29+#288)
		r19:18 = memd(r29+#280)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#272)
		r23:22 = memd(r29+#264)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#256)
		r27:26 = memd(r29+#248)
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_error_bad_type
		r31:30 = deallocframe(r30):raw
	}
.LBB192_31:                             // %assert_failed18
	{
		r1 = add(pc,##.Lstr.136@PCREL)
		r0 = #0
		r2 = memw(r29+#44)
	}                                       // 4-byte Folded Reload
.LBB192_26:                             // %assert_failed14
	{
		r3 = #2
		r17:16 = memd(r29+#288)
		r19:18 = memd(r29+#280)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#272)
		r23:22 = memd(r29+#264)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#256)
		r27:26 = memd(r29+#248)
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_error_bad_dimensions
		r31:30 = deallocframe(r30):raw
	}
.LBB192_32:                             // %assert_failed19
	{
		r1 = add(pc,##.Lstr.134@PCREL)
		r0 = add(r1,#-1)
		memw(r29+#0) = r0.new
	}
	{
		r0 = #0
		r4 = #127
		r3:2 = combine(#0,#0)
		r5 = memw(r29+#20)
	}                                       // 4-byte Folded Reload
	{
		call ##halide_error_access_out_of_bounds
	}
	{
		jump .LBB192_65
	}
.LBB192_33:                             // %assert_failed20
	{
		r1 = add(pc,##.Lstr.134@PCREL)
		r0 = #0
		r2 = #0
	}
	{
		jump .LBB192_44
		r5:4 = memd(r29+#88)
	}                                       // 8-byte Folded Reload
.LBB192_34:                             // %assert_failed21
	{
		r1 = add(pc,##.Lstr.134@PCREL)
		r0 = add(r13,#-1)
		memw(r29+#0) = r0.new
	}
	{
		r0 = #0
		r4 = #127
		r3:2 = combine(#0,#1)
		r5 = memw(r29+#80)
	}                                       // 4-byte Folded Reload
	{
		call ##halide_error_access_out_of_bounds
	}
	{
		jump .LBB192_65
	}
.LBB192_35:                             // %assert_failed22
	{
		r1 = add(pc,##.Lstr.134@PCREL)
		r0 = #0
		r3:2 = combine(r28,#1)
	}
	{
		jump .LBB192_45
	}
.LBB192_36:                             // %assert_failed23
	{
		r1 = add(pc,##.Lstr.135@PCREL)
		r0 = add(r22,#-1)
		memw(r29+#0) = r0.new
	}
	{
		r0 = #0
		r4 = #143
		r3:2 = combine(#0,#0)
		r5 = memw(r29+#84)
	}                                       // 4-byte Folded Reload
	{
		call ##halide_error_access_out_of_bounds
	}
	{
		jump .LBB192_65
	}
.LBB192_37:                             // %assert_failed24
	{
		r1 = add(pc,##.Lstr.135@PCREL)
		r0 = #0
		r2 = #0
	}
	{
		jump .LBB192_44
		r5:4 = memd(r29+#64)
	}                                       // 8-byte Folded Reload
.LBB192_38:                             // %assert_failed25
	{
		r1 = add(pc,##.Lstr.135@PCREL)
		r0 = add(r23,#-1)
		memw(r29+#0) = r0.new
	}
	{
		r0 = #0
		r4 = #127
		r3:2 = combine(#0,#1)
		r5 = memw(r29+#76)
	}                                       // 4-byte Folded Reload
	{
		call ##halide_error_access_out_of_bounds
	}
	{
		jump .LBB192_65
	}
.LBB192_39:                             // %assert_failed26
	{
		r1 = add(pc,##.Lstr.135@PCREL)
		r0 = #0
		r2 = #1
	}
	{
		jump .LBB192_45
	}
.LBB192_40:                             // %assert_failed27
	{
		r1 = add(pc,##.Lstr.136@PCREL)
		r0 = add(r11,#-1)
		memw(r29+#0) = r0.new
	}
	{
		r5:4 = combine(r27,#127)
		r0 = #0
		r3:2 = combine(#0,#0)
	}
	{
		call ##halide_error_access_out_of_bounds
	}
	{
		jump .LBB192_65
	}
.LBB192_41:                             // %assert_failed28
	{
		r1 = add(pc,##.Lstr.136@PCREL)
		r0 = #0
		r3:2 = combine(r12,#0)
	}
	{
		jump .LBB192_45
	}
.LBB192_42:                             // %assert_failed29
	{
		r1 = add(pc,##.Lstr.136@PCREL)
		r0 = add(r26,#-1)
		memw(r29+#0) = r0.new
	}
	{
		r4 = #127
		r0 = #0
		r3:2 = combine(#0,#1)
	}
	{
		call ##halide_error_access_out_of_bounds
	}
	{
		jump .LBB192_65
	}
.LBB192_43:                             // %assert_failed30
	{
		r1 = add(pc,##.Lstr.136@PCREL)
		r0 = #0
		r2 = #1
	}
.LBB192_44:                             // %assert_failed30
	{
		r3 = r4
	}
.LBB192_45:                             // %assert_failed30
	{
		r17:16 = memd(r29+#288)
		r19:18 = memd(r29+#280)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#272)
		r23:22 = memd(r29+#264)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#256)
		r27:26 = memd(r29+#248)
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_error_buffer_extents_negative
		r31:30 = deallocframe(r30):raw
	}
.LBB192_46:                             // %assert_failed31
	{
		r1 = add(pc,##.Lstr.137@PCREL)
		r0 = #0
		r2 = r19
	}
	{
		jump .LBB192_47
	}
.LBB192_48:                             // %assert_failed32
	{
		r1 = add(pc,##.Lstr.139@PCREL)
		r0 = #0
		r2 = memw(r29+#40)
	}                                       // 4-byte Folded Reload
	{
		jump .LBB192_47
	}
.LBB192_49:                             // %assert_failed33
	{
		r1 = add(pc,##.Lstr.140@PCREL)
		r0 = #0
		r2 = memw(r29+#36)
	}                                       // 4-byte Folded Reload
.LBB192_47:                             // %assert_failed31
	{
		r4 = #1
		r17:16 = memd(r29+#288)
		r19:18 = memd(r29+#280)
	}                                       // 8-byte Folded Reload
	{
		r3 = add(pc,##.Lstr.138@PCREL)
		r21:20 = memd(r29+#272)
		r23:22 = memd(r29+#264)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#256)
		r27:26 = memd(r29+#248)
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_error_constraint_violated
		r31:30 = deallocframe(r30):raw
	}
.Lfunc_end192:
	.size	matmul, .Lfunc_end192-matmul
	.section	.rodata.matmul,"a",@progbits
	.p2align	2
.LJTI192_0:
	.word	.LBB192_24-.LJTI192_0
	.word	.LBB192_25-.LJTI192_0
	.word	.LBB192_27-.LJTI192_0
	.word	.LBB192_28-.LJTI192_0
	.word	.LBB192_29-.LJTI192_0
	.word	.LBB192_31-.LJTI192_0
	.word	.LBB192_32-.LJTI192_0
	.word	.LBB192_33-.LJTI192_0
	.word	.LBB192_34-.LJTI192_0
	.word	.LBB192_35-.LJTI192_0
	.word	.LBB192_36-.LJTI192_0
	.word	.LBB192_37-.LJTI192_0
	.word	.LBB192_38-.LJTI192_0
	.word	.LBB192_39-.LJTI192_0
	.word	.LBB192_40-.LJTI192_0
	.word	.LBB192_41-.LJTI192_0
	.word	.LBB192_42-.LJTI192_0
	.word	.LBB192_43-.LJTI192_0
	.word	.LBB192_46-.LJTI192_0
	.word	.LBB192_48-.LJTI192_0
	.word	.LBB192_49-.LJTI192_0
.LJTI192_1:
	.word	.LBB192_50-.LJTI192_1
	.word	.LBB192_51-.LJTI192_1
	.word	.LBB192_52-.LJTI192_1
	.word	.LBB192_54-.LJTI192_1
	.word	.LBB192_55-.LJTI192_1
	.word	.LBB192_56-.LJTI192_1
	.word	.LBB192_57-.LJTI192_1
	.word	.LBB192_58-.LJTI192_1
	.word	.LBB192_61-.LJTI192_1
	.word	.LBB192_62-.LJTI192_1
	.word	.LBB192_63-.LJTI192_1
                                        // -- End function
	.section	.text.matmul.par_for.out.s0.x.x.xy,"ax",@progbits
	.p2align	4                               // -- Begin function matmul.par_for.out.s0.x.x.xy
	.type	matmul.par_for.out.s0.x.x.xy,@function
matmul.par_for.out.s0.x.x.xy:           // @matmul.par_for.out.s0.x.x.xy
// %bb.0:                               // %entry
	{
		r3 = memw(r2+#24)
		allocframe(r29,#2688):raw
	}
	{
		r29 = and(r29,#-128)
		r18 = memw(r2+#0)
		memd(r30+#-16) = r19:18
	}                                       // 8-byte Folded Spill
	{
		r21 = memw(r2+#4)
		memd(r30+#-24) = r21:20
	}                                       // 8-byte Folded Spill
	{
		r19 = memw(r2+#8)
		memd(r30+#-32) = r23:22
	}                                       // 8-byte Folded Spill
	{
		r17 = r1
		r23 = memw(r2+#16)
		memd(r30+#-8) = r17:16
	}                                       // 8-byte Folded Spill
	{
		r22 = memw(r2+#32)
		memd(r30+#-40) = r25:24
	}                                       // 8-byte Folded Spill
	{
		r1 = memw(r2+#36)
		memd(r30+#-48) = r27:26
	}                                       // 8-byte Folded Spill
	{
		r20 = memw(r2+#12)
		memw(r29+#100) = r0
	}                                       // 4-byte Folded Spill
	{
		r24 = memw(r2+#20)
		memw(r29+#124) = r3
	}                                       // 4-byte Folded Spill
	{
		call ##halide_qurt_hvx_lock
		r16 = memw(r2+#28)
		memw(r29+#120) = r1
	}                                       // 4-byte Folded Spill
	{
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:nt .LBB193_6
	}
// %bb.1:                               // %"assert succeeded"
	{
		r0 = asr(r17,#31)
		r4 = asl(r24,#3)
		r1 = ##-1431655765
	}
	{
		r20 += mpyi(r24,r23)
		r3 = xor(r0,r17)
		r2 = #80
		memw(r29+#184) = r4
	}                                       // 4-byte Folded Spill
	{
		loop1(.LBB193_2,#12)
		r7:6 = mpyu(r3,r1)
		r8 = #0
		v0 = vxor(v0,v0)
	}
	{
		r24 = add(##-64,asl(r24,#1))
		r5:4 = lsr(r7:6,#33)
		memw(r29+#188) = r24.new
	}                                       // 4-byte Folded Spill
	{
		r0 = xor(r0,r4)
	}
	{
		r1 = +mpyi(r0,#48)
		r17 -= mpyi(r0,#3)
	}
	{
		r1 = min(r1,r2)
		r0 = asl(r19,#3)
		memw(r29+#116) = r0.new
	}                                       // 4-byte Folded Spill
	{
		r0 = +mpyi(r17,#48)
		r1 = sub(r1,r21)
		memw(r29+#112) = r1
	}                                       // 4-byte Folded Spill
	{
		r6 = min(r0,r2)
		r0 = add(r1,#2)
		r4 = add(r1,#1)
		r5 = add(r1,#3)
	}
	{
		r2 = mpyi(r19,r4)
		r0 = mpyi(r19,r0)
		r4 = sub(r6,r20)
		memw(r29+#108) = r6
	}                                       // 4-byte Folded Spill
	{
		r4 = addasl(r22,r4,#1)
		r3 = mpyi(r19,r1)
		r0 = sub(r0,r18)
		memw(r29+#104) = r4.new
	}                                       // 4-byte Folded Spill
	{
		r7 = mpyi(r19,r5)
		r0 = asl(r0,#1)
		r4 = #64
		r1 = sub(r3,r18)
	}
	{
		r13 = add(r0,add(r16,#4))
		r0 = #-1
		r2 = sub(r2,r18)
		q0 = vsetq(r4)
	}
	{
		r1 = asl(r1,#1)
		v1 = vand(q0,r0)
		r3 = sub(r7,r18)
	}
	{
		r2 = asl(r2,#1)
		r3 = asl(r3,#1)
	}
	{
		r5 = add(r1,add(r16,#4))
		r9 = add(r2,add(r16,#4))
	}
	{
		r12 = add(r3,add(r16,#4))
	}
	.p2align	4
.Ltmp6:                                 // Block address taken
.LBB193_2:                              // %"for out.s0.y.yi.yi"
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB193_3 Depth 2
	{
		r3:2 = combine(#0,#0)
		r5:4 = combine(#0,#0)
		memw(r29+#176) = r5
		memw(r29+#632) = r5
	}                                       // 4-byte Folded Spill
	{
		r3:2 = combine(#0,#0)
		r5:4 = combine(#0,#0)
		memd(r29+#600) = r3:2
		memd(r29+#464) = r5:4
	}                                       // 8-byte Folded Spill
	{
		r3:2 = combine(#0,#0)
		r5:4 = combine(#0,#0)
		memd(r29+#576) = r3:2
		memd(r29+#448) = r5:4
	}                                       // 8-byte Folded Spill
	{
		r3:2 = combine(#0,#0)
		r5:4 = combine(#0,#0)
		memd(r29+#624) = r3:2
		memd(r29+#560) = r5:4
	}                                       // 8-byte Folded Spill
	{
		r3:2 = combine(#0,#0)
		r5:4 = combine(#0,#0)
		memd(r29+#608) = r3:2
		memd(r29+#552) = r5:4
	}                                       // 8-byte Folded Spill
	{
		r3:2 = combine(#0,#0)
		r5:4 = combine(#0,#0)
		memd(r29+#352) = r3:2
		memd(r29+#320) = r5:4
	}                                       // 8-byte Folded Spill
	{
		r3:2 = combine(#0,#0)
		r5:4 = combine(#0,#0)
		memd(r29+#344) = r3:2
		memd(r29+#440) = r5:4
	}                                       // 8-byte Folded Spill
	{
		r3:2 = combine(#0,#0)
		r5:4 = combine(#0,#0)
		memd(r29+#472) = r3:2
		memd(r29+#432) = r5:4
	}                                       // 8-byte Folded Spill
	{
		r3:2 = combine(#0,#0)
		r5:4 = combine(#0,#0)
		memd(r29+#456) = r3:2
		memd(r29+#528) = r5:4
	}                                       // 8-byte Folded Spill
	{
		r3:2 = combine(#0,#0)
		r7:6 = combine(#0,#0)
		memd(r29+#568) = r3:2
		memd(r29+#520) = r5:4
	}                                       // 8-byte Folded Spill
	{
		r3:2 = combine(#0,#0)
		r5:4 = combine(#0,#0)
		memd(r29+#544) = r3:2
		memd(r29+#584) = r7:6
	}                                       // 8-byte Folded Spill
	{
		r3:2 = combine(#0,#0)
		r7:6 = combine(#0,#0)
		memd(r29+#336) = r3:2
		memd(r29+#304) = r5:4
	}                                       // 8-byte Folded Spill
	{
		r3:2 = combine(#0,#0)
		r5:4 = combine(#0,#0)
		r0 = memw(r29+#112)
		memd(r29+#328) = r3:2
	}                                       // 4-byte Folded Reload
	{
		r3:2 = combine(#0,#0)
		r7:6 = combine(#0,#0)
		memd(r29+#424) = r3:2
		memd(r29+#384) = r7:6
	}                                       // 8-byte Folded Spill
	{
		r3:2 = combine(#0,#0)
		r5:4 = combine(#0,#0)
		memd(r29+#536) = r3:2
		memd(r29+#288) = r5:4
	}                                       // 8-byte Folded Spill
	{
		r0 = addasl(r0,r8,#2)
		r3:2 = combine(#0,#0)
		r25:24 = memd(r29+#192)
		memd(r29+#512) = r3:2
	}                                       // 8-byte Folded Reload
	{
		r3:2 = combine(#0,#0)
		r7:6 = combine(#0,#0)
		memd(r29+#312) = r3:2
		memd(r29+#616) = r7:6
	}                                       // 8-byte Folded Spill
	{
		r3:2 = combine(#0,#0)
		r5:4 = combine(#0,#0)
		memd(r29+#296) = r3:2
		memd(r29+#408) = r5:4
	}                                       // 8-byte Folded Spill
	{
		r3:2 = combine(#0,#0)
		r27:26 = combine(#0,#0)
		memd(r29+#416) = r3:2
		memw(r29+#164) = r13
	}                                       // 8-byte Folded Spill
	{
		r11:10 = combine(#0,#0)
		r17:16 = combine(#0,#0)
		memw(r29+#372) = r13
		memw(r29+#168) = r12
	}                                       // 4-byte Folded Spill
	{
		loop0(.LBB193_3,#32)
		r19:18 = memd(r29+#152)
		memw(r29+#368) = r12
	}                                       // 8-byte Folded Reload
	{
		r21:20 = combine(#0,#0)
		r13:12 = memd(r29+#144)
		memd(r29+#376) = r21:20
	}                                       // 8-byte Folded Reload
	{
		r15:14 = memd(r29+#136)
		memw(r29+#160) = r0
	}                                       // 8-byte Folded Reload
	{
		r7:6 = combine(#0,#0)
		r23:22 = memd(r29+#128)
		memd(r29+#592) = r7:6
	}                                       // 8-byte Folded Reload
	{
		r3:2 = combine(#0,#0)
		r0 = memw(r29+#104)
		memd(r29+#400) = r3:2
	}                                       // 4-byte Folded Reload
	{
		r5:4 = combine(#0,#0)
		memd(r29+#392) = r5:4
		memw(r29+#180) = r8
	}                                       // 8-byte Folded Spill
	{
		r9:8 = combine(#0,#0)
		memw(r29+#172) = r9
		memw(r29+#636) = r9
	}                                       // 4-byte Folded Spill
	{
		r1:0 = combine(#0,#0)
		r3:2 = combine(#0,#0)
		memw(r29+#364) = r0
		memd(r29+#504) = r3:2
	}                                       // 4-byte Folded Spill
	{
		r1:0 = combine(#0,#0)
		r3:2 = combine(#0,#0)
		memd(r29+#496) = r1:0
		memd(r29+#488) = r3:2
	}                                       // 8-byte Folded Spill
	{
		memd(r29+#480) = r1:0
		memd(r29+#280) = r3:2
	}                                       // 8-byte Folded Spill
	.p2align	4
.Ltmp7:                                 // Block address taken
.LBB193_3:                              // %"for matrix_mul.s1.k$x.k$x"
                                        //   Parent Loop BB193_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	{
		r3:2 = memd(r29+#344)
		memd(r29+#2456) = r7:6
	}                                       // 8-byte Folded Reload
	{
		r1:0 = memd(r29+#352)
		memd(r29+#2440) = r3:2
	}                                       // 8-byte Folded Reload
	{
		r7:6 = memd(r29+#592)
		memd(r29+#2448) = r1:0
	}                                       // 8-byte Folded Reload
	{
		r9 = add(r29,#2048)
		r3:2 = memd(r29+#608)
		memd(r29+#192) = r9:8
	}                                       // 8-byte Folded Reload
	{
		r1:0 = memd(r29+#616)
		memd(r29+#2464) = r7:6
	}                                       // 8-byte Folded Reload
	{
		r3:2 = memd(r29+#624)
		memd(r29+#2472) = r3:2
	}                                       // 8-byte Folded Reload
	{
		r7 = memw(r29+#364)
		memd(r29+#2480) = r1:0
	}                                       // 4-byte Folded Reload
	{
		r28 = add(r7,#64)
		r8 = memw(r29+#632)
		memd(r29+#2432) = r27:26
	}                                       // 4-byte Folded Reload
	{
		r1:0 = memd(r29+#384)
		memd(r29+#2488) = r3:2
	}                                       // 8-byte Folded Reload
	{
		r6 = memuh(r8+#-4)
		v2 = vmem(r9+#3)
	}
	{
		v5.h = vsplat(r6)
		v4 = vmemu(r7+#0)
	}
	{
		r1:0 = memd(r29+#576)
		memd(r29+#2560) = r1:0
	}                                       // 8-byte Folded Reload
	{
		v9:8.uw = vmpy(v4.uh,v5.uh)
		r1:0 = memd(r29+#584)
		memd(r29+#2568) = r1:0
	}                                       // 8-byte Folded Reload
	{
		v7.h = vshuffe(v0.h,v8.h)
		r1:0 = memd(r29+#600)
		memd(r29+#2576) = r1:0
	}                                       // 8-byte Folded Reload
	{
		v2.h = vadd(v7.h,v2.h)
		r1:0 = memd(r29+#248)
		memd(r29+#2584) = r1:0
	}                                       // 8-byte Folded Reload
	{
		r1:0 = memd(r29+#256)
		memd(r29+#2592) = r1:0
	}                                       // 8-byte Folded Reload
	{
		r26 = memw(r29+#188)
		memd(r29+#2600) = r1:0
	}                                       // 4-byte Folded Reload
	{
		r6 = add(r28,r26)
		r1:0 = memd(r29+#264)
		r2 = memw(r29+#184)
	}                                       // 8-byte Folded Reload
	{
		r7 = add(r7,r2)
		r1:0 = memd(r29+#272)
		memd(r29+#2608) = r1:0
	}                                       // 8-byte Folded Reload
	{
		memd(r29+#2616) = r1:0
		memw(r29+#364) = r7
	}
	{
		r9 = add(r29,#2048)
		r3:2 = memd(r29+#328)
		v6 = vmem(r9+#4)
	}                                       // 8-byte Folded Reload
	{
		r28 = add(r29,#1536)
		v3 = vmemu(r28+#0)
	}
	{
		r3:2 = memd(r29+#320)
		memd(r29+#2176) = r3:2
	}                                       // 8-byte Folded Reload
	{
		v11:10.uw = vmpy(v3.uh,v5.uh)
		r3:2 = memd(r29+#336)
		memd(r29+#2184) = r3:2
	}                                       // 8-byte Folded Reload
	{
		v5.h = vshuffe(v0.h,v10.h)
		r1:0 = memd(r29+#552)
		memd(r29+#2192) = r3:2
	}                                       // 8-byte Folded Reload
	{
		v10.h = vadd(v5.h,v6.h)
		r3:2 = memd(r29+#568)
		memd(r29+#2208) = r1:0
	}                                       // 8-byte Folded Reload
	{
		r2 = add(r6,#64)
		r1:0 = memd(r29+#544)
		memd(r29+#2232) = r3:2
	}                                       // 8-byte Folded Reload
	{
		r7 = add(r2,r26)
		r1:0 = memd(r29+#560)
		memd(r29+#2216) = r1:0
	}                                       // 8-byte Folded Reload
	{
		r27 = memw(r29+#636)
		memd(r29+#2224) = r1:0
	}                                       // 4-byte Folded Reload
	{
		r1:0 = memd(r29+#448)
		memd(r29+#2200) = r21:20
	}                                       // 8-byte Folded Reload
	{
		r3 = memuh(r27+#-4)
		v9 = vmem(r9+#1)
	}
	{
		v7.h = vsplat(r3)
		r1:0 = memd(r29+#456)
		memd(r29+#2304) = r1:0
	}                                       // 8-byte Folded Reload
	{
		r1:0 = memd(r29+#464)
		memd(r29+#2312) = r1:0
	}                                       // 8-byte Folded Reload
	{
		v13:12.uw = vmpy(v4.uh,v7.uh)
		r1:0 = memd(r29+#472)
		memd(r29+#2320) = r1:0
	}                                       // 8-byte Folded Reload
	{
		v7:6.uw = vmpy(v3.uh,v7.uh)
		v5.h = vshuffe(v0.h,v12.h)
		r1:0 = memd(r29+#224)
		memd(r29+#2328) = r1:0
	}                                       // 8-byte Folded Reload
	{
		v18.h = vshuffe(v0.h,v6.h)
		v17.h = vadd(v5.h,v9.h)
		r1:0 = memd(r29+#232)
		memd(r29+#2336) = r1:0
	}                                       // 8-byte Folded Reload
	{
		r1:0 = memd(r29+#240)
		memd(r29+#2344) = r1:0
	}                                       // 8-byte Folded Reload
	{
		r1:0 = memd(r29+#376)
		memd(r29+#2352) = r1:0
	}                                       // 8-byte Folded Reload
	{
		r1:0 = memd(r29+#288)
		memd(r29+#2360) = r1:0
	}                                       // 8-byte Folded Reload
	{
		r9 = add(r29,#2048)
		v8 = vmem(r9+#2)
		memd(r29+#1920) = r1:0
	}
	{
		v8.h = vadd(v18.h,v8.h)
		r1:0 = memd(r29+#296)
	}                                       // 8-byte Folded Reload
	{
		r1:0 = memd(r29+#304)
		memd(r29+#1928) = r1:0
	}                                       // 8-byte Folded Reload
	{
		r1:0 = memd(r29+#312)
		memd(r29+#1936) = r1:0
	}                                       // 8-byte Folded Reload
	{
		r1:0 = memd(r29+#520)
		memd(r29+#1944) = r1:0
	}                                       // 8-byte Folded Reload
	{
		r1:0 = memd(r29+#512)
		memd(r29+#1952) = r1:0
	}                                       // 8-byte Folded Reload
	{
		r1:0 = memd(r29+#528)
		memd(r29+#1960) = r1:0
	}                                       // 8-byte Folded Reload
	{
		r1:0 = memd(r29+#536)
		memd(r29+#1968) = r1:0
	}                                       // 8-byte Folded Reload
	{
		r1 = add(r7,#64)
		r20 = memw(r29+#372)
		memd(r29+#1976) = r1:0
	}                                       // 4-byte Folded Reload
	{
		r3 = add(r1,r26)
		v14 = vmem(r9+#-1)
	}
	{
		r0 = memuh(r20+#-4)
		memd(r29+#2048) = r11:10
	}
	{
		v15.h = vsplat(r0)
		r11:10 = memd(r29+#432)
		memd(r29+#2080) = r25:24
	}                                       // 8-byte Folded Reload
	{
		r11:10 = memd(r29+#424)
		memd(r29+#2056) = r11:10
	}                                       // 8-byte Folded Reload
	{
		v13:12.uw = vmpy(v4.uh,v15.uh)
		r11:10 = memd(r29+#440)
		memd(r29+#2064) = r11:10
	}                                       // 8-byte Folded Reload
	{
		v19.h = vshuffe(v0.h,v12.h)
		r11:10 = memd(r29+#200)
		memd(r29+#2072) = r11:10
	}                                       // 8-byte Folded Reload
	{
		v19.h = vadd(v19.h,v14.h)
		r11:10 = memd(r29+#208)
		memd(r29+#2088) = r11:10
	}                                       // 8-byte Folded Reload
	{
		r11:10 = memd(r29+#216)
		memd(r29+#2096) = r11:10
	}                                       // 8-byte Folded Reload
	{
		memd(r29+#2104) = r11:10
	}
	{
		r9 = r8
		v16 = vmem(r9+#0)
		memd(r29+#1664) = r5:4
	}
	{
		r17 = add(r29,#2048)
		r5:4 = memd(r29+#280)
		memd(r29+#1672) = r17:16
	}                                       // 8-byte Folded Reload
	{
		r5:4 = memd(r29+#192)
		memd(r29+#1680) = r5:4
	}                                       // 8-byte Folded Reload
	{
		r5:4 = memd(r29+#480)
		memd(r29+#1688) = r5:4
	}                                       // 8-byte Folded Reload
	{
		r5:4 = memd(r29+#488)
		memd(r29+#1696) = r5:4
	}                                       // 8-byte Folded Reload
	{
		r5:4 = memd(r29+#496)
		memd(r29+#1704) = r5:4
	}                                       // 8-byte Folded Reload
	{
		r5:4 = memd(r29+#504)
		memd(r29+#1712) = r5:4
	}                                       // 8-byte Folded Reload
	{
		r4 = add(r3,#64)
		r16 = memw(r29+#368)
		memd(r29+#1720) = r5:4
	}                                       // 4-byte Folded Reload
	{
		r11:10 = memd(r29+#392)
		v7 = vmem(r17+#-3)
	}                                       // 8-byte Folded Reload
	{
		r5 = memuh(r16+#-4)
		memd(r29+#1792) = r11:10
	}
	{
		r12 = r20
		r13 = add(r29,#1280)
		r11:10 = memd(r29+#400)
		memd(r29+#1840) = r13:12
	}                                       // 8-byte Folded Reload
	{
		r11:10 = memd(r29+#408)
		memd(r29+#1800) = r11:10
	}                                       // 8-byte Folded Reload
	{
		r11:10 = memd(r29+#416)
		memd(r29+#1808) = r11:10
	}                                       // 8-byte Folded Reload
	{
		memd(r29+#1816) = r11:10
		memd(r29+#1824) = r23:22
	}
	{
		memd(r29+#1832) = r15:14
		memd(r29+#1848) = r19:18
	}
	{
		r0 = memuh(r8+#-2)
		memw(r29+#632) = r8
	}                                       // 4-byte Folded Spill
	{
		v20.h = vsplat(r0)
		r8 = memuh(r8+#0)
		r9 = memuh(r9+#2)
	}
	{
		v21.h = vsplat(r8)
		v22.h = vsplat(r9)
		v13 = vmemu(r6+#0)
	}
	{
		v12 = vmemu(r7+#0)
	}
	{
		v25:24.uw = vmpy(v13.uh,v20.uh)
		v11 = vmemu(r3+#0)
	}
	{
		v29:28.uw = vmpy(v12.uh,v21.uh)
		v6.h = vshuffe(v0.h,v24.h)
		v5 = vmem(r17+#-2)
		memw(r29+#636) = r27
	}
	{
		v31:30.uw = vmpy(v11.uh,v22.uh)
		v2.h = vadd(v2.h,v6.h)
		v6.h = vshuffe(v0.h,v28.h)
		r3 = memuh(r27+#-2)
	}
	{
		v2.h = vadd(v2.h,v6.h)
		v23.h = vshuffe(v0.h,v30.h)
		v6 = vmemu(r1+#0)
	}
	{
		v18.h = vsplat(r3)
		v2.h = vadd(v2.h,v23.h)
		v9 = vmemu(r2+#0)
	}
	{
		v31:30.uw = vmpy(v6.uh,v21.uh)
		r1 = add(r29,#1024)
		r7 = memuh(r27+#0)
		r6 = memuh(r20+#-2)
	}
	{
		v29:28.uw = vmpy(v9.uh,v20.uh)
		v14.h = vshuffe(v0.h,v30.h)
		r0 = memuh(r16+#-2)
		r8 = memuh(r16+#0)
	}
	{
		v23.h = vsplat(r7)
		v20.h = vshuffe(v0.h,v28.h)
		r9 = memuh(r20+#0)
		vmem(r28+#0) = v2
	}
	{
		v29:28.uw = vmpy(v13.uh,v18.uh)
		r7 = add(r29,#896)
		v10.h = vadd(v10.h,v20.h)
		r2 = memw(r28+#56)
	}
	{
		v31:30.uw = vmpy(v12.uh,v23.uh)
		v21.h = vadd(v10.h,v14.h)
		v10.h = vshuffe(v0.h,v28.h)
		r3 = memw(r28+#60)
	}
	{
		v27:26.uw = vmpy(v9.uh,v18.uh)
		v10.h = vadd(v17.h,v10.h)
		v14.h = vshuffe(v0.h,v30.h)
		memd(r29+#624) = r3:2
	}                                       // 8-byte Folded Spill
	{
		v25:24.uw = vmpy(v3.uh,v15.uh)
		v20.h = vshuffe(v0.h,v26.h)
		v10.h = vadd(v10.h,v14.h)
		r2 = memw(r28+#48)
	}
	{
		v29:28.uw = vmpy(v6.uh,v23.uh)
		v14.h = vadd(v8.h,v20.h)
		r3 = memw(r28+#52)
	}
	{
		v20.h = vsplat(r6)
		v23.h = vsplat(r9)
		v28.h = vshuffe(v0.h,v28.h)
		memd(r29+#616) = r3:2
	}                                       // 8-byte Folded Spill
	{
		v14.h = vsplat(r5)
		r6 = add(r29,#640)
		v18.h = vadd(v14.h,v28.h)
		r2 = memw(r28+#40)
	}
	{
		v29:28.uw = vmpy(v13.uh,v20.uh)
		r3 = memw(r28+#44)
	}
	{
		v31:30.uw = vmpy(v12.uh,v23.uh)
		memd(r29+#608) = r3:2
	}                                       // 8-byte Folded Spill
	{
		v31:30.uw = vmpy(v9.uh,v20.uh)
		v29.h = vshuffe(v0.h,v30.h)
		r2 = memw(r28+#32)
		r3 = memw(r28+#36)
	}
	{
		v31.h = vshuffe(v0.h,v30.h)
		memd(r29+#592) = r3:2
	}                                       // 8-byte Folded Spill
	{
		r2 = memw(r28+#24)
		r3 = memw(r28+#28)
	}
	{
		memd(r29+#192) = r3:2
	}                                       // 8-byte Folded Spill
	{
		r2 = memw(r28+#16)
		r3 = memw(r28+#20)
	}
	{
		memd(r29+#352) = r3:2
	}                                       // 8-byte Folded Spill
	{
		r2 = memw(r28+#8)
		r3 = memw(r28+#12)
	}
	{
		r3 = add(r29,#1408)
		r2 = r12
		memd(r29+#344) = r3:2
	}                                       // 8-byte Folded Spill
	{
		r2 = add(r2,#8)
		r28 = add(r29,#768)
		r14 = memw(r28+#0)
		r15 = memw(r28+#4)
	}
	{
		v8 = vmemu(r4+#0)
	}
	{
		v27:26.uw = vmpy(v8.uh,v22.uh)
	}
	{
		v27:26.uw = vmpy(v6.uh,v23.uh)
		v15.h = vshuffe(v0.h,v26.h)
	}
	{
		v15.h = vadd(v21.h,v15.h)
		v21.h = vshuffe(v0.h,v24.h)
		vmem(r1+#0) = v15.new
	}
	{
		v15.h = vshuffe(v0.h,v28.h)
		r4 = memw(r1+#56)
		r5 = memw(r1+#60)
	}
	{
		v16.h = vsplat(r0)
		v15.h = vadd(v19.h,v15.h)
		v19.h = vadd(v21.h,v16.h)
		memd(r29+#272) = r5:4
	}                                       // 8-byte Folded Spill
	{
		v17.h = vadd(v19.h,v31.h)
		v19.h = vshuffe(v0.h,v26.h)
		v15.h = vadd(v15.h,v29.h)
		r4 = memw(r1+#48)
	}
	{
		v17.h = vadd(v17.h,v19.h)
		r5 = memw(r1+#52)
	}
	{
		memd(r29+#264) = r5:4
	}                                       // 8-byte Folded Spill
	{
		r4 = memw(r1+#40)
		r5 = memw(r1+#44)
	}
	{
		memd(r29+#256) = r5:4
	}                                       // 8-byte Folded Spill
	{
		r4 = memw(r1+#32)
		r5 = memw(r1+#36)
	}
	{
		memd(r29+#248) = r5:4
	}                                       // 8-byte Folded Spill
	{
		r4 = memw(r1+#24)
		r5 = memw(r1+#28)
	}
	{
		memd(r29+#600) = r5:4
	}                                       // 8-byte Folded Spill
	{
		r4 = memw(r1+#16)
		r5 = memw(r1+#20)
	}
	{
		memd(r29+#584) = r5:4
	}                                       // 8-byte Folded Spill
	{
		r4 = memw(r1+#8)
		r5 = memw(r1+#12)
	}
	{
		r5 = add(r29,#1152)
		memd(r29+#576) = r5:4
	}                                       // 8-byte Folded Spill
	{
		r0 = memw(r1+#0)
		r1 = memw(r1+#4)
	}
	{
		r27:26 = combine(r15,r14)
		r0 = memuh(r27+#2)
		memd(r29+#384) = r1:0
	}                                       // 8-byte Folded Spill
	{
		v19.h = vsplat(r0)
	}
	{
		v29:28.uw = vmpy(v11.uh,v19.uh)
	}
	{
		v31:30.uw = vmpy(v8.uh,v19.uh)
		v20.h = vshuffe(v0.h,v28.h)
	}
	{
		v10.h = vadd(v10.h,v20.h)
		v19.h = vshuffe(v0.h,v30.h)
		vmem(r3+#0) = v10.new
	}
	{
		v29:28.uw = vmpy(v4.uh,v14.uh)
		v18.h = vadd(v18.h,v19.h)
		r0 = memw(r3+#56)
		r1 = memw(r3+#60)
	}
	{
		v31:30.uw = vmpy(v13.uh,v16.uh)
		v4.h = vshuffe(v0.h,v28.h)
		memd(r29+#568) = r1:0
	}                                       // 8-byte Folded Spill
	{
		v29:28.uw = vmpy(v3.uh,v14.uh)
		v4.h = vadd(v4.h,v7.h)
		v7.h = vshuffe(v0.h,v30.h)
		r0 = memw(r3+#48)
	}
	{
		v31:30.uw = vmpy(v9.uh,v16.uh)
		v4.h = vadd(v4.h,v7.h)
		v3.h = vshuffe(v0.h,v28.h)
		r1 = memw(r3+#52)
	}
	{
		v3.h = vadd(v3.h,v5.h)
		v5.h = vshuffe(v0.h,v30.h)
		memd(r29+#560) = r1:0
	}                                       // 8-byte Folded Spill
	{
		v3.h = vadd(v3.h,v5.h)
		r0 = memw(r3+#40)
		r1 = memw(r3+#44)
	}
	{
		memd(r29+#544) = r1:0
	}                                       // 8-byte Folded Spill
	{
		r0 = memw(r3+#32)
		r1 = memw(r3+#36)
	}
	{
		memd(r29+#552) = r1:0
	}                                       // 8-byte Folded Spill
	{
		r20 = memw(r3+#24)
		r21 = memw(r3+#28)
	}
	{
		r0 = memw(r3+#16)
		r1 = memw(r3+#20)
	}
	{
		memd(r29+#336) = r1:0
	}                                       // 8-byte Folded Spill
	{
		r0 = memw(r3+#8)
		r1 = memw(r3+#12)
	}
	{
		memd(r29+#320) = r1:0
	}                                       // 8-byte Folded Spill
	{
		r0 = memw(r3+#0)
		r1 = memw(r3+#4)
	}
	{
		memd(r29+#328) = r1:0
		vmem(r7+#0) = v18
	}                                       // 8-byte Folded Spill
	{
		r0 = memw(r7+#56)
		r1 = memw(r7+#60)
	}
	{
		memd(r29+#376) = r1:0
	}                                       // 8-byte Folded Spill
	{
		r0 = memw(r7+#48)
		r1 = memw(r7+#52)
	}
	{
		memd(r29+#240) = r1:0
	}                                       // 8-byte Folded Spill
	{
		r0 = memw(r7+#40)
		r1 = memw(r7+#44)
	}
	{
		memd(r29+#232) = r1:0
	}                                       // 8-byte Folded Spill
	{
		r0 = memw(r7+#32)
		r1 = memw(r7+#36)
	}
	{
		memd(r29+#224) = r1:0
	}                                       // 8-byte Folded Spill
	{
		r0 = memw(r7+#24)
		r1 = memw(r7+#28)
	}
	{
		memd(r29+#472) = r1:0
	}                                       // 8-byte Folded Spill
	{
		r0 = memw(r7+#16)
		r1 = memw(r7+#20)
	}
	{
		memd(r29+#464) = r1:0
	}                                       // 8-byte Folded Spill
	{
		r0 = memw(r7+#8)
		r1 = memw(r7+#12)
	}
	{
		memd(r29+#456) = r1:0
	}                                       // 8-byte Folded Spill
	{
		r0 = memw(r7+#0)
		r1 = memw(r7+#4)
	}
	{
		r0 = memuh(r12+#2)
		memd(r29+#448) = r1:0
	}                                       // 8-byte Folded Spill
	{
		v18.h = vsplat(r0)
	}
	{
		v25:24.uw = vmpy(v11.uh,v18.uh)
	}
	{
		v27:26.uw = vmpy(v8.uh,v18.uh)
		v19.h = vshuffe(v0.h,v24.h)
	}
	{
		v15.h = vadd(v15.h,v19.h)
		v18.h = vshuffe(v0.h,v26.h)
		vmem(r13+#0) = v15.new
	}
	{
		v17.h = vadd(v17.h,v18.h)
		r0 = memw(r13+#56)
		r1 = memw(r13+#60)
	}
	{
		memd(r29+#536) = r1:0
	}                                       // 8-byte Folded Spill
	{
		r0 = memw(r13+#48)
		r1 = memw(r13+#52)
	}
	{
		memd(r29+#528) = r1:0
	}                                       // 8-byte Folded Spill
	{
		r0 = memw(r13+#40)
		r1 = memw(r13+#44)
	}
	{
		memd(r29+#512) = r1:0
	}                                       // 8-byte Folded Spill
	{
		r0 = memw(r13+#32)
		r1 = memw(r13+#36)
	}
	{
		memd(r29+#520) = r1:0
	}                                       // 8-byte Folded Spill
	{
		r0 = memw(r13+#24)
		r1 = memw(r13+#28)
	}
	{
		memd(r29+#312) = r1:0
	}                                       // 8-byte Folded Spill
	{
		r0 = memw(r13+#16)
		r1 = memw(r13+#20)
	}
	{
		memd(r29+#304) = r1:0
	}                                       // 8-byte Folded Spill
	{
		r0 = memw(r13+#8)
		r1 = memw(r13+#12)
	}
	{
		memd(r29+#296) = r1:0
	}                                       // 8-byte Folded Spill
	{
		r0 = memw(r13+#0)
		r1 = memw(r13+#4)
	}
	{
		v17.h = vsplat(r8)
		memd(r29+#288) = r1:0
		vmem(r28+#0) = v17
	}                                       // 8-byte Folded Spill
	{
		r0 = memw(r28+#56)
		r1 = memw(r28+#60)
	}
	{
		v25:24.uw = vmpy(v12.uh,v17.uh)
		memd(r29+#216) = r1:0
	}                                       // 8-byte Folded Spill
	{
		v7.h = vshuffe(v0.h,v24.h)
		r0 = memw(r28+#48)
	}
	{
		v4.h = vadd(v4.h,v7.h)
		r1 = memw(r28+#52)
	}
	{
		memd(r29+#208) = r1:0
	}                                       // 8-byte Folded Spill
	{
		r0 = memw(r28+#40)
		r1 = memw(r28+#44)
	}
	{
		memd(r29+#200) = r1:0
	}                                       // 8-byte Folded Spill
	{
		r24 = memw(r28+#32)
		r25 = memw(r28+#36)
	}
	{
		r0 = memw(r28+#24)
		r1 = memw(r28+#28)
	}
	{
		memd(r29+#440) = r1:0
	}                                       // 8-byte Folded Spill
	{
		r0 = memw(r28+#16)
		r1 = memw(r28+#20)
	}
	{
		memd(r29+#424) = r1:0
	}                                       // 8-byte Folded Spill
	{
		r0 = memw(r28+#8)
		r1 = memw(r28+#12)
	}
	{
		memd(r29+#432) = r1:0
	}                                       // 8-byte Folded Spill
	{
		r28 = r16
		r10 = memw(r28+#0)
		r11 = memw(r28+#4)
	}
	{
		r4 = memuh(r16+#2)
	}
	{
		v13.h = vsplat(r4)
	}
	{
		v27:26.uw = vmpy(v11.uh,v13.uh)
	}
	{
		v7.h = vshuffe(v0.h,v26.h)
	}
	{
		v7:6.uw = vmpy(v6.uh,v17.uh)
		v4.h = vadd(v4.h,v7.h)
		vmem(r5+#0) = v4.new
	}
	{
		v7:6.uw = vmpy(v8.uh,v13.uh)
		v5.h = vshuffe(v0.h,v6.h)
		r8 = memw(r5+#56)
		r9 = memw(r5+#60)
	}
	{
		v3.h = vadd(v3.h,v5.h)
		v5.h = vshuffe(v0.h,v6.h)
		memd(r29+#504) = r9:8
	}                                       // 8-byte Folded Spill
	{
		v3.h = vadd(v3.h,v5.h)
		r8 = memw(r5+#48)
		r9 = memw(r5+#52)
	}
	{
		memd(r29+#496) = r9:8
	}                                       // 8-byte Folded Spill
	{
		r8 = memw(r5+#40)
		r9 = memw(r5+#44)
	}
	{
		memd(r29+#488) = r9:8
	}                                       // 8-byte Folded Spill
	{
		r8 = memw(r5+#32)
		r9 = memw(r5+#36)
	}
	{
		memd(r29+#480) = r9:8
	}                                       // 8-byte Folded Spill
	{
		r8 = memw(r5+#24)
		r9 = memw(r5+#28)
	}
	{
		r0 = memw(r5+#16)
		r1 = memw(r5+#20)
	}
	{
		memd(r29+#280) = r1:0
	}                                       // 8-byte Folded Spill
	{
		r16 = memw(r5+#8)
		r17 = memw(r5+#12)
	}
	{
		r4 = memw(r5+#0)
		r5 = memw(r5+#4)
	}
	{
		vmem(r6+#0) = v3
	}
	{
		r18 = memw(r6+#56)
		r19 = memw(r6+#60)
	}
	{
		r12 = memw(r6+#48)
		r13 = memw(r6+#52)
	}
	{
		r14 = memw(r6+#40)
		r15 = memw(r6+#44)
	}
	{
		r22 = memw(r6+#32)
		r23 = memw(r6+#36)
	}
	{
		r0 = memw(r6+#24)
		r1 = memw(r6+#28)
	}
	{
		memd(r29+#416) = r1:0
	}                                       // 8-byte Folded Spill
	{
		r0 = memw(r6+#16)
		r1 = memw(r6+#20)
	}
	{
		memd(r29+#408) = r1:0
	}                                       // 8-byte Folded Spill
	{
		r0 = memw(r6+#8)
		r1 = memw(r6+#12)
	}
	{
		memd(r29+#400) = r1:0
	}                                       // 8-byte Folded Spill
	{
		r0 = memw(r6+#0)
		r1 = memw(r6+#4)
	}
	{
		r3 = memw(r29+#632)
		memw(r29+#372) = r2
	}                                       // 4-byte Folded Reload
	{
		r0 = add(r3,#8)
		r7:6 = memd(r29+#192)
		memd(r29+#392) = r1:0
	}                                       // 8-byte Folded Reload
	{
		r3 = memw(r29+#636)
		memw(r29+#632) = r0
	}                                       // 4-byte Folded Reload
	{
		r0 = add(r3,#8)
		r3 = add(r28,#8)
		memw(r29+#636) = r0.new
	}                                       // 4-byte Folded Spill
	{
		nop
		memw(r29+#368) = r3
	} :endloop0                             // 4-byte Folded Spill
// %bb.4:                               // %"consume matrix_mul"
                                        //   in Loop: Header=BB193_2 Depth=1
	{
		r8 = memw(r29+#180)
		memd(r29+#144) = r13:12
	}                                       // 4-byte Folded Reload
	{
		r14 = #-1
		r8 = add(r8,#1)
		r9 = memw(r29+#172)
		memd(r29+#136) = r15:14
	}                                       // 4-byte Folded Reload
	{
		r0 = memw(r29+#116)
		memd(r29+#192) = r25:24
	}                                       // 4-byte Folded Reload
	{
		r9 = add(r9,r0)
		r12 = memw(r29+#168)
		r13 = memw(r29+#164)
	}                                       // 4-byte Folded Reload
	{
		r12 = add(r12,r0)
		r13 = add(r13,r0)
		r21:20 = memd(r29+#376)
		r5 = memw(r29+#176)
	}                                       // 8-byte Folded Reload
	{
		r5 = add(r5,r0)
		r4 = memw(r29+#108)
		r2 = memw(r29+#124)
	}                                       // 4-byte Folded Reload
	{
		r0 = r4
		r15 = memw(r29+#160)
		r3 = memw(r29+#120)
	}                                       // 4-byte Folded Reload
	{
		r25:24 = memd(r29+#592)
		memd(r29+#128) = r23:22
	}                                       // 8-byte Folded Reload
	{
		r0 += mpyi(r15,r2)
		r19:18 = combine(r11,r10)
		r17:16 = memd(r29+#424)
		memd(r29+#152) = r19:18
	}                                       // 8-byte Folded Reload
	{
		r7 = addasl(r3,r0,#1)
		r1:0 = memd(r29+#608)
		r27:26 = memd(r29+#616)
	}                                       // 8-byte Folded Reload
	{
		v5 = vlalign(v0,v1,r7)
	}
	{
		q0 = vand(v5,r14)
		v3 = vlalign(v0,v2,r7)
	}
	{
		v3 = vlalign(v1,v0,r7)
		if (q0) vmem(r7+#1) = v3
	}
	{
		q1 = vand(v3,r14)
		v2 = vlalign(v2,v0,r7)
	}
	{
		memh(r7+#40) = r0
		if (q1) vmem(r7+#0) = v2
	}
	{
		memh(r7+#46) = r1.h
		memh(r7+#44) = r1
	}
	{
		r1:0 = memd(r29+#624)
		memh(r7+#42) = r0.h
	}                                       // 8-byte Folded Reload
	{
		r0 = setbit(r15,#0)
		memh(r7+#56) = r0
		memh(r7+#58) = r0.h
	}
	{
		r1 = r4
		memh(r7+#62) = r1.h
		memh(r7+#60) = r1
	}
	{
		r1 += mpyi(r0,r2)
		memh(r7+#48) = r26
		memh(r7+#54) = r27.h
	}
	{
		r6 = addasl(r3,r1,#1)
		r1:0 = memd(r29+#584)
		memh(r7+#52) = r27
	}                                       // 8-byte Folded Reload
	{
		v3 = vlalign(v0,v1,r6)
		r27:26 = memd(r29+#384)
		memh(r7+#50) = r26.h
	}                                       // 8-byte Folded Reload
	{
		q2 = vand(v3,r14)
		v31 = vlalign(v1,v0,r6)
		r23:22 = memd(r29+#576)
		memh(r7+#80) = r0
	}                                       // 8-byte Folded Reload
	{
		q1 = vand(v31,r14)
		v2 = vlalign(v0,v10,r6)
		memh(r7+#86) = r1.h
		memh(r7+#84) = r1
	}
	{
		v3 = vlalign(v10,v0,r6)
		r1:0 = memd(r29+#600)
		memh(r7+#82) = r0.h
	}                                       // 8-byte Folded Reload
	{
		memh(r7+#32) = r24
		memh(r7+#38) = r25.h
	}
	{
		memh(r7+#36) = r25
		memh(r7+#34) = r24.h
	}
	{
		memh(r7+#64) = r26
		memh(r7+#70) = r27.h
	}
	{
		memh(r7+#68) = r27
		memh(r7+#66) = r26.h
	}
	{
		memh(r7+#72) = r22
		memh(r7+#78) = r23.h
	}
	{
		memh(r7+#76) = r23
		memh(r7+#74) = r22.h
	}
	{
		memh(r7+#88) = r0
		memh(r7+#94) = r1.h
	}
	{
		memh(r7+#92) = r1
		memh(r7+#90) = r0.h
	}
	{
		r1:0 = memd(r29+#472)
		if (q2) vmem(r6+#1) = v2
	}                                       // 8-byte Folded Reload
	{
		memh(r6+#94) = r1.h
		if (q1) vmem(r6+#0) = v3
	}
	{
		memh(r6+#92) = r1
		memh(r6+#90) = r0.h
	}
	{
		r1:0 = memd(r29+#464)
		memh(r6+#88) = r0
	}                                       // 8-byte Folded Reload
	{
		memh(r6+#86) = r1.h
		memh(r6+#84) = r1
	}
	{
		memh(r6+#82) = r0.h
		memh(r6+#80) = r0
	}
	{
		r1:0 = memd(r29+#456)
		r25:24 = memd(r29+#568)
	}                                       // 8-byte Folded Reload
	{
		memh(r6+#78) = r1.h
		memh(r6+#76) = r1
	}
	{
		memh(r6+#74) = r0.h
		memh(r6+#72) = r0
	}
	{
		r1:0 = memd(r29+#448)
		memh(r6+#62) = r25.h
	}                                       // 8-byte Folded Reload
	{
		r1 = r4
		memh(r6+#70) = r1.h
		memh(r6+#68) = r1
	}
	{
		r0 = setbit(r15,#1)
		memh(r6+#66) = r0.h
		memh(r6+#64) = r0
	}
	{
		r1 += mpyi(r0,r2)
		r27:26 = memd(r29+#560)
		memh(r6+#60) = r25
	}                                       // 8-byte Folded Reload
	{
		r7 = addasl(r3,r1,#1)
		r1:0 = memd(r29+#544)
		memh(r6+#58) = r24.h
	}                                       // 8-byte Folded Reload
	{
		v2 = vlalign(v0,v1,r7)
		memh(r6+#46) = r1.h
		memh(r6+#44) = r1
	}
	{
		q3 = vand(v2,r14)
		v2 = vlalign(v1,v0,r7)
		memh(r6+#42) = r0.h
		memh(r6+#40) = r0
	}
	{
		q1 = vand(v2,r14)
		v3 = vlalign(v0,v15,r7)
		r1:0 = memd(r29+#552)
		memh(r6+#56) = r24
	}                                       // 8-byte Folded Reload
	{
		memh(r6+#54) = r27.h
		memh(r6+#52) = r27
	}
	{
		memh(r6+#50) = r26.h
		memh(r6+#48) = r26
	}
	{
		memh(r6+#38) = r1.h
		memh(r6+#36) = r1
	}
	{
		memh(r6+#34) = r0.h
		memh(r6+#32) = r0
	}
	{
		v3 = vlalign(v15,v0,r7)
		r1:0 = memd(r29+#440)
		if (q3) vmem(r7+#1) = v3
	}                                       // 8-byte Folded Reload
	{
		memh(r7+#94) = r1.h
		if (q1) vmem(r7+#0) = v3
	}
	{
		memh(r7+#92) = r1
		memh(r7+#90) = r0.h
	}
	{
		r1:0 = memd(r29+#432)
		memh(r7+#88) = r0
	}                                       // 8-byte Folded Reload
	{
		r1 = r4
		memh(r7+#78) = r1.h
		memh(r7+#76) = r1
	}
	{
		r0 = or(r15,#3)
		memh(r7+#74) = r0.h
		memh(r7+#72) = r0
	}
	{
		r1 += mpyi(r0,r2)
		r23:22 = memd(r29+#536)
		memh(r7+#86) = r17.h
	}                                       // 8-byte Folded Reload
	{
		r6 = addasl(r3,r1,#1)
		r25:24 = memd(r29+#528)
		memh(r7+#84) = r17
	}                                       // 8-byte Folded Reload
	{
		v2 = vlalign(v0,v1,r6)
		r27:26 = memd(r29+#512)
		memh(r7+#82) = r16.h
	}                                       // 8-byte Folded Reload
	{
		q2 = vand(v2,r14)
		v2 = vlalign(v1,v0,r6)
		r3:2 = memd(r29+#520)
		memh(r7+#80) = r16
	}                                       // 8-byte Folded Reload
	{
		q3 = vand(v2,r14)
		v3 = vlalign(v0,v4,r6)
		memh(r7+#70) = r19.h
		memh(r7+#68) = r19
	}
	{
		memh(r7+#66) = r18.h
		memh(r7+#64) = r18
	}
	{
		memh(r7+#62) = r23.h
		memh(r7+#60) = r23
	}
	{
		memh(r7+#58) = r22.h
		memh(r7+#56) = r22
	}
	{
		memh(r7+#54) = r25.h
		memh(r7+#52) = r25
	}
	{
		memh(r7+#50) = r24.h
		memh(r7+#48) = r24
	}
	{
		memh(r7+#46) = r27.h
		memh(r7+#44) = r27
	}
	{
		memh(r7+#42) = r26.h
		memh(r7+#40) = r26
	}
	{
		memh(r7+#38) = r3.h
		memh(r7+#36) = r3
	}
	{
		memh(r7+#34) = r2.h
		memh(r7+#32) = r2
	}
	{
		v3 = vlalign(v4,v0,r6)
		r3:2 = memd(r29+#416)
		if (q2) vmem(r6+#1) = v3
	}                                       // 8-byte Folded Reload
	{
		memh(r6+#94) = r3.h
		if (q3) vmem(r6+#0) = v3
	}
	{
		memh(r6+#92) = r3
		memh(r6+#90) = r2.h
	}
	{
		r3:2 = memd(r29+#408)
		memh(r6+#88) = r2
	}                                       // 8-byte Folded Reload
	{
		memh(r6+#86) = r3.h
		memh(r6+#84) = r3
	}
	{
		memh(r6+#82) = r2.h
		memh(r6+#80) = r2
	}
	{
		r3:2 = memd(r29+#400)
	}                                       // 8-byte Folded Reload
	{
		memh(r6+#78) = r3.h
		memh(r6+#76) = r3
	}
	{
		memh(r6+#74) = r2.h
		memh(r6+#72) = r2
	}
	{
		r3:2 = memd(r29+#392)
	}                                       // 8-byte Folded Reload
	{
		memh(r6+#70) = r3.h
		memh(r6+#68) = r3
	}
	{
		memh(r6+#66) = r2.h
		memh(r6+#64) = r2
	}
	{
		r3:2 = memd(r29+#504)
	}                                       // 8-byte Folded Reload
	{
		memh(r6+#62) = r3.h
		memh(r6+#60) = r3
	}
	{
		memh(r6+#58) = r2.h
		memh(r6+#56) = r2
	}
	{
		r3:2 = memd(r29+#496)
	}                                       // 8-byte Folded Reload
	{
		memh(r6+#54) = r3.h
		memh(r6+#52) = r3
	}
	{
		memh(r6+#50) = r2.h
		memh(r6+#48) = r2
	}
	{
		r3:2 = memd(r29+#488)
	}                                       // 8-byte Folded Reload
	{
		memh(r6+#46) = r3.h
		memh(r6+#44) = r3
	}
	{
		memh(r6+#42) = r2.h
		memh(r6+#40) = r2
	}
	{
		r3:2 = memd(r29+#480)
	}                                       // 8-byte Folded Reload
	{
		memh(r6+#38) = r3.h
		memh(r6+#36) = r3
	}
	{
		nop
		memh(r6+#34) = r2.h
		memh(r6+#32) = r2
	} :endloop1
// %bb.5:                               // %if.then.i
	{
		call ##halide_qurt_hvx_unlock_as_destructor
		r1 = #1
		r0 = memw(r29+#100)
	}                                       // 4-byte Folded Reload
	{
		r0 = #0
	}
.LBB193_6:                              // %call_destructor.exit
	{
		r17:16 = memd(r30+#-8)
		r19:18 = memd(r30+#-16)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r30+#-24)
		r23:22 = memd(r30+#-32)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r30+#-40)
		r27:26 = memd(r30+#-48)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end193:
	.size	matmul.par_for.out.s0.x.x.xy, .Lfunc_end193-matmul.par_for.out.s0.x.x.xy
                                        // -- End function
	.section	.text.matmul_argv,"ax",@progbits
	.globl	matmul_argv                     // -- Begin function matmul_argv
	.p2align	4
	.type	matmul_argv,@function
matmul_argv:                            // @matmul_argv
// %bb.0:                               // %entry
	{
		r3 = memw(r0+#0)
		r2 = memw(r0+#8)
	}
	{
		r0 = r3 ; jump ##matmul
		r1 = memw(r0+#4)
	}
.Lfunc_end194:
	.size	matmul_argv, .Lfunc_end194-matmul_argv
                                        // -- End function
	.section	.text.matmul_metadata,"ax",@progbits
	.globl	matmul_metadata                 // -- Begin function matmul_metadata
	.p2align	4
	.type	matmul_metadata,@function
matmul_metadata:                        // @matmul_metadata
// %bb.0:                               // %entry
	{
		r0 = add(pc,##.Lmatmul_metadata_storage@PCREL)
		jumpr r31
	}
.Lfunc_end195:
	.size	matmul_metadata, .Lfunc_end195-matmul_metadata
                                        // -- End function
	.type	_ZN6Halide7Runtime8Internal13custom_mallocE,@object // @_ZN6Halide7Runtime8Internal13custom_mallocE
	.data
	.weak	_ZN6Halide7Runtime8Internal13custom_mallocE
	.p2align	3
_ZN6Halide7Runtime8Internal13custom_mallocE:
	.word	halide_default_malloc
	.size	_ZN6Halide7Runtime8Internal13custom_mallocE, 4

	.type	_ZN6Halide7Runtime8Internal11custom_freeE,@object // @_ZN6Halide7Runtime8Internal11custom_freeE
	.weak	_ZN6Halide7Runtime8Internal11custom_freeE
	.p2align	3
_ZN6Halide7Runtime8Internal11custom_freeE:
	.word	halide_default_free
	.size	_ZN6Halide7Runtime8Internal11custom_freeE, 4

	.type	.L.str,@object                  // @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.string	"Error: "
	.size	.L.str, 8

	.type	_ZN6Halide7Runtime8Internal13error_handlerE,@object // @_ZN6Halide7Runtime8Internal13error_handlerE
	.data
	.weak	_ZN6Halide7Runtime8Internal13error_handlerE
	.p2align	3
_ZN6Halide7Runtime8Internal13error_handlerE:
	.word	halide_default_error
	.size	_ZN6Halide7Runtime8Internal13error_handlerE, 4

	.type	_ZN6Halide7Runtime8Internal12custom_printE,@object // @_ZN6Halide7Runtime8Internal12custom_printE
	.weak	_ZN6Halide7Runtime8Internal12custom_printE
	.p2align	3
_ZN6Halide7Runtime8Internal12custom_printE:
	.word	halide_default_print
	.size	_ZN6Halide7Runtime8Internal12custom_printE, 4

	.type	_ZN6Halide7Runtime8Internal29halide_reference_clock_initedE,@object // @_ZN6Halide7Runtime8Internal29halide_reference_clock_initedE
	.section	.bss,"aw",@nobits
	.weak	_ZN6Halide7Runtime8Internal29halide_reference_clock_initedE
_ZN6Halide7Runtime8Internal29halide_reference_clock_initedE:
	.byte	0                               // 0x0
	.size	_ZN6Halide7Runtime8Internal29halide_reference_clock_initedE, 1

	.type	_ZN6Halide7Runtime8Internal22halide_reference_clockE,@object // @_ZN6Halide7Runtime8Internal22halide_reference_clockE
	.weak	_ZN6Halide7Runtime8Internal22halide_reference_clockE
	.p2align	3
_ZN6Halide7Runtime8Internal22halide_reference_clockE:
	.space	16
	.size	_ZN6Halide7Runtime8Internal22halide_reference_clockE, 16

	.section	.fini_array,"aw",@fini_array
	.p2align	2
	.word	halide_thread_pool_cleanup
	.word	halide_profiler_shutdown
	.type	.L.str.5,@object                // @.str.5
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.5:
	.string	"/home/hassamu2/Halide/src/runtime/synchronization_common.h:387 halide_abort_if_false() failed: next != nullptr\n"
	.size	.L.str.5, 112

	.type	_ZN6Halide7Runtime8Internal15Synchronization5tableE,@object // @_ZN6Halide7Runtime8Internal15Synchronization5tableE
	.section	.bss,"aw",@nobits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization5tableE
	.p2align	3
_ZN6Halide7Runtime8Internal15Synchronization5tableE:
	.space	16384
	.size	_ZN6Halide7Runtime8Internal15Synchronization5tableE, 16384

	.type	.L.str.1,@object                // @.str.1
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.1:
	.string	"HL_NUM_THREADS"
	.size	.L.str.1, 15

	.type	.L.str.2,@object                // @.str.2
.L.str.2:
	.string	"HL_NUMTHREADS"
	.size	.L.str.2, 14

	.type	_ZN6Halide7Runtime8Internal10work_queueE,@object // @_ZN6Halide7Runtime8Internal10work_queueE
	.section	.bss,"aw",@nobits
	.weak	_ZN6Halide7Runtime8Internal10work_queueE
	.p2align	3
_ZN6Halide7Runtime8Internal10work_queueE:
	.space	8
	.word	0                               // 0x0
	.word	0                               // 0x0
	.word	0
	.word	0                               // 0x0
	.word	0                               // 0x0
	.word	0                               // 0x0
	.space	4
	.space	4
	.space	8
	.space	8
	.space	8
	.word	0                               // 0x0
	.word	0                               // 0x0
	.space	1024
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.space	2
	.word	0                               // 0x0
	.size	_ZN6Halide7Runtime8Internal10work_queueE, 1104

	.type	.L.str.3,@object                // @.str.3
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.3:
	.string	"/home/hassamu2/Halide/src/runtime/thread_pool_common.h:527 halide_abort_if_false() failed: (min_threads <= ((task_parent->task.min_threads * task_parent->active_workers) - task_parent->threads_reserved)) && \"Logic error: thread over commit.\\n\"\n"
	.size	.L.str.3, 245

	.type	_ZN6Halide7Runtime8Internal14custom_do_taskE,@object // @_ZN6Halide7Runtime8Internal14custom_do_taskE
	.data
	.weak	_ZN6Halide7Runtime8Internal14custom_do_taskE
	.p2align	3
_ZN6Halide7Runtime8Internal14custom_do_taskE:
	.word	halide_default_do_task
	.size	_ZN6Halide7Runtime8Internal14custom_do_taskE, 4

	.type	_ZN6Halide7Runtime8Internal19custom_do_loop_taskE,@object // @_ZN6Halide7Runtime8Internal19custom_do_loop_taskE
	.weak	_ZN6Halide7Runtime8Internal19custom_do_loop_taskE
	.p2align	3
_ZN6Halide7Runtime8Internal19custom_do_loop_taskE:
	.word	halide_default_do_loop_task
	.size	_ZN6Halide7Runtime8Internal19custom_do_loop_taskE, 4

	.type	_ZN6Halide7Runtime8Internal17custom_do_par_forE,@object // @_ZN6Halide7Runtime8Internal17custom_do_par_forE
	.weak	_ZN6Halide7Runtime8Internal17custom_do_par_forE
	.p2align	3
_ZN6Halide7Runtime8Internal17custom_do_par_forE:
	.word	halide_default_do_par_for
	.size	_ZN6Halide7Runtime8Internal17custom_do_par_forE, 4

	.type	_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE,@object // @_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE
	.weak	_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE
	.p2align	3
_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE:
	.word	halide_default_do_parallel_tasks
	.size	_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE, 4

	.type	_ZN6Halide7Runtime8Internal21custom_semaphore_initE,@object // @_ZN6Halide7Runtime8Internal21custom_semaphore_initE
	.weak	_ZN6Halide7Runtime8Internal21custom_semaphore_initE
	.p2align	3
_ZN6Halide7Runtime8Internal21custom_semaphore_initE:
	.word	halide_default_semaphore_init
	.size	_ZN6Halide7Runtime8Internal21custom_semaphore_initE, 4

	.type	_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE,@object // @_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE
	.weak	_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE
	.p2align	3
_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE:
	.word	halide_default_semaphore_try_acquire
	.size	_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE, 4

	.type	_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE,@object // @_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE
	.weak	_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE
	.p2align	3
_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE:
	.word	halide_default_semaphore_release
	.size	_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE, 4

	.type	.L.str.4,@object                // @.str.4
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.4:
	.string	"halide_set_num_threads: must be >= 0."
	.size	.L.str.4, 38

	.type	_ZTVN6Halide7Runtime8Internal15Synchronization21mutex_parking_controlE,@object // @_ZTVN6Halide7Runtime8Internal15Synchronization21mutex_parking_controlE
	.section	.data.rel.ro._ZTVN6Halide7Runtime8Internal15Synchronization21mutex_parking_controlE,"aGw",@progbits,_ZTVN6Halide7Runtime8Internal15Synchronization21mutex_parking_controlE,comdat
	.weak	_ZTVN6Halide7Runtime8Internal15Synchronization21mutex_parking_controlE
	.p2align	3
_ZTVN6Halide7Runtime8Internal15Synchronization21mutex_parking_controlE:
	.word	0
	.word	0
	.word	_ZN6Halide7Runtime8Internal15Synchronization21mutex_parking_control8validateERNS2_15validate_actionE
	.word	_ZN6Halide7Runtime8Internal15Synchronization15parking_control12before_sleepEv
	.word	_ZN6Halide7Runtime8Internal15Synchronization21mutex_parking_control6unparkEib
	.word	_ZN6Halide7Runtime8Internal15Synchronization15parking_control16requeue_callbackERKNS2_15validate_actionEbb
	.size	_ZTVN6Halide7Runtime8Internal15Synchronization21mutex_parking_controlE, 24

	.type	_ZTVN6Halide7Runtime8Internal15Synchronization25broadcast_parking_controlE,@object // @_ZTVN6Halide7Runtime8Internal15Synchronization25broadcast_parking_controlE
	.section	.data.rel.ro._ZTVN6Halide7Runtime8Internal15Synchronization25broadcast_parking_controlE,"aGw",@progbits,_ZTVN6Halide7Runtime8Internal15Synchronization25broadcast_parking_controlE,comdat
	.weak	_ZTVN6Halide7Runtime8Internal15Synchronization25broadcast_parking_controlE
	.p2align	3
_ZTVN6Halide7Runtime8Internal15Synchronization25broadcast_parking_controlE:
	.word	0
	.word	0
	.word	_ZN6Halide7Runtime8Internal15Synchronization25broadcast_parking_control8validateERNS2_15validate_actionE
	.word	_ZN6Halide7Runtime8Internal15Synchronization15parking_control12before_sleepEv
	.word	_ZN6Halide7Runtime8Internal15Synchronization15parking_control6unparkEib
	.word	_ZN6Halide7Runtime8Internal15Synchronization25broadcast_parking_control16requeue_callbackERKNS2_15validate_actionEbb
	.size	_ZTVN6Halide7Runtime8Internal15Synchronization25broadcast_parking_controlE, 24

	.type	_ZTVN6Halide7Runtime8Internal15Synchronization22signal_parking_controlE,@object // @_ZTVN6Halide7Runtime8Internal15Synchronization22signal_parking_controlE
	.section	.data.rel.ro._ZTVN6Halide7Runtime8Internal15Synchronization22signal_parking_controlE,"aGw",@progbits,_ZTVN6Halide7Runtime8Internal15Synchronization22signal_parking_controlE,comdat
	.weak	_ZTVN6Halide7Runtime8Internal15Synchronization22signal_parking_controlE
	.p2align	3
_ZTVN6Halide7Runtime8Internal15Synchronization22signal_parking_controlE:
	.word	0
	.word	0
	.word	_ZN6Halide7Runtime8Internal15Synchronization15parking_control8validateERNS2_15validate_actionE
	.word	_ZN6Halide7Runtime8Internal15Synchronization15parking_control12before_sleepEv
	.word	_ZN6Halide7Runtime8Internal15Synchronization22signal_parking_control6unparkEib
	.word	_ZN6Halide7Runtime8Internal15Synchronization15parking_control16requeue_callbackERKNS2_15validate_actionEbb
	.size	_ZTVN6Halide7Runtime8Internal15Synchronization22signal_parking_controlE, 24

	.type	.L.str.5.6,@object              // @.str.5.6
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.5.6:
	.string	"/home/hassamu2/Halide/src/runtime/synchronization_common.h:996 halide_abort_if_false() failed: val & 0x1\n"
	.size	.L.str.5.6, 106

	.type	_ZTVN6Halide7Runtime8Internal15Synchronization20wait_parking_controlE,@object // @_ZTVN6Halide7Runtime8Internal15Synchronization20wait_parking_controlE
	.section	.data.rel.ro._ZTVN6Halide7Runtime8Internal15Synchronization20wait_parking_controlE,"aGw",@progbits,_ZTVN6Halide7Runtime8Internal15Synchronization20wait_parking_controlE,comdat
	.weak	_ZTVN6Halide7Runtime8Internal15Synchronization20wait_parking_controlE
	.p2align	3
_ZTVN6Halide7Runtime8Internal15Synchronization20wait_parking_controlE:
	.word	0
	.word	0
	.word	_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control8validateERNS2_15validate_actionE
	.word	_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control12before_sleepEv
	.word	_ZN6Halide7Runtime8Internal15Synchronization20wait_parking_control6unparkEib
	.word	_ZN6Halide7Runtime8Internal15Synchronization15parking_control16requeue_callbackERKNS2_15validate_actionEbb
	.size	_ZTVN6Halide7Runtime8Internal15Synchronization20wait_parking_controlE, 24

	.type	.L.str.6,@object                // @.str.6
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.6:
	.string	"/home/hassamu2/Halide/src/runtime/thread_pool_common.h:155 halide_abort_if_false() failed: bytes == limit && \"Logic error in thread pool work queue initialization.\\n\"\n"
	.size	.L.str.6, 168

	.type	_ZN6Halide7Runtime8Internal17custom_get_symbolE,@object // @_ZN6Halide7Runtime8Internal17custom_get_symbolE
	.data
	.weak	_ZN6Halide7Runtime8Internal17custom_get_symbolE
	.p2align	3
_ZN6Halide7Runtime8Internal17custom_get_symbolE:
	.word	halide_default_get_symbol
	.size	_ZN6Halide7Runtime8Internal17custom_get_symbolE, 4

	.type	_ZN6Halide7Runtime8Internal19custom_load_libraryE,@object // @_ZN6Halide7Runtime8Internal19custom_load_libraryE
	.weak	_ZN6Halide7Runtime8Internal19custom_load_libraryE
	.p2align	3
_ZN6Halide7Runtime8Internal19custom_load_libraryE:
	.word	halide_default_load_library
	.size	_ZN6Halide7Runtime8Internal19custom_load_libraryE, 4

	.type	_ZN6Halide7Runtime8Internal25custom_get_library_symbolE,@object // @_ZN6Halide7Runtime8Internal25custom_get_library_symbolE
	.weak	_ZN6Halide7Runtime8Internal25custom_get_library_symbolE
	.p2align	3
_ZN6Halide7Runtime8Internal25custom_get_library_symbolE:
	.word	halide_default_get_library_symbol
	.size	_ZN6Halide7Runtime8Internal25custom_get_library_symbolE, 4

	.type	_ZN6Halide7Runtime8Internal17halide_gpu_deviceE,@object // @_ZN6Halide7Runtime8Internal17halide_gpu_deviceE
	.section	.bss,"aw",@nobits
	.weak	_ZN6Halide7Runtime8Internal17halide_gpu_deviceE
	.p2align	2
_ZN6Halide7Runtime8Internal17halide_gpu_deviceE:
	.word	0                               // 0x0
	.size	_ZN6Halide7Runtime8Internal17halide_gpu_deviceE, 4

	.type	_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE,@object // @_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE
	.weak	_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE
_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE:
	.byte	0                               // 0x0
	.size	_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE, 1

	.type	_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE,@object // @_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE
	.weak	_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE
_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE:
	.byte	0                               // 0x0
	.size	_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE, 1

	.type	.L.str.8,@object                // @.str.8
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.8:
	.string	"HL_GPU_DEVICE"
	.size	.L.str.8, 14

	.type	.L.str.11,@object               // @.str.11
.L.str.11:
	.string	"<nullptr>"
	.size	.L.str.11, 10

	.type	.L.str.1.12,@object             // @.str.1.12
.L.str.1.12:
	.string	"-nan"
	.size	.L.str.1.12, 5

	.type	.L.str.2.13,@object             // @.str.2.13
.L.str.2.13:
	.string	"nan"
	.size	.L.str.2.13, 4

	.type	.L.str.3.14,@object             // @.str.3.14
.L.str.3.14:
	.string	"-inf"
	.size	.L.str.3.14, 5

	.type	.L.str.4.15,@object             // @.str.4.15
.L.str.4.15:
	.string	"inf"
	.size	.L.str.4.15, 4

	.type	.L.str.5.16,@object             // @.str.5.16
.L.str.5.16:
	.string	"-0.000000e+00"
	.size	.L.str.5.16, 14

	.type	.L.str.6.17,@object             // @.str.6.17
.L.str.6.17:
	.string	"0.000000e+00"
	.size	.L.str.6.17, 13

	.type	.L.str.7,@object                // @.str.7
.L.str.7:
	.string	"-0.000000"
	.size	.L.str.7, 10

	.type	.L.str.8.18,@object             // @.str.8.18
.L.str.8.18:
	.string	"0.000000"
	.size	.L.str.8.18, 9

	.type	.L.str.9,@object                // @.str.9
.L.str.9:
	.string	"-"
	.size	.L.str.9, 2

	.type	.L.str.11.19,@object            // @.str.11.19
.L.str.11.19:
	.string	"e+"
	.size	.L.str.11.19, 3

	.type	.L.str.12,@object               // @.str.12
.L.str.12:
	.string	"e-"
	.size	.L.str.12, 3

	.type	.L.str.13,@object               // @.str.13
.L.str.13:
	.string	"0123456789abcdef"
	.size	.L.str.13, 17

	.type	.L.str.14,@object               // @.str.14
.L.str.14:
	.string	"int"
	.size	.L.str.14, 4

	.type	.L.str.15,@object               // @.str.15
.L.str.15:
	.string	"uint"
	.size	.L.str.15, 5

	.type	.L.str.16,@object               // @.str.16
.L.str.16:
	.string	"float"
	.size	.L.str.16, 6

	.type	.L.str.17,@object               // @.str.17
.L.str.17:
	.string	"handle"
	.size	.L.str.17, 7

	.type	.L.str.18,@object               // @.str.18
.L.str.18:
	.string	"bad_type_code"
	.size	.L.str.18, 14

	.type	.L.str.19,@object               // @.str.19
	.section	.rodata,"a",@progbits
	.p2align	5
.L.str.19:
	.string	"x"
	.size	.L.str.19, 2

	.type	.L.str.20,@object               // @.str.20
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.20:
	.string	"nullptr"
	.size	.L.str.20, 8

	.type	.L.str.21,@object               // @.str.21
.L.str.21:
	.string	"buffer("
	.size	.L.str.21, 8

	.type	.L.str.23,@object               // @.str.23
.L.str.23:
	.string	", {"
	.size	.L.str.23, 4

	.type	.L.str.24,@object               // @.str.24
.L.str.24:
	.string	"}"
	.size	.L.str.24, 2

	.type	_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE,@object // @_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE
	.data
	.weak	_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE
_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE:
	.byte	1                               // 0x1
	.size	_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE, 1

	.type	_ZN6Halide7Runtime8Internal21allocation_pools_lockE,@object // @_ZN6Halide7Runtime8Internal21allocation_pools_lockE
	.section	.bss,"aw",@nobits
	.weak	_ZN6Halide7Runtime8Internal21allocation_pools_lockE
	.p2align	3
_ZN6Halide7Runtime8Internal21allocation_pools_lockE:
	.space	8
	.size	_ZN6Halide7Runtime8Internal21allocation_pools_lockE, 8

	.type	_ZN6Halide7Runtime8Internal23device_allocation_poolsE,@object // @_ZN6Halide7Runtime8Internal23device_allocation_poolsE
	.weak	_ZN6Halide7Runtime8Internal23device_allocation_poolsE
	.p2align	3
_ZN6Halide7Runtime8Internal23device_allocation_poolsE:
	.word	0
	.size	_ZN6Halide7Runtime8Internal23device_allocation_poolsE, 4

	.type	_ZN6Halide7Runtime8Internal17device_copy_mutexE,@object // @_ZN6Halide7Runtime8Internal17device_copy_mutexE
	.weak	_ZN6Halide7Runtime8Internal17device_copy_mutexE
	.p2align	3
_ZN6Halide7Runtime8Internal17device_copy_mutexE:
	.space	8
	.size	_ZN6Halide7Runtime8Internal17device_copy_mutexE, 8

	.type	.L.str.6.22,@object             // @.str.6.22
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.6.22:
	.string	"halide_copy_to_host"
	.size	.L.str.6.22, 20

	.type	.L.str.7.23,@object             // @.str.7.23
.L.str.7.23:
	.string	"halide_copy_to_device"
	.size	.L.str.7.23, 22

	.type	.L.str.9.24,@object             // @.str.9.24
.L.str.9.24:
	.string	"halide_copy_to_device does not support switching interfaces\n"
	.size	.L.str.9.24, 61

	.type	.L.str.16.27,@object            // @.str.16.27
.L.str.16.27:
	.string	"halide_device_sync"
	.size	.L.str.16.27, 19

	.type	.L.str.17.25,@object            // @.str.17.25
.L.str.17.25:
	.string	"halide_device_malloc"
	.size	.L.str.17.25, 21

	.type	.L.str.20.26,@object            // @.str.20.26
.L.str.20.26:
	.string	"halide_device_malloc doesn't support switching interfaces\n"
	.size	.L.str.20.26, 59

	.type	.L.str.21.28,@object            // @.str.21.28
.L.str.21.28:
	.string	"halide_device_free"
	.size	.L.str.21.28, 19

	.type	.L.str.22.29,@object            // @.str.22.29
.L.str.22.29:
	.string	"/home/hassamu2/Halide/src/runtime/device_interface.cpp:252 halide_abort_if_false() failed: buf->device == 0\n"
	.size	.L.str.22.29, 109

	.type	.L.str.23.30,@object            // @.str.23.30
.L.str.23.30:
	.string	"halide_device_and_host_malloc"
	.size	.L.str.23.30, 30

	.type	.L.str.25.31,@object            // @.str.25.31
.L.str.25.31:
	.string	"halide_device_and_host_malloc doesn't support switching interfaces\n"
	.size	.L.str.25.31, 68

	.type	.L.str.26,@object               // @.str.26
.L.str.26:
	.string	"allocating host and device memory failed\n"
	.size	.L.str.26, 42

	.type	.L.str.27,@object               // @.str.27
.L.str.27:
	.string	"halide_device_and_host_free"
	.size	.L.str.27, 28

	.type	.L.str.28,@object               // @.str.28
.L.str.28:
	.string	"/home/hassamu2/Halide/src/runtime/device_interface.cpp:317 halide_abort_if_false() failed: buf->device == 0\n"
	.size	.L.str.28, 109

	.type	.L.str.29,@object               // @.str.29
.L.str.29:
	.string	"halide_default_device_and_host_malloc"
	.size	.L.str.29, 38

	.type	.L.str.30,@object               // @.str.30
.L.str.30:
	.string	"halide_default_device_and_host_free"
	.size	.L.str.30, 36

	.type	.L.str.31,@object               // @.str.31
.L.str.31:
	.string	"halide_device_wrap_native"
	.size	.L.str.31, 26

	.type	.L.str.32,@object               // @.str.32
.L.str.32:
	.string	"halide_device_wrap_native doesn't support switching interfaces\n"
	.size	.L.str.32, 64

	.type	.L.str.33,@object               // @.str.33
.L.str.33:
	.string	"halide_device_detach_native"
	.size	.L.str.33, 28

	.type	.L.str.34,@object               // @.str.34
.L.str.34:
	.string	"/home/hassamu2/Halide/src/runtime/device_interface.cpp:403 halide_abort_if_false() failed: buf->device == 0\n"
	.size	.L.str.34, 109

	.type	.L.str.35,@object               // @.str.35
.L.str.35:
	.string	"halide_default_device_detach_native"
	.size	.L.str.35, 36

	.type	.L.str.41,@object               // @.str.41
.L.str.41:
	.string	"halide_buffer_copy does not support switching device interfaces"
	.size	.L.str.41, 64

	.type	.L.str.58,@object               // @.str.58
.L.str.58:
	.string	"device_interface does not support cropping\n"
	.size	.L.str.58, 44

	.type	.L.str.59,@object               // @.str.59
.L.str.59:
	.string	"device_interface does not support slicing\n"
	.size	.L.str.59, 43

	.type	.L.str.60,@object               // @.str.60
.L.str.60:
	.string	"destination buffer already has a device allocation\n"
	.size	.L.str.60, 52

	.type	.L.str.61,@object               // @.str.61
.L.str.61:
	.string	"src and dst must have identical dimensionality\n"
	.size	.L.str.61, 48

	.type	.L.str.64,@object               // @.str.64
.L.str.64:
	.string	"dst must have exactly one fewer dimension than src\n"
	.size	.L.str.64, 52

	.type	.L.str.36,@object               // @.str.36
.L.str.36:
	.string	"Bounds inference call to external stage "
	.size	.L.str.36, 41

	.type	.L.str.1.37,@object             // @.str.1.37
.L.str.1.37:
	.string	" returned non-zero value: "
	.size	.L.str.1.37, 27

	.type	.L.str.2.38,@object             // @.str.2.38
.L.str.2.38:
	.string	"Call to external stage "
	.size	.L.str.2.38, 24

	.type	.L.str.3.39,@object             // @.str.3.39
.L.str.3.39:
	.string	"Bounds given for "
	.size	.L.str.3.39, 18

	.type	.L.str.4.40,@object             // @.str.4.40
.L.str.4.40:
	.string	" in "
	.size	.L.str.4.40, 5

	.type	.L.str.5.41,@object             // @.str.5.41
.L.str.5.41:
	.string	" (from "
	.size	.L.str.5.41, 8

	.type	.L.str.6.42,@object             // @.str.6.42
.L.str.6.42:
	.string	" to "
	.size	.L.str.6.42, 5

	.type	.L.str.7.43,@object             // @.str.7.43
.L.str.7.43:
	.string	") do not cover required region (from "
	.size	.L.str.7.43, 38

	.type	.L.str.8.44,@object             // @.str.8.44
.L.str.8.44:
	.string	")"
	.size	.L.str.8.44, 2

	.type	.L.str.9.45,@object             // @.str.9.45
.L.str.9.45:
	.string	" has type "
	.size	.L.str.9.45, 11

	.type	.L.str.10.46,@object            // @.str.10.46
.L.str.10.46:
	.string	" but type of the buffer passed in is "
	.size	.L.str.10.46, 38

	.type	.L.str.11.47,@object            // @.str.11.47
.L.str.11.47:
	.string	" requires a buffer of exactly "
	.size	.L.str.11.47, 31

	.type	.L.str.12.48,@object            // @.str.12.48
.L.str.12.48:
	.string	" dimensions, but the buffer passed in has "
	.size	.L.str.12.48, 43

	.type	.L.str.13.49,@object            // @.str.13.49
.L.str.13.49:
	.string	" dimensions"
	.size	.L.str.13.49, 12

	.type	.L.str.14.50,@object            // @.str.14.50
.L.str.14.50:
	.string	" is accessed at "
	.size	.L.str.14.50, 17

	.type	.L.str.15.51,@object            // @.str.15.51
.L.str.15.51:
	.string	", which is before the min ("
	.size	.L.str.15.51, 28

	.type	.L.str.16.52,@object            // @.str.16.52
.L.str.16.52:
	.string	") in dimension "
	.size	.L.str.16.52, 16

	.type	.L.str.17.53,@object            // @.str.17.53
.L.str.17.53:
	.string	", which is beyond the max ("
	.size	.L.str.17.53, 28

	.type	.L.str.18.54,@object            // @.str.18.54
.L.str.18.54:
	.string	"Total allocation for buffer "
	.size	.L.str.18.54, 29

	.type	.L.str.19.55,@object            // @.str.19.55
.L.str.19.55:
	.string	" is "
	.size	.L.str.19.55, 5

	.type	.L.str.20.56,@object            // @.str.20.56
.L.str.20.56:
	.string	", which exceeds the maximum size of "
	.size	.L.str.20.56, 37

	.type	.L.str.21.57,@object            // @.str.21.57
.L.str.21.57:
	.string	"The extents for buffer "
	.size	.L.str.21.57, 24

	.type	.L.str.22.58,@object            // @.str.22.58
.L.str.22.58:
	.string	" dimension "
	.size	.L.str.22.58, 12

	.type	.L.str.23.59,@object            // @.str.23.59
.L.str.23.59:
	.string	" is negative ("
	.size	.L.str.23.59, 15

	.type	.L.str.24.60,@object            // @.str.24.60
.L.str.24.60:
	.string	"Product of extents for buffer "
	.size	.L.str.24.60, 31

	.type	.L.str.25.61,@object            // @.str.25.61
.L.str.25.61:
	.string	"Applying the constraints on "
	.size	.L.str.25.61, 29

	.type	.L.str.26.62,@object            // @.str.26.62
.L.str.26.62:
	.string	" to the required region made it smaller in dimension "
	.size	.L.str.26.62, 54

	.type	.L.str.27.63,@object            // @.str.27.63
.L.str.27.63:
	.string	". "
	.size	.L.str.27.63, 3

	.type	.L.str.28.64,@object            // @.str.28.64
.L.str.28.64:
	.string	"Required size: "
	.size	.L.str.28.64, 16

	.type	.L.str.29.65,@object            // @.str.29.65
.L.str.29.65:
	.string	"Constrained size: "
	.size	.L.str.29.65, 19

	.type	.L.str.30.66,@object            // @.str.30.66
.L.str.30.66:
	.string	"."
	.size	.L.str.30.66, 2

	.type	.L.str.31.67,@object            // @.str.31.67
.L.str.31.67:
	.string	"Constraint violated: "
	.size	.L.str.31.67, 22

	.type	.L.str.32.68,@object            // @.str.32.68
.L.str.32.68:
	.string	" ("
	.size	.L.str.32.68, 3

	.type	.L.str.33.69,@object            // @.str.33.69
.L.str.33.69:
	.string	") == "
	.size	.L.str.33.69, 6

	.type	.L.str.34.70,@object            // @.str.34.70
.L.str.34.70:
	.string	"Parameter "
	.size	.L.str.34.70, 11

	.type	.L.str.35.71,@object            // @.str.35.71
.L.str.35.71:
	.string	" but must be at least "
	.size	.L.str.35.71, 23

	.type	.L.str.36.72,@object            // @.str.36.72
.L.str.36.72:
	.string	" but must be at most "
	.size	.L.str.36.72, 22

	.type	.L.str.37,@object               // @.str.37
.L.str.37:
	.string	"Out of memory (halide_malloc returned nullptr)"
	.size	.L.str.37, 47

	.type	.L.str.38,@object               // @.str.38
.L.str.38:
	.string	"Buffer argument "
	.size	.L.str.38, 17

	.type	.L.str.39,@object               // @.str.39
.L.str.39:
	.string	" is nullptr"
	.size	.L.str.39, 12

	.type	.L.str.40,@object               // @.str.40
.L.str.40:
	.string	"Failed to dump function "
	.size	.L.str.40, 25

	.type	.L.str.41.73,@object            // @.str.41.73
.L.str.41.73:
	.string	" to file "
	.size	.L.str.41.73, 10

	.type	.L.str.42,@object               // @.str.42
.L.str.42:
	.string	" with error "
	.size	.L.str.42, 13

	.type	.L.str.43,@object               // @.str.43
.L.str.43:
	.string	"The host pointer of "
	.size	.L.str.43, 21

	.type	.L.str.44,@object               // @.str.44
.L.str.44:
	.string	" is not aligned to a "
	.size	.L.str.44, 22

	.type	.L.str.45,@object               // @.str.45
.L.str.45:
	.string	" bytes boundary."
	.size	.L.str.45, 17

	.type	.L.str.46,@object               // @.str.46
.L.str.46:
	.string	"The buffer "
	.size	.L.str.46, 12

	.type	.L.str.47,@object               // @.str.47
.L.str.47:
	.string	" is dirty on device, but this pipeline was compiled "
	.size	.L.str.47, 53

	.type	.L.str.48,@object               // @.str.48
.L.str.48:
	.string	"with no support for device to host copies."
	.size	.L.str.48, 43

	.type	.L.str.49,@object               // @.str.49
.L.str.49:
	.string	" is null, but the pipeline will access it on the host."
	.size	.L.str.49, 55

	.type	.L.str.50,@object               // @.str.50
.L.str.50:
	.string	"The folded storage dimension "
	.size	.L.str.50, 30

	.type	.L.str.51,@object               // @.str.51
.L.str.51:
	.string	" of "
	.size	.L.str.51, 5

	.type	.L.str.52,@object               // @.str.52
.L.str.52:
	.string	" was accessed out of order by loop "
	.size	.L.str.52, 36

	.type	.L.str.53,@object               // @.str.53
.L.str.53:
	.string	"Cannot fold dimension "
	.size	.L.str.53, 23

	.type	.L.str.54,@object               // @.str.54
.L.str.54:
	.string	" because an extern stage accesses ["
	.size	.L.str.54, 36

	.type	.L.str.55,@object               // @.str.55
.L.str.55:
	.string	", "
	.size	.L.str.55, 3

	.type	.L.str.56,@object               // @.str.56
.L.str.56:
	.string	"],"
	.size	.L.str.56, 3

	.type	.L.str.57,@object               // @.str.57
.L.str.57:
	.string	" which is outside the range currently valid: ["
	.size	.L.str.57, 47

	.type	.L.str.58.74,@object            // @.str.58.74
.L.str.58.74:
	.string	"]."
	.size	.L.str.58.74, 3

	.type	.L.str.59.75,@object            // @.str.59.75
.L.str.59.75:
	.string	" which wraps around the boundary of the fold, "
	.size	.L.str.59.75, 47

	.type	.L.str.60.76,@object            // @.str.60.76
.L.str.60.76:
	.string	"which occurs at multiples of "
	.size	.L.str.60.76, 30

	.type	.L.str.61.77,@object            // @.str.61.77
.L.str.61.77:
	.string	"The fold factor ("
	.size	.L.str.61.77, 18

	.type	.L.str.62,@object               // @.str.62
.L.str.62:
	.string	") of dimension "
	.size	.L.str.62, 16

	.type	.L.str.63,@object               // @.str.63
.L.str.63:
	.string	" is too small to store the required region accessed by loop "
	.size	.L.str.63, 61

	.type	.L.str.64.78,@object            // @.str.64.78
.L.str.64.78:
	.string	")."
	.size	.L.str.64.78, 3

	.type	.L.str.65,@object               // @.str.65
.L.str.65:
	.string	"Requirement Failed: ("
	.size	.L.str.65, 22

	.type	.L.str.66,@object               // @.str.66
.L.str.66:
	.string	") "
	.size	.L.str.66, 3

	.type	.L.str.67,@object               // @.str.67
.L.str.67:
	.string	"A schedule specialized with specialize_fail() was chosen: "
	.size	.L.str.67, 59

	.type	.L.str.68,@object               // @.str.68
.L.str.68:
	.string	"Buffer has a non-zero device but no device interface.\n"
	.size	.L.str.68, 55

	.type	.L.str.69,@object               // @.str.69
.L.str.69:
	.string	"Buffer has a non-null device_interface but device is 0.\n"
	.size	.L.str.69, 57

	.type	.L.str.70,@object               // @.str.70
.L.str.70:
	.string	"Buffer has both host and device dirty bits set.\n"
	.size	.L.str.70, 49

	.type	.L.str.71,@object               // @.str.71
.L.str.71:
	.string	"Buffer pointer passed to "
	.size	.L.str.71, 26

	.type	.L.str.72,@object               // @.str.72
.L.str.72:
	.string	" is null.\n"
	.size	.L.str.72, 11

	.type	.L.str.73,@object               // @.str.73
.L.str.73:
	.string	"The explicit allocation bound ("
	.size	.L.str.73, 32

	.type	.L.str.74,@object               // @.str.74
.L.str.74:
	.string	" is too small to store the required region ("
	.size	.L.str.74, 45

	.type	.L.str.75,@object               // @.str.75
.L.str.75:
	.string	"Buffer could not be cropped (runtime error or unimplemented device option).\n"
	.size	.L.str.75, 77

	.type	_ZZ25halide_profiler_get_stateE1s,@object // @_ZZ25halide_profiler_get_stateE1s
	.data
	.p2align	3
_ZZ25halide_profiler_get_stateE1s:
	.space	8
	.word	1                               // 0x1
	.word	0                               // 0x0
	.word	0                               // 0x0
	.word	0                               // 0x0
	.word	0
	.word	0
	.word	0
	.space	4
	.size	_ZZ25halide_profiler_get_stateE1s, 40

	.type	.L.str.111,@object              // @.str.111
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.111:
	.string	"/home/hassamu2/Halide/src/runtime/profiler.cpp:207 halide_abort_if_false() failed: p_stats != nullptr\n"
	.size	.L.str.111, 103

	.type	.L.str.1.112,@object            // @.str.1.112
.L.str.1.112:
	.string	"/home/hassamu2/Halide/src/runtime/profiler.cpp:234 halide_abort_if_false() failed: p_stats != nullptr\n"
	.size	.L.str.1.112, 103

	.type	.L.str.2.113,@object            // @.str.2.113
.L.str.2.113:
	.string	"/home/hassamu2/Halide/src/runtime/profiler.cpp:235 halide_abort_if_false() failed: func_id >= 0\n"
	.size	.L.str.2.113, 97

	.type	.L.str.3.114,@object            // @.str.3.114
.L.str.3.114:
	.string	"/home/hassamu2/Halide/src/runtime/profiler.cpp:236 halide_abort_if_false() failed: func_id < p_stats->num_funcs\n"
	.size	.L.str.3.114, 113

	.type	.L.str.4.115,@object            // @.str.4.115
.L.str.4.115:
	.string	"/home/hassamu2/Halide/src/runtime/profiler.cpp:270 halide_abort_if_false() failed: p_stats != nullptr\n"
	.size	.L.str.4.115, 103

	.type	.L.str.5.116,@object            // @.str.5.116
.L.str.5.116:
	.string	"/home/hassamu2/Halide/src/runtime/profiler.cpp:271 halide_abort_if_false() failed: func_id >= 0\n"
	.size	.L.str.5.116, 97

	.type	.L.str.6.117,@object            // @.str.6.117
.L.str.6.117:
	.string	"/home/hassamu2/Halide/src/runtime/profiler.cpp:272 halide_abort_if_false() failed: func_id < p_stats->num_funcs\n"
	.size	.L.str.6.117, 113

	.type	.L.str.7.89,@object             // @.str.7.89
.L.str.7.89:
	.string	"\n"
	.size	.L.str.7.89, 2

	.type	.L.str.8.90,@object             // @.str.8.90
.L.str.8.90:
	.string	" total time: "
	.size	.L.str.8.90, 14

	.type	.L.str.9.91,@object             // @.str.9.91
.L.str.9.91:
	.string	" ms"
	.size	.L.str.9.91, 4

	.type	.L.str.10.92,@object            // @.str.10.92
.L.str.10.92:
	.string	"  samples: "
	.size	.L.str.10.92, 12

	.type	.L.str.11.93,@object            // @.str.11.93
.L.str.11.93:
	.string	"  runs: "
	.size	.L.str.11.93, 9

	.type	.L.str.12.94,@object            // @.str.12.94
.L.str.12.94:
	.string	"  time/run: "
	.size	.L.str.12.94, 13

	.type	.L.str.13.95,@object            // @.str.13.95
.L.str.13.95:
	.string	" ms\n"
	.size	.L.str.13.95, 5

	.type	.L.str.14.96,@object            // @.str.14.96
.L.str.14.96:
	.string	" average threads used: "
	.size	.L.str.14.96, 24

	.type	.L.str.15.97,@object            // @.str.15.97
.L.str.15.97:
	.string	" heap allocations: "
	.size	.L.str.15.97, 20

	.type	.L.str.16.98,@object            // @.str.16.98
.L.str.16.98:
	.string	"  peak heap usage: "
	.size	.L.str.16.98, 20

	.type	.L.str.17.99,@object            // @.str.17.99
.L.str.17.99:
	.string	" bytes\n"
	.size	.L.str.17.99, 8

	.type	.L.str.18.100,@object           // @.str.18.100
.L.str.18.100:
	.string	"  "
	.size	.L.str.18.100, 3

	.type	.L.str.19.101,@object           // @.str.19.101
.L.str.19.101:
	.string	": "
	.size	.L.str.19.101, 3

	.type	.L.str.20.102,@object           // @.str.20.102
.L.str.20.102:
	.string	" "
	.size	.L.str.20.102, 2

	.type	.L.str.21.103,@object           // @.str.21.103
.L.str.21.103:
	.string	"ms"
	.size	.L.str.21.103, 3

	.type	.L.str.22.104,@object           // @.str.22.104
.L.str.22.104:
	.string	"("
	.size	.L.str.22.104, 2

	.type	.L.str.23.105,@object           // @.str.23.105
.L.str.23.105:
	.string	"%)"
	.size	.L.str.23.105, 3

	.type	.L.str.24.106,@object           // @.str.24.106
.L.str.24.106:
	.string	"threads: "
	.size	.L.str.24.106, 10

	.type	.L.str.25.107,@object           // @.str.25.107
.L.str.25.107:
	.string	" peak: "
	.size	.L.str.25.107, 8

	.type	.L.str.26.108,@object           // @.str.26.108
.L.str.26.108:
	.string	" num: "
	.size	.L.str.26.108, 7

	.type	.L.str.27.109,@object           // @.str.27.109
.L.str.27.109:
	.string	" avg: "
	.size	.L.str.27.109, 7

	.type	.L.str.28.110,@object           // @.str.28.110
.L.str.28.110:
	.string	" stack: "
	.size	.L.str.28.110, 9

	.type	.L.str.4.122,@object            // @.str.4.122
.L.str.4.122:
	.string	"qurt_hvx_lock failed\n"
	.size	.L.str.4.122, 22

	.type	.L.str.6.124,@object            // @.str.6.124
.L.str.6.124:
	.string	"qurt_hvx_unlock failed\n"
	.size	.L.str.6.124, 24

	.type	.L.str.7.123,@object            // @.str.7.123
.L.str.7.123:
	.string	"Printer buffer allocation failed.\n"
	.size	.L.str.7.123, 35

	.type	_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE,@object // @_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE
	.data
	.weak	_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE
	.p2align	3
_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE:
	.word	halide_default_can_use_target_features
	.size	_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE, 4

	.type	_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE,@object // @_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE
	.section	.bss,"aw",@nobits
	.weak	_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE
	.p2align	3
_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE:
	.space	32
	.size	_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE, 32

	.type	_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE,@object // @_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE
	.weak	_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE
_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE:
	.byte	0                               // 0x0
	.size	_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE, 1

	.type	_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE,@object // @_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE
	.weak	_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE
	.p2align	3
_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE:
	.space	8
	.size	_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE, 8

	.type	.L.str.125,@object              // @.str.125
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.125:
	.string	"Internal error: wrong structure size passed to halide_can_use_target_features()\n"
	.size	.L.str.125, 81

	.type	.Lstr,@object                   // @str
	.section	.rodata,"a",@progbits
	.p2align	5
.Lstr:
	.string	"out"
	.size	.Lstr, 4

	.type	.Lstr.132,@object               // @str.132
	.p2align	5
.Lstr.132:
	.string	"B"
	.size	.Lstr.132, 2

	.type	.Lstr.133,@object               // @str.133
	.p2align	5
.Lstr.133:
	.string	"A"
	.size	.Lstr.133, 2

	.type	.Lstr.134,@object               // @str.134
	.p2align	5
.Lstr.134:
	.string	"Input buffer A"
	.size	.Lstr.134, 15

	.type	.Lstr.135,@object               // @str.135
	.p2align	5
.Lstr.135:
	.string	"Input buffer B"
	.size	.Lstr.135, 15

	.type	.Lstr.136,@object               // @str.136
	.p2align	5
.Lstr.136:
	.string	"Output buffer out"
	.size	.Lstr.136, 18

	.type	.Lstr.137,@object               // @str.137
	.p2align	5
.Lstr.137:
	.string	"A.stride.0"
	.size	.Lstr.137, 11

	.type	.Lstr.138,@object               // @str.138
	.p2align	5
.Lstr.138:
	.string	"1"
	.size	.Lstr.138, 2

	.type	.Lstr.139,@object               // @str.139
	.p2align	5
.Lstr.139:
	.string	"B.stride.0"
	.size	.Lstr.139, 11

	.type	.Lstr.140,@object               // @str.140
	.p2align	5
.Lstr.140:
	.string	"out.stride.0"
	.size	.Lstr.140, 13

	.type	.Lstr.141,@object               // @str.141
	.p2align	5
.Lstr.141:
	.string	"y"
	.size	.Lstr.141, 2

	.type	.L__unnamed_1,@object           // @0
	.p2align	2
.L__unnamed_1:
	.space	16
	.size	.L__unnamed_1, 16

	.type	.L__unnamed_2,@object           // @1
	.p2align	2
.L__unnamed_2:
	.space	16
	.size	.L__unnamed_2, 16

	.type	.L__unnamed_3,@object           // @2
	.p2align	3
.L__unnamed_3:
	.word	0                               // 0x0
	.word	0
	.size	.L__unnamed_3, 8

	.type	.L__unnamed_4,@object           // @3
	.p2align	3
.L__unnamed_4:
	.word	128                             // 0x80
	.word	0
	.size	.L__unnamed_4, 8

	.type	.L__unnamed_5,@object           // @4
	.p2align	3
.L__unnamed_5:
	.word	0                               // 0x0
	.word	0
	.size	.L__unnamed_5, 8

	.type	.L__unnamed_6,@object           // @5
	.p2align	3
.L__unnamed_6:
	.word	128                             // 0x80
	.word	0
	.size	.L__unnamed_6, 8

	.type	.L__unnamed_7,@object           // @6
	.section	.data.rel.ro,"aw",@progbits
	.p2align	2
.L__unnamed_7:
	.word	.L__unnamed_3
	.word	.L__unnamed_4
	.word	.L__unnamed_5
	.word	.L__unnamed_6
	.size	.L__unnamed_7, 16

	.type	.L__unnamed_8,@object           // @7
	.p2align	4
.L__unnamed_8:
	.word	.Lstr.133
	.word	1                               // 0x1
	.word	2                               // 0x2
	.byte	1                               // 0x1
	.byte	16                              // 0x10
	.half	1                               // 0x1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	.L__unnamed_1
	.word	.Lstr.132
	.word	1                               // 0x1
	.word	2                               // 0x2
	.byte	1                               // 0x1
	.byte	16                              // 0x10
	.half	1                               // 0x1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	.L__unnamed_2
	.word	.Lstr
	.word	2                               // 0x2
	.word	2                               // 0x2
	.byte	1                               // 0x1
	.byte	16                              // 0x10
	.half	1                               // 0x1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	.L__unnamed_7
	.size	.L__unnamed_8, 108

	.type	.Lstr.143,@object               // @str.143
	.section	.rodata,"a",@progbits
	.p2align	5
.Lstr.143:
	.string	"hexagon-64-linux-hvx-hvx_128"
	.size	.Lstr.143, 29

	.type	.Lstr.144,@object               // @str.144
	.p2align	5
.Lstr.144:
	.string	"matmul"
	.size	.Lstr.144, 7

	.type	.Lmatmul_metadata_storage,@object // @matmul_metadata_storage
	.section	.data.rel.ro,"aw",@progbits
	.p2align	4
.Lmatmul_metadata_storage:
	.word	1                               // 0x1
	.word	3                               // 0x3
	.word	.L__unnamed_8
	.word	.Lstr.143
	.word	.Lstr.144
	.size	.Lmatmul_metadata_storage, 20

	.type	.Lswitch.table.halide_type_to_string,@object // @switch.table.halide_type_to_string
	.p2align	2
.Lswitch.table.halide_type_to_string:
	.word	.L.str.14
	.word	.L.str.15
	.word	.L.str.16
	.word	.L.str.17
	.size	.Lswitch.table.halide_type_to_string, 16

	.ident	"clang version 13.0.0 (https://github.com/llvm/llvm-project.git d7b669b3a30345cfcdb2fde2af6f48aa4b94845d)"
	.ident	"clang version 13.0.0 (https://github.com/llvm/llvm-project.git d7b669b3a30345cfcdb2fde2af6f48aa4b94845d)"
	.ident	"clang version 13.0.0 (https://github.com/llvm/llvm-project.git d7b669b3a30345cfcdb2fde2af6f48aa4b94845d)"
	.ident	"clang version 13.0.0 (https://github.com/llvm/llvm-project.git d7b669b3a30345cfcdb2fde2af6f48aa4b94845d)"
	.ident	"clang version 13.0.0 (https://github.com/llvm/llvm-project.git d7b669b3a30345cfcdb2fde2af6f48aa4b94845d)"
	.ident	"clang version 13.0.0 (https://github.com/llvm/llvm-project.git d7b669b3a30345cfcdb2fde2af6f48aa4b94845d)"
	.ident	"clang version 13.0.0 (https://github.com/llvm/llvm-project.git d7b669b3a30345cfcdb2fde2af6f48aa4b94845d)"
	.ident	"clang version 13.0.0 (https://github.com/llvm/llvm-project.git d7b669b3a30345cfcdb2fde2af6f48aa4b94845d)"
	.ident	"clang version 13.0.0 (https://github.com/llvm/llvm-project.git d7b669b3a30345cfcdb2fde2af6f48aa4b94845d)"
	.ident	"clang version 13.0.0 (https://github.com/llvm/llvm-project.git d7b669b3a30345cfcdb2fde2af6f48aa4b94845d)"
	.ident	"clang version 13.0.0 (https://github.com/llvm/llvm-project.git d7b669b3a30345cfcdb2fde2af6f48aa4b94845d)"
	.ident	"clang version 13.0.0 (https://github.com/llvm/llvm-project.git d7b669b3a30345cfcdb2fde2af6f48aa4b94845d)"
	.ident	"clang version 13.0.0 (https://github.com/llvm/llvm-project.git d7b669b3a30345cfcdb2fde2af6f48aa4b94845d)"
	.ident	"clang version 13.0.0 (https://github.com/llvm/llvm-project.git d7b669b3a30345cfcdb2fde2af6f48aa4b94845d)"
	.ident	"clang version 13.0.0 (https://github.com/llvm/llvm-project.git d7b669b3a30345cfcdb2fde2af6f48aa4b94845d)"
	.ident	"clang version 13.0.0 (https://github.com/llvm/llvm-project.git d7b669b3a30345cfcdb2fde2af6f48aa4b94845d)"
	.ident	"clang version 13.0.0 (https://github.com/llvm/llvm-project.git d7b669b3a30345cfcdb2fde2af6f48aa4b94845d)"
	.ident	"clang version 13.0.0 (https://github.com/llvm/llvm-project.git d7b669b3a30345cfcdb2fde2af6f48aa4b94845d)"
	.ident	"clang version 13.0.0 (https://github.com/llvm/llvm-project.git d7b669b3a30345cfcdb2fde2af6f48aa4b94845d)"
	.ident	"clang version 13.0.0 (https://github.com/llvm/llvm-project.git d7b669b3a30345cfcdb2fde2af6f48aa4b94845d)"
	.ident	"clang version 13.0.0 (https://github.com/llvm/llvm-project.git d7b669b3a30345cfcdb2fde2af6f48aa4b94845d)"
	.ident	"clang version 13.0.0 (https://github.com/llvm/llvm-project.git d7b669b3a30345cfcdb2fde2af6f48aa4b94845d)"
	.ident	"clang version 13.0.0 (https://github.com/llvm/llvm-project.git d7b669b3a30345cfcdb2fde2af6f48aa4b94845d)"
	.ident	"clang version 13.0.0 (https://github.com/llvm/llvm-project.git d7b669b3a30345cfcdb2fde2af6f48aa4b94845d)"
	.ident	"clang version 13.0.0 (https://github.com/llvm/llvm-project.git d7b669b3a30345cfcdb2fde2af6f48aa4b94845d)"
	.ident	"clang version 13.0.0 (https://github.com/llvm/llvm-project.git d7b669b3a30345cfcdb2fde2af6f48aa4b94845d)"
	.section	".note.GNU-stack","",@progbits
