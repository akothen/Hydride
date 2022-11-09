#!/bin/bash

HALIDE_DISTRIB="/home/sb54/halide-12/distrib"

export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${HALIDE_DISTRIB}/lib
./sbc 1920 1080 ../../../test_vectors/football1920x1080.bin