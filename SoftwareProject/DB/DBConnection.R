install.packages("RMySQL")
library(DBI)

tour <- read.csv(file="C:\\Users\\Robbie\\Documents\\College\\GitHub\\SoftwareProjectExcel\\ProjectData\\IrishTourismAll.csv", header=TRUE, sep=",")
inwardFlights <- read.csv(file="C:\\Users\\Robbie\\Documents\\College\\GitHub\\SoftwareProjectExcel\\ProjectData\\InwardFlights.csv", header=TRUE, sep=",")


con <- dbConnect(RMySQL::MySQL(),
                 dbname = "tourism",
                 host = "localhost",
                 port = 3306,
                 user = "root",
                 password = "password")


dbWriteTable(con, value = tour, name = "Ireland", append = TRUE ) 
dbWriteTable(con, value = inwardFlights, name = "Flights", append = TRUE ) 
