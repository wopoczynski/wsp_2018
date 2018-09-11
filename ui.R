library(shiny)




# if(interactive()){
shinyUI(fluidPage(
    titlePanel('WSP2018'),
    
    sidebarLayout(   ##cialo layout
    
    sidebarPanel(  ##lewa kolumna
        titlePanel("Wybierz dane"),
        fileInput("file", "Wgraj plik .CEL",accept = NULL) 
    )#koniec sidebarPanel
    ,
    
    mainPanel(  ##prawa kolumna 
      titlePanel('Wybierz akcję:'),
      actionButton('PCA','PCA'),
      actionButton('degradation','Degradacja RNA'),
      actionButton('heatmaps','Heatmapa'),
      actionButton('clusterHierarh','Klasteryzacja Hierarchiczna'),
      actionButton('clusterKmeans','Klasteryzacja K-means'),
      actionButton('Vplot','Volcano Plot'),
      actionButton('pick','wybieranie'),
    hr(),
      dataTableOutput('dataframe')
      
    )#koniec main
    
    )#koniec sidebarLayout

    )#koniec fluidPage
  )#koniec shiny
 #} 