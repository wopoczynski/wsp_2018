library(shiny)
library(zip)
library(png)
library(shinyjs)




shinyUI(fluidPage(
  
  tagList(
    useShinyjs(),
    navbarPage(title="Projekt", id="navbar",
               tabPanel("About",value="tab1",
                        tags$h4("About this application"),
                        tags$hr(),
                        fluidRow(
                          column(8,#style="border: 1px solid silver;",
                                 tags$p(tags$strong(("Application description"))),
                                 tags$p("The goal of this application is to provide a quick and simple way to analyze spectroscopic data obtained from Raman spectroscopy experiments."),
                                 tags$p("The main functions of the application are:"),
                                 img(src='file_contents.png'),
                                 tags$hr()
                          ),
                          column(4,align="center",
                                 tags$p("Download sample data"),
                                 downloadButton("structure","Download"))      
                        ),
                        fluidRow(
                          column(6, align="center", offset = 3,
                                 tags$h4("Click here to start"),
                                 actionButton("startApp",label = "Begin")
                          )
                        )
               ),
               tabPanel("Data Input", value="tab2",
                        sidebarLayout(
                          sidebarPanel(
                            tags$hr(),
                            fileInput("file1",
                                      "Load data",
                                      accept=c('.zip')),
                            tags$hr(),
                            uiOutput('spcRange'),
                            uiOutput('numeric_show'),
                            fluidRow(
                              column(5,uiOutput('spcRangeMin')),
                              column(5,uiOutput('spcRangeMax'))
                            ),
                            uiOutput('help'),
                            uiOutput('cutRange')
                          ),
                          mainPanel(
                            uiOutput("ui_orgPlot_info"),
                            uiOutput("ui_orgPlot"),
                            uiOutput("ui_spcPlot_info"),
                            uiOutput("ui_spcPlot")
                            
                            
                          )
                        )),
               tabPanel('Preprocessing', value="tab3",
                        sidebarLayout(
                          sidebarPanel(
                            tags$hr(),
                            tags$h4('Analysis tool 1'),
                            tags$br()
                            
                          ),
                          mainPanel(
                            uiOutput('uiPlotMod'),
                            uiOutput('uiGgplot'),
                            uiOutput('dendro')
                          )
                        )),
               tabPanel(value="tab7",div(id="download_id", style = "position:absolute;left:0%; top:0;",downloadButton('raport', 'Download report',style='padding:14px;')))
               
               
    ))))