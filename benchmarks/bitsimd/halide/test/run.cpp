#include <chrono>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>

#include "HalideBuffer.h"
#include <vector>

#if benchmark_gaussian3x3
#include "gaussian3x3.h"
#elif benchmark_simple
#include "simple.h"
#elif benchmark_simple_add
#include "simple_add.h"
#elif benchmark_relu
#include "relu.h"
#elif benchmark_gaussian5x5
#include "gaussian5x5.h"
#elif benchmark_gaussian7x7
#include "gaussian7x7.h"
#elif benchmark_sobel3x3
#include "sobel3x3.h"
#elif benchmark_sobel5x5
#include "sobel5x5.h"
#elif benchmark_blur3x3
#include "blur3x3.h"
#elif benchmark_blur5x5
#include "blur5x5.h"
#elif benchmark_blur7x7
#include "blur7x7.h"
#elif benchmark_dilate3x3
#include "dilate3x3.h"
#elif benchmark_dilate5x5
#include "dilate5x5.h"
#elif benchmark_dilate7x7
#include "dilate7x7.h"
#elif benchmark_median3x3
#include "median3x3.h"
#elif benchmark_add
#include "add.h"
#elif benchmark_mul
#include "mul.h"
#elif benchmark_average_pool
#include "average_pool.h"
#elif benchmark_average_pool_add
#include "average_pool_add.h"
#elif benchmark_idct4
#include "idct4.h"
#elif benchmark_idct8
#include "idct8.h"
#elif benchmark_sbc
#include "sbc.h"
#elif benchmark_max_pool
#include "max_pool.h"
#elif benchmark_max_pool_add
#include "max_pool_add.h"
#elif benchmark_l2norm
#include "l2norm.h"
#elif benchmark_fully_connected
#include "fully_connected.h"
#elif benchmark_conv_nn
#include "conv_nn.h"
#elif benchmark_conv3x3a16
#include "conv3x3a16.h"
#elif benchmark_softmax
#include "softmax.h"
#elif benchmark_matmul_256
#include "matmul_256.h"
#elif benchmark_bitsimd_matmul
#include "bitsimd_matmul.h"
#elif benchmark_matmul_256_32bit
#include "matmul_256_32bit.h"
#elif benchmark_matmul_256_32bit_bias_add
#include "matmul_256_32bit_bias_add.h"
#elif benchmark_matmul_256_32bit_bias_add_relu
#include "matmul_256_32bit_bias_add_relu.h"
#elif benchmark_matmul_256_32bit_bias_add_gelu
#include "matmul_256_32bit_bias_add_gelu.h"
#elif benchmark_matmul_256_32bit_bias_add_add
#include "matmul_256_32bit_bias_add_add.h"
#elif benchmark_matmul_bias_relu_matmul
#include "matmul_bias_relu_matmul.h"

#elif benchmark_matmul_bias_gelu_matmul
#include "matmul_bias_gelu_matmul.h"
#elif benchmark_batched_matmul_256_32bit
#include "batched_matmul_256_32bit.h"
#elif benchmark_matmul_1024_32bit
#include "matmul_1024_32bit.h"
#elif benchmark_handtune_matmul
#include "handtune_matmul.h"
#elif benchmark_depthwise_conv
#include "depthwise_conv.h"
#endif

#define LOG2VLEN 7
#define VLEN (1 << LOG2VLEN)

#define O_CREAT_WRONLY_TRUNC (O_CREAT | O_WRONLY | O_TRUNC)

#define NUM_ITERATIONS 1
#define WARMUP 0

extern "C" {
ssize_t write(int, const void *, size_t);
}

void *aligned_malloc(size_t size, unsigned alignment) {
  void *result = NULL;
  int rc;
  rc = posix_memalign(&result, alignment, size);
  return result;
}

int write_file(int fp, unsigned char *src, int height, int width,
               int border_width) {
  int i;
  for (i = 0; i < height; i++) {
    if (write(fp, &src[i * width], sizeof(unsigned char) * (width)) !=
        (width)) {
      return 1;
    }
  }
  return 0;
}

template <typename F> float benchmark(F op) {

  // Run for WARMUP iterations to warm up
  for (int i = 0; i < WARMUP; i++) {
    op();
  }


  for (int i = 0; i < NUM_ITERATIONS; i++) {
    op();
  }

  return 0.0;
}

// This is a basic implementation of the Halide runtime for Hexagon.
void halide_print(void *user_context, const char *str) {
  if (str) {
    // log_printf("%s", str);
  }
}

void halide_error(void *user_context, const char *str) {
  if (!str) {
    // log_printf("Unknown error\n");
  } else if (*str == '\0' || str[strlen(str) - 1] != '\n') {
    // log_printf("Error: %s\n", str);
  } else {
    // log_printf("Error: %s", str);
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

  int width = atoi(argv[1]);
  int height = atoi(argv[2]);
  int stride = (width + (VLEN)-1) & (-(VLEN));

  /* -----------------------------------------------------*/
  /*  Allocate memory for input/output                    */
  /* -----------------------------------------------------*/

  unsigned char *input = (unsigned char *)aligned_malloc(
      width * height * sizeof(unsigned int),
      1 << LOG2VLEN); // memalign(1 << LOG2VLEN, width*height*sizeof(unsigned
                      // char));
  unsigned char *output = (unsigned char *)aligned_malloc(
      width * height * 4 * sizeof(unsigned int),
      1 << LOG2VLEN); // memalign(1 << LOG2VLEN, width*height*4*sizeof(unsigned
                      // char));

  if (input == NULL || output == NULL) {
    printf("Error: Could not allocate Memory for image\n");
    return 1;
  }

  /* -----------------------------------------------------*/
  /*  Read image input from file                          */
  /* -----------------------------------------------------*/
  if ((in_fp = open(argv[3], O_RDONLY)) < 0) {
    printf("Error: Cannot open %s for input\n", argv[3]);
    return 1;
  }

  for (i = 0; i < height; i++) {
    if (read(in_fp, &input[i * width], sizeof(unsigned char) * width) !=
        width) {
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
  halide_dimension_t x_dim{0, width, 1};
  halide_dimension_t y_dim{0, height, width};
  halide_dimension_t shape[2] = {x_dim, y_dim};

  Halide::Runtime::Buffer<uint8_t> input1_buf(input, dims, shape);
  Halide::Runtime::Buffer<uint8_t> input2_buf(input, dims, shape);
  Halide::Runtime::Buffer<uint8_t> output_buf(output, dims, shape);

  benchmark([&]() {
    int error =
        add(input1_buf, 0, 100, input2_buf, 0, 100, 0, 5, 225, output_buf);
    if (error != 0) {
      printf("add pipeline failed: %d\n", error);
    }
  });

#if DEBUG
  for (int x = 0; x < 10; x++)
    for (int y = 0; y < 10; y++)
      printf("(x: %d, y: %d) ==> input-val: %d   output-val: %d\n", x, y,
             input1_buf(x, y), output_buf(x, y));
#endif

  printf("AppReported (): Image %dx%d - add(128B): %lld cycles (%0.4f "
         "cycles/pixel)\n",
         (int)width, (int)height, cycles, (float)cycles / (width * height));
#endif

#if benchmark_mul
  halide_dimension_t x_dim{0, width, 1};
  halide_dimension_t y_dim{0, height, width};
  halide_dimension_t shape[2] = {x_dim, y_dim};

  Halide::Runtime::Buffer<uint8_t> input1_buf(input, dims, shape);
  Halide::Runtime::Buffer<uint8_t> input2_buf(input, dims, shape);
  Halide::Runtime::Buffer<uint8_t> output_buf(output, dims, shape);

  benchmark([&]() {
    int error =
        mul(input1_buf, 2, input2_buf, 5, 5, 10000, 1, 5, 225, output_buf);
    if (error != 0) {
      printf("mul pipeline failed: %d\n", error);
    }
  });

#if DEBUG
  for (int x = 0; x < 10; x++)
    for (int y = 0; y < 10; y++)
      printf("(x: %d, y: %d) ==> input-val: %d   output-val: %d\n", x, y,
             input1_buf(x, y), output_buf(x, y));
#endif

  printf("AppReported (): Image %dx%d - mul(128B): %lld cycles (%0.4f "
         "cycles/pixel)\n",
         (int)width, (int)height, cycles, (float)cycles / (width * height));
#endif

#if benchmark_softmax
  halide_dimension_t x_dim{0, width, 1};
  halide_dimension_t y_dim{0, height, width};
  halide_dimension_t shape[2] = {x_dim, y_dim};

  Halide::Runtime::Buffer<uint8_t> input_buf(input, dims, shape);
  Halide::Runtime::Buffer<uint8_t> output_buf(output, dims, shape);

  float exec_time = benchmark([&]() {
    int error = softmax(input_buf, 0, 100, 0, 5, 225, output_buf);
    if (error != 0) {
      printf("softmax pipeline failed: %d\n", error);
    }
  });

  for (int x = 0; x < 10; x++)
    for (int y = 0; y < 10; y++)
      printf("(x: %d, y: %d) ==> input-val: %d   output-val: %d\n", x, y,
             input_buf(x, y), output_buf(x, y));

  printf("AppReported (HVX128B-mode): Image %dx%d - softmax(128B): %lld cycles "
         "(%0.4f cycles/pixel)\n",
         (int)width, (int)height, cycles, (float)cycles / width / height);

  printf("Execution took %0.4f s\n", exec_time);
#endif

#if benchmark_average_pool
  halide_dimension_t c_dim{0, 1024, 1};
  halide_dimension_t x_dim{0, width / 32, 128};
  halide_dimension_t y_dim{0, height / 32, 128 * (width / 32)};
  halide_dimension_t b_dim{0, 1, 128 * (width / 32) * (height / 32)};
  halide_dimension_t shape[4] = {c_dim, x_dim, y_dim, b_dim};

  Halide::Runtime::Buffer<uint8_t> input_buf(input, 4, shape);
  Halide::Runtime::Buffer<uint8_t> output_buf(output, 4, shape);

  benchmark([&]() {
    int error = average_pool(input_buf, 2, 2, 8, 8, 5, 225, output_buf);
    if (error != 0) {
      printf("average_pool pipeline failed: %d\n", error);
    }
  });

#if DEBUG
  for (int x = 0; x < 10; x++)
    for (int y = 0; y < 10; y++)
      printf("(x: %d, y: %d) ==> input-val: %d   output-val: %d\n", x, y,
             input_buf(x, y), output_buf(x, y));
#endif

  printf("AppReported (): Image %dx%d - average_pool(128B): %lld cycles (%0.4f "
         "cycles/pixel)\n",
         (int)width, (int)height, cycles, (float)cycles / (width * height));
#endif

#if benchmark_average_pool_add
  halide_dimension_t c_dim{0, 1024, 1};
  halide_dimension_t x_dim{0, width / 32, 128};
  halide_dimension_t y_dim{0, height / 32, 128 * (width / 32)};
  halide_dimension_t b_dim{0, 1, 128 * (width / 32) * (height / 32)};
  halide_dimension_t shape[4] = {c_dim, x_dim, y_dim, b_dim};

  Halide::Runtime::Buffer<uint8_t> input_buf(input, 4, shape);
  Halide::Runtime::Buffer<uint8_t> output_buf(output, 4, shape);

  benchmark([&]() {
    int error =
        average_pool_add(input_buf, input_buf, 2, 2, 8, 8, 5, 225, output_buf);
    if (error != 0) {
      printf("average_pool_add pipeline failed: %d\n", error);
    }
  });

#if DEBUG
  for (int x = 0; x < 10; x++)
    for (int y = 0; y < 10; y++)
      printf("(x: %d, y: %d) ==> input-val: %d   output-val: %d\n", x, y,
             input_buf(x, y), output_buf(x, y));
#endif

  printf("AppReported (): Image %dx%d - average_pool_add(128B): %lld cycles "
         "(%0.4f cycles/pixel)\n",
         (int)width, (int)height, cycles, (float)cycles / (width * height));
#endif

#if benchmark_max_pool
  halide_dimension_t c_dim{0, 1024, 1};
  halide_dimension_t x_dim{0, width / 32, 128};
  halide_dimension_t y_dim{0, height / 32, 128 * (width / 32)};
  halide_dimension_t b_dim{0, 1, 128 * (width / 32) * (height / 32)};
  halide_dimension_t shape[4] = {c_dim, x_dim, y_dim, b_dim};

  Halide::Runtime::Buffer<int32_t> input_buf((int32_t*)input, 4, shape);
  Halide::Runtime::Buffer<int32_t> output_buf((int32_t*)output, 4, shape);

  benchmark([&]() {
    int error = max_pool(input_buf, 2, 2, 8, 8, 5, 225, output_buf);
    if (error != 0) {
      printf("max_pool pipeline failed: %d\n", error);
    }
  });

#if DEBUG
  for (int x = 0; x < 10; x++)
    for (int y = 0; y < 10; y++)
      printf("(x: %d, y: %d) ==> input-val: %d   output-val: %d\n", x, y,
             input_buf(x, y), output_buf(x, y));
#endif

  printf("AppReported (): Image %dx%d - max_pool(128B): %lld cycles (%0.4f "
         "cycles/pixel)\n",
         (int)width, (int)height, cycles, (float)cycles / (width * height));
#endif

#if benchmark_max_pool_add
  halide_dimension_t c_dim{0, 1024, 1};
  halide_dimension_t x_dim{0, width / 32, 128};
  halide_dimension_t y_dim{0, height / 32, 128 * (width / 32)};
  halide_dimension_t b_dim{0, 1, 128 * (width / 32) * (height / 32)};
  halide_dimension_t shape[4] = {c_dim, x_dim, y_dim, b_dim};

  Halide::Runtime::Buffer<uint8_t> input_buf(input, 4, shape);
  Halide::Runtime::Buffer<uint8_t> output_buf(output, 4, shape);

  benchmark([&]() {
    int error =
        max_pool_add(input_buf, input_buf, 2, 2, 8, 8, 5, 225, output_buf);
    if (error != 0) {
      printf("max_pool_add pipeline failed: %d\n", error);
    }
  });

#if DEBUG
  for (int x = 0; x < 10; x++)
    for (int y = 0; y < 10; y++)
      printf("(x: %d, y: %d) ==> input-val: %d   output-val: %d\n", x, y,
             input_buf(x, y), output_buf(x, y));
#endif

  printf("AppReported (): Image %dx%d - max_pool(128B): %lld cycles (%0.4f "
         "cycles/pixel)\n",
         (int)width, (int)height, cycles, (float)cycles / (width * height));
#endif

#if benchmark_idct4
  halide_dimension_t x_dim{0, 4, 1};
  halide_dimension_t y_dim{0, 4, 4};
  halide_dimension_t shape[2] = {x_dim, y_dim};

  // Divide by 2 because of the int16_t buffer
  int width_i16 = width / sizeof(int16_t);

  struct BufferPair {
    Halide::Runtime::Buffer<int16_t> input_buf;
    Halide::Runtime::Buffer<int16_t> output_buf;
  };

  // Create the buffers here. Don't put them inside the loop in the benchmark
  // because then constructors and destructors will be called for every
  // iteration.
  //
  // Ideally, we'd allocate a single buffer on the stack and just reset its data
  // pointer in every iteration. But there doesn't seem to be a cheap way to do
  // that. All the functions in Runtime::Buffer call constructors etc.
  BufferPair **buffers =
      (BufferPair **)malloc((height / 4) * sizeof(BufferPair *));
  for (int y = 0; y < height; y += 4) {
    buffers[y / 4] = (BufferPair *)malloc((width_i16 / 4) * sizeof(BufferPair));
    for (int x = 0; x < width_i16; x += 4) {
      buffers[y / 4][x / 4].input_buf = Halide::Runtime::Buffer<int16_t>(
          (int16_t *)(&input[y * width_i16 + x]), /* ndims */ 2, shape);
      buffers[y / 4][x / 4].output_buf = Halide::Runtime::Buffer<int16_t>(
          (int16_t *)(&output[y * width_i16 + x]), /* ndims */ 2, shape);
    }
  }

  benchmark([&]() {
    // Notice the +4 steps. My understanding is that the idct4
    // kernel is to be applied to a 4x4 input and outputs
    // a 4x4 output.
    for (int y = 0; y < height; y += 4) {
      for (int x = 0; x < width_i16; x += 4) {
        Halide::Runtime::Buffer<int16_t> input_buf =
            buffers[y / 4][x / 4].input_buf;
        Halide::Runtime::Buffer<int16_t> output_buf =
            buffers[y / 4][x / 4].output_buf;
        int error = idct4(input_buf, output_buf);
        if (error != 0) {
          printf("idct4 pipeline failed: %d\n", error);
        }
      }
    }
  });

  // Free the buffers
  for (int y = 0; y < height; y += 4) {
    free(buffers[y / 4]);
  }
  free(buffers);

  printf("AppReported (): Image %dx%d - idct4(128B): %lld cycles (%0.4f "
         "cycles/pixel)\n",
         (int)width, (int)height, cycles, (float)cycles / (width * height));
#endif

#if benchmark_idct8
  halide_dimension_t x_dim{0, 8, 1};
  halide_dimension_t y_dim{0, 8, 8};
  halide_dimension_t shape[2] = {x_dim, y_dim};

  // Divide by 2 because of the int16_t buffer
  int width_i16 = width / sizeof(int16_t);

  struct BufferPair {
    Halide::Runtime::Buffer<int16_t> input_buf;
    Halide::Runtime::Buffer<int16_t> output_buf;
  };

  // Create the buffers here. Don't put them inside the loop in the benchmark
  // because then constructors and destructors will be called for every
  // iteration.
  //
  // Ideally, we'd allocate a single buffer on the stack and just reset its data
  // pointer in every iteration. But there doesn't seem to be a cheap way to do
  // that. All the functions in Runtime::Buffer call constructors etc.
  BufferPair **buffers =
      (BufferPair **)malloc((height / 8) * sizeof(BufferPair *));
  for (int y = 0; y < height; y += 8) {
    buffers[y / 8] = (BufferPair *)malloc((width_i16 / 8) * sizeof(BufferPair));
    for (int x = 0; x < width_i16; x += 8) {
      buffers[y / 8][x / 8].input_buf = Halide::Runtime::Buffer<int16_t>(
          (int16_t *)(&input[y * width_i16 + x]), /* ndims */ 2, shape);
      buffers[y / 8][x / 8].output_buf = Halide::Runtime::Buffer<int16_t>(
          (int16_t *)(&output[y * width_i16 + x]), /* ndims */ 2, shape);
    }
  }

  cycles = benchmark([&]() {
    // Notice the +4 steps. My understanding is that the idct8
    // kernel is to be applied to a 8x8 input and outputs
    // a 8x8 output.
    for (int y = 0; y < height; y += 8) {
      for (int x = 0; x < width_i16; x += 8) {
        Halide::Runtime::Buffer<int16_t> input_buf =
            buffers[y / 8][x / 8].input_buf;
        Halide::Runtime::Buffer<int16_t> output_buf =
            buffers[y / 8][x / 8].output_buf;
        int error = idct8(input_buf, output_buf);
        if (error != 0) {
          printf("idct8 pipeline failed: %d\n", error);
        }
      }
    }
  });

  // Free the buffers
  for (int y = 0; y < height; y += 8) {
    free(buffers[y / 8]);
  }
  free(buffers);

  printf("AppReported (): Image %dx%d - idct8(128B): %lld cycles (%0.4f "
         "cycles/pixel)\n",
         (int)width, (int)height, cycles, (float)cycles / (width * height));
#endif

#if benchmark_sbc

  // See:
  // https://github.com/ychen306/vegenbench/blob/803d7692b3ad580428ef34ce692b22dd981d988f/bench.cc#L46
  // This seems arbitrary, I couldn't find any logic for it. Probably the
  // original author checked the function, saw what is the maximum offset that
  // accesses any of the buffers, and picked this length for all the buffers.
  // But the output buffer definitely goes up to 4 if you see the code.
  halide_dimension_t in_dim{0, 64, 1};
  halide_dimension_t in_shape[1] = {in_dim};

  halide_dimension_t out_dim{0, 4, 1};
  halide_dimension_t out_shape[1] = {out_dim};

  // Divide by 2 because of the int16_t buffer
  int input_size = (width * height) / sizeof(int16_t);

  int iteration_size = 64;

  // Create the buffers here. Don't put them inside the loop in the benchmark
  // because then constructors and destructors will be called for every
  // iteration.
  //
  // Ideally, we'd allocate a single buffer on the stack and just reset its data
  // pointer in every iteration. But there doesn't seem to be a cheap way to do
  // that. All the functions in Runtime::Buffer call constructors etc.
  //
  // The buffers seem to just get allocated, without setting their values:
  // https://github.com/ychen306/vegenbench/blob/803d7692b3ad580428ef34ce692b22dd981d988f/bench.h#L79
  // I allocate a single buffer for `consts` which is set with the first values
  // of `input`. And then multiple input/output buffers.

  Halide::Runtime::Buffer<int16_t> consts((int16_t *)input, /* ndims */ 1,
                                          in_shape);

  struct BufferPair {
    Halide::Runtime::Buffer<int16_t> input_buf;
    Halide::Runtime::Buffer<int32_t> output_buf;
  };

  int num_iterations = input_size / iteration_size;
  BufferPair *buffers =
      (BufferPair *)malloc(num_iterations * sizeof(BufferPair));
  for (int i = 0; i < num_iterations; ++i) {
    buffers[i].input_buf = Halide::Runtime::Buffer<int16_t>(
        (int16_t *)(&input[i * iteration_size]), /* ndims */ 1, in_shape);
    // The output buffer is different because it needs only 4 elements.
    buffers[i].output_buf = Halide::Runtime::Buffer<int32_t>(
        (int32_t *)(&output[i * 4]), /* ndims */ 1, out_shape);
  }

  cycles = benchmark([&]() {
    for (int i = 0; i < num_iterations; ++i) {
      Halide::Runtime::Buffer<int16_t> input_buf = buffers[i].input_buf;
      Halide::Runtime::Buffer<int32_t> output_buf = buffers[i].output_buf;
      int error = sbc(input_buf, consts, output_buf);
      if (error != 0) {
        printf("sbc pipeline failed: %d\n", error);
      }
    }
  });

  // Free the buffers
  free(buffers);

#if DEBUG
  for (int x = 0; x < 10; x++)
    for (int y = 0; y < 10; y++)
      printf("(x: %d, y: %d) ==> input-val: %d   output-val: %d\n", x, y,
             input_buf(x, y), output_buf(x, y));
#endif

  printf("AppReported (): Image %dx%d - sbc(128B): %lld cycles (%0.4f "
         "cycles/pixel)\n",
         (int)width, (int)height, cycles, (float)cycles / (width * height));
#endif

#if benchmark_l2norm
  halide_dimension_t x_dim{0, width, 1};
  halide_dimension_t y_dim{0, height, width};
  halide_dimension_t shape[2] = {x_dim, y_dim};

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
      printf("(x: %d, y: %d) ==> input-val: %d   output-val: %d\n", x, y,
             input_buf(x, y), output_buf(x, y));
#endif

  printf("AppReported (): Image %dx%d - l2norm(128B): %lld cycles (%0.4f "
         "cycles/pixel)\n",
         (int)width, (int)height, cycles, (float)cycles / (width * height));
#endif

#if benchmark_fully_connected
  int *bias =
      (int *)aligned_malloc(width * height * sizeof(int),
                            1 << LOG2VLEN); //(int*)memalign(1 << LOG2VLEN,
                                            // width * height * sizeof(int));
  for (int i = 0; i < (width * height); i++)
    bias[i] = 10000;

  halide_dimension_t x_dim{0, width, 1};
  halide_dimension_t y_dim{0, height, width};
  halide_dimension_t shape[2] = {x_dim, y_dim};

  halide_dimension_t i_dim{0, width * height, 1};
  halide_dimension_t b_shape[2] = {i_dim};

  Halide::Runtime::Buffer<uint8_t> mat_a_(input, dims, shape);
  Halide::Runtime::Buffer<uint8_t> mat_b_(input, dims, shape);
  Halide::Runtime::Buffer<int32_t> bias_((int *)bias, 1, b_shape);
  Halide::Runtime::Buffer<uint8_t> output_(output, dims, shape);

  cycles = benchmark([&]() {
    int error = fully_connected(
        /* _input_buffer */ mat_a_, /* _input_zero */ 3,
        /*_filter_buffer */ mat_b_, /* _filter_zero */ 5,
        /*_bias_buffer */ bias_, /* _output_zero */ 7,
        /* _output_multiplier */ 32767, /* _output_shift */ 1, /* _output_min */
        5, /* _output_max */ 250, /* _output_buffer */ output_);
    if (error != 0) {
      printf("fully_connected pipeline failed: %d\n", error);
    }
  });

#if DEBUG
  for (int x = 0; x < 10; x++)
    for (int y = 0; y < 10; y++)
      printf("(x: %d, y: %d) ==> input-val: %d   output-val: %d\n", x, y,
             mat_a_(x, y), output_(x, y));
#endif

  printf("AppReported (HVX128B-mode): Image %dx%d - fully_connected(128B): "
         "%lld cycles (%0.4f cycles/pixel)\n",
         (int)width, (int)height, cycles, (float)cycles / (width * height));
#endif

#if benchmark_conv_nn
  int *bias =
      (int *)aligned_malloc(width * height * sizeof(int), 1 << LOG2VLEN);
  // int* bias = (int*)memalign(1 << LOG2VLEN, width * height * sizeof(int));
  for (int i = 0; i < (width * height); i++)
    bias[i] = 10000;

  width = 128;
  height = 128;

  halide_dimension_t c_dim{0, 1024, 1};
  halide_dimension_t x_dim{0, width / 32, 128};
  halide_dimension_t y_dim{0, height / 32, 128 * (width / 32)};
  halide_dimension_t b_dim{0, 1, 128 * (width / 32) * (height / 32)};
  halide_dimension_t shape[4] = {c_dim, x_dim, y_dim, b_dim};

  halide_dimension_t i_dim{0, width * height, 1};
  halide_dimension_t b_shape[2] = {i_dim};

  // A 6D array of filter coefficients indexed by ci % n, co % k, ci / n, co /
  // k, x, y,

  halide_dimension_t cim_dim{0, 4, 1};
  halide_dimension_t com_dim{0, 4, 4};
  halide_dimension_t cid_dim{0, 4, 4 * 4};
  halide_dimension_t cod_dim{0, 4, 4 * 4 * 4};
  halide_dimension_t fx_dim{0, 1, 4 * 4 * 4 * 4};
  halide_dimension_t fy_dim{0, 1, 4 * 4 * 4 * 4};
  halide_dimension_t f_shape[6] = {cim_dim, com_dim, cid_dim,
                                   cod_dim, x_dim,   b_dim};

  Halide::Runtime::Buffer<uint8_t> input_buf(input, 4, shape);
  Halide::Runtime::Buffer<uint8_t> output_buf(output, 4, shape);
  Halide::Runtime::Buffer<uint8_t> filter_buf(input, 6, f_shape);
  Halide::Runtime::Buffer<int32_t> bias_(bias, 1, b_shape);

  cycles = benchmark([&]() {
    int error = conv_nn(input_buf, 3, filter_buf, 5, bias_, 1, 1, 1, 1, 32767,
                        1, 3, 5, 250, output_buf);
    if (error != 0) {
      printf("conv_nn pipeline failed: %d\n", error);
    }
  });

#if DEBUG

  for (int x = 0; x < 10; x++)
    for (int y = 0; y < 10; y++)
      printf("(x: %d, y: %d) ==> input-val: %d   output-val: %d\n", x, y,
             input_buf(x, y), output_buf(x, y));

#endif
  printf("AppReported (): Image %dx%d - conv_nn(128B): %lld cycles (%0.4f "
         "cycles/pixel)\n",
         (int)width, (int)height, cycles, (float)cycles / (width * height));
#endif

#if benchmark_conv3x3a16
  signed char mask[9] = {1, 2, 1, 2, 4, 2, 1, 2, 1};

  halide_dimension_t x_dim{0, width, 1};
  halide_dimension_t y_dim{0, height, width};
  halide_dimension_t shape[2] = {x_dim, y_dim};

  halide_dimension_t mask_shape[2];
  mask_shape[0].min = 0;
  mask_shape[0].extent = 3;
  mask_shape[0].stride = 1;
  mask_shape[1].min = 0;
  mask_shape[1].extent = 3;
  mask_shape[1].stride = 3;

  Halide::Runtime::Buffer<uint8_t> input_buf(input, dims, shape);
  Halide::Runtime::Buffer<uint8_t> output_buf(output, dims, shape);
  Halide::Runtime::Buffer<int8_t> mask_buf(mask, dims, mask_shape);

  float exec_time = benchmark([&]() {
    int error = conv3x3a16(input_buf, mask_buf, output_buf);
    if (error != 0) {
      printf("conv3x3a16 pipeline failed: %d\n", error);
    }
  });

  for (int x = 0; x < 10; x++)
    for (int y = 0; y < 10; y++)
      printf("(x: %d, y: %d) ==> input-val: %d   output-val: %d\n", x, y,
             input_buf(x, y), output_buf(x, y));

  printf("AppReported (HVX128B-mode): Image %dx%d - conv3x3a16(128B): %lld "
         "cycles (%0.4f cycles/pixel)\n",
         (int)width, (int)height, cycles, (float)cycles / (width * height));

  printf("Execution took %0.4f s\n", exec_time);
#endif

#if benchmark_blur3x3
  halide_dimension_t x_dim{0, width / 2, 1};
  halide_dimension_t y_dim{0, height, width / 2};
  halide_dimension_t shape[2] = {x_dim, y_dim};

  Halide::Runtime::Buffer<int32_t> input_buf((int32_t *)input, dims, shape);
  Halide::Runtime::Buffer<int32_t> output_buf((int32_t *)output, dims, shape);

  cycles = benchmark([&]() {
    int error = blur3x3(input_buf, output_buf);
    if (error != 0) {
      printf("blur3x3 pipeline failed: %d\n", error);
    }
  });

#if DEBUG
  for (int x = 0; x < 10; x++)
    for (int y = 0; y < 10; y++)
      printf("(x: %d, y: %d) ==> input-val: %d   output-val: %d\n", x, y,
             input_buf(x, y), output_buf(x, y));

#endif

  printf("AppReported (): Image %dx%d - blur3x3(128B): %lld cycles (%0.4f "
         "cycles/pixel)\n",
         (int)width, (int)height, cycles, (float)cycles / (width * height));
#endif

#if benchmark_blur5x5
  halide_dimension_t x_dim{0, width / 2, 1};
  halide_dimension_t y_dim{0, height, width / 2};
  halide_dimension_t shape[2] = {x_dim, y_dim};

  Halide::Runtime::Buffer<uint16_t> input_buf((uint16_t *)input, dims, shape);
  Halide::Runtime::Buffer<uint16_t> output_buf((uint16_t *)output, dims, shape);

  cycles = benchmark([&]() {
    int error = blur5x5(input_buf, output_buf);
    if (error != 0) {
      printf("blur5x5 pipeline failed: %d\n", error);
    }
  });

#if DEBUG
  for (int x = 0; x < 10; x++)
    for (int y = 0; y < 10; y++)
      printf("(x: %d, y: %d) ==> input-val: %d   output-val: %d\n", x, y,
             input_buf(x, y), output_buf(x, y));

#endif

  printf("AppReported (): Image %dx%d - blur5x5(128B): %lld cycles (%0.4f "
         "cycles/pixel)\n",
         (int)width, (int)height, cycles, (float)cycles / (width * height));
#endif

#if benchmark_blur7x7
  halide_dimension_t x_dim{0, width / 2, 1};
  halide_dimension_t y_dim{0, height, width / 2};
  halide_dimension_t shape[2] = {x_dim, y_dim};

  Halide::Runtime::Buffer<uint16_t> input_buf((uint16_t *)input, dims, shape);
  Halide::Runtime::Buffer<uint16_t> output_buf((uint16_t *)output, dims, shape);

  cycles = benchmark([&]() {
    int error = blur7x7(input_buf, output_buf);
    if (error != 0) {
      printf("blur7x7 pipeline failed: %d\n", error);
    }
  });

#if DEBUG
  for (int x = 0; x < 10; x++)
    for (int y = 0; y < 10; y++)
      printf("(x: %d, y: %d) ==> input-val: %d   output-val: %d\n", x, y,
             input_buf(x, y), output_buf(x, y));

#endif

  printf("AppReported (): Image %dx%d - blur7x7(128B): %lld cycles (%0.4f "
         "cycles/pixel)\n",
         (int)width, (int)height, cycles, (float)cycles / (width * height));
#endif

#if benchmark_dilate3x3
  halide_dimension_t x_dim{0, width, 1};
  halide_dimension_t y_dim{0, height, width};
  halide_dimension_t shape[2] = {x_dim, y_dim};

  Halide::Runtime::Buffer<uint8_t> input_buf(input, dims, shape);
  Halide::Runtime::Buffer<uint8_t> output_buf(output, dims, shape);

  benchmark([&]() {
    int error = dilate3x3(input_buf, output_buf);
    if (error != 0) {
      printf("dilate3x3 pipeline failed: %d\n", error);
    }
  });

#if DEBUG
  for (int x = 0; x < 10; x++)
    for (int y = 0; y < 10; y++)
      printf("(x: %d, y: %d) ==> input-val: %d   output-val: %d\n", x, y,
             input_buf(x, y), output_buf(x, y));
#endif

  printf("AppReported (): Image %dx%d - dilate3x3(128B): %lld cycles (%0.4f "
         "cycles/pixel)\n",
         (int)width, (int)height, cycles, (float)cycles / (width * height));
#endif

#if benchmark_dilate5x5
  halide_dimension_t x_dim{0, width, 1};
  halide_dimension_t y_dim{0, height, width};
  halide_dimension_t shape[2] = {x_dim, y_dim};

  Halide::Runtime::Buffer<uint8_t> input_buf(input, dims, shape);
  Halide::Runtime::Buffer<uint8_t> output_buf(output, dims, shape);

  benchmark([&]() {
    int error = dilate5x5(input_buf, output_buf);
    if (error != 0) {
      printf("dilate5x5 pipeline failed: %d\n", error);
    }
  });

#if DEBUG
  for (int x = 0; x < 10; x++)
    for (int y = 0; y < 10; y++)
      printf("(x: %d, y: %d) ==> input-val: %d   output-val: %d\n", x, y,
             input_buf(x, y), output_buf(x, y));
#endif

  printf("AppReported (): Image %dx%d - dilate5x5(128B): %lld cycles (%0.4f "
         "cycles/pixel)\n",
         (int)width, (int)height, cycles, (float)cycles / (width * height));
#endif

#if benchmark_dilate7x7
  halide_dimension_t x_dim{0, width, 1};
  halide_dimension_t y_dim{0, height, width};
  halide_dimension_t shape[2] = {x_dim, y_dim};

  Halide::Runtime::Buffer<uint8_t> input_buf(input, dims, shape);
  Halide::Runtime::Buffer<uint8_t> output_buf(output, dims, shape);

  benchmark([&]() {
    int error = dilate7x7(input_buf, output_buf);
    if (error != 0) {
      printf("dilate7x7 pipeline failed: %d\n", error);
    }
  });

#if DEBUG
  for (int x = 0; x < 10; x++)
    for (int y = 0; y < 10; y++)
      printf("(x: %d, y: %d) ==> input-val: %d   output-val: %d\n", x, y,
             input_buf(x, y), output_buf(x, y));
#endif

  printf("AppReported (): Image %dx%d - dilate7x7(128B): %lld cycles (%0.4f "
         "cycles/pixel)\n",
         (int)width, (int)height, cycles, (float)cycles / (width * height));
#endif

#if benchmark_sobel3x3
  halide_dimension_t x_dim{0, width, 1};
  halide_dimension_t y_dim{0, height, width};
  halide_dimension_t shape[2] = {x_dim, y_dim};

  Halide::Runtime::Buffer<uint8_t> input_buf(input, dims, shape);
  Halide::Runtime::Buffer<uint8_t> output_buf(output, dims, shape);

  float exec_time = benchmark([&]() {
    int error = sobel3x3(input_buf, output_buf);
    if (error != 0) {
      printf("sobel3x3 pipeline failed: %d\n", error);
    }
  });

  printf("Execution took %0.4f s\n", exec_time);
#if DEBUG
  for (int x = 0; x < 10; x++)
    for (int y = 0; y < 10; y++)
      printf("(x: %d, y: %d) ==> input-val: %d   output-val: %d\n", x, y,
             input_buf(x, y), output_buf(x, y));
#endif

  printf("AppReported (): Image %dx%d - sobel3x3(128B): %lld cycles (%0.4f "
         "cycles/pixel)\n",
         (int)width, (int)height, cycles, (float)cycles / (width * height));
#endif

#if benchmark_sobel5x5
  halide_dimension_t x_dim{0, width, 1};
  halide_dimension_t y_dim{0, height, width};
  halide_dimension_t shape[2] = {x_dim, y_dim};

  Halide::Runtime::Buffer<uint8_t> input_buf(input, dims, shape);
  Halide::Runtime::Buffer<uint8_t> output_buf(output, dims, shape);

  float exec_time = benchmark([&]() {
    int error = sobel5x5(input_buf, output_buf);
    if (error != 0) {
      printf("sobel5x5 pipeline failed: %d\n", error);
    }
  });

  printf("Execution took %0.4f s\n", exec_time);
#if DEBUG
  for (int x = 0; x < 10; x++)
    for (int y = 0; y < 10; y++)
      printf("(x: %d, y: %d) ==> input-val: %d   output-val: %d\n", x, y,
             input_buf(x, y), output_buf(x, y));
#endif

  printf("AppReported (): Image %dx%d - sobel3x3(128B): %lld cycles (%0.4f "
         "cycles/pixel)\n",
         (int)width, (int)height, cycles, (float)cycles / (width * height));
#endif

#if benchmark_bitsimd_matmul

  halide_dimension_t x_dim{0, 256, 1};
  halide_dimension_t y_dim{0, 256, 256};
  halide_dimension_t shape[2] = {x_dim, y_dim};

  Halide::Runtime::Buffer<int32_t> matA((int32_t *)input, dims, shape);
  Halide::Runtime::Buffer<int32_t> matB((int32_t *)input, dims, shape);
  Halide::Runtime::Buffer<int32_t> output_buf((int32_t *)output, dims, shape);

  cycles = benchmark([&]() {
    printf("Launching bitsimd matmul!\n");
    int error = bitsimd_matmul(matA, matB, output_buf);
    if (error != 0) {
      printf("bitsimd_matmul pipeline failed: %d\n", error);
    }
  });

  printf("AppReported (): Image %dx%d - bitsimd_matmul(128B): %lld cycles (%0.4f "
         "cycles/pixel)\n",
         (int)width, (int)height, cycles, (float)cycles / (width * height));
#endif

#if benchmark_matmul_256

  halide_dimension_t x_dim{0, 256, 1};
  halide_dimension_t y_dim{0, 256, 256};
  halide_dimension_t shape[2] = {x_dim, y_dim};

  Halide::Runtime::Buffer<int16_t> matA((int16_t *)input, dims, shape);
  Halide::Runtime::Buffer<int16_t> matB((int16_t *)input, dims, shape);
  Halide::Runtime::Buffer<int16_t> output_buf((int16_t *)output, dims, shape);

  cycles = benchmark([&]() {
    int error = matmul_256(matA, matB, output_buf);
    if (error != 0) {
      printf("matmul_256 pipeline failed: %d\n", error);
    }
  });

  printf("AppReported (): Image %dx%d - matmul_256(128B): %lld cycles (%0.4f "
         "cycles/pixel)\n",
         (int)width, (int)height, cycles, (float)cycles / (width * height));
#endif

#if benchmark_matmul_256_32bit

  int32_t matrix_size = 256;

  halide_dimension_t x_dim{0, matrix_size, 1};
  halide_dimension_t y_dim{0, matrix_size, matrix_size};
  halide_dimension_t shape[2] = {x_dim, y_dim};

  int16_t matATensor[matrix_size * matrix_size];
  int16_t matBTensor[matrix_size * matrix_size];
  int32_t outputTensor[matrix_size * matrix_size];

  Halide::Runtime::Buffer<int16_t> matA((int16_t *)matATensor, dims, shape);
  Halide::Runtime::Buffer<int16_t> matB((int16_t *)matBTensor, dims, shape);
  Halide::Runtime::Buffer<int32_t> output_buf((int32_t *)outputTensor, dims,
                                              shape);

  cycles = benchmark([&]() {
    int error = matmul_256_32bit(matA, matB, output_buf);
    if (error != 0) {
      printf("matmul_256_32bit pipeline failed: %d\n", error);
    }
  });

  printf("AppReported (): Image %dx%d - matmul_256_32bit(): %lld cycles (%0.4f "
         "cycles/pixel)\n",
         (int)width, (int)height, cycles, (float)cycles / (width * height));
#endif

#if benchmark_matmul_256_32bit_bias_add

  printf("benchmark matmul_256_32bit_bias_add!\n");

  constexpr int dims_3 = 3;
  int32_t matrix_size = 256;

  int bias_size = 64;
  halide_dimension_t x_dim{0, matrix_size, 1};
  halide_dimension_t y_dim{0, matrix_size, matrix_size * 1};
  halide_dimension_t b_dim{0, bias_size, matrix_size * matrix_size};
  halide_dimension_t shape[3] = {b_dim, x_dim, y_dim};

  printf("Allocating memory!\n");

  /*
  int16_t matATensor[matrix_size * matrix_size * bias_size ];
  int16_t matBTensor[matrix_size * matrix_size * bias_size ];
  int32_t bias_[bias_size];
  int32_t outputTensor[matrix_size * matrix_size * bias_size ];
  */

  /*
  int16_t* matATensor = (int16_t*) aligned_malloc(matrix_size * matrix_size *
  bias_size * sizeof(int16_t), 1 << LOG2VLEN); int16_t* matBTensor = (int16_t*)
  aligned_malloc(matrix_size * matrix_size * bias_size *  sizeof(int16_t), 1 <<
  LOG2VLEN); int32_t* outputTensor = (int32_t*) aligned_malloc(matrix_size *
  matrix_size * bias_size * sizeof(int32_t), 1 << LOG2VLEN); int32_t* bias_ =
  (int32_t*) aligned_malloc(bias_size * sizeof(int32_t), 1 << LOG2VLEN);
  */

  int16_t *matATensor = (int16_t *)malloc(matrix_size * matrix_size *
                                          bias_size * sizeof(int16_t));
  int16_t *matBTensor = (int16_t *)malloc(matrix_size * matrix_size *
                                          bias_size * sizeof(int16_t));
  int32_t *outputTensor = (int32_t *)malloc(matrix_size * matrix_size *
                                            bias_size * sizeof(int32_t));
  int32_t *bias_ = (int32_t *)malloc(bias_size * sizeof(int32_t));

  printf("Creating runtime buffers!\n");

  Halide::Runtime::Buffer<int16_t> matA((int16_t *)matATensor, dims_3, shape);
  Halide::Runtime::Buffer<int16_t> matB((int16_t *)matBTensor, dims_3, shape);

  halide_dimension_t bias_dim{0, bias_size, 1};
  halide_dimension_t bias_shape[1] = {bias_dim};

  Halide::Runtime::Buffer<int32_t> bias_buf((int32_t *)bias_, 1, bias_shape);
  Halide::Runtime::Buffer<int32_t> output_buf((int32_t *)outputTensor, dims_3,
                                              shape);

  printf("About to launch kernel!\n");
  cycles = benchmark([&]() {
    int error = matmul_256_32bit_bias_add(matA, matB, bias_buf, output_buf);
    if (error != 0) {
      printf("matmul_256_32bit_bias_add pipeline failed: %d\n", error);
    }
  });

  free(matATensor);
  free(matBTensor);
  free(outputTensor);
  free(bias_);

  printf("AppReported (): Image %dx%d - matmul_256_32bit_bias_add(): %lld "
         "cycles (%0.4f cycles/pixel)\n",
         (int)width, (int)height, cycles, (float)cycles / (width * height));

#endif

#if benchmark_matmul_256_32bit_bias_add_relu

  printf("benchmark matmul_256_32bit_bias_add_relu!\n");

  constexpr int dims_3 = 3;
  int32_t matrix_size = 256;

  int bias_size = 64;
  halide_dimension_t x_dim{0, matrix_size, 1};
  halide_dimension_t y_dim{0, matrix_size, matrix_size * 1};
  halide_dimension_t b_dim{0, bias_size, matrix_size * matrix_size};
  halide_dimension_t shape[3] = {b_dim, x_dim, y_dim};

  printf("Allocating memory!\n");

  int16_t *matATensor = (int16_t *)malloc(matrix_size * matrix_size *
                                          bias_size * sizeof(int16_t));
  int16_t *matBTensor = (int16_t *)malloc(matrix_size * matrix_size *
                                          bias_size * sizeof(int16_t));
  int32_t *outputTensor = (int32_t *)malloc(matrix_size * matrix_size *
                                            bias_size * sizeof(int32_t));
  int32_t *bias_ = (int32_t *)malloc(bias_size * sizeof(int32_t));

  printf("Creating runtime buffers!\n");

  Halide::Runtime::Buffer<int16_t> matA((int16_t *)matATensor, dims_3, shape);
  Halide::Runtime::Buffer<int16_t> matB((int16_t *)matBTensor, dims_3, shape);

  halide_dimension_t bias_dim{0, bias_size, 1};
  halide_dimension_t bias_shape[1] = {bias_dim};

  Halide::Runtime::Buffer<int32_t> bias_buf((int32_t *)bias_, 1, bias_shape);
  Halide::Runtime::Buffer<int32_t> output_buf((int32_t *)outputTensor, dims_3,
                                              shape);

  printf("About to launch kernel!\n");
  cycles = benchmark([&]() {
    int error =
        matmul_256_32bit_bias_add_relu(matA, matB, bias_buf, output_buf);
    if (error != 0) {
      printf("matmul_256_32bit_bias_add_relu pipeline failed: %d\n", error);
    }
  });

  free(matATensor);
  free(matBTensor);
  free(outputTensor);
  free(bias_);

  printf("AppReported (): Image %dx%d - matmul_256_32bit_bias_add(): %lld "
         "cycles (%0.4f cycles/pixel)\n",
         (int)width, (int)height, cycles, (float)cycles / (width * height));

#endif

#if benchmark_matmul_256_32bit_bias_add_gelu

  printf("benchmark matmul_256_32bit_bias_add_gelu!\n");

  constexpr int dims_3 = 3;
  int32_t matrix_size = 256;

  int bias_size = 64;
  halide_dimension_t x_dim{0, matrix_size, 1};
  halide_dimension_t y_dim{0, matrix_size, matrix_size * 1};
  halide_dimension_t b_dim{0, bias_size, matrix_size * matrix_size};
  halide_dimension_t shape[3] = {b_dim, x_dim, y_dim};

  printf("Allocating memory!\n");

  int16_t *matATensor = (int16_t *)malloc(matrix_size * matrix_size *
                                          bias_size * sizeof(int16_t));
  int16_t *matBTensor = (int16_t *)malloc(matrix_size * matrix_size *
                                          bias_size * sizeof(int16_t));
  int32_t *outputTensor = (int32_t *)malloc(matrix_size * matrix_size *
                                            bias_size * sizeof(int32_t));
  int32_t *bias_ = (int32_t *)malloc(bias_size * sizeof(int32_t));

  printf("Creating runtime buffers!\n");

  Halide::Runtime::Buffer<int16_t> matA((int16_t *)matATensor, dims_3, shape);
  Halide::Runtime::Buffer<int16_t> matB((int16_t *)matBTensor, dims_3, shape);

  halide_dimension_t bias_dim{0, bias_size, 1};
  halide_dimension_t bias_shape[1] = {bias_dim};

  Halide::Runtime::Buffer<int32_t> bias_buf((int32_t *)bias_, 1, bias_shape);
  Halide::Runtime::Buffer<int32_t> output_buf((int32_t *)outputTensor, dims_3,
                                              shape);

  printf("About to launch kernel!\n");
  cycles = benchmark([&]() {
    int error =
        matmul_256_32bit_bias_add_gelu(matA, matB, bias_buf, output_buf);
    if (error != 0) {
      printf("matmul_256_32bit_bias_add_gelu pipeline failed: %d\n", error);
    }
  });

  free(matATensor);
  free(matBTensor);
  free(outputTensor);
  free(bias_);

  printf("AppReported (): Image %dx%d - matmul_256_32bit_bias_add(): %lld "
         "cycles (%0.4f cycles/pixel)\n",
         (int)width, (int)height, cycles, (float)cycles / (width * height));

#endif

#if benchmark_matmul_256_32bit_bias_add_add

  printf("benchmark matmul_256_32bit_bias_add_add!\n");

  constexpr int dims_3 = 3;
  int32_t matrix_size = 256;

  int bias_size = 64;
  halide_dimension_t x_dim{0, matrix_size, 1};
  halide_dimension_t y_dim{0, matrix_size, matrix_size * 1};
  halide_dimension_t b_dim{0, bias_size, matrix_size * matrix_size};
  halide_dimension_t shape[3] = {b_dim, x_dim, y_dim};

  printf("Allocating memory!\n");

  /*
  int16_t matATensor[matrix_size * matrix_size * bias_size ];
  int16_t matBTensor[matrix_size * matrix_size * bias_size ];
  int32_t bias_[bias_size];
  int32_t outputTensor[matrix_size * matrix_size * bias_size ];
  */

  /*
  int16_t* matATensor = (int16_t*) aligned_malloc(matrix_size * matrix_size *
  bias_size * sizeof(int16_t), 1 << LOG2VLEN); int16_t* matBTensor = (int16_t*)
  aligned_malloc(matrix_size * matrix_size * bias_size *  sizeof(int16_t), 1 <<
  LOG2VLEN); int32_t* outputTensor = (int32_t*) aligned_malloc(matrix_size *
  matrix_size * bias_size * sizeof(int32_t), 1 << LOG2VLEN); int32_t* bias_ =
  (int32_t*) aligned_malloc(bias_size * sizeof(int32_t), 1 << LOG2VLEN);
  */

  int16_t *matATensor = (int16_t *)malloc(matrix_size * matrix_size *
                                          bias_size * sizeof(int16_t));
  int16_t *matBTensor = (int16_t *)malloc(matrix_size * matrix_size *
                                          bias_size * sizeof(int16_t));
  int32_t *outputTensor = (int32_t *)malloc(matrix_size * matrix_size *
                                            bias_size * sizeof(int32_t));
  int32_t *bias_ = (int32_t *)malloc(bias_size * sizeof(int32_t));

  printf("Creating runtime buffers!\n");

  Halide::Runtime::Buffer<int16_t> matA((int16_t *)matATensor, dims_3, shape);
  Halide::Runtime::Buffer<int16_t> matB((int16_t *)matBTensor, dims_3, shape);

  halide_dimension_t bias_dim{0, bias_size, 1};
  halide_dimension_t bias_shape[1] = {bias_dim};

  Halide::Runtime::Buffer<int32_t> bias_buf((int32_t *)bias_, 1, bias_shape);
  Halide::Runtime::Buffer<int32_t> output_buf((int32_t *)outputTensor, dims_3,
                                              shape);

  printf("About to launch kernel!\n");
  cycles = benchmark([&]() {
    int error =
        matmul_256_32bit_bias_add_add(matA, matB, matB, bias_buf, output_buf);
    if (error != 0) {
      printf("matmul_256_32bit_bias_add_add pipeline failed: %d\n", error);
    }
  });

  free(matATensor);
  free(matBTensor);
  free(outputTensor);
  free(bias_);

  printf("AppReported (): Image %dx%d - matmul_256_32bit_bias_add_add(): %lld "
         "cycles (%0.4f cycles/pixel)\n",
         (int)width, (int)height, cycles, (float)cycles / (width * height));

#endif

#if benchmark_matmul_bias_relu_matmul

  constexpr int dims_3 = 3;
  int32_t matrix_size = 256;

  int bias_size = 64;
  halide_dimension_t x_dim{0, matrix_size, 1};
  halide_dimension_t y_dim{0, matrix_size, matrix_size * 1};
  halide_dimension_t b_dim{0, bias_size, matrix_size * matrix_size};

  /*
  halide_dimension_t x_dim{ 0, matrix_size, matrix_size };
  halide_dimension_t y_dim{ 0, matrix_size, matrix_size * matrix_size };
  halide_dimension_t b_dim{ 0, bias_size, 1 };
  */

  halide_dimension_t shape[3] = {b_dim, x_dim, y_dim};

  printf("Allocating memory!\n");

  int16_t *matATensor = (int16_t *)malloc(matrix_size * matrix_size *
                                          bias_size * sizeof(int16_t));
  int16_t *matBTensor = (int16_t *)malloc(matrix_size * matrix_size *
                                          bias_size * sizeof(int16_t));
  int16_t *matCTensor = (int16_t *)malloc(matrix_size * matrix_size *
                                          bias_size * sizeof(int16_t));
  int32_t *outputTensor = (int32_t *)malloc(matrix_size * matrix_size *
                                            bias_size * sizeof(int32_t));
  int32_t *bias_ = (int32_t *)malloc(bias_size * sizeof(int32_t));

  printf("Creating runtime buffers!\n");

  Halide::Runtime::Buffer<int16_t> matA((int16_t *)matATensor, dims_3, shape);
  Halide::Runtime::Buffer<int16_t> matB((int16_t *)matBTensor, dims_3, shape);
  Halide::Runtime::Buffer<int16_t> matC((int16_t *)matCTensor, dims_3, shape);

  halide_dimension_t bias_dim{0, bias_size, 1};
  halide_dimension_t bias_shape[1] = {bias_dim};

  Halide::Runtime::Buffer<int32_t> bias_buf((int32_t *)bias_, 1, bias_shape);
  Halide::Runtime::Buffer<int32_t> output_buf((int32_t *)outputTensor, dims_3,
                                              shape);

  printf("About to launch kernel!\n");
  cycles = benchmark([&]() {
    int error = matmul_bias_relu_matmul(matA, matB, matC, bias_buf, output_buf);
    if (error != 0) {
      printf("matmul_bias_relu_matmul pipeline failed: %d\n", error);
    }
  });

  free(matATensor);
  free(matBTensor);
  free(matCTensor);
  free(outputTensor);
  free(bias_);

  printf("AppReported (): Image %dx%d - matmul_256_32bit_bias_add(): %lld "
         "cycles (%0.4f cycles/pixel)\n",
         (int)width, (int)height, cycles, (float)cycles / (width * height));

#endif

#if benchmark_matmul_bias_gelu_matmul

  constexpr int dims_3 = 3;
  int32_t matrix_size = 256;

  int bias_size = 64;
  halide_dimension_t x_dim{0, matrix_size, 1};
  halide_dimension_t y_dim{0, matrix_size, matrix_size * 1};
  halide_dimension_t b_dim{0, bias_size, matrix_size * matrix_size};

  /*
  halide_dimension_t x_dim{ 0, matrix_size, matrix_size };
  halide_dimension_t y_dim{ 0, matrix_size, matrix_size * matrix_size };
  halide_dimension_t b_dim{ 0, bias_size, 1 };
  */

  halide_dimension_t shape[3] = {b_dim, x_dim, y_dim};

  printf("Allocating memory!\n");

  int16_t *matATensor = (int16_t *)malloc(matrix_size * matrix_size *
                                          bias_size * sizeof(int16_t));
  int16_t *matBTensor = (int16_t *)malloc(matrix_size * matrix_size *
                                          bias_size * sizeof(int16_t));
  int16_t *matCTensor = (int16_t *)malloc(matrix_size * matrix_size *
                                          bias_size * sizeof(int16_t));
  int32_t *outputTensor = (int32_t *)malloc(matrix_size * matrix_size *
                                            bias_size * sizeof(int32_t));
  int32_t *bias_ = (int32_t *)malloc(bias_size * sizeof(int32_t));

  printf("Creating runtime buffers!\n");

  Halide::Runtime::Buffer<int16_t> matA((int16_t *)matATensor, dims_3, shape);
  Halide::Runtime::Buffer<int16_t> matB((int16_t *)matBTensor, dims_3, shape);
  Halide::Runtime::Buffer<int16_t> matC((int16_t *)matCTensor, dims_3, shape);

  halide_dimension_t bias_dim{0, bias_size, 1};
  halide_dimension_t bias_shape[1] = {bias_dim};

  Halide::Runtime::Buffer<int32_t> bias_buf((int32_t *)bias_, 1, bias_shape);
  Halide::Runtime::Buffer<int32_t> output_buf((int32_t *)outputTensor, dims_3,
                                              shape);

  printf("About to launch kernel!\n");
  cycles = benchmark([&]() {
    int error = matmul_bias_gelu_matmul(matA, matB, matC, bias_buf, output_buf);
    if (error != 0) {
      printf("matmul_bias_gelu_matmul pipeline failed: %d\n", error);
    }
  });

  free(matATensor);
  free(matBTensor);
  free(matCTensor);
  free(outputTensor);
  free(bias_);

  printf("AppReported (): Image %dx%d - matmul_256_32bit_bias_add(): %lld "
         "cycles (%0.4f cycles/pixel)\n",
         (int)width, (int)height, cycles, (float)cycles / (width * height));

#endif

#if benchmark_batched_matmul_256_32bit

  constexpr int dims_3 = 3;
  int32_t matrix_size = 256;

  int num_batches = 4;
  halide_dimension_t x_dim{0, matrix_size, 1};
  halide_dimension_t y_dim{0, matrix_size, matrix_size};
  halide_dimension_t b_dim{0, num_batches, matrix_size * matrix_size};
  halide_dimension_t shape[3] = {x_dim, y_dim, b_dim};

  int16_t matATensor[matrix_size * matrix_size * num_batches];
  int16_t matBTensor[matrix_size * matrix_size * num_batches];
  int32_t outputTensor[matrix_size * matrix_size * num_batches];

  Halide::Runtime::Buffer<int16_t> matA((int16_t *)matATensor, dims_3, shape);
  Halide::Runtime::Buffer<int16_t> matB((int16_t *)matBTensor, dims_3, shape);
  Halide::Runtime::Buffer<int32_t> output_buf((int32_t *)outputTensor, dims_3,
                                              shape);

  cycles = benchmark([&]() {
    int error = batched_matmul_256_32bit(matA, matB, output_buf);
    if (error != 0) {
      printf("batched_matmul_256_32bit pipeline failed: %d\n", error);
    }
  });

  printf("AppReported (): Image %dx%d - batched_matmul_256_32bit(): %lld "
         "cycles (%0.4f cycles/pixel)\n",
         (int)width, (int)height, cycles, (float)cycles / (width * height));
#endif

#if benchmark_matmul_1024_32bit

  int32_t matrix_size = 1024;

  halide_dimension_t x_dim{0, matrix_size, 1};
  halide_dimension_t y_dim{0, matrix_size, matrix_size};
  halide_dimension_t shape[2] = {x_dim, y_dim};

  int16_t *matATensor = (int16_t *)aligned_malloc(
      matrix_size * matrix_size * sizeof(int16_t), 1 << LOG2VLEN);
  int16_t *matBTensor = (int16_t *)aligned_malloc(
      matrix_size * matrix_size * sizeof(int16_t), 1 << LOG2VLEN);
  int32_t *outputTensor = (int32_t *)aligned_malloc(
      matrix_size * matrix_size * sizeof(int32_t), 1 << LOG2VLEN);

  printf("Allocated new memory!\n");

  Halide::Runtime::Buffer<int16_t> matA((int16_t *)matATensor, dims, shape);
  Halide::Runtime::Buffer<int16_t> matB((int16_t *)matBTensor, dims, shape);
  Halide::Runtime::Buffer<int32_t> output_buf((int32_t *)outputTensor, dims,
                                              shape);

  cycles = benchmark([&]() {
    int error = matmul_1024_32bit(matA, matB, output_buf);
    if (error != 0) {
      printf("matmul_1024_32bit pipeline failed: %d\n", error);
    }
  });

  free(matATensor);
  free(matBTensor);
  free(outputTensor);
  printf("AppReported (): Image %dx%d - matmul_1024_32bit(): %lld cycles "
         "(%0.4f cycles/pixel)\n",
         (int)width, (int)height, cycles, (float)cycles / (width * height));
#endif

#if benchmark_handtune_matmul

  int32_t matrix_size = 1024;

  halide_dimension_t x_dim{0, matrix_size, 1};
  halide_dimension_t y_dim{0, matrix_size, matrix_size};
  halide_dimension_t shape[2] = {x_dim, y_dim};

  int16_t *matATensor = (int16_t *)aligned_malloc(
      matrix_size * matrix_size * sizeof(int16_t), 1 << LOG2VLEN);
  int16_t *matBTensor = (int16_t *)aligned_malloc(
      matrix_size * matrix_size * sizeof(int16_t), 1 << LOG2VLEN);
  int32_t *outputTensor = (int32_t *)aligned_malloc(
      matrix_size * matrix_size * sizeof(int32_t), 1 << LOG2VLEN);

  printf("Allocated new memory!\n");

  Halide::Runtime::Buffer<int16_t> matA((int16_t *)matATensor, dims, shape);
  Halide::Runtime::Buffer<int16_t> matB((int16_t *)matBTensor, dims, shape);
  Halide::Runtime::Buffer<int32_t> output_buf((int32_t *)outputTensor, dims,
                                              shape);

  cycles = benchmark([&]() {
    int error = handtune_matmul(matA, matB, output_buf);
    if (error != 0) {
      printf("handtune_matmul pipeline failed: %d\n", error);
    }
  });

  free(matATensor);
  free(matBTensor);
  free(outputTensor);
  printf("AppReported (): Image %dx%d - handtune_matmul(): %lld cycles (%0.4f "
         "cycles/pixel)\n",
         (int)width, (int)height, cycles, (float)cycles / (width * height));
#endif

#if benchmark_depthwise_conv

  int custom_width = 128;
  int custom_height = 128;

  printf("Running Depthwise Conv!");

  int divider = 4;
  int stride_i_dim3 = 1024 * (custom_width / divider);
  int stride_i_dim4 = stride_i_dim3 * (custom_height / divider);
  halide_dimension_t input_shape[4] = {
      {0, 1024, 1},
      {0, custom_width / divider, 1024},
      {0, custom_height / divider, stride_i_dim3},
      {0, 1, stride_i_dim4}};
  size_t num_input_elem =
      1024 * (custom_width / divider) * (custom_height / divider) * 1;
  uint8_t *inputTensor = (uint8_t *)aligned_malloc(
      num_input_elem * sizeof(uint8_t), 1 << LOG2VLEN);

  Halide::Runtime::Buffer<uint8_t> input_(inputTensor, 4, input_shape);
  //   input_.set_name("input_");

  halide_dimension_t filter_shape[3] = {
      {0, 1024, 1}, {0, 4, 1024}, {0, 4, 4 * 1024}};
  size_t num_filter_elem = 1024 * 4 * 4;
  uint8_t *filterTensor = (uint8_t *)aligned_malloc(
      num_filter_elem * sizeof(uint8_t), 1 << LOG2VLEN);
  Halide::Runtime::Buffer<uint8_t> filter_(filterTensor, 3, filter_shape);
  //   filter_.set_name("filter_");

  halide_dimension_t bias_shape[1] = {{0, custom_width * custom_height, 1}};
  size_t num_bias_elem = custom_width * custom_height;
  int32_t *biasTensor =
      (int32_t *)aligned_malloc(num_bias_elem * sizeof(int32_t), 1 << LOG2VLEN);
  Halide::Runtime::Buffer<int32_t> bias_(biasTensor, 1, bias_shape);
  //   bias_.set_name("bias_");

  divider = 32;
  int stride_o_dim3 = 1024 * (custom_width / divider);
  int stride_o_dim4 = stride_o_dim3 * (custom_height / divider);
  halide_dimension_t output_shape[4] = {
      {0, 1024, 1},
      {0, custom_width / divider, 1024},
      {0, custom_height / divider, stride_i_dim3},
      {0, 1, stride_i_dim4}};
  size_t num_output_elem =
      1024 * (custom_width / divider) * (custom_height / divider) * 1;
  uint8_t *outputTensor = (uint8_t *)aligned_malloc(
      num_output_elem * sizeof(uint8_t), 1 << LOG2VLEN);

  Halide::Runtime::Buffer<uint8_t> output_buf(outputTensor, 4, output_shape);
  //   output_buf.set_name("output_buf");

  int inv_depth_multiplier_ = -1;
  uint8_t input_zero_ = 3;
  uint8_t filter_zero_ = 5;
  int depth_multiplier_ = 1;
  int stride_x_ = 1;
  int stride_y_ = 1;
  int dilation_x_ = 1;
  int dilation_y_ = 1;
  int32_t output_multiplier_ = 32767;
  uint32_t output_shift_ = 1;
  uint8_t output_zero_ = 3;
  uint8_t output_min_ = 5;
  uint8_t output_max_ = 250;

  benchmark([&]() {
    int error = depthwise_conv(
        input_, input_zero_, filter_, filter_zero_, bias_, depth_multiplier_,
        stride_x_, stride_y_, dilation_x_, dilation_y_, output_multiplier_,
        output_shift_, output_zero_, output_min_, output_max_, output_buf);
    if (error != 0) {
      printf("depthwise_conv pipeline failed: %d\n", error);
    }
  });

  printf("AppReported (): Image %dx%d - depthwise_conv(128B): %lld cycles "
         "(%0.4f cycles/pixel)\n",
         (int)width, (int)height, cycles, (float)cycles / (width * height));

#endif

#if benchmark_gaussian3x3
  halide_dimension_t x_dim{0, width, 1};
  // halide_dimension_t y_dim{ 1, height-1, width };
  halide_dimension_t y_dim{1, height, width};
  halide_dimension_t shape[2] = {x_dim, y_dim};

  Halide::Runtime::Buffer<uint8_t> input_buf(input, dims, shape);
  Halide::Runtime::Buffer<uint8_t> output_buf(output, dims, shape);

  // Run in 128 byte mode
  benchmark([&]() {
    int error = gaussian3x3(input_buf, output_buf);
    if (error != 0) {
      printf("gaussian3x3 pipeline failed: %d\n", error);
    }
  });

#if DEBUG
  for (int x = 0; x < 10; x++)
    for (int y = 0; y < 10; y++)
      printf(
          "(x: %d, y: %d) ==> input-val: %d   output-val: %d, true-val: %d\n",
          x, y, input_buf(x, y), output_buf(x, y),

          ((static_cast<int16_t>(input_buf(x - 1, y - 1)) * 1 +
            static_cast<int16_t>(input_buf(x, y - 1)) * 2 +
            static_cast<int16_t>(input_buf(x + 1, y - 1)) * 1 +
            static_cast<int16_t>(input_buf(x - 1, y)) * 2 +
            static_cast<int16_t>(input_buf(x, y)) * 4 +
            static_cast<int16_t>(input_buf(x + 1, y)) * 2 +
            static_cast<int16_t>(input_buf(x - 1, y + 1)) * 1 +
            static_cast<int16_t>(input_buf(x, y + 1)) * 2 +
            static_cast<int16_t>(input_buf(x + 1, y + 1) * 1)) +
           8) >>
              4

      );
#endif

  printf("AppReported (): Image %dx%d - gaussian3x3(128B): %lld cycles (%0.4f "
         "cycles/pixel)\n",
         (int)width, (int)height, cycles, (float)cycles / (width * height));
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
  for (int x = 0; x < 10; x++)
    for (int y = 0; y < 10; y++)
      printf("(x: %d, y: %d) ==> input-val: %d   output-val: %d\n", x, y,
             input_buf(x, y), output_buf(x, y));
#endif

  printf("AppReported (): Image %dx%d - gaussian5x5(128B): %lld cycles (%0.4f "
         "cycles/pixel)\n",
         (int)width, (int)height, cycles, (float)cycles / (width * height));
#endif

#if benchmark_gaussian7x7
  halide_dimension_t x_dim{0, width, 1};
  halide_dimension_t y_dim{0, height, width};
  halide_dimension_t shape[2] = {x_dim, y_dim};

  Halide::Runtime::Buffer<uint8_t> input_buf(input, dims, shape);
  Halide::Runtime::Buffer<uint8_t> output_buf(output, dims, shape);

  // Run in 128 byte mode
  cycles = benchmark([&]() {
    int error = gaussian7x7(input_buf, output_buf);
    if (error != 0) {
      printf("gaussian7x7 pipeline failed: %d\n", error);
    }
  });

#if DEBUG
  for (int x = 0; x < 10; x++)
    for (int y = 0; y < 10; y++)
      printf("(x: %d, y: %d) ==> input-val: %d   output-val: %d\n", x, y,
             input_buf(x, y), output_buf(x, y));
#endif

  printf("AppReported (): Image %dx%d - gaussian7x7(128B): %lld cycles (%0.4f "
         "cycles/pixel)\n",
         (int)width, (int)height, cycles, (float)cycles / (width * height));
#endif


#if benchmark_simple_add
  printf("Testing With Simple Add!\n");
  int simple_width = 32;
  int simple_height = 32;

  halide_dimension_t x_dim{0, simple_width, 1};
  halide_dimension_t y_dim{0, simple_height, simple_width};
  halide_dimension_t shape[2] = {x_dim, y_dim};

  int32_t *simple_input_1 =
      (int32_t *)malloc(simple_width * simple_height * sizeof(int32_t));
  int32_t *simple_input_2 =
      (int32_t *)malloc(simple_width * simple_height * sizeof(int32_t));

  for (int i = 0; i < simple_width * simple_height; i++) {
    simple_input_1[i] = 2;
    simple_input_2[i] = 1;
  }

  int32_t *simple_output =
      (int32_t *)malloc(simple_width * simple_height * sizeof(int32_t));

  Halide::Runtime::Buffer<int32_t> input_buf_1(simple_input_1, dims, shape);
  Halide::Runtime::Buffer<int32_t> input_buf_2(simple_input_2, dims, shape);
  Halide::Runtime::Buffer<int32_t> output_buf(simple_output, dims, shape);

  cycles = benchmark([&]() {
    int error = simple_add(input_buf_1, input_buf_2, output_buf);
    if (error != 0) {
      printf("simple_add pipeline failed: %d\n", error);
    }
  });

  printf("Completed executing simple_add!\n");
  for (int x = 0; x < std::min(10, simple_width); x++)
    for (int y = 0; y < std::min(10, simple_height); y++)
      printf("(x: %d, y: %d) ==> input-vals: (%d,%d),   output-val: %d\n", x, y,
             input_buf_1(x, y), input_buf_2(x, y),output_buf(x, y));

  printf("AppReported (HVX128B-mode): Image %dx%d - simple(128B): %lld cycles "
         "(%0.4f cycles/pixel)\n",
         (int)width, (int)height, cycles, (float)cycles / (width * height));

  free(simple_input_1);
  free(simple_input_2);
  free(simple_output);
#endif

#if benchmark_relu
  printf("Testing With Relu!\n");
  int simple_width = 32;
  int simple_height = 32;

  halide_dimension_t x_dim{0, simple_width, 1};
  halide_dimension_t y_dim{0, simple_height, simple_width};
  halide_dimension_t shape[2] = {x_dim, y_dim};

  int32_t *simple_input_1 =
      (int32_t *)malloc(simple_width * simple_height * sizeof(int32_t));

  for (int i = 0; i < simple_width * simple_height; i++) {
    simple_input_1[i] = 2;
  }

  int32_t *simple_output =
      (int32_t *)malloc(simple_width * simple_height * sizeof(int32_t));

  Halide::Runtime::Buffer<int32_t> input_buf_1(simple_input_1, dims, shape);
  Halide::Runtime::Buffer<int32_t> output_buf(simple_output, dims, shape);

  cycles = benchmark([&]() {
    int error = relu(input_buf_1, output_buf);
    if (error != 0) {
      printf("relu pipeline failed: %d\n", error);
    }
  });

  printf("Completed executing relu!\n");
  for (int x = 0; x < std::min(10, simple_width); x++)
    for (int y = 0; y < std::min(10, simple_height); y++)
      printf("(x: %d, y: %d) ==> input-vals: (%d),   output-val: %d\n", x, y,
             input_buf_1(x, y) ,output_buf(x, y));

  printf("AppReported (HVX128B-mode): Image %dx%d - simple(128B): %lld cycles "
         "(%0.4f cycles/pixel)\n",
         (int)width, (int)height, cycles, (float)cycles / (width * height));

  free(simple_input_1);
  free(simple_output);
#endif

#if benchmark_simple
  printf("Testing With Simple!\n");
  int simple_width = 1024;
  int simple_height = 1024;

  halide_dimension_t x_dim{0, simple_width, 1};
  halide_dimension_t y_dim{0, simple_height, simple_width};
  halide_dimension_t shape[2] = {x_dim, y_dim};

  uint32_t *simple_input_1 =
      (uint32_t *)malloc(simple_width * simple_height * sizeof(uint32_t));
  int32_t *simple_input_2 =
      (int32_t *)malloc(simple_width * simple_height * sizeof(int32_t));

  for (int i = 0; i < simple_width * simple_height; i++) {

    simple_input_1[i] = 4294901760;
    // simple_input_2[i] = -721049612;
  }

  uint32_t *simple_output =
      (uint32_t *)malloc(simple_width * simple_height * sizeof(uint32_t));

  Halide::Runtime::Buffer<uint32_t> input_buf_1(simple_input_1, dims, shape);
  Halide::Runtime::Buffer<int32_t> input_buf_2(simple_input_2, dims, shape);
  Halide::Runtime::Buffer<uint32_t> output_buf(simple_output, dims, shape);

  cycles = benchmark([&]() {
    int error = simple(input_buf_1, 1073741840, output_buf);
    if (error != 0) {
      printf("simple pipeline failed: %d\n", error);
    }
  });

  printf("Completed executing simple!\n");
  for (int x = 0; x < 10; x++)
    for (int y = 0; y < 10; y++)
      printf("(x: %d, y: %d) ==> input-val: %d   output-val: %d\n", x, y,
             input_buf_1(x, y), output_buf(x, y));

  printf("AppReported (HVX128B-mode): Image %dx%d - simple(128B): %lld cycles "
         "(%0.4f cycles/pixel)\n",
         (int)width, (int)height, cycles, (float)cycles / (width * height));
#endif

#if benchmark_median3x3
  printf("\t*** median3x3\n");
  halide_dimension_t x_dim{0, width, 1};
  halide_dimension_t y_dim{0, height, width};
  halide_dimension_t shape[2] = {x_dim, y_dim};

  Halide::Runtime::Buffer<uint8_t> input_buf(input, dims, shape);
  Halide::Runtime::Buffer<uint8_t> output_buf(output, dims, shape);

  benchmark([&]() {
    int error = median3x3(input_buf, output_buf);
    if (error != 0) {
      printf("median3x3 pipeline failed: %d\n", error);
    }
  });
#if DEBUG

  for (int x = 0; x < 10; x++)
    for (int y = 0; y < 10; y++)
      printf("(x: %d, y: %d) ==> input-val: %d   output-val: %d\n", x, y,
             input_buf(x, y), output_buf(x, y));
#endif

  printf("AppReported (): Image %dx%d - median3x3(128B): %lld cycles (%0.4f "
         "cycles/pixel)\n",
         (int)width, (int)height, cycles, (float)cycles / width / height);
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
