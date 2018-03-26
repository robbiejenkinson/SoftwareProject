#scraping American shooting data from a table
library(htmltab)
url <- "http://www.cso.ie/px/pxeirestat/Statire/SelectOut/PxSort.asp?file=201712261239396887218CTM01&PLanguage=0&MainTable=CTM01&MainTablePrestext=Passenger%20Movement%20(Number)&potsize=204534"
newTourism <- htmltab(doc=url, which=1)
head(newShootings)

rownames(newShootings) <- c(1:1881)

head(shootings)