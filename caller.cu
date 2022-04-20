#include "functions.cuh"
#include "caller.cuh"

__global__ void caller(float *r, float *x, float *y)
{
  mul_f32_f32(r, *x, *y);
}
