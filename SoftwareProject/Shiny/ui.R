#install.packages("shiny")
library(reshape2)
library(shiny)
library(htmltools)
library(leaflet)
library(plotly)

shinyUI(navbarPage("Irish Tourism Trends",
                           tabPanel("Accomodation & Activities",
                                    fluidPage(
                                    fluidRow(
                                      column(6,
                                             leafletOutput("Accomodationmap")),
                                      column(6,
                                             leafletOutput("Activitiesmap")),
                                      column(6,
                                             h4("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).")),
                                      column(6,
                                             h4("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).")),
                                      
                                      column(6,
                                        plotlyOutput("Test2"),
                                        selectInput("select", "Select", label = h1("Selection Pane"),choices = list(hotel = "hotel", rentals = "rentals", BB = "BB"))
                                      ),
                                      column(6,
                                        plotlyOutput("Test3"),
                                        selectInput("select2", "Select", label = h1("Selection Pane"),choices = list(sights = "sights", museums = "museums", foodDrink = "foodDrink", nightlife = "nightlife", nature = "nature", outdoorAct = "outdoorAct", shopping = "shopping"))
                                      )
                                    ,
                                    column(6,
                                           h4("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).")),
                                    column(6,
                                           h4("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).")),
                                    column(8,
                                    plotOutput('Test4'),
                                    
                                    selectInput("var",
                                                label = "Choose Accomodation",
                                                choices = c("rentals"=8, "BB"=6,
                                                            "specLodge"=7),
                                                selected = 8),
                                    
                                    selectInput("var2",
                                                label = "Choose Activity",
                                                choices = c("sights"=4, "museums"=5,
                                                            "nightlife"=7, "Outdoor Act."=9),
                                                selected = 4)
                                    ),
                                    column(4,
                                           plotOutput("plot1",
                                                      click = "plot_click",
                                                      dblclick = "plot_dblclick",
                                                      hover = "plot_hover",
                                                      brush = "plot_brush"
                                           ),
                                           verbatimTextOutput("info")
                                    ),
                                    column(6,
                                           h4("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).")),
                                    column(6,
                                           h4("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).")),
                                    
                                    column(6,
                                           plotlyOutput("plotPieChart2")
                                    ),
                                    column(6,
                                           plotlyOutput("plotBarChart2")
                                    ),
                                    column(12,
                                           h6("Created by Robbie Jenkinson - National College of Ireland 2018"))
                                    )
                                    )
                                  
                           ),
                           tabPanel("Transport",
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
                                    column(12,
                                           h4("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).")),
                                    
                                    column(6,
                                            plotlyOutput("plotBar")
                                            ),
                                    column(6,
                                           plotlyOutput("plotLine")
                                           ),
                                    column(6,
                                           h4("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).")),
                                    column(6,
                                           h4("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).")),
                                    
                                    column(6,
                                           plotlyOutput("plotPieChart")
                                    ),
                                    column(6,
                                           plotlyOutput("plotLinePlot")
                                    ),
                                    column(6,
                                           h4("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).")),
                                    column(6,
                                           h4("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).")),
                                    
                                    column(12,
                                           h6("Created by Robbie Jenkinson - National College of Ireland 2018"))
                                    )
                           )
)
)
)                          


                                    
                                  


