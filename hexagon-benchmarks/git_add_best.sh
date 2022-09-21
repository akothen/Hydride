#!/bin/bash

add_best_sample_for_bench () {
  bench=$1
  if [ ! -d "${bench}/samples" ]; then
    echo "SAMPLES DIR DOES NOT EXIST; AUTOTUNE THE BENCH FIRST!"
    return
  fi
  read -r s < "${bench}/samples/best.txt"
  [[ $s =~ "in file".* ]]
  match=$BASH_REMATCH
  read -a split <<< "$match"
  best_sample="${split[2]}"
  best_dir=`dirname $best_sample`
  full_dir="${bench}/${best_dir}"

  # Create the .ll for the .bc
  bc=`find $full_dir -name "*.bc" -type f`
  # llvm-dis puts the .ll file automatically in the same dir
  llvm-dis $bc
  
  git add $full_dir
}

BENCHMARKS="box_blur camera_pipe conv3x3a16 conv3x3a32 dilate3x3 gaussian5x5 mat_mul median3x3 sobel"

for bench in $BENCHMARKS
do
  add_best_sample_for_bench "${bench}"
done
