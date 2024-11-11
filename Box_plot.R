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

# 11/04/2024

ggplot(tg, aes(x = dose, y = len, fill = dose)) +
  geom_boxplot() + 
  labs(title="Box Plot with ggplot",
       x= 'Supplement and Dose',
       y='Length',
       caption = 'By JB, Data Visualization Course, Tunghai University, 2024') +
  theme(plot.title = element_text(hjust= 0.5, size = 20))

tg$dose <- as.factor(tg$dose)

ggplot(tg, aes(x = dose, y = len, fill = dose)) +
  geom_boxplot() + 
  labs(title="Box Plot with ggplot",
       x= 'Supplement and Dose',
       y='Length',
       caption = 'By JB, Data Visualization Course, Tunghai University, 2024')+
  scale_fill_discrete(name = 'Dose')+
  theme(plot.title = element_text(hjust= 0.5, size = 20), legend.position= 'bottom')

library(viridis)

ggplot(iris, aes(x = Species, y = Sepal.Length, fill = Species)) +
  stat_summary(fun.y = "mean", geom = 'point', shape = 15, size = 5, fill = 'white')+ #Adding the Line in the middlel and box
  scale_fill_viridis(discrete = TRUE, alpha = 0.6) + #Changing the color of the Box Plot
  geom_boxplot(notch= TRUE) + 
  labs(title="Iris",
       x= 'Species',
       y='Sepal Length',
       caption = 'By JB, Data Visualization Course, Tunghai University, 2024') +
  theme(plot.title = element_text(hjust= 0.5, size = 20))

#Dot Plot
ntg <- tg %>%
       filter(dose == 0.5 & len > 10)

ggplot(ntg, aes(x=len))+
  geom_dotplot() +
  labs(title= "Tooth Growth",
       x = "Length",
       y = "Count",
       caption = 'By JB, Data Visualization Course, Tunghai University, 2024') +
  theme(plot.title = element_text(hjust= 0.5, size = 20))

#Without Making the Temporary Data (ntg) 
tg %>%
  filter(dose == 0.5 & len > 10) %>%
  ggplot(aes(x=len))+
  geom_dotplot() +
  labs(title= "Tooth Growth",
       x = "Length",
       y = "Count",
       caption = 'By JB, Data Visualization Course, Tunghai University, 2024') +
  theme(plot.title = element_text(hjust= 0.5, size = 20))

# Annotations 

library(ggplot2)

p <- ggplot(faithful, aes(x=eruptions, y=waiting)) +
    geom_point()

p + 
  annotate("text", x = 1.8, y = 73, label = "Group 1")+
  annotate("text", x = 3.7, y = 95, label = "Group 2")
  
faithful$color <- ifelse(faithful$eruptions > 3, "Group 2", "Group 1") 

p <- ggplot(faithful, aes(x=eruptions, y=waiting, color = color)) +
  geom_point()+
  labs(color = "Group Number",
       title= "Faithful",
       x = "Eruptions",
       y = "Waiting",
       caption = 'By JB, Data Visualization Course, Tunghai University, 2024')+
  theme(plot.title = element_text(hjust= 0.5, size = 20))

p + 
  annotate("text", x = 1.8, y = 73, label = "Group 1")+
  annotate("text", x = 3.7, y = 95, label = "Group 2")

# iLearn Box Plot Assignment

# Load necessary library
library(ggplot2)
# Load the Iris dataset (available by default in R)
data(iris)
# Create the box plot
ggplot(iris, aes(x = Species, y = Sepal.Length, fill = Species)) +
  geom_boxplot() +
  labs(title = "Iris", x = "Species", y = "Sepal Length",
       caption = 'By JB, Data Visualization Course, Tunghai University, 2024')+
  theme(plot.title = element_text(hjust= 0.5, size = 20))

# iLearn Engine 
engine <- mtcars
engine$cyl <- as.factor(engine$cyl)
ggplot(engine, aes(x = cyl, y = mpg, fill = cyl)) +
  geom_boxplot() +
  labs(title = "Engine and Cylinder", x = "# of cylinder", y = "MPG", fill= "# of cylinder",
       caption = 'By JB, Data Visualization Course, Tunghai University, 2024')+
  theme(plot.title = element_text(hjust= 0.5, size = 20,), legend.position = "bottom")


# iLearn Dot Plot Assignment - Health and Economic 

# Load necessary library
library(ggplot2)
library(gcookbook)
fi <- countries
# Filter the data and directly create Box Plot without temporary data)
fi$infmortality <- as.factor(fi$infmortality)

fi %>%
  filter(Year == 2009 & healthexp > 2000)%>%
  ggplot(aes(x = infmortality, fill = infmortality)) +
  geom_dotplot(binwidth = 0.2) +
  scale_color_manual(values = cvector) +
  labs(title = "Infant Mortality (Year == 2009 & healthexp > 2000)", 
       x = "Infant Mortality", 
       y = "Count",
       caption = 'By JB, Data Visualization Course, Tunghai University, 2024')+
  theme(plot.title = element_text(hjust= 0.5, size = 15))

fi %>%
  filter(Year == 2009 & healthexp > 2000)%>%
  ggplot(aes(x = infmortality)) +
  geom_dotplot(binwidth = 0.2) +
  scale_color_manual(values = cvector) +
  labs(title = "Infant Mortality (Year == 2009 & healthexp > 2000)", 
       x = "Infant Mortality", 
       y = "Count",
       caption = 'By JB, Data Visualization Course, Tunghai University, 2024')+
  theme(plot.title = element_text(hjust= 0.5, size = 15))
  





