# Title     : TODO
# Objective : TODO
# Created by: Wojtek
# Created on: 07.05.2018

source("http://bioconductor.org/biocLite.R");

biocLite(c("Biobase","affy","gahgu95av2.db","gplots","convert"));

library("Biobase")
library("affy")
library("gahgu95av2.db")
library("gplots")#heatmap.2
library("convert")

library("biobase");

setwd("D:/Google drive/studia/II stopień/WSP/lab1/wsp");

cels = list.files(pattern = "CEL")
fileList=cels[1:5]
raw.data=ReadAffy(verbose=TRUE, filenames=fileList)
normMAS=rma(raw.data)
dane=exprs(norm_mas)


exprs <- as.matrix(read.table(exprsFile, header = TRUE, sep="\t"))

