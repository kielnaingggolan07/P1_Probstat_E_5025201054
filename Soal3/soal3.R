#soal3a
Rata.rata <- 4.5
x <- 6
x.faktorial <- 1
for (i in 1:x) {
  x.faktorial <- x.faktorial*i  
}
peluang <- 2.7182818^(-Rata.rata)*(Rata.rata^x)/x.faktorial
#atau dapat menggunakan rumus singkat
peluang2 <- dpois(x=6, lambda = 4.5)

#soal3b
n <-365
Rata.rata.setahun2<-ppois(q = 6, lambda = 4.5, lower.tail = 365)
hist(Rata.rata.setahun2)

#soal3c
Banding<- peluang == Rata.rata.setahun2
"karena hasil berupa false "

#soal3d
hasil.ratan <- x*peluang
hasil.varians <-x*peluang
