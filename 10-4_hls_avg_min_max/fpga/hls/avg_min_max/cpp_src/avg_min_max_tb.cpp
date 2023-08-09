#include "avg_min_max.hpp"
#include <cstdio>
#include <cstdlib>

int main() {
    q16p2_t a[AVG_MIN_MAX_ARRAY_LENGTH];
    q16p2_t sum = 0, min_expected = 0, max_expected = 0;
    int retVal = EXIT_SUCCESS;

    /* Generate an expected value from random numbers. */
    a[0] = 0.25*0; sum = a[0]; min_expected = sum; max_expected = sum;
    printf("a[ 0]=%g\n", static_cast<float>(a[0]));
    for (size_t i=1; i<AVG_MIN_MAX_ARRAY_LENGTH; ++i) {
        a[i] = 0.25*i;
        sum += a[i];
        if (a[i] < min_expected) {
            min_expected = a[i];
        }
        if (a[i] > max_expected) {
            max_expected = a[i];
        }
        printf("a[%2ld]=%g\n", i, static_cast<float>(a[i]));
    }
    const q16p2_t avg_expected = sum / AVG_MIN_MAX_ARRAY_LENGTH;
    printf("avg_expected=%g, min_expected=%g, max_expected=%g\n", static_cast<float>(avg_expected), static_cast<float>(min_expected), static_cast<float>(max_expected));

    /* Verify the output of function. */
    q16p2_t avg, min, max;
    avg_min_max(a, avg, min, max);
    printf("avg=%g, min=%g, max=%g\n", static_cast<float>(avg), static_cast<float>(min), static_cast<float>(max));
    if (avg == avg_expected && min == min_expected && max == max_expected) {
        printf("OK\n");
    } else {
        printf("NG\n");
        retVal = EXIT_FAILURE;
    }

    return retVal;
}
