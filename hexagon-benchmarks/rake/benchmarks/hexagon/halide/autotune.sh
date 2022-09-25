#!/bin/bash

# Doing the autotuning in bash script because:
# (a) It doesn't seem that make -j parallelizes it anyway
# (b) Don't know exactly what's going on in autotune_loop.sh and so I don't want to run it in parallel

BENCHMARKS="gaussian3x3
			gaussian5x5 \
			dilate3x3 \
			median3x3 \
			sobel3x3 \
			blur3x3 \
			matmul \
			add \
			mul \
			l2norm \
			max_pool \
			average_pool \
			conv_nn \
			fully_connected"

HALIDE_BIN=/home/sb54/halide-12/bin
HALIDE_DISTRIB=/home/sb54/halide-12/distrib
AUTOSCHED_SRC=/home/sb54/halide-12/src/autoschedulers/adams2019

# Remove previous runs
for b in $BENCHMARKS 
do
    rm -rf $b/samples
done

# Make all
make -j

BENCHMARK_ROOT=/home/sb54/Hydride/hexagon-benchmarks/rake/benchmarks/hexagon/halide

NUM_BATCHES=100
for ((i=0; i < $NUM_BATCHES; i++))
do
  for bench in $BENCHMARKS
  do
    echo "--- ${bench} ---"

	echo ${BENCHMARK_ROOT}/${bench}/samples

	${AUTOSCHED_SRC}/autotune_loop.sh \
		${BENCHMARK_ROOT}/${bench}/bin/${bench}_generator \
		${bench} \
		"" \
		${AUTOSCHED_SRC}/baseline.weights \
		${HALIDE_BIN} \
		${HALIDE_DISTRIB} \
		${BENCHMARK_ROOT}/${bench}/samples
  done
done