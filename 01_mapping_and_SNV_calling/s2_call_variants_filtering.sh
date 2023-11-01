ref=reference.fa
bcftools mpileup -a FORMAT/AD,FORMAT/ADF,FORMAT/ADR,FORMAT/DP,FORMAT/SP,INFO/AD,INFO/ADF,INFO/ADR -Ou -f $ref $bam1 $bam2 ...  |  bcftools call -mv -Oz - > bcftools_out_all_WGS.vcf.gz

# filtering for quality and read depth >=5
bcftools view --types snps -i 'MIN(FMT/DP)>4' bcftools_out_all_WGS.vcf.gz | bcftools view -e 'AC==0 || AC==AN || F_MISSING > 0.1' -m2 -M2 -O z -o > bcftools_out_all_WGS_filtered.vcf.gz
