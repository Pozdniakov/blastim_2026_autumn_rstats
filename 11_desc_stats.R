library(tidyverse)

heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/refs/heads/master/data/heroes_information.csv",
                   na = c("-99", "-", "NA"))

weight <- heroes %>%
  drop_na(Weight) %>%
  pull(Weight)

# Квантили ----------------------------------------------------------------


quantile(weight)
?quantile


# 1 меры центральной тендеции ---------------------------------------------


mean(weight)
mean(c(weight, 100500))

median(weight)
median(c(weight, 100500))
sort(weight)

mean(weight, trim = .1)
mean(weight, trim = .5)
mean(c(weight, 100500), trim = .1)

heroes %>%
  count(Gender, sort = TRUE)
heroes %>%
  count(Weight, sort = TRUE)

# 2 меры рассеяния --------------------------------------------------------

diff(range(weight))
diff(range(c(weight, 100500)))

options(scipen = 999)
sum((weight - mean(weight))^2)/(length(weight) - 1)
var(weight)
mean(weight)
sd(weight)
sqrt(sum((weight - mean(weight))^2)/(length(weight) - 1))
var(weight)
var(c(weight, 100500))
sd(c(weight, 100500))

(weight - mean(weight))/sd(weight)
z <- function(x, na.rm = FALSE) (x - mean(x, na.rm = na.rm))/sd(x, na.rm = na.rm)

iris %>%
  mutate(across(where(is.numeric), z))

scale(weight)

median(abs(weight - median(weight))) * 1.4826
mad(weight)
sd(weight)

IQR(weight)

install.packages("psych")

psych::skew(weight)
sort(weight)
psych::kurtosi(weight)

summary(weight)
summary(heroes)

psych::describe(weight)

heroes %>%
  group_by(Gender) %>%
  reframe(psych::describe(Weight))

install.packages("skimr")
skimr::skim(heroes)

heroes %>%
  group_by(Gender) %>%
  skimr::skim(where(is.numeric))

xxx
psych::describe(xxx)

xxx %>%
  count(y, sort = TRUE)
IQR(xxx$x)
IQR(xxx$y)
cor(xxx$x, xxx$y)

plot(xxx)
plot(weight)

iris %>% select(!Species) %>% plot(col = iris$Species)
iris
