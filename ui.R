library(shiny)




# if(interactive()){
shinyUI(fluidPage(
    titlePanel('WSP2018'),
    mainPanel('WSP 2018'),
    fileInput("file", "Wgraj plik .CEL",accept = NULL),
    br(),
    titlePanel('Wybierz akcję:'),
    actionButton('PCA','PCA'),
    actionButton('degradation','Degradacja RNA'),
    actionButton('heatmaps','Heatmapa'),
    actionButton('clusterHierarh','Klasteryzacja Hierarchiczna'),
    actionButton('clusterKmeans','Klasteryzacja K-means'),
    actionButton('Vplot','Volcano Plot'),
    actionButton('pick','wybieranie'),
    hr(),
    plotOutput('plot')
    )
  )
# }