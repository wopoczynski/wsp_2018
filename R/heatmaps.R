#argumentem do funkcji jest zmienna typu "data" powstała po użyciu funkji exprs na danych po normalizacji:
#normRMA = rma(dataAffy)
#dataRMA = exprs(normRMA)

#przykładowe użyciena podstawie zmiennych z expressionSet.R: heatmaps(dataRMA)
heatmaps <- function(heatmap_data){
    heatmap_data = exprs(ExprSet)
    heatmap(heatmap_data, Colv=NA, Rowv=NA, scale="column", cexRow = 0.1, cexCol = 1)
}