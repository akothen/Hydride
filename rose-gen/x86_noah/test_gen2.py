import os
import math
import subprocess
import print_rosette
from enum import Enum
from x86_to_rosette3 import x86_t_to_build_type
from copy import deepcopy

DIR_PATH = "rosette-tests5"
ARGS = []
arg_base = []
for i in range(0, 64):
    arg_base.append(i)

for i in range(0, 5):
    new_arg = []
    for j in range(0, 64):
        new_arg.append(arg_base[j])
    ARGS.append(deepcopy(new_arg))


def var_name(name):
    return "tmp__{}".format(name)


def is_const_type(T):
    return T in {"const int": True, "_MM_PERM_ENUM": True}


def is_const_name(name):
    return name == "imm8" or name == "count"


def is_const(T, name):
    if is_const_type(T) or is_const_name(name):
        if name == "count":
            if "int" in T:
                return True
        else:
            return True
    return False


def valid_T(T):
    return T.replace("unsigned __int64", "unsigned__int64")


def x86_to_c(T):
    lookup_ele_t = {
        "SI8": "int8_t",
        "char": "char",
        "SI16": "int16_t",
        "short": "short",
        "SI32": "int32_t",
        "int": "int",
        "const int": "const int",
        "_MM_PERM_ENUM": "_MM_PERM_ENUM",
        "SI64": "int64_t",
        "__int64": "int64_t",
        "UI8": "uint8_t",
        "UI16": "uint16_t",
        "unsigned short": "unsigned short",
        "UI32": "uint32_t",
        "unsigned int": "unsigned int",
        "UI64": "uint64_t",
        "unsigned __int64": "uint64_t",
        "unsigned long": "unsigned long",
        "double": "float",
        "float": "float",
        "FP32": "float",
        "FP64": "double",
        "__mmask8": "__mmask8",
        "__mmask16": "__mmask16",
        "__mmask32": "__mmask32",
        "__mmask64": "__mmask64",
        "MASK": "__mmask64",
        "M128": "__m128",
        "M256": "__m256",
        "M512": "__m512",
        "__m64": "__m64",
        "__m128": "__m128",
        "__m128i": "__m128i",
        "__m128d": "__m128d",
        "__m256": "__m256",
        "__m256d": "__m256d",
        "__m256i": "__m256i",
        "__m512": "__m512",
        "__m512i": "__m512i",
        "__m512d": "__m512d",
    }
    if T not in lookup_ele_t:
        return T
    return lookup_ele_t[T]


def imm8_max(fname):
    imm8_map = {
        "_mm256_shuffle_pd": 16,
        "_mm256_blend_pd": 16,
        "_mm256_permute_pd": 16,
        "_mm_blend_epi32": 16,
        "_mm_range_ps": 16,
        "_mm_mask_range_ps": 16,
        "_mm_maskz_range_ps": 16,
        "_mm256_range_ps": 16,
        "_mm256_mask_range_ps": 16,
        "_mm256_maskz_range_ps": 16,
        "_mm512_range_ps": 16,
        "_mm512_mask_range_ps": 16,
        "_mm512_maskz_range_ps": 16,
        "_mm_range_pd": 16,
        "_mm_mask_range_pd": 16,
        "_mm_maskz_range_pd": 16,
        "_mm256_range_pd": 16,
        "_mm256_mask_range_pd": 16,
        "_mm256_maskz_range_pd": 16,
        "_mm512_range_pd": 16,
        "_mm512_mask_range_pd": 16,
        "_mm512_maskz_range_pd": 16,
        "_mm256_permute_pd": 16,
        "_mm256_mask_permute_pd": 16,
        "_mm256_maskz_permute_pd": 16,
        "_mm256_shuffle_pd": 16,
        "_mm256_mask_shuffle_pd": 16,
        "_mm256_maskz_shuffle_pd": 16,
        "_mm_insert_epi8": 16,
        "_mm_blend_ps": 16,
        "_mm_extract_epi8": 16,
        "_mm_extract_epi16": 8,
        "_mm_insert_epi16": 8,
        "_mm_insert_epi32": 4,
        "_mm_extract_ps": 4,
        "_mm_blend_pd": 4,
        "_mm512_insertf32x4": 4,
        "_mm512_mask_insertf32x4": 4,
        "_mm512_maskz_insertf32x4": 4,
        "_mm_shuffle_pd": 4,
        "_mm_mask_shuffle_pd": 4,
        "_mm_maskz_shuffle_pd": 4,
        "_mm_extract_epi32": 4,
        "_mm512_extracti32x4_epi32": 4,
        "_mm512_mask_extracti32x4_epi32": 4,
        "_mm512_maskz_extracti32x4_epi32": 4,
        "_mm512_extractf32x4_ps": 4,
        "_mm512_mask_extractf32x4_ps": 4,
        "_mm512_maskz_extractf32x4_ps": 4,
        "_mm_permute_pd": 4,
        "_mm_mask_permute_pd": 4,
        "_mm_maskz_permute_pd": 4,
        "_mm256_shuffle_f32x4": 4,
        "_mm256_mask_shuffle_f32x4": 4,
        "_mm256_maskz_shuffle_f32x4": 4,
        "_mm256_shuffle_f64x2": 4,
        "_mm256_mask_shuffle_f64x2": 4,
        "_mm256_maskz_shuffle_f64x2": 4,
        "_mm256_shuffle_i32x4": 4,
        "_mm256_mask_shuffle_i32x4": 4,
        "_mm256_maskz_shuffle_i32x4": 4,
        "_mm256_shuffle_i64x2": 4,
        "_mm256_mask_shuffle_i64x2": 4,
        "_mm256_maskz_shuffle_i64x2": 4,
        "_mm512_inserti32x4": 4,
        "_mm512_mask_inserti32x4": 4,
        "_mm512_maskz_inserti32x4": 4,
        "_mm_extract_pi16": 4,
        "_mm_insert_pi16": 4,
        "_m_pextrw": 4,
        "_m_pinsrw": 4,
        "_mm_insert_epi64": 2,
        "_mm_extract_epi64": 2,
        "_mm512_inserti64x4": 2,
        "_mm512_mask_inserti64x4": 2,
        "_mm512_maskz_inserti64x4": 2,
        "_mm512_insertf64x4": 2,
        "_mm512_mask_insertf64x4": 2,
        "_mm512_maskz_insertf64x4": 2,
        "_mm512_extracti64x4_epi64": 2,
        "_mm512_mask_extracti64x4_epi64": 2,
        "_mm512_maskz_extracti64x4_epi64": 2,
        "_mm512_extractf64x4_pd": 2,
        "_mm512_mask_extractf64x4_pd": 2,
        "_mm512_maskz_extractf64x4_pd": 2,
        "_mm256_extractf32x4_ps": 2,
        "_mm256_mask_extractf32x4_ps": 2,
        "_mm256_maskz_extractf32x4_ps": 2,
        "_mm256_extracti32x4_epi32": 2,
        "_mm256_mask_extracti32x4_epi32": 2,
        "_mm256_maskz_extracti32x4_epi32": 2,
        "_mm256_insertf32x4": 2,
        "_mm256_mask_insertf32x4": 2,
        "_mm256_maskz_insertf32x4": 2,
        "_mm256_inserti32x4": 2,
        "_mm256_mask_inserti32x4": 2,
        "_mm256_maskz_inserti32x4": 2,
        "_mm256_extractf128_ps": 2,
        "_mm256_extractf128_pd": 2,
        "_mm256_extractf128_si256": 2,
        "_mm256_insertf128_ps": 2,
        "_mm256_insertf128_pd": 2,
        "_mm256_insertf128_si256": 2,
        "_mm256_extracti128_si256": 2,
        "_mm256_inserti128_si256": 2,
        "_mm512_extractf32x8_ps": 2,
        "_mm512_mask_extractf32x8_ps": 2,
        "_mm512_maskz_extractf32x8_ps": 2,
        "_mm256_extractf64x2_pd": 2,
        "_mm256_mask_extractf64x2_pd": 2,
        "_mm256_maskz_extractf64x2_pd": 2,
        "_mm512_extractf64x2_pd": 4,
        "_mm512_mask_extractf64x2_pd": 4,
        "_mm512_maskz_extractf64x2_pd": 4,
        "_mm512_extracti32x8_epi32": 2,
        "_mm512_mask_extracti32x8_epi32": 2,
        "_mm512_maskz_extracti32x8_epi32": 2,
        "_mm256_extracti64x2_epi64": 2,
        "_mm256_mask_extracti64x2_epi64": 2,
        "_mm256_maskz_extracti64x2_epi64": 2,
        "_mm512_extracti64x2_epi64": 4,
        "_mm512_mask_extracti64x2_epi64": 4,
        "_mm512_maskz_extracti64x2_epi64": 4,
        "_mm512_insertf32x8": 2,
        "_mm512_mask_insertf32x8": 2,
        "_mm512_maskz_insertf32x8": 2,
        "_mm256_insertf64x2": 2,
        "_mm256_mask_insertf64x2": 2,
        "_mm256_maskz_insertf64x2": 2,
        "_mm512_insertf64x2": 4,
        "_mm512_mask_insertf64x2": 4,
        "_mm512_maskz_insertf64x2": 4,
        "_mm512_inserti32x8": 2,
        "_mm512_mask_inserti32x8": 2,
        "_mm512_maskz_inserti32x8": 2,
        "_mm512_inserti64x2": 4,
        "_mm512_mask_inserti64x2": 4,
        "_mm512_maskz_inserti64x2": 4,
        "_mm256_inserti64x2": 2,
        "_mm256_mask_inserti64x2": 2,
        "_mm256_maskz_inserti64x2": 2
    }
    if fname in imm8_map:
        return imm8_map[fname]

    return 256


def imm_size(fname):
    max_sz = imm8_max(fname)
    bits = int(math.log2(max_sz))
    assert int(1) << bits == max_sz

    return bits


class Param():
    def __init__(self, param):
        if isinstance(param, str):
            _p = x86_t_to_build_type(param)
            self.tname = param
            self.name = None
            self.sz = _p.size
        else:
            _p = x86_t_to_build_type(param.type)
            self.tname = param.type
            self.name = param.name
            self.sz = _p.size

    def is_const(self):
        return is_const(self.tname, self.name)

    def get_c_type(self):
        return x86_to_c(self.tname)

    def sz_bytes(self):
        if self.sz < 8:
            return 1

        nbytes = int(self.sz / 8)
        assert nbytes * 8 == self.sz
        return nbytes


class Intrin():
    def __init__(self, ret, name, in_params):
        self.ret = Param(ret)
        self.name = str(name)
        self.has_const = False

        self.params = []
        for param in in_params:
            new_param = Param(param)
            if new_param.is_const():
                self.has_const = True
                new_param.sz = imm_size(self.name)

            self.params.append(new_param)

    def r_make_val_i(self, i, arg):
        bin_str = ""
        param = self.params[i]
        param_bytes = param.sz_bytes()

        for i in range(0, param_bytes):
            v = arg[i] & 0xff
            if param.is_const():
                v = int(v % imm8_max(self.name))

            byte = bin(v)
            byte_str = str(byte).replace("0b", "").zfill(8)
            bin_str = byte_str + bin_str
        bin_str = "#b" + bin_str

        return bin_str

    def c_make_val_i(self, i, arg):
        bin_out = []
        param = self.params[i]
        param_bytes = param.sz_bytes()

        for j in range(0, param_bytes):
            v = arg[j] & 0xff
            if param.is_const():
                v = int(v % imm8_max(self.name))
            bin_out.append(str(hex(v)))

        if param.is_const():
            return "#define {} {}".format(param.name, bin_out[0])
        else:
            buf = "uint8_t _{}[{}] = LBRACK {} RBRACK;".format(
                i, param_bytes, ",".join(bin_out))
            buf = buf.replace("LBRACK", "{")
            buf = buf.replace("RBRACK", "}")

            var = "{} {};".format(param.get_c_type(), param.name)
            init = "memcpy(&{}, _{}, {});".format(param.name, i, param_bytes)

            return buf + var + init

    def get_key(self):
        return self.name

    def should_skip(self):
        return self.ret == "void"


def run_process(cmd):
    try:
        sproc = subprocess.Popen(cmd,
                                 shell=True,
                                 stdin=subprocess.PIPE,
                                 stdout=subprocess.PIPE,
                                 stderr=subprocess.PIPE)

        stdout_data, stderr_data = sproc.communicate(timeout=60)
        stdout_data = stdout_data.decode("utf-8", "ignore")
        stderr_data = stderr_data.decode("utf-8", "ignore")
        return stdout_data, stderr_data
    except OSError:
        return "", "OS Error running {}".format(cmd)
    except subprocess.TimeoutExpired:
        return "", "Timout Error running {}".format(cmd)


class ERR(Enum):
    NONE = 0
    NEQ = 1
    ROSE = 2
    C = 3
    BOTH = 4


class Out():
    def __init__(self, intrin):
        self.intrin = intrin
        self.fname = None

    def make_file_content(self, args):
        assert False

    def build(self):
        assert False

    def run(self):
        assert False

    def make_file(self, args):
        global DIR_PATH

        self.fname = "{}/{}".format(DIR_PATH, self.make_fname())
        try:
            f = open(self.fname, "w+")

            content = self.make_file_content(args)

            f.write(content)

            f.close()
            return True
        except IOError:
            print("Error making: {}".format(self.fname))
            return False

    def clean_output(self, out):
        assert False

    def check_result(self, rout, rerr, cout, cerr):
        rose_err = False
        c_err = False
        if (rerr is not None) and (rerr != ""):
            rose_err = True
        if (cerr is not None) and (cerr != ""):
            c_err = True

        if c_err and rose_err:
            return ERR.BOTH
        if c_err:
            return ERR.C
        if rose_err:
            return ERR.ROSE

        if cout != rout:
            return ERR.NEQ

        return ERR.NONE

    def write_output(self, rout, rout_cmp, rerr, cout, cout_cmp, cerr, result):
        global DIR_PATH
        outf = "{}/{}".format(DIR_PATH, self.intrin.name)
        try:
            f = open(outf, "w+")

            fmt_out = "-----------------------------\n"
            fmt_out += "{} - STDOUT:\n{}\n"
            fmt_out += "-----------------------------\n"
            fmt_out += "{} - CMPOUT:\n{}\n"
            fmt_out += "-----------------------------\n"
            fmt_out += "{} - STDERR:\n{}\n"
            fmt_out += "-----------------------------\n\n"

            rose_out = fmt_out.format("Rosette", rout, "Rosette", rout_cmp,
                                      "Rosette", rerr)
            c_out = fmt_out.format("C", cout, "C", cout_cmp, "C", cerr)
            res = "Result: " + str(result) + "\n"

            f.write(rose_out)
            f.write(c_out)
            f.write(res)
            f.close()
        except IOError:
            print("Error writing output to: {}".format(outf))

    def test_result(self, rout, rout_cmp, rerr, cout, cout_cmp, cerr):
        result = self.check_result(rout_cmp, rerr, cout_cmp, cerr)
        self.write_output(rout, rout_cmp, rerr, cout, cout_cmp, cerr, result)
        return result

    def test(self, args):
        if not self.make_file(args):
            return "", "IO Error"
        sout, serr = self.build()
        if sout is None and serr is None:
            sout, serr = self.run()
        return sout, serr


class R_Out(Out):
    def __init__(self, intrin, extra):
        super().__init__(intrin)
        self.extra = extra

    def make_fname(self):
        return "rkt-{}.rkt".format(self.intrin.name)

    def make_file_content(self, args):
        content = [
            "#lang rosette", "(require \"../librosette.rkt\")",
            "(require rosette/lib/synthax)", "(require rosette/lib/angelic)",
            "(require racket/pretty)", self.extra
        ]

        pargs = []
        for i in range(0, len(self.intrin.params)):
            param = self.intrin.params[i]
            vname = var_name(param.name)
            pargs.append(vname)
            content.append(
                print_rosette.print_bv_define(
                    vname, self.intrin.r_make_val_i(i, args[i]), param.sz))

        content.append("(pretty-print ({} {}))".format(self.intrin.name,
                                                       " ".join(pargs)))

        return "\n".join(content)

    def build(self):
        return None, None

    def run(self):
        return run_process("racket {}".format(self.fname))

    def clean_output(self, out):
        out = out.lstrip().rstrip()
        outarr = out.split()
        if (out[:3] != "(bv") or (out[len(out) - 1:] != ")") or (len(outarr) !=
                                                                 3):
            return out

        out_hex = outarr[1].replace("#x", "")
        out_hex = out_hex.lstrip("0")
        if len(out_hex) < self.intrin.ret.sz_bytes() * 2:
            out_hex = out_hex.zfill(self.intrin.ret.sz_bytes() * 2)
        return out_hex


class C_Out(Out):
    def __init__(self, intrin):
        super().__init__(intrin)

    def make_fname(self):
        return "c-{}.c".format(self.intrin.name)

    def make_file_content(self, args):
        content = ["#include \"../c-test-helper.h\"", "int main() {"]

        pargs = []
        for i in range(0, len(self.intrin.params)):
            param = self.intrin.params[i]
            pargs.append(param.name)
            content.append(self.intrin.c_make_val_i(i, args[i]))

        content.append("uint8_t out[64] = {0};")
        content.append("{} ret = {}({});".format(self.intrin.ret.get_c_type(),
                                                 self.intrin.name,
                                                 ",".join(pargs)))
        content.append("memcpy(out, &ret, {});".format(
            self.intrin.ret.sz_bytes()))
        content.append("hex_out(out, {});".format(self.intrin.ret.sz_bytes()))

        content.append("return 0;")
        content.append("}")
        return "\n".join(content)

    def build(self):
        sout, serr = run_process("clang -O1 -march=native {} -o c-exec".format(
            self.fname))
        if serr != "":
            return sout, serr

        return None, None

    def run(self):
        return run_process("./c-exec")

    def clean_output(self, out):
        out = out.lstrip("0")
        return out.lstrip().rstrip().zfill(self.intrin.ret.sz_bytes() * 2)


class Tester():
    def __init__(self):
        global DIR_PATH
        assert os.system("mkdir -p {}".format(DIR_PATH)) == 0

        self.results = {}

    def summary(self):
        for res in self.results:
            intrins = self.results[res]
            print("{}:".format(res))
            for intrin in intrins:
                print("\t{}".format(intrin))

    def add_intrin(self, intrin, r_impl):
        global ARGS

        out = Out(intrin)
        rose = R_Out(intrin, r_impl)
        c = C_Out(intrin)

        rout, rerr = rose.test(ARGS)
        cout, cerr = c.test(ARGS)
        res = out.test_result(rout, rose.clean_output(rout), rerr, cout,
                              c.clean_output(cout), cerr)
        print("{:<32} -> {}".format(intrin.name, res))
        if res not in self.results:
            self.results[res] = []

        self.results[res].append(intrin.name)
