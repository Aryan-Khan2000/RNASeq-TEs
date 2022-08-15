#!/bin/sh
#SBATCH --job-name=fastp
#SBATCH --partition=compute
#SBATCH --account=da494
#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=8000
#SBATCH --time 02:00:00

INPUT=/storage/akhan264/yamadataset
OUTPUT=/storage/akhan264/trimmed_yamadataset
REPORT=/storage/akhan264/yama_fastp_reports

module load bioconda
conda activate pipelines_env

for r1 in ${INPUT}/*.fastq.gz
do
   name=$(basename ${r1} .fastq.gz)
   echo $name

   fastp -i ${INPUT}/${name}.fastq.gz -o ${OUTPUT}/${name}_fastp_trimmed.fastq.gz --adapter_sequence=AAGCAGTGGTATCAACGCAGAGTAC -l 25 -h ${REPORT}/${name}_trim.html -q 30

done
