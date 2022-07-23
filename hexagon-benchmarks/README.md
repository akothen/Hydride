# Halide Hexagon Benchmarks

## Usage

You can generate an automatic schedule for a benchmark, and then run this benchmark using `run.sh` and the name of the dir. For example `./run.sh median3x3`. You can use an optional second cmd arg which
is the beam size like so: `./run.sh median3x3 128`. If no second arg is provided, the default beam
size is used (I think 32). Finally, you can use a third parameter, which is the max parallelism (the
only parameter from `machine_params` that the `Adams2019` auto-scheduler pays attention to).

I haven't yet found a way to enable auto-tuning (i.e., running actual samples) and it doesn't seem to be simple. [This whole script](https://github.com/halide/Halide/blob/main/src/autoschedulers/adams2019/autotune_loop.sh) seems to be concerned with orchestrating auto-tuning.