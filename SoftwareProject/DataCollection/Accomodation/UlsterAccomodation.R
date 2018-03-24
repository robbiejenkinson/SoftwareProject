library(rvest)

#-- Donegal Accommodation --

DonegalAccommodation <- read_html("https://www.tripadvisor.ie/Hotels-g186601-County_Donegal-Hotels.html")

DonegalAccommodation <- DonegalAccommodation %>% html_nodes('.prw_filters_hsx_radio_resp .label') %>% html_text()

DonegalAccommodation

#-- Cavan Accommodation --

CavanAccommodation <- read_html("https://www.tripadvisor.ie/Hotels-g186594-County_Cavan-Hotels.html")

CavanAccommodation <- CavanAccommodation %>% html_nodes('.prw_filters_hsx_radio_resp .label') %>% html_text()

CavanAccommodation

#-- Monaghan Accommodation --

MonaghanAccommodation <- read_html("https://www.tripadvisor.ie/Hotels-g186629-County_Monaghan-Hotels.html")

MonaghanAccommodation <- MonaghanAccommodation %>% html_nodes('.prw_filters_hsx_radio_resp .label') %>% html_text()

MonaghanAccommodation

#-- Fermanagh Accommodation --

FermanaghAccommodation <- read_html("https://www.tripadvisor.ie/Hotels-g186480-County_Fermanagh_Northern_Ireland-Hotels.html")

FermanaghAccommodation <- FermanaghAccommodation %>% html_nodes('.prw_filters_hsx_radio_resp .label') %>% html_text()

FermanaghAccommodation

#-- Tyrone Accommodation --

TyroneAccommodation <- read_html("https://www.tripadvisor.ie/Hotels-g186483-County_Tyrone_Northern_Ireland-Hotels.html")

TyroneAccommodation <- TyroneAccommodation %>% html_nodes('.prw_filters_hsx_radio_resp .label') %>% html_text()

TyroneAccommodation

#-- Derry Accommodation --

DerryAccommodation <- read_html("https://www.tripadvisor.ie/Hotels-g186481-County_Londonderry_Northern_Ireland-Hotels.html")

DerryAccommodation <- DerryAccommodation %>% html_nodes('.prw_filters_hsx_radio_resp .label') %>% html_text()

DerryAccommodation

#-- Antrim Accommodation --

AntrimAccommodation <- read_html("https://www.tripadvisor.ie/Hotels-g186471-County_Antrim_Northern_Ireland-Hotels.html")

AntrimAccommodation <- AntrimAccommodation %>% html_nodes('.prw_filters_hsx_radio_resp .label') %>% html_text()

AntrimAccommodation

#-- Down Accommodation --

DownAccommodation <- read_html("https://www.tripadvisor.ie/Hotels-g186475-County_Down_Northern_Ireland-Hotels.html")

DownAccommodation <- DownAccommodation %>% html_nodes('.prw_filters_hsx_radio_resp .label') %>% html_text()

DownAccommodation

#-- Armagh Accommodation --

ArmaghAccommodation <- read_html("https://www.tripadvisor.ie/Hotels-g186473-County_Armagh_Northern_Ireland-Hotels.html")

ArmaghAccommodation <- ArmaghAccommodation %>% html_nodes('.prw_filters_hsx_radio_resp .label') %>% html_text()

ArmaghAccommodation
