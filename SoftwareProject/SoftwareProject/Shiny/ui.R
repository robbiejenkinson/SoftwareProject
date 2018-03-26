#install.packages("shiny")
library(reshape2)
library(shiny)
library(htmltools)
library(leaflet)


AccMap <- read.csv("C:\\Users\\Robbie\\Documents\\College\\GitHub\\SoftwareProjectExcel\\ProjectData\\Collected\\IrishAccomodationMap.csv")
tourism <- read.csv("C:\\Users\\Robbie\\Documents\\College\\GitHub\\SoftwareProjectExcel\\ProjectData\\Collected\\IrishAccomodation.csv")
Act <- read.csv("C:\\Users\\Robbie\\Documents\\College\\GitHub\\SoftwareProjectExcel\\ProjectData\\Collected\\IrishActivities.csv")
ActMap <- read.csv("C:\\Users\\Robbie\\Documents\\College\\GitHub\\SoftwareProjectExcel\\ProjectData\\Collected\\IrishActivitiesMap.csv")
flightsMap <- read.csv("C:\\Users\\Robbie\\Documents\\College\\GitHub\\SoftwareProjectExcel\\ProjectData\\inwardflightsMap.csv")
flightYear <- read.csv("C:\\Users\\Robbie\\Documents\\College\\GitHub\\SoftwareProjectExcel\\ProjectData\\flightsyears.csv")


shinyUI(navbarPage("Irish Tourism Trends",
                           tabPanel("Accomodation & Activities",
                                    fluidPage(
                                    fluidRow(
                                      column(6,
                                             leafletOutput("Accomodationmap")),
                                      column(6,
                                             leafletOutput("Activitiesmap")),
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
                                    )
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
                                    column(6,
                                            plotlyOutput("plotBar")
                                            ),
                                    column(6,
                                           plotlyOutput("plotLine")
                                           )
                                    )
                           )
)
)
)                          


                                    
                                  


