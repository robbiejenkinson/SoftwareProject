
kruskal <- read.csv("./flights/kruskal.csv")


# SOFTWARE PROJECT DATA EXPLORATION -----------------------------------------------

# null hypothesis = Activities data are normal
# null hypothesis = Accomodation data are normal

# alternate hypothesis = Activities data are not normal
# alternate hypothesis = Accomodation data are not normal


# Shapiro-Wilk normality test for activities
shapiro.test(Act$total) # => p = 6.888e-06
# Shapiro-Wilk normality test for accomodation
shapiro.test(tourism$totalAccom) # => p = 1.266e-05

wilcox.test(Act$total,tourism$totalAccom) # w = 356, p-value = 0.0368


# NULL HYPOTHESIS THAT DATA ARE NORMAL FOR BOTH ACTIVITIES & ACCOMODATION REJECTED. 

# QQPLOTs
install.packages("ggpubr")
library(ggpubr)
# mpg
ggqqplot(Act$total, ylab = "Activities")
# wt
ggqqplot(tourism$totalAccom, ylab = "Accomodation")

# HISTOGRAMS
hist(Act$total, ylab = "Activities")
hist(tourism$total, ylab = "Accomodation")


# CORRELATION TESTING
cor(Act$total,tourism$total, method="pearson")
cor(Act$total,tourism$total, method="pearson")
cor(Act$total,tourism$total, method="kendall")
cor(Act$total,tourism$total, method="spearman")

# THERE IS NO CORRELATION BETWEEN ACTIVITIES AND ACCOMODATION

plot(Act$total, tourism$totalAccom)
cor(chirp_nums, temp_f)
#
fit <- lm(Act$total ~ tourism$total)
abline(fit)
summary(fit)

#--------------------------------------------------------
#--------------------------------------------------------

# TIME SERIES

myvector <- c(879210,133184,266962,1493311,59433,8847687,
              912946,	147844,	304939,	1335383,68998,8873391,
              855948,	126340,	294153,	1189438,55248,8064478,
              798054,	157632,	288611,	718504,	50332,7468450,
              816275,	140397,	321820,	666863,	38237,7690608,
              800913,	126882,	338698,	626861,	38520,7764296,
              781158,	135527,	328398,	640534,	13680,8173312,
              793005,	127973,	347140,	763446,	16086,8741572,
              817576,	131047,	338497,	808630,	16600,9939488,
              849192,	138468,	362222,	821219,	6508,	10960422
              
)
myvector


plot(flightYear)

myts <- ts(myvector, start= 2007, end= 2016, frequency=9)


newts <- log(myts)



plot(newts)

abline(reg=lm(newts~time(newts)))

plot((log(myts)))

acf(diff(log(myts))) # = 1

pacf(diff(log(myts))) # = 0

library(forecast)
auto.arima(newts, ic = "aic")

fit <- stl(myts, s.window="period")
plot(fit)


# additional plots
monthplot(myts)
library(forecast)
seasonplot(myts)

fit <- arima(newts, order=c(0, 0, 1))

# predictive accuracy
library(forecast)
accuracy(fit)

# predict next 5 observations
library(forecast)
forecast(fit, 5)
plot(forecast(fit, 5))

# simple exponential - models level
fit <- HoltWinters(myts, beta=FALSE, gamma=FALSE)
# double exponential - models level and trend
fit <- HoltWinters(myts, gamma=FALSE)
# triple exponential - models level, trend, and seasonal components
fit <- HoltWinters(newts)

# predictive accuracy
library(forecast)
accuracy(fit)

# predict next three future values
library(forecast)
forecast(fit, 15)
plot(forecast(fit, 15))

fit <- arima(log(newts), c(0, 0, 1),seasonal = list(order = c(0, 0, 1), period = 9))

pred <- predict(fit, n.ahead = 10*9)

ts.plot(newts)

#----------------------------------------------------------
#----------------------------------------------------------

# NORMALITY TESTS

shapiro.test(IrishTourismAll$outdoorAct) # Non-normal distribution
shapiro.test(IrishTourismAll$BB) # Non-normal distribution
shapiro.test(IrishTourismAll$specLodge) # Non-normal distribution
shapiro.test(IrishTourismAll$hotel) # Non-normal distribution
shapiro.test(IrishTourismAll$museums) # Non-normal distribution


wilcox.test(IrishTourismAll$outdoorAct,IrishTourismAll$BB) # w = 212.5, p-value = 1.355e-05
# significant statistical difference.

wilcox.test(IrishTourismAll$outdoorAct,IrishTourismAll$specLodge) # w = 452, p-value = 0.4242
# no so significant statistical difference.

wilcox.test(IrishTourismAll$hotel,IrishTourismAll$museums) # w = 767, p-value = 0.0006249
# significant statistical difference.

# linear regression Accomodation and Activities BB & Outdoor Act.

linearModel = lm(BB~outdoorAct, data=IrishTourismAll)
linearModel

Pred <- 10.905 + 2.916*187
Pred

# linear regression Accomodation and Activities SpecLodge & Outdoor Act.

linearModel = lm(specLodge~outdoorAct, data=IrishTourismAll)
linearModel

Pred <- 4.218 + 1.044*187
Pred

# linear regression Accomodation and Activities SpecLodge & Outdoor Act.

linearModel = lm(hotel~museums, data=IrishTourismAll)
linearModel

Pred <- 5.993 + 1.881*95
Pred

# --------------------------------------------------------------------------
#---------------------------------------------------------------------------

# Travel

shapiro.test(ForeignMap$total) # W = 0.43513, p-value = 5.41e-08

wilcox.test(ForeignMap$total,ForeignMap$pop) # W = 60.5, p-value = 5.95e-05

#--------------------------------------------
#--------------------------------------------
sum(Reason$business)
sum(Reason$visit)
sum(Reason$holiday)
sum(Reason$other)

totalreason <- 58887*1000

sum(Exp$amount)

totalExp <- 1037*100000

totalExp/totalreason

#--------------------------------------------
#-------------------------------------------- 
# DIFFERENCE BETWEEN IRISH AIRPORTS

shapiro.test(flightYear$Cork) #W = 0.91821, p-value = 0.3422
shapiro.test(flightYear$Kerry) #W = 0.89915, p-value = 0.2144
shapiro.test(flightYear$Knock) #W = 0.968, p-value = 0.8717
shapiro.test(flightYear$Shannon) #W = 0.81827, p-value = 0.02415
shapiro.test(flightYear$Sligo) #W = 0.53571, p-value = 9.563e-06
shapiro.test(flightYear$Waterford) #W = 0.92237, p-value = 0.3772

kruskal.test(airport ~ value, data = kruskal)

#--------------------------------------------
#--------------------------------------------
# DIFFERENCE BETWEEN FOREIGN COUNTRIES

shapiro.test(cor$visitors) #W = 0.91821, p-value = 0.3422
shapiro.test(cor$amount) #W = 0.91821, p-value = 0.3422


kruskal.test(visitors ~ amount, data = cor)


