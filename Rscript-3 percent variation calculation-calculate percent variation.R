library(dplyr)

# DNA
# read data
dna <- read.csv("substitutions-dna-wrangled data.csv")

# count variants by gene/total bp per gene
dna.counts <- dna %>%
    count(Gene, Population, sort = FALSE)
rm(dna)

# count number of genes with variants
GeneVar.GeneCounts <- dna.counts %>%
    count(Population, sort = FALSE)
write.table(GeneVar.GeneCounts, "data-nGeneVar.txt", quote=FALSE, row.names = FALSE)

# add column with gene basepair n
dna.pervar <- dna.counts %>% mutate(BasePairs = case_when(
    Gene=='or10a6'~945,
    Gene=='or10g3'~942,
    Gene=='or10g4'~936,
    Gene=='or10g7'~936,
    Gene=='or10j5'~930,
    Gene=='or11a1'~948,
    Gene=='or1a1'~930,
    Gene=='or1c1'~945,
    Gene=='or2a25'~933,
    Gene=='or2b11'~954,
    Gene=='or2c1'~939,
    Gene=='or2j2'~939,
    Gene=='or2j3'~936,
    Gene=='or2w1'~963,
    Gene=='or4q3'~942,
    Gene=='or51l1'~948,
    Gene=='or56a4'~1098,
    Gene=='or5a1'~948,
    Gene=='or5an1'~936,
    Gene=='or5k1'~927,
    Gene=='or5p3'~936,
    Gene=='or6p1'~954,
    Gene=='or7c1'~963,
    Gene=='or7d4'~939,
    Gene=='or8b3'~942,
    Gene=='or8d1'~927,
    Gene=='or8k3'~939,
    Gene=='or4e2'~942,
    Gene=='or51e1'~957,
    Gene=='or51e2'~957))
rm(dna.counts)

# add percentage variation column
dna.pervar$PerVar <- ((dna.pervar$n / dna.pervar$BasePairs) * 100)
write.table(dna.pervar, "dna.pervar.csv", quote=FALSE, row.names = FALSE)

# mean percentage of variation (based on n genes containing variants)
dnaPerVar.tablemean = dna.pervar %>%
    group_by(Population) %>%
    summarise_at(vars(PerVar), list(name = mean))
write.table(dnaPerVar.tablemean, "data-GenePerVarMean.txt", quote=FALSE, row.names = FALSE)

# mean percentage of variation (based on 30 genes total)
dnaPerVar.table30 = dna.pervar %>%
    group_by(Population) %>%
    summarise_at(vars(PerVar), list(name = sum))
dnaPerVar.table30$dnaPerVar = dnaPerVar.table30$name/30
write.table(dnaPerVar.table30, "data-GenePerVarby30.txt", quote=FALSE, row.names = FALSE)
rm(dna.pervar, dnaPerVar.table30, dnaPerVar.tablemean, GeneVar.counts, nGeneVar.table)


#AA
# read data
aa <- read.csv("substitutions-amino acids-wrangled data.csv")

# count variants by gene/total bp per gene
aa.counts <- aa %>%
    count(Gene, Population, sort = FALSE)
rm(aa)

# count number of genes with variants
nProtVar.table = ProtVar.counts <- aa.counts %>%
    count(Population, sort = FALSE)
write.table(nProtVar.table, "data-nProtVar.txt", quote=FALSE, row.names = FALSE)

# add column with gene basepair n
aa.pervar <- aa.counts %>% mutate(BasePairs = case_when(
    Gene=='or10a6'~(945/3),
    Gene=='or10g3'~(942/3),
    Gene=='or10g4'~(936/3),
    Gene=='or10g7'~(936/3),
    Gene=='or10j5'~(930/3),
    Gene=='or11a1'~(948/3),
    Gene=='or1a1'~(930/3),
    Gene=='or1c1'~(945/3),
    Gene=='or2a25'~(933/3),
    Gene=='or2b11'~(954/3),
    Gene=='or2c1'~(939/3),
    Gene=='or2j2'~(939/3),
    Gene=='or2j3'~(936/3),
    Gene=='or2w1'~(963/3),
    Gene=='or4q3'~(942/3),
    Gene=='or51l1'~(948/3),
    Gene=='or56a4'~(1098/3),
    Gene=='or5a1'~(948/3),
    Gene=='or5an1'~(936/3),
    Gene=='or5k1'~(927/3),
    Gene=='or5p3'~(936/3),
    Gene=='or6p1'~(954/3),
    Gene=='or7c1'~(963/3),
    Gene=='or7d4'~(939/3),
    Gene=='or8b3'~(942/3),
    Gene=='or8d1'~(927/3),
    Gene=='or8k3'~(939/3),
    Gene=='or4e2'~(942/3),
    Gene=='or51e1'~(957/3),
    Gene=='or51e2'~(957)/3)
    )
rm(aa.counts)

# add percentage variation column
aa.pervar$PerVar <- ((aa.pervar$n / aa.pervar$BasePairs) * 100)
write.table(aa.pervar, "aa.pervar.csv", quote=FALSE, row.names = FALSE)

# mean percentage of variation (based on n genes containing variants)
aaPerVar.tablemean = aa.pervar %>%
    group_by(Population) %>%
    summarise_at(vars(PerVar), list(name = mean))
write.table(aaPerVar.tablemean, "data-ProtPerVarMean.txt", quote=FALSE, row.names = FALSE)

# mean percentage of variation (based on 30 genes total)
aaPerVar.table30 = aa.pervar %>%
    group_by(Population) %>%
    summarise_at(vars(PerVar), list(name = sum))
aaPerVar.table30$aaPerVar = aaPerVar.table30$name/30
write.table(aaPerVar.table30, "data-ProtPerVarby30.txt", quote=FALSE, row.names = FALSE)
rm(aa.pervar, aaPerVar.table30, aaPerVar.tablemean, ProtVar.counts, nProtVar.table)
