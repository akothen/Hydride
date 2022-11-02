#!/bin/bash

add_best_sample_for_bench () {
  bench=$1
  if [ ! -d "${bench}/samples" ]; then
    echo "SAMPLES DIR DOES NOT EXIST; AUTOTUNE THE BENCH FIRST!"
    return
  fi
  read -r s < "${bench}/samples/best.${bench}.benchmark.txt"
  [[ $s =~ "in file".* ]]
  match=$BASH_REMATCH
  read -a split <<< "$match"
  best_sample="${split[2]}"
  best_dir=`dirname $best_sample`
  full_dir="${best_dir}"

  # Create the .ll for the .bc
  bc=`find $full_dir -name "*.bc" -type f`
  # llvm-dis puts the .ll file automatically in the same dir
  ~/llvm-12/bin/llvm-dis $bc
  
  git add $full_dir
}

BENCHMARKS="gaussian3x3 blur3x3 fully_connected"

for bench in $BENCHMARKS
do
  add_best_sample_for_bench "${bench}"
done