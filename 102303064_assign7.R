#1

set.seed(42)

MARKS <- matrix(
  sample(50:100, 60, replace = TRUE), # 20 students * 3 subjects = 60 marks
  nrow = 20,
  ncol = 3,
  dimnames = list(paste0("Stu", 1:20), c("SUB1", "SUB2", "SUB3"))
)


print("Initial MARKS Matrix:")
print(MARKS)

# 1.a. 
Total_Marks <- apply(MARKS, 1, sum) #1->row-wise

print("Total Marks for each student:")
print(Total_Marks)

# 1.b. 
MARKS_With_Total <- cbind(MARKS, Total = Total_Marks)

print("MARKS Matrix with Total Marks:")
print(MARKS_With_Total)
# 1.c. 
st.err <- function(x) {
  sd(x) / sqrt(length(x))
}

Standard_Errors <- apply(MARKS, 2, st.err)

print("Standard Error for each subject (SUB1, SUB2, SUB3):")
print(Standard_Errors)

# 1.d. 
MARKS_Bonus <- apply(MARKS, c(1, 2), function(x) { x + 0.25 })


print("MARKS Matrix with 0.25 bonus marks added:")
print(MARKS_Bonus)

# 2. 
V1 <- MARKS[, "SUB1"]
V2 <- MARKS[, "SUB2"]
V3 <- MARKS[, "SUB3"]

Marks_List <- list(V1 = V1, V2 = V2, V3 = V3)

Sums_lapply <- lapply(Marks_List, sum)

print("Sum of marks in V1, V2, and V3 using lapply():")
print(Sums_lapply)

# 3.
TOTAL_SUM <- sapply(Marks_List, sum)

print("TOTAL_SUM vector using sapply():")
print(TOTAL_SUM)

# 4. 
Squares_sapply <- sapply(Marks_List, function(x) { x^2 })

print("Squares of each mark in V1, V2, and V3 using sapply():")
print(head(Squares_sapply)) 

# 5. 
I <- c(1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4)

Mean_SUB1_by_I <- tapply(MARKS[, "SUB1"], INDEX = I, FUN = mean)

print("Mean of SUB1 grouped by index I using tapply():")
print(Mean_SUB1_by_I)

SD_SUB1_by_I <- tapply(MARKS[, "SUB1"], INDEX = I, FUN = sd)

print("Standard Deviation of SUB1 grouped by index I using tapply():")
print(SD_SUB1_by_I)

# 6. 
f <- function(x, y) {
  x / y
}

Ratio_mapply <- mapply(f, x = V1, y = V2)

print("Ratio V1/V2 using mapply() (first 5 elements):")
print(head(Ratio_mapply, 5))


# 7. 
data("Seatbelts")
Seatbelts_Matrix <- as.matrix(Seatbelts)

print("Seatbelts Matrix Dimensions:")
print(dim(Seatbelts_Matrix))

Seatbelts_Col_Means <- apply(Seatbelts_Matrix, 2, mean)
print("\napply(): Mean of each variable in Seatbelts:")
print(Seatbelts_Col_Means)


Drivers_Data <- split(Seatbelts_Matrix[, "drivers"],
                      f = ceiling(seq_along(Seatbelts_Matrix[, "drivers"]) / 12)) # Group by 12 months (years)
Drivers_Sums_lapply <- lapply(Drivers_Data, sum)
print("\nlapply(): Sum of 'drivers' fatalities for the first 5 years:")
print(head(Drivers_Sums_lapply, 5))


Seatbelts_Col_Medians <- sapply(as.data.frame(Seatbelts_Matrix), median)
print("\nsapply(): Median of each variable in Seatbelts:")
print(Seatbelts_Col_Medians)


Year_Index <- rep(c("Pre-law", "Post-law"), each = 12 * 5) # Example grouping for a period
Drivers_Vector <- Seatbelts_Matrix[1:(12*10), "drivers"] # Subset the vector to match index size

Drivers_Mean_by_Period <- tapply(
  Drivers_Vector,
  INDEX = factor(Year_Index[1:length(Drivers_Vector)]),
  FUN = mean
)
print("\ntapply(): Mean 'drivers' fatalities grouped by a custom period factor:")
print(Drivers_Mean_by_Period)

Drivers_Front_Ratio <- mapply(
  function(d, f) { (d / f) * 100 },
  d = Seatbelts_Matrix[, "drivers"],
  f = Seatbelts_Matrix[, "front"]
)
print("\nmapply(): Drivers/Front fatalities ratio (%) (first 5 months):")
print(head(Drivers_Front_Ratio, 5))

#SIMPLER CODE FOR TAPPLY AND MAPPLY 

SB <- as.data.frame(Seatbelts)

# Create a year index (1969–1984)
Year_Index <- rep(1969:1984, each = 12)

# tapply: mean drivers killed per year
mean_drivers_year <- tapply(SB$drivers, Year_Index, mean)

mean_drivers_year


# mapply: element-wise driver-to-front-seat-passenger ratio
ratio_driver_front <- mapply(function(d, f) d / f,
                             SB$drivers,
                             SB$front)

head(ratio_driver_front) 