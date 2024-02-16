# Multiple Linear Regression
dataset  = read.csv("50_Startups.csv")

#Encoding the Categorical 'State' col
dataset$State = factor(dataset$State,
                       levels = c("New York", "California", "Florida"),
                       labels = c(1,2,3))

# splitting the dataset int test and training
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio =0.8)
print(split)

training_set = subset(dataset, split = TRUE)
test_set = subset(dataset, split = FALSE)

#Fitting the Multiple LR model

regressor = lm(formula = Profit ~ ., data = training_set)
print(regressor)

#predicting the test set results
y_pred = predict(regressor, newdata = test_set )

print(y_pred)
print(test_set$Profit)
