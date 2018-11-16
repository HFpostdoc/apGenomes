### Run this from the assemblies directory

mkdir ~/BUSCOVM/busco3/output

for i in $(ls);
do
    python ~/BUSCOVM/busco3/scripts/run_BUSCO.py -i $i -o ~/BUSCOVM/busco3/output/busco_$i -l ~/BUSCOVM/busco3/lineages/metazoa -m genome
    mkdir ~/BUSCOVM/busco3/output/summaries
    cp ~/BUSCOVM/busco3/output/busco_$i/short_summary.txt ~/BUSCOVM/busco3/output/summaries/short_summary_$i.txt
done 

python ~/BUSCOVM/busco3/scripts/generate_plot.py -wd python ~/BUSCOVM/busco3/output/summaries
