#soal5a
rata.rata <- 3
e <-  2.71828
fungsi.exponential <- function(x){
  hasil=rata.rata*e^(-rata.rata*x)
  return(hasil)
}
#misal x=2
fungsi.exponential(2)
#untuk mengapus value
remove(rata.rata, fungsi.exponential)

#soal5b
f1 <- fungsi.exponential(10)
f2 <- fungsi.exponential(100)
f3 <- fungsi.exponential(1000)
f4 <- fungsi.exponential(10000)
grafik <- c(f1, f2, f3, f4)
names(grafik) <- c(10, 100, 1000, 10000)
grafik

hist(grafik)

#soal5c
alpa<- 3
rataan <- 1/alpa
varian <- 1/alpa^2
