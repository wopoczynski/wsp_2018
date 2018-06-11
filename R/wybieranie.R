wybieranie <- function(obiekt,klasa1,klasa2){
  ekspresje = exprs(obiekt)
  wybrana1= which(pData(obiekt)$CLASS == klasa1)
  wybrana2 = which(pData(obiekt)$CLASS == klasa2)
  sr_wybrana1= as.matrix(rowMeans(ekspresje[,wybrana1]))
  sr_wybrana2 = as.matrix(rowMeans(ekspresje[,wybrana2]))
  macierz = cbind(sr_wybrana1,sr_wybrana2)
  fold_change= sr_wybrana1-sr_wybrana2
  pval=(apply(ekspresje,1,function(x)t.test(x[wybrana1],x[wybrana2])$p.val))
  symbol_genu=unlist(mget(featureNames(ExprSet),env=gahgu95av2SYMBOL))
  tabela = array(dim=c(dim(ekspresje)[1],3))
  tabela[,1]=symbol_genu
  tabela[,2]=pval
  tabela[,3]= fold_change
  colnames(tabela)=c('Symbol','PVal','Fold')
  return(tabela)
}
