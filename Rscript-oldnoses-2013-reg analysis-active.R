# This script creates plots used in Supplemental Information Figure 3

library(readxl); library(dplyr)
library(car)
library(ggplot2); library(ggpubr)

den2013 = read_excel("oldnoses-orfuncdata-2013-active.xlsx", sheet = "den-2013")
den2013$Odor = factor(den2013$Odor)
den2013$OR = factor(den2013$OR)
den2013$Human_log = log(den2013$Human)
den2013$Denisova_log = log(den2013$Denisova)
alt2013 = read_excel("oldnoses-orfuncdata-2013-active.xlsx", sheet = "alt-2013")
alt2013$Odor = factor(alt2013$Odor)
alt2013$OR = factor(alt2013$OR)
alt2013$Human_log = log(alt2013$Human)
alt2013$Altai_log = log(alt2013$Altai)
ust2013 = read_excel("oldnoses-orfuncdata-2013-active.xlsx", sheet = "ust-2013")
ust2013$Odor = factor(ust2013$Odor)
ust2013$OR = factor(ust2013$OR)
ust2013$Human_log = log(ust2013$Human)
ust2013$Ust_Ishim_log = log(ust2013$Ust_Ishim)

#plot regression
p1=ggplot(alt2013, aes(x=Human_log, y=Altai_log))+
  geom_point(aes(colour = OR)) +
  geom_smooth(method="lm", se= FALSE, col="black") +
  stat_cor(aes(label = paste(..rr.label.., ..p.label.., sep = "~`,`~")),
           method = "pearson", 
           p.accuracy = 0.001, r.accuracy = 0.01,
           label.x = -3, label.y = 3.5, size = 6) +
  stat_regline_equation(label.x = -3, label.y = 2.9, size = 6) +
  labs(x = "Human Response",
       y = "Altai 2013 Response") +
  scale_color_viridis_d() +
  theme_pubr(base_size = 20,legend= "right")

#plot regression
p2=ggplot(den2013, aes(x=Human_log, y=Denisova_log))+
  geom_point(aes(colour = OR)) +
  geom_smooth(method="lm", se= FALSE, col="black") +
  stat_cor(aes(label = paste(..rr.label.., ..p.label.., sep = "~`,`~")),
           method = "pearson", 
           p.accuracy = 0.001, r.accuracy = 0.01,
           label.x = -3, label.y = 3.5, size = 6) +
  stat_regline_equation(label.x = -3, label.y = 2.9, size = 6) +
  labs(x = "Human Response",
       y = "Denisova 2013 Response") +
  scale_color_viridis_d() +
  theme_pubr(base_size = 20,legend= "right")

#plot regression
p3=ggplot(ust2013, aes(x=Human_log, y=Ust_Ishim_log))+
  geom_point(aes(color= OR)) +
  geom_smooth(method="lm", se= FALSE, col="black") +
  stat_cor(aes(label = paste(..rr.label.., ..p.label.., sep = "~`,`~")),
           method = "pearson", 
           p.accuracy = 0.001, r.accuracy = 0.01,
           label.x = -3, label.y = 3.5, size = 6) +
  stat_regline_equation(label.x = -3, label.y = 2.8, size = 6) +
  labs(x = "Human Response",
       y = "Ust Ishim 2013 Response") +
  scale_color_viridis_d() +
  theme_pubr(base_size = 20,legend= "right")

#PLOT
library(cowplot)
plot_grid(p1,p2,p3, nrow = 1)


