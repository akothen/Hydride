#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>
#include <time.h>
#include <chrono>


#include "HalideBuffer.h"


#if benchmark_gaussian3x3
#include "gaussian3x3.h"
#elif benchmark_gaussian5x5
#include "gaussian5x5.h"
#elif benchmark_sobel3x3
#include "sobel3x3.h"
#elif benchmark_blur3x3
#include "blur3x3.h"
#elif benchmark_dilate3x3
#include "dilate3x3.h"
#elif benchmark_median3x3
#include "median3x3.h"
#elif benchmark_add
#include "add.h"
#elif benchmark_mul
#include "mul.h"
#elif benchmark_average_pool
#include "average_pool.h"
#elif benchmark_idct4
#include "idct4.h"
#elif benchmark_max_pool
#include "max_pool.h"
#elif benchmark_l2norm
#include "l2norm.h"
#elif benchmark_fully_connected
#include "fully_connected.h"
#elif benchmark_conv_nn
#include "conv.h"
#endif

#define LOG2VLEN 7
#define VLEN (1<<LOG2VLEN)

#define O_CREAT_WRONLY_TRUNC (O_CREAT | O_WRONLY | O_TRUNC)

extern "C" {
    ssize_t      write(int, const void *, size_t);
}


void *aligned_malloc(size_t size, unsigned alignment) {
  void *result = NULL;
  int rc;
  rc = posix_memalign(&result, alignment, size);
  return result;
}


int write_file(int fp, unsigned char *src, int height, int width, int border_width) {
    int i;
    for(i = 0; i < height; i++) {
        if(write(fp, &src[i*width], sizeof(unsigned char)*(width))!=(width)) {
            return 1;
        }
    }
    return 0;
}

template<typename F>
long long benchmark(F op) {
    //long long start_time = q6sim_read_pcycles();

    clock_t start_cycle = clock();

    auto start_time = std::chrono::high_resolution_clock::now();

    op();


    auto end_time = std::chrono::high_resolution_clock::now();

    clock_t end_cycle = clock();

    std::chrono::duration<double> duration = end_time - start_time;


    printf("Execution took %0.4f s\n", duration.count());


    long long total_cycles =  (long long) (end_cycle - start_cycle);

    //long long total_cycles = q6sim_read_pcycles() - start_time;
    return total_cycles;
}

// This is a basic implementation of the Halide runtime for Hexagon.
void halide_print(void *user_context, const char *str) {
    if (str) {
        //log_printf("%s", str);
    }
}

void halide_error(void *user_context, const char *str) {
    if (!str) {
        //log_printf("Unknown error\n");
    } else if (*str == '\0' || str[strlen(str) - 1] != '\n') {
        //log_printf("Error: %s\n", str);
    } else {
        //log_printf("Error: %s", str);
    }
}


int main(int argc, char **argv) {

    printf("Invoked Benchmarking script!\n");
    int i, in_fp;

    constexpr int dims = 2;

    /* -----------------------------------------------------*/
    /*  Get input parameters                                */
    /* -----------------------------------------------------*/
    if (argc != 5) {
        printf("usage: %s <width> <height> <input.bin> <output.bin>\n", argv[0]);
        return 1;
    }


    int width  = atoi(argv[1]);
    int height = atoi(argv[2]);
    int stride = (width + (VLEN) - 1)&(-(VLEN));

    /* -----------------------------------------------------*/
    /*  Allocate memory for input/output                    */
    /* -----------------------------------------------------*/

    unsigned char *input  = (unsigned char *) aligned_malloc(width*height*sizeof(unsigned char), 1 << LOG2VLEN); //memalign(1 << LOG2VLEN, width*height*sizeof(unsigned char));
    unsigned char *output = (unsigned char *) aligned_malloc(width*height*4*sizeof(unsigned char),1 << LOG2VLEN ); //memalign(1 << LOG2VLEN, width*height*4*sizeof(unsigned char));

    if ( input == NULL || output == NULL ) {
        printf("Error: Could not allocate Memory for image\n");
        return 1;
    }

    /* -----------------------------------------------------*/
    /*  Read image input from file                          */
    /* -----------------------------------------------------*/
    if((in_fp = open(argv[3], O_RDONLY)) < 0 ) {
        printf("Error: Cannot open %s for input\n", argv[3]);
        return 1;
    }

    for(i = 0; i < height; i++) {
        if(read(in_fp, &input[i*width],  sizeof(unsigned char)*width)!=width) {
            printf("Error, Unable to read from %s\n", argv[3]);
            close(in_fp);
            return 1;
        }
    }
    close(in_fp);

    /* -----------------------------------------------------*/
    /*  Run benchmark on the Simulator                      */
    /* -----------------------------------------------------*/
    long long cycles;

#if benchmark_add
    halide_dimension_t x_dim{ 0, width, 1 };
    halide_dimension_t y_dim{ 0, height, width };
    halide_dimension_t shape[2] = { x_dim, y_dim };

    Halide::Runtime::Buffer<uint8_t> input1_buf(input, dims, shape);
    Halide::Runtime::Buffer<uint8_t> input2_buf(input, dims, shape);
    Halide::Runtime::Buffer<uint8_t> output_buf(output, dims, shape);

    cycles = benchmark([&]() {
            int error = add(input1_buf, 0, 100, input2_buf, 0, 100, 0, 5, 225, output_buf);
            if (error != 0) {
            printf("add pipeline failed: %d\n", error);
            }
            });

#if DEBUG
    for (int x = 0; x < 10; x++)
        for (int y = 0; y < 10; y++)
            printf("(x: %d, y: %d) ==> input-val: %d   output-val: %d\n", x, y, input1_buf(x, y), output_buf(x, y));
#endif

    printf("AppReported (): Image %dx%d - add(128B): %lld cycles (%0.4f cycles/pixel)\n", (int)width, (int)height, cycles, (float)cycles / (width * height));
#endif

#if benchmark_mul
    halide_dimension_t x_dim{ 0, width, 1 };
    halide_dimension_t y_dim{ 0, height, width };
    halide_dimension_t shape[2] = { x_dim, y_dim };

    Halide::Runtime::Buffer<uint8_t> input1_buf(input, dims, shape);
    Halide::Runtime::Buffer<uint8_t> input2_buf(input, dims, shape);
    Halide::Runtime::Buffer<uint8_t> output_buf(output, dims, shape);

    cycles = benchmark([&]() {
            int error = mul(input1_buf, 2, input2_buf, 5, 5, 10000, 1, 5, 225, output_buf);
            if (error != 0) {
            printf("mul pipeline failed: %d\n", error);
            }
            });

#if DEBUG
    for (int x = 0; x < 10; x++)
        for (int y = 0; y < 10; y++)
            printf("(x: %d, y: %d) ==> input-val: %d   output-val: %d\n", x, y, input1_buf(x, y), output_buf(x, y));
#endif

    printf("AppReported (): Image %dx%d - mul(128B): %lld cycles (%0.4f cycles/pixel)\n", (int)width, (int)height, cycles, (float)cycles / (width * height));
#endif

#if benchmark_average_pool
    halide_dimension_t c_dim{ 0, 1024, 1 };
    halide_dimension_t x_dim{ 0, width/32, 128 };
    halide_dimension_t y_dim{ 0, height/32, 128 * (width / 32) };
    halide_dimension_t b_dim{ 0, 1, 128 * (width / 32) * (height / 32) };
    halide_dimension_t shape[4] = { c_dim, x_dim, y_dim, b_dim };

    Halide::Runtime::Buffer<uint8_t> input_buf(input, 4, shape);
    Halide::Runtime::Buffer<uint8_t> output_buf(output, 4, shape);

    cycles = benchmark([&]() {
            int error = average_pool(input_buf, 2, 2, 8, 8, 5, 225, output_buf);
            if (error != 0) {
            printf("average_pool pipeline failed: %d\n", error);
            }
            });

#if DEBUG
    for (int x = 0; x < 10; x++)
        for (int y = 0; y < 10; y++)
            printf("(x: %d, y: %d) ==> input-val: %d   output-val: %d\n", x, y, input_buf(x, y), output_buf(x, y));
#endif

    printf("AppReported (): Image %dx%d - average_pool(128B): %lld cycles (%0.4f cycles/pixel)\n", (int)width, (int)height, cycles, (float)cycles / (width * height));
#endif

#if benchmark_max_pool
    halide_dimension_t c_dim{ 0, 1024, 1 };
    halide_dimension_t x_dim{ 0, width / 32, 128 };
    halide_dimension_t y_dim{ 0, height / 32, 128 * (width / 32) };
    halide_dimension_t b_dim{ 0, 1, 128 * (width / 32) * (height / 32) };
    halide_dimension_t shape[4] = { c_dim, x_dim, y_dim, b_dim };

    Halide::Runtime::Buffer<uint8_t> input_buf(input, 4, shape);
    Halide::Runtime::Buffer<uint8_t> output_buf(output, 4, shape);

    cycles = benchmark([&]() {
            int error = max_pool(input_buf, 2, 2, 8, 8, 5, 225, output_buf);
            if (error != 0) {
            printf("max_pool pipeline failed: %d\n", error);
            }
            });

#if DEBUG
    for (int x = 0; x < 10; x++)
        for (int y = 0; y < 10; y++)
            printf("(x: %d, y: %d) ==> input-val: %d   output-val: %d\n", x, y, input_buf(x, y), output_buf(x, y));
#endif

    printf("AppReported (): Image %dx%d - max_pool(128B): %lld cycles (%0.4f cycles/pixel)\n", (int)width, (int)height, cycles, (float)cycles / (width * height));
#endif


#if benchmark_idct4
    halide_dimension_t x_dim{ 0, 4, 1 };
    halide_dimension_t y_dim{ 0, 4, 4 };
    halide_dimension_t shape[2] = { x_dim, y_dim };

    // Divide by 2 because of the int16_t buffer
    int width_i16 = width / sizeof(int16_t);

    struct BufferPair {
        Halide::Runtime::Buffer<int16_t> input_buf;
        Halide::Runtime::Buffer<int16_t> output_buf;
    };

    // Create the buffers here. Don't put them inside the loop in the benchmark because then
    // constructors and destructors will be called for every iteration.
    //
    // Ideally, we'd allocate a single buffer on the stack and just reset its data pointer
    // in every iteration. But there doesn't seem to be a cheap way to do that. All the functions
    // in Runtime::Buffer call constructors etc.
    BufferPair **buffers = (BufferPair **) malloc((height/4)*sizeof(BufferPair *));
    for (int y = 0; y < height; y += 4) {
        buffers[y/4] = (BufferPair *) malloc((width_i16/4)*sizeof(BufferPair));
        for (int x = 0; x < width_i16; x += 4) {
            buffers[y/4][x/4].input_buf = Halide::Runtime::Buffer<int16_t>((int16_t *)(&input[y*width_i16 + x]), /* ndims */ 2, shape);
            buffers[y/4][x/4].output_buf = Halide::Runtime::Buffer<int16_t>((int16_t *)(&output[y*width_i16 + x]), /* ndims */ 2, shape);
        }
    }

    cycles = benchmark([&]() {
        // Notice the +4 steps. My understanding is that the idct4
        // kernel is to be applied to a 4x4 input and outputs
        // a 4x4 output.
        for (int y = 0; y < height; y += 4) {
            for (int x = 0; x < width_i16; x += 4) {
                Halide::Runtime::Buffer<int16_t> input_buf = buffers[y/4][x/4].input_buf;
                Halide::Runtime::Buffer<int16_t> output_buf = buffers[y/4][x/4].output_buf;
                int error = idct4(input_buf, output_buf);
                if (error != 0) {
                    printf("idct4 pipeline failed: %d\n", error);
                }
            }
        }
    });

    // Free the buffers
    for (int y = 0; y < height; y += 4) {
        free(buffers[y/4]);
    }
    free(buffers);

#if DEBUG
    for (int x = 0; x < 10; x++)
        for (int y = 0; y < 10; y++)
            printf("(x: %d, y: %d) ==> input-val: %d   output-val: %d\n", x, y, input_buf(x, y), output_buf(x, y));
#endif

    printf("AppReported (): Image %dx%d - idct4(128B): %lld cycles (%0.4f cycles/pixel)\n", (int)width, (int)height, cycles, (float)cycles / (width * height));
#endif


#if benchmark_idct8
    halide_dimension_t x_dim{ 0, 8, 1 };
    halide_dimension_t y_dim{ 0, 8, 8 };
    halide_dimension_t shape[2] = { x_dim, y_dim };

    // Divide by 2 because of the int16_t buffer
    int width_i16 = width / sizeof(int16_t);

    struct BufferPair {
        Halide::Runtime::Buffer<int16_t> input_buf;
        Halide::Runtime::Buffer<int16_t> output_buf;
    };

    // Create the buffers here. Don't put them inside the loop in the benchmark because then
    // constructors and destructors will be called for every iteration.
    //
    // Ideally, we'd allocate a single buffer on the stack and just reset its data pointer
    // in every iteration. But there doesn't seem to be a cheap way to do that. All the functions
    // in Runtime::Buffer call constructors etc.
    BufferPair **buffers = (BufferPair **) malloc((height/8)*sizeof(BufferPair *));
    for (int y = 0; y < height; y += 8) {
        buffers[y/8] = (BufferPair *) malloc((width_i16/8)*sizeof(BufferPair));
        for (int x = 0; x < width_i16; x += 8) {
            buffers[y/8][x/8].input_buf = Halide::Runtime::Buffer<int16_t>((int16_t *)(&input[y*width_i16 + x]), /* ndims */ 2, shape);
            buffers[y/8][x/8].output_buf = Halide::Runtime::Buffer<int16_t>((int16_t *)(&output[y*width_i16 + x]), /* ndims */ 2, shape);
        }
    }

    cycles = benchmark([&]() {
        // Notice the +4 steps. My understanding is that the idct8
        // kernel is to be applied to a 8x8 input and outputs
        // a 8x8 output.
        for (int y = 0; y < height; y += 8) {
            for (int x = 0; x < width_i16; x += 8) {
                Halide::Runtime::Buffer<int16_t> input_buf = buffers[y/8][x/8].input_buf;
                Halide::Runtime::Buffer<int16_t> output_buf = buffers[y/8][x/8].output_buf;
                int error = idct8(input_buf, output_buf);
                if (error != 0) {
                    printf("idct8 pipeline failed: %d\n", error);
                }
            }
        }
    });

    // Free the buffers
    for (int y = 0; y < height; y += 8) {
        free(buffers[y/8]);
    }
    free(buffers);

#if DEBUG
    for (int x = 0; x < 10; x++)
        for (int y = 0; y < 10; y++)
            printf("(x: %d, y: %d) ==> input-val: %d   output-val: %d\n", x, y, input_buf(x, y), output_buf(x, y));
#endif

    printf("AppReported (): Image %dx%d - idct8(128B): %lld cycles (%0.4f cycles/pixel)\n", (int)width, (int)height, cycles, (float)cycles / (width * height));
#endif




#if benchmark_l2norm
    halide_dimension_t x_dim{ 0, width, 1 };
    halide_dimension_t y_dim{ 0, height, width };
    halide_dimension_t shape[2] = { x_dim, y_dim };

    Halide::Runtime::Buffer<uint8_t> input_buf(input, dims, shape);
    Halide::Runtime::Buffer<uint8_t> output_buf(output, dims, shape);

    cycles = benchmark([&]() {
            int error = l2norm(input_buf, 0, output_buf);
            if (error != 0) {
            printf("l2norm pipeline failed: %d\n", error);
            }
            });

#if DEBUG
    for (int x = 0; x < 10; x++)
        for (int y = 0; y < 10; y++)
            printf("(x: %d, y: %d) ==> input-val: %d   output-val: %d\n", x, y, input_buf(x, y), output_buf(x, y));
#endif

    printf("AppReported (): Image %dx%d - l2norm(128B): %lld cycles (%0.4f cycles/pixel)\n", (int)width, (int)height, cycles, (float)cycles / (width * height));
#endif


#if benchmark_fully_connected
    int* bias = (int*) aligned_malloc(width * height * sizeof(int), 1 << LOG2VLEN); //(int*)memalign(1 << LOG2VLEN, width * height * sizeof(int));
    for (int i = 0; i < (width * height); i++)
        bias[i] = 10000;

    halide_dimension_t x_dim{ 0, width, 1 };
    halide_dimension_t y_dim{ 0, height, width };
    halide_dimension_t shape[2] = { x_dim, y_dim };

    halide_dimension_t i_dim{ 0, width * height, 1 };
    halide_dimension_t b_shape[2] = { i_dim };

    Halide::Runtime::Buffer<uint8_t> mat_a_(input, dims, shape);
    Halide::Runtime::Buffer<uint8_t> mat_b_(input, dims, shape);
    Halide::Runtime::Buffer<int32_t> bias_((int*)bias, 1, b_shape);
    Halide::Runtime::Buffer<uint8_t> output_(output, dims, shape);

    cycles = benchmark([&]() {
            int error = fully_connected(/* _input_buffer */ mat_a_, /* _input_zero */  3, /*_filter_buffer */  mat_b_,/* _filter_zero */ 5, 
                    /*_bias_buffer */ bias_,/* _output_zero */  7, /* _output_multiplier */  32767, /* _output_shift */ 1, /* _output_min */  
                    5, /* _output_max */ 250, /* _output_buffer */output_);
            if (error != 0) {
            printf("fully_connected pipeline failed: %d\n", error);
            }
            });

#if DEBUG
    for (int x = 0; x < 10; x++)
        for (int y = 0; y < 10; y++)
            printf("(x: %d, y: %d) ==> input-val: %d   output-val: %d\n", x, y, mat_a_(x, y), output_(x, y));
#endif

    printf("AppReported (HVX128B-mode): Image %dx%d - fully_connected(128B): %lld cycles (%0.4f cycles/pixel)\n", (int)width, (int)height, cycles, (float)cycles / (width * height));
#endif

#if benchmark_conv_nn
    int* bias = (int*)memalign(1 << LOG2VLEN, width * height * sizeof(int));
    for (int i = 0; i < (width * height); i++)
        bias[i] = 10000;

    width = 128;
    height = 128;

    halide_dimension_t c_dim{ 0, 1024, 1 };
    halide_dimension_t x_dim{ 0, width / 32, 128 };
    halide_dimension_t y_dim{ 0, height / 32, 128 * (width / 32) };
    halide_dimension_t b_dim{ 0, 1, 128 * (width / 32) * (height / 32) };
    halide_dimension_t shape[4] = { c_dim, x_dim, y_dim, b_dim };

    halide_dimension_t i_dim{ 0, width * height, 1 };
    halide_dimension_t b_shape[2] = { i_dim };

    // A 6D array of filter coefficients indexed by ci % n, co % k, ci / n, co / k, x, y,

    halide_dimension_t cim_dim{ 0, 4, 1 };
    halide_dimension_t com_dim{ 0, 4, 4 };
    halide_dimension_t cid_dim{ 0, 4, 4 * 4 };
    halide_dimension_t cod_dim{ 0, 4, 4 * 4 * 4 };
    halide_dimension_t fx_dim{ 0, 1, 4 * 4 * 4 * 4 };
    halide_dimension_t fy_dim{ 0, 1, 4 * 4 * 4 * 4 };
    halide_dimension_t f_shape[6] = { cim_dim, com_dim, cid_dim, cod_dim, x_dim, b_dim };

    Halide::Runtime::Buffer<uint8_t> input_buf(input, 4, shape);
    Halide::Runtime::Buffer<uint8_t> output_buf(output, 4, shape);
    Halide::Runtime::Buffer<uint8_t> filter_buf(input, 6, f_shape);
    Halide::Runtime::Buffer<int32_t> bias_((long*)bias, 1, b_shape);

    cycles = benchmark([&]() {
            int error = conv_nn(input_buf, 3, filter_buf, 5, bias_, 1, 1, 1, 1, 32767, 1, 3, 5, 250, output_buf);
            if (error != 0) {
            printf("conv_nn pipeline failed: %d\n", error);
            }
            });

#if DEBUG

    for (int x = 0; x < 10; x++)
        for (int y = 0; y < 10; y++)
            printf("(x: %d, y: %d) ==> input-val: %d   output-val: %d\n", x, y, input_buf(x, y), output_buf(x, y));

#endif
    printf("AppReported (): Image %dx%d - conv_nn(128B): %lld cycles (%0.4f cycles/pixel)\n", (int)width, (int)height, cycles, (float)cycles / (width * height));
#endif


#if benchmark_blur3x3
    halide_dimension_t x_dim{ 0, width/2, 1 };
    halide_dimension_t y_dim{ 0, height, width/2 };
    halide_dimension_t shape[2] = { x_dim, y_dim };

    Halide::Runtime::Buffer<uint16_t> input_buf((uint16_t*)input, dims, shape);
    Halide::Runtime::Buffer<uint16_t> output_buf((uint16_t*)output, dims, shape);

    cycles = benchmark([&]() {
            int error = blur3x3(input_buf, output_buf);
            if (error != 0) {
            printf("blur3x3 pipeline failed: %d\n", error);
            }
            });

#if DEBUG
    for (int x = 0; x < 10; x++)
        for (int y = 0; y < 10; y++)
            printf("(x: %d, y: %d) ==> input-val: %d   output-val: %d\n", x, y, input_buf(x, y), output_buf(x, y));

#endif

    printf("AppReported (): Image %dx%d - blur3x3(128B): %lld cycles (%0.4f cycles/pixel)\n", (int)width, (int)height, cycles, (float)cycles / (width * height));
#endif

#if benchmark_dilate3x3
    halide_dimension_t x_dim{ 0, width, 1 };
    halide_dimension_t y_dim{ 0, height, width };
    halide_dimension_t shape[2] = { x_dim, y_dim };

    Halide::Runtime::Buffer<uint8_t> input_buf(input, dims, shape);
    Halide::Runtime::Buffer<uint8_t> output_buf(output, dims, shape);

    cycles = benchmark([&]() {
            int error = dilate3x3(input_buf, output_buf);
            if (error != 0) {
            printf("dilate3x3 pipeline failed: %d\n", error);
            }
            });

#if DEBUG
    for (int x = 0; x < 10; x++)
        for (int y = 0; y < 10; y++)
            printf("(x: %d, y: %d) ==> input-val: %d   output-val: %d\n", x, y, input_buf(x, y), output_buf(x, y));
#endif

    printf("AppReported (): Image %dx%d - dilate3x3(128B): %lld cycles (%0.4f cycles/pixel)\n", (int)width, (int)height, cycles, (float)cycles / (width * height));
#endif


#if benchmark_sobel3x3
    halide_dimension_t x_dim{ 0, width, 1 };
    halide_dimension_t y_dim{ 0, height, width };
    halide_dimension_t shape[2] = { x_dim, y_dim };

    Halide::Runtime::Buffer<uint8_t> input_buf(input, dims, shape);
    Halide::Runtime::Buffer<uint8_t> output_buf(output, dims, shape);

    cycles = benchmark([&]() {
            int error = sobel3x3(input_buf, output_buf);
            if (error != 0) {
            printf("sobel3x3 pipeline failed: %d\n", error);
            }
            });
#if DEBUG
    for (int x = 0; x < 10; x++)
        for (int y = 0; y < 10; y++)
            printf("(x: %d, y: %d) ==> input-val: %d   output-val: %d\n", x, y, input_buf(x, y), output_buf(x, y));
#endif

    printf("AppReported (): Image %dx%d - sobel3x3(128B): %lld cycles (%0.4f cycles/pixel)\n", (int)width, (int)height, cycles, (float)cycles / (width * height));
#endif


#if benchmark_gaussian3x3
    halide_dimension_t x_dim{ 0, width, 1 };
    //halide_dimension_t y_dim{ 1, height-1, width };
    halide_dimension_t y_dim{ 1, height, width };
    halide_dimension_t shape[2] = { x_dim, y_dim };

    Halide::Runtime::Buffer<uint8_t> input_buf(input, dims, shape);
    Halide::Runtime::Buffer<uint8_t> output_buf(output, dims, shape);

    // Run in 128 byte mode
    cycles = benchmark([&]() {
            int error = gaussian3x3(input_buf, output_buf);
            if (error != 0) {
            printf("gaussian3x3 pipeline failed: %d\n", error);
            }
            });

#if DEBUG
    for (int x = 0; x < 10; x++)
        for (int y = 0; y < 10; y++)
            printf("(x: %d, y: %d) ==> input-val: %d   output-val: %d, true-val: %d\n", x, y, input_buf(x, y), output_buf(x, y),

                    ((static_cast<int16_t>(input_buf(x-1, y-1)) * 1 + static_cast<int16_t>(input_buf(x, y-1)) * 2 + static_cast<int16_t>(input_buf(x+1, y-1)) * 1 +
                      static_cast<int16_t>(input_buf(x-1, y)) * 2 + static_cast<int16_t>(input_buf(x, y)) * 4 + static_cast<int16_t>(input_buf(x+1, y)) * 2 +
                      static_cast<int16_t>(input_buf(x-1, y+1)) * 1 + static_cast<int16_t>(input_buf(x, y+1)) * 2 + static_cast<int16_t>(input_buf(x+1, y+1) * 1)) + 8) >> 4

                  );
#endif

    printf("AppReported (): Image %dx%d - gaussian3x3(128B): %lld cycles (%0.4f cycles/pixel)\n", (int)width, (int)height, cycles, (float)cycles / (width * height));
#endif

#if benchmark_gaussian5x5
    halide_dimension_t x_dim{0, width, 1};
    halide_dimension_t y_dim{0, height, width};
    halide_dimension_t shape[2] = {x_dim, y_dim};

    Halide::Runtime::Buffer<uint8_t> input_buf(input, dims, shape);
    Halide::Runtime::Buffer<uint8_t> output_buf(output, dims, shape);

    // Run in 128 byte mode
    cycles = benchmark([&]() {
            int error = gaussian5x5(input_buf, output_buf);
            if (error != 0) {
            printf("gaussian5x5 pipeline failed: %d\n", error);
            }
            });

#if DEBUG
    for (int x=0; x<10; x++)
        for (int y=0; y<10; y++)
            printf("(x: %d, y: %d) ==> input-val: %d   output-val: %d\n", x, y, input_buf(x, y), output_buf(x, y));
#endif

    printf("AppReported (): Image %dx%d - gaussian5x5(128B): %lld cycles (%0.4f cycles/pixel)\n", (int)width, (int)height, cycles, (float)cycles/(width*height));
#endif



#if benchmark_median3x3
    printf("\t*** median3x3\n");
    halide_dimension_t x_dim{ 0, width, 1 };
    halide_dimension_t y_dim{ 0, height, width };
    halide_dimension_t shape[2] = { x_dim, y_dim };

    Halide::Runtime::Buffer<uint8_t> input_buf(input, dims, shape);
    Halide::Runtime::Buffer<uint8_t> output_buf(output, dims, shape);

    cycles = benchmark([&]() {
            int error = median3x3(input_buf, output_buf);
            if (error != 0) {
            printf("median3x3 pipeline failed: %d\n", error);
            }
            });
#if DEBUG

    for (int x = 0; x < 10; x++)
        for (int y = 0; y < 10; y++)
            printf("(x: %d, y: %d) ==> input-val: %d   output-val: %d\n", x, y, input_buf(x, y), output_buf(x, y));
#endif

    printf("AppReported (): Image %dx%d - median3x3(128B): %lld cycles (%0.4f cycles/pixel)\n", (int)width, (int)height, cycles, (float)cycles / width / height);
#endif

    /* -----------------------------------------------------*/
    /*  Write output image to file                          */
    /* -----------------------------------------------------*/
    /*
    char *filename = (char *) malloc(100 * sizeof(char));
    strcpy(filename, argv[4]);
    int out_fp;

    
    if((out_fp = open(filename, O_CREAT_WRONLY_TRUNC, 0777)) < 0)
    {
        printf("Error: Cannot open %s for output\n", filename);
        return 1;
    }
    if(write_file(out_fp, output, height, width, 2) != 0) {
        printf("Error: Cannot write to file %s\n", filename);
    }

    close(out_fp);

    free(input);
    free(output);
    free(filename);
*/
    printf("Success!\n");

    return 0;
}

