library(tidyverse); library(naniar); library(stringr)

# DNA
# read data
dnasubs.raw <- read_table(file="substitutions-dna-raw data.txt",
                          skip=1,
                          col_names = c("Number", "GenePop2", "Ref", "Alt", "Position"))
# clean data
dnasubs.raw <- dnasubs.raw %>% select(-Number)
dnasubs1 <- dnasubs.raw %>% replace_with_na(replace = list(GenePop2 = "Reference_AA"))
dnasubs2 <- dnasubs1 %>% replace_with_na(replace = list(Ref = "Sample_AA"))
dnasubs3 <- dnasubs2 %>% replace_with_na(replace = list(Alt = "Pos"))
dnasubs.naomit <- na.omit(dnasubs3)
rm(dnasubs.raw, dnasubs1, dnasubs2, dnasubs3)

# split first column into gene and pop
dnasubs.naomit$GenePop = dnasubs.naomit$GenePop2

dnasubs <-  dnasubs.naomit %>%
    separate(GenePop2,c("Gene", "Population"), "-")
rm(dnasubs.naomit)

# save as datatable
write.csv(dnasubs, "substitutions-dna-wrangled data.csv", quote=FALSE, row.names = FALSE)
rm(dnasubs)

# AMINO ACIDS
# read data
aasubs.raw <- read_table(file="substitutions-amino acid-raw data.txt",
                     skip=1,
                     col_names = c("Number", "GenePop2", "Ref", "Alt", "Position"))

# clean data
aasubs.raw <- aasubs.raw %>% select(-Number)
aasubs1 <- aasubs.raw %>% replace_with_na(replace = list(GenePop2 = "Reference_AA"))
aasubs2 <- aasubs1 %>% replace_with_na(replace = list(Ref = "Sample_AA"))
aasubs3 <- aasubs2 %>% replace_with_na(replace = list(Alt = "Pos"))
aasubs.naomit <- na.omit(aasubs3)
rm(aasubs.raw, aasubs1, aasubs2, aasubs3)

# split first column into gene and pop
aasubs.naomit$GenePop = aasubs.naomit$GenePop2

aasubs <-  aasubs.naomit %>%
    separate(GenePop2,c("Gene", "Population"), "-")
rm(aasubs.naomit)

# save as datatable
write.csv(aasubs, "substitutions-amino acids-wrangled data.csv", quote=FALSE, row.names = FALSE)
rm(aasubs)



