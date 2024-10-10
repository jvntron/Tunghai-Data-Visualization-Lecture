#
#   JB
# Data Visualization Report
# International Event
#

library(randomForest)
library(e1071)
library(class)
library(ggplot2)
library(reshape2)
library(magrittr)
library(tidyr)
library(dplyr)

#Read Raw Data in CSV Format
mg <- read.csv('Main_gate.csv')
sc <- read.csv('Second_Campus.csv')
ttl <- read.csv('THU.csv')

#Using Pivot Longer to Display Vehicle Types
mg_longer <- mg %>% pivot_longer(cols=c('Cars', 'Scooters'),
                                        names_to="Vehicles",
                                        values_to='Count')

sc_longer <- sc %>% pivot_longer(cols=c('Cars', 'Scooters'),
                                 names_to="Vehicles",
                                 values_to='Count')

Total_longer <- ttl %>% pivot_longer(cols=c('Cars', 'Scooters'),
                                 names_to="Vehicles",
                                 values_to='Count')

#Plotting the Bar Chart
ggplot(data=mg_longer, aes(x=as.factor(Day), y=Count, group=Vehicles, fill=Vehicles)) +
  labs(title="Traffic Stat in Tunghai's Main Gate",
       x= 'Days of the Week',
       caption = 'By JB, Data Visualization Course, Tunghai University, 2024') +
  theme(plot.title = element_text(hjust= 0.5, size = 15, margin = margin(b = 10)),
        axis.title.x = element_text(margin = margin(t = 5.5)),  
        axis.title.y = element_text(margin = margin(r = 5.5)),
        plot.caption = element_text(hjust = 1.38, size=7)) +  
  geom_bar(position = 'dodge', stat= 'identity') +
  geom_text(aes(label = Count), 
            position = position_dodge(0.9),   
            vjust = -0.3,                   
            size = 3) +
  scale_x_discrete(labels=c("1"="Monday", "2"="Tuesday", "3"="Wednesday", 
                            "4"="Thursday", "5"="Friday", 
                            "6"="Saturday", "7"="Sunday")) +
  scale_y_continuous(name = "Amount", breaks = seq(0, 4000, by = 250)) 

ggplot(data=sc_longer, aes(x=as.factor(Day), y=Count, group=Vehicles, fill=Vehicles)) +
  labs(title="Traffic Stat in Tunghai's Second Campus",
       x= 'Days of the Week',
       caption = 'By JB, Data Visualization Course, Tunghai University, 2024') +
  theme(plot.title = element_text(hjust= 0.5, size = 15, margin = margin(b = 10)),
        axis.title.x = element_text(margin = margin(t = 5.5)),  
        axis.title.y = element_text(margin = margin(r = 5.5)),
        plot.caption = element_text(hjust = 1.38, size=7)) +  
  geom_bar(position = 'dodge', stat= 'identity') +
  geom_text(aes(label = Count), 
            position = position_dodge(0.9),   
            vjust = -0.3,                   
            size = 3) +
  scale_x_discrete(labels=c("1"="Monday", "2"="Tuesday", "3"="Wednesday", 
                            "4"="Thursday", "5"="Friday", 
                            "6"="Saturday", "7"="Sunday")) +
  scale_y_continuous(name = "Amount", breaks = seq(0, 4000, by = 250)) 

ggplot(data=Total_longer, aes(x=as.factor(Day), y=Count, group=Vehicles, fill=Vehicles)) +
  labs(title="Total Traffic Stat in Tunghai's Campus",
       x= 'Days of the Week',
       caption = 'By JB, Data Visualization Course, Tunghai University, 2024') +
  theme(plot.title = element_text(hjust= 0.5, size = 15, margin = margin(b = 10)),
        axis.title.x = element_text(margin = margin(t = 5.5)),  
        axis.title.y = element_text(margin = margin(r = 5.5)),
        plot.caption = element_text(hjust = 1.38, size=7)) +  
  geom_bar(position = 'dodge', stat= 'identity') +
  geom_text(aes(label = Count), 
            position = position_dodge(0.9),   
            vjust = -0.3,                   
            size = 3) +
  scale_x_discrete(labels=c("1"="Monday", "2"="Tuesday", "3"="Wednesday", 
                            "4"="Thursday", "5"="Friday", 
                            "6"="Saturday", "7"="Sunday")) +
  scale_y_continuous(name = "Amount", breaks = seq(0, 4000, by = 500)) 

#Plotting the Line Chart
ggplot(data=mg_longer, aes(x=as.factor(Day), y=Count, group=Vehicles, fill=Vehicles)) +
  labs(title="Vehicles entering Tunghai's Main Gate",
       x= 'Days of the Week',
       caption = 'By JB, Data Visualization Course, Tunghai University, 2024') +
  theme(plot.title = element_text(hjust= 0.5, size = 15),
  axis.title.x = element_text(margin = margin(t = 5.5)),  
  axis.title.y = element_text(margin = margin(r = 5.5)),
  plot.caption = element_text(hjust = 1.38, size=7)) +  
  geom_line(aes(color=Vehicles))+
  geom_point() +
  scale_x_discrete(labels=c("1"="Monday", "2"="Tuesday", "3"="Wednesday", 
                            "4"="Thursday", "5"="Friday", 
                            "6"="Saturday", "7"="Sunday")) +
  scale_y_continuous(name = "Amount", breaks = seq(0, 2093, by = 250)) 

ggplot(data=sc_longer, aes(x=as.factor(Day), y=Count, group=Vehicles, fill=Vehicles)) +
  labs(title="Vehicles entering Tunghai's Second Campus",
       x= 'Days of the Week',
       caption = 'By JB, Data Visualization Course, Tunghai University, 2024') +
  theme(plot.title = element_text(hjust= 0.5, size = 15),
        axis.title.x = element_text(margin = margin(t = 5.5)),  
        axis.title.y = element_text(margin = margin(r = 5.5)),
        plot.caption = element_text(hjust = 1.38, size=7)) +  
  geom_line(aes(color=Vehicles))+
  geom_point() +
  scale_x_discrete(labels=c("1"="Monday", "2"="Tuesday", "3"="Wednesday", 
                            "4"="Thursday", "5"="Friday", 
                            "6"="Saturday", "7"="Sunday")) +
  scale_y_continuous(name = "Amount", breaks = seq(0, 2093, by = 250)) 

ggplot(data=Total_longer, aes(x=as.factor(Day), y=Count, group=Vehicles, fill=Vehicles)) +
  labs(title="Total Vehicles entering Tunghai's Campus",
       x= 'Days of the Week',
       caption = 'By JB, Data Visualization Course, Tunghai University, 2024') +
  theme(plot.title = element_text(hjust= 0.5, size = 15),
        axis.title.x = element_text(margin = margin(t = 5.5)),  
        axis.title.y = element_text(margin = margin(r = 5.5)),
        plot.caption = element_text(hjust = 1.38, size=7)) +  
  geom_line(aes(color=Vehicles))+
  geom_point() +
  scale_x_discrete(labels=c("1"="Monday", "2"="Tuesday", "3"="Wednesday", 
                            "4"="Thursday", "5"="Friday", 
                            "6"="Saturday", "7"="Sunday")) +
  scale_y_continuous(name = "Amount", breaks = seq(0, 4000, by = 500)) 
