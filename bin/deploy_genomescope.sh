#!/bin/bash

# This will run all of the genomes present in a directory
# Genomes should be in sub-directories with subdirectory names 
# that are identical to their .fna names.
# $1 location of genomescope.sh
# $2 directory with assemblies as fasta
# $3 k-mer level
# EXAMPLE: 
# deploy_genomescope.sh ~/Labs/HF/projects/apGenomes/bin/genomescope.sh ~/storage/apg/all_ants 21

for i in $(ls $2 | grep SM); do
    echo $2/$i/$i.fna
    sbatch $1 $2/$i/$i.fna $i $3
    sleep 5
done

echo "COMPLETE: genomescope deploy"
