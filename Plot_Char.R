# Load necessary libraries
library(randomForest)
library(e1071)
library(class)
library(ggplot2)
library(reshape2)
library(dplyr) # For data manipulation, if needed

# Set working directory
setwd("Your/directory/path")

# Load the dataset
iris_data <- read.csv("iris.csv", header = TRUE)

#Shows the head of the two columns we'll in the plot
data(iris_data)
data("iris")
heightweight%>%
  select(ageYear, heightIn)
  
ggplot(heightweight, aes(x = ageYear, y = heightIn))+
  labs(title="Age and Height",
       x= 'Age(Year)', y='Height(Inch)',
       caption = 'By JB, Data Visualization Course, Tunghai University, 2024') +
  theme(plot.title = element_text(hjust= 0.5, size = 20)) +
  geom_point()

#Add Color
ggplot(heightweight, aes(x = ageYear, y = heightIn, color = sex))+
  labs(title="Age and Height by Gender",
       x= 'Age(Year)', y='Height(Inch)',
       caption = 'By JB, Data Visualization Course, Tunghai University, 2024') +
  theme(plot.title = element_text(hjust= 0.5, size = 20)) +
  geom_point()
