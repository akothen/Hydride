from multiprocessing import Pool
import subprocess as sb
import glob
import time

TIMEOUT = 60 * 60
NUM_WORKERS = 3

def run_file(fname):
    print("Executing {} ...".format(fname))
    log_name = fname.split(".")[0] + ".log"

    start_time = time.time()
    with open(log_name, "w+") as LogFile:
        sb.call("racket {}".format(fname), shell=True, stdout = LogFile, timeout = TIMEOUT )
    end_time = time.time()

    elapsed_time = end_time - start_time



    print("Finished Executing {} in {} seconds ...".format(fname, elapsed_time))


if __name__ == "__main__":
    rkt_files = glob.glob("*.rkt")
    with Pool(NUM_WORKERS) as p:
        p.map(run_file, rkt_files)


