#!/bin/bash

BEAM_SIZE=128

# Including hyper-threading. Use this if you want to exclude it:
# grep ^cpu\\scores /proc/cpuinfo | uniq |  awk '{print $4}'
MAX_PARALLELISM=`grep -c ^processor /proc/cpuinfo`

for dir in */; do
  dir=${dir%*/} # remove the trailing "/"
  echo "--- ${dir} ---"
  ./run.sh $dir $BEAM_SIZE $MAX_PARALLELISM
  echo ""
done