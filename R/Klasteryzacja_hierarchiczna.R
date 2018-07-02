Klasteryzacja_hierarchiczna = function(ExprSet,a,b,c,d) {
  Klasteryzacja_h =exprs(ExprSet)
  clusters = hclust(dist(Klasteryzacja_h[a:b,c:d]))
  plot(clusters,xlab="Clusters", sub="")
}
