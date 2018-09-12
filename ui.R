library(shiny)

if(interactive()){
    shinyUI(fluidPage(
        titlePanel('WSP2018'),
        sidebarLayout(   ##cialo layout
            sidebarPanel(  ##lewa kolumna
                # titlePanel("Wybierz dane"),
                # fileInput("file", "Load file with ExpressionSet and dataAffy objects",accept = NULL, placeholder = '.Rdata') 
            ),#koniec sidebarPanel
            mainPanel(  ##prawa kolumna 
                titlePanel('Wybierz akcję:'),
                actionButton('PCA','PCA'),
                # actionButton('degradation','Degradacja RNA'),
                actionButton('heatmaps','Heatmapa'),
                actionButton('clusterHierarh','Klasteryzacja Hierarchiczna'),
                actionButton('clusterKmeans','Klasteryzacja K-means'),
                # actionButton('Vplot','Volcano Plot',class = 'disabled'),
                br(),
                # numericInput('degA','Degradation value from', 10),
                # numericInput('degB','Degradation value to', 50),
                numericInput('a','Hierarhical value a', 2),
                numericInput('b','Hierarhical value a', 20),
                numericInput('c','Hierarhical value a', 5),
                numericInput('d','Hierarhical value a', 15),
                numericInput('clust','Cluster amounts', 8),
                
                hr(),
                plotOutput('plot')
          
            )#koniec main
        
            )#koniec sidebarLayout
        
        )#koniec fluidPage
    )#koniec shiny
} 