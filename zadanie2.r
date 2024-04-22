#install.packages("googlesheets4")
#install.packages("ggplot2")
#install.packages("dplyr")
#install.packages("yaml")
#install.packages("rbokeh")

library(googlesheets4)
library(ggplot2)
library(dplyr)

#ss <- gs4_create("population")

ss <- gs4_find("population")
gsheet_key <- "" #add key
tmp <- read_sheet(gsheet_key, sheet=1)

norway <- function(n, seed = NULL) {
  if (!is.null(seed)) set.seed(seed)
  else set.seed(NULL)
  
  x1 <- sample(c(0, 1), n, replace = TRUE, prob = c(0.5, 0.5)) 
  eps <- rnorm(n, mean = 0, sd = 1)
  epsW <- rnorm(n, mean = 1, sd = 2)
  y_1880 <- 171.1 - (11.88) * x1 + (1 - x1) * 7.07 * eps + x1 * 7.59 * eps
  y_1980 <- 179.7 - (13.28) * x1 + (1 - x1) * 7.07 * eps + x1 * 7.59 * eps
  y_weight <- 89.1 - (16.5) * x1 + (1 - x1) * 7.07 * epsW + x1 * 7.59 * epsW
  
  sex <- factor(x1)
  levels(sex) <- c("female", "male")
  dataset_1880 <- data.frame(year = 1880, height = round(y_1880, 2), weight = round(y_weight, 2), sex = sex, country = "NOR")
  dataset_1980 <- data.frame(year = 1980, height = round(y_1980, 2), weight = round(y_weight, 2), sex = sex, country = "NOR")
  res <- rbind(dataset_1880, dataset_1980)
  
  return(res)
}

result <- norway(n=100, seed=100)
head(result)
result <- result[, c("height", "sex", "country", "year", "weight")]
#ss %>% sheet_add(c("Info", "NOR", "Overview"))
ss %>% range_write(result, sheet=1, col_names=T)




