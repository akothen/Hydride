
from RoseOpt import RunOptOnFuction
from RoseAbstractions import RoseFunction
from RoseCodeEmitter import RoseCodeEmitter
from RoseContext import *


class RosetteCodeEmitter(RoseCodeEmitter):
  def __init__(self, Function : RoseFunction, Sema, Context : RoseContext, extra):
    super().__init__(Function, Sema)
    self.extra = extra
    self.Context = Context

  def getFileName(self):
      return "rkt_{}.rkt".format(self.getFunction().getName())

  def createFile(self, ConcArgs : list):
    Content = [
      "#lang rosette", "(require \"../librosette.rkt\")",
      "(require rosette/lib/synthax)", "(require rosette/lib/angelic)",
      "(require racket/pretty)", self.extra
    ]
    InputNames = list()
    Content.append(RunOptOnFuction(self.getInstInfo(), \
                                   self.getFunction(), self.Context))
    for Index in range(len(self.getFunction().getArgs())):
      Input = "0x"
      for Bytes in ConcArgs[Index]:
        v = Bytes & 0xff
        if self.getInstInfo().params[Index].is_imm:
          v = int(v & (2**(self.getInstInfo().imm_width) - 1))
        Input += str(str(hex(v)))
      Name = "_" + str(Index)
      InputNames.append(Name)
      Bitwidth = self.getFunction().getArg(Index)).getType().getBitwidth()
      Content.append("(define {} (bv {} {}))\n".format(Name, Input, str(Bitwidth)))
    Content.append("(pretty-print ({} {}))".format(self.getFunction().getName(),
                                                    " ".join(InputNames)))
    return "\n".join(Content)

  def compile(self):
      return None, None

  def execute(self):
    return self.run("racket {}".format(self.getFileName()))


