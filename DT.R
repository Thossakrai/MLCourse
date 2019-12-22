# str(credit)
# 
# table(credit$checking_balance)
# table(credit$savings_balance)
# credit$default <- as.factor(credit$default)
# 
# summary(credit$months_loan_duration)
# summary(credit$amount)
# 
# table(credit$default)
# 
# set.seed(123)
# train_sample <- sample(1000, 900)
# str(train_sample)
# 
# credit_train <- credit[train_sample, ]
# credit_test <- credit[-train_sample, ]
# 
# # prob.table(table(credit_train$default))
# # prob.table(table(credit_test$defualt))
# 
# # install.packages("C50")
# library(C50)
# credit
# credit_model <- C5.0(credit_train[-17], credit_train$default)
# summary(credit_model)
# 


credit <- read.csv(file='credit.csv')
credit$default <- as.factor(credit$default)

table(credit$savings_balance)
table(credit$checking_balance)

summary(credit$months_loan_duration)
summary(credit$amount)

table(credit$default)

set.seed(123)
train_sample <- sample(1000,900)
str(train_sample)


credit_train <- credit[train_sample,]
credit_test <- credit[-train_sample,]

prop.table(table(credit_train$default))
prop.table(table(credit_test$default))

# install.packages('C50')
library(C50)


credit_model <- C5.0(credit_train[-17], credit_train$default)
strcredit_model

summary(credit_model)


credit_pred <- predict(credit_model, credit_test)
library(gmodels)
CrossTable(credit_test$default, credit_pred, prop.chisq = FALSE, prop.c = FALSE, prop.r = FALSE, dnn = c('actual default', 'predicted default'))

credit_boost10 <- C5.0(credit_train[-17], credit_train$default, trials = 10)
credit_boost10
summary(credit_boost10)

credit_boost_pred10 <- predict(credit_boost10, credit_test)
CrossTable(credit_test$default, credit_boost_pred10, prop.chisq = FALSE, prop.c = FALSE, prop.r = FALSE, dnn = c('actual default', 'predicted default'))

matrix_dimensions <- list(c("no", "yes"), c("no", "yes"))
names(matrix_dimensions) <- c("predicted","actual")
matrix_dimensions

error_cost <- matrix(c(0, 1, 4, 0), nrow = 2, dimnames = matrix_dimensions)
error_codst

credit_cost <- C5.0(credit_train[-17], credit_train$default, cost = error_cost)
credit_cost_pred <- predict(credit_cost, credit_test)
CrossTable(credit_test$default, credit_cost_pred, prop.chisq = FALSE, prop.c = FALSE, prop.r = FALSE, dnn = c('actual default', 'predicted default'))
