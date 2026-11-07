library(tidyverse)

heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/refs/heads/master/data/heroes_information.csv",
                   na = c("-99", "-", "NA"))
options(scipen = 999)
t.test(Weight ~ Gender, data = heroes)

dnorm(0)
dnorm(1)
dnorm(-1)

vec <- seq(-3, 3, .1)
vec
dnorm(vec)
plot(vec, dnorm(vec))

iq <- 50:150
plot(iq, dnorm(iq, mean = 100, sd = 15))

pnorm(100, mean = 100, sd = 15)
pnorm(130, mean = 100, sd = 15)
1 - pnorm(130, mean = 100, sd = 15)
pnorm(105, mean = 100, sd = 15) - pnorm(95, mean = 100, sd = 15)
p <- seq(0, 1, by = .01)
plot(p, qnorm(p, mean = 100, sd = 15))
qnorm(0.5, mean = 100, sd = 15)
qnorm(0.975, mean = 100, sd = 15)

rnorm(100, mean = 100, sd = 15)
pnorm(0, mean = 100, sd = 15)

rnorm(100, mean = 100, sd = 15)

set.seed(42)
rnorm(100, mean = 100, sd = 15)
rnorm(100, mean = 100, sd = 15)

hist(rnorm(3000, mean = 100, sd = 15))

set.seed(42)
samp <- rnorm(100, mean = 100, sd = 15)
samp
mean(samp)
sqrt(sum((samp - mean(samp))^2)/(length(samp)- 1))
sd(samp)
     