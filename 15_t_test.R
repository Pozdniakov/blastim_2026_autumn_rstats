
# Генерируем выборку ------------------------------------------------------


set.seed(42)
samp <- rnorm(100, mean = 100, sd = 15)

n = length(samp)

# Задаем нулевую гипотезу -------------------------------------------------

mu = 100


# Считаем статистику ------------------------------------------------------

t_emp <- (mean(samp) - mu)/(sd(samp)/sqrt(n))
t_emp


# Считаем p-value ---------------------------------------------------------

(1 - pt(t_emp, df = length(samp) - 1)) * 2
mean(samp)


# Одновыборочный t-тест ---------------------------------------------------

t.test(samp, mu = 100)

library(tidyverse)

heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/refs/heads/master/data/heroes_information.csv",
                   na = c("-99", "-", "NA"))

t.test(heroes$Weight, mu = 100)
t.test(heroes$Height, mu = 185)


# Двухвыборочный t-тест ---------------------------------------------------

diet <- readr::read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/stcp-Rdataset-Diet.csv")

diet1 <- diet %>%
  filter(Diet == 1)
options(scipen = 999)
t.test(diet1$pre.weight, diet1$weight6weeks, paired = TRUE)

#t.test(diet1$pre.weight - diet1$weight6weeks, mu = 0)

diet2 <- diet %>%
  filter(Diet == 2)
t.test(diet2$pre.weight, diet2$weight6weeks, paired = TRUE)

diet3 <-  diet %>%
  filter(Diet == 3)
t.test(diet3$pre.weight, diet3$weight6weeks, paired = TRUE)

diet12 <- diet %>%
  filter(Diet %in% 1:2)

t.test(weight6weeks ~ Diet, data = diet12)
t.test(diet12$weight6weeks ~ diet12$Diet, var.equal = TRUE)

diet23 <-  diet %>%
  filter(Diet %in% 2:3)
t.test(weight6weeks ~ Diet, data = diet23, var.equal = TRUE)

diet13 <-  diet %>%
  filter(Diet %in% c(1, 3))
t.test(weight6weeks ~ Diet, data = diet13)

heroes_white_black <- heroes %>%
  filter(`Eye color` %in% c("white", "black"))

t.test(Weight ~ `Eye color`, data = heroes_white_black, var.equal = TRUE)

heroes_white_black %>%
  group_by(`Eye color`) %>%
  summarise(mean(Weight, na.rm = TRUE))

shapiro.test(samp)

shapiro.test(diet1$weight6weeks)

hist(diet1$weight6weeks)
hist(diet2$weight6weeks)
hist(rnorm(length(diet1$weight6weeks)))

qqnorm(diet1$weight6weeks)
qqnorm(rnorm(length(diet1$weight6weeks)))

qqnorm(rlnorm(200))

tt <- t.test(rnorm(30), rnorm(30), var.equal = TRUE)
str(tt)
tt$p.value
t.test(rnorm(30), rnorm(30), var.equal = TRUE)$p.value
set.seed(42)
many_p <- replicate(100000, t.test(rnorm(30), 
                                 rnorm(30), 
                                 var.equal = TRUE)$p.value)

mean(many_p < .05)
mean(many_p < .1)
hist(many_p)

many_p_h1 <- replicate(100000, t.test(rnorm(30), 
                                   rnorm(30, mean = .5), 
                                   var.equal = TRUE)$p.value)
hist(many_p_h1, breaks = 100)
mean(many_p_h1 < .05)

many_p_log <- replicate(100000, t.test(rlnorm(30), 
                                      rlnorm(30), 
                                      var.equal = TRUE)$p.value)
mean(many_p_log < .05)

diet %>%
  group_by(Diet) %>%
  summarise(m = mean(weight6weeks),
            s = sd(weight6weeks))
