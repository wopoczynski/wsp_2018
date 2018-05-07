source("http://bioconductor.org/biocLite.R")#ściąga skrypt instalacyjny
setwd("C:\\Users\\Kamila\\MOJE\\BIOTECHNOLOGIA\\Wybrane Systemy Programowania\\data")

biocLite("BiocUpgrade")#uaktualnia, istnieje również mozliwość aktualizacji
biocLite("affy")
biocLite("hgu95av2cdf") #working replacement for *.db lib
biocLite("gplots")
biocLite("convert")
biocLite("Biobase")

library("Biobase")
library("affy")
library("hgu95av2cdf")
library("gplots")#heatmap.2
library("convert")

# clear env
rm(list = ls())

#tworzenie pełnego objektu ExpressionSet(zgodnie z instrukcją z pdf)


data <- read.table("datasetA_scans.txt", header = T, sep = "\t")
desc <- read.AnnotatedDataFrame("datasetA_scans.txt", header = T, sep = "\t", 
                                row.names = 4, stringsAsFactors = F)
sampleNames(desc) = paste(sampleNames(desc), ".CEL", sep = "")
data_Affy = ReadAffy(verbose = TRUE, filenames = sampleNames(desc))
data_Affy@cdfName = paste("ga", data_Affy@cdfName, sep = "")
data_Affy@annotation = paste("ga", data_Affy@annotation, sep = "")
RMA = rma(raw.data)
dataRMA = exprs(norm_RMA)


