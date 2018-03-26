#
# SOFTWARE PROJECT DATA EXPLORATION -----------------------------------------------

# null hypothesis = Activities data are normal
# null hypothesis = Accomodation data are normal

# alternate hypothesis = Activities data are not normal
# alternate hypothesis = Accomodation data are not normal


# Shapiro-Wilk normality test for activities
shapiro.test(Act$total) # => p = 6.888e-06
# Shapiro-Wilk normality test for accomodation
shapiro.test(tourism$totalAccom) # => p = 1.266e-05

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


