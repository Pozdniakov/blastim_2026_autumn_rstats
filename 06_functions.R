
# Создание функций --------------------------------------------------------


2 ^ 3
2 ** 2

pow <- function(x, p) {
  power <- x ^ p
  return(power)
}

pow(3, 2)

pow <- function(x, p) {
  x ^ p
}
pow(5, 3)

pow <- function(x, p) x ^ p
pow(10, 0)

pow <- function(x, p = 2) x ^ p

pow(10)
pow(10, 3)

10 %% 1:10

82 / 1.82 ^2
mass <- 84
height <-  1.75
mass / height ^2

imt <- function(m, h) m / h^2
imt(80, 1.8)

eyes <- c("blue", "blue", "green", "brown")
cold_colours <- c("blue", "green")
eyes[!eyes %in% cold_colours]

diff(c(1, 0, 1, 2, 3))
diff(c(0, 0, 1, 1, 2, 3, 5))
diff(c(0, -1, -1, -2, -2))

vec <- c(0, 0, 1, 1, 2, 3, 5)
all(diff(vec) >= 0) | all(diff(vec) <= 0)
is_monotonic <- function(x) all(diff(x) >= 0) | all(diff(x) <= 0)
is_monotonic(c(1, 0, 1, 2, 3))
is_monotonic(c(0, 0, 1, 1, 2, 3, 5))
is_monotonic(c(0, -1, -1, -2, -2))

sum(7 %% 1:7 == 0) == 2
!any(7 %% 2:6 == 0)

is_prime <- function(x) sum(x %% 1:x == 0) == 2
is_prime(2026)
is_prime(2027)

# mass <- 84
# what <- function() mass ^ 2
# what()
# 
# pow <- function(x, p = 2, whatever = power) {
#   power <- x ^ p
#   return(whatever)
# }
# pow(3)  


mean(1:10)
sum(1:10)/length(1:10)

#mean[1]
#Error in mean[1] : object of type 'closure' is not subsettable

list(mean, min, `[`)


# Семейство apply() -------------------------------------------------------

A <- matrix(1:12, nrow = 3)
A
colSums(A)
rowSums(A)
colMeans(A)
rowMeans(A)

apply(A, 2, sum)

A[2, 3] <- NA
A
# apply(A, 2, sum(na.rm = TRUE)) #не работает

?c
?list
?paste
apply(A, 2, sum)
apply(A, 2, sum, na.rm = TRUE)

neo_vec <- c("Welcome", "to", "the", "Matrix", "Neo", "!")
sum(nchar(neo_vec))

neo_matrix <- matrix(neo_vec, nrow = 3)
sum_nchar <- function(x) sum(nchar(x))
apply(neo_matrix, 1, sum_nchar)

apply(neo_matrix, 1, function(x) sum(nchar(x)))
apply(neo_matrix, 1, \(x) sum(nchar(x)))

some_list <- list(some = 1:10, list = letters)
some_list
length(some_list)
lapply(some_list, length)
unlist(lapply(some_list, length))

sapply(some_list, length)

install.packages("purrr")
library(purrr)       
lapply(some_list, length)
map(some_list, length)
map_int(some_list, length)
map_chr(some_list, length)
map(some_list, 2)

map_chr(some_list, function(x) as.character(length(x)))
map_chr(mtcars, typeof)
sapply(mtcars, typeof)
na_n <- function(x) sum(is.na(x))
map_int(mtcars, na_n)

replicate(100, mean(rnorm(100, 100, 15)))

mean(sapply(1:10000000, log))
mean(log(1:10000000))

is_prime <- function(x) sum(x %% 1:x == 0) == 2
is_prime(3)
is_prime(4)

is_prime_vectorized <- Vectorize(is_prime)
is_prime_vectorized(2:10)
sapply(2:10, is_prime)
map_lgl(2:10, is_prime)
diff(1:10)
cumsum(1:10)
