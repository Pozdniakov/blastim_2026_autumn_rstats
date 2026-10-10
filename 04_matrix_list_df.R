NA * 5
NA == NA
NA ^ 0
NA & FALSE


# Матрица -----------------------------------------------------------------

A <- matrix(1:12, nrow = 4)
A
A[2, 3]
A[1:2, 2:3]
A[c(1, 3), c(1, 3)]
A[-1, -1]
A[c(TRUE, FALSE, TRUE, FALSE), 
  c(TRUE, FALSE, TRUE)]

A[1:2, ]
A[ , 1:2]
A[1:2, 1:2] <- 100
A
A > 10
# matrix(1:12, nrow = 4, byrow = TRUE)

matrix(rep(1:9, 9) * rep(1:9, each = 9), nrow = 9)
outer(1:9, 1:9)
1:9 %o% 1:9      

rep(1:9, each = 9)*matrix(1:9, nrow = 9, ncol = 9)

A
attributes(A)
attr(A, "dim") <- NULL
attributes(A)
typeof(A)
class(A)
attr(A, "dim") <- c(2, 6)
A
attr(A, "dim") <- c(6, 2)
A
attr(A, "dim") <- c(2, 2, 3)
A


# Список ------------------------------------------------------------------

simple_list <- list(42, "Hello", TRUE)
simple_list
complex_list <- list(simple_list,
     letters,
     1:10,
     A,
     mean)

complex_list
str(complex_list)

named_list <- list(name = "Daisy", age = 67, student = FALSE)
named_list
named_list$name
named_list[1]
class(named_list[1])
class(named_list$name)
named_list[[1]]
named_list[1]
named_list["name"]
named_list[["name"]]
named_list$name


# Датафреймы --------------------------------------------------------------

df <- data.frame(name = c("Daisy", "Ann", "Потап", "Carol", "Юрий", "Санечка"),
     age = c(67, 25, 28, 60, 47, 38),
     student = c(FALSE, TRUE, TRUE, FALSE, FALSE, TRUE))

df
df[,2]
df[,"age"]
df$age
df[1:2, 2:3]
df[df$age > 30, 2:3]
df$lovesR <- TRUE
df
df$lovesR <- NULL
df
df[df$student, ]
df[!df$student, ]
df[df$age < mean(df$age), "student"]

mtcars$wt == min(mtcars$wt)
#mtcars[min(mtcars$wt), ]
#mtcars[11]
is.vector(1:10)
is.vector(mean)
is.vector(simple_list)
is.atomic(1:10)
is.atomic(simple_list)
is.recursive(1:10)
is.recursive(simple_list)


# Пакеты ------------------------------------------------------------------

rownames(installed.packages(priority = "base"))

install.packages("beepr")
library(beepr)
beep()
?beep
beep("ready")

beep(9)
beepr::beep(8)

install.packages("devtools")
devtools::install_github("brooke-watson/BRRR")
install.packages("remotes")
remotes::install_github("brooke-watson/BRRR")
install.packages("pak")
pak::pkg_install("brooke-watson/BRRR")
library(BRRR)
skrrrahh(24)
