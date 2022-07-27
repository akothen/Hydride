# Halide Hexagon Benchmarks

## Usage

There are 2 main scripts: `run.sh` and `autotune.sh`. You need to configure these two scripts.
At the top of both scripts is a clearly defined section of variables that you need to change.

`run.sh` generates an automatic schedule for a benchmark, and then runs this benchmark. A benchmark is identified by its dir. For example `./run.sh median3x3`. Here's the full usage of this script:
```bash
./run.sh <bench_dir> <beam_size> <num_passes> <max_parallelism>
```
- `bench_dir`: The directory that has the source for the benchmark, for example `median3x3`.
- `beam_size`: If the beam size is `k`, the top `k`
states make it into the next round of the beam search. **Default is 32** ([link](https://github.com/halide/Halide/blob/7821212403aaa1f93ed3ece070984817de1cc6b1/src/autoschedulers/adams2019/AutoSchedule.cpp#L24)). See the paper in the current dir, which has some highlighted text regarding beam size.
- `num_passes`: The number of passes used. **Default is 5 unless beam size is 1** (it's mentioned in the paper but also [link](https://github.com/halide/Halide/blob/7821212403aaa1f93ed3ece070984817de1cc6b1/src/autoschedulers/adams2019/AutoSchedule.cpp#L480)). See the highlighted text in the paper.
- `max_parallelism`: The max parallelism (the only parameter from `machine_params` that the `Adams2019` auto-scheduler pays attention to).

`pretrain_with_autotuning.sh` pre-trains the cost-model using auto-tuning, fitting it to a specific benchmark and machine. (This cost-model is used when auto-scheduling a benchmark with `run.sh`). You just specify the benchmark you want to auto-tune by setting the variables inside `pretrain_with_autotuning.sh`.

## Notes and Concerns

### Auto-Tuning

- It's unclear what should be the `weights_file` we feed into `autotune_loop.sh`. I assume it is the
`baseline.weights` file in the Adams2019 root dir. This is copied to the samples directory and is
updated (i.e., trained) iteratively.

- The model is not trained for the machine, but for the combination machine+program. In other words, we don't fit the model just to the machine but also to a specific schedule, that's why in the pre-training step which uses auto-tuning, we specify a specific benchmark/program (a generator in Halide terms). This is also why there doesn't seem to be a way to enable auto-tuning while auto-scheduling a specific benchmark; because we are supposed to have already run the pre-training, which has used auto-tuning and beam search for this particular program. See Section 4.3 in the paper.

- During pre-training, a `samples` directory is created and a `.weights` file is put there (initially, `baseline.weights`). It seems that these weights are updated iteratively by running `autotune_loop.sh` iteratively. To increase auto-tuning time, I'm not sure if we should just `autotune_loop.sh` multiple times, or if we should configure some other parameter inside `autotune_loop.sh`.