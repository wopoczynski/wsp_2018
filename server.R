library(shiny)
load('data.RData')

shinyServer(function(input, output, session) {
    
    source(paste(getwd(),"/R/libs.R", sep=""))
    source(paste(getwd(),"/R/Degradacja_RNA.R", sep=""))
    source(paste(getwd(),"/R/PCA.R", sep=""))
    source(paste(getwd(),"/R/Vplot.R", sep=""))
    source(paste(getwd(),"/R/heatmaps.R", sep=""))
    source(paste(getwd(),"/R/Klasteryzacja_hierarchiczna.R", sep=""))
    source(paste(getwd(),"/R/Klasteryzacja_kmeans.R", sep=""))

    options(shiny.maxRequestSize=500*1024^2)  
    
    dataframe<-reactive({
        validate(
            need(input$file != '', 'Please Load file with ExpressionSet')
        )
        
        load(input$file$datapath, envir = .GlobalEnv)
    })

    # jeśli jest obiekt expression set utworzony to odbieramy eventy i w zaleznosci od wybranej opcji uzywamy funkcji
    observeEvent(input$PCA,{
        output$plot <- renderPlot({
            PCA(ExpressionSet)
        })
    })
    
    
    observeEvent(input$degradation,{
        output$plot <- renderPlot({
            Degradacja_RNA(dataAffy, input$degA, input$degB)
        })
    })

    observeEvent(input$heatmaps,{
        output$plot <- renderPlot({
            heatmaps(ExpressionSet)
        })
    })
    
    observeEvent(input$clusterHierarh,{
        output$plot <- renderPlot({
            Klasteryzacja_hierarchiczna(ExpressionSet, input$a, input$b, input$c, input$d)
        })
    })
    
    # todo
    observeEvent(input$clusterKmeans,{
        output$plot <- renderPlot({
            Klasteryzacja_kmeans(ExpressionSet, input$clust)
        })
    })
    # todo
    observeEvent(input$Vplot,{
        output$plot <- renderPlot({
            Vplot(ExpressionSet, 2, 0.05)
        })
    })

})
