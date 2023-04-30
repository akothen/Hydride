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
from x86InstsCosts import x86Costs


class RoseSimilarityCheckerSummaryGen():
  def __init__(self, FunctionToFunctionInfo: dict, FunctionToRosetteCodeMap: dict,
               FunctionToArgPermuteMap: dict, EquivalenceClasses: set):
    self.FunctionToFunctionInfo = FunctionToFunctionInfo
    self.FunctionToRosetteCodeMap = FunctionToRosetteCodeMap
    self.EquivalenceClasses = EquivalenceClasses
    self.FunctionToArgPermuteMap = FunctionToArgPermuteMap

  def genDictionarySubEntry(self, Function: RoseFunction):
    print("FUNCTION IN EQUIVALENCE CLASS:")
    Function.print()
    FunctionInfo = self.FunctionToFunctionInfo[Function]
    ArgList = list()
    for Arg in Function.getArgs():
      if FunctionInfo.argHasConcreteVal(Arg) == False:
        Bitwidth = Arg.getType().getBitwidth()
        if isinstance(Bitwidth, RoseValue):
          if isinstance(Bitwidth, RoseConstant):
            Bitwidth = Bitwidth.getValue()
          else:
            # There better be a concrete value
            Bitwidth = FunctionInfo.getConcreteValFor(Bitwidth).getValue()
        ArgList.append("\"SYMBOLIC_BV_" + str(Bitwidth) + "\"")
      else:
        ConcreteVal = FunctionInfo.getConcreteValFor(Arg)
        ArgList.append("\"" + GenConcreteValue(ConcreteVal) + "\"")
    # Get cost
    print("Function:")
    Function.print()
    SemaInfo = FunctionInfo.getRawSemantics()
    try:
      if SemaInfo.xed != None:
        if SemaInfo.xed in x86Costs:
          Cost = x86Costs[SemaInfo.xed]
        else:
          Cost = None
      else:
        Cost = None
    except:
      Cost = None
    ArgPermuteMap = list()
    for Idx in self.FunctionToArgPermuteMap[Function]:
      ArgPermuteMap.append(str(Idx))
    TempEntryString = f'''
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
                  "arg_permute_map" : {"[" + ",".join(ArgPermuteMap) + "]"},
                  "Signedness" : {str(FunctionInfo.getSignedness())},
                  "Cost" : "{Cost}",
                  "SIMD" : "{str(FunctionInfo.isSIMD())}",
                  "Extensions" : "{SemaInfo.extensions}",
      '''
    TempEntryString = "{" + TempEntryString + "}"
    for _, v in eval(TempEntryString).items():
      if v == None:
        raise NotImplementedError(
            Function.getName()+TempEntryString)
    return TempEntryString

  def genDictionaryEntry(self, EquivalenceClass: RoseEquivalenceClass):
    # List of arguments for functions in this equivalent class
    # and  track names of functions and track vector information

    try:
      EntryString = ""
      for Function in EquivalenceClass.getEquivalentFunctions():
        TempEntryString = f'''
                "{Function.getName()}" : {self.genDictionarySubEntry(Function)},
          '''
        EntryString += TempEntryString
      EntryString = "{" + EntryString + "}"
      # Get the rosette code for this equivalence class
      RosetteCode = self.FunctionToRosetteCodeMap[EquivalenceClass.getAFunction(
      )]
      # Replace all newlines with quotes
      RosetteCodeList = RosetteCode.split("\n")
      for Index, Line in enumerate(RosetteCodeList):
        RosetteCodeList[Index] = "\"" + Line + "\""
      String = f'''
              "target_instructions" : {EntryString},
              "semantics" : {RosetteCodeList}, 
        '''
      String = "{" + String + "}"
      return String
    except NotImplementedError as e:
      raise NotImplementedError("Previous:\n"+EntryString+"Last:\n"+str(e))

  def genDictionary(self):
    String = "\n\nsemantcs = {\n"
    abnormalList = []
    for EquivalenceClass in self.EquivalenceClasses:
      FunctionName = EquivalenceClass.getAFunction().getName()
      try:
        TempEntryString = f'''
            "{FunctionName}" : {self.genDictionaryEntry(EquivalenceClass)},
          '''
      except NotImplementedError as e:
        abnormalList.append((FunctionName, str(e)))
        TempEntryString = ""
      String += TempEntryString
    String += "}\n"
    with open("abnormal.txt", "w") as f:
      for item in abnormalList:
        f.write("Equivalance Class%s\n" % item[0])
        f.write("%s\n" % item[1])
    return String

  def summarize(self, DSLFile: str):
    String = GenHeadersForAutoGenFiles("#")
    String += self.genDictionary()
    try:
      File = open(DSLFile, "w")
      File.write(String)
      File.close()
    except IOError:
      print("Error making: {}".format(DSLFile))
