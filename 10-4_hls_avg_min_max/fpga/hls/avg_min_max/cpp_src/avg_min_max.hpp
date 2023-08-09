#pragma once

#include <cstddef>
#include <ap_fixed.h>

typedef ap_fixed<16, 14, AP_RND_INF> q16p2_t;
constexpr size_t AVG_MIN_MAX_ARRAY_LENGTH = 16;

void avg_min_max(const q16p2_t a[AVG_MIN_MAX_ARRAY_LENGTH], q16p2_t &avg, q16p2_t &min, q16p2_t &max);
