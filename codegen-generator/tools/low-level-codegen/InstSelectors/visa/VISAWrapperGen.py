from VISASemaGenerator import SemaGenerator
from VISAMeta import DataTypeBits, Parameter

if __name__ == '__main__':
    S = SemaGenerator(deserialize=True)
    Result = S.getResult()
    llvmIR = ""
    for visaName in Result:
        # declare <32 x i32> @VADD_32_D_D_D_wrapper(<32 x i32> arg.0, <32 x i32> %arg.1)
        exec_size = Result[visaName].resolving['exec_size']
        dest_type = Result[visaName].rettype
        ret_type = f"<{exec_size} x i{DataTypeBits[dest_type]}>"
        arg_list = []
        for i, p in enumerate(Result[visaName].params):
            p: Parameter
            source_type = p.type
            arg_type = f"<{exec_size} x i{DataTypeBits[source_type]}>"
            arg_list.append(f"{arg_type}")
        argStr = ", ".join(arg_list)
        declareStr = f"declare {ret_type} @{visaName}_wrapper({argStr})"
        print(declareStr)
        llvmIR += declareStr + "\n"
    with open("visa_wrapper.ll", "w") as f:
        f.write(llvmIR)