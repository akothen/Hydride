#include "mlir/Transforms/HydrideUtils.h"

using namespace mlir;

/* std::string tabs(indent) {
  std::string ret = "";
  for (int i = 0; i < indent.top(); i++)
    ret += " ";
  return ret;
} */

std::string mlir::NYI() {
  llvm::outs() << "\nNYI. \n";
  exit(0);
  return "";
}

std::string mlir::stringifyType(Type type) {
  if (auto intType = type.dyn_cast<IntegerType>()) {
    if (intType.getWidth() == 64)
      return "64";
    if (intType.getWidth() == 32)
      return "32";
    if (intType.getWidth() == 16)
      return "16";
    if (intType.getWidth() == 8)
      return "8";
    if (intType.getWidth() == 4)
      return "4";
    if (intType.getWidth() == 2)
      return "2";
    if (intType.getWidth() == 1)
      return "1";
  }
  llvm_unreachable("unsupported type");
}

std::string mlir::signedOrUnsignedIntStr(Type type) {
  if (auto intType = type.dyn_cast<IntegerType>()) {
    if (intType.isSignlessInteger())
      return "#t";
  }
  return "#f";
}



std::string mlir::ValueToStr(Value val, bool use_loc) {

  if (use_loc) {
    std::string locStr;
    llvm::raw_string_ostream locOS(locStr);
    locOS << val.getLoc();
    std::string loc_out = locOS.str();
    unsigned first = loc_out.find_last_of(':') + 1;
    unsigned last = loc_out.find_last_of(')');
    return "var_" + loc_out.substr(first, last - first);
  }
  return "";
}

