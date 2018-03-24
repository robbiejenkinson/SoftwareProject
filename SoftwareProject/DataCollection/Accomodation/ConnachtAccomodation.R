library(rvest)

#-- Galway Accommodation --

GalwayAccommodation <- read_html("https://www.tripadvisor.ie/Hotels-g186607-County_Galway_Western_Ireland-Hotels.html")

GalwayAccommodation <- GalwayAccommodation %>% html_nodes('.prw_filters_hsx_radio_resp .label') %>% html_text()

GalwayAccommodation

#-- Leitrim Accommodation --

LeitrimAccommodation <- read_html("https://www.tripadvisor.ie/Hotels-g186618-County_Leitrim_Western_Ireland-Hotels.html")

LeitrimAccommodation <- LeitrimAccommodation %>% html_nodes('.prw_filters_hsx_radio_resp .label') %>% html_text()

LeitrimAccommodation

#-- Mayo Accommodation --

MayoAccommodation <- read_html("https://www.tripadvisor.ie/Hotels-g186625-County_Mayo_Western_Ireland-Hotels.html")

MayoAccommodation <- MayoAccommodation %>% html_nodes('.prw_filters_hsx_radio_resp .label') %>% html_text()

MayoAccommodation

#-- Roscommon Accommodation --

RoscommonAccommodation <- read_html("https://www.tripadvisor.ie/Hotels-g186633-County_Roscommon_Western_Ireland-Hotels.html")

RoscommonAccommodation <- RoscommonAccommodation %>% html_nodes('.prw_filters_hsx_radio_resp .label') %>% html_text()

RoscommonAccommodation

#-- Sligo Accommodation --

SligoAccommodation <- read_html("https://www.tripadvisor.ie/Hotels-g186634-County_Sligo_Western_Ireland-Hotels.html")

SligoAccommodation <- SligoAccommodation %>% html_nodes('.prw_filters_hsx_radio_resp .label') %>% html_text()

SligoAccommodation
