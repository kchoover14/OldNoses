# This script concatenates amino acid fastas for use in Rscript-cladogram.R to create the cladogram for Extended Figure 7

library(ape); library(seqinr)
library(phylogram); library(dendextend)
library(Biostrings)

or1a1=readAAStringSet(file = "or1a1-aa-all.fa", format = "fasta")
or2a25=readAAStringSet(file = "or2a25-aa-all.fa", format = "fasta")
or2c1=readAAStringSet(file = "or2c1-aa-all.fa", format = "fasta")
or2j2=readAAStringSet(file = "or2j2-aa-all.fa", format = "fasta")
or2j3=readAAStringSet(file = "or2j3-aa-all.fa", format = "fasta")
or4e2=readAAStringSet(file = "or4e2-aa-all.fa", format = "fasta")
or4q3=readAAStringSet(file = "or4q3-aa-all.fa", format = "fasta")
or5a1=readAAStringSet(file = "or5a1-aa-all.fa", format = "fasta")
or5an1=readAAStringSet(file = "or5an1-aa-all.fa", format = "fasta")
or5k1=readAAStringSet(file = "or5k1-aa-all.fa", format = "fasta")
or8k3=readAAStringSet(file = "or8k3-aa-all.fa", format = "fasta")
or10g4=readAAStringSet(file = "or10g4-aa-all.fa", format = "fasta")
or51e1=readAAStringSet(file = "or51e1-aa-all.fa", format = "fasta")
or51l1=readAAStringSet(file = "or51l1-aa-all.fa", format = "fasta")
or1c1=readAAStringSet(file = "or1c1-aa-all.fa", format = "fasta")
or2b11=readAAStringSet(file = "or2b11-aa-all.fa", format = "fasta")
or2w1=readAAStringSet(file = "or2w1-aa-all.fa", format = "fasta")
or5p3=readAAStringSet(file = "or5p3-aa-all.fa", format = "fasta")
or6p1=readAAStringSet(file = "or6p1-aa-all.fa", format = "fasta")
or7c1=readAAStringSet(file = "or7c1-aa-all.fa", format = "fasta")
or7d4=readAAStringSet(file = "or7d4-aa-all.fa", format = "fasta")
or8b3=readAAStringSet(file = "or8b3-aa-all.fa", format = "fasta")
or8d1=readAAStringSet(file = "or8d1-aa-all.fa", format = "fasta")
or10a6=readAAStringSet(file = "or10a6-aa-all.fa", format = "fasta")
or10g3=readAAStringSet(file = "or10g3-aa-all.fa", format = "fasta")
or10g7=readAAStringSet(file = "or10g7-aa-all.fa", format = "fasta")
or10j5=readAAStringSet(file = "or10j5-aa-all.fa", format = "fasta")
or11a1=readAAStringSet(file = "or11a1-aa-all.fa", format = "fasta")
or51e2=readAAStringSet(file = "or51e2-aa-all.fa", format = "fasta")
or56a4=readAAStringSet(file = "or56a4-aa-all.fa", format = "fasta")

uber.msa=AAStringSet(paste0(or1a1,or2a25,or2c1,or2j2,or2j3,or4e2,
                            or4q3,or5a1,or5an1,or5k1,or8k3,or10g4,
                            or51e1,or51l1,or1c1,or2b11,or2w1,or5p3,
                            or6p1,or7c1,or7d4,or8b3,or8d1,or10a6,
                            or10g3,or10g7,or10j5,or11a1,or51e2,or56a4))
#reassignnames
names(uber.msa)= names(or1a1)
writeXStringSet(uber.msa,"uber-msa.fa")

