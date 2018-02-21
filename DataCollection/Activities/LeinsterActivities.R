library(rvest)

#-- Dublin Activities --

DublinActivities <- read_html("https://www.tripadvisor.ie/Attractions-g186605-Activities-Dublin_County_Dublin.html")

DublinActivities <- DublinActivities %>% html_nodes('.multifilter:nth-child(4) .taLnk , .filter_list_0 > .multifilter~ .multifilter+ .multifilter .taLnk , .filter_list_0 .multifilter:nth-child(1) .taLnk') %>% html_text()

DublinActivities

#-- Kilkenny Activities --

KilkennyActivities <- read_html("https://www.tripadvisor.ie/Attractions-g186616-Activities-Kilkenny_County_Kilkenny.html")

KilkennyActivities <- KilkennyActivities %>% html_nodes('.filter_list_0 > .multifilter:nth-child(2) .taLnk , .filter_list_0 > .multifilter:nth-child(3) .taLnk , .filter_list_0 > .multifilter:nth-child(4) .taLnk , .filter_list_0 > .multifilter:nth-child(5) .taLnk , .filter_list_0 > .multifilter:nth-child(7) .taLnk , .multifilter:nth-child(1) .taLnk') %>% html_text()

KilkennyActivities

#-- wexford Activities --

WexfordActivities <- read_html("https://www.tripadvisor.ie/Attractions-g186643-Activities-Wexford_County_Wexford.html")

WexfordActivities <- WexfordActivities %>% html_nodes('.filter_list_0 > .multifilter:nth-child(5) .taLnk , .multifilter:nth-child(4) .taLnk , .collapse .multifilter:nth-child(2) .taLnk , .multifilter:nth-child(3) .taLnk , .filter_list_0 > .multifilter:nth-child(1) .taLnk') %>% html_text()

WexfordActivities

#-- Kildare Activities -- 

KildareActivities <- read_html("https://www.tripadvisor.ie/Attractions-g186614-Activities-County_Kildare.html")

KildareActivities <- KildareActivities %>% html_nodes('.collapse .multifilter:nth-child(5) .taLnk , .filter_list_0 > .multifilter:nth-child(4) .taLnk , .filter_list_0 > .multifilter:nth-child(3) .taLnk , .filter_list_0 > .multifilter:nth-child(2) .taLnk , .filter_list_0 > .multifilter:nth-child(7) .taLnk , .multifilter:nth-child(1) .taLnk') %>% html_text()

KildareActivities

#-- Meath Activities --

MeathActivities <- read_html("https://www.tripadvisor.ie/Attractions-g186628-Activities-County_Meath.html")

MeathActivities <- MeathActivities %>% html_nodes('.collapse .multifilter:nth-child(5) .taLnk , .multifilter:nth-child(2) .taLnk , .filter_list_0 > .multifilter:nth-child(7) .taLnk , .multifilter:nth-child(4) .taLnk , .filter_list_0 > .multifilter:nth-child(1) .taLnk') %>% html_text()

MeathActivities

#-- westmeath Activities --

westMeathActivities <- read_html("https://www.tripadvisor.ie/Attractions-g186639-Activities-County_Westmeath.html")

westMeathActivities <- westMeathActivities %>% html_nodes('.filter_list_0 > .multifilter:nth-child(3) .taLnk , .filter_list_0 > .multifilter:nth-child(5) .taLnk , .multifilter:nth-child(4) .taLnk , .multifilter:nth-child(2) .taLnk , .filter_list_0 > .multifilter:nth-child(1) .taLnk') %>% html_text()

westMeathActivities

#-- Laois Activities --

LaoisActivities <- read_html("https://www.tripadvisor.ie/Attractions-g186617-Activities-County_Laois.html")

LaoisActivities <- LaoisActivities %>% html_nodes('.multifilter:nth-child(6) .taLnk , .multifilter:nth-child(4) .taLnk , .multifilter:nth-child(3) .taLnk , .filter_list_0 > .multifilter:nth-child(2) .taLnk , .multifilter:nth-child(1) .taLnk') %>% html_text()

LaoisActivities

#-- Longford Activities --

LongfordActivities <- read_html("https://www.tripadvisor.ie/Attractions-g186622-Activities-County_Longford.html")

LongfordActivities <- LongfordActivities %>% html_nodes('.collapse .multifilter+ .multifilter .taLnk , .multifilter:nth-child(7) .taLnk , .multifilter:nth-child(4) .taLnk , .multifilter:nth-child(3) .taLnk , .filter_list_0 > .multifilter:nth-child(1) .taLnk') %>% html_text()

LongfordActivities

#-- Louth Activities --

LouthActivities <- read_html("https://www.tripadvisor.ie/Attractions-g186623-Activities-County_Louth.html")

LouthActivities <- LouthActivities %>% html_nodes('.collapse .multifilter:nth-child(7) .taLnk , .collapse .multifilter:nth-child(3) .taLnk , .collapse .multifilter:nth-child(2) .taLnk , .filter_list_0 > .multifilter:nth-child(6) .taLnk , .filter_list_0 > .multifilter:nth-child(5) .taLnk , .filter_list_0 > .multifilter:nth-child(4) .taLnk , .filter_list_0 > .multifilter:nth-child(1) .taLnk') %>% html_text()

LouthActivities

#-- Offaly Activities --
OffalyActivities <- read_html("https://www.tripadvisor.ie/Attractions-g186631-Activities-County_Offaly.html")

OffalyActivities <- OffalyActivities %>% html_nodes('.filter_list_0 > .multifilter:nth-child(5) .taLnk , .multifilter:nth-child(4) .taLnk , .filter_list_0 > .multifilter:nth-child(3) .taLnk , .filter_list_0 > .multifilter:nth-child(2) .taLnk , .multifilter:nth-child(1) .taLnk') %>% html_text()

OffalyActivities

#-- Carlow Activities --
CarlowActivities <- read_html("https://www.tripadvisor.ie/Attractions-g186593-Activities-County_Carlow.html")

CarlowActivities <- CarlowActivities %>% html_nodes('.multifilter:nth-child(6) .taLnk , .filter_list_0 > .multifilter:nth-child(5) .taLnk , .filter_list_0 > .multifilter:nth-child(4) .taLnk , .filter_list_0 > .multifilter:nth-child(3) .taLnk , .multifilter:nth-child(2) .taLnk , .filter_list_0 > .multifilter:nth-child(1) .taLnk') %>% html_text()

CarlowActivities

#-- Wicklow Activities --
WicklowActivities <- read_html("https://www.tripadvisor.ie/Attractions-g186644-Activities-County_Wicklow.html")

WicklowActivities <- WicklowActivities %>% html_nodes('.multifilter:nth-child(4) .taLnk , .filter_list_0 > .multifilter:nth-child(6) .taLnk , .filter_list_0 > .multifilter:nth-child(5) .taLnk , .filter_list_0 > .multifilter:nth-child(3) .taLnk , .filter_list_0 > .multifilter:nth-child(2) .taLnk , .multifilter:nth-child(1) .taLnk') %>% html_text()

WicklowActivities


barplot(table(Activities$county, Activities$sights))

library("highcharter")

hc <- highchart() %>%
  hc_xAxis(categories = Activities$county) %>%
  hc_add_series(name = "Sights", data = Activities$sights) %>%
hc_add_series(name = "Museums", data = Activities$museums) %>%
hc_add_series(name = "F&D", data = Activities$`food&drink`) %>%
hc_add_series(name = "Nightlife", data = Activities$nightlife) %>%
hc_add_series(name = "Nature", data = Activities$nature) %>%
hc_add_series(name = "Outdoor Act.", data = Activities$outdoorAct) %>%
hc_add_series(name = "Shopping", data = Activities$shopping) 

hc
