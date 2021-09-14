# This script generates data for Extended Data Figure 4
# This script generates heat maps for Figure 1 with genes ordered by chromosomal position

library(readxl); library(dplyr); library(psych)
library(ggplot2); library(ggpubr); library(viridis)

#Variation Summary
sink("genetic varation-DNA summary.txt")
describeBy(genvar, group=genvar$Group, digits = 3)
sink()

sink("genetic varation-AA summary.txt")
describeBy(aavar, group=aavar$Group, digits = 3)
sink()

#DNA Heat Map
genvar = read_excel("data-pervar by gene-humref.xlsx", sheet = "dna-pervar")
genvar$Gene = factor(genvar$Gene,levels=sort(unique(genvar$Gene),decreasing=TRUE))
genvar$Group = factor(genvar$Group,
  levels = c('Ancient Neandertal Altai', 'Ancient Neandertal Chagyrskaya',
    "Ancient Neandertal Vindija", "Ancient Denisovan",
    "Ancient Human-Ust'-Ishim", 'Africa Esan', "Africa Gambian",
    "Africa Luhye", "Africa Mende", "Africa Nigeria",
    "Americas Black", "Americas Black Carribean",
    "Europe British", "Europe Finn", "Europe Spanish",
    "Europe Tuscan", "Americas White", "SW Asia Bangaldeshi",
    "SW Asia Gujarati", 'SW Asia Pakistan', 'SW Asia Tamil',
    'SW Asia Telugu', 'Asia Dai', 'Asia Han Beijing',
    'Asia Han Southern', 'Asia Japanese',
    'Asia Kihn', 'Americas Columbian',
    'Americas Mexican', 'Americas Puerto Rican', 'Americas Peruvian'))

genvar <- genvar %>%
  arrange(desc(Chr, Start)) %>%               # sort your dataframe
  mutate(Gene = factor(Gene, unique(Gene))) # reset your factor-column based on that order

pa = ggplot(genvar, aes(x=Group, y=Gene, fill=PerVar)) +
  theme(axis.text.x = element_text(angle = 45, hjust=1))+
  xlab("") +
  ylab("Percent of Gene with DNA Variants") +
  geom_tile(color='White', size=0.1) +
  scale_fill_viridis() +
  coord_equal() +
  theme(legend.title = element_blank())+
  theme(text=element_text(size=35,  family="sans"))

#AA Heat Map
aavar = read_excel("data-pervar by gene-humref.xlsx", sheet = "aa-pervar")
aavar$Gene = factor(aavar$Gene,levels=sort(unique(aavar$Gene),decreasing=TRUE))
aavar$Group = factor(aavar$Group,
                      levels = c('Ancient Neandertal Altai', 'Ancient Neandertal Chagyrskaya',
                                 "Ancient Neandertal Vindija", "Ancient Denisovan",
                                 "Ancient Human-Ust'-Ishim", 'Africa Esan', "Africa Gambian",
                                 "Africa Luhye", "Africa Mende", "Africa Nigeria",
                                 "Americas Black", "Americas Black Carribean",
                                 "Europe British", "Europe Finn", "Europe Spanish",
                                 "Europe Tuscan", "Americas White", "SW Asia Bangaldeshi",
                                 "SW Asia Gujarati", 'SW Asia Pakistan', 'SW Asia Tamil',
                                 'SW Asia Telugu', 'Asia Dai', 'Asia Han Beijing',
                                 'Asia Han Southern', 'Asia Japanese',
                                 'Asia Kihn', 'Americas Columbian',
                                 'Americas Mexican', 'Americas Puerto Rican', 'Americas Peruvian'))

aavar <- aavar %>%
  arrange(desc(Chr, Start)) %>%               # sort your dataframe
  mutate(Gene = factor(Gene, unique(Gene))) # reset your factor-column based on that order

pb = ggplot(aavar, aes(x=Group, y=Gene, fill=PerVar)) +
  theme(axis.text.x = element_text(angle = 45, hjust=1))+
  xlab("") +
  ylab("Percent of Amino Acids with Protein Variants") +
  geom_tile(color='White', size=0.1) +
  scale_fill_viridis() +
  coord_equal() +
  theme(legend.title = element_blank())+
  theme(text=element_text(size=35,  family="sans"))

#PLOT
ggarrange(pa, ggplot() + theme_void(), pb,
          nrow=1, widths = c(4, -1, 4))

