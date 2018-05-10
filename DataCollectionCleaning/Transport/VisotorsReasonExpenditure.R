library(htmltab)
url <- "http://www.cso.ie/px/pxeirestat/Statire/SelectOut/PxSort.asp?file=201854104588530384TMA08&PLanguage=0&MainTable=TMA08&MainTablePrestext=Overseas%20Trips%20by%20Irish%20Residents%20(Thousand)&potsize=240"
reason <- htmltab(doc=url, which=1)
head(reason)

reason$`2009` <- as.integer(reason$`2009`)
reason$`2010` <- as.integer(reason$`2010`)
reason$`2011` <- as.integer(reason$`2011`)
reason$`2012` <- as.integer(reason$`2012`)
reason$`2013` <- as.integer(reason$`2013`)
reason$`2014` <- as.integer(reason$`2014`)
reason$`2015` <- as.integer(reason$`2015`)
reason$`2016` <- as.integer(reason$`2016`)

write.csv(reason, "./data/reason.csv")
Reason <- read.csv("./data/reason.csv")

Reason$year <- as.factor(Reason$year)

# Where Visitors are from

library(htmltab)
url <- "http://www.cso.ie/px/pxeirestat/Statire/SelectOut/PxSort.asp?file=2018551447128541774TMA09&PLanguage=0&MainTable=TMA09&MainTablePrestext=Overseas%20Trips%20to%20Ireland%20by%20Non-Residents%20(Thousand)&potsize=216"
where <- htmltab(doc=url, which=1)
head(where)

where$`2009` <- as.integer(where$`2009`)
where$`2010` <- as.integer(where$`2010`)
where$`2011` <- as.integer(where$`2011`)
where$`2012` <- as.integer(where$`2012`)
where$`2013` <- as.integer(where$`2013`)
where$`2014` <- as.integer(where$`2014`)
where$`2015` <- as.integer(where$`2015`)
where$`2016` <- as.integer(where$`2016`)

write.csv(where, "./data/tourists.csv")
tourists <- read.csv("./data/tourists.csv")

