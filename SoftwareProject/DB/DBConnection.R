install.packages("RMySQL")
library(DBI)

tour <- read.csv(file="C:\\Users\\Robbie\\Documents\\College\\GitHub\\SoftwareProjectExcel\\ProjectData\\IrishTourismAll.csv", header=TRUE, sep=",")
inwardFlights <- read.csv(file="C:\\Users\\Robbie\\Documents\\College\\GitHub\\SoftwareProjectExcel\\ProjectData\\collected\\flights\\InwardFlightsMap.csv", header=TRUE, sep=",")
accomodationMap <- read.csv(file="C:\\Users\\Robbie\\Documents\\College\\GitHub\\SoftwareProjectExcel\\ProjectData\\collected\\IrishAccomodationMap.csv", header=TRUE, sep=",")
activitiesMap <- read.csv(file="C:\\Users\\Robbie\\Documents\\College\\GitHub\\SoftwareProjectExcel\\ProjectData\\collected\\IrishActivitiesMap.csv", header=TRUE, sep=",")
flightsYears <- read.csv(file="C:\\Users\\Robbie\\Documents\\College\\GitHub\\SoftwareProjectExcel\\ProjectData\\collected\\flights\\FlightsYears.csv", header=TRUE, sep=",")
AllAirportsIreland <- read.csv(file="C:\\Users\\Robbie\\Documents\\College\\GitHub\\SoftwareProjectExcel\\ProjectData\\collected\\flights\\AllAirports.csv", header=TRUE, sep=",")
AirportMonths <- read.csv(file="C:\\Users\\Robbie\\Documents\\College\\GitHub\\SoftwareProjectExcel\\ProjectData\\collected\\flights\\AirportMonths.csv", header=TRUE, sep=",")



con <- dbConnect(RMySQL::MySQL(),
                 dbname = "tourism",
                 host = "localhost",
                 port = 3306,
                 user = "root",
                 password = "password")

dbWriteTable(con, value = AllAirportsIreland, name = "AllAirportsIreland", append = TRUE )
dbWriteTable(con, value = AirportMonths, name = "AirportMonths", append = TRUE )
dbWriteTable(con, value = tour, name = "Ireland", append = TRUE ) 
dbWriteTable(con, value = inwardFlights, name = "FlightsMap", append = TRUE )
dbWriteTable(con, value = flightsYears, name = "FlightsYear", append = TRUE ) 

dbWriteTable(con, value = activitiesMap, name = "ActivityMap", append = TRUE ) 
dbWriteTable(con, value = accomodationMap, name = "AccomodationMap", append = TRUE ) 
