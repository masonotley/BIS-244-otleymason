rm(list=ls(all=TRUE))
cat("\014")

# Library packages
library(tidyverse)
library(ggrepel)
library(maps)

us_states <- map_data("state")
crime_data <- read_csv("US_violent_crime.csv")
Crime <- as.data.frame(crime_data)

Crime$region <- tolower(Crime$...1)
us_state_crime <- left_join(us_states, Crime)

# Theme
theme_map <- function(base_size=9, base_family="") {
  require(grid)
  theme_bw(base_size=base_size, base_family=base_family) %+replace%
    theme(axis.line=element_blank(),
          axis.text=element_blank(),
          axis.ticks=element_blank(),
          axis.title=element_blank(),
          panel.background=element_blank(),
          panel.border=element_blank(),
          panel.grid=element_blank(),
          panel.spacing=unit(0, "lines"),
          plot.background=element_blank(),
          legend.justification = c(0,0),
          legend.position = c(0,0)
    )
}


# Plotting Murder rate map

p <- ggplot(data = subset(us_state_crime),
             aes(x = long, y = lat, group = group, fill = Murder))

p1 <- p + geom_polygon(color = "black", size = 0.1) + 
  coord_map(projection = "albers", lat0 = 39, lat1 = 45)

p2 <- p1 + scale_fill_gradient2(low = "white", high = "red") + labs(title = "Murder Rate (murder arrests per 100,000 people)") 
p2 + theme_map() + labs(fill = "Murder rate")

