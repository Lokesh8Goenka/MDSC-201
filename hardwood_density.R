install.packages("PASWR2")
library("PASWR2")
dataset = JANKA

# importing dataset
dataset

#splitting the test and training dataset
library(caTools)
set.seed(123)
split = sample.split(dataset$hardness, SplitRatio = 2/3)
print(split)

training_set = subset(dataset, split== TRUE)
test_set = subset(dataset, split == FALSE)

#Fitting the Multiple LR model
Regressor = lm(formula = hardness~ density, data = training_set)
print(Regressor)

#predicting the test set results
y_pred = predict(Regressor, newdata = test_set )

#predicted values
print(y_pred)    

#original values
print(test_set$hardness)

# visualizing the training Set results

install.packages("ggplot2")
library(ggplot2)

ggplot() + 
  geom_point((aes(x= training_set$density, 
                  y = training_set$hardness,
                  colour = "red"))) + 
  geom_line(aes (x = training_set$density,
                 y = predict(Regressor, newdata = training_set),
                 colour = "blue")
  )
ggtitle("Years of Experience VS hardness") + 
  xlab('Years of Experience') +
  ylab('hardness')

ggplot() +
  geom_point((aes(x= test_set$density,
                  y = test_set$hardness,
                  colour = "red"))) + 
  geom_line(aes (x = test_set$density,
                 y = y_pred,
                 colour = "blue")
  ) +
  ggtitle("Shear strength VS Age of propellant") + 
  xlab('Shear strength') +
  ylab('Age of propellant')

