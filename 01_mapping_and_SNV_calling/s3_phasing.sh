# the phased vcf are used in cross coalescence rate estimation of MSMC-IM analysis

java -jar -Xmx20G beagle.22Jul22.46e.jar nthreads=4 ne=5000 gt=$vcf out=$phased_vcf
