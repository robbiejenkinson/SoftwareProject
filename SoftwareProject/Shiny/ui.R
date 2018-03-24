#install.packages("shiny")
library(shiny)
library(htmltools)
library(leaflet)


Acc <- read.csv("C:\\Users\\Robbie\\Documents\\College\\GitHub\\SoftwareProjectExcel\\ProjectData\\Collected\\IrishAccomodationMap.csv")
tourism <- read.csv("C:\\Users\\Robbie\\Documents\\College\\GitHub\\SoftwareProjectExcel\\ProjectData\\Collected\\IrishAccomodation.csv")
Act <- read.csv("C:\\Users\\Robbie\\Documents\\College\\GitHub\\SoftwareProjectExcel\\ProjectData\\Collected\\IrishActivities.csv")


shinyUI(navbarPage("Irish Tourism Trends",
                           tabPanel("Accomodation & Activities",
                                    fluidRow(
                                      column(12,
                                             leafletOutput("map")),
                                      column(6,
                                        plotlyOutput("Test2"),
                                        selectInput("select", "Select", label = h1("Selection Pane"),choices = list(hotel = "hotel", rentals = "rentals", BB = "BB"))
                                      ),
                                      column(6,
                                        plotlyOutput("Test3"),
                                        selectInput("select2", "Select", label = h1("Selection Pane"),choices = list(sights = "sights", museums = "museums", foodDrink = "foodDrink", nightlife = "nightlife", nature = "nature", outdoorAct = "outdoorAct", shopping = "shopping"))
                                      )
                                    ),
                                    column(6,
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
                                    column(6,
                                           plotOutput("plot1",
                                                      click = "plot_click",
                                                      dblclick = "plot_dblclick",
                                                      hover = "plot_hover",
                                                      brush = "plot_brush"
                                           ),
                                           verbatimTextOutput("info")
                                    ),
                                    
                                    tags$p(),
                                    tags$p()
                                  
                           ),
                           tabPanel("Transport")
        )
        )
