//============================== Hydride File =================================
//
// Part of the Hydride Compiler Infrastructure. 
// <Placeholder for license information> 
//
//=============================================================================
//
// Do NOT modify this file. It is automatically generated. 
//
//=============================================================================


#include "ARMLegalizer.h"
bool ARMLegalizationPass::runOnFunction(Function &F) {
  if (F.getName().contains("hydride") == false) {
    return false;
  }
  // Initialize the legalizer
  errs() << "LEGALIZATION BEGIN\n";
  Legalizer *L = new ARMLegalizer();
  return L->legalize(F);
}
    
char ARMLegalizationPass::ID = 0;
static RegisterPass<ARMLegalizationPass> X("arm-hydride-legalize", 
                                          "Pass to legalize tensor intrinsics");
    