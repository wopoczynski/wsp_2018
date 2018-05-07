source("http://bioconductor.org/biocLite.R")#ściąga skrypt instalacyjny
setwd("C:\\Users\\Kamila\\MOJE\\BIOTECHNOLOGIA\\Wybrane Systemy Programowania\\data")

biocLite("BiocUpgrade")#uaktualnia, istnieje również mozliwość aktualizacji
biocLite("affy")
biocLite("gahgu95av2.db")
biocLite("gplots")
biocLite("convert")
biocLite("Biobase")

library("Biobase")
library("affy")
library("gahgu95av2.db")
library("gplots")#heatmap.2
library("convert")

#tworzenie pełnego objektu ExpressionSet(zgodnie z instrukcją z pdf)


data1 <- read.table("datasetA_scans.txt", header = T, sep = "\t")
opis <- read.AnnotatedDataFrame("datasetA_scans.txt", header = T, sep = "\t", 
                                row.names = 4, stringsAsFactors = F)
sampleNames(opis) = paste(sampleNames(opis), ".CEL", sep="")
data_Affy=ReadAffy(verbose=TRUE, filenames=sampleNames(opis))
data_Affy@cdfName=paste("ga", data_Affy@cdfName, sep="")
data_Affy@annotation=paste("ga", data_Affy@annotation, sep="")
RMA=rma(raw.data)
dataRMA=exprs(norm_RMA)


