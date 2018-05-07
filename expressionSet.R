source("http://bioconductor.org/biocLite.R")#ściąga skrypt instalacyjny

setwd(paste(getwd(),"/data", sep=""))

biocLite("BiocUpgrade")#uaktualnia, istnieje również mozliwość aktualizacji
biocLite("affy")
biocLite("hgu95av2cdf") #working replacement for *.db lib
biocLite("gplots")
biocLite("convert")
biocLite("Biobase")
biocLite("gahgu95av2cdf")

library("Biobase")
library("affy")
library("hgu95av2cdf")
library('gahgu95av2cdf')
library("gplots") #heatmap.2
library("convert")

# clear env
rm(list = ls())

#tworzenie pełnego objektu ExpressionSet(zgodnie z instrukcją z pdf)

data <- read.table("datasetA_scans.txt", header = T, sep = "\t")
description <- read.AnnotatedDataFrame("datasetA_scans.txt", header = T, sep = "\t", 
                                row.names = 4, stringsAsFactors = F)
sampleNames(description) = paste(sampleNames(description), ".CEL", sep = "")
dataAffy = ReadAffy(verbose=TRUE, filenames=sampleNames(description))
dataAffy@cdfName = paste("ga", dataAffy@cdfName, sep = "")
dataAffy@annotation = paste("ga", dataAffy@annotation, sep = "")

# nie działa funkcja rma znaleźć alternatywe
normRMA = rma(dataAffy)
dataRMA = exprs(normRMA)


experiment = new("MIAME", name = "Dane mikromacierzowe", lab = "IO", 
                 title = "Dane testowe")
#abstrct = ("Przyklad", url = "http://www.bioconductor.org", other = list(notes = "inne"))
ExprSet = new("ExpressionSet", expr = dataRMA, phenoData = description, 
              experimentData = experiment, annotation = "hgu95av2cdf")

exprSort = sort(rowMeans(exprs(ExprSet)), index.return = T)
featN = dim(ExprSet)[1]
cutoff = round(featN*0.025)
indClear = exprSort$ix[c(1:cutoff, (featN - cutoff):featN)]

ExprSet = ExprSet[-indClear,]
