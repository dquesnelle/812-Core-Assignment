#!/bin/bash

echo "A", "G", "C", "T" > DNAseq.csv # here we are creating a new file called DNAseq.csv with the first line being our 4 bases

for count in {1..100} 
do

python3 -c 'import DNAgen; DNAgen.DNAgen(1000, "DNAseq'$count'")' # here we run DNAgen.py to create 100 .seq files

Rscript BASE.r "DNAseq"$count # here we run BASE.r to create 100 .count files

sort -u DNAseq$count.count >> DNAseq.csv # here we sort the outputs from the previous line into the file made on line 3

done
 
