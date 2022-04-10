#soal2a
Banyak.Pasien <- 20
n<-20
peluang.Sembuh <- 0.2
p<- 0.2
x <- 4
q <- 1-p

#kombinasi
x1 <- 1
x2 <- 1
x3 <- 1
for( i in 1:n){
  x1 <- x1*i
}
for(i in 1:x){
  x2 <- x2*i
}
for(i in 1:(n-x)){
  x3 <- x3*i
}
#rumus kombinasi
hasil <- x1/(x2*x3)

#Peluang
g <-hasil*(p^x)*q^(n-x)
"Hasil merupakan g"
#atau cara singkat
g2 <- dbinom(x = 4, size = 20, prob = 0.2)

#soal2b, dengan semua x(1:4) dicoba
g.total<- c(1:4)
x.total<- c(1:4)
g.total <- hasil*(p^x.total)*q^(n-x.total)
g.total
#histogram
hist (g.total, freq = TRUE,
      main ='Histogram Frekuensi Distribusi Binomial ',
      ylab = 'x',
      xlab = 'F(X=x)',
      col = 'green'
)

names(g.total) <- c(1:4)
g.total

#soal2c
Rata.rata <- n*p
Rata.rata
varians <- Rata.rata*q
varians
