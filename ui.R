library(shiny)





shinyUI(fluidPage(
  titlePanel("WSP 2018 - biotechnologia"),
  sidebarLayout(
    sidebarPanel(
      p("Tutaj jest boczny panel")
    ),
    mainPanel(
      br(),
      p("Tutaj jest główny panel")
    )
  )
  
))
  