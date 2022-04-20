from numba import cuda
import numpy as np

# Declaration of the foreign function
mul = cuda.declare_device('mul_f32_f32', 'float32(float32, float32)')

functions_cu = ['functions.cu']

# Kernel that links in functions.cu and calls mul
@cuda.jit(link=functions_cu)
def multiply_vectors(r, x, y):
    i = cuda.grid(1)

    if i < len(r):
        r[i] = mul(x[i], y[i])

# Generate random data
N = 32
np.random.seed(1)
x = np.random.rand(N).astype(np.float32)
y = np.random.rand(N).astype(np.float32)
r = np.zeros_like(x)

# Run the kernel
multiply_vectors[1, 32](r, x, y)

# Sanity check - ensure the results match those expected
np.testing.assert_array_equal(r, x * y)
