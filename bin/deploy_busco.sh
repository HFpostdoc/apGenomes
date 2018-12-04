#!/bin/bash

# This will run all of the genomes present in a directory
# Genomes should be in sub-directories with subdirectory names 
# that are identical to their .fna names.
# $1 location of busco.sh
# $2 directory with assemblies as fasta
# $3 lineage directory
# EXAMPLE: 
# deploy_busco.sh ~/Labs/HF/projects/apGenomes/bin/busco.sh ~/storage/apg/all_ants ~/bin/busco/lineages/hymenoptera_odb9

for i in $(ls $2 | grep SM); do
    echo $2/$i/$i.fna
    sbatch $1 $2/$i/$i.fna $i $3
    sleep 5
done

echo "COMPLETE: BUSCO deploy"
