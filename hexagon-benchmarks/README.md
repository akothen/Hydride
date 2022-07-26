# Halide Hexagon Benchmarks

## Usage

There are 2 main scripts: `run.sh` and `autotune.sh`. You need to configure these two scripts.
At the top of both scripts is a clearly defined section of variables that you need to change.

`run.sh` generates an automatic schedule for a benchmark, and then runs this benchmark. A benchmark is identified by its dir. For example `./run.sh median3x3`. You can use an optional second cmd arg which is the beam size like so: `./run.sh median3x3 128`. If no second arg is provided, the default beam size is used (I think 32). Finally, you can use a third parameter, which is the max parallelism (the only parameter from `machine_params` that the `Adams2019` auto-scheduler pays attention to).

`pretrain_with_autotuning.sh` pre-trains the cost-model using auto-tuning, fitting it to a specific benchmark and machine. (This cost-model is used when auto-scheduling a benchmark with `run.sh`). You just specify the benchmark you want to auto-tune by setting the variables inside `pretrain_with_autotuning.sh`.

## Concerns

### Auto-Tuning

- It's unclear what should be the `weights_file` we feed into `autotune_loop.sh`. I assume it is the
`baseline.weights` file in the Adams2019 root dir. This is copied to the samples directory and is
updated (i.e., trained) iteratively.
- I am not sure where you should be able to use auto-tuning. In my understanding, one could use auto-tuning in two places. First, during the training of the cost-model. This is what I have enabled with `pretrain_with_autotuning.sh`. Second, during the auto-scheduling of a benchmark, i.e., instead of using only the cost-model, you interleave it with auto-tuning. I am not sure if we're supposed to (or even can) enable the latter. Probably it doesn't make sense because the pre-training is done for a specific benchmark (i.e., the model is not trained to fit only to the machine, but also to a particular benchmark/program).
- During pre-training, a `samples` directory is created and a `.weights` file is put there (initially, `baseline.weights`). It seems that these weights are updated iteratively by running `autotune_loop.sh` iteratively. To increase auto-tuning time, I'm not sure if we should just `autotune_loop.sh` multiple times, or if we should configure some other parameter inside `autotune_loop.sh`.