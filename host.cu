#include <iostream>
#include "caller.cuh"


int main(int __attribute__((unused)) argc, char __attribute__((unused)) *argv[])
{
  float *m_r, *m_x, *m_y;
  cudaMallocManaged(&m_x, sizeof(float));
  cudaMallocManaged(&m_y, sizeof(float));
  cudaMallocManaged(&m_r, sizeof(float));

  *m_x = 3.0f;
  *m_y = 2.0f;
  
  cudaDeviceSynchronize();
  caller<<<1, 1>>>(m_r, m_x, m_y);
  cudaDeviceSynchronize();

  // Expectation: (3 * 2) + 1 = 7
  std::cout << "Result is " << *m_r << std::endl;

  cudaFree(m_r);
  cudaFree(m_x);
  cudaFree(m_y);
}
