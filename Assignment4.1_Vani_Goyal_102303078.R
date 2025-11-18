Patient_id=c(1,2,3,4)
adm_date=c("10-15-2009","11-01-2009","10-21-2009","10-28-2009")
adm_date=as.Date(adm_date,format = "%m-%d-%Y")
age=c(25,34,28,52)
diabetes=c("Type1", "Type2", "Type1", "Type1")
status=c("Poor", "Improved", "Excellent", "Poor")
df=data.frame(PatientID=Patient_id, AdmDate= adm_date, Age= age, Diabetes=diabetes, Status=status)

df

subset1=df[,c("PatientID","Age")]

type1_diabetes<- df[df$Diabetes== "Type1", ]

poor_count<- sum(df$Status== "Poor")
summary (df)
average_age <- mean(df$Age)
print(average_age)
patient_id <- as.integer(readline(prompt = "Enter Patient ID: "))
age <- as.integer(readline(prompt = "Enter Age: "))
diabetes <- readline(prompt = "Enter Diabetes Type: ")
status <- readline(prompt = "Enter Status: ")
adm_date <- as.Date(readline(prompt = "Enter date: "), format = "%m-%d-%Y")
new_patient <- data.frame(
  PatientID = patient_id,
  AdmDate = adm_date,
  Age = age,
  Diabetes = diabetes,
  Status = status
)
df <- rbind(df, new_patient) 
df

a <- c(12, 14, 16, 20)


matrix_2d <- matrix(1:15, nrow = 5, ncol = 3)


score <- c("first", "second", "third")

mylist <- list(
  title = "my first list",
  criteria = list(
    a= a,
    matrix = matrix_2d,
    score = score
  )
)

print(mylist)
print(mylist$criteria$a)

