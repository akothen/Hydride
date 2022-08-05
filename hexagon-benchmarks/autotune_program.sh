#!/bin/bash

################### CHANGE THESE ###################
HALIDE_ROOT=/home/sb54/Hydride/hexagon-benchmarks/halide_standalone_autoscheduler
GEN_NAME=$1
####################################################

# First, use run.sh (with the fastest settings) to create the generator. It should create a generator in the current dir.
./run.sh $GEN_NAME no 1 1 > /dev/null 2>&1
GEN_EXE=/home/sb54/Hydride/hexagon-benchmarks/gen

HALIDE_INCLUDE=$HALIDE_ROOT/distrib/include
HALIDE_TOOLS=$HALIDE_ROOT/distrib/tools
HALIDE_LIB=$HALIDE_ROOT/distrib/lib
HALIDE_AUTOSCHED=$HALIDE_ROOT/apps/autoscheduler

# Remove the samples dir.
rm -rf $HALIDE_AUTOSCHED/samples/
# If we have some auto-tuned weights and samples, continue auto-tuning those.
if [ -d "$GEN_NAME/samples" ] 
then
  mv $GEN_NAME/samples $HALIDE_AUTOSCHED/
fi

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HALIDE_LIB
SAVE_CURR_DIR=$PWD
echo $SAVE_CURR_DIR

# autotune_loop.sh uses relative paths so we need to do this
cd $HALIDE_AUTOSCHED
# This will create a directory `samples` in the current path (which is the auto-scheduler path
# because of the above `cd`). The original weights are copied there and updated
# during auto-tuning. You should use these weights when auto-scheduling the program.
# Delete `samples` if you want to start over the auto-tuning.
./autotune_loop.sh $GEN_EXE	$GEN_NAME	host ./weights ./bin

# Move the updated `weights` to the directory of the benchmark. This means that if you want
# to continue auto-tuning for this benchmark, you should move them back to the autosched dir.
mv ./samples $SAVE_CURR_DIR/$GEN_NAME/