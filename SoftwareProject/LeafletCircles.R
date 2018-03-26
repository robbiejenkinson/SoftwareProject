Acc <- read.csv("C:\\Users\\Robbie\\Documents\\College\\GitHub\\SoftwareProjectExcel\\ProjectData\\Collected\\IrishAccomodationNew.csv")
library(htmltools)
library(leaflet)
#color_fun <- colorNumeric('Blues', Acc$accCount)
#leaflet(data = Acc, height = 430, width = 600) %>% addProviderTiles('OpenStreetMap.Mapnik') %>% setView(-8, 53.5, 6) %>%
 # addCircleMarkers(fillColor=color_fun(Acc$accCount), weight=.6, fillOpacity=20) %>% addLegend(pal = color_fun, values = Acc$accCount, title = "Accomodation", position = 'bottomleft')

#color_fun


server <- function(input, output) {
  
  # build data with 2 places
  
  # create a reactive value that will store the click position

  # Leaflet map with 2 markers
  output$map <- renderLeaflet({
    color_fun <- colorNumeric('Blues', Acc$accCount)
    leaflet(data = Acc) %>% addProviderTiles('OpenStreetMap.Mapnik') %>% setView(-8, 53.5, 6) %>%
      addCircleMarkers(~long, ~lat, label = ~htmlEscape(county), fillColor=color_fun(Acc$accCount), weight=.6, fillOpacity=20) %>% addLegend(pal = color_fun, values = Acc$accCount, title = "Accomodation", position = 'bottomleft')
  })
  
  
  
  
}


ui <- fluidPage(
  column(12,leafletOutput("map", height="600px"))
)

shinyApp(ui = ui, server = server)