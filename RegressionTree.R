whitewines <- read_csv("RCode/whitewines.csv")

hist(whitewines$quality)
summary(whitewines)

wine_train <- whitewines[c(1:3673), ]
wine_test <- whitewines[-c(1:3673), ]

# install.packages("rpart")
library(rpart)

m.rpart <- rpart(quality ~ ., data = wine_train)
m.rpart
summary(m.rpart)

# install.packages("rpart.plot")
library(rpart.plot)
rpart.plot(m.rpart, digits = 3)
rpart.plot(m.rpart, digits = 4, fallen.leaves = TRUE, type = 3,extra = 101)

p.rpart <- predict(m.rpart, wine_test)
summary(p.rpart)
summary(wine_test$quality)
