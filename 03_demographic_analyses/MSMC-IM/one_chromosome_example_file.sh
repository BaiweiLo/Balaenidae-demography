## This is an example script of running MSMC and MSMC-IM on chromosome 2 (named 2_RagTag in the reference fasta file)
## for running on multiple chromosomes, please refer to the other examples in this folder

##### MSMC2 #####
## step 0, get the mean coverage ##
## step 1, run bamCaller.py to get processed vcf and mask region for each chromosome
NARW3_depth=48
bcftools mpileup -C50 -r 2_RagTag -f $ref -Ou NARW3.bam  | bcftools call -c -V indels | msmc-tools/bamCaller.py $NARW3_depth NARW3_2_RagTag_out_mask.bed.gz  | gzip -c > NARW3_2_RagTag_out.vcf.gz

SRW_depth=19
bcftools mpileup -C50 -r 2_RagTag -f $ref -Ou NARW3.bam  | bcftools call -c -V indels | msmc-tools/bamCaller.py $SRW_depth SRW_2_RagTag_out_mask.bed.gz  | gzip -c > SRW_2_RagTag_out.vcf.gz

## step 2, run generate_multihetsep.py to get msmc file
msmc-tools/generate_multihetsep.py --mask=NARW3_2_RagTag_out_mask.bed.gz NARW3_2_RagTag_out.vcf.gz > NARW3_test.msmc
msmc-tools/generate_multihetsep.py --mask=SRW_2_RagTag_out_mask.bed.gz SRW_2_RagTag_out.vcf.gz > SRW_test.msmc

## step 3, run msmc2
msmc2_linux64bit -o SRW SRW_test.msmc
msmc2_linux64bit -o NARW3 NARW3_test.msmc


##### cross coalescence rate estimation #####

## step 0 phase the vcf
## step 1, extract chromosome 2 from phased vcf
bcftools view -r 2_RagTag -s NARW3 -Oz -o NARW3_2_RagTag_beagle_phased.vcf.gz bcftools_out_all_WGS_Q20_phased.vcf.gz
bcftools view -r 2_RagTag -s SRW -Oz -o SRW_2_RagTag_beagle_phased.vcf.gz bcftools_out_all_WGS_Q20_phased.vcf.gz

## step 2 cross coalescence estimation with phased genomes
msmc-tools/generate_multihetsep.py --mask=SRW_2_RagTag_out_mask.bed.gz --mask=NARW3_2_RagTag_out_mask.bed.gz NARW3_2_RagTag_beagle_phased.vcf.gz SRW_2_RagTag_beagle_phased.vcf.gz > SRW_NARW3_phased.msmc
msmc2_linux64bit -o SRW_NARW3_phased SRW_NARW3_phased.msmc

## use MSMC results of each species from unphased genome and cross species results from phased genome
msmc-tools/combineCrossCoal.py SRW_NARW3_phased.final.txt SRW.final.txt NARW3.final.txt > SRW_NARW3.combined_phased.msmc2.final.txt


##### run MSMC-IM #####

mkdir MSMC_IM_output
python MSMC-IM/MSMC_IM.py  -beta 1e-8,1e-6 -o MSMC_IM_output/SRW_NARW3.4haps --printfittingdetails --plotfittingdetails --xlog SRW_NARW3.combined_phased.msmc2.final.txt

