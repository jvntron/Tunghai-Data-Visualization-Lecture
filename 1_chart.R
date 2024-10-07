#
# JB 
# Practice Bar Chart
#

library(gcookbook)
library(ggplot2)

ggplot(pg_mean, aes(x=group, y=weight)) +
  geom_col()

ggplot(pg_mean, aes(x=group, y=weight)) +
  geom_point()

ggplot(pg_mean, aes(x="", y=weight, fill= group)) +
  geom_col() +
  coord_polar(theta = "y")

# Draw a Bar Chart pg_mean
ggplot(pg_mean, aes (x = group, y = weight, fill = group)) + 
  geom_col() +
  labs(title="Bar Chart, Color",
       caption = 'By JB, Data Visualization Course, Tunghai University, 2024') +
  theme(plot.title = element_text(hjust= 0.5, size = 20))


# Draw a Line Chart BOD
ggplot(BOD, aes (x = Time, y = demand)) + 
  geom_line() +
  labs(title= "Line Chart", 
       caption = 'By JB, Data Visualization Course, Tunghai University, 2024') +
  theme(plot.title = element_text(hjust= 0.5, size = 20))

# Draw a Count Chart diamonds
ggplot(diamonds, aes (x = carat)) + 
  geom_bar() +
  labs(title= "Bar chart", 
       caption = 'By JB, Data Visualization Course, Tunghai University, 2024') +
  theme(plot.title = element_text(hjust= 0.5, size = 20))

# Draw a Histogram diamonds
ggplot(diamonds, aes (x = carat)) + 
  geom_histogram() +
  labs(title= "Histogram chart", 
       caption = 'By JB, Data Visualization Course, Tunghai University, 2024') +
  theme(plot.title = element_text(hjust= 0.5, size = 20))

# Read Data from CSV
df <- read.csv('Banten_Climate.csv')

# Draw a chart from CSV
ggplot(df, aes (x = Month, y = Temperature)) + 
  geom_col() +
  scale_x_continuous(breaks = seq_along(month.name), labels = month.name) +
  labs(title="Banten Annual Average Temperature",
       caption = 'By JB, Data Visualization Course, Tunghai University, 2024') +
  theme(plot.title = element_text(hjust= 0.5, size = 20))

ggplot(df, aes (x = Month, y = Humidity)) +
  geom_col() +
  scale_x_continuous(breaks = seq(from = 1, to = 12, by = 1)) +
  labs(title="Banten Annual Average Humidity",
       caption = 'By JB, Data Visualization Course, Tunghai University, 2024') +
  theme(plot.title = element_text(hjust= 0.5, size = 20))
