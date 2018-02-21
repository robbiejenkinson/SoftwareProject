library(rvest)

#-- Dublin Accommodation --

DublinAccommodation <- read_html("https://www.tripadvisor.ie/Hotels-g186604-County_Dublin-Hotels.html")

DublinAccommodation <- DublinAccommodation %>% html_nodes('.prw_filters_hsx_radio_resp .label') %>% html_text()

DublinAccommodation

#-- Kilkenny Accommodation --

KilkennyAccommodation <- read_html("https://www.tripadvisor.ie/Hotels-g186615-County_Kilkenny-Hotels.html")

KilkennyAccommodation <- KilkennyAccommodation %>% html_nodes('.prw_filters_hsx_radio_resp .label') %>% html_text()

KilkennyAccommodation

#-- Wexford Accommodation --

WexfordAccommodation <- read_html("https://www.tripadvisor.ie/Hotels-g186640-County_Wexford-Hotels.html")

WexfordAccommodation <- WexfordAccommodation %>% html_nodes('.prw_filters_hsx_radio_resp .label') %>% html_text()

WexfordAccommodation

#-- Kildare Accommodation --

KildareAccommodation <- read_html("https://www.tripadvisor.ie/Hotels-g186614-County_Kildare-Hotels.html")

KildareAccommodation <- KildareAccommodation %>% html_nodes('.prw_filters_hsx_radio_resp .label') %>% html_text()

KildareAccommodation

#-- Meath Accommodation --

MeathAccommodation <- read_html("https://www.tripadvisor.ie/Hotels-g186628-County_Meath-Hotels.html")

MeathAccommodation <- MeathAccommodation %>% html_nodes('.prw_filters_hsx_radio_resp .label') %>% html_text()

MeathAccommodation

#-- WestMeath Accommodation --

WestMeathAccommodation <- read_html("https://www.tripadvisor.ie/Hotels-g186639-County_Westmeath-Hotels.html")

WestMeathAccommodation <- WestMeathAccommodation %>% html_nodes('.prw_filters_hsx_radio_resp .label') %>% html_text()

WestMeathAccommodation

#-- Laois Accommodation --

LaoisAccommodation <- read_html("https://www.tripadvisor.ie/Hotels-g186617-County_Laois-Hotels.html")

LaoisAccommodation <- LaoisAccommodation %>% html_nodes('.prw_filters_hsx_radio_resp .label') %>% html_text()

LaoisAccommodation

#-- Longford Accommodation --

LongfordAccommodation <- read_html("https://www.tripadvisor.ie/Hotels-g186622-County_Longford-Hotels.html")

LongfordAccommodation <- LongfordAccommodation %>% html_nodes('.prw_filters_hsx_radio_resp .label') %>% html_text()

LongfordAccommodation

#-- Louth Accommodation --

LouthAccommodation <- read_html("https://www.tripadvisor.ie/Hotels-g186623-County_Louth-Hotels.html")

LouthAccommodation <- LouthAccommodation %>% html_nodes('.prw_filters_hsx_radio_resp .label') %>% html_text()

LouthAccommodation

#-- Offaly Accommodation --

OffalyAccommodation <- read_html("https://www.tripadvisor.ie/Hotels-g186631-County_Offaly-Hotels.html")

OffalyAccommodation <- OffalyAccommodation %>% html_nodes('.prw_filters_hsx_radio_resp .label') %>% html_text()

OffalyAccommodation

#-- Carlow Accommodation --

CarlowAccommodation <- read_html("https://www.tripadvisor.ie/Hotels-g186593-County_Carlow-Hotels.html")

CarlowAccommodation <- CarlowAccommodation %>% html_nodes('.prw_filters_hsx_radio_resp .label') %>% html_text()

CarlowAccommodation

#-- Wicklow Accommodation --

WicklowAccommodation <- read_html("https://www.tripadvisor.ie/Hotels-g186644-County_Wicklow-Hotels.html")

WicklowAccommodation <- WicklowAccommodation %>% html_nodes('.prw_filters_hsx_radio_resp .label') %>% html_text()

WicklowAccommodation
