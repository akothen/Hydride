#!/bin/bash

################### CHANGE THESE ###################
HALIDE_ROOT=/home/sb54/Hydride/hexagon-benchmarks/halide_standalone_autoscheduler
####################################################

HALIDE_INCLUDE=$HALIDE_ROOT/distrib/include
HALIDE_TOOLS=$HALIDE_ROOT/distrib/tools
HALIDE_LIB=$HALIDE_ROOT/distrib/lib
HALIDE_AUTOSCHED=$HALIDE_ROOT/apps/autoscheduler

if [ -z "$1" ]
then
  echo "Provide the directory of the benchmark as argument 1"
  exit 1
fi

BENCH_DIR=$1
BEAM_SIZE=$3
NUM_PASSES=$4
# Including hyper-threading. Use this if you want to exclude it:
# grep ^cpu\\scores /proc/cpuinfo | uniq |  awk '{print $4}'
MAX_PARALLELISM=`grep -c ^processor /proc/cpuinfo`
WHAT_SCHEDULE="no"

if [ -z "$2" ]
then
  echo "Using no schedule."
else
  WHAT_SCHEDULE=$2
  if [ "${WHAT_SCHEDULE}" != "no" ] && [ "${WHAT_SCHEDULE}" != "hw" ] && [ "${WHAT_SCHEDULE}" != "auto" ]; then
    echo "Wrong option for what schedule to use"
    exit 1
  fi
  if [ "$WHAT_SCHEDULE" = "auto" ]; then
    if [ -z "$BEAM_SIZE" ]
    then
    # BEAM_SIZE remains empty, and so Halide uses its default value.
      echo "Using the default beam size (32)."
    fi

    if [ -z "$NUM_PASSES" ]
    then
    # NUM_PASSES remains empty, and so Halide uses its default value.
      echo "Using the default number of passes (5)."
    fi
  fi
fi

# Use original weights by default...
WEIGHTS_DIR=$HALIDE_AUTOSCHED/weights
# ... unless there's a weights directory in this benchmark's dir
# NOTE: Something that is worrying here is that if we assign to HL_WEIGHTS_DIR
# a dir that doesn't exist, Halide won't complain.
if [ -d "$BENCH_DIR/samples" ] 
then
  WEIGHTS_DIR=$BENCH_DIR/samples/weights
fi

CXXFLAGS="-Wall -Werror -Wno-unused-function -Wcast-qual -Wignored-qualifiers -Wno-comment -Wsign-compare -Wno-unknown-warning-option -Wno-psabi -fno-rtti -std=c++11"

# Compile the generator
# Note: -rdynamic is an important flag here because the symbols of this program need to be visible to libauto_schedule.so below.
g++ $CXXFLAGS -rdynamic $BENCH_DIR/gen.cpp $HALIDE_TOOLS/GenGen.cpp -I $HALIDE_INCLUDE $HALIDE_LIB/libHalide.a -ldl -lpthread -o gen

# Run the generator to generate the header file and the static lib. Use auto-schedule.
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HALIDE_LIB
# According to this: https://github.com/halide/Halide/discussions/5090#discussioncomment-48676
# the Adams2019 auto-scheduler only pays attention to the parallelism for machine params.
if [ "$WHAT_SCHEDULE" = "auto" ]; then
  HL_BEAM_SIZE=$BEAM_SIZE HL_NUM_PASSES=$NUM_PASSES HL_PERMIT_FAILED_UNROLL=1 HL_WEIGHTS_DIR=$WEIGHTS_DIR ./gen -o $BENCH_DIR -g $BENCH_DIR -f $BENCH_DIR -e static_library,h,schedule target=host auto_schedule=true -p $HALIDE_AUTOSCHED/bin/libauto_schedule.so machine_params=$MAX_PARALLELISM,16777216,40
else
  if [ "$WHAT_SCHEDULE" = "no" ]; then
    NO_SCHEDULE="true"
  else
    NO_SCHEDULE="false"
  fi
  ./gen -o $BENCH_DIR -g $BENCH_DIR -f $BENCH_DIR -e static_library,h,schedule target=host auto_schedule=false machine_params=$MAX_PARALLELISM,16777216,40 no_schedule=$NO_SCHEDULE
fi

# Compile the benchmark
g++ $CXXFLAGS proc_common.cpp $BENCH_DIR/proc.cpp $BENCH_DIR/$BENCH_DIR.a -I $HALIDE_INCLUDE -I $HALIDE_TOOLS -lpthread -ldl -o proc

# Run it
./proc || (exit 1 & echo "FAILED!")

# # Remove proc. gen may be used by the caller.
# rm proc