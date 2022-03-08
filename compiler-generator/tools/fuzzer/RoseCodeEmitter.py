
import subprocess
from enum import Enum
from copy import deepcopy

from RoseAbstractions import RoseFunction


def RunProcess(cmd):
  try:
    sproc = subprocess.Popen(cmd,
                            shell=True,
                            stdin=subprocess.PIPE,
                            stdout=subprocess.PIPE,
                            stderr=subprocess.PIPE)
    stdout_data, stderr_data = sproc.communicate(timeout=60)
    stdout_data = stdout_data.decode("utf-8", "ignore")
    stderr_data = stderr_data.decode("utf-8", "ignore")
    return stdout_data, stderr_data
  except OSError:
    return "", "OS Error running {}".format(cmd)
  except subprocess.TimeoutExpired:
    return "", "Timout Error running {}".format(cmd)


def SizeInBytes(Size):
  if Size < 8:
      return 1
  nbytes = int(Size / 8)
  assert nbytes * 8 == Size
  return nbytes


class ERR(Enum):
  NONE = 0
  NEQ = 1
  ROSE = 2
  C = 3
  BOTH = 4


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
    for Index in range(len(FuncArgs)):
      NewArg = []
      for J in range(FuncArgs[Index].getType().getBitwidth()):
        NewArg.append(J)
      ConcArgs.append(deepcopy(NewArg))
    return ConcArgs

  def test(self):
    ConcArgs = self.genRandomInputs()
    if not self.makeFile(ConcArgs):
      return "", "IO Error"
    SOut, Srr = self.compile()
    if SOut is None and Srr is None:
      SOut, Srr = self.execute()
    return SOut, Srr

  def createFile(self, args):
    NotImplemented

  def compile(self):
    NotImplemented

  def execute(self):
    NotImplemented

  def makeFile(self, ConcArgs : list):
    FileName = "{}/{}".format(".", self.getFileName())
    try:
      File = open(FileName, "w+")
      Content = self.createFile(ConcArgs)
      File.write(Content)
      File.close()
      return True
    except IOError:
      print("Error making: {}".format(FileName))
      return False
    
  def execute(self):
    NotImplemented

  def run(self, Cmd : str):
    return RunProcess(Cmd)

  def checkResult(self, RosetteOut, RosetteErr, COut, CErr):
    Rose_Err = False
    C_Err = False
    if (RosetteErr is not None) and (RosetteErr != ""):
        Rose_Err = True
    if (CErr is not None) and (CErr != ""):
        C_Err = True
    if C_Err and Rose_Err:
        return ERR.BOTH
    if C_Err:
        return ERR.C
    if Rose_Err:
        return ERR.ROSE
    if COut != RosetteOut:
        return ERR.NEQ
    return ERR.NONE

  def writeOutput(self, RosetteOut, RosetteOut_cmp, RosetteErr, COut, COutCmp, CErr, Result):
    OutFile = "{}/{}".format(".", self.getFunction().getName())
    try:
      File = open(OutFile, "w+")
      FmtOut = "-----------------------------\n"
      FmtOut += "{} - STDOUT:\n{}\n"
      FmtOut += "-----------------------------\n"
      FmtOut += "{} - CMPOUT:\n{}\n"
      FmtOut += "-----------------------------\n"
      FmtOut += "{} - STDERR:\n{}\n"
      FmtOut += "-----------------------------\n\n"
      Rose_Out = FmtOut.format("Rosette", RosetteOut, "Rosette", RosetteOut_cmp,
                                "Rosette", RosetteErr)
      C_Out = FmtOut.format("C", COut, "C", COutCmp, "C", CErr)
      Res = "Result: " + str(Result) + "\n"
      File.write(Rose_Out)
      File.write(C_Out)
      File.write(Res)
      File.close()
    except IOError:
      print("Error writing output to: {}".format(OutFile))

  def testResult(self, RosetteOut, RosetteOut_cmp, RosetteErr, COut, COutCmp, CErr):
    Result = self.checkResult(RosetteOut_cmp, RosetteErr, COutCmp, CErr)
    self.writeOutput(RosetteOut, RosetteOut_cmp, RosetteErr, COut, COutCmp, CErr, Result)
    return Result

