#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Mar  1 13:21:27 2022

@author: DanielQuesnelle
"""

# Part A of option 2


import random as rd


def DNAgen (Nb, FileName): # this function will generate a random DNA sequence of random length


    FileName = open(FileName+".seq", "w+") # This line creates a file with your choice of name and a .seq extension
   
    #Nb = random.randint(90, 10000) # this object specifies the number of bases in the sequence

    nucleotides = ["A", "T", "C", "G"] # this object lists the 4 nucleotides
    

    sequence_list = rd.choices(nucleotides, k = Nb) # here we are generating our sequence
    
    sequence = ''.join(sequence_list) # here I am joining all the bases together into a coherent sequence
    
    FileName.write(">Random Sequence \n") # this is for FASTA formatting
    FileName.write(sequence) # The actual sequence will be pasted onto the second line of the file
    FileName.close()



if __name__ == "__main__":
    DNAgen()