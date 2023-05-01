import subprocess
import re

template="/Users/yscore/Sync/This/CS526/Hydride/benchmarks/{0}/halide/{1}/bin/{1}_run.out 3840 2160 /Users/yscore/Sync/This/CS526/Hydride/benchmarks/{0}/test_vectors/football3840x2160.bin /Users/yscore/Sync/This/CS526/Hydride/benchmarks/{0}/halide/{1}/out/out.bin"
folder=["arm","arm-disable-hydride"]
benchmarks=["average_pool", "gaussian5x5", "gaussian3x3", "max_pool", "median3x3", "dilate5x5", "dilate3x3","sobel3x3"]
# benchmarks=["median3x3", "dilate5x5", "dilate3x3","sobel3x3"]
for b in benchmarks[:]:
    for f in folder:
        cmd=template.format(f,b)
        print(f,b)
        # print(cmd)
        time =0
        n=5
        for i in range(n):
            k=subprocess.check_output(cmd.split(' '))
            # print(k)
            for d in k.split(b"\n"):
                if b"Execution took" in d:
                    time+=float(d[15:-1])
        print(time/n)
        