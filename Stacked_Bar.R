# load the library
library(caret)
library(ggplot2)

# Unzip and load the database.csv

data=read.csv("../database.csv")
data=data[c("State","Year","Incident","Crime.Type","Crime.Solved","Victim.Sex","Victim.Age","Relationship","Weapon","Victim.Race")]
data= data[sample(1:nrow(data)), ]


Victim_Race = data$Victim.Race

p = ggplot(data, aes(data$Year, fill = Victim_Race)) + geom_bar()+ 
  labs(title = "Stacked Bar Chart", x = "Year", y = "Count of homicides")

p

