
# Создание переменных -----------------------------------------------------


a <- log(8, base = 2)
a
b = 4
# 7 + 10 -> d #обычно так не рекомендуют делать

variable2 <- sqrt(25)
#`variable-2` <- 4
#`4` <- b

rm(variable)
rm(list = ls())

new_variable <- 2
#newVariable
#new.variable

# Типы данных -------------------------------------------------------------


a <- 2
b <- a ^ a - a ^ 0

a = b

a <- 2
b <- a ^ a - a ^ 0
a == b
a != b

5!=120 #и математики и программисты согласны

a > b #false
a < b #true
a >= b #false
a <= b #true
a <= a #true
b >= b #true

age <- 20
age > 18
age >= 18

a != b

typeof(a)
is.integer(a)
typeof(as.integer(a))

d <- 4L
is.integer(d)
typeof(4.2)

typeof(1+2i)
is.numeric(1+2i)
is.numeric(2)

s <- "Hi, everyone!"
s2 <- 'Hi, everyone!'
s
s2
s == s2
paste("I", "love", "R")
paste("I", "love", "R", sep = "")
paste0("I", "love", "R")
new_string <- paste("I", "love", "R", sep = "_<3:+_")
new_string
strsplit(new_string, split = "_<3:+_", fixed = TRUE)

f1 <- FALSE
f1
t1 <- TRUE
t1

d <- "text"

t1
f1
!t1
!f1

t1 & t1 #TRUE
t1 & f1 #FALSE
f1 & t1 #FALSE
f1 & f1 #FALSE

t1 | t1 #TRUE
t1 | f1 #TRUE
f1 | t1 #TRUE
f1 | f1 #FALSE

age <- 18
#Входит ли age в диапазон от 18 до 30 (включительно)

typeof((age >= 18) & (age <= 30))

# Атомик векторы ----------------------------------------------------------

c(4, 8, 15, 16, 23, 42)
c(1.6, 2.3)
c("Hey", "Hey", "Ha")
c(TRUE, FALSE, TRUE)
c(a, b, age)
lost <- c(4, 8, 15, 16, 23, 42)
c(lost, lost, 10000)
length(lost)

1:10
1.5:10
5:-3

#10:10:100 #так оно не работает

seq(10, 100, by = 10)
seq(1, 13, length.out = 7)

seq_len(10)
1:10
1:0
seq_len(0)

seq_along(c("One", "Two", "Three", "Four"))

rep(1, 5)
rep(1:3, 3)
rep(1:3, each = 3)

rep(1:3, c(10, 2, 30))

sum(1:10)
mean(1:10)


# Количество цифр после запятой -------------------------------------------


round(2.3455667, digits = 3)
print(sqrt(1:10), digits = 10)
options(digits = 15)
sqrt(1:10)
options(digits = 7)
sqrt(1:10)


# Неявное приведение типов ------------------------------------------------


c(FALSE, 2)
2 + TRUE
c(TRUE, 2, "три")
c(TRUE, 2)
c(c(TRUE, 2), "три")

as.integer(as.character(as.integer(c(TRUE, FALSE, TRUE))))

as.integer(c("1", "2", "три"))
as.logical(-5:5)


# Векторизация ------------------------------------------------------------

n <- 1:4
m <- c(10, 100, 1000, 10000)
m + n
m * n
m / n
n ^ n

sqrt(100)
sqrt(1:10)

log(1:10, base = 2)
log(2, 1:10)
log(1:10, base = 1:10)
n
k <- c(1, 10)
k
n + k
n * k
n * 2

n + c(3, 4, 5)

(n + m) * n ^ m

