# importing dataset
dataset = read.csv("Walmart.csv")

#splitting the test and training dataset
library(caTools)
set.seed(123)
split = sample.split(dataset$Weekly_Sales, SplitRatio = 2/3)
print(split)
training_set = subset(dataset, split = TRUE)
test_set = subset(dataset, split = FALSE)

#Fitting the Multiple LR model
Regressor = lm(formula = Weekly_Sales~., data = training_set)
print(Regressor)

#predicting the test set results
y_pred = predict(Regressor, newdata = test_set )

#predicted values
print(y_pred)    

#original values
print(test_set$Weekly_Sales)

