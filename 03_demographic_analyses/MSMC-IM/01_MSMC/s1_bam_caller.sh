# for each chromosomes
bcftools mpileup -C50 --threads 8 -r $chr -f $ref -Ou ${sp}.bam  | bcftools call -c -V indels | msmc-tools/bamCaller.py $mean_depth ${sp}_${chr}_out_mask.bed.gz  | gzip -c > ${sp}_${chr}_out.vcf.gz
