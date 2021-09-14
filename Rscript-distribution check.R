# This script tests the distribution of response data for 2016 and 2013 datasets

library(readxl); library(dplyr); library(broom); library(pixiedust)
library(fitdistrplus); library(scales); library(car)
library(ggplot2); library(cowplot); library(ggeffects)

#2016 DATA
odors2016 = read_excel("oldnoses-orfuncdata-2016-all.xlsx", sheet = "VCF2016-long")
#CHECK DISTRIBUTION
descdist(odors2016$Response, discrete = FALSE)
odors2016.norm = fitdist(odors2016$Response, "norm")
plot(odors2016.norm)
odors2016.lnorm = fitdist(odors2016$Response, "lnorm")
plot(odors2016.lnorm)

#natural log of lognormal variables
odors2016$Response_log=log(odors2016$Response)

#Check if normal
descdist(odors2016$Response_log, discrete = FALSE)
odors2016_log_response.norm = fitdist(odors2016$Response_log, "norm")
plot(odors2016_log_response.norm)


#2013 DATA
odors2013 = read_excel("oldnoses-orfuncdata-2013-all.xlsx", sheet = "VCF2013-long")
#CHECK DISTRIBUTION
descdist(odors2013$Response, discrete = FALSE)
odors2013.norm = fitdist(odors2013$Response, "norm")
plot(odors2013.norm)
odors2013.lnorm = fitdist(odors2013$Response, "lnorm")
plot(odors2013.lnorm)

#natural log of lognormal variables
odors2013$Response_log=log(odors2013$Response)

#Check if normal
descdist(odors2013$Response_log, discrete = FALSE)
odors2013_log_response.norm = fitdist(odors2013$Response_log, "norm")
plot(odors2013_log_response.norm)
