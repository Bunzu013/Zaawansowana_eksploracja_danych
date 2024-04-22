#srednia
myMean <- function(x) {
  temp <- 0
  n <- length(x)
  for (i in 1:n) {
    temp <- temp + x[i] 
  }
  mean <- temp / n
  return(mean)
}

#wariancja
myVar = function(x){
  temp <- 0
  n <- length(x)
  mu = myMean(x)
  for (i in 1:n) {
    temp <- temp + ((x[i] - mu)^2)
  }
  var <- temp/(n-1)
  return(var)
}

#odchylenie standardowe
mySd <- function(x) {
  var <- myVar(x)
  sd <- sqrt(var) 
  return(sd)
}

#kwantyl
myQuantile <- function(x, p) {
  if (p < 0 || p > 1) {
    stop("Poziom kwantyla musi być z przedziału [0, 1].")
  }
  sorted_x <- sort(x)
  n <- length(sorted_x)
  pos <- p * (n - 1) + 1
  if (pos %% 1 == 0) {
    quantile <- sorted_x[pos]
  } else {
    lower <- floor(pos)
    upper <- ceiling(pos)
    quantile <- sorted_x[lower] + (pos - lower) * (sorted_x[upper] - sorted_x[lower])
  }
  return(quantile)
}

#srednia
probny <- c(0,1,2,3,4,6,8,10)
myMean(probny)
mean(probny)

#wariancja
myVar(probny)
wariancja <- var(probny)
wariancja


#odchylenie standardowe
mySd(probny)
sd(probny)

#kwantyl
myQuantile(probny, 0.5)
quantile(probny,0.5)


#z labow

myVariance <- function(x) {
  n <- length(x)
  if (n <= 1) {
    stop("Wektor musi mieć co najmniej dwa elementy.")
  }
  mean_x <- mean(x)
  variance <- sum((x - mean_x)^2) / (n - 1)
  return(variance)
}

my_var = function(x){
  mn <-my_mean(x)
  tmp <- (x-mn)^2
  res <- sum(tmp)/(length(tmp)-1)
}

my_mean = function(x){
  res <- sum(x)/length(x)
  return(res)
}

my_qua <- function(x,q){ # jeg kwantyl
  tmp <- sort(x)
  idx <- floor(q*length(tmp))
  res <- (tmp[isx+1]-tmp[idx])/2
  return(res)
}

my_std_dev <- function(x) { #odchylenie standardowe
  mn <- my_mean(x)
  vr <- my_var(x)
  res <- sqrt(vr)
  return(res)
}

my_mean_absolute_deviation <- function(x) { #odchylenie przecietne
  mn <- my_mean(x)
  res <- sum(abs(x - mn)) / length(x)
  return(res)
}


#generowanie danych https://ourworldindata.org/human-height#human-height-across-the-world
#wygenerowac dla wzrostow 
#1980, 1880
# +waga
#height, sex, weight, country
