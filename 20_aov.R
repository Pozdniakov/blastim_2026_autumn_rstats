library(tidyverse)
diet <- readr::read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/stcp-Rdataset-Diet.csv")
diet <- diet %>%
  mutate(weight.loss = weight6weeks - pre.weight,
         Dietf = factor(Diet, labels = LETTERS[1:3]),
         Person = factor(Person)) %>%
  drop_na()

# One-Way ANOVA -----------------------------------------------------------


aov_model <- aov(weight.loss ~ Dietf, data = diet)
aov_model
summary(aov_model)

# ANOVA как частный случай множественной регрессии ------------------------

lm(weight.loss ~ Dietf, data = diet) %>% summary()

# Post-hoc tests ----------------------------------------------------------


pairwise.t.test(diet$weight.loss, diet$Dietf, 
                p.adjust.method = "bonferroni") 
TukeyHSD(aov_model)
#{multcomp}, {emmeans}
pairwise.t.test(diet$weight.loss, diet$Dietf, 
                p.adjust.method = "none", pool.sd = FALSE) 

diet %>%
  group_by(Dietf) %>%
  summarise(mean(weight.loss))

# Допущения АНОВЫ ---------------------------------------------------------

residuals(aov_model)
#hist(diet$weight.loss)
hist(residuals(aov_model))
hist(rnorm(length(residuals(aov_model))))
qqnorm(residuals(aov_model))
qqnorm(rnorm(length(residuals(aov_model))))

diet <- diet %>%
  mutate(residuals = residuals(aov_model))

ggplot(data = diet) +
  geom_point(aes(x = Dietf, y = residuals),
             position = position_jitter(width = .1, height = 0),
             alpha = 08, size = 2)
diet %>%
  group_by(Dietf) %>%
  summarise(mean = mean(weight.loss),
            sd = sd(weight.loss))

?car::leveneTest
car::leveneTest(weight.loss ~ Dietf, data = diet)


# Factorial ANOVA ---------------------------------------------------------

diet_gender <- diet %>%
  group_by(Dietf, gender) %>%
  summarise(m = mean(weight.loss), se = sd(weight.loss)/sqrt(n()))
position = position_dodge(width = 0.1)
diet_gender %>%
  ggplot(aes(x = Dietf, y = m, colour = as.factor(gender))) +
  geom_line(position = position, aes(group = as.factor(gender))) + 
  geom_pointrange(aes(ymin = m - se, ymax = m + se),
                  position = position)

aov(weight.loss ~ Dietf + gender + Dietf:gender, 
    data = diet) %>%
  summary()

aov(weight.loss ~ Dietf * gender, 
    data = diet) %>%
  summary()

install.packages("ez") #afex as alternative
library(ez)
ezANOVA()