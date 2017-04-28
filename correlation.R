# load the library
library(ggplot2)
library(corrplot)

# Unzip and load the database.csv

df=read.csv("../database.csv")
df=df[c("State","Year","Crime.Type","Crime.Solved","Victim.Sex","Victim.Age","Relationship","Weapon","Victim.Count","Victim.Race")]
class=data.matrix(df[,10])
df[] <- as.numeric(factor(as.matrix(df)))
df= data.frame(df[sample(1:nrow(df)), ])


# Feature selection to find the highly corelated features

# ensure the results are repeatable
set.seed(7)
# calculate correlation matrix
correlationMatrix <- cor(df[,1:9])
# summarize the correlation matrix
print(correlationMatrix)

highlyCorrelated <- findCorrelation(correlationMatrix, cutoff=0.5)
# print indexes of highly correlated attributes
print(highlyCorrelated)

corrplot(correlationMatrix, order= "hclust")







