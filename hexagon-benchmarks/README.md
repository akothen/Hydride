# Halide Hexagon Benchmarks

## Auto-Scheduling without Auto-Tuning

Use `run.sh`. It generates an automatic schedule for a benchmark (using only the cost-model, without auto-tuning), and then runs this benchmark. A benchmark is identified by its dir. For example `./run.sh median3x3`. Here's the full usage of this script:
```bash
./run.sh <bench_dir> <beam_size> <num_passes> <max_parallelism>
```
- `bench_dir`: The directory that has the source for the benchmark, for example `median3x3`.
- `beam_size`: If the beam size is `k`, the top `k`
states make it into the next round of the beam search. **Default is 32** ([link](https://github.com/halide/Halide/blob/7821212403aaa1f93ed3ece070984817de1cc6b1/src/autoschedulers/adams2019/AutoSchedule.cpp#L24)). See the paper in the current dir, which has some highlighted text regarding beam size.
- `num_passes`: The number of passes used. **Default is 5 unless beam size is 1** (it's mentioned in the paper but also [link](https://github.com/halide/Halide/blob/7821212403aaa1f93ed3ece070984817de1cc6b1/src/autoschedulers/adams2019/AutoSchedule.cpp#L480)). See the highlighted text in the paper.
- `max_parallelism`: The max parallelism (the only parameter from `machine_params` that the `Adams2019` auto-scheduler pays attention to).

## Auto-Scheduling with Auto-Tuning

`autotune_program.sh` auto-tunes a specific program. You just specify the benchmark you want to auto-tune by setting the variables inside `autotune_program.sh`. Notice that auto-tuning simultaneously trains the cost-model to fit this
particular program, and implicitly, the machine we're auto-tuning on.

## Pre-Training

Theoretically, you should have pre-trained the cost-model before running either `run.sh` or `autotune_program.sh`. We will do that to align with what the paper says. That said, [according to A. Adams](https://github.com/halide/Halide/discussions/6060#discussioncomment-788041), for few/specific apps, it makes more sense to just auto-tune instead of taking the effort to pre-train. This makes sense if you consider what pre-training actually does. As a reminder (from above), when auto-tuning a specific program, we train the model to fit this particular program and implicitly the hardware we're running on (because the schedules that behave well on this hardware are automatically favored through training). Pre-training is basically doing the same thing but for a bunch of _randomly generated_ programs. This means that the cost-model is now fit to the "average" of all these and in the hardware. But since the programs are randomly generated, they cancel each other out and what is left is the hardware (i.e., the cost-model has been fit just to the hardware).

Now, suppose that you want to auto-schedule a specific program. Pre-training is profitable probably only if you're planning to not use auto-tuning or if you plan to use minimal auto-tuning. This is why it makes sense to not pre-train for a couple of apps, because you can spend all your auto-tuning time budget fitting the model to these specific apps instead of wasting time training a generally good cost-model. If, OTOH, you want to auto-schedule hundeds of programs, then it makes sense to pre-train _once_, and then auto-tune lightly for each program.

Let me now present the steps to reproduce the pre-training process. It's kind of hacky because a) it's based on a bunch of scripts that were probably made robust enought to work for the paper, and not for general usage, b) we don't have any good instructions. The best we have is [this](https://github.com/halide/Halide/discussions/6060), which doesn't help a lot.

### Download the Halide branch of the auto-scheduler
```bash
git clone https://github.com/halide/Halide --branch standalone_autoscheduler --single-branch halide_standalone_autoscheduler
```

### Obtain LLVM 6

The README of the `standalone_autoscheduler` branch says that it can be compiled with LLVM 6 or higher. I have LLVM 14 and it didn't work. So, I just download a binary version of LLVM 6 (from [here](https://releases.llvm.org/download.html)). Extract it and you should be good to go.

Then, point Halide to it:
```bash
export LLVM_CONFIG=<path to llvm>/bin/llvm-config
export CLANG=<path to llvm>/bin/clang
```

### Build the Halide auto-scheduler branch

Just hit `make -j` in the root of the folder you cloned. Make sure there are no errors.

### Compile `apps/random_pipeline`

The directory `apps/random_pipeline` contains the code for the random (Halide) program (or pipeline in Halide terms) generator and pre-training. Ideally, after having built the branch, you should have been able to `cd` there, hit `make` and be good to go. However, that doesn't work for some reason, so we have to do some more work.

The first reason `make` fails (for me) is because it doesn't find some required files that the `Makefile` includes. I solved that by going to the branch root dir, and hitting `make test_apps`. This didn't fully succeed (it stopped while trying to build `fft`), but it did create the necessary files so that `apps/random_pipeline/Makefile` doesn't have non-existent includes.

### "Solve" the `IRMutator2` issue

Now, if you go to the `random_pipeline` dir and hit `make ./bin/random_pipeline.generator` to compile the random pipeline generator, you may see another error, that `Internal::IRMutator2` does not exist. I was not able to find the root of this problem. I `grep`'d the whole Halide directory and I couldn't find any definition of `IRMutator2`. The closest to solving it I could do is a **BIG HACK**. So, I just replaced `IRMutator2` with `IRMutator` and it just worked...

After that, `make ./bin/random_pipeline.generator` should run
successfully.

### Make `autotune_loop.sh` a Bash script (NOW YOU CAN RUN IT TO PRE-TRAIN THE MODEL)

If you try to run `autotune_loop.sh` now, and you're not running
it from a Bash shell, it may not work. Go to the top of the file
and add `#!/bin/bash`.

Now, you should be able to just do `./autotune_loop.sh`.

### Make benchmarks compatible with the 2019 infra

If you just run `./autotune_loop.sh`, it will train the model as it appears in the branch `standalone_autoscheduler` from 2019. Which means then to auto-schedule the Hexagon benchmarks, you need to use this branch. The problem is that since 2019, the Halide API has changed, and thus the benchmarks in their 2022 version, when compiled (to generators), can't be hooked up with old auto-scheduler. Thankfully, they used the same hexagon benchmarks back in 2019: https://github.com/halide/Halide/tree/standalone_autoscheduler/apps/hexagon_benchmarks. We need to do minimal changes to make them ready for auto-scheduling.

An alternative solution would be to run the old `random_pipeline/autotune_loop.sh` but instead of hooking the old auto-scheduler (i.e., `apps/autoscheduler/bin/libauto_schedule.so`), to hook the cunrrent one. That won't work, however, because `random_pipeline.generator` does not work with the current auto-scheduler. But suppose that you ignore that. You also need to replace `train_cost_model` (at the bottom of the file), to call the current `retrain_cost_model`. I'm not sure if that will be a correct translation. For one, it assumes that the samples that `train_cost_model` consumes (and that `random_pipeline/autotune_loop.sh`) creates are in the same format as those consumed by `retrain_cost_model`. And even then, we can't be sure that `retrain_cost_model` works as `train_cost_model` worked back when the paper was created.

Now, to enable auto-scheduling in the benchmarks, you do the usual `if (auto_schedule)` etc. But you can't use `set_estimates()`, so you have to do sth like this:
```
input.dim(0).set_bounds_estimate(0, 1024).dim(1).set_bounds_estimate(0, 1024);
```

## Questions to Halide people

1) Where's `IRMutator2` (see above) ?