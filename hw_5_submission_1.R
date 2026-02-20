#Homework 5 submission


library(tidyverse)
library(dplyr)

#Q1: read_csv 
colloquium_assessment <- read_csv("r projects i think i did this right/notes/2_18_class/micr_rda_c5_7-main/data/colloquium_assessment.csv")
View(colloquium_assessment)

#Q2.1: clean the table
update_assess <- colloquium_assessment |>
  pivot_longer(cols=c('Q4', 'Q5', 'Q6', 'Q7', 'Q8', 'Q9', 'Q10'),
               names_to = 'Question',
               values_to = 'score')
View(update_assess)

#Q2.2: clear any non numerical values so that everything in the Q column is <dblr>
clean_assess <- update_assess |>
  mutate(
    Question = parse_number(Question)
  ) |>
  filter(!is.na(Question))
View(clean_assess)


#Q3: calculate average
avg_score <- clean_assess |>
  summarize(avg_Q = mean(Question, na.rm = TRUE))

#Q4: Peer review
