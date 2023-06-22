
void conv2D(
        int* restrict a,
        short* restrict c,
        short d[restrict 16][64]
) {

    for(int i = 0; i < 16; i++) {
        #pragma unroll 64
        for(int k = 0; k < 64; k++) {
                a[i] += c[k] * d[i][k];
        }
   }

}
