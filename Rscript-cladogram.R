# This script creates the cladogram for Extended Figure 7

library(ape); library(seqinr)
library(phylogram); library(dendextend)

msf.ubertree = read.alignment(file = "uber-msa.fa", format = "fasta")
distalign.ubertree = dist.alignment(msf.ubertree, matrix = "identity")
distalign.nj.ubertree = nj(distalign.ubertree)

plot(distalign.nj.ubertree, main = "", family = "sans", font=3, ps=12,cex=1.5)


