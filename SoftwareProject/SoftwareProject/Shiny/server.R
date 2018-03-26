#install.packages("plotly")
library(shiny)
library(plotly)

shinyServer(
  function(input, output){
    
    # Accomodation MAP OUTPUT
    
    output$Accomodationmap <- renderLeaflet({
      color_fun <- colorNumeric('Blues', AccMap$accCount)
      leaflet(data = AccMap) %>% addProviderTiles('OpenStreetMap.Mapnik') %>% setView(-8, 53.5, 6) %>%
        addCircleMarkers(~long, ~lat, label = ~htmlEscape(county), fillColor=color_fun(AccMap$accCount), weight=.6, fillOpacity=20) %>% addLegend(pal = color_fun, values = AccMap$accCount, title = "Accomodation", position = 'bottomleft')
    })
    
    # Activites MAP OUTPUT
    
    output$Activitiesmap <- renderLeaflet({
      color_fun <- colorNumeric('Reds', ActMap$actCount)
      leaflet(data = ActMap) %>% addProviderTiles('OpenStreetMap.Mapnik') %>% setView(-8, 53.5, 6) %>%
        addCircleMarkers(~long, ~lat, label = ~htmlEscape(county), fillColor=color_fun(ActMap$actCount), weight=.6, fillOpacity=20) %>% addLegend(pal = color_fun, values = ActMap$actCount, title = "Activities", position = 'bottomleft')
    })
    
    # ACCOMODATION BARPLOT 
    
    output$Test2 <- renderPlotly({
      Test2 <- plot_ly(
        tourism, x = ~county, y = ~get(input$select), type = "bar", color = ~county)
    })
    
    # ACTIVITIES BARPLOT
    
    output$Test3 <- renderPlotly({
      Test3 <- plot_ly(
        Act, x = ~county, y = ~get(input$select2), type = "bar", color = ~county)
    })
    
    # CORRELATION SELECTION PLOT
    
      output$Test4<- renderPlot({
      x<-as.numeric(tourism[,as.numeric(input$var)])
      y<-as.numeric(Act[,as.numeric(input$var2)])
      plot(x, y, log = "xy", xlab=colnames(tourism)[as.numeric(input$var)], ylab=colnames(Act)[as.numeric(input$var2)])
       })
    
    # TOTAL CORRELATION PLOT
    
    output$plot1 <- renderPlot({
      plot(Act$total, tourism$total)
      abline(lm(Act$total~tourism$totalAccom))
      
    })
    
    output$info <- renderText({
      xy_str <- function(e) {
        if(is.null(e)) return("NULL\n")
        paste0("Activities =", round(e$x, 1), " Accomodation =", round(e$y, 1), "\n")
      }
      xy_range_str <- function(e) {
        if(is.null(e)) return("NULL\n")
        paste0("ActivityMin=", round(e$xmin, 1), " ActivityMax=", round(e$xmax, 1), 
               " AccomodationMin=", round(e$ymin, 1), " AccomodationMax=", round(e$ymax, 1))
      }
      
      paste0(
        "click: ", xy_str(input$plot_click),
        "dblclick: ", xy_str(input$plot_dblclick),
        "hover: ", xy_str(input$plot_hover),
        "brush: ", xy_range_str(input$plot_brush)
      )
    })
    
    # Airport Map
    
    # reference: https://stackoverflow.com/questions/42276220/clear-leaflet-markers-in-shiny-app-with-slider-bar
    
    subsetData1 <- reactive({
      
      flights %>% filter(Year == input$choice)
      
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
        fitBounds(min(flights$long),min(flights$lat),max(flights$long),max(flights$lat))
      
    })
    
    observeEvent(input$value,{
      leafletProxy("Map") %>%
        clearMarkers() %>%
        clearShapes() %>%
        addCircleMarkers(data = subsetData(),
                         lng  = ~long,
                         lat  = ~lat,
                         layerId = ~X,
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
    
    # Airport Bar chart
    
    output$plotBar = renderPlotly({
      plotBar <- plot_ly(
        x = flights$Year,
        y = flights$Visitors,
        name = "Inward Flight Numbers",
        type = "bar"
      ) 
    })
    
    # Airport Line chart
    
    output$plotLine = renderPlotly({
      plotLine <- plot_ly(flightYear, x = ~year, y = ~Cork, name = 'Cork', mode = 'lines') %>%
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
    
  }
  
  
)

