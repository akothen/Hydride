
from PseudoCodeParser import GetSemaFromXML
import xml.etree.ElementTree as ET
from x86RoseCompiler import CompileSemantics


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


# Parsing 
def test50():
  return '''

'''


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


# Fix rerolling for this
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


# Fix rerolling pass
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


# Fix CSE. Compilation works
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


def Compile():
  sema = test33()
  print(sema)
  intrin_node = ET.fromstring(sema)
  spec = GetSemaFromXML(intrin_node)
  print(spec)
  CompiledFunction = CompileSemantics(spec)
  return CompiledFunction


if __name__ == '__main__':
  Compile()


