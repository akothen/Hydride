#############################################################
#
# This is a derived class with Rose to LLVM context.
#
#############################################################


from llvmlite.ir.values import Value as LLVMValue
from llvmlite.ir.builder import IRBuilder as LLVMIRBuilder
from llvmlite.ir.context import Context as LLVMContext
from llvmlite.ir.types import Type as LLVMType
from llvmlite.ir.values import Undefined as LLVMUndefined


class RoseLLVMContext(LLVMContext):
  def __init__(self):
    self.RoseToLLVMVal = dict()
    self.RoseToLLVMType = dict()
    self.LLVMBuilder = None
    super().__init__()
  
  @staticmethod
  def create():
    return RoseLLVMContext()
  
  def mapRoseValToLLVMVal(self, RoseVal, LLVMVal : LLVMValue):
    self.RoseToLLVMVal[RoseVal] = LLVMVal
  
  def getLLVMValueFor(self, RoseVal):
    if RoseVal in self.RoseToLLVMVal:
      return self.RoseToLLVMVal[RoseVal]
    return LLVMUndefined
  
  def setLLVMBuilder(self, LLVMBuilder : LLVMIRBuilder):
    self.LLVMBuilder = LLVMBuilder
  
  def getLLVMBuilder(self):
    return self.LLVMBuilder

  def getLLVMTypeFor(self, RoseVal):
    if RoseVal in self.RoseToLLVMType:
      return self.RoseToLLVMType[RoseVal]
    return None
  
  def setLLVMTypeFor(self, RoseVal, Type : LLVMType):
    assert isinstance(Type, LLVMType)
    self.RoseToLLVMType[RoseVal] = Type


