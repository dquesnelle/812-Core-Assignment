#!/usr/bin/env Rscript

# Option 2 part B


RandSeq = function(FileName) {
  
  library(dplyr)
  library(readr)
  library(stringr)
  library(littler)
  
  File = read_file(file = paste(FileName, ".seq", sep = ""))
  
  Seq2 = gsub(">Random Sequence ", "", File)

  
  num_A = str_count(Seq2, "A")
  num_T = str_count(Seq2, "T")
  num_C = str_count(Seq2, "C")
  num_G = str_count(Seq2, "G")
  
  
  counts = paste(c(num_A, num_G, num_C, num_T), collapse = ", ")

  write_file(counts, file = paste(FileName, ".count", sep = ""))
  
  
}

args = commandArgs(trailingOnly = TRUE)
RandSeq(args[1])


