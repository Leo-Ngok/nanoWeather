salloc --nodes=2 --exclusive --ntasks-per-node=2 --cpus-per-task=24 \
mpirun -np 4 -ppn 2 \
-genv I_MPI_DEBUG=5 \
-genv I_MPI_PIN=0 \
--map-by numa:PE=24 \  # 按NUMA域映射进程，每个域24核心
--rank 0 --prefix "./numa_bind.sh 0" \
--rank 1 --prefix "./numa_bind.sh 1" \
--rank 2 --prefix "./numa_bind.sh 0" \
--rank 3 --prefix "./numa_bind.sh 1" \
-genv OMP_NUM_THREADS=24 \
-genv OMP_PLACES="{0:24:2}" \  # rank0/rank2用偶数核心
-genv OMP_PLACES="{1:24:2}" \  # rank1/rank3用奇数核心
-genv OMP_PROC_BIND=close \
`which vtune` -collect hotspots -r ../vtune_res$1 \
./build/openmp > logs/openmp_test_profile_$1.log


# -genv PATH=$PATH \  # 传递环境变量