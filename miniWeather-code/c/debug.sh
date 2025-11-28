#!/bin/bash

salloc -N 2 \
`which mpirun` -n 4 -ppn 2 \
-genv OMP_NUM_THREADS=24 -genv OMP_PLACES=threads -genv OMP_PROC_BIND=close \
./build/openmp_test > logs/openmp_test_debug_$1.log