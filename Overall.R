#
# JB
# 2024/12/02
#

library(gcookbook)
library(ggplot2)
library(gridExtra)

hw_plot <- ggplot(heightweight, aes (x = ageYear, y= heightIn))+
  geom_point() +
  ggtitle('Age and Height:', 'From heightweight dataset')

#title, subtitle
#help more information, just press F1 on any function

hw_plot

hw_plot +
  ggtitle("Age and Height of Schoolchildren")

# Use \n for a newline
hw_plot +
  gg_title("Age and Height\nof Schoolchildren")

#Lab 1 

plot1 <- ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width))+
          geom_point()+
          labs(title = 'Sepal Length and Sepal Width',
              x='Sepal Length',
              y='Sepal Width')
  
plot2 <- ggplot(iris, aes(x=Sepal.Width, y=Petal.Length))+
         geom_point()+
         labs(title = 'Sepal Width and Petal Length',
              x='Sepal Length',
              y='Sepal Width') +
         theme(plot.title = element_text(hjust = 0.5))
  
plot3 <- ggplot(iris, aes(x=Sepal.Length, y=Petal.Width))+
         geom_point()+
         labs(title = 'Sepal Length and Petal Width',
              x='Sepal Length',
              y='Sepal Width')+
         theme(plot.title = element_text(hjust = 1))

grid.arrange(plot1, plot2, plot3, ncol=3, top = 'Subplots')

# Change Font color and Font

p1 <- ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width))+
  geom_point()+
  labs(title = 'Sepal Length and Sepal Width',
       x='Sepal Length',
       y='Sepal Width') +
  theme(axis.title.x = element_text(hjust=0.5,
                                  color='red',
                                  family = 'Times',
                                  fac = 'bold.italic'))

p2 <- ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width))+
  geom_point()+
  labs(title = 'Sepal Length and Sepal Width',
       x='Sepal Length',
       y='Sepal Width') +
  theme(plot.title = element_text(hjust=0.5,
                                  color='red',
                                  family = 'Times',
                                  fac = 'bold.italic',
                                  size=20))

grid.arrange(p1,p2, ncol =2, top='Title Font and Color')

ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width))+
  geom_point()+
  labs(title = 'Sepal Length and Sepal Width',
       x='Sepal Length',
       y='Sepal Width') +
  theme_dark()

#Labs 2
h1 <- ggplot(heightweight, aes(x=ageYear, y=heightIn))+
  geom_point()+
  labs(title = 'Age and Height of Schoolchildren', 
       subtitle = '11.5 to 17.5 years old') +
  theme_gray()

h2 <- ggplot(heightweight, aes(x=ageYear, y=heightIn))+
  geom_point()+
  labs(title = 'Age and Height of Schoolchildren', 
       subtitle = '11.5 to 17.5 years old') +
  theme_minimal()

h3 <- ggplot(heightweight, aes(x=ageYear, y=heightIn))+
  geom_point()+
  labs(title = 'Age and Height of Schoolchildren',
       subtitle= '11.5 to 17.5 years old') +
  theme_classic()

grid.arrange(h1,h2,h3, ncol =3, top='Various Type of Themes')

#Economist Theme Chart
library(ggthemes)
h1 + theme_economist() + 
  scale_color_economist()

h1 + theme_wsj() + 
  scale_color_wsj('colors6')

h1 + theme(
  panel.grid.major = element_line(colour = "red"),
  panel.grid.minor = element_line(colour = "red", linetype = "dashed", size = 0.2),
  panel.background = element_rect(fill = "lightblue"), 
  panel.border = element_rect(colour = "blue", fill = NA, size = 2)
)

mytheme <- theme(panel.grid.major = element_line(colour = "red"),
                 panel.grid.minor = element_line(colour = "red", linetype = "dashed", size = 0.2),
                 panel.border = element_rect(colour = "blue", fill = NA, size = 2)
)

text <- labs(caption = 'By JB, Data Vizualization Course, Tunghai University, 2024')

plot1 + mytheme + text 

plot1 + mytheme + text + theme(panel.grid.major.x = element_blank(),
                               panel.grid.minor.x = element_blank())

plot1 + mytheme + text + theme(panel.grid.major.y = element_blank(),
                               panel.grid.minor.y = element_blank())


