
from RoseAbstractions import RoseFunction
from RoseCodeEmitter import *
import x86RoseLang


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


class CCodeEmitter(RoseCodeEmitter):
  def __init__(self, Function : RoseFunction, Sema):
    super().__init__(Function, Sema)

  def getFileName(self):
    return "c_{}.c".format(self.getFunction().getName())

  def createFile(self, ConcArgs : list):
    Content = ["#include <immintrin.h>\n", "#include <stdio.h>", \
               "#include <stdlib.h>", "#include <stdint.h>\n"]
    Content.append('''\nvoid hex_out(const uint8_t * buf, ssize_t sz) {
    for (ssize_t i = sz - 1; i >= 0; --i) {
        printf("%02x", buf[i]);
    }
    printf("\\n");
}\n\n''')
    Content.append("int main() {")

    def GenMainFunction(Index, Param, ConcArgs):
      BinOut = []
      ParamBytes = SizeInBytes(Param.getType().getBitwidth())
      for j in range(0, ParamBytes):
        v = ConcArgs[Index][j] & 0xff
        if self.getInstInfo().params[Index].is_imm:
          #v = int(v % imm8_max(Function.getName()))
          v = int(v & (2**(self.getInstInfo().imm_width) - 1))
        BinOut.append(str(hex(v)))
      if self.getInstInfo().params[Index].is_imm:
        return "#define {} {}".format(Param.getName(), BinOut[0])
      Buf = " uint8_t _{}[{}] = LBRACK {} RBRACK;\n".format(Index, ParamBytes, ",".join(BinOut))
      Buf = Buf.replace("LBRACK", "{")
      Buf = Buf.replace("RBRACK", "}")
      Var = " {} {};\n".format(x86ToC(self.getInstInfo().params[Index].type), Param.getName())
      Init = "  memcpy(&{}, _{}, {});\n".format(Param.getName(), Index, ParamBytes)
      return Buf + Var + Init
    
    Function = self.getFunction()
    Params = []
    for Index, Param in enumerate(self.getFunction().getArgs()):
      Params.append(Param.getName())
      Content.append(GenMainFunction(Index, Param, ConcArgs))
    RetBitwidth = Function.getReturnValue().getType().getBitwidth()
    Content.append("  uint8_t out[" + str(SizeInBytes(RetBitwidth)) + "] = {0};")
    Content.append("  {} ret = {}({});".format(x86ToC(self.getInstInfo().rettype),
                                              self.getFunction().getName(),
                                              ",".join(Params)))
    Content.append("  memcpy(out, &ret, {});".format(SizeInBytes(RetBitwidth)))
    Content.append("  hex_out(out, {});".format(SizeInBytes(RetBitwidth)))
    Content.append("  return 0;")
    Content.append("}")
    return "\n".join(Content)

  def compile(self):
    SOut, Srr = self.run("clang -O0 -march=native {} -o c_exec".format(self.getFileName()))
    if Srr != "":
        return SOut, Srr
    return None, None

  def execute(self):
    return self.run("./c-exec")
  
  def extractAndFormatOutput(self, Output):
    return "0x" + Output



if __name__ == '__main__':
  Sema, Context, Function = x86RoseLang.Compile()
  CEmitter = CCodeEmitter(Function, Sema)
  CEmitter.test()



