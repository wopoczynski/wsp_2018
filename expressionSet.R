source(paste(getwd(),"/libs.R", sep=""))

# clear env
rm(list = ls())

#tworzenie pełnego objektu ExpressionSet(zgodnie z instrukcją z pdf)

setwd(paste(getwd(),"/data", sep=""))

data <- read.table("datasetA_scans.txt", header = T, sep = "\t")
description <- read.AnnotatedDataFrame("datasetA_scans.txt", header = T, sep = "\t", 
                                row.names = 4, stringsAsFactors = F)
sampleNames(description) = paste(sampleNames(description), ".CEL", sep = "")
dataAffy = ReadAffy(verbose=TRUE, filenames=sampleNames(description))
dataAffy@cdfName = paste("ga", dataAffy@cdfName, sep = "")
dataAffy@annotation = paste("ga", dataAffy@annotation, sep = "")

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

ExprSet = ExprSet[-indClear, NULL]

