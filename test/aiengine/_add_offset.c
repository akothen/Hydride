// #include <immintrin.h>
#include <assert.h>
#include <math.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

typedef struct {
    uint8_t *bits;
    int size;
} aie_bv;

aie_bv *create_bitvec(int n_bits) {
    aie_bv *vec = (aie_bv *)malloc(sizeof(aie_bv));
    int size = sizeof(aie_bv) * ceil(n_bits / 8.0);
    vec->size = size;
    vec->bits = (uint8_t *)malloc(size);
    return vec;
}

void destroy_bitvec(aie_bv *vec) {
    free(vec->bits);
    free(vec);
}

void set_bit(aie_bv *vec, int index, int bit) {
    int byte = index >> 3;
    int n = sizeof(index) * 8 - 3;
    int offset = ((unsigned)index << n) >> n;
    if (bit) {
        vec->bits[byte] |= 1 << (7 - offset);
    } else {
        vec->bits[byte] &= ~(1 << (7 - offset));
    }
}

int get_bit(aie_bv *vec, int index) {
    int byte = index >> 3;
    int n = sizeof(index) * 8 - 3;
    int offset = ((unsigned)index << n) >> n;
    if (vec->bits[byte] & (1 << (7 - offset))) {
        return 1;
    } else {
        return 0;
    }
}

void hex_out(uint8_t *buf, int sz) {
    for (int i = sz - 1; i >= 0; --i) {
        printf("%0x", buf[i]);
    }
    printf("\n");
}

aie_bv *add16(aie_bv *a, aie_bv *b, int * offset_arr, int start, int num_elems) {
    int *idx = (int *) malloc(num_elems * sizeof(int)); 
    aie_bv *out = create_bitvec(64);
    for (int i = 0; i < num_elems; i++) {
        idx[i] = start + offset_arr[i];
        out->bits[i] = a->bits[idx[i]] + b->bits[idx[i]];
    }
    return out;
}

int main() {
    int size = 64;
    int i = 0;
    aie_bv *vec_a = create_bitvec(size);
    aie_bv *vec_b = create_bitvec(size);
    for (i = 0; i < size; i++) {
        if (i % 2 == 0) {
            set_bit(vec_a, i, 1);
        } else {
            set_bit(vec_a, i, 0);
        }
    }

    for (i = 0; i < size; i++) {
        if (i % 2 == 0) {
            set_bit(vec_b, i, 0);
        } else {
            set_bit(vec_b, i, 1);
        }
    }

    int a_size = vec_a->size;
    int b_size = vec_b->size;
    assert(a_size == b_size);
    int start = 0;
    int num_elems = a_size;

    int *offset_arr = (int *) malloc(num_elems * sizeof(int));

    aie_bv *ret = add16(vec_a, vec_b, offset_arr, start, num_elems);

    hex_out(vec_a->bits, 8);
    hex_out(vec_b->bits, 8);
    hex_out(ret->bits, 8);

    destroy_bitvec(vec_a);
    destroy_bitvec(vec_b);
    // destroy_bitvec(ret);
    return 0;
}