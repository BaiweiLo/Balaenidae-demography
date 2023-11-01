library(pegas)
library(foreach)
library(doMC)

source("SNPs2CF/functions_v1.5.R")

vcf2phylip(vcf.name="for_SNPs2CF.recode.vcf", total.SNPs=23615, output.name=NULL);
output <- SNPs2CF(seqMatrix="for_SNPs2CF.recode.vcf.phy", 
                  bootstrap=TRUE, outputName="SNPs2CF_SNPs-bootstrap.csv", 
                  save.progress=FALSE)
