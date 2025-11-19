# 1. Create array A
A <- c(12, 13, 14, 15, 16)
print(A)

# 2. Sum of elements
sum_A <- sum(A)
print(sum_A)

# 3. Product of elements
prod_A <- prod(A)
print(prod_A)

# 4. Maximum and Minimum
max_A <- max(A)
min_A <- min(A)
print(c(max_A, min_A))

# 5. Range of array A
range_A <- range(A)
print(range_A)

# 6. Mean, Variance, Standard Deviation, Median
mean_A <- mean(A)
var_A <- var(A)
sd_A <- sd(A)
median_A <- median(A)
print(c(mean_A, var_A, sd_A, median_A))

# 7. Sorting (Increasing → B, Decreasing → C)
B <- sort(A)
C <- sort(A, decreasing = TRUE)
print(B)
print(C)

# 8. Create 3x4 matrix of natural numbers
M <- matrix(1:12, nrow=3, ncol=4, byrow=TRUE)
print(M)

# 9. Create MxN by combining A, B, C row-wise and col-wise
RW <- rbind(A, B, C)
CW <- cbind(A, B, C)
print(RW)
print(CW)

# 10. Find 2nd and 3rd row of RW
rows_RW <- RW[2:3, ]
print(rows_RW)

# 11. 1st and 3rd columns of CW (since there is no 4th)
cols_CW <- CW[, c(1, 3)]
print(cols_CW)

# 12. Elements at [2,3] from RW and CW
sub_RW <- RW[2, 3]
sub_CW <- CW[2, 3]
print(c(sub_RW = sub_RW, sub_CW = sub_CW))

