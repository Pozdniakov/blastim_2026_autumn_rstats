library(tidyverse)

heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/refs/heads/master/data/heroes_information.csv",
                   na = c("-99", "-", "NA"))
weight <- heroes %>%
  drop_na(Weight) %>%
  pull(Weight)


# гистограмма -------------------------------------------------------------


x <- c(1, 2, 4, 5, 8, 12, 14, 30)
hist(weight, breaks = 100)


# ящик с усами ------------------------------------------------------------

boxplot(iris$Sepal.Length ~ iris$Species)
boxplot(Sepal.Length ~ Species, data = iris)
boxplot(x)

install.packages("palmerpenguins")
library(palmerpenguins)
penguins

gg <- ggplot()
ggplot() +
  geom_point(data = penguins, 
             aes(x = bill_length_mm,
                 y = bill_depth_mm),
             colour = "#6632a8")
ggplot() +
  geom_point(data = penguins, 
             aes(x = bill_length_mm,
                 y = bill_depth_mm,
                 colour = species),
             alpha = 0.9)

ggplot() +
  geom_point(data = penguins, 
             aes(x = bill_length_mm,
                 y = bill_depth_mm,
                 colour = bill_depth_mm),
             size = 3,
             alpha = 0.5) +
  scale_colour_viridis_c(end = .8)

ggplot() +
  geom_point(data = penguins, 
             aes(x = bill_length_mm,
                 y = bill_depth_mm,
                 colour = species),
             size = 3,
             shape = "🐧") +
  coord_fixed()

penguins_count <- penguins %>%
  count(species)

ggplot() +
  geom_col(data = penguins_count,
           aes(x = species,
               y = n,
               fill = species))  

ggplot() +
  geom_col(data = penguins, aes(x = species, fill = species),
           stat = "count")

ggplot() +
  geom_boxplot(data = penguins, aes(x = species, y = body_mass_g))

ggplot() + 
  geom_bar(data = penguins, aes(x = species))

ggplot() +
  geom_point(data = penguins, 
             aes(x = bill_length_mm,
                 y = bill_depth_mm,
                 colour = species),
             size = 3,
             alpha = 0.5) +
  geom_smooth(data = penguins,
              aes(x = bill_length_mm,
                  y = bill_depth_mm,
                  colour = species),
              method = "lm")

ggplot() + 
  geom_bar(data = penguins, aes(x = species, fill = sex),
           position = "fill", alpha = 8) +
  coord_flip()

ggplot() +
  geom_point(data = penguins, 
             aes(x = species, y = body_mass_g),
             alpha = .5,
             size = 1.5,
             position = position_jitter(width = .145,
                                        height = 0))

ggplot() +
  geom_density(data = penguins,
               aes(x = body_mass_g, fill = species), alpha = .5, adjust = 0.5)

ggplot(data = penguins, aes(x = species, y = body_mass_g, fill = species)) +
  geom_violin(alpha = .8) +
  geom_point(alpha = .4,
             size = 1.5,
             position = position_jitter(width = .12,
                                        height = 0)) +
  geom_boxplot(width = .1, fill = "white", alpha = .8) +
  scale_fill_brewer(palette = "Set1")

ggplot() + 
  geom_bar(data = penguins, aes(fill = sex, x = "")) +
  coord_polar(theta = "y") +
  theme_void()

ggplot() +
  geom_point(data = penguins, 
             aes(x = bill_length_mm,
                 y = bill_depth_mm,
                 colour = bill_depth_mm),
             size = 3,
             alpha = 0.5) +
  scale_colour_viridis_c(end = .8) +
  facet_wrap(~species, nrow = 3, scales = "free")

ggplot(data = penguins, aes(x = species, y = body_mass_g, fill = species)) +
  geom_violin(alpha = .8) +
  geom_point(alpha = .4,
             size = 1.5,
             position = position_jitter(width = .12,
                                        height = 0)) +
  geom_boxplot(width = .1, fill = "white", alpha = .8) +
  scale_fill_brewer(palette = "Set1") +
  theme_minimal()

ggplot() +
  geom_point(data = penguins, 
             aes(x = bill_length_mm,
                 y = bill_depth_mm,
                 colour = bill_depth_mm),
             size = 3,
             alpha = 0.5) +
  scale_colour_viridis_c(end = .8) +
  labs(title = "Клювы у пингвинов",
       subtitle = "У разных видов разные клювы!",
       caption = "Blastim, 2026",
       x = "Bill length, mm",
       y = "Bill depth, mm",
       colour = "Bill depth, mm") +
  hrbrthemes::theme_ipsum()

ggsave("penguins.png")
