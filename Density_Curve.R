#
# JB  
# 2024/10/21
# Data Visualization - Density Curve
#

library(ggplot2)
library(gcookbook)

ggplot(faithful, aes(x=waiting)) +
   geom_density(fill = "blue", alpha = .2) + 
  xlim(35,105) +
  labs(title="Density Curve",
       x= 'Waiting',
       y='Density',
       caption = 'By JB, Data Visualization Course, Tunghai University, 2024') +
  theme(plot.title = element_text(hjust= 0.5, size = 20))

#Histogram and Density curve
ggplot(faithful, aes(x=waiting, y= ..density..)) +
  geom_histogram(fill = "cornsilk", color = "grey60", size = .2) +
  geom_density()+
  xlim(35, 105) +
  labs(title="Density Curve",
       x= 'Waiting',
       y='Density',
       caption = 'By JB, Data Visualization Course, Tunghai University, 2024') +
  theme(plot.title = element_text(hjust= 0.5, size = 20))

#Stock Price Histogram and Density Chart Practice
ss= read.csv('Stocks.csv')

#Rescale the y-axis of the histogram using ..density..
ggplot(ss, aes(x=Price, y=..density..)) +
  geom_histogram(fill = "cornsilk", color = "grey60", size = .2) +
  geom_density()+
  labs(title="Stock Price: Histogram and Density Chart",
       y= 'Density',
       caption = 'By JB, Data Visualization Course, Tunghai University, 2024') +
  theme(plot.title = element_text(hjust= 0.5, size = 20))

#Key Prices Exercise

ggplot(ss, aes(x=Price)) +
  geom_density(fill = "lightblue", alpha = .6) +
  geom_vline(xintercept = c(80,100,120) , linetype= 2, size= 1, color = "red")+
  labs(title="Stock Price with Key Price Change",
       x= 'Price',
       y='Density',
       caption = 'By JB, Data Visualization Course, Tunghai University, 2024') +
  theme(plot.title = element_text(hjust= 0.5, size = 20))

#Birth Weight: Smoking vs Non- Smoking

#Get Datasets
install.packages('MASS')
library(MASS)

#Change using Recode Factor
library(tidyverse)

birthwt_mod <- birthwt
birthwt_mod$smoke <- recode_factor(birthwt_mod$smoke, '0' = 'No Smoke', '1' = 'Smoke')

ggplot(birthwt_mod, aes(x=bwt, fill=factor(smoke))) +
  geom_density(alpha = .25) +
  labs(title="Birth Weight: Smoking vs Non- Smoking",
       x= 'Birth Weight',
       y='Density',
       fill= "Smoking Status",
       caption = 'By JB, Data Visualization Course, Tunghai University, 2024') +
  scale_fill_discrete(labels = c("Non Smoking", "Smoking")) +
  theme(plot.title = element_text(hjust= 0.5, size = 20))

# scale_fill_manual(values = c("pink", "lightblue")) for manual change of colors
# scale_fill_discrete (labels = c(...)) can also be used to change the label of the legend
#
# howevere using scale_fill_manual you can also change the label, but you have to add the
# values first before hanging the label

#class practice 
ggplot(birthwt_mod, aes(x=bwt, fill= smoke)) +
  geom_density() +
  labs(title="Birth Weight: Smoking vs Non- Smoking",
       x= 'Birth Weight',
       y='Density',
       fill= "Smoke",
       caption = 'By JB, Data Visualization Course, Tunghai University, 2024') +
  theme(plot.title = element_text(hjust= 0.5, size = 20))


