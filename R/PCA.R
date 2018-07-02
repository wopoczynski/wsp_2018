PCA = function(ExprSet) {
  PCA_model = prcomp(t(exprs(ExprSet)))
  adeno = which(pData(ExprSet)$CLASS == 'ADENO')
  squamous = which(pData(ExprSet)$CLASS == 'SQUAMOUS')
  colors = ifelse(pData(ExprSet)$CLASS == 'ADENO','2','3')
  plot(PCA_model$x[,1:2],col = colors,main = 'PCA')
  legend("topright",c("Adeno", "Squamous"),col = c(2, 3), pch = c(1, 1))
  barplot(PCA_model$sdev[1:5] / sum(PCA_model$sde), main = 'PCA')
}