# Непараметрические тесты -------------------------------------------------

library(tidyverse)
diet <- readr::read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/stcp-Rdataset-Diet.csv")
options(scipen = 999)
diet1 <- diet %>%
  filter(Diet == 1)

t.test(diet1$pre.weight, diet1$weight6weeks, paired = TRUE)
wilcox.test(diet1$pre.weight, diet1$weight6weeks, paired = TRUE)

diet12 <- diet %>%
  filter(Diet %in% 1:2)

t.test(weight6weeks ~ Diet, data = diet12)
t.test(weight6weeks ~ Diet, data = diet12, var.equal = TRUE)
wilcox.test(weight6weeks ~ Diet, data = diet12)

diet23 <- diet %>%
  filter(Diet %in% 2:3)
wilcox.test(weight6weeks ~ Diet, data = diet23)

diet2 <- diet %>%
  filter(Diet == 2)
wilcox.test(diet2$pre.weight, diet2$weight6weeks, 
            paired = TRUE)

a <- c(1001, 2003, 3005, 4009)
b <- c(1, 2, 3, 4)
t.test(a, b, paired = TRUE)
wilcox.test(a, b, paired = TRUE)

install.packages("coin")
t.test(weight6weeks ~ Diet, data = diet12)
diet12 <- diet12 %>%
  mutate(Diet = as.factor(Diet))

coin::oneway_test(weight6weeks ~ Diet, data = diet12)

install.packages("MKinfer")
MKinfer::boot.t.test(weight6weeks ~ Diet, data = diet12, R = 100000)
MKinfer::boot.t.test(a, b, paired = TRUE)


# Тест хи-квадрат на независимость ----------------------------------------

heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/refs/heads/master/data/heroes_information.csv",
                   na = c("-99", "-", "NA"))

gender_publisher <- heroes %>%
  filter(Publisher %in% c("Marvel Comics", "DC Comics")) %>%
  select(Gender, Publisher) %>%
  drop_na()

gender_publisher %>%
  count(Gender, Publisher)

table(gender_publisher)
61/(61 + 111)
153/(153 + 252)
61/(61 + 153)
111/(111 + 252)

summary(table(gender_publisher))
chisq.test(table(gender_publisher), correct = FALSE)

fisher.test(table(gender_publisher))

mosaicplot(table(gender_publisher), shade = TRUE, color = TRUE)


# Ковариация и корреляция -------------------------------------------------

install.packages("Stat2Data")
library(Stat2Data)
data("Backpack")

back <- Backpack %>%
  mutate(backpack_kg = BackpackWeight * 0.453592,
         body_kg = BodyWeight * 0.453592)


cov(back$backpack_kg, back$body_kg)
back %>%
  select(backpack_kg, body_kg) %>%
  cov()

back %>%
  select(backpack_kg, body_kg) %>%
  var()

back %>%
  select(BackpackWeight, BodyWeight) %>%
  cov()

cov(back$backpack_kg, back$body_kg)/sqrt(var(back$backpack_kg)*var(back$body_kg))

back %>%
  select(backpack_kg, body_kg) %>%
  cor()

cor.test(back$backpack_kg, back$body_kg)

cor.test(back$backpack_kg, back$body_kg, method = "spearman")
cor.test(back$backpack_kg, back$body_kg, method = "kendall")


cor.test(back$BackpackWeight, back$BodyWeight)
cor.test(heroes$Height, heroes$Weight)
cor.test(heroes$Height, heroes$Weight, method = "spearman")
cor.test(heroes$Height, heroes$Weight, method = "kendall")
plot(heroes$Height, heroes$Weight)
