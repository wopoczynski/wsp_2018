# required libs
source("http://bioconductor.org/biocLite.R")#ściąga skrypt instalacyjny

biocLite("biocUpgrade")
biocLite("affy")
biocLite("gahgu95av2.db")
biocLite("gplots")
biocLite("gahgu95av2cdf")

library("Biobase")
library("affy")
library("gahgu95av2.db")
library("gplots")
library("gahgu95av2cdf")
