#pragma once
#include <xmmintrin.h>

#ifdef __cplusplus
extern "C" {
#endif

typedef struct {
    __m128 v;
} Vec3;

Vec3 vec3_add(Vec3, Vec3);
Vec3 vec3_sub(Vec3, Vec3);

Vec3 vec3_mul(Vec3, float);
Vec3 vec3_div(Vec3, float);

float vec3_magnitude2(Vec3);
float vec3_magnitude(Vec3);
float vec3_magnitude_approx(Vec3);
Vec3 vec3_normalized_approx(Vec3);

float vec3_dot(Vec3, Vec3);
Vec3 vec3_cross(Vec3, Vec3);

#ifdef __cplusplus
}
#endif