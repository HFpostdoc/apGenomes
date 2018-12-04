#!/bin/bash 
#SBATCH -N 1
#SBATCH -n 16
#SBATCH -p general
#SBATCH -e BUSCO%j.err           # File to which STDERR will be written
#SBATCH -o BUSCO%j.out         # File to which STDOUT will be written
#SBATCH -J BUSCO                # Job name
#SBATCH --mem=24000                     # Memory requested
#SBATCH --time=96:00:00                # Runtime in HH:MM:SS
#SBATCH --mail-type=ALL                # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=matthewklau@fas.harvard.edu # Email to send notifications to

## Based on https://informatics.fas.harvard.edu/best-practices-for-de-novo-transcriptome-assembly-with-trinity.html

source ~/bin/new-modules.sh
module purge
module load centos6/0.0.1-fasrc01
module load BUSCO/3.0.2-fasrc01

# $1 input fasta file (your assembly, e.g. Trinty.fasta)
# $2 output directory (BUSCO will prepend run_)
# $3 lineage directory see lineages to choose from at: http://busco.ezlab.org/
# Example:
# sbatch ~/Labs/HF/projects/apGenomes/bin/busco.sh ~/storage/apg/all_ants/SM-AZXXR/SM-AZXXR.fna SM-AZXXR.fna ~/bin/busco/lineages/hymenoptera_odb9                                                                                                                                       

run_BUSCO.py  -f -i $1 -o $2 -l $3 -m genome
