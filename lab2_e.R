#Im wieksza próba tym średnia z próby bedzie dążyc do wartości oczekiwanej rozkladu prawdopodobienstwa


#n = 100, 100
#... n = 10000, k =10000


#explore sequence of n=1...10000
#dla wzrostu
x_bar_seq <- NULL
mu <- 165
sigma <- 100

#write a function
for(i in 1:100){
 # print(n_seq[i])
  x <- rnorm(100000, mean=mu, sd = sigma)
  x_bar <- mean(x)
  x_bar_seq[i] <- x_bar
}
length(x_bar_seq)
x_bar_seq                                                           

hist(x_bar_seq)


#rzut moneta
x_bar_moneta <- NULL
for(i in 1:100){
  y <- sample(c(0,1),100,replace = TRUE, prob = c(0.5,0.5))
  x_bar <- mean(y)
  x_bar_moneta[i] <- x_bar
}
length(x_bar_moneta)
x_bar_moneta
hist(x_bar_moneta)


x_bar_wzrost <- NULL
mu_f <- 165
mu_m <- 175
n <- 1000
k <- 100
sigma_wzrost <- 50
for(i in 1:k){
  x_k <- rnorm(n,mean = mu_f, sd = sigma_wzrost)
  x_m <- rnorm(n,mean = mu_m, sd = sigma_wzrost)
  x <- c(x_k,x_m)
  x_bar = mean(x)
  x_bar_wzrost[i] <- x_bar
}
hist(x_bar_wzrost)


#Centralne twierdzenie graniczne - CLT
#wraz ze wzrostem proby zmniejsza sie sigma
#im wieksza próba tym dokładnośc pomiaru sredniej jest wieksza

# 3 - sigma 
#czestotliwosc wystepowania cechy 
#99.7 % obserwacji wystepuje w tym przedziale mu - 3sigma, mu + 3 sigma

mu <- 1
sigma <- 2
n <- 1000

prob_i = pnorm(mu)









