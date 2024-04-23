#############################################################
#
# Instruction Selection Generator for hexagon. This legalizer
# should technically work for any target which has LLVM
# intrinsics for all its instructions.
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
#from RoseISAValidityChecker import *



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
      class BitSIMDLegalizationPass : public FunctionPass {
      public:
          static char ID;
          BitSIMDLegalizationPass() : FunctionPass(ID) {}
          bool runOnFunction(Function &F);
          void getAnalysisUsage(AnalysisUsage &AU) const {}
      };
      }
    '''
    return String


  def generateAPattern(self, TargetAgnosticInst : str, InstDict : dict):
    InstNames = list()
    String = ""
    for InstName, InstInfo in InstDict.items():
      InstNames.append("\"llvm.hydride." + InstName + "_dsl\"")
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
      if len(Checks) != 0:
        Pattern = '''
          if({}) {{
            std::string base_name = \"{}\";
            std::vector<int> Permutation = {{{}}};
            auto *InstFunction = CreateFunctionDecl(base_name, CI);
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI);

            // Generate any bitserial Allocation for operands
            // If they do not exist
            InsertBitSIMDAllocations(Args, CI);

            // Generate any bitserial Allocation for result
            InsertBitSIMDAllocation(CI, CI);

            // Replace vectorized call to call PIM ISA Directly
            InsertBitSIMDCall(InstFunction, Args, CI);

            ToBeRemoved.insert(CI);


          }}
        '''.format("\n".join(Checks), InstName.split("_")[0], ",".join(Permutation))
      else:
        assert False, "Unreachable"
      String += Pattern
    FinalPattern = '''
    {{
      std::vector<std::string> InstNames = {{{}}};
      if(isNameMatch(CI, InstNames)) {{
        {}
      }}
    }}
    '''.format(",\n".join(InstNames), String)
    print("FinalPattern:")
    print(FinalPattern)
    return FinalPattern

  def generateInstSelectorForAllInsts(self):
    Content = list()
    for TargetAgnosticInst, InstList in self.ISASemantics.items():
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
    bool BitSIMDLegalizationPass::runOnFunction(Function &F) {
      if (F.getName().contains("hydride") == false)
        return false;
      // Initialize the legalizer
      errs() << "LEGALIZATION BEGIN\\n";
      Legalizer *L = new BitSIMDLegalizer();
      return L->legalize(F);
    }
    '''
    return String

  def generateLegalizerPassDefinition(self):
    String = '''
    using namespace llvm;
    class BitSIMDLegalizer : public Legalizer {{
    public:
    {}
    }};
    {}
    '''.format(self.generateInstSelector(), self.generatePassToRunOnFunction())
    return String

  def generateCodeForRegisteringPass(self):
    String = '''
    char BitSIMDLegalizationPass::ID = 0;
    static RegisterPass<BitSIMDLegalizationPass> X("hex-hydride-legalize",
                                              "Pass to legalize tensor intrinsics");
    '''
    return String

  def generateFileWithInstSelector(self):
    Content = self.genHeader()
    Content += self.generateLegalizerPassDeclaration()
    Content += self.generateLegalizerPassDefinition()
    Content += self.generateCodeForRegisteringPass()
    FileName = "BitSIMDLegalizer.cpp"
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
  from BitSIMDsema import bitsimd_sema as semantics
  InstSelectorGenerator = RoseInstSelectorGenerator(semantics)
  InstSelectorGenerator.generateFileWithInstSelector()

