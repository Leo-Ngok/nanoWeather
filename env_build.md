初始化spack环境后，请按以下步骤操作，完成依赖库的加载和环境变量设置

source ~/.bashrc

source /home/software/spack/share/spack/setup-env.sh

spack load gcc@10.4.0
spack load parallel-netcdf
spack load cmake@3.24.3%gcc@10.4.0


export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$(spack location -i parallel-netcdf)/lib

cd [目录]/c/build

chmod +x cmake_clean.sh
chmod +x check_output.sh

source cmake_clean.sh

source cmake_hpc.sh

make

