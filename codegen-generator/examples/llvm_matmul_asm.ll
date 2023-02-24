	.text
	.file	"matmul.c"
	.globl	matmul                          // -- Begin function matmul
	.p2align	4
	.type	matmul,@function
matmul:                                 // @matmul
// %bb.0:
	{
		loop1(.LBB0_1,#32)
		memd(r29+#-16) = r17:16
		allocframe(r29,#392):raw
	}                                       // 8-byte Folded Spill
	{
		r1 = #0
		memw(r29+#4) = r1
		memd(r29+#376) = r19:18
	}                                       // 4-byte Folded Spill
	{
		memd(r29+#368) = r21:20
		memd(r29+#360) = r23:22
	}                                       // 8-byte Folded Spill
	{
		memd(r29+#352) = r25:24
		memd(r29+#344) = r27:26
	}                                       // 8-byte Folded Spill
	{
		memw(r29+#0) = r0
		memw(r29+#196) = r2
	}                                       // 4-byte Folded Spill
	.p2align	4
.Ltmp0:                                 // Block address taken
.LBB0_1:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_2 Depth 2
	{
		loop0(##.LBB0_2,#4)
		r0 = memw(r29+#4)
		memw(r29+#8) = r1
	}                                       // 4-byte Folded Reload
	{
		r0 = memw(r0+r1<<#2)
	}
	{
		r3 = memh(r0+#0)
		memw(r29+#256) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#2)
		memw(r29+#336) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#4)
		memw(r29+#332) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#6)
		memw(r29+#300) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#8)
		memw(r29+#328) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#10)
		memw(r29+#324) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#12)
		memw(r29+#320) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#14)
		memw(r29+#296) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#16)
		memw(r29+#292) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#18)
		memw(r29+#316) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#20)
		memw(r29+#288) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#22)
		memw(r29+#252) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#24)
		memw(r29+#284) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#26)
		memw(r29+#248) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#28)
		memw(r29+#192) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#30)
		memw(r29+#280) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#32)
		memw(r29+#276) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#34)
		memw(r29+#312) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#36)
		memw(r29+#308) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#38)
		memw(r29+#272) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#40)
		memw(r29+#304) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#42)
		memw(r29+#268) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#44)
		memw(r29+#188) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#46)
		memw(r29+#184) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#48)
		memw(r29+#244) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#50)
		memw(r29+#240) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#52)
		memw(r29+#180) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#54)
		memw(r29+#128) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#56)
		memw(r29+#176) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#58)
		memw(r29+#124) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#60)
		memw(r29+#172) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#62)
		memw(r29+#168) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#64)
		memw(r29+#120) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#66)
		memw(r29+#164) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#68)
		memw(r29+#116) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#70)
		memw(r29+#160) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#72)
		memw(r29+#236) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#74)
		memw(r29+#156) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#76)
		memw(r29+#112) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#78)
		memw(r29+#232) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#80)
		memw(r29+#228) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#82)
		memw(r29+#108) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#84)
		memw(r29+#152) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#86)
		memw(r29+#104) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#88)
		memw(r29+#84) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#90)
		memw(r29+#80) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#92)
		memw(r29+#100) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#94)
		memw(r29+#76) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#96)
		memw(r29+#148) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#98)
		memw(r29+#224) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#100)
		memw(r29+#144) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#102)
		memw(r29+#140) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#104)
		memw(r29+#220) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#106)
		memw(r29+#216) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#108)
		memw(r29+#264) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#110)
		memw(r29+#260) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#112)
		memw(r29+#212) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#114)
		memw(r29+#208) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#116)
		memw(r29+#204) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#118)
		memw(r29+#200) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#120)
		memw(r29+#96) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#122)
		memw(r29+#136) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memh(r0+#124)
		memw(r29+#132) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r0 = memh(r0+#126)
		memw(r29+#92) = r0.new
	}                                       // 4-byte Folded Spill
	{
		r0 = memw(r29+#0)
	}                                       // 4-byte Folded Reload
	{
		r0 = memw(r0+r1<<#2)
		memw(r29+#88) = r0.new
	}                                       // 4-byte Folded Spill
	{
		r0 = #0
	}
	.p2align	4
.Ltmp1:                                 // Block address taken
.LBB0_2:                                //   Parent Loop BB0_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	{
		r10 = addasl(r2,r0,#7)
		r15 = memw(r29+#88)
		memw(r29+#340) = r0
	}                                       // 4-byte Folded Reload
	{
		r23 = memw(r29+#256)
		memw(r29+#68) = r10
	}                                       // 4-byte Folded Reload
	{
		r28 = memw(r15+r0<<#2)
		r0 = memw(r29+#340)
	}                                       // 4-byte Folded Reload
	{
		r0 = asl(r0,#7)
		r1 = memw(r29+#340)
		r7 = memw(r29+#332)
	}                                       // 4-byte Folded Reload
	{
		r3 = or(r1,#3)
		r1 = memw(r29+#340)
		memw(r29+#60) = r3.new
	}                                       // 4-byte Folded Reload
	{
		r19 = addasl(r2,r3,#7)
		r8 = setbit(r1,#0)
		r1 = memw(r29+#340)
		r0 = memh(r2+r0<<#0)
	}                                       // 4-byte Folded Reload
	{
		r12 = setbit(r1,#1)
		r24 = r3
		r1 = memh(r10+#2)
		r6 = memw(r29+#336)
	}                                       // 4-byte Folded Reload
	{
		r28 += mpyi(r0,r23)
		r18 = addasl(r2,r8,#7)
		r11 = memw(r15+r3<<#2)
		r3 = memh(r10+#4)
	}
	{
		r28 += mpyi(r1,r6)
		r14 = r8
		r4 = memh(r10+#6)
		memw(r29+#56) = r8
	}                                       // 4-byte Folded Spill
	{
		r28 += mpyi(r3,r7)
		r7 = asl(r8,#7)
		r8 = memw(r29+#300)
		memw(r29+#72) = r12
	}                                       // 4-byte Folded Reload
	{
		r20 = addasl(r2,r12,#7)
		r0 = memh(r10+#8)
		r9 = memh(r2+r7<<#0)
	}
	{
		r28 += mpyi(r4,r8)
		r7 = memw(r29+#328)
		r5 = memh(r10+#10)
	}                                       // 4-byte Folded Reload
	{
		r1 = memh(r10+#12)
		r25 = memw(r29+#296)
	}                                       // 4-byte Folded Reload
	{
		r28 += mpyi(r0,r7)
		r7 = r12
		r0 = memw(r29+#324)
		r6 = memh(r10+#14)
	}                                       // 4-byte Folded Reload
	{
		r26 = memw(r29+#320)
		r3 = memh(r10+#16)
	}                                       // 4-byte Folded Reload
	{
		r28 += mpyi(r5,r0)
		r0 = asl(r7,#7)
		r7 = memw(r29+#292)
		r16 = memh(r10+#18)
	}                                       // 4-byte Folded Reload
	{
		r28 += mpyi(r1,r26)
		r27 = r7
		r0 = memh(r2+r0<<#0)
		memw(r29+#64) = r0.new
	}                                       // 4-byte Folded Spill
	{
		r28 += mpyi(r6,r25)
		r0 = memh(r10+#32)
		memw(r29+#12) = r0.new
	}                                       // 4-byte Folded Spill
	{
		r28 += mpyi(r3,r7)
		r0 = asl(r24,#7)
		r6 = memh(r10+#34)
		r7 = memw(r29+#316)
	}                                       // 4-byte Folded Reload
	{
		r17 = memh(r10+#20)
		memw(r29+#20) = r6
	}                                       // 4-byte Folded Spill
	{
		r28 += mpyi(r16,r7)
		r6 = memw(r29+#288)
		r3 = memh(r10+#36)
	}                                       // 4-byte Folded Reload
	{
		r5 = memw(r29+#252)
		memw(r29+#16) = r3
	}                                       // 4-byte Folded Reload
	{
		r28 += mpyi(r17,r6)
		r21 = memh(r10+#22)
		r3 = memh(r2+r0<<#0)
	}
	{
		r22 = memh(r10+#24)
		r4 = memw(r29+#284)
	}                                       // 4-byte Folded Reload
	{
		r28 += mpyi(r21,r5)
		r11 += mpyi(r3,r23)
		r12 = memh(r10+#26)
		r2 = memw(r29+#248)
	}                                       // 4-byte Folded Reload
	{
		r28 += mpyi(r22,r4)
		r13 = memh(r10+#28)
		r3 = memw(r29+#192)
	}                                       // 4-byte Folded Reload
	{
		r28 += mpyi(r12,r2)
		r24 = r3
		r16 = memw(r15+r14<<#2)
		r12 = memh(r18+#2)
	}
	{
		r16 += mpyi(r9,r23)
		r28 += mpyi(r13,r3)
		r14 = memw(r29+#336)
		r9 = memh(r18+#4)
	}                                       // 4-byte Folded Reload
	{
		r13 = memw(r29+#332)
		r0 = memh(r10+#38)
	}                                       // 4-byte Folded Reload
	{
		r16 += mpyi(r12,r14)
		r12 = memh(r18+#6)
		memw(r29+#24) = r0
	}                                       // 4-byte Folded Spill
	{
		r16 += mpyi(r9,r13)
		r9 = memh(r18+#8)
		r13 = memw(r29+#328)
	}                                       // 4-byte Folded Reload
	{
		r16 += mpyi(r12,r8)
		r0 = memh(r10+#40)
		memw(r29+#28) = r0.new
	}                                       // 4-byte Folded Spill
	{
		r16 += mpyi(r9,r13)
		r12 = memh(r18+#10)
		r13 = memw(r29+#324)
	}                                       // 4-byte Folded Reload
	{
		r17 = memh(r10+#42)
		r9 = memh(r18+#12)
	}
	{
		r16 += mpyi(r12,r13)
		r0 = memh(r10+#44)
		memw(r29+#32) = r0.new
	}                                       // 4-byte Folded Spill
	{
		r16 += mpyi(r9,r26)
		r12 = memh(r18+#14)
		r0 = memh(r10+#48)
	}
	{
		r9 = memh(r18+#16)
		memw(r29+#44) = r0
	}                                       // 4-byte Folded Spill
	{
		r16 += mpyi(r12,r25)
		r25 = r27
		r22 = memh(r10+#50)
		r12 = memh(r18+#18)
	}
	{
		r16 += mpyi(r9,r27)
		r0 = memh(r10+#52)
		memw(r29+#40) = r0.new
	}                                       // 4-byte Folded Spill
	{
		r16 += mpyi(r12,r7)
		r27 = memh(r18+#20)
		r0 = memh(r10+#54)
	}
	{
		r7 = memh(r18+#22)
		memw(r29+#36) = r0
	}                                       // 4-byte Folded Spill
	{
		r16 += mpyi(r27,r6)
		r0 = memh(r10+#56)
		memw(r29+#48) = r0.new
	}                                       // 4-byte Folded Spill
	{
		r16 += mpyi(r7,r5)
		r27 = memh(r18+#24)
		r3 = memh(r10+#58)
	}
	{
		r5 = memh(r18+#26)
		r0 = memh(r10+#60)
	}
	{
		r16 += mpyi(r27,r4)
		r27 = r24
		r6 = memh(r18+#28)
		memw(r29+#52) = r0
	}                                       // 4-byte Folded Spill
	{
		r16 += mpyi(r5,r2)
		r1 = memh(r10+#30)
		r0 = memw(r29+#280)
	}                                       // 4-byte Folded Reload
	{
		r16 += mpyi(r6,r24)
		r12 = memh(r18+#30)
		r6 = memw(r29+#276)
	}                                       // 4-byte Folded Reload
	{
		r28 += mpyi(r1,r0)
		r2 = memw(r29+#12)
		r7 = memh(r18+#32)
	}                                       // 4-byte Folded Reload
	{
		r16 += mpyi(r12,r0)
		r0 = memw(r29+#20)
		r12 = memh(r18+#34)
	}                                       // 4-byte Folded Reload
	{
		r28 += mpyi(r2,r6)
		r16 += mpyi(r7,r6)
		r2 = memw(r29+#312)
		r7 = memh(r18+#36)
	}                                       // 4-byte Folded Reload
	{
		r5 = memh(r18+#38)
		r21 = memh(r10+#46)
	}
	{
		r28 += mpyi(r0,r2)
		r16 += mpyi(r12,r2)
		r0 = memw(r29+#308)
		r1 = memh(r10+#62)
	}                                       // 4-byte Folded Reload
	{
		r6 = memw(r29+#16)
		r24 = memw(r29+#84)
	}                                       // 4-byte Folded Reload
	{
		r16 += mpyi(r7,r0)
		r2 = memw(r29+#272)
	}                                       // 4-byte Folded Reload
	{
		r28 += mpyi(r6,r0)
		r6 = memw(r29+#24)
		r0 = memw(r29+#304)
	}                                       // 4-byte Folded Reload
	{
		r16 += mpyi(r5,r2)
		r7 = memw(r29+#28)
	}                                       // 4-byte Folded Reload
	{
		r28 += mpyi(r6,r2)
		r6 = memh(r18+#40)
		r2 = memw(r29+#268)
	}                                       // 4-byte Folded Reload
	{
		r28 += mpyi(r7,r0)
		r4 = memh(r18+#42)
		r7 = memw(r29+#32)
	}                                       // 4-byte Folded Reload
	{
		r16 += mpyi(r6,r0)
		r28 += mpyi(r17,r2)
		r6 = memw(r29+#188)
		r0 = memh(r18+#44)
	}                                       // 4-byte Folded Reload
	{
		r16 += mpyi(r4,r2)
		r4 = memh(r18+#46)
		r5 = memw(r29+#184)
	}                                       // 4-byte Folded Reload
	{
		r16 += mpyi(r0,r6)
		r28 += mpyi(r7,r6)
		r0 = memh(r18+#48)
		r2 = memw(r29+#244)
	}                                       // 4-byte Folded Reload
	{
		r16 += mpyi(r4,r5)
		r28 += mpyi(r21,r5)
		r6 = memw(r29+#44)
		r4 = memh(r18+#50)
	}                                       // 4-byte Folded Reload
	{
		r16 += mpyi(r0,r2)
		r5 = memw(r29+#240)
		r0 = memh(r18+#52)
	}                                       // 4-byte Folded Reload
	{
		r28 += mpyi(r6,r2)
		r6 = memw(r29+#40)
		r2 = memw(r29+#180)
	}                                       // 4-byte Folded Reload
	{
		r16 += mpyi(r4,r5)
		r28 += mpyi(r22,r5)
		r5 = memw(r29+#128)
		r4 = memh(r18+#54)
	}                                       // 4-byte Folded Reload
	{
		r28 += mpyi(r6,r2)
		r16 += mpyi(r0,r2)
		r6 = memw(r29+#36)
		r0 = memh(r18+#56)
	}                                       // 4-byte Folded Reload
	{
		r16 += mpyi(r4,r5)
		r4 = memh(r18+#58)
		r7 = memw(r29+#172)
	}                                       // 4-byte Folded Reload
	{
		r28 += mpyi(r6,r5)
		r6 = memw(r29+#176)
		r5 = memh(r10+#64)
	}                                       // 4-byte Folded Reload
	{
		r2 = memw(r29+#48)
	}                                       // 4-byte Folded Reload
	{
		r16 += mpyi(r0,r6)
		r0 = memh(r18+#60)
	}
	{
		r28 += mpyi(r2,r6)
		r2 = memw(r29+#124)
		r6 = memw(r29+#164)
	}                                       // 4-byte Folded Reload
	{
		r28 += mpyi(r3,r2)
		r16 += mpyi(r4,r2)
		r3 = memw(r29+#52)
		r4 = memh(r18+#62)
	}                                       // 4-byte Folded Reload
	{
		r16 += mpyi(r0,r7)
		r2 = memw(r29+#168)
		r0 = memh(r18+#64)
	}                                       // 4-byte Folded Reload
	{
		r28 += mpyi(r3,r7)
		r7 = memw(r29+#120)
		r3 = memh(r10+#66)
	}                                       // 4-byte Folded Reload
	{
		r28 += mpyi(r1,r2)
		r16 += mpyi(r4,r2)
		r4 = memh(r18+#66)
		r1 = memh(r10+#68)
	}
	{
		r28 += mpyi(r5,r7)
		r16 += mpyi(r0,r7)
		r0 = memh(r18+#68)
		r2 = memw(r29+#116)
	}                                       // 4-byte Folded Reload
	{
		r28 += mpyi(r3,r6)
		r16 += mpyi(r4,r6)
		r5 = memh(r10+#70)
		r4 = memh(r18+#70)
	}
	{
		r16 += mpyi(r0,r2)
		r28 += mpyi(r1,r2)
		r7 = memw(r29+#160)
		r3 = memh(r10+#72)
	}                                       // 4-byte Folded Reload
	{
		r2 = memw(r29+#236)
		r0 = memh(r18+#72)
	}                                       // 4-byte Folded Reload
	{
		r16 += mpyi(r4,r7)
		r28 += mpyi(r5,r7)
		r1 = memh(r10+#74)
		r4 = memh(r18+#74)
	}
	{
		r28 += mpyi(r3,r2)
		r16 += mpyi(r0,r2)
		r17 = memw(r29+#156)
		r5 = memh(r10+#76)
	}                                       // 4-byte Folded Reload
	{
		r7 = memh(r18+#76)
		r2 = memw(r29+#112)
	}                                       // 4-byte Folded Reload
	{
		r28 += mpyi(r1,r17)
		r16 += mpyi(r4,r17)
		r12 = memw(r29+#232)
		r6 = memh(r10+#78)
	}                                       // 4-byte Folded Reload
	{
		r28 += mpyi(r5,r2)
		r16 += mpyi(r7,r2)
		r2 = memw(r29+#72)
		r7 = memw(r29+#228)
	}                                       // 4-byte Folded Reload
	{
		r28 += mpyi(r6,r12)
		r9 = r7
		r1 = memh(r10+#80)
		r4 = memh(r20+#2)
	}
	{
		r17 = memw(r15+r2<<#2)
		r2 = memw(r29+#64)
	}                                       // 4-byte Folded Reload
	{
		r28 += mpyi(r1,r7)
		r6 = memw(r29+#108)
		r3 = memh(r10+#82)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r2,r23)
		r22 = r6
		r2 = memw(r29+#332)
		r5 = memh(r20+#4)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r4,r14)
		r28 += mpyi(r3,r6)
		r23 = memw(r29+#104)
		r0 = memh(r10+#84)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r5,r2)
		r6 = memw(r29+#152)
		r4 = memh(r20+#6)
	}                                       // 4-byte Folded Reload
	{
		r21 = r6
		r2 = memw(r29+#300)
		r1 = memh(r10+#86)
	}                                       // 4-byte Folded Reload
	{
		r28 += mpyi(r0,r6)
		r6 = memh(r20+#8)
		r3 = memh(r10+#88)
	}
	{
		r17 += mpyi(r4,r2)
		r28 += mpyi(r1,r23)
		r2 = memw(r29+#328)
		r7 = memh(r20+#10)
	}                                       // 4-byte Folded Reload
	{
		r28 += mpyi(r3,r24)
		r0 = memh(r10+#90)
		r14 = memw(r29+#80)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r6,r2)
		r1 = memh(r10+#92)
		r5 = memh(r20+#12)
	}
	{
		r17 += mpyi(r7,r13)
		r28 += mpyi(r0,r14)
		r7 = memw(r29+#100)
		r8 = memw(r29+#76)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r5,r26)
		r3 = memh(r10+#94)
		r0 = memh(r10+#96)
	}
	{
		r28 += mpyi(r1,r7)
		r4 = memh(r20+#14)
		r2 = memw(r29+#296)
	}                                       // 4-byte Folded Reload
	{
		r28 += mpyi(r3,r8)
		r6 = memw(r29+#148)
		r1 = memh(r10+#98)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r4,r2)
		r2 = r6
		r5 = memh(r20+#16)
		r3 = memh(r10+#100)
	}
	{
		r28 += mpyi(r0,r6)
		r6 = memw(r29+#224)
		r4 = memh(r20+#18)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r5,r25)
		r5 = memh(r20+#20)
		r0 = memh(r10+#102)
	}
	{
		r28 += mpyi(r1,r6)
		r6 = memw(r29+#316)
		r1 = memh(r10+#104)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r4,r6)
		r6 = memw(r29+#144)
		r4 = memh(r20+#22)
	}                                       // 4-byte Folded Reload
	{
		r28 += mpyi(r3,r6)
		r6 = memw(r29+#288)
		r3 = memh(r10+#106)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r5,r6)
		r6 = memw(r29+#140)
		r5 = memh(r20+#24)
	}                                       // 4-byte Folded Reload
	{
		r28 += mpyi(r0,r6)
		r6 = memw(r29+#252)
		r0 = memh(r10+#108)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r4,r6)
		r6 = memw(r29+#220)
		r4 = memh(r20+#26)
	}                                       // 4-byte Folded Reload
	{
		r28 += mpyi(r1,r6)
		r6 = memw(r29+#284)
		r1 = memh(r10+#110)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r5,r6)
		r6 = memw(r29+#216)
		r5 = memh(r20+#28)
	}                                       // 4-byte Folded Reload
	{
		r28 += mpyi(r3,r6)
		r6 = memw(r29+#248)
		r3 = memh(r10+#112)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r4,r6)
		r6 = memw(r29+#264)
		r4 = memh(r20+#30)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r5,r27)
		r5 = memh(r20+#32)
	}
	{
		r28 += mpyi(r0,r6)
		r6 = memw(r29+#260)
		r0 = memh(r10+#114)
	}                                       // 4-byte Folded Reload
	{
		r28 += mpyi(r1,r6)
		r6 = memw(r29+#280)
		r1 = memh(r10+#116)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r4,r6)
		r6 = memw(r29+#212)
		r4 = memh(r20+#34)
	}                                       // 4-byte Folded Reload
	{
		r25 = memw(r29+#276)
	}                                       // 4-byte Folded Reload
	{
		r28 += mpyi(r3,r6)
		r6 = memw(r29+#208)
		r3 = memh(r10+#118)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r5,r25)
		r5 = memh(r20+#36)
	}
	{
		r28 += mpyi(r0,r6)
		r6 = memw(r29+#312)
		r0 = memh(r10+#120)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r4,r6)
		r6 = memw(r29+#204)
		r4 = memh(r20+#38)
	}                                       // 4-byte Folded Reload
	{
		r28 += mpyi(r1,r6)
		r6 = memw(r29+#308)
		r1 = memh(r10+#122)
	}                                       // 4-byte Folded Reload
	{
		r15 = memw(r29+#272)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r5,r6)
		r6 = memw(r29+#200)
		r5 = memh(r20+#40)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r4,r15)
		r4 = memh(r20+#42)
	}
	{
		r28 += mpyi(r3,r6)
		r10 = r22
		r6 = memw(r29+#96)
		r3 = memh(r10+#124)
	}                                       // 4-byte Folded Reload
	{
		r28 += mpyi(r0,r6)
		r6 = memw(r29+#304)
		r0 = memh(r18+#78)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r5,r6)
		r16 += mpyi(r0,r12)
		r6 = memw(r29+#136)
		r5 = memh(r20+#44)
	}                                       // 4-byte Folded Reload
	{
		r28 += mpyi(r1,r6)
		r6 = memw(r29+#268)
		r1 = memh(r18+#80)
	}                                       // 4-byte Folded Reload
	{
		r0 = memh(r18+#82)
	}
	{
		r17 += mpyi(r4,r6)
		r16 += mpyi(r1,r9)
		r6 = memw(r29+#132)
		r4 = memh(r20+#46)
	}                                       // 4-byte Folded Reload
	{
		r16 += mpyi(r0,r22)
		r1 = memh(r18+#84)
		r9 = memw(r29+#244)
	}                                       // 4-byte Folded Reload
	{
		r28 += mpyi(r3,r6)
		r3 = memh(r20+#48)
		memw(r29+#64) = r28.new
	}                                       // 4-byte Folded Spill
	{
		r16 += mpyi(r1,r21)
		r28 = memw(r29+#188)
		r0 = memh(r18+#86)
	}                                       // 4-byte Folded Reload
	{
		r12 = memw(r29+#184)
		r26 = memw(r29+#240)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r5,r28)
		r16 += mpyi(r0,r23)
		r6 = memh(r20+#50)
		r1 = memh(r18+#88)
	}
	{
		r17 += mpyi(r4,r12)
		r13 = memw(r29+#180)
		r0 = memh(r18+#90)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r3,r9)
		r16 += mpyi(r1,r24)
		r3 = memh(r20+#52)
		r1 = memh(r18+#92)
	}
	{
		r17 += mpyi(r6,r26)
		r16 += mpyi(r0,r14)
		r6 = memh(r20+#54)
		r22 = memw(r29+#128)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r3,r13)
		r16 += mpyi(r1,r7)
		r3 = memh(r20+#56)
		r0 = memh(r18+#94)
	}
	{
		r17 += mpyi(r6,r22)
		r27 = memw(r29+#176)
		r4 = memh(r20+#58)
	}                                       // 4-byte Folded Reload
	{
		r16 += mpyi(r0,r8)
		r6 = memh(r18+#96)
		r1 = memw(r29+#124)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r3,r27)
		r5 = memh(r20+#60)
		r0 = memw(r29+#172)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r4,r1)
		r16 += mpyi(r6,r2)
		r4 = memh(r20+#62)
		r2 = memw(r29+#168)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r5,r0)
		r3 = memh(r18+#98)
		r1 = memh(r20+#64)
	}
	{
		r17 += mpyi(r4,r2)
		r2 = memw(r29+#224)
		r4 = memh(r19+#2)
	}                                       // 4-byte Folded Reload
	{
		r0 = memh(r18+#100)
		r6 = memh(r19+#4)
	}
	{
		r16 += mpyi(r3,r2)
		r2 = memw(r29+#120)
		r3 = memh(r20+#66)
	}                                       // 4-byte Folded Reload
	{
		r8 = memw(r29+#112)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r1,r2)
		r2 = memw(r29+#336)
		r1 = memh(r18+#102)
	}                                       // 4-byte Folded Reload
	{
		r11 += mpyi(r4,r2)
		r2 = memw(r29+#144)
		r4 = memh(r19+#6)
	}                                       // 4-byte Folded Reload
	{
		r16 += mpyi(r0,r2)
		r2 = memw(r29+#332)
		r0 = memh(r20+#68)
	}                                       // 4-byte Folded Reload
	{
		r11 += mpyi(r6,r2)
		r2 = memw(r29+#164)
		r6 = memh(r19+#8)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r3,r2)
		r2 = memw(r29+#300)
		r3 = memh(r18+#104)
	}                                       // 4-byte Folded Reload
	{
		r11 += mpyi(r4,r2)
		r2 = memw(r29+#140)
		r4 = memh(r19+#10)
	}                                       // 4-byte Folded Reload
	{
		r16 += mpyi(r1,r2)
		r2 = memw(r29+#328)
		r1 = memh(r20+#70)
	}                                       // 4-byte Folded Reload
	{
		r11 += mpyi(r6,r2)
		r6 = memh(r19+#12)
		r2 = memw(r29+#116)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r0,r2)
		r2 = memw(r29+#324)
		r0 = memh(r18+#106)
	}                                       // 4-byte Folded Reload
	{
		r11 += mpyi(r4,r2)
		r2 = memw(r29+#220)
		r4 = memh(r19+#14)
	}                                       // 4-byte Folded Reload
	{
		r16 += mpyi(r3,r2)
		r2 = memw(r29+#320)
		r3 = memh(r20+#72)
	}                                       // 4-byte Folded Reload
	{
		r11 += mpyi(r6,r2)
		r2 = memw(r29+#160)
		r6 = memh(r19+#16)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r1,r2)
		r2 = memw(r29+#296)
		r1 = memh(r18+#108)
	}                                       // 4-byte Folded Reload
	{
		r11 += mpyi(r4,r2)
		r2 = memw(r29+#216)
		r4 = memh(r19+#18)
	}                                       // 4-byte Folded Reload
	{
		r16 += mpyi(r0,r2)
		r2 = memw(r29+#292)
		r0 = memh(r20+#74)
	}                                       // 4-byte Folded Reload
	{
		r11 += mpyi(r6,r2)
		r2 = memw(r29+#236)
		r6 = memh(r19+#20)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r3,r2)
		r2 = memw(r29+#316)
		r3 = memh(r18+#110)
	}                                       // 4-byte Folded Reload
	{
		r11 += mpyi(r4,r2)
		r2 = memw(r29+#264)
		r4 = memh(r19+#22)
	}                                       // 4-byte Folded Reload
	{
		r16 += mpyi(r1,r2)
		r2 = memw(r29+#288)
		r1 = memh(r20+#76)
	}                                       // 4-byte Folded Reload
	{
		r11 += mpyi(r6,r2)
		r2 = memw(r29+#156)
		r6 = memh(r19+#24)
	}                                       // 4-byte Folded Reload
	{
		r21 = memw(r29+#252)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r0,r2)
		r2 = memw(r29+#260)
		r0 = memh(r18+#112)
	}                                       // 4-byte Folded Reload
	{
		r11 += mpyi(r4,r21)
		r4 = memh(r19+#26)
	}
	{
		r16 += mpyi(r3,r2)
		r2 = memw(r29+#284)
		r3 = memh(r20+#78)
	}                                       // 4-byte Folded Reload
	{
		r11 += mpyi(r6,r2)
		r2 = memw(r29+#112)
		r6 = memh(r19+#28)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r1,r2)
		r2 = memw(r29+#248)
		r1 = memh(r18+#114)
	}                                       // 4-byte Folded Reload
	{
		r11 += mpyi(r4,r2)
		r2 = memw(r29+#212)
		r4 = memh(r19+#30)
	}                                       // 4-byte Folded Reload
	{
		r16 += mpyi(r0,r2)
		r2 = memw(r29+#192)
		r0 = memh(r20+#80)
	}                                       // 4-byte Folded Reload
	{
		r11 += mpyi(r6,r2)
		r2 = memw(r29+#232)
		r6 = memh(r19+#32)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r3,r2)
		r2 = memw(r29+#280)
		r3 = memh(r18+#116)
	}                                       // 4-byte Folded Reload
	{
		r11 += mpyi(r4,r2)
		r2 = memw(r29+#208)
		r4 = memh(r19+#34)
	}                                       // 4-byte Folded Reload
	{
		r11 += mpyi(r6,r25)
		r6 = memh(r19+#36)
	}
	{
		r16 += mpyi(r1,r2)
		r2 = memw(r29+#228)
		r1 = memh(r20+#82)
	}                                       // 4-byte Folded Reload
	{
		r25 = memw(r29+#96)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r0,r2)
		r2 = memw(r29+#312)
		r0 = memh(r18+#118)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r1,r10)
		r1 = memh(r18+#120)
	}
	{
		r11 += mpyi(r4,r2)
		r2 = memw(r29+#204)
		r4 = memh(r19+#38)
	}                                       // 4-byte Folded Reload
	{
		r16 += mpyi(r3,r2)
		r2 = memw(r29+#308)
		r3 = memh(r20+#84)
	}                                       // 4-byte Folded Reload
	{
		r11 += mpyi(r6,r2)
		r2 = memw(r29+#200)
		r6 = memh(r19+#40)
	}                                       // 4-byte Folded Reload
	{
		r11 += mpyi(r4,r15)
		r4 = memh(r19+#42)
	}
	{
		r16 += mpyi(r0,r2)
		r2 = memw(r29+#304)
		r0 = memh(r20+#86)
	}                                       // 4-byte Folded Reload
	{
		r16 += mpyi(r1,r25)
		r1 = memh(r20+#88)
	}
	{
		r11 += mpyi(r6,r2)
		r2 = memw(r29+#152)
		r6 = memh(r19+#44)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r3,r2)
		r2 = memw(r29+#268)
		r3 = memh(r18+#122)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r0,r23)
		r0 = memh(r18+#124)
	}
	{
		r11 += mpyi(r4,r2)
		r17 += mpyi(r1,r24)
		r2 = memw(r29+#136)
		r4 = memh(r19+#46)
	}                                       // 4-byte Folded Reload
	{
		r11 += mpyi(r6,r28)
		r6 = memh(r19+#48)
		r1 = memh(r18+#126)
	}
	{
		r16 += mpyi(r3,r2)
		r11 += mpyi(r4,r12)
		r2 = memw(r29+#132)
		r3 = memh(r20+#90)
	}                                       // 4-byte Folded Reload
	{
		r11 += mpyi(r6,r9)
		r4 = memh(r19+#50)
		r28 = memw(r29+#76)
	}                                       // 4-byte Folded Reload
	{
		r16 += mpyi(r0,r2)
		r17 += mpyi(r3,r14)
		r6 = memh(r19+#52)
		r0 = memh(r20+#92)
	}
	{
		r11 += mpyi(r4,r26)
		r2 = memw(r29+#92)
		r4 = memh(r19+#54)
	}                                       // 4-byte Folded Reload
	{
		r11 += mpyi(r6,r13)
		r17 += mpyi(r0,r7)
		r6 = memh(r19+#56)
		r7 = memw(r29+#340)
	}                                       // 4-byte Folded Reload
	{
		r11 += mpyi(r4,r22)
		r16 += mpyi(r1,r2)
		r3 = memh(r19+#58)
		r1 = memh(r20+#94)
	}
	{
		r11 += mpyi(r6,r27)
		r18 = setbit(r7,#2)
		r9 = memw(r29+#124)
		r2 = memw(r29+#196)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r1,r28)
		r6 = asl(r18,#7)
		r0 = memh(r20+#96)
		r4 = memh(r19+#60)
	}
	{
		r11 += mpyi(r3,r9)
		r3 = addasl(r2,r18,#7)
		r1 = memh(r2+r6<<#0)
		memw(r29+#52) = r18
	}                                       // 4-byte Folded Spill
	{
		r2 = memw(r29+#148)
		r15 = memw(r29+#172)
	}                                       // 4-byte Folded Reload
	{
		r5 = memh(r19+#62)
		r10 = memw(r29+#88)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r0,r2)
		r11 += mpyi(r4,r15)
		r2 = memw(r29+#168)
		r7 = memh(r20+#98)
	}                                       // 4-byte Folded Reload
	{
		r18 = memw(r10+r18<<#2)
		r0 = memh(r3+#2)
	}
	{
		r11 += mpyi(r5,r2)
		r2 = memw(r29+#256)
		r5 = memh(r20+#100)
	}                                       // 4-byte Folded Reload
	{
		r6 = memw(r29+#224)
		r4 = memh(r19+#64)
	}                                       // 4-byte Folded Reload
	{
		r18 += mpyi(r1,r2)
		r2 = memw(r29+#336)
		r1 = memh(r3+#4)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r7,r6)
		r7 = memw(r29+#332)
		r23 = memw(r29+#164)
	}                                       // 4-byte Folded Reload
	{
		r18 += mpyi(r0,r2)
		r0 = memh(r3+#6)
		r2 = memw(r29+#120)
	}                                       // 4-byte Folded Reload
	{
		r18 += mpyi(r1,r7)
		r7 = memw(r29+#144)
		r1 = memh(r3+#8)
	}                                       // 4-byte Folded Reload
	{
		r11 += mpyi(r4,r2)
		r6 = memh(r19+#66)
		r4 = memh(r20+#102)
	}
	{
		r17 += mpyi(r5,r7)
		r7 = memw(r29+#300)
		r5 = memh(r19+#68)
	}                                       // 4-byte Folded Reload
	{
		r11 += mpyi(r6,r23)
		r6 = memh(r20+#104)
	}
	{
		r18 += mpyi(r0,r7)
		r7 = memw(r29+#328)
		r0 = memh(r3+#10)
	}                                       // 4-byte Folded Reload
	{
		r26 = memw(r29+#140)
	}                                       // 4-byte Folded Reload
	{
		r18 += mpyi(r1,r7)
		r7 = memw(r29+#324)
		r1 = memh(r3+#12)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r4,r26)
		r4 = memh(r19+#70)
	}
	{
		r18 += mpyi(r0,r7)
		r0 = memh(r3+#14)
		r7 = memw(r29+#116)
	}                                       // 4-byte Folded Reload
	{
		r11 += mpyi(r5,r7)
		r7 = memw(r29+#320)
		r5 = memh(r20+#106)
	}                                       // 4-byte Folded Reload
	{
		r12 = memw(r29+#160)
	}                                       // 4-byte Folded Reload
	{
		r18 += mpyi(r1,r7)
		r7 = memw(r29+#220)
		r1 = memh(r3+#16)
	}                                       // 4-byte Folded Reload
	{
		r11 += mpyi(r4,r12)
		r4 = memh(r20+#108)
	}
	{
		r17 += mpyi(r6,r7)
		r7 = memw(r29+#296)
		r6 = memh(r19+#72)
	}                                       // 4-byte Folded Reload
	{
		r14 = memw(r29+#236)
	}                                       // 4-byte Folded Reload
	{
		r18 += mpyi(r0,r7)
		r7 = memw(r29+#292)
		r0 = memh(r3+#18)
	}                                       // 4-byte Folded Reload
	{
		r11 += mpyi(r6,r14)
		r6 = memh(r20+#110)
	}
	{
		r18 += mpyi(r1,r7)
		r7 = memw(r29+#216)
		r1 = memh(r3+#20)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r5,r7)
		r7 = memw(r29+#316)
		r5 = memh(r19+#74)
	}                                       // 4-byte Folded Reload
	{
		r13 = memw(r29+#156)
	}                                       // 4-byte Folded Reload
	{
		r18 += mpyi(r0,r7)
		r7 = memw(r29+#288)
		r0 = memh(r3+#22)
	}                                       // 4-byte Folded Reload
	{
		r11 += mpyi(r5,r13)
		r5 = memh(r20+#112)
	}
	{
		r18 += mpyi(r1,r7)
		r7 = memw(r29+#264)
		r1 = memh(r3+#24)
	}                                       // 4-byte Folded Reload
	{
		r18 += mpyi(r0,r21)
		r0 = memh(r3+#26)
	}
	{
		r17 += mpyi(r4,r7)
		r7 = memw(r29+#284)
		r4 = memh(r19+#76)
	}                                       // 4-byte Folded Reload
	{
		r18 += mpyi(r1,r7)
		r11 += mpyi(r4,r8)
		r7 = memw(r29+#260)
		r1 = memh(r3+#28)
	}                                       // 4-byte Folded Reload
	{
		r4 = memh(r20+#114)
	}
	{
		r17 += mpyi(r6,r7)
		r7 = memw(r29+#248)
		r6 = memh(r19+#78)
	}                                       // 4-byte Folded Reload
	{
		r18 += mpyi(r0,r7)
		r7 = memw(r29+#192)
		r0 = memh(r3+#30)
	}                                       // 4-byte Folded Reload
	{
		r18 += mpyi(r1,r7)
		r7 = memw(r29+#212)
		r1 = memh(r3+#32)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r5,r7)
		r7 = memw(r29+#280)
		r5 = memh(r19+#80)
	}                                       // 4-byte Folded Reload
	{
		r18 += mpyi(r0,r7)
		r7 = memw(r29+#232)
		r0 = memh(r3+#34)
	}                                       // 4-byte Folded Reload
	{
		r11 += mpyi(r6,r7)
		r7 = memw(r29+#276)
		r6 = memh(r20+#116)
	}                                       // 4-byte Folded Reload
	{
		r18 += mpyi(r1,r7)
		r7 = memw(r29+#208)
		r1 = memh(r3+#36)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r4,r7)
		r7 = memw(r29+#312)
		r4 = memh(r19+#82)
	}                                       // 4-byte Folded Reload
	{
		r21 = memw(r29+#152)
	}                                       // 4-byte Folded Reload
	{
		r18 += mpyi(r0,r7)
		r7 = memw(r29+#228)
		r0 = memh(r3+#38)
	}                                       // 4-byte Folded Reload
	{
		r24 = memw(r29+#188)
	}                                       // 4-byte Folded Reload
	{
		r11 += mpyi(r5,r7)
		r7 = memw(r29+#308)
		r5 = memh(r20+#118)
	}                                       // 4-byte Folded Reload
	{
		r18 += mpyi(r1,r7)
		r7 = memw(r29+#204)
		r1 = memh(r3+#40)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r6,r7)
		r7 = memw(r29+#272)
		r6 = memh(r19+#84)
	}                                       // 4-byte Folded Reload
	{
		r18 += mpyi(r0,r7)
		r7 = memw(r29+#108)
		r0 = memh(r3+#42)
	}                                       // 4-byte Folded Reload
	{
		r11 += mpyi(r4,r7)
		r7 = memw(r29+#304)
		r4 = memh(r20+#120)
	}                                       // 4-byte Folded Reload
	{
		r11 += mpyi(r6,r21)
		r6 = memh(r20+#122)
	}
	{
		r18 += mpyi(r1,r7)
		r7 = memw(r29+#200)
		r1 = memh(r3+#44)
	}                                       // 4-byte Folded Reload
	{
		r27 = memw(r29+#268)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r5,r7)
		r7 = memw(r29+#184)
		r5 = memh(r19+#86)
	}                                       // 4-byte Folded Reload
	{
		r18 += mpyi(r0,r27)
		r17 += mpyi(r4,r25)
		r0 = memh(r3+#46)
		r4 = memh(r19+#88)
	}
	{
		r18 += mpyi(r1,r24)
		r1 = memh(r3+#48)
	}
	{
		r18 += mpyi(r0,r7)
		r7 = memw(r29+#104)
		r0 = memh(r3+#50)
	}                                       // 4-byte Folded Reload
	{
		r11 += mpyi(r5,r7)
		r7 = memw(r29+#244)
		r5 = memh(r20+#124)
	}                                       // 4-byte Folded Reload
	{
		r18 += mpyi(r1,r7)
		r7 = memw(r29+#136)
		r1 = memh(r3+#52)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r6,r7)
		r7 = memw(r29+#240)
		r6 = memh(r19+#90)
	}                                       // 4-byte Folded Reload
	{
		r25 = memw(r29+#84)
	}                                       // 4-byte Folded Reload
	{
		r18 += mpyi(r0,r7)
		r7 = memw(r29+#180)
		r0 = memh(r3+#54)
	}                                       // 4-byte Folded Reload
	{
		r11 += mpyi(r4,r25)
		r4 = memh(r20+#126)
	}
	{
		r18 += mpyi(r1,r7)
		r7 = memw(r29+#132)
		r1 = memh(r3+#56)
	}                                       // 4-byte Folded Reload
	{
		r18 += mpyi(r0,r22)
		r0 = memh(r3+#58)
	}
	{
		r17 += mpyi(r5,r7)
		r5 = memw(r29+#80)
		r7 = memh(r19+#92)
	}                                       // 4-byte Folded Reload
	{
		r11 += mpyi(r6,r5)
		r6 = memw(r29+#176)
		r5 = memh(r3+#60)
	}                                       // 4-byte Folded Reload
	{
		r18 += mpyi(r1,r6)
		r1 = memw(r29+#92)
		r6 = memw(r29+#340)
	}                                       // 4-byte Folded Reload
	{
		r18 += mpyi(r0,r9)
		r9 = or(r6,#5)
		r0 = memh(r19+#96)
		memw(r29+#44) = r9.new
	}                                       // 4-byte Folded Spill
	{
		r17 += mpyi(r4,r1)
		r18 += mpyi(r5,r15)
		r1 = memw(r29+#100)
		r4 = memh(r3+#62)
	}                                       // 4-byte Folded Reload
	{
		r6 = asl(r9,#7)
		r20 = memw(r29+#196)
		r5 = memh(r3+#64)
	}                                       // 4-byte Folded Reload
	{
		r11 += mpyi(r7,r1)
		r22 = addasl(r20,r9,#7)
		r1 = memh(r19+#94)
		r7 = memh(r19+#98)
	}
	{
		r11 += mpyi(r1,r28)
		r1 = memw(r29+#168)
	}                                       // 4-byte Folded Reload
	{
		r18 += mpyi(r4,r1)
		r1 = memh(r20+r6<<#0)
		r6 = memw(r29+#148)
	}                                       // 4-byte Folded Reload
	{
		r18 += mpyi(r5,r2)
		r2 = memw(r29+#256)
		r20 = memw(r10+r9<<#2)
	}                                       // 4-byte Folded Reload
	{
		r11 += mpyi(r0,r6)
		r0 = memh(r22+#2)
		r4 = memh(r3+#66)
	}
	{
		r20 += mpyi(r1,r2)
		r2 = memw(r29+#224)
		r1 = memh(r22+#4)
	}                                       // 4-byte Folded Reload
	{
		r18 += mpyi(r4,r23)
		r23 = r26
		r5 = memh(r19+#100)
		r6 = memh(r3+#68)
	}
	{
		r11 += mpyi(r7,r2)
		r2 = memw(r29+#336)
		r4 = memh(r19+#102)
	}                                       // 4-byte Folded Reload
	{
		r15 = memw(r29+#144)
		r9 = memw(r29+#96)
	}                                       // 4-byte Folded Reload
	{
		r20 += mpyi(r0,r2)
		r2 = memw(r29+#332)
		r0 = memh(r22+#6)
	}                                       // 4-byte Folded Reload
	{
		r11 += mpyi(r5,r15)
		r10 = memw(r29+#116)
		r5 = memh(r3+#70)
	}                                       // 4-byte Folded Reload
	{
		r20 += mpyi(r1,r2)
		r11 += mpyi(r4,r26)
		r2 = memw(r29+#300)
		r1 = memh(r22+#8)
	}                                       // 4-byte Folded Reload
	{
		r18 += mpyi(r6,r10)
		r6 = memh(r19+#104)
		r4 = memh(r3+#72)
	}
	{
		r20 += mpyi(r0,r2)
		r18 += mpyi(r5,r12)
		r2 = memw(r29+#328)
		r0 = memh(r22+#10)
	}                                       // 4-byte Folded Reload
	{
		r18 += mpyi(r4,r14)
		r5 = memh(r19+#106)
	}
	{
		r20 += mpyi(r1,r2)
		r2 = memw(r29+#324)
		r1 = memh(r22+#12)
	}                                       // 4-byte Folded Reload
	{
		r4 = memh(r19+#108)
	}
	{
		r20 += mpyi(r0,r2)
		r2 = memw(r29+#320)
		r0 = memh(r22+#14)
	}                                       // 4-byte Folded Reload
	{
		r20 += mpyi(r1,r2)
		r2 = memw(r29+#220)
		r1 = memh(r22+#16)
	}                                       // 4-byte Folded Reload
	{
		r11 += mpyi(r6,r2)
		r2 = memw(r29+#296)
		r6 = memh(r3+#74)
	}                                       // 4-byte Folded Reload
	{
		r20 += mpyi(r0,r2)
		r18 += mpyi(r6,r13)
		r2 = memw(r29+#292)
		r0 = memh(r22+#18)
	}                                       // 4-byte Folded Reload
	{
		r6 = memh(r19+#110)
	}
	{
		r20 += mpyi(r1,r2)
		r2 = memw(r29+#216)
		r1 = memh(r22+#20)
	}                                       // 4-byte Folded Reload
	{
		r11 += mpyi(r5,r2)
		r2 = memw(r29+#316)
		r5 = memh(r3+#76)
	}                                       // 4-byte Folded Reload
	{
		r20 += mpyi(r0,r2)
		r18 += mpyi(r5,r8)
		r2 = memw(r29+#288)
		r0 = memh(r22+#22)
	}                                       // 4-byte Folded Reload
	{
		r5 = memh(r19+#112)
	}
	{
		r20 += mpyi(r1,r2)
		r2 = memw(r29+#264)
		r1 = memh(r22+#24)
	}                                       // 4-byte Folded Reload
	{
		r11 += mpyi(r4,r2)
		r2 = memw(r29+#252)
		r4 = memh(r3+#78)
	}                                       // 4-byte Folded Reload
	{
		r20 += mpyi(r0,r2)
		r2 = memw(r29+#284)
		r0 = memh(r22+#26)
	}                                       // 4-byte Folded Reload
	{
		r20 += mpyi(r1,r2)
		r2 = memw(r29+#260)
		r1 = memh(r22+#28)
	}                                       // 4-byte Folded Reload
	{
		r11 += mpyi(r6,r2)
		r2 = memw(r29+#248)
		r6 = memh(r3+#80)
	}                                       // 4-byte Folded Reload
	{
		r20 += mpyi(r0,r2)
		r2 = memw(r29+#232)
		r0 = memh(r22+#30)
	}                                       // 4-byte Folded Reload
	{
		r14 = memw(r29+#108)
	}                                       // 4-byte Folded Reload
	{
		r18 += mpyi(r4,r2)
		r2 = memw(r29+#192)
		r4 = memh(r19+#114)
	}                                       // 4-byte Folded Reload
	{
		r13 = memw(r29+#204)
	}                                       // 4-byte Folded Reload
	{
		r20 += mpyi(r1,r2)
		r2 = memw(r29+#212)
		r1 = memh(r22+#32)
	}                                       // 4-byte Folded Reload
	{
		r12 = memw(r29+#200)
	}                                       // 4-byte Folded Reload
	{
		r11 += mpyi(r5,r2)
		r2 = memw(r29+#280)
		r5 = memh(r3+#82)
	}                                       // 4-byte Folded Reload
	{
		r20 += mpyi(r0,r2)
		r2 = memw(r29+#228)
		r0 = memh(r22+#34)
	}                                       // 4-byte Folded Reload
	{
		r18 += mpyi(r6,r2)
		r2 = memw(r29+#276)
		r6 = memh(r19+#116)
	}                                       // 4-byte Folded Reload
	{
		r18 += mpyi(r5,r14)
		r5 = memh(r19+#118)
	}
	{
		r20 += mpyi(r1,r2)
		r2 = memw(r29+#208)
		r1 = memh(r22+#36)
	}                                       // 4-byte Folded Reload
	{
		r11 += mpyi(r4,r2)
		r2 = memw(r29+#312)
		r4 = memh(r3+#84)
	}                                       // 4-byte Folded Reload
	{
		r11 += mpyi(r6,r13)
		r6 = memh(r3+#86)
	}
	{
		r20 += mpyi(r0,r2)
		r18 += mpyi(r4,r21)
		r2 = memw(r29+#308)
		r0 = memh(r22+#38)
	}                                       // 4-byte Folded Reload
	{
		r11 += mpyi(r5,r12)
		r4 = memh(r19+#120)
		r5 = memh(r3+#88)
	}
	{
		r20 += mpyi(r1,r2)
		r2 = memw(r29+#272)
		r1 = memh(r22+#40)
	}                                       // 4-byte Folded Reload
	{
		r11 += mpyi(r4,r9)
		r4 = memh(r3+#90)
	}
	{
		r20 += mpyi(r0,r2)
		r2 = memw(r29+#304)
		r0 = memh(r22+#42)
	}                                       // 4-byte Folded Reload
	{
		r7 = memw(r29+#244)
	}                                       // 4-byte Folded Reload
	{
		r20 += mpyi(r1,r2)
		r2 = memw(r29+#104)
		r1 = memh(r22+#44)
	}                                       // 4-byte Folded Reload
	{
		r20 += mpyi(r0,r27)
		r0 = memh(r22+#46)
	}
	{
		r18 += mpyi(r6,r2)
		r20 += mpyi(r1,r24)
		r2 = memw(r29+#184)
		r1 = memh(r22+#48)
	}                                       // 4-byte Folded Reload
	{
		r18 += mpyi(r5,r25)
		r6 = memh(r19+#122)
	}
	{
		r20 += mpyi(r0,r2)
		r2 = memw(r29+#136)
		r0 = memh(r22+#50)
	}                                       // 4-byte Folded Reload
	{
		r20 += mpyi(r1,r7)
		r7 = memw(r29+#240)
		r1 = memh(r22+#52)
	}                                       // 4-byte Folded Reload
	{
		r11 += mpyi(r6,r2)
		r2 = memw(r29+#80)
		r6 = memh(r3+#92)
	}                                       // 4-byte Folded Reload
	{
		r20 += mpyi(r0,r7)
		r21 = memw(r29+#180)
		r0 = memh(r22+#54)
	}                                       // 4-byte Folded Reload
	{
		r18 += mpyi(r4,r2)
		r2 = memw(r29+#132)
		r5 = memh(r19+#124)
	}                                       // 4-byte Folded Reload
	{
		r20 += mpyi(r1,r21)
		r7 = memw(r29+#128)
		r1 = memh(r22+#56)
	}                                       // 4-byte Folded Reload
	{
		r11 += mpyi(r5,r2)
		r4 = memh(r19+#126)
		r5 = memh(r3+#94)
	}
	{
		r20 += mpyi(r0,r7)
		r7 = memw(r29+#100)
		r0 = memh(r22+#58)
	}                                       // 4-byte Folded Reload
	{
		r19 = memw(r29+#196)
	}                                       // 4-byte Folded Reload
	{
		r18 += mpyi(r6,r7)
		r6 = memw(r29+#176)
	}                                       // 4-byte Folded Reload
	{
		r18 += mpyi(r5,r28)
	}
	{
		r20 += mpyi(r1,r6)
		r6 = memw(r29+#92)
		r1 = memh(r22+#60)
	}                                       // 4-byte Folded Reload
	{
		r7 = memw(r29+#124)
		r5 = memh(r22+#62)
	}                                       // 4-byte Folded Reload
	{
		r11 += mpyi(r4,r6)
		r6 = memw(r29+#340)
		r4 = memh(r3+#96)
	}                                       // 4-byte Folded Reload
	{
		r20 += mpyi(r0,r7)
		r26 = or(r6,#6)
		r24 = memw(r29+#148)
		r6 = memw(r29+#172)
	}                                       // 4-byte Folded Reload
	{
		r7 = asl(r26,#7)
		r0 = memh(r3+#98)
		memw(r29+#48) = r26
	}                                       // 4-byte Folded Spill
	{
		r18 += mpyi(r4,r24)
		r20 += mpyi(r1,r6)
		r4 = memw(r29+#168)
		r6 = memh(r22+#64)
	}                                       // 4-byte Folded Reload
	{
		r1 = addasl(r19,r26,#7)
		r27 = memh(r22+#66)
		r28 = memw(r29+#336)
	}                                       // 4-byte Folded Reload
	{
		r20 += mpyi(r5,r4)
		r4 = memh(r19+r7<<#0)
		r7 = memw(r29+#120)
	}                                       // 4-byte Folded Reload
	{
		r5 = memh(r3+#100)
		r24 = memw(r29+#332)
	}                                       // 4-byte Folded Reload
	{
		r20 += mpyi(r6,r7)
		r7 = memw(r29+#224)
		r6 = memw(r29+#88)
	}                                       // 4-byte Folded Reload
	{
		r18 += mpyi(r0,r7)
		r7 = memw(r29+#256)
		r19 = memw(r6+r26<<#2)
	}                                       // 4-byte Folded Reload
	{
		r18 += mpyi(r5,r15)
		r6 = memh(r1+#2)
		r0 = memh(r22+#68)
	}
	{
		r19 += mpyi(r4,r7)
		r7 = memw(r29+#164)
		r4 = memh(r1+#4)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r6,r28)
		r6 = memh(r1+#6)
		r26 = memw(r29+#300)
	}                                       // 4-byte Folded Reload
	{
		r20 += mpyi(r27,r7)
		r19 += mpyi(r4,r24)
		r7 = memh(r3+#102)
		r4 = memh(r1+#8)
	}
	{
		r20 += mpyi(r0,r10)
		r19 += mpyi(r6,r26)
		r10 = memw(r29+#160)
		r6 = memh(r1+#10)
	}                                       // 4-byte Folded Reload
	{
		r18 += mpyi(r7,r23)
		r23 = memw(r29+#328)
		r25 = memw(r29+#324)
	}                                       // 4-byte Folded Reload
	{
		r5 = memh(r22+#70)
		r15 = memw(r29+#320)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r4,r23)
		r4 = memh(r1+#12)
		r28 = memw(r29+#236)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r6,r25)
		r20 += mpyi(r5,r10)
		r7 = memh(r22+#72)
		r6 = memh(r1+#14)
	}
	{
		r19 += mpyi(r4,r15)
		r25 = memw(r29+#296)
		r0 = memh(r3+#104)
	}                                       // 4-byte Folded Reload
	{
		r20 += mpyi(r7,r28)
		r27 = memw(r29+#220)
		r4 = memh(r1+#16)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r6,r25)
		r10 = memw(r29+#292)
		r5 = memh(r3+#106)
	}                                       // 4-byte Folded Reload
	{
		r18 += mpyi(r0,r27)
		r28 = memw(r29+#216)
		r0 = memh(r22+#74)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r4,r10)
		r27 = memw(r29+#156)
		r7 = memh(r3+#108)
	}                                       // 4-byte Folded Reload
	{
		r18 += mpyi(r5,r28)
		r10 = memw(r29+#264)
		r6 = memh(r1+#18)
	}                                       // 4-byte Folded Reload
	{
		r20 += mpyi(r0,r27)
		r15 = memw(r29+#316)
		r5 = memh(r22+#76)
	}                                       // 4-byte Folded Reload
	{
		r18 += mpyi(r7,r10)
		r27 = memw(r29+#112)
		r10 = memw(r29+#288)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r6,r15)
		r4 = memh(r1+#20)
		r0 = memh(r3+#110)
	}
	{
		r20 += mpyi(r5,r27)
		r15 = memw(r29+#260)
		r6 = memh(r1+#22)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r4,r10)
		r27 = memw(r29+#252)
		r4 = memh(r1+#24)
	}                                       // 4-byte Folded Reload
	{
		r18 += mpyi(r0,r15)
		r15 = memw(r29+#284)
		r7 = memh(r22+#78)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r6,r27)
		r6 = memh(r1+#26)
		r5 = memh(r3+#112)
	}
	{
		r19 += mpyi(r4,r15)
		r15 = memw(r29+#232)
		r4 = memh(r1+#28)
	}                                       // 4-byte Folded Reload
	{
		r0 = memh(r22+#80)
	}
	{
		r20 += mpyi(r7,r15)
		r15 = memw(r29+#248)
		r7 = memh(r3+#114)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r6,r15)
		r15 = memw(r29+#212)
		r6 = memh(r1+#30)
	}                                       // 4-byte Folded Reload
	{
		r18 += mpyi(r5,r15)
		r15 = memw(r29+#192)
		r5 = memh(r22+#82)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r4,r15)
		r15 = memw(r29+#228)
		r4 = memh(r1+#32)
	}                                       // 4-byte Folded Reload
	{
		r20 += mpyi(r0,r15)
		r15 = memw(r29+#280)
		r0 = memh(r3+#116)
	}                                       // 4-byte Folded Reload
	{
		r20 += mpyi(r5,r14)
		r5 = memh(r3+#118)
	}
	{
		r19 += mpyi(r6,r15)
		r15 = memw(r29+#208)
		r6 = memh(r1+#34)
	}                                       // 4-byte Folded Reload
	{
		r18 += mpyi(r7,r15)
		r15 = memw(r29+#276)
		r7 = memh(r22+#84)
	}                                       // 4-byte Folded Reload
	{
		r18 += mpyi(r0,r13)
		r14 = memw(r29+#308)
		r0 = memh(r22+#86)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r4,r15)
		r18 += mpyi(r5,r12)
		r15 = memw(r29+#312)
		r4 = memh(r1+#36)
	}                                       // 4-byte Folded Reload
	{
		r13 = memw(r29+#272)
		r5 = memh(r22+#88)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r6,r15)
		r15 = memw(r29+#152)
		r6 = memh(r1+#38)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r4,r14)
		r4 = memh(r1+#40)
		r14 = memw(r29+#304)
	}                                       // 4-byte Folded Reload
	{
		r20 += mpyi(r7,r15)
		r19 += mpyi(r6,r13)
		r15 = memw(r29+#104)
		r6 = memh(r1+#42)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r4,r14)
		r12 = memw(r29+#268)
		r7 = memh(r3+#120)
	}                                       // 4-byte Folded Reload
	{
		r20 += mpyi(r0,r15)
		r4 = memh(r1+#44)
		r13 = memw(r29+#84)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r6,r12)
		r18 += mpyi(r7,r9)
		r12 = memw(r29+#188)
		r0 = memh(r3+#122)
	}                                       // 4-byte Folded Reload
	{
		r20 += mpyi(r5,r13)
		r9 = memw(r29+#136)
		r14 = memw(r29+#184)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r4,r12)
		r6 = memh(r1+#46)
		r5 = memh(r3+#124)
	}
	{
		r18 += mpyi(r0,r9)
		r15 = memw(r29+#244)
		r7 = memh(r22+#90)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r6,r14)
		r18 += mpyi(r5,r2)
		r14 = memw(r29+#80)
		r4 = memh(r1+#48)
	}                                       // 4-byte Folded Reload
	{
		r0 = memh(r22+#92)
		r2 = memw(r29+#100)
	}                                       // 4-byte Folded Reload
	{
		r20 += mpyi(r7,r14)
		r19 += mpyi(r4,r15)
		r7 = memh(r3+#126)
		r6 = memh(r1+#50)
	}
	{
		r20 += mpyi(r0,r2)
		r3 = memw(r29+#240)
		r4 = memh(r1+#52)
	}                                       // 4-byte Folded Reload
	{
		r5 = memh(r22+#94)
		r0 = memw(r29+#76)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r6,r3)
		r3 = memh(r1+#54)
		r15 = memw(r29+#128)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r4,r21)
		r20 += mpyi(r5,r0)
		r0 = memw(r29+#176)
		r6 = memh(r1+#56)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r3,r15)
		r21 = memh(r22+#96)
		r13 = memw(r29+#92)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r6,r0)
		r0 = memh(r22+#98)
		memw(r29+#36) = r0.new
	}                                       // 4-byte Folded Spill
	{
		r18 += mpyi(r7,r13)
		r4 = memw(r29+#340)
		r3 = memh(r1+#58)
	}                                       // 4-byte Folded Reload
	{
		r0 = or(r4,#7)
		r2 = memw(r29+#124)
		memw(r29+#40) = r0.new
	}                                       // 4-byte Folded Reload
	{
		r7 = asl(r0,#7)
		r4 = memw(r29+#148)
		r5 = memh(r1+#60)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r3,r2)
		r2 = memw(r29+#196)
		r6 = memh(r1+#62)
	}                                       // 4-byte Folded Reload
	{
		r20 += mpyi(r21,r4)
		r3 = addasl(r2,r0,#7)
		r4 = memw(r29+#172)
		r8 = memh(r22+#100)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r5,r4)
		r4 = memh(r2+r7<<#0)
		r2 = memw(r29+#224)
	}                                       // 4-byte Folded Reload
	{
		r7 = memw(r29+#36)
		r5 = memh(r1+#64)
	}                                       // 4-byte Folded Reload
	{
		r20 += mpyi(r7,r2)
		r2 = memw(r29+#88)
		r7 = memw(r29+#256)
	}                                       // 4-byte Folded Reload
	{
		r21 = memw(r2+r0<<#2)
		r2 = memw(r29+#168)
	}                                       // 4-byte Folded Reload
	{
		r21 += mpyi(r4,r7)
		r0 = memh(r3+#2)
		r7 = memh(r1+#66)
	}
	{
		r19 += mpyi(r6,r2)
		r2 = memw(r29+#144)
		r6 = memh(r22+#102)
	}                                       // 4-byte Folded Reload
	{
		r4 = memh(r3+#4)
	}
	{
		r20 += mpyi(r8,r2)
		r2 = memw(r29+#336)
		r8 = memh(r1+#96)
	}                                       // 4-byte Folded Reload
	{
		r21 += mpyi(r0,r2)
		r0 = memh(r3+#6)
		r2 = memw(r29+#120)
	}                                       // 4-byte Folded Reload
	{
		r21 += mpyi(r4,r24)
		r4 = memh(r3+#8)
	}
	{
		r19 += mpyi(r5,r2)
		r21 += mpyi(r0,r26)
		r2 = memw(r29+#140)
		r5 = memh(r22+#104)
	}                                       // 4-byte Folded Reload
	{
		r21 += mpyi(r4,r23)
		r0 = memh(r3+#10)
	}
	{
		r20 += mpyi(r6,r2)
		r2 = memw(r29+#164)
		r6 = memh(r1+#68)
	}                                       // 4-byte Folded Reload
	{
		r4 = memh(r3+#12)
	}
	{
		r19 += mpyi(r7,r2)
		r2 = memw(r29+#220)
		r7 = memh(r22+#106)
	}                                       // 4-byte Folded Reload
	{
		r20 += mpyi(r5,r2)
		r2 = memw(r29+#324)
		r5 = memh(r1+#70)
	}                                       // 4-byte Folded Reload
	{
		r20 += mpyi(r7,r28)
		r7 = memh(r1+#72)
	}
	{
		r21 += mpyi(r0,r2)
		r0 = memh(r3+#14)
		r2 = memw(r29+#116)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r6,r2)
		r2 = memw(r29+#320)
		r6 = memh(r22+#108)
	}                                       // 4-byte Folded Reload
	{
		r21 += mpyi(r4,r2)
		r2 = memw(r29+#160)
		r4 = memh(r3+#16)
	}                                       // 4-byte Folded Reload
	{
		r21 += mpyi(r0,r25)
		r23 = memw(r29+#292)
		r0 = memh(r3+#18)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r5,r2)
		r2 = memw(r29+#264)
		r5 = memh(r22+#110)
	}                                       // 4-byte Folded Reload
	{
		r21 += mpyi(r4,r23)
		r4 = memh(r3+#20)
	}
	{
		r20 += mpyi(r6,r2)
		r2 = memw(r29+#316)
		r6 = memh(r1+#74)
	}                                       // 4-byte Folded Reload
	{
		r21 += mpyi(r0,r2)
		r2 = memw(r29+#236)
		r0 = memh(r3+#22)
	}                                       // 4-byte Folded Reload
	{
		r21 += mpyi(r4,r10)
		r4 = memh(r3+#24)
	}
	{
		r19 += mpyi(r7,r2)
		r21 += mpyi(r0,r27)
		r2 = memw(r29+#260)
		r7 = memh(r22+#112)
	}                                       // 4-byte Folded Reload
	{
		r0 = memh(r3+#26)
		r28 = memw(r29+#192)
	}                                       // 4-byte Folded Reload
	{
		r20 += mpyi(r5,r2)
		r2 = memw(r29+#156)
		r5 = memh(r1+#76)
	}                                       // 4-byte Folded Reload
	{
		r27 = memw(r29+#284)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r6,r2)
		r2 = memw(r29+#212)
		r6 = memh(r22+#114)
	}                                       // 4-byte Folded Reload
	{
		r21 += mpyi(r4,r27)
		r24 = memw(r29+#248)
		r4 = memh(r3+#28)
	}                                       // 4-byte Folded Reload
	{
		r20 += mpyi(r7,r2)
		r2 = memw(r29+#112)
		r7 = memh(r1+#78)
	}                                       // 4-byte Folded Reload
	{
		r21 += mpyi(r0,r24)
		r0 = memh(r3+#30)
		r10 = memw(r29+#280)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r5,r2)
		r21 += mpyi(r4,r28)
		r2 = memw(r29+#208)
		r4 = memh(r3+#32)
	}                                       // 4-byte Folded Reload
	{
		r21 += mpyi(r0,r10)
		r5 = memh(r22+#116)
		r0 = memh(r3+#34)
	}
	{
		r20 += mpyi(r6,r2)
		r2 = memw(r29+#232)
		r6 = memh(r1+#80)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r7,r2)
		r2 = memw(r29+#276)
		r7 = memh(r22+#118)
	}                                       // 4-byte Folded Reload
	{
		r21 += mpyi(r4,r2)
		r2 = memw(r29+#204)
		r4 = memh(r3+#36)
	}                                       // 4-byte Folded Reload
	{
		r20 += mpyi(r5,r2)
		r2 = memw(r29+#312)
		r5 = memh(r1+#82)
	}                                       // 4-byte Folded Reload
	{
		r21 += mpyi(r0,r2)
		r2 = memw(r29+#228)
		r0 = memh(r3+#38)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r6,r2)
		r2 = memw(r29+#308)
		r6 = memh(r22+#120)
	}                                       // 4-byte Folded Reload
	{
		r21 += mpyi(r4,r2)
		r2 = memw(r29+#200)
		r4 = memh(r3+#40)
	}                                       // 4-byte Folded Reload
	{
		r20 += mpyi(r7,r2)
		r2 = memw(r29+#272)
		r7 = memh(r1+#84)
	}                                       // 4-byte Folded Reload
	{
		r21 += mpyi(r0,r2)
		r2 = memw(r29+#108)
		r0 = memh(r3+#42)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r5,r2)
		r2 = memw(r29+#304)
		r5 = memh(r22+#122)
	}                                       // 4-byte Folded Reload
	{
		r21 += mpyi(r4,r2)
		r2 = memw(r29+#96)
		r4 = memh(r3+#44)
	}                                       // 4-byte Folded Reload
	{
		r20 += mpyi(r6,r2)
		r2 = memw(r29+#268)
		r6 = memh(r1+#86)
	}                                       // 4-byte Folded Reload
	{
		r20 += mpyi(r5,r9)
		r5 = memh(r1+#88)
	}
	{
		r21 += mpyi(r0,r2)
		r2 = memw(r29+#152)
		r0 = memh(r3+#46)
	}                                       // 4-byte Folded Reload
	{
		r21 += mpyi(r4,r12)
		r27 = memw(r29+#184)
		r4 = memh(r3+#48)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r7,r2)
		r2 = memw(r29+#104)
		r7 = memh(r22+#124)
	}                                       // 4-byte Folded Reload
	{
		r21 += mpyi(r0,r27)
		r0 = memh(r3+#50)
		r12 = memh(r22+#126)
	}
	{
		r19 += mpyi(r6,r2)
		r2 = memw(r29+#244)
		r6 = memh(r3+#56)
	}                                       // 4-byte Folded Reload
	{
		r21 += mpyi(r4,r2)
		r2 = memw(r29+#132)
		r4 = memh(r3+#52)
	}                                       // 4-byte Folded Reload
	{
		r22 = memw(r29+#196)
	}                                       // 4-byte Folded Reload
	{
		r20 += mpyi(r7,r2)
		r2 = memw(r29+#240)
		r7 = memh(r1+#90)
	}                                       // 4-byte Folded Reload
	{
		r20 += mpyi(r12,r13)
	}
	{
		r21 += mpyi(r0,r2)
		r2 = memw(r29+#84)
		r0 = memh(r3+#54)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r5,r2)
		r2 = memw(r29+#180)
		r5 = memh(r3+#58)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r7,r14)
		r7 = memw(r29+#340)
		r14 = memw(r29+#100)
	}                                       // 4-byte Folded Reload
	{
		r21 += mpyi(r4,r2)
		r13 = setbit(r7,#3)
		r4 = memh(r1+#92)
		memw(r29+#36) = r13.new
	}                                       // 4-byte Folded Spill
	{
		r21 += mpyi(r0,r15)
		r7 = asl(r13,#7)
		r0 = memh(r1+#94)
		r2 = memw(r29+#124)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r4,r14)
		r26 = addasl(r22,r13,#7)
		r4 = memh(r22+r7<<#0)
		r7 = memw(r29+#76)
	}                                       // 4-byte Folded Reload
	{
		r12 = memw(r29+#176)
		r15 = memw(r29+#172)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r0,r7)
		r0 = memw(r29+#88)
		r7 = memw(r29+#256)
	}                                       // 4-byte Folded Reload
	{
		r21 += mpyi(r6,r12)
		r6 = memh(r3+#60)
	}
	{
		r21 += mpyi(r5,r2)
		r22 = memw(r0+r13<<#2)
		r0 = memh(r26+#2)
	}
	{
		r22 += mpyi(r4,r7)
		r21 += mpyi(r6,r15)
		r7 = memw(r29+#148)
		r4 = memh(r26+#4)
	}                                       // 4-byte Folded Reload
	{
		r13 = memw(r29+#336)
		r6 = memh(r1+#98)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r8,r7)
		r5 = memh(r3+#62)
		r7 = memh(r3+#64)
	}
	{
		r22 += mpyi(r0,r13)
		r13 = memw(r29+#168)
		r0 = memh(r26+#6)
	}                                       // 4-byte Folded Reload
	{
		r8 = memw(r29+#332)
	}                                       // 4-byte Folded Reload
	{
		r21 += mpyi(r5,r13)
		r5 = memh(r1+#100)
	}
	{
		r22 += mpyi(r4,r8)
		r8 = memw(r29+#224)
		r4 = memh(r26+#8)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r6,r8)
		r8 = memw(r29+#300)
		r6 = memh(r3+#66)
	}                                       // 4-byte Folded Reload
	{
		r9 = memw(r29+#328)
	}                                       // 4-byte Folded Reload
	{
		r22 += mpyi(r0,r8)
		r0 = memh(r26+#10)
		r8 = memw(r29+#120)
	}                                       // 4-byte Folded Reload
	{
		r22 += mpyi(r4,r9)
		r9 = memw(r29+#144)
		r4 = memh(r26+#12)
	}                                       // 4-byte Folded Reload
	{
		r21 += mpyi(r7,r8)
		r7 = memh(r1+#102)
	}
	{
		r19 += mpyi(r5,r9)
		r9 = memw(r29+#324)
		r5 = memh(r3+#68)
	}                                       // 4-byte Folded Reload
	{
		r22 += mpyi(r0,r9)
		r9 = memw(r29+#164)
		r0 = memh(r26+#14)
	}                                       // 4-byte Folded Reload
	{
		r21 += mpyi(r6,r9)
		r9 = memw(r29+#320)
		r6 = memh(r1+#104)
	}                                       // 4-byte Folded Reload
	{
		r22 += mpyi(r4,r9)
		r4 = memh(r26+#16)
		r9 = memw(r29+#140)
	}                                       // 4-byte Folded Reload
	{
		r22 += mpyi(r0,r25)
		r0 = memh(r26+#18)
		r25 = memw(r29+#116)
	}                                       // 4-byte Folded Reload
	{
		r22 += mpyi(r4,r23)
		r19 += mpyi(r7,r9)
		r23 = memw(r29+#220)
		r4 = memh(r26+#20)
	}                                       // 4-byte Folded Reload
	{
		r21 += mpyi(r5,r25)
		r5 = memh(r1+#106)
		r7 = memh(r3+#70)
	}
	{
		r19 += mpyi(r6,r23)
		r23 = memw(r29+#316)
		r6 = memh(r3+#72)
	}                                       // 4-byte Folded Reload
	{
		r22 += mpyi(r0,r23)
		r23 = memw(r29+#160)
		r0 = memh(r26+#22)
	}                                       // 4-byte Folded Reload
	{
		r9 = memw(r29+#288)
	}                                       // 4-byte Folded Reload
	{
		r21 += mpyi(r7,r23)
		r7 = memh(r1+#108)
	}
	{
		r22 += mpyi(r4,r9)
		r9 = memw(r29+#216)
		r4 = memh(r26+#24)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r5,r9)
		r9 = memw(r29+#252)
		r5 = memh(r3+#74)
	}                                       // 4-byte Folded Reload
	{
		r22 += mpyi(r0,r9)
		r9 = memw(r29+#236)
		r0 = memh(r26+#26)
	}                                       // 4-byte Folded Reload
	{
		r21 += mpyi(r6,r9)
		r9 = memw(r29+#284)
		r6 = memh(r1+#110)
	}                                       // 4-byte Folded Reload
	{
		r22 += mpyi(r4,r9)
		r4 = memh(r26+#28)
		r9 = memw(r29+#264)
	}                                       // 4-byte Folded Reload
	{
		r22 += mpyi(r0,r24)
		r24 = memw(r29+#156)
		r0 = memh(r26+#30)
	}                                       // 4-byte Folded Reload
	{
		r22 += mpyi(r4,r28)
		r19 += mpyi(r7,r9)
		r4 = memh(r26+#32)
		r7 = memh(r3+#76)
	}
	{
		r21 += mpyi(r5,r24)
		r22 += mpyi(r0,r10)
		r24 = memw(r29+#260)
		r10 = memw(r29+#112)
	}                                       // 4-byte Folded Reload
	{
		r28 = memw(r29+#276)
		r5 = memh(r1+#112)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r6,r24)
		r21 += mpyi(r7,r10)
		r24 = memw(r29+#212)
		r0 = memh(r26+#34)
	}                                       // 4-byte Folded Reload
	{
		r22 += mpyi(r4,r28)
		r28 = memw(r29+#312)
		r6 = memh(r3+#78)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r5,r24)
		r24 = memw(r29+#232)
		r4 = memh(r26+#36)
	}                                       // 4-byte Folded Reload
	{
		r22 += mpyi(r0,r28)
		r28 = memw(r29+#308)
		r7 = memh(r1+#114)
	}                                       // 4-byte Folded Reload
	{
		r21 += mpyi(r6,r24)
		r24 = memw(r29+#208)
		r0 = memh(r26+#38)
	}                                       // 4-byte Folded Reload
	{
		r22 += mpyi(r4,r28)
		r28 = memw(r29+#272)
		r4 = memh(r26+#40)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r7,r24)
		r24 = memw(r29+#304)
		r6 = memh(r1+#116)
	}                                       // 4-byte Folded Reload
	{
		r22 += mpyi(r0,r28)
		r0 = memh(r26+#42)
		r5 = memh(r3+#80)
	}
	{
		r22 += mpyi(r4,r24)
		r24 = memw(r29+#204)
		r9 = memw(r29+#228)
	}                                       // 4-byte Folded Reload
	{
		r7 = memh(r3+#82)
		r4 = memh(r26+#44)
	}
	{
		r19 += mpyi(r6,r24)
		r21 += mpyi(r5,r9)
		r24 = memw(r29+#268)
		r5 = memh(r1+#118)
	}                                       // 4-byte Folded Reload
	{
		r6 = memh(r3+#84)
	}
	{
		r22 += mpyi(r0,r24)
		r24 = memw(r29+#108)
		r0 = memh(r26+#46)
	}                                       // 4-byte Folded Reload
	{
		r21 += mpyi(r7,r24)
		r24 = memw(r29+#188)
		r7 = memh(r1+#120)
	}                                       // 4-byte Folded Reload
	{
		r22 += mpyi(r4,r24)
		r24 = memw(r29+#200)
		r4 = memh(r26+#48)
	}                                       // 4-byte Folded Reload
	{
		r22 += mpyi(r0,r27)
		r0 = memh(r26+#50)
		r27 = memw(r29+#96)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r5,r24)
		r24 = memw(r29+#152)
		r5 = memh(r3+#86)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r7,r27)
		r27 = memw(r29+#104)
		r7 = memh(r3+#88)
	}                                       // 4-byte Folded Reload
	{
		r21 += mpyi(r6,r24)
		r24 = memw(r29+#244)
		r6 = memh(r1+#122)
	}                                       // 4-byte Folded Reload
	{
		r21 += mpyi(r5,r27)
		r28 = memw(r29+#240)
		r5 = memh(r1+#124)
	}                                       // 4-byte Folded Reload
	{
		r22 += mpyi(r4,r24)
		r4 = memh(r26+#52)
		r24 = memw(r29+#180)
	}                                       // 4-byte Folded Reload
	{
		r22 += mpyi(r0,r28)
		r0 = memh(r26+#54)
		r28 = memw(r29+#84)
	}                                       // 4-byte Folded Reload
	{
		r22 += mpyi(r4,r24)
		r24 = memw(r29+#136)
		r4 = memh(r26+#56)
	}                                       // 4-byte Folded Reload
	{
		r21 += mpyi(r7,r28)
		r7 = memh(r1+#126)
	}
	{
		r19 += mpyi(r6,r24)
		r24 = memw(r29+#128)
		r6 = memh(r3+#90)
	}                                       // 4-byte Folded Reload
	{
		r22 += mpyi(r0,r24)
		r0 = memh(r26+#58)
		r24 = memw(r29+#80)
	}                                       // 4-byte Folded Reload
	{
		r22 += mpyi(r4,r12)
		r4 = memw(r29+#132)
		r1 = memh(r26+#60)
	}                                       // 4-byte Folded Reload
	{
		r22 += mpyi(r0,r2)
		r21 += mpyi(r6,r24)
		r2 = memw(r29+#92)
		r0 = memh(r26+#62)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r5,r4)
		r22 += mpyi(r1,r15)
		r4 = memh(r3+#92)
		r1 = memh(r26+#64)
	}
	{
		r19 += mpyi(r7,r2)
		r22 += mpyi(r0,r13)
		r2 = memw(r29+#76)
		r15 = memw(r29+#196)
	}                                       // 4-byte Folded Reload
	{
		r21 += mpyi(r4,r14)
		r22 += mpyi(r1,r8)
		r4 = memh(r3+#94)
		r6 = memw(r29+#340)
	}                                       // 4-byte Folded Reload
	{
		r12 = or(r6,#9)
		r5 = memh(r26+#66)
		r14 = memw(r29+#88)
	}                                       // 4-byte Folded Reload
	{
		r21 += mpyi(r4,r2)
		r1 = addasl(r15,r12,#7)
		r4 = memw(r29+#164)
		r6 = memh(r26+#68)
	}                                       // 4-byte Folded Reload
	{
		r7 = asl(r12,#7)
		r8 = memh(r26+#70)
		memw(r29+#32) = r12
	}                                       // 4-byte Folded Spill
	{
		r22 += mpyi(r5,r4)
		r4 = memh(r15+r7<<#0)
		r7 = memw(r29+#256)
	}                                       // 4-byte Folded Reload
	{
		r22 += mpyi(r6,r25)
		r25 = memw(r14+r12<<#2)
		r12 = memw(r29+#148)
	}                                       // 4-byte Folded Reload
	{
		r25 += mpyi(r4,r7)
		r22 += mpyi(r8,r23)
		r6 = memh(r1+#2)
		r13 = memw(r29+#336)
	}                                       // 4-byte Folded Reload
	{
		r15 = memw(r29+#332)
		r4 = memh(r1+#4)
	}                                       // 4-byte Folded Reload
	{
		r25 += mpyi(r6,r13)
		r23 = memw(r29+#236)
		r0 = memh(r3+#96)
	}                                       // 4-byte Folded Reload
	{
		r25 += mpyi(r4,r15)
		r6 = memh(r1+#6)
		r13 = memw(r29+#300)
	}                                       // 4-byte Folded Reload
	{
		r21 += mpyi(r0,r12)
		r5 = memh(r3+#98)
		r8 = memw(r29+#224)
	}                                       // 4-byte Folded Reload
	{
		r25 += mpyi(r6,r13)
		r4 = memh(r1+#8)
		r15 = memw(r29+#328)
	}                                       // 4-byte Folded Reload
	{
		r21 += mpyi(r5,r8)
		r0 = memh(r26+#72)
		r6 = memh(r1+#10)
	}
	{
		r25 += mpyi(r4,r15)
		r5 = memh(r26+#74)
		r15 = memw(r29+#156)
	}                                       // 4-byte Folded Reload
	{
		r22 += mpyi(r0,r23)
		r7 = memh(r3+#100)
		r23 = memw(r29+#144)
	}                                       // 4-byte Folded Reload
	{
		r22 += mpyi(r5,r15)
		r15 = memw(r29+#324)
		r0 = memh(r3+#102)
	}                                       // 4-byte Folded Reload
	{
		r21 += mpyi(r7,r23)
		r7 = memh(r26+#76)
		r4 = memh(r1+#12)
	}
	{
		r25 += mpyi(r6,r15)
		r15 = memw(r29+#140)
		r6 = memh(r1+#14)
	}                                       // 4-byte Folded Reload
	{
		r22 += mpyi(r7,r10)
		r10 = memw(r29+#296)
		r5 = memh(r3+#104)
	}                                       // 4-byte Folded Reload
	{
		r21 += mpyi(r0,r15)
		r15 = memw(r29+#320)
		r0 = memh(r26+#78)
	}                                       // 4-byte Folded Reload
	{
		r7 = memh(r3+#106)
	}
	{
		r25 += mpyi(r4,r15)
		r4 = memh(r1+#16)
		r15 = memw(r29+#292)
	}                                       // 4-byte Folded Reload
	{
		r25 += mpyi(r6,r10)
		r10 = memw(r29+#220)
		r6 = memh(r1+#18)
	}                                       // 4-byte Folded Reload
	{
		r25 += mpyi(r4,r15)
		r15 = memw(r29+#232)
		r4 = memh(r1+#20)
	}                                       // 4-byte Folded Reload
	{
		r21 += mpyi(r5,r10)
		r5 = memh(r26+#80)
	}
	{
		r22 += mpyi(r0,r15)
		r15 = memw(r29+#316)
		r0 = memh(r3+#108)
	}                                       // 4-byte Folded Reload
	{
		r22 += mpyi(r5,r9)
		r5 = memh(r3+#110)
	}
	{
		r25 += mpyi(r6,r15)
		r15 = memw(r29+#216)
		r6 = memh(r1+#22)
	}                                       // 4-byte Folded Reload
	{
		r13 = memw(r29+#252)
	}                                       // 4-byte Folded Reload
	{
		r21 += mpyi(r7,r15)
		r15 = memw(r29+#288)
		r7 = memh(r26+#82)
	}                                       // 4-byte Folded Reload
	{
		r25 += mpyi(r4,r15)
		r15 = memw(r29+#264)
		r4 = memh(r1+#24)
	}                                       // 4-byte Folded Reload
	{
		r25 += mpyi(r6,r13)
		r13 = memw(r29+#284)
		r6 = memh(r1+#26)
	}                                       // 4-byte Folded Reload
	{
		r21 += mpyi(r0,r15)
		r15 = memw(r29+#108)
		r0 = memh(r26+#84)
	}                                       // 4-byte Folded Reload
	{
		r25 += mpyi(r4,r13)
		r13 = memw(r29+#248)
		r4 = memh(r1+#28)
	}                                       // 4-byte Folded Reload
	{
		r22 += mpyi(r7,r15)
		r15 = memw(r29+#260)
		r7 = memh(r3+#112)
	}                                       // 4-byte Folded Reload
	{
		r25 += mpyi(r6,r13)
		r13 = memw(r29+#192)
		r6 = memh(r1+#30)
	}                                       // 4-byte Folded Reload
	{
		r21 += mpyi(r5,r15)
		r15 = memw(r29+#152)
		r5 = memh(r26+#86)
	}                                       // 4-byte Folded Reload
	{
		r25 += mpyi(r4,r13)
		r13 = memw(r29+#280)
		r4 = memh(r1+#32)
	}                                       // 4-byte Folded Reload
	{
		r22 += mpyi(r0,r15)
		r0 = memh(r3+#114)
	}
	{
		r25 += mpyi(r6,r13)
		r22 += mpyi(r5,r27)
		r13 = memw(r29+#212)
		r6 = memh(r1+#34)
	}                                       // 4-byte Folded Reload
	{
		r15 = memw(r29+#276)
		r5 = memh(r3+#116)
	}                                       // 4-byte Folded Reload
	{
		r21 += mpyi(r7,r13)
		r7 = memh(r26+#88)
	}
	{
		r25 += mpyi(r4,r15)
		r15 = memw(r29+#312)
		r4 = memh(r1+#36)
	}                                       // 4-byte Folded Reload
	{
		r22 += mpyi(r7,r28)
		r7 = memh(r3+#118)
	}
	{
		r25 += mpyi(r6,r15)
		r15 = memw(r29+#208)
		r6 = memh(r1+#38)
	}                                       // 4-byte Folded Reload
	{
		r27 = memw(r29+#308)
		r28 = memw(r29+#272)
	}                                       // 4-byte Folded Reload
	{
		r21 += mpyi(r0,r15)
		r0 = memh(r26+#90)
	}
	{
		r25 += mpyi(r4,r27)
		r27 = memw(r29+#204)
		r4 = memh(r1+#40)
	}                                       // 4-byte Folded Reload
	{
		r25 += mpyi(r6,r28)
		r22 += mpyi(r0,r24)
		r28 = memw(r29+#304)
		r6 = memh(r1+#42)
	}                                       // 4-byte Folded Reload
	{
		r21 += mpyi(r5,r27)
		r27 = memw(r29+#268)
		r24 = memw(r29+#188)
	}                                       // 4-byte Folded Reload
	{
		r25 += mpyi(r4,r28)
		r28 = memw(r29+#200)
		r4 = memh(r1+#44)
	}                                       // 4-byte Folded Reload
	{
		r25 += mpyi(r6,r27)
		r5 = memh(r26+#92)
		r27 = memw(r29+#100)
	}                                       // 4-byte Folded Reload
	{
		r21 += mpyi(r7,r28)
		r25 += mpyi(r4,r24)
		r6 = memh(r1+#46)
		r28 = memw(r29+#184)
	}                                       // 4-byte Folded Reload
	{
		r22 += mpyi(r5,r27)
		r7 = memh(r26+#94)
		r4 = memh(r1+#48)
	}
	{
		r25 += mpyi(r6,r28)
		r24 = memw(r29+#244)
		r6 = memh(r1+#50)
	}                                       // 4-byte Folded Reload
	{
		r22 += mpyi(r7,r2)
		r28 = memw(r29+#240)
		r27 = memw(r29+#96)
	}                                       // 4-byte Folded Reload
	{
		r25 += mpyi(r4,r24)
		r4 = memh(r1+#52)
		r2 = memw(r29+#180)
	}                                       // 4-byte Folded Reload
	{
		r25 += mpyi(r6,r28)
		r0 = memh(r3+#120)
		r6 = memh(r1+#54)
	}
	{
		r25 += mpyi(r4,r2)
		r2 = memw(r29+#128)
		r5 = memh(r3+#122)
	}                                       // 4-byte Folded Reload
	{
		r21 += mpyi(r0,r27)
		r9 = memw(r29+#136)
		r7 = memh(r3+#124)
	}                                       // 4-byte Folded Reload
	{
		r25 += mpyi(r6,r2)
		r2 = memw(r29+#132)
		r4 = memh(r1+#56)
	}                                       // 4-byte Folded Reload
	{
		r21 += mpyi(r5,r9)
		r0 = memh(r26+#96)
	}
	{
		r21 += mpyi(r7,r2)
		r7 = memw(r29+#176)
		r5 = memh(r26+#98)
	}                                       // 4-byte Folded Reload
	{
		r22 += mpyi(r0,r12)
		r0 = memh(r3+#126)
		r6 = memh(r26+#100)
	}
	{
		r25 += mpyi(r4,r7)
		r22 += mpyi(r5,r8)
		r7 = memw(r29+#124)
		r3 = memh(r1+#58)
	}                                       // 4-byte Folded Reload
	{
		r22 += mpyi(r6,r23)
		r24 = memw(r29+#92)
		r6 = memw(r29+#340)
	}                                       // 4-byte Folded Reload
	{
		r25 += mpyi(r3,r7)
		r28 = or(r6,#10)
		r4 = memh(r1+#60)
		r5 = memh(r1+#64)
	}
	{
		r21 += mpyi(r0,r24)
		r7 = asl(r28,#7)
		r0 = memw(r29+#56)
		r3 = memh(r1+#62)
	}                                       // 4-byte Folded Reload
	{
		memw(r29+#56) = r28
	}                                       // 4-byte Folded Spill
	{
		r0 = memw(r29+#172)
		memw(r14+r0<<#2) = r16
	}                                       // 4-byte Folded Reload
	{
		r6 = memw(r29+#168)
		r16 = memw(r29+#196)
	}                                       // 4-byte Folded Reload
	{
		r25 += mpyi(r4,r0)
		r4 = memh(r26+#102)
		r23 = memw(r29+#140)
	}                                       // 4-byte Folded Reload
	{
		r25 += mpyi(r3,r6)
		r3 = addasl(r16,r28,#7)
		r6 = memh(r1+#66)
		r0 = memh(r26+#104)
	}
	{
		r22 += mpyi(r4,r23)
		r4 = memw(r29+#120)
		r23 = memw(r14+r28<<#2)
	}                                       // 4-byte Folded Reload
	{
		r22 += mpyi(r0,r10)
		r8 = memh(r1+#68)
		r28 = memw(r29+#216)
	}                                       // 4-byte Folded Reload
	{
		r25 += mpyi(r5,r4)
		r4 = memh(r16+r7<<#0)
		r7 = memw(r29+#164)
	}                                       // 4-byte Folded Reload
	{
		r5 = memh(r26+#106)
		r10 = memw(r29+#332)
	}                                       // 4-byte Folded Reload
	{
		r25 += mpyi(r6,r7)
		r7 = memw(r29+#256)
		r6 = memh(r3+#2)
	}                                       // 4-byte Folded Reload
	{
		r22 += mpyi(r5,r28)
		r0 = memh(r1+#70)
		r16 = memw(r29+#160)
	}                                       // 4-byte Folded Reload
	{
		r23 += mpyi(r4,r7)
		r4 = memh(r3+#4)
		r7 = memw(r29+#116)
	}                                       // 4-byte Folded Reload
	{
		r12 = memw(r29+#336)
		r5 = memh(r1+#72)
	}                                       // 4-byte Folded Reload
	{
		r25 += mpyi(r8,r7)
		r7 = memh(r26+#108)
		r8 = memh(r3+#64)
	}
	{
		r23 += mpyi(r6,r12)
		r25 += mpyi(r0,r16)
		r12 = memw(r29+#300)
		r6 = memh(r3+#6)
	}                                       // 4-byte Folded Reload
	{
		r23 += mpyi(r4,r10)
		r28 = memw(r29+#264)
		r4 = memh(r3+#8)
	}                                       // 4-byte Folded Reload
	{
		r23 += mpyi(r6,r12)
		r16 = memw(r29+#328)
		r6 = memh(r3+#10)
	}                                       // 4-byte Folded Reload
	{
		r22 += mpyi(r7,r28)
		r12 = memw(r29+#324)
		r10 = memw(r29+#236)
	}                                       // 4-byte Folded Reload
	{
		r23 += mpyi(r4,r16)
		r0 = memh(r26+#110)
		r28 = memw(r29+#260)
	}                                       // 4-byte Folded Reload
	{
		r23 += mpyi(r6,r12)
		r25 += mpyi(r5,r10)
		r7 = memh(r1+#74)
		r12 = memw(r29+#156)
	}                                       // 4-byte Folded Reload
	{
		r22 += mpyi(r0,r28)
		r4 = memh(r3+#12)
		r10 = memw(r29+#320)
	}                                       // 4-byte Folded Reload
	{
		r25 += mpyi(r7,r12)
		r5 = memh(r26+#112)
		r6 = memh(r3+#14)
	}
	{
		r23 += mpyi(r4,r10)
		r0 = memh(r1+#76)
		r28 = memw(r29+#296)
	}                                       // 4-byte Folded Reload
	{
		r22 += mpyi(r5,r13)
		r12 = memw(r29+#112)
		r7 = memh(r26+#114)
	}                                       // 4-byte Folded Reload
	{
		r23 += mpyi(r6,r28)
		r10 = memw(r29+#292)
		r4 = memh(r3+#16)
	}                                       // 4-byte Folded Reload
	{
		r25 += mpyi(r0,r12)
		r22 += mpyi(r7,r15)
		r12 = memw(r29+#316)
		r6 = memh(r3+#18)
	}                                       // 4-byte Folded Reload
	{
		r23 += mpyi(r4,r10)
		r15 = memw(r29+#232)
		r5 = memh(r1+#78)
	}                                       // 4-byte Folded Reload
	{
		r23 += mpyi(r6,r12)
		r4 = memh(r3+#20)
		r13 = memw(r29+#288)
	}                                       // 4-byte Folded Reload
	{
		r25 += mpyi(r5,r15)
		r0 = memh(r26+#116)
		r10 = memw(r29+#204)
	}                                       // 4-byte Folded Reload
	{
		r23 += mpyi(r4,r13)
		r6 = memh(r3+#22)
		r28 = memw(r29+#252)
	}                                       // 4-byte Folded Reload
	{
		r22 += mpyi(r0,r10)
		r7 = memh(r1+#80)
		r15 = memw(r29+#228)
	}                                       // 4-byte Folded Reload
	{
		r23 += mpyi(r6,r28)
		r4 = memh(r3+#24)
		r13 = memw(r29+#284)
	}                                       // 4-byte Folded Reload
	{
		r25 += mpyi(r7,r15)
		r5 = memh(r26+#118)
		r10 = memw(r29+#200)
	}                                       // 4-byte Folded Reload
	{
		r23 += mpyi(r4,r13)
		r6 = memh(r3+#26)
		r28 = memw(r29+#248)
	}                                       // 4-byte Folded Reload
	{
		r22 += mpyi(r5,r10)
		r4 = memh(r3+#28)
		r7 = memh(r26+#120)
	}
	{
		r23 += mpyi(r6,r28)
		r13 = memw(r29+#192)
		r0 = memh(r1+#82)
	}                                       // 4-byte Folded Reload
	{
		r22 += mpyi(r7,r27)
		r15 = memw(r29+#108)
		r28 = memw(r29+#280)
	}                                       // 4-byte Folded Reload
	{
		r23 += mpyi(r4,r13)
		r6 = memh(r3+#30)
		r5 = memh(r1+#84)
	}
	{
		r25 += mpyi(r0,r15)
		r27 = memw(r29+#152)
		r10 = memw(r29+#276)
	}                                       // 4-byte Folded Reload
	{
		r23 += mpyi(r6,r28)
		r4 = memh(r3+#32)
		r0 = memh(r26+#122)
	}
	{
		r25 += mpyi(r5,r27)
		r6 = memh(r3+#34)
		r13 = memw(r29+#312)
	}                                       // 4-byte Folded Reload
	{
		r23 += mpyi(r4,r10)
		r22 += mpyi(r0,r9)
		r15 = memw(r29+#308)
		r5 = memh(r26+#124)
	}                                       // 4-byte Folded Reload
	{
		r23 += mpyi(r6,r13)
		r4 = memh(r3+#36)
		r10 = memw(r29+#272)
	}                                       // 4-byte Folded Reload
	{
		r22 += mpyi(r5,r2)
		r6 = memh(r3+#38)
		r2 = memw(r29+#304)
	}                                       // 4-byte Folded Reload
	{
		r23 += mpyi(r4,r15)
		r4 = memh(r3+#40)
		r7 = memh(r1+#86)
	}
	{
		r23 += mpyi(r6,r10)
		r28 = memw(r29+#104)
		r0 = memh(r1+#88)
	}                                       // 4-byte Folded Reload
	{
		r23 += mpyi(r4,r2)
		r2 = memw(r29+#84)
		r5 = memh(r1+#90)
	}                                       // 4-byte Folded Reload
	{
		r25 += mpyi(r7,r28)
		r26 = r14
		r6 = memh(r3+#42)
		r7 = memh(r26+#126)
	}
	{
		r25 += mpyi(r0,r2)
		r2 = memw(r29+#60)
		r0 = memw(r29+#72)
	}                                       // 4-byte Folded Reload
	{
		r22 += mpyi(r7,r24)
		r4 = memh(r3+#44)
	}
	{
		r2 = memw(r29+#80)
		memw(r14+r2<<#2) = r11
	}                                       // 4-byte Folded Reload
	{
		r0 = memw(r29+#268)
		memw(r14+r0<<#2) = r17
	}                                       // 4-byte Folded Reload
	{
		r25 += mpyi(r5,r2)
		r2 = memw(r29+#188)
		r7 = memw(r29+#340)
	}                                       // 4-byte Folded Reload
	{
		r23 += mpyi(r6,r0)
		r27 = or(r7,#11)
		r0 = memh(r3+#46)
		memw(r29+#60) = r27.new
	}                                       // 4-byte Folded Spill
	{
		r23 += mpyi(r4,r2)
		r11 = asl(r27,#7)
		r2 = memw(r29+#196)
		r5 = memh(r1+#92)
	}                                       // 4-byte Folded Reload
	{
		r10 = memw(r29+#184)
		r24 = memw(r29+#100)
	}                                       // 4-byte Folded Reload
	{
		r4 = memh(r1+#94)
		r6 = memh(r3+#48)
	}
	{
		r23 += mpyi(r0,r10)
		r0 = addasl(r2,r27,#7)
		r28 = memw(r29+#244)
		r7 = memh(r3+#50)
	}                                       // 4-byte Folded Reload
	{
		r25 += mpyi(r5,r24)
		r5 = memh(r2+r11<<#0)
		r2 = memw(r29+#76)
	}                                       // 4-byte Folded Reload
	{
		r23 += mpyi(r6,r28)
		r13 = memw(r29+#240)
		r27 = memw(r26+r27<<#2)
	}                                       // 4-byte Folded Reload
	{
		r25 += mpyi(r4,r2)
		r2 = memw(r29+#256)
		r15 = memw(r29+#180)
	}                                       // 4-byte Folded Reload
	{
		r23 += mpyi(r7,r13)
		r7 = memh(r0+#2)
		r6 = memh(r1+#96)
	}
	{
		r27 += mpyi(r5,r2)
		r2 = memw(r29+#336)
		r5 = memh(r0+#4)
	}                                       // 4-byte Folded Reload
	{
		r14 = memw(r29+#128)
		r26 = memh(r1+#98)
	}                                       // 4-byte Folded Reload
	{
		r27 += mpyi(r7,r2)
		r2 = memw(r29+#148)
		r7 = memh(r0+#6)
	}                                       // 4-byte Folded Reload
	{
		r17 = memh(r3+#52)
		r9 = memw(r29+#176)
	}                                       // 4-byte Folded Reload
	{
		r25 += mpyi(r6,r2)
		r2 = memw(r29+#332)
		r4 = memh(r3+#54)
	}                                       // 4-byte Folded Reload
	{
		r23 += mpyi(r17,r15)
		r6 = memh(r3+#56)
		r17 = memh(r1+#104)
	}
	{
		r27 += mpyi(r5,r2)
		r23 += mpyi(r4,r14)
		r2 = memw(r29+#300)
		r5 = memh(r0+#8)
	}                                       // 4-byte Folded Reload
	{
		r23 += mpyi(r6,r9)
		r4 = memh(r1+#100)
		r11 = memh(r3+#58)
	}
	{
		r27 += mpyi(r7,r2)
		r2 = memw(r29+#224)
		r7 = memh(r0+#10)
	}                                       // 4-byte Folded Reload
	{
		r27 += mpyi(r5,r16)
		r5 = memh(r0+#12)
		r6 = memh(r1+#102)
	}
	{
		r25 += mpyi(r26,r2)
		r2 = memw(r29+#324)
		r16 = memw(r29+#124)
	}                                       // 4-byte Folded Reload
	{
		r27 += mpyi(r7,r2)
		r23 += mpyi(r11,r16)
		r2 = memw(r29+#144)
		r7 = memh(r0+#14)
	}                                       // 4-byte Folded Reload
	{
		r25 += mpyi(r4,r2)
		r2 = memw(r29+#320)
		r4 = memh(r3+#60)
	}                                       // 4-byte Folded Reload
	{
		r27 += mpyi(r5,r2)
		r2 = memw(r29+#296)
		r5 = memh(r0+#16)
	}                                       // 4-byte Folded Reload
	{
		r27 += mpyi(r7,r2)
		r2 = memw(r29+#140)
		r7 = memh(r0+#18)
	}                                       // 4-byte Folded Reload
	{
		r24 = memw(r29+#172)
	}                                       // 4-byte Folded Reload
	{
		r25 += mpyi(r6,r2)
		r2 = memw(r29+#292)
		r6 = memh(r3+#62)
	}                                       // 4-byte Folded Reload
	{
		r23 += mpyi(r4,r24)
		r4 = memh(r1+#106)
	}
	{
		r27 += mpyi(r5,r2)
		r2 = memw(r29+#220)
		r5 = memh(r0+#20)
	}                                       // 4-byte Folded Reload
	{
		r27 += mpyi(r7,r12)
		r26 = memw(r29+#252)
		r7 = memh(r0+#22)
	}                                       // 4-byte Folded Reload
	{
		r25 += mpyi(r17,r2)
		r11 = memw(r29+#216)
		r2 = memw(r29+#288)
	}                                       // 4-byte Folded Reload
	{
		r17 = memw(r29+#284)
	}                                       // 4-byte Folded Reload
	{
		r27 += mpyi(r5,r2)
		r25 += mpyi(r4,r11)
		r2 = memw(r29+#168)
		r5 = memh(r0+#24)
	}                                       // 4-byte Folded Reload
	{
		r27 += mpyi(r7,r26)
		r12 = memw(r29+#120)
		r7 = memh(r0+#26)
	}                                       // 4-byte Folded Reload
	{
		r27 += mpyi(r5,r17)
		r23 += mpyi(r6,r2)
		r26 = memw(r29+#248)
		r6 = memh(r1+#108)
	}                                       // 4-byte Folded Reload
	{
		r23 += mpyi(r8,r12)
		r17 = memw(r29+#264)
		r5 = memh(r0+#28)
	}                                       // 4-byte Folded Reload
	{
		r27 += mpyi(r7,r26)
		r26 = memw(r29+#192)
		r7 = memh(r0+#30)
	}                                       // 4-byte Folded Reload
	{
		r25 += mpyi(r6,r17)
		r17 = memw(r29+#280)
		r8 = memh(r1+#110)
	}                                       // 4-byte Folded Reload
	{
		r27 += mpyi(r5,r26)
		r26 = memw(r29+#164)
		r5 = memh(r0+#32)
	}                                       // 4-byte Folded Reload
	{
		r27 += mpyi(r7,r17)
		r17 = memw(r29+#260)
		r4 = memh(r3+#66)
	}                                       // 4-byte Folded Reload
	{
		r7 = memh(r0+#34)
		r11 = memw(r29+#312)
	}                                       // 4-byte Folded Reload
	{
		r25 += mpyi(r8,r17)
		r23 += mpyi(r4,r26)
		r17 = memw(r29+#276)
		r4 = memh(r1+#112)
	}                                       // 4-byte Folded Reload
	{
		r6 = memh(r3+#68)
	}
	{
		r27 += mpyi(r5,r17)
		r17 = memw(r29+#116)
		r5 = memh(r0+#36)
	}                                       // 4-byte Folded Reload
	{
		r27 += mpyi(r7,r11)
		r11 = memw(r29+#212)
		r8 = memh(r3+#70)
	}                                       // 4-byte Folded Reload
	{
		r23 += mpyi(r6,r17)
		r7 = memh(r0+#38)
		r6 = memh(r1+#114)
	}
	{
		r25 += mpyi(r4,r11)
		r11 = memw(r29+#308)
		r4 = memh(r3+#72)
	}                                       // 4-byte Folded Reload
	{
		r27 += mpyi(r5,r11)
		r11 = memw(r29+#160)
		r5 = memh(r0+#40)
	}                                       // 4-byte Folded Reload
	{
		r23 += mpyi(r8,r11)
		r11 = memw(r29+#272)
		r8 = memh(r1+#116)
	}                                       // 4-byte Folded Reload
	{
		r27 += mpyi(r7,r11)
		r11 = memw(r29+#208)
		r7 = memh(r0+#42)
	}                                       // 4-byte Folded Reload
	{
		r25 += mpyi(r6,r11)
		r11 = memw(r29+#304)
		r6 = memh(r3+#74)
	}                                       // 4-byte Folded Reload
	{
		r27 += mpyi(r5,r11)
		r11 = memw(r29+#236)
		r5 = memh(r0+#44)
	}                                       // 4-byte Folded Reload
	{
		r23 += mpyi(r4,r11)
		r11 = memw(r29+#268)
		r4 = memh(r1+#118)
	}                                       // 4-byte Folded Reload
	{
		r27 += mpyi(r7,r11)
		r11 = memw(r29+#204)
		r7 = memh(r0+#46)
	}                                       // 4-byte Folded Reload
	{
		r25 += mpyi(r8,r11)
		r11 = memw(r29+#188)
		r8 = memh(r3+#76)
	}                                       // 4-byte Folded Reload
	{
		r27 += mpyi(r5,r11)
		r5 = memh(r0+#48)
		r11 = memw(r29+#156)
	}                                       // 4-byte Folded Reload
	{
		r27 += mpyi(r7,r10)
		r7 = memh(r0+#50)
		r10 = memw(r29+#200)
	}                                       // 4-byte Folded Reload
	{
		r27 += mpyi(r5,r28)
		r23 += mpyi(r6,r11)
		r5 = memh(r0+#52)
		r11 = memw(r29+#112)
	}                                       // 4-byte Folded Reload
	{
		r27 += mpyi(r7,r13)
		r25 += mpyi(r4,r10)
		r6 = memh(r1+#120)
		r28 = memw(r29+#96)
	}                                       // 4-byte Folded Reload
	{
		r27 += mpyi(r5,r15)
		r23 += mpyi(r8,r11)
		r7 = memh(r0+#54)
		r15 = memw(r29+#232)
	}                                       // 4-byte Folded Reload
	{
		r25 += mpyi(r6,r28)
		r4 = memh(r3+#78)
		r5 = memh(r0+#56)
	}
	{
		r27 += mpyi(r7,r14)
		r6 = memh(r3+#80)
		r8 = memh(r1+#122)
	}
	{
		r27 += mpyi(r5,r9)
		r23 += mpyi(r4,r15)
		r7 = memh(r0+#58)
		r28 = memw(r29+#228)
	}                                       // 4-byte Folded Reload
	{
		r10 = memw(r29+#136)
		r4 = memh(r1+#124)
	}                                       // 4-byte Folded Reload
	{
		r27 += mpyi(r7,r16)
		r23 += mpyi(r6,r28)
		r5 = memh(r0+#60)
		r6 = memh(r1+#126)
	}
	{
		r25 += mpyi(r8,r10)
		r1 = memh(r0+#62)
		r7 = memw(r29+#132)
	}                                       // 4-byte Folded Reload
	{
		r27 += mpyi(r5,r24)
		r10 = memw(r29+#88)
		r13 = memh(r3+#82)
	}                                       // 4-byte Folded Reload
	{
		r27 += mpyi(r1,r2)
		r25 += mpyi(r4,r7)
		r2 = memw(r29+#92)
		r14 = memw(r29+#108)
	}                                       // 4-byte Folded Reload
	{
		r16 = r10
		r7 = memw(r29+#52)
		r5 = memh(r0+#64)
	}                                       // 4-byte Folded Reload
	{
		r25 += mpyi(r6,r2)
		r23 += mpyi(r13,r14)
		r2 = memw(r29+#44)
		r4 = memh(r3+#84)
	}                                       // 4-byte Folded Reload
	{
		r27 += mpyi(r5,r12)
		r13 = memw(r29+#152)
		memw(r10+r7<<#2) = r18
	}                                       // 4-byte Folded Reload
	{
		r7 = memw(r29+#340)
		memw(r10+r2<<#2) = r20
	}                                       // 4-byte Folded Reload
	{
		r23 += mpyi(r4,r13)
		r18 = or(r7,#12)
		r1 = memh(r0+#66)
		r5 = memh(r3+#86)
	}
	{
		r24 = asl(r18,#7)
		r2 = memw(r29+#104)
		r20 = memw(r29+#196)
	}                                       // 4-byte Folded Reload
	{
		r27 += mpyi(r1,r26)
		r1 = addasl(r20,r18,#7)
		r6 = memh(r0+#68)
		r4 = memh(r3+#88)
	}
	{
		r23 += mpyi(r5,r2)
		r12 = memw(r29+#84)
		memw(r29+#72) = r18
	}                                       // 4-byte Folded Reload
	{
		r27 += mpyi(r6,r17)
		r5 = memh(r20+r24<<#0)
		r20 = memw(r29+#160)
	}                                       // 4-byte Folded Reload
	{
		r23 += mpyi(r4,r12)
		r17 = memw(r16+r18<<#2)
		r18 = memw(r29+#256)
	}                                       // 4-byte Folded Reload
	{
		r26 = memh(r3+#90)
		r28 = memw(r29+#80)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r5,r18)
		r4 = memh(r1+#2)
		r18 = memw(r29+#236)
	}                                       // 4-byte Folded Reload
	{
		r23 += mpyi(r26,r28)
		r26 = memw(r29+#336)
		r10 = memw(r29+#332)
	}                                       // 4-byte Folded Reload
	{
		r5 = memh(r1+#4)
		r7 = memh(r0+#70)
	}
	{
		r17 += mpyi(r4,r26)
		r4 = memh(r1+#6)
		r16 = memw(r29+#300)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r5,r10)
		r27 += mpyi(r7,r20)
		r6 = memh(r0+#72)
		r10 = memw(r29+#100)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r4,r16)
		r24 = memh(r0+#74)
		r16 = memw(r29+#156)
	}                                       // 4-byte Folded Reload
	{
		r27 += mpyi(r6,r18)
		r7 = memh(r3+#92)
		r5 = memh(r1+#8)
	}
	{
		r27 += mpyi(r24,r16)
		r24 = memw(r29+#328)
		r6 = memh(r3+#94)
	}                                       // 4-byte Folded Reload
	{
		r23 += mpyi(r7,r10)
		r7 = memh(r0+#76)
		r4 = memh(r1+#10)
	}
	{
		r17 += mpyi(r5,r24)
		r24 = memw(r29+#76)
		r26 = memw(r29+#324)
	}                                       // 4-byte Folded Reload
	{
		r27 += mpyi(r7,r11)
		r5 = memh(r1+#12)
		r11 = memw(r29+#320)
	}                                       // 4-byte Folded Reload
	{
		r23 += mpyi(r6,r24)
		r17 += mpyi(r4,r26)
		r6 = memh(r0+#78)
		r4 = memh(r1+#14)
	}
	{
		r17 += mpyi(r5,r11)
		r26 = memw(r29+#296)
		r5 = memh(r1+#16)
	}                                       // 4-byte Folded Reload
	{
		r27 += mpyi(r6,r15)
		r15 = memw(r29+#292)
		r8 = memh(r3+#96)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r4,r26)
		r11 = memw(r29+#148)
		r26 = memw(r29+#316)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r5,r15)
		r4 = memh(r1+#18)
		r15 = memw(r29+#224)
	}                                       // 4-byte Folded Reload
	{
		r23 += mpyi(r8,r11)
		r8 = memh(r0+#80)
		r7 = memh(r3+#98)
	}
	{
		r17 += mpyi(r4,r26)
		r26 = memw(r29+#228)
		r5 = memh(r1+#20)
	}                                       // 4-byte Folded Reload
	{
		r23 += mpyi(r7,r15)
		r6 = memh(r3+#100)
		r7 = memh(r0+#82)
	}
	{
		r27 += mpyi(r8,r26)
		r26 = memw(r29+#288)
		r4 = memh(r1+#22)
	}                                       // 4-byte Folded Reload
	{
		r27 += mpyi(r7,r14)
		r9 = memw(r29+#252)
		r8 = memh(r3+#102)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r5,r26)
		r26 = memw(r29+#144)
		r5 = memh(r1+#24)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r4,r9)
		r14 = memw(r29+#284)
		r4 = memh(r1+#26)
	}                                       // 4-byte Folded Reload
	{
		r23 += mpyi(r6,r26)
		r6 = memh(r0+#84)
		r9 = memw(r29+#248)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r5,r14)
		r14 = memw(r29+#140)
		r5 = memh(r1+#28)
	}                                       // 4-byte Folded Reload
	{
		r27 += mpyi(r6,r13)
		r17 += mpyi(r4,r9)
		r13 = memw(r29+#192)
		r4 = memh(r1+#30)
	}                                       // 4-byte Folded Reload
	{
		r23 += mpyi(r8,r14)
		r8 = memh(r0+#86)
		r7 = memh(r3+#104)
	}
	{
		r17 += mpyi(r5,r13)
		r13 = memw(r29+#220)
		r5 = memh(r1+#32)
	}                                       // 4-byte Folded Reload
	{
		r27 += mpyi(r8,r2)
		r9 = memw(r29+#280)
		r2 = memw(r29+#276)
	}                                       // 4-byte Folded Reload
	{
		r23 += mpyi(r7,r13)
		r6 = memh(r3+#106)
		r7 = memh(r0+#88)
	}
	{
		r17 += mpyi(r4,r9)
		r9 = memw(r29+#216)
		r4 = memh(r1+#34)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r5,r2)
		r27 += mpyi(r7,r12)
		r2 = memw(r29+#312)
		r5 = memh(r1+#36)
	}                                       // 4-byte Folded Reload
	{
		r23 += mpyi(r6,r9)
		r6 = memh(r0+#90)
		r8 = memh(r3+#108)
	}
	{
		r17 += mpyi(r4,r2)
		r2 = memw(r29+#308)
		r4 = memh(r1+#38)
	}                                       // 4-byte Folded Reload
	{
		r27 += mpyi(r6,r28)
		r12 = memw(r29+#272)
		r7 = memh(r3+#110)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r5,r2)
		r2 = memw(r29+#264)
		r5 = memh(r1+#40)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r4,r12)
		r28 = memw(r29+#304)
		r4 = memh(r1+#42)
	}                                       // 4-byte Folded Reload
	{
		r23 += mpyi(r8,r2)
		r8 = memh(r0+#92)
		r12 = memw(r29+#268)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r5,r28)
		r28 = memw(r29+#260)
		r5 = memh(r1+#44)
	}                                       // 4-byte Folded Reload
	{
		r27 += mpyi(r8,r10)
		r17 += mpyi(r4,r12)
		r10 = memw(r29+#188)
		r4 = memh(r1+#46)
	}                                       // 4-byte Folded Reload
	{
		r23 += mpyi(r7,r28)
		r7 = memh(r0+#94)
		r12 = memw(r29+#212)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r5,r10)
		r10 = memw(r29+#184)
		r5 = memh(r1+#48)
	}                                       // 4-byte Folded Reload
	{
		r27 += mpyi(r7,r24)
		r24 = memw(r29+#244)
		r6 = memh(r3+#112)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r4,r10)
		r4 = memh(r1+#50)
		r8 = memh(r3+#114)
	}
	{
		r17 += mpyi(r5,r24)
		r23 += mpyi(r6,r12)
		r24 = memw(r29+#208)
		r5 = memh(r1+#52)
	}                                       // 4-byte Folded Reload
	{
		r10 = memw(r29+#240)
		r6 = memh(r0+#96)
	}                                       // 4-byte Folded Reload
	{
		r23 += mpyi(r8,r24)
		r7 = memh(r3+#116)
		r8 = memh(r0+#98)
	}
	{
		r17 += mpyi(r4,r10)
		r27 += mpyi(r6,r11)
		r10 = memw(r29+#180)
		r4 = memh(r1+#54)
	}                                       // 4-byte Folded Reload
	{
		r27 += mpyi(r8,r15)
		r11 = memw(r29+#204)
		r6 = memh(r3+#118)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r5,r10)
		r10 = memw(r29+#128)
		r5 = memh(r1+#56)
	}                                       // 4-byte Folded Reload
	{
		r23 += mpyi(r7,r11)
		r7 = memh(r0+#100)
		r15 = memw(r29+#200)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r4,r10)
		r10 = memw(r29+#176)
		r4 = memh(r1+#58)
	}                                       // 4-byte Folded Reload
	{
		r27 += mpyi(r7,r26)
		r23 += mpyi(r6,r15)
		r26 = memw(r29+#172)
		r8 = memh(r3+#120)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r5,r10)
		r10 = memw(r29+#124)
		r5 = memh(r1+#60)
	}                                       // 4-byte Folded Reload
	{
		r6 = memh(r0+#102)
		r7 = memh(r3+#122)
	}
	{
		r17 += mpyi(r4,r10)
		r4 = memh(r1+#62)
		r10 = memw(r29+#96)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r5,r26)
		r27 += mpyi(r6,r14)
		r26 = memw(r29+#168)
		r5 = memh(r1+#64)
	}                                       // 4-byte Folded Reload
	{
		r23 += mpyi(r8,r10)
		r8 = memh(r0+#104)
		r14 = memw(r29+#136)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r4,r26)
		r26 = memw(r29+#120)
		r4 = memh(r1+#66)
	}                                       // 4-byte Folded Reload
	{
		r27 += mpyi(r8,r13)
		r23 += mpyi(r7,r14)
		r13 = memw(r29+#116)
		r7 = memh(r0+#106)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r5,r26)
		r26 = memw(r29+#164)
		r5 = memh(r1+#68)
	}                                       // 4-byte Folded Reload
	{
		r27 += mpyi(r7,r9)
		r6 = memh(r3+#124)
		r7 = memw(r29+#48)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r4,r26)
		r4 = memh(r1+#70)
		r3 = memh(r3+#126)
	}
	{
		r17 += mpyi(r5,r13)
		r13 = memw(r29+#132)
		r5 = memh(r1+#72)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r4,r20)
		r20 = memw(r29+#88)
		r4 = memh(r1+#74)
	}                                       // 4-byte Folded Reload
	{
		r23 += mpyi(r6,r13)
		r17 += mpyi(r5,r18)
		r6 = memh(r0+#108)
		r9 = memw(r29+#92)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r4,r16)
		r18 = r20
		r7 = memw(r29+#340)
		memw(r20+r7<<#2) = r19
	}                                       // 4-byte Folded Reload
	{
		r27 += mpyi(r6,r2)
		r23 += mpyi(r3,r9)
		r5 = memh(r1+#76)
		r4 = memh(r0+#110)
	}
	{
		r19 = or(r7,#13)
		r2 = memw(r29+#112)
		r3 = memw(r29+#40)
	}                                       // 4-byte Folded Reload
	{
		r27 += mpyi(r4,r28)
		r7 = asl(r19,#7)
		r4 = memw(r29+#232)
		r6 = memh(r1+#78)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r5,r2)
		r2 = memw(r29+#196)
		memw(r20+r3<<#2) = r21
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r6,r4)
		r20 = addasl(r2,r19,#7)
		r3 = memh(r0+#112)
		r5 = memh(r1+#80)
	}
	{
		r21 = r2
		r4 = memh(r2+r7<<#0)
		r2 = memw(r29+#228)
	}                                       // 4-byte Folded Reload
	{
		r27 += mpyi(r3,r12)
		r6 = memh(r1+#82)
		memw(r29+#52) = r19
	}                                       // 4-byte Folded Spill
	{
		r17 += mpyi(r5,r2)
		r12 = memw(r29+#256)
		r16 = memw(r29+#108)
	}                                       // 4-byte Folded Reload
	{
		r26 = memh(r0+#114)
		r19 = memw(r18+r19<<#2)
	}
	{
		r19 += mpyi(r4,r12)
		r17 += mpyi(r6,r16)
		r3 = memh(r20+#2)
		r2 = memw(r29+#336)
	}                                       // 4-byte Folded Reload
	{
		r27 += mpyi(r26,r24)
		r16 = memw(r29+#332)
		r4 = memh(r20+#4)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r3,r2)
		r5 = memh(r0+#116)
		r28 = memw(r29+#300)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r4,r16)
		r7 = memh(r1+#84)
		r3 = memh(r20+#6)
	}
	{
		r27 += mpyi(r5,r11)
		r24 = memw(r29+#152)
		r6 = memh(r0+#118)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r3,r28)
		r4 = memh(r20+#8)
		r26 = memw(r29+#328)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r7,r24)
		r27 += mpyi(r6,r15)
		r3 = memh(r20+#10)
		r7 = memh(r0+#120)
	}
	{
		r19 += mpyi(r4,r26)
		r11 = memw(r29+#324)
		r24 = memw(r29+#104)
	}                                       // 4-byte Folded Reload
	{
		r27 += mpyi(r7,r10)
		r5 = memh(r1+#86)
		r4 = memh(r20+#12)
	}
	{
		r19 += mpyi(r3,r11)
		r26 = memw(r29+#320)
		r6 = memh(r1+#88)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r5,r24)
		r10 = memw(r29+#84)
		r7 = memh(r1+#90)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r4,r26)
		r26 = memw(r29+#80)
		r5 = memh(r0+#122)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r6,r10)
		r11 = memw(r29+#292)
		r6 = memh(r0+#124)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r7,r26)
		r27 += mpyi(r5,r14)
		r26 = memw(r29+#288)
		r5 = memh(r1+#92)
	}                                       // 4-byte Folded Reload
	{
		r27 += mpyi(r6,r13)
		r7 = memw(r29+#100)
		r0 = memh(r0+#126)
	}                                       // 4-byte Folded Reload
	{
		r3 = memh(r20+#14)
		r15 = memw(r29+#296)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r5,r7)
		r27 += mpyi(r0,r9)
		r7 = memw(r29+#36)
		r4 = memh(r20+#16)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r3,r15)
		r24 = memw(r29+#316)
		r0 = memw(r29+#32)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r4,r11)
		r11 = r21
		r3 = memh(r20+#18)
		r10 = memw(r29+#252)
	}                                       // 4-byte Folded Reload
	{
		r4 = memh(r20+#20)
		memw(r18+r0<<#2) = r25
	}
	{
		r19 += mpyi(r3,r24)
		r3 = memh(r20+#22)
		memw(r18+r7<<#2) = r22
	}
	{
		r19 += mpyi(r4,r26)
		r6 = memh(r1+#94)
		r0 = memw(r29+#76)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r3,r10)
		r15 = memw(r29+#284)
		r4 = memh(r20+#24)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r6,r0)
		r0 = memw(r29+#340)
		r3 = memh(r20+#26)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r4,r15)
		r14 = or(r0,#14)
		r24 = memw(r29+#248)
		memw(r29+#48) = r14.new
	}                                       // 4-byte Folded Reload
	{
		r21 = addasl(r21,r14,#7)
		r7 = asl(r14,#7)
		r4 = memh(r1+#96)
		r0 = memw(r29+#148)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r3,r24)
		r25 = memw(r29+#192)
		r5 = memh(r20+#28)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r4,r0)
		r4 = memh(r11+r7<<#0)
		r3 = memh(r1+#98)
	}
	{
		r19 += mpyi(r5,r25)
		r7 = memw(r29+#224)
		r0 = memw(r29+#280)
	}                                       // 4-byte Folded Reload
	{
		r6 = memh(r20+#30)
		r5 = memh(r20+#32)
	}
	{
		r17 += mpyi(r3,r7)
		r3 = memw(r18+r14<<#2)
		r11 = memw(r29+#276)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r6,r0)
		r3 += mpyi(r4,r12)
		r7 = memh(r21+#2)
		r14 = memw(r29+#144)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r5,r11)
		r22 = memh(r1+#100)
		r4 = memh(r21+#4)
	}
	{
		r3 += mpyi(r7,r2)
		r5 = memh(r1+#102)
		r2 = memw(r29+#140)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r22,r14)
		r3 += mpyi(r4,r16)
		r7 = memh(r21+#6)
		r6 = memh(r20+#34)
	}
	{
		r17 += mpyi(r5,r2)
		r13 = memw(r29+#312)
		r4 = memh(r21+#8)
	}                                       // 4-byte Folded Reload
	{
		r3 += mpyi(r7,r28)
		r2 = memw(r29+#328)
		r7 = memh(r21+#10)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r6,r13)
		r6 = memh(r1+#104)
		r16 = memw(r29+#324)
	}                                       // 4-byte Folded Reload
	{
		r3 += mpyi(r4,r2)
		r2 = memw(r29+#220)
		r4 = memh(r21+#12)
	}                                       // 4-byte Folded Reload
	{
		r3 += mpyi(r7,r16)
		r22 = memh(r1+#106)
		r7 = memh(r21+#14)
	}
	{
		r17 += mpyi(r6,r2)
		r2 = memw(r29+#320)
		r18 = memh(r20+#36)
	}                                       // 4-byte Folded Reload
	{
		r12 = memw(r29+#308)
		r5 = memh(r20+#38)
	}                                       // 4-byte Folded Reload
	{
		r3 += mpyi(r4,r2)
		r2 = memw(r29+#216)
		r14 = memw(r29+#272)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r18,r12)
		r4 = memh(r21+#16)
		r6 = memh(r20+#40)
	}
	{
		r17 += mpyi(r22,r2)
		r19 += mpyi(r5,r14)
		r2 = memw(r29+#296)
		r5 = memh(r1+#108)
	}                                       // 4-byte Folded Reload
	{
		r18 = memw(r29+#304)
		r28 = memh(r20+#42)
	}                                       // 4-byte Folded Reload
	{
		r3 += mpyi(r7,r2)
		r2 = memw(r29+#292)
		r7 = memh(r21+#18)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r6,r18)
		r6 = memh(r1+#110)
	}
	{
		r3 += mpyi(r4,r2)
		r2 = memw(r29+#264)
		r4 = memh(r21+#20)
	}                                       // 4-byte Folded Reload
	{
		r22 = memw(r29+#268)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r5,r2)
		r2 = memw(r29+#316)
		r5 = memh(r20+#44)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r28,r22)
		r28 = memh(r1+#112)
		r9 = memw(r29+#188)
	}                                       // 4-byte Folded Reload
	{
		r3 += mpyi(r7,r2)
		r7 = memh(r21+#22)
		r2 = memw(r29+#260)
	}                                       // 4-byte Folded Reload
	{
		r3 += mpyi(r4,r26)
		r19 += mpyi(r5,r9)
		r4 = memh(r21+#24)
		r26 = memh(r20+#48)
	}
	{
		r3 += mpyi(r7,r10)
		r17 += mpyi(r6,r2)
		r7 = memh(r21+#26)
		r2 = memw(r29+#212)
	}                                       // 4-byte Folded Reload
	{
		r3 += mpyi(r4,r15)
		r4 = memh(r21+#28)
		r6 = memh(r20+#46)
	}
	{
		r3 += mpyi(r7,r24)
		r17 += mpyi(r28,r2)
		r7 = memh(r21+#30)
		r2 = memw(r29+#184)
	}                                       // 4-byte Folded Reload
	{
		r3 += mpyi(r4,r25)
		r4 = memh(r21+#32)
		r10 = memw(r29+#208)
	}                                       // 4-byte Folded Reload
	{
		r3 += mpyi(r7,r0)
		r19 += mpyi(r6,r2)
		r7 = memh(r21+#34)
		r0 = memw(r29+#244)
	}                                       // 4-byte Folded Reload
	{
		r3 += mpyi(r4,r11)
		r4 = memh(r21+#36)
		r5 = memh(r1+#114)
	}
	{
		r3 += mpyi(r7,r13)
		r19 += mpyi(r26,r0)
		r7 = memh(r21+#38)
		r6 = memh(r1+#116)
	}
	{
		r3 += mpyi(r4,r12)
		r17 += mpyi(r5,r10)
		r26 = memw(r29+#204)
		r4 = memh(r21+#40)
	}                                       // 4-byte Folded Reload
	{
		r3 += mpyi(r7,r14)
		r5 = memh(r20+#50)
		r13 = memw(r29+#240)
	}                                       // 4-byte Folded Reload
	{
		r3 += mpyi(r4,r18)
		r17 += mpyi(r6,r26)
		r7 = memh(r21+#42)
		r6 = memh(r20+#52)
	}
	{
		r19 += mpyi(r5,r13)
		r26 = memw(r29+#180)
		r28 = memw(r29+#96)
	}                                       // 4-byte Folded Reload
	{
		r3 += mpyi(r7,r22)
		r4 = memh(r21+#44)
		r8 = memh(r1+#118)
	}
	{
		r19 += mpyi(r6,r26)
		r10 = memw(r29+#200)
		r11 = memh(r20+#54)
	}                                       // 4-byte Folded Reload
	{
		r3 += mpyi(r4,r9)
		r14 = memw(r29+#128)
		r7 = memh(r21+#46)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r8,r10)
		r5 = memh(r1+#120)
		r4 = memh(r21+#48)
	}
	{
		r3 += mpyi(r7,r2)
		r19 += mpyi(r11,r14)
		r6 = memh(r1+#122)
		r11 = memw(r29+#136)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r5,r28)
		r3 += mpyi(r4,r0)
		r10 = memh(r1+#124)
		r0 = memw(r29+#132)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r6,r11)
		r28 = memw(r29+#124)
		r1 = memh(r1+#126)
	}                                       // 4-byte Folded Reload
	{
		r17 += mpyi(r10,r0)
		r0 = memw(r29+#88)
		r7 = memh(r21+#50)
	}                                       // 4-byte Folded Reload
	{
		r2 = memw(r29+#56)
		r5 = memh(r20+#56)
	}                                       // 4-byte Folded Reload
	{
		r3 += mpyi(r7,r13)
		r18 = memw(r29+#176)
		r4 = memh(r21+#52)
	}                                       // 4-byte Folded Reload
	{
		r2 = memw(r29+#92)
		memw(r0+r2<<#2) = r23
	}                                       // 4-byte Folded Reload
	{
		r3 += mpyi(r4,r26)
		r19 += mpyi(r5,r18)
		r7 = memh(r21+#54)
		r6 = memh(r20+#58)
	}
	{
		r17 += mpyi(r1,r2)
		r26 = r0
		r1 = memw(r29+#60)
		r5 = memh(r21+#56)
	}                                       // 4-byte Folded Reload
	{
		r3 += mpyi(r7,r14)
		r19 += mpyi(r6,r28)
		r22 = memh(r20+#60)
		r2 = memw(r29+#172)
	}                                       // 4-byte Folded Reload
	{
		r3 += mpyi(r5,r18)
		r1 = memw(r29+#340)
		memw(r0+r1<<#2) = r27
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r22,r2)
		r10 = or(r1,#15)
		r7 = memh(r21+#58)
		r0 = memw(r29+#196)
	}                                       // 4-byte Folded Reload
	{
		r5 = addasl(r0,r10,#7)
		r14 = asl(r10,#7)
		r4 = memh(r20+#62)
		r23 = memw(r29+#168)
	}                                       // 4-byte Folded Reload
	{
		r3 += mpyi(r7,r28)
		r7 = memh(r0+r14<<#0)
		r0 = memw(r29+#256)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r4,r23)
		r4 = memw(r26+r10<<#2)
		r14 = memh(r5+#2)
	}
	{
		r4 += mpyi(r7,r0)
		r0 = memw(r29+#336)
		r27 = memh(r21+#60)
	}                                       // 4-byte Folded Reload
	{
		r6 = memh(r20+#64)
		r26 = memw(r29+#120)
	}                                       // 4-byte Folded Reload
	{
		r4 += mpyi(r14,r0)
		r3 += mpyi(r27,r2)
		r18 = memh(r21+#62)
		r7 = memh(r5+#4)
	}
	{
		r19 += mpyi(r6,r26)
		r0 = memw(r29+#332)
		r22 = memh(r20+#66)
	}                                       // 4-byte Folded Reload
	{
		r3 += mpyi(r18,r23)
		r27 = memw(r29+#164)
		r6 = memh(r21+#64)
	}                                       // 4-byte Folded Reload
	{
		r4 += mpyi(r7,r0)
		r18 = memh(r5+#6)
		r0 = memw(r29+#300)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r22,r27)
		r3 += mpyi(r6,r26)
		r22 = memh(r21+#66)
		r7 = memh(r5+#8)
	}
	{
		r4 += mpyi(r18,r0)
		r0 = memw(r29+#328)
		r14 = memh(r5+#10)
	}                                       // 4-byte Folded Reload
	{
		r3 += mpyi(r22,r27)
		r22 = memw(r29+#160)
		r11 = memh(r20+#68)
	}                                       // 4-byte Folded Reload
	{
		r4 += mpyi(r7,r0)
		r7 = memh(r5+#12)
		r0 = memw(r29+#320)
	}                                       // 4-byte Folded Reload
	{
		r4 += mpyi(r14,r16)
		r18 = memh(r5+#14)
		r2 = memw(r29+#116)
	}                                       // 4-byte Folded Reload
	{
		r4 += mpyi(r7,r0)
		r0 = memw(r29+#296)
		r6 = memh(r20+#70)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r11,r2)
		r11 = memh(r21+#68)
		r7 = memh(r5+#16)
	}
	{
		r4 += mpyi(r18,r0)
		r19 += mpyi(r6,r22)
		r1 = memw(r29+#292)
		r6 = memh(r21+#70)
	}                                       // 4-byte Folded Reload
	{
		r3 += mpyi(r11,r2)
		r11 = memh(r5+#18)
		r9 = memh(r20+#72)
	}
	{
		r4 += mpyi(r7,r1)
		r3 += mpyi(r6,r22)
		r1 = memw(r29+#316)
		r0 = memw(r29+#236)
	}                                       // 4-byte Folded Reload
	{
		r16 = memh(r21+#72)
		r7 = memh(r5+#20)
	}
	{
		r4 += mpyi(r11,r1)
		r19 += mpyi(r9,r0)
		r1 = memw(r29+#288)
		r22 = memw(r29+#156)
	}                                       // 4-byte Folded Reload
	{
		r3 += mpyi(r16,r0)
		r18 = memh(r5+#22)
		r0 = memw(r29+#252)
	}                                       // 4-byte Folded Reload
	{
		r4 += mpyi(r7,r1)
		r7 = memh(r5+#24)
		r14 = memh(r20+#74)
	}
	{
		r4 += mpyi(r18,r0)
		r11 = memh(r5+#26)
		r0 = memw(r29+#280)
	}                                       // 4-byte Folded Reload
	{
		r4 += mpyi(r7,r15)
		r19 += mpyi(r14,r22)
		r7 = memh(r5+#28)
		r18 = memw(r29+#112)
	}                                       // 4-byte Folded Reload
	{
		r4 += mpyi(r11,r24)
		r16 = memh(r5+#30)
		r14 = memh(r21+#74)
	}
	{
		r4 += mpyi(r7,r25)
		r7 = memh(r5+#32)
		r6 = memh(r20+#76)
	}
	{
		r4 += mpyi(r16,r0)
		r3 += mpyi(r14,r22)
		r0 = memw(r29+#276)
		r14 = memh(r5+#34)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r6,r18)
		r6 = memh(r21+#76)
		r15 = memw(r29+#232)
	}                                       // 4-byte Folded Reload
	{
		r4 += mpyi(r7,r0)
		r0 = memw(r29+#312)
		r7 = memh(r5+#36)
	}                                       // 4-byte Folded Reload
	{
		r3 += mpyi(r6,r18)
		r9 = memh(r20+#78)
		r12 = memh(r20+#80)
	}
	{
		r4 += mpyi(r14,r0)
		r0 = memw(r29+#308)
		r14 = memh(r5+#38)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r9,r15)
		r24 = memh(r21+#78)
		r11 = memw(r29+#228)
	}                                       // 4-byte Folded Reload
	{
		r4 += mpyi(r7,r0)
		r0 = memw(r29+#272)
		r7 = memh(r5+#40)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r12,r11)
		r3 += mpyi(r24,r15)
		r1 = memw(r29+#304)
		r25 = memw(r29+#108)
	}                                       // 4-byte Folded Reload
	{
		r4 += mpyi(r14,r0)
		r6 = memh(r20+#82)
		r16 = memh(r21+#80)
	}
	{
		r4 += mpyi(r7,r1)
		r14 = memh(r5+#42)
		r1 = memw(r29+#268)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r6,r25)
		r3 += mpyi(r16,r11)
		r9 = memh(r20+#84)
		r0 = memw(r29+#152)
	}                                       // 4-byte Folded Reload
	{
		r4 += mpyi(r14,r1)
		r6 = memh(r21+#82)
		r16 = memh(r20+#86)
	}
	{
		r19 += mpyi(r9,r0)
		r14 = memw(r29+#104)
		r9 = memh(r21+#84)
	}                                       // 4-byte Folded Reload
	{
		r3 += mpyi(r6,r25)
		r25:24 = combine(r0,r25)
		r7 = memh(r5+#44)
		r6 = memh(r20+#88)
	}
	{
		r19 += mpyi(r16,r14)
		r3 += mpyi(r9,r0)
		r16 = memw(r29+#188)
		r8 = memh(r5+#46)
	}                                       // 4-byte Folded Reload
	{
		r0 = memw(r29+#184)
		r12 = memh(r21+#86)
	}                                       // 4-byte Folded Reload
	{
		r4 += mpyi(r7,r16)
		r7 = memh(r5+#48)
		r9 = memh(r20+#90)
	}
	{
		r4 += mpyi(r8,r0)
		r3 += mpyi(r12,r14)
		r0 = memw(r29+#84)
		r8 = memh(r5+#50)
	}                                       // 4-byte Folded Reload
	{
		r13 = r0
		r16 = memw(r29+#244)
		r12 = memh(r20+#92)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r6,r0)
		r1 = memw(r29+#240)
		r6 = memh(r21+#88)
	}                                       // 4-byte Folded Reload
	{
		r4 += mpyi(r7,r16)
		r7 = memh(r5+#52)
	}
	{
		r4 += mpyi(r8,r1)
		r3 += mpyi(r6,r0)
		r1 = memw(r29+#80)
		r8 = memh(r5+#54)
	}                                       // 4-byte Folded Reload
	{
		r16 = memw(r29+#180)
		r0 = memw(r29+#128)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r9,r1)
		r9 = memh(r21+#90)
		r6 = memh(r20+#94)
	}
	{
		r4 += mpyi(r7,r16)
		r7 = memh(r5+#56)
		r16 = memw(r29+#176)
	}                                       // 4-byte Folded Reload
	{
		r4 += mpyi(r8,r0)
		r3 += mpyi(r9,r1)
		r8 = memh(r5+#58)
		r0 = memw(r29+#100)
	}                                       // 4-byte Folded Reload
	{
		r4 += mpyi(r7,r16)
		r16 = r1
		r1 = memw(r29+#76)
		r7 = memh(r5+#60)
	}                                       // 4-byte Folded Reload
	{
		r4 += mpyi(r8,r28)
		r19 += mpyi(r12,r0)
		r28 = memw(r29+#172)
		r8 = memh(r5+#62)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r6,r1)
		r12 = memh(r21+#92)
		r9 = memh(r20+#96)
	}
	{
		r4 += mpyi(r7,r28)
		r7 = memh(r5+#64)
		r6 = memh(r21+#94)
	}
	{
		r4 += mpyi(r8,r23)
		r3 += mpyi(r12,r0)
		r8 = memh(r5+#66)
		r23 = memw(r29+#148)
	}                                       // 4-byte Folded Reload
	{
		r4 += mpyi(r7,r26)
		r3 += mpyi(r6,r1)
		r7 = memh(r5+#68)
		r26 = memw(r29+#224)
	}                                       // 4-byte Folded Reload
	{
		r4 += mpyi(r8,r27)
		r19 += mpyi(r9,r23)
		r28 = memh(r21+#96)
		r8 = memh(r5+#70)
	}
	{
		r4 += mpyi(r7,r2)
		r2 = memw(r29+#196)
		r7 = memh(r5+#72)
	}                                       // 4-byte Folded Reload
	{
		r3 += mpyi(r28,r23)
		r27 = memw(r29+#160)
		r28 = memw(r29+#236)
	}                                       // 4-byte Folded Reload
	{
		r12 = memh(r20+#98)
	}
	{
		r4 += mpyi(r8,r27)
		r8 = memh(r5+#74)
		r6 = memh(r20+#100)
	}
	{
		r4 += mpyi(r7,r28)
		r19 += mpyi(r12,r26)
		r7 = memh(r5+#76)
		r27 = memw(r29+#144)
	}                                       // 4-byte Folded Reload
	{
		r4 += mpyi(r8,r22)
		r8 = memh(r5+#78)
		r12 = memh(r21+#98)
	}
	{
		r4 += mpyi(r7,r18)
		r19 += mpyi(r6,r27)
		r7 = memh(r5+#80)
		r6 = memh(r21+#100)
	}
	{
		r4 += mpyi(r8,r15)
		r3 += mpyi(r12,r26)
		r18 = memh(r5+#82)
		r9 = memh(r20+#102)
	}
	{
		r4 += mpyi(r7,r11)
		r3 += mpyi(r6,r27)
		r7 = memh(r5+#84)
		r22 = memw(r29+#140)
	}                                       // 4-byte Folded Reload
	{
		r4 += mpyi(r18,r24)
		r18 = memh(r5+#86)
		r12 = memh(r20+#104)
	}
	{
		r4 += mpyi(r7,r25)
		r19 += mpyi(r9,r22)
		r7 = memh(r5+#88)
		r15 = memw(r29+#220)
	}                                       // 4-byte Folded Reload
	{
		r4 += mpyi(r18,r14)
		r25 = memh(r5+#90)
		r28 = memh(r21+#102)
	}
	{
		r4 += mpyi(r7,r13)
		r19 += mpyi(r12,r15)
		r7 = memh(r5+#92)
		r6 = memh(r20+#106)
	}
	{
		r4 += mpyi(r25,r16)
		r3 += mpyi(r28,r22)
		r16 = memh(r5+#94)
		r11 = memw(r29+#216)
	}                                       // 4-byte Folded Reload
	{
		r4 += mpyi(r7,r0)
		r7 = memh(r5+#96)
		r12 = memh(r21+#104)
	}
	{
		r4 += mpyi(r16,r1)
		r19 += mpyi(r6,r11)
		r25 = memh(r5+#98)
		r28 = memh(r20+#108)
	}
	{
		r4 += mpyi(r7,r23)
		r3 += mpyi(r12,r15)
		r14 = memw(r29+#264)
		r6 = memh(r21+#106)
	}                                       // 4-byte Folded Reload
	{
		r4 += mpyi(r25,r26)
		r7 = memh(r5+#100)
		r24 = memh(r20+#110)
	}
	{
		r19 += mpyi(r28,r14)
		r3 += mpyi(r6,r11)
		r13 = memw(r29+#260)
		r16 = memh(r5+#102)
	}                                       // 4-byte Folded Reload
	{
		r4 += mpyi(r7,r27)
		r28 = memh(r21+#108)
		r0 = memw(r29+#212)
	}                                       // 4-byte Folded Reload
	{
		r4 += mpyi(r16,r22)
		r19 += mpyi(r24,r13)
		r7 = memh(r5+#104)
		r6 = memh(r20+#112)
	}
	{
		r3 += mpyi(r28,r14)
		r18 = memh(r21+#110)
		r23 = memh(r5+#106)
	}
	{
		r4 += mpyi(r7,r15)
		r19 += mpyi(r6,r0)
		r24 = memh(r20+#114)
		r1 = memw(r29+#208)
	}                                       // 4-byte Folded Reload
	{
		r4 += mpyi(r23,r11)
		r3 += mpyi(r18,r13)
		r7 = memh(r5+#108)
		r6 = memh(r21+#112)
	}
	{
		r19 += mpyi(r24,r1)
		r16 = memw(r29+#204)
		r28 = memh(r20+#116)
	}                                       // 4-byte Folded Reload
	{
		r4 += mpyi(r7,r14)
		r3 += mpyi(r6,r0)
		r26 = memh(r5+#110)
		r18 = memh(r21+#114)
	}
	{
		r19 += mpyi(r28,r16)
		r7 = memh(r5+#112)
		r6 = memh(r20+#118)
	}
	{
		r4 += mpyi(r26,r13)
		r3 += mpyi(r18,r1)
		r27 = memw(r29+#200)
		r24 = memh(r21+#116)
	}                                       // 4-byte Folded Reload
	{
		r4 += mpyi(r7,r0)
		r11 = memh(r5+#114)
		r25 = memh(r20+#120)
	}
	{
		r19 += mpyi(r6,r27)
		r3 += mpyi(r24,r16)
		r18 = memw(r29+#96)
		r6 = memh(r21+#118)
	}                                       // 4-byte Folded Reload
	{
		r4 += mpyi(r11,r1)
		r7 = memh(r5+#116)
		r28 = memh(r20+#122)
	}
	{
		r3 += mpyi(r6,r27)
		r19 += mpyi(r25,r18)
		r23 = memh(r5+#118)
		r1 = memw(r29+#136)
	}                                       // 4-byte Folded Reload
	{
		r4 += mpyi(r7,r16)
		r22 = memh(r21+#120)
		r6 = memh(r20+#124)
	}
	{
		r4 += mpyi(r23,r27)
		r19 += mpyi(r28,r1)
		r7 = memh(r5+#120)
		r0 = memw(r29+#132)
	}                                       // 4-byte Folded Reload
	{
		r3 += mpyi(r22,r18)
		r24 = memh(r21+#122)
		r26 = memh(r5+#122)
	}
	{
		r4 += mpyi(r7,r18)
		r19 += mpyi(r6,r0)
		r7 = memh(r5+#124)
		r6 = memh(r21+#124)
	}
	{
		r3 += mpyi(r24,r1)
		r4 += mpyi(r26,r1)
		r1 = memw(r29+#92)
		r25 = memh(r20+#126)
	}                                       // 4-byte Folded Reload
	{
		r4 += mpyi(r7,r0)
		r3 += mpyi(r6,r0)
		r0 = memw(r29+#68)
		r7 = memw(r29+#88)
	}                                       // 4-byte Folded Reload
	{
		r19 += mpyi(r25,r1)
		r27 = memh(r21+#126)
		r5 = memh(r5+#126)
	}
	{
		r6 = memh(r0+#126)
		r0 = memw(r29+#72)
	}                                       // 4-byte Folded Reload
	{
		r3 += mpyi(r27,r1)
		r4 += mpyi(r5,r1)
		r5 = r1
		r1 = memw(r29+#64)
	}                                       // 4-byte Folded Reload
	{
		r1 += mpyi(r6,r5)
		r0 = memw(r29+#52)
		memw(r7+r0<<#2) = r17
	}                                       // 4-byte Folded Reload
	{
		memw(r7+r10<<#2) = r4
	}
	{
		r0 = memw(r29+#48)
		memw(r7+r0<<#2) = r19
	}                                       // 4-byte Folded Reload
	{
		r0 = memw(r29+#340)
		memw(r7+r0<<#2) = r3
	}                                       // 4-byte Folded Reload
	{
		r0 = add(r0,#16)
		memw(r7+r0<<#2) = r1
	} :endloop0
// %bb.3:                               //   in Loop: Header=BB0_1 Depth=1
	{
		r1 = memw(r29+#8)
	}                                       // 4-byte Folded Reload
	{
		r1 = add(r1,#1)
		nop
		nop
	} :endloop1
// %bb.4:
	{
		r17:16 = memd(r29+#384)
		r19:18 = memd(r29+#376)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#368)
		r23:22 = memd(r29+#360)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#352)
		r27:26 = memd(r29+#344)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end0:
	.size	matmul, .Lfunc_end0-matmul
                                        // -- End function
	.ident	"clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)"
	.section	".note.GNU-stack","",@progbits
