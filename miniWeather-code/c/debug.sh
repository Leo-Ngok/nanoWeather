#!/bin/bash

# salloc -N 2 \
# `which mpirun` -n 4 -ppn 2 \
# -genv OMP_NUM_THREADS=24 -genv OMP_PLACES=threads -genv OMP_PROC_BIND=close \
# ./build/openmp_test > logs/openmp_test_debug_$1.log

# 2 x 2 x 24 --> 65s = 60 + 5s
# salloc --nodes=2 --exclusive --ntasks-per-node=2 --cpus-per-task=24 \
# mpirun -np 4 -ppn 2 -genv I_MPI_DEBUG=5 -genv I_MPI_PIN_DOMAIN=numa \
# -genv OMP_PLACES=cores -genv OMP_PROC_BIND=true \
# ./build/openmp_test > logs/openmp_test_debug_$1.log

# 2 x 48 --> 86.622s = 47.2s + 39s
# salloc --nodes=2 --exclusive \
# mpirun -np 96 -ppn 48 -bind-to core -genv I_MPI_DEBUG=5 -genv I_MPI_PIN=1 -genv I_MPI_PIN_DOMAIN=core \
# -genv OMP_NUM_THREADS=1 -genv OMP_PLACES=threads -genv OMP_PROC_BIND=close \
# ./build/openmp > logs/openmp_test_debug_$1.log

# 2 x 24 x 2 --> 105 = 80 + 35s
salloc --nodes=2 --exclusive --cpus-per-task=2 \
mpirun -np 48 -ppn 24 -bind-to core -genv I_MPI_DEBUG=5 -genv I_MPI_PIN=1 -genv I_MPI_PIN_DOMAIN=core \
-genv OMP_NUM_THREADS=2 -genv OMP_PLACES=threads -genv OMP_PROC_BIND=close \
./build/openmp > logs/openmp_test_debug_$1.log

# 2 x 12 x 4 --> 158 = 150 + 8

# 2 x 6 x 8
