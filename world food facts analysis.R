#load data.table
install.packages("data.table")
library(data.table)

#importing food.csv:food
food <- read.csv("world_food_facts", stringsAsFactors =FALSE)

#convert data to frame
food <-data.frame(food)

library(dplyr)

#view of glimpse of food
glimpse(food)

#view columns name of food
names(food)

#view summary of food
summary(food[,1:10])

#view head( of food)
head(food[,1:10])

#view structure of food
str(food[,1:10])

#Define vector of duplicate cols
duplicates <-c(4,6,11,13,15,17,18,20,22,
               24,25,28,32,36,38,40,44,
               46,48,51,54,65,158) 

#define duplicate from food:food2
food2 <-food[,-duplicates]

#define useless vector
useless <-c(1,2,3,32:41)

#remove useless column from food2:food3
food3 <-food2[, -useless]

library(stringr)

#create vector of column indices:nutrition
nutrition <- str_detect(names(food3),"100g")
nutrition

#view a summary o nutrition col.
summary(food3[,nutrition])

#Find indices of sugar NA values: missing
missing <-is.na(food3$sugars_100g)
missing
#Replace NA  values with 0
food3$sugars_100g[missing] <-0
food3$sugars_100g
#create first hist
hist(food3$sugars_100g, breaks = 100)

#create food4
food4 <-food3[food3$sugars_100g !=0, ]

#create second histogram
hist(food$sugars_100g,breaks = 100)

#create entries containing "plasti":plastic\
plastic <-str_detect(food$packaging_tags, "plasti")
plastic
#print the sum of plastic
sum(plastic)
