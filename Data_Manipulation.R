#
#   JB - S10920621
#   Data Visualization - Tunghai University
#   Data Manipulation
#

library(dplyr)
score <- read.csv('student_scores.csv')

score %>%
  filter(English > 60 & Math > 70 & class_year==2)

# Select English and Math Columns
score %>%
  filter(English > 60 & Math > 70 & class_year==2) %>%
  select(English, Math)

# Calculate average and add column
score_avg <- score %>%
  mutate(avg = (English + Math + Science)/3)

# Calculate group average
score_avg %>%
  group_by(class_year) %>%
  summarize(avg_English = mean(English),
            avg_Math = mean(Math))


mc <- mtcars
mc %>%
  select(mpg, hp, wt, cyl)
  mutate(wt_kg = wt * 453.59237)
  group_by(cyl) %>%
  summarize(avg_mpg = mean(mpg),
            avg_hp = mean(hp),
            avg_wt_kg = (wt_kg))
            