void conv2d(int16_t * restrict v4, size_t m1, int16_t * restrict v5, size_t m2, int16_t * restrict v6, size_t m3) {
  int32_t v7 = 10;
  size_t v8 = 0;
  v16int16 v9 = *(v16int16 *)(v5 + v8);
  v32int16 v10 = concat(v9, v9);
  size_t v11 = 0;
  size_t v12 = 16;
  size_t v13 = 1;
  for (size_t v14 = v11; v14 < v12; v14 += v13)
  chess_prepare_for_pipelining
  chess_loop_range(16, 16)
  {
    size_t v15 = 0;
    size_t v16 = 256;
    size_t v17 = 16;
    for (size_t v18 = v15; v18 < v16; v18 += v17)
    chess_prepare_for_pipelining
    chess_loop_range(16, 16)
    {
      v32int16 v19 = *(v32int16 *)(v4 + 288*v14+v18);
      v16acc64 v20 = mul_conv_16x4(v19, v10);
      v16int16 v21 = srs_to_v16int16(v20, v7);
      *(v16int16 *)(v6 + 256*v14+v18) = v21;
    }
  }
  return;
}


