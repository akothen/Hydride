//===----------------------------------------------------------------------===//
//
// This file implements a very simple version of instruction combine pass
// for LLVM. It only combines instructions that are emitted by Hydride.
// So this pass does not handle loads, stores, phis, GEPs, etc.
//
//===----------------------------------------------------------------------===//


#include "llvm/IR/Function.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/IntrinsicInst.h"
#include "llvm/IR/Type.h"
#include "llvm/InitializePasses.h"
#include "llvm/Pass.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/Debug.h"
#include "llvm/Transforms/Scalar.h"
#include "llvm/ADT/STLExtras.h" 
#include "llvm/ADT/PostOrderIterator.h"
#include "llvm/Support/MemoryBufferRef.h"
#include "llvm/Bitcode/BitcodeReader.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Linker/Linker.h"
#include "llvm/IR/InlineAsm.h"
#include "llvm/Transforms/Utils/Cloning.h"

#include <iostream>
#include <cstdlib>
#include <fstream>
#include <string>
#include <boost/multiprecision/cpp_int.hpp>

using namespace boost::multiprecision;


#define DEBUG_TYPE "hydride-llvm-instcombine"

static llvm::cl::opt<unsigned> InstCombineDepth(
    "instcombine-depth", llvm::cl::init(5), llvm::cl::Hidden,
    llvm::cl::desc("Enables users to set the depth for instcombine."));


namespace llvm {

class HydrideLLVMInstCombinePass : public ModulePass {
      //unsigned RacketModuleNo = 0;
      DenseMap<int, unsigned> RacketModuleNoMap;
public:
    static char ID;

    HydrideLLVMInstCombinePass() : ModulePass(ID) {
      initRacketModuleNoMap();
    }

    bool runOnFunction(Function &F);

    bool runOnModule(Module &M);

    void getAnalysisUsage(AnalysisUsage &AU) const {}

    const std::array<unsigned, 2> getRacketModuleNos() {
      return std::array<unsigned, 2>{RacketModuleNoMap[0], RacketModuleNoMap[0]};
    }

    void incrementRacketModuleNo(int CostModel) {
      RacketModuleNoMap[CostModel]++;
    }

    void incrementRacketModuleNo() {
      incrementRacketModuleNo(0);
      incrementRacketModuleNo(1);
    }

    void initRacketModuleNoMap() {
      RacketModuleNoMap[0] = 0;
      RacketModuleNoMap[1] = 0;
    }
};

}  // end llvm namespace


using namespace llvm;


static std::string IntToHex(int512_t IntegerVal, unsigned Bitwidth) {
  std::stringstream Stream;
  if (IntegerVal >= 0) {
    Stream << std::setfill ('0') << std::setw(Bitwidth * 2) 
          << std::hex << IntegerVal;
  } else {
    Stream << std::setfill ('f') << std::setw(Bitwidth * 2) 
          << std::hex << IntegerVal;
  }
  return Stream.str();
}


static void GenerateExpression(CallInst *I, DenseMap<Value *, int> &ValToRegMap,
                          std::string &InstWinExprString) {
  errs() << "GENERATION EXPRESSION\n";
  errs() << "INSTRUCTION: " << *I << "\n";
  std::string Name = I->getCalledFunction()->getName().str();
  // Strip off the prefix from the callee name
  const std::string Prefix("llvm.hydride.");
  if (Name != Prefix && Name.size() > Prefix.size() &&
      Name.substr(0, Prefix.size()) == "llvm.hydride.") {
    Name = Name.substr(Prefix.size(), Name.size() - Prefix.size());
    // Strip any numerical suffix
    const std::string Suffix(".");
    auto Index = Name.find(Suffix);
    if (Index != std::string::npos) {
      Name = Name.substr(0, Index);
    }
  }
  InstWinExprString += "(" + Name + "\n";
  errs() << I->getCalledFunction()->getName() << "\n";
  //for (Use &U : I->operands()) {
  for(unsigned Index = 0; Index < I->arg_size(); Index++) {
    auto *Operand = I->getArgOperand(Index); //Use->get();
    errs() << "Call instruction's Operand: " << *Operand << "\n";
    errs() << "Operand type: " << *(Operand->getType()) << "\n";
    if (Operand->getType()->isVectorTy()) {
      if (auto *Inst = dyn_cast<Instruction>(Operand)) {
        errs() << "Inst: " << *Inst << "\n";
        if (ValToRegMap.find(Operand) != ValToRegMap.end()) {
          errs() << "value in value to reg map\n";
          InstWinExprString += "(reg " + std::to_string(ValToRegMap[Operand]) + ") ";
        } else {
          errs() << "value not in value to reg map\n";
          if (auto *CI = dyn_cast<CallInst>(Operand)) {
            errs() << "CALL OPERAND: " << *CI << "\n";
            GenerateExpression(CI, ValToRegMap, InstWinExprString);
          }
        }
      } else {
        if(auto *CV = dyn_cast<ConstantDataVector>(Operand)) {
          // Convert the vector into a vector in Rosette
          std::string RosetteVector = "(lit (bv #x";
          auto *BitvectorType = dyn_cast<VectorType>(Operand->getType());
          auto NumElems = BitvectorType->getElementCount().getKnownMinValue();
          for (unsigned Index = 0; Index < NumElems; Index++) {
            RosetteVector += IntToHex(CV->getElementAsInteger(Index), 
                  BitvectorType->getElementType()->getPrimitiveSizeInBits().getKnownMinValue());
          }
          InstWinExprString += RosetteVector + " " + 
                      std::to_string(BitvectorType->getPrimitiveSizeInBits().getKnownMinValue()) + ")) ";
        } else {
          if(dyn_cast<ConstantAggregateZero>(Operand)) {
            InstWinExprString += "(lit (bv 0 " + 
                        std::to_string(Operand->getType()->getPrimitiveSizeInBits().getKnownMinValue()) + ")) ";
          } else {  
            if (ValToRegMap.find(Operand) != ValToRegMap.end()) {
              errs() << "value in value to reg map\n";
              InstWinExprString += "(reg " + std::to_string(ValToRegMap[Operand]) + ") ";
            }
          }
        }
      }
    } else {
      errs() << "CONSTANT INT\n";
      auto *ConstInt = dyn_cast<ConstantInt>(Operand);
      assert(ConstInt != nullptr);
      InstWinExprString += std::to_string(ConstInt->getSExtValue()) + " ";
    }
  }
  InstWinExprString += ")\n";
  errs() << "InstWinExprString: " << InstWinExprString << "\n";
}


template<typename M, typename N>
static std::unique_ptr<Module> 
SynthesizeInstCombineResults(Function &F, M &InstWindow, 
                            DenseMap<Value *, int> &ValToRegMap,
                            N &RegVals, std::string &SynthesizedFuncName,
                            const unsigned &ModuleNo, 
                            int CostModel = 0) {
  // Invoke Hydride's synthesis-based instruction combiner.
  // First we will generate a racket file that invokes the synthesizer.
  std::string RktFileName = "instcombine_synth.rkt";
  std::ofstream RktFile(RktFileName);
  std::string HeadersString =  "#lang rosette \n \
(require rosette/lib/synthax) \n \
(require rosette/lib/angelic) \n \
(require racket/pretty) \n \
(require data/bit-vector) \n \
(require rosette/lib/destruct) \n \
(require rosette/solver/smt/boolector) \n \
(require hydride) \n \
\n \
;; Uncomment the line below to enable verbose logging \n \
(enable-debug) \n \
\n \
(current-bitwidth 16) \n \
(custodian-limit-memory (current-custodian) (* 20000 1024 1024)) \n \
\n\n";

  // Set bunch of file names
  std::string SynthesizedFileName = "test_combine";
  std::string PathToFile = "/tmp/";

  // Generate expression for the instruction window
  std::string InstWinExprString = "(define hydride-expr \n";
  GenerateExpression(InstWindow[0], ValToRegMap, InstWinExprString);
  InstWinExprString += ")\n";
  errs() << "InstWinExprString: " << InstWinExprString << "\n";

  // Get input sizes and precision
  std::string InputSizeString = "(define input-sizes (list "; 
  std::string InputPrecString = "(define input-precs (list ";
  for (auto *Val : RegVals) {
    auto *VectType = dyn_cast<VectorType>(Val->getType());
    assert(VectType != nullptr);
    InputSizeString += std::to_string(VectType->getPrimitiveSizeInBits()) + " ";
    InputPrecString += std::to_string(VectType->getElementType()->getPrimitiveSizeInBits()) + " ";
  }
  InputSizeString += "))\n\n";
  InputPrecString += "))\n\n";

  // Get output expression
  std::string InputHashFileName = F.getParent()->getName().str() + ".inst.combine.expr";
  std::string OutputHashFileName = F.getParent()->getName().str() + ".inst.combine.expr";
  std::string InputCacheFileName = F.getParent()->getName().str() + ".inst.cache";
  std::string OutputCacheFileName = F.getParent()->getName().str() + ".inst.cache";
  std::string InputHashFileNameSpecialCostModel = F.getParent()->getName().str() + ".inst.combine.expr.special.cost.model";
  std::string OutputHashFileNameSpecialCostModel = F.getParent()->getName().str() + ".inst.combine.expr.special.cost.model";
  std::string InputCacheFileNameSpecialCostModel = F.getParent()->getName().str() + ".inst.cache.special.cost.model";
  std::string OutputCacheFileNameSpecialCostModel = F.getParent()->getName().str() + ".inst.cache.special.cost.model";
  if (ModuleNo == 0) {
    std::string RemoveOutputFileCmd;
    if (CostModel == 0) {
      InputHashFileName = "";
      RemoveOutputFileCmd = "rm " + PathToFile + OutputHashFileName + ".rkt";
      errs() << "RUNNING...\n";
      errs() << RemoveOutputFileCmd << "\n";
      system(RemoveOutputFileCmd.c_str());
      InputCacheFileName = "";
      RemoveOutputFileCmd = "rm " + PathToFile + OutputCacheFileName + ".rkt";
      errs() << "RUNNING...\n";
      errs() << RemoveOutputFileCmd << "\n";
      system(RemoveOutputFileCmd.c_str());
    } else {
      InputHashFileNameSpecialCostModel = "";
      RemoveOutputFileCmd = "rm " + PathToFile + OutputHashFileNameSpecialCostModel + ".rkt";
      errs() << "RUNNING...\n";
      errs() << RemoveOutputFileCmd << "\n";
      system(RemoveOutputFileCmd.c_str());
      InputCacheFileNameSpecialCostModel = "";
      RemoveOutputFileCmd = "rm " + PathToFile + OutputCacheFileNameSpecialCostModel + ".rkt";
      errs() << "RUNNING...\n";
      errs() << RemoveOutputFileCmd << "\n";
      system(RemoveOutputFileCmd.c_str());
    }
  }

  std::string HashDefinitions;
  if (CostModel == 0) {
    HashDefinitions = "(define input-hash-name \"" + InputHashFileName + "\")\n \
                                  (define output-hash-name \"" + OutputHashFileName + "\")\n\n";
  } else {
    HashDefinitions = "(define input-hash-name \"" + InputHashFileNameSpecialCostModel + "\")\n \
                    (define output-hash-name \"" + OutputHashFileNameSpecialCostModel + "\")\n\n";
  }
  std::string CacheDefinitions; 
  if (CostModel == 0) {
    CacheDefinitions = "(define input-cache-name \"" + InputCacheFileName + "\")\n \
                                (define output-cache-name \"" + OutputCacheFileName + "\")\n\n";
  } else {
    CacheDefinitions = "(define input-cache-name \"" + InputCacheFileNameSpecialCostModel + "\")\n \
                  (define output-cache-name \"" + OutputCacheFileNameSpecialCostModel + "\")\n\n";
  }

  std::string CostModelName = "";
  if (CostModel == 0)
    CostModelName = "\"regular\"";
  else
    CostModelName = "\"instcombine\"";
  std::string OutputExprString = 
        "(define output-expr (inst-combine hydride-expr #t #f 'z3 input-sizes input-precs \"hvx\" " + CostModelName
                  + " input-hash-name output-hash-name input-cache-name output-cache-name " 
                  + std::to_string(InstCombineDepth) + "))\n\n";
        //"(define output-expr (inst-combine hydride-expr #t #f 'z3 input-sizes input-precs \"hvx\" input-hash-name output-hash-name))\n\n";
  std::string PrintString = "(displayln \"Simplified expression\") \n \
                            (pretty-print output-expr) \n\n";
  std::string MethodNameString = "(define method-name \"" + SynthesizedFuncName + "\") \n\n";
  std::string FileNameString = "(define file-name \"" + SynthesizedFileName + "\") \n\n";
  std::string SynthesizedExpr = "(save-simplified-expr output-expr input-sizes input-precs method-name file-name) \n\n";

  // Generate the racket file
  RktFile << HeadersString;
  RktFile << InstWinExprString;
  RktFile << InputSizeString;
  RktFile << InputPrecString;
  RktFile << HashDefinitions;
  RktFile << CacheDefinitions;
  RktFile << OutputExprString;
  RktFile << PrintString;
  RktFile << MethodNameString;
  RktFile << FileNameString;
  RktFile << SynthesizedExpr;
  RktFile.close();
  errs() << "*********************************************************\n";
  errs() << HeadersString;
  errs() << InstWinExprString;
  errs() << InputSizeString;
  errs() << InputPrecString;
  errs() << HashDefinitions;
  errs() << CacheDefinitions;
  errs() << "(set-iterative-optimize)\n";
  errs() << OutputExprString;
  errs() << PrintString;
  errs() << MethodNameString;
  errs() << FileNameString;
  errs() << SynthesizedExpr;
  errs() << "*********************************************************\n";

  // Launch the process to execute the racket file
  std::string FullSynthRktFileName = PathToFile + SynthesizedFileName + ".rkt";
  std::string RemoveRktFileCmd = "rm " + FullSynthRktFileName;
  errs() << "RUNNING...\n";
  errs() << RemoveRktFileCmd << "\n";
  system(RemoveRktFileCmd.c_str());
  std::string RktCommand = "timeout 600 racket " + RktFileName;
  errs() << "RUNNING...\n";
  errs() << RktCommand << "\n";
  system(RktCommand.c_str());
  // If the racket file does not exist, quit
  if(std::ifstream(FullSynthRktFileName.c_str()).good() == false) {
    errs() << "SYNTHESIS FAILED....\n";
    return nullptr;
  }

  // Convert rosette code into LLVM code
  std::string LLVMModuleName = "SynthLLVM" + std::to_string(ModuleNo) + "." + std::to_string(CostModel);
  std::string FullSynthLLVMFileName = PathToFile + LLVMModuleName + ".ll";
  std::string RemoveLLVMFileCmd = "rm " + FullSynthLLVMFileName;
  errs() << "RUNNING...\n";
  errs() << RemoveLLVMFileCmd << "\n";
  system(RemoveLLVMFileCmd.c_str());
  std::string LifterCmd = "python3 RosetteToLLVMLifter.py " + FullSynthRktFileName + " " \
                                        + PathToFile + " " + LLVMModuleName;
  errs() << "RUNNING...\n";
  errs() << LifterCmd << "\n";
  system(LifterCmd.c_str());

  // Get the generated LLVM module and read the function in it.
  errs() << "FullSynthLLVMFileName: " << FullSynthLLVMFileName << "\n";
  auto *Context = new LLVMContext();
  SMDiagnostic Error;
  std::unique_ptr<Module> GeneratedModule = 
        parseIRFile(llvm::StringRef(FullSynthLLVMFileName), Error, F.getParent()->getContext());
  if (!GeneratedModule) {
    errs() << "ERROR PARSING GENERATED IR FILE\n";
    exit(-1);
  }
  errs() << "GeneratedModule:\n";
  errs() << *GeneratedModule;
  GeneratedModule->setDataLayout(F.getParent()->getDataLayout());
  GeneratedModule->setTargetTriple(F.getParent()->getTargetTriple());

  errs() << "SynthesizedFuncName: " << SynthesizedFuncName << "\n";
  auto *SynthFunction = GeneratedModule->getFunction(StringRef(SynthesizedFuncName));
  errs() << "SYNTHESIZED FUNCTION: \n";
  errs() << *SynthFunction << "\n";

  return GeneratedModule;
}


template<typename M, typename N, typename P, typename Q>
static bool CombineInstructions(Function &F, M &InstWindow, 
                              N &HandledInsts, P &NewlyAddedInsts,
                              const Q &ModuleNos) {
  errs() << "\n\n\n========================INSTRUCTION WINDOW: \n";
  for (auto *I : InstWindow) {
    errs() << *I << "\n";
  }
  errs() << "++++++++++++++++++++++++++++++++++++++++++++++++\n";

  // Get all the values that must be symbolic registers for the synthesizer
  DenseMap<Value *, int> ValToRegMap;
  SmallVector<Value *, 4> RegVals;
  int RegIndex = 0;
  for (size_t Index = 0; Index < InstWindow.size(); Index++) {
    for (Use &U : InstWindow[Index]->operands()) {
      auto *Use = &U;
      auto *Operand = Use->get();
      // Operand must be a vector
      if (!Operand->getType()->isVectorTy())
        continue;
      errs() << "OPERAND OF INSTRUCTION IN WINDOW: " << *Operand << "\n";
      if (auto *I = dyn_cast<Instruction>(Operand)) {
        errs() << "INSTRUCTION: " << *I << "\n"; 
        // The operand must not be in the instruction window
        if (find(InstWindow, I) == InstWindow.end()) {
          errs() << "INSTRUCTION NOT IN INSTRUCTION WINDOW\n";
          ValToRegMap[Operand] = RegIndex++;
          RegVals.push_back(Operand);
        } else {
          errs() << "INSTRUCTION IN INSTRUCTION WINDOW\n";
        }
      } else {
        errs() << "ADDING TO INSTRUCTION WINDOW\n";
        ValToRegMap[Operand] = RegIndex++;
        RegVals.push_back(Operand);
      }
    }
  }

  // Function name that will be synthesized
  std::string SynthesizedFuncName = "hydride.node.method";

  // Generate a module with synthesized results
  auto GeneratedModule = SynthesizeInstCombineResults(F, InstWindow, ValToRegMap, 
                                          RegVals, SynthesizedFuncName, ModuleNos[0], 0);
  if (GeneratedModule == nullptr) {
    // First attempt at synthesizing code failed. Try again but with a different cost model
    errs() << "FIRST SYNTHESIS ATTEMPT FAILED BUT TRYING AGAIN\n";
    GeneratedModule = SynthesizeInstCombineResults(F, InstWindow, ValToRegMap, 
                                    RegVals, SynthesizedFuncName, ModuleNos[1], 1);
    if (GeneratedModule == nullptr) {
      HandledInsts.insert(InstWindow[0]);
      return false;
    }
  }

  // Now that we have synthesized a module, check if the code synthesized 
  // is shorter than the code in the instruction window. If not, try
  // synthesizing with a different cost model.
  auto *SynthFunction = GeneratedModule->getFunction(StringRef(SynthesizedFuncName));
  unsigned NumInsts = 0;
  for (auto &BB : *SynthFunction) {
    for (auto &I : BB) {
      if (dyn_cast<CallInst>(&I))
        NumInsts++;
    }
  }
  if (InstWindow.size() <= NumInsts) {
    errs() << "FIRST SYNTHESIS ATTEMPT INEFFECTIVE BUT TRYING AGAIN\n";
    // Try synthesizing again
    auto GeneratedModuleSecondAttempt = SynthesizeInstCombineResults(F, InstWindow, ValToRegMap, 
                                                  RegVals, SynthesizedFuncName, ModuleNos[1], 1);
    if (GeneratedModuleSecondAttempt) {
      auto *SynthFunctionSecondAttempt = GeneratedModuleSecondAttempt->getFunction(StringRef(SynthesizedFuncName));
      unsigned NumInsts = 0;
      for (auto &BB : *SynthFunctionSecondAttempt) {
        for (auto &I : BB) {
          if (dyn_cast<CallInst>(&I))
            NumInsts++;
        }
      }
      if (InstWindow.size() > NumInsts)
        GeneratedModule = std::move(GeneratedModuleSecondAttempt);
    }
  }

  // Collect references to all functions before linking
  SmallPtrSet<Function *, 16> Functions;
  for (auto &Func : *(F.getParent()))
    Functions.insert(&Func);

  // Link this module with the one we generated
  errs() << "LINKING MODULES\n";
  bool Failed = Linker::linkModules(*(F.getParent()), std::move(GeneratedModule));
  if (Failed) {
    errs() << "FAILED TO LINK MODULES\n";
    exit(-1);
  }

  // Replace the instructions in the window with a call instruction
  errs() << "REPLACE THE INSTRUCTIONS IN THE WINDOW WITH A CALL INSTRUCTION\n";
  CallInst *CI = nullptr;
  Function *InlinableFunc = nullptr;
  for (auto &Func : *(F.getParent())) {
    errs() << "Func.getName(): " << Func.getName() << "\n";
    //errs() << "SynthFuncName: " << SynthFuncName << "\n";
    if (find(Functions, &Func) != Functions.end()) {
      errs() << "SKIP FUNCTION\n";
      continue;
    }
    errs() << "FOUND INLINABLE FUNCTION\n";
    assert (Func.empty() == false); //{
    //  errs() << "FUNCTION IS EMPTY\n";
    //  continue;
    //}
    //if (Func.getName() == SynthFuncName) {
      InlinableFunc = &Func;
      CI = CallInst::Create(Func.getFunctionType(), &Func, \
                    ArrayRef<Value *>(RegVals), "", InstWindow[0]);
      errs() << "FOUND InlinableFunc->getName(): " << InlinableFunc->getName() << "\n";
      break;
    //}
  }
  errs() << "CI POINTER: " << CI << "\n";
  assert(CI != nullptr && "'Generated call instruction cannot be null.");
  assert(InlinableFunc != nullptr && "Inlinable function cannot be null.");
  // If the types of call instruction and first instruction in the window
  // mismatch, bitcast it.
  if (CI->getType() != InstWindow[0]->getType()) {
    auto *BI = new BitCastInst(CI, InstWindow[0]->getType(), "", InstWindow[0]);
    InstWindow[0]->replaceAllUsesWith(BI);
    HandledInsts.insert(BI);
  } else {
    errs() << "REPLACING USES NOW...\n";
    InstWindow[0]->replaceAllUsesWith(CI);
  }

  errs() << "\n\n\n=----------------------INSTRUCTION WINDOW: \n";
  for (auto *I : InstWindow) {
    errs() << *I << "\n";
  }
  errs() << "++++++++++++++++++++++++++++++++++++++++++++++++\n";
  errs() << "InlinableFunc: " << *InlinableFunc << "\n";

  errs() << "DELETING INSTURCTIONS\n";
  // Delete instructions in this window
  for (auto *I : InstWindow) {
    errs() << *I << "\n";
    // This instruction must not have any uses
    assert(I->hasNUses(0));
    errs() << "INSTRUCTION HAS ZERO USES\n";
    HandledInsts.insert(I);
    //I->eraseFromParent();
  }

  errs() << "GET INSTRUCTIONS TO SKIP\n";
  SmallPtrSet<Instruction *, 16> InstsToSkip;
  for (auto &BB : F) {
    for (auto &I : BB) {
      InstsToSkip.insert(&I);
    }
  }

  // Inline the code in the new function at this call site
  errs() << "INLINE FUNCTION\n";
  InlineFunctionInfo InlineFuncInfo;
  InlineFunction(*CI, InlineFuncInfo);
  InlinableFunc->eraseFromParent();
  errs() << "INLINING DONE\n";

  errs() << "GATHERING NEWLY ADDED INSTRUCTIONS\n";
  SmallVector<Instruction *, 16> InlinedInsts;
  for (auto &BB : F) {
    for (auto &I : BB) {
      if (find(InstsToSkip, &I) != InstsToSkip.end())
        continue;
      errs() << "INLINED INSTRUCTION: " << I << "\n";
      InlinedInsts.push_back(&I);
      if (find(HandledInsts, &I) != HandledInsts.end()) {
        HandledInsts.erase(&I);
      }
    }
  }

  for (auto *I : InlinedInsts) {
    if (auto *CI = dyn_cast<CallInst>(I)) {
      // Fix the names to callees in the newly added instructions
      bool CalleeNameFixed = false;
      for (auto &Func : *(F.getParent())) {
        if (Func.getType() == CI->getCalledFunction()->getType()
            && Func.getName().contains(CI->getCalledFunction()->getName())) {
          errs() << "FOUND MATCH IN MODULE\n";
          errs() << "Func.getName(): " << Func.getName() << "\n";
          errs() << "CI->getCalledFunction()->getName(): " << CI->getCalledFunction()->getName() << "\n";
          if (Func.getName() != CI->getCalledFunction()->getName()) {
            errs() << "....... CHANGING INLINED INSTRUCTION!!!!\n";
            // Create a new call instruction
            auto *NewCI = CallInst::Create(Func.getFunctionType(), &Func, \
                  ArrayRef<Value *>(std::vector<Value *>(CI->arg_begin(), CI->arg_end())), "", CI);
            I->replaceAllUsesWith(NewCI);
            errs() << "NewCI: " << *NewCI << "\n";
            errs() << "OldCI: " << *I << "\n";
            //I->eraseFromParent();
            HandledInsts.insert(I);
            NewlyAddedInsts.push_back(NewCI);
            CalleeNameFixed = true;
            break;
          }
        }
      }
      if (CalleeNameFixed)
        continue;
      errs() << "NEWLY ADDED INSTRUCTION WITH NO CALL NAME CHANGE\n";
      errs() << *CI << "\n";
      NewlyAddedInsts.push_back(CI);
    } else {
      errs() << "ADDED INSTRUCTIONS PUSH BACK\n";
      NewlyAddedInsts.push_back(I);
    }
  }

  if (NewlyAddedInsts.size() > 1) {
    HandledInsts.insert(NewlyAddedInsts[NewlyAddedInsts.size() - 1]);
  }

  errs() << "FUNCTION: \n";
  errs() << F << "\n";

  return true;
}

bool HydrideLLVMInstCombinePass::runOnFunction(Function &F) {
  errs() << "RUNNING PASS ON FUNCTION: \n" << F << "\n";
  // Collect instructions in a worklist
  SmallVector<Instruction *, 16> Worklist;
  for (auto *BB : post_order(&F)) {
    for (Instruction &I : *BB) {
      errs() << "INST: " << I << "\n";
      if (auto *CI = dyn_cast<CallInst>(&I)) {
        errs() << "LOOKING AT CALL: " << *CI << "\n";
        errs() << "CALLED FUNCTION: " << CI->getCalledFunction() << "\n";
        if (auto *Func = CI->getCalledFunction()) {
          if (Func->getName().contains("hydride"))
            Worklist.push_back(CI);
        }
      }
    } 
  }

  errs() << "Worklist.size(): " << Worklist.size() << "\n";
  if (Worklist.size() == 0 || Worklist.size() == 1)
    return false;

  // Combine the instructions in the worklist within the 
  // scope of use-def chains.
  bool Changed = false;
  SmallPtrSet<Instruction *, 16> HandledInsts;
  SmallVector<Instruction *, 16> NewlyAddedInsts;
  const auto &ModuleNos = getRacketModuleNos();
  while(Worklist.size() != 0) {
    auto *I = Worklist.back();
    Worklist.pop_back();
    if (!dyn_cast<CallInst>(I))
      continue;
    if (find(HandledInsts, I) != HandledInsts.end()) {
      errs() << "HANDLED INSTRUCTION\n";
      continue;
    }
    errs() << "CONSIDERING INSTRUCTION: " << *I << "\n";
    // If the instruciton has no use, it must be erased.
    if (I->getNumUses() == 0) {
      // If this instruction is still in this function, delete it.
      if (!I->getParent()) {
        errs() << "DELETING BAD INSTRUCTION\n";
        I->eraseFromParent();
      }
      continue;
    }
    errs() << "HARVEST INSTRUCTIONS TO COMBINE:\n";
    SmallVector<CallInst *, 16> Window;
    Window.push_back(dyn_cast<CallInst>(I));
    errs() << *I << "\n";
    SmallVector<Instruction *, 16> Stack;
    Stack.push_back(I);
    DenseMap<Value *, unsigned> InstToDepthMap;
    InstToDepthMap[I] = InstCombineDepth - 1;
    while(Stack.size() != 0) {
      auto *Inst = Stack.back();
      Stack.pop_back();
      if (InstToDepthMap[Inst] == 0)
        continue;
      for (Use &U : Inst->operands()) {
        auto *Use = &U;
        auto *Operand = Use->get();
        // Use must be a vector
        if (!Operand->getType()->isVectorTy())
          continue;
        if (dyn_cast<Instruction>(Operand)) 
          InstToDepthMap[Operand] = InstToDepthMap[Inst] - 1;
        if (auto *CI = dyn_cast<CallInst>(Operand)) {
          // The operand must have only one use, otherwise no point
          // in trying to combine this with other instructions.
          if (CI->hasOneUse()) {
            Window.push_back(CI);
            Stack.push_back(CI);
            errs() << *CI << "\n";
          }
        }
      }
    }
    errs() << "HARVESTING OF INSTRUCTIONS DONE\n";
    if (Window.size() == 1)
      continue;
    NewlyAddedInsts = SmallVector<Instruction *, 16>();
    Changed |= CombineInstructions(F, Window, HandledInsts, 
                                    NewlyAddedInsts, ModuleNos);
    incrementRacketModuleNo();
    errs() << "NewlyAddedInsts: " << NewlyAddedInsts.size() << "\n";
    errs() << "Worklist: " << Worklist.size() << "\n";
    for (auto *Inst : NewlyAddedInsts)
      Worklist.push_back(Inst);
    errs() << "Worklist: " << Worklist.size() << "\n";
    Window.clear();
  }

  // Remove instructions rendered dead by this pass
  for (auto *BB : post_order(&F)) {
    for(Instruction &I : *BB) {
      auto *CI = dyn_cast<CallInst>(&I);
      if(CI != nullptr) {
        Worklist.push_back(CI);
      }
    }
  }
  while(Worklist.size() != 0) {
    auto *I = Worklist.back();
    Worklist.pop_back();
    if (I->getNumUses() == 0)
      I->eraseFromParent();
  }

  errs() << "FINAL FUNCTION: \n";
  errs() << F << "\n";

  return Changed;
}


bool HydrideLLVMInstCombinePass::runOnModule(Module &M) {
  SmallVector<Function *, 16> FunctionList;
  for (auto &F : M) {
    if (F.empty())
      continue;
    if (F.getName() != "hydride.node.gaussian3x3_hvx_depth3.2")
      continue;
    errs() << "FUNCTION PUT IN THE LIST: " << F.getName() << "\n";
    FunctionList.push_back(&F);
  }
  bool Changed = false;
  for (auto *F : FunctionList) 
    Changed |= runOnFunction(*F);
  
  return Changed;
}


char HydrideLLVMInstCombinePass::ID = 0;
static RegisterPass<HydrideLLVMInstCombinePass> X("hydride-llvm-instcombine", 
          "Pass to combine target-agnostic instructions generated by Hydride.");

