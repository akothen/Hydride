import subprocess
import re
import tqdm

benchmarks = [
    "gaussian3x3",
    "gaussian5x5",
    "gaussian7x7",
    "dilate3x3",
    "dilate5x5",
    "dilate7x7",
    "median3x3",
    "sobel3x3",
    "sobel5x5",
    "blur3x3",
    "blur5x5",
    "blur7x7",
    "matmul",
    "matmul_hvx",
    "depthwise_conv",
    "add",
    "mul",
    "l2norm",
    "max_pool",
    "average_pool",
    "conv_nn",
    "conv3x3a16",
    "conv3x3a32",
    "softmax"
]
ref_res = {}

for bm in tqdm.tqdm(benchmarks):
    print(bm)
    log = str(subprocess.check_output(['make', bm], stderr=subprocess.STDOUT))
    res = re.search("Image \d+x\d+ - (.+)\(128B\): (.+) cycles \((.*) cycles/pixel\)", log)
    cycles = int(res[2])
    cyclespp = float(res[3])
    print("Total cycles: {}".format(cycles))
    print("Cycles per pixel: {}\n".format(cyclespp))
    ref_res[bm] = (cycles, cyclespp)

print(ref_res)

with open("results-no-interleave-elim.csv", 'w') as fh:
    # fh = open('results.csv', 'w')
    fh.write("Benchmark,Halide Total Cycles,Halide Cycles/Pixel,\n")
    for bm in benchmarks:
        fh.write('{},{},{}\n'.format(bm, ref_res[bm][0], ref_res[bm][1]))
