#include "mlir/Dialect/Arithmetic/IR/Arithmetic.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/Dialect/Vector/IR/VectorOps.h"
#include "mlir/IR/BuiltinOps.h"
#include "mlir/IR/BuiltinTypes.h"
#include "mlir/Pass/Pass.h"
#include "mlir/Support/FileUtilities.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/ToolOutputFile.h"

#include <fstream>
#include <iostream>
#include <map>
#include <regex>
#include <set>
#include <stack>
#include <string>

using namespace mlir;

enum MLIRValueEncoding {
  Bitvector,
  Integer
}; // Whether MLIR value should be represented as int or bv

typedef std::map<std::string, MLIRValueEncoding>
    Encoding; // map for name of encoding

std::map<unsigned, void *> RegToVariableMap;
std::map<void *, unsigned> VariableToRegMap;

std::map<unsigned, vector::LoadOp> RegToLoadMap;
std::map<vector::LoadOp, unsigned> LoadToRegMap;

std::stack<int> indent;
std::stack<MLIRValueEncoding> mode; // encoding mode
std::set<std::string> defined;      // Values already defined as variables

std::map<std::string, arith::ConstantOp *>
    constant_vars; // treat constants as let expressions

Encoding encoding;

namespace {
struct HydrideRosettePass
    //  : public PassWrapper<HydrideRosettePass, OperationPass<>> {
    : public PassWrapper<HydrideRosettePass, OperationPass<>> {
  MLIR_DEFINE_EXPLICIT_INTERNAL_INLINE_TYPE_ID(HydrideRosettePass)

  StringRef getArgument() const final { return "hydride-rosette"; }
  StringRef getDescription() const final { return "Hydride Rosette"; }

public:
  class HydrideSynthEmitter {
  public:
    HydrideSynthEmitter(std::string benchmark_name)
        : benchmark_name(benchmark_name) {}

    std::string benchmark_name;

    std::string emit_set_current_bitwidth() {
      const char *bitwidth = getenv("HL_SYNTH_BW");
      if (bitwidth) {
        std::string str = bitwidth;
        int bw = stoi(str);

        if (bw > 0) {
          return "(current-bitwidth " + std::to_string(bw) + ")";
        }
      }
      return "";
    }

    std::string emit_set_memory_limit(size_t MB) {
      return "(custodian-limit-memory (current-custodian) (* " +
             std::to_string(MB) + " 1024 1024))";
    }

    std::string mlir_type_to_synth_elem(mlir::Type type, bool include_space,
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

    std::string define_load_buffer(vector::LoadOp op) {
      // std::string reg_name = "reg_";
      std::string reg_name = "reg_" + std::to_string(LoadToRegMap[op]);
      size_t bitwidth = 0;
      auto vecType = op.getResult().getType().dyn_cast<VectorType>();
      std::string elemT = "'";
      if (vecType && vecType.getElementType()) {
        bitwidth = vecType.getElementTypeBitWidth() * vecType.getNumElements();
        llvm::outs() << "bitwidth is: " << bitwidth << "\n";
        elemT += mlir_type_to_synth_elem(vecType.getElementType(), false, true);
        // llvm::outs() << "elemT is: " << elemT << "\n";
      }

      if (elemT == "'") {
        /* llvm::outs() << "Define_load_buffer escaping early for " << reg_name
                     << "of bitwidth " << bitwidth << "\n"; */
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
    }

    //>>>>>>>>>>>>>>>>> Hydride Decls
    std::string define_variable_buffer(void *val_ptr) {
      // std::string reg_name = "reg_";
      auto val = Value::getFromOpaquePointer(val_ptr);
      std::string reg_name = "reg_" + std::to_string(VariableToRegMap[val_ptr]);
      size_t bitwidth = 0;
      auto vecType = val.getType().dyn_cast<VectorType>();
      std::string elemT = "'";
      if (vecType && vecType.getElementType()) {
        bitwidth = vecType.getElementTypeBitWidth() * vecType.getNumElements();
        elemT = mlir_type_to_synth_elem(vecType.getElementType(), false, true);
      }

      if (elemT == "'") {
        llvm::outs() << "Define_variable_buffer escaping early for " << reg_name
                     << "of bitwidth " << bitwidth << "\n";
        return "";
      }

      std::string define_bitvector_str = "(define " + reg_name + "_bitvector" +
                                         " " + "(bv 0 (bitvector " +
                                         std::to_string(bitwidth) + ")" + "))";
      std::string define_buffer_str = "(define " + reg_name +
                                      " (mlir:create-buffer " + reg_name +
                                      "_bitvector " + elemT + ")" + ")";

      return define_bitvector_str + "\n" + define_buffer_str;
    }

    std::string get_reg_id(int reg_id) {
      return "(bv " + std::to_string(reg_id) + " (bitvector 8))";
    }

    std::string emit_buffer_id_map(std::string map_name) {
      std::string comment =
          "; Creating a map between buffers and mlir call node arguments\n";
      std::string define_buff_map =
          "(define " + map_name + " (make-hash))" + "\n";
      std::string add_entry = "";

      for (auto bi = LoadToRegMap.begin(); bi != LoadToRegMap.end(); bi++) {
        unsigned id = bi->second;
        add_entry += "(hash-set! " + map_name + " " + "reg_" +
                     std::to_string(id) + " " + get_reg_id(id) + ")" + "\n";
      }

      for (auto bi = VariableToRegMap.begin(); bi != VariableToRegMap.end();
           bi++) {
        unsigned id = bi->second;
        add_entry += "(hash-set! " + map_name + " " + "reg_" +
                     std::to_string(id) + " " + get_reg_id(id) + ")" + "\n";
      }

      return comment + define_buff_map + add_entry;
    }

    std::string emit_symbolic_buffers() {
      std::string buffers = "";
      for (auto bi = LoadToRegMap.begin(); bi != LoadToRegMap.end(); bi++) {
        const vector::LoadOp loadOp = bi->first;
        buffers += define_load_buffer(loadOp) + "\n";
      }

      for (auto bi = VariableToRegMap.begin(); bi != VariableToRegMap.end();
           bi++) {
        auto val = bi->first;
        buffers += define_variable_buffer(val) + "\n";
      }

      return buffers;
    }

    std::string emit_symbolic_buffers_vector(std::string vector_name) {
      std::string buffers = "(define " + vector_name + " (vector ";
      for (auto bi = LoadToRegMap.begin(); bi != LoadToRegMap.end(); bi++) {
        const vector::LoadOp loadOp = bi->first;
        buffers += "reg_" + std::to_string(LoadToRegMap[loadOp]) + " ";
      }

      buffers += "))";
      return buffers;
    }

    std::string emit_racket_imports() {
      llvm::outs() << "emit racket imports \n";
      return "#lang rosette\n \
                            (require rosette/lib/synthax)\n \
                            (require rosette/lib/angelic)\n \
                            (require racket/pretty)\n \
                            (require data/bit-vector)\n \
                            (require rosette/lib/destruct)\n \
                            (require rosette/solver/smt/boolector)\n \
                            (require hydride)\n ";
    }

    std::string emit_hydride_synthesis(std::string expr_name, size_t expr_depth,
                                       size_t VF, std::string id_map_name,
                                       std::string synth_log_path,
                                       std::string synth_log_name,
                                       std::string target) {

      std::string solver = "'z3";
      const char *hydride_solver = getenv("HYDRIDE_SOLVER");

      if (hydride_solver) {
        solver = hydride_solver;
      }

      std::string optimize = "#t";
      std::string symbolic = "#f";

      return "(synthesize-mlir-expr " + expr_name + " " + id_map_name + " " +
             std::to_string(expr_depth) + " " + std::to_string(VF) + " " +
             solver + " " + optimize + " " + symbolic + "  \"" +
             synth_log_path + "\"  \"" + synth_log_name + "\"  \"" + target +
             "\")";
    }

    std::string emit_interpret_expr(std::string expr_name) {
      return "(mlir:interpret " + expr_name + ")";
    }

    std::string emit_assemble_result(std::string result_name,
                                     std::string expr_name, size_t lanes) {
      return "(define " + result_name + " (mlir:assemble-bitvector " +
             emit_interpret_expr(expr_name) + " " + std::to_string(lanes) +
             ")" + ")";
    }

    std::string emit_write_synth_log_to_file(std::string fpath,
                                             std::string hash_name) {
      return "(save-synth-map \"" + fpath + "\" \"" + hash_name +
             "\" synth-log)";
    }

    std::string emit_compile_to_llvm(std::string expr_name,
                                     std::string map_name,
                                     std::string call_name,
                                     std::string bitcode_path) {
      std::string comment =
          "; Translate synthesized hydride-expression into LLVM-IR";
      std::string command = "(compile-to-llvm " + expr_name + " " + map_name +
                            " \"" + call_name + "\" \"" + bitcode_path +
                            "\")\n";

      return comment + "\n" + command;
    }
  };

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
      std::string rkt_lhs = MLIRValVisit(a);
      std::string rkt_rhs = MLIRValVisit(b);
      indent.pop();
      return "(vec-" + bv_name + " " + rkt_lhs + " " + rkt_rhs + ")";
    } else {

      std::string rkt_lhs = MLIRValVisit(a);

      std::string rkt_rhs = MLIRValVisit(b);
      return "(sca-" + bv_name + " " + rkt_lhs + " " + rkt_rhs + ")";
    }
  }

  std::string ValueToStr(Value val, bool use_loc) {

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

  std::string MLIRValVisit(Value val) {
    // std::string LocAsVarName = ValueToStr(val, true);
    void *valAsOpaquePointer = val.getAsOpaquePointer();
    auto valDefiningOp = val.getDefiningOp();
    if (valDefiningOp != NULL) {
      if (valDefiningOp->getDialect() != NULL &&
          valDefiningOp->getDialect()->getNamespace() == "arith") {
        return MLIROpVisit(valDefiningOp);
      } else {

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

    if (val.isa<BlockArgument>()) {

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
    if (op->getDialect() != NULL) {

      if (op->getDialect()->getNamespace() == "vector") {

        if (auto loadOp = dyn_cast<vector::LoadOp>(op)) {

          bool is_sca = loadOp->getResult(0).getType().isa<IntegerType>();

          if (LoadToRegMap.find(loadOp) != LoadToRegMap.end()) {
            return "reg_" + std::to_string(LoadToRegMap[loadOp]);
          }

          if (is_sca) {
            auto intType =
                loadOp->getResult(0).getType().dyn_cast<VectorType>();
            std::string bits =
                std::to_string(intType.getElementTypeBitWidth() * 1);
            unsigned reg_counter =
                RegToLoadMap.size() + RegToVariableMap.size();
            std::string reg_name = "reg_" + std::to_string(reg_counter);
            RegToLoadMap[reg_counter] = loadOp;
            LoadToRegMap[loadOp] = reg_counter;
            return tabs() + reg_name;
          } else {

            auto vecType =
                loadOp->getResult(0).getType().dyn_cast<VectorType>();
            std::string bits = std::to_string(vecType.getElementTypeBitWidth() *
                                              vecType.getNumElements());
            unsigned reg_counter =
                RegToLoadMap.size() + RegToVariableMap.size();
            std::string reg_name = "reg_" + std::to_string(reg_counter);
            RegToLoadMap[reg_counter] = loadOp;
            LoadToRegMap[loadOp] = reg_counter;
            // std::string load_buff = define_load_buffer(op);
            return tabs() + reg_name; //+ load_buff + "\n"+ "(load " + reg_name
                                      //+ " " + rkt_idx + " " + alignment + ")";
            // return tabs() + "(load " + op->name + " " + rkt_idx + " " +
            // alignment
            // + ")";
          }
        }
      }

      if (op->getDialect()->getNamespace() == "arith") {
        if (isa<arith::AddIOp>(op)) {
          Value a = op->getOperand(0);
          Value b = op->getOperand(1);
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
            ret_str = print_binary_op("ne", a, b, is_vec);
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
            std::string rkt_cond = MLIRValVisit(cond);
            std::string rkt_true = MLIRValVisit(true_val);
            std::string rkt_false = MLIRValVisit(false_val);
            indent.pop();
            return tabs() + "(vec-if" + rkt_cond + "\n" + rkt_true + "\n" +
                   rkt_false + ")";
          } else if (mode.top() == MLIRValueEncoding::Bitvector) {
            std::string rkt_cond = MLIRValVisit(cond);
            std::string rkt_true = MLIRValVisit(true_val);
            std::string rkt_false = MLIRValVisit(false_val);
            return tabs() + "(sca-if " + rkt_cond + " " + rkt_true + " " +
                   rkt_false + ")";

          } else {
            std::string rkt_cond = MLIRValVisit(cond);
            std::string rkt_true = MLIRValVisit(true_val);
            std::string rkt_false = MLIRValVisit(false_val);
            return tabs() + "(if " + rkt_cond + " " + rkt_true + " " +
                   rkt_false + ")";
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
      }
    }

    return "";
  }

  std::vector<Operation *> ret_and_store_vec;

  // <<<<<<<<<<<<<<<

  void runOnOperation() override {
    indent.push(1);
    mode.push(MLIRValueEncoding::Bitvector);
    int expr_id = 0;
    std::string errorMessage;
    std::string outputFilename;

    getOperation()->walk([&](func::FuncOp funcOp) {
      /* llvm::outs() << "Visiting op '" << funcOp->getName() << "' with "
                   << funcOp.getNumArguments() << " operands:\n"; */
      std::string expr;
      std::string out_str;
      unsigned op_lanes = 0;
      funcOp.walk([&](Operation *op) {
        if (auto returnOp = dyn_cast<func::ReturnOp>(op)) {
          for (Value operand : op->getOperands()) {
            if (Operation *producer = operand.getDefiningOp()) {
              expr += MLIROpVisit(producer) + "\n";
            } else {

              auto blockArg = operand.cast<BlockArgument>();

              expr += MLIRValVisit(blockArg) + "\n";
            }
          }
          /* auto vecType = op->getResult(0).getType().dyn_cast<VectorType>();
          if (vecType && vecType.getElementType()) {
            op_lanes = vecType.getNumElements();
          } */
          ret_and_store_vec.push_back(op);
        }
        if (auto storeOp = dyn_cast<vector::StoreOp>(op)) {
          // get expression for the value to be stored and use as a hydride node
          // expr += MLIRValVisit(storeOp.getValueToStore()) + "\n";
          ret_and_store_vec.push_back(op);
        }
      });

      std::string benchmark_name = "expr";
      // dummy becnhamrk name
      HydrideSynthEmitter HSE(benchmark_name);

      outputFilename = std::string("mlir_expr_") + benchmark_name +
                       std::to_string(expr_id) + ".rkt";

      auto file = openOutputFile(outputFilename, &errorMessage);
      if (!file) {
        llvm::errs() << errorMessage << "\n";
        return;
      }

      out_str += HSE.emit_racket_imports() + "\n";
      out_str += HSE.emit_set_current_bitwidth() += "\n";
      out_str += HSE.emit_set_memory_limit(20000) += "\n";
      out_str += HSE.emit_symbolic_buffers() += "\n";
      out_str += HSE.emit_buffer_id_map("id-map") += "\n\n";

      out_str += "(define mlir-expr \n";
      out_str += expr + "\n";
      out_str += ")\n\n";

      out_str += "(clear-vc!)\n";

      std::string prev_hash_path = HSE.get_synthlog_hash_filepath(expr_id - 1);
      std::string prev_hash_name = HSE.get_synthlog_hash_name(expr_id - 1);

      const char *expr_depth_var = getenv("HL_EXPR_DEPTH");

      int expr_depth = 2;

      if (expr_depth_var) {
        expr_depth = (*expr_depth_var) - '0';
      }

      std::string target_str = "X86";

      out_str += "(define synth-res " +
                 HSE.emit_hydride_synthesis(
                     "mlir-expr", /* expr depth */ expr_depth,
                     /* VF*/ op_lanes, /* Reg Hash map name */ "id-map",
                     /* Previous hash file path */ prev_hash_path,
                     /* Previous hash  name */ prev_hash_name,
                     /* target id */ target_str) +
                 ")" + "\n";
      out_str += "(dump-synth-res-with-typeinfo synth-res id-map)\n";

      std::string fn_name =
          "hydride.node." + benchmark_name + "." + std::to_string(expr_id);
      out_str += HSE.emit_compile_to_llvm("synth-res", "id-map", fn_name,
                                          benchmark_name);

      std::string cur_hash_path = HSE.get_synthlog_hash_filepath(expr_id);
      std::string cur_hash_name = HSE.get_synthlog_hash_name(expr_id);

      out_str += HSE.emit_write_synth_log_to_file("/tmp/" + cur_hash_path,
                                                  cur_hash_name);

      /*    out_str += "(define (" + funcOp.getName().str() + " ";


         unsigned reg_counter = (RegToLoadMap.size() + RegToVariableMap.size());

         for (unsigned i = 0; i < reg_counter; i++) {
           out_str += "reg_" + std::to_string(i) + " ";
         }

         out_str += ")\n";

         out_str += expr + "\n";

         out_str += ")\n"; */

      file->os() << out_str;
      file->keep();

      expr_id++;
      RegToVariableMap.clear();
      VariableToRegMap.clear();
      RegToLoadMap.clear();
      LoadToRegMap.clear();
    });
  }
};

} // namespace

namespace mlir {
void registerHydrideRosettePass() { PassRegistration<HydrideRosettePass>(); }
} // namespace mlir
