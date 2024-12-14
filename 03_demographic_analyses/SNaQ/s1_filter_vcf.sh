# retain only one SNP within every 100000 basepair
vcftools --gzvcf $vcf.gz --thin 100000 --recode --out for_SNPs2CF_auto
