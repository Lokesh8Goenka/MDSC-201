#reading dataset
df = read.csv("apple_quality.csv")

#Encoding the Categorical 'Quality' col
df$Quality = factor(df$Quality,
                       levels = c( "good", "bad"),
                       labels = c(0,1))

#dropping the Apple id column
dataset = subset(df, select=-c(A_id))

#splitting the test and training dataset
library(caTools)
set.seed(123)
split = sample.split(dataset$Quality, SplitRatio = 0.8)
print(split)

training_set = subset(dataset, split = TRUE)
test_set = subset(dataset, split = FALSE)

#Fitting the Multiple LR model
Regressor = lm(formula = Quality~., data = training_set)
print(Regressor)

#predicting the test set results
y_pred = predict(Regressor, dataset = test_set )

#predicted values
print(as.integer(y_pred))

#Original values
print(test_set$Quality)

