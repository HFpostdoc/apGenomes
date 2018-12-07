#! bin/bash
### Run this from the assemblies directory

for i in $(ls fna);
do
    python ~/BUSCOVM/busco3/scripts/run_BUSCO.py -i fna/$i -o $i -l ~/BUSCOVM/busco3/lineages/hymenoptera_odb9 -m genome
done 

