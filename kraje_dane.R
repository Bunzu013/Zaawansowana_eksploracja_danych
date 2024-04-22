#install.packages("googlesheets4")
#install.packages("ggplot2")
#install.packages("dplyr")
#install.packages("flexdashboard")
#install.packages("shiny")
#install.packages("rbokeh")
library(googlesheets4)
library(ggplot2)
library(dplyr)
gs4_deauth()
gs4_auth()

gsheet_key <- "" #add key
dane <- read_sheet(gsheet_key, sheet="") #add sheet name

dataset <- 
  dane %>% select(country,code,key) %>%
  filter(code == "JP" | code == "ES" | code == "NOR")

dataset
nor_key  <- dataset$key[1]
nor_code <- dataset$code[1]

nor_data <- read_sheet(nor_key, sheet = nor_code)

head(nor_data)
summary(nor_data)
summary(as.factor(nor_data$sex))

jp_key  <- dataset$key[2]
jp_code <- dataset$code[2]

jp_data <- read_sheet(jp_key, sheet = jp_code)

head(jp_data)
summary(jp_data)
summary(as.factor(jp_data$sex))

es_key  <- dataset$key[3]
es_code <- dataset$code[3]

es_data <- read_sheet(es_key, sheet = es_code)
head(es_data)
summary(es_data)
summary(as.factor(es_data$sex))


combined_data <- union(nor_data, union(jp_data, es_data))
saveRDS(combined_data, file = "combined_data.RData")

dta <- readRDS(file = "combined_data.RData" )

dta %>% summary()

dta %>% mutate(country= factor(country), sex = factor(sex)) %>% summary()

dta_plot <- dta %>% sample_n(500) %>% mutate(year = factor(year))


#PLOTS
#basic dot_plot
ggp1 <- ggplot(data =dta_plot, mapping = aes(x=height, y=weight, color = year)) + geom_point()
ggp1
ggp2 <- ggplot(data =dta_plot, mapping = aes(x=height, y=weight, color = country)) + geom_point()
ggp2

#BOXPLOT
ggb1 <- ggplot(data =dta_plot, mapping = aes(x=height, y=weight, color = year)) + geom_boxplot()
ggb1
ggb2 <- ggplot(data =dta_plot, mapping = aes(x=height, y=weight, color = country)) + geom_boxplot()
ggb2

# geom_jitter
ggplot(data = dta_plot, mapping = aes(x=year, y = height,fill=year)) + 
  geom_boxplot()+
  geom_jitter(alpha=0.4,height=0.39,width=0.2)

ggplot(data = dta_plot, mapping = aes(x=year, y = height,fill=country)) + 
  geom_boxplot()+
  geom_jitter(alpha=0.4,height=0.39,width=0.2)

# geom_rug()
ggplot(data = dta_plot, mapping = aes(x=year, y = height,fill=year)) + 
  geom_boxplot()+
  geom_jitter(alpha=0.4,height=0.39,width=0.2) + 
  geom_rug()
ggplot(data = dta_plot, mapping = aes(x=year, y = height,fill=country)) + 
  geom_boxplot()+
  geom_jitter(alpha=0.4,height=0.39,width=0.2) + 
  geom_rug()

# WYKRES WIOLINOWY: geom_violin()

ggplot(data = dta_plot, mapping = aes(x=sex, y = height,fill=year)) +
  geom_violin(trim=F) +
  geom_boxplot(width=0.1, color="white",fill="white", alpha=0.2)+
  geom_jitter(alpha=0.3) + 
  geom_rug()

ggplot(data = dta_plot, mapping = aes(x=sex, y = height,fill=country)) +
  geom_violin(trim=F) +
  geom_boxplot(width=0.1, color="white",fill="white", alpha=0.2)+
  geom_jitter(alpha=0.3) + 
  geom_rug()

# HISTOGRAM: geom_histogram()
ggplot(data = dta_plot, mapping = aes(x=height, fill=year)) + 
  facet_wrap(facets=vars(sex))+
  geom_histogram(bins=30)

ggplot(data = dta_plot, mapping = aes(x=height, fill=country)) + 
  facet_wrap(facets=vars(sex))+
  geom_histogram(bins=30)

