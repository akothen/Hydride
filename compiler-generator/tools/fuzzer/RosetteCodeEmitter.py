
from RoseCodeEmitter import *
from RoseCodeGenerator import *
from RoseToolsUtils import *


class RosetteCodeEmitter(RoseCodeEmitter):
  def __init__(self, FunctionInfo : RoseFunctionInfo):
    assert isinstance(FunctionInfo, RoseFunctionInfo)
    super().__init__(FunctionInfo)

  def getFileName(self):
    Function = self.getFunctionInfo().getLatestFunction()
    return "rkt_{}.rkt".format(Function.getName())

  def createFile(self, ConcArgs : list):
    Content = [
      "#lang rosette", "(require rosette/lib/synthax)", "(require rosette/lib/angelic)",
      "(require racket/pretty)", "(require rosette/solver/smt/boolector)\n"
    ]

    def GenInputs(Index, Param, ConcArgs):
      print("Param.getType().getBitwidth():")
      print(Param.getType().getBitwidth())
      print("ConcArgs:")
      print(ConcArgs)
      if Param.getType().getBitwidth() < 8:
        print(ConcArgs[Index])
        [v] = ConcArgs[Index]
        v = v & (2**(Param.getType().getBitwidth() - 1))
        HexVal = hex(v)
        HexValString = str(HexVal[2:])
        Input = "#x"
        Input += HexValString
      else:
        ParamBytes = SizeInBytes(Param.getType().getBitwidth())
        Input = "#x"
        for j in range(0, ParamBytes):
          print("ConcArgs[Index][j]:")
          print(ConcArgs[Index][j] )
          #v = ConcArgs[Index][j] & 0xff
          #if self.getInstInfo().params[Index].is_imm:
          #  #v = int(v % imm8_max(Function.getName()))
          #  v = ConcArgs[Index][j] & 0xff
          #  v = v & (2**(Param.getType().getBitwidth() - 1))
          #else:
          Temp = []
          print(ConcArgs[Index])
          Temp.extend(ConcArgs[Index])
          Temp.reverse()
          v = Temp[j] & 0xff
          HexVal = hex(v)
          print("HexVal:")
          print(HexVal)
          HexValString = str(HexVal[2:])
          print("HexValString:")
          print(HexValString)
          if len(HexValString) == 1:
            HexValString = "0" + HexValString
          print(HexValString)
          Input += HexValString
      print("Input:")
      print(Input)
      return Input
    
    InputNames = list()
    print("LEN:")
    print(len(ConcArgs))
    Function = self.getFunctionInfo().getLatestFunction()
    CodeGenerator = self.getFunctionInfo().getCodeGenerator()
    Content.append(CodeGenerator.codeGen(self.getFunctionInfo(), JustGenRosette=True))
    for Index, Param in enumerate(Function.getArgs()):
      Input = GenInputs(Index, Param, ConcArgs)
      Name = "_" + str(Index)
      InputNames.append(Name)
      Bitwidth = Function.getArg(Index).getType().getBitwidth()
      Content.append("(define {} (bv {} {}))\n".format(Name, Input, str(Bitwidth)))
    Content.append("(pretty-print ({} {}))\n".format(Function.getName(),
                                                    " ".join(InputNames)))
    return "\n".join(Content)

  def compile(self):
      return None, None

  def execute(self):
    return self.run("racket {}".format(self.getFileName()))
  
  def extractAndFormatOutput(self, Output):
    Start = Output.find("#x")
    String = Output[Start:]
    Function = self.getFunctionInfo().getLatestFunction()
    Bitwidth = Function.getReturnValue().getType().getBitwidth()
    End = String.find(" " + str(Bitwidth) + ")")
    return "0x" + String[2:End].strip()



if __name__ == '__main__':
  CodeGenerator = RoseCodeGenerator(Target="x86")
  FunctionInfoList = CodeGenerator.codeGen()
  RoseEmitter = RosetteCodeEmitter(FunctionInfoList[0])
  RoseEmitter.test()




