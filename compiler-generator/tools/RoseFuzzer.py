import os
import math
import subprocess
from enum import Enum
from copy import deepcopy


class CodeEmitter():
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


class CCodeEmitter(CodeEmitter):
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


class RosetteCodeEmitter(CodeEmitter):
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


class RoseFuzzer():
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

        out = CodeEmitter(intrin)
        rose = RosetteCodeEmitter(intrin, r_impl)
        c = CCodeEmitter(intrin)

        rout, rerr = rose.test(ARGS)
        cout, cerr = c.test(ARGS)
        res = out.test_result(rout, rose.clean_output(rout), rerr, cout,
                              c.clean_output(cout), cerr)
        print("{:<32} -> {}".format(intrin.name, res))
        if res not in self.results:
            self.results[res] = []

        self.results[res].append(intrin.name)
