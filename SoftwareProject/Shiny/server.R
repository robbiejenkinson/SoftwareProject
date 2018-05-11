#install.packages("plotly")
#library(devtools)
#install.packages('rsconnect')
#install.packages('shinydashboard')
#install.packages("shiny")
#install.packages("ggplot2")
library(shinydashboard)
library(rsconnect)
library(shiny)
library(plotly)
library(ggplot2)
library(reshape2)
library(htmltools)
library(leaflet)

#SET WORKING DIRECTORY
#setwd("C:\\Users\\Robbie\\Documents\\College\\GitHub\\SoftwareProjectFinal\\SoftwareProject\\Shiny")

#----------------------------------------------
#----------------------------------------------
#All software project dataframes saved as ALLSOFTWAREPROJECTDATA.RData
#load("C:\\Users\\Robbie\\Documents\\College\\GitHub\\SoftwareProjectFinal\\SoftwareProject\\ALLSOFTWAREPROJECTDATA.Rdata")
#----------------------------------------------
#----------------------------------------------


# DATA LOADED SEPARATELY
load("./data/AirportMonths.Rdata")
flightsMap <- read.csv("./data/InwardFlightsMap.csv")
flightYear <- read.csv("./data/FlightsYears.csv")
Foreign <-read.csv("./data/ForeignAirports.csv", fileEncoding = "latin1")
ForeignCountry <-read.csv("./data/ForeignCountry.csv", fileEncoding = "latin1")
ForeignMap <-read.csv("./data/ForeignAirportsMap.csv", fileEncoding = "latin1")
time <-read.csv("./data/TimeSeries.csv")
timeSeriesExp <-read.csv("./data/TimeSeriesExp.csv")
InwardBar <- read.csv("./data/InwardBar.csv")
Reason <- read.csv("./data/reason.csv")
Length <- read.csv("./data/length.csv")
Exp <- read.csv("./data/expend.csv")
cor <- read.csv("./data/cor.csv")
tourists <- read.csv("./data/tourists.csv")


#InwardBar$year <- as.factor(InwardBar$year)
#time$year <- as.factor(time$year)


# TESTING ---------
#------------------

# total passengers barchart clean
#flightsMap <- flightsMap[flightsMap$Year<2019 | flightsMap$long != 0.0000 | flightsMap$lat != 0.0000, ]

# total per airport barchart clean
#flightYear <- flightYear[flightYear$year<2019, ]

# Month count line chart
#AirportMonths <- AirportMonths[AirportMonths$Visitors > 0, ]

# Foreign Airport dataset
#Foreign <- Foreign[which(Foreign$Numbers > 0 | Foreign$country != "Ireland"), ]

# Passengers Barchart
#InwardBar <- InwardBar[InwardBar$year<2019, ]

# Tourism cleaning
#Reason <- Reason[Reason$year<2019, ]
#Length <- Length[Length$year<2019, ]
#cor <- cor[cor$type == "business" | cor$type == "visit" | cor$type == "holiday" | cor$type == "other", ]
#Exp <- Exp[Exp$type == "business" | Exp$type == "visit" | Exp$type == "holiday" | Exp$type == "other", ]


#------------------
# END TESTING -----

shinyServer(
  function(input, output){
    
    # Airport Map
    
    # reference: https://stackoverflow.com/questions/42276220/clear-leaflet-markers-in-shiny-app-with-slider-bar
    
    subsetData1 <- reactive({
      
      flightsMap %>% filter(Year == input$choice)
      
    })
    
    
    output$value <- renderUI({
      
      sliderInput("value",label = h3("value"),
                  min = min(subsetData1()$Visitors,na.rm = TRUE),
                  max = max(subsetData1()$Visitors,na.rm=TRUE),
                  value = c(quantile(subsetData1()$Visitors,.25,na.rm = TRUE),quantile(subsetData1()$Visitors,.75,na.rm=TRUE))) 
      
    })     
    
    subsetData <- reactive({
      
      df2 <- subsetData1() %>% data.frame()
      
      df2 %>% filter(Visitors >= min(as.numeric(input$value)) & Visitors <= max(as.numeric(input$value)))
      
    })   
    
    output$Map <- renderLeaflet({
      
      leaflet(height = 1000) %>% 
        addTiles() %>% 
        fitBounds(min(flightsMap$long),min(flightsMap$lat),max(flightsMap$long),max(flightsMap$lat))
      
    })
    
    observeEvent(input$value,{
      leafletProxy("Map") %>%
        clearMarkers() %>%
        clearShapes() %>%
        addCircleMarkers(data = subsetData(),
                         lng  = ~long,
                         lat  = ~lat,
                         layerId = ~X,
                         label = ~htmlEscape(Airport),
                         radius = 8,
                         weight = 10) %>%
        fitBounds(.,min(subsetData()$lng),min(subsetData()$lat),
                  max(subsetData()$lng),max(subsetData()$lat))
      
    })
    
    observe({
      
      click<-input$Map_marker_click
      if(is.null(click))
        return()
      text<-paste("Latitude ", click$lat, "Longtitude ", click$lng)
      text2<-paste("You've selected point ", click$id)

      output$Click_text<-renderText({
        text2
      })
      
    })
    
    # NOT IN USE
    # Foreign Aiport Map
    
    output$Foreignmap <- renderLeaflet({
      color_fun <- colorNumeric('Blues', Foreign$Numbers)
      leaflet(data = Foreign) %>% addProviderTiles('OpenStreetMap.Mapnik') %>% setView(-8, 53.5, 6) %>%
        addCircleMarkers(~long, ~lat, label = ~htmlEscape(country), fillColor=color_fun(Foreign$Numbers), weight=.6, fillOpacity=20) %>% addLegend(pal = color_fun, values = Foreign$Numbers, title = "Countries", position = 'bottomleft')
    })
    
    
    # foreign airport barchart
    output$plotBarForeign3 = renderPlotly({
      plotBarForeign3 <- plot_ly(
        x = Foreign$Airport,
        y = Foreign$Numbers,
        name = "Passenger Countries",
        type = "bar"
      ) %>%
        layout(margin = list(b = 180), title = "Passengers per Airport")
    })
    
    # Foreign Bar chart
    
    output$plotBarForeign2 = renderPlotly({
      plotBarForeign2 <- plot_ly(
        x = ForeignCountry$country,
        y = ForeignCountry$numbers,
        name = "Passenger Countries",
        type = "bar"
      ) %>%
        layout(margin = list(b = 100), title = "Passengers per Country", yaxis = list(type = "log", title = "Passengers"))
    })
    
    
    
    # Foreign Bar chart
    
    output$plotBarForeign = renderPlotly({
      plotBarForeign <- plot_ly(
        x = Foreign$country,
        y = Foreign$Numbers,
        name = "Passenger Countries",
        type = "bar"
      ) %>%
        layout(margin = list(b = 120))
    })
    
   
    
    # Airport Bar chart
    
    output$plotBar = renderPlotly({
      plotBar <- plot_ly(
        x = InwardBar$year,
        y = InwardBar$visitors,
        name = "Inward Flight Numbers",
        type = "bar"
      ) %>%
        layout(margin = list(t = 100, b = 100), title = "Total Passengers",xaxis = list(title = "Year"),
                                                                         yaxis = list(title = "Passengers"))
    })
    
    # Airport Line chart
    
    output$plotLin2 = renderPlotly({
      plotLin2 <- plot_ly(flightYear, x = ~year, y = ~Cork, name = 'Cork', mode = 'lines') %>%
        add_trace(y = ~Kerry, name = 'Kerry', mode = 'lines') %>%
        add_trace(y = ~Knock, name = 'Knock', mode = 'lines') %>%
        add_trace(y = ~Cork, name = 'Cork', mode = 'lines') %>%
        add_trace(y = ~Shannon, name = 'Shannon', mode = 'lines') %>%
        add_trace(y = ~Sligo, name = 'Sligo', mode = 'lines') %>%
        add_trace(y = ~Waterford, name = 'Waterford', mode = 'lines') %>%
        add_trace(y = ~Galway, name = 'Galway', mode = 'lines') %>%
        add_trace(y = ~Dublin, name = 'Dublin', mode = 'lines') %>%
        add_trace(y = ~Donegal, name = 'Donegal', mode = 'lines')
    })
    
    output$plotLine = renderPlotly({
    plotLine <- plot_ly(flightYear, x = ~year, y = ~Dublin, name="Dublin") %>%
      add_trace(x = ~year, y = ~Shannon, name="Shannon") %>% 
      add_trace(x = ~year, y = ~Kerry, name="Kerry") %>%
      add_trace(x = ~year, y = ~Knock, name="Knock") %>%
      add_trace(x = ~year, y = ~Cork, name="Cork") %>%
      add_trace(x = ~year, y = ~Sligo, name="Sligo") %>%
      add_trace(x = ~year, y = ~Waterford, name="Waterford") %>%
      add_trace(x = ~year, y = ~Galway, name="Galway") %>%
      add_trace(x = ~year, y = ~Donegal, name="Donegal") %>%
      add_markers() %>% layout(xaxis = list(type = "log",title = "Year"),
                        yaxis = list(type = "log", title = "Passengers"),
                          margin = list(t = 100, b = 100), title = "Passengers per airport")
    })
    
    
    # BoxPlots
    
    output$plotBoxIntl = renderPlotly({
    plotBox <- plot_ly(y = flightYear$Dublin, type = "box", name ="Dublin") %>%
      add_trace(y = flightYear$Shannon, name ="Shannon")%>%
      add_trace(y = flightYear$Cork, name ="Cork")%>%
      layout(xaxis = list(title = "Airport"),
             yaxis = list(type = "log", title = "Passengers"),
             margin = list(t = 100, b = 100), title = "Intl. Airports")
    })
    
    output$plotBoxReg = renderPlotly({
      plotBox <- plot_ly(y = flightYear$Kerry, type = "box", name ="Kerry") %>%
        add_trace(y = flightYear$Sligo, name ="Sligo")%>%
        add_trace(y = flightYear$Waterford, name ="Waterford")%>%
        add_trace(y = flightYear$Galway, name ="Galway")%>%
        add_trace(y = flightYear$Donegal, name ="Donegal")%>%
        add_trace(y = flightYear$Knock, name ="Knock")%>%
        layout(xaxis = list(title = "Airport"),
               yaxis = list(type = "log", title = "Passengers"),
               margin = list(t = 100, b = 100), title = "Regional Airports")
    })
    
    # Airport Pie Chart
    
    output$plotPieChart = renderPlotly({
    plotPieChart <- plot_ly(AirportMonths, labels = ~Month, values = ~Visitors, type = 'pie') %>%
      layout(title = 'Passenger percentage months',
             xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
             yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),margin = list(t = 50, b = 50))
    })
    
    # Airport Line Plot
    
    output$plotLinePlot = renderPlotly({
      plotLinePlot <- plot_ly(AirportMonths, x = ~Month, y = ~Visitors, type = 'scatter', mode = 'lines') %>%
        layout(title = 'Passengers by month',margin = list(b = 160, t = 50), xaxis = list(tickangle = 90))
      
    })
    
    # Time Series Line Plot
    
    output$plotLinePlotTime = renderPlotly({
      plotLinePlotTime <- plot_ly(time, x = ~year, y = ~total, type = 'scatter', mode = 'lines') %>%
        layout(title = 'Passenger Time Series Prediction',margin = list(b = 160, t = 50), xaxis = list(tickangle = 90))
      
    })
    
    # Tourist Map
    
    output$Accomodationmap2 <- renderLeaflet({
      color_fun <- colorNumeric('Blues', ForeignMap$total)
      leaflet(data = ForeignMap) %>% addProviderTiles('OpenStreetMap.Mapnik') %>% setView(-8, 53.5, 6) %>%
        addCircleMarkers(~long, ~lat, label = ~htmlEscape(country), fillColor=color_fun(ForeignMap$total), weight=.6, fillOpacity=20) %>% addLegend(pal = color_fun, values = ForeignMap$total, title = "Countries", position = 'bottomleft')
    })
    
    output$plotPieChartForeign = renderPlotly({
      plotPieChartForeign <- plot_ly(ForeignMap, labels = ~cont, values = ~total, type = 'pie') %>%
        layout(title = 'Passenger Percentage by Continent',
               xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
               yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),margin = list(t = 50, b = 150))
    })
    
    output$plotPieChartForeign2 = renderPlotly({
      plotPieChartForeign2 <- plot_ly(ForeignMap, labels = ~country, values = ~total, type = 'pie') %>%
        layout(title = 'Passenger percentage by Country',
               xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
               yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),margin = list(t = 50, b = 150))
    })
    
    # Reasons
    
    output$plotLineReason = renderPlotly({
      plotLineReason <- plot_ly(Reason, x = ~year, y = ~business, type = 'bar', name = 'Business') %>%
        add_trace(y = ~visit, name = 'Visit') %>%
        add_trace(y = ~holiday, name = 'Holiday') %>%
        add_trace(y = ~other, name = 'Other') %>%
        layout(yaxis = list(title = "Visitors ('000)"), barmode = 'group', title = "Reasons for people visiting Ireland")
    })
    
    output$plotLineCountry = renderPlotly({
      plotLineCountry <- plot_ly(tourists, x = ~country, y = ~tourists, type = 'bar', name = 'Tourists') %>%
        add_trace(y = ~exp, name = 'Expenditure') %>%
        layout(yaxis = list(title = "Visitors ('000) & Expenditure (mil)"), barmode = 'group', title = "Nationality & Expenditure ")
    })
    
    # Length of stay
    
    output$plotLength = renderPlotly({
      plotLength <- plot_ly(Length, x = ~year, y = ~business, name = 'business', mode = 'lines') %>%
        add_trace(y = ~visit, name = 'visit', mode = 'lines') %>%
        add_trace(y = ~holiday, name = 'Holiday', mode = 'lines') %>%
        add_trace(y = ~other, name = 'Other', mode = 'lines') %>%
        add_trace(y = ~business, name = 'business', mode = 'lines') %>%
        layout(xaxis = list(title = "Year"),
               yaxis = list(type = "log" ,title = "Nights spent"), title = "Average time spent (Nights)",margin = list(t = 50, b = 100))
    })
    
    # Time Series Line Plot
    
    output$plotLineExp = renderPlotly({
      plotLineExp <- plot_ly(timeSeriesExp, x = ~year, y = ~exp, type = 'scatter', mode = 'lines') %>%
        layout(yaxis = list(title = "Expenditure (euro, mil)"),title = 'Tourist Expenditure Time Series Prediction',margin = list(b = 100, t = 50), xaxis = list(tickangle = 90))
      
    })
    
    output$plotPieExpend = renderPlotly({
      plotPieExpend <- plot_ly(Exp, labels = ~type, values = ~amount, type = 'pie') %>%
        layout(title = 'Expenditure of visitors (euro, mil)',
               xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
               yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),margin = list(t = 50, b = 100))
    })
    
    output$plotCor = renderPlotly({
    plotCor <- plot_ly(data = cor, x = ~visitors, y = ~amount, color = ~type) %>%
      layout(xaxis = list(title = "Visitors ('000)"),
             yaxis = list(title = "Money Spent (euro, mil)"), title = "Correlation between amount of visitors and money spent",margin = list(b = 100))
    })
    
   
    
  }
  
  
)

