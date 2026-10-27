library(tidyverse)

heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/refs/heads/master/data/heroes_information.csv",
                       na = c("-99", "-", "NA"))

# Работа со строками (продолжение) ----------------------------------------


heroes %>%
  select(1, 4)
heroes %>%
  select(name, Gender)
heroes %>%
  select(name:Weight)
heroes %>%
  select(!name)
heroes %>%
  select(ends_with("color"))
heroes %>%
  select(where(is.numeric))

heroes %>%
  select(Weight)

mtcars[,"cyl"]
mtcars$cyl
mtcars[, 1, drop = FALSE]

heroes %>%
  select(Weight) %>%
  pull()

heroes %>%
  pull(Weight)

heroes %>%
  pull(Weight, name)

powers <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/super_hero_powers.csv")


# Работа со строками ------------------------------------------------------

heroes %>%
  slice(3, 10, 120, 700)

heroes %>%
  filter(Publisher == "DC Comics")
heroes %>%
  filter_out(Publisher == "DC Comics")

heroes %>%
  filter(Weight < 10)

heroes %>%
  filter(Weight < 10 | Weight > 500)
heroes %>%
  filter(Gender == "Female" & Weight > 300)
heroes %>%
  filter(Gender == "Female", Weight > 300)
heroes %>%
  filter(Gender == "Female") %>%
  filter(Weight > 300)

heroes %>%
  slice_head(n = 10)
heroes %>%
  head()

heroes %>%
  slice_max(Weight, n = 3)

heroes %>%
  slice_min(Weight, n = 3)

heroes %>%
  slice_max(Weight, n = 10)
?slice_max
heroes %>%
  slice_max(Weight, n = 10, with_ties = FALSE)

heroes %>%
  slice_sample()
heroes %>%
  slice_sample(n = 3)
heroes %>%
  slice_sample(prop = .01)
heroes %>%
  slice_sample(prop = 1)

heroes %>%
  drop_na()

heroes %>%
  drop_na(Height, Weight)
heroes %>%
  drop_na(ends_with("color"))


# Сортировка строк --------------------------------------------------------

heroes %>%
  arrange(Weight)

heroes %>%
  arrange(-Weight)
heroes %>%
  arrange(desc(Weight))
heroes %>%
  arrange(Gender, desc(Weight))


# Создание новых колонок --------------------------------------------------

heroes %>%
  mutate(imt = Weight/(Height/100)^2, .after = name)

heroes %>%
  mutate(imt = Weight/(Height/100)^2, 
         imt_squared = imt^2,
         .before = Weight)

heroes %>%
  transmute(imt = Weight/(Height/100)^2, name) #mutate + select

heroes %>%
  mutate(imt = Weight/(Height/100)^2, .after = name) %>%
  arrange(desc(imt))

number <- -2:2
if (number > 0) {
  "Positive number"
} else if (number < 0) {
  "Negative number"
} else {"zero"}

if_else(number > 0, "Positive number", "Negative number or zero")
# if_else(number > 0, TRUE, FALSE) #избыточно!!! как c(1:20)

if_else(number > 0,
        "Positive number", 
        if_else(number < 0,
                "Negative number",
                "Zero"))

case_when(
  number > 0 ~ "Positive", #if
  number < 0 ~ "Negative", #else if
  TRUE       ~ "Zero" #else
)

case_when(
  number > 0 ~ "Positive", #if
  number < 0 ~ "Negative", #else if 
  .default = "Zero" #else 
)

number <- c(number, NA, NA)
number
case_when(
  is.na(number) ~ NA_character_, #if
  number > 0 ~ "Positive", #else if
  number < 0 ~ "Negative", #else if 
  .default = "Zero" #else 
)

if_else(number > 0,
        "Positive number", 
        if_else(number < 0,
                "Negative number",
                "Zero"))

heroes_with_new_column <- heroes %>%
  mutate(imt = Weight/(Height/100)^2, .after = name)

heroes %>%
  mutate(imt = Weight/(Height/100)^2, .after = name) %>%
  mutate(imt_group = if_else(imt > 30, "overweight", "not overweight"))

heroes %>%
  mutate(imt = Weight/(Height/100)^2, .after = name) %>%
  mutate(imt_group = case_when(
    is.na(imt) ~ NA_character_,
    imt > 40   ~ "obese",
    imt > 30   ~ "overweight",
    imt < 16   ~ "underweight",
    .default = "normal weight"
  )) 


# Группировка -------------------------------------------------------------

heroes %>%
  mutate(mean_weight = mean(Weight, na.rm = TRUE))

heroes %>%
  group_by(Gender) %>%
  summarise(mean_weight = mean(Weight, na.rm = TRUE),
            min_weight = min(Weight, na.rm = TRUE),
            max_weight = max(Weight, na.rm = TRUE),
            first = first(Weight),
            last = last(Weight),
            tenth = nth(Weight, 10))

max(heroes$Weight, na.rm = TRUE)
range(1:10)
heroes %>%
  group_by(Gender) %>%
  reframe(range(Weight, na.rm = TRUE))

heroes %>%
  group_by(Gender, Alignment) %>%
  summarize(mean_weight = mean(Weight, na.rm = TRUE))

heroes %>%
  summarise(mean_weight = mean(Weight, na.rm = TRUE), .by = Gender)

heroes %>%
  group_by(Gender) %>%
  summarise(n = n())

heroes %>%
  count(Gender, Alignment)

heroes %>%
  count(Publisher, sort = TRUE)

heroes %>%
  group_by(Gender) %>%
  mutate(mean_weight_by_gender = mean(Weight, na.rm = TRUE)) %>%
  ungroup() %>%
  mutate(diff_to_gender_mean = Weight - mean_weight_by_gender) %>%
  relocate(Weight, mean_weight_by_gender, diff_to_gender_mean, .after = name)
  
heroes %>%
  count(Race, sort = TRUE) %>%
  print(n = 1000)  

heroes %>%
  group_by(Race) %>%
  filter(n() > 10)

#отобрать супергероев из уникальных рас

heroes %>%
  group_by(Race) %>%
  filter(n() == 1)

