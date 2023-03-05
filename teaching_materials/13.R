###############################
### M U S T E R L Ö S U N G ###
###############################

# Ausgangssituation
iris
install.packages("caret", dependencies=TRUE)
library(caret)

# Deskriptive Analyse
summary(iris)
boxplot(iris[1:4])
x <- iris[,1:4]
y <- iris[,5]
featurePlot(x=x, y=y, plot="box")

# Bivariate Analyse
cor(iris[1:4])

# Machine Learning
validation_index <- createDataPartition(iris$Species, p=0.80, list=FALSE)
validation <- iris[-validation_index, ]
model <- iris[validation_index, ]
summary(validation)
summary(model)
control <- trainControl(method = "cv", number = 10)
metric <- "Accuracy"
fit.lda <- train(Species ~ ., data=model, method ="lda", metric=metric, trControl=control)
fit.knn <- train(Species ~ ., data=model, method ="knn", metric=metric, trControl=control)
fit.rf <- train(Species ~ ., data=model, method ="rf", metric=metric, trControl=control)
results <- resamples(list(lda=fit.lda, knn=fit.knn, rf=fit.rf))
summary(results)
dotplot(results)
print(fit.lda)
predictions <- predict(fit.lda, model)
confusionMatrix(predictions, model$Species)
predictions <- predict(fit.lda, validation)
confusionMatrix(predictions, validation$Species)