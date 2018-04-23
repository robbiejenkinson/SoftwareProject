library(rvest)
#-- Donegal Activities --

DonegalActivities <- read_html("https://www.tripadvisor.ie/Attractions-g186601-Activities-County_Donegal.html")

DonegalActivities <- DonegalActivities %>% html_nodes('.multifilter:nth-child(10) .taLnk , .filter_list_0 > .multifilter:nth-child(6) .taLnk , .filter_list_0 > .multifilter:nth-child(5) .taLnk , .filter_list_0 > .multifilter:nth-child(3) .taLnk , .multifilter:nth-child(2) .taLnk , .filter_list_0 > .multifilter:nth-child(1) .taLnk') %>% html_text()

DonegalActivities 

#-- Cavan Activities --

CavanActivities <- read_html("https://www.tripadvisor.ie/Attractions-g186594-Activities-County_Cavan.html")

CavanActivities <- CavanActivities %>% html_nodes('.filter_list_0 > .multifilter:nth-child(4) .taLnk , .filter_list_0 > .multifilter:nth-child(5) .taLnk , .multifilter:nth-child(3) .taLnk , .filter_list_0 > .multifilter:nth-child(1) .taLnk') %>% html_text()

CavanActivities

#-- Monaghan Activities --

MonaghanActivities <- read_html("https://www.tripadvisor.ie/Attractions-g186629-Activities-County_Monaghan.html")

MonaghanActivities <- MonaghanActivities %>% html_nodes('.filter_list_0 > .multifilter:nth-child(5) .taLnk , .filter_list_0 > .multifilter:nth-child(6) .taLnk , .collapse .multifilter:nth-child(2) .taLnk , .filter_list_0 > .multifilter:nth-child(4) .taLnk , .multifilter:nth-child(1) .taLnk') %>% html_text()

MonaghanActivities

#-- Fermanagh Activities --

FermanaghActivities <- read_html("https://www.tripadvisor.ie/Attractions-g186480-Activities-County_Fermanagh_Northern_Ireland.html")

FermanaghActivities <- FermanaghActivities %>% html_nodes('.filter_list_0 > .multifilter:nth-child(6) .taLnk , .multifilter:nth-child(5) .taLnk , .filter_list_0 > .multifilter:nth-child(4) .taLnk , .filter_list_0 > .multifilter:nth-child(2) .taLnk , .multifilter:nth-child(1) .taLnk') %>% html_text()

FermanaghActivities

#-- Tyrone Activities --

TyroneActivities <- read_html("https://www.tripadvisor.ie/Attractions-g186483-Activities-County_Tyrone_Northern_Ireland.html")

TyroneActivities <- TyroneActivities %>% html_nodes('.collapse .multifilter:nth-child(7) .taLnk , .filter_list_0 > .multifilter:nth-child(6) .taLnk , .filter_list_0 > .multifilter:nth-child(4) .taLnk , .filter_list_0 > .multifilter:nth-child(3) .taLnk , .multifilter:nth-child(2) .taLnk , .filter_list_0 > .multifilter:nth-child(1) .taLnk') %>% html_text()

TyroneActivities

#-- Derry Activities --

DerryActivities <- read_html("https://www.tripadvisor.ie/Attractions-g186481-Activities-County_Londonderry_Northern_Ireland.html")

DerryActivities <- DerryActivities %>% html_nodes('.collapse .multifilter:nth-child(3) .taLnk , .multifilter:nth-child(6) .taLnk , .filter_list_0 > .multifilter:nth-child(5) .taLnk , .filter_list_0 > .multifilter:nth-child(4) .taLnk , .multifilter:nth-child(1) .taLnk') %>% html_text()

DerryActivities

#-- Antrim Activities --

AntrimActivities <- read_html("https://www.tripadvisor.ie/Attractions-g186471-Activities-County_Antrim_Northern_Ireland.html")

AntrimActivities <- AntrimActivities %>% html_nodes('.collapse .multifilter:nth-child(7) .taLnk , .collapse .multifilter:nth-child(5) .taLnk , .collapse .multifilter:nth-child(4) .taLnk , .filter_list_0 > .multifilter:nth-child(6) .taLnk , .filter_list_0 > .multifilter:nth-child(3) .taLnk , .filter_list_0 > .multifilter:nth-child(2) .taLnk , .filter_list_0 > .multifilter:nth-child(1) .taLnk') %>% html_text()

AntrimActivities

#-- Down Activities --

DownActivities <- read_html("https://www.tripadvisor.ie/Attractions-g186475-Activities-County_Down_Northern_Ireland.html")

DownActivities <- DownActivities %>% html_nodes('.collapse .multifilter:nth-child(7) .taLnk , .filter_list_0 > .multifilter:nth-child(5) .taLnk , .multifilter:nth-child(3) .taLnk , .filter_list_0 > .multifilter:nth-child(2) .taLnk , .multifilter:nth-child(1) .taLnk') %>% html_text()

DownActivities

#-- Armagh Activities --

ArmaghActivities <- read_html("https://www.tripadvisor.ie/Attractions-g186473-Activities-County_Armagh_Northern_Ireland.html")

ArmaghActivities <- ArmaghActivities %>% html_nodes('.filter_list_0 > .multifilter:nth-child(7) .taLnk , .multifilter:nth-child(3) .taLnk , .multifilter:nth-child(2) .taLnk , .filter_list_0 > .multifilter:nth-child(1) .taLnk') %>% html_text()

ArmaghActivities
