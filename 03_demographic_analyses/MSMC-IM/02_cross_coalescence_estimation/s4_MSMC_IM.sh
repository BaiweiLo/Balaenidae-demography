/combineCrossCoal.py msmc2.final.txt msmc2.final.txt msmc2.final.txt  > combined.final.txt

mkdir MSMC-IM_output

python /MSMC_IM.py  -beta 1e-8,1e-6 -o MSMC-IM_output/4haps  --printfittingdetails --plotfittingdetails --xlog combined.final.txt
