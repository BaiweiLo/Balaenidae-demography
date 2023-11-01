# for each chromosome, create a phased vcf
bcftools view -r $chr -s $sp Oz -o ${sp}_${chr}_phased.vcf.gz $phased_vcf 
