#!/bin/bash
pushd build
bash cmake_hpc.sh
popd
make -C build
objdump -d --demangle build/openmp > build/openmp.asm
