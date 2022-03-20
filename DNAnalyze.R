# Option 2 Part C

library(ggplot2)
library(reshape2)


Analyze = function(FileName) { # Enter the name of the file, WITHOUT the .csv extension
  
  CountData = read.csv(paste(FileName, ".csv", sep = "")) # This line reads the input file made in the command line
  
  A = CountData$A/sum(CountData$A)
  G = CountData$G/sum(CountData$G)
  C = CountData$C/sum(CountData$C)
  T = CountData$T/sum(CountData$T)
  
  Count_Proportions = data.frame(A, G, C, T) # This line makes a data frame containing all the proportions of nucleotides
  
  CountData_Melt = melt(Count_Proportions, variable.name = "Nucleotide", value.name = "Proportion") # This line reformats that data frame so that we can graph it
  
  
  pdf(paste(FileName, ".pdf", sep = ""), width = 8) # we are making a pdf file with the same name as the input
  
  Graph = ggplot(CountData_Melt, aes(x= Proportion))+
    geom_histogram(stat = "bin", binwidth = 0.0001)+
    facet_wrap(Nucleotide ~.)+
    theme_minimal()+
    labs(title = "Nucleotide Proportions in Randomly Generated Sequences")
  print(Graph)
  dev.off()
  
}


Analyze("DNAseq")

