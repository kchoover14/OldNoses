# This script creates the plot for Extended Data Figure 10

library(readxl); library(dplyr)
library(car)
library(ggplot2); library(ggpubr)

den2016 = read_excel("oldnoses-orfuncdata-2016-active.xlsx", sheet = "denisova-2016")
den2016$Odor = factor(den2016$Odor)
den2016$OR = factor(den2016$OR)
den2016$Human_log = log(den2016$Human)
den2016$Denisova_log = log(den2016$Denisova)
nean2016 = read_excel("oldnoses-orfuncdata-2016-active.xlsx", sheet = "neandertal-2016")
nean2016$Odor = factor(nean2016$Odor)
nean2016$OR = factor(nean2016$OR)
nean2016$Human_log = log(nean2016$Human)
nean2016$Neandertal_log = log(nean2016$Neandertal)

#plot regression
p1=ggplot(den2016, aes(x=Human_log, y=Denisova_log))+
  geom_point(aes(colour = OR)) +
  geom_smooth(method="lm", se= FALSE, col="black") +
  stat_cor(aes(label = paste(..rr.label.., ..p.label.., sep = "~`,`~")),
           method = "pearson", 
           p.accuracy = 0.001, r.accuracy = 0.01,
           label.x = -1, label.y = 2, size=6) +
  stat_regline_equation(label.x = -1, label.y = 1.6, size=6) +
  xlim(-1,2)+
  ylim(-1,2)+
  labs(x = "Human Response(ln)",
       y = "Denisova Response(ln)") +
  scale_color_viridis_d() +
  theme(text = element_text(family = "sans", face = "bold"))+
  theme_pubr(base_size = 20, legend="right")

#plot regression
p2=ggplot(nean2016, aes(x=Human_log, y=Neandertal_log))+
  geom_point(aes(colour = OR)) +
  geom_smooth(method="lm", se= FALSE, col="black") +
  stat_cor(aes(label = paste(..rr.label.., ..p.label.., sep = "~`,`~")),
           method = "pearson", 
           p.accuracy = 0.001, r.accuracy = 0.01,
           label.x = -1, label.y = 2, size=6) +
  stat_regline_equation(label.x = -1, label.y = 1.6, size=6) +
  xlim(-1,2)+
  ylim(-1,2)+
  labs(x = "Human Response(ln)",
       y = "Neandertal Response(ln)") +
  scale_color_viridis_d() +
  theme(text = element_text(family = "sans", face = "bold"))+
  theme_pubr(base_size = 20, legend="right")

#PLOT
library(cowplot)
plot_grid(p1,p2,nrow = 1)

