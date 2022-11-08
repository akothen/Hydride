#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <fcntl.h>
#include <unistd.h>
#include <malloc.h>
#include <errno.h>
#include <string.h>
#include <iostream>

#include "Halide.h"
#include "HalideBuffer.h"

#define LOG2VLEN 7
#define VLEN (1<<LOG2VLEN)

using namespace Halide;

int16_t saturate_i16(int32_t x) {
  return x >= 32767 ? 32767 : (x <= -32768 ? -32768 : x);
}

typedef int16_t PixelType;

static constexpr PixelType g_t4[4][4] = {{65, 65, 65, 65},
                                       {83, 36, -36, -83},
                                       {65, -65, -65, 65},
                                       {36, -83, 83, -36}};

// This seems to be specific to a 4x4 kernel. We don't pass in a shape.
void idct4(const PixelType *__restrict__ src, PixelType *__restrict__ dst) {
  int j;
  int E[2], O[2];
  constexpr int line = 4;
  constexpr int shift = 7;
  constexpr int add = 1 << (shift - 1);

  for (j = 0; j < line; j++) {
    /* Utilizing symmetry properties to the maximum to minimize the number of
     * multiplications */
    O[0] = g_t4[1][0] * src[line] + g_t4[3][0] * src[3 * line];
    O[1] = g_t4[1][1] * src[line] + g_t4[3][1] * src[3 * line];
    E[0] = g_t4[0][0] * src[0] + g_t4[2][0] * src[2 * line];
    E[1] = g_t4[0][1] * src[0] + g_t4[2][1] * src[2 * line];

    /* Combining even and odd terms at each hierarchy levels to calculate the
     * final spatial domain vector */
    dst[0] = saturate_i16((E[0] + O[0] + add) >> shift);
    dst[1] = saturate_i16((E[1] + O[1] + add) >> shift);
    dst[2] = saturate_i16((E[1] - O[1] + add) >> shift);
    dst[3] = saturate_i16((E[0] - O[0] + add) >> shift);

    src++;
    dst += 4;
  }
}

void print_ker_buf(PixelType *buf, int ker_width, int ker_height) {
  PixelType *reader = buf;
  for (int i = 0; i < ker_width; ++i) {
    for (int j = 0; j < ker_height; ++j) {
      printf("%d ", *reader);
      reader++;
    }
    printf("\n");
  }
}

Buffer<int16_t> idct4_halide(const PixelType *__restrict__ src_buf) {
  constexpr int dims = 2;
  halide_dimension_t x_dim{0, 4, 1};
  halide_dimension_t y_dim{0, 4, 4};
  halide_dimension_t shape[2] = {x_dim, y_dim};

  // Halide::Runtime::Buffer<PixelType> src{(PixelType*)src_buf, dims, shape};
  Halide::Buffer<int16_t> src_i16((int16_t*)src_buf, 4, 4);

  constexpr int shift = 7;
  constexpr int add = 1 << (shift - 1);

  Var x("x"), y("y");

  Expr O_0("O_0"), O_1("O_1");
  Expr E_0("E_0"), E_1("E_1");
  Func src("src");
  Func idct_4_func("idct_4_func");

  src(x, y) = ConciseCasts::i32(src_i16(x, y));

  O_0 = g_t4[1][0] * src(x, 1) + g_t4[3][0] * src(x, 3);
  O_1 = g_t4[1][1] * src(x, 1) + g_t4[3][1] * src(x, 3);

  E_0 = g_t4[0][0] * src(x, 0) + g_t4[2][0] * src(x, 2);
  E_1 = g_t4[0][1] * src(x, 0) + g_t4[2][1] * src(x, 2);

  idct_4_func(x, y) = select(
    y == 0, ConciseCasts::i16_sat((E_0 + O_0 + add) >> shift),
    y == 1, ConciseCasts::i16_sat((E_1 + O_1 + add) >> shift),
    y == 2, ConciseCasts::i16_sat((E_1 - O_1 + add) >> shift),
    ConciseCasts::i16_sat((E_0 - O_0 + add) >> shift)
  );

  Buffer<int16_t> dst = idct_4_func.realize({4, 4});
  return dst;
}

uint8_t *read_bytes_from_file(const char *file, int width, int height) {
  int i, in_fp;
  uint8_t *input = (uint8_t *)memalign(1 << LOG2VLEN, width*height);
  assert(input != NULL);

  /* -----------------------------------------------------*/
  /*  Read image input from file                          */
  /* -----------------------------------------------------*/
  if ((in_fp = open(file, O_RDONLY)) < 0)
  {
    printf("Error: Cannot open %s for input\n", file);
    assert(0);
  }

  for (i = 0; i < height; i++)
  {
    if (read(in_fp, &input[i * width], sizeof(uint8_t) * width) != width)
    {
      printf("Error, Unable to read from %s\n", file);
      close(in_fp);
      assert(0);
    }
  }
  close(in_fp);

  return input;
}

int main(int argc, char **argv) {
  /* -----------------------------------------------------*/
  /*  Get input parameters                                */
  /* -----------------------------------------------------*/
  if (argc != 4)
  {
    printf("usage: %s <width> <height> <input.bin>\n", argv[0]);
    return 1;
  }

  int width = atoi(argv[1]);
  int height = atoi(argv[2]);
  const char *file = argv[3];
  // int stride = (width + (VLEN)-1) & (-(VLEN));

  uint8_t *input = (uint8_t*) read_bytes_from_file(file, width, height);
  assert(input != NULL);

  int ker_width = 4;
  int ker_height = 4;
  int ker_buf_nbytes = ker_width*ker_height*sizeof(PixelType);
  PixelType *output_base = (PixelType *)memalign(1 << LOG2VLEN, ker_buf_nbytes);
  assert(output_base != NULL);
  PixelType *output_halide = (PixelType *)memalign(1 << LOG2VLEN, ker_buf_nbytes);
  assert(output_halide != NULL);

  assert(width*height > ker_width*ker_height*sizeof(PixelType));
  PixelType *ker_input = (PixelType*) input;

  idct4(ker_input, output_base);

  Buffer<int16_t> dst = idct4_halide(ker_input);
  memcpy(output_halide, dst.data(), 4*4*sizeof(int16_t));
  for (int i = 0; i < 4; ++i) {
    for (int j = 0; j < i; ++j) {
      int tmp = output_halide[i*4 + j];
      output_halide[i*4 + j] = output_halide[j*4 + i];
      output_halide[j*4 + i] = tmp;
    }
  }

  printf("--- Output Base ---\n");
  print_ker_buf(output_base, ker_width, ker_height);

  printf("--- Output Halide ---\n");
  print_ker_buf(output_halide, ker_width, ker_height);


  printf("Memcmp: %d\n", memcmp(output_base, output_halide, ker_buf_nbytes));
}