#include "functions.cuh"

extern "C" __device__ int
mul_f32_f32(
  float* return_value,
  float x,
  float y)
{
  // Compute result and store in caller-provided slot
  *return_value = x * y;
  atomicAdd(return_value, 1.0f);

  // Signal that no Python exception occurred
  return 0;
}

