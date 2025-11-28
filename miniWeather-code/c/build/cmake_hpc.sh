#!/bin/bash

export TEST_MPI_COMMAND="mpirun -n 1"

./cmake_clean.sh

cmake -DCMAKE_CXX_COMPILER=mpicxx                                                   \
      -DCXXFLAGS="-O3 -std=c++11 -I$(spack location -i parallel-netcdf)/include"    \
      -DLDFLAGS="-L$(spack location -i parallel-netcdf)/lib -lpnetcdf"              \
      -DOPENMP_FLAGS="-fopenmp"                                                     \
      -DNX=3200                                                                     \
      -DNZ=1600                                                                     \
      -DDATA_SPEC="DATA_SPEC_COLLISION"                                             \
      -DSIM_TIME=30                                                                \
      -DOUT_FREQ=50                                                                 \
      ..

# TODO: Revert NX to 3200
# TODO: Revert NZ to 1600
