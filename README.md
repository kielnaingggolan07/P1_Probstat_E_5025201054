### P1_Probstat_E_5025201054


 #### Praktikum 1 [ Probabilitas & Statistika ]


## Soal
1. Seorang penyurvei secara acak memilih orang-orang di jalan sampai dia bertemu dengan
   seseorang yang menghadiri acara vaksinasi sebelumnya.
   
    - Berapa peluang penyurvei bertemu x = 3 orang yang tidak menghadiri acara vaksinasi
      sebelum keberhasilan pertama ketika p = 0,20 dari populasi menghadiri acara vaksinasi ?.
      Mendeklarasikan variabel serta value yang dibutuhkan:
      
       ```yml
        n <- 3
        p <- 0.20
       ```
       Kemudian, untuk mengitung peluang maka digunakan fungsi bawaan dari Rstudio, yang ditampung dalam variable <code>Peluang</code>:
       ```yml
       Peluang<-dgeom(x = n, prob = p)
       ```
       
       # Result
       ```yml
       > Peluang
       > 0.1024
       ```
       
    - Mean Distribusi Geometrik dengan 10000 data random , prob = 0,20 dimana distribusi
      geometrik acak tersebut X = 3 ( distribusi geometrik acak () == 3 ).
      Untuk menghitung mean, maka digunakan fungsi bawaan Rstudio <code>mean(rgeom())</code>, dimana dibuat variabel hasil untuk menampung output:
      
      ```yml
      hasil <-mean(rgeom(n = 10000, prob = 0.2) == 3)
      ```
      
      # Result
       ```yml
       > hasil
       > 0.1042
       ```
       
     - Bandingkan Hasil poin a dan b , apa kesimpulan yang bisa didapatkan?.
       Dalam hal ini, saya membuat variabel Banding, dimana akan mengecek apakah nilai point a dan b sama atau tidak:
       
        ```yml
        Banding <- hasil == Peluang
        ```
      
       # Result
        ```yml
        > Banding
        > FALSE
        ```
        Maka menurut saya, hasil banding menunjukkan bahwa ketika peluang n dari data random maka akan menghasilkan nilai yang berbeda.
     
      - Histogram Distribusi Geometrik , Peluang X = 3 gagal Sebelum Sukses Pertama.
         ```yml
          library(dplyr)
          library(ggplot2)
          data.frame(x = 0:15, prob = dgeom(x = 0:15, prob = p)) %>%
          mutate(Failures = ifelse(x == n, n, "other")) %>%
          ggplot(aes(x = factor(x), y = prob, fill = Failures)) +
          geom_col() +
          geom_text(
          aes(label = round(prob,2), y = prob + 0.01),
          position = position_dodge(0.9),
          size = 3,
          vjust = 0
          ) +
          labs(title = "Probability of X = 3 Failures Prior to First Success",
          x = "Failures prior to first success (x)",
          y = "Probability") 
         ```
         # Result
         ```yml
         Screenshoot soal.1
         ```
      - Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Geometrik. 
        Membuat variabel hasil.mean untuk menampung output Rataan dan hasil.varians untuk menampung output Varian.
         
         ```yml
         hasil.mean= 1/Peluang
         hasil.varians = (1-Peluang)/Peluang^2
         ```
        # Result
         ```yml
          > hasil.mean
          > 9.765625
          > hasil.varians
          > 85.60181
         ```
 2. Terdapat 20 pasien menderita Covid19 dengan peluang sembuh sebesar 0.2.
 
      - Peluang terdapat 4 pasien yang sembuh.
        <br>Saya menggunakan 2 metode:</br>
           - Menggunakan Rumus
             <br>  Disini membuat variabel dan values: </br>
               ```yml            
                Banyak.Pasien <- 20
                n<-20
                peluang.Sembuh <- 0.2
                p<- 0.2
                x <- 4
                q <- 1-p
               ```
               Kemudian, membuat for untuk kombinasi:
                ```yml
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
               ```
               Kemudian, hasil dari kombinasi dimasukkan kedalam variabel <code>hasil</code>
               ```yml
                hasil <- x1/(x2*x3)
               ```
               Terakhir, yaitu menghitung peluang menggunakan Rumus Distribusi Binomial
               ```yml
                g <-hasil*(p^x)*q^(n-x)
               ```
              # Result
             ```yml
              > g
              > 0.2181994
             ```
           - Menggunakan fungsi bawaan Rstudio <code>dbinom</code>  
               ```yml
                g2 <- dbinom(x = 4, size = 20, prob = 0.2)
               ```
              # Result
               ```yml
               > g2
               > 0.2181994
               ```
               
      - Gambarkan grafik histogram berdasarkan kasus tersebut.
         ```yml  
          soal2b, dengan semua x(1:4) dicoba
          g.total<- c(1:4)
          x.total<- c(1:4)
          g.total <- hasil*(p^x.total)*q^(n-x.total)
          g.total
         ```
         <code>Histogram Distribusi Binomial</code>
        
         ```yml 
          hist (g.total, freq = TRUE,
          main ='Histogram Frekuensi Distribusi Binomial ',
          ylab = 'x',
          xlab = 'F(X=x)',
          col = 'green')
         ```
       
        # Result
          ```yml
           Shrenshoot soal2.
          ```
        
      - Nilai Rataan (μ) dan Varian (σ²) dari DistribusiBinomial.
         ```yml
          Rata.rata <- n*p
          varians <- Rata.rata*q
         ```
         
         # Result
           ```yml
            > Rata.rata
            > 4
            > varians
            > 3.2
           ``` 
           
   3. Diketahui data dari sebuah tempat bersalin di rumah sakit tertentu menunjukkan rata-rata historis
        4,5 bayi lahir di rumah sakit ini setiap hari. 
        
       - Berapa peluang bahwa 6 bayi akan lahir di rumah sakit ini besok?.
         <br>Mendeklarasikan variabel serta value yang dibutuhkan, serta menggunakan rumus Diagram Poisson:</br>
         ```yml
          Rata.rata <- 4.5
          x <- 6
          x.faktorial <- 1
          for (i in 1:x) {
                x.faktorial <- x.faktorial*i }
         ```   
           Kemudian masukkan kedalam rumus:
         
         ```yml
          peluang <- 2.7182818^(-Rata.rata)*(Rata.rata^x)/x.faktorial
         ```
           atau dapat menggunakan rumus bawaan Rstudio <code>dpois</code>
           
         ```yml
         peluang2 <- dpois(x=6, lambda = 4.5)
         ```
         
          # Result
          ```yml
           > peluang
           > 0.1281201
           > peluang2
           > 0.1281201
          ```
         
       - simulasikan dan buatlah histogram kelahiran 6 bayi akan lahir di rumah sakit ini selama
         setahun (n = 365)
         
         ```yml
          n <-365
          Rata.rata.setahun2<-ppois(q = 6, lambda = 4.5, lower.tail = 365)
          hist(Rata.rata.setahun2)
         ```
         
          # Result
           ```yml
             shreenshoot soal3
           ```
           
       -  dan bandingkan hasil poin a dan b , Apa kesimpulan yang bisa didapatkan.
         <br> Membandingkan antara peluang dan Rata.rata.setahun2</br>
          ```yml
           Banding<- peluang == Rata.rata.setahun2
           "karena hasil tidak sama maka berupa false "
          ```
          
         # Result
         ```yml
           > Banding
           > FALSE
         ```
         
       - Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Poisson.
       
         ```yml
          hasil.ratan <- x*peluang
          hasil.varians <-x*peluang 
         ```
         
         # Return
         
         ```yml
          > hasil.ratan
          > 0.7687209
          > hasil.varians
          > 0.7687209
         ```
  4. Diketahui nilai x = 2 dan v = 10.
     
     - Fungsi Probabilitas dari Distribusi Chi-Square.
       <br> Menggunakan fungsi bawaan Rstudio, <code>dchisq</code> </br>
       <code>dchisq(x, v)</code>
      
       # Return
        ```yml
         0.007664155
        ```
       
     - Histogram dari Distribusi Chi-Square dengan 100 data random.
        ```yml
         n = 100
         hasil <- rchisq(n, v)
         hist(hasil, main = "Chi-Square Histogram")
        ```
       
     - Nilai Rataan (μ) dan Varian (σ²) dari DistribusiChi-Square.
       <br> Menggunakan fungsi bawaan Rstudio, <code>mean, var</code> </br>
       
        ```yml
         mean(hasil)
         var(hasil)
         ```
        # Return
        ```yml
         > mean(hasil)
         > 9.520746
         > var(hasil)
         > 17.4493
        ```
         
  5. Diketahui bilangan acak (random variable) berdistribusi exponential (λ = 3)
     - Fungsi Probabilitas dari Distribusi Exponensi.
       <br> Membuat variabel dan values yang dibutuhkan</br>
         ```yml
         alpa = 3
         data.x <- seq(1, 8, by = 1)
         dexp(data.x, alpa)
         ```
         
      
      -  Histogram dari Distribusi Exponensial untuk 10, 100, 1000 dan 10000 bilangan rando
         ```yml
         jika n = 10
         n <- 10
         set_data <- rexp(n, rate = 3)
         hist(set_data)
         
         jika n = 100 
         n <- 100
         set_data <- rexp(n, rate = 3)
         hist(set_data)
         
         jika n = 1,000
         n <- 1000
         set_data <- rexp(n, rate = 3)
         hist(set_data)
         
         jika n = 10,000  
         n <- 10000
         set_data <- rexp(n, rate = 3)
         hist(set_data)
         
         ```
         
       - Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Exponensial untuk n = 100 dan λ = 3
          ```yml
           set.seed(1) 
           x <- 100
           alpa <- 3
           set_data <- rexp(x, alpa)
           mean(set_data)
           var(set_data)
          ```





          
| Nama               | NRP           |
|--------------------|---------------|
|Hesekiel Nainggolan |5025201054     |
