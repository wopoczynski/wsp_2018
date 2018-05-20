setwd("C:/Users/Basia/Desktop/WSP")
source("http://bioconductor.org/biocLite.R")
biocLite("BiocUpgrade")
biocLite("affy")
biocLite("gahgu95av2.db")
biocLite("gplots")
biocLite('gahgu95av2cdf')
library("Biobase")
library("affy")
library("gahgu95av2cdf")
library("gahgu95av2.db")
library("gplots")

#set repositord, install.packages

data=read.table("datasetA_scans.txt", header= TRUE, sep="\t")
opis= read.AnnotatedDataFrame("datasetA_scans.txt", header= TRUE,
                              sep="\t", row.names = 4, stringsAsFactors = F)
sampleNames(opis)= paste(sampleNames(opis),".CEL", sep="")
data_Affy= ReadAffy(filenames= sampleNames(opis), verbose= TRUE)

#cels = list.files(pattern = "CEL")
#a=cels[1:5]
#data_Affy= ReadAffy(filenames= a, verbose= TRUE)

data_Affy@cdfName=paste("ga", data_Affy@cdfName,sep="")
data_Affy@annotation=paste("ga", data_Affy@annotation,sep="")
RMA=rma(data_Affy)
dataRMA= exprs(RMA)

#tworzenie obiektu expressionSet

experiment= new("MIAME", name= "Dane mikromacierzowe", lab = "IO", 
                title = "Dane testowe")

ExprSet = new("ExpressionSet", expr = dataRMA, phenoData = opis, 
              experimentData = experiment, annotation = "gahgu95av2cdf")

# sortowanie, usuwanie 5% sond, wyznaczenie iloœci sond do usuniêcia

expr_sort = sort(rowMeans(exprs(ExprSet)), index.return = T)
feat_num = dim(ExprSet)[1]
cutoff = round(feat_num*0.025)
ind_clear = expr_sort$ix[c(1:cutoff, (feat_num - cutoff):feat_num)]

ExprSet = ExprSet[-ind_clear,]

#analiza PCA

PCA_model= prcomp(t(exprs(ExprSet)))
summary (PCA_model)
PCA_model$x
adeno= which(pData(ExprSet)$CLASS=='ADENO')
squamous= which(pData(ExprSet)$CLASS=='SQUAMOUS')
colors= ifelse(pData(ExprSet)$CLASS=='ADENO','red','blue')
plot(PCA_model$x[,1:2],col=colors,main='PCA')

barplot(PCA_model$sdev[1:5]/sum(PCA_model$sde), main='PCA')

