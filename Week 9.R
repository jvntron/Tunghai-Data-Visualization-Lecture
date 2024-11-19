#
# Add group column
# Group 1 : eruption < 3
# Group 2 : eruption > 3
#

my_faithful <- faithful

# Method 1
my_faithful$group <- ifelse(my_faithful$eruptions > 3, 2, 1)

# Method 2
library (dplyr)
my_faithful <- my_faithful %›%
  mutate group = ifelse (eruptions > 3, 2, 1))

#
# Change legend title text using labs ()
#

my_faithful$group = as.numeric(my_faithful$group)

ggplot(my_faithful, aes(x = eruptions, y = waiting, color = group)) +
  geom_point() +
  labs (color = 'Group') +
  annotate("text", x = 3, y = 48, label = "Group 1") +
annotate( "text", x = 4.5, y = 66, label = "Group 2")

#
# Change legend title text using scale_color _discrete()
#

my_faithful$group = as.factor(my_faithful$group)

ggplot(my_faithful, aes (x = eruptions, y = waiting, color = group)) +
geom_point() +
scale_color_discrete(name = 'Group') +
annotate ("text", x = 3, y = 48, label = "Group 1") +
annotate("text", x = 4.5, y = 66, label = "Group 2")

groupfaithful <- faithful
groupfaithful$group <- ifelse(groupfaithful$eruptions < 3, "Group 1", "Group 2")

ggplot(groupfaithful, aes(x = eruptions, y = waiting,color = group)) +
  geom_point()+
  labs(title="Faithful: Eruption waiting",
       x = 'Eruptions', 
       y = 'Waiting',
       caption = 'By JB, Data Vizualization Course, Tunghai University, 2024')+
  scale_color_discrete(name= 'Group',labels = c("1", "2"))+
  theme(plot.title = element_text(hjust = 0.5, size=20))+
  annotate('text', x = 2, y  = 80, label = "Group 1") +
  annotate('text', x = 3.5, y = 90, label = "Group 2")

#
# Group 1 : waiting < 65 | Group 2 : otherwise
#

my_faithful$group <- ifelse(my_faithful$waiting < 65, 1,2)

ggplot(my_faithful, aes(x = eruptions, y = waiting, color = group)) +
  geom_point() +
  labs(title="Faithful: Eruption waiting",
       x = 'Eruptions', 
       y = 'Waiting',
       color = "Groups",
       caption = 'By JB, Data Vizualization Course, Tunghai University, 2024')+
  theme(plot.title = element_text(hjust = 0.5, size=20))+
  annotate("text", x = 3, y = 48, label = "Group 1") +
  annotate( "text", x = 4.5, y = 66, label = "Group 2")

#
# Group 1 : waiting < 75 and eruption < 4 | Group 2 : otherwise
#

my_faithful$group <- ifelse(my_faithful$waiting < 75 & my_faithful$eruption < 4, 1,2)
my_faithful$group = as.factor(my_faithful$group)

ggplot(my_faithful, aes(x = eruptions, y = waiting, color = group)) +
  geom_point() +
  labs(title="Faithful: Eruption waiting",
       x = 'Eruptions', 
       y = 'Waiting',
       color = "Groups",
       caption = 'By JB, Data Vizualization Course, Tunghai University, 2024')+
  theme(plot.title = element_text(hjust = 0.5, size=20))+
  annotate("text", x = 3, y = 48, label = "Group 1") +
  annotate( "text", x = 4.5, y = 66, label = "Group 2")


ggplot(mtcars, aes(wt,mpg,label=rownames(mtcars))) +
  geom_point()+
  geom_text()

library()
library(graphics)
library(ggrepel)
ggplot(mtcars, aes(wt,mpg))+
  geom_point()+
  geom_text_repel(aes(label = rownames(mtcars)), size = 3.5) +
  labs(title="Weight and Mileage",
       x = 'Weight', 
       y = 'Mileage',
       color = "Groups",
       caption = 'By JB, Data Vizualization Course, Tunghai University, 2024')+
  theme(plot.title = element_text(hjust = 0.5, size=20))

# A normal curve
ggplot(data.frame (x = c(-3,3)), aes(x = x)) +
  stat_function(fun = dnorm, color = 'blue', fill= 'red', geom = 'polygon', alpha = 0.5)+
  annotate ("text", x = 2, y = 0.3, parse = TRUE,
                 label = "frac(1, sqrt(2 * pi)) * e ^ {-x^2 / 2}") +
  labs(title="Normal Distribution",
       x = 'x', 
       y = 'y',
       caption = 'By JB, Data Vizualization Course, Tunghai University, 2024')+
  theme(plot.title = element_text(hjust = 0.5, size=20))


#Assignment Weight and Mileage
ggplot(mtcars, aes(wt,mpg))+
  geom_point()+
  geom_label_repel(aes(label = rownames(mtcars)), size = 3.5) +
  labs(title="Weight and Mileage",
       x = 'Weight', 
       y = 'Mileage',
       color = "Groups",
       caption = 'By JB, Data Vizualization Course, Tunghai University, 2024')+
  theme(plot.title = element_text(hjust = 0.5, size=20))

#Assignmenet Sin and Cos

# Load necessary library
library(ggplot2)

# Create a sequence of x values
x <- seq(-2 * pi, 2 * pi, length.out = 100)

# Create a data frame with x, sin(x), and cos(x)
df <- data.frame(
  x = x,
  sin = sin(x),
  cos = cos(x)
)

# Create the plot
ggplot(df, aes(x = x)) +
  geom_line(aes(y = sin, color = "sin"), size = 1) +
  geom_line(aes(y = cos, color = "cos"), size = 1) +
  scale_color_manual(values = c("sin" = "red", "cos" = "blue")) +
  labs(title="Weight and Mileage",
       x = 'x', 
       y = 'y',
       color = "Groups",
       caption = 'By JB, Data Vizualization Course, Tunghai University, 2024')+
  theme(plot.title = element_text(hjust = 0.5, size=20))

hawktuah <- data.frame(
  x = seq(-pi, pi, length.out = 100),
  sin_x = sin(seq(-pi, pi, length.out = 100)),
  cos_x = cos(seq(-pi, pi, length.out = 100))
)

ggplot(hawktuah) +
  geom_line(aes(x = x, y = sin_x), color = "blue") + 
  geom_line(aes(x = x, y = cos_x), color = "red") + 
  labs(title = "Sin and Cos", x = "X", y = "Y") +
  theme(plot.title = element_text(hjust = 0.5, size=20))+
  labs(caption = "By JB, DV, THU, 2024")

library (gcookbook) # Load gcookbook for the heightweight data set
ggplot(heightweight, aes (x = ageYear, y = heightIn, colour = sex)) +
  geom_point() +
  geom_hline (yintercept = 60) +
  geom_vline(xintercept = 14) +
  labs(title = 'Age and Height',
       x = 'Age(Year)',
       y = 'Height(Inch) ' ,
       caption = "By JB, DV, THU, 2024") +
  theme(plot.title = element_text(hjust = 0.5, size = 20))

ggplot(heightweight, aes (x = ageYear, y = heightIn, colour = sex)) +
  geom_point() +
  geom_hline (yintercept = 60) +
  geom_vline(xintercept = 14) +
  geom_abline(intercept = 37.4, slope = 1.74) +
  labs(title = 'Age and Height',
       x = 'Age(Year)',
       y = 'Height(Inch) ' ,
       caption = "By JB, DV, THU, 2024") +
  theme(plot.title = element_text(hjust = 0.5, size = 20))

#
# Add line segment and arrow
# library(dplyr)
#

library(gcookbook) # Load gookbook for the climate data set
ggplot(filter (climate, Source == "Berkeley"), aes(x = Year, y = Anomaly10y)) +
  geom_line() +
  annotate( "segment", x = 1950, xend = 1980, y = -.25, yend =-.25) +
  annotate( "segment", x = 1850, xend = 1820, y = -.8, yend = -.95,
            colour= 'blue', size=2, arrow=arrow()) +
  annotate("segment", x = 1950, xend = 1980, y = -.25, yend = -.25, arrow = arrow(ends = "both", angle = 90, length = unit(.2, "cm"))) +
  labs(title = 'Year and Anomaly',
        caption = 'By JB, DV, THU, 2024') +
  theme(plot.title = element_text(hjust = 0.5, size = 20))

ggplot(filter (climate, Source == "Berkeley"), aes(x = Year, y = Anomaly10y)) +
  geom_line() +
  annotate( "rect", xmin = 1950, xmax = 1980, ymin = -1, ymax =1,
            alpha = .1, fill = "blue") +
  labs(title = 'Year and Anomaly',
       caption = 'By JB, DV, THU, 2024') +
  theme(plot.title = element_text(hjust = 0.5, size = 20))

ggplot(filter (climate, Source == "Berkeley"), aes(x = Year, y = Anomaly10y)) +
  geom_line() +
  annotate( "rect", xmin = 1800, xmax = 2000, ymin = -1, ymax =1,
            alpha = 1, fill = "red") +
  annotate( "point", x = 1900, y = 0,
            alpha = 1, color = "white", size = 100) +
  annotate( "rect", xmin = 1895, xmax = 1905, ymin = -0.5, ymax =.5,
            alpha = 1, fill = "black") +
  annotate( "rect", xmin = 1875, xmax = 1925, ymin = -0.09, ymax =0.09,
            alpha = 1, fill = "black") +
  
  annotate( "rect", xmin = 1915, xmax = 1925, ymin = 0, ymax =.5,
            alpha = 1, fill = "black") +
  annotate( "rect", xmin = 1875, xmax = 1900, ymin = .35, ymax =.5,
            alpha = 1, fill = "black") +
  annotate( "rect", xmin = 1875, xmax = 1885, ymin = -.5, ymax =0,
            alpha = 1, fill = "black") +
  annotate( "rect", xmin = 1900, xmax = 1925, ymin = -.5, ymax =-.35,
            alpha = 1, fill = "black") +
  labs(title = 'Year and Anomaly',
       caption = 'By James, DV, THU, 2024') +
  theme(plot.title = element_text(hjust = 0.5, size = 20))



# Assignment 3

annotation_data <- data.frame(
  Species = c("setosa", "versicolor", "virginica"),
  Sepal.Length = c(7, 7, 7),  # Adjust these positions as needed
  Sepal.Width = c(4, 4, 4),   # Adjust these positions as needed
  label = c("Setosa", "Versicolor", "Virginica")
)

ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point() +
  geom_text(data = annotation_data, aes(label = label), hjust = 0.5) +
  facet_wrap(~ Species) +
  labs(title = "Iris",
       x = "Sepal length",
       y = "Sepal width",
       caption = "By JB, Data Visualization course, Tunghai University, 2024")+
  theme(plot.title = element_text(hjust = 0.5, size = 20))

library(dplyr)
library(magrittr)
pg_mod <- PlantGrowth %>%
  mutate(h1 = recode(group, "ctrl" = "no", "trt1" = "no", "trt2" = "yes"))

ggplot(pg_mod, aes(x = group, y = weight, fill = h1)) +
geom_boxplot () +
scale_fill_manual (values = c("grey85","#FFDDCC"), guide = FALSE) +
  labs(title = "Group and Weight",
       x = 'Group',
       y = 'Weight',
       caption = "By JB, Data Visualization course, Tunghai University, 2024")+
  theme(plot.title = element_text(hjust = 0.5, size = 20))

#
# Adding error bars
#

library(gcookbook) # Load gookbook for the cabbage_exp data set
library(dplyr)

# Take a subset of the cabbage_exp data for this example
ce_mod <- cabbage_exp %>%
  filter(Cultivar == 'c39')

# With a bar graph
ggplot(ce_mod, aes(x = Date, y = Weight)) +
  geom_col(fill = "white", colour = "black") +
  geom_errorbar (aes(ymin = Weight - se, ymax = Weight + se), width = .2) +
  labs(title = 'Date and Weight' ,
       caption = 'By JB, Data Visualization course, Tunghai University, 2024') +
  theme (plot.title = element_text(hjust = 0.5, size = 20))

#Annotation on Facets

#
# Adding annotations to individual facets
#
# Create the base plot

mpg_plot <- ggplot(mpg, aes(x=displ, y = hwy))+
  geom_point() +
  facet_grid(. ~ drv)

# A data frame with labels for each facet
f_labels <- data.frame(drv = c("4","f","r"), label=c("4wd", "Front", "Rear"))

mpg_plot +
  geom_text(x = 6, y = 40, aes(label = label), data = f_labels) +
  labs(title = "Engine and Highway Mileage",
       x = "Engine Displacement",
       y = "Highway mileage",
       caption = "By JB, Data Visualization course, Tunghai University, 2024")+
  theme(plot.title = element_text(hjust = 0.5, size = 20))

#Exercise 3 - Iris (Redo)
iris_plot <- ggplot(iris, aes(x=Sepal.Length, y = Sepal.Width))+
  geom_point() +
  facet_grid(. ~ Species)

# A data frame with labels for each facet
g_labels <- data.frame(Species = c("setosa", "versicolor", "virginica"), 
                       label=c("Setosa", "Versicolor", "Virginica"))

iris_plot +
  geom_text(x = 7, y = 4, aes(label = label), data = g_labels) +
  labs(title = "Iris",
       x = "Sepal length",
       y = "Sepal width",
       caption = "By JB, Data Visualization course, Tunghai University, 2024")+
  theme(plot.title = element_text(hjust = 0.5, size = 20))


