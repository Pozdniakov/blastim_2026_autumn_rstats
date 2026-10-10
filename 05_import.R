read.csv("heroes_information.csv")
getwd()
#setwd()

read.csv("/Users/ivan/Desktop/heroes_information.csv")
read.csv("heroes_information.csv")

?read.csv2()
read.table("heroes_information.csv", header = TRUE, sep = ",", quote = "\"")

heroes <- read.csv("heroes_information.csv", na.strings = c("NA", "-99", "-"))

mean(heroes$Height)

#Найдите в read.csv параметр для настройки NA
#
#readxl::read_excel()
#haven::read_spss()
#haven::read_dta()

heroes_clean <- heroes[!is.na(heroes$Gender), ]

wrong <- read.csv("heroes_information_wrong.csv", 
                  na.strings = c("-", "-99", "NA"))
str(wrong)
wrong_clean_height <- wrong[!is.na(wrong$Height), ]
wrong_clean_height[is.na(as.numeric(wrong_clean_height$Height)), ]
#wrong[complete.cases(wrong), ]

wrong[wrong$Height == "18mhjf5" & !is.na(wrong$Height), "Height"] <- 185
