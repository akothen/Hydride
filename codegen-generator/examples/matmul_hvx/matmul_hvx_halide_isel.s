	.text
	.file	"qurt_allocator.cpp"
	.section	.text._ZN6Halide7Runtime8Internal14aligned_mallocEjj,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal14aligned_mallocEjj // -- Begin function _ZN6Halide7Runtime8Internal14aligned_mallocEjj
	.p2align	4
	.type	_ZN6Halide7Runtime8Internal14aligned_mallocEjj,@function
_ZN6Halide7Runtime8Internal14aligned_mallocEjj: // @_ZN6Halide7Runtime8Internal14aligned_mallocEjj
// %bb.0:                               // %entry
	{
		r2 = add(r0,add(r1,#-1))
		r16 = r0
		memd(r29+#-16) = r17:16
		allocframe(#8)
	}                                       // 8-byte Folded Spill
	{
		r17 = sub(#0,r16)
	}
	{
		r0 = and(r2,r17)
	}
	{
		call ##malloc
		r0 = add(r0,r16)
	}
	{
		r1 = add(r16,add(r0,#3))
		p0 = cmp.eq(r0,#0)
	}
	{
		r2 = and(r1,r17)
		r17:16 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r1 = mux(p0,#0,r2)
		if (!p0) memw(r2+##-4) = r0
	}
	{
		r0 = r1
		dealloc_return
	}
.Lfunc_end0:
	.size	_ZN6Halide7Runtime8Internal14aligned_mallocEjj, .Lfunc_end0-_ZN6Halide7Runtime8Internal14aligned_mallocEjj
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal12aligned_freeEPv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal12aligned_freeEPv // -- Begin function _ZN6Halide7Runtime8Internal12aligned_freeEPv
	.p2align	4
	.type	_ZN6Halide7Runtime8Internal12aligned_freeEPv,@function
_ZN6Halide7Runtime8Internal12aligned_freeEPv: // @_ZN6Halide7Runtime8Internal12aligned_freeEPv
// %bb.0:                               // %entry
	{
		p0 = cmp.eq(r0,#0)
		if (p0.new) jumpr:nt r31
	}
.LBB1_1:                                // %if.then
	{
		jump ##free
		r0 = memw(r0+#-4)
	}
.Lfunc_end1:
	.size	_ZN6Halide7Runtime8Internal12aligned_freeEPv, .Lfunc_end1-_ZN6Halide7Runtime8Internal12aligned_freeEPv
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal24halide_allocator_cleanupEv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal24halide_allocator_cleanupEv // -- Begin function _ZN6Halide7Runtime8Internal24halide_allocator_cleanupEv
	.p2align	4
	.type	_ZN6Halide7Runtime8Internal24halide_allocator_cleanupEv,@function
_ZN6Halide7Runtime8Internal24halide_allocator_cleanupEv: // @_ZN6Halide7Runtime8Internal24halide_allocator_cleanupEv
// %bb.0:                               // %entry
	{
		r0 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		memd(r29+#-16) = r17:16
		allocframe(#8)
	}                                       // 8-byte Folded Spill
	{
		r16 = memw(r0+##_ZN6Halide7Runtime8Internal7mem_bufE@GOT)
	}
	{
		call ##_ZN6Halide7Runtime8Internal12aligned_freeEPv
		r0 = memw(r16+#0)
	}
	{
		call ##_ZN6Halide7Runtime8Internal12aligned_freeEPv
		r0 = memw(r16+#4)
	}
	{
		call ##_ZN6Halide7Runtime8Internal12aligned_freeEPv
		r0 = memw(r16+#8)
	}
	{
		call ##_ZN6Halide7Runtime8Internal12aligned_freeEPv
		r0 = memw(r16+#12)
	}
	{
		call ##_ZN6Halide7Runtime8Internal12aligned_freeEPv
		r0 = memw(r16+#16)
	}
	{
		call ##_ZN6Halide7Runtime8Internal12aligned_freeEPv
		r0 = memw(r16+#20)
	}
	{
		call ##_ZN6Halide7Runtime8Internal12aligned_freeEPv
		r0 = memw(r16+#24)
	}
	{
		call ##_ZN6Halide7Runtime8Internal12aligned_freeEPv
		r0 = memw(r16+#28)
	}
	{
		call ##_ZN6Halide7Runtime8Internal12aligned_freeEPv
		r0 = memw(r16+#32)
	}
	{
		r0 = memw(r16+#36)
		r17:16 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		jump ##_ZN6Halide7Runtime8Internal12aligned_freeEPv
		r31:30 = deallocframe(r30):raw
	}
.Lfunc_end2:
	.size	_ZN6Halide7Runtime8Internal24halide_allocator_cleanupEv, .Lfunc_end2-_ZN6Halide7Runtime8Internal24halide_allocator_cleanupEv
                                        // -- End function
	.section	.text.halide_default_malloc,"ax",@progbits
	.weak	halide_default_malloc           // -- Begin function halide_default_malloc
	.p2align	4
	.type	halide_default_malloc,@function
halide_default_malloc:                  // @halide_default_malloc
// %bb.0:                               // %entry
	{
		p0 = cmp.gtu(r1,##65536)
		memd(r29+#-16) = r17:16
		allocframe(#8)
	}                                       // 8-byte Folded Spill
	{
		if (p0) jump:nt .LBB3_27
	}
// %bb.1:
	{
		r3 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		r4 = #1
	}
	.p2align	4
.LBB3_2:                                // %cmpxchg.start
                                        // =>This Inner Loop Header: Depth=1
	{
		r0 = add(r3,##_ZN6Halide7Runtime8Internal11buf_is_usedE@GOT)
	}
	{
		r2 = memw(r0+#0)
	}
	{
		r2 = memw_locked(r2)
	}
	{
		r2 = add(r3,##_ZN6Halide7Runtime8Internal7mem_bufE@GOT)
		p0 = cmp.eq(r2,#0); if (!p0.new) jump:nt .LBB3_3
	}
// %bb.22:                              // %cmpxchg.trystore
                                        //   in Loop: Header=BB3_2 Depth=1
	{
		r0 = memw(r0+#0)
	}
	{
		memw_locked(r0,p0) = r4
	}
	{
		if (!p0) jump:nt .LBB3_2
		r16 = memw(r2+#0)
	}
	{
		jump .LBB3_23
	}
.LBB3_3:
	{
		r3 = #1
	}
	.p2align	4
.LBB3_4:                                // %cmpxchg.start9
                                        // =>This Inner Loop Header: Depth=1
	{
		r4 = memw(r0+#0)
	}
	{
		r4 = add(r4,#4)
	}
	{
		r4 = memw_locked(r4)
	}
	{
		p0 = cmp.eq(r4,#0); if (!p0.new) jump:nt .LBB3_5
	}
// %bb.25:                              // %cmpxchg.trystore7
                                        //   in Loop: Header=BB3_4 Depth=1
	{
		r4 = memw(r0+#0)
	}
	{
		r4 = add(r4,#4)
	}
	{
		memw_locked(r4,p0) = r3
	}
	{
		if (!p0) jump:nt .LBB3_4
		r4 = memw(r2+#0)
	}
// %bb.26:
	{
		r16 = add(r4,#4)
		jump .LBB3_23
	}
.LBB3_5:
	{
		r3 = #1
	}
	.p2align	4
.LBB3_6:                                // %cmpxchg.start26
                                        // =>This Inner Loop Header: Depth=1
	{
		r4 = memw(r0+#0)
	}
	{
		r4 = add(r4,#8)
	}
	{
		r4 = memw_locked(r4)
	}
	{
		p0 = cmp.eq(r4,#0); if (!p0.new) jump:nt .LBB3_7
	}
// %bb.28:                              // %cmpxchg.trystore24
                                        //   in Loop: Header=BB3_6 Depth=1
	{
		r4 = memw(r0+#0)
	}
	{
		r4 = add(r4,#8)
	}
	{
		memw_locked(r4,p0) = r3
	}
	{
		if (!p0) jump:nt .LBB3_6
		r4 = memw(r2+#0)
	}
// %bb.29:
	{
		r16 = add(r4,#8)
		jump .LBB3_23
	}
.LBB3_7:
	{
		r3 = #1
	}
	.p2align	4
.LBB3_8:                                // %cmpxchg.start43
                                        // =>This Inner Loop Header: Depth=1
	{
		r4 = memw(r0+#0)
	}
	{
		r4 = add(r4,#12)
	}
	{
		r4 = memw_locked(r4)
	}
	{
		p0 = cmp.eq(r4,#0); if (!p0.new) jump:nt .LBB3_9
	}
// %bb.30:                              // %cmpxchg.trystore41
                                        //   in Loop: Header=BB3_8 Depth=1
	{
		r4 = memw(r0+#0)
	}
	{
		r4 = add(r4,#12)
	}
	{
		memw_locked(r4,p0) = r3
	}
	{
		if (!p0) jump:nt .LBB3_8
		r4 = memw(r2+#0)
	}
// %bb.31:
	{
		r16 = add(r4,#12)
		jump .LBB3_23
	}
.LBB3_9:
	{
		r3 = #1
	}
	.p2align	4
.LBB3_10:                               // %cmpxchg.start60
                                        // =>This Inner Loop Header: Depth=1
	{
		r4 = memw(r0+#0)
	}
	{
		r4 = add(r4,#16)
	}
	{
		r4 = memw_locked(r4)
	}
	{
		p0 = cmp.eq(r4,#0); if (!p0.new) jump:nt .LBB3_11
	}
// %bb.32:                              // %cmpxchg.trystore58
                                        //   in Loop: Header=BB3_10 Depth=1
	{
		r4 = memw(r0+#0)
	}
	{
		r4 = add(r4,#16)
	}
	{
		memw_locked(r4,p0) = r3
	}
	{
		if (!p0) jump:nt .LBB3_10
		r4 = memw(r2+#0)
	}
// %bb.33:
	{
		r16 = add(r4,#16)
		jump .LBB3_23
	}
.LBB3_11:
	{
		r3 = #1
	}
	.p2align	4
.LBB3_12:                               // %cmpxchg.start77
                                        // =>This Inner Loop Header: Depth=1
	{
		r4 = memw(r0+#0)
	}
	{
		r4 = add(r4,#20)
	}
	{
		r4 = memw_locked(r4)
	}
	{
		p0 = cmp.eq(r4,#0); if (!p0.new) jump:nt .LBB3_13
	}
// %bb.34:                              // %cmpxchg.trystore75
                                        //   in Loop: Header=BB3_12 Depth=1
	{
		r4 = memw(r0+#0)
	}
	{
		r4 = add(r4,#20)
	}
	{
		memw_locked(r4,p0) = r3
	}
	{
		r4 = memw(r2+#0)
	}
	{
		r16 = add(r4,#20)
		if (!p0) jump:nt .LBB3_12
	}
	{
		jump .LBB3_23
	}
.LBB3_13:
	{
		r3 = #1
	}
.LBB3_14:                               // %cmpxchg.start94
                                        // =>This Inner Loop Header: Depth=1
	{
		r4 = memw(r0+#0)
	}
	{
		r4 = add(r4,#24)
	}
	{
		r4 = memw_locked(r4)
	}
	{
		p0 = cmp.eq(r4,#0); if (!p0.new) jump:nt .LBB3_15
	}
// %bb.35:                              // %cmpxchg.trystore92
                                        //   in Loop: Header=BB3_14 Depth=1
	{
		r4 = memw(r0+#0)
	}
	{
		r4 = add(r4,#24)
	}
	{
		memw_locked(r4,p0) = r3
	}
	{
		r4 = memw(r2+#0)
	}
	{
		r16 = add(r4,#24)
		if (!p0) jump:nt .LBB3_14
	}
	{
		jump .LBB3_23
	}
.LBB3_15:
	{
		r3 = #1
	}
.LBB3_16:                               // %cmpxchg.start111
                                        // =>This Inner Loop Header: Depth=1
	{
		r4 = memw(r0+#0)
	}
	{
		r4 = add(r4,#28)
	}
	{
		r4 = memw_locked(r4)
	}
	{
		p0 = cmp.eq(r4,#0); if (!p0.new) jump:nt .LBB3_17
	}
// %bb.36:                              // %cmpxchg.trystore109
                                        //   in Loop: Header=BB3_16 Depth=1
	{
		r4 = memw(r0+#0)
	}
	{
		r4 = add(r4,#28)
	}
	{
		memw_locked(r4,p0) = r3
	}
	{
		r4 = memw(r2+#0)
	}
	{
		r16 = add(r4,#28)
		if (!p0) jump:nt .LBB3_16
	}
	{
		jump .LBB3_23
	}
.LBB3_17:
	{
		r3 = #1
	}
.LBB3_18:                               // %cmpxchg.start128
                                        // =>This Inner Loop Header: Depth=1
	{
		r4 = memw(r0+#0)
	}
	{
		r4 = add(r4,#32)
	}
	{
		r4 = memw_locked(r4)
	}
	{
		p0 = cmp.eq(r4,#0); if (!p0.new) jump:nt .LBB3_19
	}
// %bb.37:                              // %cmpxchg.trystore126
                                        //   in Loop: Header=BB3_18 Depth=1
	{
		r4 = memw(r0+#0)
	}
	{
		r4 = add(r4,#32)
	}
	{
		memw_locked(r4,p0) = r3
	}
	{
		r4 = memw(r2+#0)
	}
	{
		r16 = add(r4,#32)
		if (!p0) jump:nt .LBB3_18
	}
	{
		jump .LBB3_23
	}
.LBB3_19:
	{
		r3 = #1
	}
.LBB3_20:                               // %cmpxchg.start145
                                        // =>This Inner Loop Header: Depth=1
	{
		r4 = memw(r0+#0)
	}
	{
		r4 = add(r4,#36)
	}
	{
		r4 = memw_locked(r4)
	}
	{
		p0 = cmp.eq(r4,#0); if (!p0.new) jump:nt .LBB3_27
	}
// %bb.21:                              // %cmpxchg.trystore143
                                        //   in Loop: Header=BB3_20 Depth=1
	{
		r4 = memw(r0+#0)
	}
	{
		r4 = add(r4,#36)
	}
	{
		memw_locked(r4,p0) = r3
	}
	{
		r4 = memw(r2+#0)
	}
	{
		r16 = add(r4,#36)
		if (!p0) jump:nt .LBB3_20
	}
.LBB3_23:                               // %if.then3
	{
		r0 = memw(r16+#0)
	}
	{
		p0 = cmp.eq(r0,#0)
		if (!p0.new) r17:16 = memd(r29+#0)
		if (!p0.new) r31:30 = dealloc_return(r30):t:raw
	}                                       // 8-byte Folded Reload
.LBB3_24:                               // %if.then5
	{
		r0 = #128
		r1 = ##65536
	}
	{
		call ##_ZN6Halide7Runtime8Internal14aligned_mallocEjj
	}
	{
		r17:16 = memd(r29+#0)
		memw(r16+#0) = r0
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB3_27:                               // %if.end9
	{
		r0 = #128
		r17:16 = memd(r29+#0)
		deallocframe
	}                                       // 8-byte Folded Reload
	{
		jump ##_ZN6Halide7Runtime8Internal14aligned_mallocEjj
	}
.Lfunc_end3:
	.size	halide_default_malloc, .Lfunc_end3-halide_default_malloc
                                        // -- End function
	.section	.text.halide_default_free,"ax",@progbits
	.weak	halide_default_free             // -- Begin function halide_default_free
	.p2align	4
	.type	halide_default_free,@function
halide_default_free:                    // @halide_default_free
// %bb.0:                               // %entry
	{
		r2 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
	}
	{
		r0 = add(r2,##_ZN6Halide7Runtime8Internal7mem_bufE@GOT)
		r2 = add(r2,##_ZN6Halide7Runtime8Internal11buf_is_usedE@GOT)
	}
	{
		r3 = memw(r0+#0)
	}
	{
		r3 = memw(r3+#0)
	}
	{
		p0 = cmp.eq(r3,r1)
		r3 = memw(r2+#0)
	}
	{
		if (p0) jumpr:nt r31
		if (p0) memw(r3+#0) = #0
	}
.LBB4_1:                                // %for.inc
	{
		r3 = memw(r0+#0)
	}
	{
		r3 = memw(r3+#4)
	}
	{
		p0 = cmp.eq(r3,r1)
		r3 = memw(r2+#0)
	}
	{
		if (p0) r3 = add(r3,#4)
	}
	{
		if (p0) jumpr:nt r31
		if (p0) memw(r3+#0) = #0
	}
.LBB4_2:                                // %for.inc.1
	{
		r3 = memw(r0+#0)
	}
	{
		r3 = memw(r3+#8)
	}
	{
		p0 = cmp.eq(r3,r1)
		r3 = memw(r2+#0)
	}
	{
		if (p0) r3 = add(r3,#8)
	}
	{
		if (p0) jumpr:nt r31
		if (p0) memw(r3+#0) = #0
	}
.LBB4_3:                                // %for.inc.2
	{
		r3 = memw(r0+#0)
	}
	{
		r3 = memw(r3+#12)
	}
	{
		p0 = cmp.eq(r3,r1)
		r3 = memw(r2+#0)
	}
	{
		if (p0) r3 = add(r3,#12)
	}
	{
		if (p0) jumpr:nt r31
		if (p0) memw(r3+#0) = #0
	}
.LBB4_4:                                // %for.inc.3
	{
		r3 = memw(r0+#0)
	}
	{
		r3 = memw(r3+#16)
	}
	{
		p0 = cmp.eq(r3,r1)
		r3 = memw(r2+#0)
	}
	{
		if (p0) r3 = add(r3,#16)
	}
	{
		if (p0) jumpr:nt r31
		if (p0) memw(r3+#0) = #0
	}
.LBB4_5:                                // %for.inc.4
	{
		r3 = memw(r0+#0)
	}
	{
		r3 = memw(r3+#20)
	}
	{
		p0 = cmp.eq(r3,r1)
		r3 = memw(r2+#0)
	}
	{
		if (p0) r3 = add(r3,#20)
	}
	{
		if (p0) jumpr:nt r31
		if (p0) memw(r3+#0) = #0
	}
.LBB4_6:                                // %for.inc.5
	{
		r3 = memw(r0+#0)
	}
	{
		r3 = memw(r3+#24)
	}
	{
		p0 = cmp.eq(r3,r1)
		r3 = memw(r2+#0)
	}
	{
		if (p0) r3 = add(r3,#24)
	}
	{
		if (p0) jumpr:nt r31
		if (p0) memw(r3+#0) = #0
	}
.LBB4_7:                                // %for.inc.6
	{
		r3 = memw(r0+#0)
	}
	{
		r3 = memw(r3+#28)
	}
	{
		p0 = cmp.eq(r3,r1)
		r3 = memw(r2+#0)
	}
	{
		if (p0) r3 = add(r3,#28)
	}
	{
		if (p0) jumpr:nt r31
		if (p0) memw(r3+#0) = #0
	}
.LBB4_8:                                // %for.inc.7
	{
		r3 = memw(r0+#0)
	}
	{
		r3 = memw(r3+#32)
	}
	{
		p0 = cmp.eq(r3,r1)
		r3 = memw(r2+#0)
	}
	{
		if (p0) r3 = add(r3,#32)
	}
	{
		if (p0) jumpr:nt r31
		if (p0) memw(r3+#0) = #0
	}
.LBB4_9:                                // %for.inc.8
	{
		r0 = memw(r0+#0)
	}
	{
		r0 = memw(r0+#36)
	}
	{
		p0 = cmp.eq(r0,r1); if (p0.new) jump:nt .LBB4_10
		r0 = memw(r2+#0)
	}
// %bb.11:                              // %for.inc.9
	{
		r0 = r1 ; jump ##_ZN6Halide7Runtime8Internal12aligned_freeEPv
	}
.LBB4_10:
	{
		r3 = add(r0,#36)
	}
	{
		jumpr r31
		memw(r3+#0) = #0
	}
.Lfunc_end4:
	.size	halide_default_free, .Lfunc_end4-halide_default_free
                                        // -- End function
	.section	.text.halide_set_custom_malloc,"ax",@progbits
	.weak	halide_set_custom_malloc        // -- Begin function halide_set_custom_malloc
	.p2align	4
	.type	halide_set_custom_malloc,@function
halide_set_custom_malloc:               // @halide_set_custom_malloc
// %bb.0:                               // %entry
	{
		r16 = r0
		memd(r29+#-16) = r17:16
		allocframe(#8)
	}                                       // 8-byte Folded Spill
	{
		r1 = add(pc,##.L.str@PCREL)
		r0 = #0
	}
	{
		call ##halide_print
	}
	{
		r0 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
	}
	{
		r1 = memw(r0+##_ZN6Halide7Runtime8Internal13custom_mallocE@GOT)
	}
	{
		r0 = memw(r1+#0)
		memw(r1+#0) = r16

	} :mem_noshuf
	{
		r17:16 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end5:
	.size	halide_set_custom_malloc, .Lfunc_end5-halide_set_custom_malloc
                                        // -- End function
	.section	.text.halide_set_custom_free,"ax",@progbits
	.weak	halide_set_custom_free          // -- Begin function halide_set_custom_free
	.p2align	4
	.type	halide_set_custom_free,@function
halide_set_custom_free:                 // @halide_set_custom_free
// %bb.0:                               // %entry
	{
		r16 = r0
		memd(r29+#-16) = r17:16
		allocframe(#8)
	}                                       // 8-byte Folded Spill
	{
		r1 = add(pc,##.L.str@PCREL)
		r0 = #0
	}
	{
		call ##halide_print
	}
	{
		r0 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
	}
	{
		r1 = memw(r0+##_ZN6Halide7Runtime8Internal11custom_freeE@GOT)
	}
	{
		r0 = memw(r1+#0)
		memw(r1+#0) = r16

	} :mem_noshuf
	{
		r17:16 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end6:
	.size	halide_set_custom_free, .Lfunc_end6-halide_set_custom_free
                                        // -- End function
	.section	.text.halide_malloc,"ax",@progbits
	.weak	halide_malloc                   // -- Begin function halide_malloc
	.p2align	4
	.type	halide_malloc,@function
halide_malloc:                          // @halide_malloc
// %bb.0:                               // %entry
	{
		jump ##halide_default_malloc
	}
.Lfunc_end7:
	.size	halide_malloc, .Lfunc_end7-halide_malloc
                                        // -- End function
	.section	.text.halide_free,"ax",@progbits
	.weak	halide_free                     // -- Begin function halide_free
	.p2align	4
	.type	halide_free,@function
halide_free:                            // @halide_free
// %bb.0:                               // %entry
	{
		jump ##halide_default_free
	}
.Lfunc_end8:
	.size	halide_free, .Lfunc_end8-halide_free
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
.Lfunc_end9:
	.size	halide_default_do_task, .Lfunc_end9-halide_default_do_task
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
.Lfunc_end10:
	.size	halide_default_do_loop_task, .Lfunc_end10-halide_default_do_loop_task
                                        // -- End function
	.section	.text.halide_default_do_par_for,"ax",@progbits
	.weak	halide_default_do_par_for       // -- Begin function halide_default_do_par_for
	.p2align	4
	.type	halide_default_do_par_for,@function
halide_default_do_par_for:              // @halide_default_do_par_for
// %bb.0:                               // %entry
	{
		p0 = cmp.gt(r3,#0)
		memd(r29+#-16) = r17:16
		allocframe(#24)
	}                                       // 8-byte Folded Spill
	{
		if (!p0) jump:nt .LBB11_1
		memd(r29+#8) = r19:18
		memd(r29+#0) = r21:20
	}                                       // 8-byte Folded Spill
// %bb.4:
	{
		r17:16 = combine(r2,r4)
		r19:18 = combine(r0,r1)
		r20 = add(r3,r2)
	}
	.p2align	4
.LBB11_5:                               // %for.body
                                        // =>This Inner Loop Header: Depth=1
	{
		call ##halide_do_task
		r1:0 = combine(r18,r19)
		r3:2 = combine(r16,r17)
	}
	{
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:nt .LBB11_6
	}
// %bb.2:                               // %for.cond
                                        //   in Loop: Header=BB11_5 Depth=1
	{
		r17 = add(r17,#1)
		if (cmp.gt(r20,r17.new)) jump:t .LBB11_5
	}
// %bb.3:
	{
		r0 = #0
	}
.LBB11_6:                               // %cleanup1
	{
		r17:16 = memd(r29+#16)
		r19:18 = memd(r29+#8)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.LBB11_1:
	{
		r0 = #0
		r17:16 = memd(r29+#16)
		r19:18 = memd(r29+#8)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end11:
	.size	halide_default_do_par_for, .Lfunc_end11-halide_default_do_par_for
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
.Lfunc_end12:
	.size	halide_do_task, .Lfunc_end12-halide_do_task
                                        // -- End function
	.section	.text.halide_default_do_parallel_tasks,"ax",@progbits
	.weak	halide_default_do_parallel_tasks // -- Begin function halide_default_do_parallel_tasks
	.p2align	4
	.type	halide_default_do_parallel_tasks,@function
halide_default_do_parallel_tasks:       // @halide_default_do_parallel_tasks
// %bb.0:                               // %entry
	{
		r1 = add(pc,##.L.str.1@PCREL)
		r0 = #0
		allocframe(#0)
	}
	{
		call ##halide_error
	}
	{
		r0 = #-1
		dealloc_return
	}
.Lfunc_end13:
	.size	halide_default_do_parallel_tasks, .Lfunc_end13-halide_default_do_parallel_tasks
                                        // -- End function
	.section	.text.halide_default_semaphore_init,"ax",@progbits
	.weak	halide_default_semaphore_init   // -- Begin function halide_default_semaphore_init
	.p2align	4
	.type	halide_default_semaphore_init,@function
halide_default_semaphore_init:          // @halide_default_semaphore_init
// %bb.0:                               // %entry
	{
		r1 = add(pc,##.L.str.1.2@PCREL)
		r0 = #0
		allocframe(#0)
	}
	{
		call ##halide_error
	}
	{
		r0 = #0
		dealloc_return
	}
.Lfunc_end14:
	.size	halide_default_semaphore_init, .Lfunc_end14-halide_default_semaphore_init
                                        // -- End function
	.section	.text.halide_default_semaphore_try_acquire,"ax",@progbits
	.weak	halide_default_semaphore_try_acquire // -- Begin function halide_default_semaphore_try_acquire
	.p2align	4
	.type	halide_default_semaphore_try_acquire,@function
halide_default_semaphore_try_acquire:   // @halide_default_semaphore_try_acquire
// %bb.0:                               // %entry
	{
		r1 = add(pc,##.L.str.3@PCREL)
		r0 = #0
		allocframe(#0)
	}
	{
		call ##halide_error
	}
	{
		r0 = #0
		dealloc_return
	}
.Lfunc_end15:
	.size	halide_default_semaphore_try_acquire, .Lfunc_end15-halide_default_semaphore_try_acquire
                                        // -- End function
	.section	.text.halide_default_semaphore_release,"ax",@progbits
	.weak	halide_default_semaphore_release // -- Begin function halide_default_semaphore_release
	.p2align	4
	.type	halide_default_semaphore_release,@function
halide_default_semaphore_release:       // @halide_default_semaphore_release
// %bb.0:                               // %entry
	{
		r1 = add(pc,##.L.str.2@PCREL)
		r0 = #0
		allocframe(#0)
	}
	{
		call ##halide_error
	}
	{
		r0 = #0
		dealloc_return
	}
.Lfunc_end16:
	.size	halide_default_semaphore_release, .Lfunc_end16-halide_default_semaphore_release
                                        // -- End function
	.section	.text.halide_spawn_thread,"ax",@progbits
	.weak	halide_spawn_thread             // -- Begin function halide_spawn_thread
	.p2align	4
	.type	halide_spawn_thread,@function
halide_spawn_thread:                    // @halide_spawn_thread
// %bb.0:                               // %entry
	{
		r1 = add(pc,##.L.str.4@PCREL)
		r0 = #0
		allocframe(#0)
	}
	{
		call ##halide_error
	}
	{
		r0 = #0
		dealloc_return
	}
.Lfunc_end17:
	.size	halide_spawn_thread, .Lfunc_end17-halide_spawn_thread
                                        // -- End function
	.section	.text.halide_join_thread,"ax",@progbits
	.weak	halide_join_thread              // -- Begin function halide_join_thread
	.p2align	4
	.type	halide_join_thread,@function
halide_join_thread:                     // @halide_join_thread
// %bb.0:                               // %entry
	{
		r1 = add(pc,##.L.str.5@PCREL)
		r0 = #0
	}
	{
		jump ##halide_error
	}
.Lfunc_end18:
	.size	halide_join_thread, .Lfunc_end18-halide_join_thread
                                        // -- End function
	.section	.text.halide_mutex_lock,"ax",@progbits
	.weak	halide_mutex_lock               // -- Begin function halide_mutex_lock
	.p2align	4
	.type	halide_mutex_lock,@function
halide_mutex_lock:                      // @halide_mutex_lock
// %bb.0:                               // %entry
	{
		jumpr r31
	}
.Lfunc_end19:
	.size	halide_mutex_lock, .Lfunc_end19-halide_mutex_lock
                                        // -- End function
	.section	.text.halide_mutex_unlock,"ax",@progbits
	.weak	halide_mutex_unlock             // -- Begin function halide_mutex_unlock
	.p2align	4
	.type	halide_mutex_unlock,@function
halide_mutex_unlock:                    // @halide_mutex_unlock
// %bb.0:                               // %entry
	{
		jumpr r31
	}
.Lfunc_end20:
	.size	halide_mutex_unlock, .Lfunc_end20-halide_mutex_unlock
                                        // -- End function
	.section	.text.halide_mutex_array_create,"ax",@progbits
	.weak	halide_mutex_array_create       // -- Begin function halide_mutex_array_create
	.p2align	4
	.type	halide_mutex_array_create,@function
halide_mutex_array_create:              // @halide_mutex_array_create
// %bb.0:                               // %entry
	{
		r0 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
	}
	{
		jumpr r31
		r0 = memw(r0+##_ZN6Halide7Runtime8Internal23halide_fake_mutex_arrayE@GOT)
	}
.Lfunc_end21:
	.size	halide_mutex_array_create, .Lfunc_end21-halide_mutex_array_create
                                        // -- End function
	.section	.text.halide_mutex_array_destroy,"ax",@progbits
	.weak	halide_mutex_array_destroy      // -- Begin function halide_mutex_array_destroy
	.p2align	4
	.type	halide_mutex_array_destroy,@function
halide_mutex_array_destroy:             // @halide_mutex_array_destroy
// %bb.0:                               // %entry
	{
		jumpr r31
	}
.Lfunc_end22:
	.size	halide_mutex_array_destroy, .Lfunc_end22-halide_mutex_array_destroy
                                        // -- End function
	.section	.text.halide_mutex_array_lock,"ax",@progbits
	.weak	halide_mutex_array_lock         // -- Begin function halide_mutex_array_lock
	.p2align	4
	.type	halide_mutex_array_lock,@function
halide_mutex_array_lock:                // @halide_mutex_array_lock
// %bb.0:                               // %entry
	{
		r0 = #0
		jumpr r31
	}
.Lfunc_end23:
	.size	halide_mutex_array_lock, .Lfunc_end23-halide_mutex_array_lock
                                        // -- End function
	.section	.text.halide_mutex_array_unlock,"ax",@progbits
	.weak	halide_mutex_array_unlock       // -- Begin function halide_mutex_array_unlock
	.p2align	4
	.type	halide_mutex_array_unlock,@function
halide_mutex_array_unlock:              // @halide_mutex_array_unlock
// %bb.0:                               // %entry
	{
		r0 = #0
		jumpr r31
	}
.Lfunc_end24:
	.size	halide_mutex_array_unlock, .Lfunc_end24-halide_mutex_array_unlock
                                        // -- End function
	.section	.text.halide_shutdown_thread_pool,"ax",@progbits
	.weak	halide_shutdown_thread_pool     // -- Begin function halide_shutdown_thread_pool
	.p2align	4
	.type	halide_shutdown_thread_pool,@function
halide_shutdown_thread_pool:            // @halide_shutdown_thread_pool
// %bb.0:                               // %entry
	{
		jumpr r31
	}
.Lfunc_end25:
	.size	halide_shutdown_thread_pool, .Lfunc_end25-halide_shutdown_thread_pool
                                        // -- End function
	.section	.text.halide_set_num_threads,"ax",@progbits
	.weak	halide_set_num_threads          // -- Begin function halide_set_num_threads
	.p2align	4
	.type	halide_set_num_threads,@function
halide_set_num_threads:                 // @halide_set_num_threads
// %bb.0:                               // %entry
	{
		if (p0.new) r0 = #1
		p0 = cmp.eq(r0,#1)
		if (p0.new) jumpr:nt r31
	}
.LBB26_1:                               // %if.then
	{
		r1 = add(pc,##.L.str.6@PCREL)
		r0 = #0
		allocframe(#0)
	}
	{
		call ##halide_error
	}
	{
		r0 = #1
		deallocframe
	}
	{
		jumpr r31
	}
.Lfunc_end26:
	.size	halide_set_num_threads, .Lfunc_end26-halide_set_num_threads
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

	} :mem_noshuf
	{
		r0 = r1
		jumpr r31
	}
.Lfunc_end27:
	.size	halide_set_custom_do_task, .Lfunc_end27-halide_set_custom_do_task
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

	} :mem_noshuf
	{
		r0 = r1
		jumpr r31
	}
.Lfunc_end28:
	.size	halide_set_custom_do_par_for, .Lfunc_end28-halide_set_custom_do_par_for
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
.Lfunc_end29:
	.size	halide_do_par_for, .Lfunc_end29-halide_do_par_for
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
.Lfunc_end30:
	.size	halide_do_loop_task, .Lfunc_end30-halide_do_loop_task
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
.Lfunc_end31:
	.size	halide_do_parallel_tasks, .Lfunc_end31-halide_do_parallel_tasks
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
.Lfunc_end32:
	.size	halide_semaphore_init, .Lfunc_end32-halide_semaphore_init
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
.Lfunc_end33:
	.size	halide_semaphore_release, .Lfunc_end33-halide_semaphore_release
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
.Lfunc_end34:
	.size	halide_semaphore_try_acquire, .Lfunc_end34-halide_semaphore_try_acquire
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
		r0 = memw(r1+##_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE@GOT)

	} :mem_noshuf
	{
		jumpr r31
		memb(r0+#0) = #1
	}
.Lfunc_end35:
	.size	halide_set_gpu_device, .Lfunc_end35-halide_set_gpu_device
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
.LBB36_1:                               // %atomicrmw.start
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
		if (!p0) jump:nt .LBB36_1
	}
// %bb.2:                               // %atomicrmw.end
                                        //   in Loop: Header=BB36_1 Depth=1
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
		if (p0.new) jump:t .LBB36_1
	}
// %bb.3:                               // %_ZN6Halide7Runtime8Internal14ScopedSpinLockC2EPVc.exit
	{
		r0 = memw(r17+##_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE@GOT)
	}
	{
		r0 = memb(r0+#0)
		if (cmp.eq(r0.new,#0)) jump:nt .LBB36_5
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
		r17:16 = memd(r29+#0)

	} :mem_noshuf                           // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB36_5:                               // %if.then
	{
		r0 = add(pc,##.L.str.7@PCREL)
		call ##getenv
	}
	{
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB36_6
	}
// %bb.7:                               // %if.then2
	{
		call ##atoi
	}
	{
		jump .LBB36_8
	}
.LBB36_6:
	{
		r0 = #-1
	}
.LBB36_8:                               // %if.end
	{
		r1 = memw(r17+##_ZN6Halide7Runtime8Internal17halide_gpu_deviceE@GOT)
	}
	{
		memw(r1+#0) = r0
		r1 = memw(r17+##_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE@GOT)

	} :mem_noshuf
	{
		memb(r1+#0) = #1
		r1 = memw(r16+#0)

	} :mem_noshuf
	{
		memb(r1+#0) = #0
		r17:16 = memd(r29+#0)

	} :mem_noshuf                           // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end36:
	.size	halide_get_gpu_device, .Lfunc_end36-halide_get_gpu_device
                                        // -- End function
	.section	.text.halide_string_to_string,"ax",@progbits
	.weak	halide_string_to_string         // -- Begin function halide_string_to_string
	.p2align	4
	.type	halide_string_to_string,@function
halide_string_to_string:                // @halide_string_to_string
// %bb.0:                               // %entry
	{
		p0 = cmp.gtu(r1,r0); if (!p0.new) jump:t .LBB37_5
	}
// %bb.1:                               // %if.end
	{
		r3 = add(pc,##.L.str.8@PCREL)
		p0 = cmp.eq(r2,#0)
		r4 = sub(r1,r0)
	}
	{
		loop0(.LBB37_2,r4)
		if (!p0) r3 = add(r2,#0)
	}
	.p2align	4
.Ltmp0:                                 // Block address taken
.LBB37_2:                               // %if.end5
                                        // =>This Inner Loop Header: Depth=1
	{
		r4 = memb(r3+#0)
		memb(r0+#0) = r4.new
	}
	{
		p0 = cmp.eq(r4,#0)
		if (p0.new) jumpr:nt r31
	}
.LBB37_3:                               // %if.end8
                                        //   in Loop: Header=BB37_2 Depth=1
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
.LBB37_5:
	{
		jumpr r31
	}
.Lfunc_end37:
	.size	halide_string_to_string, .Lfunc_end37-halide_string_to_string
                                        // -- End function
	.section	.text.halide_uint64_to_string,"ax",@progbits
	.weak	halide_uint64_to_string         // -- Begin function halide_uint64_to_string
	.p2align	4
	.type	halide_uint64_to_string,@function
halide_uint64_to_string:                // @halide_uint64_to_string
// %bb.0:                               // %entry
	{
		r7:6 = combine(#0,#0)
		memd(r29+#-16) = r17:16
		allocframe(#48)
	}                                       // 8-byte Folded Spill
	{
		p0 = cmp.eq(r3:2,r7:6)
		r5 = add(r29,#0)
		memd(r29+#32) = r19:18
		memb(r29+#31) = #0
	}                                       // 8-byte Folded Spill
	{
		if (!p0) jump:nt .LBB38_4
	}
// %bb.1:                               // %entry
	{
		p0 = cmp.gt(r4,#0); if (p0.new) jump:nt .LBB38_4
	}
// %bb.2:
	{
		r5 = add(r5,#30)
	}
.LBB38_3:                               // %for.cond.cleanup
	{
		call ##halide_string_to_string
		r2 = add(r5,#1)
	}
	{
		r17:16 = memd(r29+#40)
		r19:18 = memd(r29+#32)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB38_4:                               // %entry.for.body_crit_edge
	{
		r5 = add(r5,#29)
		r7 = ##-858993459
		r6 = #1
	}
	{
		r9 = #0
		r12 = ##-858993460
		r13 = #-10
	}
	{
		r15:14 = combine(#0,#9)
	}
.LBB38_5:                               // %for.body
                                        // =>This Inner Loop Header: Depth=1
	{
		r3:2 = mpyu(r2,r7)
		r11:10 = combine(r3,r2)
	}
	{
		r17:16 = mpyu(r10,r12)
		p0 = cmp.gtu(r11:10,r15:14)
		r8 = r3
	}
	{
		r3:2 = combine(r9,r8)
		r19:18 = combine(r9,r17)
		r17 = r9
	}
	{
		r3:2 += mpyu(r11,r7)
	}
	{
		r3:2 = add(r3:2,r17:16)
	}
	{
		r2 = r3
		r3 = r9
	}
	{
		r3:2 += mpyu(r11,r12)
	}
	{
		r17:16 = add(r3:2,r19:18)
	}
	{
		r2 = lsr(r16,#3)
		r3 = lsr(r17,#3)
	}
	{
		r2 = insert(r17,#3,#29)
	}
	{
		r17:16 = mpyu(r2,r13)
	}
	{
		r17 -= mpyi(r2,#1)
	}
	{
		r17 -= mpyi(r3,#10)
	}
	{
		r11:10 = add(r17:16,r11:10)
	}
	{
		r8 = add(r10,#48)
		if (p0) jump:nt .LBB38_7
		memb(r5+#1) = r8.new
	}
// %bb.6:                               // %for.body
                                        //   in Loop: Header=BB38_5 Depth=1
	{
		p0 = cmp.gt(r4,r6); if (!p0.new) jump:t .LBB38_3
	}
	.p2align	4
.LBB38_7:                               // %for.body.for.body_crit_edge
                                        //   in Loop: Header=BB38_5 Depth=1
	{
		jump .LBB38_5
		r6 = add(r6,#1)
		r5 = add(r5,#-1)
	}
.Lfunc_end38:
	.size	halide_uint64_to_string, .Lfunc_end38-halide_uint64_to_string
                                        // -- End function
	.section	.text.halide_int64_to_string,"ax",@progbits
	.weak	halide_int64_to_string          // -- Begin function halide_int64_to_string
	.p2align	4
	.type	halide_int64_to_string,@function
halide_int64_to_string:                 // @halide_int64_to_string
// %bb.0:                               // %entry
	{
		p0 = cmp.gtu(r1,r0); if (p0.new) jump:nt .LBB39_1
	}
.LBB39_3:                               // %if.end
	{
		jump ##halide_uint64_to_string
	}
.LBB39_1:                               // %entry
	{
		r7:6 = combine(#-1,#-1)
	}
	{
		p0 = cmp.gt(r3:2,r7:6)
		if (p0.new) jump:t .LBB39_3
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
.Lfunc_end39:
	.size	halide_int64_to_string, .Lfunc_end39-halide_int64_to_string
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
		allocframe(r29,#576):raw
	}                                       // 8-byte Folded Spill
	{
		r25:24 = combine(#0,#0)
		r0 = add(r29,#512)
		memd(r29+#536) = r25:24
		memd(r29+#520) = r3:2
	}                                       // 8-byte Folded Spill
	{
		r1 = add(r29,#520)
		r2 = #8
		memd(r29+#560) = r19:18
		memd(r29+#552) = r21:20
	}                                       // 8-byte Folded Spill
	{
		r18 = r4
		memd(r29+#544) = r23:22
		memd(r29+#512) = r25:24
	}                                       // 8-byte Folded Spill
	{
		call ##memcpy
	}
	{
		r21:20 = memd(r29+#512)
	}
	{
		r19 = extractu(r21,#11,#20)
		r23 = extractu(r21,#20,#0)
		r22 = r20
	}
	{
		p0 = cmp.eq(r19,##2047)
		if (!p0.new) jump:t .LBB40_9
	}
// %bb.1:                               // %if.then
	{
		p0 = cmp.eq(r23:22,r25:24)
		r1:0 = combine(#-1,#-1)
		if (p0.new) jump:nt .LBB40_6
	}
// %bb.2:                               // %if.then4
	{
		p0 = cmp.gt(r21:20,r1:0)
		if (!p0.new) jump:nt .LBB40_3
	}
// %bb.5:                               // %if.else
	{
		r2 = add(pc,##.L.str.2.10@PCREL)
		jump .LBB40_4
	}
.LBB40_9:                               // %if.else15
	{
		p0 = cmp.eq(r23:22,r25:24)
		if (!p0.new) jump:nt .LBB40_18
	}
// %bb.10:                              // %if.else15
	{
		p0 = cmp.eq(r19,#0); if (!p0.new) jump:nt .LBB40_18
	}
// %bb.11:                              // %if.then18
	{
		r1:0 = combine(#-1,#-1)
		p0 = cmp.eq(r18,#0); if (p0.new) jump:nt .LBB40_15
	}
// %bb.12:                              // %if.then20
	{
		p0 = cmp.gt(r21:20,r1:0)
		if (!p0.new) jump:nt .LBB40_13
	}
// %bb.14:                              // %if.else24
	{
		r2 = add(pc,##.L.str.6.14@PCREL)
		jump .LBB40_4
	}
.LBB40_18:                              // %if.end32
	{
		r1:0 = combine(#-1,#-1)
	}
	{
		p0 = cmp.gt(r21:20,r1:0)
		if (p0.new) jump:nt .LBB40_20
	}
// %bb.19:                              // %if.then34
	{
		r2 = add(pc,##.L.str.9@PCREL)
		r1:0 = combine(r16,r17)
	}
	{
		call ##halide_string_to_string
	}
	{
		r17 = r0
		r3:2 = memd(r29+#520)
	}
	{
		r3 = togglebit(r3,#31)
	}
	{
		memd(r29+#520) = r3:2
	}
.LBB40_20:                              // %if.end36
	{
		p0 = cmp.eq(r18,#0); if (p0.new) jump:nt .LBB40_35
	}
// %bb.21:                              // %while.condthread-pre-split
	{
		r22 = #0
		r23 = ##1072693248
		r1:0 = memd(r29+#520)
	}
	{
		p0 = dfcmp.ge(r1:0,r23:22)
		p1 = dfcmp.uo(r1:0,r23:22)
		r18 = #0
	}
	{
		p0 = or(p1,p0)
		if (p0.new) jump:t .LBB40_26
	}
// %bb.22:
	{
		r20 = #0
		r21 = ##1076101120
		r18 = #-1
	}
	.p2align	4
.LBB40_23:                              // %while.body
                                        // =>This Inner Loop Header: Depth=1
	{
		call ##__hexagon_muldf3
		r3:2 = combine(r21,r20)
	}
	{
		p0 = dfcmp.ge(r1:0,r23:22)
		p1 = dfcmp.uo(r1:0,r23:22)
	}
	{
		p0 = or(p1,p0)
		if (p0.new) jump:nt .LBB40_25
	}
// %bb.24:                              // %while.body.while.body_crit_edge
                                        //   in Loop: Header=BB40_23 Depth=1
	{
		r18 = add(r18,#-1)
		jump .LBB40_23
	}
.LBB40_6:                               // %if.else9
	{
		p0 = cmp.gt(r21:20,r1:0)
		if (!p0.new) jump:nt .LBB40_7
	}
// %bb.8:                               // %if.else13
	{
		r2 = add(pc,##.L.str.4.12@PCREL)
		jump .LBB40_4
	}
.LBB40_3:                               // %if.then6
	{
		r2 = add(pc,##.L.str.1.9@PCREL)
		jump .LBB40_4
	}
.LBB40_15:                              // %if.else26
	{
		p0 = cmp.gt(r21:20,r1:0)
		if (!p0.new) jump:nt .LBB40_16
	}
// %bb.17:                              // %if.else30
	{
		r2 = add(pc,##.L.str.8.16@PCREL)
		jump .LBB40_4
	}
.LBB40_35:                              // %if.else61
	{
		p0 = cmp.eq(r19,#0); if (p0.new) jump:nt .LBB40_36
	}
// %bb.37:                              // %if.end65
	{
		r21 = setbit(r23,#20)
		p0 = cmp.gtu(r19,##1074)
		r22 = add(r19,#-1075)
	}
	{
		if (p0) jump:nt .LBB40_38
	}
// %bb.39:                              // %if.then71
	{
		p0 = cmp.gtu(r19,##1022)
		r24 = #0
		r23 = #0
	}
	{
		if (p0) jump:nt .LBB40_41
	}
// %bb.40:
	{
		r25 = #0
		jump .LBB40_42
	}
.LBB40_25:                              // %while.cond.while.cond40thread-pre-split_crit_edge
	{
		memd(r29+#520) = r1:0
	}
.LBB40_26:                              // %while.cond40thread-pre-split
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
		if (p0.new) jump:t .LBB40_29
	}
	.p2align	4
.LBB40_27:                              // %while.body42
                                        // =>This Inner Loop Header: Depth=1
	{
		call ##__hexagon_divdf3
		r3:2 = combine(r21,r20)
	}
	{
		p0 = dfcmp.ge(r1:0,r21:20)
		r18 = add(r18,#1)
		if (p0.new) jump:t .LBB40_27
	}
// %bb.28:                              // %while.cond40.while.end43_crit_edge
	{
		memd(r29+#520) = r1:0
	}
.LBB40_29:                              // %while.end43
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
		r1:0 = dfadd(r1:0,r3:2)
	}
	{
		r7:6 = convert_df2ud(r1:0):chop
		r0 = ##-675924773
	}
	{
		r5:4 = mpyu(r6,r0)
		r1 = ##1125899906
	}
	{
		r9:8 = mpyu(r6,r1)
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
		r25:24 = mpyu(r2,r0)
	}
	{
		r25 -= mpyi(r2,#1)
	}
	{
		r25 += mpyi(r0,r3)
		r1:0 = combine(r16,r17)
	}
	{
		call ##halide_int64_to_string
		r21:20 = add(r25:24,r7:6)
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
		p0 = cmp.gt(r18,#-1); if (!p0.new) jump:nt .LBB40_31
	}
// %bb.30:                              // %if.then53
	{
		r2 = add(pc,##.L.str.11@PCREL)
		r1 = r16
	}
	{
		call ##halide_string_to_string
	}
	{
		jump .LBB40_32
	}
.LBB40_7:                               // %if.then11
	{
		r2 = add(pc,##.L.str.3.11@PCREL)
		jump .LBB40_4
	}
.LBB40_13:                              // %if.then22
	{
		r2 = add(pc,##.L.str.5.13@PCREL)
		jump .LBB40_4
	}
.LBB40_31:                              // %if.else55
	{
		r2 = add(pc,##.L.str.12@PCREL)
		r1 = r16
	}
	{
		call ##halide_string_to_string
		r18 = sub(#0,r18)
	}
.LBB40_32:                              // %if.end58
	{
		r1 = r16
		r19 = #0
		r4 = #2
	}
	{
		r3:2 = combine(r19,r18)
		jump .LBB40_33
	}
.LBB40_16:                              // %if.then28
	{
		r2 = add(pc,##.L.str.7.15@PCREL)
	}
.LBB40_4:                               // %cleanup147
	{
		call ##halide_string_to_string
		r1:0 = combine(r16,r17)
	}
	{
		jump .LBB40_34
	}
.LBB40_36:                              // %if.then63
	{
		r1:0 = combine(r16,r17)
		r4 = #0
		r3:2 = combine(#0,#0)
	}
	{
		call ##halide_double_to_string
	}
	{
		jump .LBB40_34
	}
.LBB40_38:
	{
		r23 = r22 ; jump .LBB40_43
		r19:18 = combine(#0,#0)
	}
.LBB40_41:                              // %if.else75
	{
		r0 = sub(##1075,r19)
	}
	{
		r25:24 = lsr(r21:20,r0)
	}
	{
		r21:20 -= asl(r25:24,r0)
	}
.LBB40_42:                              // %if.end83
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
		r1:0 = dfadd(r1:0,r3:2)
		r4 = ##1000000
		r5 = #0
	}
	{
		r3:2 = convert_df2ud(r1:0):chop
	}
	{
		r7:6 = convert_ud2df(r3:2)
		p0 = tstbit(r2,#0)
	}
	{
		p1 = dfcmp.eq(r1:0,r7:6)
		r7:6 = combine(#0,#1)
	}
	{
		p0 = and(p1,p0)
	}
	{
		r0 = mux(p0,#-1,#0)
	}
	{
		r1:0 = add(r1:0,r3:2):raw:lo
		r3:2 = add(r25:24,r7:6)
	}
	{
		p0 = cmp.eq(r1:0,r5:4)
	}
	{
		r20 = mux(p0,r2,r24)
		r18 = mux(p0,r23,r0)
		r21 = mux(p0,r3,r25)
		r19 = mux(p0,r23,r1)
	}
.LBB40_43:                              // %if.end104
	{
		r3:2 = combine(r21,r20)
		r4 = #1
		r0 = add(r29,#0)
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
		p0 = cmp.gt(r23,#0); if (!p0.new) jump:nt .LBB40_44
	}
// %bb.45:                              // %for.cond111.preheader.preheader
	{
		r1 = add(r23,#-1)
	}
	{
		r1 = and(r23,#3)
		p0 = cmp.gtu(r1,#2); if (!p0.new) jump:t .LBB40_64
	}
// %bb.46:                              // %for.cond111.preheader.preheader.new
	{
		r2 = and(r23,#-4)
	}
	{
		r3 = lsr(r2,#2)
		r2 = #49
	}
	{
		loop1(.LBB40_47,r3)
		jump .LBB40_47
	}
.LBB40_72:                              // %if.then135.3
                                        //   in Loop: Header=BB40_47 Depth=1
	{
		r20 = add(r3,#-1)
		memb(r3+#-1) = r2
	}
.LBB40_73:                              // %if.end137.3
                                        //   in Loop: Header=BB40_47 Depth=1
	{
		nop
		nop
		nop
	} :endloop1
	{
		jump .LBB40_64
	}
.Ltmp1:                                 // Block address taken
.LBB40_47:                              // %for.cond111.preheader
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB40_49 Depth 2
                                        //     Child Loop BB40_53 Depth 2
                                        //     Child Loop BB40_57 Depth 2
                                        //     Child Loop BB40_61 Depth 2
	{
		p0 = cmp.eq(r0,r20); if (p0.new) jump:nt .LBB40_51
		r5 = #0
		r3 = r0
	}
// %bb.48:                              //   in Loop: Header=BB40_47 Depth=1
	{
		r6 = #-96
		r3 = sub(r0,r20)
		r7 = r0
		r4 = memub(r0+#-1)
	}
	{
		r6 += asl(r4,#1)
		r8 = add(r3,#-1)
		p0 = cmp.gtu(r3,#1)
		r4 = add(r0,#-1)
	}
	{
		loop0(.LBB40_49,r8)
		r3 = or(r6,r5)
		r5 = r0
	}
	{
		r8 = sxtb(r3)
		r6 = add(r3,#-10)
		if (!p0) jump:nt .LBB40_50
	}
	.p2align	4
.LBB40_49:                              // %for.body115
                                        //   Parent Loop BB40_47 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	{
		p0 = cmp.gt(r8,#9)
		r5 = r4
		r8 = #-96
		r4 = memub(r4+#-1)
	}
	{
		r8 += asl(r4,#1)
		if (!p0) r6 = add(r3,#0)
		r4 = add(r5,#-1)
		r9 = mux(p0,#1,#0)
	}
	{
		r6 = add(r6,#48)
		r7 = r5
		r3 = or(r8,r9)
		memb(r7+#-1) = r6.new
	}
	{
		r8 = sxtb(r3)
		r6 = add(r3,#-10)
	} :endloop0
.LBB40_50:                              //   in Loop: Header=BB40_47 Depth=1
	{
		p0 = cmp.gt(r8,#9)
		if (!p0.new) r6 = add(r3,#0)
	}
	{
		r3 = add(r6,#48)
		memb(r5+#-1) = r3.new
	}
	{
		if (p0) r3 = add(r20,#-1)
		if (!p0) r3 = add(r20,#0)
		if (p0) memb(r20+##-1) = r2
	}
.LBB40_51:                              // %if.end137
                                        //   in Loop: Header=BB40_47 Depth=1
	{
		p0 = cmp.eq(r0,r3); if (p0.new) jump:nt .LBB40_55
		r6 = #0
		r4 = r0
	}
// %bb.52:                              //   in Loop: Header=BB40_47 Depth=1
	{
		r7 = #-96
		r4 = sub(r0,r3)
		r8 = r0
		r5 = memub(r0+#-1)
	}
	{
		r7 += asl(r5,#1)
		r9 = add(r4,#-1)
		p0 = cmp.gtu(r4,#1)
		r5 = add(r0,#-1)
	}
	{
		loop0(.LBB40_53,r9)
		r4 = or(r7,r6)
		r6 = r0
	}
	{
		r9 = sxtb(r4)
		r7 = add(r4,#-10)
		if (!p0) jump:nt .LBB40_54
	}
	.p2align	4
.LBB40_53:                              // %for.body115.1
                                        //   Parent Loop BB40_47 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	{
		p0 = cmp.gt(r9,#9)
		r6 = r5
		r9 = #-96
		r5 = memub(r5+#-1)
	}
	{
		r9 += asl(r5,#1)
		if (!p0) r7 = add(r4,#0)
		r5 = add(r6,#-1)
		r12 = mux(p0,#1,#0)
	}
	{
		r7 = add(r7,#48)
		r8 = r6
		r4 = or(r9,r12)
		memb(r8+#-1) = r7.new
	}
	{
		r9 = sxtb(r4)
		r7 = add(r4,#-10)
	} :endloop0
.LBB40_54:                              //   in Loop: Header=BB40_47 Depth=1
	{
		p0 = cmp.gt(r9,#9)
		if (!p0.new) r7 = add(r4,#0)
	}
	{
		r4 = add(r7,#48)
		memb(r6+#-1) = r4.new
	}
	{
		if (p0) r4 = add(r3,#-1)
		if (!p0) r4 = add(r3,#0)
		if (p0) memb(r3+##-1) = r2
	}
.LBB40_55:                              // %if.end137.1
                                        //   in Loop: Header=BB40_47 Depth=1
	{
		p0 = cmp.eq(r0,r4); if (p0.new) jump:nt .LBB40_59
		r6 = #0
		r3 = r0
	}
// %bb.56:                              //   in Loop: Header=BB40_47 Depth=1
	{
		r7 = #-96
		r3 = sub(r0,r4)
		r8 = r0
		r5 = memub(r0+#-1)
	}
	{
		r7 += asl(r5,#1)
		r9 = add(r3,#-1)
		p0 = cmp.gtu(r3,#1)
		r5 = add(r0,#-1)
	}
	{
		loop0(.LBB40_57,r9)
		r3 = or(r7,r6)
		r6 = r0
	}
	{
		r9 = sxtb(r3)
		r7 = add(r3,#-10)
		if (!p0) jump:nt .LBB40_58
	}
	.p2align	4
.LBB40_57:                              // %for.body115.2
                                        //   Parent Loop BB40_47 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	{
		p0 = cmp.gt(r9,#9)
		r6 = r5
		r9 = #-96
		r5 = memub(r5+#-1)
	}
	{
		r9 += asl(r5,#1)
		if (!p0) r7 = add(r3,#0)
		r5 = add(r6,#-1)
		r12 = mux(p0,#1,#0)
	}
	{
		r7 = add(r7,#48)
		r8 = r6
		r3 = or(r9,r12)
		memb(r8+#-1) = r7.new
	}
	{
		r9 = sxtb(r3)
		r7 = add(r3,#-10)
	} :endloop0
.LBB40_58:                              //   in Loop: Header=BB40_47 Depth=1
	{
		p0 = cmp.gt(r9,#9)
		if (!p0.new) r7 = add(r3,#0)
	}
	{
		r3 = add(r7,#48)
		memb(r6+#-1) = r3.new
	}
	{
		if (p0) r3 = add(r4,#-1)
		if (!p0) r3 = add(r4,#0)
		if (p0) memb(r4+##-1) = r2
	}
.LBB40_59:                              // %if.end137.2
                                        //   in Loop: Header=BB40_47 Depth=1
	{
		p0 = cmp.eq(r0,r3); if (p0.new) jump:nt .LBB40_73
		r4 = #0
		r20 = r0
	}
// %bb.60:                              //   in Loop: Header=BB40_47 Depth=1
	{
		r6 = #-96
		r5 = sub(r0,r3)
		r8 = r0
		r7 = memub(r0+#-1)
	}
	{
		r6 += asl(r7,#1)
		r9 = add(r5,#-1)
		p0 = cmp.gtu(r5,#1)
		r5 = add(r0,#-1)
	}
	{
		loop0(.LBB40_61,r9)
		r4 = or(r6,r4)
		r6 = r0
	}
	{
		r9 = sxtb(r4)
		r7 = add(r4,#-10)
		if (!p0) jump:nt .LBB40_62
	}
	.p2align	4
.LBB40_61:                              // %for.body115.3
                                        //   Parent Loop BB40_47 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	{
		p0 = cmp.gt(r9,#9)
		r6 = r5
		r9 = #-96
		r5 = memub(r5+#-1)
	}
	{
		r9 += asl(r5,#1)
		if (!p0) r7 = add(r4,#0)
		r5 = add(r6,#-1)
		r12 = mux(p0,#1,#0)
	}
	{
		r7 = add(r7,#48)
		r8 = r6
		r4 = or(r9,r12)
		memb(r8+#-1) = r7.new
	}
	{
		r9 = sxtb(r4)
		r7 = add(r4,#-10)
	} :endloop0
.LBB40_62:                              //   in Loop: Header=BB40_47 Depth=1
	{
		p0 = cmp.gt(r9,#9)
		if (!p0.new) r7 = add(r4,#0)
	}
	{
		r4 = add(r7,#48)
		if (p0) jump:nt .LBB40_72
		memb(r6+#-1) = r4.new
	}
// %bb.63:                              //   in Loop: Header=BB40_47 Depth=1
	{
		r20 = r3
		nop
		nop
	} :endloop1
.LBB40_64:                              // %for.cond.cleanup.loopexit.unr-lcssa
	{
		r2 = r20
		p0 = cmp.eq(r1,#0); if (p0.new) jump:nt .LBB40_71
	}
// %bb.65:
	{
		loop1(.LBB40_66,r1)
		r3 = #49 ; jump .LBB40_66
	}
	.p2align	4
.LBB40_69:                              //   in Loop: Header=BB40_66 Depth=1
	{
		p0 = cmp.gt(r7,#9)
		if (p0.new) r2 = add(r20,#-1)
		if (!p0.new) r5 = add(r1,#0)
		if (!p0.new) r2 = add(r20,#0)
	}
	{
		r1 = add(r5,#48)
		memb(r4+#-1) = r1.new
	}
	{
		if (p0) memb(r20+##-1) = r3
	}
.LBB40_70:                              // %if.end137.epil
                                        //   in Loop: Header=BB40_66 Depth=1
	{
		r20 = r2
		nop
		nop
	} :endloop1
	{
		jump .LBB40_71
	}
.Ltmp2:                                 // Block address taken
.LBB40_66:                              // %for.cond111.preheader.epil
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB40_68 Depth 2
	{
		p0 = cmp.eq(r0,r20); if (p0.new) jump:nt .LBB40_70
		r1 = #0
		r2 = r0
	}
// %bb.67:                              //   in Loop: Header=BB40_66 Depth=1
	{
		r4 = #-96
		r2 = sub(r0,r20)
		r6 = r0
		r5 = memub(r0+#-1)
	}
	{
		r4 += asl(r5,#1)
		p0 = cmp.gtu(r2,#1)
		r7 = add(r2,#-1)
		r2 = add(r0,#-1)
	}
	{
		loop0(.LBB40_68,r7)
		r1 = or(r4,r1)
		r4 = r0
	}
	{
		r7 = sxtb(r1)
		r5 = add(r1,#-10)
		if (!p0) jump:nt .LBB40_69
	}
	.p2align	4
.LBB40_68:                              // %for.body115.epil
                                        //   Parent Loop BB40_66 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	{
		p0 = cmp.gt(r7,#9)
		r4 = r2
		r7 = #-96
		r2 = memub(r2+#-1)
	}
	{
		r7 += asl(r2,#1)
		if (!p0) r5 = add(r1,#0)
		r2 = add(r4,#-1)
		r8 = mux(p0,#1,#0)
	}
	{
		r5 = add(r5,#48)
		r6 = r4
		r1 = or(r7,r8)
		memb(r6+#-1) = r5.new
	}
	{
		r7 = sxtb(r1)
		r5 = add(r1,#-10)
	} :endloop0
	{
		jump .LBB40_69
	}
.LBB40_44:
	{
		r2 = r20
	}
.LBB40_71:                              // %for.cond.cleanup
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
.LBB40_33:                              // %cleanup147
	{
		call ##halide_int64_to_string
	}
.LBB40_34:                              // %cleanup147
	{
		r17:16 = memd(r29+#568)
		r19:18 = memd(r29+#560)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#552)
		r23:22 = memd(r29+#544)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#536)
		r31:30 = dealloc_return(r30):raw
	}                                       // 8-byte Folded Reload
.Ltmp3:                                 // Address of block that was removed by CodeGen
.Ltmp4:                                 // Address of block that was removed by CodeGen
.Ltmp5:                                 // Address of block that was removed by CodeGen
.Ltmp6:                                 // Address of block that was removed by CodeGen
.Ltmp7:                                 // Address of block that was removed by CodeGen
.Lfunc_end40:
	.size	halide_double_to_string, .Lfunc_end40-halide_double_to_string
                                        // -- End function
	.section	.text.halide_pointer_to_string,"ax",@progbits
	.weak	halide_pointer_to_string        // -- Begin function halide_pointer_to_string
	.p2align	4
	.type	halide_pointer_to_string,@function
halide_pointer_to_string:               // @halide_pointer_to_string
// %bb.0:                               // %entry
	{
		r4 = add(pc,##.L.str.13@PCREL)
		r9:8 = bitsplit(r2,#4)
		allocframe(r29,#24):raw
	}
	{
		r7:6 = combine(#0,#0)
		r5 = add(r29,#0)
		p0 = cmp.eq(r9,#0)
		memw(r29+#16) = #0
	}
	{
		r3 = add(r5,#17)
		memd(r29+#8) = r7:6
		memd(r29+#0) = r7:6
	}
	{
		if (p0) jump:nt .LBB41_8
		r6 = memub(r4+r8<<#0)
		memb(r29+#18) = r6.new
	}
// %bb.1:                               // %for.cond
	{
		r2 = lsr(r2,#4)
		r6 = add(r5,#16)
	}
	{
		r5 = extractu(r2,#24,#4)
		r7 = and(r2,#15)
	}
	{
		p0 = cmp.eq(r5,#0); if (p0.new) jump:nt .LBB41_9
		r5 = memub(r4+r7<<#0)
		memb(r29+#17) = r5.new
	}
// %bb.2:                               // %for.cond.1
	{
		r3 = extractu(r2,#4,#4)
		r7 = extractu(r2,#20,#8)
		r5 = add(r29,#0)
	}
	{
		p0 = cmp.eq(r7,#0)
	}
	{
		r3 = memub(r4+r3<<#0)
		memb(r29+#16) = r3.new
	}
	{
		r3 = add(r5,#15)
		if (p0) jump:nt .LBB41_12
	}
// %bb.3:                               // %for.cond.2
	{
		r6 = extractu(r2,#16,#12)
		r7 = extractu(r2,#4,#8)
	}
	{
		p0 = cmp.eq(r6,#0)
		r6 = add(r5,#14)
	}
	{
		if (p0) jump:nt .LBB41_9
		r5 = memub(r4+r7<<#0)
		memb(r29+#15) = r5.new
	}
// %bb.4:                               // %for.cond.3
	{
		r3 = extractu(r2,#4,#12)
		r7 = extractu(r2,#12,#16)
		r5 = add(r29,#0)
	}
	{
		p0 = cmp.eq(r7,#0)
	}
	{
		r3 = memub(r4+r3<<#0)
		memb(r29+#14) = r3.new
	}
	{
		r3 = add(r5,#13)
		if (p0) jump:nt .LBB41_12
	}
// %bb.5:                               // %for.cond.4
	{
		r6 = extractu(r2,#8,#20)
		r7 = extractu(r2,#4,#16)
	}
	{
		p0 = cmp.eq(r6,#0)
		r6 = add(r5,#12)
	}
	{
		if (p0) jump:nt .LBB41_9
		r5 = memub(r4+r7<<#0)
		memb(r29+#13) = r5.new
	}
// %bb.6:                               // %for.cond.5
	{
		r3 = extractu(r2,#4,#20)
		r2 = extractu(r2,#4,#24)
		r7 = add(r29,#0)
	}
	{
		p0 = cmp.eq(r2,#0)
	}
	{
		r3 = memub(r4+r3<<#0)
		memb(r29+#12) = r3.new
	}
	{
		r3 = add(r7,#11)
		if (p0) jump:nt .LBB41_12
	}
// %bb.7:                               // %for.cond.6
	{
		r5 = r3
		r3 = add(r7,#10)
		r2 = memub(r4+r2<<#0)
		memb(r29+#11) = r2.new
	}
	{
		jump .LBB41_13
	}
.LBB41_8:
	{
		r5 = add(r5,#18)
		jump .LBB41_13
	}
.LBB41_9:
	{
		r5 = r3 ; jump .LBB41_13
		r3 = r6
	}
.LBB41_12:
	{
		r5 = r6
	}
.LBB41_13:                              // %cleanup
	{
		r2 = add(r5,#-2)
		r4 = #48
		memb(r3+#0) = #120
	}
	{
		call ##halide_string_to_string
		memb(r5+#-2) = r4
	}
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end41:
	.size	halide_pointer_to_string, .Lfunc_end41-halide_pointer_to_string
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
		memd(r29+#0) = r19:18
	}                                       // 8-byte Folded Spill
	{
		p0 = cmp.gtu(r2,#3); if (p0.new) jump:t .LBB42_1
	}
// %bb.2:                               // %switch.lookup
	{
		r1 = add(pc,##.Lswitch.table.halide_type_to_string@PCREL)
	}
	{
		jump .LBB42_3
		r2 = memw(r1+r2<<#2)
	}
.LBB42_1:
	{
		r2 = add(pc,##.L.str.18@PCREL)
	}
.LBB42_3:                               // %sw.epilog
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
.LBB42_4:                               // %if.then
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
.Lfunc_end42:
	.size	halide_type_to_string, .Lfunc_end42-halide_type_to_string
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
		allocframe(#32)
	}                                       // 8-byte Folded Spill
	{
		memd(r29+#16) = r19:18
		memd(r29+#8) = r21:20
	}                                       // 8-byte Folded Spill
	{
		if (p0) jump:nt .LBB43_1
		memd(r29+#0) = r23:22
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
		if (!cmp.gt(r1.new,#0)) jump:t .LBB43_6
	}
// %bb.4:                               // %for.body.lr.ph
	{
		r18 = add(pc,##.L.str.23@PCREL)
		r21 = #0
		r22 = #0
	}
	{
		r19 = add(pc,##.L.str.55@PCREL)
	}
	{
		r20 = add(pc,##.L.str.24@PCREL)
	}
	.p2align	4
.LBB43_5:                               // %for.body
                                        // =>This Inner Loop Header: Depth=1
	{
		call ##halide_string_to_string
		r1 = r16
		r2 = r18
	}
	{
		r4 = #1
		r1 = memw(r17+#32)
	}
	{
		r1 = r16
		r2 = memw(r1+r21<<#0)
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
		r1 = add(r1,r21)
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
		r1 = add(r1,r21)
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
		r21 = add(r21,#16)
		r22 = add(r22,#1)
	}
	{
		r1 = memw(r17+#28)
		if (cmp.gt(r1.new,r22)) jump:t .LBB43_5
	}
.LBB43_6:                               // %for.cond.cleanup
	{
		r2 = add(pc,##.L.str.8.44@PCREL)
		jump .LBB43_2
	}
.LBB43_1:                               // %if.then
	{
		r2 = add(pc,##.L.str.20@PCREL)
	}
.LBB43_2:                               // %if.then
	{
		r1 = r16
		r17:16 = memd(r29+#24)
		r19:18 = memd(r29+#16)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#8)
		r23:22 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_string_to_string
		r31:30 = deallocframe(r30):raw
	}
.Lfunc_end43:
	.size	halide_buffer_to_string, .Lfunc_end43-halide_buffer_to_string
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
.Lfunc_end44:
	.size	halide_malloc_alignment, .Lfunc_end44-halide_malloc_alignment
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
		if (p0) jump:nt .LBB45_3
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
		if (cmp.eq(r19.new,#0)) jump:t .LBB45_2
	}
	.p2align	4
.LBB45_4:                               // %for.body
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
		if (!cmp.eq(r19.new,#0)) jump:t .LBB45_4
	}
.LBB45_2:                               // %for.cond.cleanup
	{
		call ##halide_mutex_unlock
		r0 = memw(r18+##_ZN6Halide7Runtime8Internal21allocation_pools_lockE@GOT)
	}
.LBB45_3:                               // %if.end5
	{
		r0 = r17
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end45:
	.size	halide_reuse_device_allocations, .Lfunc_end45-halide_reuse_device_allocations
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
.Lfunc_end46:
	.size	halide_can_reuse_device_allocations, .Lfunc_end46-halide_can_reuse_device_allocations
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
.Lfunc_end47:
	.size	halide_register_device_allocation_pool, .Lfunc_end47-halide_register_device_allocation_pool
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
		r21:20 = combine(r3,r2)
		r18 = r0
		memd(r29+#32) = r19:18
		memd(r29+#24) = r21:20
	}                                       // 8-byte Folded Spill
	{
		memd(r29+#16) = r23:22
		memd(r29+#8) = r25:24
	}                                       // 8-byte Folded Spill
	{
		if (p0) jump:nt .LBB48_1
		memd(r29+#0) = r27:26
	}                                       // 8-byte Folded Spill
.LBB48_5:                               // %while.end
	{
		p0 = cmp.eq(r1,#-1); if (p0.new) jump:nt .LBB48_4
	}
// %bb.6:                               // %for.cond.preheader
	{
		r0 = addasl(r18,r1,#3)
		r3:2 = combine(#0,#0)
	}
	{
		r5:4 = memd(r0+#24)
	}
	{
		p0 = cmp.eq(r5:4,r3:2)
		if (p0.new) jump:nt .LBB48_10
	}
// %bb.7:                               // %for.body.lr.ph
	{
		r22 = add(r0,#24)
		r19 = add(r1,#-1)
		r23 = add(r0,#152)
		r24 = add(r0,#280)
	}
	{
		r27:26 = combine(#0,#1)
	}
	.p2align	4
.LBB48_8:                               // %for.body
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
		r1:0 = memd(r22+#0)
	}
	{
		p0 = cmp.gtu(r1:0,r27:26)
		if (!p0.new) jump:nt .LBB48_10
	}
// %bb.9:                               // %for.body.for.body_crit_edge
                                        //   in Loop: Header=BB48_8 Depth=1
	{
		r5:4 = combine(#0,#1)
		r1:0 = memd(r23+#0)
		r3:2 = memd(r24+#0)
	}
	{
		r21:20 = add(r1:0,r21:20)
		r27:26 = add(r27:26,r5:4)
	}
	{
		r17:16 = add(r3:2,r17:16)
		jump .LBB48_8
	}
.LBB48_10:                              // %if.end
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
.LBB48_1:                               // %land.rhs.preheader
	{
		r0 = asl(r1,#3)
		r4 = add(r1,#1)
		r3:2 = combine(#0,#1)
	}
	{
		loop0(.LBB48_2,r4)
		r0 = add(r0,add(r18,#24))
	}
.Ltmp8:                                 // Block address taken
.LBB48_2:                               // %land.rhs
                                        // =>This Inner Loop Header: Depth=1
	{
		r5:4 = memd(r0+#0)
	}
	{
		p0 = cmp.eq(r5:4,r3:2)
		if (!p0.new) jump:t .LBB48_5
	}
// %bb.3:                               // %while.body
                                        //   in Loop: Header=BB48_2 Depth=1
	{
		nop
		r0 = add(r0,#-8)
		r1 = add(r1,#-1)
	} :endloop0
.LBB48_4:                               // %if.then
	{
		r1:0 = memd(r18+#0)
		r5:4 = memd(r18+#8)
	}
	{
		r7:6 = add(r1:0,r21:20)
		r1:0 = add(r5:4,r17:16)
		r2 = memw(r18+#408)
		r17:16 = memd(r29+#40)
	}                                       // 8-byte Folded Reload
	{
		r1 = r6
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
.Lfunc_end48:
	.size	_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx, .Lfunc_end48-_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx
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
.LBB49_1:                               // %if.then
	{
		r1 = #15
		r5:4 = combine(#0,#0)
		r3:2 = memd(r0+#16)
	}
	{
		jump ##_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx
	}
.Lfunc_end49:
	.size	_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv, .Lfunc_end49-_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv
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
		r7:6 = combine(#0,#1)
		allocframe(r29,#456):raw
	}
	{
		r13:12 = combine(#0,#0)
		if (!p1) r5:4 = memd(r1+#0)
		r2 = memub(r1+#25)
	}
	{
		if (p1) r5 = #0
		r2 = add(r2,#7)
		if (p1) r4 = memw(r1+#12)
		memd(r29+#24) = r7:6
	}
	{
		if (!p0) r5:4 = memd(r3+#0)
		memd(r29+#0) = r5:4
	}
	{
		if (p0) r5 = #0
		if (p0) r4 = memw(r3+#12)
		memd(r29+#32) = r7:6
	}
	{
		r4 = lsr(r2,#3)
		r5 = #0
		r2 = memw(r1+#28)
		memd(r29+#8) = r5:4
	}
	{
		p0 = cmp.gt(r2,#0)
		memd(r29+#40) = r7:6
		memd(r29+#48) = r7:6
	}
	{
		memd(r29+#56) = r7:6
		memd(r29+#64) = r7:6
	}
	{
		memd(r29+#72) = r7:6
		memd(r29+#80) = r7:6
	}
	{
		memd(r29+#88) = r7:6
		memd(r29+#96) = r7:6
	}
	{
		memd(r29+#104) = r7:6
		memd(r29+#112) = r7:6
	}
	{
		memd(r29+#120) = r7:6
		memd(r29+#128) = r7:6
	}
	{
		r7:6 = combine(r5,r5)
		memd(r29+#136) = r7:6
		memd(r29+#144) = r7:6
	}
	{
		memd(r29+#448) = r17:16
		memd(r29+#440) = r19:18
	}                                       // 8-byte Folded Spill
	{
		memd(r29+#432) = r21:20
		memd(r29+#424) = r23:22
	}                                       // 8-byte Folded Spill
	{
		memd(r29+#152) = r13:12
		memd(r29+#280) = r13:12
	}
	{
		memd(r29+#160) = r13:12
		memd(r29+#288) = r13:12
	}
	{
		memd(r29+#168) = r13:12
		memd(r29+#296) = r13:12
	}
	{
		memd(r29+#176) = r13:12
		memd(r29+#304) = r13:12
	}
	{
		memd(r29+#184) = r13:12
		memd(r29+#312) = r13:12
	}
	{
		memd(r29+#192) = r13:12
		memd(r29+#320) = r13:12
	}
	{
		memd(r29+#200) = r13:12
		memd(r29+#328) = r13:12
	}
	{
		memd(r29+#208) = r13:12
		memd(r29+#336) = r13:12
	}
	{
		memd(r29+#408) = r5:4
		memd(r29+#216) = r13:12
	}
	{
		memd(r29+#344) = r13:12
		memd(r29+#224) = r13:12
	}
	{
		memd(r29+#352) = r13:12
		memd(r29+#232) = r13:12
	}
	{
		memd(r29+#360) = r13:12
		memd(r29+#240) = r13:12
	}
	{
		memd(r29+#368) = r13:12
		memd(r29+#248) = r13:12
	}
	{
		memd(r29+#376) = r13:12
		memd(r29+#256) = r13:12
	}
	{
		memd(r29+#384) = r13:12
		memd(r29+#264) = r13:12
	}
	{
		memd(r29+#392) = r13:12
		memd(r29+#272) = r13:12
	}
	{
		if (!p0) jump:nt .LBB50_7
		memd(r29+#400) = r13:12
	}
// %bb.1:                               // %for.body17.lr.ph
	{
		r5 = add(r2,#-1)
		r8 = memw(r1+#32)
		r9 = memw(r3+#32)
	}
	{
		r5 = and(r2,#7)
		p1 = cmp.gtu(r5,#6); if (p1.new) jump:t .LBB50_11
	}
// %bb.2:
	{
		r14 = #0
	}
	{
		p1 = cmp.eq(r5,#0); if (!p1.new) jump:t .LBB50_4
	}
	{
		jump .LBB50_7
	}
.LBB50_11:                              // %for.body17.lr.ph.new
	{
		r13 = and(r2,#-8)
		r10 = add(r8,#64)
		r12 = add(r9,#64)
		r7:6 = combine(#0,#0)
	}
	{
		r13 = lsr(r13,#3)
		r14 = #0
		r15 = memw(r10+#-56)
		r28 = memw(r12+#-64)
	}
	{
		p1 = cmp.gtu(r13,#1)
		r13 = add(r13,#-1)
		r14 = add(r14,#8)
		r11 = memw(r10+#-64)
	}
	{
		loop0(.LBB50_12,r13)
		r28 = sub(r28,r11)
		r16 = memw(r10+#-40)
		r13 = memw(r12+#-48)
	}
	{
		r7:6 += mpy(r28,r15)
		r11 = memw(r10+#-48)
		r17 = memw(r10+#-24)
	}
	{
		r13 = sub(r13,r11)
		r15 = memw(r12+#-32)
		r28 = memw(r10+#-32)
	}
	{
		r7:6 += mpy(r13,r16)
		r15 = sub(r15,r28)
		r13 = memw(r10+#-8)
		r11 = memw(r12+#-16)
	}
	{
		r7:6 += mpy(r15,r17)
		r28 = memw(r10+#-16)
		r16 = memw(r10+#8)
	}
	{
		r15 = sub(r11,r28)
		r28 = memw(r12+#0)
		r11 = memw(r10+#0)
	}
	{
		r7:6 += mpy(r15,r13)
		r15 = sub(r28,r11)
		r28 = memw(r10+#16)
		r13 = memw(r12+#16)
	}
	{
		r7:6 += mpy(r15,r16)
		r19 = sub(r13,r28)
		r18 = memw(r10+#24)
		r11 = memw(r12+#32)
	}
	{
		r16 = add(r12,#128)
		r13 = memw(r10+#32)
		r15 = memw(r10+#40)
	}
	{
		r11 = sub(r11,r13)
		r12 = add(r10,#128)
		r13 = memw(r12+#48)
		r28 = memw(r10+#56)
	}
	{
		r7:6 += mpy(r19,r18)
		if (!p1) jump:nt .LBB50_13
		r17 = memw(r10+#48)
	}
	.p2align	4
.LBB50_12:                              // %for.body17
                                        // =>This Inner Loop Header: Depth=1
	{
		r7:6 += mpy(r11,r15)
		r13 = sub(r13,r17)
		r14 = add(r14,#8)
		r15 = memw(r16+#-64)
	}
	{
		r7:6 += mpy(r13,r28)
		r10 = memw(r12+#-64)
		r11 = memw(r12+#-56)
	}
	{
		r13 = sub(r15,r10)
		r15 = memw(r16+#-48)
		r28 = memw(r12+#-48)
	}
	{
		r7:6 += mpy(r13,r11)
		r13 = sub(r15,r28)
		r10 = memw(r12+#-40)
		r15 = memw(r12+#-24)
	}
	{
		r17 = memw(r16+#-32)
		r18 = memw(r12+#-32)
	}
	{
		r7:6 += mpy(r13,r10)
		r13 = sub(r17,r18)
		r11 = memw(r12+#-8)
		r28 = memw(r16+#-16)
	}
	{
		r7:6 += mpy(r13,r15)
		r10 = memw(r12+#-16)
		r15 = memw(r12+#0)
	}
	{
		r13 = sub(r28,r10)
		r17 = memw(r16+#0)
		r22 = memw(r12+#8)
	}
	{
		r7:6 += mpy(r13,r11)
		r20 = sub(r17,r15)
		r28 = memw(r16+#16)
		r10 = memw(r12+#16)
	}
	{
		r7:6 += mpy(r20,r22)
		r10 = sub(r28,r10)
		r19 = memw(r12+#24)
		r11 = memw(r16+#32)
	}
	{
		r16 = add(r16,#128)
		r21 = memw(r12+#32)
		r13 = memw(r16+#48)
	}
	{
		r7:6 += mpy(r10,r19)
		r11 = sub(r11,r21)
		r15 = memw(r12+#40)
		r28 = memw(r12+#56)
	}
	{
		r12 = add(r12,#128)
		r17 = memw(r12+#48)
	} :endloop0
.LBB50_13:
	{
		r7:6 += mpy(r11,r15)
		r12 = sub(r13,r17)
	}
	{
		r7:6 += mpy(r12,r28)
	}
	{
		r13:12 = combine(r7,r6)
		p1 = cmp.eq(r5,#0); if (p1.new) jump:nt .LBB50_7
	}
.LBB50_4:                               // %for.body17.epil.preheader
	{
		r6 = addasl(r9,r14,#4)
		r7 = asl(r14,#4)
		r23 = add(r5,#-1)
		p1 = cmp.gtu(r5,#1)
	}
	{
		loop0(.LBB50_5,r23)
		r9 = add(r8,add(r7,#8))
	}
	{
		r7 = memw(r6++#16)
	}
	{
		r9 = add(r9,#16)
		if (!p1) jump:nt .LBB50_6
		r5 = memw(r9+#0)
		r8 = memw(r9+#-8)
	}
	.p2align	4
.LBB50_5:                               // %for.body17.epil
                                        // =>This Inner Loop Header: Depth=1
	{
		r14 = sub(r7,r8)
		r7 = memw(r6++#16)
		r8 = memw(r9+#-8)
	}
	{
		r13:12 += mpy(r14,r5)
		r9 = add(r9,#16)
		r5 = memw(r9+#0)
	} :endloop0
.LBB50_6:
	{
		r6 = sub(r7,r8)
	}
	{
		r13:12 += mpy(r6,r5)
	}
	{
		r7:6 = combine(r13,r12)
	}
.LBB50_7:                               // %for.cond.cleanup16
	{
		r9:8 = mpyu(r6,r4)
		r5 = memw(r3+#28)
	}
	{
		r9 += mpyi(r4,r7)
		p1 = cmp.eq(r2,r5)
	}
	{
		if (!p1) jump:nt .LBB50_10
		memd(r29+#16) = r9:8
	}
// %bb.8:                               // %lor.lhs.false
	{
		p1 = cmp.gt(r2,#16); if (p1.new) jump:nt .LBB50_10
	}
// %bb.9:                               // %lor.lhs.false
	{
		r5 = memub(r3+#25)
	}
	{
		r5 = add(r5,#7)
	}
	{
		r5 = lsr(r5,#3)
		if (!cmp.eq(r5.new,r4)) jump:nt .LBB50_10
	}
// %bb.14:                              // %if.end
	{
		p1 = cmp.eq(r4,#0); if (p1.new) jump:nt .LBB50_10
	}
// %bb.15:                              // %for.cond49.preheader
	{
		if (!p0) jump:nt .LBB50_26
	}
// %bb.16:                              // %for.body53.lr.ph
	{
		loop1(.LBB50_17,r2)
		r13 = add(r29,#0)
		r3 = memw(r3+#32)
		r1 = memw(r1+#32)
	}
	{
		r2 = add(r13,#24)
		r8 = add(r13,#152)
		r5 = #0
		r7:6 = combine(#0,#0)
	}
	{
		r9 = add(r13,#280)
		r12 = add(r13,#120)
		r13 = add(r13,#144)
		jump .LBB50_17
	}
	.p2align	4
.LBB50_38:                              // %for.cond.cleanup86
                                        //   in Loop: Header=BB50_17 Depth=1
	{
		r19:18 = mpyu(r11,r4)
		r28 = asr(r11,#31)
		r5 = add(r5,#1)
		r16 = memw(r28+#4)
	}
	{
		r19 += mpyi(r4,r28)
		r17 = asr(r16,#31)
		r13 = add(r13,#8)
		memd(r9+r10<<#3) = r15:14
	}
	{
		nop
		memd(r2+r10<<#3) = r17:16
		memd(r8+r10<<#3) = r19:18
	} :endloop1
	{
		jump .LBB50_22
	}
.Ltmp9:                                 // Block address taken
.LBB50_17:                              // %for.body53
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB50_20 Depth 2
                                        //     Child Loop BB50_33 Depth 2
                                        //     Child Loop BB50_37 Depth 2
	{
		r28 = addasl(r3,r5,#4)
		p0 = cmp.eq(r5,#0)
		r10 = #0
	}
	{
		r14 = memw(r28+#8)
	}
	{
		r11 = asr(r14,#31)
	}
	{
		r15:14 = mpyu(r14,r4)
	}
	{
		r15 += mpyi(r4,r11)
		if (p0) jump:nt .LBB50_30
	}
// %bb.18:                              // %for.body74.lr.ph
                                        //   in Loop: Header=BB50_17 Depth=1
	{
		p0 = cmp.eq(r15:14,r7:6)
		r11:10 = combine(#0,r5)
		if (p0.new) jump:nt .LBB50_30
	}
// %bb.19:                              //   in Loop: Header=BB50_17 Depth=1
	{
		loop0(.LBB50_20,r5)
		r10 = r9
	}
	.p2align	4
.Ltmp10:                                // Block address taken
.LBB50_20:                              // %for.body74.us
                                        //   Parent Loop BB50_17 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	{
		r17:16 = memd(r10+#0)
	}
	{
		p0 = cmp.gtu(r17:16,r15:14)
		if (p0.new) jump:nt .LBB50_21
	}
// %bb.28:                              // %for.inc81.us
                                        //   in Loop: Header=BB50_20 Depth=2
	{
		r11 = add(r11,#1)
		r10 = add(r10,#8)
	} :endloop0
// %bb.29:                              //   in Loop: Header=BB50_17 Depth=1
	{
		r10 = r5
	}
	.p2align	4
.LBB50_30:                              // %for.end83
                                        //   in Loop: Header=BB50_17 Depth=1
	{
		r11 = addasl(r1,r5,#4)
		p0 = cmp.gtu(r5,r10)
	}
	{
		if (!p0) jump:nt .LBB50_38
		r11 = memw(r11+#8)
	}
.LBB50_31:                              // %for.body87.preheader
                                        //   in Loop: Header=BB50_17 Depth=1
	{
		r17 = sub(r5,r10)
		r16 = r5
	}
	{
		p0 = bitsclr(r17,#7)
		if (p0.new) jump:nt .LBB50_35
	}
// %bb.32:                              //   in Loop: Header=BB50_17 Depth=1
	{
		r16 = and(r17,#7)
		r17 = add(r13,#-8)
		r19:18 = memd(r13+#-128)
		r21:20 = memd(r13+#0)
	}
	{
		r22 = add(r16,#-1)
		p0 = cmp.gtu(r16,#1)
		memd(r13+#-120) = r19:18
		memd(r13+#8) = r21:20
	}
	{
		loop0(.LBB50_33,r22)
		r16 = add(r5,#-1)
		r21:20 = combine(r13,r13)
		r19:18 = memd(r13+#128)
	}
	{
		if (!p0) jump:nt .LBB50_34
	}
	.p2align	4
.LBB50_33:                              // %for.body87.prol
                                        //   Parent Loop BB50_17 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	{
		r20 = r17
		r17 = add(r17,#-8)
		r16 = add(r16,#-1)
		memd(r21+#136) = r19:18
	}
	{
		r21 = r20
		r19:18 = memd(r20+#0)
		r23:22 = memd(r20+#-128)
	}
	{
		r19:18 = memd(r20+#128)
		memd(r20+#8) = r19:18
	}
	{
		nop
		memd(r20+#-120) = r23:22
	} :endloop0
.LBB50_34:                              //   in Loop: Header=BB50_17 Depth=1
	{
		memd(r20+#136) = r19:18
	}
.LBB50_35:                              // %for.body87.prol.loopexit
                                        //   in Loop: Header=BB50_17 Depth=1
	{
		r17 = sub(#-1,r10)
	}
	{
		r17 = add(r5,r17)
		if (!cmp.gtu(r17.new,#6)) jump:t .LBB50_38
	}
// %bb.36:                              // %for.body87.preheader1
                                        //   in Loop: Header=BB50_17 Depth=1
	{
		r16 = addasl(r12,r16,#3)
		r17 = sub(r16,r10)
	}
	{
		r17 = add(r17,#7)
	}
	{
		r17 = lsr(r17,#3)
	}
	{
		loop0(.LBB50_37,r17)
	}
	.p2align	4
.Ltmp11:                                // Block address taken
.LBB50_37:                              // %for.body87
                                        //   Parent Loop BB50_17 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	{
		r19:18 = memd(r16+#-104)
		r23:22 = memd(r16+#-112)
	}
	{
		r21:20 = memd(r16+#152)
		memd(r16+#-96) = r19:18
	}
	{
		r19:18 = memd(r16+#24)
		memd(r16+#160) = r21:20
	}
	{
		r21:20 = memd(r16+#144)
		memd(r16+#-104) = r23:22
	}
	{
		r23:22 = memd(r16+#-120)
		memd(r16+#32) = r19:18
	}
	{
		r19:18 = memd(r16+#16)
		memd(r16+#152) = r21:20
	}
	{
		r21:20 = memd(r16+#136)
		memd(r16+#-112) = r23:22
	}
	{
		r23:22 = memd(r16+#-128)
		memd(r16+#24) = r19:18
	}
	{
		r19:18 = memd(r16+#8)
		memd(r16+#144) = r21:20
	}
	{
		r21:20 = memd(r16+#128)
		memd(r16+#16) = r19:18
	}
	{
		r19:18 = memd(r16+#0)
		memd(r16+#136) = r21:20
	}
	{
		r19:18 = memd(r16+#-136)
		memd(r16+#8) = r19:18
	}
	{
		r21:20 = memd(r16+#120)
		memd(r16+#-128) = r19:18
	}
	{
		r19:18 = memd(r16+#-144)
		memd(r16+#-120) = r23:22
	}
	{
		r23:22 = memd(r16+#-8)
		memd(r16+#128) = r21:20
	}
	{
		r21:20 = memd(r16+#112)
		memd(r16+#-136) = r19:18
	}
	{
		r19:18 = memd(r16+#-152)
		memd(r16+#0) = r23:22
	}
	{
		r23:22 = memd(r16+#-16)
		memd(r16+#120) = r21:20
	}
	{
		r21:20 = memd(r16+#104)
		memd(r16+#-144) = r19:18
	}
	{
		r19:18 = memd(r16+#-160)
		memd(r16+#-8) = r23:22
	}
	{
		r23:22 = memd(r16+#-24)
		memd(r16+#112) = r21:20
	}
	{
		r21:20 = memd(r16+#96)
		memd(r16+#-16) = r23:22
	}
	{
		r23:22 = memd(r16+#-32)
		memd(r16+#-152) = r19:18
	}
	{
		r16 = add(r16,#-64)
		memd(r16+#104) = r21:20
		memd(r16+#-24) = r23:22
	} :endloop0
	{
		jump .LBB50_38
	}
.LBB50_21:                              //   in Loop: Header=BB50_17 Depth=1
	{
		r11 = addasl(r1,r5,#4)
		r10 = r11
	}
	{
		p0 = cmp.gtu(r5,r10)
	}
	{
		if (!p0) jump:nt .LBB50_38
		r11 = memw(r11+#8)
	}
	{
		jump .LBB50_31
	}
.LBB50_10:                              // %if.then
	{
		call ##memset
		r1 = #0
		r2 = #416
	}
.LBB50_27:                              // %cleanup
	{
		r17:16 = memd(r29+#448)
		r19:18 = memd(r29+#440)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#432)
		r23:22 = memd(r29+#424)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB50_22:                              // %while.cond.preheader
	{
		r3:2 = memd(r29+#408)
		r5:4 = memd(r29+#152)
	}
	{
		p0 = cmp.eq(r3:2,r5:4)
		if (!p0.new) jump:t .LBB50_26
	}
// %bb.23:                              // %land.rhs.lr.ph
	{
		r7:6 = combine(#0,#1)
		r9:8 = combine(#0,#0)
		r5:4 = memd(r29+#280)
	}
	.p2align	4
.LBB50_24:                              // %land.rhs
                                        // =>This Inner Loop Header: Depth=1
	{
		p0 = cmp.eq(r3:2,r5:4)
		if (!p0.new) jump:nt .LBB50_26
	}
// %bb.25:                              // %while.body
                                        //   in Loop: Header=BB50_24 Depth=1
	{
		r17:16 = memd(r29+#40)
		r3:2 = memd(r29+#32)
	}
	{
		r21:20 = memd(r29+#48)
		memd(r29+#32) = r17:16
	}
	{
		r15:14 = memd(r29+#24)
		memd(r29+#40) = r21:20
	}
	{
		r19:18 = memd(r29+#168)
		memd(r29+#24) = r3:2
	}
	{
		r3:2 = mpyu(r14,r4)
		r13:12 = memd(r29+#160)
		memd(r29+#160) = r19:18

	} :mem_noshuf
	{
		r3 += mpyi(r14,r5)
		r23:22 = memd(r29+#176)
		r19:18 = memd(r29+#56)
	}
	{
		r3 += mpyi(r4,r15)
		r23:22 = memd(r29+#184)
		memd(r29+#168) = r23:22
	}
	{
		p0 = cmp.eq(r3:2,r13:12)
		r23:22 = memd(r29+#64)
		memd(r29+#176) = r23:22
	}
	{
		r11:10 = memd(r29+#296)
		memd(r29+#56) = r23:22
	}
	{
		r21:20 = memd(r29+#304)
		memd(r29+#48) = r19:18
	}
	{
		r23:22 = memd(r29+#72)
		memd(r29+#296) = r21:20
	}
	{
		r19:18 = memd(r29+#312)
		memd(r29+#64) = r23:22
	}
	{
		r21:20 = memd(r29+#192)
		memd(r29+#304) = r19:18
	}
	{
		r23:22 = memd(r29+#80)
		memd(r29+#184) = r21:20
	}
	{
		r19:18 = memd(r29+#320)
		memd(r29+#72) = r23:22
	}
	{
		r21:20 = memd(r29+#200)
		memd(r29+#312) = r19:18
	}
	{
		r23:22 = memd(r29+#88)
		memd(r29+#192) = r21:20
	}
	{
		r19:18 = memd(r29+#328)
		memd(r29+#80) = r23:22
	}
	{
		r21:20 = memd(r29+#208)
		memd(r29+#320) = r19:18
	}
	{
		r23:22 = memd(r29+#96)
		memd(r29+#200) = r21:20
	}
	{
		r19:18 = memd(r29+#336)
		memd(r29+#88) = r23:22
	}
	{
		r21:20 = memd(r29+#216)
		memd(r29+#328) = r19:18
	}
	{
		r23:22 = memd(r29+#224)
		memd(r29+#208) = r21:20
	}
	{
		r5:4 = memd(r29+#288)
		memd(r29+#216) = r23:22
	}
	{
		r21:20 = memd(r29+#104)
		memd(r29+#288) = r11:10
	}
	{
		r19:18 = memd(r29+#344)
		memd(r29+#96) = r21:20
	}
	{
		r19:18 = memd(r29+#352)
		memd(r29+#336) = r19:18
	}
	{
		r23:22 = memd(r29+#232)
		memd(r29+#344) = r19:18
	}
	{
		r21:20 = memd(r29+#112)
		memd(r29+#224) = r23:22
	}
	{
		r19:18 = memd(r29+#360)
		memd(r29+#104) = r21:20
	}
	{
		r21:20 = memd(r29+#240)
		memd(r29+#352) = r19:18
	}
	{
		r23:22 = memd(r29+#368)
		memd(r29+#232) = r21:20
	}
	{
		r19:18 = memd(r29+#120)
		memd(r29+#360) = r23:22
	}
	{
		r19:18 = memd(r29+#248)
		memd(r29+#112) = r19:18
	}
	{
		r23:22 = memd(r29+#128)
		memd(r29+#240) = r19:18
	}
	{
		r21:20 = memd(r29+#376)
		memd(r29+#120) = r23:22
	}
	{
		r23:22 = memd(r29+#256)
		memd(r29+#368) = r21:20
	}
	{
		r19:18 = memd(r29+#384)
		memd(r29+#248) = r23:22
	}
	{
		r21:20 = memd(r29+#136)
		memd(r29+#376) = r19:18
	}
	{
		r19:18 = memd(r29+#144)
		memd(r29+#128) = r21:20
	}
	{
		r21:20 = memd(r29+#264)
		memd(r29+#136) = r19:18
	}
	{
		r23:22 = memd(r29+#392)
		memd(r29+#256) = r21:20
	}
	{
		r21:20 = memd(r29+#272)
		memd(r29+#384) = r23:22
	}
	{
		r23:22 = memd(r29+#400)
		memd(r29+#408) = r3:2
	}
	{
		memd(r29+#152) = r13:12
		memd(r29+#264) = r21:20
	}
	{
		memd(r29+#280) = r5:4
		memd(r29+#392) = r23:22
	}
	{
		memd(r29+#144) = r7:6
		memd(r29+#272) = r9:8
	}
	{
		if (p0) jump:nt .LBB50_24
		memd(r29+#400) = r9:8
	}
.LBB50_26:                              // %while.end
	{
		call ##__hexagon_memcpy_likely_aligned_min32bytes_mult8bytes
		r1 = add(r29,#0)
		r2 = #416
	}
	{
		jump .LBB50_27
	}
.Ltmp12:                                // Address of block that was removed by CodeGen
.Ltmp13:                                // Address of block that was removed by CodeGen
.Ltmp14:                                // Address of block that was removed by CodeGen
.Lfunc_end50:
	.size	_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b, .Lfunc_end50-_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b
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
		memd(r29+#0) = r19:18
	}                                       // 8-byte Folded Spill
	{
		p0 = !tstbit(r2,#1)
		if (p0.new) jump:t .LBB51_6
	}
// %bb.1:                               // %if.end
	{
		r17 = #-14
		p0 = tstbit(r2,#0); if (p0.new) jump:t .LBB51_6
	}
// %bb.2:                               // %if.end9
	{
		r16 = r1
		r18 = r0
		r0 = memw(r1+#8)
	}
	{
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB51_3
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
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB51_5
	}
.LBB51_6:                               // %return
	{
		r0 = r17
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB51_3:
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
.LBB51_5:                               // %if.end23
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
.Lfunc_end51:
	.size	_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t, .Lfunc_end51-_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t
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
.Lfunc_end52:
	.size	halide_device_release, .Lfunc_end52-halide_device_release
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
		p0 = cmp.eq(r17,#0); if (p0.new) jump:nt .LBB53_1
	}
// %bb.2:                               // %if.end.i
	{
		r3:2 = combine(#0,#0)
		r4 = memw(r17+#8)
		r1:0 = memd(r17+#0)
	}
	{
		p1 = cmp.eq(r1:0,r3:2)
		p0 = cmp.eq(r4,#0)
		if (p1.new) jump:nt .LBB53_5
	}
// %bb.3:                               // %if.end.i
	{
		if (!p0) jump:nt .LBB53_5
	}
// %bb.4:                               // %if.then8.i
	{
		call ##halide_error_no_device_interface
		r0 = r16
	}
	{
		r18 = r0
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB53_12
	}
	{
		jump .LBB53_11
	}
.LBB53_1:                               // %if.then.i
	{
		r1 = add(pc,##.L.str.6.17@PCREL)
		r0 = r16
	}
	{
		call ##halide_error_buffer_is_null
	}
	{
		r18 = r0
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB53_12
	}
	{
		jump .LBB53_11
	}
.LBB53_5:                               // %if.end10.i
	{
		if (p0) jump:nt .LBB53_8
	}
// %bb.6:                               // %if.end10.i
	{
		r3:2 = combine(#0,#0)
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (!p0.new) jump:nt .LBB53_8
	}
// %bb.7:                               // %if.then14.i
	{
		call ##halide_error_device_interface_no_device
		r0 = r16
	}
	{
		r18 = r0
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB53_12
	}
	{
		jump .LBB53_11
	}
.LBB53_8:                               // %if.end16.i
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
		if (!p0.new) jump:t .LBB53_11
	}
// %bb.9:                               // %if.then24.i
	{
		call ##halide_error_host_and_device_dirty
		r0 = r16
	}
	{
		r18 = r0
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB53_12
	}
.LBB53_11:                              // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split
	{
		call ##_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t
		r1:0 = combine(r17,r16)
	}
	{
		r18 = r0
	}
.LBB53_12:                              // %cleanup
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
.Lfunc_end53:
	.size	halide_copy_to_host, .Lfunc_end53-halide_copy_to_host
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
		if (p0) jump:nt .LBB54_1
		r18 = r2
		memd(r29+#0) = r19:18
	}                                       // 8-byte Folded Spill
// %bb.2:                               // %if.end.i
	{
		r3:2 = combine(#0,#0)
		r4 = memw(r16+#8)
		r1:0 = memd(r16+#0)
	}
	{
		p1 = cmp.eq(r1:0,r3:2)
		p0 = cmp.eq(r4,#0)
		if (p1.new) jump:nt .LBB54_5
	}
// %bb.3:                               // %if.end.i
	{
		if (!p0) jump:nt .LBB54_5
	}
// %bb.4:                               // %if.then8.i
	{
		call ##halide_error_no_device_interface
		r0 = r17
	}
	{
		r19 = r0
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB54_21
	}
	{
		jump .LBB54_11
	}
.LBB54_1:                               // %if.then.i
	{
		r1 = add(pc,##.L.str.7.18@PCREL)
		r0 = r17
	}
	{
		call ##halide_error_buffer_is_null
	}
	{
		r19 = r0
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB54_21
	}
	{
		jump .LBB54_11
	}
.LBB54_5:                               // %if.end10.i
	{
		if (p0) jump:nt .LBB54_8
	}
// %bb.6:                               // %if.end10.i
	{
		r3:2 = combine(#0,#0)
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (!p0.new) jump:nt .LBB54_8
	}
// %bb.7:                               // %if.then14.i
	{
		call ##halide_error_device_interface_no_device
		r0 = r17
	}
	{
		r19 = r0
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB54_11
	}
.LBB54_21:                              // %cleanup
	{
		r0 = r19
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB54_8:                               // %if.end16.i
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
		if (!p0.new) jump:t .LBB54_11
	}
// %bb.9:                               // %if.then24.i
	{
		call ##halide_error_host_and_device_dirty
		r0 = r17
	}
	{
		r19 = r0
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB54_21
	}
.LBB54_11:                              // %if.end
	{
		p0 = cmp.eq(r18,#0); if (!p0.new) jump:t .LBB54_13
	}
// %bb.12:                              // %if.then2
	{
		r18 = memw(r16+#8)
		if (cmp.eq(r18.new,#0)) jump:nt .LBB54_22
	}
.LBB54_13:                              // %if.end11
	{
		r3:2 = combine(#0,#0)
		r1:0 = memd(r16+#0)
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (p0.new) jump:nt .LBB54_16
	}
// %bb.14:                              // %land.lhs.true
	{
		r0 = memw(r16+#8)
		if (cmp.eq(r0.new,r18)) jump:nt .LBB54_17
	}
// %bb.15:                              // %if.then14
	{
		r1 = add(pc,##.L.str.9.19@PCREL)
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
.LBB54_16:                              // %if.then18
	{
		call ##halide_device_malloc
		r1:0 = combine(r16,r17)
		r2 = r18
	}
	{
		r19 = r0
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB54_21
	}
.LBB54_17:                              // %if.end27
	{
		r19 = #0
		r1:0 = memd(r16+#16)
	}
	{
		p0 = tstbit(r0,#0); if (!p0.new) jump:t .LBB54_21
	}
// %bb.18:                              // %if.then29
	{
		p0 = tstbit(r0,#1)
		r19 = #-15
		if (p0.new) jump:t .LBB54_21
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
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB54_21
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
.LBB54_22:                              // %if.then7
	{
		r0 = r17
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_error_no_device_interface
		r31:30 = deallocframe(r30):raw
	}
.Lfunc_end54:
	.size	copy_to_device_already_locked, .Lfunc_end54-copy_to_device_already_locked
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
		if (p0) jump:nt .LBB55_1
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
		if (p1.new) jump:nt .LBB55_5
	}
// %bb.3:                               // %if.end.i
	{
		if (!p0) jump:nt .LBB55_5
	}
// %bb.4:                               // %if.then8.i
	{
		call ##halide_error_no_device_interface
		r0 = r18
	}
	{
		jump .LBB55_10
	}
.LBB55_1:                               // %if.then.i
	{
		r1 = add(pc,##.L.str.17.20@PCREL)
		r0 = r18
	}
	{
		call ##halide_error_buffer_is_null
	}
	{
		jump .LBB55_10
	}
.LBB55_5:                               // %if.end10.i
	{
		if (p0) jump:nt .LBB55_8
	}
// %bb.6:                               // %if.end10.i
	{
		r5:4 = combine(#0,#0)
	}
	{
		p0 = cmp.eq(r3:2,r5:4)
		if (!p0.new) jump:nt .LBB55_8
	}
// %bb.7:                               // %if.then14.i
	{
		call ##halide_error_device_interface_no_device
		r0 = r18
	}
	{
		jump .LBB55_10
	}
.LBB55_8:                               // %if.end16.i
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
		if (!p0.new) jump:t .LBB55_12
	}
// %bb.9:                               // %if.then24.i
	{
		call ##halide_error_host_and_device_dirty
		r0 = r18
	}
.LBB55_10:                              // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
	{
		p0 = cmp.eq(r0,#0)
		if (!p0.new) r17:16 = memd(r29+#8)
		if (!p0.new) r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		if (!p0) r31:30 = dealloc_return(r30):raw
	}
.LBB55_11:                              // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	{
		r0 = memw(r17+#8)
	}
.LBB55_12:                              // %if.end
	{
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB55_15
	}
// %bb.13:                              // %if.end
	{
		p0 = cmp.eq(r0,r16); if (p0.new) jump:nt .LBB55_15
	}
// %bb.14:                              // %if.then6
	{
		r1 = add(pc,##.L.str.20.21@PCREL)
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
.LBB55_15:                              // %if.end7
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
.Lfunc_end55:
	.size	halide_device_malloc, .Lfunc_end55-halide_device_malloc
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
		r19:18 = combine(r1,r2)
		r16 = r0
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
.Lfunc_end56:
	.size	halide_copy_to_device, .Lfunc_end56-halide_copy_to_device
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
		if (p0) jump:nt .LBB57_1
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
		if (p1.new) jump:nt .LBB57_5
	}
// %bb.3:                               // %if.end.i
	{
		if (!p0) jump:nt .LBB57_5
	}
// %bb.4:                               // %if.then8.i
	{
		call ##halide_error_no_device_interface
		r0 = r17
	}
	{
		jump .LBB57_10
	}
.LBB57_1:                               // %if.then.i
	{
		r1 = add(pc,##.L.str.16.22@PCREL)
		r0 = r17
	}
	{
		call ##halide_error_buffer_is_null
	}
	{
		jump .LBB57_10
	}
.LBB57_5:                               // %if.end10.i
	{
		if (p0) jump:nt .LBB57_8
	}
// %bb.6:                               // %if.end10.i
	{
		r5:4 = combine(#0,#0)
	}
	{
		p0 = cmp.eq(r3:2,r5:4)
		if (!p0.new) jump:nt .LBB57_8
	}
// %bb.7:                               // %if.then14.i
	{
		call ##halide_error_device_interface_no_device
		r0 = r17
	}
	{
		jump .LBB57_10
	}
.LBB57_8:                               // %if.end16.i
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
		if (!p0.new) jump:t .LBB57_12
	}
// %bb.9:                               // %if.then24.i
	{
		call ##halide_error_host_and_device_dirty
		r0 = r17
	}
.LBB57_10:                              // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
	{
		p0 = cmp.eq(r0,#0)
		if (!p0.new) r17:16 = memd(r29+#0)
		if (!p0.new) r31:30 = dealloc_return(r30):t:raw
	}                                       // 8-byte Folded Reload
.LBB57_11:                              // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	{
		r0 = memw(r16+#8)
	}
.LBB57_12:                              // %if.end
	{
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB57_14
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
.LBB57_14:                              // %if.then3
	{
		r0 = r17
		r17:16 = memd(r29+#0)
		deallocframe
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_error_no_device_interface
	}
.Lfunc_end57:
	.size	halide_device_sync, .Lfunc_end57-halide_device_sync
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
		if (p0) jump:nt .LBB58_1
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
		if (p1.new) jump:nt .LBB58_5
	}
// %bb.3:                               // %if.end.i
	{
		if (!p0) jump:nt .LBB58_5
	}
// %bb.4:                               // %if.then8.i
	{
		call ##halide_error_no_device_interface
		r0 = r16
	}
	{
		jump .LBB58_10
	}
.LBB58_1:                               // %if.then.i
	{
		r1 = add(pc,##.L.str.21.23@PCREL)
		r0 = r16
	}
	{
		call ##halide_error_buffer_is_null
	}
	{
		jump .LBB58_10
	}
.LBB58_5:                               // %if.end10.i
	{
		if (p0) jump:nt .LBB58_8
	}
// %bb.6:                               // %if.end10.i
	{
		r3:2 = combine(#0,#0)
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (!p0.new) jump:nt .LBB58_8
	}
// %bb.7:                               // %if.then14.i
	{
		call ##halide_error_device_interface_no_device
		r0 = r16
	}
	{
		jump .LBB58_10
	}
.LBB58_8:                               // %if.end16.i
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
		if (!p0.new) jump:t .LBB58_12
	}
// %bb.9:                               // %if.then24.i
	{
		call ##halide_error_host_and_device_dirty
		r0 = r16
	}
.LBB58_10:                              // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
	{
		p0 = cmp.eq(r0,#0)
		if (!p0.new) r17:16 = memd(r29+#8)
		if (!p0.new) r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		if (!p0) r31:30 = dealloc_return(r30):raw
	}
.LBB58_11:                              // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	{
		r18 = memw(r17+#8)
	}
.LBB58_12:                              // %if.end
	{
		p0 = cmp.eq(r18,#0); if (p0.new) jump:nt .LBB58_16
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
		if (p0.new) jump:nt .LBB58_15
	}
// %bb.14:                              // %if.then8
	{
		r1 = add(pc,##.L.str.22.24@PCREL)
		r0 = r16
	}
	{
		call ##halide_print
	}
	{
		call ##abort
	}
.LBB58_15:                              // %do.end
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
.LBB58_16:                              // %if.end11
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
.Lfunc_end58:
	.size	halide_device_free, .Lfunc_end58-halide_device_free
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
.Lfunc_end59:
	.size	halide_device_free_as_destructor, .Lfunc_end59-halide_device_free_as_destructor
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
		if (p0) jump:nt .LBB60_1
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
		if (p1.new) jump:nt .LBB60_5
	}
// %bb.3:                               // %if.end.i
	{
		if (!p0) jump:nt .LBB60_5
	}
// %bb.4:                               // %if.then8.i
	{
		call ##halide_error_no_device_interface
		r0 = r16
	}
	{
		jump .LBB60_10
	}
.LBB60_1:                               // %if.then.i
	{
		r1 = add(pc,##.L.str.23.25@PCREL)
		r0 = r16
	}
	{
		call ##halide_error_buffer_is_null
	}
	{
		jump .LBB60_10
	}
.LBB60_5:                               // %if.end10.i
	{
		if (p0) jump:nt .LBB60_8
	}
// %bb.6:                               // %if.end10.i
	{
		r5:4 = combine(#0,#0)
	}
	{
		p0 = cmp.eq(r3:2,r5:4)
		if (!p0.new) jump:nt .LBB60_8
	}
// %bb.7:                               // %if.then14.i
	{
		call ##halide_error_device_interface_no_device
		r0 = r16
	}
	{
		jump .LBB60_10
	}
.LBB60_8:                               // %if.end16.i
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
		if (!p0.new) jump:t .LBB60_12
	}
// %bb.9:                               // %if.then24.i
	{
		call ##halide_error_host_and_device_dirty
		r0 = r16
	}
.LBB60_10:                              // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
	{
		p0 = cmp.eq(r0,#0)
		if (!p0.new) r17:16 = memd(r29+#8)
		if (!p0.new) r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		if (!p0) r31:30 = dealloc_return(r30):raw
	}
.LBB60_11:                              // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	{
		r0 = memw(r18+#8)
	}
.LBB60_12:                              // %if.end
	{
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB60_15
	}
// %bb.13:                              // %if.end
	{
		p0 = cmp.eq(r0,r17); if (p0.new) jump:nt .LBB60_15
	}
// %bb.14:                              // %if.then6
	{
		r1 = add(pc,##.L.str.25.26@PCREL)
		r0 = r16
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
.LBB60_15:                              // %if.end7
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
		p0 = cmp.eq(r17,#0); if (p0.new) jump:nt .LBB60_16
	}
// %bb.17:                              // %if.then12
	{
		r1 = add(pc,##.L.str.26@PCREL)
		r0 = r16
	}
	{
		call ##halide_error
	}
	{
		r0 = #-16
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB60_16:
	{
		r0 = #0
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end60:
	.size	halide_device_and_host_malloc, .Lfunc_end60-halide_device_and_host_malloc
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
		if (p0) jump:nt .LBB61_1
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
		if (p1.new) jump:nt .LBB61_5
	}
// %bb.3:                               // %if.end.i
	{
		if (!p0) jump:nt .LBB61_5
	}
// %bb.4:                               // %if.then8.i
	{
		call ##halide_error_no_device_interface
		r0 = r17
	}
	{
		jump .LBB61_10
	}
.LBB61_1:                               // %if.then.i
	{
		r1 = add(pc,##.L.str.27@PCREL)
		r0 = r17
	}
	{
		call ##halide_error_buffer_is_null
	}
	{
		jump .LBB61_10
	}
.LBB61_5:                               // %if.end10.i
	{
		if (p0) jump:nt .LBB61_8
	}
// %bb.6:                               // %if.end10.i
	{
		r3:2 = combine(#0,#0)
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (!p0.new) jump:nt .LBB61_8
	}
// %bb.7:                               // %if.then14.i
	{
		call ##halide_error_device_interface_no_device
		r0 = r17
	}
	{
		jump .LBB61_10
	}
.LBB61_8:                               // %if.end16.i
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
		if (!p0.new) jump:t .LBB61_12
	}
// %bb.9:                               // %if.then24.i
	{
		call ##halide_error_host_and_device_dirty
		r0 = r17
	}
.LBB61_10:                              // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
	{
		p0 = cmp.eq(r0,#0)
		if (!p0.new) r17:16 = memd(r29+#8)
		if (!p0.new) r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		if (!p0) r31:30 = dealloc_return(r30):raw
	}
.LBB61_11:                              // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	{
		r18 = memw(r16+#8)
	}
.LBB61_12:                              // %if.end
	{
		p0 = cmp.eq(r18,#0); if (p0.new) jump:nt .LBB61_16
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
		if (p0.new) jump:nt .LBB61_15
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
.LBB61_15:                              // %do.end
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
.LBB61_16:                              // %if.else11
	{
		r1 = memw(r16+#12)
		if (cmp.eq(r1.new,#0)) jump:nt .LBB61_18
	}
// %bb.17:                              // %if.then13
	{
		call ##halide_free
		r0 = r17
	}
	{
		memw(r16+#12) = #0
	}
.LBB61_18:                              // %if.end17
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
.Lfunc_end61:
	.size	halide_device_and_host_free, .Lfunc_end61-halide_device_and_host_free
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
		allocframe(#16)
	}                                       // 8-byte Folded Spill
	{
		if (p0) jump:nt .LBB62_1
		r18 = r2
		memd(r29+#0) = r19:18
	}                                       // 8-byte Folded Spill
// %bb.2:                               // %if.end.i
	{
		r3:2 = combine(#0,#0)
		r4 = memw(r16+#8)
		r1:0 = memd(r16+#0)
	}
	{
		p1 = cmp.eq(r1:0,r3:2)
		p0 = cmp.eq(r4,#0)
		if (p1.new) jump:nt .LBB62_5
	}
// %bb.3:                               // %if.end.i
	{
		if (!p0) jump:nt .LBB62_5
	}
// %bb.4:                               // %if.then8.i
	{
		call ##halide_error_no_device_interface
		r0 = r17
	}
	{
		r19 = r0
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB62_69
	}
	{
		jump .LBB62_11
	}
.LBB62_1:                               // %if.then.i
	{
		r1 = add(pc,##.L.str.29@PCREL)
		r0 = r17
	}
	{
		call ##halide_error_buffer_is_null
	}
	{
		r19 = r0
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB62_69
	}
	{
		jump .LBB62_11
	}
.LBB62_5:                               // %if.end10.i
	{
		if (p0) jump:nt .LBB62_8
	}
// %bb.6:                               // %if.end10.i
	{
		r3:2 = combine(#0,#0)
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (!p0.new) jump:nt .LBB62_8
	}
// %bb.7:                               // %if.then14.i
	{
		call ##halide_error_device_interface_no_device
		r0 = r17
	}
	{
		r19 = r0
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB62_11
	}
.LBB62_69:                              // %cleanup13
	{
		r0 = r19
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB62_8:                               // %if.end16.i
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
		if (!p0.new) jump:t .LBB62_11
	}
// %bb.9:                               // %if.then24.i
	{
		call ##halide_error_host_and_device_dirty
		r0 = r17
	}
	{
		r19 = r0
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB62_69
	}
.LBB62_11:                              // %if.end
	{
		r4 = memw(r16+#28)
		if (!cmp.gt(r4.new,#0)) jump:nt .LBB62_12
	}
// %bb.13:                              // %for.body.lr.ph.i.i
	{
		r2 = and(r4,#7)
		r0 = add(r4,#-1)
		r1 = memw(r16+#32)
	}
	{
		r3 = add(r1,#68)
		p0 = cmp.gtu(r0,#6); if (p0.new) jump:t .LBB62_30
	}
// %bb.14:
	{
		r0 = #0
		r5 = #0
	}
.LBB62_15:                              // %for.body.i11.i.preheader.unr-lcssa
	{
		p1 = cmp.eq(r2,#0); if (p1.new) jump:nt .LBB62_20
	}
// %bb.16:                              // %for.body.i.i.epil.preheader
	{
		loop0(.LBB62_17,r2)
		r5 = asl(r5,#4)
	}
	{
		r5 = add(r1,add(r5,#8))
		jump .LBB62_17
	}
	.p2align	4
.LBB62_19:                              // %if.end.i.i.epil
                                        //   in Loop: Header=BB62_17 Depth=1
	{
		r5 = add(r5,#16)
		nop
	} :endloop0
	{
		jump .LBB62_20
	}
.Ltmp15:                                // Block address taken
.LBB62_17:                              // %for.body.i.i.epil
                                        // =>This Inner Loop Header: Depth=1
	{
		r6 = memw(r5+#0)
		if (!cmp.gt(r6.new,#0)) jump:t .LBB62_19
	}
// %bb.18:                              // %if.then.i.i.epil
                                        //   in Loop: Header=BB62_17 Depth=1
	{
		r7 = memw(r5+#-4)
	}
	{
		r7 = add(r7,#-1)
	}
	{
		r0 += mpyi(r7,r6)
		jump .LBB62_19
	}
.LBB62_20:                              // %for.body.i11.i.preheader
	{
		if (p0) jump:nt .LBB62_48
	}
// %bb.21:
	{
		r5:4 = combine(#0,#0)
	}
.LBB62_22:                              // %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit.unr-lcssa
	{
		if (p1) jump:nt .LBB62_27
	}
// %bb.23:                              // %for.body.i11.i.epil.preheader
	{
		loop0(.LBB62_24,r2)
		r3 = asl(r5,#4)
	}
	{
		r1 = add(r1,add(r3,#8))
		jump .LBB62_24
	}
	.p2align	4
.LBB62_26:                              // %if.end.i20.i.epil
                                        //   in Loop: Header=BB62_24 Depth=1
	{
		r1 = add(r1,#16)
		nop
	} :endloop0
	{
		jump .LBB62_27
	}
.Ltmp16:                                // Block address taken
.LBB62_24:                              // %for.body.i11.i.epil
                                        // =>This Inner Loop Header: Depth=1
	{
		r2 = memw(r1+#0)
		if (cmp.gt(r2.new,#-1)) jump:nt .LBB62_26
	}
// %bb.25:                              // %if.then.i16.i.epil
                                        //   in Loop: Header=BB62_24 Depth=1
	{
		r3 = memw(r1+#-4)
	}
	{
		r3 = add(r3,#-1)
	}
	{
		r4 += mpyi(r3,r2)
		jump .LBB62_26
	}
.LBB62_27:                              // %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit
	{
		r1 = add(r0,sub(#1,r4))
		jump .LBB62_28
	}
.LBB62_12:
	{
		r1 = #1
	}
.LBB62_28:                              // %_ZNK15halide_buffer_t13size_in_bytesEv.exit
	{
		r0 = r17
		r2 = memub(r16+#25)
	}
	{
		r2 = add(r2,#7)
	}
	{
		r2 = lsr(r2,#3)
	}
	{
		r1 = mpyi(r2,r1)
		call ##halide_malloc
	}
	{
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB62_29
		memw(r16+#12) = r0
	}
// %bb.66:                              // %if.end6
	{
		call ##halide_device_malloc
		r1:0 = combine(r16,r17)
		r2 = r18
	}
	{
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB62_67
	}
// %bb.68:                              // %if.then9
	{
		r0 = r17
		r19 = r0
		r1 = memw(r16+#12)
	}
	{
		call ##halide_free
	}
	{
		r0 = r19
		r17:16 = memd(r29+#8)
		memw(r16+#12) = #0
	}                                       // 8-byte Folded Reload
	{
		r19:18 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.LBB62_29:
	{
		r19 = #-1
	}
	{
		r0 = r19
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB62_30:                              // %for.body.lr.ph.i.i.new
	{
		r0 = and(r4,#-8)
		r6 = r3
	}
	{
		r5 = lsr(r0,#3)
		r0 = #0
	}
	{
		loop0(.LBB62_31,r5)
		r5 = #0 ; jump .LBB62_31
	}
	.p2align	4
.LBB62_47:                              // %if.end.i.i.7
                                        //   in Loop: Header=BB62_31 Depth=1
	{
		r5 = add(r5,#8)
		r6 = add(r6,#128)
	} :endloop0
	{
		jump .LBB62_15
	}
.Ltmp17:                                // Block address taken
.LBB62_31:                              // %for.body.i.i
                                        // =>This Inner Loop Header: Depth=1
	{
		r7 = memw(r6+#-60)
		if (cmp.gt(r7.new,#0)) jump:nt .LBB62_32
	}
// %bb.33:                              // %if.end.i.i
                                        //   in Loop: Header=BB62_31 Depth=1
	{
		r7 = memw(r6+#-44)
		if (!cmp.gt(r7.new,#0)) jump:nt .LBB62_35
	}
.LBB62_34:                              // %if.then.i.i.1
                                        //   in Loop: Header=BB62_31 Depth=1
	{
		r8 = memw(r6+#-48)
	}
	{
		r8 = add(r8,#-1)
	}
	{
		r0 += mpyi(r8,r7)
	}
.LBB62_35:                              // %if.end.i.i.1
                                        //   in Loop: Header=BB62_31 Depth=1
	{
		r7 = memw(r6+#-28)
		if (cmp.gt(r7.new,#0)) jump:nt .LBB62_36
	}
// %bb.37:                              // %if.end.i.i.2
                                        //   in Loop: Header=BB62_31 Depth=1
	{
		r7 = memw(r6+#-12)
		if (cmp.gt(r7.new,#0)) jump:nt .LBB62_38
	}
.LBB62_39:                              // %if.end.i.i.3
                                        //   in Loop: Header=BB62_31 Depth=1
	{
		r7 = memw(r6+#4)
		if (cmp.gt(r7.new,#0)) jump:nt .LBB62_40
	}
.LBB62_41:                              // %if.end.i.i.4
                                        //   in Loop: Header=BB62_31 Depth=1
	{
		r7 = memw(r6+#20)
		if (cmp.gt(r7.new,#0)) jump:nt .LBB62_42
	}
.LBB62_43:                              // %if.end.i.i.5
                                        //   in Loop: Header=BB62_31 Depth=1
	{
		r7 = memw(r6+#36)
		if (cmp.gt(r7.new,#0)) jump:nt .LBB62_44
	}
.LBB62_45:                              // %if.end.i.i.6
                                        //   in Loop: Header=BB62_31 Depth=1
	{
		r7 = memw(r6+#52)
		if (!cmp.gt(r7.new,#0)) jump:t .LBB62_47
	}
	{
		jump .LBB62_46
	}
	.p2align	4
.LBB62_32:                              // %if.then.i.i
                                        //   in Loop: Header=BB62_31 Depth=1
	{
		r8 = memw(r6+#-64)
	}
	{
		r8 = add(r8,#-1)
	}
	{
		r0 += mpyi(r8,r7)
		r7 = memw(r6+#-44)
		if (cmp.gt(r7.new,#0)) jump:t .LBB62_34
	}
	{
		jump .LBB62_35
	}
	.p2align	4
.LBB62_36:                              // %if.then.i.i.2
                                        //   in Loop: Header=BB62_31 Depth=1
	{
		r8 = memw(r6+#-32)
	}
	{
		r8 = add(r8,#-1)
	}
	{
		r0 += mpyi(r8,r7)
		r7 = memw(r6+#-12)
		if (!cmp.gt(r7.new,#0)) jump:t .LBB62_39
	}
.LBB62_38:                              // %if.then.i.i.3
                                        //   in Loop: Header=BB62_31 Depth=1
	{
		r8 = memw(r6+#-16)
	}
	{
		r8 = add(r8,#-1)
	}
	{
		r0 += mpyi(r8,r7)
		r7 = memw(r6+#4)
		if (!cmp.gt(r7.new,#0)) jump:t .LBB62_41
	}
.LBB62_40:                              // %if.then.i.i.4
                                        //   in Loop: Header=BB62_31 Depth=1
	{
		r8 = memw(r6+#0)
	}
	{
		r8 = add(r8,#-1)
	}
	{
		r0 += mpyi(r8,r7)
		r7 = memw(r6+#20)
		if (!cmp.gt(r7.new,#0)) jump:t .LBB62_43
	}
.LBB62_42:                              // %if.then.i.i.5
                                        //   in Loop: Header=BB62_31 Depth=1
	{
		r8 = memw(r6+#16)
	}
	{
		r8 = add(r8,#-1)
	}
	{
		r0 += mpyi(r8,r7)
		r7 = memw(r6+#36)
		if (!cmp.gt(r7.new,#0)) jump:t .LBB62_45
	}
.LBB62_44:                              // %if.then.i.i.6
                                        //   in Loop: Header=BB62_31 Depth=1
	{
		r8 = memw(r6+#32)
	}
	{
		r8 = add(r8,#-1)
	}
	{
		r0 += mpyi(r8,r7)
		r7 = memw(r6+#52)
		if (!cmp.gt(r7.new,#0)) jump:t .LBB62_47
	}
.LBB62_46:                              // %if.then.i.i.7
                                        //   in Loop: Header=BB62_31 Depth=1
	{
		r8 = memw(r6+#48)
	}
	{
		r8 = add(r8,#-1)
	}
	{
		r0 += mpyi(r8,r7)
		jump .LBB62_47
	}
.LBB62_48:                              // %for.body.i11.i.preheader.new
	{
		r5 = and(r4,#-8)
	}
	{
		r5 = lsr(r5,#3)
	}
	{
		loop0(.LBB62_49,r5)
		r5:4 = combine(#0,#0)
		jump .LBB62_49
	}
	.p2align	4
.LBB62_65:                              // %if.end.i20.i.7
                                        //   in Loop: Header=BB62_49 Depth=1
	{
		r5 = add(r5,#8)
		r3 = add(r3,#128)
	} :endloop0
	{
		jump .LBB62_22
	}
.Ltmp18:                                // Block address taken
.LBB62_49:                              // %for.body.i11.i
                                        // =>This Inner Loop Header: Depth=1
	{
		r6 = memw(r3+#-60)
		if (cmp.gt(r6.new,#-1)) jump:nt .LBB62_51
	}
// %bb.50:                              // %if.then.i16.i
                                        //   in Loop: Header=BB62_49 Depth=1
	{
		r7 = memw(r3+#-64)
	}
	{
		r7 = add(r7,#-1)
	}
	{
		r4 += mpyi(r7,r6)
	}
.LBB62_51:                              // %if.end.i20.i
                                        //   in Loop: Header=BB62_49 Depth=1
	{
		r6 = memw(r3+#-44)
		if (!cmp.gt(r6.new,#-1)) jump:nt .LBB62_52
	}
// %bb.53:                              // %if.end.i20.i.1
                                        //   in Loop: Header=BB62_49 Depth=1
	{
		r6 = memw(r3+#-28)
		if (cmp.gt(r6.new,#-1)) jump:nt .LBB62_55
	}
.LBB62_54:                              // %if.then.i16.i.2
                                        //   in Loop: Header=BB62_49 Depth=1
	{
		r7 = memw(r3+#-32)
	}
	{
		r7 = add(r7,#-1)
	}
	{
		r4 += mpyi(r7,r6)
	}
.LBB62_55:                              // %if.end.i20.i.2
                                        //   in Loop: Header=BB62_49 Depth=1
	{
		r6 = memw(r3+#-12)
		if (cmp.gt(r6.new,#-1)) jump:nt .LBB62_57
	}
// %bb.56:                              // %if.then.i16.i.3
                                        //   in Loop: Header=BB62_49 Depth=1
	{
		r7 = memw(r3+#-16)
	}
	{
		r7 = add(r7,#-1)
	}
	{
		r4 += mpyi(r7,r6)
	}
.LBB62_57:                              // %if.end.i20.i.3
                                        //   in Loop: Header=BB62_49 Depth=1
	{
		r6 = memw(r3+#4)
		if (cmp.gt(r6.new,#-1)) jump:nt .LBB62_59
	}
// %bb.58:                              // %if.then.i16.i.4
                                        //   in Loop: Header=BB62_49 Depth=1
	{
		r7 = memw(r3+#0)
	}
	{
		r7 = add(r7,#-1)
	}
	{
		r4 += mpyi(r7,r6)
	}
.LBB62_59:                              // %if.end.i20.i.4
                                        //   in Loop: Header=BB62_49 Depth=1
	{
		r6 = memw(r3+#20)
		if (cmp.gt(r6.new,#-1)) jump:nt .LBB62_61
	}
// %bb.60:                              // %if.then.i16.i.5
                                        //   in Loop: Header=BB62_49 Depth=1
	{
		r7 = memw(r3+#16)
	}
	{
		r7 = add(r7,#-1)
	}
	{
		r4 += mpyi(r7,r6)
	}
.LBB62_61:                              // %if.end.i20.i.5
                                        //   in Loop: Header=BB62_49 Depth=1
	{
		r6 = memw(r3+#36)
		if (cmp.gt(r6.new,#-1)) jump:nt .LBB62_63
	}
// %bb.62:                              // %if.then.i16.i.6
                                        //   in Loop: Header=BB62_49 Depth=1
	{
		r7 = memw(r3+#32)
	}
	{
		r7 = add(r7,#-1)
	}
	{
		r4 += mpyi(r7,r6)
	}
.LBB62_63:                              // %if.end.i20.i.6
                                        //   in Loop: Header=BB62_49 Depth=1
	{
		r6 = memw(r3+#52)
		if (cmp.gt(r6.new,#-1)) jump:nt .LBB62_65
	}
// %bb.64:                              // %if.then.i16.i.7
                                        //   in Loop: Header=BB62_49 Depth=1
	{
		r7 = memw(r3+#48)
	}
	{
		r7 = add(r7,#-1)
	}
	{
		r4 += mpyi(r7,r6)
		jump .LBB62_65
	}
	.p2align	4
.LBB62_52:                              // %if.then.i16.i.1
                                        //   in Loop: Header=BB62_49 Depth=1
	{
		r7 = memw(r3+#-48)
	}
	{
		r7 = add(r7,#-1)
	}
	{
		r4 += mpyi(r7,r6)
		r6 = memw(r3+#-28)
		if (!cmp.gt(r6.new,#-1)) jump:t .LBB62_54
	}
	{
		jump .LBB62_55
	}
.LBB62_67:
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
.Lfunc_end62:
	.size	halide_default_device_and_host_malloc, .Lfunc_end62-halide_default_device_and_host_malloc
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
		if (p0) jump:nt .LBB63_1
		memd(r29+#0) = r19:18
	}                                       // 8-byte Folded Spill
// %bb.2:                               // %if.end.i
	{
		r3:2 = combine(#0,#0)
		r4 = memw(r16+#8)
		r1:0 = memd(r16+#0)
	}
	{
		p1 = cmp.eq(r1:0,r3:2)
		p0 = cmp.eq(r4,#0)
		if (p1.new) jump:nt .LBB63_5
	}
// %bb.3:                               // %if.end.i
	{
		if (!p0) jump:nt .LBB63_5
	}
// %bb.4:                               // %if.then8.i
	{
		call ##halide_error_no_device_interface
		r0 = r17
	}
	{
		r18 = r0
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB63_14
	}
	{
		jump .LBB63_11
	}
.LBB63_1:                               // %if.then.i
	{
		r1 = add(pc,##.L.str.30@PCREL)
		r0 = r17
	}
	{
		call ##halide_error_buffer_is_null
	}
	{
		r18 = r0
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB63_14
	}
	{
		jump .LBB63_11
	}
.LBB63_5:                               // %if.end10.i
	{
		if (p0) jump:nt .LBB63_8
	}
// %bb.6:                               // %if.end10.i
	{
		r3:2 = combine(#0,#0)
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (!p0.new) jump:nt .LBB63_8
	}
// %bb.7:                               // %if.then14.i
	{
		call ##halide_error_device_interface_no_device
		r0 = r17
	}
	{
		r18 = r0
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB63_11
	}
.LBB63_14:                              // %cleanup
	{
		r0 = r18
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB63_8:                               // %if.end16.i
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
		if (!p0.new) jump:t .LBB63_11
	}
// %bb.9:                               // %if.then24.i
	{
		call ##halide_error_host_and_device_dirty
		r0 = r17
	}
	{
		r18 = r0
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB63_14
	}
.LBB63_11:                              // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split
	{
		call ##halide_device_free
		r1:0 = combine(r16,r17)
	}
	{
		r18 = r0
		r1 = memw(r16+#12)
		if (cmp.eq(r1.new,#0)) jump:nt .LBB63_13
	}
// %bb.12:                              // %if.then2
	{
		call ##halide_free
		r0 = r17
	}
	{
		memw(r16+#12) = #0
	}
.LBB63_13:                              // %if.end5
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
.Lfunc_end63:
	.size	halide_default_device_and_host_free, .Lfunc_end63-halide_default_device_and_host_free
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
		if (p0) jump:nt .LBB64_1
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
		if (p1.new) jump:nt .LBB64_5
	}
// %bb.3:                               // %if.end.i
	{
		if (!p0) jump:nt .LBB64_5
	}
// %bb.4:                               // %if.then8.i
	{
		call ##halide_error_no_device_interface
		r0 = r20
	}
	{
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB64_16
	}
	{
		jump .LBB64_11
	}
.LBB64_1:                               // %if.then.i
	{
		r1 = add(pc,##.L.str.31@PCREL)
		r0 = r20
	}
	{
		call ##halide_error_buffer_is_null
	}
	{
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB64_16
	}
	{
		jump .LBB64_11
	}
.LBB64_5:                               // %if.end10.i
	{
		if (p0) jump:nt .LBB64_8
	}
// %bb.6:                               // %if.end10.i
	{
		r5:4 = combine(#0,#0)
	}
	{
		p0 = cmp.eq(r3:2,r5:4)
		if (!p0.new) jump:nt .LBB64_8
	}
// %bb.7:                               // %if.then14.i
	{
		call ##halide_error_device_interface_no_device
		r0 = r20
	}
	{
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB64_11
	}
.LBB64_16:                              // %cleanup12
	{
		r17:16 = memd(r29+#16)
		r19:18 = memd(r29+#8)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.LBB64_8:                               // %if.end16.i
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
		if (!p0.new) jump:t .LBB64_12
	}
// %bb.9:                               // %if.then24.i
	{
		call ##halide_error_host_and_device_dirty
		r0 = r20
	}
	{
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB64_16
	}
.LBB64_11:                              // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	{
		r0 = memw(r17+#8)
	}
.LBB64_12:                              // %if.end
	{
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB64_15
	}
// %bb.13:                              // %if.end
	{
		p0 = cmp.eq(r0,r16); if (p0.new) jump:nt .LBB64_15
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
.LBB64_15:                              // %if.end5
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
.Lfunc_end64:
	.size	halide_device_wrap_native, .Lfunc_end64-halide_device_wrap_native
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
		if (p0) jump:nt .LBB65_1
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
		if (p1.new) jump:nt .LBB65_5
	}
// %bb.3:                               // %if.end.i
	{
		if (!p0) jump:nt .LBB65_5
	}
// %bb.4:                               // %if.then8.i
	{
		call ##halide_error_no_device_interface
		r0 = r16
	}
	{
		jump .LBB65_10
	}
.LBB65_1:                               // %if.then.i
	{
		r1 = add(pc,##.L.str.33@PCREL)
		r0 = r16
	}
	{
		call ##halide_error_buffer_is_null
	}
	{
		jump .LBB65_10
	}
.LBB65_5:                               // %if.end10.i
	{
		if (p0) jump:nt .LBB65_8
	}
// %bb.6:                               // %if.end10.i
	{
		r3:2 = combine(#0,#0)
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (!p0.new) jump:nt .LBB65_8
	}
// %bb.7:                               // %if.then14.i
	{
		call ##halide_error_device_interface_no_device
		r0 = r16
	}
	{
		jump .LBB65_10
	}
.LBB65_8:                               // %if.end16.i
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
		if (!p0.new) jump:t .LBB65_12
	}
// %bb.9:                               // %if.then24.i
	{
		call ##halide_error_host_and_device_dirty
		r0 = r16
	}
.LBB65_10:                              // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
	{
		p0 = cmp.eq(r0,#0)
		if (!p0.new) r17:16 = memd(r29+#8)
		if (!p0.new) r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		if (!p0) r31:30 = dealloc_return(r30):raw
	}
.LBB65_11:                              // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	{
		r18 = memw(r17+#8)
	}
.LBB65_12:                              // %if.end
	{
		p0 = cmp.eq(r18,#0); if (p0.new) jump:nt .LBB65_13
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
		if (p0.new) jump:nt .LBB65_16
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
.LBB65_16:                              // %do.end
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
.LBB65_13:
	{
		r0 = #0
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end65:
	.size	halide_device_detach_native, .Lfunc_end65-halide_device_detach_native
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
.LBB66_1:                               // %if.end
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
.Lfunc_end66:
	.size	halide_default_device_wrap_native, .Lfunc_end66-halide_default_device_wrap_native
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
		if (p0) jump:nt .LBB67_1
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
		if (p1.new) jump:nt .LBB67_5
	}
// %bb.3:                               // %if.end.i
	{
		if (!p0) jump:nt .LBB67_5
	}
// %bb.4:                               // %if.then8.i
	{
		call ##halide_error_no_device_interface
	}
	{
		r17 = r0
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB67_14
	}
	{
		jump .LBB67_11
	}
.LBB67_1:                               // %if.then.i
	{
		r1 = add(pc,##.L.str.35@PCREL)
		call ##halide_error_buffer_is_null
	}
	{
		r17 = r0
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB67_14
	}
	{
		jump .LBB67_11
	}
.LBB67_5:                               // %if.end10.i
	{
		if (p0) jump:nt .LBB67_8
	}
// %bb.6:                               // %if.end10.i
	{
		r5:4 = combine(#0,#0)
	}
	{
		p0 = cmp.eq(r3:2,r5:4)
		if (!p0.new) jump:nt .LBB67_8
	}
// %bb.7:                               // %if.then14.i
	{
		call ##halide_error_device_interface_no_device
	}
	{
		r17 = r0
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB67_11
	}
.LBB67_14:                              // %cleanup
	{
		r0 = r17
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB67_8:                               // %if.end16.i
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
		if (!p0.new) jump:t .LBB67_12
	}
// %bb.9:                               // %if.then24.i
	{
		call ##halide_error_host_and_device_dirty
	}
	{
		r17 = r0
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB67_14
	}
.LBB67_11:                              // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	{
		r3:2 = memd(r16+#0)
	}
.LBB67_12:                              // %if.end
	{
		r17 = #0
		r19:18 = combine(#0,#0)
	}
	{
		p0 = cmp.eq(r3:2,r19:18)
		if (p0.new) jump:t .LBB67_14
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
.Lfunc_end67:
	.size	halide_default_device_detach_native, .Lfunc_end67-halide_default_device_detach_native
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
.Lfunc_end68:
	.size	halide_device_and_host_free_as_destructor, .Lfunc_end68-halide_device_and_host_free_as_destructor
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
.Lfunc_end69:
	.size	halide_device_host_nop_free, .Lfunc_end69-halide_device_host_nop_free
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
.Lfunc_end70:
	.size	halide_default_buffer_copy, .Lfunc_end70-halide_default_buffer_copy
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
		if (p2) jump:nt .LBB71_6
		memd(r29+#456) = r19:18
		memd(r29+#448) = r21:20
	}                                       // 8-byte Folded Spill
// %bb.1:                               // %land.lhs.true
	{
		r0 = memw(r16+#8)
		if (cmp.eq(r0.new,#0)) jump:nt .LBB71_4
	}
// %bb.2:                               // %land.lhs.true
	{
		p0 = cmp.eq(r0,r19); if (p0.new) jump:nt .LBB71_4
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
.LBB71_41:                              // %cleanup143
	{
		r17:16 = memd(r29+#464)
		r19:18 = memd(r29+#456)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#448)
		r31:30 = dealloc_return(r30):raw
	}                                       // 8-byte Folded Reload
.LBB71_4:                               // %land.lhs.true5
	{
		r3:2 = combine(#0,#0)
		r1:0 = memd(r16+#0)
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (p0.new) jump:nt .LBB71_5
	}
.LBB71_6:                               // %if.end13
	{
		r3:2 = combine(#0,#0)
		r1:0 = memd(r17+#0)
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (p0.new) jump:nt .LBB71_10
		r0 = memw(r17+#12)
	}
// %bb.7:                               // %land.rhs
	{
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB71_8
	}
// %bb.9:                               // %land.end.thread264
	{
		r1:0 = memd(r17+#16)
	}
	{
		p0 = tstbit(r0,#0)
		jump .LBB71_14
	}
.LBB71_10:                              // %land.end
	{
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB71_11
	}
// %bb.13:                              // %land.end.land.rhs26_crit_edge
	{
		p0 = or(p0,!p0)
		r1:0 = memd(r17+#16)
	}
.LBB71_14:                              // %land.rhs26
	{
		r1 = p0
		p0 = !tstbit(r0,#1)
		memw(r29+#20) = r1.new
	}                                       // 4-byte Folded Spill
	{
		p1 = and(p1,!p1)
		if (!p0) jump:nt .LBB71_16
	}
// %bb.15:
	{
		p0 = or(p1,p1)
		r0 = memw(r16+#12)
	}
	{
		p3 = cmp.eq(r0,#0)
		if (p2) jump:nt .LBB71_18
	}
	{
		jump .LBB71_19
	}
.LBB71_16:                              // %lor.rhs28
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
		if (p2) jump:nt .LBB71_18
	}
	{
		jump .LBB71_19
	}
.LBB71_8:
	{
		p0 = and(p0,!p0)
		p1 = or(p1,!p1)
	}
	{
		r0 = p0
		jump .LBB71_12
	}
.LBB71_5:                               // %if.then7
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
		if (!p0) jump:nt .LBB71_41
	}
	{
		jump .LBB71_6
	}
.LBB71_11:
	{
		p1 = or(p1,!p1)
	}
	{
		r0 = p1
	}
.LBB71_12:                              // %land.end32
	{
		p0 = or(p1,p1)
		r0 = memw(r16+#12)
		memw(r29+#20) = r0
	}                                       // 4-byte Folded Spill
	{
		p3 = cmp.eq(r0,#0)
		if (!p2) jump:nt .LBB71_19
	}
.LBB71_18:                              // %land.end32
	{
		r0 = #-34
		if (p3) jump:nt .LBB71_41
	}
.LBB71_19:                              // %if.end41
	{
		r3 = p0
		r0 = p3
		r2 = memw(r29+#20)
		memw(r29+#12) = r0.new
	}                                       // 4-byte Folded Reload
	{
		p0 = r2
		memw(r29+#8) = r3
	}                                       // 4-byte Folded Spill
	{
		p0 = or(p2,p0)
		if (p0.new) jump:t .LBB71_21
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
		if (!p0) jump:nt .LBB71_35
	}
.LBB71_21:                              // %if.then51
	{
		r0 = memw(r29+#12)
	}                                       // 4-byte Folded Reload
	{
		p0 = r0
		r0 = #-42
	}
	{
		p0 = and(p1,p0)
		if (p0.new) jump:t .LBB71_41
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
		p1 = or(p1,p0)
		if (!p1.new) jump:t .LBB71_23
	}
// %bb.24:                              // %if.else
	{
		r1 = memw(r29+#20)
	}                                       // 4-byte Folded Reload
	{
		p1 = r1
	}
	{
		p0 = or(p1,p0)
		if (!p0.new) jump:t .LBB71_25
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
		if (!p0.new) jump:t .LBB71_29
	}
// %bb.31:                              // %if.else98
	{
		if (p2) jump:nt .LBB71_41
	}
// %bb.32:                              // %if.then100
	{
		call ##_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t
		r1:0 = combine(r17,r18)
	}
	{
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB71_41
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
		jump .LBB71_34
	}
.LBB71_23:                              // %if.end117.thread258
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
		jump .LBB71_36
	}
.LBB71_25:                              // %if.then66
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
		if (!p0) jump:nt .LBB71_35
	}
// %bb.26:                              // %if.then74
	{
		call ##_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t
		r1:0 = combine(r17,r18)
	}
	{
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB71_41
	}
// %bb.27:                              // %if.then77
	{
		call ##halide_buffer_copy_already_locked
		r1:0 = combine(r17,r18)
		r3:2 = combine(r16,#0)
	}
	{
		jump .LBB71_34
	}
.LBB71_29:                              // %if.then85
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
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB71_41
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
.LBB71_34:                              // %if.end117
	{
		r1 = memw(r29+#16)
	}                                       // 4-byte Folded Reload
	{
		p2 = r1
	}
.LBB71_35:                              // %if.end117
	{
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB71_41
	}
.LBB71_36:                              // %land.lhs.true126
	{
		r0 = #0
		p0 = cmp.eq(r16,r17); if (p0.new) jump:t .LBB71_41
	}
// %bb.37:                              // %if.then128
	{
		r1 = #-4
		r3:2 = memd(r16+#16)
	}
	{
		r1 = and(r2,r1)
		if (p2) jump:nt .LBB71_39
	}
// %bb.38:                              // %if.then130
	{
		r2 = setbit(r1,#1)
		jump .LBB71_40
	}
.LBB71_39:                              // %if.else133
	{
		r2 = setbit(r1,#0)
	}
.LBB71_40:                              // %cleanup143
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
.Lfunc_end71:
	.size	halide_buffer_copy_already_locked, .Lfunc_end71-halide_buffer_copy_already_locked
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
		if (p0) jump:nt .LBB72_2
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
.LBB72_2:                               // %if.end
	{
		r0 = memw(r16+#8)
		if (cmp.eq(r0.new,#0)) jump:nt .LBB72_4
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
.LBB72_4:                               // %if.end16
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
		if (p0.new) jump:nt .LBB72_6
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
.LBB72_6:                               // %if.end20
	{
		r0 = memw(r16+#8)
		if (cmp.eq(r0.new,#0)) jump:nt .LBB72_8
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
.LBB72_8:                               // %if.end27
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
.Lfunc_end72:
	.size	halide_buffer_copy, .Lfunc_end72-halide_buffer_copy
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
.Lfunc_end73:
	.size	halide_default_device_crop, .Lfunc_end73-halide_default_device_crop
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
.Lfunc_end74:
	.size	halide_default_device_slice, .Lfunc_end74-halide_default_device_slice
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
		if (p0.new) jump:nt .LBB75_1
	}
// %bb.2:                               // %if.end
	{
		r3:2 = memd(r17+#0)
	}
	{
		p0 = cmp.eq(r3:2,r1:0)
		if (p0.new) jump:nt .LBB75_5
	}
// %bb.3:                               // %if.then3
	{
		r1 = add(pc,##.L.str.60@PCREL)
		jump .LBB75_4
	}
.LBB75_1:
	{
		r16 = #0 ; jump .LBB75_8
	}
.LBB75_5:                               // %if.end4
	{
		r0 = memw(r18+#28)
	}
	{
		r1 = memw(r17+#28)
		if (!cmp.eq(r1.new,r0)) jump:t .LBB75_6
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
		r16 = r0 ; jump .LBB75_8
	}
.LBB75_6:                               // %if.then6
	{
		r1 = add(pc,##.L.str.61@PCREL)
	}
.LBB75_4:                               // %cleanup
	{
		call ##halide_error
		r0 = r16
		r16 = #-41
	}
.LBB75_8:                               // %cleanup
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
.Lfunc_end75:
	.size	halide_device_crop, .Lfunc_end75-halide_device_crop
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
		if (p0.new) jump:nt .LBB76_1
	}
// %bb.2:                               // %if.end
	{
		r3:2 = memd(r17+#0)
	}
	{
		p0 = cmp.eq(r3:2,r1:0)
		if (p0.new) jump:nt .LBB76_5
	}
// %bb.3:                               // %if.then3
	{
		r1 = add(pc,##.L.str.60@PCREL)
		jump .LBB76_4
	}
.LBB76_1:
	{
		r16 = #0 ; jump .LBB76_8
	}
.LBB76_5:                               // %if.end4
	{
		r0 = memw(r17+#28)
		r1 = memw(r20+#28)
	}
	{
		r0 = add(r0,#1)
		if (!cmp.eq(r0.new,r1)) jump:t .LBB76_6
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
		r16 = r0 ; jump .LBB76_8
	}
.LBB76_6:                               // %if.then6
	{
		r1 = add(pc,##.L.str.64@PCREL)
	}
.LBB76_4:                               // %cleanup
	{
		call ##halide_error
		r0 = r16
		r16 = #-41
	}
.LBB76_8:                               // %cleanup
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
.Lfunc_end76:
	.size	halide_device_slice, .Lfunc_end76-halide_device_slice
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
.LBB77_1:                               // %if.end
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
.Lfunc_end77:
	.size	halide_default_device_release_crop, .Lfunc_end77-halide_default_device_release_crop
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
		r21:20 = combine(#0,#0)
		r3:2 = memd(r1+#0)
		memd(r29+#0) = r21:20
	}                                       // 8-byte Folded Spill
	{
		p0 = cmp.eq(r3:2,r21:20)
		if (p0.new) jump:nt .LBB78_2
		memd(r29+#8) = r19:18
	}                                       // 8-byte Folded Spill
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
.LBB78_2:                               // %return
	{
		r0 = #0
		r17:16 = memd(r29+#16)
		r19:18 = memd(r29+#8)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end78:
	.size	halide_device_release_crop, .Lfunc_end78-halide_device_release_crop
                                        // -- End function
	.section	.text.halide_float16_bits_to_float,"ax",@progbits
	.weak	halide_float16_bits_to_float    // -- Begin function halide_float16_bits_to_float
	.p2align	4
	.type	halide_float16_bits_to_float,@function
halide_float16_bits_to_float:           // @halide_float16_bits_to_float
// %bb.0:                               // %entry
	{
		r3 = extractu(r0,#5,#10)
		r1 = #1023
	}
	{
		r1 = extractu(r0,#10,#0)
		p1 = bitsclr(r0,r1)
		p0 = cmp.eq(r3,#0)
		if (p1.new) jump:nt .LBB79_3
	}
// %bb.1:                               // %entry
	{
		if (!p0) jump:nt .LBB79_3
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
.LBB79_7:                               // %if.end28
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
.LBB79_3:                               // %if.else
	{
		r2 = asl(r1,#13)
		if (p0) jump:nt .LBB79_4
	}
// %bb.5:                               // %if.else18
	{
		r1 = ##2139095040
		p0 = cmp.eq(r3,#31); if (p0.new) jump:t .LBB79_7
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
.LBB79_4:
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
.Lfunc_end79:
	.size	halide_float16_bits_to_float, .Lfunc_end79-halide_float16_bits_to_float
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
.Lfunc_end80:
	.size	halide_float16_bits_to_double, .Lfunc_end80-halide_float16_bits_to_double
                                        // -- End function
	.section	.text.halide_error_bounds_inference_call_failed,"ax",@progbits
	.weak	halide_error_bounds_inference_call_failed // -- Begin function halide_error_bounds_inference_call_failed
	.p2align	4
	.type	halide_error_bounds_inference_call_failed,@function
halide_error_bounds_inference_call_failed: // @halide_error_bounds_inference_call_failed
// %bb.0:                               // %entry
	{
		r17:16 = combine(r1,r2)
		memd(r29+#-16) = r17:16
		allocframe(#40)
	}                                       // 8-byte Folded Spill
	{
		r19 = r0
		r0 = #1024
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
		if (p0) jump:nt .LBB81_1
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.2:                               // %if.then6.i
	{
		r2 = add(pc,##.L.str.36@PCREL)
		r20 = add(r18,#1023)
		r3 = #0
	}
	{
		r1:0 = combine(r20,r18)
		jump .LBB81_3
		memb(r18+#1023) = r3
	}
.LBB81_1:                               // %entry.split
	{
		r2 = add(pc,##.L.str.36@PCREL)
		r20 = #0
		r1:0 = combine(#0,#0)
	}
.LBB81_3:                               // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r20
		r2 = r17
	}
	{
		r2 = add(pc,##.L.str.1.37@PCREL)
		r1 = r20
	}
	{
		call ##halide_string_to_string
		r17 = asr(r16,#31)
	}
	{
		r3:2 = combine(r17,r16)
		r4 = #1
		r1 = r20
	}
	{
		call ##halide_int64_to_string
	}
	{
		r1 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r1
		if (p0.new) jump:nt .LBB81_4
	}
// %bb.5:                               // %if.else.i
	{
		r2 = add(r0,sub(#1,r18))
		r1:0 = combine(r18,r19)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3 = asr(r2,#31)
	}
	{
		r1:0 = combine(r18,r19)
		jump .LBB81_6
	}
.LBB81_4:                               // %if.then.i
	{
		r1 = add(pc,##.L.str.7.92@PCREL)
		r0 = r19
	}
.LBB81_6:                               // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
	}
	{
		call ##free
		r0 = r18
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
.Lfunc_end81:
	.size	halide_error_bounds_inference_call_failed, .Lfunc_end81-halide_error_bounds_inference_call_failed
                                        // -- End function
	.section	.text.halide_error_extern_stage_failed,"ax",@progbits
	.weak	halide_error_extern_stage_failed // -- Begin function halide_error_extern_stage_failed
	.p2align	4
	.type	halide_error_extern_stage_failed,@function
halide_error_extern_stage_failed:       // @halide_error_extern_stage_failed
// %bb.0:                               // %entry
	{
		r17:16 = combine(r1,r2)
		memd(r29+#-16) = r17:16
		allocframe(#40)
	}                                       // 8-byte Folded Spill
	{
		r19 = r0
		r0 = #1024
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
		if (p0) jump:nt .LBB82_1
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.2:                               // %if.then6.i
	{
		r2 = add(pc,##.L.str.2.38@PCREL)
		r20 = add(r18,#1023)
		r3 = #0
	}
	{
		r1:0 = combine(r20,r18)
		jump .LBB82_3
		memb(r18+#1023) = r3
	}
.LBB82_1:                               // %entry.split
	{
		r2 = add(pc,##.L.str.2.38@PCREL)
		r20 = #0
		r1:0 = combine(#0,#0)
	}
.LBB82_3:                               // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r20
		r2 = r17
	}
	{
		r2 = add(pc,##.L.str.1.37@PCREL)
		r1 = r20
	}
	{
		call ##halide_string_to_string
		r17 = asr(r16,#31)
	}
	{
		r3:2 = combine(r17,r16)
		r4 = #1
		r1 = r20
	}
	{
		call ##halide_int64_to_string
	}
	{
		r1 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r1
		if (p0.new) jump:nt .LBB82_4
	}
// %bb.5:                               // %if.else.i
	{
		r2 = add(r0,sub(#1,r18))
		r1:0 = combine(r18,r19)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3 = asr(r2,#31)
	}
	{
		r1:0 = combine(r18,r19)
		jump .LBB82_6
	}
.LBB82_4:                               // %if.then.i
	{
		r1 = add(pc,##.L.str.7.92@PCREL)
		r0 = r19
	}
.LBB82_6:                               // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
	}
	{
		call ##free
		r0 = r18
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
.Lfunc_end82:
	.size	halide_error_extern_stage_failed, .Lfunc_end82-halide_error_extern_stage_failed
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
		r21 = r2
		r19 = r1
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
		r18 = memw(r29+#72)
		memd(r29+#16) = r27:26
	}
	{
		call ##malloc
	}
	{
		r17 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB83_1
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.2:                               // %if.then6.i
	{
		r2 = add(pc,##.L.str.3.39@PCREL)
		r20 = add(r17,#1023)
		r3 = #0
	}
	{
		r1:0 = combine(r20,r17)
		jump .LBB83_3
		memb(r17+#1023) = r3
	}
.LBB83_1:                               // %entry.split
	{
		r2 = add(pc,##.L.str.3.39@PCREL)
		r20 = #0
		r1:0 = combine(#0,#0)
	}
.LBB83_3:                               // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r20
		r2 = r21
	}
	{
		r2 = add(pc,##.L.str.4.40@PCREL)
		r1 = r20
	}
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r20
		r2 = r19
	}
	{
		r2 = add(pc,##.L.str.5.41@PCREL)
		r1 = r20
	}
	{
		call ##halide_string_to_string
		r27 = asr(r26,#31)
	}
	{
		r3:2 = combine(r27,r26)
		r4 = #1
		r1 = r20
	}
	{
		r19 = add(pc,##.L.str.6.42@PCREL)
		call ##halide_int64_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r20
		r2 = r19
	}
	{
		r25 = asr(r24,#31)
		r4 = #1
		r1 = r20
	}
	{
		call ##halide_int64_to_string
		r3:2 = combine(r25,r24)
	}
	{
		r2 = add(pc,##.L.str.7.43@PCREL)
		r1 = r20
	}
	{
		call ##halide_string_to_string
		r23 = asr(r22,#31)
	}
	{
		r3:2 = combine(r23,r22)
		r4 = #1
		r1 = r20
	}
	{
		call ##halide_int64_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r20
		r2 = r19
	}
	{
		r19 = asr(r18,#31)
		r4 = #1
		r1 = r20
	}
	{
		call ##halide_int64_to_string
		r3:2 = combine(r19,r18)
	}
	{
		r2 = add(pc,##.L.str.8.44@PCREL)
		r1 = r20
	}
	{
		call ##halide_string_to_string
	}
	{
		r1 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r1
		if (p0.new) jump:nt .LBB83_4
	}
// %bb.5:                               // %if.else.i
	{
		r2 = add(r0,sub(#1,r17))
		r1:0 = combine(r17,r16)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3 = asr(r2,#31)
	}
	{
		r1:0 = combine(r17,r16)
		jump .LBB83_6
	}
.LBB83_4:                               // %if.then.i
	{
		r1 = add(pc,##.L.str.7.92@PCREL)
		r0 = r16
	}
.LBB83_6:                               // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
	}
	{
		call ##free
		r0 = r17
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
.Lfunc_end83:
	.size	halide_error_explicit_bounds_too_small, .Lfunc_end83-halide_error_explicit_bounds_too_small
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
		r19 = r1
		r0 = add(r29,#12)
		memd(r29+#32) = r19:18
		memw(r29+#20) = r2
	}                                       // 8-byte Folded Spill
	{
		r1 = add(r29,#16)
		r2 = #4
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
		r1 = add(r29,#20)
		r2 = #4
		r0 = add(r29,#8)
	}
	{
		call ##memcpy
	}
	{
		call ##malloc
		r0 = #1024
	}
	{
		r17 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB84_1
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.2:                               // %if.then6.i
	{
		r18 = add(r17,#1023)
		r3:2 = combine(#0,r19)
	}
	{
		r1:0 = combine(r18,r17)
		jump .LBB84_3
		memb(r17+#1023) = r3
	}
.LBB84_1:                               // %entry.split
	{
		r2 = r19
		r18 = #0
		r1:0 = combine(#0,#0)
	}
.LBB84_3:                               // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
	}
	{
		r2 = add(pc,##.L.str.9.45@PCREL)
		r1 = r18
	}
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_type_to_string
		r2 = add(r29,#12)
		r1 = r18
	}
	{
		r2 = add(pc,##.L.str.10.46@PCREL)
		r1 = r18
	}
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_type_to_string
		r2 = add(r29,#8)
		r1 = r18
	}
	{
		r1 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r1
		if (p0.new) jump:nt .LBB84_4
	}
// %bb.5:                               // %if.else.i
	{
		r2 = add(r0,sub(#1,r17))
		r1:0 = combine(r17,r16)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3 = asr(r2,#31)
	}
	{
		r1:0 = combine(r17,r16)
		jump .LBB84_6
	}
.LBB84_4:                               // %if.then.i
	{
		r1 = add(pc,##.L.str.7.92@PCREL)
		r0 = r16
	}
.LBB84_6:                               // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
	}
	{
		call ##free
		r0 = r17
	}
	{
		r0 = #-3
		r17:16 = memd(r29+#40)
		r19:18 = memd(r29+#32)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end84:
	.size	halide_error_bad_type, .Lfunc_end84-halide_error_bad_type
                                        // -- End function
	.section	.text.halide_error_bad_dimensions,"ax",@progbits
	.weak	halide_error_bad_dimensions     // -- Begin function halide_error_bad_dimensions
	.p2align	4
	.type	halide_error_bad_dimensions,@function
halide_error_bad_dimensions:            // @halide_error_bad_dimensions
// %bb.0:                               // %entry
	{
		r17 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#48)
	}                                       // 8-byte Folded Spill
	{
		r22 = r3
		r19:18 = combine(r1,r2)
		memd(r29+#32) = r19:18
		memd(r29+#16) = r23:22
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
		memd(r29+#24) = r21:20
	}                                       // 8-byte Folded Spill
	{
		r16 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB85_1
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.2:                               // %if.then6.i
	{
		r20 = add(r16,#1023)
		r3:2 = combine(#0,r19)
	}
	{
		r1:0 = combine(r20,r16)
		jump .LBB85_3
		memb(r16+#1023) = r3
	}
.LBB85_1:                               // %entry.split
	{
		r2 = r19
		r20 = #0
		r1:0 = combine(#0,#0)
	}
.LBB85_3:                               // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
	}
	{
		r2 = add(pc,##.L.str.11.47@PCREL)
		r1 = r20
	}
	{
		call ##halide_string_to_string
		r23 = asr(r22,#31)
	}
	{
		r3:2 = combine(r23,r22)
		r4 = #1
		r1 = r20
	}
	{
		call ##halide_int64_to_string
	}
	{
		r2 = add(pc,##.L.str.12.48@PCREL)
		r1 = r20
	}
	{
		call ##halide_string_to_string
		r19 = asr(r18,#31)
	}
	{
		r3:2 = combine(r19,r18)
		r4 = #1
		r1 = r20
	}
	{
		call ##halide_int64_to_string
	}
	{
		r2 = add(pc,##.L.str.13.49@PCREL)
		r1 = r20
	}
	{
		call ##halide_string_to_string
	}
	{
		r1 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r1
		if (p0.new) jump:nt .LBB85_4
	}
// %bb.5:                               // %if.else.i
	{
		r2 = add(r0,sub(#1,r16))
		r1:0 = combine(r16,r17)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3 = asr(r2,#31)
	}
	{
		r1:0 = combine(r16,r17)
		jump .LBB85_6
	}
.LBB85_4:                               // %if.then.i
	{
		r1 = add(pc,##.L.str.7.92@PCREL)
		r0 = r17
	}
.LBB85_6:                               // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
	}
	{
		call ##free
		r0 = r16
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
.Lfunc_end85:
	.size	halide_error_bad_dimensions, .Lfunc_end85-halide_error_bad_dimensions
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
		r19:18 = combine(r1,r2)
		memd(r29+#48) = r19:18
		memd(r29+#40) = r21:20
	}                                       // 8-byte Folded Spill
	{
		memd(r29+#32) = r23:22
		memd(r29+#24) = r25:24
	}                                       // 8-byte Folded Spill
	{
		if (!p0) jump:nt .LBB86_7
		memd(r29+#16) = r27:26
	}                                       // 8-byte Folded Spill
// %bb.1:                               // %if.then
	{
		r0 = #1024
		r20 = r5
		r26 = r3
	}
	{
		call ##malloc
	}
	{
		r17 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB86_2
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.3:                               // %if.then6.i
	{
		r22 = add(r17,#1023)
		r3:2 = combine(#0,r19)
	}
	{
		r1:0 = combine(r22,r17)
		jump .LBB86_4
		memb(r17+#1023) = r3
	}
.LBB86_7:                               // %if.else
	{
		r24 = r4
		r20 = memw(r29+#72)
		if (!cmp.gt(r4,r20.new)) jump:t .LBB86_14
	}
// %bb.8:                               // %if.then8
	{
		call ##malloc
		r0 = #1024
	}
	{
		r17 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB86_9
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.10:                              // %if.then6.i59
	{
		r22 = add(r17,#1023)
		r3:2 = combine(#0,r19)
	}
	{
		r1:0 = combine(r22,r17)
		jump .LBB86_11
		memb(r17+#1023) = r3
	}
.LBB86_2:                               // %if.then.split
	{
		r2 = r19
		r22 = #0
		r1:0 = combine(#0,#0)
	}
.LBB86_4:                               // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
	}
	{
		r2 = add(pc,##.L.str.14.50@PCREL)
		r1 = r22
	}
	{
		call ##halide_string_to_string
		r27 = asr(r26,#31)
	}
	{
		r3:2 = combine(r27,r26)
		r4 = #1
		r1 = r22
	}
	{
		call ##halide_int64_to_string
	}
	{
		r2 = add(pc,##.L.str.15.51@PCREL)
		jump .LBB86_5
	}
.LBB86_9:                               // %if.then8.split
	{
		r2 = r19
		r22 = #0
		r1:0 = combine(#0,#0)
	}
.LBB86_11:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit62
	{
		call ##halide_string_to_string
	}
	{
		r2 = add(pc,##.L.str.14.50@PCREL)
		r1 = r22
	}
	{
		call ##halide_string_to_string
		r25 = asr(r24,#31)
	}
	{
		r3:2 = combine(r25,r24)
		r4 = #1
		r1 = r22
	}
	{
		call ##halide_int64_to_string
	}
	{
		r2 = add(pc,##.L.str.17.53@PCREL)
	}
.LBB86_5:                               // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
		r21 = asr(r20,#31)
		r1 = r22
	}
	{
		r3:2 = combine(r21,r20)
		r4 = #1
		r1 = r22
	}
	{
		call ##halide_int64_to_string
	}
	{
		r2 = add(pc,##.L.str.16.52@PCREL)
		r1 = r22
	}
	{
		call ##halide_string_to_string
		r19 = asr(r18,#31)
	}
	{
		r3:2 = combine(r19,r18)
		r4 = #1
		r1 = r22
	}
	{
		call ##halide_int64_to_string
	}
	{
		r1 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r1
		if (p0.new) jump:nt .LBB86_6
	}
// %bb.12:                              // %if.else.i101
	{
		r2 = add(r0,sub(#1,r17))
		r1:0 = combine(r17,r16)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3 = asr(r2,#31)
	}
	{
		call ##halide_error
		r1:0 = combine(r17,r16)
	}
	{
		jump .LBB86_13
	}
.LBB86_6:                               // %if.then.i
	{
		r1 = add(pc,##.L.str.7.92@PCREL)
		r0 = r16
	}
	{
		call ##halide_error
		r17 = #0
	}
.LBB86_13:                              // %if.end17.sink.split
	{
		call ##free
		r0 = r17
	}
.LBB86_14:                              // %if.end17
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
.Lfunc_end86:
	.size	halide_error_access_out_of_bounds, .Lfunc_end86-halide_error_access_out_of_bounds
                                        // -- End function
	.section	.text.halide_error_buffer_allocation_too_large,"ax",@progbits
	.weak	halide_error_buffer_allocation_too_large // -- Begin function halide_error_buffer_allocation_too_large
	.p2align	4
	.type	halide_error_buffer_allocation_too_large,@function
halide_error_buffer_allocation_too_large: // @halide_error_buffer_allocation_too_large
// %bb.0:                               // %entry
	{
		r17 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#48)
	}                                       // 8-byte Folded Spill
	{
		r19:18 = combine(r5,r4)
		r21:20 = combine(r3,r2)
		memd(r29+#32) = r19:18
		memd(r29+#24) = r21:20
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
		r23 = r1
		memd(r29+#16) = r23:22
	}                                       // 8-byte Folded Spill
	{
		r16 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB87_1
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.2:                               // %if.then6.i
	{
		r2 = add(pc,##.L.str.18.54@PCREL)
		r22 = add(r16,#1023)
		r3 = #0
	}
	{
		r1:0 = combine(r22,r16)
		jump .LBB87_3
		memb(r16+#1023) = r3
	}
.LBB87_1:                               // %entry.split
	{
		r2 = add(pc,##.L.str.18.54@PCREL)
		r22 = #0
		r1:0 = combine(#0,#0)
	}
.LBB87_3:                               // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r22
		r2 = r23
	}
	{
		r2 = add(pc,##.L.str.19.55@PCREL)
		r1 = r22
	}
	{
		call ##halide_string_to_string
	}
	{
		r3:2 = combine(r21,r20)
		r4 = #1
		r1 = r22
	}
	{
		call ##halide_uint64_to_string
	}
	{
		r2 = add(pc,##.L.str.20.56@PCREL)
		r1 = r22
	}
	{
		call ##halide_string_to_string
	}
	{
		r3:2 = combine(r19,r18)
		r4 = #1
		r1 = r22
	}
	{
		call ##halide_uint64_to_string
	}
	{
		r1 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r1
		if (p0.new) jump:nt .LBB87_4
	}
// %bb.5:                               // %if.else.i
	{
		r2 = add(r0,sub(#1,r16))
		r1:0 = combine(r16,r17)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3 = asr(r2,#31)
	}
	{
		r1:0 = combine(r16,r17)
		jump .LBB87_6
	}
.LBB87_4:                               // %if.then.i
	{
		r1 = add(pc,##.L.str.7.92@PCREL)
		r0 = r17
	}
.LBB87_6:                               // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
	}
	{
		call ##free
		r0 = r16
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
.Lfunc_end87:
	.size	halide_error_buffer_allocation_too_large, .Lfunc_end87-halide_error_buffer_allocation_too_large
                                        // -- End function
	.section	.text.halide_error_buffer_extents_negative,"ax",@progbits
	.weak	halide_error_buffer_extents_negative // -- Begin function halide_error_buffer_extents_negative
	.p2align	4
	.type	halide_error_buffer_extents_negative,@function
halide_error_buffer_extents_negative:   // @halide_error_buffer_extents_negative
// %bb.0:                               // %entry
	{
		r17 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#48)
	}                                       // 8-byte Folded Spill
	{
		r19:18 = combine(r1,r3)
		r22 = r2
		memd(r29+#32) = r19:18
		memd(r29+#16) = r23:22
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
		memd(r29+#24) = r21:20
	}                                       // 8-byte Folded Spill
	{
		r16 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB88_1
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.2:                               // %if.then6.i
	{
		r2 = add(pc,##.L.str.21.57@PCREL)
		r20 = add(r16,#1023)
		r3 = #0
	}
	{
		r1:0 = combine(r20,r16)
		jump .LBB88_3
		memb(r16+#1023) = r3
	}
.LBB88_1:                               // %entry.split
	{
		r2 = add(pc,##.L.str.21.57@PCREL)
		r20 = #0
		r1:0 = combine(#0,#0)
	}
.LBB88_3:                               // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r20
		r2 = r19
	}
	{
		r2 = add(pc,##.L.str.22.58@PCREL)
		r1 = r20
	}
	{
		call ##halide_string_to_string
		r23 = asr(r22,#31)
	}
	{
		r3:2 = combine(r23,r22)
		r4 = #1
		r1 = r20
	}
	{
		call ##halide_int64_to_string
	}
	{
		r2 = add(pc,##.L.str.23.59@PCREL)
		r1 = r20
	}
	{
		call ##halide_string_to_string
		r19 = asr(r18,#31)
	}
	{
		r3:2 = combine(r19,r18)
		r4 = #1
		r1 = r20
	}
	{
		call ##halide_int64_to_string
	}
	{
		r2 = add(pc,##.L.str.8.44@PCREL)
		r1 = r20
	}
	{
		call ##halide_string_to_string
	}
	{
		r1 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r1
		if (p0.new) jump:nt .LBB88_4
	}
// %bb.5:                               // %if.else.i
	{
		r2 = add(r0,sub(#1,r16))
		r1:0 = combine(r16,r17)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3 = asr(r2,#31)
	}
	{
		r1:0 = combine(r16,r17)
		jump .LBB88_6
	}
.LBB88_4:                               // %if.then.i
	{
		r1 = add(pc,##.L.str.7.92@PCREL)
		r0 = r17
	}
.LBB88_6:                               // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
	}
	{
		call ##free
		r0 = r16
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
.Lfunc_end88:
	.size	halide_error_buffer_extents_negative, .Lfunc_end88-halide_error_buffer_extents_negative
                                        // -- End function
	.section	.text.halide_error_buffer_extents_too_large,"ax",@progbits
	.weak	halide_error_buffer_extents_too_large // -- Begin function halide_error_buffer_extents_too_large
	.p2align	4
	.type	halide_error_buffer_extents_too_large,@function
halide_error_buffer_extents_too_large:  // @halide_error_buffer_extents_too_large
// %bb.0:                               // %entry
	{
		r17 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#48)
	}                                       // 8-byte Folded Spill
	{
		r19:18 = combine(r5,r4)
		r21:20 = combine(r3,r2)
		memd(r29+#32) = r19:18
		memd(r29+#24) = r21:20
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
		r23 = r1
		memd(r29+#16) = r23:22
	}                                       // 8-byte Folded Spill
	{
		r16 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB89_1
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.2:                               // %if.then6.i
	{
		r2 = add(pc,##.L.str.24.60@PCREL)
		r22 = add(r16,#1023)
		r3 = #0
	}
	{
		r1:0 = combine(r22,r16)
		jump .LBB89_3
		memb(r16+#1023) = r3
	}
.LBB89_1:                               // %entry.split
	{
		r2 = add(pc,##.L.str.24.60@PCREL)
		r22 = #0
		r1:0 = combine(#0,#0)
	}
.LBB89_3:                               // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r22
		r2 = r23
	}
	{
		r2 = add(pc,##.L.str.19.55@PCREL)
		r1 = r22
	}
	{
		call ##halide_string_to_string
	}
	{
		r3:2 = combine(r21,r20)
		r4 = #1
		r1 = r22
	}
	{
		call ##halide_int64_to_string
	}
	{
		r2 = add(pc,##.L.str.20.56@PCREL)
		r1 = r22
	}
	{
		call ##halide_string_to_string
	}
	{
		r3:2 = combine(r19,r18)
		r4 = #1
		r1 = r22
	}
	{
		call ##halide_int64_to_string
	}
	{
		r1 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r1
		if (p0.new) jump:nt .LBB89_4
	}
// %bb.5:                               // %if.else.i
	{
		r2 = add(r0,sub(#1,r16))
		r1:0 = combine(r16,r17)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3 = asr(r2,#31)
	}
	{
		r1:0 = combine(r16,r17)
		jump .LBB89_6
	}
.LBB89_4:                               // %if.then.i
	{
		r1 = add(pc,##.L.str.7.92@PCREL)
		r0 = r17
	}
.LBB89_6:                               // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
	}
	{
		call ##free
		r0 = r16
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
.Lfunc_end89:
	.size	halide_error_buffer_extents_too_large, .Lfunc_end89-halide_error_buffer_extents_too_large
                                        // -- End function
	.section	.text.halide_error_constraints_make_required_region_smaller,"ax",@progbits
	.weak	halide_error_constraints_make_required_region_smaller // -- Begin function halide_error_constraints_make_required_region_smaller
	.p2align	4
	.type	halide_error_constraints_make_required_region_smaller,@function
halide_error_constraints_make_required_region_smaller: // @halide_error_constraints_make_required_region_smaller
// %bb.0:                               // %entry
	{
		r17 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#72)
	}                                       // 8-byte Folded Spill
	{
		r2 = add(r3,add(r4,#-1))
		r19:18 = combine(r1,r2)
		r6 = memw(r29+#80)
		memd(r29+#56) = r19:18
	}
	{
		r24 = add(r5,add(r6,#-1))
		r22 = r3
		memd(r29+#40) = r23:22
		memd(r29+#32) = r25:24
	}                                       // 8-byte Folded Spill
	{
		r26 = r5
		memd(r29+#24) = r27:26
		memd(r29+#48) = r21:20
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
		memd(r29+#0) = r3:2
	}                                       // 8-byte Folded Spill
	{
		r16 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB90_1
		memw(r29+#12) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.2:                               // %if.then6.i
	{
		r2 = add(pc,##.L.str.25.61@PCREL)
		r20 = add(r16,#1023)
		r3 = #0
	}
	{
		r1:0 = combine(r20,r16)
		jump .LBB90_3
		memb(r16+#1023) = r3
	}
.LBB90_1:                               // %entry.split
	{
		r2 = add(pc,##.L.str.25.61@PCREL)
		r20 = #0
		r1:0 = combine(#0,#0)
	}
.LBB90_3:                               // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r20
		r2 = r19
	}
	{
		r2 = add(pc,##.L.str.26.62@PCREL)
		r1 = r20
	}
	{
		call ##halide_string_to_string
		r19 = asr(r18,#31)
	}
	{
		r3:2 = combine(r19,r18)
		r4 = #1
		r1 = r20
	}
	{
		r18 = add(pc,##.L.str.27.63@PCREL)
		call ##halide_int64_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r20
		r2 = r18
	}
	{
		r2 = add(pc,##.L.str.28.64@PCREL)
		r1 = r20
	}
	{
		call ##halide_string_to_string
		r27 = asr(r26,#31)
	}
	{
		r3:2 = combine(r27,r26)
		r4 = #1
		r1 = r20
	}
	{
		r19 = add(pc,##.L.str.6.42@PCREL)
		call ##halide_int64_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r20
		r2 = r19
	}
	{
		r25 = asr(r24,#31)
		r4 = #1
		r1 = r20
	}
	{
		call ##halide_int64_to_string
		r3:2 = combine(r25,r24)
	}
	{
		call ##halide_string_to_string
		r1 = r20
		r2 = r18
	}
	{
		r2 = add(pc,##.L.str.29.65@PCREL)
		r1 = r20
	}
	{
		call ##halide_string_to_string
		r23 = asr(r22,#31)
	}
	{
		r3:2 = combine(r23,r22)
		r4 = #1
		r1 = r20
	}
	{
		call ##halide_int64_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r20
		r2 = r19
	}
	{
		r4 = #1
		r1 = r20
		r3:2 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		call ##halide_int64_to_string
		r3 = asr(r2,#31)
	}
	{
		r2 = add(pc,##.L.str.30.66@PCREL)
		r1 = r20
	}
	{
		call ##halide_string_to_string
	}
	{
		r1 = memw(r29+#12)
	}                                       // 4-byte Folded Reload
	{
		p0 = r1
		if (p0.new) jump:nt .LBB90_4
	}
// %bb.5:                               // %if.else.i
	{
		r2 = add(r0,sub(#1,r16))
		r1:0 = combine(r16,r17)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3 = asr(r2,#31)
	}
	{
		r1:0 = combine(r16,r17)
		jump .LBB90_6
	}
.LBB90_4:                               // %if.then.i
	{
		r1 = add(pc,##.L.str.7.92@PCREL)
		r0 = r17
	}
.LBB90_6:                               // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
	}
	{
		call ##free
		r0 = r16
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
.Lfunc_end90:
	.size	halide_error_constraints_make_required_region_smaller, .Lfunc_end90-halide_error_constraints_make_required_region_smaller
                                        // -- End function
	.section	.text.halide_error_constraint_violated,"ax",@progbits
	.weak	halide_error_constraint_violated // -- Begin function halide_error_constraint_violated
	.p2align	4
	.type	halide_error_constraint_violated,@function
halide_error_constraint_violated:       // @halide_error_constraint_violated
// %bb.0:                               // %entry
	{
		r17 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#48)
	}                                       // 8-byte Folded Spill
	{
		r19:18 = combine(r3,r4)
		r21 = r1
		memd(r29+#32) = r19:18
		memd(r29+#24) = r21:20
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
		r22 = r2
		memd(r29+#16) = r23:22
	}                                       // 8-byte Folded Spill
	{
		r16 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB91_1
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.2:                               // %if.then6.i
	{
		r2 = add(pc,##.L.str.31.67@PCREL)
		r20 = add(r16,#1023)
		r3 = #0
	}
	{
		r1:0 = combine(r20,r16)
		jump .LBB91_3
		memb(r16+#1023) = r3
	}
.LBB91_1:                               // %entry.split
	{
		r2 = add(pc,##.L.str.31.67@PCREL)
		r20 = #0
		r1:0 = combine(#0,#0)
	}
.LBB91_3:                               // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r20
		r2 = r21
	}
	{
		r21 = add(pc,##.L.str.32.68@PCREL)
		r1 = r20
	}
	{
		call ##halide_string_to_string
		r23 = asr(r22,#31)
		r2 = r21
	}
	{
		r3:2 = combine(r23,r22)
		r4 = #1
		r1 = r20
	}
	{
		call ##halide_int64_to_string
	}
	{
		r2 = add(pc,##.L.str.33.69@PCREL)
		r1 = r20
	}
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r20
		r2 = r19
	}
	{
		call ##halide_string_to_string
		r1 = r20
		r2 = r21
	}
	{
		r19 = asr(r18,#31)
		r4 = #1
		r1 = r20
	}
	{
		call ##halide_int64_to_string
		r3:2 = combine(r19,r18)
	}
	{
		r2 = add(pc,##.L.str.8.44@PCREL)
		r1 = r20
	}
	{
		call ##halide_string_to_string
	}
	{
		r1 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r1
		if (p0.new) jump:nt .LBB91_4
	}
// %bb.5:                               // %if.else.i
	{
		r2 = add(r0,sub(#1,r16))
		r1:0 = combine(r16,r17)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3 = asr(r2,#31)
	}
	{
		r1:0 = combine(r16,r17)
		jump .LBB91_6
	}
.LBB91_4:                               // %if.then.i
	{
		r1 = add(pc,##.L.str.7.92@PCREL)
		r0 = r17
	}
.LBB91_6:                               // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
	}
	{
		call ##free
		r0 = r16
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
.Lfunc_end91:
	.size	halide_error_constraint_violated, .Lfunc_end91-halide_error_constraint_violated
                                        // -- End function
	.section	.text.halide_error_param_too_small_i64,"ax",@progbits
	.weak	halide_error_param_too_small_i64 // -- Begin function halide_error_param_too_small_i64
	.p2align	4
	.type	halide_error_param_too_small_i64,@function
halide_error_param_too_small_i64:       // @halide_error_param_too_small_i64
// %bb.0:                               // %entry
	{
		r17 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#48)
	}                                       // 8-byte Folded Spill
	{
		r19:18 = combine(r5,r4)
		r21:20 = combine(r3,r2)
		memd(r29+#32) = r19:18
		memd(r29+#24) = r21:20
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
		r23 = r1
		memd(r29+#16) = r23:22
	}                                       // 8-byte Folded Spill
	{
		r16 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB92_1
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.2:                               // %if.then6.i
	{
		r2 = add(pc,##.L.str.34.70@PCREL)
		r22 = add(r16,#1023)
		r3 = #0
	}
	{
		r1:0 = combine(r22,r16)
		jump .LBB92_3
		memb(r16+#1023) = r3
	}
.LBB92_1:                               // %entry.split
	{
		r2 = add(pc,##.L.str.34.70@PCREL)
		r22 = #0
		r1:0 = combine(#0,#0)
	}
.LBB92_3:                               // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r22
		r2 = r23
	}
	{
		r2 = add(pc,##.L.str.19.55@PCREL)
		r1 = r22
	}
	{
		call ##halide_string_to_string
	}
	{
		r3:2 = combine(r21,r20)
		r4 = #1
		r1 = r22
	}
	{
		call ##halide_int64_to_string
	}
	{
		r2 = add(pc,##.L.str.35.71@PCREL)
		r1 = r22
	}
	{
		call ##halide_string_to_string
	}
	{
		r3:2 = combine(r19,r18)
		r4 = #1
		r1 = r22
	}
	{
		call ##halide_int64_to_string
	}
	{
		r1 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r1
		if (p0.new) jump:nt .LBB92_4
	}
// %bb.5:                               // %if.else.i
	{
		r2 = add(r0,sub(#1,r16))
		r1:0 = combine(r16,r17)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3 = asr(r2,#31)
	}
	{
		r1:0 = combine(r16,r17)
		jump .LBB92_6
	}
.LBB92_4:                               // %if.then.i
	{
		r1 = add(pc,##.L.str.7.92@PCREL)
		r0 = r17
	}
.LBB92_6:                               // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
	}
	{
		call ##free
		r0 = r16
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
.Lfunc_end92:
	.size	halide_error_param_too_small_i64, .Lfunc_end92-halide_error_param_too_small_i64
                                        // -- End function
	.section	.text.halide_error_param_too_small_u64,"ax",@progbits
	.weak	halide_error_param_too_small_u64 // -- Begin function halide_error_param_too_small_u64
	.p2align	4
	.type	halide_error_param_too_small_u64,@function
halide_error_param_too_small_u64:       // @halide_error_param_too_small_u64
// %bb.0:                               // %entry
	{
		r17 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#48)
	}                                       // 8-byte Folded Spill
	{
		r19:18 = combine(r5,r4)
		r21:20 = combine(r3,r2)
		memd(r29+#32) = r19:18
		memd(r29+#24) = r21:20
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
		r23 = r1
		memd(r29+#16) = r23:22
	}                                       // 8-byte Folded Spill
	{
		r16 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB93_1
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.2:                               // %if.then6.i
	{
		r2 = add(pc,##.L.str.34.70@PCREL)
		r22 = add(r16,#1023)
		r3 = #0
	}
	{
		r1:0 = combine(r22,r16)
		jump .LBB93_3
		memb(r16+#1023) = r3
	}
.LBB93_1:                               // %entry.split
	{
		r2 = add(pc,##.L.str.34.70@PCREL)
		r22 = #0
		r1:0 = combine(#0,#0)
	}
.LBB93_3:                               // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r22
		r2 = r23
	}
	{
		r2 = add(pc,##.L.str.19.55@PCREL)
		r1 = r22
	}
	{
		call ##halide_string_to_string
	}
	{
		r3:2 = combine(r21,r20)
		r4 = #1
		r1 = r22
	}
	{
		call ##halide_uint64_to_string
	}
	{
		r2 = add(pc,##.L.str.35.71@PCREL)
		r1 = r22
	}
	{
		call ##halide_string_to_string
	}
	{
		r3:2 = combine(r19,r18)
		r4 = #1
		r1 = r22
	}
	{
		call ##halide_uint64_to_string
	}
	{
		r1 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r1
		if (p0.new) jump:nt .LBB93_4
	}
// %bb.5:                               // %if.else.i
	{
		r2 = add(r0,sub(#1,r16))
		r1:0 = combine(r16,r17)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3 = asr(r2,#31)
	}
	{
		r1:0 = combine(r16,r17)
		jump .LBB93_6
	}
.LBB93_4:                               // %if.then.i
	{
		r1 = add(pc,##.L.str.7.92@PCREL)
		r0 = r17
	}
.LBB93_6:                               // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
	}
	{
		call ##free
		r0 = r16
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
.Lfunc_end93:
	.size	halide_error_param_too_small_u64, .Lfunc_end93-halide_error_param_too_small_u64
                                        // -- End function
	.section	.text.halide_error_param_too_small_f64,"ax",@progbits
	.weak	halide_error_param_too_small_f64 // -- Begin function halide_error_param_too_small_f64
	.p2align	4
	.type	halide_error_param_too_small_f64,@function
halide_error_param_too_small_f64:       // @halide_error_param_too_small_f64
// %bb.0:                               // %entry
	{
		r17 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#48)
	}                                       // 8-byte Folded Spill
	{
		r19:18 = combine(r5,r4)
		r21:20 = combine(r3,r2)
		memd(r29+#32) = r19:18
		memd(r29+#24) = r21:20
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
		r23 = r1
		memd(r29+#16) = r23:22
	}                                       // 8-byte Folded Spill
	{
		r16 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB94_1
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.2:                               // %if.then6.i
	{
		r2 = add(pc,##.L.str.34.70@PCREL)
		r22 = add(r16,#1023)
		r3 = #0
	}
	{
		r1:0 = combine(r22,r16)
		jump .LBB94_3
		memb(r16+#1023) = r3
	}
.LBB94_1:                               // %entry.split
	{
		r2 = add(pc,##.L.str.34.70@PCREL)
		r22 = #0
		r1:0 = combine(#0,#0)
	}
.LBB94_3:                               // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r22
		r2 = r23
	}
	{
		r2 = add(pc,##.L.str.19.55@PCREL)
		r1 = r22
	}
	{
		call ##halide_string_to_string
	}
	{
		r3:2 = combine(r21,r20)
		r4 = #1
		r1 = r22
	}
	{
		call ##halide_double_to_string
	}
	{
		r2 = add(pc,##.L.str.35.71@PCREL)
		r1 = r22
	}
	{
		call ##halide_string_to_string
	}
	{
		r3:2 = combine(r19,r18)
		r4 = #1
		r1 = r22
	}
	{
		call ##halide_double_to_string
	}
	{
		r1 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r1
		if (p0.new) jump:nt .LBB94_4
	}
// %bb.5:                               // %if.else.i
	{
		r2 = add(r0,sub(#1,r16))
		r1:0 = combine(r16,r17)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3 = asr(r2,#31)
	}
	{
		r1:0 = combine(r16,r17)
		jump .LBB94_6
	}
.LBB94_4:                               // %if.then.i
	{
		r1 = add(pc,##.L.str.7.92@PCREL)
		r0 = r17
	}
.LBB94_6:                               // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
	}
	{
		call ##free
		r0 = r16
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
.Lfunc_end94:
	.size	halide_error_param_too_small_f64, .Lfunc_end94-halide_error_param_too_small_f64
                                        // -- End function
	.section	.text.halide_error_param_too_large_i64,"ax",@progbits
	.weak	halide_error_param_too_large_i64 // -- Begin function halide_error_param_too_large_i64
	.p2align	4
	.type	halide_error_param_too_large_i64,@function
halide_error_param_too_large_i64:       // @halide_error_param_too_large_i64
// %bb.0:                               // %entry
	{
		r17 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#48)
	}                                       // 8-byte Folded Spill
	{
		r19:18 = combine(r5,r4)
		r21:20 = combine(r3,r2)
		memd(r29+#32) = r19:18
		memd(r29+#24) = r21:20
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
		r23 = r1
		memd(r29+#16) = r23:22
	}                                       // 8-byte Folded Spill
	{
		r16 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB95_1
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.2:                               // %if.then6.i
	{
		r2 = add(pc,##.L.str.34.70@PCREL)
		r22 = add(r16,#1023)
		r3 = #0
	}
	{
		r1:0 = combine(r22,r16)
		jump .LBB95_3
		memb(r16+#1023) = r3
	}
.LBB95_1:                               // %entry.split
	{
		r2 = add(pc,##.L.str.34.70@PCREL)
		r22 = #0
		r1:0 = combine(#0,#0)
	}
.LBB95_3:                               // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r22
		r2 = r23
	}
	{
		r2 = add(pc,##.L.str.19.55@PCREL)
		r1 = r22
	}
	{
		call ##halide_string_to_string
	}
	{
		r3:2 = combine(r21,r20)
		r4 = #1
		r1 = r22
	}
	{
		call ##halide_int64_to_string
	}
	{
		r2 = add(pc,##.L.str.36.72@PCREL)
		r1 = r22
	}
	{
		call ##halide_string_to_string
	}
	{
		r3:2 = combine(r19,r18)
		r4 = #1
		r1 = r22
	}
	{
		call ##halide_int64_to_string
	}
	{
		r1 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r1
		if (p0.new) jump:nt .LBB95_4
	}
// %bb.5:                               // %if.else.i
	{
		r2 = add(r0,sub(#1,r16))
		r1:0 = combine(r16,r17)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3 = asr(r2,#31)
	}
	{
		r1:0 = combine(r16,r17)
		jump .LBB95_6
	}
.LBB95_4:                               // %if.then.i
	{
		r1 = add(pc,##.L.str.7.92@PCREL)
		r0 = r17
	}
.LBB95_6:                               // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
	}
	{
		call ##free
		r0 = r16
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
.Lfunc_end95:
	.size	halide_error_param_too_large_i64, .Lfunc_end95-halide_error_param_too_large_i64
                                        // -- End function
	.section	.text.halide_error_param_too_large_u64,"ax",@progbits
	.weak	halide_error_param_too_large_u64 // -- Begin function halide_error_param_too_large_u64
	.p2align	4
	.type	halide_error_param_too_large_u64,@function
halide_error_param_too_large_u64:       // @halide_error_param_too_large_u64
// %bb.0:                               // %entry
	{
		r17 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#48)
	}                                       // 8-byte Folded Spill
	{
		r19:18 = combine(r5,r4)
		r21:20 = combine(r3,r2)
		memd(r29+#32) = r19:18
		memd(r29+#24) = r21:20
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
		r23 = r1
		memd(r29+#16) = r23:22
	}                                       // 8-byte Folded Spill
	{
		r16 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB96_1
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.2:                               // %if.then6.i
	{
		r2 = add(pc,##.L.str.34.70@PCREL)
		r22 = add(r16,#1023)
		r3 = #0
	}
	{
		r1:0 = combine(r22,r16)
		jump .LBB96_3
		memb(r16+#1023) = r3
	}
.LBB96_1:                               // %entry.split
	{
		r2 = add(pc,##.L.str.34.70@PCREL)
		r22 = #0
		r1:0 = combine(#0,#0)
	}
.LBB96_3:                               // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r22
		r2 = r23
	}
	{
		r2 = add(pc,##.L.str.19.55@PCREL)
		r1 = r22
	}
	{
		call ##halide_string_to_string
	}
	{
		r3:2 = combine(r21,r20)
		r4 = #1
		r1 = r22
	}
	{
		call ##halide_uint64_to_string
	}
	{
		r2 = add(pc,##.L.str.36.72@PCREL)
		r1 = r22
	}
	{
		call ##halide_string_to_string
	}
	{
		r3:2 = combine(r19,r18)
		r4 = #1
		r1 = r22
	}
	{
		call ##halide_uint64_to_string
	}
	{
		r1 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r1
		if (p0.new) jump:nt .LBB96_4
	}
// %bb.5:                               // %if.else.i
	{
		r2 = add(r0,sub(#1,r16))
		r1:0 = combine(r16,r17)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3 = asr(r2,#31)
	}
	{
		r1:0 = combine(r16,r17)
		jump .LBB96_6
	}
.LBB96_4:                               // %if.then.i
	{
		r1 = add(pc,##.L.str.7.92@PCREL)
		r0 = r17
	}
.LBB96_6:                               // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
	}
	{
		call ##free
		r0 = r16
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
.Lfunc_end96:
	.size	halide_error_param_too_large_u64, .Lfunc_end96-halide_error_param_too_large_u64
                                        // -- End function
	.section	.text.halide_error_param_too_large_f64,"ax",@progbits
	.weak	halide_error_param_too_large_f64 // -- Begin function halide_error_param_too_large_f64
	.p2align	4
	.type	halide_error_param_too_large_f64,@function
halide_error_param_too_large_f64:       // @halide_error_param_too_large_f64
// %bb.0:                               // %entry
	{
		r17 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#48)
	}                                       // 8-byte Folded Spill
	{
		r19:18 = combine(r5,r4)
		r21:20 = combine(r3,r2)
		memd(r29+#32) = r19:18
		memd(r29+#24) = r21:20
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
		r23 = r1
		memd(r29+#16) = r23:22
	}                                       // 8-byte Folded Spill
	{
		r16 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB97_1
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.2:                               // %if.then6.i
	{
		r2 = add(pc,##.L.str.34.70@PCREL)
		r22 = add(r16,#1023)
		r3 = #0
	}
	{
		r1:0 = combine(r22,r16)
		jump .LBB97_3
		memb(r16+#1023) = r3
	}
.LBB97_1:                               // %entry.split
	{
		r2 = add(pc,##.L.str.34.70@PCREL)
		r22 = #0
		r1:0 = combine(#0,#0)
	}
.LBB97_3:                               // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r22
		r2 = r23
	}
	{
		r2 = add(pc,##.L.str.19.55@PCREL)
		r1 = r22
	}
	{
		call ##halide_string_to_string
	}
	{
		r3:2 = combine(r21,r20)
		r4 = #1
		r1 = r22
	}
	{
		call ##halide_double_to_string
	}
	{
		r2 = add(pc,##.L.str.36.72@PCREL)
		r1 = r22
	}
	{
		call ##halide_string_to_string
	}
	{
		r3:2 = combine(r19,r18)
		r4 = #1
		r1 = r22
	}
	{
		call ##halide_double_to_string
	}
	{
		r1 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r1
		if (p0.new) jump:nt .LBB97_4
	}
// %bb.5:                               // %if.else.i
	{
		r2 = add(r0,sub(#1,r16))
		r1:0 = combine(r16,r17)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3 = asr(r2,#31)
	}
	{
		r1:0 = combine(r16,r17)
		jump .LBB97_6
	}
.LBB97_4:                               // %if.then.i
	{
		r1 = add(pc,##.L.str.7.92@PCREL)
		r0 = r17
	}
.LBB97_6:                               // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
	}
	{
		call ##free
		r0 = r16
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
.Lfunc_end97:
	.size	halide_error_param_too_large_f64, .Lfunc_end97-halide_error_param_too_large_f64
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
.Lfunc_end98:
	.size	halide_error_out_of_memory, .Lfunc_end98-halide_error_out_of_memory
                                        // -- End function
	.section	.text.halide_error_buffer_argument_is_null,"ax",@progbits
	.weak	halide_error_buffer_argument_is_null // -- Begin function halide_error_buffer_argument_is_null
	.p2align	4
	.type	halide_error_buffer_argument_is_null,@function
halide_error_buffer_argument_is_null:   // @halide_error_buffer_argument_is_null
// %bb.0:                               // %entry
	{
		r17 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#32)
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
		r18 = r1
		memd(r29+#16) = r19:18
	}                                       // 8-byte Folded Spill
	{
		r16 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB99_1
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.2:                               // %if.then6.i
	{
		r2 = add(pc,##.L.str.38@PCREL)
		r19 = add(r16,#1023)
		r3 = #0
	}
	{
		r1:0 = combine(r19,r16)
		jump .LBB99_3
		memb(r16+#1023) = r3
	}
.LBB99_1:                               // %entry.split
	{
		r2 = add(pc,##.L.str.38@PCREL)
		r19 = #0
		r1:0 = combine(#0,#0)
	}
.LBB99_3:                               // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r19
		r2 = r18
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
		if (p0.new) jump:nt .LBB99_4
	}
// %bb.5:                               // %if.else.i
	{
		r2 = add(r0,sub(#1,r16))
		r1:0 = combine(r16,r17)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3 = asr(r2,#31)
	}
	{
		r1:0 = combine(r16,r17)
		jump .LBB99_6
	}
.LBB99_4:                               // %if.then.i
	{
		r1 = add(pc,##.L.str.7.92@PCREL)
		r0 = r17
	}
.LBB99_6:                               // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
	}
	{
		call ##free
		r0 = r16
	}
	{
		r0 = #-12
		r17:16 = memd(r29+#24)
		r19:18 = memd(r29+#16)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end99:
	.size	halide_error_buffer_argument_is_null, .Lfunc_end99-halide_error_buffer_argument_is_null
                                        // -- End function
	.section	.text.halide_error_debug_to_file_failed,"ax",@progbits
	.weak	halide_error_debug_to_file_failed // -- Begin function halide_error_debug_to_file_failed
	.p2align	4
	.type	halide_error_debug_to_file_failed,@function
halide_error_debug_to_file_failed:      // @halide_error_debug_to_file_failed
// %bb.0:                               // %entry
	{
		r17 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#40)
	}                                       // 8-byte Folded Spill
	{
		r19:18 = combine(r2,r3)
		r21 = r1
		memd(r29+#24) = r19:18
		memd(r29+#16) = r21:20
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
	}
	{
		r16 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB100_1
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.2:                               // %if.then6.i
	{
		r2 = add(pc,##.L.str.40@PCREL)
		r20 = add(r16,#1023)
		r3 = #0
	}
	{
		r1:0 = combine(r20,r16)
		jump .LBB100_3
		memb(r16+#1023) = r3
	}
.LBB100_1:                              // %entry.split
	{
		r2 = add(pc,##.L.str.40@PCREL)
		r20 = #0
		r1:0 = combine(#0,#0)
	}
.LBB100_3:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r20
		r2 = r21
	}
	{
		r2 = add(pc,##.L.str.41.73@PCREL)
		r1 = r20
	}
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r20
		r2 = r19
	}
	{
		r2 = add(pc,##.L.str.42@PCREL)
		r1 = r20
	}
	{
		call ##halide_string_to_string
		r19 = asr(r18,#31)
	}
	{
		r3:2 = combine(r19,r18)
		r4 = #1
		r1 = r20
	}
	{
		call ##halide_int64_to_string
	}
	{
		r1 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r1
		if (p0.new) jump:nt .LBB100_4
	}
// %bb.5:                               // %if.else.i
	{
		r2 = add(r0,sub(#1,r16))
		r1:0 = combine(r16,r17)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3 = asr(r2,#31)
	}
	{
		r1:0 = combine(r16,r17)
		jump .LBB100_6
	}
.LBB100_4:                              // %if.then.i
	{
		r1 = add(pc,##.L.str.7.92@PCREL)
		r0 = r17
	}
.LBB100_6:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
	}
	{
		call ##free
		r0 = r16
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
.Lfunc_end100:
	.size	halide_error_debug_to_file_failed, .Lfunc_end100-halide_error_debug_to_file_failed
                                        // -- End function
	.section	.text.halide_error_unaligned_host_ptr,"ax",@progbits
	.weak	halide_error_unaligned_host_ptr // -- Begin function halide_error_unaligned_host_ptr
	.p2align	4
	.type	halide_error_unaligned_host_ptr,@function
halide_error_unaligned_host_ptr:        // @halide_error_unaligned_host_ptr
// %bb.0:                               // %entry
	{
		r17 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#40)
	}                                       // 8-byte Folded Spill
	{
		r19:18 = combine(r1,r2)
		memd(r29+#24) = r19:18
		memd(r29+#16) = r21:20
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
	}
	{
		r16 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB101_1
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.2:                               // %if.then6.i
	{
		r2 = add(pc,##.L.str.43@PCREL)
		r20 = add(r16,#1023)
		r3 = #0
	}
	{
		r1:0 = combine(r20,r16)
		jump .LBB101_3
		memb(r16+#1023) = r3
	}
.LBB101_1:                              // %entry.split
	{
		r2 = add(pc,##.L.str.43@PCREL)
		r20 = #0
		r1:0 = combine(#0,#0)
	}
.LBB101_3:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r20
		r2 = r19
	}
	{
		r2 = add(pc,##.L.str.44@PCREL)
		r1 = r20
	}
	{
		call ##halide_string_to_string
		r19 = asr(r18,#31)
	}
	{
		r3:2 = combine(r19,r18)
		r4 = #1
		r1 = r20
	}
	{
		call ##halide_int64_to_string
	}
	{
		r2 = add(pc,##.L.str.45@PCREL)
		r1 = r20
	}
	{
		call ##halide_string_to_string
	}
	{
		r1 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r1
		if (p0.new) jump:nt .LBB101_4
	}
// %bb.5:                               // %if.else.i
	{
		r2 = add(r0,sub(#1,r16))
		r1:0 = combine(r16,r17)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3 = asr(r2,#31)
	}
	{
		r1:0 = combine(r16,r17)
		jump .LBB101_6
	}
.LBB101_4:                              // %if.then.i
	{
		r1 = add(pc,##.L.str.7.92@PCREL)
		r0 = r17
	}
.LBB101_6:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
	}
	{
		call ##free
		r0 = r16
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
.Lfunc_end101:
	.size	halide_error_unaligned_host_ptr, .Lfunc_end101-halide_error_unaligned_host_ptr
                                        // -- End function
	.section	.text.halide_error_device_dirty_with_no_device_support,"ax",@progbits
	.weak	halide_error_device_dirty_with_no_device_support // -- Begin function halide_error_device_dirty_with_no_device_support
	.p2align	4
	.type	halide_error_device_dirty_with_no_device_support,@function
halide_error_device_dirty_with_no_device_support: // @halide_error_device_dirty_with_no_device_support
// %bb.0:                               // %entry
	{
		r17 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#32)
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
		r19 = r1
		memd(r29+#16) = r19:18
	}                                       // 8-byte Folded Spill
	{
		r16 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB102_1
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.2:                               // %if.then6.i
	{
		r2 = add(pc,##.L.str.46@PCREL)
		r18 = add(r16,#1023)
		r3 = #0
	}
	{
		r1:0 = combine(r18,r16)
		jump .LBB102_3
		memb(r16+#1023) = r3
	}
.LBB102_1:                              // %entry.split
	{
		r2 = add(pc,##.L.str.46@PCREL)
		r18 = #0
		r1:0 = combine(#0,#0)
	}
.LBB102_3:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r18
		r2 = r19
	}
	{
		r2 = add(pc,##.L.str.47@PCREL)
		r1 = r18
	}
	{
		call ##halide_string_to_string
	}
	{
		r2 = add(pc,##.L.str.48@PCREL)
		r1 = r18
	}
	{
		call ##halide_string_to_string
	}
	{
		r1 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r1
		if (p0.new) jump:nt .LBB102_4
	}
// %bb.5:                               // %if.else.i
	{
		r2 = add(r0,sub(#1,r16))
		r1:0 = combine(r16,r17)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3 = asr(r2,#31)
	}
	{
		r1:0 = combine(r16,r17)
		jump .LBB102_6
	}
.LBB102_4:                              // %if.then.i
	{
		r1 = add(pc,##.L.str.7.92@PCREL)
		r0 = r17
	}
.LBB102_6:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
	}
	{
		call ##free
		r0 = r16
	}
	{
		r0 = #-44
		r17:16 = memd(r29+#24)
		r19:18 = memd(r29+#16)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end102:
	.size	halide_error_device_dirty_with_no_device_support, .Lfunc_end102-halide_error_device_dirty_with_no_device_support
                                        // -- End function
	.section	.text.halide_error_host_is_null,"ax",@progbits
	.weak	halide_error_host_is_null       // -- Begin function halide_error_host_is_null
	.p2align	4
	.type	halide_error_host_is_null,@function
halide_error_host_is_null:              // @halide_error_host_is_null
// %bb.0:                               // %entry
	{
		r17 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#32)
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
		r18 = r1
		memd(r29+#16) = r19:18
	}                                       // 8-byte Folded Spill
	{
		r16 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB103_1
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.2:                               // %if.then6.i
	{
		r2 = add(pc,##.L.str.43@PCREL)
		r19 = add(r16,#1023)
		r3 = #0
	}
	{
		r1:0 = combine(r19,r16)
		jump .LBB103_3
		memb(r16+#1023) = r3
	}
.LBB103_1:                              // %entry.split
	{
		r2 = add(pc,##.L.str.43@PCREL)
		r19 = #0
		r1:0 = combine(#0,#0)
	}
.LBB103_3:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r19
		r2 = r18
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
		if (p0.new) jump:nt .LBB103_4
	}
// %bb.5:                               // %if.else.i
	{
		r2 = add(r0,sub(#1,r16))
		r1:0 = combine(r16,r17)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3 = asr(r2,#31)
	}
	{
		r1:0 = combine(r16,r17)
		jump .LBB103_6
	}
.LBB103_4:                              // %if.then.i
	{
		r1 = add(pc,##.L.str.7.92@PCREL)
		r0 = r17
	}
.LBB103_6:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
	}
	{
		call ##free
		r0 = r16
	}
	{
		r0 = #-34
		r17:16 = memd(r29+#24)
		r19:18 = memd(r29+#16)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end103:
	.size	halide_error_host_is_null, .Lfunc_end103-halide_error_host_is_null
                                        // -- End function
	.section	.text.halide_error_bad_fold,"ax",@progbits
	.weak	halide_error_bad_fold           // -- Begin function halide_error_bad_fold
	.p2align	4
	.type	halide_error_bad_fold,@function
halide_error_bad_fold:                  // @halide_error_bad_fold
// %bb.0:                               // %entry
	{
		r17 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#40)
	}                                       // 8-byte Folded Spill
	{
		r18 = r3
		r21:20 = combine(r2,r1)
		memd(r29+#24) = r19:18
		memd(r29+#16) = r21:20
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
	}
	{
		r16 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB104_1
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.2:                               // %if.then6.i
	{
		r2 = add(pc,##.L.str.50@PCREL)
		r19 = add(r16,#1023)
		r3 = #0
	}
	{
		r1:0 = combine(r19,r16)
		jump .LBB104_3
		memb(r16+#1023) = r3
	}
.LBB104_1:                              // %entry.split
	{
		r2 = add(pc,##.L.str.50@PCREL)
		r19 = #0
		r1:0 = combine(#0,#0)
	}
.LBB104_3:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
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
		r2 = r18
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
		if (p0.new) jump:nt .LBB104_4
	}
// %bb.5:                               // %if.else.i
	{
		r2 = add(r0,sub(#1,r16))
		r1:0 = combine(r16,r17)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3 = asr(r2,#31)
	}
	{
		r1:0 = combine(r16,r17)
		jump .LBB104_6
	}
.LBB104_4:                              // %if.then.i
	{
		r1 = add(pc,##.L.str.7.92@PCREL)
		r0 = r17
	}
.LBB104_6:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
	}
	{
		call ##free
		r0 = r16
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
.Lfunc_end104:
	.size	halide_error_bad_fold, .Lfunc_end104-halide_error_bad_fold
                                        // -- End function
	.section	.text.halide_error_bad_extern_fold,"ax",@progbits
	.weak	halide_error_bad_extern_fold    // -- Begin function halide_error_bad_extern_fold
	.p2align	4
	.type	halide_error_bad_extern_fold,@function
halide_error_bad_extern_fold:           // @halide_error_bad_extern_fold
// %bb.0:                               // %entry
	{
		p0 = cmp.gt(r5,r3)
		r16 = r0
		memd(r29+#-16) = r17:16
		allocframe(#64)
	}                                       // 8-byte Folded Spill
	{
		r20 = r3
		r19 = r1
		memd(r29+#48) = r19:18
		memd(r29+#40) = r21:20
	}                                       // 8-byte Folded Spill
	{
		r23:22 = combine(r4,r5)
		r26 = r2
		memd(r29+#32) = r23:22
		memd(r29+#16) = r27:26
	}                                       // 8-byte Folded Spill
	{
		if (p0) jump:nt .LBB105_2
		r18 = memw(r29+#72)
		memd(r29+#24) = r25:24
	}
// %bb.1:                               // %lor.lhs.false
	{
		r24 = add(r23,r20)
	}
	{
		r0 = add(r18,r22)
		if (!cmp.gt(r24,r0.new)) jump:t .LBB105_8
	}
.LBB105_2:                              // %if.then
	{
		call ##malloc
		r0 = #1024
	}
	{
		r17 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB105_3
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.4:                               // %if.then6.i
	{
		r2 = add(pc,##.L.str.53@PCREL)
		r24 = add(r17,#1023)
		r3 = #0
	}
	{
		r1:0 = combine(r24,r17)
		jump .LBB105_5
		memb(r17+#1023) = r3
	}
.LBB105_3:                              // %if.then.split
	{
		r2 = add(pc,##.L.str.53@PCREL)
		r1:0 = combine(#0,#0)
		r24 = #0
	}
.LBB105_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
		r27 = asr(r26,#31)
	}
	{
		r1 = r24
		r4 = #1
		r3:2 = combine(r27,r26)
	}
	{
		call ##halide_int64_to_string
	}
	{
		r2 = add(pc,##.L.str.51@PCREL)
		r1 = r24
	}
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r24
		r2 = r19
	}
	{
		r2 = add(pc,##.L.str.54@PCREL)
		r1 = r24
	}
	{
		call ##halide_string_to_string
		r21 = asr(r20,#31)
	}
	{
		r1 = r24
		r4 = #1
		r3:2 = combine(r21,r20)
	}
	{
		r19 = add(pc,##.L.str.55@PCREL)
		call ##halide_int64_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r24
		r2 = r19
	}
	{
		r2 = add(r23,add(r20,#-1))
		r1 = r24
		r4 = #1
	}
	{
		call ##halide_int64_to_string
		r3 = asr(r2,#31)
	}
	{
		r2 = add(pc,##.L.str.56@PCREL)
		r1 = r24
	}
	{
		call ##halide_string_to_string
	}
	{
		r2 = add(pc,##.L.str.57@PCREL)
		r1 = r24
	}
	{
		call ##halide_string_to_string
		r23 = asr(r22,#31)
	}
	{
		r1 = r24
		r4 = #1
		r3:2 = combine(r23,r22)
	}
	{
		call ##halide_int64_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r24
		r2 = r19
	}
	{
		r2 = add(r18,add(r22,#-1))
		r1 = r24
		r4 = #1
	}
	{
		call ##halide_int64_to_string
		r3 = asr(r2,#31)
	}
	{
		r2 = add(pc,##.L.str.58.74@PCREL)
		r1 = r24
	}
	{
		call ##halide_string_to_string
	}
	{
		r1 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r1
		if (p0.new) jump:nt .LBB105_7
	}
.LBB105_12:                             // %if.else.i168
	{
		r2 = add(r0,sub(#1,r17))
		r1:0 = combine(r17,r16)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3 = asr(r2,#31)
	}
	{
		call ##halide_error
		r1:0 = combine(r17,r16)
	}
	{
		jump .LBB105_13
	}
.LBB105_8:                              // %if.else
	{
		call ##malloc
		r0 = #1024
	}
	{
		r17 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB105_9
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.10:                              // %if.then6.i107
	{
		r2 = add(pc,##.L.str.53@PCREL)
		r22 = add(r17,#1023)
		r3 = #0
	}
	{
		r1:0 = combine(r22,r17)
		jump .LBB105_11
		memb(r17+#1023) = r3
	}
.LBB105_9:                              // %if.else.split
	{
		r2 = add(pc,##.L.str.53@PCREL)
		r22 = #0
		r1:0 = combine(#0,#0)
	}
.LBB105_11:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit110
	{
		call ##halide_string_to_string
		r27 = asr(r26,#31)
	}
	{
		r3:2 = combine(r27,r26)
		r4 = #1
		r1 = r22
	}
	{
		call ##halide_int64_to_string
	}
	{
		r2 = add(pc,##.L.str.51@PCREL)
		r1 = r22
	}
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r22
		r2 = r19
	}
	{
		r2 = add(pc,##.L.str.54@PCREL)
		r1 = r22
	}
	{
		call ##halide_string_to_string
		r21 = asr(r20,#31)
	}
	{
		r3:2 = combine(r21,r20)
		r4 = #1
		r1 = r22
	}
	{
		call ##halide_int64_to_string
	}
	{
		r2 = add(pc,##.L.str.55@PCREL)
		r1 = r22
	}
	{
		call ##halide_string_to_string
	}
	{
		r2 = add(r24,#-1)
		r4 = #1
		r1 = r22
	}
	{
		call ##halide_int64_to_string
		r3 = asr(r2,#31)
	}
	{
		r2 = add(pc,##.L.str.56@PCREL)
		r1 = r22
	}
	{
		call ##halide_string_to_string
	}
	{
		r2 = add(pc,##.L.str.59.75@PCREL)
		r1 = r22
	}
	{
		call ##halide_string_to_string
	}
	{
		r2 = add(pc,##.L.str.60.76@PCREL)
		r1 = r22
	}
	{
		call ##halide_string_to_string
		r19 = asr(r18,#31)
	}
	{
		r3:2 = combine(r19,r18)
		r4 = #1
		r1 = r22
	}
	{
		call ##halide_int64_to_string
	}
	{
		r2 = add(pc,##.L.str.30.66@PCREL)
		r1 = r22
	}
	{
		call ##halide_string_to_string
	}
	{
		r1 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r1
		if (!p0.new) jump:t .LBB105_12
	}
.LBB105_7:                              // %if.then.i
	{
		r1 = add(pc,##.L.str.7.92@PCREL)
		r0 = r16
	}
	{
		call ##halide_error
		r17 = #0
	}
.LBB105_13:                             // %if.end
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
.Lfunc_end105:
	.size	halide_error_bad_extern_fold, .Lfunc_end105-halide_error_bad_extern_fold
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
		r19:18 = combine(r4,r5)
		r21 = r1
		memd(r29+#40) = r19:18
		memd(r29+#32) = r21:20
	}                                       // 8-byte Folded Spill
	{
		r24 = r3
		r22 = r2
		memd(r29+#24) = r23:22
		memd(r29+#16) = r25:24
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
	}
	{
		r17 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB106_1
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.2:                               // %if.then6.i
	{
		r2 = add(pc,##.L.str.61.77@PCREL)
		r20 = add(r17,#1023)
		r3 = #0
	}
	{
		r1:0 = combine(r20,r17)
		jump .LBB106_3
		memb(r17+#1023) = r3
	}
.LBB106_1:                              // %entry.split
	{
		r2 = add(pc,##.L.str.61.77@PCREL)
		r20 = #0
		r1:0 = combine(#0,#0)
	}
.LBB106_3:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
		r25 = asr(r24,#31)
	}
	{
		r3:2 = combine(r25,r24)
		r4 = #1
		r1 = r20
	}
	{
		call ##halide_int64_to_string
	}
	{
		r2 = add(pc,##.L.str.62@PCREL)
		r1 = r20
	}
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r20
		r2 = r22
	}
	{
		r2 = add(pc,##.L.str.51@PCREL)
		r1 = r20
	}
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r20
		r2 = r21
	}
	{
		r2 = add(pc,##.L.str.63@PCREL)
		r1 = r20
	}
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r20
		r2 = r19
	}
	{
		r2 = add(pc,##.L.str.32.68@PCREL)
		r1 = r20
	}
	{
		call ##halide_string_to_string
		r19 = asr(r18,#31)
	}
	{
		r3:2 = combine(r19,r18)
		r4 = #1
		r1 = r20
	}
	{
		call ##halide_int64_to_string
	}
	{
		r2 = add(pc,##.L.str.64.78@PCREL)
		r1 = r20
	}
	{
		call ##halide_string_to_string
	}
	{
		r1 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r1
		if (p0.new) jump:nt .LBB106_4
	}
// %bb.5:                               // %if.else.i
	{
		r2 = add(r0,sub(#1,r17))
		r1:0 = combine(r17,r16)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3 = asr(r2,#31)
	}
	{
		r1:0 = combine(r17,r16)
		jump .LBB106_6
	}
.LBB106_4:                              // %if.then.i
	{
		r1 = add(pc,##.L.str.7.92@PCREL)
		r0 = r16
	}
.LBB106_6:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
	}
	{
		call ##free
		r0 = r17
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
.Lfunc_end106:
	.size	halide_error_fold_factor_too_small, .Lfunc_end106-halide_error_fold_factor_too_small
                                        // -- End function
	.section	.text.halide_error_requirement_failed,"ax",@progbits
	.weak	halide_error_requirement_failed // -- Begin function halide_error_requirement_failed
	.p2align	4
	.type	halide_error_requirement_failed,@function
halide_error_requirement_failed:        // @halide_error_requirement_failed
// %bb.0:                               // %entry
	{
		r17 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#40)
	}                                       // 8-byte Folded Spill
	{
		r19:18 = combine(r1,r2)
		memd(r29+#24) = r19:18
		memd(r29+#16) = r21:20
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
	}
	{
		r16 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB107_1
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.2:                               // %if.then6.i
	{
		r2 = add(pc,##.L.str.65@PCREL)
		r20 = add(r16,#1023)
		r3 = #0
	}
	{
		r1:0 = combine(r20,r16)
		jump .LBB107_3
		memb(r16+#1023) = r3
	}
.LBB107_1:                              // %entry.split
	{
		r2 = add(pc,##.L.str.65@PCREL)
		r20 = #0
		r1:0 = combine(#0,#0)
	}
.LBB107_3:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
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
		r2 = r18
	}
	{
		r1 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r1
		if (p0.new) jump:nt .LBB107_4
	}
// %bb.5:                               // %if.else.i
	{
		r2 = add(r0,sub(#1,r16))
		r1:0 = combine(r16,r17)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3 = asr(r2,#31)
	}
	{
		r1:0 = combine(r16,r17)
		jump .LBB107_6
	}
.LBB107_4:                              // %if.then.i
	{
		r1 = add(pc,##.L.str.7.92@PCREL)
		r0 = r17
	}
.LBB107_6:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
	}
	{
		call ##free
		r0 = r16
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
.Lfunc_end107:
	.size	halide_error_requirement_failed, .Lfunc_end107-halide_error_requirement_failed
                                        // -- End function
	.section	.text.halide_error_specialize_fail,"ax",@progbits
	.weak	halide_error_specialize_fail    // -- Begin function halide_error_specialize_fail
	.p2align	4
	.type	halide_error_specialize_fail,@function
halide_error_specialize_fail:           // @halide_error_specialize_fail
// %bb.0:                               // %entry
	{
		r17 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#16)
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
		r18 = r1
		memd(r29+#0) = r19:18
	}                                       // 8-byte Folded Spill
	{
		r16 = r0
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB108_1
	}
// %bb.2:                               // %if.else.i
	{
		r2 = add(pc,##.L.str.67@PCREL)
		r19 = add(r16,#1023)
		r3 = #0
	}
	{
		call ##halide_string_to_string
		r1:0 = combine(r19,r16)
		memb(r16+#1023) = r3
	}
	{
		call ##halide_string_to_string
		r1 = r19
		r2 = r18
	}
	{
		r2 = add(r0,sub(#1,r16))
		r1:0 = combine(r16,r17)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3 = asr(r2,#31)
	}
	{
		r1:0 = combine(r16,r17)
		jump .LBB108_3
	}
.LBB108_1:                              // %if.then.i
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
		r2 = r18
	}
	{
		r1 = add(pc,##.L.str.7.92@PCREL)
		r0 = r17
	}
.LBB108_3:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
	}
	{
		call ##free
		r0 = r16
	}
	{
		r0 = #-31
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end108:
	.size	halide_error_specialize_fail, .Lfunc_end108-halide_error_specialize_fail
                                        // -- End function
	.section	.text.halide_error_no_device_interface,"ax",@progbits
	.weak	halide_error_no_device_interface // -- Begin function halide_error_no_device_interface
	.p2align	4
	.type	halide_error_no_device_interface,@function
halide_error_no_device_interface:       // @halide_error_no_device_interface
// %bb.0:                               // %entry
	{
		r17 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#8)
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
	}
	{
		r16 = r0
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB109_1
	}
// %bb.2:                               // %if.else.i
	{
		r2 = add(pc,##.L.str.68@PCREL)
		r1 = add(r16,#1023)
		r0 = r16
	}
	{
		call ##halide_string_to_string
		r3 = #0
		memb(r16+#1023) = r3.new
	}
	{
		r2 = add(r0,sub(#1,r16))
		r1:0 = combine(r16,r17)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3 = asr(r2,#31)
	}
	{
		r1:0 = combine(r16,r17)
		jump .LBB109_3
	}
.LBB109_1:                              // %if.then.i
	{
		r2 = add(pc,##.L.str.68@PCREL)
		r1:0 = combine(#0,#0)
	}
	{
		call ##halide_string_to_string
	}
	{
		r1 = add(pc,##.L.str.7.92@PCREL)
		r0 = r17
	}
.LBB109_3:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
	}
	{
		call ##free
		r0 = r16
	}
	{
		r0 = #-19
		r17:16 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end109:
	.size	halide_error_no_device_interface, .Lfunc_end109-halide_error_no_device_interface
                                        // -- End function
	.section	.text.halide_error_device_interface_no_device,"ax",@progbits
	.weak	halide_error_device_interface_no_device // -- Begin function halide_error_device_interface_no_device
	.p2align	4
	.type	halide_error_device_interface_no_device,@function
halide_error_device_interface_no_device: // @halide_error_device_interface_no_device
// %bb.0:                               // %entry
	{
		r17 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#8)
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
	}
	{
		r16 = r0
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB110_1
	}
// %bb.2:                               // %if.else.i
	{
		r2 = add(pc,##.L.str.69@PCREL)
		r1 = add(r16,#1023)
		r0 = r16
	}
	{
		call ##halide_string_to_string
		r3 = #0
		memb(r16+#1023) = r3.new
	}
	{
		r2 = add(r0,sub(#1,r16))
		r1:0 = combine(r16,r17)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3 = asr(r2,#31)
	}
	{
		r1:0 = combine(r16,r17)
		jump .LBB110_3
	}
.LBB110_1:                              // %if.then.i
	{
		r2 = add(pc,##.L.str.69@PCREL)
		r1:0 = combine(#0,#0)
	}
	{
		call ##halide_string_to_string
	}
	{
		r1 = add(pc,##.L.str.7.92@PCREL)
		r0 = r17
	}
.LBB110_3:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
	}
	{
		call ##free
		r0 = r16
	}
	{
		r0 = #-36
		r17:16 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end110:
	.size	halide_error_device_interface_no_device, .Lfunc_end110-halide_error_device_interface_no_device
                                        // -- End function
	.section	.text.halide_error_host_and_device_dirty,"ax",@progbits
	.weak	halide_error_host_and_device_dirty // -- Begin function halide_error_host_and_device_dirty
	.p2align	4
	.type	halide_error_host_and_device_dirty,@function
halide_error_host_and_device_dirty:     // @halide_error_host_and_device_dirty
// %bb.0:                               // %entry
	{
		r17 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#8)
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
	}
	{
		r16 = r0
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB111_1
	}
// %bb.2:                               // %if.else.i
	{
		r2 = add(pc,##.L.str.70@PCREL)
		r1 = add(r16,#1023)
		r0 = r16
	}
	{
		call ##halide_string_to_string
		r3 = #0
		memb(r16+#1023) = r3.new
	}
	{
		r2 = add(r0,sub(#1,r16))
		r1:0 = combine(r16,r17)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3 = asr(r2,#31)
	}
	{
		r1:0 = combine(r16,r17)
		jump .LBB111_3
	}
.LBB111_1:                              // %if.then.i
	{
		r2 = add(pc,##.L.str.70@PCREL)
		r1:0 = combine(#0,#0)
	}
	{
		call ##halide_string_to_string
	}
	{
		r1 = add(pc,##.L.str.7.92@PCREL)
		r0 = r17
	}
.LBB111_3:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
	}
	{
		call ##free
		r0 = r16
	}
	{
		r0 = #-37
		r17:16 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end111:
	.size	halide_error_host_and_device_dirty, .Lfunc_end111-halide_error_host_and_device_dirty
                                        // -- End function
	.section	.text.halide_error_buffer_is_null,"ax",@progbits
	.weak	halide_error_buffer_is_null     // -- Begin function halide_error_buffer_is_null
	.p2align	4
	.type	halide_error_buffer_is_null,@function
halide_error_buffer_is_null:            // @halide_error_buffer_is_null
// %bb.0:                               // %entry
	{
		r17 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#32)
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
		r18 = r1
		memd(r29+#16) = r19:18
	}                                       // 8-byte Folded Spill
	{
		r16 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB112_1
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.2:                               // %if.then6.i
	{
		r2 = add(pc,##.L.str.71@PCREL)
		r19 = add(r16,#1023)
		r3 = #0
	}
	{
		r1:0 = combine(r19,r16)
		jump .LBB112_3
		memb(r16+#1023) = r3
	}
.LBB112_1:                              // %entry.split
	{
		r2 = add(pc,##.L.str.71@PCREL)
		r19 = #0
		r1:0 = combine(#0,#0)
	}
.LBB112_3:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r19
		r2 = r18
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
		if (p0.new) jump:nt .LBB112_4
	}
// %bb.5:                               // %if.else.i
	{
		r2 = add(r0,sub(#1,r16))
		r1:0 = combine(r16,r17)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3 = asr(r2,#31)
	}
	{
		r1:0 = combine(r16,r17)
		jump .LBB112_6
	}
.LBB112_4:                              // %if.then.i
	{
		r1 = add(pc,##.L.str.7.92@PCREL)
		r0 = r17
	}
.LBB112_6:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
	}
	{
		call ##free
		r0 = r16
	}
	{
		r0 = #-38
		r17:16 = memd(r29+#24)
		r19:18 = memd(r29+#16)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end112:
	.size	halide_error_buffer_is_null, .Lfunc_end112-halide_error_buffer_is_null
                                        // -- End function
	.section	.text.halide_error_storage_bound_too_small,"ax",@progbits
	.weak	halide_error_storage_bound_too_small // -- Begin function halide_error_storage_bound_too_small
	.p2align	4
	.type	halide_error_storage_bound_too_small,@function
halide_error_storage_bound_too_small:   // @halide_error_storage_bound_too_small
// %bb.0:                               // %entry
	{
		r17 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#48)
	}                                       // 8-byte Folded Spill
	{
		r19:18 = combine(r1,r4)
		r21 = r2
		memd(r29+#32) = r19:18
		memd(r29+#24) = r21:20
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
		r22 = r3
		memd(r29+#16) = r23:22
	}                                       // 8-byte Folded Spill
	{
		r16 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r0 = p0
		if (p0) jump:nt .LBB113_1
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.2:                               // %if.then6.i
	{
		r2 = add(pc,##.L.str.73@PCREL)
		r20 = add(r16,#1023)
		r3 = #0
	}
	{
		r1:0 = combine(r20,r16)
		jump .LBB113_3
		memb(r16+#1023) = r3
	}
.LBB113_1:                              // %entry.split
	{
		r2 = add(pc,##.L.str.73@PCREL)
		r20 = #0
		r1:0 = combine(#0,#0)
	}
.LBB113_3:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
	{
		call ##halide_string_to_string
		r23 = asr(r22,#31)
	}
	{
		r3:2 = combine(r23,r22)
		r4 = #1
		r1 = r20
	}
	{
		call ##halide_int64_to_string
	}
	{
		r2 = add(pc,##.L.str.62@PCREL)
		r1 = r20
	}
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r20
		r2 = r21
	}
	{
		r2 = add(pc,##.L.str.51@PCREL)
		r1 = r20
	}
	{
		call ##halide_string_to_string
	}
	{
		call ##halide_string_to_string
		r1 = r20
		r2 = r19
	}
	{
		r2 = add(pc,##.L.str.74@PCREL)
		r1 = r20
	}
	{
		call ##halide_string_to_string
		r19 = asr(r18,#31)
	}
	{
		r3:2 = combine(r19,r18)
		r4 = #1
		r1 = r20
	}
	{
		call ##halide_int64_to_string
	}
	{
		r2 = add(pc,##.L.str.64.78@PCREL)
		r1 = r20
	}
	{
		call ##halide_string_to_string
	}
	{
		r1 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r1
		if (p0.new) jump:nt .LBB113_4
	}
// %bb.5:                               // %if.else.i
	{
		r2 = add(r0,sub(#1,r16))
		r1:0 = combine(r16,r17)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3 = asr(r2,#31)
	}
	{
		r1:0 = combine(r16,r17)
		jump .LBB113_6
	}
.LBB113_4:                              // %if.then.i
	{
		r1 = add(pc,##.L.str.7.92@PCREL)
		r0 = r17
	}
.LBB113_6:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
	}
	{
		call ##free
		r0 = r16
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
.Lfunc_end113:
	.size	halide_error_storage_bound_too_small, .Lfunc_end113-halide_error_storage_bound_too_small
                                        // -- End function
	.section	.text.halide_error_device_crop_failed,"ax",@progbits
	.weak	halide_error_device_crop_failed // -- Begin function halide_error_device_crop_failed
	.p2align	4
	.type	halide_error_device_crop_failed,@function
halide_error_device_crop_failed:        // @halide_error_device_crop_failed
// %bb.0:                               // %entry
	{
		r17 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#8)
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
	}
	{
		r16 = r0
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB114_1
	}
// %bb.2:                               // %if.else.i
	{
		r2 = add(pc,##.L.str.75@PCREL)
		r1 = add(r16,#1023)
		r0 = r16
	}
	{
		call ##halide_string_to_string
		r3 = #0
		memb(r16+#1023) = r3.new
	}
	{
		r2 = add(r0,sub(#1,r16))
		r1:0 = combine(r16,r17)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3 = asr(r2,#31)
	}
	{
		r1:0 = combine(r16,r17)
		jump .LBB114_3
	}
.LBB114_1:                              // %if.then.i
	{
		r2 = add(pc,##.L.str.75@PCREL)
		r1:0 = combine(#0,#0)
	}
	{
		call ##halide_string_to_string
	}
	{
		r1 = add(pc,##.L.str.7.92@PCREL)
		r0 = r17
	}
.LBB114_3:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
	}
	{
		call ##free
		r0 = r16
	}
	{
		r0 = #-41
		r17:16 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end114:
	.size	halide_error_device_crop_failed, .Lfunc_end114-halide_error_device_crop_failed
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
.Lfunc_end115:
	.size	halide_msan_annotate_memory_is_initialized, .Lfunc_end115-halide_msan_annotate_memory_is_initialized
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
.Lfunc_end116:
	.size	halide_msan_check_memory_is_initialized, .Lfunc_end116-halide_msan_check_memory_is_initialized
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
.Lfunc_end117:
	.size	halide_msan_check_buffer_is_initialized, .Lfunc_end117-halide_msan_check_buffer_is_initialized
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
.Lfunc_end118:
	.size	halide_msan_annotate_buffer_is_initialized, .Lfunc_end118-halide_msan_annotate_buffer_is_initialized
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
.Lfunc_end119:
	.size	halide_msan_annotate_buffer_is_initialized_as_destructor, .Lfunc_end119-halide_msan_annotate_buffer_is_initialized_as_destructor
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
		allocframe(#8)
	}                                       // 8-byte Folded Spill
	{
		call ##qurt_hvx_lock
	}
	{
		p0 = cmp.eq(r0,#0)
		if (p0.new) r0 = #0
		if (p0.new) r17:16 = memd(r29+#0)
		if (p0.new) r31:30 = dealloc_return(r30):t:raw
	}                                       // 8-byte Folded Reload
.LBB120_1:                              // %if.then
	{
		call ##malloc
		r0 = #1024
	}
	{
		r17 = r0
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB120_2
	}
// %bb.3:                               // %if.else.i
	{
		r2 = add(pc,##.L.str.4.91@PCREL)
		r1 = add(r17,#1023)
		r0 = r17
	}
	{
		call ##halide_string_to_string
		r3 = #0
		memb(r17+#1023) = r3.new
	}
	{
		r2 = add(r0,sub(#1,r17))
		r1:0 = combine(r17,r16)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3 = asr(r2,#31)
	}
	{
		r1:0 = combine(r17,r16)
		jump .LBB120_4
	}
.LBB120_2:                              // %if.then.i
	{
		r2 = add(pc,##.L.str.4.91@PCREL)
		r1:0 = combine(#0,#0)
	}
	{
		call ##halide_string_to_string
	}
	{
		r1 = add(pc,##.L.str.7.92@PCREL)
		r0 = r16
	}
.LBB120_4:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
	}
	{
		call ##free
		r0 = r17
	}
	{
		r0 = #-1
		r17:16 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end120:
	.size	halide_qurt_hvx_lock, .Lfunc_end120-halide_qurt_hvx_lock
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
		allocframe(#8)
	}                                       // 8-byte Folded Spill
	{
		call ##qurt_hvx_unlock
	}
	{
		p0 = cmp.eq(r0,#0)
		if (p0.new) r0 = #0
		if (p0.new) r17:16 = memd(r29+#0)
		if (p0.new) r31:30 = dealloc_return(r30):t:raw
	}                                       // 8-byte Folded Reload
.LBB121_1:                              // %if.then
	{
		call ##malloc
		r0 = #1024
	}
	{
		r17 = r0
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB121_2
	}
// %bb.3:                               // %if.else.i
	{
		r2 = add(pc,##.L.str.6.93@PCREL)
		r1 = add(r17,#1023)
		r0 = r17
	}
	{
		call ##halide_string_to_string
		r3 = #0
		memb(r17+#1023) = r3.new
	}
	{
		r2 = add(r0,sub(#1,r17))
		r1:0 = combine(r17,r16)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3 = asr(r2,#31)
	}
	{
		r1:0 = combine(r17,r16)
		jump .LBB121_4
	}
.LBB121_2:                              // %if.then.i
	{
		r2 = add(pc,##.L.str.6.93@PCREL)
		r1:0 = combine(#0,#0)
	}
	{
		call ##halide_string_to_string
	}
	{
		r1 = add(pc,##.L.str.7.92@PCREL)
		r0 = r16
	}
.LBB121_4:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit
	{
		call ##halide_error
	}
	{
		call ##free
		r0 = r17
	}
	{
		r0 = #-1
		r17:16 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end121:
	.size	halide_qurt_hvx_unlock, .Lfunc_end121-halide_qurt_hvx_unlock
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
.Lfunc_end122:
	.size	halide_qurt_hvx_unlock_as_destructor, .Lfunc_end122-halide_qurt_hvx_unlock_as_destructor
                                        // -- End function
	.section	.text.halide_vtcm_malloc,"ax",@progbits
	.weak	halide_vtcm_malloc              // -- Begin function halide_vtcm_malloc
	.p2align	4
	.type	halide_vtcm_malloc,@function
halide_vtcm_malloc:                     // @halide_vtcm_malloc
// %bb.0:                               // %entry
	{
		r0 = r1 ; jump ##HAP_request_VTCM
		r1 = #1
	}
.Lfunc_end123:
	.size	halide_vtcm_malloc, .Lfunc_end123-halide_vtcm_malloc
                                        // -- End function
	.section	.text.halide_vtcm_free,"ax",@progbits
	.weak	halide_vtcm_free                // -- Begin function halide_vtcm_free
	.p2align	4
	.type	halide_vtcm_free,@function
halide_vtcm_free:                       // @halide_vtcm_free
// %bb.0:                               // %entry
	{
		r0 = r1 ; jump ##HAP_release_VTCM
	}
.Lfunc_end124:
	.size	halide_vtcm_free, .Lfunc_end124-halide_vtcm_free
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
		if (cmp.eq(r0.new,#0)) jump:nt .LBB125_1
	}
// %bb.2:                               // %if.end
	{
		call ##halide_mutex_unlock
		r0 = memw(r19+##_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE@GOT)
	}
	{
		p0 = cmp.eq(r17,#2); if (p0.new) jump:t .LBB125_4
	}
.LBB125_3:                              // %if.then1
	{
		r1 = add(pc,##.L.str.94@PCREL)
		r0 = #0
	}
	{
		call ##halide_error
	}
.LBB125_4:                              // %if.end2
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
		if (p0.new) jump:nt .LBB125_6
	}
// %bb.5:                               // %if.then6
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
.LBB125_6:                              // %for.inc.critedge
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
		if (p0.new) jump:nt .LBB125_8
	}
// %bb.7:                               // %if.then6.1
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
.LBB125_1:                              // %if.then
	{
		call ##_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv
		r0 = add(r29,#0)
	}
	{
		r2 = #32
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
		r0 = memw(r19+##_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE@GOT)

	} :mem_noshuf
	{
		call ##halide_mutex_unlock
	}
	{
		p0 = cmp.eq(r17,#2); if (!p0.new) jump:t .LBB125_3
	}
	{
		jump .LBB125_4
	}
.LBB125_8:                              // %for.inc.critedge.1
	{
		r0 = #1
		r17:16 = memd(r29+#40)
		r19:18 = memd(r29+#32)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end125:
	.size	halide_default_can_use_target_features, .Lfunc_end125-halide_default_can_use_target_features
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

	} :mem_noshuf
	{
		r0 = r1
		jumpr r31
	}
.Lfunc_end126:
	.size	halide_set_custom_can_use_target_features, .Lfunc_end126-halide_set_custom_can_use_target_features
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
.Lfunc_end127:
	.size	halide_can_use_target_features, .Lfunc_end127-halide_can_use_target_features
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
.Lfunc_end128:
	.size	_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv, .Lfunc_end128-_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv
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
.Lfunc_end129:
	.size	halide_use_jit_module, .Lfunc_end129-halide_use_jit_module
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
.Lfunc_end130:
	.size	halide_release_jit_module, .Lfunc_end130-halide_release_jit_module
                                        // -- End function
	.section	.text.matmul_hvx_hvx128,"ax",@progbits
	.globl	matmul_hvx_hvx128               // -- Begin function matmul_hvx_hvx128
	.p2align	4
	.type	matmul_hvx_hvx128,@function
matmul_hvx_hvx128:                      // @matmul_hvx_hvx128
// %bb.0:                               // %entry
	{
		r17:16 = combine(r2,r0)
		r0 = #0
		memd(r29+#-16) = r17:16
		allocframe(#48)
	}                                       // 8-byte Folded Spill
	{
		r19:18 = combine(#0,r1)
		memd(r29+#32) = r19:18
		memd(r29+#24) = r21:20
	}                                       // 8-byte Folded Spill
	{
		memd(r29+#16) = r23:22
		memd(r29+#8) = r25:24
	}                                       // 8-byte Folded Spill
	{
		call ##halide_qurt_hvx_lock
		memd(r29+#0) = r27:26
	}                                       // 8-byte Folded Spill
	{
		v1:0.w = vsub(v1:0.w,v1:0.w)
		r4 = memw(r16+#32)
		r3 = memw(r18+#32)
	}
	{
		r5 = memw(r17+#32)
		r1 = memw(r18+#12)
	}
	{
		r12 = memw(r4+#24)
		r13 = memw(r4+#16)
	}
	{
		r27 = asl(r12,#1)
		r7 = memw(r3+#16)
		r28 = memw(r4+#0)
	}
	{
		r14 = sub(#2,r7)
		r11 = sub(#1,r7)
		r8 = memw(r3+#24)
		r6 = memw(r3+#0)
	}
	{
		r28 += mpyi(r13,r12)
		r15 = asl(r6,#1)
		r9 = sub(#3,r7)
		r0 = memw(r16+#12)
	}
	{
		r10 = mpyi(r8,r9)
		r14 = mpyi(r8,r14)
		r13 = sub(#2,r28)
		r2 = memw(r17+#12)
	}
	{
		r11 = mpyi(r8,r11)
		r3 = asl(r8,#3)
		r9 = memw(r5+#0)
		r24 = memw(r5+#16)
	}
	{
		r6 += mpyi(r7,r8)
		r12 = asl(r10,#1)
		r8 = r1
		r26 = memw(r5+#24)
	}
	{
		r13 = addasl(r0,r13,#1)
		r14 = asl(r14,#1)
		r5 = #64
		r12 = sub(r12,r15)
	}
	{
		r0 -= asl(r28,#1)
		r23 = asl(r11,#1)
		r14 = sub(r14,r15)
	}
	{
		r8 -= asl(r6,#1)
		r15 = sub(r23,r15)
	}
	.p2align	4
.LBB131_1:                              // %"for res.s0.y"
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB131_2 Depth 2
                                        //       Child Loop BB131_3 Depth 3
	{
		r6 = sub(r19,r24)
		r28 = r15
		r11:10 = combine(r12,r14)
		r17:16 = combine(#0,r8)
	}
	{
		loop1(.LBB131_2,#16)
		r6 = mpyi(r6,r26)
	}
	{
		r18 = sub(r6,r9)
	}
	.p2align	4
.Ltmp19:                                // Block address taken
.LBB131_2:                              // %"for res.s0.x.x"
                                        //   Parent Loop BB131_1 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB131_3 Depth 3
	{
		r20 = asl(r17,#6)
		r21 = r0
		v3:2 = vcombine(v1,v0)
		v4 = v1
	}
	{
		loop0(.LBB131_3,#256)
		r23:22 = combine(r1,r13)
		r6 = r16
	}
	.p2align	4
.Ltmp20:                                // Block address taken
.LBB131_3:                              // %"for matrix_mul.s1.r8$x"
                                        //   Parent Loop BB131_1 Depth=1
                                        //     Parent Loop BB131_2 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	{
		r7 = add(r23,r28)
		v3 = v4
		r25 = memuh(r21++#8)
		v5 = vmem(r6+#0)
	}
	{
		v6.h = vsplat(r25)
		r4 = add(r23,r10)
		r25 = memuh(r22+#-2)
		v4 = vmem(r6+#1)
	}
	{
		v5.h = vsplat(r25)
		v4 = valign(v4,v5,r6)
		r25 = memuh(r22+#0)
		v7 = vmem(r7+#0)
	}
	{
		v6.h = vsplat(r25)
		v11:10.w = vunpack(v6.h)
		r25 = memuh(r22+#2)
		v8 = vmem(r7+#1)
	}
	{
		v8.h = vsplat(r25)
		r7 = add(r23,r11)
		v7 = valign(v8,v7,r7)
		v9 = vmem(r4+#0)
	}
	{
		r6 = add(r6,r3)
		r23 = add(r23,r3)
		v13:12.w = vunpack(v4.h)
		v11 = vmem(r4+#1)
	}
	{
		r22 = add(r22,#8)
		v4 = valign(v4,v4,r5)
		v13 = vmem(r7+#0)
	}
	{
		v14.w = vmpyieo(v12.h,v10.h)
		v9 = valign(v11,v9,r4)
		v11 = vmem(r7+#1)
	}
	{
		v14.w += vmpyie(v12.w,v10.uh)
		v19:18.w = vunpack(v4.h)
	}
	{
		v4 = valign(v11,v13,r7)
	}
	{
		v15.w = vmpyieo(v18.h,v10.h)
		v13:12.w = vunpack(v5.h)
	}
	{
		v15.w += vmpyie(v18.w,v10.uh)
		v5 = valign(v7,v7,r5)
	}
	{
		v17:16.w = vunpack(v7.h)
		v3:2.w = vadd(v3:2.w,v15:14.w):sat
	}
	{
		v7 = valign(v9,v9,r5)
	}
	{
		v10.w = vmpyieo(v16.h,v12.h)
		v21:20.w = vunpack(v5.h)
	}
	{
		v10.w += vmpyie(v16.w,v12.uh)
		v5 = valign(v4,v4,r5)
	}
	{
		v11.w = vmpyieo(v20.h,v12.h)
		v25:24.w = vunpack(v6.h)
	}
	{
		v11.w += vmpyie(v20.w,v12.uh)
		v23:22.w = vunpack(v7.h)
	}
	{
		v27:26.w = vunpack(v9.h)
		v3:2.w = vadd(v3:2.w,v11:10.w):sat
	}
	{
		v7.w = vmpyieo(v22.h,v24.h)
		v31:30.w = vunpack(v4.h)
	}
	{
		v6.w = vmpyieo(v26.h,v24.h)
		v29:28.w = vunpack(v8.h)
	}
	{
		v6.w += vmpyie(v26.w,v24.uh)
		v5:4.w = vunpack(v5.h)
	}
	{
		v12.w = vmpyieo(v30.h,v28.h)
	}
	{
		v13.w = vmpyieo(v4.h,v28.h)
	}
	{
		v7.w += vmpyie(v22.w,v24.uh)
	}
	{
		v12.w += vmpyie(v30.w,v28.uh)
		v3:2.w = vadd(v3:2.w,v7:6.w):sat
	}
	{
		v13.w += vmpyie(v4.w,v28.uh)
	}
	{
		v3:2.w = vadd(v3:2.w,v13:12.w):sat
	}
	{
		nop
		v4 = v3
	} :endloop0
// %bb.4:                               // %"consume matrix_mul"
                                        //   in Loop: Header=BB131_2 Depth=2
	{
		r4 = add(r18,r20)
		r17 = add(r17,#1)
		r11 = add(r11,#128)
		r10 = add(r10,#128)
	}
	{
		r4 = addasl(r2,r4,#2)
		r28 = add(r28,#128)
		r16 = add(r16,#128)
	}
	{
		vmemu(r4+#0) = v2
	}
	{
		nop
		nop
		vmemu(r4+#1) = v3
	} :endloop1
// %bb.5:                               // %"end for res.s0.x.x"
                                        //   in Loop: Header=BB131_1 Depth=1
	{
		r19 = add(r19,#1)
		r13 = add(r13,r27)
		r0 = add(r0,r27)
	}
	{
		p0 = cmp.eq(r19,##1024)
		if (!p0.new) jump:t .LBB131_1
	}
// %bb.6:                               // %call_destructor.exit
	{
		call ##halide_qurt_hvx_unlock_as_destructor
		r1:0 = combine(#1,#0)
	}
	{
		r0 = #0
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
.Lfunc_end131:
	.size	matmul_hvx_hvx128, .Lfunc_end131-matmul_hvx_hvx128
                                        // -- End function
	.section	.text.matmul_hvx_hvx128_argv,"ax",@progbits
	.globl	matmul_hvx_hvx128_argv          // -- Begin function matmul_hvx_hvx128_argv
	.p2align	4
	.type	matmul_hvx_hvx128_argv,@function
matmul_hvx_hvx128_argv:                 // @matmul_hvx_hvx128_argv
// %bb.0:                               // %entry
	{
		allocframe(r29,#0):raw
	}
	{
		r3 = memw(r0+#0)
		r2 = memw(r0+#8)
	}
	{
		call ##matmul_hvx_hvx128
		r0 = r3
		r1 = memw(r0+#4)
	}
	{
		r0 = #0
		dealloc_return
	}
.Lfunc_end132:
	.size	matmul_hvx_hvx128_argv, .Lfunc_end132-matmul_hvx_hvx128_argv
                                        // -- End function
	.section	.text.matmul_hvx_hvx128_metadata,"ax",@progbits
	.globl	matmul_hvx_hvx128_metadata      // -- Begin function matmul_hvx_hvx128_metadata
	.p2align	4
	.type	matmul_hvx_hvx128_metadata,@function
matmul_hvx_hvx128_metadata:             // @matmul_hvx_hvx128_metadata
// %bb.0:                               // %entry
	{
		r0 = add(pc,##.Lmatmul_hvx_hvx128_metadata_storage@PCREL)
		jumpr r31
	}
.Lfunc_end133:
	.size	matmul_hvx_hvx128_metadata, .Lfunc_end133-matmul_hvx_hvx128_metadata
                                        // -- End function
	.type	_ZN6Halide7Runtime8Internal11buf_is_usedE,@object // @_ZN6Halide7Runtime8Internal11buf_is_usedE
	.section	.bss,"aw",@nobits
	.weak	_ZN6Halide7Runtime8Internal11buf_is_usedE
	.p2align	2
_ZN6Halide7Runtime8Internal11buf_is_usedE:
	.space	40
	.size	_ZN6Halide7Runtime8Internal11buf_is_usedE, 40

	.type	_ZN6Halide7Runtime8Internal7mem_bufE,@object // @_ZN6Halide7Runtime8Internal7mem_bufE
	.weak	_ZN6Halide7Runtime8Internal7mem_bufE
	.p2align	2
_ZN6Halide7Runtime8Internal7mem_bufE:
	.space	40
	.size	_ZN6Halide7Runtime8Internal7mem_bufE, 40

	.type	_ZN6Halide7Runtime8Internal13custom_mallocE,@object // @_ZN6Halide7Runtime8Internal13custom_mallocE
	.data
	.weak	_ZN6Halide7Runtime8Internal13custom_mallocE
	.p2align	2
_ZN6Halide7Runtime8Internal13custom_mallocE:
	.word	halide_default_malloc
	.size	_ZN6Halide7Runtime8Internal13custom_mallocE, 4

	.type	_ZN6Halide7Runtime8Internal11custom_freeE,@object // @_ZN6Halide7Runtime8Internal11custom_freeE
	.weak	_ZN6Halide7Runtime8Internal11custom_freeE
	.p2align	2
_ZN6Halide7Runtime8Internal11custom_freeE:
	.word	halide_default_free
	.size	_ZN6Halide7Runtime8Internal11custom_freeE, 4

	.type	.L.str,@object                  // @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.string	"custom allocators not supported on Hexagon.\n"
	.size	.L.str, 45

	.section	.fini_array,"aw",@fini_array
	.p2align	2
	.word	_ZN6Halide7Runtime8Internal24halide_allocator_cleanupEv
	.type	_ZN6Halide7Runtime8Internal14custom_do_taskE,@object // @_ZN6Halide7Runtime8Internal14custom_do_taskE
	.data
	.weak	_ZN6Halide7Runtime8Internal14custom_do_taskE
	.p2align	2
_ZN6Halide7Runtime8Internal14custom_do_taskE:
	.word	halide_default_do_task
	.size	_ZN6Halide7Runtime8Internal14custom_do_taskE, 4

	.type	_ZN6Halide7Runtime8Internal19custom_do_loop_taskE,@object // @_ZN6Halide7Runtime8Internal19custom_do_loop_taskE
	.weak	_ZN6Halide7Runtime8Internal19custom_do_loop_taskE
	.p2align	2
_ZN6Halide7Runtime8Internal19custom_do_loop_taskE:
	.word	halide_default_do_loop_task
	.size	_ZN6Halide7Runtime8Internal19custom_do_loop_taskE, 4

	.type	_ZN6Halide7Runtime8Internal17custom_do_par_forE,@object // @_ZN6Halide7Runtime8Internal17custom_do_par_forE
	.weak	_ZN6Halide7Runtime8Internal17custom_do_par_forE
	.p2align	2
_ZN6Halide7Runtime8Internal17custom_do_par_forE:
	.word	halide_default_do_par_for
	.size	_ZN6Halide7Runtime8Internal17custom_do_par_forE, 4

	.type	_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE,@object // @_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE
	.weak	_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE
	.p2align	2
_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE:
	.word	halide_default_do_parallel_tasks
	.size	_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE, 4

	.type	.L.str.1,@object                // @.str.1
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.1:
	.string	"halide_default_do_parallel_tasks not implemented on this platform."
	.size	.L.str.1, 67

	.type	_ZN6Halide7Runtime8Internal21custom_semaphore_initE,@object // @_ZN6Halide7Runtime8Internal21custom_semaphore_initE
	.data
	.weak	_ZN6Halide7Runtime8Internal21custom_semaphore_initE
	.p2align	2
_ZN6Halide7Runtime8Internal21custom_semaphore_initE:
	.word	halide_default_semaphore_init
	.size	_ZN6Halide7Runtime8Internal21custom_semaphore_initE, 4

	.type	.L.str.1.2,@object              // @.str.1.2
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.1.2:
	.string	"halide_default_semaphore_init not implemented on this platform."
	.size	.L.str.1.2, 64

	.type	_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE,@object // @_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE
	.data
	.weak	_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE
	.p2align	2
_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE:
	.word	halide_default_semaphore_try_acquire
	.size	_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE, 4

	.type	.L.str.3,@object                // @.str.3
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.3:
	.string	"halide_default_semaphore_try_acquire not implemented on this platform."
	.size	.L.str.3, 71

	.type	_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE,@object // @_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE
	.data
	.weak	_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE
	.p2align	2
_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE:
	.word	halide_default_semaphore_release
	.size	_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE, 4

	.type	.L.str.2,@object                // @.str.2
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.2:
	.string	"halide_default_semaphore_release not implemented on this platform."
	.size	.L.str.2, 67

	.type	_ZN6Halide7Runtime8Internal23halide_fake_mutex_arrayE,@object // @_ZN6Halide7Runtime8Internal23halide_fake_mutex_arrayE
	.section	.bss,"aw",@nobits
	.weak	_ZN6Halide7Runtime8Internal23halide_fake_mutex_arrayE
	.p2align	2
_ZN6Halide7Runtime8Internal23halide_fake_mutex_arrayE:
	.space	4
	.size	_ZN6Halide7Runtime8Internal23halide_fake_mutex_arrayE, 4

	.type	.L.str.4,@object                // @.str.4
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.4:
	.string	"halide_spawn_thread not implemented on this platform."
	.size	.L.str.4, 54

	.type	.L.str.5,@object                // @.str.5
.L.str.5:
	.string	"halide_join_thread not implemented on this platform."
	.size	.L.str.5, 53

	.type	.L.str.6,@object                // @.str.6
.L.str.6:
	.string	"halide_set_num_threads: only supports a value of 1 on this platform."
	.size	.L.str.6, 69

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

	.type	.L.str.7,@object                // @.str.7
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.7:
	.string	"HL_GPU_DEVICE"
	.size	.L.str.7, 14

	.type	.L.str.8,@object                // @.str.8
.L.str.8:
	.string	"<nullptr>"
	.size	.L.str.8, 10

	.type	.L.str.1.9,@object              // @.str.1.9
.L.str.1.9:
	.string	"-nan"
	.size	.L.str.1.9, 5

	.type	.L.str.2.10,@object             // @.str.2.10
.L.str.2.10:
	.string	"nan"
	.size	.L.str.2.10, 4

	.type	.L.str.3.11,@object             // @.str.3.11
.L.str.3.11:
	.string	"-inf"
	.size	.L.str.3.11, 5

	.type	.L.str.4.12,@object             // @.str.4.12
.L.str.4.12:
	.string	"inf"
	.size	.L.str.4.12, 4

	.type	.L.str.5.13,@object             // @.str.5.13
.L.str.5.13:
	.string	"-0.000000e+00"
	.size	.L.str.5.13, 14

	.type	.L.str.6.14,@object             // @.str.6.14
.L.str.6.14:
	.string	"0.000000e+00"
	.size	.L.str.6.14, 13

	.type	.L.str.7.15,@object             // @.str.7.15
.L.str.7.15:
	.string	"-0.000000"
	.size	.L.str.7.15, 10

	.type	.L.str.8.16,@object             // @.str.8.16
.L.str.8.16:
	.string	"0.000000"
	.size	.L.str.8.16, 9

	.type	.L.str.9,@object                // @.str.9
.L.str.9:
	.string	"-"
	.size	.L.str.9, 2

	.type	.L.str.11,@object               // @.str.11
.L.str.11:
	.string	"e+"
	.size	.L.str.11, 3

	.type	.L.str.12,@object               // @.str.12
.L.str.12:
	.string	"e-"
	.size	.L.str.12, 3

	.type	.L.str.13,@object               // @.str.13
.L.str.13:
	.string	"0123456789abcdef"
	.size	.L.str.13, 17

	.type	.L.str.18,@object               // @.str.18
.L.str.18:
	.string	"bad_type_code"
	.size	.L.str.18, 14

	.type	.L.str.17,@object               // @.str.17
.L.str.17:
	.string	"handle"
	.size	.L.str.17, 7

	.type	.L.str.16,@object               // @.str.16
.L.str.16:
	.string	"float"
	.size	.L.str.16, 6

	.type	.L.str.15,@object               // @.str.15
.L.str.15:
	.string	"uint"
	.size	.L.str.15, 5

	.type	.L.str.14,@object               // @.str.14
.L.str.14:
	.string	"int"
	.size	.L.str.14, 4

	.type	.L.str.19,@object               // @.str.19
.L.str.19:
	.string	"x"
	.size	.L.str.19, 2

	.type	.L.str.20,@object               // @.str.20
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
	.p2align	2
_ZN6Halide7Runtime8Internal21allocation_pools_lockE:
	.space	4
	.size	_ZN6Halide7Runtime8Internal21allocation_pools_lockE, 4

	.type	_ZN6Halide7Runtime8Internal23device_allocation_poolsE,@object // @_ZN6Halide7Runtime8Internal23device_allocation_poolsE
	.weak	_ZN6Halide7Runtime8Internal23device_allocation_poolsE
	.p2align	2
_ZN6Halide7Runtime8Internal23device_allocation_poolsE:
	.word	0
	.size	_ZN6Halide7Runtime8Internal23device_allocation_poolsE, 4

	.type	_ZN6Halide7Runtime8Internal17device_copy_mutexE,@object // @_ZN6Halide7Runtime8Internal17device_copy_mutexE
	.weak	_ZN6Halide7Runtime8Internal17device_copy_mutexE
	.p2align	2
_ZN6Halide7Runtime8Internal17device_copy_mutexE:
	.space	4
	.size	_ZN6Halide7Runtime8Internal17device_copy_mutexE, 4

	.type	.L.str.6.17,@object             // @.str.6.17
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.6.17:
	.string	"halide_copy_to_host"
	.size	.L.str.6.17, 20

	.type	.L.str.7.18,@object             // @.str.7.18
.L.str.7.18:
	.string	"halide_copy_to_device"
	.size	.L.str.7.18, 22

	.type	.L.str.9.19,@object             // @.str.9.19
.L.str.9.19:
	.string	"halide_copy_to_device does not support switching interfaces\n"
	.size	.L.str.9.19, 61

	.type	.L.str.17.20,@object            // @.str.17.20
.L.str.17.20:
	.string	"halide_device_malloc"
	.size	.L.str.17.20, 21

	.type	.L.str.20.21,@object            // @.str.20.21
.L.str.20.21:
	.string	"halide_device_malloc doesn't support switching interfaces\n"
	.size	.L.str.20.21, 59

	.type	.L.str.16.22,@object            // @.str.16.22
.L.str.16.22:
	.string	"halide_device_sync"
	.size	.L.str.16.22, 19

	.type	.L.str.21.23,@object            // @.str.21.23
.L.str.21.23:
	.string	"halide_device_free"
	.size	.L.str.21.23, 19

	.type	.L.str.22.24,@object            // @.str.22.24
.L.str.22.24:
	.string	"/home/arnoor2/Racket/TensorSynth/Rosette-experiments/frontends/halide/src/runtime/device_interface.cpp:252 halide_abort_if_false() failed: buf->device == 0\n"
	.size	.L.str.22.24, 157

	.type	.L.str.23.25,@object            // @.str.23.25
.L.str.23.25:
	.string	"halide_device_and_host_malloc"
	.size	.L.str.23.25, 30

	.type	.L.str.25.26,@object            // @.str.25.26
.L.str.25.26:
	.string	"halide_device_and_host_malloc doesn't support switching interfaces\n"
	.size	.L.str.25.26, 68

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
	.string	"/home/arnoor2/Racket/TensorSynth/Rosette-experiments/frontends/halide/src/runtime/device_interface.cpp:317 halide_abort_if_false() failed: buf->device == 0\n"
	.size	.L.str.28, 157

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
	.string	"/home/arnoor2/Racket/TensorSynth/Rosette-experiments/frontends/halide/src/runtime/device_interface.cpp:403 halide_abort_if_false() failed: buf->device == 0\n"
	.size	.L.str.34, 157

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

	.type	.L.str.4.91,@object             // @.str.4.91
.L.str.4.91:
	.string	"qurt_hvx_lock failed\n"
	.size	.L.str.4.91, 22

	.type	.L.str.7.92,@object             // @.str.7.92
.L.str.7.92:
	.string	"Printer buffer allocation failed.\n"
	.size	.L.str.7.92, 35

	.type	.L.str.6.93,@object             // @.str.6.93
.L.str.6.93:
	.string	"qurt_hvx_unlock failed\n"
	.size	.L.str.6.93, 24

	.type	_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE,@object // @_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE
	.data
	.weak	_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE
	.p2align	2
_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE:
	.word	halide_default_can_use_target_features
	.size	_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE, 4

	.type	_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE,@object // @_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE
	.section	.bss,"aw",@nobits
	.weak	_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE
	.p2align	2
_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE:
	.space	4
	.size	_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE, 4

	.type	_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE,@object // @_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE
	.weak	_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE
_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE:
	.byte	0                               // 0x0
	.size	_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE, 1

	.type	_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE,@object // @_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE
	.weak	_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE
	.p2align	3
_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE:
	.space	32
	.size	_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE, 32

	.type	.L.str.94,@object               // @.str.94
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.94:
	.string	"Internal error: wrong structure size passed to halide_can_use_target_features()\n"
	.size	.L.str.94, 81

	.type	.L__unnamed_1,@object           // @0
	.section	.rodata,"a",@progbits
	.p2align	2
.L__unnamed_1:
	.space	16
	.size	.L__unnamed_1, 16

	.type	.Lstr,@object                   // @str
	.p2align	5
.Lstr:
	.string	"A"
	.size	.Lstr, 2

	.type	.L__unnamed_2,@object           // @1
	.p2align	2
.L__unnamed_2:
	.space	16
	.size	.L__unnamed_2, 16

	.type	.Lstr.102,@object               // @str.102
	.p2align	5
.Lstr.102:
	.string	"B"
	.size	.Lstr.102, 2

	.type	.L__unnamed_3,@object           // @2
	.p2align	3
.L__unnamed_3:
	.word	0                               // 0x0
	.word	0
	.size	.L__unnamed_3, 8

	.type	.L__unnamed_4,@object           // @3
	.p2align	3
.L__unnamed_4:
	.word	1024                            // 0x400
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
	.word	1024                            // 0x400
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

	.type	.Lstr.103,@object               // @str.103
	.section	.rodata,"a",@progbits
	.p2align	5
.Lstr.103:
	.string	"res"
	.size	.Lstr.103, 4

	.type	.L__unnamed_8,@object           // @7
	.section	.data.rel.ro,"aw",@progbits
	.p2align	4
.L__unnamed_8:
	.word	.Lstr
	.word	1                               // 0x1
	.word	2                               // 0x2
	.byte	0                               // 0x0
	.byte	16                              // 0x10
	.half	1                               // 0x1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	.L__unnamed_1
	.word	.Lstr.102
	.word	1                               // 0x1
	.word	2                               // 0x2
	.byte	0                               // 0x0
	.byte	16                              // 0x10
	.half	1                               // 0x1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	.L__unnamed_2
	.word	.Lstr.103
	.word	2                               // 0x2
	.word	2                               // 0x2
	.byte	0                               // 0x0
	.byte	32                              // 0x20
	.half	1                               // 0x1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	.L__unnamed_7
	.size	.L__unnamed_8, 108

	.type	.Lstr.104,@object               // @str.104
	.section	.rodata,"a",@progbits
	.p2align	7
.Lstr.104:
	.string	"hexagon-32-noos-hvx-hvx_128-hvx_v66-no_asserts-no_bounds_query"
	.size	.Lstr.104, 63

	.type	.Lstr.105,@object               // @str.105
	.p2align	5
.Lstr.105:
	.string	"matmul_hvx_hvx128"
	.size	.Lstr.105, 18

	.type	.Lmatmul_hvx_hvx128_metadata_storage,@object // @matmul_hvx_hvx128_metadata_storage
	.section	.data.rel.ro,"aw",@progbits
	.p2align	4
.Lmatmul_hvx_hvx128_metadata_storage:
	.word	1                               // 0x1
	.word	3                               // 0x3
	.word	.L__unnamed_8
	.word	.Lstr.104
	.word	.Lstr.105
	.size	.Lmatmul_hvx_hvx128_metadata_storage, 20

	.type	.Lswitch.table.halide_type_to_string,@object // @switch.table.halide_type_to_string
	.p2align	2
.Lswitch.table.halide_type_to_string:
	.word	.L.str.14
	.word	.L.str.15
	.word	.L.str.16
	.word	.L.str.17
	.size	.Lswitch.table.halide_type_to_string, 16

	.ident	"clang version 12.0.1 (https://github.com/llvm/llvm-project.git fed41342a82f5a3a9201819a82bf7a48313e296b)"
	.ident	"clang version 12.0.1 (https://github.com/llvm/llvm-project.git fed41342a82f5a3a9201819a82bf7a48313e296b)"
	.ident	"clang version 12.0.1 (https://github.com/llvm/llvm-project.git fed41342a82f5a3a9201819a82bf7a48313e296b)"
	.ident	"clang version 12.0.1 (https://github.com/llvm/llvm-project.git fed41342a82f5a3a9201819a82bf7a48313e296b)"
	.ident	"clang version 12.0.1 (https://github.com/llvm/llvm-project.git fed41342a82f5a3a9201819a82bf7a48313e296b)"
	.ident	"clang version 12.0.1 (https://github.com/llvm/llvm-project.git fed41342a82f5a3a9201819a82bf7a48313e296b)"
	.ident	"clang version 12.0.1 (https://github.com/llvm/llvm-project.git fed41342a82f5a3a9201819a82bf7a48313e296b)"
	.ident	"clang version 12.0.1 (https://github.com/llvm/llvm-project.git fed41342a82f5a3a9201819a82bf7a48313e296b)"
	.ident	"clang version 12.0.1 (https://github.com/llvm/llvm-project.git fed41342a82f5a3a9201819a82bf7a48313e296b)"
	.ident	"clang version 12.0.1 (https://github.com/llvm/llvm-project.git fed41342a82f5a3a9201819a82bf7a48313e296b)"
	.ident	"clang version 12.0.1 (https://github.com/llvm/llvm-project.git fed41342a82f5a3a9201819a82bf7a48313e296b)"
	.ident	"clang version 12.0.1 (https://github.com/llvm/llvm-project.git fed41342a82f5a3a9201819a82bf7a48313e296b)"
	.ident	"clang version 12.0.1 (https://github.com/llvm/llvm-project.git fed41342a82f5a3a9201819a82bf7a48313e296b)"
	.ident	"clang version 12.0.1 (https://github.com/llvm/llvm-project.git fed41342a82f5a3a9201819a82bf7a48313e296b)"
	.ident	"clang version 12.0.1 (https://github.com/llvm/llvm-project.git fed41342a82f5a3a9201819a82bf7a48313e296b)"
	.ident	"clang version 12.0.1 (https://github.com/llvm/llvm-project.git fed41342a82f5a3a9201819a82bf7a48313e296b)"
	.ident	"clang version 12.0.1 (https://github.com/llvm/llvm-project.git fed41342a82f5a3a9201819a82bf7a48313e296b)"
	.ident	"clang version 12.0.1 (https://github.com/llvm/llvm-project.git fed41342a82f5a3a9201819a82bf7a48313e296b)"
	.ident	"clang version 12.0.1 (https://github.com/llvm/llvm-project.git fed41342a82f5a3a9201819a82bf7a48313e296b)"
	.ident	"clang version 12.0.1 (https://github.com/llvm/llvm-project.git fed41342a82f5a3a9201819a82bf7a48313e296b)"
	.section	".note.GNU-stack","",@progbits
