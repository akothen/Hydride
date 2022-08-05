#!/bin/bash

BEAM_SIZE=32
NUM_PASSES=5

BENCHMARKS="conv3x3 dilate3x3 gaussian5x5 median3x3 sobel"

for bench in $BENCHMARKS
do
  echo "--- ${bench} ---"
  ./run.sh $bench auto $BEAM_SIZE $NUM_PASSES || exit 1
  echo ""
done