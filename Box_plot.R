#
# JB  
# 2024/10/21
# Data Visualization - Box Plot
#

tg <- ToothGrowth

#you don't need ggplot to make boxplot, R have it own original function
plot(ToothGrowth$supp, ToothGrowth$len)

#Formula syntax
boxplot(len ~ supp, data = ToothGrowth)

#Put Intersection of two variable on x-axis
boxplot(len ~ supp + dose, data = ToothGrowth)

library(ggplot2)
ggplot(ToothGrowth, aes(x=supp, y= len)) +
  geom_boxplot()

#Use supp, dose for X axis
ggplot(ToothGrowth, aes(x=interaction(supp,dose), y = len)) +
  geom_boxplot() + 
  labs(title="Box Plot with ggplot",
       x= 'Supplement and Dose',
       y='Length',
       caption = 'By JB, Data Visualization Course, Tunghai University, 2024') +
  theme(plot.title = element_text(hjust= 0.5, size = 20))

