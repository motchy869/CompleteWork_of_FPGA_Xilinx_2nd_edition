#include "avg_min_max.hpp"

void avg_min_max(const q16p2_t a[AVG_MIN_MAX_ARRAY_LENGTH], q16p2_t &avg, q16p2_t &min, q16p2_t &max) {
    q16p2_t sum = a[0], min_temp = sum, max_temp = sum;

    avg_min_max_loop: for (size_t i=1; i<AVG_MIN_MAX_ARRAY_LENGTH; ++i) {
        sum += a[i];
        if (a[i] < min_temp) {
            min_temp = a[i];
        } else if (a[i] > max_temp) {
            max_temp = a[i];
        }
    }

    avg = sum / AVG_MIN_MAX_ARRAY_LENGTH;
    min = min_temp;
    max = max_temp;
}
