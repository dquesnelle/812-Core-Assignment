#!/bin/bash

echo "A", "G", "C", "T" > DNAseq.csv

for count in {1..100}
do

python3 -c 'import DNAgen; DNAgen.DNAgen(1000, "DNAseq'$count'")'

Rscript BASE.r "DNAseq"$count 

sort -u DNAseq$count.count >> DNAseq.csv

done
 
