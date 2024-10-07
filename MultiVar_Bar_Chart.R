#
# JB 
# Practice Bar Chart
#

library(gcookbook)
library(ggplot2)

#Longer Format Conversion - 2 Variable Bar Chart

#df is the name of the Data Set that we read from Accidents.csv
df <- read.csv('Accidents.csv')
accidents_longer <- df %>% pivot_longer(cols=c('Death', 'Injured'),
                                        names_to="Type",
                                        values_to='Count')

ggplot(accidents_longer, aes(x = as.factor(Year), y = Count, fill = Type)) +
  labs(title="Traffic Accidents",
       x= 'Year',
       caption = 'By JB, Data Visualization Course, Tunghai University, 2024') +
  theme(plot.title = element_text(hjust= 0.5, size = 20)) +
  geom_bar(position = 'dodge', stat= 'identity')

#Library needed for %>% and pivot_longer
library(magrittr)
library(tidyr)
library(dplyr)

#Banten
df <- read.csv('Banten_Climate.csv')
hometown_longer <- df %>% pivot_longer(cols=c('Temperature', 'Humidity'),
                                       names_to="Type",
                                       values_to='Metrics')

ggplot(hometown_longer, aes(x = as.factor(Month), y = Metrics, fill = Type)) +
  labs(title="Banten Annual Climate Trends",
       x= 'Month',
       caption = 'By JB, Data Visualization Course, Tunghai University, 2024') +
  theme(plot.title = element_text(hjust= 0.5, size = 20)) +
  geom_bar(position = 'dodge', stat= 'identity')
