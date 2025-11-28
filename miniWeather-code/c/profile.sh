#!/bin/bash

salloc -N 2 \
`which mpirun` -n 4 -ppn 2 \
-genv OMP_NUM_THREADS=24 -genv OMP_PLACES=threads -genv OMP_PROC_BIND=close \
`which vtune` -collect hotspots -r ../vtune_res$1 \
./build/openmp > logs/openmp_test_profile_$1.log