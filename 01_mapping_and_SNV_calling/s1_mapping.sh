ref=phyMac1_rm.fa
sp=BW

read1=/project/MDL_ChIPseq/Fastq/baiwei/whale/bluewhale/055666_L999_R1_001.fastq.gz
read2=/project/MDL_ChIPseq/Fastq/baiwei/whale/bluewhale/055666_L999_R2_001.fastq.gz

bwa mem -t 30 $ref $read1 $read2 | samtools sort > ${sp}_sorted.bam

gatk AddOrReplaceReadGroups -I ${sp}_sorted.bam -O ${sp}_withGroup_sorted.bam -LB bar -PL illumina -PU run -SM $sp -SO coordinate

samtools index ${sp}_withGroup_sorted.bam
