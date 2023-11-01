# create consensus sequence from bam file with angsd 
sp=species
angsd -i ${sp}.bam -doFasta 2 -setMinDepthInd 5 -minMapQ 30 -minQ 30 -uniqueOnly 1 -explode 1 -doCounts 1 -out ${sp}.angsd

# create 50k non overlapping window for the entire genome
# get genome size tab file
twoBitInfo BW.2bit output.tab
# make windows with bedtools
bedtools makewindows -g output.tab -w 50000 > window_50k.bed


