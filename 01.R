rm(list = ls()) #remove any objects that might be in the environment
set.seed(69)

N = 10000

# factor variable
Supplier = sample(c('ACME', 'Universal Exports', 'BLU'), N, replace = TRUE)

# discrete variables
Batch_Size = sample(c(1000, 2000, 5000), N, replace = TRUE)
Defect_Count = rpois(N, 1/2)

# continuous variables
Weight = rnorm(N, 1200, 5)
Length = rnorm(N, 300, 2)

# function of variables
Defect_Rate = Defect_Count/Batch_Size
Quality = 100 - 1e4*Defect_Rate - 1.1*abs(Weight-1200) - 1.2*abs(Length-300)

# saving into data.frame()
data = data.frame(Supplier,Batch_Size,Defect_Count,
                  Weight,Length,Defect_Rate,Quality)

# export to file
write.table(data, file = 'export_table', sep = ';',
            append = FALSE, col.names = TRUE, row.names = FALSE)