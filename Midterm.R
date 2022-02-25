rm(list=ls(all=TRUE))
cat("\014")
library(tidyverse)
AMD <- read_csv("AMD.csv")
View(AMD)
p <- ggplot(data = AMD)
p
p <- ggplot(data = AMD,
            mapping = aes(x = Date, 
                          y = `Adj Close`))
p
p + geom_point()
p + geom_point(size = 0.5) +
  labs(x = "Date", y = "Adjusted Closing Price",
       title = "AMD Adjested Closing Prices 2/24/2021 to 2/24/2022")
p_out <- p + geom_point(size = 0.5) +
  labs(x = "Date", y = "Adjusted Closing Price",
       title = "AMD Adjested Closing Prices 2/24/2021 to 2/24/2022")
p_out
ggsave("Midterm.R Plot.pdf", plot = p_out)
