library(tidyverse)
library(ggthemes)

data("mtcars")

my_theme <- theme_foundation() + theme(text = element_text(color = "black", family = "mono")) + 
  theme(panel.grid.minor = element_blank(), panel.grid.major.y = element_blank(),
        panel.grid.major.x = element_line(colour = "snow2")) +
  theme(legend.key = element_blank())

ggplot(mtcars, aes(mpg, hp, shape = factor(vs))) +
  geom_point() +
  labs(title = "test") +
  my_theme # is var