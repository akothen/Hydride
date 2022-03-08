
from RoseOpt import RunRoseGenOnFuction
from RoseAbstractions import RoseFunction
from RoseContext import *
from RoseCodeEmitter import *

import x86RoseLang


class RosetteCodeEmitter(RoseCodeEmitter):
  def __init__(self, Function : RoseFunction, Sema, Context : RoseContext):
    super().__init__(Function, Sema)
    self.Context = Context

  def getFileName(self):
      return "rkt_{}.rkt".format(self.getFunction().getName())

  def createFile(self, ConcArgs : list):
    Content = [
      "#lang rosette", "(require rosette/lib/synthax)", "(require rosette/lib/angelic)",
      "(require racket/pretty)", "(require rosette/solver/smt/boolector)\n"
    ]

    def GenInputs(Index, Param, ConcArgs):
      ParamBytes = SizeInBytes(Param.getType().getBitwidth())
      Input = "#x"
      for j in range(0, ParamBytes):
        v = ConcArgs[Index][j] & 0xff
        if self.getInstInfo().params[Index].is_imm:
          #v = int(v % imm8_max(Function.getName()))
          v = int(v & (2**(self.getInstInfo().imm_width) - 1))
        HexVal = hex(v)
        Input += str(HexVal[2:])
      return Input
    
    InputNames = list()
    print("LEN:")
    print(len(ConcArgs))
    Content.append(RunRoseGenOnFuction(self.getInstInfo(), \
                                   self.getFunction(), self.Context))
    for Index, Param in enumerate(self.getFunction().getArgs()):
      Input = GenInputs(Index, Param, ConcArgs)
      Name = "_" + str(Index)
      InputNames.append(Name)
      Bitwidth = self.getFunction().getArg(Index).getType().getBitwidth()
      Content.append("(define {} (bv {} {}))\n".format(Name, Input, str(Bitwidth)))
    Content.append("(pretty-print ({} {}))\n".format(self.getFunction().getName(),
                                                    " ".join(InputNames)))
    return "\n".join(Content)

  def compile(self):
      return None, None

  def execute(self):
    return self.run("racket {}".format(self.getFileName()))


if __name__ == '__main__':
  Sema, Context, Function = x86RoseLang.Compile()
  RoseEmitter = RosetteCodeEmitter(Function, Sema, Context)
  RoseEmitter.test()


