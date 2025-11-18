#q1
data=read.csv("https://raw.githubusercontent.com/fivethirtyeight/data/master/daily-show-guests/daily_show_guests.csv")
head(data,10)

#q2
install.packages("dplyr")
colnames(data)
library(dplyr)
data=data %>% #pipe operator
  rename(
    year=YEAR ,
    job=GoogleKnowlege_Occupation  ,
    date=Show  ,
    category=Group  ,
    guest_name= Raw_Guest_List 
  )
#q3
report=data %>%
  select(year,date, guest_name)
head(report)

#q4
data_no_year =data %>%
  select(-year)
head(data_no_year)

#q5
actor_abc=data %>%
  filter(job=="actor" & guest_name=="ABC")
actor_abc

#q6 Since the dates are in a character format, first convert the column to a proper date format using mdy() from the lubridate package to ensure correct sorting.
install.packages("lubridate")
library(lubridate)
data_arranged=data %>% 
  mutate(date=mdy(date)) %>% #It converts strings in "month-day-year" format to Date objects.
  arrange(date)

#q7
data_with_experience =data %>%
  mutate(Experience =2025-year)

head(data_with_experience)

