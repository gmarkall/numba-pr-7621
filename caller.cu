#include "functions.cuh"
#include "caller.cuh"

__global__ void caller(float *r, float *x, float *y)
{
  float r_l[1];
  mul_f32_f32(r_l, *x, *y);
  r[0] = r_l[0];
}
