library(tidyverse)

heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/refs/heads/master/data/heroes_information.csv",
                   na = c("-99", "-", "NA"))


# Работа с дупликатами ----------------------------------------------------

heroes %>%
  distinct()

heroes %>%
  distinct(Gender, Alignment)

install.packages("janitor")
library(janitor)
heroes %>%
  rename_with(make_clean_names)

heroes %>%
  get_dupes()

heroes %>%
  get_dupes(name)

heroes %>%
  group_by(name) %>%
  slice(1)


# Соединение тибблов ------------------------------------------------------

band_members
band_instruments

bind_cols(band_members, band_instruments) #cbind()
bind_rows(band_members, band_instruments)

band_list_df <- list(members = band_members, instruments = band_instruments)
band_list_df
bind_rows(band_list_df, .id = "from")

dir.create("data")
dir.create("data_many_tables")
heroes %>%
  group_by(Publisher) %>%
  group_split() %>%
  walk(function(x) write_csv(x, str_glue("data_many_tables/heroes_{x$Publisher[1]}.csv")))

dir("data_many_tables", full.names = TRUE) %>%
  set_names() %>%
  map(read_csv) %>%
  bind_rows(.id = "file")

band_members
band_instruments

left_join(band_members, band_instruments)
band_members %>%
  left_join(band_instruments)
names(band_members)
names(band_instruments)
intersect(names(band_members), names(band_instruments))
band_members %>%
  left_join(band_instruments, by = "name")
band_instruments2
band_members %>%
  left_join(band_instruments2, by = c("name" = "artist"))
right_join(band_members, band_instruments)

band_members %>%
  full_join(band_instruments)
band_members %>%
  inner_join(band_instruments)

# band_members %>%
#   filter(name %in% band_instruments$name) #semi_join

band_members %>%
  semi_join(band_instruments)

band_instruments %>%
  semi_join(band_members)

# band_members %>%
#   filter(!name %in% band_instruments$name) #anti_join

band_members %>%
  anti_join(band_instruments)
band_instruments %>%
  anti_join(band_members)

heroes %>%
  group_by(name) %>%
  mutate(name = paste(name, row_number(), sep = "_") %>% str_remove("_1"))


# pivot_ functions --------------------------------------------------------

new_diet <- tribble(
  ~student, ~before_r_course, ~after_r_course,
  "Maxim", 82, 75,
  "Potap", 100, 84,
  "Vasya", 76, 74
)

new_diet %>%
  pivot_longer(cols = before_r_course:after_r_course,
               names_to = "time",
               values_to = "weight") %>%
  pivot_wider(names_from = "time",
              values_from = "weight")

heroes_weight <- heroes %>%
  filter(Publisher %in% c("DC Comics", "Marvel Comics")) %>%
  group_by(Gender, Publisher) %>%
  summarise(weight_mean = mean(Weight, na.rm = TRUE)) %>%
  ungroup() %>%
  drop_na()
heroes_weight 


# across() ----------------------------------------------------------------

heroes %>%
  drop_na(Height, Weight) %>%
  group_by(Gender) %>%
  summarise(height = mean(Height),
            weight = mean(Weight))

heroes %>%
  drop_na(Height, Weight) %>%
  group_by(Gender) %>%
  summarise(across(c(Height, Weight), mean))

heroes %>%
  drop_na(Height, Weight) %>%
  group_by(Gender) %>%
  summarise(across(where(is.numeric), mean))

heroes %>%
  #drop_na(Height, Weight) %>%
  group_by(Gender) %>%
  summarise(across(c(Height, Weight), function(x) mean(x, na.rm = TRUE)))

heroes %>%
  group_by(Gender) %>%
  summarise(across(where(is.character), function(x) mean(nchar(x), na.rm = TRUE) ),
            across(where(is.numeric), function(x) mean(x, na.rm = TRUE)))

heroes %>%
  drop_na(Height, Weight) %>%
  group_by(Gender, Alignment) %>%
  summarise(across(c(Height, Weight), list(minimum = min,
                                           average = mean,
                                           maximum = max)))

vector_factor <- factor(letters)
str(vector_factor)

attributes(vector_factor)
as.character(vector_factor)
attributes(vector_factor) <- NULL
vector_factor
heroes %>%
  mutate(across(where(is.character), as.factor)) %>%
  mutate(across(where(is.factor), as.character)) %>%
  mutate(across(where(is.numeric), as.character)) %>%
  type_convert()
  
iris %>%
  mutate(across(where(is.numeric), function(x) x/max(x) * 100))
