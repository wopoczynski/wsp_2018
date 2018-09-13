library(shiny)

if(interactive()){
    shinyUI(fluidPage(
        titlePanel('WSP2018'),
        sidebarLayout(   ##cialo layout
            sidebarPanel(  ##lewa kolumna
               titlePanel("Parameters for functions"),
                # fileInput("file", "Load file with ExpressionSet and dataAffy objects",accept = NULL, placeholder = '.Rdata') 
              numericInput('a','Hierarhical value a', 2),
              numericInput('b','Hierarhical value b', 20),
              numericInput('c','Hierarhical value c', 5),
              numericInput('d','Hierarhical value d', 15),
              hr(),
              numericInput('clust','Cluster amounts', 8)
            ),#koniec sidebarPanel
            mainPanel(  ##prawa kolumna 
                titlePanel('Choose function:'),
                actionButton('PCA','PCA'),
                # actionButton('degradation','Degradacja RNA'),
                actionButton('heatmaps','Heatmap'),
                actionButton('clusterHierarh','Klasteryzacja Hierarchiczna'),
                actionButton('clusterKmeans','Klasteryzacja K-means'),
                # actionButton('Vplot','Volcano Plot',class = 'disabled'),
                br(),
                
                hr(),
                plotOutput('plot')
          
            )#koniec main
        
            )#koniec sidebarLayout
        
        )#koniec fluidPage
    )#koniec shiny
} 