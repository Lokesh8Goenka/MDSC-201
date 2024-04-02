dataset = read.csv("Song_month.csv")

# ******************** Q1 part A ****************************
month = dataset$Months
song = dataset$Songs

correlation_coefficient = cor(month, song)
print(correlation_coefficient)

# ******************** Q1 part C ****************************
install.packages("ggplot2")
library(ggplot2)

ggplot() + 
  geom_point((aes(x= dataset$Months, 
                  y = dataset$Songs,
                  colour = "red"))) + 
  geom_abline(intercept = -12.8872884911201, slope = 21.1263809257447, linetype = 'solid',
              colour = "green")
  
ggtitle("Songs VS MOnths") + 
  xlab('MOnths') +
  ylab('Songs')

# ******************** Q2 part a ****************************

dataset_Q2 = read.csv("GRE_Total.csv")

library(caTools)

#Fitting the Multiple LR model
Regressor = lm(formula = GGPA~ ., data = dataset_Q2)
print(Regressor)

# ******************** Q2 part b ****************************

pvalues = summary(Regressor)
print(pvalues$coefficients[2,4])
print(pvalues$coefficients[3,4])




