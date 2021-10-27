library(ape)
library(seqinr)
library(phylogram)
library(dendextend)

msf.ubertree = read.alignment(file = "uber-msa.fa", format = "fasta")
distalign.ubertree = dist.alignment(msf.ubertree, matrix = "identity")
distalign.nj.ubertree = nj(distalign.ubertree)
png(filename="fig s2-cladogram.png",
    units="in",
    width=10,
    height=10,
    res=300)
plot(distalign.nj.ubertree, main = "", family = "sans", font=3, ps=12,cex=1.5)
dev.off()

