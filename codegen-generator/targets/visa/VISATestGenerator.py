import random
from VISAMeta import *
from VISASemaGenerator import SemaGenerator
from multiprocessing import Pool
import sys
import subprocess
from typing import List
RUN_DIR = VISADIR+"visa_runner/"
TEST_DIR = VISADIR+"rosette_test/"


def issueInstruction(s: VISASema, extra):
    T = VISATextParse(s.inst_form)
    exec_size = s.resolving['exec_size']
    sat = ".sat" if s.flags['sat'] else ""
    issue = T.format.format(sat=sat,
                            exec_size=exec_size, **extra)
    return issue.lower()


VISATypeToCpp = {
    "UD": "uint32_t",
    "D": "int32_t",
    "UW": "uint16_t",
    "W": "int16_t",
    "UB": "uint8_t",
    "B": "int8_t",
    "UQ": "uint64_t",
    "Q": "int64_t",
}


def emitCpp(s: VISASema):
    filename = RUN_DIR+s.intrin+".cpp"
    exec_size = s.resolving['exec_size']
    args: List[Parameter] = s.params+[Parameter("dst", s.rettype, None)]
    TypeOperand = {i.name: "Type_"+i.name for i in args}  # dst: Type_dst
    ActualType = {i.name: VISATypeToCpp[i.type] for i in args}

#     declType = """using TypeA = int8_t;
# using TypeB = int32_t;
# using TypeC = int16_t;
# """
    declType = "\n".join(
        [f"using {v} = {ActualType[k]};" for k, v in TypeOperand.items()])

    # dispatch_arg_list = """TypeA *A, TypeB *B, TypeC *C"""
    dispatch_arg_list = ", ".join(
        [f"{v} *{k}" for k, v in TypeOperand.items()])
    # bufferDecl = """buffer<TypeA, 1> bufa(A, range<1>(exec_size));
    #   buffer<TypeB, 1> bufb(B, range<1>(exec_size));
    #   buffer<TypeC, 1> bufc(C, range<1>(exec_size));"""
    bufferDecl = "\n".join(
        [f"buffer<{v}, 1> buf_{k}({k}, range<1>(exec_size));" for k, v in TypeOperand.items()])
    # get_access = """auto PA = bufa.get_access<access::mode::read>(cgh);
    #     auto PB = bufb.get_access<access::mode::read>(cgh);
    #     auto PC = bufc.get_access<access::mode::write>(cgh);"""
    get_access = "\n".join(
        [f"auto P_{k} = buf_{k}.get_access<access::mode::read>(cgh);" for k in TypeOperand.keys() if k != "dst"]+["auto P_dst = buf_dst.get_access<access::mode::write>(cgh);"])

    # srcprepare = """simd<TypeA, exec_size> va;
    #           unsigned int offsetA = i * exec_size * sizeof(TypeA);
    #           va.copy_from(PA, offsetA);
    #           simd<TypeB, exec_size> vb;
    #           unsigned int offsetB = i * exec_size * sizeof(TypeB);
    #           vb.copy_from(PB, offsetB);"""
    srcprepare = "\n".join([f"""simd<{v}, exec_size> v_{k};
              unsigned int offset_{k} = i * exec_size * sizeof({v});
              v_{k}.copy_from(P_{k}, offset_{k});""" for k, v in TypeOperand.items() if k != "dst"])
    # dstpre = """simd<TypeC, exec_size> vc;
    #           unsigned int offsetC = i * exec_size * sizeof(TypeC);"""
    dstpre = """simd<Type_dst, exec_size> v_dst;
              unsigned int offset_dst = i * exec_size * sizeof(Type_dst);"""
    # dstpost = """vc.copy_to(PC, offsetC);"""
    dstpost = """v_dst.copy_to(P_dst, offset_dst);"""

#     testcases = """{
#     TypeA A[exec_size] = {1};
#     TypeB B[exec_size] = {2};
#     TypeC C[exec_size] = {};
#     dispatch(A, B, C);
#     DUMP(A);
#     DUMP(B);
#     DUMP(C);
#   }"""

    def genCase():
        CornerCase = {
            "UD": [0, 1, 0xffffffff, 0x80000000, 0x7fffffff, 0x80000001, 0x7ffffffe],
            "D": [0, 1, -1, -2147483648, 0x7fffffff, -2147483647, 0x7ffffffe],
            "UW": [0, 1, 0xffff, 0x8000, 0x7fff, 0x8001, 0x7ffe],
            "W": [0, 1, -1, -32768, 0x7fff, -32767, 0x7ffe],
            "UB": [0, 1, 0xff, 0x80, 0x7f, 0x81, 0x7e],
            "B": [0, 1, -1, -128, 0x7f, -127, 0x7e],
            "UQ": list(str(i)+"u" for i in [0, 1, 0xffffffffffffffff, 0x8000000000000000, 0x7fffffffffffffff, 0x8000000000000001, 0x7ffffffffffffffe]),
            "Q": [0, 1, -1, "-9223372036854775807 -1", 0x7fffffffffffffff, "-9223372036854775807 -1", 0x7ffffffffffffffe],
        }
        if "div" in s.intrin.lower() or "mod" in s.intrin.lower():
            # remove 0
            for k in CornerCase.keys():
                if 0 in CornerCase[k]:
                    CornerCase[k].remove(0)
                if "0u" in CornerCase[k]:
                    CornerCase[k].remove("0u")
        Range = {
            "UD": (0, 0xffffffff),
            "D": (-0x80000000, 0x7fffffff),
            "UW": (0, 0xffff),
            "W": (-0x8000, 0x7fff),
            "UB": (0, 0xff),
            "B": (-0x80, 0x7f),
            "UQ": (0, 0xffffffffffffffff),
            "Q": (-0x8000000000000000, 0x7fffffffffffffff),
        }
        # Iterate over all combination of corner cases, Cartesian product
        cproduct = [[]]
        dim = []
        for a in args:
            if a.name == "dst":
                continue
            cproduct = [i+[j] for i in cproduct for j in CornerCase[a.type]]
            dim.append(a.name)
        N = len(cproduct)
        for i in range((-N) % exec_size):
            cproduct.append([str(random.randint(*Range[a.type]))+("u" if a.type.startswith("U") else "")
                            for a in args if a.name != "dst"])
        result = {i.name: [] for i in args if i.name != "dst"}
        for i in cproduct:
            for j in range(len(i)):
                result[dim[j]].append(i[j])
        return result

    def genTestCases():
        testcases = ""
        result = genCase()
        NCases = len(result['src0'])//exec_size
        for i in range(NCases):
            InitlizationSrcs = "\n".join(
                [f"Type_{k} {k}[exec_size] = {{ {', '.join([str(j) for j in result[k][i*exec_size:(i+1)*exec_size]])} }};" for k in TypeOperand.keys() if k != "dst"])
            InitlizationDst = f"""Type_dst dst[exec_size] = {{}};"""
            Dispatch = ", ".join(
                [f"{k}" for k in TypeOperand.keys()])
            Dumps = "\n".join([f"""DUMP({k});""" for k in TypeOperand.keys()])
            testcases += f"""{{ // Test case {i}
                {InitlizationSrcs}
                {InitlizationDst}
                dispatch({Dispatch});
                {Dumps}
            }};
            """
        return testcases

    testcases = genTestCases()

    # asmOperandDst = """"=r"(vc.data_ref())"""
    asmOperandDst = """"=r"(v_dst.data_ref())"""
    # asmOperandSrc = """"r"(va.data()), "r"(vb.data()))"""
    asmOperandSrc = ", ".join(
        [f""""r"(v_{k}.data())""" for k in TypeOperand.keys() if k != "dst"])

    asm = issueInstruction(
        s, {"dst": "%0", "src0": "%1", "src1": "%2", "src2": "%3", "src3": "%4"})
    cpp = f"""#include "util.h"

{declType}

int main(void) {{
  constexpr unsigned exec_size = {exec_size};
  auto dispatch = [=]({dispatch_arg_list}) {{
    try {{
      {bufferDecl}

      // We need that many workgroups
      range<1> GlobalRange{{1}};

      // We need that many threads in each group
      range<1> LocalRange{{1}};

      queue q(gpu_selector_v, createExceptionHandler());

      auto e = q.submit([&](handler &cgh) {{
        {get_access}
        cgh.parallel_for<class Test>(
            GlobalRange * LocalRange, [=](id<1> i) SYCL_ESIMD_KERNEL {{
              using namespace sycl::ext::intel::esimd;
              {srcprepare}
              {dstpre}
#ifdef __SYCL_DEVICE_ONLY__
              __asm__("{asm}"
                      : {asmOperandDst}
                      : {asmOperandSrc});
#endif
              {dstpost}
            }});
      }});
      e.wait();
    }} catch (sycl::exception const &e) {{
      std::cerr << "SYCL exception caught: " << e.what() << std::endl;
      return;
    }}
  }};

  {testcases}
}}
"""
    with open(filename, "w") as f:
        f.write(cpp)


failed = []
supported = []
testcode = """#lang rosette
(require "compiled_new.rkt")
"""

VISANotTestable = [["VASR", "Q_"], [
    "VSHL_sat"], ["VASR"], ["VSHR"], ["VSHL"], ["VDIV"], ["VMOD"], ["VMAD_sat", "W_"]]


def collect(s: VISASema):
    if any(all(j in s.intrin for j in i) for i in VISANotTestable):
        Hlog.warn(f"{s.intrin} not testable")
        return
    filename = RUN_DIR+s.intrin+".txt"
    global failed
    global supported
    global testcode
    if not os.path.exists(filename):
        Hlog.warning(f"{filename} does not exist")
        failed.append(s.intrin + " \tnot exist")
        return
    with open(filename, "r") as f:
        txt = f.read()
        if not txt:
            Hlog.warning(f"{filename} empty")
            failed.append(s.intrin + " \tempty")
            return
        parsable = True
        txt = txt.strip().split("\n")
        for l in txt:
            if not l.startswith("0x") and l:
                parsable = False
                break
        if not parsable:
            Hlog.warning(f"{filename} not parsable")
            failed.append(s.intrin + " \tnot parsable")
            return
    if s.inst not in SuppportedVISA:
        Hlog.warn(f"{s.inst} not supported but result available")
        failed.append(s.intrin + " \tnot supported")
        return
    Hlog.info(f"{filename} ready to parse")
    supported.append(s.intrin)
    N = len(txt)
    m = len(s.params)
    exec_size = s.resolving['exec_size']
    assert N % (m+1) == 0, breakpoint()
    for i in range(0, N, m+1):
        slice = txt[i:i+m]
        dst = txt[i+m]
        args = " ".join(["(bv {hex} {bits})".format(
            hex="#"+v[1:], bits=exec_size*DataTypeBits[a.type]) for v, a in zip(slice, s.params)])
        format = f"(assert (eq? ({s.intrin} {args}) (bv {'#'+dst[1:]} {exec_size*DataTypeBits[s.rettype]})))\n"
        testcode += format


if __name__ == "__main__":
    S = SemaGenerator(deserialize=True).getResult()
    if "-p1" in sys.argv:
        for k, v in S.items():
            Hlog.debug(k)
            emitCpp(v)
    if "-p2" in sys.argv:
        subprocess.Popen(["make", "-C", RUN_DIR, '-j`nproc`'])
    if "-p3" in sys.argv:
        for k, v in S.items():
            collect(v)
        with open(RUN_DIR+"failed.txt", "w") as f:
            f.write("\n".join(failed))
        with open(TEST_DIR+"alltests.rkt", "w") as f:
            f.write(testcode)
        with open("VISASupportedIntrinsics.py", "w") as f:
            import pprint
            f.write("SupportedVISAIntrinsics = "+pprint.pformat(supported))
    # elif "-p2" in sys.argv:
    #     for k, v in S.items():
    #         issueInstruction(v)
