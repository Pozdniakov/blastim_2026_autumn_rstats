library(tidyverse)
library(Stat2Data)
data("Backpack")

back <- Backpack %>%
  mutate(backpack_kg = BackpackWeight * 0.453592,
         body_kg = BodyWeight * 0.453592)

# t-test как частный случай коэффициента корреляции Пирсона ---------------


t.test(back$backpack_kg ~ back$BackProblems, var.equal = TRUE)
cor.test(back$backpack_kg, back$BackProblems)


# Множественные корреляции ------------------------------------------------

  
back %>%
  select(Year, Units, backpack_kg, body_kg) %>%
  cor()

cor.test(back$backpack_kg, back$body_kg)

back %>%
  select(Year, Units, backpack_kg, body_kg) %>%
  psych::corr.test()

psych::corr.test(as.data.frame(matrix(rnorm(100 * 20), nrow = 100)))

back %>%
  select(Year, Units, backpack_kg, body_kg) %>%
  psych::corr.test(adjust = "bonferroni")

back %>%
  select(Year, Units, backpack_kg, body_kg) %>%
  psych::corr.test()

back %>%
  select(Year, Units, backpack_kg, body_kg) %>%
  psych::corr.test(adjust = "BH")

p_vec <- seq(.0001, 0.06, length.out = 10)
p_vec
p.adjust(p_vec)
p.adjust(p_vec, method = "bonferroni")
p.adjust(p_vec, method = "fdr")

mtcars %>%
  cor()
install.packages("corrplot")
library(corrplot)
corrplot::corrplot(cor(mtcars), method = "color", order = "hclust")
install.packages("pheatmap")
?pheatmap::pheatmap()
pheatmap::pheatmap(cor(mtcars))

pheatmap::pheatmap(mtcars, scale = "column")


# Простая линейная регрессия ----------------------------------------------

cor.test(back$backpack_kg, back$body_kg)

class(y ~ x)

model <- lm(backpack_kg ~ body_kg, data = back)
model
class(model)
str(model)
model$coefficients
model
ggplot(data = back) +
  geom_point(aes(x = body_kg, y = backpack_kg),
             alpha = .4) +
  geom_abline(slope = model$coefficients[2],
              intercept = model$coefficients[1])

predict(model, newdata = data.frame(body_kg = 1000))
predict(model, newdata = data.frame(body_kg = 0))

model
summary(model)
back$backpack_kg
fitted(model)
# back$backpack_kg - fitted(model)
residuals(model)
options(scipen = 999)
mean(residuals(model))
plot(model)

summary(model)

tss <- sum((back$backpack_kg - mean(back$backpack_kg))^2)
rss <- sum(residuals(model)^2)
1 - rss/tss


cor.test(back$backpack_kg, back$body_kg)$estimate ^ 2

ggplot(data = back, aes(x = body_kg, y = backpack_kg)) +
  geom_point(alpha = .4) +
  # geom_abline(slope = model$coefficients[2],
  #             intercept = model$coefficients[1])
  geom_smooth(method = "lm", colour = "grey20")
  