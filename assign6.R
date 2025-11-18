install.packages("dplyr")
library(dplyr)

set.seed(123)

mydata<-data.frame(
  country=c(rep("Pak",10),rep("India",10)),
  continent=rep("Asia",20),
  year=2001:2020,
  lifeexp=round(runif(20,71,83),1),
  Pop       = round(runif(20, 1000000, 1500000)), 
  gdpPerc   = round(runif(20, 1000, 5000), 2) 
  )
head(mydata)

#q1.1
mydata%>%
  group_by(continent)%>%
  summarise(unique_countires=n_distinct(country))
 
#q1.2
mydata%>%
  filter(continent=="Europe")%>%
  slice_min(order_by=gdpPerc,n=1)%>%
  select(country,year,gdpPerc)

#q1.3
mydata%>%
  group_by(continent,year)%>%
  summarise(avg_life_exp=mean(lifeexp))

#q1.4
mydata%>%
  mutate(totalGdp=Pop*gdpPerc)%>%
  group_by(country)%>%
  summarise(overall_gdp=sum(totalGdp))%>%
  arrange(desc(overall_gdp))%>%
  head(5)

#q1.5
mydata%>%
  filter(lifeexp>=80)%>%
  arrange(country,year)

#q1.6
mydata%>%
  group_by(country) %>%
  summarise(Correlation = cor(lifeexp, gdpPerc, use = "complete.obs")) %>%
  mutate(Abs_Correlation = abs(Correlation)) %>%
  arrange(desc(Abs_Correlation)) %>%
  head(10) %>%
  select(country, Correlation)

#q1.7
mydata%>%
  filter(continent!="Asia")%>%
  group_by(continent, year)%>%
  summarise(h=mean(Pop),.groups='drop')%>%
  arrange(desc(h))%>%
  head(1)
  
#q1.8
mydata%>%
  group_by(country)%>%
  summarise(lowest_sd=sd(Pop))%>%
  arrange(lowest_sd)%>%
  head(3)

#q1.9
exclude_year <- 2008

mydata %>%
  filter(year != exclude_year) %>%
  arrange(country, year) %>%
  group_by(country) %>%
  mutate(
    Pop_prev = lag(Pop),
    LifeExp_prev = lag(lifeexp)
  ) %>%
  ungroup() %>%
  filter(!is.na(Pop_prev), !is.na(LifeExp_prev)) %>%
  filter(Pop < Pop_prev, lifeexp > LifeExp_prev) %>%
  select(country, year, continent, Pop_prev, Pop, LifeExp_prev, lifeexp)



#ques 2

#q2.1
df<-data.frame(
  MedID = 101:110,
  Med_Name = c("Paracetamol", "Ibuprofen", "Amoxicillin", "Cetirizine", "Azithromycin",
               "Metformin", "Omeprazole", "Atorvastatin", "Levothyroxine", "Aspirin"),
  Company = c("Cipla", "Sun Pharma", "Cipla", "Dr Reddy", "Sun Pharma",
              "Lupin", "Cipla", "Dr Reddy", "Lupin", "Sun Pharma"),
  Manf_year = c(2018, 2019, 2020, 2021, 2022, 2019, 2020, 2021, 2022, 2023),
  Exp_date = as.Date(c("2023-12-31", "2024-06-30", "2023-09-15", "2025-01-01", "2024-11-30",
                       "2023-08-01", "2025-03-31", "2024-12-15", "2025-06-30", "2026-01-01")),
  Quantity_in_stock = c(150, 200, 120, 180, 160, 140, 130, 170, 190, 210),
  Sales = c(5000, 7000, 4500, 6000, 6500, 4800, 5200, 6100, 6800, 7200)
)

write.csv(df,"Dataset.csv",row.names=FALSE)

#q2.2
data1<-read.csv("Dataset.csv")
data1$Exp_date <- as.Date(data1$Exp_date)
head(data1,4)

#q2.3
tail(data1,4)

#q2.4
cor(data1$Quantity_in_stock,as.numeric(data1$Exp_date))

#q2.5
install.packages("ggplot2")
library(ggplot2)

ggplot(data1,aes(x=factor(Manf_year),y=Sales))+
  geom_bar(stat = "identity",fill="skyblue")+
  labs(title = "Sales by Manufacturing Year", x = "Year", y = "Sales")

#q2.6
data1%>%
  group_by(Company)%>%
  summarise(dis=n_distinct(Med_Name))%>%
  filter(dis>1)

#q2.7
unique(data1$MedID)

#q2.8
  expiring_cutoff <- as.Date("2025-12-31") 
  
  data_q2_expiring <- data1 %>%
    mutate(
      Expiring_Status = ifelse(Exp_date < expiring_cutoff, "Expiring", "Not Expiring")
    )
  
  # Which medicines are expiring?
  q2_8_expiring_list <- data_q2_expiring %>%
    filter(Expiring_Status == "Expiring") %>%
    select(MedID, Exp_date, Sales)
  
  print("Q2.8: List of medicines that are 'Expiring' (Expiring before 2026):")
  print(q2_8_expiring_list)
  
  # Boxplot comparing Sales distribution
  q2_8_plot <- ggplot(data_q2_expiring, aes(x = Expiring_Status, y = Sales, fill = Expiring_Status)) +
    geom_boxplot() +
    labs(
      title = "Q2.8: Sales Distribution for Expiring vs. Non-Expiring Medicines",
      x = "Expiration Status",
      y = "Sales"
    ) +
    theme_minimal()

#q2.9 
mean(data1$Quantity_in_stock, na.rm = TRUE)
  
#q2.10
ggplot(data1, aes(x = Manf_year, y = Sales)) +
  geom_point(color = "blue") +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(title = "Sales vs Manufacturing Year", x = "Manufacturing Year", y = "Sales")

