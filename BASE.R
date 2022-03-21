#!/usr/bin/env Rscript

# Option 2 part B


RandSeq = function(FileName) {
  
  library(dplyr)
  library(readr)
  library(stringr)
  library(littler)
  
  File = read_file(file = paste(FileName, ".seq", sep = "")) # Here we read the .seq files made in DNAgen.py
  
  Seq2 = gsub(">Random Sequence ", "", File) # the FASTA header is removed from the file

  # Here we are counting the number of each base using str_count
  num_A = str_count(Seq2, "A")
  num_T = str_count(Seq2, "T")
  num_C = str_count(Seq2, "C")
  num_G = str_count(Seq2, "G")
  
  
  counts = paste(c(num_A, num_G, num_C, num_T), collapse = ", ") # the 4 counts are pasted into one object separated by ","

  write_file(counts, file = paste(FileName, ".count", sep = "")) # the counts are written into a new file called FileName.count
  
  
}

args = commandArgs(trailingOnly = TRUE)
RandSeq(args[1]) # here we define our FileName parameter to be used in the command line


