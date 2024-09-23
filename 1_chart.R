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