### Install Script

We need to install `rosette`, a modified version of Halide and LLVM >= 12.0 for Hydride. The simplest way to do this is to run the `setup.py` script in the root directory. This will install all the aforementioned dependencies, and let you know if you are missing any prereqs.

### Environment variables
Hydride uses a lot of environment variables for Halide as well as some of our Makefiles. Feel free to add these `export`s to your `~/.bashrc`. 

```bash
export HYDRIDE_ROOT=<path to your Hydride root directory>
export HALIDE_ROOT=$HYDRIDE_ROOT/halide-hydride
export HALIDE_DISTRIB=$HALIDE_ROOT/distrib
export BUILD_DIR=$HALIDE_ROOT/llvm-build
export LLVM_ROOT=$BUILD_DIR
export LLVM_CONFIG=$LLVM_ROOT/bin/llvm-config

```
