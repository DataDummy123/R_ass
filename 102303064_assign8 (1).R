install.packages("ggplot2")
install.packages("readr")
install.packages("tidyr")
install.packages("dplyr")

library(ggplot2)
library(readr)
library(tidyr)
library(dplyr)


project1 <- read.csv("https://raw.githubusercontent.com/biocorecrg/CRG_RIntroduction/master/ex12_normalized_intensities.csv",
                     header = TRUE, row.names = 1)
head(project1)

install.packages("ggplot2")
library(ggplot2)
ggplot(project1, aes(x = sampleB, y = sampleH)) +
  geom_point() +
  labs(title = "Scatter plot of SampleB vs SampleH",
       x = "Sample B Expression",
       y = "Sample H Expression")
#2
project1$expr_limits <- ifelse(project1$sampleB > 13 & project1$sampleH > 13, "high",
                               ifelse(project1$sampleB < 6 & project1$sampleH < 6, "low", "normal"))

table(project1$expr_limits)

#3
p <- ggplot(project1, aes(x = sampleB, y = sampleH, color = expr_limits)) +
  geom_point(size = 2) +
  labs(title = "Gene Expression Scatter Plot",
       x = "Sample B",
       y = "Sample H",
       color = "Expression Limit") +
  theme_minimal()

p

#4
library(reshape2)
project1_long <- melt(project1[, 1:8])  # assuming first 8 columns are samples

colnames(project1_long) <- c("Sample", "Expression")

ggplot(project1_long, aes(x = Sample, y = Expression)) +
  geom_boxplot(fill = "skyblue") +
  labs(title = "Expression Distribution per Sample",
       x = "Sample",
       y = "Expression Level") +
  theme_minimal()

#5
project1_long2 <- melt(project1, id.vars = "expr_limits", variable.name = "Sample", value.name = "Expression")

ggplot(project1_long2, aes(x = Sample, y = Expression, fill = expr_limits)) +
  geom_boxplot() +
  labs(title = "Expression per Sample by Expression Level",
       x = "Sample",
       y = "Expression",
       fill = "Expr Limit") +
  theme_minimal()

#6
ggplot(project1, aes(x = expr_limits, fill = expr_limits)) +
  geom_bar() +
  labs(title = "Count of Genes by Expression Limit",
       x = "Expression Limit",
       y = "Number of Genes") +
  theme_minimal()
install.packages("reshape2")
library(reshape2) 
