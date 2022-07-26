#!/bin/bash

################### CHANGE THESE ###################
HALIDE_ROOT=/home/sb54/halide-14
GEN_NAME=median3x3
####################################################

HALIDE_DISTRIB=$HALIDE_ROOT/distrib
HALIDE_LIB=$HALIDE_DISTRIB/lib
ADAMS_ROOT=$HALIDE_ROOT/src/autoschedulers/adams2019

# First, use run.sh to create the generator. It should create a generator in the current dir.
./run.sh $GEN_NAME > /dev/null 2>&1
GEN_EXE=/home/sb54/Hydride/hexagon-benchmarks/gen

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HALIDE_LIB
$ADAMS_ROOT/autotune_loop.sh $GEN_EXE $GEN_NAME host $ADAMS_ROOT/baseline.weights $HALIDE_ROOT/bin $HALIDE_DISTRIB samples_out