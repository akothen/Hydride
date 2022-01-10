
from PseudoCodeParser import GetSemaFromXML
import xml.etree.ElementTree as ET
from x86RoseCompiler import CompileSemantics

def Compile():
  sema = test8()
  print(sema)
  intrin_node = ET.fromstring(sema)
  spec = GetSemaFromXML(intrin_node)
  print(spec)
  CompiledFunction = CompileSemantics(spec)


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
<intrinsic tech="AVX2" name="_mm256_unpacklo_epi16">
	<type>Integer</type>
	<CPUID>AVX2</CPUID>
	<category>Swizzle</category>
	<return type="__m256i" varname="dst" etype="UI16"/>
	<parameter type="__m256i" varname="a" etype="UI16"/>
	<parameter type="__m256i" varname="b" etype="UI16"/>
	<description>Unpack and interleave 16-bit integers from the low half of each 128-bit lane in "a" and "b", and store the results in "dst".</description>
	<operation>
DEFINE INTERLEAVE_WORDS(src1[127:0], src2[127:0]) {
	dst[15:0] := src1[15:0] 
	dst[31:16] := src2[15:0] 
	dst[47:32] := src1[31:16] 
	dst[63:48] := src2[31:16] 
	dst[79:64] := src1[47:32] 
	dst[95:80] := src2[47:32] 
	dst[111:96] := src1[63:48] 
	dst[127:112] := src2[63:48] 
	RETURN dst[127:0]	
}
dst[127:0] := INTERLEAVE_WORDS(a[127:0], b[127:0])
dst[255:128] := INTERLEAVE_WORDS(a[255:128], b[255:128])
	</operation>
	<instruction name="VPUNPCKLWD" form="ymm, ymm, ymm" xed="VPUNPCKLWD_YMMqq_YMMqq_YMMqq"/>
	<header>immintrin.h</header>
</intrinsic>
  '''


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


if __name__ == '__main__':
  Compile()


