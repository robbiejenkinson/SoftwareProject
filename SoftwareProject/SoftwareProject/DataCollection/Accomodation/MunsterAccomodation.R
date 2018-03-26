library(rvest)

#-- Clare Accommodation --

ClareAccommodation <- read_html("https://www.tripadvisor.ie/Hotels-g186595-County_Clare-Hotels.html")

ClareAccommodation <- ClareAccommodation %>% html_nodes('.prw_filters_hsx_radio_resp .label') %>% html_text()

ClareAccommodation

#-- Cork Accommodation --

CorkAccommodation <- read_html("https://www.tripadvisor.ie/Hotels-g186598-County_Cork-Hotels.html")

CorkAccommodation <- CorkAccommodation %>% html_nodes('.prw_filters_hsx_radio_resp .label') %>% html_text()

CorkAccommodation

#-- Kerry Accommodation --

KerryAccommodation <- read_html("https://www.tripadvisor.ie/Hotels-g186610-County_Kerry-Hotels.html")

KerryAccommodation <- KerryAccommodation %>% html_nodes('.prw_filters_hsx_radio_resp .label') %>% html_text()

KerryAccommodation

#-- Waterford Accommodation --

WaterfordAccommodation <- read_html("https://www.tripadvisor.ie/Hotels-g186637-County_Waterford-Hotels.html")

WaterfordAccommodation <- WaterfordAccommodation %>% html_nodes('.prw_filters_hsx_radio_resp .label') %>% html_text()

WaterfordAccommodation

#-- Limerick Accommodation --

LimerickAccommodation <- read_html("https://www.tripadvisor.ie/Hotels-g186619-County_Limerick-Hotels.html")

LimerickAccommodation <- LimerickAccommodation %>% html_nodes('.prw_filters_hsx_radio_resp .label') %>% html_text()

LimerickAccommodation

#-- Tipperary Accommodation --

TipperaryAccommodation <- read_html("https://www.tripadvisor.ie/Hotels-g186636-County_Tipperary-Hotels.html")

TipperaryAccommodation <- TipperaryAccommodation %>% html_nodes('.prw_filters_hsx_radio_resp .label') %>% html_text()

TipperaryAccommodation
