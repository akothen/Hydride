import sys
import subprocess
import re

template = "/Users/yscore/Sync/This/CS526/Hydride/benchmarks/{0}/halide/{1}/bin/{1}_run.out 3840 2160 /Users/yscore/Sync/This/CS526/Hydride/benchmarks/{0}/test_vectors/football3840x2160.bin /Users/yscore/Sync/This/CS526/Hydride/benchmarks/{0}/halide/{1}/out/out.bin"
folder = ["arm", "arm-disable-hydride"]
benchmarks = [
    # "sobel3x3",
    # "sobel5x5",
    # "dilate3x3",
    # "dilate5x5",
    # "dilate7x7",
    # "blur3x3",
    # "blur5x5",
    # "blur7x7",
    # "median3x3",
    # "gaussian3x3",
    # "gaussian5x5",
    # "gaussian7x7",
    # "l2norm",
    # "conv_nn",
    # "conv3x3a16",
    # "depthwise_conv",
    # "matmul",
    # "average_pool",
    # "max_pool",
    # "fully_connected",
    # "add",
    # "mul",
    # "softmax",
    # "batched_matmul_256_32bit",
    # "average_pool_add",
    # "max_pool_add",
    # "matmul_256_32bit_bias_add",
    # "matmul_256_32bit_bias_add_relu",
    # "matmul_256_32bit_bias_add_gelu",
    # "matmul_256_32bit_bias_add_add",
    # "matmul_bias_relu_matmul",
    # "matmul_bias_gelu_matmul",
]
# benchmarks=["blur3x3","sobel3x3"]
benchmarks = sys.argv[1:]

result = []
for b in benchmarks:
    # cmd=template.format(f,b)
    cmd = "make armr."+b
    if "fully_connected" in b:
        cmd += " -B"
    # print(b)
    print(cmd)
    time = []
    k = subprocess.check_output(cmd.split(' '))
    # print(k)
    for d in k.split(b"\n"):
        if b"Execution took" in d:
            match = re.search(r'\d+\.\d+', str(d))
            time.append(float(match.group()))
    time.sort()
    print(time, b)
    result += [f"{time[0]},{b}"]
print("\n".join(result))
