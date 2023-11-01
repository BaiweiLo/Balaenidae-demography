ref=reference.fa
sp=species

read1=R1.fq.gz
read2=R2.fq.gz

# mapping
bwa mem -t 30 $ref $read1 $read2 | samtools sort > ${sp}_sorted.bam

# add read groups
gatk AddOrReplaceReadGroups -I ${sp}_sorted.bam -O ${sp}_withGroup_sorted.bam -LB bar -PL illumina -PU run -SM $sp -SO coordinate

samtools index ${sp}_withGroup_sorted.bam

# downsampling
read_depth_ratio_to_SRW=number

samtools view -s $read_depth_ratio_to_SRW -b ${sp}_withGroup_sorted.bam > ${sp}_subsampled.bam
