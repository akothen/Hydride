#############################################################
#
# C code emitter for x86.
#
#############################################################


from RoseCodeEmitter import *
from x86Types import x86Types
from RoseFunctionInfo import *
from RoseCodeGenerator import *
from RoseToolsUtils import *


def x86ToC(T):
  LookupTable = {
    "SI8": "int8_t",
    "char": "char",
    "SI16": "int16_t",
    "short": "short",
    "SI32": "int32_t",
    "int": "int",
    "const int": "const int",
    "_MM_PERM_ENUM": "_MM_PERM_ENUM",
    "SI64": "int64_t",
    "__int64": "int64_t",
    "UI8": "uint8_t",
    "UI16": "uint16_t",
    "unsigned short": "unsigned short",
    "UI32": "uint32_t",
    "unsigned int": "unsigned int",
    "UI64": "uint64_t",
    "unsigned __int64": "uint64_t",
    "unsigned long": "unsigned long",
    "double": "float",
    "float": "float",
    "FP32": "float",
    "FP64": "double",
    "__mmask8": "__mmask8",
    "__mmask16": "__mmask16",
    "__mmask32": "__mmask32",
    "__mmask64": "__mmask64",
    "MASK": "__mmask64",
    "M128": "__m128",
    "M256": "__m256",
    "M512": "__m512",
    "__m64": "__m64",
    "__m128": "__m128",
    "__m128i": "__m128i",
    "__m128d": "__m128d",
    "__m256": "__m256",
    "__m256d": "__m256d",
    "__m256i": "__m256i",
    "__m512": "__m512",
    "__m512i": "__m512i",
    "__m512d": "__m512d",
  }
  if T not in LookupTable:
      return T
  return LookupTable[T]


def SetterToElemType(T):
  LookupTable = {
    "_mm_set_pi8" : "char",
    "_mm_set_pi16" : "short",
    "_mm_set_pi32" : "int",
    "_mm_set_epi8" : "char",
    "_mm_set_epi16" : "short",
    "_mm_set_epi32" : "int",
    "_mm_set_epi64" : "__m64",
    "_mm256_set_epi8" : "char",
    "_mm256_set_epi16" : "short",
    "_mm256_set_epi32" : "int",
    "_mm256_set_epi64x" : "__int64_t",
    "_mm512_set_epi8" : "char",
    "_mm512_set_epi16" : "short",
    "_mm512_set_epi32" : "int",
    "_mm512_set_epi64" : "__int64_t",
  }
  if T not in LookupTable:
      return T
  return LookupTable[T]


def GetVectorInitializer(Tuple):
  LookupTable = {
    (8, 64) : "_mm_set_pi8",
    (16, 64) : "_mm_set_pi16",
    (32, 64) : "_mm_set_pi32",
    (8, 128) : "_mm_set_epi8",
    (16, 128) : "_mm_set_epi16",
    (32, 128) : "_mm_set_epi32",
    (64, 128) : "_mm_set_epi64",
    (8, 256) : "_mm256_set_epi8",
    (16, 256) : "_mm256_set_epi16",
    (32, 256) : "_mm256_set_epi32",
    (64, 256) : "_mm256_set_epi64x",
    (8, 512) : "_mm512_set_epi8",
    (16, 512) : "_mm512_set_epi16",
    (32, 512) : "_mm512_set_epi32",
    (64, 512) : "_mm512_set_epi64",
  }
  if Tuple in LookupTable:
    return LookupTable[Tuple]
  print(Tuple)
  assert False


def GetMaskInitializer(Type):
  LookupTable = {
    "__mmask8" : "_cvtu32_mask8",
    "__mmask16" : "_cvtu32_mask16",
    "__mmask32" : "_cvtu32_mask32",
    "__mmask64" : "_cvtu64_mask64",
  }
  if Type in LookupTable:
    return LookupTable[Type]
  print(Type)
  assert False


class CCodeEmitter(RoseCodeEmitter):
  def __init__(self, FunctionInfo : RoseFunctionInfo):
    assert isinstance(FunctionInfo, RoseFunctionInfo)
    super().__init__(FunctionInfo)

  def getTestName(self):
    Function = self.getFunctionInfo().getLatestFunction()
    return "{}.c".format(Function.getName())

  def createFile(self, ConcArgs : list):
    Content = ["#include <immintrin.h>", "#include <stdio.h>", \
               "#include <stdint.h>\n"]
    Content.append('''\nvoid hex_out(const uint8_t * buf, ssize_t sz) {
    for (ssize_t i = sz - 1; i >= 0; --i) {
        printf("%02x", buf[i]);
    }
    printf("\\n");
}\n\n''')
    Content.append("int main() {")
    Sema = self.getFunctionInfo().getRawSemantics()

    def GenMainFunction(Index, Param, ConcArgs):
      BinOut = []
      ParamBytes = SizeInBytes(Param.getType().getBitwidth())
      for j in range(ParamBytes):
        v = ConcArgs[Index][j] & 0xff
        if Sema.params[Index].is_imm:
          #v = int(v % imm8_max(Function.getName()))
          v = int(v & (2**(Sema.imm_width) - 1))
        HexVal = hex(v)
        print("HexVal:")
        print(HexVal)
        HexValString = str(HexVal[2:])
        print("HexValString:")
        print(HexValString)
        if len(HexValString) == 1:
          HexValString = "0" + HexValString
        BinOut.append("0x" + HexValString)
      if Sema.params[Index].is_imm:
        return "#define {} {}".format(Param.getName(), BinOut[0])
      
      BinOut.reverse()
      if Sema.params[Index].is_mask:
        HexString = "0x"
        for Byte in BinOut:
          HexString += Byte[2:]
        Initializer = GetMaskInitializer(Sema.params[Index].type)
        InitArg = "{} {} = {}({});".format(x86ToC(Sema.params[Index].type), Param.getName(), 
                                    Initializer, HexString)
      else:
        print("Sema.params[Index].type:")
        print(Sema.params[Index].type)
        print("Sema.elem_type:")
        print(Sema.elem_type)
        ElemNumBytes = None
        if Sema.elem_type != "MASK":
          ElemNumBytes = SizeInBytes(x86Types[Sema.elem_type].getBitwidth())
        print("ElemNumBytes:")
        print(ElemNumBytes)
        print("ParamBytes:")
        print(ParamBytes)
        print("BinOut:")
        print(BinOut)
        if ElemNumBytes != None:
          ElemsList = list()
          for J in range(int(ParamBytes/ElemNumBytes)):
            Elem = "0x"
            for I in range(ElemNumBytes):
              Elem += BinOut[J * ElemNumBytes + I][2:]
            ElemsList.append(Elem)
          print("ElemsList:")
          print(ElemsList)
          print((ElemNumBytes * 8, ParamBytes * 8))
          Param.print()
        if ElemNumBytes == None or ElemNumBytes == ParamBytes:
          if ElemNumBytes == 4:
            HexString = "0x"
            for Byte in BinOut:
              HexString += Byte[2:]
            InitArg = "int {} = {};".format(Param.getName(), HexString)
          elif ElemNumBytes == 2:
            HexString = "0x"
            for Byte in BinOut:
              HexString += Byte[2:]
            InitArg = "int16_t {} = {};".format(Param.getName(), HexString)
          elif ElemNumBytes == 1:
            HexString = "0x"
            for Byte in BinOut:
              HexString += Byte[2:]
            InitArg = "int8_t {} = {};".format(Param.getName(), HexString)
          else:
            ElemsList = BinOut
            if ElemNumBytes != None:
              Initializer = GetVectorInitializer((int((ParamBytes * 8) / ElemNumBytes), ParamBytes * 8))
            else:
              Initializer = GetVectorInitializer((8, ParamBytes * 8))
            #CastElemList = list()
            #for Elem in ElemsList:
            #  CastElemList.append(("(" + SetterToElemType(Initializer) + ")") + Elem)
            InitArg = "{} {} = {}({});".format(x86ToC(Sema.params[Index].type), Param.getName(), 
                                        Initializer, ",".join(ElemsList))
        else:
          Initializer = GetVectorInitializer((ElemNumBytes * 8, ParamBytes * 8))
          CastElemList = list()
          for Elem in ElemsList:
            CastElemList.append(("(" + SetterToElemType(Initializer) + ")") + Elem)
          InitArg = "{} {} = {}({});".format(x86ToC(Sema.params[Index].type), Param.getName(), 
                                      Initializer, ",".join(CastElemList))
      Buf = " uint8_t _{}[{}] = LBRACK {} RBRACK;\n".format(Index, ParamBytes, ",".join(BinOut))
      Buf = Buf.replace("LBRACK", "{")
      Buf = Buf.replace("RBRACK", "}")
      Var = " {} {};\n".format(x86ToC(Sema.params[Index].type), Param.getName())
      Init = "  memcpy(&{}, _{}, {});\n".format(Param.getName(), Index, ParamBytes)
      return InitArg#Buf + Var + Init
    
    Function = self.getFunctionInfo().getLatestFunction()
    Params = []
    print("INSTRUCTIONN NAME")
    print(self.getFunctionInfo().getLatestFunction().getName())
    for Index, Param in enumerate(Function.getArgs()):
      Params.append(Param.getName())
      Content.append(GenMainFunction(Index, Param, ConcArgs))
    RetBitwidth = Function.getReturnValue().getType().getBitwidth()
    #Content.append("  uint8_t out[" + str(SizeInBytes(RetBitwidth)) + "] = {0};")
    Content.append("  {} ret = {}({});".format(x86ToC(Sema.rettype),
                                              Function.getName(), ", ".join(Params)))
    #Content.append("  memcpy(out, &ret, {});".format(SizeInBytes(RetBitwidth)))
    #Content.append("  hex_out(out, {});".format(SizeInBytes(RetBitwidth)))
    Content.append("  hex_out(&ret, {});".format(SizeInBytes(RetBitwidth)))
    Content.append("  return 0;")
    Content.append("}")
    return "\n".join(Content)

  def getExecutableName(self):
    Function = self.getFunctionInfo().getLatestFunction()
    return Function.getName()

  def compile(self, TestDirName : str):
    TestName = TestDirName + "/" + self.getTestName()
    ExecName = TestDirName + "/" + self.getExecutableName()
    SOut, SErr = self.run("clang -O0 -march=native -mavx512vl -mavx512ifma {} -o {}"\
                            .format(TestName, ExecName))
    return SOut, SErr

  def execute(self, TestDirName : str):
    return self.run(TestDirName + "/" + self.getExecutableName())
  
  def handleError(self, TestDirName : str, CErr):
    if self.isErrorFatal(CErr):
      File = open(TestDirName + "/error_log", "a")
      File.write(CErr + "\n")
      File.close()

  def isErrorFatal(self, CErr):
    if isinstance(CErr, str):
      if "error" in CErr:
        #if ("error: call to undeclared function" in CErr \
          #and "ISO C99 and later do not support implicit function declarations" in CErr):
        return True
    return False

  def extractAndFormatOutput(self, Output):
    return "0x" + Output



if __name__ == '__main__':
  CodeGenerator = RoseCodeGenerator(Target="x86")
  FunctionInfoList = CodeGenerator.codeGen()
  CEmitter = CCodeEmitter(FunctionInfoList[0])
  CEmitter.test("test")


