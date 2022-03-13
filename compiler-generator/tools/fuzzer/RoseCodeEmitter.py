

from RoseFunctionInfo import *
from RoseToolsUtils import *


class RoseCodeEmitter():
  def __init__(self, FunctionInfo : RoseFunctionInfo):
    self.FunctionInfo = FunctionInfo
  
  def getFunctionInfo(self):
    return self.FunctionInfo

  def getFileName(self):
    NotImplemented

  def genRandomInputs(self):
    FuncArgs = self.getFunctionInfo().getLatestFunction().getArgs()
    ConcArgs = []
    Counter = 0
    for Index in range(len(FuncArgs)):
      NewArg = []
      for J in range(SizeInBytes(FuncArgs[Index].getType().getBitwidth())):
        NewArg.append(Counter)
        Counter += 1
      ConcArgs.append(deepcopy(NewArg))
    return ConcArgs

  def test(self, *args):
    print("TEST:")
    if len(args) == 0:
      ConcArgs = self.genRandomInputs()
    else:
      assert len(args) == 1
      ConcArgs = args[0]
    if not self.makeFile(ConcArgs):
      return "", "IO Error"
    SOut, Srr = self.compile()
    if SOut is None and Srr is None:
      SOut, Srr = self.execute()
      print(SOut)
      SOut = self.extractAndFormatOutput(SOut)
      print(SOut)
    return SOut, Srr

  def createFile(self, args):
    NotImplemented

  def compile(self):
    NotImplemented

  def execute(self):
    NotImplemented

  def makeFile(self, ConcArgs : list):
    print("make file")
    FileName = "{}/{}".format(".", self.getFileName())
    try:
      File = open(FileName, "w+")
      Content = self.createFile(ConcArgs)
      File.write(Content)
      print("Content:")
      print(Content)
      File.close()
      return True
    except IOError:
      print("Error making: {}".format(FileName))
      return False

  def run(self, Cmd : str):
    return RunCommand(Cmd)

  def extractAndFormatOutput(self):
    NotImplemented




