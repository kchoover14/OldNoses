# This script creates plots for Figure 2

library(readxl)
library(ggplot2); library(ggpubr)

#Row 1
den2016 = read_excel("oldnoses-orfuncdata-2016-all.xlsx", sheet = "denisova-2016")
den2016$Odor = factor(den2016$Odor)
den2016$OR = factor(den2016$OR)
den2016$Human_log = log(den2016$Human)
den2016$Denisova_log = log(den2016$Denisova)
nean2016 = read_excel("oldnoses-orfuncdata-2016-all.xlsx", sheet = "neandertal-2016")
nean2016$Odor = factor(nean2016$Odor)
nean2016$OR = factor(nean2016$OR)
nean2016$Human_log = log(nean2016$Human)
nean2016$Neandertal_log = log(nean2016$Neandertal)

#Panel A
den2016.graph = ggplot(den2016, aes(x=Human_log, y=Denisova_log))+
  geom_point(aes(colour = OR)) +
  geom_smooth(method="lm", se= FALSE, col="black") +
  stat_cor(aes(label = paste(..rr.label.., ..p.label.., sep = "~`,`~")),
           method = "pearson", 
           p.accuracy = 0.001, r.accuracy = 0.01,
           label.x = -1, label.y = 2.4, size=6) +
  stat_regline_equation(label.x = -1, label.y = 2.1, size=6) +
  scale_color_viridis_d() +
  xlim(-1, 2.5) +
  ylim(-1, 2.5) +
  labs(x = "Human Response(ln)",
       y = "Denisovan Response(ln)") +
  theme(text = element_text(family = "sans", face = "bold"))+
  theme_pubr(base_size = 20,legend= c(.9,.4))

#Panel B
nean2016.graph = ggplot(nean2016, aes(x=Human_log, y=Neandertal_log))+
  geom_point(aes(colour = OR)) +
  geom_smooth(method="lm", se= FALSE, col="black") +
  stat_cor(aes(label = paste(..rr.label.., ..p.label.., sep = "~`,`~")),
           method = "pearson", 
           p.accuracy = 0.001, r.accuracy = 0.01,
           label.x = -1, label.y = 2.4, size=6) +
  stat_regline_equation(label.x = -1, label.y = 2.1, size=6) +
  xlim(-1, 2.5) +
  ylim(-1, 2.5) +
  labs(x = "Human Response(ln)",
       y = "Neandertal Response(ln)") +
  scale_color_viridis_d()+
  theme(text = element_text(family = "sans", face = "bold"))+
  theme_pubr(base_size = 20,legend= c(.8,.3))

#ROW 2
vcf2016long = read_excel("oldnoses-orfuncdata-2016-all.xlsx", sheet = "VCF2016-long")
vcf2016long$OR = factor(vcf2016long$OR)
vcf2016long$Lineage3 = ordered(vcf2016long$Lineage, 
  levels = c("Human", "Denisova", "Neandertal"))
vcf2016long$Lineage3 <- gsub("Denisova", "Denisovan",vcf2016long$Lineage3)
vcf2016long$Response_log = log(vcf2016long$Response)

#Panel C
boxplot2016.graph=ggplot(vcf2016long, aes(x=Lineage3, y=Response_log, fill=Lineage3)) +
  geom_boxplot(outlier.colour="red", outlier.shape=8,
               outlier.size=2)+
  geom_jitter(shape=16, position=position_jitter(0.2))+
  labs(x="", y = "Response(ln)") +
  scale_fill_brewer(palette="PuOr")+
  theme(text = element_text(family = "sans", face = "bold"))+
  theme_pubr(base_size = 20, legend = "none")

#Panel D
byOR2016.graph = ggplot(vcf2016long, aes(Response_log, Lineage3)) +
  geom_jitter(aes(col=OR)) + 
  geom_smooth(aes(col=OR), method="lm", se=F)+
  scale_color_viridis_d() +
  labs(x = "Response by OR",
       y = "") +
  theme(text = element_text(family = "sans", face = "bold"))+
  theme_pubr(base_size = 20)

#PLOT
library(cowplot)
row1 = plot_grid(nean2016.graph, boxplot2016.graph, 
                 labels = c('a', 'c'),nrow=1)
row2 = plot_grid(den2016.graph, byOR2016.graph,
                 labels = c('b', 'd'))
plot_grid(row1, row2, nrow=2)