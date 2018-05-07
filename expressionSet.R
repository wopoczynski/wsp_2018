source("http://bioconductor.org/biocLite.R")#ściąga skrypt instalacyjny

setwd("C:/Users/Wojtek/source/repos/wsp_2018")

# biocLite("BiocUpgrade")#uaktualnia, istnieje również mozliwość aktualizacji
# biocLite("affy")
#working replacement for *.db lib
# biocLite("gplots")
# biocLite("convert")
# biocLite("Biobase")

library("Biobase")
library("affy")
library("hgu95av2cdf")
library("gplots")#heatmap.2
library("convert")

# clear env
rm(list = ls())

#tworzenie pełnego objektu ExpressionSet(zgodnie z instrukcją z pdf)

data <- read.table("wsp/datasetA_scans.txt", header = T, sep = "\t")
desc <- read.AnnotatedDataFrame("wsp/datasetA_scans.txt", header = T, sep = "\t", 
                                row.names = 4, stringsAsFactors = F)
sampleNames(desc) = paste(sampleNames(desc), ".CEL", sep = "")
dataAffy = ReadAffy(verbose = TRUE, filenames = sampleNames(desc))
dataAffy@cdfName = paste("ga", dataAffy@cdfName, sep = "")
dataAffy@annotation = paste("ga", dataAffy@annotation, sep = "")
RMA = rma(raw.data)
dataRMA = exprs(norm_RMA)


experiment = new("MIAME", name = "Dane mikromacierzowe", lab = "IO", 
                 title = "Dane testowe")
#abstrct = ("Przyklad", url = "http://www.bioconductor.org", other = list(notes = "inne"))
ExprSet = new("ExpressionSet", expr = dataRMA, phenoData = desc, 
              experimentData = experiment, annotation = "hgu95av2cdf")

exprSort = sort(rowMeans(exprs(ExprSet)), index.return = T)
featN = dim(ExprSet)[1]
cutoff = round(featN*0.025)
indClear = exprSort$ix[c(1:cutoff, (featN - cutoff):featN)]

ExprSet = ExprSet[-indClear,NULL]
