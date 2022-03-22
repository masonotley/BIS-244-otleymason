rm(list=ls(all=TRUE))
cat("\014")
library(tidyverse)
setwd("./covid-19-data/") # TAA - you need to set it back after
STATES <- read_csv("us-states.csv")
View(STATES)
PENNSYLVANIA <- filter(STATES, state=="Pennsylvania")
View(PENNSYLVANIA)
PENNSYLVANIA$incr_cases <- 0
PENNSYLVANIA$incr_cases[1] <- PENNSYLVANIA$cases[1]
n <- length(PENNSYLVANIA$date)
for (i in 2:n) {
  PENNSYLVANIA$incr_cases[i] <- PENNSYLVANIA$cases[i] - PENNSYLVANIA$cases[i-1]
}

PENNSYLVANIA$incr_deaths <- 0
PENNSYLVANIA$incr_deaths[1] <- PENNSYLVANIA$deaths[1]
for (i in 2:n) {
  PENNSYLVANIA$incr_deaths[i] <- PENNSYLVANIA$deaths[i] - PENNSYLVANIA$deaths[i-1]
}

sd <- sd(PENNSYLVANIA$incr_cases)
cat("The standard deviation of the increment cases in PA is", sd)

