#!/bin/bash

source /home/software/spack/share/spack/setup-env.sh

spack load gcc@10.4.0
spack load parallel-netcdf
spack load cmake@3.24.3%gcc@10.4.0
# spack load intel-oneapi-compilers@2022 intel-oneapi-mkl@2022
# 
spack load intel-oneapi-vtune

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$(spack location -i parallel-netcdf)/lib

