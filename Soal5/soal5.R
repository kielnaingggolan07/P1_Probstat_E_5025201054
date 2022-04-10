
#soal5a
alpa = 3
#data yang diambil 1 - 8
data.x <- seq(1, 8, by = 1)
dexp(data.x, alpa)

#soal5b
# jika n =10        
n <- 10
set_data <- rexp(n, alpa = 3)
hist(set_data)

# jika n = 100 
n <- 100
set_data <- rexp(n, alpa = 3)
hist(set_data)

# jika n = 1,000
n <- 1000
set_data <- rexp(n, alpa = 3)
hist(set_data)

# jika n = 10,000  
n <- 10000
set_data <- rexp(n, rate = 3)
hist(set_data)

#soal5c
set.seed(1) 
x <- 100
alpa <- 3
set_data <- rexp(x, rate)
mean(set_data)
var(set_data)
