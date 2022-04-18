#############################################################
#
# x86 builtins wrappers emitter.
#
#############################################################


from RoseCodeEmitter import *
from x86Types import *
from RoseAbstractions import *
from RoseContext import *
from RosetteCodeEmitter import *
from RoseFunctionInfo import *
from RoseCodeGenerator import *
from RoseToolsUtils import *
from RoseSimilarityCheckerUtilities import *


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


class x86CIntrinsicsWrappersEmitter():
  def __init__(self):
    self.FunctionInfoList = list()
    # Generate code for all semantics first
    CodeGenerator = RoseCodeGenerator("x86")
    FunctionInfoList = CodeGenerator.codeGen(ExtractConstants=False, JustGenRosette=False)
    self.FunctionInfoList.extend(FunctionInfoList)

  def genHeader(self):
    String = GenHeadersForAutoGenFiles("//")
    Content = ["#include <immintrin.h>", "#include <stdio.h>", \
               "#include <stdint.h>\n"]
    return String + "\n".join(Content)

  def genCWrapperFunction(self, FunctionInfo : RoseFunctionInfo):
    assert isinstance(FunctionInfo, RoseFunctionInfo)
    Sema = FunctionInfo.getRawSemantics()
    Function = FunctionInfo.getLatestFunction()
    ParamsNames = list()
    TypedParams = list()
    for Index, Param in enumerate(Function.getArgs()):
      ParamsNames.append(Param.getName())
      TypedParams.append(x86ToC(Sema.params[Index].type) + " " + Param.getName())
    FuncSig = "{} {}_wrapper({})".format(x86ToC(Sema.rettype), \
                        Function.getName(), ", ".join(TypedParams))
    FuncSig += " {"
    Content = list()
    Content.append(FuncSig)
    InvokedFunction = "{}({})".format(Function.getName(), ", ".join(ParamsNames))
    Content.append("  return " + InvokedFunction + ";")
    Content.append("}\n\n")
    return "\n".join(Content)
  
  def genWrappers(self):
    Content = self.genHeader()
    for FunctionInfo in self.FunctionInfoList:
      Content += self.genCWrapperFunction(FunctionInfo)
    FileName = "x86_wrappers.c"
    try:
      File = open(FileName, "w+")
      File.write(Content)
      print("Content:")
      print(Content)
      File.close()
    except IOError:
      print("Error making: {}".format(FileName))
      assert False

    

if __name__ == '__main__':
  Emitter = x86CIntrinsicsWrappersEmitter()
  Emitter.genWrappers()



