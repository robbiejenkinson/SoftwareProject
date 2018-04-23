IrishAccom <- read.csv(file="C:\\Users\\Robbie\\Documents\\College\\GitHub\\SoftwareProjectExcel\\ProjectData\\IrishAccomodation.csv", header=TRUE, sep=",")
IrishAct <- read.csv(file="C:\\Users\\Robbie\\Documents\\College\\GitHub\\SoftwareProjectExcel\\ProjectData\\IrishActivities.csv", header=TRUE, sep=",")

IrishTourism <- merge(IrishAccom, IrishAct,by=c("county","prov"))

IrishTourism$X <- NULL
IrishTourism$id.x <- NULL
IrishTourism$id.y <- NULL

write.table(IrishTourism, file = "C:\\Users\\Robbie\\Documents\\College\\GitHub\\SoftwareProjectExcel\\ProjectData\\IrishTourismAll.csv")
