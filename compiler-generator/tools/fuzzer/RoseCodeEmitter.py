
import subprocess
from copy import deepcopy

from RoseAbstractions import RoseFunction


def SizeInBytes(Size):
  if Size < 8:
      return 1
  Numbytes = int(Size / 8)
  assert Numbytes * 8 == Size
  return Numbytes


class RoseCodeEmitter():
  def __init__(self, Function : RoseFunction, Sema):
    self.Function = Function
    self.Sema = Sema
  
  def getFunction(self):
    return self.Function
  
  def getInstInfo(self):
    return self.Sema

  def getFileName(self):
    NotImplemented

  def genRandomInputs(self):
    FuncArgs = self.getFunction().getArgs()
    ConcArgs = []
    Counter = 0
    for Index in range(len(FuncArgs)):
      NewArg = []
      for J in range(SizeInBytes(FuncArgs[Index].getType().getBitwidth())):
        NewArg.append(Counter)
        Counter += 1
      ConcArgs.append(deepcopy(NewArg))
    return ConcArgs

  def test(self):
    print("TEST:")
    ConcArgs = self.genRandomInputs()
    if not self.makeFile(ConcArgs):
      return "", "IO Error"
    SOut, Srr = self.compile()
    if SOut is None and Srr is None:
      SOut, Srr = self.execute()
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
    try:
      sproc = subprocess.Popen(Cmd,
                              shell=True,
                              stdin=subprocess.PIPE,
                              stdout=subprocess.PIPE,
                              stderr=subprocess.PIPE)
      stdout_data, stderr_data = sproc.communicate(timeout=60)
      stdout_data = stdout_data.decode("utf-8", "ignore")
      stderr_data = stderr_data.decode("utf-8", "ignore")
      return stdout_data, stderr_data
    except OSError:
      return "", "OS Error running {}".format(Cmd)
    except subprocess.TimeoutExpired:
      return "", "Timout Error running {}".format(Cmd)

