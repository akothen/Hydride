#!/bin/bash

################### CHANGE THESE ###################
HALIDE_ROOT=/home/sb54/halide-14
####################################################

HALIDE_INCLUDE=$HALIDE_ROOT/include
HALIDE_TOOLS=$HALIDE_ROOT/tools
HALIDE_LIB=$HALIDE_ROOT/distrib/lib

if [ -z "$1" ]
then
  echo "Provide the directory of the benchmark as argument 1"
  exit 1
fi

BENCH_DIR=$1
BEAM_SIZE=$2
MAX_PARALLELISM=32

if [ -z "$2" ]
then
  echo "Using the default beam size."
fi

if [ -z "$3" ]
then
  echo "Using 32 as max parallelism in machine_params."
else
  MAX_PARALLELISM=$3
fi

# Compile the generator
g++ $BENCH_DIR/gen.cpp $HALIDE_TOOLS/GenGen.cpp -g -std=c++17 -fno-rtti -I $HALIDE_INCLUDE -L $HALIDE_LIB -lHalide -lpthread -ldl -o gen

# Run the generator to generate the header file and the static lib. Use auto-schedule.
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HALIDE_LIB
# According to this: https://github.com/halide/Halide/discussions/5090#discussioncomment-48676
# the Adams2019 auto-scheduler only pays attention to the parallelism for machine params.
HL_BEAM_SIZE=$BEAM_SIZE ./gen -o $BENCH_DIR -g $BENCH_DIR -f $BENCH_DIR -e static_library,h,schedule -p $HALIDE_LIB/libautoschedule_adams2019.so -s Adams2019 target=host auto_schedule=true machine_params=$MAX_PARALLELISM,16777216,40

# Compile the benchmark
g++ proc_common.cpp $BENCH_DIR/proc.cpp $BENCH_DIR/$BENCH_DIR.a -std=c++17 -I $HALIDE_INCLUDE -I $HALIDE_TOOLS -lpthread -ldl -o proc

# Run it
./proc

# Remove proc. gen may be used by the caller.
rm proc