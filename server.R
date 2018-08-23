library(shiny)
source(paste(getwd(),"/R/libs.R", sep=""))
source(paste(getwd(),"/R/Degradacja_RNA.R", sep=""))
source(paste(getwd(),"/R/PCA.R", sep=""))
source(paste(getwd(),"/R/Vplot.R", sep=""))
source(paste(getwd(),"/R/heatmaps.R", sep=""))
source(paste(getwd(),"/R/Klasteryzacja_hierarchiczna.R", sep=""))
source(paste(getwd(),"/R/Klasteryzacja_kmeans.R", sep=""))
source(paste(getwd(),"/R/Klasteryzacja_kmeans.R", sep=""))


shinyServer(function(input, output) {

    options(shiny.maxRequestSize=15*1024^2)  
    
    dataframe<-reactive({
        validate(
            need(input$file != '', 'Please Load CEL file')
        )
        # po wczytaniu pliku powinno tutaj utworzyc obiekt expression set        
        data <- read.table(input$file, header = T, sep = "\t")
        description <- read.AnnotatedDataFrame(input$file, header = T, sep = "\t",
                                               row.names = 4, stringsAsFactors = F)
        sampleNames(description) = paste(sampleNames(description), ".CEL", sep = "")
        dataAffy = ReadAffy(verbose=TRUE, filenames=sampleNames(description))
        dataAffy@cdfName = paste("ga", dataAffy@cdfName, sep = "")
        dataAffy@annotation = paste("ga", dataAffy@annotation, sep = "")

        normRMA = rma(dataAffy)
        dataRMA = exprs(normRMA)
        ExprSet = new("ExpressionSet", expr = dataRMA, phenoData = description,
                      experimentData = experiment, annotation = "hgu95av2cdf")
        exprSort = sort(rowMeans(exprs(ExprSet)), index.return = T)
        featN = dim(ExprSet)[1]
        cutoff = round(featN*0.025)
        indClear = exprSort$ix[c(1:cutoff, (featN - cutoff):featN)]
        ExprSet = ExprSet[-indClear, ]
        return(ExprSet)
    })

    # jeśli jest obiekt expression set utworzony to odbieramy eventy i w zaleznosci od wybranej opcji uzywamy funkcji
        observeEvent(input$PCA,{
            PCA(dataframe())
        })
})
