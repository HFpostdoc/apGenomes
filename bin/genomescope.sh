#!/bin/bash 
#SBATCH -N 1
#SBATCH -n 16
#SBATCH -p serial_requeue
#SBATCH -e genomescope%j.err           # File to which STDERR will be written
#SBATCH -o genomescope%j.out         # File to which STDOUT will be written
#SBATCH -J genomescope          # Job name
#SBATCH --mem=6000                     # Memory requested
#SBATCH --time=01:00:00                # Runtime in HH:MM:SS
#SBATCH --mail-type=FAIL                # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=matthewklau@fas.harvard.edu # Email to send notifications to

# $1 path to fasta file
# $2 name of the genome
# $3 k-mer level


source ~/bin/new-modules.sh
module purge
module load jellyfish/2.2.5-fasrc01
module load R/3.5.1-fasrc01

# Run jellyfish
jellyfish count -C -m $3 -s 6000000 -t 16 $1 -o $2_$3.jf
jellyfish histo -t 16 $2_$3.jf > $2_$3.histo

# Run genomescope
mkdir gs_$2_$3
Rscript ~/bin/genomescope/genomescope.R $2_$3.histo $3 100 ./gs_$2_$3 1000

