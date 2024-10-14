#
# JB
# 2023/10/14
# Histogram
#

library(ggplot2)

ft <- faithful

  geom_histogram(binwidth = 5, fill = "white", colour = 'black') +
  labs(title="Old Faithful Geyser", x = 'Waiting', y = 'Count',
       caption = 'By JB, Data Visualization Course, Tunghai University, 2024') +
  theme(plot.title = element_text(hjust= 0.5, size = 20))

ggplot(faithful, aes (x=waiting))+
  geom_histogram(binwidth=5, fill='white', color='black')

ggplot(faithful, aes (x=waiting))+
  geom_histogram(binwidth=3, fill='white', color='black')+
  labs(title = "Old Faithful Geyser",
       x = 'Waiting',
       y= 'Count',
       caption= "By JB, Data Visualization, Tunghai University, 2024") +
  theme(plot.title = element_text(hjust= 0.5, size = 20))

# to find the binsize below, we need to find the range, which is Max - Min
# Max - Min function is the rnage(faithful$waiting)
# the simple formula is Max - Min / #bin = binwidth
# to automate the binsize to be mroe uniform we can use this formula

binsize <- diff(range(faithful$waiting))/15

ggplot(faithful, aes (x=waiting))+
  geom_histogram(binwidth=binsize, fill='white', color='black')

#when writing pr pbtaining the data birthwt in help, it's stated MASS:birthwt,
#which means that you need to install the MASS package before using birthwt dataset

install.packages('MASS')
library(MASS)

#facet_grid is a function to include 2 charts

ggplot(birthwt, aes(x = bwt))+ 
  geom_histogram(fill='white', color='black')+
  facet_grid(smoke ~ .)
  
ggplot(birthwt, aes(x = bwt)) + 
  geom_histogram(fill='white', color='black')+
  facet_grid(. ~ smoke)

# tidyverse is needed to use recode_factor
# recode_factor is a function to change binary into text, 1 and 0 to yes and no


library(tidyverse)

birthwt_mod <- birthwt
birthwt_mod$smoke <- recode_factor(birthwt_mod$smoke, '0' = 'No Smoke', '1' = 'Smoke')

ggplot(birthwt_mod, aes(x = bwt))+ 
  geom_histogram(fill='white', color='black')+
  facet_grid(smoke ~ .) + 
  labs(title="Birth Weight",
       x= 'Birth weight',
       y = 'Count', 
       caption = 'By JB, Data Visualization Course, Tunghai University, 2024') +
  theme(plot.title = element_text(hjust= 0.5, size = 15))

ggplot(birthwt_mod, aes(x = bwt)) + 
  geom_histogram(fill='white', color='black')+
  facet_grid(. ~ smoke) +
  labs(title="Birth Weight",
       x= 'Birth weight',
       y = 'Count', 
       caption = 'By JB, Data Visualization Course, Tunghai University, 2024') +
  theme(plot.title = element_text(hjust= 0.5, size = 15))

