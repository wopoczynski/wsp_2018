Vplot <- function(obiekt,fold_V,pval_V){
  #Volcano plot
  with(obiekt, plot(Fold, -log10(PVal), pch=20, main="Volcano plot", xlim=c(-max(obiekt$Fold)+1,max(obiekt$Fold)+1)
                    ,xlab='log2 FoldChange'))
  with(subset(obiekt, PVal<pval_V ), points(Fold, -log10(PVal), pch=20, col="red"))
  with(subset(obiekt, abs(Fold)>fold_V), points(Fold, -log10(PVal), pch=20, col="orange"))
  with(subset(obiekt, PVal<pval_V & abs(Fold)>fold_V), points(Fold, -log10(PVal), pch=20, col="green"))
  with(subset(obiekt, PVal<pval_V & abs(Fold)>fold_V), textxy(Fold, -log10(PVal), labs=Symbol, cex=.8))
  abline(h=-log10(pval_V),v=c(-fold_V,fold_V), lty=2)
}