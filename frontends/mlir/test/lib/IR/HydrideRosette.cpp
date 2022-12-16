#include "mlir/Dialect/Arithmetic/IR/Arithmetic.h"
#include "mlir/IR/BuiltinOps.h"
#include "mlir/IR/BuiltinTypes.h"
#include "mlir/Pass/Pass.h"
#include <fstream>
#include <map>
#include <regex>
#include <set>
#include <stack>
#include <string>

using namespace mlir;

namespace {
struct HydrideRosettePass
    : public PassWrapper<HydrideRosettePass, OperationPass<>> {
  MLIR_DEFINE_EXPLICIT_INTERNAL_INLINE_TYPE_ID(HydrideRosettePass)

  StringRef getArgument() const final { return "hydride-rosette"; }
  StringRef getDescription() const final { return "Hydride Rosette"; }

  //>>>>>>>>>>>>>>>>> Hydride Decls

  enum MLIRValueEncoding {
    Bitvector,
    Integer
  }; // Whether MLIR value should be represented as int or bv
  typedef std::map<std::string, MLIRValueEncoding>
      Encoding; // map for name of encoding

  std::map<unsigned, Value *>
      RegToVariableMap; // Map racket register expressions to MLIR Values
  std::map<Value *, unsigned>
      VariableToRegMap; // Map MLIR Values to racket register expressions

  std::map<unsigned, Value *>
      RegToLoadMap; // Map racket register expressions to MLIR Values
  std::map<Value *, unsigned>
      LoadToRegMap; // Map MLIR Values to racket register expressions

  std::set<Value *>
      SkipValues; // Certain values we are skipping as handled by LLVM;

  std::stack<int> indent;
  std::stack<MLIRValueEncoding> mode; // encoding mode
  std::set<std::string> defined;      // Values already defined as variables

  std::map<std::string, arith::ConstantOp *>
      constant_vars; // treat constants as let expressions

  Encoding encoding;

  std::string tabs() {
    std::string ret = "";
    for (int i = 0; i < indent.top(); i++)
      ret += " ";
    return ret;
  }

  std::string NYI() {
    llvm::outs() << "\nNYI. \n";
    exit(0);
    return "";
  }

  // let_vars = lvs;
  // encoding = enc;

  std::string ValueToStr(Value *val, bool use_loc) {

    if (use_loc) {
      std::string locStr;
      llvm::raw_string_ostream locOS(locStr);
      locOS << val->getLoc();
      std::string loc_out = locOS.str();
      unsigned first = loc_out.find_last_of(':') + 1;
      unsigned last = loc_out.find_last_of(')');
      return "var_" + loc_out.substr(first, last - first);
    }
    return "";
  }

  std::string MlirValVisit(Value *val) {
    std::string LocAsVarName = ValueToStr(val, true);
    auto valDefiningOp = val->getDefiningOp();
    if (valDefiningOp != NULL) {
      if (valDefiningOp->getDialect() != NULL &&
          valDefiningOp->getDialect()->getNamespace() == "arith") {
        return MLIRArithOpVisit(valDefiningOp);
      } else {
        if (SkipValues.find(val) != SkipValues.end()) {
          return "";
        }
        if (defined.find(LocAsVarName) != defined.end()) {
          return tabs() + LocAsVarName;
        }

        if (VariableToRegMap.find(val) != VariableToRegMap.end()) {
          std::string reg_name = "reg_" + std::to_string(VariableToRegMap[val]);
          return tabs() + reg_name;
        }

        unsigned reg_counter = (RegToLoadMap.size() + RegToVariableMap.size());

        std::string reg_name = "reg_" + std::to_string(reg_counter);

        llvm::outs() << LocAsVarName << " maps to " << reg_name << "\n";

        RegToVariableMap[reg_counter] = val;
        VariableToRegMap[val] = reg_counter;
        return tabs() + reg_name; // op->name;
      }
    }

    if (val->isa<BlockArgument>()) {
      if (SkipValues.find(val) != SkipValues.end()) {
        return "";
      }

      if (defined.find(LocAsVarName) != defined.end()) {
        return tabs() + LocAsVarName;
      }

      if (VariableToRegMap.find(val) != VariableToRegMap.end()) {
        std::string reg_name = "reg_" + std::to_string(VariableToRegMap[val]);
        return tabs() + reg_name;
      }

      unsigned reg_counter = (RegToLoadMap.size() + RegToVariableMap.size());

      std::string reg_name = "reg_" + std::to_string(reg_counter);
      llvm::outs() << LocAsVarName << " maps to " << reg_name << "\n";

      RegToVariableMap[reg_counter] = val;
      VariableToRegMap[val] = reg_counter;

      return tabs() + reg_name; // op->name;
    }

    return "";
  }

  std::string print_binary_op(std::string bv_name, Value a, Value b,
                              bool is_vector_op) {

    if (is_vector_op) {
      indent.push(indent.top() + 1);
      std::string rkt_lhs = MlirValVisit(&a);
      std::string rkt_rhs = MlirValVisit(&b);
      indent.pop();
      return tabs() + "(vec-" + bv_name + "\n" + rkt_lhs + "\n" + rkt_rhs + ")";
    } else {
      std::string rkt_lhs = MlirValVisit(&a);
      std::string rkt_rhs = MlirValVisit(&b);
      return "(sca-" + bv_name + " " + rkt_lhs + " " + rkt_rhs + ")";
    }
  }

  std::string MLIRArithOpVisit(Operation *op) {
    if (isa<arith::AddIOp>(op)) {
      Value a = op->getOperand(0);
      Value b = op->getOperand(1);
      /* if (SkipValues.find(op->dyn_cast<Value>()) != SkipValues.end()) {
        SkipValues.insert(a);
        SkipValues.insert(b);
        return "";
      } */
      // llvm::outs() << "emitting add\n";
      bool is_vec = op->getResult(0).getType().isa<VectorType>();
      std::string ret_str = print_binary_op("add", a, b, is_vec);
      return ret_str;
    }

    if (isa<arith::AndIOp>(op)) {
      Value a = op->getOperand(0);
      Value b = op->getOperand(1);
      /* if (SkipValues.find(op->dyn_cast<Value>()) != SkipValues.end()) {
        SkipValues.insert(a);
        SkipValues.insert(b);
        return "";
      } */
      // llvm::outs() << "emitting and\n";
      bool is_vec = op->getResult(0).getType().isa<VectorType>();
      std::string ret_str = print_binary_op("bwand", a, b, is_vec);
      return ret_str;
    }

    if (isa<arith::BitcastOp>(op)) {
      // get bitwisth and call corr. cast op
    }

    if (isa<arith::CeilDivSIOp>(op)) {

      // add logic for signed/unsigned if not handled properly
      Value a = op->getOperand(0);
      Value b = op->getOperand(1);
      /* if (SkipValues.find(op->dyn_cast<Value>()) != SkipValues.end()) {
        SkipValues.insert(a);
        SkipValues.insert(b);
        return "";
      } */
      // llvm::outs() << "emitting and\n";
      bool is_vec = op->getResult(0).getType().isa<VectorType>();
      std::string ret_str = print_binary_op("div", a, b, is_vec);
      return ret_str;
    }
    if (isa<arith::CeilDivUIOp>(op)) {
      // add logic for signed/unsigned if not handled properly
      Value a = op->getOperand(0);
      Value b = op->getOperand(1);
      /* if (SkipValues.find(op->dyn_cast<Value>()) != SkipValues.end()) {
        SkipValues.insert(a);
        SkipValues.insert(b);
        return "";
      } */
      // llvm::outs() << "emitting and\n";
      bool is_vec = op->getResult(0).getType().isa<VectorType>();
      std::string ret_str = print_binary_op("div", a, b, is_vec);
      return ret_str;
    }
    if (isa<arith::CmpIOp>(op)) {
    }

    if (isa<arith::DivSIOp>(op)) {
    }
    if (isa<arith::DivUIOp>(op)) {
    }
    if (isa<arith::ExtSIOp>(op)) {
    }
    if (isa<arith::ExtUIOp>(op)) {
    }
    if (isa<arith::FloorDivSIOp>(op)) {
    }
    if (isa<arith::IndexCastOp>(op)) {
    }
    if (isa<arith::MaxSIOp>(op)) {
    }

    if (isa<arith::MaxUIOp>(op)) {
    }

    if (isa<arith::MinSIOp>(op)) {
    }

    if (isa<arith::MinUIOp>(op)) {
    }

    if (isa<arith::MulIOp>(op)) {
    }

    if (isa<arith::OrIOp>(op)) {
    }

    if (isa<arith::RemSIOp>(op)) {
    }

    if (isa<arith::RemUIOp>(op)) {
    }

    if (isa<arith::ShLIOp>(op)) {
    }

    if (isa<arith::ShRSIOp>(op)) {
    }

    if (isa<arith::ShRUIOp>(op)) {
    }

    if (isa<arith::SubIOp>(op)) {
      Value a = op->getOperand(0);
      Value b = op->getOperand(1);
      /* if (SkipValues.find(op->dyn_cast<Value>()) != SkipValues.end()) {
        SkipValues.insert(a);
        SkipValues.insert(b);
        return "";
      } */
      // llvm::outs() << "emitting and\n";
      bool is_vec = op->getResult(0).getType().isa<VectorType>();
      std::string ret_str = print_binary_op("sub", a, b, is_vec);
      return ret_str;
    }

    if (isa<arith::XOrIOp>(op)) {
    }

    if (isa<arith::SelectOp>(op)) {
    }

    if (isa<arith::ConstantOp>(op)) {
      // int-imm or let?
      auto a = op->getAttrOfType<IntegerAttr>("value").getValue();
      std::string AttrStr;
      llvm::raw_string_ostream AttrOS(AttrStr);
      AttrOS << a;
      return AttrOS.str();
    }

    return "";
  }

  // <<<<<<<<<<<<<<<

  void runOnOperation() override {
    indent.push(1);
    mode.push(MLIRValueEncoding::Bitvector);
    Operation *op = getOperation();
    recurseOperation(op);
  }

  void recurseOperation(Operation *op) {
    if (op->getDialect() != NULL &&
        op->getDialect()->getNamespace() == "arith") {
      llvm::outs() << MLIRArithOpVisit(op) << "\n";
    }
    for (Region &region : op->getRegions())
      recurseRegion(region);
  }

  void recurseRegion(Region &region) {
    for (Block &block : region.getBlocks())
      recurseBlock(block);
  }

  void recurseBlock(Block &block) {
    for (Operation &op : block.getOperations())
      recurseOperation(&op);
  }
};
} // namespace

namespace mlir {
void registerHydrideRosettePass() { PassRegistration<HydrideRosettePass>(); }
} // namespace mlir
