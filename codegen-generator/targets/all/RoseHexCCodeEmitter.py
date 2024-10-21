#############################################################
#
# C code emitter for x86.
#
#############################################################

from RoseToolsUtils import *
from HexAST import ElemTypeInfo

def HexFunctionToC(name):
  name = name.replace("hexagon", "__builtin_HEXAGON")
  return name


# TODO: once updated, inherit from RoseCodeEmitter
class HexCCodeEmitter():
  def __init__(self, Sema):
    # assert isinstance(FunctionInfo, RoseFunctionInfo)
    # super().__init__(FunctionInfo)
    self.Sema = Sema

  def getFileName(self):
    # Function = self.getFunctionInfo().getLatestFunction()
    return "c_{}.c".format(self.Sema.intrin)

  def createFile(self):
    Content = ["#include <hexagon_types.h>", "#include <hexagon_protos.h>",  \
               "#include <hvx_hexagon_protos.h>", "#include <stdio.h>"]
    Sema = self.Sema
    print(Sema)
    output_type = ""
    if Sema.retname.startswith("V"):
      if len(Sema.retname) == 3:
        output_type = "HVX_VectorPair"
      else:
        output_type = "HVX_Vector"
    elif Sema.retname.startswith("R"):
      output_type = "int32_t"
    elif Sema.retname.startswith("Q"):
      output_type = "HVX_VectorPred"
    Content.append('''\nvoid hex_out(const {} buf, size_t sz) {{
    for (size_t i = 0; i < sz; i++) {{
        printf("%02lx", buf[i]);
    }}
    printf("\\n");
}}\n\n'''.format(output_type))
    Content.append("int main() {")
    
    
    def gen_input(name, param, size):
      import random
      print("PARAM: " + str(param))
      value = list(map(str, random.sample(range(0, 2**16), size//32))) # I think this size may be incorrect for predicate vectors
      content = ""
      if name.startswith("V"): # vector type
        if len(name) == 3:
          output_type = "HVX_VectorPair"
        else:
          output_type = "HVX_Vector"
        content = "  {} {} = {{ {} }};".format(output_type, name, ",".join(value))
      elif name.startswith("R"): # scalar type
        content = "  {} {} = {{ {} }};".format("int32_t", name, value[0])
      elif name.startswith("Q"):
        content = "  {} {} = {{ {} }};".format("HVX_VectorPred", name, ",".join(value))
      return content

    Params = Sema.params
    param_names = []
    for i, param in enumerate(Params):
      if isinstance(param, ElemTypeInfo):
        name = param.obj.name
      else:
        name = param.name
      param_names.append(name)
      Content.append(gen_input(name, param, Sema.paramsizes[i]) + "\n")
    
    #Content.append("  uint8_t out[" + str(SizeInBytes(RetBitwidth)) + "] = {0};")
    Content.append("  {} ret = {}({});".format(output_type, HexFunctionToC(Sema.intrin), ",".join(param_names)))
    #Content.append("  memcpy(out, &ret, {});".format(SizeInBytes(RetBitwidth)))
    #Content.append("  hex_out(out, {});".format(SizeInBytes(RetBitwidth)))
    Content.append("  hex_out(ret, {});".format(Sema.retsize//32))
    Content.append("  return 0;")
    Content.append("}")
    return "\n".join(Content)

  def run(self, Cmd):
    return RunCommand(Cmd)

  def compile(self):
    SOut, Srr = self.run("hexagon-clang -O0 -mv66 -mhvx -mhvx-length=128B -DLOG2VLEN=7 -DQDSP6SS_PUB_BASE=0xFE200000 -lhexagon {} -o c_exec".format(self.getFileName()))
    if Srr != "":
        print(Srr)
        return SOut, Srr
    return None, None

  def execute(self):
    return self.run("hexagon-sim -mv66 ./c_exec")
  
  def extractAndFormatOutput(self, Output):
    return "0x" + Output

def Compile():
  from dict.HVXInsts import HVXInsts
  from PseudoCodeParser import GetSpecFrom
  SemaList = []
  for intrinsic in HVXInsts:
    node = HVXInsts[intrinsic]
    SemaList.append(GetSpecFrom(node["hvx_intrinsic"], node["spec"], intrinsic))
  print("SemaList lngth:")
  print(len(SemaList))
  # from RoseFunctionInfo import RoseFunctionInfo
  # FunctionInfoList = list()
  # for Index, Spec in enumerate(SemaList):
  #   print(Spec)
  #   FunctionInfo.addRawSemantics(Spec)
  #   FunctionInfoList.append(FunctionInfo)
  # return FunctionInfoList
  return SemaList

if __name__ == '__main__':
  semantics = Compile()
  CEmitter = HexCCodeEmitter(semantics[115])
  print(CEmitter.createFile())
  CEmitter.compile()
