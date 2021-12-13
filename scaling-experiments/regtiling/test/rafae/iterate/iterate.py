import subprocess as sb
import time


def get_cex_defs(cex_ls):
    strs = []
    for idx,cex in enumerate(cex_ls):
        cex_0 = "(define v0_{} (bv {} 64))".format(idx, cex[0])
        cex_1 = "(define v1_{} (bv {} 192))".format(idx, cex[1])
        env_name = "(define env_{} (vector v0_{} v1_{}))".format(idx,idx,idx)
        strs += [cex_0, cex_1, env_name]

    return "\n".join(strs)

def get_synth_asserts(cex_ls):
    strs = []

    for idx,cex in enumerate(cex_ls):
        str_ = "(assume (equal? (interpret sketch-grammar env_{}) (tensor-matmul v0_{} v1_{})))".format(idx,idx,idx)
        strs.append(str_)
    return "\n".join(strs)




cex = []

common_str = ""

with open("common.rkt", "r") as CommonFile:
    common_str = CommonFile.read()

synth_str = ""


with open("synth.rkt", "r") as SynthFile:
    synth_str = SynthFile.read()

verify_str = ""
with open("verify.rkt", "r") as VerifyFile:
    verify_str = VerifyFile.read()




"v1 (bv #xeff77c0a6d866c62 64)"


start_time = time.time()
for i in range(0,100):
    print("Iteration "+str(i+1))
    iter_start = time.time()
    exec_file = "iter_"+str(i+1)+".rkt"

    with open(exec_file, "w+") as WriteFile:
        WriteFile.write(common_str+"\n")
        WriteFile.write(get_cex_defs(cex)+"\n")
        synth_copy = synth_str.format(get_synth_asserts(cex), i+1)
        WriteFile.write(synth_copy)

    log_file = "log"+str(i+1)
    with open(log_file,"w+") as F:
        sb.call("racket "+exec_file, shell =True, stdout=F)

    cex_entry = []

    body_str = ""

    with open("body_{}.txt".format(i+1),"r") as F:
        body_str = F.read()

    verify_file = "verify_{}.rkt".format(i+1)

    with open(verify_file,"w+") as F:
        F.write(common_str + verify_str.format(body_str))



    with open(log_file,"w+") as F:
        sb.call("racket "+verify_file, shell =True, stdout=F)

    iter_end = time.time()
    print("Iteration took {} seconds".format(iter_end - iter_start))

    with open(log_file,"r") as F:
        for line in F:
            if line.startswith("v1 "):
                cex_entry.append(line.split(" ")[2])


            if line.startswith("v2 "):
                cex_entry.append(line.split(" ")[2])

            if len(cex_entry) == 2:
                break

    if len(cex_entry) == 0:
        break
    print(cex_entry)
    cex.append(cex_entry)

end_time = time.time()
elapsed_time = end_time-start_time

print("Synthesis took {} seconds".format(elapsed_time))


