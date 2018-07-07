Klasteryzacja_kmeans = function(ExprSet,ilosc_klastrow) {
  biocLite("Ckmeans.1d.dp")
  library("Ckmeans.1d.dp")
  Value_expression =exprs(ExprSet)
  colnames(Value_expression)= NULL
  rownames(Value_expression)= NULL
  clusters = kmeans(Value_expression,ilosc_klastrow)
  plot(Value_expression, col = clusters$cluster,xlab="Index", ylab="Value_expression", pch=clusters$cluster, sub=paste("Number of clusters given:", ilosc_klastrow))
  points(clusters$centers, col = "saddlebrown", pch = 8, cex = 2)
  legend("bottomright", paste("Cluster", 1:ilosc_klastrow), col=1:ilosc_klastrow, pch=1:ilosc_klastrow, cex=0.8, bty="n")
  result = Ckmeans.1d.dp(Value_expression, ilosc_klastrow)
  plot(result, sub="")
}