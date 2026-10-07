100000 * 1.1
110000 * 1.1
121000 * 1.1

100000 * 1.1
100000 * 1.1 * 1.1
100000 * 1.1 * 1.1 * 1.1

100000 * 1.1 ^ 1
100000 * 1.1 ^ 2
100000 * 1.1 ^ 3

rep(100000, 10) * rep(1.1, 10) ^ (1:10)
100000 * 1.11 ^ (1:20)

(1:10) ^ 2
# 1:10 ^ 2
# c(1:10) ^ 2 #избыточный код, так делать не стоит
1:20 * 0:1

sum(seq(1, 28, by = 3) / 3 ^ (0:9) > 0.5)

((1 + (3 * (0:9)))/(3 ^ (0:9)))


# Индексирование векторов -------------------------------------------------

n <- c(0, 1, 1, 2, 3, 5, 8, 13, 21, 34)
n[1]
n[2]
n[10]
n[length(n)]

head(n, 1)
tail(n)
tail(n, 1)

n[3] <- 20
n

n[4:7]
n[2:5]
n[c(2, 5, 10)]
# n[2, 5, 10] #вызывает ошибку

n
n[10:1]
n[length(n):1]
rev(n)
# n <- rev(n)

n[20]
n[1:30]

n[4:6] <- 0
n

n[-1]
n[-3:-6]
n
n[c(-1, -3, -10)]
n
n[c(TRUE, FALSE, TRUE, FALSE, TRUE,
    FALSE, TRUE, FALSE, TRUE, FALSE)]

n[c(TRUE, FALSE)]
n[c(FALSE, TRUE)]

n
n > 0
n[n>0]

n
n[n >= 18 & n <= 30]

n
mean(n)
n > mean(n)
n[n > mean(n)]

my_named_vector <- 
  c(first = 1, second = 2, third = 3)

my_named_vector
my_named_vector["first"]
my_named_vector[c("third", "first")]
names(my_named_vector)
attributes(my_named_vector)
names(my_named_vector)
#Зашиттые константы:
pi
letters
LETTERS
month.name
month.abb

names(my_named_vector) <- letters[1:3]
my_named_vector[c("c", "b", "b", "c", "a")]
my_named_vector[c("a", "b", "b", "a")]

# Создайте вектор 2, 4, 6, … , 18, 20 как можно большим количеством способов. 
# Постарайтесь найти хотя бы три разных способа.

#1
seq(2, 20, by = 2)
#2
2 * rep(1:10)
#3
2 * 1:10
#4
(2:20)[c(TRUE, FALSE)]
#5
(1:20)[c(FALSE, TRUE)]
#6
l <- (1:20) * c(FALSE, TRUE)
l[l != 0]
#7
l <- (1:20) * c(0, 1)
l[l != 0]
#8
a <- 1:20
a[c(FALSE, TRUE)]
#9
a <- 1:20
a[a %% 2 == 0]
#10
a <- 1:10
a * 2
#11
c(2, 4, 6, 8, 10, 14, 16, 18, 20)

#12
seq(1, 19, by = 2) + 1

#13
seq(2000, 20000, by = 2000)/1000

#`[`(n, 3)


# Работа с логическими векторами ------------------------------------------

eyes <- c("green", "blue", "blue", "brown", "green", "blue")

sum(eyes == "blue")
#sum(eyes == "blue")/length(eyes == "blue")
mean(eyes == "blue")
paste0(mean(eyes == "blue") * 100, "%")

all(eyes == "blue")
any(eyes == "blue")
all(!eyes == "blue")

which(eyes == "blue")

eyes[eyes == "blue"]
eyes[eyes != "brown"]

eyes[eyes == "blue"| eyes == "green"]

#table(eyes)

eyes[eyes == c("green", "blue")]

eyes %in% c("green", "blue")

respondent_city <- c("Москва", "Санкт-Петербург", "Москва", "Казань", "Ковров", "Балашиха",
                     "Москва", "Уфа", "Вятские Поляны", "Ростов-на-Дону", "Владимир", "Владивосток")

big_cities <- c("Москва", "Санкт-Петербург", "Новосибирск", "Екатеринбург", "Казань")
respondent_city[respondent_city %in% big_cities]


# NA и его друзья ---------------------------------------------------------

missed <- NA #Not Available
missed == "NA"
missed == ""
missed == 0

NA == NA
Joe <- NA
Mary <- NA
Joe == Mary

n[5] <- NA
n
mean(n)
n != NA
n == NA

is.na(n)
mean(n[!is.na(n)])
mean(n)
mean(n[-5])
mean(n, na.rm = TRUE)

n > 5
as.character(n)
typeof(NA)
NA_character_
NA_integer_
NA_real_
NA_complex_
typeof(n)
n > 5
as.character(n)

1/0
-1/0
0/0
NaN #not a number
mean(c(NA, NA, NA), na.rm = TRUE)

is.na(NA)
is.na(NaN)
is.nan(NA)
is.nan(NaN)

length(character())
typeof(character())
length(NULL)
typeof(NULL)
is.null(NULL)
