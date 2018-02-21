LeinsterAcc <- read.csv(file="C:\\Users\\Robbie\\Documents\\College\\GitHub\\SoftwareProject\\SoftwareProject\\LeinsterAccomodation.csv", header = TRUE, sep = ",")
MunsterAcc <- read.csv(file="C:\\Users\\Robbie\\Documents\\College\\GitHub\\SoftwareProject\\SoftwareProject\\MunsterAccomodation.csv", header = TRUE, sep = ",")
UlsterAcc <- read.csv(file="C:\\Users\\Robbie\\Documents\\College\\GitHub\\SoftwareProject\\SoftwareProject\\UlsterAccommodation.csv", header = TRUE, sep = ",")
ConnachtAcc <- read.csv(file="C:\\Users\\Robbie\\Documents\\College\\GitHub\\SoftwareProject\\SoftwareProject\\ConnachtAccomodation.csv", header = TRUE, sep = ",")

ConnachtAcc$prov <- as.character(ConnachtAcc$prov)
ConnachtAcc$county <- as.character(ConnachtAcc$county)

UlsterAcc$prov <- as.character(UlsterAcc$prov)
UlsterAcc$county <- as.character(UlsterAcc$county)

MunsterAcc$prov <- as.character(MunsterAcc$prov)
MunsterAcc$county <- as.character(MunsterAcc$county)

LeinsterAcc$prov <- as.character(LeinsterAcc$prov)
LeinsterAcc$county <- as.character(LeinsterAcc$county)


IrishAccommodation <- rbind(LeinsterAcc, MunsterAcc, UlsterAcc, ConnachtAcc)

library(highcharter)
hc <- highchart() %>%
  hc_xAxis(categories = IrishAccommodation$county) %>%
  hc_add_series(name = "Hotels", data = IrishAccommodation$hotel) %>%
  hc_add_series(name = "B&B's", data = IrishAccommodation$BB) %>%
  hc_add_series(name = "Rentals", data = IrishAccommodation$rentals) %>%
  hc_add_series(name = "Speciality lodge", data = IrishAccommodation$specLodge)

hc


write.csv(IrishAccommodation, file = "C:\\Users\\Robbie\\Documents\\College\\GitHub\\SoftwareProject\\SoftwareProject\\IrishAccomodation.csv")
