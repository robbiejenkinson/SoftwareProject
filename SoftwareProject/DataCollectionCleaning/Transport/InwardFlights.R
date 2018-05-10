install.packages("rmarkdown")
library(rmarkdown)
install.packages("knitr")
library(knitr)
# NOTE: urls and parameters have changed over time.
# Data Collected from http://www.cso.ie/px/pxeirestat/Statire/SelectVarVal/Define.asp?maintable=CTM01&PLanguage=0
# Data re-scraped on line 697

library(htmltab)
url <- "http://www.cso.ie/px/pxeirestat/Statire/SelectOut/PxSort.asp?file=20181241639407243069CTM01&PLanguage=0&MainTable=CTM01&MainTablePrestext=Passenger%20Movement%20(Number)&potsize=9297"
CorkAirport <- htmltab(doc=url, which=1)
head(CorkAirport)

rownames(CorkAirport) <- c(1:1033)

head(CorkAirport)

CorkAirport$`2017M01` <- as.integer(CorkAirport$`2017M01`)
CorkAirport$`2017M02` <- as.integer(CorkAirport$`2017M02`)
CorkAirport$`2017M03` <- as.integer(CorkAirport$`2017M03`)
CorkAirport$`2017M04` <- as.integer(CorkAirport$`2017M04`)
CorkAirport$`2017M05` <- as.integer(CorkAirport$`2017M05`)
CorkAirport$`2017M06` <- as.integer(CorkAirport$`2017M06`)
CorkAirport$`2017M07` <- as.integer(CorkAirport$`2017M07`)
CorkAirport$`2017M08` <- as.integer(CorkAirport$`2017M08`)
CorkAirport$`2017M09` <- as.integer(CorkAirport$`2017M09`)

CorkAirport <- CorkAirport[apply(CorkAirport!=0, 1, all),]

hc <- highchart() %>%
  hc_xAxis(categories = CorkAirport$`Foreign Airport`) %>%
  hc_add_series(name = "Jan '17", data = CorkAirport$`2017M01`) %>%
  hc_add_series(name = "Feb '17", data = CorkAirport$`2017M02`) %>%
  hc_add_series(name = "Mar '17", data = CorkAirport$`2017M03`) %>%
  hc_add_series(name = "Apr '17", data = CorkAirport$`2017M04`) %>%
  hc_add_series(name = "May '17", data = CorkAirport$`2017M05`) %>%
  hc_add_series(name = "May '17", data = CorkAirport$`2017M06`) %>%
  hc_add_series(name = "May '17", data = CorkAirport$`2017M07`) %>%
  hc_add_series(name = "May '17", data = CorkAirport$`2017M08`) %>%
  hc_add_series(name = "May '17", data = CorkAirport$`2017M09`) 

hc

#------------------------------------------------------------------


library(htmltab)
url <- "http://www.cso.ie/px/pxeirestat/Statire/SelectOut/PxSort.asp?file=20181291259191128438CTM01&PLanguage=0&MainTable=CTM01&MainTablePrestext=Passenger%20Movement%20(Number)&potsize=133257"
CorkAirport <- htmltab(doc=url, which=1)
head(CorkAirport)

rownames(CorkAirport) <- c(1:1033)

head(CorkAirport)

CorkAirport <- CorkAirport[apply(CorkAirport!=0, 1, all),]

CorkAirport[is.na(CorkAirport)] <- 0


CorkAirport[4:132] <- lapply(CorkAirport[4:132], as.integer)

CorkAirport[1] <- NULL

CorkAirport$Cork2007 <- CorkAirport$`2007M01`+ CorkAirport$`2007M02` + CorkAirport$`2007M03` + CorkAirport$`2007M04` + CorkAirport$`2007M05` + CorkAirport$`2007M06` + CorkAirport$`2007M07` + CorkAirport$`2007M08` + CorkAirport$`2007M09` + CorkAirport$`2007M10` + CorkAirport$`2007M11` + CorkAirport$`2007M12`
Cork2007 <- sum(CorkAirport$Cork2007)

CorkAirport$Cork2008 <- CorkAirport$`2008M01`+ CorkAirport$`2008M02` + CorkAirport$`2008M03` + CorkAirport$`2008M04` + CorkAirport$`2008M05` + CorkAirport$`2008M06` + CorkAirport$`2008M07` + CorkAirport$`2008M08` + CorkAirport$`2008M09` + CorkAirport$`2008M10` + CorkAirport$`2008M11` + CorkAirport$`2008M12`
Cork2008 <- sum(CorkAirport$Cork2008)

CorkAirport$Cork2009 <- CorkAirport$`2009M01`+ CorkAirport$`2009M02` + CorkAirport$`2009M03` + CorkAirport$`2009M04` + CorkAirport$`2009M05` + CorkAirport$`2009M06` + CorkAirport$`2009M07` + CorkAirport$`2009M08` + CorkAirport$`2009M09` + CorkAirport$`2009M10` + CorkAirport$`2009M11` + CorkAirport$`2009M12`
Cork2009 <- sum(CorkAirport$Cork2009)

CorkAirport$Cork2010 <- CorkAirport$`2010M01`+ CorkAirport$`2010M02` + CorkAirport$`2010M03` + CorkAirport$`2010M04` + CorkAirport$`2010M05` + CorkAirport$`2010M06` + CorkAirport$`2010M07` + CorkAirport$`2010M08` + CorkAirport$`2010M09` + CorkAirport$`2010M10` + CorkAirport$`2010M11` + CorkAirport$`2010M12`
Cork2010 <- sum(CorkAirport$Cork2010)

CorkAirport$Cork2011 <- CorkAirport$`2011M01`+ CorkAirport$`2011M02` + CorkAirport$`2011M03` + CorkAirport$`2011M04` + CorkAirport$`2011M05` + CorkAirport$`2011M06` + CorkAirport$`2011M07` + CorkAirport$`2011M08` + CorkAirport$`2011M09` + CorkAirport$`2011M10` + CorkAirport$`2011M11` + CorkAirport$`2011M12`
Cork2011 <- sum(CorkAirport$Cork2011)

CorkAirport$Cork2012 <- CorkAirport$`2012M01`+ CorkAirport$`2012M02` + CorkAirport$`2012M03` + CorkAirport$`2012M04` + CorkAirport$`2012M05` + CorkAirport$`2012M06` + CorkAirport$`2012M07` + CorkAirport$`2012M08` + CorkAirport$`2012M09` + CorkAirport$`2012M10` + CorkAirport$`2012M11` + CorkAirport$`2012M12`
Cork2012 <- sum(CorkAirport$Cork2012)

CorkAirport$Cork2013 <- CorkAirport$`2013M01`+ CorkAirport$`2013M02` + CorkAirport$`2013M03` + CorkAirport$`2013M04` + CorkAirport$`2013M05` + CorkAirport$`2013M06` + CorkAirport$`2013M07` + CorkAirport$`2013M08` + CorkAirport$`2013M09` + CorkAirport$`2013M10` + CorkAirport$`2013M11` + CorkAirport$`2013M12`
Cork2013 <- sum(CorkAirport$Cork2013)

CorkAirport$Cork2014 <- CorkAirport$`2014M01`+ CorkAirport$`2014M02` + CorkAirport$`2014M03` + CorkAirport$`2014M04` + CorkAirport$`2014M05` + CorkAirport$`2014M06` + CorkAirport$`2014M07` + CorkAirport$`2014M08` + CorkAirport$`2014M09` + CorkAirport$`2014M10` + CorkAirport$`2014M11` + CorkAirport$`2014M12`
Cork2014 <- sum(CorkAirport$Cork2014)

CorkAirport$Cork2015 <- CorkAirport$`2015M01`+ CorkAirport$`2015M02` + CorkAirport$`2015M03` + CorkAirport$`2015M04` + CorkAirport$`2015M05` + CorkAirport$`2015M06` + CorkAirport$`2015M07` + CorkAirport$`2015M08` + CorkAirport$`2015M09` + CorkAirport$`2015M10` + CorkAirport$`2015M11` + CorkAirport$`2015M12`
Cork2015 <- sum(CorkAirport$Cork2015)

CorkAirport$Cork2016 <- CorkAirport$`2016M01`+ CorkAirport$`2016M02` + CorkAirport$`2016M03` + CorkAirport$`2016M04` + CorkAirport$`2016M05` + CorkAirport$`2016M06` + CorkAirport$`2016M07` + CorkAirport$`2016M08` + CorkAirport$`2016M09` + CorkAirport$`2016M10` + CorkAirport$`2016M11` + CorkAirport$`2016M12`
Cork2016 <- sum(CorkAirport$Cork2016)

CorkAirport$Cork2017 <- CorkAirport$`2017M01`+ CorkAirport$`2017M02` + CorkAirport$`2017M03` + CorkAirport$`2017M04` + CorkAirport$`2017M05` + CorkAirport$`2017M06` + CorkAirport$`2017M07` + CorkAirport$`2017M08` + CorkAirport$`2017M09` 
Cork2017 <- sum(CorkAirport$Cork2015)

CorkAirportNew <- data.frame(Cork2013, Cork2014, Cork2015, Cork2016, Cork2017)

CorkAirportNew$Cork2015 <- as.integer(CorkAirportNew$Cork2015)
CorkAirportNew$Cork2017 <- as.integer(CorkAirportNew$Cork2017)

CorkAirportNew$Year <- c("2013", "2014", "2015", "2016", "2017")
Co

CorkAirportNew <- data.frame(year = c("2007","2008","2009","2010","2011","2012","2013", "2014", "2015", "2016"), Cork = c(Cork2007, Cork2008,Cork2009,Cork2010,Cork2011,Cork2012,Cork2013, Cork2014,Cork2015, Cork2016))
CorkAirportNew$year <- as.character(CorkAirportNew$year)

library(highcharter)

hc <- highchart() %>%
  hc_xAxis(categories = CorkAirportNew$year) %>%
  hc_add_series(name = "Inward Passengers Cork", data = CorkAirportNew$Cork)
hc


#-----------------
# Dublin

library(htmltab)
url <- "http://www.cso.ie/px/pxeirestat/Statire/SelectOut/PxSort.asp?file=20181291629257305870CTM01&PLanguage=0&MainTable=CTM01&MainTablePrestext=Passenger%20Movement%20(Number)&potsize=123960"
DublinAirport <- htmltab(doc=url, which=1)
head(DublinAirport)

rownames(DublinAirport) <- c(1:1033)

head(DublinAirport)

DublinAirport <- DublinAirport[apply(DublinAirport!=0, 1, all),]

DublinAirport[is.na(DublinAirport)] <- 0


DublinAirport[4:123] <- lapply(DublinAirport[4:123], as.integer)

DublinAirport[1] <- NULL

DublinAirport$Dublin2007 <- DublinAirport$`2007M01`+ DublinAirport$`2007M02` + DublinAirport$`2007M03` + DublinAirport$`2007M04` + DublinAirport$`2007M05` + DublinAirport$`2007M06` + DublinAirport$`2007M07` + DublinAirport$`2007M08` + DublinAirport$`2007M09` + DublinAirport$`2007M10` + DublinAirport$`2007M11` + DublinAirport$`2007M12`
Dublin2007 <- sum(DublinAirport$Dublin2007)

DublinAirport$Dublin2008 <- DublinAirport$`2008M01`+ DublinAirport$`2008M02` + DublinAirport$`2008M03` + DublinAirport$`2008M04` + DublinAirport$`2008M05` + DublinAirport$`2008M06` + DublinAirport$`2008M07` + DublinAirport$`2008M08` + DublinAirport$`2008M09` + DublinAirport$`2008M10` + DublinAirport$`2008M11` + DublinAirport$`2008M12`
Dublin2008 <- sum(DublinAirport$Dublin2008)

DublinAirport$Dublin2009 <- DublinAirport$`2009M01`+ DublinAirport$`2009M02` + DublinAirport$`2009M03` + DublinAirport$`2009M04` + DublinAirport$`2009M05` + DublinAirport$`2009M06` + DublinAirport$`2009M07` + DublinAirport$`2009M08` + DublinAirport$`2009M09` + DublinAirport$`2009M10` + DublinAirport$`2009M11` + DublinAirport$`2009M12`
Dublin2009 <- sum(DublinAirport$Dublin2009)

DublinAirport$Dublin2010 <- DublinAirport$`2010M01`+ DublinAirport$`2010M02` + DublinAirport$`2010M03` + DublinAirport$`2010M04` + DublinAirport$`2010M05` + DublinAirport$`2010M06` + DublinAirport$`2010M07` + DublinAirport$`2010M08` + DublinAirport$`2010M09` + DublinAirport$`2010M10` + DublinAirport$`2010M11` + DublinAirport$`2010M12`
Dublin2010 <- sum(DublinAirport$Dublin2010)

DublinAirport$Dublin2011 <- DublinAirport$`2011M01`+ DublinAirport$`2011M02` + DublinAirport$`2011M03` + DublinAirport$`2011M04` + DublinAirport$`2011M05` + DublinAirport$`2011M06` + DublinAirport$`2011M07` + DublinAirport$`2011M08` + DublinAirport$`2011M09` + DublinAirport$`2011M10` + DublinAirport$`2011M11` + DublinAirport$`2011M12`
Dublin2011 <- sum(DublinAirport$Dublin2011)

DublinAirport$Dublin2012 <- DublinAirport$`2012M01`+ DublinAirport$`2012M02` + DublinAirport$`2012M03` + DublinAirport$`2012M04` + DublinAirport$`2012M05` + DublinAirport$`2012M06` + DublinAirport$`2012M07` + DublinAirport$`2012M08` + DublinAirport$`2012M09` + DublinAirport$`2012M10` + DublinAirport$`2012M11` + DublinAirport$`2012M12`
Dublin2012 <- sum(DublinAirport$Dublin2012)

DublinAirport$Dublin2013 <- DublinAirport$`2013M01`+ DublinAirport$`2013M02` + DublinAirport$`2013M03` + DublinAirport$`2013M04` + DublinAirport$`2013M05` + DublinAirport$`2013M06` + DublinAirport$`2013M07` + DublinAirport$`2013M08` + DublinAirport$`2013M09` + DublinAirport$`2013M10` + DublinAirport$`2013M11` + DublinAirport$`2013M12`
Dublin2013 <- sum(DublinAirport$Dublin2013)

DublinAirport$Dublin2014 <- DublinAirport$`2014M01`+ DublinAirport$`2014M02` + DublinAirport$`2014M03` + DublinAirport$`2014M04` + DublinAirport$`2014M05` + DublinAirport$`2014M06` + DublinAirport$`2014M07` + DublinAirport$`2014M08` + DublinAirport$`2014M09` + DublinAirport$`2014M10` + DublinAirport$`2014M11` + DublinAirport$`2014M12`
Dublin2014 <- sum(DublinAirport$Dublin2014)

DublinAirport$Dublin2015 <- DublinAirport$`2015M01`+ DublinAirport$`2015M02` + DublinAirport$`2015M03` + DublinAirport$`2015M04` + DublinAirport$`2015M05` + DublinAirport$`2015M06` + DublinAirport$`2015M07` + DublinAirport$`2015M08` + DublinAirport$`2015M09` + DublinAirport$`2015M10` + DublinAirport$`2015M11` + DublinAirport$`2015M12`
Dublin2015 <- sum(DublinAirport$Dublin2015)

DublinAirport$Dublin2016 <- DublinAirport$`2016M01`+ DublinAirport$`2016M02` + DublinAirport$`2016M03` + DublinAirport$`2016M04` + DublinAirport$`2016M05` + DublinAirport$`2016M06` + DublinAirport$`2016M07` + DublinAirport$`2016M08` + DublinAirport$`2016M09` + DublinAirport$`2016M10` + DublinAirport$`2016M11` + DublinAirport$`2016M12`
Dublin2016 <- sum(DublinAirport$Dublin2016)

DublinAirportNew <- data.frame(Dublin2013, Dublin2014, Dublin2015, Dublin2016)

CorkAirportNew$Cork2015 <- as.integer(CorkAirportNew$Cork2015)
CorkAirportNew$Cork2017 <- as.integer(CorkAirportNew$Cork2017)

CorkAirportNew$Year <- c("2013", "2014", "2015", "2016", "2017")
Co

DublinAirportNew <- data.frame(year = c("2007","2008","2009","2010","2011","2012","2013", "2014", "2015", "2016"), Dublin = c(Dublin2007, Dublin2008,Dublin2009,Dublin2010,Dublin2011,Dublin2012,Dublin2013, Dublin2014,Dublin2015, Dublin2016))
DublinAirportNew$year <- as.character(DublinAirportNew$year)

library(highcharter)
hc <- highchart() %>%
  hc_xAxis(categories = DublinAirportNew$year) %>%
  hc_add_series(name = "Passengers Dublin", data = DublinAirportNew$Dublin) %>%
  hc_add_series(name = "Passengers Galway", data = GalwayAirportNew$Galway) %>%
  hc_add_series(name = "Passengers Shannon", data = ShannonAirportNew$Shannon) %>%
  hc_add_series(name = "Passengers Cork", data = CorkAirportNew$Cork)
  
hc


#-----------------
# Donegal

library(htmltab)
url <- "http://www.cso.ie/px/pxeirestat/Statire/SelectOut/PxSort.asp?file=2018129188297307040CTM01&PLanguage=0&MainTable=CTM01&MainTablePrestext=Passenger%20Movement%20(Number)&potsize=123960"
DonegalAirport <- htmltab(doc=url, which=1)
head(DonegalAirport)

rownames(DonegalAirport) <- c(1:1033)

head(DonegalAirport)

DonegalAirport <- DonegalAirport[apply(DonegalAirport!=0, 1, all),]

DonegalAirport[is.na(DonegalAirport)] <- 0


DonegalAirport[4:123] <- lapply(DonegalAirport[4:123], as.integer)

DonegalAirport[1] <- NULL

DonegalAirport$Donegal2007 <- DonegalAirport$`2007M01`+ DonegalAirport$`2007M02` + DonegalAirport$`2007M03` + DonegalAirport$`2007M04` + DonegalAirport$`2007M05` + DonegalAirport$`2007M06` + DonegalAirport$`2007M07` + DonegalAirport$`2007M08` + DonegalAirport$`2007M09` + DonegalAirport$`2007M10` + DonegalAirport$`2007M11` + DonegalAirport$`2007M12`
Donegal2007 <- sum(DonegalAirport$Donegal2007)

DonegalAirport$Donegal2008 <- DonegalAirport$`2008M01`+ DonegalAirport$`2008M02` + DonegalAirport$`2008M03` + DonegalAirport$`2008M04` + DonegalAirport$`2008M05` + DonegalAirport$`2008M06` + DonegalAirport$`2008M07` + DonegalAirport$`2008M08` + DonegalAirport$`2008M09` + DonegalAirport$`2008M10` + DonegalAirport$`2008M11` + DonegalAirport$`2008M12`
Donegal2008 <- sum(DonegalAirport$Donegal2008)

DonegalAirport$Donegal2009 <- DonegalAirport$`2009M01`+ DonegalAirport$`2009M02` + DonegalAirport$`2009M03` + DonegalAirport$`2009M04` + DonegalAirport$`2009M05` + DonegalAirport$`2009M06` + DonegalAirport$`2009M07` + DonegalAirport$`2009M08` + DonegalAirport$`2009M09` + DonegalAirport$`2009M10` + DonegalAirport$`2009M11` + DonegalAirport$`2009M12`
Donegal2009 <- sum(DonegalAirport$Donegal2009)

DonegalAirport$Donegal2010 <- DonegalAirport$`2010M01`+ DonegalAirport$`2010M02` + DonegalAirport$`2010M03` + DonegalAirport$`2010M04` + DonegalAirport$`2010M05` + DonegalAirport$`2010M06` + DonegalAirport$`2010M07` + DonegalAirport$`2010M08` + DonegalAirport$`2010M09` + DonegalAirport$`2010M10` + DonegalAirport$`2010M11` + DonegalAirport$`2010M12`
Donegal2010 <- sum(DonegalAirport$Donegal2010)

DonegalAirport$Donegal2011 <- DonegalAirport$`2011M01`+ DonegalAirport$`2011M02` + DonegalAirport$`2011M03` + DonegalAirport$`2011M04` + DonegalAirport$`2011M05` + DonegalAirport$`2011M06` + DonegalAirport$`2011M07` + DonegalAirport$`2011M08` + DonegalAirport$`2011M09` + DonegalAirport$`2011M10` + DonegalAirport$`2011M11` + DonegalAirport$`2011M12`
Donegal2011 <- sum(DonegalAirport$Donegal2011)

DonegalAirport$Donegal2012 <- DonegalAirport$`2012M01`+ DonegalAirport$`2012M02` + DonegalAirport$`2012M03` + DonegalAirport$`2012M04` + DonegalAirport$`2012M05` + DonegalAirport$`2012M06` + DonegalAirport$`2012M07` + DonegalAirport$`2012M08` + DonegalAirport$`2012M09` + DonegalAirport$`2012M10` + DonegalAirport$`2012M11` + DonegalAirport$`2012M12`
Donegal2012 <- sum(DonegalAirport$Donegal2012)

DonegalAirport$Donegal2013 <- DonegalAirport$`2013M01`+ DonegalAirport$`2013M02` + DonegalAirport$`2013M03` + DonegalAirport$`2013M04` + DonegalAirport$`2013M05` + DonegalAirport$`2013M06` + DonegalAirport$`2013M07` + DonegalAirport$`2013M08` + DonegalAirport$`2013M09` + DonegalAirport$`2013M10` + DonegalAirport$`2013M11` + DonegalAirport$`2013M12`
Donegal2013 <- sum(DonegalAirport$Donegal2013)

DonegalAirport$Donegal2014 <- DonegalAirport$`2014M01`+ DonegalAirport$`2014M02` + DonegalAirport$`2014M03` + DonegalAirport$`2014M04` + DonegalAirport$`2014M05` + DonegalAirport$`2014M06` + DonegalAirport$`2014M07` + DonegalAirport$`2014M08` + DonegalAirport$`2014M09` + DonegalAirport$`2014M10` + DonegalAirport$`2014M11` + DonegalAirport$`2014M12`
Donegal2014 <- sum(DonegalAirport$Donegal2014)

DonegalAirport$Donegal2015 <- DonegalAirport$`2015M01`+ DonegalAirport$`2015M02` + DonegalAirport$`2015M03` + DonegalAirport$`2015M04` + DonegalAirport$`2015M05` + DonegalAirport$`2015M06` + DonegalAirport$`2015M07` + DonegalAirport$`2015M08` + DonegalAirport$`2015M09` + DonegalAirport$`2015M10` + DonegalAirport$`2015M11` + DonegalAirport$`2015M12`
Donegal2015 <- sum(DonegalAirport$Donegal2015)

DonegalAirport$Donegal2016 <- DonegalAirport$`2016M01`+ DonegalAirport$`2016M02` + DonegalAirport$`2016M03` + DonegalAirport$`2016M04` + DonegalAirport$`2016M05` + DonegalAirport$`2016M06` + DonegalAirport$`2016M07` + DonegalAirport$`2016M08` + DonegalAirport$`2016M09` + DonegalAirport$`2016M10` + DonegalAirport$`2016M11` + DonegalAirport$`2016M12`
Donegal2016 <- sum(DonegalAirport$Donegal2016)

DonegalAirportNew <- data.frame(Donegal2013, Donegal2014, Donegal2015, Donegal2016)

CorkAirportNew$Cork2015 <- as.integer(CorkAirportNew$Cork2015)
CorkAirportNew$Cork2017 <- as.integer(CorkAirportNew$Cork2017)

CorkAirportNew$Year <- c("2013", "2014", "2015", "2016", "2017")
Co

DonegalAirportNew <- data.frame(year = c("2007","2008","2009","2010","2011","2012","2013", "2014", "2015", "2016"), Donegal = c(Donegal2007, Donegal2008,Donegal2009,Donegal2010,Donegal2011,Donegal2012,Donegal2013, Donegal2014,Donegal2015, Donegal2016))
DonegalAirportNew$year <- as.character(DonegalAirportNew$year)

hc <- highchart() %>%
  hc_xAxis(categories = DonegalAirportNew$year) %>%
  hc_add_series(name = "Passengers Donegal", data = DonegalAirportNew$Donegal)
hc

#--------------------
# Galway

library(htmltab)
url <- "http://www.cso.ie/px/pxeirestat/Statire/SelectOut/PxSort.asp?file=20181291829167307040CTM01&PLanguage=0&MainTable=CTM01&MainTablePrestext=Passenger%20Movement%20(Number)&potsize=123960"
GalwayAirport <- htmltab(doc=url, which=1)
head(GalwayAirport)

rownames(GalwayAirport) <- c(1:1033)

head(GalwayAirport)

GalwayAirport <- GalwayAirport[apply(GalwayAirport!=0, 1, all),]

GalwayAirport[is.na(GalwayAirport)] <- 0


GalwayAirport[4:123] <- lapply(GalwayAirport[4:123], as.integer)

GalwayAirport[1] <- NULL

GalwayAirport$Galway2007 <- GalwayAirport$`2007M01`+ GalwayAirport$`2007M02` + GalwayAirport$`2007M03` + GalwayAirport$`2007M04` + GalwayAirport$`2007M05` + GalwayAirport$`2007M06` + GalwayAirport$`2007M07` + GalwayAirport$`2007M08` + GalwayAirport$`2007M09` + GalwayAirport$`2007M10` + GalwayAirport$`2007M11` + GalwayAirport$`2007M12`
Galway2007 <- sum(GalwayAirport$Galway2007)

GalwayAirport$Galway2008 <- GalwayAirport$`2008M01`+ GalwayAirport$`2008M02` + GalwayAirport$`2008M03` + GalwayAirport$`2008M04` + GalwayAirport$`2008M05` + GalwayAirport$`2008M06` + GalwayAirport$`2008M07` + GalwayAirport$`2008M08` + GalwayAirport$`2008M09` + GalwayAirport$`2008M10` + GalwayAirport$`2008M11` + GalwayAirport$`2008M12`
Galway2008 <- sum(GalwayAirport$Galway2008)

GalwayAirport$Galway2009 <- GalwayAirport$`2009M01`+ GalwayAirport$`2009M02` + GalwayAirport$`2009M03` + GalwayAirport$`2009M04` + GalwayAirport$`2009M05` + GalwayAirport$`2009M06` + GalwayAirport$`2009M07` + GalwayAirport$`2009M08` + GalwayAirport$`2009M09` + GalwayAirport$`2009M10` + GalwayAirport$`2009M11` + GalwayAirport$`2009M12`
Galway2009 <- sum(GalwayAirport$Galway2009)

GalwayAirport$Galway2010 <- GalwayAirport$`2010M01`+ GalwayAirport$`2010M02` + GalwayAirport$`2010M03` + GalwayAirport$`2010M04` + GalwayAirport$`2010M05` + GalwayAirport$`2010M06` + GalwayAirport$`2010M07` + GalwayAirport$`2010M08` + GalwayAirport$`2010M09` + GalwayAirport$`2010M10` + GalwayAirport$`2010M11` + GalwayAirport$`2010M12`
Galway2010 <- sum(GalwayAirport$Galway2010)

GalwayAirport$Galway2011 <- GalwayAirport$`2011M01`+ GalwayAirport$`2011M02` + GalwayAirport$`2011M03` + GalwayAirport$`2011M04` + GalwayAirport$`2011M05` + GalwayAirport$`2011M06` + GalwayAirport$`2011M07` + GalwayAirport$`2011M08` + GalwayAirport$`2011M09` + GalwayAirport$`2011M10` + GalwayAirport$`2011M11` + GalwayAirport$`2011M12`
Galway2011 <- sum(GalwayAirport$Galway2011)

GalwayAirport$Galway2012 <- GalwayAirport$`2012M01`+ GalwayAirport$`2012M02` + GalwayAirport$`2012M03` + GalwayAirport$`2012M04` + GalwayAirport$`2012M05` + GalwayAirport$`2012M06` + GalwayAirport$`2012M07` + GalwayAirport$`2012M08` + GalwayAirport$`2012M09` + GalwayAirport$`2012M10` + GalwayAirport$`2012M11` + GalwayAirport$`2012M12`
Galway2012 <- sum(GalwayAirport$Galway2012)

GalwayAirport$Galway2013 <- GalwayAirport$`2013M01`+ GalwayAirport$`2013M02` + GalwayAirport$`2013M03` + GalwayAirport$`2013M04` + GalwayAirport$`2013M05` + GalwayAirport$`2013M06` + GalwayAirport$`2013M07` + GalwayAirport$`2013M08` + GalwayAirport$`2013M09` + GalwayAirport$`2013M10` + GalwayAirport$`2013M11` + GalwayAirport$`2013M12`
Galway2013 <- sum(GalwayAirport$Galway2013)

GalwayAirport$Galway2014 <- GalwayAirport$`2014M01`+ GalwayAirport$`2014M02` + GalwayAirport$`2014M03` + GalwayAirport$`2014M04` + GalwayAirport$`2014M05` + GalwayAirport$`2014M06` + GalwayAirport$`2014M07` + GalwayAirport$`2014M08` + GalwayAirport$`2014M09` + GalwayAirport$`2014M10` + GalwayAirport$`2014M11` + GalwayAirport$`2014M12`
Galway2014 <- sum(GalwayAirport$Galway2014)

GalwayAirport$Galway2015 <- GalwayAirport$`2015M01`+ GalwayAirport$`2015M02` + GalwayAirport$`2015M03` + GalwayAirport$`2015M04` + GalwayAirport$`2015M05` + GalwayAirport$`2015M06` + GalwayAirport$`2015M07` + GalwayAirport$`2015M08` + GalwayAirport$`2015M09` + GalwayAirport$`2015M10` + GalwayAirport$`2015M11` + GalwayAirport$`2015M12`
Galway2015 <- sum(GalwayAirport$Galway2015)

GalwayAirport$Galway2016 <- GalwayAirport$`2016M01`+ GalwayAirport$`2016M02` + GalwayAirport$`2016M03` + GalwayAirport$`2016M04` + GalwayAirport$`2016M05` + GalwayAirport$`2016M06` + GalwayAirport$`2016M07` + GalwayAirport$`2016M08` + GalwayAirport$`2016M09` + GalwayAirport$`2016M10` + GalwayAirport$`2016M11` + GalwayAirport$`2016M12`
Galway2016 <- sum(GalwayAirport$Galway2016)

GalwayAirportNew <- data.frame(Galway2013, Galway2014, Galway2015, Galway2016)

CorkAirportNew$Cork2015 <- as.integer(CorkAirportNew$Cork2015)
CorkAirportNew$Cork2017 <- as.integer(CorkAirportNew$Cork2017)

CorkAirportNew$Year <- c("2013", "2014", "2015", "2016", "2017")
Co

GalwayAirportNew <- data.frame(year = c("2007","2008","2009","2010","2011","2012","2013", "2014", "2015", "2016"), Galway = c(Galway2007, Galway2008,Galway2009,Galway2010,Galway2011,Galway2012,Galway2013, Galway2014,Galway2015, Galway2016))
GalwayAirportNew$year <- as.character(GalwayAirportNew$year)

hc <- highchart() %>%
  hc_xAxis(categories = GalwayAirportNew$year) %>%
  hc_add_series(name = "Passengers Galway", data = GalwayAirportNew$Galway)
hc


#---------------------
# Shannon

# Shannon

library(htmltab)
url <- "http://www.cso.ie/px/pxeirestat/Statire/SelectOut/PxSort.asp?file=20181291839447307040CTM01&PLanguage=0&MainTable=CTM01&MainTablePrestext=Passenger%20Movement%20(Number)&potsize=123960"
ShannonAirport <- htmltab(doc=url, which=1)
head(ShannonAirport)

rownames(ShannonAirport) <- c(1:1033)

head(ShannonAirport)

ShannonAirport <- ShannonAirport[apply(ShannonAirport!=0, 1, all),]

ShannonAirport[is.na(ShannonAirport)] <- 0


ShannonAirport[2:121] <- lapply(ShannonAirport[2:121], as.integer)

ShannonAirport[1] <- NULL

ShannonAirport$Shannon2007 <- ShannonAirport$`2007M01`+ ShannonAirport$`2007M02` + ShannonAirport$`2007M03` + ShannonAirport$`2007M04` + ShannonAirport$`2007M05` + ShannonAirport$`2007M06` + ShannonAirport$`2007M07` + ShannonAirport$`2007M08` + ShannonAirport$`2007M09` + ShannonAirport$`2007M10` + ShannonAirport$`2007M11` + ShannonAirport$`2007M12`
Shannon2007 <- sum(ShannonAirport$Shannon2007)

ShannonAirport$Shannon2008 <- ShannonAirport$`2008M01`+ ShannonAirport$`2008M02` + ShannonAirport$`2008M03` + ShannonAirport$`2008M04` + ShannonAirport$`2008M05` + ShannonAirport$`2008M06` + ShannonAirport$`2008M07` + ShannonAirport$`2008M08` + ShannonAirport$`2008M09` + ShannonAirport$`2008M10` + ShannonAirport$`2008M11` + ShannonAirport$`2008M12`
Shannon2008 <- sum(ShannonAirport$Shannon2008)

ShannonAirport$Shannon2009 <- ShannonAirport$`2009M01`+ ShannonAirport$`2009M02` + ShannonAirport$`2009M03` + ShannonAirport$`2009M04` + ShannonAirport$`2009M05` + ShannonAirport$`2009M06` + ShannonAirport$`2009M07` + ShannonAirport$`2009M08` + ShannonAirport$`2009M09` + ShannonAirport$`2009M10` + ShannonAirport$`2009M11` + ShannonAirport$`2009M12`
Shannon2009 <- sum(ShannonAirport$Shannon2009)

ShannonAirport$Shannon2010 <- ShannonAirport$`2010M01`+ ShannonAirport$`2010M02` + ShannonAirport$`2010M03` + ShannonAirport$`2010M04` + ShannonAirport$`2010M05` + ShannonAirport$`2010M06` + ShannonAirport$`2010M07` + ShannonAirport$`2010M08` + ShannonAirport$`2010M09` + ShannonAirport$`2010M10` + ShannonAirport$`2010M11` + ShannonAirport$`2010M12`
Shannon2010 <- sum(ShannonAirport$Shannon2010)

ShannonAirport$Shannon2011 <- ShannonAirport$`2011M01`+ ShannonAirport$`2011M02` + ShannonAirport$`2011M03` + ShannonAirport$`2011M04` + ShannonAirport$`2011M05` + ShannonAirport$`2011M06` + ShannonAirport$`2011M07` + ShannonAirport$`2011M08` + ShannonAirport$`2011M09` + ShannonAirport$`2011M10` + ShannonAirport$`2011M11` + ShannonAirport$`2011M12`
Shannon2011 <- sum(ShannonAirport$Shannon2011)

ShannonAirport$Shannon2012 <- ShannonAirport$`2012M01`+ ShannonAirport$`2012M02` + ShannonAirport$`2012M03` + ShannonAirport$`2012M04` + ShannonAirport$`2012M05` + ShannonAirport$`2012M06` + ShannonAirport$`2012M07` + ShannonAirport$`2012M08` + ShannonAirport$`2012M09` + ShannonAirport$`2012M10` + ShannonAirport$`2012M11` + ShannonAirport$`2012M12`
Shannon2012 <- sum(ShannonAirport$Shannon2012)

ShannonAirport$Shannon2013 <- ShannonAirport$`2013M01`+ ShannonAirport$`2013M02` + ShannonAirport$`2013M03` + ShannonAirport$`2013M04` + ShannonAirport$`2013M05` + ShannonAirport$`2013M06` + ShannonAirport$`2013M07` + ShannonAirport$`2013M08` + ShannonAirport$`2013M09` + ShannonAirport$`2013M10` + ShannonAirport$`2013M11` + ShannonAirport$`2013M12`
Shannon2013 <- sum(ShannonAirport$Shannon2013)

ShannonAirport$Shannon2014 <- ShannonAirport$`2014M01`+ ShannonAirport$`2014M02` + ShannonAirport$`2014M03` + ShannonAirport$`2014M04` + ShannonAirport$`2014M05` + ShannonAirport$`2014M06` + ShannonAirport$`2014M07` + ShannonAirport$`2014M08` + ShannonAirport$`2014M09` + ShannonAirport$`2014M10` + ShannonAirport$`2014M11` + ShannonAirport$`2014M12`
Shannon2014 <- sum(ShannonAirport$Shannon2014)

ShannonAirport$Shannon2015 <- ShannonAirport$`2015M01`+ ShannonAirport$`2015M02` + ShannonAirport$`2015M03` + ShannonAirport$`2015M04` + ShannonAirport$`2015M05` + ShannonAirport$`2015M06` + ShannonAirport$`2015M07` + ShannonAirport$`2015M08` + ShannonAirport$`2015M09` + ShannonAirport$`2015M10` + ShannonAirport$`2015M11` + ShannonAirport$`2015M12`
Shannon2015 <- sum(ShannonAirport$Shannon2015)

ShannonAirport$Shannon2016 <- ShannonAirport$`2016M01`+ ShannonAirport$`2016M02` + ShannonAirport$`2016M03` + ShannonAirport$`2016M04` + ShannonAirport$`2016M05` + ShannonAirport$`2016M06` + ShannonAirport$`2016M07` + ShannonAirport$`2016M08` + ShannonAirport$`2016M09` + ShannonAirport$`2016M10` + ShannonAirport$`2016M11` + ShannonAirport$`2016M12`
Shannon2016 <- sum(ShannonAirport$Shannon2016)

ShannonAirportNew <- data.frame(Shannon2013, Shannon2014, Shannon2015, Shannon2016)

CorkAirportNew$Cork2015 <- as.integer(CorkAirportNew$Cork2015)
CorkAirportNew$Cork2017 <- as.integer(CorkAirportNew$Cork2017)

CorkAirportNew$Year <- c("2013", "2014", "2015", "2016", "2017")
Co

ShannonAirportNew <- data.frame(year = c("2007","2008","2009","2010","2011","2012","2013", "2014", "2015", "2016"), Shannon = c(Shannon2007, Shannon2008,Shannon2009,Shannon2010,Shannon2011,Shannon2012,Shannon2013, Shannon2014,Shannon2015, Shannon2016))
ShannonAirportNew$year <- as.character(ShannonAirportNew$year)

#-----------------------------
# Sligo

# Sligo

library(htmltab)
url <- "http://www.cso.ie/px/pxeirestat/Statire/SelectOut/PxSort.asp?file=2018131163497335145CTM01&PLanguage=0&MainTable=CTM01&MainTablePrestext=Passenger%20Movement%20(Number)&potsize=124440"
SligoAirport <- htmltab(doc=url, which=1)
head(SligoAirport)

rownames(SligoAirport) <- c(1:1037)

head(SligoAirport)

SligoAirport <- SligoAirport[apply(SligoAirport!=0, 1, all),]

SligoAirport[is.na(SligoAirport)] <- 0


SligoAirport[2:121] <- lapply(SligoAirport[2:121], as.integer)

SligoAirport[1] <- NULL

SligoAirport$Sligo2007 <- SligoAirport$`2007M01`+ SligoAirport$`2007M02` + SligoAirport$`2007M03` + SligoAirport$`2007M04` + SligoAirport$`2007M05` + SligoAirport$`2007M06` + SligoAirport$`2007M07` + SligoAirport$`2007M08` + SligoAirport$`2007M09` + SligoAirport$`2007M10` + SligoAirport$`2007M11` + SligoAirport$`2007M12`
Sligo2007 <- sum(SligoAirport$Sligo2007)

SligoAirport$Sligo2008 <- SligoAirport$`2008M01`+ SligoAirport$`2008M02` + SligoAirport$`2008M03` + SligoAirport$`2008M04` + SligoAirport$`2008M05` + SligoAirport$`2008M06` + SligoAirport$`2008M07` + SligoAirport$`2008M08` + SligoAirport$`2008M09` + SligoAirport$`2008M10` + SligoAirport$`2008M11` + SligoAirport$`2008M12`
Sligo2008 <- sum(SligoAirport$Sligo2008)

SligoAirport$Sligo2009 <- SligoAirport$`2009M01`+ SligoAirport$`2009M02` + SligoAirport$`2009M03` + SligoAirport$`2009M04` + SligoAirport$`2009M05` + SligoAirport$`2009M06` + SligoAirport$`2009M07` + SligoAirport$`2009M08` + SligoAirport$`2009M09` + SligoAirport$`2009M10` + SligoAirport$`2009M11` + SligoAirport$`2009M12`
Sligo2009 <- sum(SligoAirport$Sligo2009)

SligoAirport$Sligo2010 <- SligoAirport$`2010M01`+ SligoAirport$`2010M02` + SligoAirport$`2010M03` + SligoAirport$`2010M04` + SligoAirport$`2010M05` + SligoAirport$`2010M06` + SligoAirport$`2010M07` + SligoAirport$`2010M08` + SligoAirport$`2010M09` + SligoAirport$`2010M10` + SligoAirport$`2010M11` + SligoAirport$`2010M12`
Sligo2010 <- sum(SligoAirport$Sligo2010)

SligoAirport$Sligo2011 <- SligoAirport$`2011M01`+ SligoAirport$`2011M02` + SligoAirport$`2011M03` + SligoAirport$`2011M04` + SligoAirport$`2011M05` + SligoAirport$`2011M06` + SligoAirport$`2011M07` + SligoAirport$`2011M08` + SligoAirport$`2011M09` + SligoAirport$`2011M10` + SligoAirport$`2011M11` + SligoAirport$`2011M12`
Sligo2011 <- sum(SligoAirport$Sligo2011)

SligoAirport$Sligo2012 <- SligoAirport$`2012M01`+ SligoAirport$`2012M02` + SligoAirport$`2012M03` + SligoAirport$`2012M04` + SligoAirport$`2012M05` + SligoAirport$`2012M06` + SligoAirport$`2012M07` + SligoAirport$`2012M08` + SligoAirport$`2012M09` + SligoAirport$`2012M10` + SligoAirport$`2012M11` + SligoAirport$`2012M12`
Sligo2012 <- sum(SligoAirport$Sligo2012)

SligoAirport$Sligo2013 <- SligoAirport$`2013M01`+ SligoAirport$`2013M02` + SligoAirport$`2013M03` + SligoAirport$`2013M04` + SligoAirport$`2013M05` + SligoAirport$`2013M06` + SligoAirport$`2013M07` + SligoAirport$`2013M08` + SligoAirport$`2013M09` + SligoAirport$`2013M10` + SligoAirport$`2013M11` + SligoAirport$`2013M12`
Sligo2013 <- sum(SligoAirport$Sligo2013)

SligoAirport$Sligo2014 <- SligoAirport$`2014M01`+ SligoAirport$`2014M02` + SligoAirport$`2014M03` + SligoAirport$`2014M04` + SligoAirport$`2014M05` + SligoAirport$`2014M06` + SligoAirport$`2014M07` + SligoAirport$`2014M08` + SligoAirport$`2014M09` + SligoAirport$`2014M10` + SligoAirport$`2014M11` + SligoAirport$`2014M12`
Sligo2014 <- sum(SligoAirport$Sligo2014)

SligoAirport$Sligo2015 <- SligoAirport$`2015M01`+ SligoAirport$`2015M02` + SligoAirport$`2015M03` + SligoAirport$`2015M04` + SligoAirport$`2015M05` + SligoAirport$`2015M06` + SligoAirport$`2015M07` + SligoAirport$`2015M08` + SligoAirport$`2015M09` + SligoAirport$`2015M10` + SligoAirport$`2015M11` + SligoAirport$`2015M12`
Sligo2015 <- sum(SligoAirport$Sligo2015)

SligoAirport$Sligo2016 <- SligoAirport$`2016M01`+ SligoAirport$`2016M02` + SligoAirport$`2016M03` + SligoAirport$`2016M04` + SligoAirport$`2016M05` + SligoAirport$`2016M06` + SligoAirport$`2016M07` + SligoAirport$`2016M08` + SligoAirport$`2016M09` + SligoAirport$`2016M10` + SligoAirport$`2016M11` + SligoAirport$`2016M12`
Sligo2016 <- sum(SligoAirport$Sligo2016)

SligoAirportNew <- data.frame(Sligo2013, Sligo2014, Sligo2015, Sligo2016)

CorkAirportNew$Cork2015 <- as.integer(CorkAirportNew$Cork2015)
CorkAirportNew$Cork2017 <- as.integer(CorkAirportNew$Cork2017)

CorkAirportNew$Year <- c("2013", "2014", "2015", "2016", "2017")
Co

SligoAirportNew <- data.frame(year = c("2007","2008","2009","2010","2011","2012","2013", "2014", "2015", "2016"), Sligo = c(Sligo2007, Sligo2008,Sligo2009,Sligo2010,Sligo2011,Sligo2012,Sligo2013, Sligo2014,Sligo2015, Sligo2016))
SligoAirportNew$year <- as.character(SligoAirportNew$year)

library(highcharter)
hc <- highchart() %>%
  hc_xAxis(categories = SligoAirportNew$year) %>%
  hc_add_series(name = "Passengers Sligo", data = SligoAirportNew$Sligo)
hc

#----------------
# Waterford 

library(htmltab)
url <- "http://www.cso.ie/px/pxeirestat/Statire/SelectOut/PxSort.asp?file=20181311637457335145CTM01&PLanguage=0&MainTable=CTM01&MainTablePrestext=Passenger%20Movement%20(Number)&potsize=124440"
WaterfordAirport <- htmltab(doc=url, which=1)
head(WaterfordAirport)

rownames(WaterfordAirport) <- c(1:1037)

head(WaterfordAirport)

WaterfordAirport <- WaterfordAirport[apply(WaterfordAirport!=0, 1, all),]

WaterfordAirport[is.na(WaterfordAirport)] <- 0


WaterfordAirport[2:121] <- lapply(WaterfordAirport[2:121], as.integer)

WaterfordAirport[1] <- NULL

WaterfordAirport$Waterford2007 <- WaterfordAirport$`2007M01`+ WaterfordAirport$`2007M02` + WaterfordAirport$`2007M03` + WaterfordAirport$`2007M04` + WaterfordAirport$`2007M05` + WaterfordAirport$`2007M06` + WaterfordAirport$`2007M07` + WaterfordAirport$`2007M08` + WaterfordAirport$`2007M09` + WaterfordAirport$`2007M10` + WaterfordAirport$`2007M11` + WaterfordAirport$`2007M12`
Waterford2007 <- sum(WaterfordAirport$Waterford2007)

WaterfordAirport$Waterford2008 <- WaterfordAirport$`2008M01`+ WaterfordAirport$`2008M02` + WaterfordAirport$`2008M03` + WaterfordAirport$`2008M04` + WaterfordAirport$`2008M05` + WaterfordAirport$`2008M06` + WaterfordAirport$`2008M07` + WaterfordAirport$`2008M08` + WaterfordAirport$`2008M09` + WaterfordAirport$`2008M10` + WaterfordAirport$`2008M11` + WaterfordAirport$`2008M12`
Waterford2008 <- sum(WaterfordAirport$Waterford2008)

WaterfordAirport$Waterford2009 <- WaterfordAirport$`2009M01`+ WaterfordAirport$`2009M02` + WaterfordAirport$`2009M03` + WaterfordAirport$`2009M04` + WaterfordAirport$`2009M05` + WaterfordAirport$`2009M06` + WaterfordAirport$`2009M07` + WaterfordAirport$`2009M08` + WaterfordAirport$`2009M09` + WaterfordAirport$`2009M10` + WaterfordAirport$`2009M11` + WaterfordAirport$`2009M12`
Waterford2009 <- sum(WaterfordAirport$Waterford2009)

WaterfordAirport$Waterford2010 <- WaterfordAirport$`2010M01`+ WaterfordAirport$`2010M02` + WaterfordAirport$`2010M03` + WaterfordAirport$`2010M04` + WaterfordAirport$`2010M05` + WaterfordAirport$`2010M06` + WaterfordAirport$`2010M07` + WaterfordAirport$`2010M08` + WaterfordAirport$`2010M09` + WaterfordAirport$`2010M10` + WaterfordAirport$`2010M11` + WaterfordAirport$`2010M12`
Waterford2010 <- sum(WaterfordAirport$Waterford2010)

WaterfordAirport$Waterford2011 <- WaterfordAirport$`2011M01`+ WaterfordAirport$`2011M02` + WaterfordAirport$`2011M03` + WaterfordAirport$`2011M04` + WaterfordAirport$`2011M05` + WaterfordAirport$`2011M06` + WaterfordAirport$`2011M07` + WaterfordAirport$`2011M08` + WaterfordAirport$`2011M09` + WaterfordAirport$`2011M10` + WaterfordAirport$`2011M11` + WaterfordAirport$`2011M12`
Waterford2011 <- sum(WaterfordAirport$Waterford2011)

WaterfordAirport$Waterford2012 <- WaterfordAirport$`2012M01`+ WaterfordAirport$`2012M02` + WaterfordAirport$`2012M03` + WaterfordAirport$`2012M04` + WaterfordAirport$`2012M05` + WaterfordAirport$`2012M06` + WaterfordAirport$`2012M07` + WaterfordAirport$`2012M08` + WaterfordAirport$`2012M09` + WaterfordAirport$`2012M10` + WaterfordAirport$`2012M11` + WaterfordAirport$`2012M12`
Waterford2012 <- sum(WaterfordAirport$Waterford2012)

WaterfordAirport$Waterford2013 <- WaterfordAirport$`2013M01`+ WaterfordAirport$`2013M02` + WaterfordAirport$`2013M03` + WaterfordAirport$`2013M04` + WaterfordAirport$`2013M05` + WaterfordAirport$`2013M06` + WaterfordAirport$`2013M07` + WaterfordAirport$`2013M08` + WaterfordAirport$`2013M09` + WaterfordAirport$`2013M10` + WaterfordAirport$`2013M11` + WaterfordAirport$`2013M12`
Waterford2013 <- sum(WaterfordAirport$Waterford2013)

WaterfordAirport$Waterford2014 <- WaterfordAirport$`2014M01`+ WaterfordAirport$`2014M02` + WaterfordAirport$`2014M03` + WaterfordAirport$`2014M04` + WaterfordAirport$`2014M05` + WaterfordAirport$`2014M06` + WaterfordAirport$`2014M07` + WaterfordAirport$`2014M08` + WaterfordAirport$`2014M09` + WaterfordAirport$`2014M10` + WaterfordAirport$`2014M11` + WaterfordAirport$`2014M12`
Waterford2014 <- sum(WaterfordAirport$Waterford2014)

WaterfordAirport$Waterford2015 <- WaterfordAirport$`2015M01`+ WaterfordAirport$`2015M02` + WaterfordAirport$`2015M03` + WaterfordAirport$`2015M04` + WaterfordAirport$`2015M05` + WaterfordAirport$`2015M06` + WaterfordAirport$`2015M07` + WaterfordAirport$`2015M08` + WaterfordAirport$`2015M09` + WaterfordAirport$`2015M10` + WaterfordAirport$`2015M11` + WaterfordAirport$`2015M12`
Waterford2015 <- sum(WaterfordAirport$Waterford2015)

WaterfordAirport$Waterford2016 <- WaterfordAirport$`2016M01`+ WaterfordAirport$`2016M02` + WaterfordAirport$`2016M03` + WaterfordAirport$`2016M04` + WaterfordAirport$`2016M05` + WaterfordAirport$`2016M06` + WaterfordAirport$`2016M07` + WaterfordAirport$`2016M08` + WaterfordAirport$`2016M09` + WaterfordAirport$`2016M10` + WaterfordAirport$`2016M11` + WaterfordAirport$`2016M12`
Waterford2016 <- sum(WaterfordAirport$Waterford2016)

WaterfordAirportNew <- data.frame(Waterford2013, Waterford2014, Waterford2015, Waterford2016)

CorkAirportNew$Cork2015 <- as.integer(CorkAirportNew$Cork2015)
CorkAirportNew$Cork2017 <- as.integer(CorkAirportNew$Cork2017)

CorkAirportNew$Year <- c("2013", "2014", "2015", "2016", "2017")
Co

WaterfordAirportNew <- data.frame(year = c("2007","2008","2009","2010","2011","2012","2013", "2014", "2015", "2016"), Waterford = c(Waterford2007, Waterford2008,Waterford2009,Waterford2010,Waterford2011,Waterford2012,Waterford2013, Waterford2014,Waterford2015, Waterford2016))
WaterfordAirportNew$year <- as.character(WaterfordAirportNew$year)


hc <- highchart() %>%
  hc_xAxis(categories = WaterfordAirportNew$year) %>%
  hc_add_series(name = "Passengers Wateford", data = WaterfordAirportNew$Waterford)
hc

#-----------------
# Knock

# Knock

library(htmltab)
url <- "http://www.cso.ie/px/pxeirestat/Statire/SelectOut/PxSort.asp?file=2018131164217335145CTM01&PLanguage=0&MainTable=CTM01&MainTablePrestext=Passenger%20Movement%20(Number)&potsize=124440"
KnockAirport <- htmltab(doc=url, which=1)
head(KnockAirport)

rownames(KnockAirport) <- c(1:1037)

head(KnockAirport)

KnockAirport <- KnockAirport[apply(KnockAirport!=0, 1, all),]

KnockAirport[is.na(KnockAirport)] <- 0


KnockAirport[2:121] <- lapply(KnockAirport[2:121], as.integer)

KnockAirport[1] <- NULL

KnockAirport$Knock2007 <- KnockAirport$`2007M01`+ KnockAirport$`2007M02` + KnockAirport$`2007M03` + KnockAirport$`2007M04` + KnockAirport$`2007M05` + KnockAirport$`2007M06` + KnockAirport$`2007M07` + KnockAirport$`2007M08` + KnockAirport$`2007M09` + KnockAirport$`2007M10` + KnockAirport$`2007M11` + KnockAirport$`2007M12`
Knock2007 <- sum(KnockAirport$Knock2007)

KnockAirport$Knock2008 <- KnockAirport$`2008M01`+ KnockAirport$`2008M02` + KnockAirport$`2008M03` + KnockAirport$`2008M04` + KnockAirport$`2008M05` + KnockAirport$`2008M06` + KnockAirport$`2008M07` + KnockAirport$`2008M08` + KnockAirport$`2008M09` + KnockAirport$`2008M10` + KnockAirport$`2008M11` + KnockAirport$`2008M12`
Knock2008 <- sum(KnockAirport$Knock2008)

KnockAirport$Knock2009 <- KnockAirport$`2009M01`+ KnockAirport$`2009M02` + KnockAirport$`2009M03` + KnockAirport$`2009M04` + KnockAirport$`2009M05` + KnockAirport$`2009M06` + KnockAirport$`2009M07` + KnockAirport$`2009M08` + KnockAirport$`2009M09` + KnockAirport$`2009M10` + KnockAirport$`2009M11` + KnockAirport$`2009M12`
Knock2009 <- sum(KnockAirport$Knock2009)

KnockAirport$Knock2010 <- KnockAirport$`2010M01`+ KnockAirport$`2010M02` + KnockAirport$`2010M03` + KnockAirport$`2010M04` + KnockAirport$`2010M05` + KnockAirport$`2010M06` + KnockAirport$`2010M07` + KnockAirport$`2010M08` + KnockAirport$`2010M09` + KnockAirport$`2010M10` + KnockAirport$`2010M11` + KnockAirport$`2010M12`
Knock2010 <- sum(KnockAirport$Knock2010)

KnockAirport$Knock2011 <- KnockAirport$`2011M01`+ KnockAirport$`2011M02` + KnockAirport$`2011M03` + KnockAirport$`2011M04` + KnockAirport$`2011M05` + KnockAirport$`2011M06` + KnockAirport$`2011M07` + KnockAirport$`2011M08` + KnockAirport$`2011M09` + KnockAirport$`2011M10` + KnockAirport$`2011M11` + KnockAirport$`2011M12`
Knock2011 <- sum(KnockAirport$Knock2011)

KnockAirport$Knock2012 <- KnockAirport$`2012M01`+ KnockAirport$`2012M02` + KnockAirport$`2012M03` + KnockAirport$`2012M04` + KnockAirport$`2012M05` + KnockAirport$`2012M06` + KnockAirport$`2012M07` + KnockAirport$`2012M08` + KnockAirport$`2012M09` + KnockAirport$`2012M10` + KnockAirport$`2012M11` + KnockAirport$`2012M12`
Knock2012 <- sum(KnockAirport$Knock2012)

KnockAirport$Knock2013 <- KnockAirport$`2013M01`+ KnockAirport$`2013M02` + KnockAirport$`2013M03` + KnockAirport$`2013M04` + KnockAirport$`2013M05` + KnockAirport$`2013M06` + KnockAirport$`2013M07` + KnockAirport$`2013M08` + KnockAirport$`2013M09` + KnockAirport$`2013M10` + KnockAirport$`2013M11` + KnockAirport$`2013M12`
Knock2013 <- sum(KnockAirport$Knock2013)

KnockAirport$Knock2014 <- KnockAirport$`2014M01`+ KnockAirport$`2014M02` + KnockAirport$`2014M03` + KnockAirport$`2014M04` + KnockAirport$`2014M05` + KnockAirport$`2014M06` + KnockAirport$`2014M07` + KnockAirport$`2014M08` + KnockAirport$`2014M09` + KnockAirport$`2014M10` + KnockAirport$`2014M11` + KnockAirport$`2014M12`
Knock2014 <- sum(KnockAirport$Knock2014)

KnockAirport$Knock2015 <- KnockAirport$`2015M01`+ KnockAirport$`2015M02` + KnockAirport$`2015M03` + KnockAirport$`2015M04` + KnockAirport$`2015M05` + KnockAirport$`2015M06` + KnockAirport$`2015M07` + KnockAirport$`2015M08` + KnockAirport$`2015M09` + KnockAirport$`2015M10` + KnockAirport$`2015M11` + KnockAirport$`2015M12`
Knock2015 <- sum(KnockAirport$Knock2015)

KnockAirport$Knock2016 <- KnockAirport$`2016M01`+ KnockAirport$`2016M02` + KnockAirport$`2016M03` + KnockAirport$`2016M04` + KnockAirport$`2016M05` + KnockAirport$`2016M06` + KnockAirport$`2016M07` + KnockAirport$`2016M08` + KnockAirport$`2016M09` + KnockAirport$`2016M10` + KnockAirport$`2016M11` + KnockAirport$`2016M12`
Knock2016 <- sum(KnockAirport$Knock2016)

KnockAirportNew <- data.frame(Knock2013, Knock2014, Knock2015, Knock2016)

CorkAirportNew$Cork2015 <- as.integer(CorkAirportNew$Cork2015)
CorkAirportNew$Cork2017 <- as.integer(CorkAirportNew$Cork2017)

CorkAirportNew$Year <- c("2013", "2014", "2015", "2016", "2017")
Co

KnockAirportNew <- data.frame(year = c("2007","2008","2009","2010","2011","2012","2013", "2014", "2015", "2016"), Knock = c(Knock2007, Knock2008,Knock2009,Knock2010,Knock2011,Knock2012,Knock2013, Knock2014,Knock2015, Knock2016))
KnockAirportNew$year <- as.character(KnockAirportNew$year)

hc <- highchart() %>%
  hc_xAxis(categories = KnockAirportNew$year) %>%
  hc_add_series(name = "Passengers Kerry", data = KnockAirportNew$Knock)
hc

#--------------
# Kerry

# Kerry

library(htmltab)
url <- "http://www.cso.ie/px/pxeirestat/Statire/SelectOut/PxSort.asp?file=20181311647177335145CTM01&PLanguage=0&MainTable=CTM01&MainTablePrestext=Passenger%20Movement%20(Number)&potsize=124440"
KerryAirport <- htmltab(doc=url, which=1)
head(KerryAirport)

rownames(KerryAirport) <- c(1:1037)

head(KerryAirport)

KerryAirport <- KerryAirport[apply(KerryAirport!=0, 1, all),]

KerryAirport[is.na(KerryAirport)] <- 0


KerryAirport[2:121] <- lapply(KerryAirport[2:121], as.integer)

KerryAirport[1] <- NULL

KerryAirport$Kerry2007 <- KerryAirport$`2007M01`+ KerryAirport$`2007M02` + KerryAirport$`2007M03` + KerryAirport$`2007M04` + KerryAirport$`2007M05` + KerryAirport$`2007M06` + KerryAirport$`2007M07` + KerryAirport$`2007M08` + KerryAirport$`2007M09` + KerryAirport$`2007M10` + KerryAirport$`2007M11` + KerryAirport$`2007M12`
Kerry2007 <- sum(KerryAirport$Kerry2007)

KerryAirport$Kerry2008 <- KerryAirport$`2008M01`+ KerryAirport$`2008M02` + KerryAirport$`2008M03` + KerryAirport$`2008M04` + KerryAirport$`2008M05` + KerryAirport$`2008M06` + KerryAirport$`2008M07` + KerryAirport$`2008M08` + KerryAirport$`2008M09` + KerryAirport$`2008M10` + KerryAirport$`2008M11` + KerryAirport$`2008M12`
Kerry2008 <- sum(KerryAirport$Kerry2008)

KerryAirport$Kerry2009 <- KerryAirport$`2009M01`+ KerryAirport$`2009M02` + KerryAirport$`2009M03` + KerryAirport$`2009M04` + KerryAirport$`2009M05` + KerryAirport$`2009M06` + KerryAirport$`2009M07` + KerryAirport$`2009M08` + KerryAirport$`2009M09` + KerryAirport$`2009M10` + KerryAirport$`2009M11` + KerryAirport$`2009M12`
Kerry2009 <- sum(KerryAirport$Kerry2009)

KerryAirport$Kerry2010 <- KerryAirport$`2010M01`+ KerryAirport$`2010M02` + KerryAirport$`2010M03` + KerryAirport$`2010M04` + KerryAirport$`2010M05` + KerryAirport$`2010M06` + KerryAirport$`2010M07` + KerryAirport$`2010M08` + KerryAirport$`2010M09` + KerryAirport$`2010M10` + KerryAirport$`2010M11` + KerryAirport$`2010M12`
Kerry2010 <- sum(KerryAirport$Kerry2010)

KerryAirport$Kerry2011 <- KerryAirport$`2011M01`+ KerryAirport$`2011M02` + KerryAirport$`2011M03` + KerryAirport$`2011M04` + KerryAirport$`2011M05` + KerryAirport$`2011M06` + KerryAirport$`2011M07` + KerryAirport$`2011M08` + KerryAirport$`2011M09` + KerryAirport$`2011M10` + KerryAirport$`2011M11` + KerryAirport$`2011M12`
Kerry2011 <- sum(KerryAirport$Kerry2011)

KerryAirport$Kerry2012 <- KerryAirport$`2012M01`+ KerryAirport$`2012M02` + KerryAirport$`2012M03` + KerryAirport$`2012M04` + KerryAirport$`2012M05` + KerryAirport$`2012M06` + KerryAirport$`2012M07` + KerryAirport$`2012M08` + KerryAirport$`2012M09` + KerryAirport$`2012M10` + KerryAirport$`2012M11` + KerryAirport$`2012M12`
Kerry2012 <- sum(KerryAirport$Kerry2012)

KerryAirport$Kerry2013 <- KerryAirport$`2013M01`+ KerryAirport$`2013M02` + KerryAirport$`2013M03` + KerryAirport$`2013M04` + KerryAirport$`2013M05` + KerryAirport$`2013M06` + KerryAirport$`2013M07` + KerryAirport$`2013M08` + KerryAirport$`2013M09` + KerryAirport$`2013M10` + KerryAirport$`2013M11` + KerryAirport$`2013M12`
Kerry2013 <- sum(KerryAirport$Kerry2013)

KerryAirport$Kerry2014 <- KerryAirport$`2014M01`+ KerryAirport$`2014M02` + KerryAirport$`2014M03` + KerryAirport$`2014M04` + KerryAirport$`2014M05` + KerryAirport$`2014M06` + KerryAirport$`2014M07` + KerryAirport$`2014M08` + KerryAirport$`2014M09` + KerryAirport$`2014M10` + KerryAirport$`2014M11` + KerryAirport$`2014M12`
Kerry2014 <- sum(KerryAirport$Kerry2014)

KerryAirport$Kerry2015 <- KerryAirport$`2015M01`+ KerryAirport$`2015M02` + KerryAirport$`2015M03` + KerryAirport$`2015M04` + KerryAirport$`2015M05` + KerryAirport$`2015M06` + KerryAirport$`2015M07` + KerryAirport$`2015M08` + KerryAirport$`2015M09` + KerryAirport$`2015M10` + KerryAirport$`2015M11` + KerryAirport$`2015M12`
Kerry2015 <- sum(KerryAirport$Kerry2015)

KerryAirport$Kerry2016 <- KerryAirport$`2016M01`+ KerryAirport$`2016M02` + KerryAirport$`2016M03` + KerryAirport$`2016M04` + KerryAirport$`2016M05` + KerryAirport$`2016M06` + KerryAirport$`2016M07` + KerryAirport$`2016M08` + KerryAirport$`2016M09` + KerryAirport$`2016M10` + KerryAirport$`2016M11` + KerryAirport$`2016M12`
Kerry2016 <- sum(KerryAirport$Kerry2016)

KerryAirportNew <- data.frame(Kerry2013, Kerry2014, Kerry2015, Kerry2016)

CorkAirportNew$Cork2015 <- as.integer(CorkAirportNew$Cork2015)
CorkAirportNew$Cork2017 <- as.integer(CorkAirportNew$Cork2017)

CorkAirportNew$Year <- c("2013", "2014", "2015", "2016", "2017")
Co

KerryAirportNew <- data.frame(year = c("2007","2008","2009","2010","2011","2012","2013", "2014", "2015", "2016"), Kerry = c(Kerry2007, Kerry2008,Kerry2009,Kerry2010,Kerry2011,Kerry2012,Kerry2013, Kerry2014,Kerry2015, Kerry2016))
KerryAirportNew$year <- as.character(KerryAirportNew$year)

#-------------

library(ggplot2)
Air <- ggplot(DublinAirportNew, aes(year, Dublin, group = 1)) + geom_line()
Air

#----------------------------------------------

#CREATING DATASET 

#----------------------------------------------

Inward <- data.frame( Airport = c(rep("Cork", 10),rep("Kerry", 10), rep("Knock", 10), rep("Shannon", 10), rep("Sligo", 10),rep("Waterford", 10),rep("Galway", 10),rep("Dublin", 10),rep("Donegal", 10)), 
                      Year = c(2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016,
                               2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016,
                               2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016,
                               2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016,
                               2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016,
                               2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016,
                               2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016,
                               2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016,
                               2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016),
                      Visitors = c(Cork2007, Cork2008, Cork2009, Cork2010, Cork2011, Cork2012, Cork2013, Cork2014, Cork2015, Cork2016,
                                   Kerry2007, Kerry2008, Kerry2009, Kerry2010, Kerry2011, Kerry2012, Kerry2013, Kerry2014, Kerry2015, Kerry2016,
                                   Knock2007, Knock2008, Knock2009, Knock2010, Knock2011, Knock2012, Knock2013, Knock2014, Knock2015, Knock2016,
                                   Shannon2007, Shannon2008, Shannon2009, Shannon2010, Shannon2011, Shannon2012, Shannon2013, Shannon2014, Shannon2015, Shannon2016,
                                   Sligo2007, Sligo2008, Sligo2009, Sligo2010, Sligo2011, Sligo2012, Sligo2013, Sligo2014, Sligo2015, Sligo2016,
                                   Waterford2007, Waterford2008, Waterford2009, Waterford2010, Waterford2011, Waterford2012, Waterford2013, Waterford2014, Waterford2015, Waterford2016,
                                   Galway2007, Galway2008, Galway2009, Galway2010, Galway2011, Galway2012, Galway2013, Galway2014, Galway2015, Galway2016,
                                   Dublin2007, Dublin2008, Dublin2009, Dublin2010, Dublin2011, Dublin2012, Dublin2013, Dublin2014, Dublin2015, Dublin2016,
                                   Donegal2007, Donegal2008, Donegal2009, Donegal2010, Donegal2011, Donegal2012, Donegal2013, Donegal2014, Donegal2015, Donegal2016))



write.csv(Inward, "C:\\Users\\Robbie\\Documents\\College\\GitHub\\SoftwareProjectExcel\\ProjectData\\InwardFlights.csv")


#--------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------
# RE-SCRPAING DATA FOR FURTHER ANALYSIS AS PREVIOUS URLS HAVE CHANGED

# DONEGAL ----------
library(htmltab)
url <- "http://www.cso.ie/px/pxeirestat/Statire/SelectOut/PxSort.asp?file=2018327119591236610CTM01&PLanguage=0&MainTable=CTM01&MainTablePrestext=Passenger%20Movement%20(Number)&potsize=137148"
DonegalAirport <- htmltab(doc=url, which=1)
head(DonegalAirport)

rownames(DonegalAirport) <- c(1:1039)

head(DonegalAirport)

DonegalAirport$Direction <- NULL

DonegalAirport$`Irish Airport` <- as.factor(DonegalAirport$`Irish Airport`)  
DonegalAirport$`Foreign Airport` <- as.factor(DonegalAirport$`Foreign Airport`)

#--------------------------
# DUBLIN

url <- "http://www.cso.ie/px/pxeirestat/Statire/SelectOut/PxSort.asp?file=2018327113171236610CTM01&PLanguage=0&MainTable=CTM01&MainTablePrestext=Passenger%20Movement%20(Number)&potsize=137148"
DublinAirport <- htmltab(doc=url, which=1)
head(DublinAirport)

rownames(DublinAirport) <- c(1:1039)

head(DublinAirport)

DublinAirport$Direction <- NULL

DublinAirport$`Irish Airport` <- as.factor(DublinAirport$`Irish Airport`)  
DublinAirport$`Foreign Airport` <- as.factor(DublinAirport$`Foreign Airport`)

#-------------------------
# GALWAY

url <- "http://www.cso.ie/px/pxeirestat/Statire/SelectOut/PxSort.asp?file=20183271137471236610CTM01&PLanguage=0&MainTable=CTM01&MainTablePrestext=Passenger%20Movement%20(Number)&potsize=137148"
GalwayAirport <- htmltab(doc=url, which=1)
head(GalwayAirport)

rownames(GalwayAirport) <- c(1:1039)

head(GalwayAirport)

GalwayAirport$Direction <- NULL

GalwayAirport$`Irish Airport` <- as.factor(GalwayAirport$`Irish Airport`)  
GalwayAirport$`Foreign Airport` <- as.factor(GalwayAirport$`Foreign Airport`)

#------------------------
# KERRY

url <- "http://www.cso.ie/px/pxeirestat/Statire/SelectOut/PxSort.asp?file=20183271141471236610CTM01&PLanguage=0&MainTable=CTM01&MainTablePrestext=Passenger%20Movement%20(Number)&potsize=137148"
KerryAirport <- htmltab(doc=url, which=1)
head(KerryAirport)

rownames(KerryAirport) <- c(1:1039)

head(KerryAirport)

KerryAirport$Direction <- NULL

KerryAirport$`Irish Airport` <- as.factor(KerryAirport$`Irish Airport`)  
KerryAirport$`Foreign Airport` <- as.factor(KerryAirport$`Foreign Airport`)

#------------------------
# KNOCK

url <- "http://www.cso.ie/px/pxeirestat/Statire/SelectOut/PxSort.asp?file=20183271146361236610CTM01&PLanguage=0&MainTable=CTM01&MainTablePrestext=Passenger%20Movement%20(Number)&potsize=137148"
KnockAirport <- htmltab(doc=url, which=1)
head(KnockAirport)

rownames(KnockAirport) <- c(1:1039)

head(KnockAirport)

KnockAirport$Direction <- NULL

KnockAirport$`Irish Airport` <- as.factor(KnockAirport$`Irish Airport`)  
KnockAirport$`Foreign Airport` <- as.factor(KnockAirport$`Foreign Airport`)

#------------------------
# CORK

url <- "http://www.cso.ie/px/pxeirestat/Statire/SelectOut/PxSort.asp?file=20183271150501236610CTM01&PLanguage=0&MainTable=CTM01&MainTablePrestext=Passenger%20Movement%20(Number)&potsize=137148"
CorkAirport <- htmltab(doc=url, which=1)
head(CorkAirport)

rownames(CorkAirport) <- c(1:1039)

head(CorkAirport)

CorkAirport$Direction <- NULL

CorkAirport$`Irish Airport` <- as.factor(CorkAirport$`Irish Airport`)  
CorkAirport$`Foreign Airport` <- as.factor(CorkAirport$`Foreign Airport`)

#------------------------
# SHANNON

url <- "http://www.cso.ie/px/pxeirestat/Statire/SelectOut/PxSort.asp?file=20183271153371236610CTM01&PLanguage=0&MainTable=CTM01&MainTablePrestext=Passenger%20Movement%20(Number)&potsize=137148"
ShannonAirport <- htmltab(doc=url, which=1)
head(ShannonAirport)

rownames(ShannonAirport) <- c(1:1039)

head(ShannonAirport)

ShannonAirport$Direction <- NULL

ShannonAirport$`Irish Airport` <- as.factor(ShannonAirport$`Irish Airport`)  
ShannonAirport$`Foreign Airport` <- as.factor(ShannonAirport$`Foreign Airport`)

#------------------------
# SLIGO

url <- "http://www.cso.ie/px/pxeirestat/Statire/SelectOut/PxSort.asp?file=20183271156521236610CTM01&PLanguage=0&MainTable=CTM01&MainTablePrestext=Passenger%20Movement%20(Number)&potsize=137148"
SligoAirport <- htmltab(doc=url, which=1)
head(SligoAirport)

rownames(SligoAirport) <- c(1:1039)

head(SligoAirport)

SligoAirport$Direction <- NULL

SligoAirport$`Irish Airport` <- as.factor(SligoAirport$`Irish Airport`)  
SligoAirport$`Foreign Airport` <- as.factor(SligoAirport$`Foreign Airport`)

#------------------------
# WATERFORD

url <- "http://www.cso.ie/px/pxeirestat/Statire/SelectOut/PxSort.asp?file=2018327120281236610CTM01&PLanguage=0&MainTable=CTM01&MainTablePrestext=Passenger%20Movement%20(Number)&potsize=137148"
WaterfordAirport <- htmltab(doc=url, which=1)
head(WaterfordAirport)

rownames(WaterfordAirport) <- c(1:1039)

head(WaterfordAirport)

WaterfordAirport$Direction <- NULL

WaterfordAirport$`Irish Airport` <- as.factor(WaterfordAirport$`Irish Airport`)  
WaterfordAirport$`Foreign Airport` <- as.factor(WaterfordAirport$`Foreign Airport`)

#---------------------------------------------------
#---------------------------------------------------
#---------------------------------------------------
#---------------------------------------------------
# END OF SCRAPING.

AllIrishAirport <- rbind(CorkAirport,DonegalAirport,DublinAirport,GalwayAirport,KerryAirport,KnockAirport,ShannonAirport,SligoAirport,WaterfordAirport)

AllIrishAirport[3:134] <- lapply(AllIrishAirport[3:134], as.integer)

AllIrishAirport <- replace(AllIrishAirport,is.na(AllIrishAirport),0)

AirportMonths$Month = factor(AirportMonths$Month, levels = month.name)

AirportMonths$Month <- sort(AirportMonths$Month)

library(dplyr)
AirportMonths <- AirportMonths %>% 
  mutate(Month = factor(month.name[Month], levels = month.name)) %>% 
  arrange(Month)



write.csv(AllIrishAirport, "C:\\Users\\Robbie\\Documents\\College\\GitHub\\SoftwareProjectExcel\\ProjectData\\Collected\\flights\\AllAirports.csv")
write.csv(AirportMonths, "C:\\Users\\Robbie\\Documents\\College\\GitHub\\SoftwareProjectExcel\\ProjectData\\Collected\\flights\\AirportMonths.csv")

save(AllIrishAirport, file="C:\\Users\\Robbie\\Documents\\College\\GitHub\\SoftwareProject\\SavedObjects\\flights\\AllIrishAirports.Rdata")
save(AirportMonths, file="C:\\Users\\Robbie\\Documents\\College\\GitHub\\SoftwareProject\\SavedObjects\\flights\\AirportMonths.Rdata")

load("C:\\Users\\Robbie\\Documents\\College\\GitHub\\SoftwareProject\\SavedObjects\\flights\\AllIrishAirports.Rdata")


January <- sum(AllIrishAirport$`2007M01`,AllIrishAirport$`2008M01`,AllIrishAirport$`2009M01`,AllIrishAirport$`2010M01`,AllIrishAirport$`2011M01`,AllIrishAirport$`2012M01`,AllIrishAirport$`2013M01`,AllIrishAirport$`2014M01`,AllIrishAirport$`2015M01`,AllIrishAirport$`2016M01`)
February <- sum(AllIrishAirport$`2007M02`,AllIrishAirport$`2008M02`,AllIrishAirport$`2009M02`,AllIrishAirport$`2010M02`,AllIrishAirport$`2011M02`,AllIrishAirport$`2012M02`,AllIrishAirport$`2013M02`,AllIrishAirport$`2014M02`,AllIrishAirport$`2015M02`,AllIrishAirport$`2016M02`)
March <- sum(AllIrishAirport$`2007M03`,AllIrishAirport$`2008M03`,AllIrishAirport$`2009M03`,AllIrishAirport$`2010M03`,AllIrishAirport$`2011M03`,AllIrishAirport$`2012M03`,AllIrishAirport$`2013M03`,AllIrishAirport$`2014M03`,AllIrishAirport$`2015M03`,AllIrishAirport$`2016M03`)
April <- sum(AllIrishAirport$`2007M04`,AllIrishAirport$`2008M04`,AllIrishAirport$`2009M04`,AllIrishAirport$`2010M04`,AllIrishAirport$`2011M04`,AllIrishAirport$`2012M04`,AllIrishAirport$`2013M04`,AllIrishAirport$`2014M04`,AllIrishAirport$`2015M04`,AllIrishAirport$`2016M04`)
May <- sum(AllIrishAirport$`2007M05`,AllIrishAirport$`2008M05`,AllIrishAirport$`2009M05`,AllIrishAirport$`2010M05`,AllIrishAirport$`2011M05`,AllIrishAirport$`2012M05`,AllIrishAirport$`2013M05`,AllIrishAirport$`2014M05`,AllIrishAirport$`2015M05`,AllIrishAirport$`2016M05`)
June <- sum(AllIrishAirport$`2007M06`,AllIrishAirport$`2008M06`,AllIrishAirport$`2009M06`,AllIrishAirport$`2010M06`,AllIrishAirport$`2011M06`,AllIrishAirport$`2012M06`,AllIrishAirport$`2013M06`,AllIrishAirport$`2014M06`,AllIrishAirport$`2015M06`,AllIrishAirport$`2016M06`)
July <- sum(AllIrishAirport$`2007M07`,AllIrishAirport$`2008M07`,AllIrishAirport$`2009M07`,AllIrishAirport$`2010M07`,AllIrishAirport$`2011M07`,AllIrishAirport$`2012M07`,AllIrishAirport$`2013M07`,AllIrishAirport$`2014M07`,AllIrishAirport$`2015M07`,AllIrishAirport$`2016M07`)
August <- sum(AllIrishAirport$`2007M08`,AllIrishAirport$`2008M08`,AllIrishAirport$`2009M08`,AllIrishAirport$`2010M08`,AllIrishAirport$`2011M08`,AllIrishAirport$`2012M08`,AllIrishAirport$`2013M08`,AllIrishAirport$`2014M08`,AllIrishAirport$`2015M08`,AllIrishAirport$`2016M08`)
September <- sum(AllIrishAirport$`2007M09`,AllIrishAirport$`2008M09`,AllIrishAirport$`2009M09`,AllIrishAirport$`2010M09`,AllIrishAirport$`2011M09`,AllIrishAirport$`2012M09`,AllIrishAirport$`2013M09`,AllIrishAirport$`2014M09`,AllIrishAirport$`2015M09`,AllIrishAirport$`2016M09`)
October <- sum(AllIrishAirport$`2007M10`,AllIrishAirport$`2008M10`,AllIrishAirport$`2009M10`,AllIrishAirport$`2010M10`,AllIrishAirport$`2011M10`,AllIrishAirport$`2012M10`,AllIrishAirport$`2013M10`,AllIrishAirport$`2014M10`,AllIrishAirport$`2015M10`,AllIrishAirport$`2016M10`)
November <- sum(AllIrishAirport$`2007M11`,AllIrishAirport$`2008M11`,AllIrishAirport$`2009M11`,AllIrishAirport$`2010M11`,AllIrishAirport$`2011M11`,AllIrishAirport$`2012M11`,AllIrishAirport$`2013M11`,AllIrishAirport$`2014M11`,AllIrishAirport$`2015M11`,AllIrishAirport$`2016M11`)
December <- sum(AllIrishAirport$`2007M12`,AllIrishAirport$`2008M12`,AllIrishAirport$`2009M12`,AllIrishAirport$`2010M12`,AllIrishAirport$`2011M12`,AllIrishAirport$`2012M12`,AllIrishAirport$`2013M12`,AllIrishAirport$`2014M12`,AllIrishAirport$`2015M12`,AllIrishAirport$`2016M12`)

AirportMonths <- data.frame(Month = c("January","February","March","April","May","June","July","August","September","October","November","December"),
                               Visitors= c(January,February,March,April,May,June,July,August,September,October,November,December))

#--------------------------------------------------------------
#--------------------------------------------------------------
# FINDING MOST POPULAR AIRPORTS TO FLY IN FROM.

ForeignAirport <- read.csv("C:\\Users\\Robbie\\Documents\\College\\GitHub\\SoftwareProject\\SoftwareProject\\Shiny\\data\\ForeignAirports.csv")

airport <- airport[apply(airport!=0, 1, all),]

airport$Irish.Airport <- NULL

airport$Foreign.Airport


ForeignAirport <- as.data.frame(tapply(airport$X2007M01+airport$X2007M02+airport$X2007M03+airport$X2007M04+airport$X2007M05+airport$X2007M06+airport$X2007M07+airport$X2007M08+airport$X2007M09+airport$X2007M10+airport$X2007M11+airport$X2007M12+
                             airport$X2008M01+airport$X2008M02+airport$X2008M03+airport$X2008M04+airport$X2008M05+airport$X2008M06+airport$X2008M07+airport$X2008M08+airport$X2008M09+airport$X2008M10+airport$X2008M11+airport$X2008M12+
                             airport$X2009M01+airport$X2009M02+airport$X2009M03+airport$X2009M04+airport$X2009M05+airport$X2009M06+airport$X2009M07+airport$X2009M08+airport$X2009M09+airport$X2009M10+airport$X2009M11+airport$X2009M12+
                             airport$X2010M01+airport$X2010M02+airport$X2010M03+airport$X2010M04+airport$X2010M05+airport$X2010M06+airport$X2010M07+airport$X2010M08+airport$X2010M09+airport$X2010M10+airport$X2010M11+airport$X2010M12+
                             airport$X2011M01+airport$X2011M02+airport$X2011M03+airport$X2011M04+airport$X2011M05+airport$X2011M06+airport$X2011M07+airport$X2011M08+airport$X2011M09+airport$X2011M10+airport$X2011M11+airport$X2011M12+
                             airport$X2012M01+airport$X2012M02+airport$X2012M03+airport$X2012M04+airport$X2012M05+airport$X2012M06+airport$X2012M07+airport$X2012M08+airport$X2012M09+airport$X2012M10+airport$X2012M11+airport$X2012M12+
                             airport$X2013M01+airport$X2013M02+airport$X2013M03+airport$X2013M04+airport$X2013M05+airport$X2013M06+airport$X2013M07+airport$X2013M08+airport$X2013M09+airport$X2013M10+airport$X2013M11+airport$X2013M12+
                             airport$X2014M01+airport$X2014M02+airport$X2014M03+airport$X2014M04+airport$X2014M05+airport$X2014M06+airport$X2014M07+airport$X2014M08+airport$X2014M09+airport$X2014M10+airport$X2014M11+airport$X2014M12+
                             airport$X2015M01+airport$X2015M02+airport$X2015M03+airport$X2015M04+airport$X2015M05+airport$X2015M06+airport$X2015M07+airport$X2015M08+airport$X2015M09+airport$X2015M10+airport$X2015M11+airport$X2015M12+
                             airport$X2016M01+airport$X2016M02+airport$X2016M03+airport$X2016M04+airport$X2016M05+airport$X2016M06+airport$X2016M07+airport$X2016M08+airport$X2016M09+airport$X2016M10+airport$X2016M11+airport$X2016M12,list(airport$Foreign.Airport),sum,na.rm=T))


library(highcharter)

hc <- highchart() %>%
  hc_xAxis(categories = flightYear$year) %>%
  hc_add_series(name = "Inward Passengers Dublin", data = flightyear$Dublin) %>%
  hc_add_series(name = "Inward Passengers Cork", data = flightyear$Cork) %>%
  hc_add_series(name = "Inward Passengers Shannon", data = flightyear$Shannon) %>%
  hc


