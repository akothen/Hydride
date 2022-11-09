#!/bin/bash

HALIDE_DISTRIB="/home/sb54/halide-12/distrib"
LLVM_ROOT="/home/sb54/llvm-12"

g++ --std=c++17 -fno-rtti -O3 -DLOG2VLEN=7 \
    -I ${HALIDE_DISTRIB}/include -I ${HALIDE_DISTRIB}/tools \
    -g sbc.cpp \
    -o sbc \
    -L ${HALIDE_DISTRIB}/lib -lHalide `${LLVM_ROOT}/bin/llvm-config --system-libs --link-static`