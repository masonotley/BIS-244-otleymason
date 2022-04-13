rm(list=ls(all=TRUE))
cat("\014")

library(tidyverse)
library(scales)
library(ggrepel)

movies <- read_csv("Top_10000_Popular_Movies.csv")

movies_recent <- movies %>% 
  filter(release_date >= as.Date("2020-01-01") & release_date <= as.Date("2022-01-01"))
movies_recent

p <- ggplot(data = movies_recent, 
            mapping = aes(x = release_date,
                          y = popularity))
p + geom_point()+
  labs(x = "Release Date",
       y = "Popularity Score",
       title = "Top 10,000 Most Popular Movies") +
  scale_y_continuous(labels = scientific) +
  geom_text_repel(data = subset(movies_recent, popularity > 1786),
    mapping = aes(label = original_title))
  

