#!/bin/bash

# salloc --exclusive -N 2 \
# `which mpirun` -n 4 -ppn 2 --report-bindings \
# -genv OMP_NUM_THREADS=24 -genv OMP_PLACES=threads -genv OMP_PROC_BIND=close \
# `which vtune` -collect hotspots -r ../vtune_res$1 \
# ./build/openmp > logs/openmp_test_profile_$1.log

# 2 x 2 x 24
# salloc --nodes=2 --exclusive --ntasks-per-node=2 --cpus-per-task=24 \
# mpirun -np 4 -ppn 2 -genv I_MPI_DEBUG=5 -genv I_MPI_PIN=1 -genv I_MPI_PIN_DOMAIN=core  \
# -genv OMP_PLACES=cores -genv OMP_PROC_BIND=true \
# `which vtune` -collect hotspots -r ../vtune_res$1 \
# ./build/openmp > logs/openmp_test_profile_$1.log
# salloc --nodes=2 --exclusive --ntasks-per-node=2 --cpus-per-task=24 \
# mpirun -np 4 -ppn 2 \
# -genv I_MPI_DEBUG=5 \
# -genv I_MPI_PIN=1 \
# -genv I_MPI_PIN_DOMAIN=numa \
# -genv I_MPI_PIN_ORDER=scatter \
# -genv I_MPI_PIN_PROCESSOR_LIST=1-47:2,0-46:2,1-47:2,0-46:2 \
# -genv OMP_NUM_THREADS=24 \
# -genv OMP_PLACES=cores \
# -genv OMP_PROC_BIND=close \
# `which vtune` -collect hotspots -r ../vtune_res$1 \
# ./build/openmp > logs/openmp_test_profile_$1.log

# salloc --nodes=2 --exclusive --ntasks-per-node=2 --cpus-per-task=24 \
# mpirun -np 4 -ppn 2 \
# -genv I_MPI_DEBUG=5 \
# -genv I_MPI_PIN=0 \
# --prefix "$(which numactl) --cpunodebind=0 --membind=0" : \
# --prefix "$(which numactl) --cpunodebind=1 --membind=1" : \
# --prefix "$(which numactl) --cpunodebind=0 --membind=0" : \
# --prefix "$(which numactl) --cpunodebind=1 --membind=1" \
# -genv OMP_NUM_THREADS=24 \
# -genv OMP_PLACES=cores \
# -genv OMP_PROC_BIND=close \
# `which vtune` -collect hotspots -r ../vtune_res$1 \
# ./build/openmp > logs/openmp_test_profile_$1.log

# salloc --nodes=2 --exclusive --ntasks-per-node=2 --cpus-per-task=24 \
# mpirun -np 4 -ppn 2 \
# -genv I_MPI_DEBUG=5 \
# -genv I_MPI_PIN=1 \
# -genv I_MPI_PIN_DOMAIN=custom \  
# -genv I_MPI_PIN_PROCESSOR_LIST="0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46:1,3,5,7,9,11,13,15,17,19,21,23,25,27,29,31,33,35,37,39,41,43,45,47:0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46:1,3,5,7,9,11,13,15,17,19,21,23,25,27,29,31,33,35,37,39,41,43,45,47" \  
# -genv I_MPI_PIN_ORDER=explicit \ 
# -genv OMP_NUM_THREADS=24 \
# -genv OMP_PLACES=cores \
# -genv OMP_PROC_BIND=close \
# `which vtune` -collect hotspots -r ../vtune_res$1 \
# ./build/openmp > logs/openmp_test_profile_$1.log

# salloc --nodes=2 --exclusive --ntasks-per-node=2 --cpus-per-task=24 \
# --cpu-bind=rank:0=0-46:2,1=1-47:2,2=0-46:2,3=1-47:2 \  
# mpirun -np 4 -ppn 2 \
# -genv I_MPI_DEBUG=5 \
# -genv I_MPI_PIN=0 \  # 禁用MPI自身绑定
# -genv OMP_NUM_THREADS=24 \
# -genv OMP_PLACES=cores \
# -genv OMP_PROC_BIND=close \
# `which vtune` -collect hotspots -r ../vtune_res$1 \
# ./build/openmp > logs/openmp_test_profile_$1.log

# salloc --nodes=2 --exclusive --ntasks-per-node=2 --cpus-per-task=24 \
# `which mpirun` -np 4 -ppn 2 \
# -genv I_MPI_DEBUG=5 \
# -genv I_MPI_PIN=1 \
# -genv I_MPI_PIN_DOMAIN=core \  
# -genv I_MPI_PIN_PROCESSOR_LIST="0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46:1,3,5,7,9,11,13,15,17,19,21,23,25,27,29,31,33,35,37,39,41,43,45,47:0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46:1,3,5,7,9,11,13,15,17,19,21,23,25,27,29,31,33,35,37,39,41,43,45,47" \
# -genv I_MPI_PIN_ORDER=explicit \ 
# -genv OMP_NUM_THREADS=24 \
# -genv OMP_PLACES=cores \
# -genv OMP_PROC_BIND=close \
# `which vtune` -collect hotspots -r ../vtune_res$1 \
# ./build/openmp > logs/openmp_test_profile_$1.log

# salloc --nodes=2 --exclusive --ntasks-per-node=2 --cpus-per-task=24 \
# mpirun -np 4 -ppn 2 \
# -genv I_MPI_DEBUG=5 \
# -genv I_MPI_PIN=1 \
# -genv I_MPI_PIN_DOMAIN=core \
# -genv I_MPI_PIN_PROCESSOR_LIST="0-46:2,1-47:2,0-46:2,1-47:2" \  # 按rank指定核心范围
# -genv I_MPI_PIN_ORDER=explicit \
# -genv OMP_NUM_THREADS=24 \
# -genv OMP_PLACES=cores \
# -genv OMP_PROC_BIND=close \
# `which vtune` -collect hotspots -r ../vtune_res$1 \
# ./build/openmp > logs/openmp_test_profile_$1.log



# srun -N 2 -n 96 --export=I_MPI_DEBUG=5 --export=I_MPI_PIN_DOMAIN=numa \
# `which vtune` -collect hotspots -r ../vtune_res$1 \
# ./build/openmp > logs/openmp_test_profile_$1.log


# -genv I_MPI_OFI_PROVIDER=shm:ofi \
# 2 x 48
salloc --nodes=2 --exclusive \
mpirun -np 96 -ppn 48 -bind-to core \
-genv I_MPI_DEBUG=5 -genv I_MPI_PIN=1 -genv I_MPI_PIN_DOMAIN=core \
-genv OMP_NUM_THREADS=1 -genv OMP_PLACES=threads -genv OMP_PROC_BIND=close \
`which vtune` -collect hotspots -r ../vtune_res$1 \
./build/openmp > logs/openmp_test_profile_$1.log

# 2 x 24 x 2
# salloc --nodes=2 --exclusive --cpus-per-task=2 \
# mpirun -np 48 -ppn 24 -bind-to core -genv I_MPI_DEBUG=5 -genv I_MPI_PIN=1 -genv I_MPI_PIN_DOMAIN=core \
# -genv OMP_NUM_THREADS=2 -genv OMP_PLACES=threads -genv OMP_PROC_BIND=close \
# `which vtune` -collect hotspots -r ../vtune_res$1 \
# ./build/openmp > logs/openmp_test_profile_$1.log

# 2 x 12 x 4
# salloc --nodes=2 --exclusive --ntasks-per-node=12 --cpus-per-task=4 \
# mpirun -np 24 -ppn 12 -bind-to core -genv I_MPI_DEBUG=5 -genv I_MPI_PIN=1 -genv I_MPI_PIN_DOMAIN=core \
# -genv OMP_NUM_THREADS=4 -genv OMP_PLACES=threads -genv OMP_PROC_BIND=close \
# `which vtune` -collect uarch-exploration -r ../vtune_res$1 \
# ./build/openmp > logs/openmp_test_profile_$1.log
