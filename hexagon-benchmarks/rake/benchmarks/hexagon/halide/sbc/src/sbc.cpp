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

#define VLEN (1<<LOG2VLEN)

using namespace Halide;

#define SBC_COS_TABLE_FIXED_SCALE 15
#define SBC_PROTO_FIXED_SCALE 16
#define SCALE_OUT_BITS 15

void print_output(int32_t *buf) {
  int32_t *reader = buf;
  for (int i = 0; i < 4; ++i) {
    printf("%d ", *reader);
    reader++;
  }
  printf("\n");
}

void sbc_base(const int16_t *__restrict__ in, int32_t *__restrict__ out,
                   const int16_t *__restrict__ consts) {
  int32_t t1[8];
  int16_t t2[8];
  int i, j, hop = 0;

#pragma unroll
  /* rounding coefficient */
  for (i = 0; i < 4; i++)
    t1[i] = 1 << (SBC_PROTO_FIXED_SCALE - 1);

#pragma unroll
  /* low pass polyphase filter */
  for (hop = 0; hop < 10 * 4; hop += 2 * 4)
    for (i = 0; i < 2 * 4; i++)
      t1[i >> 1] += in[hop + i] * consts[hop + i];

  /* scaling */
  for (i = 0; i < 4; i++)
    t2[i] = t1[i] >> SBC_PROTO_FIXED_SCALE;

  memset(t1, 0, sizeof(t1));

#pragma unroll
  /* do the cos transform */
  for (i = 0; i < 4 / 2; i++)
    for (j = 0; j < 2 * 4; j++)
      t1[j >> 1] += t2[i * 2 + (j & 1)] * consts[10 * 4 + i * 2 * 4 + j];

#pragma unroll
  for (i = 0; i < 4; i++)
    out[i] = t1[i] >> (SBC_COS_TABLE_FIXED_SCALE - SCALE_OUT_BITS);
}

Buffer<int32_t> sbc_halide(int16_t *__restrict__ in_raw, 
                           int16_t *__restrict__ consts_raw) {

  Halide::Buffer<int16_t> in_i16(in_raw, 64);
  Halide::Buffer<int16_t> consts_i16(consts_raw, 64);

  // Cast both of them to i32 and only down-cast if needed.
  // In C, because of "usual arithmetic conversions", even if you
  // multiply two i16, they both first get converted to i32, the operation
  // happens in 32-bit, and only if the target is i16, we have a downcast.
  Func in("in"), consts("consts");

  Var x("x");

  in(x) = ConciseCasts::i32(in_i16(x));
  consts(x) = ConciseCasts::i32(consts_i16(x));

  Func t1("t1"), t2("t2"), t3("t3");
  Func out("out");

  //                i    hop
  RDom filter_loop(0, 4, 0, 5);

  t1(x) = cast<int32_t>(1 << (SBC_PROTO_FIXED_SCALE - 1));
  t1(filter_loop.x) += in(2*4*filter_loop.y + 2*filter_loop.x) * 
                        consts(2*4*filter_loop.y + 2*filter_loop.x);
  t1(filter_loop.x) += in(2*4*filter_loop.y + 2*filter_loop.x+1) *
                        consts(2*4*filter_loop.y + 2*filter_loop.x+1);

  RDom i(0, 4);
  // t2 is int16_t in the original
  t2(x) = cast<int16_t>(0);
  t2(i) = ConciseCasts::i16(t1(i) >> SBC_PROTO_FIXED_SCALE);

  RDom cos_loop(0, 4, 0, 4/2);

  // In the original, they re-initialize the t1 to 0, but I don't
  // know what's the correct way to do that in Halide. So, I just
  // use a new Func.
  t3(x) = 0;
  t3(cos_loop.x) += ConciseCasts::i32(t2(cos_loop.y*2 + ((2*cos_loop.x) & 1))) * 
            consts(10*4 + cos_loop.y*2*4 + 2*cos_loop.x);
  t3(cos_loop.x) += ConciseCasts::i32(t2(cos_loop.y*2 + ((2*cos_loop.x+1) & 1))) *
            consts(10*4 + cos_loop.y*2*4 + 2*cos_loop.x+1);

  out(x) = cast<int32_t>(0);
  out(i) = t3(i) >> (SBC_COS_TABLE_FIXED_SCALE - SCALE_OUT_BITS);

  Buffer<int32_t> dst = out.realize({4});
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

  // Length for all the buffers. See: https://github.com/ychen306/vegenbench/blob/803d7692b3ad580428ef34ce692b22dd981d988f/bench.cc#L46
  // This seems arbitrary, I couldn't find any logic for it. Probably the original author checked the function,
  // saw what is the maximum offset that accesses any of the buffers, and picked this length
  // for all the buffers.
  int buf_len = 64;
  int input_nbytes = buf_len*sizeof(int16_t);
  int output_nbytes = buf_len*sizeof(int32_t);
  int consts_nbytes = buf_len*sizeof(int16_t);

  // The buffers seem to just get allocated, without setting their values:
  // https://github.com/ychen306/vegenbench/blob/803d7692b3ad580428ef34ce692b22dd981d988f/bench.h#L79
  // However, let's set the values so that we have deterministic output.
  int16_t *consts = (int16_t *)memalign(1 << LOG2VLEN, consts_nbytes);
  assert(consts != NULL);
  for (int i = 0; i < buf_len; ++i) {
    consts[i] = i;
  }

  int32_t *output_base = (int32_t *)memalign(1 << LOG2VLEN, output_nbytes);
  assert(output_base != NULL);

  assert(buf_len*sizeof(int16_t) < width*height);
  sbc_base((int16_t *)input, output_base, consts);

  Buffer<int32_t> output_halide = sbc_halide((int16_t *)input, consts);

  printf("--- Output Base ---\n");
  print_output(output_base);

  printf("--- Output Halide ---\n");
  print_output(output_halide.data());

  assert(memcmp(output_base, output_halide.data(), 4*sizeof(int32_t)) == 0);
}