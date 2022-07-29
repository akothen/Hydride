#!/bin/bash

################### CHANGE THESE ###################
HALIDE_ROOT=/home/sb54/Hydride/hexagon-benchmarks/halide_standalone_autoscheduler
GEN_NAME=median3x3
####################################################

# First, use run.sh to create the generator. It should create a generator in the current dir.
# ./run.sh $GEN_NAME > /dev/null 2>&1
GEN_EXE=/home/sb54/Hydride/hexagon-benchmarks/gen

HALIDE_INCLUDE=$HALIDE_ROOT/distrib/include
HALIDE_TOOLS=$HALIDE_ROOT/distrib/tools
HALIDE_LIB=$HALIDE_ROOT/distrib/lib
HALIDE_AUTOSCHED=$HALIDE_ROOT/apps/autoscheduler

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HALIDE_LIB
SAVE_CURR_DIR=$PWD
echo $SAVE_CURR_DIR

# autotune_loop.sh uses relative paths so we need to do this
cd $HALIDE_AUTOSCHED
# This will create a directory `samples` in the current path. Delete it if you want to start over
# the auto-tuning, otherwise these weights are iteratively improved.
./autotune_loop.sh $GEN_EXE	$GEN_NAME	host ./weights ./bin

# It seems it's ok to use `./weights` (i.e., apps/autoscheduler/weights) dir as initial weights.
# This is what they do for apps/blur, but also these are the weights that are pre-trained. We update
# them when auto-tuning a program _locally_ (i.e., we don't touch/destroy the initial/pre-trained weights)