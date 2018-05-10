#install.packages("shiny")
library(reshape2)
library(shiny)
library(htmltools)
library(leaflet)
library(plotly)

shinyUI(navbarPage("Irish Tourism Trends",
                    tabPanel("Home",
                             h1("Welcome to Irish Tourism Trends", align = "center"),
                             br(),
                             p(h3("This is a data analytics platform which addresses:",align = "center")),
                             br(),
                             p(h5("- The impact of the recession on passenger intake.",align = "center")),
                             p(h5("- The impact of the recession on each individual airport.",align = "center")),
                             p(h5("- Which Irish airports are most popular.",align = "center")),
                             p(h5("- Which country brings the most amount of passengers to Ireland.",align = "center")),
                             p(h5("- What airports bring the most people to Ireland.",align = "center")),
                             p(h5("- The busiest month for people to come to Ireland.",align = "center")),
                             p(h5("- The predicition of future passengers to Ireland.",align = "center")),
                             p(h5("- Why people are coming to Ireland an how much they're spending.",align = "center")),
                             br(),
                            br(),
                            br(),
                            br(),
                            br(),
                            br(),
                            br(),
                            br(),
                            br(),
                            br(),
                            
                            column(12,
                                   h6("Created by Robbie Jenkinson - National College of Ireland 2018 - Data: Central Statistics Office - license : https://creativecommons.org/licenses/by/4.0/"))
                             
                      
                    ),
                           
                           tabPanel("Flights",
                                    fluidPage(
                                    fluidRow(
                                    column(4,
                                          selectInput("choice","Group:",choices = c(2007,2008,2009,2010,2011,2012,2013,2014,2015,2016), selected = 2007),
                                          uiOutput("value"),
                                          verbatimTextOutput("Click_text")
                                        ),
                                    column(8,
                                          leafletOutput("Map")
                                        ),
                                    
                                    column(6,
                                            plotlyOutput("plotBar")
                                            ),
                                    column(6,
                                           plotlyOutput("plotLine")
                                           ),
                                    
                                    column(6,
                                           plotlyOutput("plotPieChart")
                                    ),
                                    column(6,
                                           plotlyOutput("plotLinePlot")
                                    ),
                                    column(12,
                                           plotlyOutput("plotLinePlotTime")
                                    ),
                                    
                                    column(12,
                                           plotlyOutput("plotBarForeign2")
                                    ),
                                    column(12,
                                           plotlyOutput("plotBarForeign3")),
                                    
                                    column(6,
                                           plotlyOutput("plotPieChartForeign")),
                                    
                                    column(6,
                                           plotlyOutput("plotPieChartForeign2")),
                                    
                                    
                                    column(12,
                                           h6("Created by Robbie Jenkinson - National College of Ireland 2018 - Data: Central Statistics Office - license : https://creativecommons.org/licenses/by/4.0/"))
                                    )
                           )
),
tabPanel("Visitors",
         fluidPage(
           fluidRow(
             column(12,
                    plotlyOutput("plotLineReason")),
             column(12,
                    plotlyOutput("plotLineCountry")),
             column(6,
                    plotlyOutput("plotLineExp")),
             column(6,
                    plotlyOutput("plotPieExpend")),
             column(12,
                    plotlyOutput("plotCor"))
           ),
           column(12,
                  h6("Created by Robbie Jenkinson - National College of Ireland 2018 - Data: Central Statistics Office - license : https://creativecommons.org/licenses/by/4.0/"))
         )
         )
             
)
)     



                                    
                                  


