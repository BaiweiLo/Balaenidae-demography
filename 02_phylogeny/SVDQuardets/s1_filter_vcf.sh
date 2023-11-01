# filter vcf so that all remaining SNVs are at least 100bp apart
vcftools --gzvcf $vcf  --thin 100 --recode --out $vcf-for_SVDQuardets
