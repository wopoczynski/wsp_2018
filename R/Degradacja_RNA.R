Degradacja_RNA = function(dataAffy, a, b) {
  
  deg=AffyRNAdeg(dataAffy[a:b],log.it=TRUE)
  plotAffyRNAdeg(deg)
  
}