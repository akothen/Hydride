#include "VISALegalizer.h"

bool VISALegalizer::legalize(Instruction *I) {
    auto *CI = dyn_cast<CallInst>(I);
    if (CI == nullptr) {
        return false;
    }
    if (InstToInstMap[CI] != nullptr) {
        return false;
    }
#include "VISALegalizer.cpp.inc"
    return false;
}
