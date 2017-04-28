# load the library
library(C50)

# Unzip and load the database.csv

df=read.csv("../database.csv")
df=df[c("State","Year","Crime.Type","Crime.Solved","Victim.Sex","Victim.Age","Weapon","Victim.Count","Victim.Race")]

class=data.matrix(df[,9])
df[] <- as.numeric(factor(as.matrix(df)))   # converting the catagorical values to numeric
X=cbind(df,class)
df = subset(X, select = -c(Victim.Race) )
df= data.frame(df[sample(1:nrow(df)), ])      # Shuffeling the data set

train=sample(1:nrow(df),383072)     #  training and testing data split into 60:40       
test= -train
training_data=df[train,]
testing_data=df[test,]

# Decision Tree Classifiaction 
# Quinlanâ's C5.0 algorithm

str(training_data)

model=C5.0(training_data[,-9],training_data[,9])              #C5.0(target, predictor)
model

summary(model)

#using the training set

p_TrainData=predict(model,training_data)
table(training_data[,9],p_TrainData)
Train_acc=mean(p_TrainData == training_data$class)
Train_acc

# Using the testing set

p_TestData=predict(model,testing_data)
table(testing_data[,9],p_TestData)
Test_acc=mean(p_TestData == testing_data$class)
Test_acc










