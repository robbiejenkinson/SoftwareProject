library(rvest)
#-- Galway Activities --

GalwayActivities <- read_html("https://www.tripadvisor.ie/Attractions-g186607-Activities-County_Galway_Western_Ireland.html")

GalwayActivities <- GalwayActivities %>% html_nodes('.multifilter:nth-child(10) .taLnk , .collapse .multifilter:nth-child(3) .taLnk , .filter_list_0 > .multifilter:nth-child(5) .taLnk , .multifilter:nth-child(2) .taLnk , .filter_list_0 > .multifilter:nth-child(4) .taLnk , .filter_list_0 > .multifilter:nth-child(1) .taLnk') %>% html_text()

GalwayActivities

#-- Leitrim Activities --

LeitrimActivities <- read_html("https://www.tripadvisor.ie/Attractions-g186618-Activities-County_Leitrim_Western_Ireland.html")

LeitrimActivities <- LeitrimActivities %>% html_nodes('.collapse .multifilter:nth-child(4) .taLnk , .filter_list_0 > .multifilter:nth-child(7) .taLnk , .filter_list_0 > .multifilter:nth-child(5) .taLnk , .filter_list_0 > .multifilter:nth-child(3) .taLnk , .multifilter:nth-child(2) .taLnk , .filter_list_0 > .multifilter:nth-child(1) .taLnk') %>% html_text()

LeitrimActivities

#-- Mayo Activities --

MayoActivities <- read_html("https://www.tripadvisor.ie/Attractions-g186625-Activities-County_Mayo_Western_Ireland.html")

MayoActivities <- MayoActivities %>% html_nodes('.collapse .multifilter:nth-child(6) .taLnk , .multifilter:nth-child(5) .taLnk , .filter_list_0 > .multifilter:nth-child(3) .taLnk , .filter_list_0 > .multifilter:nth-child(2) .taLnk , .multifilter:nth-child(1) .taLnk') %>% html_text()

MayoActivities

#-- Roscommon Activities --

RoscommonActivities <- read_html("https://www.tripadvisor.ie/Attractions-g186633-Activities-County_Roscommon_Western_Ireland.html")

RoscommonActivities <- RoscommonActivities %>% html_nodes('.filter_list_0 > .multifilter:nth-child(7) .taLnk , .filter_list_0 > .multifilter:nth-child(6) .taLnk , .multifilter:nth-child(5) .taLnk , .filter_list_0 > .multifilter:nth-child(3) .taLnk , .multifilter:nth-child(1) .taLnk') %>% html_text()

RoscommonActivities

#-- Sligo Activities --

SligoActivities <- read_html("https://www.tripadvisor.ie/Attractions-g186634-Activities-County_Sligo_Western_Ireland.html")

SligoActivities <- SligoActivities %>% html_nodes('.collapse .multifilter:nth-child(6) .taLnk , .filter_list_0 > .multifilter:nth-child(7) .taLnk , .filter_list_0 > .multifilter:nth-child(3) .taLnk , .multifilter:nth-child(2) .taLnk , .multifilter:nth-child(1) .taLnk') %>% html_text()

SligoActivities
