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
from RoseValidityChecker import *
from ARMSemanticGen import SemaGenerator


class RoseInstSelectorGenerator():
    def __init__(self, ISASemantics: dict):
        self.ISASemantics = ISASemantics
        S = SemaGenerator(deserialize=True)
        self.rawSemantics = S.getResult()

    def genHeader(self):
        String = GenHeadersForAutoGenFiles("//")
        Content = [
            "#include \"ARMLegalizer.h\""
        ]
        return String + "\n".join(Content)

    def genHeaderHeader(self):
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
            "using namespace boost::multiprecision::literals;"
        ]
        return String + "\n".join(Content)

    def generateLegalizerPassDeclaration(self):
        String = '''
namespace llvm {

class ARMLegalizationPass : public FunctionPass {
public:
    static char ID;

    ARMLegalizationPass() : FunctionPass(ID) {}

    bool runOnFunction(Function &F);

    void getAnalysisUsage(AnalysisUsage &AU) const {}
};

}
    '''
        return String

    def generateNormalPattern(self, InstName: str, InstInfo: dict):
        Checks = list()
        for Idx, ArgVal in enumerate(InstInfo["args"]):
            if "SYMBOLIC_BV" not in ArgVal and InstInfo["arg_permute_map"][Idx] == -1:
                # If the argument value is a constant bitvectoer, convert it into an integer
                if "bv" in ArgVal:
                    ArgVal = ArgVal.replace("(bv #", "").strip()
                    ArgVal = ArgVal[:ArgVal.index(" ")]
                    ArgVal = "0" + ArgVal
                    intArg = int(ArgVal, 16)
                    # Use boost literal to support int512_t initialization
                    ArgVal = hex(intArg)+"_cppi"
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
        if False:
            pass  # ?
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
        return Pattern

    def generateImmPatterns(self, InstName: str, InstInfo: dict):
        lo, hi = self.rawSemantics[InstName].imm_width
        ImmIdx = None
        for idx, param in enumerate(self.rawSemantics[InstName].params):
            if param.is_imm:
                ImmIdx = idx
            # Currently only supports semantics with one immediate

        String = ""
        for imm in range(lo, hi+1):
            Checks = list()
            for Idx, ArgVal in enumerate(InstInfo["args"]):
                RealIdx = InstInfo["arg_permute_map"][Idx]
                if ("SYMBOLIC_BV" not in ArgVal and RealIdx == -1) or RealIdx == ImmIdx:
                    # If the argument value is a constant bitvectoer, convert it into an integer
                    # breakpoint()
                    if "bv" in ArgVal:
                        ArgVal = ArgVal.replace("(bv #", "").strip()
                        ArgVal = ArgVal[:ArgVal.index(" ")]
                        ArgVal = "0" + ArgVal
                        intArg = int(ArgVal, 16)
                        ArgVal = hex(intArg)+"_cppi"
                    elif RealIdx == ImmIdx:
                        ArgVal = hex(imm)+"_cppi"
                    # Use boost literal to support int512_t initialization
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
            if False:
                pass  # ?
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
            '''.format("\n".join(Checks), InstName + "_wrapper_"+str(imm), InstName + "_wrapper_" + str(imm), ",".join(Permutation))
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
            '''.format(InstName + "_wrapper_" + str(imm), ",".join(Permutation))
            String += Pattern
        return String

    def generatePatternSet(self, TargetAgnosticInst: str, InstDict: dict):

        InstNames = list()
        String = ""
        for InstName, InstInfo in InstDict.items():
            # ValidityChecker = RoseISAValidityChecker()
            # if ValidityChecker.checkValidityOnTarget(InstName, "ARM") == False:
            # if "div" not in InstName and "rem" not in InstName:
            # continue
            InstNames.append("\"llvm.hydride." + InstName + "_dsl\"")
            if self.rawSemantics[InstName].imm_width:
                String += self.generateImmPatterns(InstName, InstInfo)
            else:
                String += self.generateNormalPattern(InstName, InstInfo)

        FinalPattern = GenHeadersForAutoGenFiles("//") + f'''
#include "ARMLegalizer.h"
bool ARMLegalizer::legalize_{TargetAgnosticInst}(CallInst *CI, Instruction *I){{
'''+'''
    std::vector<std::string> InstNames = {{{}}};
    if(isNameMatch(CI, InstNames)) {{ 
        {} 
    }} 
}}
'''.format(",\n".join(InstNames), String)

        with open(TargetAgnosticInst.capitalize()+"Selector.cpp", "w") as f:
            f.write(FinalPattern)
        print("FinalPattern:")
        FinalPattern = f"  if (legalize_{TargetAgnosticInst}(CI, I)) return true;"
        print(FinalPattern)
        return FinalPattern

    def generateInstSelectorDecl(self):
        Content = list()
        for TargetAgnosticInst, InstList in self.ISASemantics.items():
            # print("TargetAgnosticInst:")
            # print(TargetAgnosticInst)
            # print("InstList:")
            # print(InstList)
            Content.append(f"bool legalize_{TargetAgnosticInst}(CallInst *CI, Instruction *I);")
        return "\n".join(Content)
    
    def generateInstSelectorForAllInsts(self):
        Content = list()
        for TargetAgnosticInst, InstList in self.ISASemantics.items():
            # print("TargetAgnosticInst:")
            # print(TargetAgnosticInst)
            # print("InstList:")
            # print(InstList)
            Content.append(self.generatePatternSet(
                TargetAgnosticInst, InstList["target_instructions"]))
        return "\n".join(Content)

    def generateInstSelector(self):
        Content = '''
virtual bool legalize(Instruction *I) {{
  auto *CI = dyn_cast<CallInst>(I);
  if (CI == nullptr) {{
    return false;
  }}
  if (InstToInstMap[CI] != nullptr) {{
    return false;
  }}
  {}
  return false;
}}
    '''.format(self.generateInstSelectorForAllInsts())
        return Content

    def generatePassToRunOnFunction(self):
        String = '''
bool ARMLegalizationPass::runOnFunction(Function &F) {
  if (F.getName().contains("hydride") == false) {
    return false;
  }
  // Initialize the legalizer
  errs() << "LEGALIZATION BEGIN\\n";
  Legalizer *L = new ARMLegalizer();
  return L->legalize(F);
}
    '''
        return String

    def generateLegalizerPassDefinition(self):
        String = '''
using namespace llvm;

class ARMLegalizer : public Legalizer {{
public:
{}
{}
}};
    '''.format(self.generateInstSelector(), self.generateInstSelectorDecl())
        return String

    def generateCodeForRegisteringPass(self):
        String = '''
char ARMLegalizationPass::ID = 0;
static RegisterPass<ARMLegalizationPass> X("arm-hydride-legalize", 
                                          "Pass to legalize tensor intrinsics");
    '''
        return String

    def generateFileWithInstSelector(self):
        Content = self.genHeader()
        Content += self.generatePassToRunOnFunction()
        Content += self.generateCodeForRegisteringPass()
        FileName = "ARMLegalizer.cpp"
        try:
            File = open(FileName, "w")
            File.write(Content)
            print("Content:")
            print(Content)
            File.close()
        except IOError:
            print("Error making: {}".format(FileName))
            assert False
        Content = self.genHeaderHeader()
        Content += self.generateLegalizerPassDeclaration()
        Content += self.generateLegalizerPassDefinition()
        FileName = "ARMLegalizer.h"
        with open(FileName, "w") as f:
            f.write(Content)


if __name__ == '__main__':
    from ARMSemantics import semantcs as semantics
    InstSelectorGenerator = RoseInstSelectorGenerator(semantics)
    InstSelectorGenerator.generateFileWithInstSelector()
