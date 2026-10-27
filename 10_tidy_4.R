library(tidyverse)

heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/refs/heads/master/data/heroes_information.csv",
                   na = c("-99", "-", "NA"))

heroes %>%
  nest(!Gender)

heroes_nested <- heroes %>%
  group_by(Gender) %>%
  nest()

heroes %>%
  group_by(Gender) %>%
  nest() %>%
  mutate(dim = map(data, dim)) %>%
  unnest(dim)

heroes %>%
  group_by(Gender) %>%
  nest() %>%
  mutate(dim = map(data, dim)) %>%
  unnest_wider(dim, names_sep = "_") %>%
  select(!data)

films <- tribble(
  ~film, ~genres,
  "Автостопом по галактике", "sci-fi, comedy",
  "Пила", "horror, drama",
  "Harry Potter", "fantasy, action",
  "Отель Гранд Будапешт", "comedy",
  "Титаник", "drama",
  "Разрисованная вуаль", "drama"
)

films %>%
  filter(str_detect(genres, "drama"))

str_split(films$genres, pattern = ", ")

films %>%
  mutate(genres = str_split(genres, pattern = ", ")) %>%
  unnest(genres) %>%
  mutate(values = TRUE) %>%
  pivot_wider(names_from = genres, values_from = "values", values_fill = FALSE)
  
films %>%
  separate_rows(genres, sep = ", ") %>%
  mutate(values = TRUE) %>%
  pivot_wider(names_from = genres, values_from = "values", values_fill = FALSE)
