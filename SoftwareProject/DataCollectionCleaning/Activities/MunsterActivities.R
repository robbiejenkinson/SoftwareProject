library(rvest)

#-- Cork Activities --

CorkActivities <- read_html("https://www.tripadvisor.ie/Attractions-g186598-Activities-County_Cork.html")

CorkActivities <- CorkActivities %>% html_nodes('.filter_list_0 > .multifilter:nth-child(7) .taLnk , .filter_list_0 > .multifilter:nth-child(6) .taLnk , .filter_list_0 > .multifilter:nth-child(3) .taLnk , .multifilter:nth-child(2) .taLnk , .filter_list_0 > .multifilter:nth-child(5) .taLnk , .filter_list_0 > .multifilter:nth-child(1) .taLnk') %>% html_text()

CorkActivities

#-- Clare Activities --

ClareActivities <- read_html("https://www.tripadvisor.ie/Attractions-g186595-Activities-County_Clare.html")

ClareActivities <- ClareActivities %>% html_nodes('.filter_list_0 > .multifilter:nth-child(7) .taLnk , .filter_list_0 > .multifilter:nth-child(3) .taLnk , .multifilter:nth-child(2) .taLnk , .collapse .multifilter:nth-child(5) .taLnk , .multifilter:nth-child(1) .taLnk') %>% html_text()

ClareActivities

#-- Kerry Activities --

KerryActivities <- read_html("https://www.tripadvisor.ie/Attractions-g186610-Activities-County_Kerry.html")

KerryActivities <- KerryActivities %>% html_nodes('.filter_list_0 > .multifilter:nth-child(7) .taLnk , .filter_list_0 > .multifilter:nth-child(6) .taLnk , .multifilter:nth-child(3) .taLnk , .filter_list_0 > .multifilter:nth-child(2) .taLnk , .multifilter:nth-child(1) .taLnk') %>% html_text()

KerryActivities

#-- Waterford Activities --

WaterfordActivities <- read_html("https://www.tripadvisor.ie/Attractions-g186637-Activities-County_Waterford.html")

WaterfordActivities <- WaterfordActivities %>% html_nodes('.multifilter:nth-child(10) .taLnk , .filter_list_0 > .multifilter:nth-child(5) .taLnk , .multifilter:nth-child(4) .taLnk , .filter_list_0 > .multifilter:nth-child(3) .taLnk , .filter_list_0 > .multifilter:nth-child(7) .taLnk , .filter_list_0 > .multifilter:nth-child(2) .taLnk') %>% html_text()

WaterfordActivities

#-- Limerick Activities --

LimerickActivities <- read_html("https://www.tripadvisor.ie/Attractions-g186619-Activities-County_Limerick.html")

LimerickActivities <- LimerickActivities %>% html_nodes('.collapse .multifilter:nth-child(6) .taLnk , .filter_list_0 > .multifilter:nth-child(7) .taLnk , .filter_list_0 > .multifilter:nth-child(5) .taLnk , .multifilter:nth-child(2) .taLnk , .filter_list_0 > .multifilter:nth-child(4) .taLnk , .filter_list_0 > .multifilter:nth-child(1) .taLnk') %>% html_text()

LimerickActivities

#-- Tipperary Activities --

TipperaryActivities <- read_html("https://www.tripadvisor.ie/Attractions-g186636-Activities-County_Tipperary.html")

TipperaryActivities <- TipperaryActivities %>% html_nodes('.multifilter:nth-child(9) .taLnk , .collapse .multifilter:nth-child(6) .taLnk , .filter_list_0 > .multifilter:nth-child(5) .taLnk , .filter_list_0 > .multifilter:nth-child(4) .taLnk , .filter_list_0 > .multifilter:nth-child(3) .taLnk , .filter_list_0 > .multifilter:nth-child(2) .taLnk , .filter_list_0 > .multifilter:nth-child(1) .taLnk') %>% html_text()

TipperaryActivities
