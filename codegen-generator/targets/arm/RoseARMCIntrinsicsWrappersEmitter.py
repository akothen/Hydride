#############################################################
#
# x86 builtins wrappers emitter.
#
#############################################################


from RoseCodeEmitter import *
# from x86Types import *
from RoseAbstractions import *
from RoseContext import *
from RosetteCodeEmitter import *
from RoseFunctionInfo import *
from RoseCodeGenerator import *
from RoseToolsUtils import *
from RoseSimilarityCheckerUtilities import *
import RoseARMCCodeEmitter


class x86CIntrinsicsWrappersEmitter():
  def __init__(self):
    self.FunctionInfoList = list()
    # Generate code for all semantics first
    CodeGenerator = RoseCodeGenerator("ARM")
    FunctionInfoList = CodeGenerator.codeGen(ExtractConstants=False, JustGenRosette=False)
    self.FunctionInfoList.extend(FunctionInfoList)
    # Some instruction names in the official documentation are
    # repeated. We do not want to repeat them in our wrapper file.
    self.AccountedForInsts = set()

  def genRandomInputs(self, Function : RoseFunction):
    FuncArgs = Function.getArgs()
    ConcArgs = []
    Counter = 0
    for Index in range(len(FuncArgs)):
      NewArg = []
      for _ in range(SizeInBytes(FuncArgs[Index].getType().getBitwidth())):
        NewArg.append(Counter)
        Counter += 1
      ConcArgs.append(deepcopy(NewArg))
    return ConcArgs

  def genHeader(self):
    String = GenHeadersForAutoGenFiles("//")
    Content = ["#include <arm_neon.h>", "#include <stdint.h>\n"]
    return String + "\n".join(Content)  

  def createTestDir(self, DirName : str):
    assert isinstance(DirName, str)
    RunCommand("mkdir " + DirName)

  def generateWrappers(self):
    # We will emit C code with C builtins and try to compile
    # and execute them, if we fail, we will not generate wrappers
    # for those instructions.
    TestDirName = "wrapper_test"
    self.createTestDir(TestDirName)
    Content = self.genHeader()
    for FunctionInfo in self.FunctionInfoList:
      assert isinstance(FunctionInfo, RoseFunctionInfo)
      Content += self.generateWrapperForInstuction(TestDirName, FunctionInfo)
    # Generate the file with wrappers
    FileName = "arm_wrappers.c"
    self.generateFileWithWrappers(Content, FileName)
    # Compile the generated file with wrappers
    self.compileFileWithWrappers(FileName)

  def generateWrapperForInstuction(self, TestDirName : str, FunctionInfo : RoseFunctionInfo):
    # Emit C code, compile and execute this instuction and check 
    # if the error is fatal.
    Function = FunctionInfo.getLatestFunction()
    # CEmitter = RoseARMCCodeEmitter.CCodeEmitter(FunctionInfo)
    # ConcArgs = self.genRandomInputs(Function)
    # _, CErr = CEmitter.test(TestDirName, ConcArgs)
    # if CEmitter.isErrorFatal(CErr) == True:
    #   print("FATAL ERROR")
    #   return ""
    # Since the error is not fatal, let's generate C wrapper function
    return self.genCWrapperFunction(FunctionInfo)

  def genCWrapperFunction(self, FunctionInfo : RoseFunctionInfo):
    assert isinstance(FunctionInfo, RoseFunctionInfo)
    Sema = FunctionInfo.getRawSemantics()
    Function = FunctionInfo.getLatestFunction()
    if Function.getName() in self.AccountedForInsts:
      return ""
    self.AccountedForInsts.add(Function.getName())
    ParamsNames = list()
    TypedParams = list()
    ImmWidth = None
    for Index, Param in enumerate(Function.getArgs()):
      # If the parameter is an immediate value, that should not be an argument
      # to the wrapper.
      if Sema.params[Index].is_imm == False:
        ParamsNames.append(Param.getName())
        TypedParams.append(RoseARMCCodeEmitter.ARMToC(Sema.params[Index].type) + " " + Param.getName())
      else:
        ImmWidth = Sema.imm_width
    if ImmWidth == None:
      FuncSig = "{} {}_wrapper({})".format(RoseARMCCodeEmitter.ARMToC(Sema.rettype), \
                          Function.getName(), ", ".join(TypedParams))
      FuncSig += " {"
      Content = list()
      Content.append(FuncSig)
      InvokedFunction = "{}({})".format(Function.getName(), ", ".join(ParamsNames))
      Content.append("  return " + InvokedFunction + ";")
      Content.append("}\n\n")
      return "\n".join(Content)
    # Now we will have to generate many versions of wrappers for this function.
    Content = list()
    for Idx in range(2**ImmWidth):
      FuncSig = "{} {}_wrapper_{}({})".format(RoseARMCCodeEmitter.ARMToC(Sema.rettype), \
                          Function.getName(), Idx, ", ".join(TypedParams))
      FuncSig += " {"
      Content.append(FuncSig)
      InvokedFunction = "{}({}, {})".format(Function.getName(), ", ".join(ParamsNames), Idx)
      Content.append("  return " + InvokedFunction + ";")
      Content.append("}\n\n")
    return "\n".join(Content)

  def generateFileWithWrappers(self, Content : str, FileName : str):
    try:
      File = open(FileName, "w+")
      File.write(Content)
      print("Content:")
      print(Content)
      File.close()
    except IOError:
      print("Error making: {}".format(FileName))
      assert False

  def compileFileWithWrappers(self, FileName : str):
    BitcodeFile = FileName + ".bc"
    SOut, SErr = RunCommand("clang -O0 -c {} -emit-llvm -o {}"\
                            .format(FileName, BitcodeFile))
    print("SOUT:")
    print(SOut)
    print("SErr:")
    print(SErr)
    ReadableBitcodeFile = FileName + ".ll"
    SOut, SErr = RunCommand("llvm-dis {} -o {}"\
                            .format(BitcodeFile, ReadableBitcodeFile))
    print("SOUT:")
    print(SOut)
    print("SErr:")
    print(SErr)
    return SOut, SErr


if __name__ == '__main__':
  Emitter = x86CIntrinsicsWrappersEmitter()
  Emitter.generateWrappers()


