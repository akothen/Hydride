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

static constexpr int16_t g_t8[8][8] = {
  {65, 65, 65, 65, 65, 65, 65, 65},     {89, 75, 50, 18, -18, -50, -75, -89},
  {83, 36, -36, -83, -83, -36, 36, 83}, {75, -18, -89, -50, 50, 89, 18, -75},
  {65, -65, -65, 65, 65, -65, -65, 65}, {50, -89, 18, 75, -75, -18, 89, -50},
  {36, -83, 83, -36, -36, 83, -83, 36}, {18, -50, 75, -89, 89, -75, 50, -18}
};

void idct8(const int16_t *__restrict__ src, int16_t *__restrict__ dst) {
  int j, k;
  int E[4], O[4];
  int EE[2], EO[2];
  constexpr int shift = 7;
  constexpr int add = 1 << (shift - 1);

  constexpr int line = 8;

#pragma unroll
  for (j = 0; j < line; j++) {
    /* Utilizing symmetry properties to the maximum to minimize the number of
     * multiplications */
    for (k = 0; k < 4; k++) {
      O[k] = g_t8[1][k] * src[line] + g_t8[3][k] * src[3 * line] +
             g_t8[5][k] * src[5 * line] + g_t8[7][k] * src[7 * line];
    }

    EO[0] = g_t8[2][0] * src[2 * line] + g_t8[6][0] * src[6 * line];
    EO[1] = g_t8[2][1] * src[2 * line] + g_t8[6][1] * src[6 * line];
    EE[0] = g_t8[0][0] * src[0] + g_t8[4][0] * src[4 * line];
    EE[1] = g_t8[0][1] * src[0] + g_t8[4][1] * src[4 * line];

    /* Combining even and odd terms at each hierarchy levels to calculate the
     * final spatial domain vector */
    E[0] = EE[0] + EO[0];
    E[3] = EE[0] - EO[0];
    E[1] = EE[1] + EO[1];
    E[2] = EE[1] - EO[1];

#pragma unroll
    for (k = 0; k < 4; k++) {
      dst[k] = saturate_i16((E[k] + O[k] + add) >> shift);
      dst[k + 4] = saturate_i16((E[3 - k] - O[3 - k] + add) >> shift);
    }

    src++;
    dst += 8;
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

Buffer<int16_t> idct8_halide(const PixelType *__restrict__ src_buf) {
  // Halide::Runtime::Buffer<PixelType> src{(PixelType*)src_buf, dims, shape};
  Halide::Buffer<int16_t> src_i16((int16_t*)src_buf, 8, 8);

  constexpr int shift = 7;
  constexpr int add = 1 << (shift - 1);
  constexpr int line = 8;

  Var x("x"), y("y");

  Expr EO_0("EO_0"), EO_1("EO_1");
  Expr EE_0("EE_0"), EE_1("EE_1");
  Expr E_0("E_0"), E_1("E_1"), E_2("E_2"), E_3("E_3");
  Expr O_0("O_0"), O_1("O_1"), O_2("O_2"), O_3("O_3");

  Func src("src");
  Func idct8("idct8");

  src(x, y) = ConciseCasts::i32(src_i16(x, y));

  O_0 = g_t8[1][0] * src(x, 1) + g_t8[3][0] * src(x, 3) +
        g_t8[5][0] * src(x, 5) + g_t8[7][0] * src(x, 7);
  O_1 = g_t8[1][1] * src(x, 1) + g_t8[3][1] * src(x, 3) +
        g_t8[5][1] * src(x, 5) + g_t8[7][1] * src(x, 7);
  O_2 = g_t8[1][2] * src(x, 1) + g_t8[3][2] * src(x, 3) +
        g_t8[5][2] * src(x, 5) + g_t8[7][2] * src(x, 7);
  O_3 = g_t8[1][3] * src(x, 1) + g_t8[3][3] * src(x, 3) +
        g_t8[5][3] * src(x, 5) + g_t8[7][3] * src(x, 7);


  EO_0 = g_t8[2][0] * src(x, 2) + g_t8[6][0] * src(x, 6);
  EO_1 = g_t8[2][1] * src(x, 2) + g_t8[6][1] * src(x, 6);
  EE_0 = g_t8[0][0] * src(x, 0) + g_t8[4][0] * src(x, 4);
  EE_1 = g_t8[0][1] * src(x, 0) + g_t8[4][1] * src(x, 4);


  E_0 = EE_0 + EO_0;
  E_3 = EE_0 - EO_0;
  E_1 = EE_1 + EO_1;
  E_2 = EE_1 - EO_1;


  idct8(x, y) = select(
    y == 0, ConciseCasts::i16_sat((E_0 + O_0 + add) >> shift),
    y == 1, ConciseCasts::i16_sat((E_1 + O_1 + add) >> shift),
    y == 2, ConciseCasts::i16_sat((E_2 + O_2 + add) >> shift),
    y == 3, ConciseCasts::i16_sat((E_3 + O_3 + add) >> shift),

    y == 4, ConciseCasts::i16_sat((E_3 - O_3 + add) >> shift),
    y == 5, ConciseCasts::i16_sat((E_2 - O_2 + add) >> shift),
    y == 6, ConciseCasts::i16_sat((E_1 - O_1 + add) >> shift),
    ConciseCasts::i16_sat((E_0 - O_0 + add) >> shift)
  );

  Buffer<int16_t> dst = idct8.realize({8, 8});
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

  int ker_width = 8;
  int ker_height = 8;
  int ker_buf_nbytes = ker_width*ker_height*sizeof(PixelType);
  PixelType *output_base = (PixelType *)memalign(1 << LOG2VLEN, ker_buf_nbytes);
  assert(output_base != NULL);
  PixelType *output_halide = (PixelType *)memalign(1 << LOG2VLEN, ker_buf_nbytes);
  assert(output_halide != NULL);

  assert(width*height > ker_width*ker_height*sizeof(PixelType));
  PixelType *ker_input = (PixelType*) input;

  idct8(ker_input, output_base);

  Buffer<int16_t> dst = idct8_halide(ker_input);
  memcpy(output_halide, dst.data(), 8*8*sizeof(int16_t));
  for (int i = 0; i < 8; ++i) {
    for (int j = 0; j < i; ++j) {
      int tmp = output_halide[i*8 + j];
      output_halide[i*8 + j] = output_halide[j*8 + i];
      output_halide[j*8 + i] = tmp;
    }
  }

  printf("--- Output Base ---\n");
  print_ker_buf(output_base, ker_width, ker_height);

  printf("--- Output Halide ---\n");
  print_ker_buf(output_halide, ker_width, ker_height);

  assert(memcmp(output_base, output_halide, ker_buf_nbytes) == 0);
}