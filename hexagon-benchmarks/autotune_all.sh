#!/bin/bash

BENCHMARKS="conv3x3 dilate3x3 gaussian5x5 median3x3 sobel"

# 5% of the number of batches I used for pre-training. You need more than 1 batch to have any effect
# on fine-tuning the model, because the training of the model happens at the end of each batch.
NUM_BATCHES=5

for ((i=0; i < $NUM_BATCHES; i++))
do
  for bench in $BENCHMARKS
  do
    echo "--- ${bench} ---"
    ./autotune_program.sh $bench
    echo ""
  done
done

