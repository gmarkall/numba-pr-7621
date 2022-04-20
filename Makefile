CC := 75

all:
	# Compile kernel and device function to PTX only
	nvcc -gencode arch=compute_${CC},code=compute_${CC} -rdc true functions.cu -c
	nvcc -gencode arch=compute_${CC},code=compute_${CC} -rdc true caller.cu -c

	# Compile and link host code
	nvcc -gencode arch=compute_${CC},code=sm_${CC} host.cu functions.o caller.o -o main
