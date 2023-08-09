#include "muladd.hpp"

int muladd(int a[MULADD_ARRAY_LENGTH], int b[MULADD_ARRAY_LENGTH]) {
    int sum = 0;
    muladd_loop:for(int i=0; i<MULADD_ARRAY_LENGTH; ++i) {
        sum += a[i] * b[i];
    }
    return sum;
}
