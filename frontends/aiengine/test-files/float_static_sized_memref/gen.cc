void conv2d(float * restrict v1, float * restrict v2, float * restrict v3) {
  size_t v4 = 8;
  size_t v5 = 0;
  v8float v6 = *(v8float *)(v2 + v5);
  v8float v7 = *(v8float *)(v2 + v4);
  size_t v8 = 0;
  size_t v9 = 16;
  size_t v10 = 1;
  for (size_t v11 = v8; v11 < v9; v11 += v10)
  chess_prepare_for_pipelining
  chess_loop_range(16, 16)
  {
    size_t v12 = 1;
    size_t v13 = v11 + v12;
    size_t v14 = 2;
    size_t v15 = v11 + v14;
    size_t v16 = 0;
    size_t v17 = 256;
    size_t v18 = 8;
    for (size_t v19 = v16; v19 < v17; v19 += v18)
    chess_prepare_for_pipelining
    chess_loop_range(32, 32)
    {
      v16float v20 = *(v16float *)(v1 + 272*v11+v19);
      v8float v21 = fpmul(v20, 0, 0x76543210, v6, 0, 0x00000000);
      size_t v22 = 1;
      size_t v23 = v19 + v22;
      v16float v24 = *(v16float *)(v1 + 272*v11+v23 + 7);
      v21 = fpmac(v21, v24, 1, 0x76543210, v6, 1, 0x00000000);
      v21 = fpmac(v21, v24, 2, 0x76543210, v6, 2, 0x00000000);
      v16float v25 = *(v16float *)(v1 + 272*v13+v19);
      v21 = fpmac(v21, v25, 0, 0x76543210, v6, 3, 0x00000000);
      v16float v26 = *(v16float *)(v1 + 272*v13+v23 + 7);
      v21 = fpmac(v21, v26, 1, 0x76543210, v6, 4, 0x00000000);
      v21 = fpmac(v21, v26, 2, 0x76543210, v6, 5, 0x00000000);
      v16float v27 = *(v16float *)(v1 + 272*v15+v19);
      v21 = fpmac(v21, v27, 0, 0x76543210, v6, 6, 0x00000000);
      v16float v28 = *(v16float *)(v1 + 272*v15+v23 + 7);
      v21 = fpmac(v21, v28, 1, 0x76543210, v6, 7, 0x00000000);
      v21 = fpmac(v21, v28, 2, 0x76543210, v7, 0, 0x00000000);
      *(v8float *)(v3 + 256*v11+v19) = v21;
    }
  }
  return;
}


