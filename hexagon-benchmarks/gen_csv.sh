#!/bin/bash

# BEAM_SIZE=32
# NUM_PASSES=5

BENCHMARKS="conv3x3 dilate3x3 gaussian5x5 median3x3 sobel"

echo "Name,No Schedule,HW Schedule,Pre-Trained CM,Auto-Tuned"
for bench in $BENCHMARKS
do
  printf "%s" "${bench},"
  ./run.sh $bench no || exit 1
  printf ","

  ./run.sh $bench hw || exit 1
  printf ","
  
  ./run.sh $bench auto || exit 1
  printf ","

  # Get the best auto-tuned time from the best.txt file in the `samples` dir.
  # This assumes that you have already run the auto-tuning pipeline.
  # BE AWARE THAT THIS NUMBER SEEMS TO BE NORMALIZED. IT SEEMS THAT THE ACTUAL
  # MEASUREMENT IS 1000 TIMES LOWER. I handle this in Pandas.
  line=$(head -n 1 $bench/samples/best.txt)
  read -a split <<< "$line"
  best_runtime="${split[3]}"
  remove_comma=${best_runtime::-1}
  echo $remove_comma
done