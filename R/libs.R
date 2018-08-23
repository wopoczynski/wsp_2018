# required libs przy pierwszym odpalaniu odkomentowac
# source("http://bioconductor.org/biocLite.R")#ściąga skrypt instalacyjny
# biocLite("biocUpgrade")
# biocLite("affy")
# biocLite("gahgu95av2.db")#Kamila - wer 3.5 nie działa 
# biocLite("gplots")
# install.packages(paste(getwd(),"/packages/gahgu95av2.db_2.2.0.tar.gz", sep=""), repos = NULL, type="source")
# install.packages(paste(getwd(),"/packages/gahgu95av2cdf_2.2.1.tar.gz", sep=""), repos = NULL, type="source")

library("Biobase")
library('affy')
library('gplots')
library('gahgu95av2cdf')
library('gahgu95av2.db')
