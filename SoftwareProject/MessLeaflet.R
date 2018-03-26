library(shiny)
library(leaflet)

Irish <- read.csv("C:\\Users\\Robbie\\Documents\\College\\GitHub\\SoftwareProjectExcel\\ProjectData\\Collected\\IrishAccomodationNew.csv")

server <- function(input, output) {
  
  # build data with 2 places

  # create a reactive value that will store the click position
  data_of_click <- reactiveValues(clickedMarker=NULL)
  
  # Leaflet map with 2 markers
  output$map <- renderLeaflet({
    leaflet() %>% 
      setView(lng=131 , lat =-25, zoom=4) %>%
      addTiles(options = providerTileOptions(noWrap = TRUE)) %>%
      addCircleMarkers(data=Irish, ~long , ~lat, layerId=~county, popup=~county, radius=8 , color="black",  fillColor="red", stroke = TRUE, fillOpacity = 0.8)
  })
  
  # store the click
  observeEvent(input$map_marker_click,{
    data_of_click$clickedMarker <- input$map_marker_click
  })
  
  # Make a barplot or scatterplot depending of the selected point
  output$plot=renderPlot({
    my_place=data_of_click$clickedMarker$id
    if(is.null(my_place)){my_place="Dublin"}
    if(my_place=="Dublin"){
      plot(accCount ~ accType, data=subset(Irish, county=="Dublin"))    
      }else if(my_place=="Kildare"){
        plot(accCount ~ accType, data=subset(Irish, county=="Kildare"))    
      }else{
        barplot(Irish$accCount)
      }        
  })
}


ui <- fluidPage(
  br(),
  column(8,leafletOutput("map", height="600px")),
  column(4,br(),br(),br(),br(),plotOutput("plot", height="300px")),
  br()
)

shinyApp(ui = ui, server = server)
