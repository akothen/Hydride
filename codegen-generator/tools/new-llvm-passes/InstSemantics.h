#============================== Hydride File =================================
#
# Part of the Hydride Compiler Infrastructure. 
# <Placeholder for license information> 
#
#=============================================================================
#
# Do NOT modify this file. It is automatically generated. 
#
#=============================================================================


#ifndef HYDRIDE_INST_SEMANTICS
#define HYDRIDE_INST_SEMANTICS


std::map<const std::string, std::vector<std::string>> InstSemanticsMap;

void MapInstSemantics() {
  InstSemanticsMap["name"] = {"", "", ""};
}


std::string GetSemanticsFor(CallInst *CI) {
  auto &SemanticsVect = InstSemanticsMap[CI->getName()];
  std::string Semantics = "";
  for (auto SemaLine : SemanticsVect) {
    Semantics += (SemaLine + "\n");
  }
  return Semantics;
}


#endif // HYDRIDE_INST_SEMANTICS

