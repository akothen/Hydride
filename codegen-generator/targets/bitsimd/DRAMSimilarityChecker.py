from RoseSimilarityChecker import RoseSimilarityChecker
from RoseSimilarityCheckerParallel import RoseSimilarityCheckerParallel
import argparse

NumThreads = 32


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("--parallel", help = "Parallelize similarity checking", default = False, action='store_true')
    args = parser.parse_args()

    SimilarityChecker = None
    if args.parallel:
        SimilarityChecker = RoseSimilarityCheckerParallel(["DRAMBitSIMD"])
    else:
        SimilarityChecker = RoseSimilarityChecker(["DRAMBitSIMD"])

    import sys
    sys.stdout = sys.__stderr__
    SimilarityChecker.performSimilarityChecking()
