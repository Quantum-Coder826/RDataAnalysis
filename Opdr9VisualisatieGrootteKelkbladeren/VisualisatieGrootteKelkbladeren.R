library(tidyverse)

data("iris")
str(iris)

# Vraag B
ggplot(iris, aes(Species, Sepal.Length, size = Sepal.Width)) +
  geom_point(alpha = 0.4, position = position_jitterdodge(jitter.width = 0.3, 
                                                          dodge.width = 0.3)) +
  labs(title = "Vraag B", x = "soort", y = "Kelk blad lengte",
       size = "Kelk blad breedte") +
  theme()