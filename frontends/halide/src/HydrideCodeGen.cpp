
#include "Bounds.h"
#include "Expr.h"
#include <functional>
#include <string>

#include "Bounds.h"
#include "CSE.h"
#include "CodeGen_Internal.h"
#include "ExprUsesVar.h"
#include "FindIntrinsics.h"
#include "IREquality.h"
#include "IRMutator.h"
#include "IROperator.h"
#include "IRPrinter.h"
#include "IRVisitor.h"
#include "ModulusRemainder.h"
#include "Simplify.h"
#include "Substitute.h"
#include <fstream>
#include <map>
#include <set>
#include <stack>

#include <chrono>

#include "HydrideCodeGen.h"

namespace Halide {

namespace Internal {

void hydride_generate_llvm_bitcode(Target::Arch t, std::string input_file, std::string output_file, std::string benchmark_name) {

    std::string target_flag = "";

    switch (t) {
    case Target::X86:
        target_flag = "-x86-hydride-legalize";
        break;
    case Target::Hexagon:
        target_flag = "-hex-hydride-legalize";
        break;
    case Target::ARM:
        target_flag = "-arm-hydride-legalize";
        break;
    default:
        assert(false && "Unsupported target for hydride code-generation");
        break;
    };

    const char *hydride_src = getenv("HYDRIDE_ROOT");
    assert(hydride_src && "HYDRIDE_ROOT environment variable needs to be defined for codegen");

    const char *legalizer_so = getenv("LEGALIZER_PATH");
    assert(legalizer_so && "LEGALIZER_PATH environment variable must be defined for hydride codegen");

    const char *intrin_wrapper = getenv("INTRINSICS_LL");
    assert(intrin_wrapper && "INTRINSICS_LL must be defined for hydride llvm code-gen");

    std::string codegen_script_path = std::string(hydride_src) + "/codegen-generator/tools/low-level-codegen/RoseLowLevelCodeGen.py";

    std::string cmd = "python3 " + codegen_script_path + " " + input_file + " " + std::string(legalizer_so) + " " + std::string(intrin_wrapper) + " " + target_flag + " " + output_file;
    debug(0) << cmd << "\n";

    auto start = std::chrono::system_clock::now();

    int ret_code = system(cmd.c_str());

    internal_assert(ret_code == 0) << "Codegeneration crashed, exiting ..."
                                   << "\n";

    auto end = std::chrono::system_clock::now();
    std::cout << "Compilation completed with return code:\t" << ret_code << "\n";

    std::chrono::duration<double> elapsed_seconds = end - start;

    std::cout << "Compilation took " << elapsed_seconds.count() << "seconds ..."
              << "\n";

    // TEMP CMD
    std::string temp_cmd = "cp /tmp/" + benchmark_name + ".ll.legalize.ll  " + output_file;
    ret_code = system(temp_cmd.c_str());

    debug(0) << "Returned with return code: " << ret_code << "\n";

    internal_assert(ret_code == 0) << "Copying crashed, exiting ..."
                                   << "\n";
}

}  // namespace Internal

}  // namespace Halide
