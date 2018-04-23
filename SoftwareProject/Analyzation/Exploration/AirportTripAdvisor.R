tour <- read.csv("C:\\Users\\Robbie\\Documents\\College\\GitHub\\SoftwareProjectExcel\\ProjectData\\irishtourismall.csv")

tour$airport <- as.character(tour$airport)

# Airport acc and act

tourAirport <- tour[which(tour$airport == "yes"),]

tour$airport <- as.factor(tour$airport)

AirportAccom <- sum(tourAirport$hotel+tourAirport$BB+tourAirport$specLodge+tourAirport$rentals)
AirportAct <- sum(tourAirport$sights+tourAirport$museums+tourAirport$foodDrink+tourAirport$nightlife+tourAirport$nature+tourAirport$outdoorAct+tourAirport$shopping)

# Non Airport acc and act

tourNoAirport <- tour[which(tour$airport == "no"),]

tour$airport <- as.character(tour$airport)

noAirportAccom <- sum(tourNoAirport$hotel+tourNoAirport$BB+tourNoAirport$specLodge+tourNoAirport$rentals)
noAirportAct <- sum(tourNoAirport$sights+tourNoAirport$museums+tourNoAirport$foodDrink+tourNoAirport$nightlife+tourNoAirport$nature+tourNoAirport$outdoorAct+tourNoAirport$shopping)

AirportAccomAct <- data.frame(type = c("NoAirportAct", "NoAirportAccom", "AirportAct", "AirportAccom"),
                              count = c(2558,4577,4399,8404))

save(AirportAccomAct,file="C:\\Users\\Robbie\\Documents\\College\\GitHub\\SoftwareProject\\SavedObjects\\AirportAccomAct.Rdata")


boxplot(AirportAccomAct$noAirportAct, AirportAccomAct$AirportAct, AirportAccomAct$noAirportAccom, AirportAccomAct$AirportAccom, names = c("No Aiport Act", "Aiport Act", "No Aiport Accom", "Aiport Accom"))

p <- plot_ly(AirportAccomAct, labels = ~type, values = ~count, type = 'pie') %>%
  layout(title = 'United States Personal Expenditures by Categories in 1960',
         xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
         yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
p
