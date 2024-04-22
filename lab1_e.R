
set.seed(31415) # - liczby beda tak samo losowane - ta sama próba
n <- 100
x <- rnorm(n, mean=0, sd = 1)
x_bar <- mean(x)
x_bar

#explore sequence of n=1...10000
n_seq <- seq(10,100000,by=100)
length(n_seq)
x_bar_seq <- NULL
mu <- 175
sigma <- 100

#write a function
for(i in 1:length(n_seq)){
  print(n_seq[i])
  set.seed(31415)
 # x <- rnorm(n_seq[i], mean=0, sd = 1)
  x <- rnorm(n_seq[i], mean=mu, sd = sigma)
  x_bar <- mean(x)
  x_bar_seq[i] <- x_bar
}
length(x_bar_seq)
x_bar_seq


plot(n_seq,x_bar_seq, main="LLN", col="black", cex=0.1, xlab = "n",ylab="x_bar")
lines(x=n_seq, y = x_bar_seq, type="l", col= "red")
#abline(a =0,b=0, col="black")
abline(a =mu,b=0, col="black")


#sredni wzrost kobiet i mezczyzn
mu_f <- 165
n_f <- 1000
sd_f <- 50

mu_m <- 180
n_m <- 1200
sd_m <- 55

male <- rnorm(n_m, mean=mu_m, sd = sd_m)
female <- rnorm(n_f, mean=mu_f, sd = sd_f)

#Im wieksza średnia z próby bedzie dąyc do wartości oczekiwanej 


