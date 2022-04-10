#soal 1a
n<- 3
p <- 0.20
Peluang<-dgeom(x = n, prob = p)

#soal 1b
hasil <-mean(rgeom(n = 10000, prob = 0.2) == 3)

#soal1c
Banding <- hasil == Peluang
"Hasil banding menunjukkan bahwa ketika peluang ketika n dari data random maka akan menghasilkan nilai yang berbeda "

#soal1d
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

#soal1e
hasil.mean= 1/Peluang
hasil.mean
hasil.varians = (1-Peluang)/Peluang^2
hasil.varians
