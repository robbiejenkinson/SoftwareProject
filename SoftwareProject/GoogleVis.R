install.packages("googleVis")
library(googleVis)

Leinster <- read.csv(file="C:\\Users\\Robbie\\Documents\\College\\GitHub\\SoftwareProject\\SoftwareProject\\LeinsterAccomodation.csv", header = TRUE, sep = ",")

Leinster$prov <- as.character(Leinster$prov)
Leinster$county <- as.character(Leinster$county)


leinster <- gvisGeoMap(CityPopularity, locationvar = "City",
                          numvar = "Popularity", hovervar = "text",
                          options = list(width = "600px", height = "700px",
                                         dataMode = "regions", region = '091-021',
                                         colors = "[0xF8DFA7, 0x8D9569,
                                         0xE9cc99, 0xE2AD5A, 0xCA7363]"))
plot(leinster)

barplot(Leinster)

data()
data("CityPopularity")
city
USA

barplot(USArrests)



#--------------------------------------------------
library(googleVis)

Geo = gvisGeoMap(USArrests, locationvar="City", numvar="Popularity",
               options=list(height=350, dataMode='regions'))

plot(Geo)
#----------------------------------------------------

X4_5_month$Yes=paste(X4_5_month$latitude, X4_5_month$longitude, sep=":")
 
 G9 <- gvisGeoChart(eq, "loc", "Depth", "Magnitude",
                    options=list(displayMode="Markers", 
                    colorAxis="{colors:['purple', 'red', 'orange', 'grey']}",
                    backgroundColor="lightblue"), chartid="EQ")
 plot(G9)
