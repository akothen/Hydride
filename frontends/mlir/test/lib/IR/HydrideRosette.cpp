#include "mlir/Dialect/Arithmetic/IR/Arithmetic.h"
#include "mlir/Dialect/Vector/IR/VectorOps.h"
#include "mlir/IR/BuiltinOps.h"
#include "mlir/IR/BuiltinTypes.h"
#include "mlir/Pass/Pass.h"
#include "llvm/Support/Debug.h"

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

  std::map<unsigned, void *> RegToVariableMap;
  std::map<void *, unsigned> VariableToRegMap;

  std::map<unsigned, Value *> RegToLoadMap;
  std::map<Value *, unsigned> LoadToRegMap;

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

  std::string stringifyType(Type type) {
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

  std::string mlir_type_to_synth_elem(Type type, bool include_space,
                                      bool c_plus_plus) {
    bool needs_space = true;
    std::ostringstream oss;
    if (auto intType = type.dyn_cast<IntegerType>()) {
      if (intType.isUnsigned()) {
        oss << "u";
      }
      oss << "int" << std::to_string(intType.getWidth());
    }

    if (include_space && needs_space) {
      oss << " ";
    }
    return oss.str();
  }

  std::string signedOrUnsignedIntStr(Type type) {
    if (auto intType = type.dyn_cast<IntegerType>()) {
      if (intType.isSignlessInteger())
        return "#t";
    }
    return "#f";
  }

  std::string print_binary_op(std::string bv_name, Value a, Value b,
                              bool is_vector_op) {

    if (is_vector_op) {
      indent.push(indent.top() + 1);
      std::string rkt_lhs = MlirValVisit(&a);
      std::string rkt_rhs = MlirValVisit(&b);
      indent.pop();
      return tabs() + "(vec-" + bv_name + " " + rkt_lhs + rkt_rhs + ")";
    } else {
      std::string rkt_lhs = MlirValVisit(&a);
      std::string rkt_rhs = MlirValVisit(&b);
      return "(sca-" + bv_name + " " + rkt_lhs + " " + rkt_rhs + ")";
    }
  }

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
    void *valAsOpaquePointer = val->getAsOpaquePointer();
    auto valDefiningOp = val->getDefiningOp();
    if (valDefiningOp != NULL) {
      if (valDefiningOp->getDialect() != NULL &&
          valDefiningOp->getDialect()->getNamespace() == "arith") {
        return MLIROpVisit(valDefiningOp);
      } else {
        if (defined.find(LocAsVarName) != defined.end()) {
          return LocAsVarName;
        }

        if (VariableToRegMap.find(valAsOpaquePointer) !=
            VariableToRegMap.end()) {
          std::string reg_name =
              "reg_" + std::to_string(VariableToRegMap[valAsOpaquePointer]);
          return tabs() + reg_name;
        }

        unsigned reg_counter = (RegToLoadMap.size() + RegToVariableMap.size());

        std::string reg_name = "reg_" + std::to_string(reg_counter);

        RegToVariableMap[reg_counter] = valAsOpaquePointer;
        VariableToRegMap[valAsOpaquePointer] = reg_counter;
        return tabs() + reg_name; // op->name;
      }
    }

    if (val->isa<BlockArgument>()) {

      if (defined.find(LocAsVarName) != defined.end()) {
        return LocAsVarName;
      }

      if (VariableToRegMap.find(valAsOpaquePointer) != VariableToRegMap.end()) {
        std::string reg_name =
            "reg_" + std::to_string(VariableToRegMap[valAsOpaquePointer]);
        return reg_name;
      }

      unsigned reg_counter = (RegToLoadMap.size() + RegToVariableMap.size());

      std::string reg_name = "reg_" + std::to_string(reg_counter);

      RegToVariableMap[reg_counter] = valAsOpaquePointer;
      VariableToRegMap[valAsOpaquePointer] = reg_counter;

      return reg_name; // op->name;
    }

    return "";
  }

  std::string MLIROpVisit(Operation *op) {
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
      bool is_vec = op->getResult(0).getType().isa<VectorType>();
      std::string ret_str = print_binary_op("and", a, b, is_vec);
      return ret_str;
    }

    if (isa<arith::BitcastOp>(op)) {
      // get bitwisth and call corr. cast op
    }

    if (isa<arith::CeilDivSIOp>(op)) {

      // add logic for signed/unsigned if not handled properly
      Value a = op->getOperand(0);
      Value b = op->getOperand(1);
      bool is_vec = op->getResult(0).getType().isa<VectorType>();
      std::string ret_str = print_binary_op("div", a, b, is_vec);
      return ret_str;
    }
    if (isa<arith::CeilDivUIOp>(op)) {
      // add logic for signed/unsigned if not handled properly
      Value a = op->getOperand(0);
      Value b = op->getOperand(1);
      bool is_vec = op->getResult(0).getType().isa<VectorType>();
      std::string ret_str = print_binary_op("div", a, b, is_vec);
      return ret_str;
    }
    if (isa<arith::CmpIOp>(op)) {
      Value a = op->getOperand(0);
      Value b = op->getOperand(1);
      bool is_vec = a.getType().dyn_cast<VectorType>() ? true : false;

      arith::CmpIOp cmp_op = dyn_cast<arith::CmpIOp>(op);
      auto pred = cmp_op.getPredicate();
      std::string ret_str;
      // signed.unsigned
      switch (pred) {
      case (arith::CmpIPredicate::eq): {
        ret_str = print_binary_op("eq", a, b, is_vec);
        return ret_str;
      }
      case (arith::CmpIPredicate::ne): {
        ret_str = print_binary_op("eq", a, b, is_vec);
        return ret_str;
      }
      case (arith::CmpIPredicate::uge): {
        ret_str = print_binary_op("ge", a, b, is_vec);
        return ret_str;
      }
      case (arith::CmpIPredicate::ugt): {
        ret_str = print_binary_op("gt", a, b, is_vec);
        return ret_str;
      }
      case (arith::CmpIPredicate::ule): {
        ret_str = print_binary_op("le", a, b, is_vec);
        return ret_str;
      }
      case (arith::CmpIPredicate::ult): {
        ret_str = print_binary_op("lt", a, b, is_vec);
        return ret_str;
      }
      case (arith::CmpIPredicate::sge): {
        ret_str = print_binary_op("ge", a, b, is_vec);
        return ret_str;
      }
      case (arith::CmpIPredicate::sgt): {
        ret_str = print_binary_op("gt", a, b, is_vec);
        return ret_str;
      }
      case (arith::CmpIPredicate::sle): {
        ret_str = print_binary_op("le", a, b, is_vec);
        return ret_str;
      }
      case (arith::CmpIPredicate::slt): {
        ret_str = print_binary_op("lt", a, b, is_vec);
        return ret_str;
      }
      default:
        break;
      }

      return "Unsupported Predicate";
    }

    if (isa<arith::DivSIOp>(op)) {
      Value a = op->getOperand(0);
      Value b = op->getOperand(1);
      bool is_vec = op->getResult(0).getType().isa<VectorType>();
      std::string ret_str = print_binary_op("div", a, b, is_vec);
      return ret_str;
    }

    if (isa<arith::DivUIOp>(op)) {
      Value a = op->getOperand(0);
      Value b = op->getOperand(1);
      bool is_vec = op->getResult(0).getType().isa<VectorType>();
      std::string ret_str = print_binary_op("div", a, b, is_vec);
      return ret_str;
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
      Value a = op->getOperand(0);
      Value b = op->getOperand(1);
      bool is_vec = op->getResult(0).getType().isa<VectorType>();
      std::string ret_str = print_binary_op("max", a, b, is_vec);
      return ret_str;
    }

    if (isa<arith::MaxUIOp>(op)) {
      Value a = op->getOperand(0);
      Value b = op->getOperand(1);
      bool is_vec = op->getResult(0).getType().isa<VectorType>();
      std::string ret_str = print_binary_op("max", a, b, is_vec);
      return ret_str;
    }

    if (isa<arith::MinSIOp>(op)) {
      Value a = op->getOperand(0);
      Value b = op->getOperand(1);
      bool is_vec = op->getResult(0).getType().isa<VectorType>();
      std::string ret_str = print_binary_op("min", a, b, is_vec);
      return ret_str;
    }

    if (isa<arith::MinUIOp>(op)) {
      Value a = op->getOperand(0);
      Value b = op->getOperand(1);
      bool is_vec = op->getResult(0).getType().isa<VectorType>();
      std::string ret_str = print_binary_op("min", a, b, is_vec);
      return ret_str;
    }

    if (isa<arith::MulIOp>(op)) {
      Value a = op->getOperand(0);
      Value b = op->getOperand(1);
      bool is_vec = op->getResult(0).getType().isa<VectorType>();
      std::string ret_str = print_binary_op("mul", a, b, is_vec);
      return ret_str;
    }

    if (isa<arith::OrIOp>(op)) {
      Value a = op->getOperand(0);
      Value b = op->getOperand(1);
      bool is_vec = op->getResult(0).getType().isa<VectorType>();
      std::string ret_str = print_binary_op("or", a, b, is_vec);
      return ret_str;
    }

    if (isa<arith::RemSIOp>(op)) {
    }

    if (isa<arith::RemUIOp>(op)) {
    }

    if (isa<arith::ShLIOp>(op)) {
      Value a = op->getOperand(0);
      Value b = op->getOperand(1);
      bool is_vec = op->getResult(0).getType().isa<VectorType>();
      std::string ret_str = print_binary_op("shl", a, b, is_vec);
      return ret_str;
    }

    if (isa<arith::ShRSIOp>(op)) {
      Value a = op->getOperand(0);
      Value b = op->getOperand(1);
      bool is_vec = op->getResult(0).getType().isa<VectorType>();
      std::string ret_str = print_binary_op("shr", a, b, is_vec);
      return ret_str;
    }

    if (isa<arith::ShRUIOp>(op)) {
      Value a = op->getOperand(0);
      Value b = op->getOperand(1);
      bool is_vec = op->getResult(0).getType().isa<VectorType>();
      std::string ret_str = print_binary_op("shr", a, b, is_vec);
      return ret_str;
    }

    if (isa<arith::SubIOp>(op)) {
      Value a = op->getOperand(0);
      Value b = op->getOperand(1);
      bool is_vec = op->getResult(0).getType().isa<VectorType>();
      std::string ret_str = print_binary_op("sub", a, b, is_vec);
      return ret_str;
    }

    if (isa<arith::TruncIOp>(op)) {
    }

    if (isa<arith::XOrIOp>(op)) {
    }

    if (isa<arith::SelectOp>(op)) {

      bool is_vec = op->getResult(0).getType().isa<VectorType>();
      Value cond = op->getOperand(0);
      Value true_val = op->getOperand(1);
      Value false_val = op->getOperand(2);
      if (is_vec) {
        indent.push(indent.top() + 1);
        std::string rkt_cond = MlirValVisit(&cond);
        std::string rkt_true = MlirValVisit(&true_val);
        std::string rkt_false = MlirValVisit(&false_val);
        indent.pop();
        return tabs() + "(vec-if" + rkt_cond + "\n" + rkt_true + "\n" +
               rkt_false + ")";
      } else if (mode.top() == MLIRValueEncoding::Bitvector) {
        std::string rkt_cond = MlirValVisit(&cond);
        std::string rkt_true = MlirValVisit(&true_val);
        std::string rkt_false = MlirValVisit(&false_val);
        return tabs() + "(sca-if " + rkt_cond + " " + rkt_true + " " +
               rkt_false + ")";

      } else {
        std::string rkt_cond = MlirValVisit(&cond);
        std::string rkt_true = MlirValVisit(&true_val);
        std::string rkt_false = MlirValVisit(&false_val);
        return tabs() + "(if " + rkt_cond + " " + rkt_true + " " + rkt_false +
               ")";
      }
    }
    if (isa<arith::ConstantOp>(op)) {
      // Set the correct encoding mode

      auto a = op->getAttrOfType<IntegerAttr>("value").getValue();
      std::string AttrStr;
      llvm::raw_string_ostream AttrOS(AttrStr);
      AttrOS << a;
      auto intTy = op->getResult(0).getType();
      std::string reg_name = "(int-imm (bv " + AttrOS.str() + " " +
                             stringifyType(intTy) + ") " +
                             signedOrUnsignedIntStr(intTy) + ")";
      return reg_name;
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
      llvm::outs() << MLIROpVisit(op) << "\n";
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

class HydrideSynthEmitter {
public:
  std::string get_synthlog_hash_filepath(int id) {
    if (id < 0) {
      const char *initial_hash = getenv(" HYDRIDE_INITIAL_HASH");
      if (initial_hash) {
        return std::string(initial_hash) + ".rkt";

      } else {
        return "";
      }

    } else {
      return "hydride_hash_" + std::to_string(id) + ".rkt";
    }
  }

  std::string get_synthlog_hash_name(int id) {

    if (id < 0) {
      const char *initial_hash = getenv("HYDRIDE_INITIAL_HASH");
      if (initial_hash) {
        return std::string(initial_hash);
      } else {
        return "";
      }
    } else {
      return "synth_hash_" + std::to_string(id);
    }
  }

/*   std::string define_load_buffer(vector::LoadOp *op) {
    std::string reg_name = "reg_" + std::to_string(LoadToRegMap[op]);
    size_t bitwidth = 0;
    auto vecType = type.dyn_cast<VectorType>();
    if (vecType) {
      bitwidth = vecType.getElementTypeBitWidth() * vecType.getNumElements();
    }

    std::string elemT = "'" + mlir_type_to_synth_elem(vecType.getElementType(), false, true);

   /*  if (elemT == "'") {
      debug(0) << "Define_load_buffer escaping early for " << reg_name
               << "of bitwidth " << bitwidth << "\n";
      return "";
    } 

    std::string define_bitvector_str = "(define " + reg_name + "_bitvector" +
                                       " " + "(bv 0 (bitvector " +
                                       std::to_string(bitwidth) + ")" + "))";

    // todo: mlir interpreter for create-buffer
    std::string define_buffer_str = "(define " + reg_name +
                                    " (mlir:create-buffer " + reg_name +
                                    "_bitvector " + elemT + ")" + ")";

    return define_bitvector_str + "\n" + define_buffer_str;
  } */
};
} // namespace

namespace mlir {
void registerHydrideRosettePass() { PassRegistration<HydrideRosettePass>(); }
} // namespace mlir
