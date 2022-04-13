#############################################################
#
# This is a derived class with Rose to LLVM context.
#
#############################################################


from RoseAbstractions import *
from RoseValues import *

from llvmlite import ir


class RoseLLVMContext(ir.context.Context):
  def __init__(self):
    self.RoseToLLVMVal = dict()
    self.LLVMBuilder = None
    super().__init__()
  
  @staticmethod
  def create():
    return RoseLLVMContext()
  
  def mapRoseValToLLVMVal(self, RoseVal : RoseValue, LLVMVal : ir.Value):
    self.RoseToLLVMVal[RoseVal] = LLVMVal
  
  def getLLVMValueFor(self, RoseVal : RoseValue):
    if RoseVal in self.RoseToLLVMVal:
      return self.RoseToLLVMVal[RoseVal]
    return ir.Undefined()
  
  def setLLVMBuilder(self, LLVMBuilder : ir.IRBuilder):
    self.LLVMBuilder = LLVMBuilder
  
  def getLLVMBuilder(self):
    return self.LLVMBuilder

