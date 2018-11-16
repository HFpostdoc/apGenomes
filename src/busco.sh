### Run this from the assemblies directory

mkdir ~/BUSCOVM/busco3/output
mkdir ~/BUSCOVM/busco3/output/summaries

for i in $(ls apg);
do
    python ~/BUSCOVM/busco3/scripts/run_BUSCO.py -i apg/$i/$i.fna -o output_$i -l ~/BUSCOVM/busco3/lineages/eukaryota_odb9 -m genome
    cp output_$i/short_summary.txt ~/BUSCOVM/busco3/output/summaries/short_summary_$i.txt
done 

python ~/BUSCOVM/busco3/scripts/generate_plot.py -wd python ~/BUSCOVM/busco3/output/summaries
