#############################################################
#
# Target-specific Instruction Selection Generator
#
#############################################################


from RoseCodeEmitter import *
from RoseAbstractions import *
from RoseContext import *
from RosetteCodeEmitter import *
from RoseFunctionInfo import *
from RoseCodeGenerator import *
from RoseToolsUtils import *
from RoseSimilarityCheckerUtilities import *
from RoseISAValidityChecker import *



class RoseInstSelectorGenerator():
  def __init__(self, ISASemantics : dict):
    self.ISASemantics = ISASemantics

  def genHeader(self):
    String = GenHeadersForAutoGenFiles("//")
    Content = [
      "#include \"llvm/IR/Function.h\"",
      "#include \"llvm/IR/LLVMContext.h\"",
      "#include \"llvm/IR/Module.h\"",
      "#include \"llvm/IR/Instructions.h\"",
      "#include \"llvm/IR/IntrinsicInst.h\"",
      "#include \"llvm/IR/Type.h\"",
      "#include \"llvm/InitializePasses.h\"",
      "#include \"llvm/Pass.h\"",
      "#include \"llvm/Support/CommandLine.h\"",
      "#include \"llvm/Support/Debug.h\"",
      "#include \"llvm/Transforms/Scalar.h\"",
      "#include \"Legalizer.h\"",
    ]
    return String + "\n".join(Content)
  
  def generateLegalizerPassDeclaration(self):
    String = '''
      namespace llvm {

      class X86LegalizationPass : public FunctionPass {
      public:
          static char ID;

          X86LegalizationPass() : FunctionPass(ID) {}

          bool runOnFunction(Function &F);

          void getAnalysisUsage(AnalysisUsage &AU) const {}
      };

      }
    '''
    return String
  

  def generateAPattern(self, TargetAgnosticInst : str, InstDict : dict):
    String = ""
    for InstName, InstInfo in InstDict.items():
      ValidityChecker = RoseISAValidityChecker()
      if ValidityChecker.checkValidityOnTarget(InstName, "x86") == False:
        if "div" not in InstName and "rem" not in InstName:
          continue
      Checks = list()
      for Idx, ArgVal in enumerate(InstInfo["args"]):
        if "SYMBOLIC_BV" not in ArgVal and InstInfo["arg_permute_map"][Idx] == -1:
          # If the argument value is a constant bitvectoer, convert it into an integer
          if "bv" in ArgVal:
            ArgVal = ArgVal.replace("(bv #", "").strip()
            ArgVal = ArgVal[:ArgVal.index(" ")]
            ArgVal = "0" + ArgVal
            print("ArgVal hex string:")
            print(ArgVal)
            ArgVal = int(ArgVal, 16)
            print("ArgVal hex:")
            print(ArgVal)
            ArgVal = int(ArgVal)
            print("ArgVal:")
            print(ArgVal)
          if len(Checks) == 0:
            Checks.append(
            '''isAMatch(CI, {}, {})'''.format(str(Idx), ArgVal))
          else:
            Checks.append(
            '''       && isAMatch(CI, {}, {})'''.format(str(Idx), ArgVal)) 
      Permutation = list()
      for Val in InstInfo["arg_permute_map"]:
        Permutation.append(str(Val))
      print("Content:")
      print(Checks)
      if "div" in InstName and "epi" in InstName:
        if len(Checks) != 0:
          Pattern = '''
            if({}) {{
              std::vector<int> Permutation = {{{}}}; 
              std::vector<Value *> Args = getArgsAfterPermutationForSpecialCases(CI, Permutation);    
              auto *NewInst = BinaryOperator::Create(Instruction::SDiv, Args[0], Args[1], "", CI);
              errs() << \"NEW INSTUCTION:\" << *NewInst << \"\\n\"; 
              InstToInstMap[CI] = NewInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }}
          '''.format("\n".join(Checks), ",".join(Permutation))
        else:
          Pattern = '''
            {{ 
              std::vector<int> Permutation = {{{}}}; 
              std::vector<Value *> Args = getArgsAfterPermutationForSpecialCases(CI, Permutation);    
              auto *NewInst = BinaryOperator::Create(Instruction::SDiv, Args[0], Args[1], "", CI);
              errs() << \"NEW INSTUCTION:\" << *NewInst << \"\\n\"; 
              InstToInstMap[CI] = NewInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }} 
          '''.format(",".join(Permutation))
      elif "div" in InstName and "epu" in InstName:
        if len(Checks) != 0:
          Pattern = '''
            if({}) {{
              std::vector<int> Permutation = {{{}}}; 
              std::vector<Value *> Args = getArgsAfterPermutationForSpecialCases(CI, Permutation);    
              auto *NewInst = BinaryOperator::Create(Instruction::UDiv, Args[0], Args[1], "", CI);
              errs() << \"NEW INSTUCTION:\" << *NewInst << \"\\n\"; 
              InstToInstMap[CI] = NewInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }}
          '''.format("\n".join(Checks), ",".join(Permutation))
        else:
          Pattern = '''
            {{ 
              std::vector<int> Permutation = {{{}}}; 
              std::vector<Value *> Args = getArgsAfterPermutationForSpecialCases(CI, Permutation);    
              auto *NewInst = BinaryOperator::Create(Instruction::UDiv, Args[0], Args[1], "", CI);
              errs() << \"NEW INSTUCTION:\" << *NewInst << \"\\n\"; 
              InstToInstMap[CI] = NewInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }} 
          '''.format(",".join(Permutation))
      elif "rem" in InstName and "epi" in InstName:
        if len(Checks) != 0:
          Pattern = '''
            if({}) {{
              std::vector<int> Permutation = {{{}}}; 
              std::vector<Value *> Args = getArgsAfterPermutationForSpecialCases(CI, Permutation);    
              auto *NewInst = BinaryOperator::Create(Instruction::SRem, Args[0], Args[1], "", CI);
              errs() << \"NEW INSTUCTION:\" << *NewInst << \"\\n\"; 
              InstToInstMap[CI] = NewInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }}
          '''.format("\n".join(Checks), ",".join(Permutation))
        else:
          Pattern = '''
            {{ 
              std::vector<int> Permutation = {{{}}}; 
              std::vector<Value *> Args = getArgsAfterPermutationForSpecialCases(CI, Permutation);    
              auto *NewInst = BinaryOperator::Create(Instruction::SRem, Args[0], Args[1], "", CI);
              errs() << \"NEW INSTUCTION:\" << *NewInst << \"\\n\"; 
              InstToInstMap[CI] = NewInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }} 
          '''.format(",".join(Permutation))
      elif "rem" in InstName and "epu" in InstName:
        if len(Checks) != 0:
          Pattern = '''
            if({}) {{
              std::vector<int> Permutation = {{{}}}; 
              std::vector<Value *> Args = getArgsAfterPermutationForSpecialCases(CI, Permutation);    
              auto *NewInst = BinaryOperator::Create(Instruction::URem, Args[0], Args[1], "", CI);
              errs() << \"NEW INSTUCTION:\" << *NewInst << \"\\n\"; 
              InstToInstMap[CI] = NewInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }}
          '''.format("\n".join(Checks), ",".join(Permutation))
        else:
          Pattern = '''
            {{ 
              std::vector<int> Permutation = {{{}}}; 
              std::vector<Value *> Args = getArgsAfterPermutationForSpecialCases(CI, Permutation);    
              auto *NewInst = BinaryOperator::Create(Instruction::URem, Args[0], Args[1], "", CI);
              errs() << \"NEW INSTUCTION:\" << *NewInst << \"\\n\"; 
              InstToInstMap[CI] = NewInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }} 
          '''.format(",".join(Permutation))
      else:
        if len(Checks) != 0:
          Pattern = '''
            if({}) {{
              auto *InstFunction = I->getModule()->getFunction(\"{}\"); 
              errs() << "INST FUNCTION NAME: " << \"{}\" << \"\\n\"; 
              std::vector<int> Permutation = {{{}}}; 
              std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
              if (Args.size() != 0) {{
                auto *NewCallInst = CallInst::Create(InstFunction, Args, \"\", CI); 
                errs() << \"NEW INSTUCTION:\" << *NewCallInst << \"\\n\"; 
                InstToInstMap[CI] = NewCallInst; 
                ToBeRemoved.insert(CI); 
                return true; 
              }}
            }} 
          '''.format("\n".join(Checks), InstName + "_wrapper", InstName + "_wrapper", ",".join(Permutation))
        else:
          Pattern = '''
            {{ 
              auto *InstFunction = I->getModule()->getFunction(\"{}\"); 
              std::vector<int> Permutation = {{{}}}; 
              std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
              if (Args.size() != 0) {{
                auto *NewCallInst = CallInst::Create(InstFunction, Args, \"\", CI); 
                errs() << \"NEW INSTUCTION:\" << *NewCallInst << \"\\n\"; 
                InstToInstMap[CI] = NewCallInst; 
                ToBeRemoved.insert(CI); 
                return true;
              }}
            }} 
          '''.format(InstName + "_wrapper", ",".join(Permutation))
      String += Pattern
    FinalPattern = '''
      if(CI->getCalledFunction()->getName().contains(\"llvm.hydride.{}_dsl\")) {{ 
        {} 
      }} 
    '''.format(TargetAgnosticInst, String)
    print("FinalPattern:")
    print(FinalPattern)
    return FinalPattern

  def generateInstSelectorForAllInsts(self):
    Content = list()
    for TargetAgnosticInst, InstList in self.ISASemantics.items():
      #print("TargetAgnosticInst:")
      #print(TargetAgnosticInst)
      #print("InstList:")
      #print(InstList)
      Content.append(self.generateAPattern(TargetAgnosticInst, InstList["target_instructions"]))
    return "\n".join(Content)

  def generateInstSelector(self):
    Content = '''
    virtual bool legalize(Instruction *I) {{
      auto *CI = dyn_cast<CallInst>(I);
      if (CI == nullptr)
        return false;
      if (InstToInstMap[CI] != nullptr)
        return false;
      {}
    }}
    '''.format(self.generateInstSelectorForAllInsts())
    return Content
    
  def generatePassToRunOnFunction(self):
    String = '''
    bool X86LegalizationPass::runOnFunction(Function &F) {
      if (F.getName().contains("hydride") == false)
        return false;
      // Initialize the legalizer
      errs() << "LEGALIZATION BEGIN\\n";
      Legalizer *L = new X86Legalizer();
      return L->legalize(F);
    }
    '''
    return String

  def generateLegalizerPassDefinition(self):
    String = '''
    using namespace llvm;

    class X86Legalizer : public Legalizer {{
    public:
    {}

    }};

    {}
    '''.format(self.generateInstSelector(), self.generatePassToRunOnFunction())
    return String

  def generateCodeForRegisteringPass(self):
    String = '''
    char X86LegalizationPass::ID = 0;
    static RegisterPass<X86LegalizationPass> X("x86-hydride-legalize", 
                                              "Pass to legalize tensor intrinsics");
    '''
    return String

  def generateFileWithInstSelector(self):
    Content = self.genHeader()
    Content += self.generateLegalizerPassDeclaration()
    Content += self.generateLegalizerPassDefinition()
    Content += self.generateCodeForRegisteringPass()
    FileName = "x86Legalizer.cpp"
    try:
      File = open(FileName, "w")
      File.write(Content)
      print("Content:")
      print(Content)
      File.close()
    except IOError:
      print("Error making: {}".format(FileName))
      assert False

    

if __name__ == '__main__':
  from semantics import semantics
  InstSelectorGenerator = RoseInstSelectorGenerator(semantics)
  InstSelectorGenerator.generateFileWithInstSelector()

