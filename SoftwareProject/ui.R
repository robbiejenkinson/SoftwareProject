library(shiny); library(rCharts); library(leaflet)
shinyUI(pageWithSidebar( 
  headerPanel("Storm tracks"),  
  sidebarPanel(h3("My subtitle"), uiOutput("Controls")),  
  mainPanel(      
    tabsetPanel(        
      tabPanel("map", h3(textOutput("add")),
               tags$style(".leaflet {height: 400px;}"), 
               showOutput("myChart", "leaflet")))
  )
))