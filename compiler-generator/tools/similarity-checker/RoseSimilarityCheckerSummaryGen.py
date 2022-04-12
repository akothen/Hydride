##############################################################
#
# Class in this file keeps track of state of a Function in
# Rosette IR and other information from each compilation
# stage.
#
##############################################################


from tokenize import String
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
    EntryString = ""
    for Function in EquivalenceClass.getEquivalentFunctions():
      print("FUNCTION IN EQUIVALENCE CLASS:")
      Function.print()
      FunctionInfo = self.FunctionToFunctionInfo[Function]
      ArgList = list()
      for Arg in Function.getArgs():
        if FunctionInfo.argHasConcreteVal(Arg) == False:
          ArgList.append("\"SYMBOLIC_BV_" + str(Arg.getType().getBitwidth()) + "\"")
        else:
          ConcreteVal = FunctionInfo.getConcreteValFor(Arg)
          ArgList.append("\"" + GenConcreteValue(ConcreteVal) + "\"")
      TempEntryString = f'''
            "name" : "{Function.getName()}",
            "args" : {"[" + ",".join(ArgList) + "]"},
            "in_vectsize" : {str(FunctionInfo.getInVectorLength())},
            "out_vectsize" : {str(FunctionInfo.getOutVectorLength())},
            "lanesize" : {str(FunctionInfo.getLaneSize())},
            "in_precision" : {str(FunctionInfo.getInElemType())},
            "out_precision" : {str(FunctionInfo.getOutElemType())},
            "in_vectsize_index" : {str(FunctionInfo.getInVectorLengthIndex())},
            "out_vectsize_index" : {str(FunctionInfo.getOutVectorLengthIndex())},
            "lanesize_index" : {str(FunctionInfo.getLaneSizeIndex())},
            "in_precision_index" : {str(FunctionInfo.getInElemTypeIndex())},
            "out_precision_index" : {str(FunctionInfo.getOutElemTypeIndex())},
            "Cost" : "{""}",
            "SIMD" : "{str(FunctionInfo.isSIMD())}",
        '''
      TempEntryString = "{\n" + TempEntryString + "}"
      EntryString += TempEntryString
    # Get the rosette code for this equivalence class
    RosetteCode = self.FunctionToRosetteCodeMap[EquivalenceClass.getAFunction()]
    # Replace all newlines with quotes
    RosetteCodeList = RosetteCode.split("\n")
    for Index, Line in enumerate(RosetteCodeList):
      RosetteCodeList[Index] = "\"" + Line + "\""
    String = f'''
          "x86_instructions" : {EntryString},
          "semantics" : {RosetteCodeList}, 
      '''
    String = "{\n" + String + "}"
    return String
  
  def genDictionary(self):
    String = "\n\nsemantcs = {\n"
    for EquivalenceClass in self.EquivalenceClasses:
      FunctionName = EquivalenceClass.getAFunction().getName()
      TempEntryString = f'''
          "{FunctionName}" : {self.genDictionaryEntry(EquivalenceClass)},
        '''
      String += TempEntryString + "\n"
    String += "}\n"
    return String

  def summarize(self, DSLFile : str):
    String = GenHeadersForAutoGenFiles("#")
    String += self.genDictionary()
    try:
      File = open(DSLFile, "w")
      File.write(String)
      File.close()
    except IOError:
      print("Error making: {}".format(DSLFile))




