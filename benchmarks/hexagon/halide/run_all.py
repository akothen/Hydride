import subprocess
import re
import tqdm

benchmarks = [
    "gaussian3x3",
    "gaussian5x5",
    "dilate3x3",
    "median3x3",
    "sobel3x3",
    "blur3x3",
    "matmul",
    "add",
    "mul",
    "l2norm",
    "max_pool",
    "average_pool",
    "conv_nn"
]
ref_res = {}

for bm in tqdm.tqdm(benchmarks):
    log = str(subprocess.check_output(['make', bm], stderr=subprocess.STDOUT))
    res = re.search("AppReported \(HVX128B-mode\): Image \d+x\d+ - (.+)\(128B\): (.+) cycles \((.*) cycles/pixel\)", log)
    cycles = int(res[2])
    cyclespp = float(res[3])
    print("Total cycles: {}".format(cycles))
    print("Cycles per pixel: {}\n".format(cyclespp))
    ref_res[bm] = (cycles, cyclespp)

print(ref_res)

with open("results.csv", 'w') as fh:
    # fh = open('results.csv', 'w')
    fh.write("Benchmark,Halide Total Cycles,Halide Cycles/Pixel,\n")
    for bm in benchmarks:
        fh.write('{},{},{}\n'.format(bm, ref_res[bm][0], ref_res[bm][1]))
