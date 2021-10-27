library(readxl); library(dplyr); library(psych)
library(ggplot2); library(ggpubr); library(viridis)

#Data
genvar = read.csv("dna.pervar.csv", header=TRUE)
aavar = read.csv("aa.pervar.csv", header=TRUE)

#DNA Heat Map
genvar$Gene = factor(genvar$Gene)
genvar$Population = factor(genvar$Population,
  levels = c('Ancient Neandertal Altai', 'Ancient Neandertal Chagyrskaya',
    "Ancient Neandertal Vindija", "Ancient Denisovan",
    "Ancient Ust Ishim", 'Africa Esan', "Africa Gambian",
    "Africa Luhya", "Africa Mende", "Africa Yoruban",
    "Americas Black USA", "Americas Black Caribbean",
    "Europe British", "Europe Finn", "Europe Spanish",
    "Europe Tuscan", "Americas White USA", "SW Asia Bengali",
    "SW Asia Gujarati", 'SW Asia Punjabi', 'SW Asia Tamil',
    'SW Asia Telugu', 'Asia Dai', 'Asia Han Beijing',
    'Asia Han Southern', 'Asia Japanese',
    'Asia Kinh', 'Americas Columbian',
    'Americas Mexican', 'Americas Puerto Rican', 'Americas Peruvian'))

genvar <- genvar %>%
  arrange(desc(Chr, Start)) %>%               # sort your dataframe
  mutate(Gene = factor(Gene, unique(Gene))) # reset your factor-column based on that order

pa = ggplot(genvar, aes(x=Population, y=Gene, fill=PerVar)) +
  theme(axis.text.x = element_text(angle = 45, hjust=1))+
  xlab("") +
  ylab("Percent of Gene with DNA Variants") +
  geom_tile(color='White', size=0.1) +
  scale_fill_viridis() +
  coord_equal() +
  theme(legend.title = element_blank())+
  theme(text=element_text(size=35,  family="sans"))

#AA Heat Map
aavar$Gene = factor(aavar$Gene)
aavar$Population = factor(aavar$Population,
                          levels = c('Ancient Neandertal Altai', 'Ancient Neandertal Chagyrskaya',
                                     "Ancient Neandertal Vindija", "Ancient Denisovan",
                                     "Ancient Ust Ishim", 'Africa Esan', "Africa Gambian",
                                     "Africa Luhya", "Africa Mende", "Africa Yoruban",
                                     "Americas Black USA", "Americas Black Caribbean",
                                     "Europe British", "Europe Finn", "Europe Spanish",
                                     "Europe Tuscan", "Americas White USA", "SW Asia Bengali",
                                     "SW Asia Gujarati", 'SW Asia Punjabi', 'SW Asia Tamil',
                                     'SW Asia Telugu', 'Asia Dai', 'Asia Han Beijing',
                                     'Asia Han Southern', 'Asia Japanese',
                                     'Asia Kinh', 'Americas Columbian',
                                     'Americas Mexican', 'Americas Puerto Rican', 'Americas Peruvian'))

aavar <- aavar %>%
  arrange(desc(Chr, Start)) %>%               # sort your dataframe
  mutate(Gene = factor(Gene, unique(Gene))) # reset your factor-column based on that order

pb = ggplot(aavar, aes(x=Population, y=Gene, fill=PerVar)) +
  theme(axis.text.x = element_text(angle = 45, hjust=1))+
  xlab("") +
  ylab("Percent of Amino Acids with Protein Variants") +
  geom_tile(color='White', size=0.1) +
  scale_fill_viridis() +
  coord_equal() +
  theme(legend.title = element_blank())+
  theme(text=element_text(size=35,  family="sans"))

png("F1-genvar-heat maps.png", width=45, height=20,
    res=400, units = "in")
ggarrange(pa, ggplot() + theme_void(), pb,
          nrow=1, widths = c(4, -1, 4))
dev.off()

