# subject_name <- c("John Doe", "Jane Doe", "Steve Graves")
# temperature <- c(98.1, 98.6, 101.4)
# flu_status <- c(FALSE, FALSE, TRUE)
# 
# typeof(flu_status[1])
# 

# cat("Hello world")
# print something onthe console
# hello <- function() cat("Hello!!!")
# hello()

# elasticband <- data.frame(stretch=c(46,54,48,50,44,42,52),
#                            distance=c(148,182,173,166,109,141,166))

# library(dslabs)
# x <- c("sidfn", "test")
# class(x)
# 
# install.packages("RWeka")
# library(RWeka)

# vector
# subject_name <- c("John Doe", "Jane Doe", "Steve Graves")
# temperature <- c(98.1, 98.6, 101.4)
# flu_status <- c(FALSE, FALSE, TRUE)
# 
# gender <- factor(c("MALE", "MALE", "FEMALE"))

# factor
# blood <- factor(c("O", "AB", "A"), levels = c("A", "B", "AB", "O"))
# symptoms <- factor(c("SEVERE", "MILD", "MODERATE"), levels = c("MILD", "MODERATE", "SEVERE"), ordered = TRUE)
# symptoms > "MODERATE"

# list
# subject1 <- list(fullname = subject_name[1], temperature = temperature[1], flu_status = flu_status[1], 
#                  gender = gender[1], blood = blood[1], symptoms = symptoms[1])
# subject1$temperature

# data frame
# pt_data <- data.frame(subject_name, temperature, flu_status, gender, blood, symptoms, stringsAsFactors = FALSE)
# 
# pt_data[1, 2]
# pt_data[c(1, 3), c(2,4)]
# pt_data[,1]
# pt_data[2,]
# pt_data[c(1, 3), c("temperature", "gender")]
# pt_data[-2, c(-1, -3, -5, -6)]


# matrix
# m <- matrix(c(1, 2, 3, 4), nrow = 2)
# m1 <- matrix(c(1,2, 3, 4, 5, 6), nrow = 2)
# m1
# m2 <- matrix(c(1, 2, 3, 4, 5, 6), ncol = 2)
# m2
# m2[1,]
# m2[, 1]

# array (more dimensions than matrix)

# str(usedcars)
# summary(usedcars$year)
# 
# mn <- mean(c(36000, 44000, 56000))
# mn


# q <- quantile(usedcars$price, seq(0, 10, 1))
# q
# 
# hist(usedcars$price, main = "Histogram of used cars prices")

# var(usedcars$price)
# var(usedcars$mileage)
# sd(usedcars$price)
# sd(usedcars$mileage)

# table(usedcars$model)

# plot(x = usedcars$mileage, y = usedcars$price, main = "Price vs. Mileage", xlab = "Used card odometer", ylab = "used cars price")

# install.packages("gmodels")
# library(gmodels)
# usedcars$conservative <- usedcars$color %in% c("Black", "Gray", "Silver", "White")
# CrossTable(x= usedcars$model, y = usedcars$conservative, chisq= TRUE)

# grape <- sqrt((9 - 6) ** 2 + (5 - 4) ** 2)
# nuts <- sqrt((3 - 6) ** 2 + (6 - 4) ** 2)
# orange <- sqrt((8 - 6) ** 2 +( 3 - 4) ** 2)
# fish <- sqrt((3 - 6) ** 2 + (1 - 4) ** 2)
# grape
# nuts
# orange
# fish

# str(wbcd)
# wbcd <- wbcd[-1] #drop the id feature
# wbcd$diagnosis <- factor(wbcd$diagnosis, levels = c("B", "M"), labels = c("Benign", "Malignant"))
# round(prop.table(table(wbcd$diagnosis))*100, digits = 1)
# summary(wbcd[c("radius_mean", "area_mean", "smoothness_mean")])
normalize <- function(x) {return ((x - min(x))/(max(x)-min(x)))}
wbcd_n <- as.data.frame(lapply(wbcd[2:31], normalize))
summary(wbcd_n$area_mean)
# wbcd_train <- wbcd_n[1:469,]
# wbcd_test <- wbcd_n[470:569, ]
# install.packages("class")
# wbcd_train_labels = wbcd[1:469, 1]
# wbcd_test_labels = wbcd[470:569, 1]
library(class)
# wbcd_test_pred <- knn(train = wbcd_train, test = wbcd_test, cl = wbcd_train_labels, k = 3)

wbcd_z <- as.data.frame(scale(wbcd[-1]))
summary(wbcd_z$area_mean)
wbcd_train_z <- wbcd_z[1:469,]
wbcd_test_z <- wbcd_z[470:569, ]
wbcd_train_labels_z = wbcd_z[1:469, 1]
wbcd_test_labels_z = wbcd_z[470:569, 1]

wbcd_test_z_pred <- knn(train = wbcd_train_z, test = wbcd_test_z, cl = wbcd_train_labels_z, k = 3)
# CrossTable(x = wbcd_test_labels_z, y = wbcd_test_z_pred)
