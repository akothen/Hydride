

#ifndef MLIR_HYDRIDE_UTILS_H_
#define MLIR_HYDRIDE_UTILS_H_

#include "mlir/Dialect/Arithmetic/IR/Arithmetic.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/Dialect/Vector/IR/VectorOps.h"
#include "mlir/IR/BuiltinOps.h"
#include "mlir/IR/BuiltinTypes.h"
#include "mlir/IR/Operation.h"
#include "mlir/IR/OperationSupport.h"
#include "mlir/Pass/Pass.h"
#include "mlir/Support/FileUtilities.h"
#include "mlir/Transforms/Passes.h"
#include "llvm/ADT/DenseMap.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/Format.h"
#include "llvm/Support/ToolOutputFile.h"

namespace mlir {
// std::string tabs();
class Type;
class Value;

std::string NYI();

std::string stringifyType(Type type);

std::string signedOrUnsignedIntStr(Type type);

std::string ValueToStr(Value val, bool use_loc);

template <typename IntType>
static SmallVector<IntType> extractVector(ArrayAttr arrayAttr) {
  return llvm::to_vector<4>(llvm::map_range(
      arrayAttr.getAsRange<IntegerAttr>(),
      [](IntegerAttr attr) { return static_cast<IntType>(attr.getInt()); }));
}

/* class MLIROpVisitor {
public:
  MLIROpVisitor() = default;
  virtual ~MLIROpVisitor() = default;

  virtual std::string visit(arith::AddIOp addOp);
};
 */
} // namespace mlir

#endif // HYDRIDE_UTILS