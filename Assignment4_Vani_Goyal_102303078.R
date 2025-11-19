# 1. 
seq_values <- seq(1.3, 4.9, by = 0.3)
print(seq_values)

repeated_nums <- rep(c(1, 2, 3, 4), times = 5)
print(repeated_nums)

descending_vals <- seq(14, 0, by = -2)
print(descending_vals)

replicated_vals <- rep(c(5, 12, 13, 20), each = 2)
print(replicated_vals)

# 2. 
data <- iris
head(data)

# a) 
class(iris)

# b) 
nrow(data)
ncol(data)

# c) 
str(iris)
nlevels(iris$Species)

# 3. 
# a) 
aggregate(cbind(Sepal.Length, Sepal.Width) ~ Species, data = iris, FUN = function(x) c(mean = mean(x), sd = sd(x)))

# b) 
iris_modified <- iris
calyx_width <- c()
for (i in 1:nrow(iris_modified)) {
  calyx_width[i] <- ifelse(iris_modified$Sepal.Length[i] < 5, "short", "long")
}
iris_modified$Calyx.Width <- calyx_width
head(iris_modified)

# 4. 
mtcars
str(mtcars)
names(mtcars)

# a) 
subset(mtcars, cyl >= 5)

# b) 
head(mtcars, 10)

# c) 
mtcars[grep("Honda", rownames(mtcars)), ]


