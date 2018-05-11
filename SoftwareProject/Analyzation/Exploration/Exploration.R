
kruskal <- read.csv("./flights/kruskal.csv")


# SOFTWARE PROJECT DATA EXPLORATION -----------------------------------------------

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


