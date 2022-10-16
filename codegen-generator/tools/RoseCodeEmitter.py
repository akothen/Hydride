##################################################################
#
# Base class for representing code emitters for fuzzing.
#
##################################################################

from RoseFunctionInfo import *
from RoseToolsUtils import *


class RoseCodeEmitter():
  def __init__(self, FunctionInfo : RoseFunctionInfo):
    self.FunctionInfo = FunctionInfo
  
  def getFunctionInfo(self):
    return self.FunctionInfo

  def getTestName(self):
    NotImplemented

  # Only implemented where existence of a separate executable makes sense
  def getExecutableName(self):
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

  def test(self, TestDirName : str, *args):
    print("TEST:")
    assert isinstance(TestDirName, str)
    # Generate inputs for the test
    if len(args) == 0:
      ConcArgs = self.genRandomInputs()
    else:
      assert len(args) == 1
      ConcArgs = args[0]
    # Create the test
    if not self.createTest(TestDirName, ConcArgs):
      return "", "IO Error"
    # Compile test and handle any error associated with it
    SOut, SErr = self.compile(TestDirName)
    self.handleError(TestDirName, SErr)
    if self.isErrorFatal(SErr) == False:
      # Execute test
      SOut, SErr = self.execute(TestDirName)
      self.handleError(TestDirName, SErr)
      if self.isErrorFatal(SErr) == False:
        print("++++SOut")
        print(SOut)
        SOut = self.extractAndFormatOutput(SOut)
        print("----SOut")
        print(SOut)
    return SOut, SErr

  def createFile(self, args):
    NotImplemented

  def compile(self, TestDirName : str):
    NotImplemented

  def execute(self, TestDirName : str):
    NotImplemented

  def handleError(self, TestDir : str, Error):
    NotImplemented

  def isErrorFatal(self, Error):
    NotImplemented

  def createTest(self, TestDir : str, ConcArgs : list):
    print("make file")
    assert isinstance(TestDir, str)
    FileName = "{}/{}".format(TestDir, self.getTestName())
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



