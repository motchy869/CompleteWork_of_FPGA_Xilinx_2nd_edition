#include "muladd.hpp"
#include <cstdio>
#include <cstdlib>

int main() {
    int a[MULADD_ARRAY_LENGTH], b[MULADD_ARRAY_LENGTH];
    int sum = 0;
    int retVal = EXIT_SUCCESS;

    /* Generate an expected value from random numbers. */
    for (int i=0; i<MULADD_ARRAY_LENGTH; ++i) {
        a[i] = rand() & 0xffff;
        b[i] = rand() & 0xffff;
        sum += a[i] * b[i];
        printf("a[%2d]=%04x, b[%2d]=%04x, sum=%08x\n", i, a[i], i, b[i], sum);
    }

    /* Verify the output of function. */
    if (muladd(a, b) == sum) {
        printf("OK\n");
    } else {
        printf("NG\n");
        retVal = EXIT_FAILURE;
    }

    return retVal;
}
