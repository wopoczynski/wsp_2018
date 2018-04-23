library(shiny)
library(zip)
library(png)


shinyServer(function(input, output,session) {
  setwd('D:/Users/sstudent/Documents/R/rstudio_test')
  #source(paste(getwd(),'R','functions.r',sep='/'))
  
  user_id=sample(1000000:9999999,1)
  
  #ukrycie zakladek po uruchomieniu aplikacji
  hide(selector = "#navbar li a[data-value=tab3]")

  
  
  #otwarcie zakladki "Data Input" po nacisnięciu przycisku "Begin"
  observeEvent(input$startApp, {
    updateTabsetPanel(session, "navbar",
                      selected = "tab2")
  })
  
  #pobranie przykladowych danych z aplikacji
  output$structure <- downloadHandler(
    filename = function() {
      paste("Data", ".zip", sep="")
    },
    
    content = function(file) {
      file.copy("./www/Data.zip", file)
    },
    contentType = "application/zip"
  )
  

  

  
  
  #utworzenie kontrolek na panelu bocznym po wczytaniu danych
  
  observeEvent(input$file1,{
    req(input$file1)
  })

  
  

  #usuniecie wczytanych danych i zapisanych wynikow po wylaczeniu aplikacji
  session$onSessionEnded(function() { 
    unlink(paste(getwd(),'data',user_id,sep='/'), recursive = TRUE)
    
    if (file.exists('results.tgz')) file.remove('results.tgz')
    
    unlink(paste(getwd(),'results',user_id,sep='/'), recursive = TRUE)
  })
  
  
})