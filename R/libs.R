# required libs
source("http://bioconductor.org/biocLite.R")#ściąga skrypt instalacyjny

source("https://bioconductor.org/biocLite.R")
biocLite()

source(paste(getwd(),"/packages", sep=""))

install.packages(paste(getwd(),"/packages/gahgu95av2.db_2.2.0.tar.gz", repos = NULL, type="source"))
install.packages(paste(getwd(),"/packages/gahgu95av2cdf_2.2.1.tar.gz", repos = NULL, type="source"))


library("Biobase")
library('affy')
library('ggplot2')
library('gahgu95av2cdf')
library('gahgu95av2.db')
