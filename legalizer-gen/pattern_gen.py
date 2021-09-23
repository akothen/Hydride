


def gen_pattern(tensor_intrinsic_name, num_args):
  arg_string = ""
  for i in range(num_args):
    if arg_string != "":
      arg_string += ","
    arg_string += "m_Value(V_" + str(i) + ")"
  string = "match(II, m_Intrinsic<Intrinsic::" + tensor_intrinsic_name + "(" + arg_string + "))"
  return string


def gen_intrinsic(target_intrinsic_name, shape_m, shape_n):
  code = "IRBuilder<> Builder(II);\n"
  code += "auto &Ctx = II->getParent()->getContext();\n"
  code += "auto *Int16Ty = Type::getInt16Ty(Ctx);\n"
  code += "auto *ShapeM = ConstantInt::get(Int16Ty, " + str(shape_m) + ");\n"
  code += "auto *ShapeM = ConstantInt::get(Int16Ty, " + str(shape_n) + ");\n"
  code += "SmallVector<Value *, 2> Shape = {ShapeM, ShapeN};\n"
  code += "std::vector<Value *> Args;\n"
  code += "Args.insert(Args.end(), Shape.begin(), Shape.end());\n"
  intrinsic_code = "Builder.CreateIntrinsic(Intrinsic::" + target_intrinsic_name + ", None, ArrayRef<Value *>(Args));\n"
  code += "auto *LI = " +  intrinsic_code
  code += "ToBeRemoved.insert(II); \n"
  code += "InstToInstMap[II] = LI; \n"
  code += "return true;"
  return code


def gen_function_body(target_intrinsic_name, shape_m, shape_n, tensor_intrinsic_name, num_args):
  code = "if (" + gen_pattern(tensor_intrinsic_name, num_args) + ") {\n"
  code += gen_intrinsic(target_intrinsic_name, shape_m, shape_n)
  code += "}"
  return code


def gen_function():
  code = "bool legalize(IntrinsicInst *II) {\n"
  code += gen_function_body("x86_tdpbssd_internal", 16, 16, "tensor_mma", 4)
  code += "}"
  print(code)

#gen_function()
