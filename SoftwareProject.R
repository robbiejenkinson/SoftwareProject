setwd("C:\\Users\\Robbie\\Documents\\College\\GitHub\\SoftwareProjectExcel")

worldTourism = read.csv("Tourism1316.csv")

plot(worldTourism)

summary(worldTourism)

worldTourism$Country = as.character(worldTourism$Country)
worldTourism$yr2013 = as.integer(worldTourism$yr2013)
worldTourism$yr2014 = as.integer(worldTourism$yr2014)
worldTourism$yr2015 = as.integer(worldTourism$yr2015)
worldTourism$yr2016 = as.integer(worldTourism$yr2016)

View(worldTourism)

barplot(worldTourism$yr2016 ~ worldTourism$Country)

barplot(worldTourism$yr2016, mainlab= "Which Country Had Most Visitors To Ireland '16", xlab= "Countries Visited From", ylab= "Frequency",
        names.arg= worldTourism$Country)

install.packages("highcharter")
library(highcharter)

#viewing the differnce between '13 & '16 visitors from around the world to Ireland
hc <- highchart() %>%
  hc_xAxis(categories = worldTourism$Country) %>%
  hc_add_series(name = "2013", data = worldTourism$yr2013) %>%
  hc_add_series(name = "2016", data = worldTourism$yr2016)

hc
