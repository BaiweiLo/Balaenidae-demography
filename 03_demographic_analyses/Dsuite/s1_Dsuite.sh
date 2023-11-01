# run Dtrios to get D statitics
Dsuite Dtrios -c $vcf SETS.txt -o out

#run Dinvestigate for sliding window statistics on selected trios
Dsuite Dinvestigate -w 50,5 $vcf SETS.txt trios.txt
