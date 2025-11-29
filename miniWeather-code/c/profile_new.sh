#!/bin/bash

# Request the number of nodes
#SBATCH --nodes=2
# Request the number of MPI tasks (processes) in total or per node
# For example, 4 MPI tasks per node
#SBATCH --ntasks-per-node=2
# Request the number of CPUs (cores) for each MPI task (e.g., 6 threads per task)
# Total cores per node: 4 tasks * 6 cpus/task = 24 cores per node
#SBATCH --cpus-per-task=24
# Request exclusive access to nodes (optional but recommended for guaranteed exclusivity)
#SBATCH --exclusive
# Set the number of OpenMP threads per process using a Slurm environment variable
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
# Ensure OpenMP threads are bound to the allocated resources
export OMP_PROC_BIND=true
export OMP_PLACES=cores

# Load your necessary modules (e.g., specific MPI/compiler modules)
# module load ...

# Run your application using srun with the PMIx backend
# --mpi=pmix tells srun to use the PMIx plugin
srun --mpi=pmi2 --cpu-bind=ldoms \
`which vtune` -collect hotspots -r ../vtune_res$1 \
./build/openmp > logs/openmp_test_profile_$1.log
