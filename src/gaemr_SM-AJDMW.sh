#!/bin/bash
#SBATCH -n 8                    # Number of cores
#SBATCH -N 1                    # Ensure that all cores are on one machine
#SBATCH -t 0-10:00              # Runtime in D-HH:MM
#SBATCH -p general       # Partition to submit to
#SBATCH --mem-per-cpu=10000               # Memory pool for all cores (see also --mem-per-cpu)
#SBATCH -o ajdmw_%j.out      # File to which STDOUT will be written
#SBATCH -e ajdmw_%j.err      # File to which STDERR will be written
#SBATCH --mail-type=ALL         # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=matthewklau@fas.harvard.edu # Email to which notifications will be sent

cd /n/home10/mklau/storage/ap_genomes/SM-AJDMW
module load GAEMR/1.0.1-fasrc03
GAEMR.py --threads=8 -c filtered.contigs.fasta --scaffolds=filtered.scaffolds.fasta --assembler=allPaths --agp=filtered.agp --force 
