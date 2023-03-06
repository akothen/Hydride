#############################################################
#
# A tool for compiling x86 semantics to Rosette IR.
#
#############################################################



from PseudoCodeParser import ParseX86Intructions, ParseX86Instruction
from x86RoseCompiler import CompileSemantics, x86RoseContext



def Compile(InstName : str = None):
	from RoseFunctionInfo import RoseFunctionInfo
	if InstName == None:
		SemaList = ParseX86Intructions("test.xml")
		print("SemaList lngth:")
		print(len(SemaList))
	else:
		print("PARSING INSTRUCTION")
		SemaList = ParseX86Instruction(InstName, "test.xml")
		print("SemaList lngth:")
		print(len(SemaList))
	if SemaList == None:
		return [None]
	FunctionInfoList = list()
	for Index, Spec in enumerate(SemaList):
		RootContext = x86RoseContext()
		print("RootContext---:")
		print(RootContext)
		print("Spec:")
		print(Spec)
		FunctionInfo = RoseFunctionInfo()
		CompiledFunction = CompileSemantics(Spec, RootContext)
		FunctionInfo.addContext(RootContext)
		FunctionInfo.addRawSemantics(Spec)
		FunctionInfo.addFunctionAtNewStage(CompiledFunction)
		print("Index*****")
		print(Index)
		print("CompiledFunction:")
		CompiledFunction.print()
		FunctionInfoList.append(FunctionInfo)

	return FunctionInfoList


def test1():
  return '''
<intrinsic tech="SSE2" vexEq="TRUE" name="_mm_unpacklo_epi8">
	<type>Integer</type>
	<CPUID>SSE2</CPUID>
	<category>Swizzle</category>
	<return type="__m128i" varname="dst" etype="UI8"/>
	<parameter type="__m128i" varname="a" etype="UI8"/>
	<parameter type="__m128i" varname="b" etype="UI8"/>
	<description>Unpack and interleave 8-bit integers from the low half of "a" and "b", and store the results in "dst".</description>
	<operation>
DEFINE INTERLEAVE_BYTES(src1[127:0], src2[127:0]) {
	dst[7:0] := src1[7:0] 
	dst[15:8] := src2[7:0] 
	dst[23:16] := src1[15:8] 
	dst[31:24] := src2[15:8] 
	dst[39:32] := src1[23:16] 
	dst[47:40] := src2[23:16] 
	dst[55:48] := src1[31:24] 
	dst[63:56] := src2[31:24] 
	dst[71:64] := src1[39:32]
	dst[79:72] := src2[39:32] 
	dst[87:80] := src1[47:40] 
	dst[95:88] := src2[47:40] 
	dst[103:96] := src1[55:48] 
	dst[111:104] := src2[55:48]
	dst[119:112] := src1[63:56] 
	dst[127:120] := src2[63:56] 
	RETURN dst[127:0]	
}
dst[127:0] := INTERLEAVE_BYTES(a[127:0], b[127:0])
	</operation>
	<instruction name="PUNPCKLBW" form="xmm, xmm" xed="PUNPCKLBW_XMMdq_XMMq"/>
	<header>emmintrin.h</header>
</intrinsic>
  '''

def test2():
  return '''
<intrinsic tech="AVX2" name="_mm256_unpacklo_epi8">
	<type>Integer</type>
	<CPUID>AVX2</CPUID>
	<category>Swizzle</category>
	<return type="__m256i" varname="dst" etype="UI8"/>
	<parameter type="__m256i" varname="a" etype="UI8"/>
	<parameter type="__m256i" varname="b" etype="UI8"/>
	<description>Unpack and interleave 8-bit integers from the low half of each 128-bit lane in "a" and "b", and store the results in "dst".</description>
	<operation>
DEFINE INTERLEAVE_BYTES(src1[127:0], src2[127:0]) {
	dst[7:0] := src1[7:0] 
	dst[15:8] := src2[7:0] 
	dst[23:16] := src1[15:8] 
	dst[31:24] := src2[15:8] 
	dst[39:32] := src1[23:16] 
	dst[47:40] := src2[23:16] 
	dst[55:48] := src1[31:24] 
	dst[63:56] := src2[31:24] 
	dst[71:64] := src1[39:32]
	dst[79:72] := src2[39:32] 
	dst[87:80] := src1[47:40] 
	dst[95:88] := src2[47:40] 
	dst[103:96] := src1[55:48] 
	dst[111:104] := src2[55:48] 
	dst[119:112] := src1[63:56] 
	dst[127:120] := src2[63:56] 
	RETURN dst[127:0]
}
dst[127:0] := INTERLEAVE_BYTES(a[127:0], b[127:0])
dst[255:128] := INTERLEAVE_BYTES(a[255:128], b[255:128])
	</operation>
	<instruction name="VPUNPCKLBW" form="ymm, ymm, ymm" xed="VPUNPCKLBW_YMMqq_YMMqq_YMMqq"/>
	<header>immintrin.h</header>
</intrinsic>
  '''
#dst[MAX:256] := 0

def test3():
  return '''
<intrinsic tech="AVX2" name="_mm_broadcastb_epi8">
	<type>Integer</type>
	<CPUID>AVX2</CPUID>
	<category>Swizzle</category>
	<return type="__m128i" varname="dst" etype="UI8"/>
	<parameter type="__m128i" varname="a" etype="UI8"/>
	<description>Broadcast the low packed 8-bit integer from "a" to all elements of "dst".</description>
	<operation>
FOR j := 0 to 15
	i := j*8
	dst[i+7:i] := a[7:0]
ENDFOR
	</operation>
	<instruction name="VPBROADCASTB" form="xmm, xmm" xed="VPBROADCASTB_XMMdq_XMMb"/>
	<header>immintrin.h</header>
</intrinsic>
  '''
#dst[MAX:128] := 0

# Fix rerolling
def test4():
  return '''
<intrinsic tech="SSSE3" vexEq="TRUE" name="_mm_hadd_epi16">
	<type>Integer</type>
	<CPUID>SSSE3</CPUID>
	<category>Arithmetic</category>
	<return type="__m128i" varname="dst" etype="SI16"/>
	<parameter type="__m128i" varname="a" etype="SI16"/>
	<parameter type="__m128i" varname="b" etype="SI16"/>
	<description>Horizontally add adjacent pairs of 16-bit integers in "a" and "b", and pack the signed 16-bit results in "dst".</description>
	<operation>
dst[15:0] := a[31:16] + a[15:0]
dst[31:16] := a[63:48] + a[47:32]
dst[47:32] := a[95:80] + a[79:64]
dst[63:48] := a[127:112] + a[111:96]
dst[79:64] := b[31:16] + b[15:0]
dst[95:80] := b[63:48] + b[47:32]
dst[111:96] := b[95:80] + b[79:64]
dst[127:112] := b[127:112] + b[111:96]
	</operation>
	<instruction name="PHADDW" form="xmm, xmm" xed="PHADDW_XMMdq_XMMdq"/>
	<header>tmmintrin.h</header>
</intrinsic>
  '''

def test5():
  return '''
<intrinsic tech="AVX-512" name="_mm_cmpeq_epi8_mask">
	<type>Integer</type>
	<type>Mask</type>
	<CPUID>AVX512VL</CPUID>
	<CPUID>AVX512BW</CPUID>
	<category>Compare</category>
	<return type="__mmask16" varname="k" etype="MASK"/>
	<parameter type="__m128i" varname="a" etype="SI8"/>
	<parameter type="__m128i" varname="b" etype="SI8"/>
	<description>Compare packed signed 8-bit integers in "a" and "b" for equality, and store the results in mask vector "k".</description>
	<operation>
FOR j := 0 to 15
	i := j*8
	k[j] := ( a[i+7:i] == b[i+7:i] ) ? 1 : 0
ENDFOR
	</operation>
	<instruction name="VPCMPB" form="k, xmm, xmm" xed="VPCMPB_MASKmskw_MASKmskw_XMMi8_XMMi8_IMM8_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
  '''
#k[MAX:16] := 0


def test6():
  return '''
<intrinsic tech="AVX" name="_mm256_setr_m128i">
	<type>Integer</type>
	<CPUID>AVX</CPUID>
	<category>Set</category>
	<return type="__m256i" varname="dst" etype="M128"/>
	<parameter type="__m128i" varname="lo" etype="M128"/>
	<parameter type="__m128i" varname="hi" etype="M128"/>
	<description>Set packed __m256i vector "dst" with the supplied values.</description>
	<operation>
dst[127:0] := lo[127:0]
dst[255:128] := hi[127:0]
	</operation>
	<instruction name="VINSERTF128" form="ymm, ymm, xmm, imm8" xed="VINSERTF128_YMMqq_YMMqq_XMMdq_IMMb"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:256] := 0


def test7():
  return '''
<intrinsic tech="AVX-512" name="_mm256_permutexvar_epi16">
	<type>Integer</type>
	<CPUID>AVX512VL</CPUID>
	<CPUID>AVX512BW</CPUID>
	<category>Miscellaneous</category>
	<return type="__m256i" varname="dst" etype="UI16"/>
	<parameter type="__m256i" varname="idx" etype="UI16"/>
	<parameter type="__m256i" varname="a" etype="UI16"/>
	<description>Shuffle 16-bit integers in "a" across lanes using the corresponding index in "idx", and store the results in "dst".</description>
	<operation>
FOR j := 0 to 15
	i := j*16
	id := idx[i+3:i]*16
	dst[i+15:i] := a[id+15:id]
ENDFOR
	</operation>
	<instruction name="VPERMW" form="ymm, ymm, ymm" xed="VPERMW_YMMu16_MASKmskw_YMMu16_YMMu16_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:256] := 0


def test8():
  return '''
<intrinsic tech="AVX-512" name="_mm512_min_epi8">
	<type>Integer</type>
	<CPUID>AVX512BW</CPUID>
	<category>Arithmetic</category>
	<return type="__m512i" varname="dst" etype="UI8"/>
	<parameter type="__m512i" varname="a" etype="SI8"/>
	<parameter type="__m512i" varname="b" etype="SI8"/>
	<description>Compare packed signed 8-bit integers in "a" and "b", and store packed minimum values in "dst".</description>
	<operation>
FOR j := 0 to 63
	i := j*8
	dst[i+7:i] := MIN(a[i+7:i], b[i+7:i])
ENDFOR
	</operation>
	<instruction name="VPMINSB" form="zmm, zmm, zmm" xed="VPMINSB_ZMMi8_MASKmskw_ZMMi8_ZMMi8_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:512] := 0

def test11():
  return '''
<intrinsic tech="Other" name="_bswap64">
	<type>Integer</type>
	<category>Bit Manipulation</category>
	<return type="__int64" varname="dst" etype="UI64"/>
	<parameter type="__int64" varname="a" etype="UI64"/>
	<description>Reverse the byte order of 64-bit integer "a", and store the result in "dst". This intrinsic is provided for conversion between little and big endian values.</description>
	<operation>
dst[7:0] := a[63:56]
dst[15:8] := a[55:48]
dst[23:16] := a[47:40]
dst[31:24] := a[39:32]
dst[39:32] := a[31:24]
dst[47:40] := a[23:16]
dst[55:48] := a[15:8]
dst[63:56] := a[7:0]
	</operation>
	<instruction name="BSWAP" form="r64" xed="BSWAP_GPRv"/>
	<header>immintrin.h</header>
</intrinsic>
'''

def test12():
  return '''
<intrinsic tech="Other" name="_bswap">
	<type>Integer</type>
	<category>Bit Manipulation</category>
	<return type="int" varname="dst" etype="UI32"/>
	<parameter type="int" varname="a" etype="UI32"/>
	<description>Reverse the byte order of 32-bit integer "a", and store the result in "dst". This intrinsic is provided for conversion between little and big endian values.</description>
	<operation>
dst[7:0] := a[31:24]
dst[15:8] := a[23:16]
dst[23:16] := a[15:8]
dst[31:24] := a[7:0]
	</operation>
	<instruction name="BSWAP" form="r32" xed="BSWAP_GPRv"/>
	<header>immintrin.h</header>
</intrinsic>
'''

def test13():
  return '''
<intrinsic tech="Other" name="_mm_sha1msg1_epu32">
	<type>Integer</type>
	<CPUID>SHA</CPUID>
	<category>Cryptography</category>
	<return type="__m128i" varname="dst" etype="UI32"/>
	<parameter type="__m128i" varname="a" etype="UI32"/>
	<parameter type="__m128i" varname="b" etype="UI32"/>
	<description>Perform an intermediate calculation for the next four SHA1 message values (unsigned 32-bit integers) using previous message values from "a" and "b", and store the result in "dst".</description>
	<operation>
W0 := a[127:96]
W1 := a[95:64]
W2 := a[63:32]
W3 := a[31:0]
W4 := b[127:96]
W5 := b[95:64]
dst[127:96] := W2 XOR W0
dst[95:64] := W3 XOR W1
dst[63:32] := W4 XOR W2
dst[31:0] := W5 XOR W3
	</operation>
	<instruction name="SHA1MSG1" form="xmm, xmm" xed="SHA1MSG1_XMMi32_XMMi32_SHA"/>
	<header>immintrin.h</header>
</intrinsic>
'''

def test14():
  return '''
<intrinsic tech="SSE" name="_mm_max_pi16">
	<type>Integer</type>
	<CPUID>SSE</CPUID>
	<category>Special Math Functions</category>
	<return type="__m64" varname="dst" etype="SI16"/>
	<parameter type="__m64" varname="a" etype="SI16"/>
	<parameter type="__m64" varname="b" etype="SI16"/>
	<description>Compare packed signed 16-bit integers in "a" and "b", and store packed maximum values in "dst".</description>
	<operation>
FOR j := 0 to 3
	i := j*16
	dst[i+15:i] := MAX(a[i+15:i], b[i+15:i])
ENDFOR
	</operation>
	<instruction name="PMAXSW" form="mm, mm" xed="PMAXSW_MMXq_MMXq"/>
	<header>xmmintrin.h</header>
</intrinsic>
'''

def test15():
  return '''
<intrinsic tech="SSE" name="_mm_mulhi_pu16">
	<type>Integer</type>
	<CPUID>SSE</CPUID>
	<category>Arithmetic</category>
	<return type="__m64" varname="dst" etype="UI16"/>
	<parameter type="__m64" varname="a" etype="UI16"/>
	<parameter type="__m64" varname="b" etype="UI16"/>
	<description>Multiply the packed unsigned 16-bit integers in "a" and "b", producing intermediate 32-bit integers, and store the high 16 bits of the intermediate integers in "dst".</description>
	<operation>
FOR j := 0 to 3
	i := j*16
	tmp[31:0] := a[i+15:i] * b[i+15:i]
	dst[i+15:i] := tmp[31:16]
ENDFOR
	</operation>
	<instruction name="PMULHUW" form="mm, mm" xed="PMULHUW_MMXq_MMXq"/>
	<header>xmmintrin.h</header>
</intrinsic>
'''

def test16():
  return '''
<intrinsic tech="SSE" name="_mm_avg_pu8">
	<type>Integer</type>
	<CPUID>SSE</CPUID>
	<category>Probability/Statistics</category>
	<return type="__m64" varname="dst" etype="UI8"/>
	<parameter type="__m64" varname="a" etype="UI8"/>
	<parameter type="__m64" varname="b" etype="UI8"/>
	<description>Average packed unsigned 8-bit integers in "a" and "b", and store the results in "dst".</description>
	<operation>
FOR j := 0 to 7
	i := j*8
	dst[i+7:i] := (a[i+7:i] + b[i+7:i] + 1) &gt;&gt; 1
ENDFOR
	</operation>
	<instruction name="PAVGB" form="mm, mm" xed="PAVGB_MMXq_MMXq"/>
	<header>xmmintrin.h</header>
</intrinsic>
'''


def test17():
  return '''
<intrinsic tech="SSE" name="_m_pmovmskb">
	<type>Integer</type>
	<CPUID>SSE</CPUID>
	<category>Miscellaneous</category>
	<return type="int" varname="dst" etype="UI8"/>
	<parameter type="__m64" varname="a" etype="UI8"/>
	<description>Create mask from the most significant bit of each 8-bit element in "a", and store the result in "dst".</description>
	<operation>
FOR j := 0 to 7
	i := j*8
	dst[j] := a[i+7]
ENDFOR
	</operation>
	<instruction name="PMOVMSKB" form="r32, mm" xed="PMOVMSKB_GPR32_MMXq"/>
	<header>xmmintrin.h</header>
</intrinsic>
'''
#dst[MAX:8] := 0


# Fails
def test18():
  return '''
<intrinsic tech="Other" name="_mm_sha1msg2_epu32">
	<type>Integer</type>
	<CPUID>SHA</CPUID>
	<category>Cryptography</category>
	<return type="__m128i" varname="dst" etype="UI32"/>
	<parameter type="__m128i" varname="a" etype="UI32"/>
	<parameter type="__m128i" varname="b" etype="UI32"/>
	<description>Perform the final calculation for the next four SHA1 message values (unsigned 32-bit integers) using the intermediate result in "a" and the previous message values in "b", and store the result in "dst".</description>
	<operation>
W13 := b[95:64]
W14 := b[63:32]
W15 := b[31:0]
W16 := (a[127:96] XOR W13) &lt;&lt;&lt; 1
W17 := (a[95:64] XOR W14) &lt;&lt;&lt; 1
W18 := (a[63:32] XOR W15) &lt;&lt;&lt; 1
W19 := (a[31:0] XOR W16) &lt;&lt;&lt; 1
dst[127:96] := W16
dst[95:64] := W17
dst[63:32] := W18
dst[31:0] := W19
	</operation>
	<instruction name="SHA1MSG2" form="xmm, xmm" xed="SHA1MSG2_XMMi32_XMMi32_SHA"/>
	<header>immintrin.h</header>
</intrinsic>
'''

def test19():
  return '''
<intrinsic tech="SSSE3" name="_mm_mulhrs_pi16">
	<type>Integer</type>
	<CPUID>SSSE3</CPUID>
	<category>Arithmetic</category>
	<return type="__m64" varname="dst" etype="UI16"/>
	<parameter type="__m64" varname="a" etype="SI16"/>
	<parameter type="__m64" varname="b" etype="SI16"/>
	<description>Multiply packed signed 16-bit integers in "a" and "b", producing intermediate signed 32-bit integers. Truncate each intermediate integer to the 18 most significant bits, round by adding 1, and store bits [16:1] to "dst".</description>
	<operation>
FOR j := 0 to 3
	i := j*16
	tmp[31:0] := ((SignExtend32(a[i+15:i]) * SignExtend32(b[i+15:i])) &gt;&gt; 14) + 1
	dst[i+15:i] := tmp[16:1]
ENDFOR
	</operation>
	<instruction name="PMULHRSW" form="mm, mm" xed="PMULHRSW_MMXq_MMXq"/>
	<header>tmmintrin.h</header>
</intrinsic>
'''


# Compilation passes
def test20():
  return '''
<intrinsic tech="SSSE3" vexEq="TRUE" name="_mm_hsub_epi32">
	<type>Integer</type>
	<CPUID>SSSE3</CPUID>
	<category>Arithmetic</category>
	<return type="__m128i" varname="dst" etype="SI32"/>
	<parameter type="__m128i" varname="a" etype="SI32"/>
	<parameter type="__m128i" varname="b" etype="SI32"/>
	<description>Horizontally subtract adjacent pairs of 32-bit integers in "a" and "b", and pack the signed 32-bit results in "dst".</description>
	<operation>
dst[31:0] := a[31:0] - a[63:32]
dst[63:32] := a[95:64] - a[127:96]
dst[95:64] := b[31:0] - b[63:32]
dst[127:96] := b[95:64] - b[127:96]
	</operation>
	<instruction name="PHSUBD" form="xmm, xmm" xed="PHSUBD_XMMdq_XMMdq"/>
	<header>tmmintrin.h</header>
</intrinsic>
'''

def test21():
  return '''
<intrinsic tech="SSSE3" vexEq="TRUE" name="_mm_hsub_epi16">
	<type>Integer</type>
	<CPUID>SSSE3</CPUID>
	<category>Arithmetic</category>
	<return type="__m128i" varname="dst" etype="SI16"/>
	<parameter type="__m128i" varname="a" etype="SI16"/>
	<parameter type="__m128i" varname="b" etype="SI16"/>
	<description>Horizontally subtract adjacent pairs of 16-bit integers in "a" and "b", and pack the signed 16-bit results in "dst".</description>
	<operation>
dst[15:0] := a[15:0] - a[31:16]
dst[31:16] := a[47:32] - a[63:48]
dst[47:32] := a[79:64] - a[95:80]
dst[63:48] := a[111:96] - a[127:112]
dst[79:64] := b[15:0] - b[31:16]
dst[95:80] := b[47:32] - b[63:48]
dst[111:96] := b[79:64] - b[95:80]
dst[127:112] := b[111:96] - b[127:112]
	</operation>
	<instruction name="PHSUBW" form="xmm, xmm" xed="PHSUBW_XMMdq_XMMdq"/>
	<header>tmmintrin.h</header>
</intrinsic>
'''


def test22():
  return '''
<intrinsic tech="SSE4.2" vexEq="TRUE" name="_mm_cmpgt_epi64">
	<type>Integer</type>
	<CPUID>SSE4.2</CPUID>
	<category>Compare</category>
	<return type="__m128i" varname="dst" etype="UI64"/>
	<parameter type="__m128i" varname="a" etype="SI64"/>
	<parameter type="__m128i" varname="b" etype="SI64"/>
	<description>Compare packed signed 64-bit integers in "a" and "b" for greater-than, and store the results in "dst".</description>
	<operation>
FOR j := 0 to 1
	i := j*64
	dst[i+63:i] := ( a[i+63:i] &gt; b[i+63:i] ) ? 0xFFFFFFFFFFFFFFFF : 0
ENDFOR
	</operation>
	<instruction name="PCMPGTQ" form="xmm, xmm" xed="PCMPGTQ_XMMdq_XMMdq"/>
	<header>nmmintrin.h</header>
</intrinsic>
'''


def test23():
  return '''
<intrinsic tech="SSE4.1" vexEq="TRUE" name="_mm_mul_epi32">
	<type>Integer</type>
	<CPUID>SSE4.1</CPUID>
	<category>Arithmetic</category>
	<return type="__m128i" varname="dst" etype="SI64"/>
	<parameter type="__m128i" varname="a" etype="SI32"/>
	<parameter type="__m128i" varname="b" etype="SI32"/>
	<description>Multiply the low signed 32-bit integers from each packed 64-bit element in "a" and "b", and store the signed 64-bit results in "dst".</description>
	<operation>
FOR j := 0 to 1
	i := j*64
	dst[i+63:i] := SignExtend64(a[i+31:i]) * SignExtend64(b[i+31:i])
ENDFOR
	</operation>
	<instruction name="PMULDQ" form="xmm, xmm" xed="PMULDQ_XMMdq_XMMdq"/>
	<header>smmintrin.h</header>
</intrinsic>
'''

def test24():
  return '''
<intrinsic tech="SSE4.1" vexEq="TRUE" name="_mm_min_epu32">
	<type>Integer</type>
	<CPUID>SSE4.1</CPUID>
	<category>Special Math Functions</category>
	<return type="__m128i" varname="dst" etype="UI32"/>
	<parameter type="__m128i" varname="a" etype="UI32"/>
	<parameter type="__m128i" varname="b" etype="UI32"/>
	<description>Compare packed unsigned 32-bit integers in "a" and "b", and store packed minimum values in "dst".</description>
	<operation>
FOR j := 0 to 3
	i := j*32
	dst[i+31:i] := MIN(a[i+31:i], b[i+31:i])
ENDFOR
	</operation>
	<instruction name="PMINUD" form="xmm, xmm" xed="PMINUD_XMMdq_XMMdq"/>
	<header>smmintrin.h</header>
</intrinsic>
'''


def test25():
  return '''
<intrinsic tech="SSE4.1" vexEq="TRUE" name="_mm_insert_epi64">
	<type>Integer</type>
	<CPUID>SSE4.1</CPUID>
	<category>Swizzle</category>
	<return type="__m128i" varname="dst" etype="UI64"/>
	<parameter type="__m128i" varname="a" etype="UI64"/>
	<parameter type="__int64" varname="i" etype="UI64"/>
	<parameter type="const int" varname="imm8" etype="IMM" immwidth="1"/>
	<description>Copy "a" to "dst", and insert the 64-bit integer "i" into "dst" at the location specified by "imm8".</description>
	<operation>
dst[127:0] := a[127:0]
sel := imm8[0]*64
dst[sel+63:sel] := i[63:0]
	</operation>
	<instruction name="PINSRQ" form="xmm, r64, imm8" xed="PINSRQ_XMMdq_GPR64q_IMMb"/>
	<header>smmintrin.h</header>
</intrinsic>
'''


def test26():
  return '''
<intrinsic tech="SSE2" vexEq="TRUE" name="_mm_cvtsi128_si64x">
	<type>Integer</type>
	<CPUID>SSE2</CPUID>
	<category>Convert</category>
	<return type="__int64" varname="dst" etype="UI64"/>
	<parameter type="__m128i" varname="a" etype="UI64"/>
	<description>Copy the lower 64-bit integer in "a" to "dst".</description>
	<operation>
dst[63:0] := a[63:0]
	</operation>
	<instruction name="MOVQ" form="r64, xmm" xed="MOVQ_GPR64_XMMq"/>
	<header>emmintrin.h</header>
</intrinsic>
'''

def test27():
  return '''
<intrinsic tech="SSE2" vexEq="TRUE" name="_mm_andnot_si128">
	<type>Integer</type>
	<CPUID>SSE2</CPUID>
	<category>Logical</category>
	<return type="__m128i" varname="dst" etype="M128"/>
	<parameter type="__m128i" varname="a" etype="M128"/>
	<parameter type="__m128i" varname="b" etype="M128"/>
	<description>Compute the bitwise NOT of 128 bits (representing integer data) in "a" and then AND with "b", and store the result in "dst".</description>
	<operation>
dst[127:0] := ((NOT a[127:0]) AND b[127:0])
	</operation>
	<instruction name="PANDN" form="xmm, xmm" xed="PANDN_XMMdq_XMMdq"/>
	<header>emmintrin.h</header>
</intrinsic>
'''

def test28():
  return '''
<intrinsic tech="SSE2" vexEq="TRUE" name="_mm_and_si128">
	<type>Integer</type>
	<CPUID>SSE2</CPUID>
	<category>Logical</category>
	<return type="__m128i" varname="dst" etype="M128"/>
	<parameter type="__m128i" varname="a" etype="M128"/>
	<parameter type="__m128i" varname="b" etype="M128"/>
	<description>Compute the bitwise AND of 128 bits (representing integer data) in "a" and "b", and store the result in "dst".</description>
	<operation>
dst[127:0] := (a[127:0] AND b[127:0])
	</operation>
	<instruction name="PAND" form="xmm, xmm" xed="PAND_XMMdq_XMMdq"/>
	<header>emmintrin.h</header>
</intrinsic>
'''


def test29():
  return '''
<intrinsic tech="SSE2" vexEq="TRUE" name="_mm_sub_epi64">
	<type>Integer</type>
	<CPUID>SSE2</CPUID>
	<category>Arithmetic</category>
	<return type="__m128i" varname="dst" etype="UI64"/>
	<parameter type="__m128i" varname="a" etype="UI64"/>
	<parameter type="__m128i" varname="b" etype="UI64"/>
	<description>Subtract packed 64-bit integers in "b" from packed 64-bit integers in "a", and store the results in "dst".</description>
	<operation>
FOR j := 0 to 1
	i := j*64
	dst[i+63:i] := a[i+63:i] - b[i+63:i]
ENDFOR
	</operation>
	<instruction name="PSUBQ" form="xmm, xmm" xed="PSUBQ_XMMdq_XMMdq"/>
	<header>emmintrin.h</header>
</intrinsic>
'''


def test30():
  return '''
<intrinsic tech="SSE2" vexEq="TRUE" name="_mm_mul_epu32">
	<type>Integer</type>
	<CPUID>SSE2</CPUID>
	<category>Arithmetic</category>
	<return type="__m128i" varname="dst" etype="UI64"/>
	<parameter type="__m128i" varname="a" etype="UI32"/>
	<parameter type="__m128i" varname="b" etype="UI32"/>
	<description>Multiply the low unsigned 32-bit integers from each packed 64-bit element in "a" and "b", and store the unsigned 64-bit results in "dst".</description>
	<operation>
FOR j := 0 to 1
	i := j*64
	dst[i+63:i] := a[i+31:i] * b[i+31:i]
ENDFOR
	</operation>
	<instruction name="PMULUDQ" form="xmm, xmm" xed="PMULUDQ_XMMdq_XMMdq"/>
	<header>emmintrin.h</header>
</intrinsic>
'''


def test31():
  return '''
<intrinsic tech="SSE2" vexEq="TRUE" name="_mm_mullo_epi16">
	<type>Integer</type>
	<CPUID>SSE2</CPUID>
	<category>Arithmetic</category>
	<return type="__m128i" varname="dst" etype="UI16"/>
	<parameter type="__m128i" varname="a" etype="UI16"/>
	<parameter type="__m128i" varname="b" etype="UI16"/>
	<description>Multiply the packed 16-bit integers in "a" and "b", producing intermediate 32-bit integers, and store the low 16 bits of the intermediate integers in "dst".</description>
	<operation>
FOR j := 0 to 7
	i := j*16
	tmp[31:0] := SignExtend32(a[i+15:i]) * SignExtend32(b[i+15:i])
	dst[i+15:i] := tmp[15:0]
ENDFOR
	</operation>
	<instruction name="PMULLW" form="xmm, xmm" xed="PMULLW_XMMdq_XMMdq"/>
	<header>emmintrin.h</header>
</intrinsic>
'''


def test32():
  return '''
<intrinsic tech="SSE2" vexEq="TRUE" name="_mm_mulhi_epu16">
	<type>Integer</type>
	<CPUID>SSE2</CPUID>
	<category>Arithmetic</category>
	<return type="__m128i" varname="dst" etype="UI16"/>
	<parameter type="__m128i" varname="a" etype="UI16"/>
	<parameter type="__m128i" varname="b" etype="UI16"/>
	<description>Multiply the packed unsigned 16-bit integers in "a" and "b", producing intermediate 32-bit integers, and store the high 16 bits of the intermediate integers in "dst".</description>
	<operation>
FOR j := 0 to 7
	i := j*16
	tmp[31:0] := a[i+15:i] * b[i+15:i]
	dst[i+15:i] := tmp[31:16]
ENDFOR
	</operation>
	<instruction name="PMULHUW" form="xmm, xmm" xed="PMULHUW_XMMdq_XMMdq"/>
	<header>emmintrin.h</header>
</intrinsic>
'''

def test33():
  return '''
<intrinsic tech="SSE2" vexEq="TRUE" name="_mm_avg_epu16">
	<type>Integer</type>
	<CPUID>SSE2</CPUID>
	<category>Probability/Statistics</category>
	<return type="__m128i" varname="dst" etype="UI16"/>
	<parameter type="__m128i" varname="a" etype="UI16"/>
	<parameter type="__m128i" varname="b" etype="UI16"/>
	<description>Average packed unsigned 16-bit integers in "a" and "b", and store the results in "dst".</description>
	<operation>
FOR j := 0 to 7
	i := j*16
	dst[i+15:i] := (a[i+15:i] + b[i+15:i] + 1) &gt;&gt; 1
ENDFOR
	</operation>
	<instruction name="PAVGW" form="xmm, xmm" xed="PAVGW_XMMdq_XMMdq"/>
	<header>emmintrin.h</header>
</intrinsic>
'''


def test34():
  return '''
<intrinsic tech="MMX" name="_mm_cvtsi32_si64">
	<type>Integer</type>
	<CPUID>MMX</CPUID>
	<category>Convert</category>
	<return type="__m64" varname="dst" etype="FP32"/>
	<parameter type="int" varname="a" etype="UI32"/>
	<description>Copy 32-bit integer "a" to the lower elements of "dst", and zero the upper element of "dst".</description>
	<operation>
dst[31:0] := a[31:0]
dst[63:32] := 0
	</operation>
	<instruction name="MOVD" form="mm, r32" xed="MOVD_MMXq_GPR32"/>
	<header>mmintrin.h</header>
</intrinsic>
'''

def test35():
  return '''
<intrinsic tech="MMX" name="_mm_xor_si64">
	<type>Integer</type>
	<CPUID>MMX</CPUID>
	<category>Logical</category>
	<return type="__m64" varname="dst" etype="FP32"/>
	<parameter type="__m64" varname="a" etype="UI64"/>
	<parameter type="__m64" varname="b" etype="UI64"/>
	<description>Compute the bitwise XOR of 64 bits (representing integer data) in "a" and "b", and store the result in "dst".</description>
	<operation>
dst[63:0] := (a[63:0] XOR b[63:0])
	</operation>
	<instruction name="PXOR" form="mm, mm" xed="PXOR_MMXq_MMXq"/>
	<header>mmintrin.h</header>
</intrinsic>
'''


def test36():
  return '''
<intrinsic tech="MMX" name="_mm_andnot_si64">
	<type>Integer</type>
	<CPUID>MMX</CPUID>
	<category>Logical</category>
	<return type="__m64" varname="dst" etype="FP32"/>
	<parameter type="__m64" varname="a" etype="UI64"/>
	<parameter type="__m64" varname="b" etype="UI64"/>
	<description>Compute the bitwise NOT of 64 bits (representing integer data) in "a" and then AND with "b", and store the result in "dst".</description>
	<operation>
dst[63:0] := ((NOT a[63:0]) AND b[63:0])
	</operation>
	<instruction name="PANDN" form="mm, mm" xed="PANDN_MMXq_MMXq"/>
	<header>mmintrin.h</header>
</intrinsic>
'''

def test37():
  return '''
<intrinsic tech="KNC" name="_mm512_kmerge2l1l">
	<type>Mask</type>
	<CPUID>KNCNI</CPUID>
	<category>Mask</category>
	<return type="__mmask16" varname="k" etype="MASK"/>
	<parameter type="__mmask16" varname="k1" etype="MASK"/>
	<parameter type="__mmask16" varname="k2" etype="MASK"/>
	<description>Insert the low element of "k2" into the high element of "k1".</description>
	<operation>
k1[15:8] := k2[7:0]
	</operation>
	<instruction name="KMERGE2L1L" form="k, k"/>
	<header>immintrin.h</header>
</intrinsic>
'''


def test38():
  return '''
<intrinsic tech="KNC" name="_mm512_kmerge2l1h">
	<type>Mask</type>
	<CPUID>KNCNI</CPUID>
	<category>Mask</category>
	<return type="__mmask16" varname="k" etype="MASK"/>
	<parameter type="__mmask16" varname="k1" etype="MASK"/>
	<parameter type="__mmask16" varname="k2" etype="MASK"/>
	<description>Move the high element from "k1" to the low element of "k1", and insert the low element of "k2" into the high element of "k1".</description>
	<operation>
tmp[7:0] := k1[15:8]
k1[15:8] := k2[7:0]
k1[7:0]  := tmp[7:0]
	</operation>
	<instruction name="KMERGE2L1H" form="k, k"/>
	<header>immintrin.h</header>
</intrinsic>
'''

def test39():
  return '''
<intrinsic tech="KNC" name="_mm512_kconcatlo_64">
	<type>Mask</type>
	<CPUID>KNCNI</CPUID>
	<category>Mask</category>
	<return type="__int64" varname="dst" etype="UI64"/>
	<parameter type="__mmask16" varname="k1" etype="MASK"/>
	<parameter type="__mmask16" varname="k2" etype="MASK"/>
	<description>Packs masks "k1" and "k2" into the low 32 bits of "dst". The rest of "dst" is set to 0.</description>
	<operation>
dst[31:16] := k1[15:0]
dst[15:0]  := k2[15:0]
dst[63:32] := 0
	</operation>
	<instruction name="KCONCATL" form="r64, k, k"/>
	<header>immintrin.h</header>
</intrinsic>
'''


def test40():
  return '''
<intrinsic tech="KNC" name="_mm512_mask2int">
	<CPUID>KNCNI</CPUID>
	<category>Mask</category>
	<return type="int" varname="dst" etype="UI32"/>
	<parameter type="__mmask16" varname="k1" etype="MASK"/>
	<description>Converts bit mask "k1" into an integer value, storing the results in "dst".</description>
	<operation>
dst := ZeroExtend32(k1)
	</operation>
	<instruction name="KMOV" form="r32, k"/>
	<header>immintrin.h</header>
</intrinsic>
'''


def test41():
  return '''
<intrinsic tech="KNC" name="_mm512_kswapb">
	<type>Mask</type>
	<CPUID>KNCNI</CPUID>
	<category>Mask</category>
	<return type="__mmask16" varname="k" etype="MASK"/>
	<parameter type="__mmask16" varname="k1" etype="MASK"/>
	<parameter type="__mmask16" varname="k2" etype="MASK"/>
	<description>Moves high byte from "k2" to low byte of "k1", and moves low byte of "k2" to high byte of "k1".</description>
	<operation>
tmp[7:0] := k2[15:8]
k2[15:8] := k1[7:0]
k1[7:0]  := tmp[7:0]
tmp[7:0] := k2[7:0]
k2[7:0]  := k1[15:8]
k1[15:8] := tmp[7:0]
	</operation>
	<instruction name="KMERGE2L1H" form="k, k"/>
	<header>immintrin.h</header>
</intrinsic>
'''

def test42():
  return '''
<intrinsic tech="KNC" name="_mm512_mulhi_epu32">
	<type>Integer</type>
	<CPUID>KNCNI</CPUID>
	<category>Arithmetic</category>
	<return type="__m512i" varname="dst" etype="UI32"/>
	<parameter type="__m512i" varname="a" etype="UI32"/>
	<parameter type="__m512i" varname="b" etype="UI32"/>
	<description>Performs element-by-element multiplication between packed unsigned 32-bit integer elements in "a" and "b" and stores the high 32 bits of each result into "dst".</description>
	<operation>
FOR j := 0 to 15
	i := j*32
	dst[i+31:i] := (a[i+31:i] * b[i+31:i]) &gt;&gt; 32
ENDFOR
	</operation>
	<instruction name="VPMULHUD" form="zmm, zmm, m512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:512] := 0


def test43():
  return '''
<intrinsic tech="KNC" name="_mm512_fmadd_epi32">
	<type>Integer</type>
	<CPUID>KNCNI</CPUID>
	<category>Arithmetic</category>
	<return type="__m512i" varname="dst" etype="UI32"/>
	<parameter type="__m512i" varname="a" etype="UI32"/>
	<parameter type="__m512i" varname="b" etype="UI32"/>
	<parameter type="__m512i" varname="c" etype="UI32"/>
	<description>Multiply packed 32-bit integer elements in "a" and "b", add the intermediate result to packed elements in "c" and store the results in "dst".</description>
	<operation>
FOR j := 0 to 15
	i := j*32
	dst[i+31:i] := (a[i+31:i] * b[i+31:i]) + c[i+31:i]
ENDFOR
	</operation>
	<instruction name="VPMADD231D" form="zmm, zmm, zmm"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:512] := 0


def test44():
  return '''
<intrinsic tech="KNC" name="_mm512_cmplt_epi32_mask">
	<type>Integer</type>
	<type>Mask</type>
	<CPUID>KNCNI</CPUID>
	<category>Compare</category>
	<return type="__mmask16" varname="k" etype="MASK"/>
	<parameter type="__m512i" varname="a" etype="SI32"/>
	<parameter type="__m512i" varname="b" etype="SI32"/>
	<description>Compare packed signed 32-bit integers in "a" and "b" for less-than, and store the results in mask vector "k".</description>
	<operation>
FOR j := 0 to 15
	i := j*32
	k[j] := ( a[i+31:i] &lt; b[i+31:i] ) ? 1 : 0
ENDFOR
k[MAX:16] := 0
	</operation>
	<instruction name="VPCMPLTD" form="k, zmm, zmm"/>
	<header>immintrin.h</header>
</intrinsic>
'''


def test45():
  return '''
<intrinsic tech="Other" name="_blsi_u64">
	<type>Integer</type>
	<CPUID>BMI1</CPUID>
	<category>Bit Manipulation</category>
	<return type="unsigned __int64" varname="dst" etype="UI64"/>
	<parameter type="unsigned __int64" varname="a" etype="UI64"/>
	<description>Extract the lowest set bit from unsigned 64-bit integer "a" and set the corresponding bit in "dst". All other bits in "dst" are zeroed, and all bits are zeroed if no bits are set in "a".</description>
	<operation>
dst := (-a) AND a
	</operation>
	<instruction name="BLSI" form="r64, r64" xed="BLSI_VGPR64q_VGPR64q"/>
	<header>immintrin.h</header>
</intrinsic>
'''


def test46():
  return '''
<intrinsic tech="AVX-512" name="_mm_permutex2var_epi8">
	<CPUID>AVX512_VBMI</CPUID>
	<CPUID>AVX512VL</CPUID>
	<category>Swizzle</category>
	<return type="__m128i" varname="dst" etype="UI8"/>
	<parameter type="__m128i" varname="a" etype="UI8"/>
	<parameter type="__m128i" varname="idx" etype="UI8"/>
	<parameter type="__m128i" varname="b" etype="UI8"/>
	<description>Shuffle 8-bit integers in "a" and "b" using the corresponding selector and index in "idx", and store the results in "dst".</description>
	<operation>
FOR j := 0 to 15
	i := j*8
	off := 8*idx[i+3:i]
	dst[i+7:i] := idx[i+4] ? b[off+7:off] : a[off+7:off]
ENDFOR
	</operation>
	<instruction name="VPERMI2B" form="xmm, xmm, xmm" xed="VPERMI2B_XMMu8_MASKmskw_XMMu8_XMMu8_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:128] := 0


def test47():
  return '''
<intrinsic tech="AVX-512" name="_mm_permutexvar_epi8">
	<CPUID>AVX512_VBMI</CPUID>
	<CPUID>AVX512VL</CPUID>
	<category>Swizzle</category>
	<return type="__m128i" varname="dst" etype="UI8"/>
	<parameter type="__m128i" varname="idx" etype="UI8"/>
	<parameter type="__m128i" varname="a" etype="UI8"/>
	<description>Shuffle 8-bit integers in "a" using the corresponding index in "idx", and store the results in "dst".</description>
	<operation>
FOR j := 0 to 15
	i := j*8
	id := idx[i+3:i]*8
	dst[i+7:i] := a[id+7:id]
ENDFOR
	</operation>
	<instruction name="VPERMB" form="xmm, xmm, xmm" xed="VPERMB_XMMu8_MASKmskw_XMMu8_XMMu8_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:128] := 0


def test48():
  return '''
<intrinsic tech="AVX-512" name="_mm256_permutexvar_epi8">
	<CPUID>AVX512_VBMI</CPUID>
	<CPUID>AVX512VL</CPUID>
	<category>Swizzle</category>
	<return type="__m256i" varname="dst" etype="UI8"/>
	<parameter type="__m256i" varname="idx" etype="UI8"/>
	<parameter type="__m256i" varname="a" etype="UI8"/>
	<description>Shuffle 8-bit integers in "a" across lanes using the corresponding index in "idx", and store the results in "dst".</description>
	<operation>
FOR j := 0 to 31
	i := j*8
	id := idx[i+4:i]*8
	dst[i+7:i] := a[id+7:id]
ENDFOR
	</operation>
	<instruction name="VPERMB" form="ymm, ymm, ymm" xed="VPERMB_YMMu8_MASKmskw_YMMu8_YMMu8_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:256] := 0


def test49():
  return '''
<intrinsic tech="AVX-512" name="_mm256_madd52hi_epu64">
	<CPUID>AVX512IFMA52</CPUID>
	<CPUID>AVX512VL</CPUID>
	<category>Arithmetic</category>
	<return type="__m256i" varname="dst" etype="UI64"/>
	<parameter type="__m256i" varname="a" etype="UI64"/>
	<parameter type="__m256i" varname="b" etype="UI64"/>
	<parameter type="__m256i" varname="c" etype="UI64"/>
	<description>Multiply packed unsigned 52-bit integers in each 64-bit element of "b" and "c" to form a 104-bit intermediate result. Add the high 52-bit unsigned integer from the intermediate result with the corresponding unsigned 64-bit integer in "a", and store the results in "dst".</description>
	<operation>
FOR j := 0 to 3
	i := j*64
	tmp[127:0] := ZeroExtend64(b[i+51:i]) * ZeroExtend64(c[i+51:i])
	dst[i+63:i] := a[i+63:i] + ZeroExtend64(tmp[103:52])
ENDFOR
	</operation>
	<instruction name="VPMADD52HUQ" form="ymm, ymm, ymm" xed="VPMADD52HUQ_YMMu64_MASKmskw_YMMu64_YMMu64_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:256] := 0


def test50():
  return '''
<intrinsic tech="AVX2" name="_mm256_packs_epi32">
	<type>Integer</type>
	<CPUID>AVX2</CPUID>
	<category>Miscellaneous</category>
	<return type="__m256i" varname="dst" etype="SI16"/>
	<parameter type="__m256i" varname="a" etype="SI32"/>
	<parameter type="__m256i" varname="b" etype="SI32"/>
	<description>Convert packed signed 32-bit integers from "a" and "b" to packed 16-bit integers using signed saturation, and store the results in "dst".</description>
	<operation>
dst[15:0] := Saturate16(a[31:0])
dst[31:16] := Saturate16(a[63:32])
dst[47:32] := Saturate16(a[95:64])
dst[63:48] := Saturate16(a[127:96])
dst[79:64] := Saturate16(b[31:0])
dst[95:80] := Saturate16(b[63:32])
dst[111:96] := Saturate16(b[95:64])
dst[127:112] := Saturate16(b[127:96])
dst[143:128] := Saturate16(a[159:128])
dst[159:144] := Saturate16(a[191:160])
dst[175:160] := Saturate16(a[223:192])
dst[191:176] := Saturate16(a[255:224])
dst[207:192] := Saturate16(b[159:128])
dst[223:208] := Saturate16(b[191:160])
dst[239:224] := Saturate16(b[223:192])
dst[255:240] := Saturate16(b[255:224])
	</operation>
	<instruction name="VPACKSSDW" form="ymm, ymm, ymm" xed="VPACKSSDW_YMMqq_YMMqq_YMMqq"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:256] := 0


def test51():
  return '''
<intrinsic tech="AVX-512/KNC" name="_mm512_xor_epi64">
	<type>Integer</type>
	<CPUID>AVX512F/KNCNI</CPUID>
	<category>Logical</category>
	<return type="__m512i" varname="dst" etype="UI64"/>
	<parameter type="__m512i" varname="a" etype="UI64"/>
	<parameter type="__m512i" varname="b" etype="UI64"/>
	<description>Compute the bitwise XOR of packed 64-bit integers in "a" and "b", and store the results in "dst".</description>
	<operation>
FOR j := 0 to 7
	i := j*64
	dst[i+63:i] := a[i+63:i] XOR b[i+63:i]
ENDFOR
	</operation>
	<instruction name="VPXORQ" form="zmm, zmm, zmm" xed="VPXORQ_ZMMu64_MASKmskw_ZMMu64_ZMMu64_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:512] := 0


def test52():
  return '''
<intrinsic tech="AVX-512/KNC" name="_mm512_test_epi32_mask">
	<type>Integer</type>
	<type>Mask</type>
	<CPUID>AVX512F/KNCNI</CPUID>
	<category>Logical</category>
	<return type="__mmask16" varname="k" etype="MASK"/>
	<parameter type="__m512i" varname="a" etype="UI32"/>
	<parameter type="__m512i" varname="b" etype="UI32"/>
	<description>Compute the bitwise AND of packed 32-bit integers in "a" and "b", producing intermediate 32-bit values, and set the corresponding bit in result mask "k" if the intermediate value is non-zero.</description>
	<operation>
FOR j := 0 to 15
	i := j*32
	k[j] := ((a[i+31:i] AND b[i+31:i]) != 0) ? 1 : 0
ENDFOR
	</operation>
	<instruction name="VPTESTMD" form="k, zmm, zmm" xed="VPTESTMD_MASKmskw_MASKmskw_ZMMu32_ZMMu32_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#k[MAX:16] := 0


def test53():
  return '''
<intrinsic tech="AVX-512/KNC" name="_mm512_cmpneq_epu32_mask">
	<type>Integer</type>
	<type>Mask</type>
	<CPUID>AVX512F/KNCNI</CPUID>
	<category>Compare</category>
	<return type="__mmask16" varname="k" etype="MASK"/>
	<parameter type="__m512i" varname="a" etype="UI32"/>
	<parameter type="__m512i" varname="b" etype="UI32"/>
	<description>Compare packed unsigned 32-bit integers in "a" and "b" for not-equal, and store the results in mask vector "k".</description>
	<operation>
FOR j := 0 to 15
	i := j*32
	k[j] := ( a[i+31:i] != b[i+31:i] ) ? 1 : 0
ENDFOR
	</operation>
	<instruction name="VPCMPUD" form="k, zmm, zmm, imm8" xed="VPCMPUD_MASKmskw_MASKmskw_ZMMu32_ZMMu32_IMM8_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#k[MAX:16] := 0


def test54():
  return '''
<intrinsic tech="AVX-512" name="_mm512_permutex2var_epi64">
	<type>Integer</type>
	<CPUID>AVX512F</CPUID>
	<category>Swizzle</category>
	<return type="__m512i" varname="dst" etype="UI64"/>
	<parameter type="__m512i" varname="a" etype="UI64"/>
	<parameter type="__m512i" varname="idx" etype="UI64"/>
	<parameter type="__m512i" varname="b" etype="UI64"/>
	<description>Shuffle 64-bit integers in "a" and "b" across lanes using the corresponding selector and index in "idx", and store the results in "dst".</description>
	<operation>
FOR j := 0 to 7
	i := j*64
	off := idx[i+2:i]*64
	dst[i+63:i] := idx[i+3] ? b[off+63:off] : a[off+63:off]
ENDFOR
	</operation>
	<instruction name="VPERMI2Q" form="zmm, zmm, zmm" xed="VPERMI2Q_ZMMu64_MASKmskw_ZMMu64_ZMMu64_AVX512"/>
	<instruction name="VPERMT2Q" form="zmm, zmm, zmm" xed="VPERMT2Q_ZMMu64_MASKmskw_ZMMu64_ZMMu64_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:512] := 0


def test55():
  return '''
<intrinsic tech="SSE" name="_mm_insert_pi16">
	<type>Integer</type>
	<CPUID>SSE</CPUID>
	<category>Swizzle</category>
	<return type="__m64" varname="dst" etype="UI16"/>
	<parameter type="__m64" varname="a" etype="UI16"/>
	<parameter type="int" varname="i" etype="UI16"/>
	<parameter type="int" varname="imm8" etype="IMM" immwidth="2"/>
	<description>Copy "a" to "dst", and insert the 16-bit integer "i" into "dst" at the location specified by "imm8".</description>
	<operation>
dst[63:0] := a[63:0]
sel := imm8[1:0]*16
dst[sel+15:sel] := i[15:0]
	</operation>
	<instruction name="PINSRW" form="mm, r32, imm8" xed="PINSRW_MMXq_GPR32_IMMb"/>
	<header>xmmintrin.h</header>
</intrinsic>
'''


def test56():
  return '''
<intrinsic tech="AVX2" name="_mm_broadcastb_epi8">
	<type>Integer</type>
	<CPUID>AVX2</CPUID>
	<category>Swizzle</category>
	<return type="__m128i" varname="dst" etype="UI8"/>
	<parameter type="__m128i" varname="a" etype="UI8"/>
	<description>Broadcast the low packed 8-bit integer from "a" to all elements of "dst".</description>
	<operation>
FOR j := 0 to 15
	i := j*8
	dst[i+7:i] := a[7:0]
ENDFOR
	</operation>
	<instruction name="VPBROADCASTB" form="xmm, xmm" xed="VPBROADCASTB_XMMdq_XMMb"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:128] := 0


def test57():
  return '''
  <intrinsic tech="AVX2" name="_mm256_broadcastsi128_si256">
	<type>Integer</type>
	<CPUID>AVX2</CPUID>
	<category>Swizzle</category>
	<return type="__m256i" varname="dst" etype="M128"/>
	<parameter type="__m128i" varname="a" etype="M128"/>
	<description>Broadcast 128 bits of integer data from "a" to all 128-bit lanes in "dst".</description>
	<operation>
dst[127:0] := a[127:0]
dst[255:128] := a[127:0]
	</operation>
	<instruction name="VBROADCASTI128" form="ymm, m128" xed="VBROADCASTI128_YMMqq_MEMdq"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:256] := 0


def test58():
  return '''
<intrinsic tech="AVX2" name="_mm256_hadd_epi16">
	<type>Integer</type>
	<CPUID>AVX2</CPUID>
	<category>Arithmetic</category>
	<return type="__m256i" varname="dst" etype="UI16"/>
	<parameter type="__m256i" varname="a" etype="UI16"/>
	<parameter type="__m256i" varname="b" etype="UI16"/>
	<description>Horizontally add adjacent pairs of 16-bit integers in "a" and "b", and pack the signed 16-bit results in "dst".</description>
	<operation>
dst[15:0] := a[31:16] + a[15:0]
dst[31:16] := a[63:48] + a[47:32]
dst[47:32] := a[95:80] + a[79:64]
dst[63:48] := a[127:112] + a[111:96]
dst[79:64] := b[31:16] + b[15:0]
dst[95:80] := b[63:48] + b[47:32]
dst[111:96] := b[95:80] + b[79:64]
dst[127:112] := b[127:112] + b[111:96]
dst[143:128] := a[159:144] + a[143:128]
dst[159:144] := a[191:176] + a[175:160]
dst[175:160] := a[223:208] + a[207:192]
dst[191:176] := a[255:240] + a[239:224]
dst[207:192] := b[159:144] + b[143:128]
dst[223:208] := b[191:176] + b[175:160]
dst[239:224] := b[223:208] + b[207:192]
dst[255:240] := b[255:240] + b[239:224]
	</operation>
	<instruction name="VPHADDW" form="ymm, ymm, ymm" xed="VPHADDW_YMMqq_YMMqq_YMMqq"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:256] := 0


# Fix rerolling pass
def test59():
  return '''
<intrinsic tech="AVX2" name="_mm256_hsub_epi16">
	<type>Integer</type>
	<CPUID>AVX2</CPUID>
	<category>Arithmetic</category>
	<return type="__m256i" varname="dst" etype="UI16"/>
	<parameter type="__m256i" varname="a" etype="UI16"/>
	<parameter type="__m256i" varname="b" etype="UI16"/>
	<description>Horizontally subtract adjacent pairs of 16-bit integers in "a" and "b", and pack the signed 16-bit results in "dst".</description>
	<operation>
dst[15:0] := a[15:0] - a[31:16]
dst[31:16] := a[47:32] - a[63:48]
dst[47:32] := a[79:64] - a[95:80]
dst[63:48] := a[111:96] - a[127:112]
dst[79:64] := b[15:0] - b[31:16]
dst[95:80] := b[47:32] - b[63:48]
dst[111:96] := b[79:64] - b[95:80]
dst[127:112] := b[111:96] - b[127:112]
dst[143:128] := a[143:128] - a[159:144]
dst[159:144] := a[175:160] - a[191:176]
dst[175:160] := a[207:192] - a[223:208]
dst[191:176] := a[239:224] - a[255:240]
dst[207:192] := b[143:128] - b[159:144]
dst[223:208] := b[175:160] - b[191:176]
dst[239:224] := b[207:192] - b[223:208]
dst[255:240] := b[239:224] - b[255:240]
	</operation>
	<instruction name="VPHSUBW" form="ymm, ymm, ymm" xed="VPHSUBW_YMMqq_YMMqq_YMMqq"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:256] := 0


def test60():
  return '''
<intrinsic tech="AVX2" name="_mm256_movemask_epi8">
	<type>Integer</type>
	<CPUID>AVX2</CPUID>
	<category>Miscellaneous</category>
	<return type="int" varname="dst" etype="UI32"/>
	<parameter type="__m256i" varname="a" etype="UI8"/>
	<description>Create mask from the most significant bit of each 8-bit element in "a", and store the result in "dst".</description>
	<operation>
FOR j := 0 to 31
	i := j*8
	dst[j] := a[i+7]
ENDFOR
	</operation>
	<instruction name="VPMOVMSKB" form="r32, ymm" xed="VPMOVMSKB_GPR32d_YMMqq"/>
	<header>immintrin.h</header>
</intrinsic>
'''

def test61():
  return '''
<intrinsic tech="AVX-512" name="_mm_broadcast_i32x2">
	<CPUID>AVX512VL</CPUID>
	<CPUID>AVX512DQ</CPUID>
	<category>Miscellaneous</category>
	<return type="__m128i" varname="dst" etype="UI32"/>
	<parameter type="__m128i" varname="a" etype="UI32"/>
	<description>Broadcast the lower 2 packed 32-bit integers from "a" to all elements of "dst.</description>
	<operation>
FOR j := 0 to 3
	i := j*32
	n := (j % 2)*32
	dst[i+31:i] := a[n+31:n]
ENDFOR
	</operation>
	<instruction name="VBROADCASTI32X2" form="xmm, xmm" xed="VBROADCASTI32X2_XMMu32_MASKmskw_XMMu32_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:128] := 0

def test62():
  return '''
<intrinsic tech="SSE4.1" vexEq="TRUE" name="_mm_cvtepu8_epi16">
	<type>Integer</type>
	<CPUID>SSE4.1</CPUID>
	<category>Convert</category>
	<return type="__m128i" varname="dst" etype="UI16"/>
	<parameter type="__m128i" varname="a" etype="UI8"/>
	<description>Zero extend packed unsigned 8-bit integers in "a" to packed 16-bit integers, and store the results in "dst".</description>
	<operation>
FOR j := 0 to 7
	i := j*8
	l := j*16
	dst[l+15:l] := ZeroExtend16(a[i+7:i])
ENDFOR
	</operation>
	<instruction name="PMOVZXBW" form="xmm, xmm" xed="PMOVZXBW_XMMdq_XMMq"/>
	<header>smmintrin.h</header>
</intrinsic>
'''

def test63():
  return '''
<intrinsic tech="SSE4.1" vexEq="TRUE" name="_mm_cvtepi32_epi64">
	<type>Integer</type>
	<CPUID>SSE4.1</CPUID>
	<category>Convert</category>
	<return type="__m128i" varname="dst" etype="SI64"/>
	<parameter type="__m128i" varname="a" etype="SI32"/>
	<description>Sign extend packed 32-bit integers in "a" to packed 64-bit integers, and store the results in "dst".</description>
	<operation>
FOR j := 0 to 1
	i := 64*j
	k := 32*j
	dst[i+63:i] := SignExtend64(a[k+31:k])
ENDFOR
	</operation>
	<instruction name="PMOVSXDQ" form="xmm, xmm" xed="PMOVSXDQ_XMMdq_XMMq"/>
	<header>smmintrin.h</header>
</intrinsic>
'''

def test64():
  return '''
<intrinsic tech="SSE4.1" vexEq="TRUE" name="_mm_packus_epi32">
	<type>Integer</type>
	<CPUID>SSE4.1</CPUID>
	<category>Convert</category>
	<category>Miscellaneous</category>
	<return type="__m128i" varname="dst" etype="UI16"/>
	<parameter type="__m128i" varname="a" etype="SI32"/>
	<parameter type="__m128i" varname="b" etype="SI32"/>
	<description>Convert packed signed 32-bit integers from "a" and "b" to packed 16-bit integers using unsigned saturation, and store the results in "dst".</description>
	<operation>
dst[15:0] := SaturateU16(a[31:0])
dst[31:16] := SaturateU16(a[63:32])
dst[47:32] := SaturateU16(a[95:64])
dst[63:48] := SaturateU16(a[127:96])
dst[79:64] := SaturateU16(b[31:0])
dst[95:80] := SaturateU16(b[63:32])
dst[111:96] := SaturateU16(b[95:64])
dst[127:112] := SaturateU16(b[127:96])
	</operation>
	<instruction name="PACKUSDW" form="xmm, xmm" xed="PACKUSDW_XMMdq_XMMdq"/>
	<header>smmintrin.h</header>
</intrinsic>
'''

def test65():
  return '''
<intrinsic tech="SSE4.1" vexEq="TRUE" name="_mm_mul_epi32">
	<type>Integer</type>
	<CPUID>SSE4.1</CPUID>
	<category>Arithmetic</category>
	<return type="__m128i" varname="dst" etype="SI64"/>
	<parameter type="__m128i" varname="a" etype="SI32"/>
	<parameter type="__m128i" varname="b" etype="SI32"/>
	<description>Multiply the low signed 32-bit integers from each packed 64-bit element in "a" and "b", and store the signed 64-bit results in "dst".</description>
	<operation>
FOR j := 0 to 1
	i := j*64
	dst[i+63:i] := SignExtend64(a[i+31:i]) * SignExtend64(b[i+31:i])
ENDFOR
	</operation>
	<instruction name="PMULDQ" form="xmm, xmm" xed="PMULDQ_XMMdq_XMMdq"/>
	<header>smmintrin.h</header>
</intrinsic>
'''


def test66():
  return '''
<intrinsic tech="SSSE3" vexEq="TRUE" name="_mm_hsubs_epi16">
	<type>Integer</type>
	<CPUID>SSSE3</CPUID>
	<category>Arithmetic</category>
	<return type="__m128i" varname="dst" etype="SI16"/>
	<parameter type="__m128i" varname="a" etype="SI16"/>
	<parameter type="__m128i" varname="b" etype="SI16"/>
	<description>Horizontally subtract adjacent pairs of signed 16-bit integers in "a" and "b" using saturation, and pack the signed 16-bit results in "dst".</description>
	<operation>
dst[15:0] := Saturate16(a[15:0] - a[31:16])
dst[31:16] := Saturate16(a[47:32] - a[63:48])
dst[47:32] := Saturate16(a[79:64] - a[95:80])
dst[63:48] := Saturate16(a[111:96] - a[127:112])
dst[79:64] := Saturate16(b[15:0] - b[31:16])
dst[95:80] := Saturate16(b[47:32] - b[63:48])
dst[111:96] := Saturate16(b[79:64] - b[95:80])
dst[127:112] := Saturate16(b[111:96] - b[127:112])
	</operation>
	<instruction name="PHSUBSW" form="xmm, xmm" xed="PHSUBSW_XMMdq_XMMdq"/>
	<header>tmmintrin.h</header>
</intrinsic>
'''

def test67():
  return '''
<intrinsic tech="AVX2" name="_mm256_adds_epi16">
	<type>Integer</type>
	<CPUID>AVX2</CPUID>
	<category>Arithmetic</category>
	<return type="__m256i" varname="dst" etype="UI16"/>
	<parameter type="__m256i" varname="a" etype="SI16"/>
	<parameter type="__m256i" varname="b" etype="SI16"/>
	<description>Add packed 16-bit integers in "a" and "b" using saturation, and store the results in "dst".</description>
	<operation>
FOR j := 0 to 15
	i := j*16
	dst[i+15:i] := Saturate16( a[i+15:i] + b[i+15:i] )
ENDFOR
	</operation>
	<instruction name="VPADDSW" form="ymm, ymm, ymm" xed="VPADDSW_YMMqq_YMMqq_YMMqq"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:256] := 0


# Compiles but rerolling needs fixing
def test68():
  return '''
<intrinsic tech="AVX2" name="_mm256_packs_epi16">
	<type>Integer</type>
	<CPUID>AVX2</CPUID>
	<category>Miscellaneous</category>
	<return type="__m256i" varname="dst" etype="SI8"/>
	<parameter type="__m256i" varname="a" etype="SI16"/>
	<parameter type="__m256i" varname="b" etype="SI16"/>
	<description>Convert packed signed 16-bit integers from "a" and "b" to packed 8-bit integers using signed saturation, and store the results in "dst".</description>
	<operation>
dst[7:0] := Saturate8(a[15:0])
dst[15:8] := Saturate8(a[31:16])
dst[23:16] := Saturate8(a[47:32])
dst[31:24] := Saturate8(a[63:48])
dst[39:32] := Saturate8(a[79:64])
dst[47:40] := Saturate8(a[95:80])
dst[55:48] := Saturate8(a[111:96])
dst[63:56] := Saturate8(a[127:112])
dst[71:64] := Saturate8(b[15:0])
dst[79:72] := Saturate8(b[31:16])
dst[87:80] := Saturate8(b[47:32])
dst[95:88] := Saturate8(b[63:48])
dst[103:96] := Saturate8(b[79:64])
dst[111:104] := Saturate8(b[95:80])
dst[119:112] := Saturate8(b[111:96])
dst[127:120] := Saturate8(b[127:112])
dst[135:128] := Saturate8(a[143:128])
dst[143:136] := Saturate8(a[159:144])
dst[151:144] := Saturate8(a[175:160])
dst[159:152] := Saturate8(a[191:176])
dst[167:160] := Saturate8(a[207:192])
dst[175:168] := Saturate8(a[223:208])
dst[183:176] := Saturate8(a[239:224])
dst[191:184] := Saturate8(a[255:240])
dst[199:192] := Saturate8(b[143:128])
dst[207:200] := Saturate8(b[159:144])
dst[215:208] := Saturate8(b[175:160])
dst[223:216] := Saturate8(b[191:176])
dst[231:224] := Saturate8(b[207:192])
dst[239:232] := Saturate8(b[223:208])
dst[247:240] := Saturate8(b[239:224])
dst[255:248] := Saturate8(b[255:240])
	</operation>
	<instruction name="VPACKSSWB" form="ymm, ymm, ymm" xed="VPACKSSWB_YMMqq_YMMqq_YMMqq"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:256] := 0


def test69():
  return '''
<intrinsic tech="AVX2" name="_mm256_abs_epi16">
	<type>Integer</type>
	<CPUID>AVX2</CPUID>
	<category>Special Math Functions</category>
	<return type="__m256i" varname="dst" etype="UI16"/>
	<parameter type="__m256i" varname="a" etype="SI16"/>
	<description>Compute the absolute value of packed signed 16-bit integers in "a", and store the unsigned results in "dst".</description>
	<operation>
FOR j := 0 to 15
	i := j*16
	dst[i+15:i] := ABS(a[i+15:i])
ENDFOR
	</operation>
	<instruction name="VPABSW" form="ymm, ymm" xed="VPABSW_YMMqq_YMMqq"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:256] := 0


def test70():
  return '''
<intrinsic tech="AVX2" name="_mm256_hadds_epi16">
	<type>Integer</type>
	<CPUID>AVX2</CPUID>
	<category>Arithmetic</category>
	<return type="__m256i" varname="dst" etype="UI16"/>
	<parameter type="__m256i" varname="a" etype="SI16"/>
	<parameter type="__m256i" varname="b" etype="SI16"/>
	<description>Horizontally add adjacent pairs of signed 16-bit integers in "a" and "b" using saturation, and pack the signed 16-bit results in "dst".</description>
	<operation>
dst[15:0] := Saturate16(a[31:16] + a[15:0])
dst[31:16] := Saturate16(a[63:48] + a[47:32])
dst[47:32] := Saturate16(a[95:80] + a[79:64])
dst[63:48] := Saturate16(a[127:112] + a[111:96])
dst[79:64] := Saturate16(b[31:16] + b[15:0])
dst[95:80] := Saturate16(b[63:48] + b[47:32])
dst[111:96] := Saturate16(b[95:80] + b[79:64])
dst[127:112] := Saturate16(b[127:112] + b[111:96])
dst[143:128] := Saturate16(a[159:144] + a[143:128])
dst[159:144] := Saturate16(a[191:176] + a[175:160])
dst[175:160] := Saturate16(a[223:208] + a[207:192])
dst[191:176] := Saturate16(a[255:240] + a[239:224])
dst[207:192] := Saturate16(b[159:144] + b[143:128])
dst[223:208] := Saturate16(b[191:176] + b[175:160])
dst[239:224] := Saturate16(b[223:208] + b[207:192])
dst[255:240] := Saturate16(b[255:240] + b[239:224])
	</operation>
	<instruction name="VPHADDSW" form="ymm, ymm, ymm" xed="VPHADDSW_YMMqq_YMMqq_YMMqq"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:256] := 0


def test71():
  return '''
<intrinsic tech="AVX2" name="_mm256_mullo_epi16">
	<type>Integer</type>
	<CPUID>AVX2</CPUID>
	<category>Arithmetic</category>
	<return type="__m256i" varname="dst" etype="UI16"/>
	<parameter type="__m256i" varname="a" etype="SI16"/>
	<parameter type="__m256i" varname="b" etype="SI16"/>
	<description>Multiply the packed signed 16-bit integers in "a" and "b", producing intermediate 32-bit integers, and store the low 16 bits of the intermediate integers in "dst".</description>
	<operation>
FOR j := 0 to 15
	i := j*16
	tmp[31:0] := SignExtend32(a[i+15:i]) * SignExtend32(b[i+15:i])
	dst[i+15:i] := tmp[15:0]
ENDFOR
	</operation>
	<instruction name="VPMULLW" form="ymm, ymm, ymm" xed="VPMULLW_YMMqq_YMMqq_YMMqq"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:256] := 0


def test72():
  return '''
<intrinsic tech="AVX2" name="_mm256_maddubs_epi16">
	<type>Integer</type>
	<CPUID>AVX2</CPUID>
	<category>Arithmetic</category>
	<return type="__m256i" varname="dst" etype="SI16"/>
	<parameter type="__m256i" varname="a" etype="UI8"/>
	<parameter type="__m256i" varname="b" etype="SI8"/>
	<description>Vertically multiply each unsigned 8-bit integer from "a" with the corresponding signed 8-bit integer from "b", producing intermediate signed 16-bit integers. Horizontally add adjacent pairs of intermediate signed 16-bit integers, and pack the saturated results in "dst".</description>
	<operation>
FOR j := 0 to 15
	i := j*16
	dst[i+15:i] := Saturate16( a[i+15:i+8]*b[i+15:i+8] + a[i+7:i]*b[i+7:i] )
ENDFOR
	</operation>
	<instruction name="VPMADDUBSW" form="ymm, ymm, ymm" xed="VPMADDUBSW_YMMqq_YMMqq_YMMqq"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:256] := 0


def test73():
  return '''
<intrinsic tech="SSSE3" vexEq="TRUE" name="_mm_abs_epi16">
	<type>Integer</type>
	<CPUID>SSSE3</CPUID>
	<category>Special Math Functions</category>
	<return type="__m128i" varname="dst" etype="UI16"/>
	<parameter type="__m128i" varname="a" etype="SI16"/>
	<description>Compute the absolute value of packed signed 16-bit integers in "a", and store the unsigned results in "dst".</description>
	<operation>
FOR j := 0 to 7
	i := j*16
	dst[i+15:i] := ABS(a[i+15:i])
ENDFOR
	</operation>
	<instruction name="PABSW" form="xmm, xmm" xed="PABSW_XMMdq_XMMdq"/>
	<header>tmmintrin.h</header>
</intrinsic>
'''

def test74():
  return '''
<intrinsic tech="SSSE3" name="_mm_abs_pi16">
	<type>Integer</type>
	<CPUID>SSSE3</CPUID>
	<category>Special Math Functions</category>
	<return type="__m64" varname="dst" etype="UI16"/>
	<parameter type="__m64" varname="a" etype="SI16"/>
	<description>Compute the absolute value of packed signed 16-bit integers in "a", and store the unsigned results in "dst".</description>
	<operation>
FOR j := 0 to 3
	i := j*16
	dst[i+15:i] := ABS(Int(a[i+15:i]))
ENDFOR
	</operation>
	<instruction name="PABSW" form="mm, mm" xed="PABSW_MMXq_MMXq"/>
	<header>tmmintrin.h</header>
</intrinsic>
'''

def test75():
  return '''
<intrinsic tech="SSE2" vexEq="TRUE" name="_mm_madd_epi16">
	<type>Integer</type>
	<CPUID>SSE2</CPUID>
	<category>Arithmetic</category>
	<return type="__m128i" varname="dst" etype="SI32"/>
	<parameter type="__m128i" varname="a" etype="SI16"/>
	<parameter type="__m128i" varname="b" etype="SI16"/>
	<description>Multiply packed signed 16-bit integers in "a" and "b", producing intermediate signed 32-bit integers. Horizontally add adjacent pairs of intermediate 32-bit integers, and pack the results in "dst".</description>
	<operation>
FOR j := 0 to 3
	i := j*32
	dst[i+31:i] := SignExtend32(a[i+31:i+16]*b[i+31:i+16]) + SignExtend32(a[i+15:i]*b[i+15:i])
ENDFOR
	</operation>
	<instruction name="PMADDWD" form="xmm, xmm" xed="PMADDWD_XMMdq_XMMdq"/>
	<header>emmintrin.h</header>
</intrinsic>
'''

def test76():
  return '''
<intrinsic tech="MMX" name="_m_pmulhw">
	<type>Integer</type>
	<CPUID>MMX</CPUID>
	<category>Arithmetic</category>
	<return type="__m64" varname="dst" etype="FP32"/>
	<parameter type="__m64" varname="a" etype="SI64"/>
	<parameter type="__m64" varname="b" etype="SI64"/>
	<description>Multiply the packed signed 16-bit integers in "a" and "b", producing intermediate 32-bit integers, and store the high 16 bits of the intermediate integers in "dst".</description>
	<operation>
FOR j := 0 to 3
	i := j*16
	tmp[31:0] := SignExtend32(a[i+15:i]) * SignExtend32(b[i+15:i])
	dst[i+15:i] := tmp[31:16]
ENDFOR
	</operation>
	<instruction name="PMULHW" form="mm, mm" xed="PMULHW_MMXq_MMXq"/>
	<header>mmintrin.h</header>
</intrinsic>
'''

def test77():
  return '''
<intrinsic tech="AVX-512" name="_mm512_packs_epi16">
	<type>Integer</type>
	<CPUID>AVX512BW</CPUID>
	<category>Convert</category>
	<category>Miscellaneous</category>
	<return type="__m512i" varname="dst" etype="SI8"/>
	<parameter type="__m512i" varname="a" etype="SI16"/>
	<parameter type="__m512i" varname="b" etype="SI16"/>
	<description>Convert packed signed 16-bit integers from "a" and "b" to packed 8-bit integers using signed saturation, and store the results in "dst".</description>
	<operation>
dst[7:0] := Saturate8(a[15:0])
dst[15:8] := Saturate8(a[31:16])
dst[23:16] := Saturate8(a[47:32])
dst[31:24] := Saturate8(a[63:48])
dst[39:32] := Saturate8(a[79:64])
dst[47:40] := Saturate8(a[95:80])
dst[55:48] := Saturate8(a[111:96])
dst[63:56] := Saturate8(a[127:112])
dst[71:64] := Saturate8(b[15:0])
dst[79:72] := Saturate8(b[31:16])
dst[87:80] := Saturate8(b[47:32])
dst[95:88] := Saturate8(b[63:48])
dst[103:96] := Saturate8(b[79:64])
dst[111:104] := Saturate8(b[95:80])
dst[119:112] := Saturate8(b[111:96])
dst[127:120] := Saturate8(b[127:112])
dst[135:128] := Saturate8(a[143:128])
dst[143:136] := Saturate8(a[159:144])
dst[151:144] := Saturate8(a[175:160])
dst[159:152] := Saturate8(a[191:176])
dst[167:160] := Saturate8(a[207:192])
dst[175:168] := Saturate8(a[223:208])
dst[183:176] := Saturate8(a[239:224])
dst[191:184] := Saturate8(a[255:240])
dst[199:192] := Saturate8(b[143:128])
dst[207:200] := Saturate8(b[159:144])
dst[215:208] := Saturate8(b[175:160])
dst[223:216] := Saturate8(b[191:176])
dst[231:224] := Saturate8(b[207:192])
dst[239:232] := Saturate8(b[223:208])
dst[247:240] := Saturate8(b[239:224])
dst[255:248] := Saturate8(b[255:240])
dst[263:256] := Saturate8(a[271:256])
dst[271:264] := Saturate8(a[287:272])
dst[279:272] := Saturate8(a[303:288])
dst[287:280] := Saturate8(a[319:304])
dst[295:288] := Saturate8(a[335:320])
dst[303:296] := Saturate8(a[351:336])
dst[311:304] := Saturate8(a[367:352])
dst[319:312] := Saturate8(a[383:368])
dst[327:320] := Saturate8(b[271:256])
dst[335:328] := Saturate8(b[287:272])
dst[343:336] := Saturate8(b[303:288])
dst[351:344] := Saturate8(b[319:304])
dst[359:352] := Saturate8(b[335:320])
dst[367:360] := Saturate8(b[351:336])
dst[375:368] := Saturate8(b[367:352])
dst[383:376] := Saturate8(b[383:368])
dst[391:384] := Saturate8(a[399:384])
dst[399:392] := Saturate8(a[415:400])
dst[407:400] := Saturate8(a[431:416])
dst[415:408] := Saturate8(a[447:432])
dst[423:416] := Saturate8(a[463:448])
dst[431:424] := Saturate8(a[479:464])
dst[439:432] := Saturate8(a[495:480])
dst[447:440] := Saturate8(a[511:496])
dst[455:448] := Saturate8(b[399:384])
dst[463:456] := Saturate8(b[415:400])
dst[471:464] := Saturate8(b[431:416])
dst[479:472] := Saturate8(b[447:432])
dst[487:480] := Saturate8(b[463:448])
dst[495:488] := Saturate8(b[479:464])
dst[503:496] := Saturate8(b[495:480])
dst[511:504] := Saturate8(b[511:496])
	</operation>
	<instruction name="VPACKSSWB" form="zmm, zmm, zmm" xed="VPACKSSWB_ZMMi8_MASKmskw_ZMMi16_ZMMi16_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:512] := 0


def test78():
  return '''
<intrinsic tech="MMX" name="_m_pcmpeqd">
	<type>Integer</type>
	<CPUID>MMX</CPUID>
	<category>Compare</category>
	<return type="__m64" varname="dst" etype="FP32"/>
	<parameter type="__m64" varname="a" etype="UI64"/>
	<parameter type="__m64" varname="b" etype="UI64"/>
	<description>Compare packed 32-bit integers in "a" and "b" for equality, and store the results in "dst".</description>
	<operation>
FOR j := 0 to 1
	i := j*32
	dst[i+31:i] := ( a[i+31:i] == b[i+31:i] ) ? 0xFFFFFFFF : 0
ENDFOR
	</operation>
	<instruction name="PCMPEQD" form="mm, mm" xed="PCMPEQD_MMXq_MMXq"/>
	<header>mmintrin.h</header>
</intrinsic>
'''

def test79():
  return '''
<intrinsic tech="AVX-512" name="_mm256_cmplt_epi8_mask">
	<type>Integer</type>
	<type>Mask</type>
	<CPUID>AVX512VL</CPUID>
	<CPUID>AVX512BW</CPUID>
	<category>Compare</category>
	<return type="__mmask32" varname="k" etype="MASK"/>
	<parameter type="__m256i" varname="a" etype="SI8"/>
	<parameter type="__m256i" varname="b" etype="SI8"/>
	<description>Compare packed signed 8-bit integers in "a" and "b" for less-than, and store the results in mask vector "k".</description>
	<operation>
FOR j := 0 to 31
	i := j*8
	k[j] := ( a[i+7:i] &lt; b[i+7:i] ) ? 1 : 0
ENDFOR
	</operation>
	<instruction name="VPCMPB" form="k, ymm, ymm" xed="VPCMPB_MASKmskw_MASKmskw_YMMi8_YMMi8_IMM8_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#k[MAX:32] := 0


def test80():
  return '''
<intrinsic tech="AVX-512" name="_mm256_cmpneq_epi8_mask">
	<type>Integer</type>
	<type>Mask</type>
	<CPUID>AVX512VL</CPUID>
	<CPUID>AVX512BW</CPUID>
	<category>Compare</category>
	<return type="__mmask32" varname="k" etype="MASK"/>
	<parameter type="__m256i" varname="a" etype="SI8"/>
	<parameter type="__m256i" varname="b" etype="SI8"/>
	<description>Compare packed signed 8-bit integers in "a" and "b" for not-equal, and store the results in mask vector "k".</description>
	<operation>
FOR j := 0 to 31
	i := j*8
	k[j] := ( a[i+7:i] != b[i+7:i] ) ? 1 : 0
ENDFOR
	</operation>
	<instruction name="VPCMPB" form="k, ymm, ymm" xed="VPCMPB_MASKmskw_MASKmskw_YMMi8_YMMi8_IMM8_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#k[MAX:32] := 0


def test81():
  return '''
<intrinsic tech="KNC" name="_mm512_kxnor">
	<type>Mask</type>
	<CPUID>KNCNI</CPUID>
	<category>Mask</category>
	<return type="__mmask16" varname="k" etype="MASK"/>
	<parameter type="__mmask16" varname="a" etype="MASK"/>
	<parameter type="__mmask16" varname="b" etype="MASK"/>
	<description>Compute the bitwise XNOR of 16-bit masks "a" and "b", and store the result in "k".</description>
	<operation>
k[15:0] := NOT (a[15:0] XOR b[15:0])
	</operation>
	<instruction name="KXNOR" form="k, k"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#k[MAX:16] := 0

def test82():
  return '''
<intrinsic tech="KNC" name="_mm512_knot">
	<type>Mask</type>
	<CPUID>KNCNI</CPUID>
	<category>Mask</category>
	<return type="__mmask16" varname="k" etype="MASK"/>
	<parameter type="__mmask16" varname="a" etype="MASK"/>
	<description>Compute the bitwise NOT of 16-bit mask "a", and store the result in "k".</description>
	<operation>
k[15:0] := NOT a[15:0]
	</operation>
	<instruction name="KNOT" form="k, k"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#k[MAX:16] := 0

def test83():
  return '''
<intrinsic tech="SSE2" vexEq="TRUE" name="_mm_cmpgt_epi32">
	<type>Integer</type>
	<CPUID>SSE2</CPUID>
	<category>Compare</category>
	<return type="__m128i" varname="dst" etype="UI32"/>
	<parameter type="__m128i" varname="a" etype="SI32"/>
	<parameter type="__m128i" varname="b" etype="SI32"/>
	<description>Compare packed signed 32-bit integers in "a" and "b" for greater-than, and store the results in "dst".</description>
	<operation>
FOR j := 0 to 3
	i := j*32
	dst[i+31:i] := ( a[i+31:i] &gt; b[i+31:i] ) ? 0xFFFFFFFF : 0
ENDFOR
	</operation>
	<instruction name="PCMPGTD" form="xmm, xmm" xed="PCMPGTD_XMMdq_XMMdq"/>
	<header>emmintrin.h</header>
</intrinsic>
'''

def test84():
  return '''
<intrinsic tech="AVX-512" name="_mm256_cmpge_epu16_mask">
	<type>Integer</type>
	<type>Mask</type>
	<CPUID>AVX512VL</CPUID>
	<CPUID>AVX512BW</CPUID>
	<category>Compare</category>
	<return type="__mmask16" varname="k" etype="MASK"/>
	<parameter type="__m256i" varname="a" etype="UI16"/>
	<parameter type="__m256i" varname="b" etype="UI16"/>
	<description>Compare packed unsigned 16-bit integers in "a" and "b" for greater-than-or-equal, and store the results in mask vector "k".</description>
	<operation>
FOR j := 0 to 15
	i := j*16
	k[j] := ( a[i+15:i] &gt;= b[i+15:i] ) ? 1 : 0
ENDFOR
	</operation>
	<instruction name="VPCMPUW" form="k, ymm, ymm" xed="VPCMPUW_MASKmskw_MASKmskw_YMMu16_YMMu16_IMM8_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#k[MAX:16] := 0

def test85():
  return '''
<intrinsic tech="AVX-512" name="_mm256_cmple_epu16_mask">
	<type>Integer</type>
	<type>Mask</type>
	<CPUID>AVX512VL</CPUID>
	<CPUID>AVX512BW</CPUID>
	<category>Compare</category>
	<return type="__mmask16" varname="k" etype="MASK"/>
	<parameter type="__m256i" varname="a" etype="UI16"/>
	<parameter type="__m256i" varname="b" etype="UI16"/>
	<description>Compare packed unsigned 16-bit integers in "a" and "b" for less-than-or-equal, and store the results in mask vector "k".</description>
	<operation>
FOR j := 0 to 15
	i := j*16
	k[j] := ( a[i+15:i] &lt;= b[i+15:i] ) ? 1 : 0
ENDFOR
	</operation>
	<instruction name="VPCMPUW" form="k, ymm, ymm" xed="VPCMPUW_MASKmskw_MASKmskw_YMMu16_YMMu16_IMM8_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#k[MAX:16] := 0


# Compiles but rerolling needs fixing
def test86():
  return '''
<intrinsic tech="AVX2" name="_mm256_shufflelo_epi16">
	<type>Integer</type>
	<CPUID>AVX2</CPUID>
	<category>Swizzle</category>
	<return type="__m256i" varname="dst" etype="UI16"/>
	<parameter type="__m256i" varname="a" etype="UI16"/>
	<parameter type="const int" varname="imm8" etype="IMM" immwidth="8"/>
	<description>Shuffle 16-bit integers in the low 64 bits of 128-bit lanes of "a" using the control in "imm8". Store the results in the low 64 bits of 128-bit lanes of "dst", with the high 64 bits of 128-bit lanes being copied from from "a" to "dst".</description>
	<operation>
dst[15:0] := (a &gt;&gt; (imm8[1:0] * 16))[15:0]
dst[31:16] := (a &gt;&gt; (imm8[3:2] * 16))[15:0]
dst[47:32] := (a &gt;&gt; (imm8[5:4] * 16))[15:0]
dst[63:48] := (a &gt;&gt; (imm8[7:6] * 16))[15:0]
dst[127:64] := a[127:64]
dst[143:128] := (a &gt;&gt; (imm8[1:0] * 16))[143:128]
dst[159:144] := (a &gt;&gt; (imm8[3:2] * 16))[143:128]
dst[175:160] := (a &gt;&gt; (imm8[5:4] * 16))[143:128]
dst[191:176] := (a &gt;&gt; (imm8[7:6] * 16))[143:128]
dst[255:192] := a[255:192]
	</operation>
	<instruction name="VPSHUFLW" form="ymm, ymm, imm8" xed="VPSHUFLW_YMMqq_YMMqq_IMMb"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:256] := 0

def test87():
  return '''
<intrinsic tech="AVX-512" name="_mm512_cvtepi8_epi32">
	<type>Integer</type>
	<CPUID>AVX512F</CPUID>
	<category>Convert</category>
	<return type="__m512i" varname="dst" etype="SI32"/>
	<parameter type="__m128i" varname="a" etype="SI8"/>
	<description>Sign extend packed 8-bit integers in "a" to packed 32-bit integers, and store the results in "dst".</description>
	<operation>
FOR j := 0 to 15
	i := 32*j
	k := 8*j
	dst[i+31:i] := SignExtend32(a[k+7:k])
ENDFOR
	</operation>
	<instruction name="VPMOVSXBD" form="zmm, xmm" xed="VPMOVSXBD_ZMMi32_MASKmskw_XMMi8_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:512] := 0

# Bravo!
def test88():
  return '''
<intrinsic tech="SSSE3" vexEq="TRUE" name="_mm_mulhrs_epi16">
	<type>Integer</type>
	<CPUID>SSSE3</CPUID>
	<category>Arithmetic</category>
	<return type="__m128i" varname="dst" etype="UI16"/>
	<parameter type="__m128i" varname="a" etype="SI16"/>
	<parameter type="__m128i" varname="b" etype="SI16"/>
	<description>Multiply packed signed 16-bit integers in "a" and "b", producing intermediate signed 32-bit integers. Truncate each intermediate integer to the 18 most significant bits, round by adding 1, and store bits [16:1] to "dst".</description>
	<operation>
FOR j := 0 to 7
	i := j*16
	tmp[31:0] := ((SignExtend32(a[i+15:i]) * SignExtend32(b[i+15:i])) &gt;&gt; 14) + 1
	dst[i+15:i] := tmp[16:1]
ENDFOR
	</operation>
	<instruction name="PMULHRSW" form="xmm, xmm" xed="PMULHRSW_XMMdq_XMMdq"/>
	<header>tmmintrin.h</header>
</intrinsic>
'''

def test89():
  return '''
<intrinsic tech="SSE" name="_mm_insert_pi16">
	<type>Integer</type>
	<CPUID>SSE</CPUID>
	<category>Swizzle</category>
	<return type="__m64" varname="dst" etype="UI16"/>
	<parameter type="__m64" varname="a" etype="UI16"/>
	<parameter type="int" varname="i" etype="UI16"/>
	<parameter type="int" varname="imm8" etype="IMM" immwidth="2"/>
	<description>Copy "a" to "dst", and insert the 16-bit integer "i" into "dst" at the location specified by "imm8".</description>
	<operation>
dst[63:0] := a[63:0]
sel := imm8[1:0]*16
dst[sel+15:sel] := i[15:0]
	</operation>
	<instruction name="PINSRW" form="mm, r32, imm8" xed="PINSRW_MMXq_GPR32_IMMb"/>
	<header>xmmintrin.h</header>
</intrinsic>
'''

# Test fails
def test90():
  return '''
<intrinsic tech="SSSE3" vexEq="TRUE" name="_mm_alignr_epi8">
	<type>Integer</type>
	<CPUID>SSSE3</CPUID>
	<category>Miscellaneous</category>
	<return type="__m128i" varname="dst" etype="UI8"/>
	<parameter type="__m128i" varname="a" etype="UI8"/>
	<parameter type="__m128i" varname="b" etype="UI8"/>
	<parameter type="int" varname="imm8" etype="IMM" immwidth="5"/>
	<description>Concatenate 16-byte blocks in "a" and "b" into a 32-byte temporary result, shift the result right by "imm8" bytes, and store the low 16 bytes in "dst".</description>
	<operation>
tmp[255:0] := ((a[127:0] &lt;&lt; 128)[255:0] OR b[127:0]) &gt;&gt; (imm8*8)
dst[127:0] := tmp[127:0]
	</operation>
	<instruction name="PALIGNR" form="xmm, xmm, imm8" xed="PALIGNR_XMMdq_XMMdq_IMMb"/>
	<header>tmmintrin.h</header>
</intrinsic>
'''


def test91():
  return '''
<intrinsic tech="AVX-512" name="_mm512_shufflehi_epi16">
	<type>Integer</type>
	<CPUID>AVX512BW</CPUID>
	<category>Miscellaneous</category>
	<return type="__m512i" varname="dst" etype="UI16"/>
	<parameter type="__m512i" varname="a" etype="UI16"/>
	<parameter type="int" varname="imm8" etype="IMM" immwidth="8"/>
	<description>Shuffle 16-bit integers in the high 64 bits of 128-bit lanes of "a" using the control in "imm8". Store the results in the high 64 bits of 128-bit lanes of "dst", with the low 64 bits of 128-bit lanes being copied from from "a" to "dst".</description>
	<operation>
dst[63:0] := a[63:0]
dst[79:64] := (a &gt;&gt; (imm8[1:0] * 16))[79:64]
dst[95:80] := (a &gt;&gt; (imm8[3:2] * 16))[79:64]
dst[111:96] := (a &gt;&gt; (imm8[5:4] * 16))[79:64]
dst[127:112] := (a &gt;&gt; (imm8[7:6] * 16))[79:64]
dst[191:128] := a[191:128]
dst[207:192] := (a &gt;&gt; (imm8[1:0] * 16))[207:192]
dst[223:208] := (a &gt;&gt; (imm8[3:2] * 16))[207:192]
dst[239:224] := (a &gt;&gt; (imm8[5:4] * 16))[207:192]
dst[255:240] := (a &gt;&gt; (imm8[7:6] * 16))[207:192]
dst[319:256] := a[319:256]
dst[335:320] := (a &gt;&gt; (imm8[1:0] * 16))[335:320]
dst[351:336] := (a &gt;&gt; (imm8[3:2] * 16))[335:320]
dst[367:352] := (a &gt;&gt; (imm8[5:4] * 16))[335:320]
dst[383:368] := (a &gt;&gt; (imm8[7:6] * 16))[335:320]
dst[447:384] := a[447:384]
dst[463:448] := (a &gt;&gt; (imm8[1:0] * 16))[463:448]
dst[479:464] := (a &gt;&gt; (imm8[3:2] * 16))[463:448]
dst[495:480] := (a &gt;&gt; (imm8[5:4] * 16))[463:448]
dst[511:496] := (a &gt;&gt; (imm8[7:6] * 16))[463:448]
	</operation>
	<instruction name="VPSHUFHW" form="zmm, zmm, imm8" xed="VPSHUFHW_ZMMu16_MASKmskw_ZMMu16_IMM8_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:512] := 0


def test92():
  return '''
<intrinsic tech="SSE" name="_mm_extract_pi16">
	<type>Integer</type>
	<CPUID>SSE</CPUID>
	<category>Swizzle</category>
	<return type="int" varname="dst" etype="UI16"/>
	<parameter type="__m64" varname="a" etype="UI16"/>
	<parameter type="int" varname="imm8" etype="IMM" immwidth="2"/>
	<description>Extract a 16-bit integer from "a", selected with "imm8", and store the result in the lower element of "dst".</description>
	<operation>
dst[15:0] := (a[63:0] &gt;&gt; (imm8[1:0] * 16))[15:0]
dst[31:16] := 0
	</operation>
	<instruction name="PEXTRW" form="r32, mm, imm8" xed="PEXTRW_GPR32_MMXq_IMMb"/>
	<header>xmmintrin.h</header>
</intrinsic>
'''

# Test fails
def test93():
  return '''
<intrinsic tech="KNC" name="_mm512_addsets_epi32">
	<type>Integer</type>
	<CPUID>KNCNI</CPUID>
	<category>Arithmetic</category>
	<return type="__m512i" varname="dst" etype="UI32"/>
	<parameter type="__m512i" varname="v2" etype="UI32"/>
	<parameter type="__m512i" varname="v3" etype="UI32"/>
	<parameter type="__mmask16 *" varname="sign" etype="MASK" memwidth="16"/>
	<description>Performs an element-by-element addition of packed 32-bit integer elements in "v2" and "v3", storing the results in "dst" and the sign of the sum in "sign" (sign flag).</description>
	<operation>
FOR j := 0 to 15
	i := j*32
	dst[i+31:i] := v2[i+31:i] + v3[i+31:i]
	sign[j] := v2[i+31:i] &amp; v3[i+31:i] &amp; 0x80000000
ENDFOR
	</operation>
	<instruction name="VPADDSETSD" form="zmm, zmm, zmm"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:512] := 0


# Test fails
def test94():
  return '''
<intrinsic tech="Other" name="_bextr2_u64">
	<type>Integer</type>
	<CPUID>BMI1</CPUID>
	<category>Bit Manipulation</category>
	<return type="unsigned __int64" varname="dst" etype="UI64"/>
	<parameter type="unsigned __int64" varname="a" etype="UI64"/>
	<parameter type="unsigned __int64" varname="control" etype="UI64"/>
	<description>Extract contiguous bits from unsigned 64-bit integer "a", and store the result in "dst". Extract the number of bits specified by bits 15:8 of "control", starting at the bit specified by bits 0:7 of "control"..</description>
	<operation>
start := control[7:0]
len := control[15:8]
tmp[511:0] := a
dst[63:0] := ZeroExtend64(tmp[(start[7:0] + len[7:0] - 1):start[7:0]])
	</operation>
	<instruction name="BEXTR" form="r64, r64, r64" xed="BEXTR_VGPR64q_VGPR64q_VGPR64q"/>
	<header>immintrin.h</header>
</intrinsic>
'''

# Test fails
def test95():
  return '''
<intrinsic tech="AVX-512" name="_mm_shldi_epi64">
	<type>Integer</type>
	<CPUID>AVX512_VBMI2</CPUID>
	<CPUID>AVX512VL</CPUID>
	<category>Shift</category>
	<return type="__m128i" varname="dst" etype="UI64"/>
	<parameter type="__m128i" varname="a" etype="UI64"/>
	<parameter type="__m128i" varname="b" etype="UI64"/>
	<parameter type="int" varname="imm8" etype="IMM" immwidth="8"/>
	<description>Concatenate packed 64-bit integers in "a" and "b" producing an intermediate 128-bit result. Shift the result left by "imm8" bits, and store the upper 64-bits in "dst").</description>
	<operation>
FOR j := 0 to 1
	i := j*64
	tmp[127:0] := ((a[i+63:i] &lt;&lt; 64)[127:0] | b[i+63:i]) &lt;&lt; imm8[5:0]
	dst[i+63:i] := tmp[127:64]
ENDFOR
	</operation>
	<instruction name="VPSHLDQ" form="xmm, xmm, xmm, imm8" xed="VPSHLDQ_XMMu64_MASKmskw_XMMu64_XMMu64_IMM8_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:128] := 0

# Passes!
# This is a special case.
def test96():
  return '''
<intrinsic tech="AVX-512/KNC" name="_mm512_alignr_epi32">
	<type>Integer</type>
	<CPUID>AVX512F/KNCNI</CPUID>
	<category>Miscellaneous</category>
	<return type="__m512i" varname="dst" etype="UI32"/>
	<parameter type="__m512i" varname="a" etype="UI32"/>
	<parameter type="__m512i" varname="b" etype="UI32"/>
	<parameter type="const int" varname="imm8" etype="IMM" immwidth="4"/>
	<description>Concatenate "a" and "b" into a 128-byte immediate result, shift the result right by "imm8" 32-bit elements, and store the low 64 bytes (16 elements) in "dst".</description>
	<operation>
temp[1023:512] := a[511:0]
temp[511:0] := b[511:0]
temp[1023:0] := temp[1023:0] &gt;&gt; (32*imm8[3:0])
dst[511:0] := temp[511:0]
	</operation>
	<instruction name="VALIGND" form="zmm, zmm, zmm, imm8" xed="VALIGND_ZMMu32_MASKmskw_ZMMu32_ZMMu32_IMM8_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:512] := 0


def test97():
  return '''
<intrinsic tech="AVX-512" name="_mm_cvtsepi64_epi16">
	<type>Integer</type>
	<CPUID>AVX512VL</CPUID>
	<CPUID>AVX512F</CPUID>
	<category>Convert</category>
	<return type="__m128i" varname="dst" etype="SI16"/>
	<parameter type="__m128i" varname="a" etype="SI64"/>
	<description>Convert packed signed 64-bit integers in "a" to packed 16-bit integers with signed saturation, and store the results in "dst".</description>
	<operation>
FOR j := 0 to 1
	i := 64*j
	k := 16*j
	dst[k+15:k] := Saturate16(a[i+63:i])
ENDFOR
	</operation>
	<instruction name="VPMOVSQW" form="xmm, xmm" xed="VPMOVSQW_XMMi16_MASKmskw_XMMi64_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:32] := 0


# Passes!!!
def test98():
  return '''
<intrinsic tech="AVX-512" name="_mm_cvtepi64_epi16">
	<type>Integer</type>
	<CPUID>AVX512VL</CPUID>
	<CPUID>AVX512F</CPUID>
	<category>Convert</category>
	<return type="__m128i" varname="dst" etype="UI16"/>
	<parameter type="__m128i" varname="a" etype="UI64"/>
	<description>Convert packed 64-bit integers in "a" to packed 16-bit integers with truncation, and store the results in "dst".</description>
	<operation>
FOR j := 0 to 1
	i := 64*j
	k := 16*j
	dst[k+15:k] := Truncate16(a[i+63:i])
ENDFOR
	</operation>
	<instruction name="VPMOVQW" form="xmm, xmm" xed="VPMOVQW_XMMu16_MASKmskw_XMMu64_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:32] := 0

def test99():
  return '''
<intrinsic tech="AVX-512" name="_mm256_permutexvar_epi64">
	<type>Integer</type>
	<CPUID>AVX512VL</CPUID>
	<CPUID>AVX512F</CPUID>
	<category>Miscellaneous</category>
	<return type="__m256i" varname="dst" etype="UI64"/>
	<parameter type="__m256i" varname="idx" etype="UI64"/>
	<parameter type="__m256i" varname="a" etype="UI64"/>
	<description>Shuffle 64-bit integers in "a" across lanes using the corresponding index in "idx", and store the results in "dst".</description>
	<operation>
FOR j := 0 to 3
	i := j*64
	id := idx[i+1:i]*64
	dst[i+63:i] := a[id+63:id]
ENDFOR
	</operation>
	<instruction name="VPERMQ" form="ymm, ymm, ymm" xed="VPERMQ_YMMu64_MASKmskw_YMMu64_YMMu64_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:256] := 0

def test100():
  return '''
<intrinsic tech="AVX-512" name="_mm_alignr_epi64">
	<type>Integer</type>
	<CPUID>AVX512F</CPUID>
	<CPUID>AVX512VL</CPUID>
	<category>Miscellaneous</category>
	<return type="__m128i" varname="dst" etype="UI64"/>
	<parameter type="__m128i" varname="a" etype="UI64"/>
	<parameter type="__m128i" varname="b" etype="UI64"/>
	<parameter type="const int" varname="imm8" etype="IMM" immwidth="1"/>
	<description>Concatenate "a" and "b" into a 32-byte immediate result, shift the result right by "imm8" 64-bit elements, and store the low 16 bytes (2 elements) in "dst".</description>
	<operation>
temp[255:128] := a[127:0]
temp[127:0] := b[127:0]
temp[255:0] := temp[255:0] &gt;&gt; (64*imm8[0])
dst[127:0] := temp[127:0]
	</operation>
	<instruction name="VALIGNQ" form="xmm, xmm, xmm, imm8" xed="VALIGNQ_XMMu64_MASKmskw_XMMu64_XMMu64_IMM8_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:128] := 0

def test101():
  return '''
<intrinsic tech="AVX-512" name="_mm512_mullo_epi64">
	<type>Integer</type>
	<CPUID>AVX512DQ</CPUID>
	<category>Arithmetic</category>
	<return type="__m512i" varname="dst" etype="UI64"/>
	<parameter type="__m512i" varname="a" etype="UI64"/>
	<parameter type="__m512i" varname="b" etype="UI64"/>
	<description>Multiply the packed 64-bit integers in "a" and "b", producing intermediate 128-bit integers, and store the low 64 bits of the intermediate integers in "dst".</description>
	<operation>
FOR j := 0 to 7
	i := j*64
	tmp[127:0] := a[i+63:i] * b[i+63:i]
	dst[i+63:i] := tmp[63:0]
ENDFOR
	</operation>
	<instruction name="VPMULLQ" form="zmm, zmm, zmm" xed="VPMULLQ_ZMMu64_MASKmskw_ZMMu64_ZMMu64_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:512] := 0


# Compilation fails
def test102():
  return '''
<intrinsic tech="AVX-512" name="_mm512_conflict_epi32">
	<type>Integer</type>
	<CPUID>AVX512CD</CPUID>
	<category>Compare</category>
	<return type="__m512i" varname="dst" etype="UI32"/>
	<parameter type="__m512i" varname="a" etype="UI32"/>
	<description>Test each 32-bit element of "a" for equality with all other elements in "a" closer to the least significant bit. Each element's comparison forms a zero extended bit vector in "dst".</description>
	<operation>
FOR j := 0 to 15
	i := j*32
	FOR k := 0 to j-1
		m := k*32
		dst[i+k] := (a[i+31:i] == a[m+31:m]) ? 1 : 0
	ENDFOR
	dst[i+31:i+j] := 0
ENDFOR
	</operation>
	<instruction name="VPCONFLICTD" form="zmm, zmm" xed="VPCONFLICTD_ZMMu32_MASKmskw_ZMMu32_AVX512CD"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:512] := 0


def test103():
  return '''
<intrinsic tech="AVX2" name="_mm256_permutevar8x32_epi32">
	<type>Integer</type>
	<CPUID>AVX2</CPUID>
	<category>Swizzle</category>
	<return type="__m256i" varname="dst" etype="UI32"/>
	<parameter type="__m256i" varname="a" etype="UI32"/>
	<parameter type="__m256i" varname="idx" etype="UI32"/>
	<description>Shuffle 32-bit integers in "a" across lanes using the corresponding index in "idx", and store the results in "dst".</description>
	<operation>
FOR j := 0 to 7
	i := j*32
	id := idx[i+2:i]*32
	dst[i+31:i] := a[id+31:id]
ENDFOR
	</operation>
	<instruction name="VPERMD" form="ymm, ymm, ymm" xed="VPERMD_YMMqq_YMMqq_YMMqq"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:256] := 0


# Compilation passes!!!!
def test104():
  return '''
<intrinsic tech="AVX-512" name="_mm512_mask_blend_epi8">
	<type>Integer</type>
	<CPUID>AVX512BW</CPUID>
	<category>Miscellaneous</category>
	<return type="__m512i" varname="dst" etype="UI8"/>
	<parameter type="__mmask64" varname="k" etype="MASK"/>
	<parameter type="__m512i" varname="a" etype="UI8"/>
	<parameter type="__m512i" varname="b" etype="UI8"/>
	<description>Blend packed 8-bit integers from "a" and "b" using control mask "k", and store the results in "dst".</description>
	<operation>
FOR j := 0 to 63
	i := j*8
	IF k[j]
		dst[i+7:i] := b[i+7:i]
	ELSE
		dst[i+7:i] := a[i+7:i]
	FI
ENDFOR
	</operation>
	<instruction name="VPBLENDMB" form="zmm {k}, zmm, zmm" xed="VPBLENDMB_ZMMu8_MASKmskw_ZMMu8_ZMMu8_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:512] := 0

def test105():
  return '''
<intrinsic tech="AVX-512" name="_mm256_mask_cmpeq_epi8_mask">
	<type>Integer</type>
	<type>Mask</type>
	<CPUID>AVX512VL</CPUID>
	<CPUID>AVX512BW</CPUID>
	<category>Compare</category>
	<return type="__mmask32" varname="k" etype="MASK"/>
	<parameter type="__mmask32" varname="k1" etype="MASK"/>
	<parameter type="__m256i" varname="a" etype="SI8"/>
	<parameter type="__m256i" varname="b" etype="SI8"/>
	<description>Compare packed signed 8-bit integers in "a" and "b" for equality, and store the results in mask vector "k" using zeromask "k1" (elements are zeroed out when the corresponding mask bit is not set).</description>
	<operation>
FOR j := 0 to 31
	i := j*8
	IF k1[j]
		k[j] := ( a[i+7:i] == b[i+7:i] ) ? 1 : 0
	ELSE
		k[j] := 0
	FI
ENDFOR
	</operation>
	<instruction name="VPCMPB" form="k {k}, ymm, ymm" xed="VPCMPB_MASKmskw_MASKmskw_YMMi8_YMMi8_IMM8_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#k[MAX:32] := 0

def test106():
  return '''
<intrinsic tech="AVX-512" name="_mm512_mask_cmplt_epi8_mask">
	<type>Integer</type>
	<type>Mask</type>
	<CPUID>AVX512BW</CPUID>
	<category>Compare</category>
	<return type="__mmask64" varname="k" etype="MASK"/>
	<parameter type="__mmask64" varname="k1" etype="MASK"/>
	<parameter type="__m512i" varname="a" etype="SI8"/>
	<parameter type="__m512i" varname="b" etype="SI8"/>
	<description>Compare packed signed 8-bit integers in "a" and "b" for less-than, and store the results in mask vector "k" using zeromask "k1" (elements are zeroed out when the corresponding mask bit is not set).</description>
	<operation>
FOR j := 0 to 63
	i := j*8
	IF k1[j]
		k[j] := ( a[i+7:i] &lt; b[i+7:i] ) ? 1 : 0
	ELSE
		k[j] := 0
	FI
ENDFOR
	</operation>
	<instruction name="VPCMPB" form="k {k}, zmm, zmm" xed="VPCMPB_MASKmskw_MASKmskw_ZMMi8_ZMMi8_IMM8_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#k[MAX:64] := 0


def test107():
  return '''
<intrinsic tech="AVX-512" name="_mm_mask_avg_epu16">
	<type>Integer</type>
	<CPUID>AVX512VL</CPUID>
	<CPUID>AVX512BW</CPUID>
	<category>Arithmetic</category>
	<return type="__m128i" varname="dst" etype="UI16"/>
	<parameter type="__m128i" varname="src" etype="UI16"/>
	<parameter type="__mmask8" varname="k" etype="MASK"/>
	<parameter type="__m128i" varname="a" etype="UI16"/>
	<parameter type="__m128i" varname="b" etype="UI16"/>
	<description>Average packed unsigned 16-bit integers in "a" and "b", and store the results in "dst" using writemask "k" (elements are copied from "src" when the corresponding mask bit is not set).</description>
	<operation>
FOR j := 0 to 7
	i := j*16
	IF k[j]
		dst[i+15:i] := (a[i+15:i] + b[i+15:i] + 1) &gt;&gt; 1
	ELSE
		dst[i+15:i] := src[i+15:i]
	FI
ENDFOR
	</operation>
	<instruction name="VPAVGW" form="xmm {k}, xmm, xmm" xed="VPAVGW_XMMu16_MASKmskw_XMMu16_XMMu16_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:128] := 0


def test108():
  return '''
<intrinsic tech="AVX-512" name="_mm256_mask_permutex2var_epi16">
	<type>Integer</type>
	<CPUID>AVX512VL</CPUID>
	<CPUID>AVX512BW</CPUID>
	<category>Miscellaneous</category>
	<return type="__m256i" varname="dst" etype="UI16"/>
	<parameter type="__m256i" varname="a" etype="UI16"/>
	<parameter type="__mmask16" varname="k" etype="MASK"/>
	<parameter type="__m256i" varname="idx" etype="UI16"/>
	<parameter type="__m256i" varname="b" etype="UI16"/>
	<description>Shuffle 16-bit integers in "a" and "b" across lanes using the corresponding selector and index in "idx", and store the results in "dst" using writemask "k" (elements are copied from "a" when the corresponding mask bit is not set).</description>
	<operation>
FOR j := 0 to 15
	i := j*16
	IF k[j]
		off := 16*idx[i+3:i]
		dst[i+15:i] := idx[i+4] ? b[off+15:off] : a[off+15:off]
	ELSE
		dst[i+15:i] := a[i+15:i]
	FI
ENDFOR
	</operation>
	<instruction name="VPERMT2W" form="ymm {k}, ymm, ymm" xed="VPERMT2W_YMMu16_MASKmskw_YMMu16_YMMu16_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:256] := 0


def test109():
  return '''
<intrinsic tech="AVX-512" name="_mm256_mask_permutexvar_epi16">
	<type>Integer</type>
	<CPUID>AVX512VL</CPUID>
	<CPUID>AVX512BW</CPUID>
	<category>Miscellaneous</category>
	<return type="__m256i" varname="dst" etype="UI16"/>
	<parameter type="__m256i" varname="src" etype="UI16"/>
	<parameter type="__mmask16" varname="k" etype="MASK"/>
	<parameter type="__m256i" varname="idx" etype="UI16"/>
	<parameter type="__m256i" varname="a" etype="UI16"/>
	<description>Shuffle 16-bit integers in "a" across lanes using the corresponding index in "idx", and store the results in "dst" using writemask "k" (elements are copied from "src" when the corresponding mask bit is not set).</description>
	<operation>
FOR j := 0 to 15
	i := j*16
	id := idx[i+3:i]*16
	IF k[j]
		dst[i+15:i] := a[id+15:id]
	ELSE
		dst[i+15:i] := src[i+15:i]
	FI
ENDFOR
	</operation>
	<instruction name="VPERMW" form="ymm {k}, ymm, ymm" xed="VPERMW_YMMu16_MASKmskw_YMMu16_YMMu16_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:256] := 0

def test110():
  return '''
<intrinsic tech="AVX-512" name="_mm256_mask_maddubs_epi16">
	<type>Integer</type>
	<CPUID>AVX512VL</CPUID>
	<CPUID>AVX512BW</CPUID>
	<category>Arithmetic</category>
	<return type="__m256i" varname="dst" etype="SI16"/>
	<parameter type="__m256i" varname="src" etype="SI16"/>
	<parameter type="__mmask16" varname="k" etype="MASK"/>
	<parameter type="__m256i" varname="a" etype="UI8"/>
	<parameter type="__m256i" varname="b" etype="SI8"/>
	<description>Multiply packed unsigned 8-bit integers in "a" by packed signed 8-bit integers in "b", producing intermediate signed 16-bit integers. Horizontally add adjacent pairs of intermediate signed 16-bit integers, and pack the saturated results in "dst" using writemask "k" (elements are copied from "src" when the corresponding mask bit is not set).</description>
	<operation>
FOR j := 0 to 15
	i := j*16
	IF k[j]
		dst[i+15:i] := Saturate16( a[i+15:i+8]*b[i+15:i+8] + a[i+7:i]*b[i+7:i] )
	ELSE
		dst[i+15:i] := src[i+15:i]
	FI
ENDFOR
	</operation>
	<instruction name="VPMADDUBSW" form="ymm {k}, ymm, ymm" xed="VPMADDUBSW_YMMi16_MASKmskw_YMMi16_YMMi16_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:256] := 0

def test111():
  return '''
<intrinsic tech="AVX-512" name="_mm256_mask_madd_epi16">
	<type>Integer</type>
	<CPUID>AVX512VL</CPUID>
	<CPUID>AVX512BW</CPUID>
	<category>Arithmetic</category>
	<return type="__m256i" varname="dst" etype="SI32"/>
	<parameter type="__m256i" varname="src" etype="SI32"/>
	<parameter type="__mmask8" varname="k" etype="MASK"/>
	<parameter type="__m256i" varname="a" etype="SI16"/>
	<parameter type="__m256i" varname="b" etype="SI16"/>
	<description>Multiply packed signed 16-bit integers in "a" and "b", producing intermediate signed 32-bit integers. Horizontally add adjacent pairs of intermediate 32-bit integers, and pack the results in "dst" using writemask "k" (elements are copied from "src" when the corresponding mask bit is not set).</description>
	<operation>
FOR j := 0 to 7
	i := j*32
	IF k[j]
		dst[i+31:i] := SignExtend32(a[i+31:i+16]*b[i+31:i+16]) + SignExtend32(a[i+15:i]*b[i+15:i])
	ELSE
		dst[i+31:i] := src[i+31:i]
	FI
ENDFOR
	</operation>
	<instruction name="VPMADDWD" form="ymm {k}, ymm, ymm" xed="VPMADDWD_YMMi32_MASKmskw_YMMi16_YMMi16_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:256] := 0

def test112():
  return '''
<intrinsic tech="AVX-512" name="_mm256_mask_max_epi8">
	<type>Integer</type>
	<CPUID>AVX512VL</CPUID>
	<CPUID>AVX512BW</CPUID>
	<category>Arithmetic</category>
	<return type="__m256i" varname="dst" etype="UI8"/>
	<parameter type="__m256i" varname="src" etype="UI8"/>
	<parameter type="__mmask32" varname="k" etype="MASK"/>
	<parameter type="__m256i" varname="a" etype="SI8"/>
	<parameter type="__m256i" varname="b" etype="SI8"/>
	<description>Compare packed signed 8-bit integers in "a" and "b", and store packed maximum values in "dst" using writemask "k" (elements are copied from "src" when the corresponding mask bit is not set).</description>
	<operation>
FOR j := 0 to 31
	i := j*8
	IF k[j]
		dst[i+7:i] := MAX(a[i+7:i], b[i+7:i])
	ELSE
		dst[i+7:i] := src[i+7:i]
	FI
ENDFOR
	</operation>
	<instruction name="VPMAXSB" form="ymm {k}, ymm, ymm" xed="VPMAXSB_YMMi8_MASKmskw_YMMi8_YMMi8_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:256] := 0

def test113():
  return '''
<intrinsic tech="AVX-512" name="_mm256_mask_min_epi8">
	<type>Integer</type>
	<CPUID>AVX512VL</CPUID>
	<CPUID>AVX512BW</CPUID>
	<category>Arithmetic</category>
	<return type="__m256i" varname="dst" etype="UI8"/>
	<parameter type="__m256i" varname="src" etype="UI8"/>
	<parameter type="__mmask32" varname="k" etype="MASK"/>
	<parameter type="__m256i" varname="a" etype="SI8"/>
	<parameter type="__m256i" varname="b" etype="SI8"/>
	<description>Compare packed signed 8-bit integers in "a" and "b", and store packed minimum values in "dst" using writemask "k" (elements are copied from "src" when the corresponding mask bit is not set).</description>
	<operation>
FOR j := 0 to 31
	i := j*8
	IF k[j]
		dst[i+7:i] := MIN(a[i+7:i], b[i+7:i])
	ELSE
		dst[i+7:i] := src[i+7:i]
	FI
ENDFOR
	</operation>
	<instruction name="VPMINSB" form="ymm {k}, ymm, ymm" xed="VPMINSB_YMMi8_MASKmskw_YMMi8_YMMi8_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:256] := 0

def test114():
  return '''
<intrinsic tech="AVX-512" name="_mm256_movepi16_mask">
	<type>Integer</type>
	<type>Mask</type>
	<CPUID>AVX512VL</CPUID>
	<CPUID>AVX512BW</CPUID>
	<category>Miscellaneous</category>
	<return type="__mmask16" varname="k" etype="MASK"/>
	<parameter type="__m256i" varname="a" etype="UI16"/>
	<description>Set each bit of mask register "k" based on the most significant bit of the corresponding packed 16-bit integer in "a".</description>
	<operation>
FOR j := 0 to 15
	i := j*16
	IF a[i+15]
		k[j] := 1
	ELSE
		k[j] := 0
	FI
ENDFOR
	</operation>
	<instruction name="VPMOVW2M" form="k, ymm" xed="VPMOVW2M_MASKmskw_YMMu16_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#k[MAX:16] := 0

def test115():
  return '''
<intrinsic tech="AVX-512" name="_mm256_movm_epi16">
	<type>Integer</type>
	<CPUID>AVX512VL</CPUID>
	<CPUID>AVX512BW</CPUID>
	<category>Miscellaneous</category>
	<return type="__m256i" varname="dst" etype="UI16"/>
	<parameter type="__mmask16" varname="k" etype="MASK"/>
	<description>Set each packed 16-bit integer in "dst" to all ones or all zeros based on the value of the corresponding bit in "k".</description>
	<operation>
FOR j := 0 to 15
	i := j*16
	IF k[j]
		dst[i+15:i] := 0xFFFF
	ELSE
		dst[i+15:i] := 0
	FI
ENDFOR
	</operation>
	<instruction name="VPMOVM2W" form="ymm" xed="VPMOVM2W_YMMu16_MASKmskw_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:256] := 0

def test116():
  return '''
<intrinsic tech="AVX-512" name="_mm256_mask_cvtsepi16_epi8">
	<type>Integer</type>
	<CPUID>AVX512VL</CPUID>
	<CPUID>AVX512BW</CPUID>
	<category>Convert</category>
	<return type="__m128i" varname="dst" etype="SI8"/>
	<parameter type="__m128i" varname="src" etype="SI8"/>
	<parameter type="__mmask16" varname="k" etype="MASK"/>
	<parameter type="__m256i" varname="a" etype="SI16"/>
	<description>Convert packed signed 16-bit integers in "a" to packed 8-bit integers with signed saturation, and store the results in "dst" using writemask "k" (elements are copied from "src" when the corresponding mask bit is not set).</description>
	<operation>
FOR j := 0 to 15
	i := 16*j
	l := 8*j
	IF k[j]
		dst[l+7:l] := Saturate8(a[i+15:i])
	ELSE
		dst[l+7:l] := src[l+7:l]
	FI
ENDFOR
	</operation>
	<instruction name="VPMOVSWB" form="xmm {k}, ymm" xed="VPMOVSWB_XMMi8_MASKmskw_YMMi16_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:128] := 0


def test117():
  return '''
<intrinsic tech="AVX-512" name="_mm256_maskz_cvtepi8_epi16">
	<type>Integer</type>
	<CPUID>AVX512VL</CPUID>
	<CPUID>AVX512BW</CPUID>
	<category>Convert</category>
	<return type="__m256i" varname="dst" etype="SI16"/>
	<parameter type="__mmask16" varname="k" etype="MASK"/>
	<parameter type="__m128i" varname="a" etype="SI8"/>
	<description>Sign extend packed 8-bit integers in "a" to packed 16-bit integers, and store the results in "dst" using zeromask "k" (elements are zeroed out when the corresponding mask bit is not set).</description>
	<operation>
FOR j := 0 to 15
	i := j*8
	l := j*16
	IF k[j]
		dst[l+15:l] := SignExtend16(a[i+7:i])
	ELSE
		dst[l+15:l] := 0
	FI
ENDFOR
	</operation>
	<instruction name="VPMOVSXBW" form="ymm {z}, xmm" xed="VPMOVSXBW_YMMi16_MASKmskw_XMMi8_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:256] := 0

def test118():
  return '''
<intrinsic tech="AVX-512" name="_mm256_mask_cvtepi16_epi8">
	<type>Integer</type>
	<CPUID>AVX512VL</CPUID>
	<CPUID>AVX512BW</CPUID>
	<category>Convert</category>
	<return type="__m128i" varname="dst" etype="UI8"/>
	<parameter type="__m128i" varname="src" etype="UI8"/>
	<parameter type="__mmask16" varname="k" etype="MASK"/>
	<parameter type="__m256i" varname="a" etype="UI16"/>
	<description>Convert packed 16-bit integers in "a" to packed 8-bit integers with truncation, and store the results in "dst" using writemask "k" (elements are copied from "src" when the corresponding mask bit is not set).</description>
	<operation>
FOR j := 0 to 15
	i := 16*j
	l := 8*j
	IF k[j]
		dst[l+7:l] := Truncate8(a[i+15:i])
	ELSE
		dst[l+7:l] := src[l+7:l]
	FI
ENDFOR
	</operation>
	<instruction name="VPMOVWB" form="xmm {k}, ymm" xed="VPMOVWB_XMMu8_MASKmskw_YMMu16_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:128] := 0


def test119():
  return '''
<intrinsic tech="AVX-512" name="_mm256_mask_mulhrs_epi16">
	<type>Integer</type>
	<CPUID>AVX512VL</CPUID>
	<CPUID>AVX512BW</CPUID>
	<category>Arithmetic</category>
	<return type="__m256i" varname="dst" etype="UI16"/>
	<parameter type="__m256i" varname="src" etype="UI16"/>
	<parameter type="__mmask16" varname="k" etype="MASK"/>
	<parameter type="__m256i" varname="a" etype="SI16"/>
	<parameter type="__m256i" varname="b" etype="SI16"/>
	<description>Multiply packed signed 16-bit integers in "a" and "b", producing intermediate signed 32-bit integers. Truncate each intermediate integer to the 18 most significant bits, round by adding 1, and store bits [16:1] to "dst" using writemask "k" (elements are copied from "src" when the corresponding mask bit is not set).</description>
	<operation>
FOR j := 0 to 15
	i := j*16
	IF k[j]
		tmp[31:0] := ((SignExtend32(a[i+15:i]) * SignExtend32(b[i+15:i])) &gt;&gt; 14) + 1
		dst[i+15:i] := tmp[16:1]
	ELSE
		dst[i+15:i] := src[i+15:i]
	FI
ENDFOR
	</operation>
	<instruction name="VPMULHRSW" form="ymm {k}, ymm, ymm" xed="VPMULHRSW_YMMi16_MASKmskw_YMMi16_YMMi16_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:256] := 0

def test120():
  return '''
<intrinsic tech="AVX-512" name="_mm256_mask_mulhi_epu16">
	<type>Integer</type>
	<CPUID>AVX512VL</CPUID>
	<CPUID>AVX512BW</CPUID>
	<category>Arithmetic</category>
	<return type="__m256i" varname="dst" etype="UI16"/>
	<parameter type="__m256i" varname="src" etype="UI16"/>
	<parameter type="__mmask16" varname="k" etype="MASK"/>
	<parameter type="__m256i" varname="a" etype="UI16"/>
	<parameter type="__m256i" varname="b" etype="UI16"/>
	<description>Multiply the packed unsigned 16-bit integers in "a" and "b", producing intermediate 32-bit integers, and store the high 16 bits of the intermediate integers in "dst" using writemask "k" (elements are copied from "src" when the corresponding mask bit is not set).</description>
	<operation>
FOR j := 0 to 15
	i := j*16
	IF k[j]
		tmp[31:0] := a[i+15:i] * b[i+15:i]
		dst[i+15:i] := tmp[31:16]
	ELSE
		dst[i+15:i] := src[i+15:i]
	FI
ENDFOR
	</operation>
	<instruction name="VPMULHUW" form="ymm {k}, ymm, ymm" xed="VPMULHUW_YMMu16_MASKmskw_YMMu16_YMMu16_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:256] := 0


def test121():
  return '''
<intrinsic tech="AVX-512" name="_mm256_mask_mulhi_epi16">
	<type>Integer</type>
	<CPUID>AVX512VL</CPUID>
	<CPUID>AVX512BW</CPUID>
	<category>Arithmetic</category>
	<return type="__m256i" varname="dst" etype="UI16"/>
	<parameter type="__m256i" varname="src" etype="UI16"/>
	<parameter type="__mmask16" varname="k" etype="MASK"/>
	<parameter type="__m256i" varname="a" etype="SI16"/>
	<parameter type="__m256i" varname="b" etype="SI16"/>
	<description>Multiply the packed signed 16-bit integers in "a" and "b", producing intermediate 32-bit integers, and store the high 16 bits of the intermediate integers in "dst" using writemask "k" (elements are copied from "src" when the corresponding mask bit is not set).</description>
	<operation>
FOR j := 0 to 15
	i := j*16
	IF k[j]
		tmp[31:0] := SignExtend32(a[i+15:i]) * SignExtend32(b[i+15:i])
		dst[i+15:i] := tmp[31:16]
	ELSE
		dst[i+15:i] := src[i+15:i]
	FI
ENDFOR
	</operation>
	<instruction name="VPMULHW" form="ymm {k}, ymm, ymm" xed="VPMULHW_YMMu16_MASKmskw_YMMu16_YMMu16_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:256] := 0


# Compilation fails!!!!
def test122():
  return '''
<intrinsic tech="AVX-512" name="_mm512_sad_epu8">
	<type>Integer</type>
	<CPUID>AVX512BW</CPUID>
	<category>Miscellaneous</category>
	<return type="__m512i" varname="dst" etype="UI16"/>
	<parameter type="__m512i" varname="a" etype="UI8"/>
	<parameter type="__m512i" varname="b" etype="UI8"/>
	<description>Compute the absolute differences of packed unsigned 8-bit integers in "a" and "b", then horizontally sum each consecutive 8 differences to produce eight unsigned 16-bit integers, and pack these unsigned 16-bit integers in the low 16 bits of 64-bit elements in "dst".</description>
	<operation>
FOR j := 0 to 63
	i := j*8
	tmp[i+7:i] := ABS(a[i+7:i] - b[i+7:i])
ENDFOR
FOR j := 0 to 7
	i := j*64
	dst[i+15:i] := tmp[i+7:i] + tmp[i+15:i+8] + tmp[i+23:i+16] + tmp[i+31:i+24] + \
	               tmp[i+39:i+32] + tmp[i+47:i+40] + tmp[i+55:i+48] + tmp[i+63:i+56]
	dst[i+63:i+16] := 0
ENDFOR
	</operation>
	<instruction name="VPSADBW" form="zmm, zmm, zmm" xed="VPSADBW_ZMMu16_ZMMu8_ZMMu8_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:512] := 0


# Compilation passes!!! Bravo!!
def test123():
  return '''
<intrinsic tech="AVX-512" name="_mm512_mask_shufflehi_epi16">
	<type>Integer</type>
	<CPUID>AVX512BW</CPUID>
	<category>Miscellaneous</category>
	<return type="__m512i" varname="dst" etype="UI16"/>
	<parameter type="__m512i" varname="src" etype="UI16"/>
	<parameter type="__mmask32" varname="k" etype="MASK"/>
	<parameter type="__m512i" varname="a" etype="UI16"/>
	<parameter type="int" varname="imm8" etype="IMM" immwidth="8"/>
	<description>Shuffle 16-bit integers in the high 64 bits of 128-bit lanes of "a" using the control in "imm8". Store the results in the high 64 bits of 128-bit lanes of "dst", with the low 64 bits of 128-bit lanes being copied from from "a" to "dst", using writemask "k" (elements are copied from "src" when the corresponding mask bit is not set).</description>
	<operation>
tmp_dst[63:0] := a[63:0]
tmp_dst[79:64] := (a &gt;&gt; (imm8[1:0] * 16))[79:64]
tmp_dst[95:80] := (a &gt;&gt; (imm8[3:2] * 16))[79:64]
tmp_dst[111:96] := (a &gt;&gt; (imm8[5:4] * 16))[79:64]
tmp_dst[127:112] := (a &gt;&gt; (imm8[7:6] * 16))[79:64]
tmp_dst[191:128] := a[191:128]
tmp_dst[207:192] := (a &gt;&gt; (imm8[1:0] * 16))[207:192]
tmp_dst[223:208] := (a &gt;&gt; (imm8[3:2] * 16))[207:192]
tmp_dst[239:224] := (a &gt;&gt; (imm8[5:4] * 16))[207:192]
tmp_dst[255:240] := (a &gt;&gt; (imm8[7:6] * 16))[207:192]
tmp_dst[319:256] := a[319:256]
tmp_dst[335:320] := (a &gt;&gt; (imm8[1:0] * 16))[335:320]
tmp_dst[351:336] := (a &gt;&gt; (imm8[3:2] * 16))[335:320]
tmp_dst[367:352] := (a &gt;&gt; (imm8[5:4] * 16))[335:320]
tmp_dst[383:368] := (a &gt;&gt; (imm8[7:6] * 16))[335:320]
tmp_dst[447:384] := a[447:384]
tmp_dst[463:448] := (a &gt;&gt; (imm8[1:0] * 16))[463:448]
tmp_dst[479:464] := (a &gt;&gt; (imm8[3:2] * 16))[463:448]
tmp_dst[495:480] := (a &gt;&gt; (imm8[5:4] * 16))[463:448]
tmp_dst[511:496] := (a &gt;&gt; (imm8[7:6] * 16))[463:448]
FOR j := 0 to 31
	i := j*16
	IF k[j]
		dst[i+15:i] := tmp_dst[i+15:i]
	ELSE
		dst[i+15:i] := src[i+15:i]
	FI
ENDFOR
	</operation>
	<instruction name="VPSHUFHW" form="zmm {k}, zmm, imm8" xed="VPSHUFHW_ZMMu16_MASKmskw_ZMMu16_IMM8_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:512] := 0


def test124():
  return '''
<intrinsic tech="AVX-512" name="_mm512_mask_shufflelo_epi16">
	<type>Integer</type>
	<CPUID>AVX512BW</CPUID>
	<category>Miscellaneous</category>
	<return type="__m512i" varname="dst" etype="UI16"/>
	<parameter type="__m512i" varname="src" etype="UI16"/>
	<parameter type="__mmask32" varname="k" etype="MASK"/>
	<parameter type="__m512i" varname="a" etype="UI16"/>
	<parameter type="int" varname="imm8" etype="IMM" immwidth="8"/>
	<description>Shuffle 16-bit integers in the low 64 bits of 128-bit lanes of "a" using the control in "imm8". Store the results in the low 64 bits of 128-bit lanes of "dst", with the high 64 bits of 128-bit lanes being copied from from "a" to "dst", using writemask "k" (elements are copied from "src" when the corresponding mask bit is not set).</description>
	<operation>
tmp_dst[15:0] := (a &gt;&gt; (imm8[1:0] * 16))[15:0]
tmp_dst[31:16] := (a &gt;&gt; (imm8[3:2] * 16))[15:0]
tmp_dst[47:32] := (a &gt;&gt; (imm8[5:4] * 16))[15:0]
tmp_dst[63:48] := (a &gt;&gt; (imm8[7:6] * 16))[15:0]
tmp_dst[127:64] := a[127:64]
tmp_dst[143:128] := (a &gt;&gt; (imm8[1:0] * 16))[143:128]
tmp_dst[159:144] := (a &gt;&gt; (imm8[3:2] * 16))[143:128]
tmp_dst[175:160] := (a &gt;&gt; (imm8[5:4] * 16))[143:128]
tmp_dst[191:176] := (a &gt;&gt; (imm8[7:6] * 16))[143:128]
tmp_dst[255:192] := a[255:192]
tmp_dst[271:256] := (a &gt;&gt; (imm8[1:0] * 16))[271:256]
tmp_dst[287:272] := (a &gt;&gt; (imm8[3:2] * 16))[271:256]
tmp_dst[303:288] := (a &gt;&gt; (imm8[5:4] * 16))[271:256]
tmp_dst[319:304] := (a &gt;&gt; (imm8[7:6] * 16))[271:256]
tmp_dst[383:320] := a[383:320]
tmp_dst[399:384] := (a &gt;&gt; (imm8[1:0] * 16))[399:384]
tmp_dst[415:400] := (a &gt;&gt; (imm8[3:2] * 16))[399:384]
tmp_dst[431:416] := (a &gt;&gt; (imm8[5:4] * 16))[399:384]
tmp_dst[447:432] := (a &gt;&gt; (imm8[7:6] * 16))[399:384]
tmp_dst[511:448] := a[511:448]
FOR j := 0 to 31
	i := j*16
	IF k[j]
		dst[i+15:i] := tmp_dst[i+15:i]
	ELSE
		dst[i+15:i] := src[i+15:i]
	FI
ENDFOR
	</operation>
	<instruction name="VPSHUFLW" form="zmm {k}, zmm, imm8" xed="VPSHUFLW_ZMMu16_MASKmskw_ZMMu16_IMM8_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:512] := 0

# Compilation fails
def test125():
  return '''
<intrinsic tech="AVX-512" name="_mm512_bslli_epi128">
	<type>Integer</type>
	<CPUID>AVX512BW</CPUID>
	<category>Shift</category>
	<return type="__m512i" varname="dst" etype="M128"/>
	<parameter type="__m512i" varname="a" etype="M128"/>
	<parameter type="int" varname="imm8" etype="IMM" immwidth="8"/>
	<description>Shift 128-bit lanes in "a" left by "imm8" bytes while shifting in zeros, and store the results in "dst".</description>
	<operation>
tmp := imm8[7:0]
IF tmp &gt; 15
	tmp := 16
FI
dst[127:0] := a[127:0] &lt;&lt; (tmp*8)
dst[255:128] := a[255:128] &lt;&lt; (tmp*8)
dst[383:256] := a[383:256] &lt;&lt; (tmp*8)
dst[511:384] := a[511:384] &lt;&lt; (tmp*8)
	</operation>
	<instruction name="VPSLLDQ" form="zmm, zmm, imm8" xed="VPSLLDQ_ZMMu8_ZMMu8_IMM8_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:512] := 0


# Compilation fails
def test126():
  return '''
<intrinsic tech="AVX-512" name="_mm256_mask_sllv_epi16">
	<type>Integer</type>
	<CPUID>AVX512VL</CPUID>
	<CPUID>AVX512BW</CPUID>
	<category>Shift</category>
	<return type="__m256i" varname="dst" etype="UI16"/>
	<parameter type="__m256i" varname="src" etype="UI16"/>
	<parameter type="__mmask16" varname="k" etype="MASK"/>
	<parameter type="__m256i" varname="a" etype="UI16"/>
	<parameter type="__m256i" varname="count" etype="UI16"/>
	<description>Shift packed 16-bit integers in "a" left by the amount specified by the corresponding element in "count" while shifting in zeros, and store the results in "dst" using writemask "k" (elements are copied from "src" when the corresponding mask bit is not set).</description>
	<operation>
FOR j := 0 to 15
	i := j*16
	IF k[j]
		IF count[i+15:i] &lt; 16
			dst[i+15:i] := ZeroExtend16(a[i+15:i] &lt;&lt; count[i+15:i])
		ELSE
			dst[i+15:i] := 0
		FI
	ELSE
		dst[i+15:i] := src[i+15:i]
	FI	
ENDFOR
	</operation>
	<instruction name="VPSLLVW" form="ymm {k}, ymm, ymm" xed="VPSLLVW_YMMu16_MASKmskw_YMMu16_YMMu16_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:256] := 0


def test127():
  return '''
<intrinsic tech="AVX-512" name="_mm_sllv_epi16">
	<type>Integer</type>
	<CPUID>AVX512VL</CPUID>
	<CPUID>AVX512BW</CPUID>
	<category>Shift</category>
	<return type="__m128i" varname="dst" etype="UI16"/>
	<parameter type="__m128i" varname="a" etype="UI16"/>
	<parameter type="__m128i" varname="count" etype="UI16"/>
	<description>Shift packed 16-bit integers in "a" left by the amount specified by the corresponding element in "count" while shifting in zeros, and store the results in "dst".</description>
	<operation>
FOR j := 0 to 7
	i := j*16
	IF count[i+15:i] &lt; 16
		dst[i+15:i] := ZeroExtend16(a[i+15:i] &lt;&lt; count[i+15:i])
	ELSE
		dst[i+15:i] := 0
	FI
ENDFOR
	</operation>
	<instruction name="VPSLLVW" form="xmm, xmm, xmm" xed="VPSLLVW_XMMu16_MASKmskw_XMMu16_XMMu16_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:128] := 0


# Compilation fails
def test128():
  return '''
<intrinsic tech="AVX-512" name="_mm512_sll_epi16">
	<type>Integer</type>
	<CPUID>AVX512BW</CPUID>
	<category>Shift</category>
	<return type="__m512i" varname="dst" etype="UI16"/>
	<parameter type="__m512i" varname="a" etype="UI16"/>
	<parameter type="__m128i" varname="count" etype="UI16"/>
	<description>Shift packed 16-bit integers in "a" left by "count" while shifting in zeros, and store the results in "dst".</description>
	<operation>
FOR j := 0 to 31
	i := j*16
	IF count[63:0] &gt; 15
		dst[i+15:i] := 0
	ELSE
		dst[i+15:i] := ZeroExtend16(a[i+15:i] &lt;&lt; count[63:0])
	FI
ENDFOR
	</operation>
	<instruction name="VPSLLW" form="zmm, zmm, xmm" xed="VPSLLW_ZMMu16_MASKmskw_ZMMu16_XMMu16_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:512] := 0


def test129():
  return '''
<intrinsic tech="AVX-512" name="_mm512_slli_epi16">
	<type>Integer</type>
	<CPUID>AVX512BW</CPUID>
	<category>Shift</category>
	<return type="__m512i" varname="dst" etype="UI16"/>
	<parameter type="__m512i" varname="a" etype="UI16"/>
	<parameter type="unsigned int" varname="imm8" etype="IMM" immwidth="8"/>
	<description>Shift packed 16-bit integers in "a" left by "imm8" while shifting in zeros, and store the results in "dst".</description>
	<operation>
FOR j := 0 to 31
	i := j*16
	IF imm8[7:0] &gt; 15
		dst[i+15:i] := 0
	ELSE
		dst[i+15:i] := ZeroExtend16(a[i+15:i] &lt;&lt; imm8[7:0])
	FI
ENDFOR
	</operation>
	<instruction name="VPSLLW" form="zmm, zmm, imm8" xed="VPSLLW_ZMMu16_MASKmskw_ZMMu16_IMM8_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:512] := 0

def test130():
  return '''
<intrinsic tech="AVX-512" name="_mm_srlv_epi16">
	<type>Integer</type>
	<CPUID>AVX512VL</CPUID>
	<CPUID>AVX512BW</CPUID>
	<category>Shift</category>
	<return type="__m128i" varname="dst" etype="UI16"/>
	<parameter type="__m128i" varname="a" etype="UI16"/>
	<parameter type="__m128i" varname="count" etype="UI16"/>
	<description>Shift packed 16-bit integers in "a" right by the amount specified by the corresponding element in "count" while shifting in zeros, and store the results in "dst".</description>
	<operation>
FOR j := 0 to 7
	i := j*16
	IF count[i+15:i] &lt; 16
		dst[i+15:i] := ZeroExtend16(a[i+15:i] &gt;&gt; count[i+15:i])
	ELSE
		dst[i+15:i] := 0
	FI
ENDFOR
	</operation>
	<instruction name="VPSRLVW" form="xmm, xmm, xmm" xed="VPSRLVW_XMMu16_MASKmskw_XMMu16_XMMu16_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:128] := 0

def test131():
  return '''
<intrinsic tech="AVX-512" name="_mm256_mask_sub_epi8">
	<type>Integer</type>
	<CPUID>AVX512VL</CPUID>
	<CPUID>AVX512BW</CPUID>
	<category>Arithmetic</category>
	<return type="__m256i" varname="dst" etype="UI8"/>
	<parameter type="__m256i" varname="src" etype="UI8"/>
	<parameter type="__mmask32" varname="k" etype="MASK"/>
	<parameter type="__m256i" varname="a" etype="UI8"/>
	<parameter type="__m256i" varname="b" etype="UI8"/>
	<description>Subtract packed 8-bit integers in "b" from packed 8-bit integers in "a", and store the results in "dst" using writemask "k" (elements are copied from "src" when the corresponding mask bit is not set).</description>
	<operation>
FOR j := 0 to 31
	i := j*8
	IF k[j]
		dst[i+7:i] := a[i+7:i] - b[i+7:i]
	ELSE
		dst[i+7:i] := src[i+7:i]
	FI	
ENDFOR
	</operation>
	<instruction name="VPSUBB" form="ymm {k}, ymm, ymm" xed="VPSUBB_YMMu8_MASKmskw_YMMu8_YMMu8_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:256] := 0


def test132():
  return '''
<intrinsic tech="AVX-512" name="_mm256_mask_subs_epi8">
	<type>Integer</type>
	<CPUID>AVX512VL</CPUID>
	<CPUID>AVX512BW</CPUID>
	<category>Arithmetic</category>
	<return type="__m256i" varname="dst" etype="UI8"/>
	<parameter type="__m256i" varname="src" etype="UI8"/>
	<parameter type="__mmask32" varname="k" etype="MASK"/>
	<parameter type="__m256i" varname="a" etype="SI8"/>
	<parameter type="__m256i" varname="b" etype="SI8"/>
	<description>Subtract packed signed 8-bit integers in "b" from packed 8-bit integers in "a" using saturation, and store the results in "dst" using writemask "k" (elements are copied from "src" when the corresponding mask bit is not set).</description>
	<operation>
FOR j := 0 to 31
	i := j*8
	IF k[j]
		dst[i+7:i] := Saturate8(a[i+7:i] - b[i+7:i])
	ELSE
		dst[i+7:i] := src[i+7:i]
	FI	
ENDFOR
	</operation>
	<instruction name="VPSUBSB" form="ymm {k}, ymm, ymm" xed="VPSUBSB_YMMi8_MASKmskw_YMMi8_YMMi8_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:256] := 0


def test133():
  return '''
<intrinsic tech="AVX-512" name="_mm512_mask_testn_epi8_mask">
	<type>Integer</type>
	<type>Mask</type>
	<CPUID>AVX512BW</CPUID>
	<category>Compare</category>
	<return type="__mmask64" varname="k" etype="MASK"/>
	<parameter type="__mmask64" varname="k1" etype="MASK"/>
	<parameter type="__m512i" varname="a" etype="UI8"/>
	<parameter type="__m512i" varname="b" etype="UI8"/>
	<description>Compute the bitwise NAND of packed 8-bit integers in "a" and "b", producing intermediate 8-bit values, and set the corresponding bit in result mask "k" (subject to writemask "k") if the intermediate value is zero.</description>
	<operation>
FOR j := 0 to 63
	i := j*8
	IF k1[j]
		k[j] := ((a[i+7:i] AND b[i+7:i]) == 0) ? 1 : 0
	ELSE
		k[j] := 0
	FI
ENDFOR
	</operation>
	<instruction name="VPTESTNMB" form="k {k}, zmm, zmm" xed="VPTESTNMB_MASKmskw_MASKmskw_ZMMu8_ZMMu8_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#k[MAX:64] := 0


# Compilation works!!!!
def test134():
  return '''
<intrinsic tech="AVX-512" name="_mm256_mask_unpackhi_epi8">
	<type>Integer</type>
	<CPUID>AVX512VL</CPUID>
	<CPUID>AVX512BW</CPUID>
	<category>Miscellaneous</category>
	<return type="__m256i" varname="dst" etype="UI8"/>
	<parameter type="__m256i" varname="src" etype="UI8"/>
	<parameter type="__mmask32" varname="k" etype="MASK"/>
	<parameter type="__m256i" varname="a" etype="UI8"/>
	<parameter type="__m256i" varname="b" etype="UI8"/>
	<description>Unpack and interleave 8-bit integers from the high half of each 128-bit lane in "a" and "b", and store the results in "dst" using writemask "k" (elements are copied from "src" when the corresponding mask bit is not set).</description>
	<operation>
DEFINE INTERLEAVE_HIGH_BYTES(src1[127:0], src2[127:0]) {
	dst[7:0] := src1[71:64] 
	dst[15:8] := src2[71:64] 
	dst[23:16] := src1[79:72] 
	dst[31:24] := src2[79:72] 
	dst[39:32] := src1[87:80] 
	dst[47:40] := src2[87:80] 
	dst[55:48] := src1[95:88] 
	dst[63:56] := src2[95:88] 
	dst[71:64] := src1[103:96] 
	dst[79:72] := src2[103:96] 
	dst[87:80] := src1[111:104] 
	dst[95:88] := src2[111:104] 
	dst[103:96] := src1[119:112] 
	dst[111:104] := src2[119:112] 
	dst[119:112] := src1[127:120] 
	dst[127:120] := src2[127:120] 
	RETURN dst[127:0]
}
tmp_dst[127:0] := INTERLEAVE_HIGH_BYTES(a[127:0], b[127:0])
tmp_dst[255:128] := INTERLEAVE_HIGH_BYTES(a[255:128], b[255:128])
FOR j := 0 to 31
	i := j*8
	IF k[j]
		dst[i+7:i] := tmp_dst[i+7:i]
	ELSE
		dst[i+7:i] := src[i+7:i]
	FI
ENDFOR
	</operation>
	<instruction name="VPUNPCKHBW" form="ymm {k}, ymm, ymm" xed="VPUNPCKHBW_YMMu8_MASKmskw_YMMu8_YMMu8_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:256] := 0

def test135():
  return '''
<intrinsic tech="AVX-512" name="_mm512_maskz_unpackhi_epi8">
	<type>Integer</type>
	<CPUID>AVX512BW</CPUID>
	<category>Miscellaneous</category>
	<return type="__m512i" varname="dst" etype="UI8"/>
	<parameter type="__mmask64" varname="k" etype="MASK"/>
	<parameter type="__m512i" varname="a" etype="UI8"/>
	<parameter type="__m512i" varname="b" etype="UI8"/>
	<description>Unpack and interleave 8-bit integers from the high half of each 128-bit lane in "a" and "b", and store the results in "dst" using zeromask "k" (elements are zeroed out when the corresponding mask bit is not set).</description>
	<operation>
DEFINE INTERLEAVE_HIGH_BYTES(src1[127:0], src2[127:0]) {
	dst[7:0] := src1[71:64] 
	dst[15:8] := src2[71:64] 
	dst[23:16] := src1[79:72] 
	dst[31:24] := src2[79:72] 
	dst[39:32] := src1[87:80] 
	dst[47:40] := src2[87:80] 
	dst[55:48] := src1[95:88] 
	dst[63:56] := src2[95:88] 
	dst[71:64] := src1[103:96] 
	dst[79:72] := src2[103:96] 
	dst[87:80] := src1[111:104] 
	dst[95:88] := src2[111:104] 
	dst[103:96] := src1[119:112] 
	dst[111:104] := src2[119:112] 
	dst[119:112] := src1[127:120] 
	dst[127:120] := src2[127:120] 
	RETURN dst[127:0]
}
tmp_dst[127:0] := INTERLEAVE_HIGH_BYTES(a[127:0], b[127:0])
tmp_dst[255:128] := INTERLEAVE_HIGH_BYTES(a[255:128], b[255:128])
tmp_dst[383:256] := INTERLEAVE_HIGH_BYTES(a[383:256], b[383:256])
tmp_dst[511:384] := INTERLEAVE_HIGH_BYTES(a[511:384], b[511:384])
FOR j := 0 to 63
	i := j*8
	IF k[j]
		dst[i+7:i] := tmp_dst[i+7:i]
	ELSE
		dst[i+7:i] := 0
	FI
ENDFOR
	</operation>
	<instruction name="VPUNPCKHBW" form="zmm {z}, zmm, zmm" xed="VPUNPCKHBW_ZMMu8_MASKmskw_ZMMu8_ZMMu8_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:512] := 0


def test136():
  return '''
<intrinsic tech="AVX-512" name="_mm512_mask_unpackhi_epi16">
	<type>Integer</type>
	<CPUID>AVX512BW</CPUID>
	<category>Miscellaneous</category>
	<return type="__m512i" varname="dst" etype="UI16"/>
	<parameter type="__m512i" varname="src" etype="UI16"/>
	<parameter type="__mmask32" varname="k" etype="MASK"/>
	<parameter type="__m512i" varname="a" etype="UI16"/>
	<parameter type="__m512i" varname="b" etype="UI16"/>
	<description>Unpack and interleave 16-bit integers from the high half of each 128-bit lane in "a" and "b", and store the results in "dst" using writemask "k" (elements are copied from "src" when the corresponding mask bit is not set).</description>
	<operation>
DEFINE INTERLEAVE_HIGH_WORDS(src1[127:0], src2[127:0]) {
	dst[15:0] := src1[79:64]
	dst[31:16] := src2[79:64] 
	dst[47:32] := src1[95:80] 
	dst[63:48] := src2[95:80] 
	dst[79:64] := src1[111:96] 
	dst[95:80] := src2[111:96] 
	dst[111:96] := src1[127:112] 
	dst[127:112] := src2[127:112] 
	RETURN dst[127:0]
}
tmp_dst[127:0] := INTERLEAVE_HIGH_WORDS(a[127:0], b[127:0])
tmp_dst[255:128] := INTERLEAVE_HIGH_WORDS(a[255:128], b[255:128])
tmp_dst[383:256] := INTERLEAVE_HIGH_WORDS(a[383:256], b[383:256])
tmp_dst[511:384] := INTERLEAVE_HIGH_WORDS(a[511:384], b[511:384])
FOR j := 0 to 31
	i := j*16
	IF k[j]
		dst[i+15:i] := tmp_dst[i+15:i]
	ELSE
		dst[i+15:i] := src[i+15:i]
	FI
ENDFOR
	</operation>
	<instruction name="VPUNPCKHWD" form="zmm {k}, zmm, zmm" xed="VPUNPCKHWD_ZMMu16_MASKmskw_ZMMu16_ZMMu16_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:512] := 0


def test137():
  return '''
<intrinsic tech="AVX-512" name="_kshiftli_mask32">
	<type>Mask</type>
	<CPUID>AVX512BW</CPUID>
	<category>Mask</category>
	<return type="__mmask32" varname="k" etype="MASK"/>
	<parameter type="__mmask32" varname="a" etype="MASK"/>
	<parameter type="unsigned int" varname="count" etype="IMM" immwidth="8"/>
	<description>Shift the bits of 32-bit mask "a" left by "count" while shifting in zeros, and store the least significant 32 bits of the result in "k".</description>
	<operation>
IF count[7:0] &lt;= 31
	k[31:0] := a[31:0] &lt;&lt; count[7:0]
FI
	</operation>
	<instruction name="KSHIFTLD" form="k, k, imm8" xed="KSHIFTLD_MASKmskw_MASKmskw_IMM8_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#k[MAX:0] := 0


# Fix compilation for this
def test138():
  return '''
<intrinsic tech="AVX-512" name="_kshiftri_mask32">
	<type>Mask</type>
	<CPUID>AVX512BW</CPUID>
	<category>Mask</category>
	<return type="__mmask32" varname="k" etype="MASK"/>
	<parameter type="__mmask32" varname="a" etype="MASK"/>
	<parameter type="unsigned int" varname="count" etype="IMM" immwidth="8"/>
	<description>Shift the bits of 32-bit mask "a" right by "count" while shifting in zeros, and store the least significant 32 bits of the result in "k".</description>
	<operation>
IF count[7:0] &lt;= 31
	k[31:0] := a[31:0] &gt;&gt; count[7:0]
FI
	</operation>
	<instruction name="KSHIFTRD" form="k, k, imm8" xed="KSHIFTRD_MASKmskw_MASKmskw_IMM8_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#k[MAX:0] := 0


# Compilation fails!!!!
def test139():
  return '''
<intrinsic tech="AVX-512" name="_kortestz_mask32_u8">
	<type>Mask</type>
	<CPUID>AVX512BW</CPUID>
	<category>Mask</category>
	<return type="unsigned char" varname="dst" etype="UI8"/>
	<parameter type="__mmask32" varname="a" etype="MASK"/>
	<parameter type="__mmask32" varname="b" etype="MASK"/>
	<description>Compute the bitwise OR of 32-bit masks "a" and "b". If the result is all zeroes, store 1 in "dst", otherwise store 0 in "dst".</description>
	<operation>
tmp[31:0] := a[31:0] OR b[31:0]
IF tmp[31:0] == 0x0
	dst := 1
ELSE
	dst := 0
FI
	</operation>
	<instruction name="KORTESTD" form="k, k" xed="KORTESTD_MASKmskw_MASKmskw_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''

def test140():
  return '''
<intrinsic tech="AVX-512" name="_mm256_mask_broadcast_i32x2">
	<CPUID>AVX512VL</CPUID>
	<CPUID>AVX512DQ</CPUID>
	<category>Miscellaneous</category>
	<return type="__m256i" varname="dst" etype="UI32"/>
	<parameter type="__m256i" varname="src" etype="UI32"/>
	<parameter type="__mmask8" varname="k" etype="MASK"/>
	<parameter type="__m128i" varname="a" etype="UI32"/>
	<description>Broadcast the lower 2 packed 32-bit integers from "a" to all elements of "dst" using writemask "k" (elements are copied from "src" when the corresponding mask bit is not set).</description>
	<operation>
FOR j := 0 to 7
	i := j*32
	n := (j % 2)*32
	IF k[j]
		dst[i+31:i] := a[n+31:n]
	ELSE
		dst[i+31:i] := src[i+31:i]
	FI
ENDFOR
	</operation>
	<instruction name="VBROADCASTI32X2" form="ymm {k}, xmm" xed="VBROADCASTI32X2_YMMu32_MASKmskw_XMMu32_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:256] := 0

def test141():
  return '''
<intrinsic tech="AVX-512" name="_mm256_movepi32_mask">
	<type>Integer</type>
	<type>Mask</type>
	<CPUID>AVX512VL</CPUID>
	<CPUID>AVX512DQ</CPUID>
	<category>Miscellaneous</category>
	<return type="__mmask8" varname="k" etype="MASK"/>
	<parameter type="__m256i" varname="a" etype="UI32"/>
	<description>Set each bit of mask register "k" based on the most significant bit of the corresponding packed 32-bit integer in "a".</description>
	<operation>
FOR j := 0 to 7
	i := j*32
	IF a[i+31]
		k[j] := 1
	ELSE
		k[j] := 0
	FI
ENDFOR
	</operation>
	<instruction name="VPMOVD2M" form="k, ymm" xed="VPMOVD2M_MASKmskw_YMMu32_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#k[MAX:8] := 0


def test142():
  return '''
<intrinsic tech="AVX-512" name="_mm256_mask_mullo_epi64">
	<type>Integer</type>
	<CPUID>AVX512VL</CPUID>
	<CPUID>AVX512DQ</CPUID>
	<category>Arithmetic</category>
	<return type="__m256i" varname="dst" etype="UI64"/>
	<parameter type="__m256i" varname="src" etype="UI64"/>
	<parameter type="__mmask8" varname="k" etype="MASK"/>
	<parameter type="__m256i" varname="a" etype="UI64"/>
	<parameter type="__m256i" varname="b" etype="UI64"/>
	<description>Multiply the packed 64-bit integers in "a" and "b", producing intermediate 128-bit integers, and store the low 64 bits of the intermediate integers in "dst" using writemask "k" (elements are copied from "src" when the corresponding mask bit is not set).</description>
	<operation>
FOR j := 0 to 3
	i := j*64
	IF k[j]
		tmp[127:0] := a[i+63:i] * b[i+63:i]
		dst[i+63:i] := tmp[63:0]
	ELSE
		dst[i+63:i] := src[i+63:i]
	FI
ENDFOR
	</operation>
	<instruction name="VPMULLQ" form="ymm {k}, ymm, ymm" xed="VPMULLQ_YMMu64_MASKmskw_YMMu64_YMMu64_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:256] := 0


def test143():
  return '''
<intrinsic tech="AVX-512" name="_mm256_mask_alignr_epi32">
	<type>Integer</type>
	<CPUID>AVX512F</CPUID>
	<CPUID>AVX512VL</CPUID>
	<category>Miscellaneous</category>
	<return type="__m256i" varname="dst" etype="UI32"/>
	<parameter type="__m256i" varname="src" etype="UI32"/>
	<parameter type="__mmask8" varname="k" etype="MASK"/>
	<parameter type="__m256i" varname="a" etype="UI32"/>
	<parameter type="__m256i" varname="b" etype="UI32"/>
	<parameter type="const int" varname="imm8" etype="IMM" immwidth="3"/>
	<description>Concatenate "a" and "b" into a 64-byte immediate result, shift the result right by "imm8" 32-bit elements, and store the low 32 bytes (8 elements) in "dst" using writemask "k" (elements are copied from "src" when the corresponding mask bit is not set).</description>
	<operation>
temp[511:256] := a[255:0]
temp[255:0] := b[255:0]
temp[511:0] := temp[511:0] &gt;&gt; (32*imm8[2:0])
FOR j := 0 to 7
	i := j*32
	IF k[j]
		dst[i+31:i] := temp[i+31:i]
	ELSE
		dst[i+31:i] := src[i+31:i]
	FI
ENDFOR
	</operation>
	<instruction name="VALIGND" form="ymm {k}, ymm, ymm, imm8" xed="VALIGND_YMMu32_MASKmskw_YMMu32_YMMu32_IMM8_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:256] := 0


def test144():
  return '''
<intrinsic tech="AVX-512" name="_mm256_maskz_abs_epi32">
	<type>Integer</type>
	<CPUID>AVX512VL</CPUID>
	<CPUID>AVX512F</CPUID>
	<category>Arithmetic</category>
	<return type="__m256i" varname="dst" etype="UI32"/>
	<parameter type="__mmask8" varname="k" etype="MASK"/>
	<parameter type="__m256i" varname="a" etype="SI32"/>
	<description>Compute the absolute value of packed signed 32-bit integers in "a", and store the unsigned results in "dst" using zeromask "k" (elements are zeroed out when the corresponding mask bit is not set).</description>
	<operation>
FOR j := 0 to 7
	i := j*32
	IF k[j]
		dst[i+31:i] := ABS(a[i+31:i])
	ELSE
		dst[i+31:i] := 0
	FI
ENDFOR
	</operation>
	<instruction name="VPABSD" form="ymm {z}, ymm" xed="VPABSD_YMMi32_MASKmskw_YMMi32_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:256] := 0

def test145():
  return '''
<intrinsic tech="AVX-512" name="_mm256_mask_add_epi64">
	<type>Integer</type>
	<CPUID>AVX512VL</CPUID>
	<CPUID>AVX512F</CPUID>
	<category>Arithmetic</category>
	<return type="__m256i" varname="dst" etype="UI64"/>
	<parameter type="__m256i" varname="src" etype="UI64"/>
	<parameter type="__mmask8" varname="k" etype="MASK"/>
	<parameter type="__m256i" varname="a" etype="UI64"/>
	<parameter type="__m256i" varname="b" etype="UI64"/>
	<description>Add packed 64-bit integers in "a" and "b", and store the results in "dst" using writemask "k" (elements are copied from "src" when the corresponding mask bit is not set).</description>
	<operation>
FOR j := 0 to 3
	i := j*64
	IF k[j]
		dst[i+63:i] := a[i+63:i] + b[i+63:i]
	ELSE
		dst[i+63:i] := src[i+63:i]
	FI
ENDFOR
	</operation>
	<instruction name="VPADDQ" form="ymm {k}, ymm, ymm" xed="VPADDQ_YMMu64_MASKmskw_YMMu64_YMMu64_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:256] := 0

def  test146():
  return '''
<intrinsic tech="AVX-512" name="_mm256_mask_and_epi32">
	<type>Integer</type>
	<CPUID>AVX512VL</CPUID>
	<CPUID>AVX512F</CPUID>
	<category>Logical</category>
	<return type="__m256i" varname="dst" etype="UI32"/>
	<parameter type="__m256i" varname="src" etype="UI32"/>
	<parameter type="__mmask8" varname="k" etype="MASK"/>
	<parameter type="__m256i" varname="a" etype="UI32"/>
	<parameter type="__m256i" varname="b" etype="UI32"/>
	<description>Compute the bitwise AND of packed 32-bit integers in "a" and "b", and store the results in "dst" using writemask "k" (elements are copied from "src" when the corresponding mask bit is not set).</description>
	<operation>
FOR j := 0 to 7
	i := j*32
	IF k[j]
		dst[i+31:i] := a[i+31:i] AND b[i+31:i]
	ELSE
		dst[i+31:i] := src[i+31:i]
	FI
ENDFOR
	</operation>
	<instruction name="VPANDD" form="ymm {k}, ymm, ymm" xed="VPANDD_YMMu32_MASKmskw_YMMu32_YMMu32_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:256] := 0


def test147():
  return '''
<intrinsic tech="AVX-512" name="_mm256_mask_andnot_epi32">
	<type>Integer</type>
	<CPUID>AVX512VL</CPUID>
	<CPUID>AVX512F</CPUID>
	<category>Logical</category>
	<return type="__m256i" varname="dst" etype="UI32"/>
	<parameter type="__m256i" varname="src" etype="UI32"/>
	<parameter type="__mmask8" varname="k" etype="MASK"/>
	<parameter type="__m256i" varname="a" etype="UI32"/>
	<parameter type="__m256i" varname="b" etype="UI32"/>
	<description>Compute the bitwise NOT of packed 32-bit integers in "a" and then AND with "b", and store the results in "dst" using writemask "k" (elements are copied from "src" when the corresponding mask bit is not set).</description>
	<operation>
FOR j := 0 to 7
	i := j*32
	IF k[j]
		dst[i+31:i] := ((NOT a[i+31:i]) AND b[i+31:i])
	ELSE
		dst[i+31:i] := src[i+31:i]
	FI
ENDFOR
	</operation>
	<instruction name="VPANDND" form="ymm {k}, ymm, ymm" xed="VPANDND_YMMu32_MASKmskw_YMMu32_YMMu32_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:256] := 0


def test148():
  return '''
<intrinsic tech="AVX-512" name="_mm_mask_cmpge_epu32_mask">
	<type>Integer</type>
	<type>Mask</type>
	<CPUID>AVX512VL</CPUID>
	<CPUID>AVX512F</CPUID>
	<category>Compare</category>
	<return type="__mmask8" varname="k" etype="MASK"/>
	<parameter type="__mmask8" varname="k1" etype="MASK"/>
	<parameter type="__m128i" varname="a" etype="UI32"/>
	<parameter type="__m128i" varname="b" etype="UI32"/>
	<description>Compare packed unsigned 32-bit integers in "a" and "b" for greater-than-or-equal, and store the results in mask vector "k" using zeromask "k1" (elements are zeroed out when the corresponding mask bit is not set).</description>
	<operation>
FOR j := 0 to 3
	i := j*32
	IF k1[j]
		k[j] := ( a[i+31:i] &gt;= b[i+31:i] ) ? 1 : 0
	ELSE 
		k[j] := 0
	FI
ENDFOR
	</operation>
	<instruction name="VPCMPUD" form="k {k}, xmm, xmm" xed="VPCMPUD_MASKmskw_MASKmskw_XMMu32_XMMu32_IMM8_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#k[MAX:4] := 0


def test149():
  return '''
<intrinsic tech="AVX-512" name="_mm256_mask_permutexvar_epi32">
	<type>Integer</type>
	<CPUID>AVX512VL</CPUID>
	<CPUID>AVX512F</CPUID>
	<category>Miscellaneous</category>
	<return type="__m256i" varname="dst" etype="UI32"/>
	<parameter type="__m256i" varname="src" etype="UI32"/>
	<parameter type="__mmask8" varname="k" etype="MASK"/>
	<parameter type="__m256i" varname="idx" etype="UI32"/>
	<parameter type="__m256i" varname="a" etype="UI32"/>
	<description>Shuffle 32-bit integers in "a" across lanes using the corresponding index in "idx", and store the results in "dst" using writemask "k" (elements are copied from "src" when the corresponding mask bit is not set).</description>
	<operation>
FOR j := 0 to 7
	i := j*32
	id := idx[i+2:i]*32
	IF k[j]
		dst[i+31:i] := a[id+31:id]
	ELSE
		dst[i+31:i] := src[i+31:i]
	FI
ENDFOR
	</operation>
	<instruction name="VPERMD" form="ymm {k}, ymm, ymm" xed="VPERMD_YMMu32_MASKmskw_YMMu32_YMMu32_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:256] := 0

def test150():
  return '''
<intrinsic tech="AVX-512" name="_mm256_mask2_permutex2var_epi32">
	<type>Integer</type>
	<CPUID>AVX512VL</CPUID>
	<CPUID>AVX512F</CPUID>
	<category>Miscellaneous</category>
	<return type="__m256i" varname="dst" etype="UI32"/>
	<parameter type="__m256i" varname="a" etype="UI32"/>
	<parameter type="__m256i" varname="idx" etype="UI32"/>
	<parameter type="__mmask8" varname="k" etype="MASK"/>
	<parameter type="__m256i" varname="b" etype="UI32"/>
	<description>Shuffle 32-bit integers in "a" and "b" across lanes using the corresponding selector and index in "idx", and store the results in "dst" using writemask "k" (elements are copied from "idx" when the corresponding mask bit is not set).</description>
	<operation>
FOR j := 0 to 7
	i := j*32
	off := idx[i+2:i]*32
	IF k[j]
		dst[i+31:i] := idx[i+3] ? b[off+31:off] : a[off+31:off]
	ELSE
		dst[i+31:i] := idx[i+31:i]
	FI
ENDFOR
	</operation>
	<instruction name="VPERMI2D" form="ymm {k}, ymm, ymm" xed="VPERMI2D_YMMu32_MASKmskw_YMMu32_YMMu32_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:256] := 0


def test151():
  return '''
<intrinsic tech="AVX-512" name="_mm256_mask_permutexvar_epi64">
	<type>Integer</type>
	<CPUID>AVX512VL</CPUID>
	<CPUID>AVX512F</CPUID>
	<category>Miscellaneous</category>
	<return type="__m256i" varname="dst" etype="UI64"/>
	<parameter type="__m256i" varname="src" etype="UI64"/>
	<parameter type="__mmask8" varname="k" etype="MASK"/>
	<parameter type="__m256i" varname="idx" etype="UI64"/>
	<parameter type="__m256i" varname="a" etype="UI64"/>
	<description>Shuffle 64-bit integers in "a" across lanes using the corresponding index in "idx", and store the results in "dst" using writemask "k" (elements are copied from "src" when the corresponding mask bit is not set).</description>
	<operation>
FOR j := 0 to 3
	i := j*64
	id := idx[i+1:i]*64
	IF k[j]
		dst[i+63:i] := a[id+63:id]
	ELSE
		dst[i+63:i] := src[i+63:i]
	FI
ENDFOR
	</operation>
	<instruction name="VPERMQ" form="ymm {k}, ymm, ymm" xed="VPERMQ_YMMu64_MASKmskw_YMMu64_YMMu64_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:256] := 0

def test152():
  return '''
<intrinsic tech="AVX-512" name="_mm256_mask_cvtepi32_epi8">
	<type>Integer</type>
	<CPUID>AVX512VL</CPUID>
	<CPUID>AVX512F</CPUID>
	<category>Convert</category>
	<return type="__m128i" varname="dst" etype="UI8"/>
	<parameter type="__m128i" varname="src" etype="UI8"/>
	<parameter type="__mmask8" varname="k" etype="MASK"/>
	<parameter type="__m256i" varname="a" etype="UI32"/>
	<description>Convert packed 32-bit integers in "a" to packed 8-bit integers with truncation, and store the results in "dst" using writemask "k" (elements are copied from "src" when the corresponding mask bit is not set).</description>
	<operation>
FOR j := 0 to 7
	i := 32*j
	l := 8*j
	IF k[j]
		dst[l+7:l] := Truncate8(a[i+31:i])
	ELSE
		dst[l+7:l] := src[l+7:l]
	FI
ENDFOR
	</operation>
	<instruction name="VPMOVDB" form="xmm {k}, ymm" xed="VPMOVDB_XMMu8_MASKmskw_YMMu32_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:64] := 0

def test153():
  return '''
<intrinsic tech="AVX-512" name="_mm256_mask_cvtsepi32_epi8">
	<type>Integer</type>
	<CPUID>AVX512VL</CPUID>
	<CPUID>AVX512F</CPUID>
	<category>Convert</category>
	<return type="__m128i" varname="dst" etype="SI8"/>
	<parameter type="__m128i" varname="src" etype="UI8"/>
	<parameter type="__mmask8" varname="k" etype="MASK"/>
	<parameter type="__m256i" varname="a" etype="SI32"/>
	<description>Convert packed signed 32-bit integers in "a" to packed 8-bit integers with signed saturation, and store the results in "dst" using writemask "k" (elements are copied from "src" when the corresponding mask bit is not set).</description>
	<operation>
FOR j := 0 to 7
	i := 32*j
	l := 8*j
	IF k[j]
		dst[l+7:l] := Saturate8(a[i+31:i])
	ELSE
		dst[l+7:l] := src[l+7:l]
	FI
ENDFOR
	</operation>
	<instruction name="VPMOVSDB" form="xmm {k}, ymm" xed="VPMOVSDB_XMMi8_MASKmskw_YMMi32_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:64] := 0

def test154():
  return '''
<intrinsic tech="AVX-512" name="_mm256_maskz_cvtepi8_epi32">
	<type>Integer</type>
	<CPUID>AVX512VL</CPUID>
	<CPUID>AVX512F</CPUID>
	<category>Convert</category>
	<return type="__m256i" varname="dst" etype="SI32"/>
	<parameter type="__mmask8" varname="k" etype="MASK"/>
	<parameter type="__m128i" varname="a" etype="SI8"/>
	<description>Sign extend packed 8-bit integers in the low 8 bytes of "a" to packed 32-bit integers, and store the results in "dst" using zeromask "k" (elements are zeroed out when the corresponding mask bit is not set).</description>
	<operation>
FOR j := 0 to 7
	i := 32*j
	l := 8*j
	IF k[j]
		dst[i+31:i] := SignExtend32(a[l+7:l])
	ELSE
		dst[i+31:i] := 0
	FI
ENDFOR
	</operation>
	<instruction name="VPMOVSXBD" form="ymm {z}, xmm" xed="VPMOVSXBD_YMMi32_MASKmskw_XMMi8_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:256] := 0


def test155():
  return '''
<intrinsic tech="AVX-512" name="_mm256_mask_mul_epi32">
	<type>Integer</type>
	<CPUID>AVX512VL</CPUID>
	<CPUID>AVX512F</CPUID>
	<category>Arithmetic</category>
	<return type="__m256i" varname="dst" etype="SI64"/>
	<parameter type="__m256i" varname="src" etype="SI64"/>
	<parameter type="__mmask8" varname="k" etype="MASK"/>
	<parameter type="__m256i" varname="a" etype="SI32"/>
	<parameter type="__m256i" varname="b" etype="SI32"/>
	<description>Multiply the low signed 32-bit integers from each packed 64-bit element in "a" and "b", and store the signed 64-bit results in "dst" using writemask "k" (elements are copied from "src" when the corresponding mask bit is not set).</description>
	<operation>
FOR j := 0 to 3
	i := j*64
	IF k[j]
		dst[i+63:i] := SignExtend64(a[i+31:i]) * SignExtend64(b[i+31:i])
	ELSE
		dst[i+63:i] := src[i+63:i]
	FI
ENDFOR
	</operation>
	<instruction name="VPMULDQ" form="ymm {k}, ymm, ymm" xed="VPMULDQ_YMMi64_MASKmskw_YMMi32_YMMi32_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:256] := 0

def test156():
  return '''
<intrinsic tech="AVX-512" name="_mm256_maskz_or_epi32">
	<type>Integer</type>
	<CPUID>AVX512VL</CPUID>
	<CPUID>AVX512F</CPUID>
	<category>Logical</category>
	<return type="__m256i" varname="dst" etype="UI32"/>
	<parameter type="__mmask8" varname="k" etype="MASK"/>
	<parameter type="__m256i" varname="a" etype="UI32"/>
	<parameter type="__m256i" varname="b" etype="UI32"/>
	<description>Compute the bitwise OR of packed 32-bit integers in "a" and "b", and store the results in "dst" using zeromask "k" (elements are zeroed out when the corresponding mask bit is not set).</description>
	<operation>
FOR j := 0 to 7
	i := j*32
	IF k[j]
		dst[i+31:i] := a[i+31:i] OR b[i+31:i]
	ELSE
		dst[i+31:i] := 0
	FI
ENDFOR
	</operation>
	<instruction name="VPORD" form="ymm {z}, ymm, ymm" xed="VPORD_YMMu32_MASKmskw_YMMu32_YMMu32_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:256] := 0

def test157():
  return '''
<intrinsic tech="AVX-512" name="_mm_mask_madd52hi_epu64">
	<CPUID>AVX512IFMA52</CPUID>
	<CPUID>AVX512VL</CPUID>
	<category>Arithmetic</category>
	<return type="__m128i" varname="dst" etype="UI64"/>
	<parameter type="__m128i" varname="a" etype="UI64"/>
	<parameter type="__mmask8" varname="k" etype="MASK"/>
	<parameter type="__m128i" varname="b" etype="UI64"/>
	<parameter type="__m128i" varname="c" etype="UI64"/>
	<description>Multiply packed unsigned 52-bit integers in each 64-bit element of "b" and "c" to form a 104-bit intermediate result. Add the high 52-bit unsigned integer from the intermediate result with the corresponding unsigned 64-bit integer in "a", and store the results in "dst" using writemask "k" (elements are copied from "a" when the corresponding mask bit is not set).</description>
	<operation>
FOR j := 0 to 1
	i := j*64
	IF k[j]
		tmp[127:0] := ZeroExtend64(b[i+51:i]) * ZeroExtend64(c[i+51:i])
		dst[i+63:i] := a[i+63:i] + ZeroExtend64(tmp[103:52])
	ELSE
		dst[i+63:i] := a[i+63:i]
	FI
ENDFOR
	</operation>
	<instruction name="VPMADD52HUQ" form="xmm {k}, xmm, xmm" xed="VPMADD52HUQ_XMMu64_MASKmskw_XMMu64_XMMu64_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:128] := 0


def test158():
  return '''
<intrinsic tech="AVX-512/KNC" name="_mm512_mask_and_epi32">
	<type>Integer</type>
	<CPUID>AVX512F/KNCNI</CPUID>
	<category>Logical</category>
	<return type="__m512i" varname="dst" etype="UI32"/>
	<parameter type="__m512i" varname="src" etype="UI32"/>
	<parameter type="__mmask16" varname="k" etype="MASK"/>
	<parameter type="__m512i" varname="v2" etype="UI32"/>
	<parameter type="__m512i" varname="v3" etype="UI32"/>
	<description>Performs element-by-element bitwise AND between packed 32-bit integer elements of "v2" and "v3", storing the results in "dst" using writemask "k" (elements are copied from "src" when the corresponding mask bit is not set).</description>
	<operation>
FOR j := 0 to 15
	i := j*32
	IF k[j]
		dst[i+31:i] := v2[i+31:i] &amp; v3[i+31:i]
	ELSE
		dst[i+31:i] := src[i+31:i]
	FI
ENDFOR
	</operation>
	<instruction name="VPANDD" form="zmm {k}, zmm, zmm" xed="VPANDD_ZMMu32_MASKmskw_ZMMu32_ZMMu32_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:512] := 0

# Compilation fails!!!
def test159():
  return '''
<intrinsic tech="KNC" name="_mm512_addsets_epi32">
	<type>Integer</type>
	<CPUID>KNCNI</CPUID>
	<category>Arithmetic</category>
	<return type="__m512i" varname="dst" etype="UI32"/>
	<parameter type="__m512i" varname="v2" etype="UI32"/>
	<parameter type="__m512i" varname="v3" etype="UI32"/>
	<parameter type="__mmask16 *" varname="sign" etype="MASK" memwidth="16"/>
	<description>Performs an element-by-element addition of packed 32-bit integer elements in "v2" and "v3", storing the results in "dst" and the sign of the sum in "sign" (sign flag).</description>
	<operation>
FOR j := 0 to 15
	i := j*32
	dst[i+31:i] := v2[i+31:i] + v3[i+31:i]
	sign[j] := v2[i+31:i] &amp; v3[i+31:i] &amp; 0x80000000
ENDFOR
	</operation>
	<instruction name="VPADDSETSD" form="zmm, zmm, zmm"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:512] := 0

# Compilation fails!!!
def test160():
  return '''
<intrinsic tech="KNC" name="_mm512_mask_mulhi_epu32">
	<type>Integer</type>
	<CPUID>KNCNI</CPUID>
	<category>Arithmetic</category>
	<return type="__m512i" varname="dst" etype="UI32"/>
	<parameter type="__m512i" varname="src" etype="UI32"/>
	<parameter type="__mmask16" varname="k" etype="MASK"/>
	<parameter type="__m512i" varname="a" etype="UI32"/>
	<parameter type="__m512i" varname="b" etype="UI32"/>
	<description>Performs element-by-element multiplication between packed unsigned 32-bit integer elements in "a" and "b" and stores the high 32 bits of each result into "dst" using writemask "k" (elements are copied from "src" when the corresponding mask bit is not set).</description>
	<operation>
FOR j := 0 to 15
	i := j*32
	IF k[j]
		dst[i+31:i] := (a[i+31:i] * b[i+31:i]) &gt;&gt; 32
	ELSE
		dst[i+31:i] := src[i+31:i]
	FI
ENDFOR
	</operation>
	<instruction name="VPMULHUD" form="zmm {k}, zmm, m512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:512] := 0

def test161():
  return '''
<intrinsic tech="KNC" name="_mm512_mask_addsetc_epi32">
	<type>Integer</type>
	<CPUID>KNCNI</CPUID>
	<category>Arithmetic</category>
	<return type="__m512i" varname="dst" etype="UI32"/>
	<parameter type="__m512i" varname="v2" etype="UI32"/>
	<parameter type="__mmask16" varname="k" etype="MASK"/>
	<parameter type="__mmask16" varname="k_old" etype="MASK"/>
	<parameter type="__m512i" varname="v3" etype="UI32"/>
	<parameter type="__mmask16 *" varname="k2_res" etype="MASK" memwidth="16"/>
	<description>Performs element-by-element addition of packed 32-bit integer elements in "v2" and "v3", storing the resultant carry in "k2_res" (carry flag) and the addition results in "dst" using writemask "k" (elements are copied from "v2" and "k_old" when the corresponding mask bit is not set).</description>
	<operation>
FOR j := 0 to 15
	i := j*32
	IF k[j]
		dst[i+31:i] := v2[i+31:i] + v3[i+31:i]
	ELSE
		dst[i+31:i] := v2[i+31:i]
		k2_res[j] := k_old[j]
	FI
ENDFOR
	</operation>
	<instruction name="VPADDSETCD" form="zmm {k}, k, zmm"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:512] := 0

def test170():
	return '''
<intrinsic tech="AVX-512" name="_mm_dpwssd_epi32">
	<type>Integer</type>
	<CPUID>AVX512_VNNI</CPUID>
	<CPUID>AVX512VL</CPUID>
	<category>Arithmetic</category>
	<return type="__m128i" varname="dst" etype="SI32"/>
	<parameter type="__m128i" varname="src" etype="SI32"/>
	<parameter type="__m128i" varname="a" etype="SI16"/>
	<parameter type="__m128i" varname="b" etype="SI16"/>
	<description>Multiply groups of 2 adjacent pairs of signed 16-bit integers in "a" with corresponding 16-bit integers in "b", producing 2 intermediate signed 32-bit results. Sum these 2 results with the corresponding 32-bit integer in "src", and store the packed 32-bit results in "dst".</description>
	<operation>
FOR j := 0 to 3
	tmp1.dword := SignExtend32(a.word[2*j]) * SignExtend32(b.word[2*j])
	tmp2.dword := SignExtend32(a.word[2*j+1]) * SignExtend32(b.word[2*j+1])
	dst.dword[j] := src.dword[j] + tmp1 + tmp2
ENDFOR
	</operation>
	<instruction name="VPDPWSSD" form="xmm, xmm, xmm" xed="VPDPWSSD_XMMi32_MASKmskw_XMMi16_XMMu32_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:128] := 0


def test171():
	return '''
<intrinsic tech="AVX-512" name="_mm512_dpbusd_epi32">
	<type>Integer</type>
	<CPUID>AVX512_VNNI</CPUID>
	<category>Arithmetic</category>
	<return type="__m512i" varname="dst" etype="SI32"/>
	<parameter type="__m512i" varname="src" etype="SI32"/>
	<parameter type="__m512i" varname="a" etype="UI8"/>
	<parameter type="__m512i" varname="b" etype="SI8"/>
	<description>Multiply groups of 4 adjacent pairs of unsigned 8-bit integers in "a" with corresponding signed 8-bit integers in "b", producing 4 intermediate signed 16-bit results. Sum these 4 results with the corresponding 32-bit integer in "src", and store the packed 32-bit results in "dst".</description>
	<operation>
FOR j := 0 to 15
	tmp1.word := Signed(ZeroExtend16(a.byte[4*j]) * SignExtend16(b.byte[4*j]))
	tmp2.word := Signed(ZeroExtend16(a.byte[4*j+1]) * SignExtend16(b.byte[4*j+1]))
	tmp3.word := Signed(ZeroExtend16(a.byte[4*j+2]) * SignExtend16(b.byte[4*j+2]))
	tmp4.word := Signed(ZeroExtend16(a.byte[4*j+3]) * SignExtend16(b.byte[4*j+3]))
	dst.dword[j] := src.dword[j] + tmp1 + tmp2 + tmp3 + tmp4
ENDFOR
	</operation>
	<instruction name="VPDPBUSD" form="zmm, zmm, zmm" xed="VPDPBUSD_ZMMi32_MASKmskw_ZMMu8_ZMMu32_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:512] := 0


def test172():
	return '''
<intrinsic tech="AVX-512" name="_mm512_maskz_dpbusd_epi32">
	<type>Integer</type>
	<CPUID>AVX512_VNNI</CPUID>
	<category>Arithmetic</category>
	<return type="__m512i" varname="dst" etype="SI32"/>
	<parameter type="__mmask16" varname="k" etype="MASK"/>
	<parameter type="__m512i" varname="src" etype="SI32"/>
	<parameter type="__m512i" varname="a" etype="UI8"/>
	<parameter type="__m512i" varname="b" etype="SI8"/>
	<description>Multiply groups of 4 adjacent pairs of unsigned 8-bit integers in "a" with corresponding signed 8-bit integers in "b", producing 4 intermediate signed 16-bit results. Sum these 4 results with the corresponding 32-bit integer in "src", and store the packed 32-bit results in "dst" using zeromask "k" (elements are zeroed out when the corresponding mask bit is not set).</description>
	<operation>
FOR j := 0 to 15
	IF k[j]
		tmp1.word := Signed(ZeroExtend16(a.byte[4*j]) * SignExtend16(b.byte[4*j]))
		tmp2.word := Signed(ZeroExtend16(a.byte[4*j+1]) * SignExtend16(b.byte[4*j+1]))
		tmp3.word := Signed(ZeroExtend16(a.byte[4*j+2]) * SignExtend16(b.byte[4*j+2]))
		tmp4.word := Signed(ZeroExtend16(a.byte[4*j+3]) * SignExtend16(b.byte[4*j+3]))
		dst.dword[j] := src.dword[j] + tmp1 + tmp2 + tmp3 + tmp4
	ELSE
		dst.dword[j] := 0
	FI
ENDFOR
	</operation>
	<instruction name="VPDPBUSD" form="zmm {z}, zmm, zmm" xed="VPDPBUSD_ZMMi32_MASKmskw_ZMMu8_ZMMu32_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:512] := 0


def test173():
	return '''
<intrinsic tech="AVX-512" name="_mm_dpbusds_epi32">
	<type>Integer</type>
	<CPUID>AVX512_VNNI</CPUID>
	<CPUID>AVX512VL</CPUID>
	<category>Arithmetic</category>
	<return type="__m128i" varname="dst" etype="SI32"/>
	<parameter type="__m128i" varname="src" etype="SI32"/>
	<parameter type="__m128i" varname="a" etype="UI8"/>
	<parameter type="__m128i" varname="b" etype="SI8"/>
	<description>Multiply groups of 4 adjacent pairs of unsigned 8-bit integers in "a" with corresponding signed 8-bit integers in "b", producing 4 intermediate signed 16-bit results. Sum these 4 results with the corresponding 32-bit integer in "src" using signed saturation, and store the packed 32-bit results in "dst".</description>
	<operation>
FOR j := 0 to 3
	tmp1.word := Signed(ZeroExtend16(a.byte[4*j]) * SignExtend16(b.byte[4*j]))
	tmp2.word := Signed(ZeroExtend16(a.byte[4*j+1]) * SignExtend16(b.byte[4*j+1]))
	tmp3.word := Signed(ZeroExtend16(a.byte[4*j+2]) * SignExtend16(b.byte[4*j+2]))
	tmp4.word := Signed(ZeroExtend16(a.byte[4*j+3]) * SignExtend16(b.byte[4*j+3]))
	dst.dword[j] := Saturate32(src.dword[j] + tmp1 + tmp2 + tmp3 + tmp4)
ENDFOR
	</operation>
	<instruction name="VPDPBUSDS" form="xmm, xmm, xmm" xed="VPDPBUSDS_XMMi32_MASKmskw_XMMu8_XMMu32_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:128] := 0


def test174():
	return '''
<intrinsic tech="AVX-512" name="_mm_mask_dpbusds_epi32">
	<type>Integer</type>
	<CPUID>AVX512_VNNI</CPUID>
	<CPUID>AVX512VL</CPUID>
	<category>Arithmetic</category>
	<return type="__m128i" varname="dst" etype="SI32"/>
	<parameter type="__m128i" varname="src" etype="SI32"/>
	<parameter type="__mmask8" varname="k" etype="MASK"/>
	<parameter type="__m128i" varname="a" etype="UI8"/>
	<parameter type="__m128i" varname="b" etype="SI8"/>
	<description>Multiply groups of 4 adjacent pairs of unsigned 8-bit integers in "a" with corresponding signed 8-bit integers in "b", producing 4 intermediate signed 16-bit results. Sum these 4 results with the corresponding 32-bit integer in "src" using signed saturation, and store the packed 32-bit results in "dst" using writemask "k" (elements are copied from "src" when the corresponding mask bit is not set).</description>
	<operation>
FOR j := 0 to 3
	IF k[j]
		tmp1.word := Signed(ZeroExtend16(a.byte[4*j]) * SignExtend16(b.byte[4*j]))
		tmp2.word := Signed(ZeroExtend16(a.byte[4*j+1]) * SignExtend16(b.byte[4*j+1]))
		tmp3.word := Signed(ZeroExtend16(a.byte[4*j+2]) * SignExtend16(b.byte[4*j+2]))
		tmp4.word := Signed(ZeroExtend16(a.byte[4*j+3]) * SignExtend16(b.byte[4*j+3]))
		dst.dword[j] := Saturate32(src.dword[j] + tmp1 + tmp2 + tmp3 + tmp4)
	ELSE
		dst.dword[j] := src.dword[j]
	FI
ENDFOR
	</operation>
	<instruction name="VPDPBUSDS" form="xmm {k}, xmm, xmm" xed="VPDPBUSDS_XMMi32_MASKmskw_XMMu8_XMMu32_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:128] := 0

def test175():
	return '''
<intrinsic tech="SSSE3" vexEq="TRUE" name="_mm_hadds_epi16">
	<type>Integer</type>
	<CPUID>SSSE3</CPUID>
	<category>Arithmetic</category>
	<return type="__m128i" varname="dst" etype="SI16"/>
	<parameter type="__m128i" varname="a" etype="SI16"/>
	<parameter type="__m128i" varname="b" etype="SI16"/>
	<description>Horizontally add adjacent pairs of signed 16-bit integers in "a" and "b" using saturation, and pack the signed 16-bit results in "dst".</description>
	<operation>
dst[15:0] := Saturate16(a[31:16] + a[15:0])
dst[31:16] := Saturate16(a[63:48] + a[47:32])
dst[47:32] := Saturate16(a[95:80] + a[79:64])
dst[63:48] := Saturate16(a[127:112] + a[111:96])
dst[79:64] := Saturate16(b[31:16] + b[15:0])
dst[95:80] := Saturate16(b[63:48] + b[47:32])
dst[111:96] := Saturate16(b[95:80] + b[79:64])
dst[127:112] := Saturate16(b[127:112] + b[111:96])
	</operation>
	<instruction name="PHADDSW" form="xmm, xmm" xed="PHADDSW_XMMdq_XMMdq"/>
	<header>tmmintrin.h</header>
</intrinsic>
'''

def test176():
	return '''
<intrinsic tech="MMX" name="_mm_packs_pi32">
	<type>Integer</type>
	<CPUID>MMX</CPUID>
	<category>Miscellaneous</category>
	<return type="__m64" varname="dst" etype="SI16"/>
	<parameter type="__m64" varname="a" etype="SI32"/>
	<parameter type="__m64" varname="b" etype="SI32"/>
	<description>Convert packed signed 32-bit integers from "a" and "b" to packed 16-bit integers using signed saturation, and store the results in "dst".</description>
	<operation>
dst[15:0] := Saturate16(a[31:0])
dst[31:16] := Saturate16(a[63:32])
dst[47:32] := Saturate16(b[31:0])
dst[63:48] := Saturate16(b[63:32])
	</operation>
	<instruction name="PACKSSDW" form="mm, mm" xed="PACKSSDW_MMXq_MMXq"/>
	<header>mmintrin.h</header>
</intrinsic>
'''

def test177():
	return '''
<intrinsic tech="AVX-512" name="_mm512_shufflelo_epi16">
	<type>Integer</type>
	<CPUID>AVX512BW</CPUID>
	<category>Miscellaneous</category>
	<return type="__m512i" varname="dst" etype="UI16"/>
	<parameter type="__m512i" varname="a" etype="UI16"/>
	<parameter type="int" varname="imm8" etype="IMM" immwidth="8"/>
	<description>Shuffle 16-bit integers in the low 64 bits of 128-bit lanes of "a" using the control in "imm8". Store the results in the low 64 bits of 128-bit lanes of "dst", with the high 64 bits of 128-bit lanes being copied from from "a" to "dst".</description>
	<operation>
dst[15:0] := (a &gt;&gt; (imm8[1:0] * 16))[15:0]
dst[31:16] := (a &gt;&gt; (imm8[3:2] * 16))[15:0]
dst[47:32] := (a &gt;&gt; (imm8[5:4] * 16))[15:0]
dst[63:48] := (a &gt;&gt; (imm8[7:6] * 16))[15:0]
dst[127:64] := a[127:64]
dst[143:128] := (a &gt;&gt; (imm8[1:0] * 16))[143:128]
dst[159:144] := (a &gt;&gt; (imm8[3:2] * 16))[143:128]
dst[175:160] := (a &gt;&gt; (imm8[5:4] * 16))[143:128]
dst[191:176] := (a &gt;&gt; (imm8[7:6] * 16))[143:128]
dst[255:192] := a[255:192]
dst[271:256] := (a &gt;&gt; (imm8[1:0] * 16))[271:256]
dst[287:272] := (a &gt;&gt; (imm8[3:2] * 16))[271:256]
dst[303:288] := (a &gt;&gt; (imm8[5:4] * 16))[271:256]
dst[319:304] := (a &gt;&gt; (imm8[7:6] * 16))[271:256]
dst[383:320] := a[383:320]
dst[399:384] := (a &gt;&gt; (imm8[1:0] * 16))[399:384]
dst[415:400] := (a &gt;&gt; (imm8[3:2] * 16))[399:384]
dst[431:416] := (a &gt;&gt; (imm8[5:4] * 16))[399:384]
dst[447:432] := (a &gt;&gt; (imm8[7:6] * 16))[399:384]
dst[511:448] := a[511:448]
	</operation>
	<instruction name="VPSHUFLW" form="zmm, zmm, imm8" xed="VPSHUFLW_ZMMu16_MASKmskw_ZMMu16_IMM8_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:512] := 0

def test178():
	return '''
<intrinsic tech="AVX-512" name="_mm_madd52lo_epu64">
	<CPUID>AVX512IFMA52</CPUID>
	<CPUID>AVX512VL</CPUID>
	<category>Arithmetic</category>
	<return type="__m128i" varname="dst" etype="UI64"/>
	<parameter type="__m128i" varname="a" etype="UI64"/>
	<parameter type="__m128i" varname="b" etype="UI64"/>
	<parameter type="__m128i" varname="c" etype="UI64"/>
	<description>Multiply packed unsigned 52-bit integers in each 64-bit element of "b" and "c" to form a 104-bit intermediate result. Add the low 52-bit unsigned integer from the intermediate result with the corresponding unsigned 64-bit integer in "a", and store the results in "dst".</description>
	<operation>
FOR j := 0 to 1
	i := j*64
	tmp[127:0] := ZeroExtend64(b[i+51:i]) * ZeroExtend64(c[i+51:i])
	dst[i+63:i] := a[i+63:i] + ZeroExtend64(tmp[51:0])
ENDFOR
	</operation>
	<instruction name="VPMADD52LUQ" form="xmm, xmm, xmm" xed="VPMADD52LUQ_XMMu64_MASKmskw_XMMu64_XMMu64_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:128] := 0

def test179():
	return '''
<intrinsic tech="SSE2" vexEq="TRUE" name="_mm_xor_si128">
	<type>Integer</type>
	<CPUID>SSE2</CPUID>
	<category>Logical</category>
	<return type="__m128i" varname="dst" etype="M128"/>
	<parameter type="__m128i" varname="a" etype="M128"/>
	<parameter type="__m128i" varname="b" etype="M128"/>
	<description>Compute the bitwise XOR of 128 bits (representing integer data) in "a" and "b", and store the result in "dst".</description>
	<operation>
dst[127:0] := (a[127:0] XOR b[127:0])
	</operation>
	<instruction name="PXOR" form="xmm, xmm" xed="PXOR_XMMdq_XMMdq"/>
	<header>emmintrin.h</header>
</intrinsic>
'''
#k[MAX:16] := 0

def test180():
	return '''
<intrinsic tech="AVX-512/KNC" name="_mm512_xor_epi64">
	<type>Integer</type>
	<CPUID>AVX512F/KNCNI</CPUID>
	<category>Logical</category>
	<return type="__m512i" varname="dst" etype="UI64"/>
	<parameter type="__m512i" varname="a" etype="UI64"/>
	<parameter type="__m512i" varname="b" etype="UI64"/>
	<description>Compute the bitwise XOR of packed 64-bit integers in "a" and "b", and store the results in "dst".</description>
	<operation>
FOR j := 0 to 7
	i := j*64
	dst[i+63:i] := a[i+63:i] XOR b[i+63:i]
ENDFOR
	</operation>
	<instruction name="VPXORQ" form="zmm, zmm, zmm" xed="VPXORQ_ZMMu64_MASKmskw_ZMMu64_ZMMu64_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:512] := 0

def test181():
	return '''
<intrinsic tech="AVX-512" name="_mm_max_epu64">
	<type>Integer</type>
	<CPUID>AVX512VL</CPUID>
	<CPUID>AVX512F</CPUID>
	<category>Arithmetic</category>
	<return type="__m128i" varname="dst" etype="UI64"/>
	<parameter type="__m128i" varname="a" etype="UI64"/>
	<parameter type="__m128i" varname="b" etype="UI64"/>
	<description>Compare packed unsigned 64-bit integers in "a" and "b", and store packed maximum values in "dst".</description>
	<operation>
FOR j := 0 to 1
	i := j*64
	dst[i+63:i] := MAX(a[i+63:i], b[i+63:i])
ENDFOR
	</operation>
	<instruction name="VPMAXUQ" form="xmm, xmm, xmm" xed="VPMAXUQ_XMMu64_MASKmskw_XMMu64_XMMu64_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:128] := 0


def test182():
	return '''
<intrinsic tech="SSE4.1" vexEq="TRUE" name="_mm_cvtepu8_epi32">
	<type>Integer</type>
	<CPUID>SSE4.1</CPUID>
	<category>Convert</category>
	<return type="__m128i" varname="dst" etype="UI32"/>
	<parameter type="__m128i" varname="a" etype="UI8"/>
	<description>Zero extend packed unsigned 8-bit integers in "a" to packed 32-bit integers, and store the results in "dst".</description>
	<operation>
FOR j := 0 to 3
	i := 32*j
	k := 8*j
	dst[i+31:i] := ZeroExtend32(a[k+7:k])
ENDFOR
	</operation>
	<instruction name="PMOVZXBD" form="xmm, xmm" xed="PMOVZXBD_XMMdq_XMMd"/>
	<header>smmintrin.h</header>
</intrinsic>
'''

def test183():
	return '''
<intrinsic tech="AVX-512" name="_mm512_mask_packus_epi16">
	<type>Integer</type>
	<CPUID>AVX512BW</CPUID>
	<category>Convert</category>
	<category>Miscellaneous</category>
	<return type="__m512i" varname="dst" etype="UI8"/>
	<parameter type="__m512i" varname="src" etype="UI8"/>
	<parameter type="__mmask64" varname="k" etype="MASK"/>
	<parameter type="__m512i" varname="a" etype="SI16"/>
	<parameter type="__m512i" varname="b" etype="SI16"/>
	<description>Convert packed signed 16-bit integers from "a" and "b" to packed 8-bit integers using unsigned saturation, and store the results in "dst" using writemask "k" (elements are copied from "src" when the corresponding mask bit is not set).</description>
	<operation>
tmp_dst[7:0] := SaturateU8(a[15:0])
tmp_dst[15:8] := SaturateU8(a[31:16])
tmp_dst[23:16] := SaturateU8(a[47:32])
tmp_dst[31:24] := SaturateU8(a[63:48])
tmp_dst[39:32] := SaturateU8(a[79:64])
tmp_dst[47:40] := SaturateU8(a[95:80])
tmp_dst[55:48] := SaturateU8(a[111:96])
tmp_dst[63:56] := SaturateU8(a[127:112])
tmp_dst[71:64] := SaturateU8(b[15:0])
tmp_dst[79:72] := SaturateU8(b[31:16])
tmp_dst[87:80] := SaturateU8(b[47:32])
tmp_dst[95:88] := SaturateU8(b[63:48])
tmp_dst[103:96] := SaturateU8(b[79:64])
tmp_dst[111:104] := SaturateU8(b[95:80])
tmp_dst[119:112] := SaturateU8(b[111:96])
tmp_dst[127:120] := SaturateU8(b[127:112])
tmp_dst[135:128] := SaturateU8(a[143:128])
tmp_dst[143:136] := SaturateU8(a[159:144])
tmp_dst[151:144] := SaturateU8(a[175:160])
tmp_dst[159:152] := SaturateU8(a[191:176])
tmp_dst[167:160] := SaturateU8(a[207:192])
tmp_dst[175:168] := SaturateU8(a[223:208])
tmp_dst[183:176] := SaturateU8(a[239:224])
tmp_dst[191:184] := SaturateU8(a[255:240])
tmp_dst[199:192] := SaturateU8(b[143:128])
tmp_dst[207:200] := SaturateU8(b[159:144])
tmp_dst[215:208] := SaturateU8(b[175:160])
tmp_dst[223:216] := SaturateU8(b[191:176])
tmp_dst[231:224] := SaturateU8(b[207:192])
tmp_dst[239:232] := SaturateU8(b[223:208])
tmp_dst[247:240] := SaturateU8(b[239:224])
tmp_dst[255:248] := SaturateU8(b[255:240])
tmp_dst[263:256] := SaturateU8(a[271:256])
tmp_dst[271:264] := SaturateU8(a[287:272])
tmp_dst[279:272] := SaturateU8(a[303:288])
tmp_dst[287:280] := SaturateU8(a[319:304])
tmp_dst[295:288] := SaturateU8(a[335:320])
tmp_dst[303:296] := SaturateU8(a[351:336])
tmp_dst[311:304] := SaturateU8(a[367:352])
tmp_dst[319:312] := SaturateU8(a[383:368])
tmp_dst[327:320] := SaturateU8(b[271:256])
tmp_dst[335:328] := SaturateU8(b[287:272])
tmp_dst[343:336] := SaturateU8(b[303:288])
tmp_dst[351:344] := SaturateU8(b[319:304])
tmp_dst[359:352] := SaturateU8(b[335:320])
tmp_dst[367:360] := SaturateU8(b[351:336])
tmp_dst[375:368] := SaturateU8(b[367:352])
tmp_dst[383:376] := SaturateU8(b[383:368])
tmp_dst[391:384] := SaturateU8(a[399:384])
tmp_dst[399:392] := SaturateU8(a[415:400])
tmp_dst[407:400] := SaturateU8(a[431:416])
tmp_dst[415:408] := SaturateU8(a[447:432])
tmp_dst[423:416] := SaturateU8(a[463:448])
tmp_dst[431:424] := SaturateU8(a[479:464])
tmp_dst[439:432] := SaturateU8(a[495:480])
tmp_dst[447:440] := SaturateU8(a[511:496])
tmp_dst[455:448] := SaturateU8(b[399:384])
tmp_dst[463:456] := SaturateU8(b[415:400])
tmp_dst[471:464] := SaturateU8(b[431:416])
tmp_dst[479:472] := SaturateU8(b[447:432])
tmp_dst[487:480] := SaturateU8(b[463:448])
tmp_dst[495:488] := SaturateU8(b[479:464])
tmp_dst[503:496] := SaturateU8(b[495:480])
tmp_dst[511:504] := SaturateU8(b[511:496])
FOR j := 0 to 63
	i := j*8
	IF k[j]
		dst[i+7:i] := tmp_dst[i+7:i]
	ELSE
		dst[i+7:i] := src[i+7:i]
	FI
ENDFOR
	</operation>
	<instruction name="VPACKUSWB" form="zmm {k}, zmm, zmm" xed="VPACKUSWB_ZMMu8_MASKmskw_ZMMu16_ZMMu16_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:512] := 0

# Compilation fails
def test184():
	return '''
<intrinsic tech="MMX" name="_mm_srl_pi16">
	<type>Integer</type>
	<CPUID>MMX</CPUID>
	<category>Shift</category>
	<return type="__m64" varname="dst" etype="FP32"/>
	<parameter type="__m64" varname="a" etype="UI16"/>
	<parameter type="__m64" varname="count" etype="UI16"/>
	<description>Shift packed 16-bit integers in "a" right by "count" while shifting in zeros, and store the results in "dst".</description>
	<operation>
FOR j := 0 to 3
	i := j*16
	IF count[63:0] &gt; 15
		dst[i+15:i] := 0
	ELSE
		dst[i+15:i] := ZeroExtend16(a[i+15:i] &gt;&gt; count[63:0])
	FI
ENDFOR
	</operation>
	<instruction name="PSRLW" form="mm, mm" xed="PSRLW_MMXq_MMXq"/>
	<header>mmintrin.h</header>
</intrinsic>
'''

def test185():
	return '''
<intrinsic tech="AVX-512" name="_mm512_mask_add_epi16">
	<type>Integer</type>
	<CPUID>AVX512BW</CPUID>
	<category>Arithmetic</category>
	<return type="__m512i" varname="dst" etype="UI16"/>
	<parameter type="__m512i" varname="src" etype="UI16"/>
	<parameter type="__mmask32" varname="k" etype="MASK"/>
	<parameter type="__m512i" varname="a" etype="UI16"/>
	<parameter type="__m512i" varname="b" etype="UI16"/>
	<description>Add packed 16-bit integers in "a" and "b", and store the results in "dst" using writemask "k" (elements are copied from "src" when the corresponding mask bit is not set).</description>
	<operation>
FOR j := 0 to 31
	i := j*16
	IF k[j]
		dst[i+15:i] := a[i+15:i] + b[i+15:i]
	ELSE
		dst[i+15:i] := src[i+15:i]
	FI
ENDFOR
	</operation>
	<instruction name="VPADDW" form="zmm {k}, zmm, zmm" xed="VPADDW_ZMMu16_MASKmskw_ZMMu16_ZMMu16_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:512] := 0

# Compilation fails
def test186():
	return '''
<intrinsic tech="SSSE3" name="_mm_shuffle_pi8">
	<type>Integer</type>
	<CPUID>SSSE3</CPUID>
	<category>Swizzle</category>
	<return type="__m64" varname="dst" etype="UI8"/>
	<parameter type="__m64" varname="a" etype="UI8"/>
	<parameter type="__m64" varname="b" etype="UI8"/>
	<description>Shuffle packed 8-bit integers in "a" according to shuffle control mask in the corresponding 8-bit element of "b", and store the results in "dst".</description>
	<operation>
FOR j := 0 to 7
	i := j*8
	IF b[i+7] == 1
		dst[i+7:i] := 0
	ELSE
		index[2:0] := b[i+2:i]
		dst[i+7:i] := a[index*8+7:index*8]
	FI
ENDFOR
	</operation>
	<instruction name="PSHUFB" form="mm, mm" xed="PSHUFB_MMXq_MMXq"/>
	<header>tmmintrin.h</header>
</intrinsic>
'''

# Fix reroller
def test187():
	return '''
<intrinsic tech="AVX-512" name="_mm512_maskz_dpbusd_epi32">
	<type>Integer</type>
	<CPUID>AVX512_VNNI</CPUID>
	<category>Arithmetic</category>
	<return type="__m512i" varname="dst" etype="SI32"/>
	<parameter type="__mmask16" varname="k" etype="MASK"/>
	<parameter type="__m512i" varname="src" etype="SI32"/>
	<parameter type="__m512i" varname="a" etype="UI8"/>
	<parameter type="__m512i" varname="b" etype="SI8"/>
	<description>Multiply groups of 4 adjacent pairs of unsigned 8-bit integers in "a" with corresponding signed 8-bit integers in "b", producing 4 intermediate signed 16-bit results. Sum these 4 results with the corresponding 32-bit integer in "src", and store the packed 32-bit results in "dst" using zeromask "k" (elements are zeroed out when the corresponding mask bit is not set).</description>
	<operation>
FOR j := 0 to 15
	IF k[j]
		tmp1.word := Signed(ZeroExtend16(a.byte[4*j]) * SignExtend16(b.byte[4*j]))
		tmp2.word := Signed(ZeroExtend16(a.byte[4*j+1]) * SignExtend16(b.byte[4*j+1]))
		tmp3.word := Signed(ZeroExtend16(a.byte[4*j+2]) * SignExtend16(b.byte[4*j+2]))
		tmp4.word := Signed(ZeroExtend16(a.byte[4*j+3]) * SignExtend16(b.byte[4*j+3]))
		dst.dword[j] := src.dword[j] + tmp1 + tmp2 + tmp3 + tmp4
	ELSE
		dst.dword[j] := 0
	FI
ENDFOR
	</operation>
	<instruction name="VPDPBUSD" form="zmm {z}, zmm, zmm" xed="VPDPBUSD_ZMMi32_MASKmskw_ZMMu8_ZMMu32_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:512] := 0

# Compilation fails
def test188():
	return '''
<intrinsic tech="KNC" name="_mm512_mask_mulhi_epi32">
	<type>Integer</type>
	<CPUID>KNCNI</CPUID>
	<category>Arithmetic</category>
	<return type="__m512i" varname="dst" etype="UI32"/>
	<parameter type="__m512i" varname="src" etype="UI32"/>
	<parameter type="__mmask16" varname="k" etype="MASK"/>
	<parameter type="__m512i" varname="a" etype="UI32"/>
	<parameter type="__m512i" varname="b" etype="UI32"/>
	<description>Performs element-by-element multiplication between packed 32-bit integer elements in "a" and "b" and stores the high 32 bits of each result into "dst" using writemask "k" (elements are copied from "src" when the corresponding mask bit is not set).</description>
	<operation>
FOR j := 0 to 15
	i := j*32
	IF k[j]
		dst[i+31:i] := (a[i+31:i] * b[i+31:i]) &gt;&gt; 32
	ELSE
		dst[i+31:i] := src[i+31:i]
	FI
ENDFOR
	</operation>
	<instruction name="VPMULHD" form="zmm {k}, zmm, m512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:512] := 0


def test189():
	return '''
<intrinsic tech="KNC" name="_mm512_mulhi_epu32">
	<type>Integer</type>
	<CPUID>KNCNI</CPUID>
	<category>Arithmetic</category>
	<return type="__m512i" varname="dst" etype="UI32"/>
	<parameter type="__m512i" varname="a" etype="UI32"/>
	<parameter type="__m512i" varname="b" etype="UI32"/>
	<description>Performs element-by-element multiplication between packed unsigned 32-bit integer elements in "a" and "b" and stores the high 32 bits of each result into "dst".</description>
	<operation>
FOR j := 0 to 15
	i := j*32
	dst[i+31:i] := (a[i+31:i] * b[i+31:i]) &gt;&gt; 32
ENDFOR
	</operation>
	<instruction name="VPMULHUD" form="zmm, zmm, m512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:512] := 0

# Compilation fails
def test190():
	return '''
<intrinsic tech="AVX2" name="_mm256_shuffle_epi8">
	<type>Integer</type>
	<CPUID>AVX2</CPUID>
	<category>Swizzle</category>
	<return type="__m256i" varname="dst" etype="UI8"/>
	<parameter type="__m256i" varname="a" etype="UI8"/>
	<parameter type="__m256i" varname="b" etype="UI8"/>
	<description>Shuffle 8-bit integers in "a" within 128-bit lanes according to shuffle control mask in the corresponding 8-bit element of "b", and store the results in "dst".</description>
	<operation>
FOR j := 0 to 15
	i := j*8
	IF b[i+7] == 1
		dst[i+7:i] := 0
	ELSE
		index[3:0] := b[i+3:i]
		dst[i+7:i] := a[index*8+7:index*8]
	FI
	IF b[128+i+7] == 1
		dst[128+i+7:128+i] := 0
	ELSE
		index[3:0] := b[128+i+3:128+i]
		dst[128+i+7:128+i] := a[128+index*8+7:128+index*8]
	FI
ENDFOR
	</operation>
	<instruction name="VPSHUFB" form="ymm, ymm, ymm" xed="VPSHUFB_YMMqq_YMMqq_YMMqq"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:256] := 0

def test191():
	return '''
<intrinsic tech="SSSE3" vexEq="TRUE" name="_mm_maddubs_epi16">
	<type>Integer</type>
	<CPUID>SSSE3</CPUID>
	<category>Arithmetic</category>
	<return type="__m128i" varname="dst" etype="SI16"/>
	<parameter type="__m128i" varname="a" etype="UI8"/>
	<parameter type="__m128i" varname="b" etype="SI8"/>
	<description>Vertically multiply each unsigned 8-bit integer from "a" with the corresponding signed 8-bit integer from "b", producing intermediate signed 16-bit integers. Horizontally add adjacent pairs of intermediate signed 16-bit integers, and pack the saturated results in "dst".</description>
	<operation>
FOR j := 0 to 7
	i := j*16
	dst[i+15:i] := Saturate16( a[i+15:i+8]*b[i+15:i+8] + a[i+7:i]*b[i+7:i] )
ENDFOR
	</operation>
	<instruction name="PMADDUBSW" form="xmm, xmm" xed="PMADDUBSW_XMMdq_XMMdq"/>
	<header>tmmintrin.h</header>
</intrinsic>
  '''
#dst[MAX:256] := 0


def test192():
	return '''
<intrinsic tech="AVX2" name="_mm_blend_epi32">
	<type>Integer</type>
	<CPUID>AVX2</CPUID>
	<category>Swizzle</category>
	<return type="__m128i" varname="dst" etype="UI32"/>
	<parameter type="__m128i" varname="a" etype="UI32"/>
	<parameter type="__m128i" varname="b" etype="UI32"/>
	<parameter type="const int" varname="imm8" etype="IMM" immwidth="4"/>
	<description>Blend packed 32-bit integers from "a" and "b" using control mask "imm8", and store the results in "dst".</description>
	<operation>
FOR j := 0 to 3
	i := j*32
	IF imm8[j]
		dst[i+31:i] := b[i+31:i]
	ELSE
		dst[i+31:i] := a[i+31:i]
	FI
ENDFOR
	</operation>
	<instruction name="VPBLENDD" form="xmm, xmm, xmm, imm8" xed="VPBLENDD_XMMdq_XMMdq_XMMdq_IMMb"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:128] := 0

def test193():
	return '''
<intrinsic tech="AVX-512" name="_mm256_maskz_mov_epi16">
	<type>Integer</type>
	<CPUID>AVX512VL</CPUID>
	<CPUID>AVX512BW</CPUID>
	<category>Move</category>
	<return type="__m256i" varname="dst" etype="UI16"/>
	<parameter type="__mmask16" varname="k" etype="MASK"/>
	<parameter type="__m256i" varname="a" etype="UI16"/>
	<description>Move packed 16-bit integers from "a" into "dst" using zeromask "k" (elements are zeroed out when the corresponding mask bit is not set).</description>
	<operation>
FOR j := 0 to 15
	i := j*16
	IF k[j]
		dst[i+15:i] := a[i+15:i]
	ELSE
		dst[i+15:i] := 0
	FI
ENDFOR
	</operation>
	<instruction name="VMOVDQU16" form="ymm {z}, ymm" xed="VMOVDQU16_YMMu16_MASKmskw_YMMu16_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''


def Compile_Tests():
  #sema = test84___()
	#sema = test98()#test176()#test70()#test84___() #test68()test134()
  #sema = test68()#test64()#test70()#test98()#test50() #test68() #test77()
	#sema = test178()
	sema = test71()
	sema = test70()
	sema = test171()
	sema = test175()
	sema = test177()
	sema = test157()
	#sema = test103()
	#sema = test98()
	#sema = test154()
	#sema = test14__()
	#sema = test179()
	sema = test181()
	sema = test171()
	sema = test182()
	sema = test103()
	#sema = test180()
	sema = test77() # fails
	#sema = test84___()
	#sema = test99()
	#sema = test97()
	sema = test89()  # fails
	#sema = test88()  # Bravo!
	#sema = test72()
	#sema = test178()
	sema = test171()
	sema = test13() # fails
	sema = test31()
	sema = test46()
	sema = test60()
	sema = test61() 
	sema = test83()
	sema = test16()
	sema = test183()
	sema = test184()
	sema = test185()
	sema = test186()
	sema = test187()
	sema = test188()
	sema = test72()
	sema = test46()
	sema = test77()
	sema = test61()
	sema = test171()
	sema = test31()
	sema = test46()
	sema = test83()
	sema = test182()
	sema = test181()
	sema = test88()
	sema = test75()
	sema = test58()
	sema = test185()
	sema = test77()
	sema = test183()  # fails
	sema = test188()
	sema = test189()
	sema = test151()
	sema = test155()
	sema = test180()
	sema = test98()
	sema = test152()
	sema = test156()
	sema = test158()
	sema = test133()
	sema = test141()
	sema = test149()
	sema = test141()
	sema = test61()
	sema = test190()
	sema = test191()
	sema = test112()
	sema = test192()
	sema = test193()
	#sema = test171()
	#sema = test186()
	#sema = test157()
	#sema = test156()
	#sema = test178()
	#sema = test148()
	#sema = test75()
	#sema = test63()
	#sema = test56()
	#sema = test101()
	#sema = test144()
	#sema = test177()
	#sema = test14__()
	#sema = test178__()
	#sema = test50()
	#sema = test96()
	print(sema)
	from PseudoCodeParser import GetSemaFromXML, InitX86Parser
	Node = ET.fromstring(sema)
	InitX86Parser()
	Spec = GetSemaFromXML(Node)
	print(Spec)
	RootContext = x86RoseContext()
	CompiledFunction = CompileSemantics(Spec, RootContext)
	from RoseFunctionInfo import RoseFunctionInfo
	FunctionInfo = RoseFunctionInfo()
	FunctionInfo.addContext(RootContext)
	FunctionInfo.addRawSemantics(Spec)
	FunctionInfo.addFunctionAtNewStage(CompiledFunction)
	return [FunctionInfo]


if __name__ == '__main__':
  # Compile_Tests()
    Compile()


