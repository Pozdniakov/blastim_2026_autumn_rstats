install.packages("data.table")
library(data.table)
?fread
heroes_dt <- fread("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/refs/heads/master/data/heroes_information.csv",
      na = c("-99", "-", "NA"))
heroes_dt
class(heroes_dt)
str(heroes_dt)
print(heroes_dt)
print
methods(print)
class(mtcars)
class(heroes_dt)
as.data.table(mtcars)
as.data.frame(heroes_dt)

heroes_dt[Alignment == "good",
          .(mean_height = mean(Height, na.rm = TRUE)),
          by = Gender][order(-mean_height)]

# install.packages("tidyverse")
# library(tidyverse)
# install.packages("rlang")
# install.packages("tidyr")
# tidyverse::tidyverse_update(recursive = TRUE)
# devtools::install_github("r-lib/rlang")
# install.packages("usethis")
# install.packages("httr2")
# 
# install.packages("vctrs")
 
class(heroes_tbl)

heroes_tbl %>%
  filter(Alignment == "good") %>%
  group_by(Gender) %>%
  summarise(mean_height = mean(Height, na.rm = TRUE)) %>%
  arrange(desc(mean_height))


# пайпы -------------------------------------------------------------------

rt <- c(320, 350, 480, 450, 2310, 539, 402)
round(exp(mean(log(rt))))
rt %>% log() %>% mean() %>% exp() %>% round()
rt %>% 
  log(1000, base = .) %>%
  mean() %>%
  exp() %>%
  round(digits = 1)

rt |>
  log(1000, base = _) |>
  mean() |>
  exp() |>
  round(digits = 1)

#{magrittr}

B <- matrix(10:39, nrow = 5)
apply(B, 1, mean)
B %>% apply(1, mean)
map_chr(heroes_tbl, typeof)
heroes_tbl %>%
  map_chr(typeof)

B <- matrix(10:39, nrow = 5)
apply(B, 1, mean)

10:39 %>%
  matrix(nrow = 5) %>%
  apply(1, mean)

# `:`(10, 39)
# 10 %>%
#   `:`(39) %>%
#   matrix(nrow = 5) %>%
#   apply(1, mean)


# Работа с колонками ------------------------------------------------------

heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/refs/heads/master/data/heroes_information.csv",
                       na = c("-99", "-", "NA"))

heroes %>%
  select(1, 5)

select(heroes, 1, 5)

heroes_selected_cols <- heroes %>%
  select(name, Race, Publisher, `Hair color`)
heroes_selected_cols
heroes
heroes %>%
  select(name:Publisher)

heroes %>%
  select(name:`Eye color`, Publisher:Weight)
heroes %>%
  select(!...1)
heroes %>%
  select(!Gender:Height)

heroes %>%
  select(name:last_col())

heroes %>%
  select(name, Publisher, everything())

heroes %>%
  select(ends_with("color"))

heroes %>%
  select(starts_with("H"))

heroes %>%
  select(starts_with("H") & ends_with("color"))

heroes %>%
  select(starts_with("H") | ends_with("color"))

heroes %>%
  select(contains("eigh"))

heroes %>%
  select(where(is.numeric))
heroes %>%
  select(where(is.character))
heroes %>%
  select(where(function(x) !any(is.na(x)) ))
heroes %>%
  select(where(function(x) mean(is.na(x)) < .5 ))

heroes %>%
  select(id = ...1, name)

heroes %>%
  rename(id = ...1)

heroes %>%
  rename_with(make.names)

make.names(names(heroes))
str_to_lower(names(heroes))

heroes %>%
  rename_with(str_to_upper)

heroes %>%
  rename_with(str_to_camel)

heroes %>%
  relocate(Publisher)

heroes %>%
  relocate(Publisher, .after = name)

heroes %>%
  relocate(Publisher, .before = name)

heroes %>%
  relocate(where(is.numeric), name, Universe = Publisher, Gender)
