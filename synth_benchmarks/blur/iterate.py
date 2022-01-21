import subprocess as sb
import time


def get_cex_defs(cex_ls):
    strs = []
    for idx,cex in enumerate(cex_ls):
        cex_0 = "(define v0_{} (bv {} 288))".format(idx, cex[0])
        env_name = "(define env_{} (vector v0_{}))".format(idx,idx)
        strs += [cex_0,  env_name]

    return "\n".join(strs)

def get_synth_asserts(cex_ls):
    strs = []

    var_list = []
    for idx,cex in enumerate(cex_ls):
        str_ = "(assert (equal? (interpret sketch-grammar env_{}) (blur v0_{}  6 6 3 3 8)))".format(idx,idx)

        strs.append(str_)
        var_list.append("v0_"+str(idx))
    return " ".join(var_list), "\n".join(strs)




cex = []

common_str = ""

with open("blur_common.rkt", "r") as CommonFile:
    common_str = CommonFile.read()

synth_str = ""


with open("synth.rkt", "r") as SynthFile:
    synth_str = SynthFile.read()

verify_str = ""
with open("verify.rkt", "r") as VerifyFile:
    verify_str = VerifyFile.read()






start_time = time.time()
for i in range(0,100):
    print("Iteration "+str(i+1))
    exec_file = "iter_"+str(i+1)+".rkt"

    with open(exec_file, "w+") as WriteFile:
        WriteFile.write(common_str+"\n")
        WriteFile.write(get_cex_defs(cex)+"\n")
        synth_app = get_synth_asserts(cex)
        synth_copy = synth_str.format(synth_app[1],synth_app[0], synth_app[1],  i+1)
        WriteFile.write(synth_copy)


    synth_start = time.time()
    log_file = "log"+str(i+1)
    with open(log_file,"w+") as F:
        sb.call("racket "+exec_file, shell =True, stdout=F)

    synth_end = time.time()

    print("Synthesis took {} seconds".format(synth_end - synth_start))

    with open(log_file,"r") as F:
        for line in F:
            if "synth cost:" in line:
                print(line)
    cex_entry = []

    body_str = ""

    with open("body_{}.txt".format(i+1),"r") as F:
        body_str = F.read()

    verify_file = "verify_{}.rkt".format(i+1)

    with open(verify_file,"w+") as F:
        F.write(common_str + verify_str.format(body_str))



    verify_start = time.time()
    with open(log_file,"w+") as F:
        sb.call("racket "+verify_file, shell =True, stdout=F, timeout = 15 *60)
    verify_end = time.time()

    iteration_time = (verify_end-verify_start) + (synth_end - synth_start)

    print("Verification took {} seconds".format(verify_end - verify_start))
    print("Iteration took {} seconds (Total Time)".format(iteration_time))

    with open(log_file,"r") as F:
        for line in F:
            if line.startswith("v1 "):
                cex_entry.append(line.split(" ")[2])

            if len(cex_entry) == 1:
                break

    if len(cex_entry) == 0:
        break
    print(cex_entry)
    cex.append(cex_entry)

end_time = time.time()
elapsed_time = end_time-start_time

print("Synthesis took {} seconds".format(elapsed_time))


