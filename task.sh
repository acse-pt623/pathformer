#!/bin/bash
#PBS -l walltime=10:00:00
#PBS -l select=4:ncpus=4:mem=24gb:ngpus=4:gpu_type=RTX6000
#PBS -N pathformer

cd ${PBS_O_WORKDIR}

module load tools/prod

# Load the appropriate CUDA module. We recommend using new versions as older versions are not supported on our systems for profiling. On CX3 phase 2, use CUDA versions >= 12.2.0.
module load CUDA/12.2.0

# Load a Qt module. This is because Nsight Systems uses Qt for its GUI. 
module load Qt5/5.15.5-GCCcore-11.3.0

module load anaconda3/personal

source ~/anaconda3/etc/profile.d/conda.sh

conda activate pathformer

bash scripts/multivariate/electricity.sh