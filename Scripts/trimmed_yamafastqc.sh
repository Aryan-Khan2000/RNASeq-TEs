#!/bin/sh
#SBATCH --partition=compute
#SBATCH --time 04:00:00
#SBATCH --account=da494
#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=8000
#SBATCH --job-name FastQC

cd /storage/akhan264/trimmed_yamadataset
module load bioconda
#module load jdk
conda activate pipelines_env
fastqc SRR*
mv *fastqc* /storage/akhan264/trimmed_yamafastqc

