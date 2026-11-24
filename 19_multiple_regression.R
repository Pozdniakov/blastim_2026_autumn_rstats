library(tidyverse)
library(Stat2Data)
data("Backpack")

back <- Backpack %>%
  mutate(backpack_kg = BackpackWeight * 0.453592,
         body_kg = BodyWeight * 0.453592)

mult_model1 <- lm(backpack_kg ~ body_kg + Units, data = back)
summary(mult_model1)

model <- lm(backpack_kg ~ body_kg, data = back)
summary(model)

mult_model2 <- lm(backpack_kg ~ body_kg + Units + BackProblems, 
                  data = back)
summary(mult_model2)

mult_model3 <- lm(backpack_kg ~ body_kg + Units + Year + BackProblems, 
                  data = back)

summary(mult_model2)
summary(mult_model3)
install.packages("car")
car::vif(mult_model3)
