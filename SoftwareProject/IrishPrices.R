library(rvest)

#-- Galway Accommodation --
rm(wwww)

DubAccPrice <- read_html("https://www.tripadvisor.ie/Hotels-g186605-Dublin_County_Dublin-Hotels.html")

DubAccPrice <- DubAccPrice %>% html_nodes('.text-link:nth-child(1) .price') %>% html_text()


Hi <- as.data.frame(DubAccPrice)

Hello <- c(DubAccPrice)
gsub('\\???', '', DubAccPrice)


wwww <- as.numeric(gsub("[^[:alnum:][:blank:]+?&/\\-]", "", DubAccPrice))

DubAccPrice <- as.data.frame(DubAccPrice)

DubAccPrice$DubAccPrice <- as.numeric(DubAccPrice)

DubAccPrice <- as.numeric(as.character(DubAccPrice))

as.numeric(as.character(DubAccPrice))

suppressWarnings(as.numeric(DubAccPrice))

DubAccPrice <- as.data.frame(DubAccPrice)

