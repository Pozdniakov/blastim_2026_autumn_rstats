set.seed(42)
samp <- rnorm(100, mean = 100, sd = 15)
samp
mean(samp)
sd(samp)

sample_means <- replicate(1000000, mean(rnorm(100, mean = 100, sd = 15)))

hist(sample_means, breaks = 100)
mean(sample_means)
sd(sample_means)

sd(samp)/sqrt(length(samp))

hist(rlnorm(100))
sample_lmeans <- replicate(1000000, mean(rlnorm(100)))
hist(sample_lmeans, breaks = 100)

sem <- sd(samp)/sqrt(length(samp))

qnorm(.975)
mean(samp) - sem * qnorm(.975)
mean(samp) + sem * qnorm(.975)

samp
n = length(samp)
mu = 95
sigma = 15

z_emp <- (mean(samp) - mu)/(sigma/sqrt(n))
z_emp
(1 - pnorm(z_emp)) * 2
mean(samp)
