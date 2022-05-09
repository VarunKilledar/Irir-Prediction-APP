install.packages("caTools")
install.packages("rpart")

library("randomForest")
library("caTools")

#Loading the Data
mydata<- iris
View(mydata)

#Spliting the data
split_values<- sample.split(iris$Species,SplitRatio = 0.7)
trin_set<- subset(iris,split_values==T)
test_set<- subset(iris,split_values==F)

#loading RPART
library("rpart")

#building Model for Random Forest 
mod_class<- rpart(Species~.,data = trin_set)
reselt_set<- predict(mod_class,trin_set,type = "class")
# Building Confusion Matrix 
CFM<- table(trin_set$Species,reselt_set)

#Finding the Accuracy Of the Model 
Accurecy<- sum(diag(CFM)/sum(CFM))
Accurecy

#Saving Model in RDS
saveRDS(mod_class, "model.rds")

