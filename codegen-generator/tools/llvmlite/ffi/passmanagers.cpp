#include <sstream>

#include "core.h"

#include "llvm-c/Transforms/IPO.h"
#include "llvm-c/Transforms/Scalar.h"
#include "llvm/ADT/STLExtras.h"
#include "llvm/IR/DiagnosticInfo.h"
#include "llvm/IR/DiagnosticPrinter.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/IR/Module.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/ToolOutputFile.h"
#include "llvm/Support/YAMLTraits.h"
#include "llvm/Support/raw_ostream.h"

#include "llvm-c/Transforms/IPO.h"
#include "llvm-c/Transforms/Scalar.h"
#include "llvm/IR/LegacyPassManager.h"
#if LLVM_VERSION_MAJOR > 11
#include "llvm/IR/RemarkStreamer.h"
#endif
#include "llvm/IR/LLVMRemarkStreamer.h"
#include "llvm/Remarks/RemarkStreamer.h"
#include "llvm/Transforms/IPO.h"
#include "llvm/Transforms/Scalar.h"

#include <llvm/IR/PassTimingInfo.h>

using namespace llvm;

/*
 * Exposed API
 */

extern "C" {

API_EXPORT(void)
LLVMPY_SetTimePasses(bool enable) { TimePassesIsEnabled = enable; }

API_EXPORT(void)
LLVMPY_ReportAndResetTimings(const char **outmsg) {
    std::string osbuf;
    raw_string_ostream os(osbuf);
    reportAndResetTimings(&os);
    os.flush();
    *outmsg = LLVMPY_CreateString(os.str().c_str());
}

API_EXPORT(LLVMPassManagerRef)
LLVMPY_CreatePassManager() { return LLVMCreatePassManager(); }

API_EXPORT(void)
LLVMPY_DisposePassManager(LLVMPassManagerRef PM) {
    return LLVMDisposePassManager(PM);
}

API_EXPORT(LLVMPassManagerRef)
LLVMPY_CreateFunctionPassManager(LLVMModuleRef M) {
    return LLVMCreateFunctionPassManagerForModule(M);
}

API_EXPORT(int)
LLVMPY_RunPassManagerWithRemarks(LLVMPassManagerRef PM, LLVMModuleRef M,
                                 const char *remarks_format,
                                 const char *remarks_filter,
                                 const char *record_filename) {
    auto setupResult = llvm::setupLLVMOptimizationRemarks(
        unwrap(M)->getContext(), record_filename, remarks_filter,
        remarks_format, true);
    if (!setupResult) {
        return -1;
    }
    auto optimisationFile = std::move(*setupResult);
    auto r = LLVMRunPassManager(PM, M);

    unwrap(M)->getContext().setMainRemarkStreamer(nullptr);
    unwrap(M)->getContext().setLLVMRemarkStreamer(nullptr);

    optimisationFile->keep();
    optimisationFile->os().flush();
    return r;
}

API_EXPORT(int)
LLVMPY_RunPassManager(LLVMPassManagerRef PM, LLVMModuleRef M) {
    return LLVMRunPassManager(PM, M);
}

API_EXPORT(int)
LLVMPY_RunFunctionPassManagerWithRemarks(LLVMPassManagerRef PM, LLVMValueRef F,
                                         const char *remarks_format,
                                         const char *remarks_filter,
                                         const char *record_filename) {
    auto setupResult = llvm::setupLLVMOptimizationRemarks(
        unwrap(F)->getContext(), record_filename, remarks_filter,
        remarks_format, true);
    if (!setupResult) {
        return -1;
    }
    auto optimisationFile = std::move(*setupResult);

    auto r = LLVMRunFunctionPassManager(PM, F);

    unwrap(F)->getContext().setMainRemarkStreamer(nullptr);
    unwrap(F)->getContext().setLLVMRemarkStreamer(nullptr);

    optimisationFile->keep();
    optimisationFile->os().flush();
    return r;
}

API_EXPORT(int)
LLVMPY_RunFunctionPassManager(LLVMPassManagerRef PM, LLVMValueRef F) {
    return LLVMRunFunctionPassManager(PM, F);
}

API_EXPORT(int)
LLVMPY_InitializeFunctionPassManager(LLVMPassManagerRef FPM) {
    return LLVMInitializeFunctionPassManager(FPM);
}

API_EXPORT(int)
LLVMPY_FinalizeFunctionPassManager(LLVMPassManagerRef FPM) {
    return LLVMFinalizeFunctionPassManager(FPM);
}

API_EXPORT(void)
LLVMPY_AddConstantMergePass(LLVMPassManagerRef PM) {
    LLVMAddConstantMergePass(PM);
}

API_EXPORT(void)
LLVMPY_AddDeadArgEliminationPass(LLVMPassManagerRef PM) {
    LLVMAddDeadArgEliminationPass(PM);
}

API_EXPORT(void)
LLVMPY_AddFunctionAttrsPass(LLVMPassManagerRef PM) {
    LLVMAddFunctionAttrsPass(PM);
}

API_EXPORT(void)
LLVMPY_AddFunctionInliningPass(LLVMPassManagerRef PM, int Threshold) {
    unwrap(PM)->add(createFunctionInliningPass(Threshold));
}

API_EXPORT(void)
LLVMPY_AddGlobalOptimizerPass(LLVMPassManagerRef PM) {
    LLVMAddGlobalOptimizerPass(PM);
}

API_EXPORT(void)
LLVMPY_AddGlobalDCEPass(LLVMPassManagerRef PM) { LLVMAddGlobalDCEPass(PM); }

API_EXPORT(void)
LLVMPY_AddIPSCCPPass(LLVMPassManagerRef PM) { LLVMAddIPSCCPPass(PM); }

API_EXPORT(void)
LLVMPY_AddDeadCodeEliminationPass(LLVMPassManagerRef PM) {
    unwrap(PM)->add(createDeadCodeEliminationPass());
}

API_EXPORT(void)
LLVMPY_AddCFGSimplificationPass(LLVMPassManagerRef PM) {
    LLVMAddCFGSimplificationPass(PM);
}

API_EXPORT(void)
LLVMPY_AddGVNPass(LLVMPassManagerRef PM) { LLVMAddGVNPass(PM); }

API_EXPORT(void)
LLVMPY_AddInstructionCombiningPass(LLVMPassManagerRef PM) {
    LLVMAddInstructionCombiningPass(PM);
}

API_EXPORT(void)
LLVMPY_AddLICMPass(LLVMPassManagerRef PM) { LLVMAddLICMPass(PM); }

API_EXPORT(void)
LLVMPY_AddSCCPPass(LLVMPassManagerRef PM) { LLVMAddSCCPPass(PM); }

API_EXPORT(void)
LLVMPY_AddSROAPass(LLVMPassManagerRef PM) { unwrap(PM)->add(createSROAPass()); }

API_EXPORT(void)
LLVMPY_AddTypeBasedAliasAnalysisPass(LLVMPassManagerRef PM) {
    LLVMAddTypeBasedAliasAnalysisPass(PM);
}

API_EXPORT(void)
LLVMPY_AddBasicAliasAnalysisPass(LLVMPassManagerRef PM) {
    LLVMAddBasicAliasAnalysisPass(PM);
}

API_EXPORT(void)
LLVMPY_LLVMAddLoopRotatePass(LLVMPassManagerRef PM) {
    LLVMAddLoopRotatePass(PM);
}

} // end extern "C"
