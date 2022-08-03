#!/bin/bash

BEAM_SIZE=16

# Including hyper-threading. Use this if you want to exclude it:
# grep ^cpu\\scores /proc/cpuinfo | uniq |  awk '{print $4}'
MAX_PARALLELISM=`grep -c ^processor /proc/cpuinfo`
NUM_PASSES=5

BENCHMARKS="conv3x3 dilate3x3 gaussian5x5 median3x3 sobel"

for bench in $BENCHMARKS
do
  echo "--- ${bench} ---"
  ./run.sh $bench $BEAM_SIZE $NUM_PASSES $MAX_PARALLELISM || exit 1
  echo ""
done