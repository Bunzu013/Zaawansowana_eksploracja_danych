#wzrost mezczyzn 
#1880 - 171.1
#1980 - 179.7

#wzrost kobiet
#1880 - 159.22
#1980 - 166.42

#standardowa roznica 6.34

#waga
# k 72.6 kg	
# m 89.1 kg

dgp_p1 <- function(n, seed=NULL) {
  if (!is.null(seed))
    set.seed(seed)
  
  if (is.null(f))
    f <- function(x) 1 + 2*x
  
  x1 <- rnorm(n, mean = 1, sd = 2)
  eps <- rnorm(n, mean = 0, sd = 2)
  y <- f(x1) + eps
  
  res <- data.frame(y = y, x = x1)
  return(list(dataset = res, f = f))
}


dgp_heights <- function(n, seed = NULL){
  
  if(!is.null(seed)) set.seed(seed)
  
  x1 <- sample(c(0, 1), n, replace = TRUE, prob = c(0.5, 0.5))
  eps <- rnorm(n, mean = 0, sd = 1)
  
  y_1880 <- 171.1 - (11.88) * x1 + (1 - x1) * 7.07 * eps + x1 * 7.59 * eps
  y_1980 <- 179.7 - (13.28) * x1 + (1 - x1) * 7.07 * eps + x1 * 7.59 * eps
  y_weight <- 89.1 - (16.5) * x1 + (1 - x1) * 7.07 * eps + x1 * 7.59 * eps
  
  sex <- factor(x1)
  levels(sex) <- c("female", "male")
  res <-data.frame(height=round(c(y_1880,y_1980 ),2),weight=round(y_weight,2),sex=sex)
  
  return(list(dataset = res))    
}

dgp_heights(100, 100)