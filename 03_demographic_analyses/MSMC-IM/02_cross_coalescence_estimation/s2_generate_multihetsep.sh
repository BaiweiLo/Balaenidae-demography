sp1=species1
sp2=species2

# Do this for every chromosome
# using masked files generates in 01_MSMC
msmc-tools/generate_multihetsep.py --mask=${sp1}_${chr1}_out_mask.bed.gz --mask=${sp2}_${chr1}_out_mask.bed.gz 
