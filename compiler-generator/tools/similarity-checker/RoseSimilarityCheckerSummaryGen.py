##############################################################
#
# Class in this file keeps track of state of a Function in
# Rosette IR and other information from each compilation
# stage.
#
##############################################################


from RoseAbstractions import *
from RoseContext import *
from RosetteCodeEmitter import *
from RoseFunctionInfo import *
from RoseCodeGenerator import *
from RoseToolsUtils import *
from RoseEquivalenceClass import *
from RoseSimilarityCheckerUtilities import *


class RoseSimilarityCheckerSummaryGen():
  def __init__(self, FunctionToFunctionInfo : dict, FunctionToRosetteCodeMap : dict, \
                                                    EquivalenceClasses : set):
    self.FunctionToFunctionInfo = FunctionToFunctionInfo
    self.FunctionToRosetteCodeMap = FunctionToRosetteCodeMap
    self.EquivalenceClasses = EquivalenceClasses

  def genDictionaryEntry(self, EquivalenceClass : RoseEquivalenceClass):
    FunctionName = EquivalenceClass.getAFunction().getName()
    # List of arguments for functions in this equivalent class
    # and  track names of functions and track vector information
    for Function in EquivalenceClass.getEquivalentFunctions():
      FunctionInfo = self.FunctionToFunctionInfo[Function]
      ArgList = list()
      for Arg in Function.getArgs():
        if FunctionInfo.argHasConcreteVal(Arg) == False:
          ArgList.append("SYM")
        else:
          ConcreteVal = FunctionInfo.getConcreteValFor(Arg)
          ArgList.append(GenConcreteValue(ConcreteVal))
      EntryString = f'''
            "name" : {Function.getName()},
            "args" : {"[" + ",".join(ArgList) + "]"},
            "in_vectsize" : {str(FunctionInfo.getInVectorLength())},
            "out_vectsize" : {str(FunctionInfo.getOutVectorLength())},
            "lanesize" : {str(FunctionInfo.getLaneSize())},
            "in_precision" : {str(FunctionInfo.getInElemType())},
            "out_precision" : {str(FunctionInfo.getOutElemType())},
            "SIMD" : {str(FunctionInfo.isSIMD())},
        '''
      EntryString = "{" + EntryString + "},\n"
    return f'''
          "name" : {FunctionName},
          "x86_semantics" : {EntryString}
          "semantics" : {self.FunctionToRosetteCodeMap[EquivalenceClass.getAFunction()]}, 
      '''

  def summarize(self, DSLFile : str):
    String = "\n\nsemantcs = {\n"
    for EquivalenceClass in self.EquivalenceClasses:
      String += self.genDictionaryEntry(EquivalenceClass)
    String += "}\n"
    try:
      File = open(DSLFile, "w")
      File.write(String)
      File.close()
    except IOError:
      print("Error making: {}.rkt".format(DSLFile))



