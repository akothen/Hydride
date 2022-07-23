#ifndef PROC_COMMON_H
#define PROC_COMMON_H

template<typename T>
T clamp(T val, T min, T max) {
    if (val < min)
        return min;
    if (val > max)
        return max;
    return val;
}

struct PipelineDescriptorBase {
    virtual void init() = 0;
    virtual const char *name() = 0;
    virtual int run() = 0;
    virtual bool verify(int W, int H) = 0;
    virtual void finalize() = 0;
};

constexpr int W = 1024;
constexpr int H = 1024;
constexpr int iterations = 10;

void bench_pipeline(PipelineDescriptorBase *p);

#endif