import subprocess as sb
import sys

depth_limits = ["--depth {}".format(i+1) for i in range(0, 4)]
scheme_limits = ["--scheme bvops"]#, "--scheme arg_superset"]
files = ["time/concolic_111.spec", "time/concolic_101.spec"       ,  "time/concolic_011.spec", "time/concolic_110.spec" ,"time/concolic_001.spec","time/concolic_010.spec", "time/concolic_100.spec"]

MINUTES = 60
TIMEOUT = 60 * 60

for idx,depth in enumerate(depth_limits):
    for scheme in scheme_limits:
        for f in files:
            command = "python3"+" "+"run_synth.py"+" "+f+" "+depth+" "+scheme+" "+"--iterations 5"
            print(command)
            scaled_timeout = int(TIMEOUT * (idx+100)/100)
            try:
                sb.call(command,shell=True, timeout = scaled_timeout)
            except:
                print("Timed out...")
                with open("TimeOuts.txt","a+") as TimeOutFile:
                    info_str = "depth_"+str(depth)+"_file_"+f+"\n"
                    TimeOutFile.write(info_str)



