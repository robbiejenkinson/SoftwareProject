#install.packages("plotly")
library(shiny)
library(plotly)

shinyServer(
  function(input, output){
    
    # MAP OUTPUT
    
    output$map <- renderLeaflet({
      color_fun <- colorNumeric('Blues', Acc$accCount)
      leaflet(data = Acc) %>% addProviderTiles('OpenStreetMap.Mapnik') %>% setView(-8, 53.5, 6) %>%
        addCircleMarkers(~long, ~lat, label = ~htmlEscape(county), fillColor=color_fun(Acc$accCount), weight=.6, fillOpacity=20) %>% addLegend(pal = color_fun, values = Acc$accCount, title = "Accomodation", position = 'bottomleft')
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
  }
  
  
)

