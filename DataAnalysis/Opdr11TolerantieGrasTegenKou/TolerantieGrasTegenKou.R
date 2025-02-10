library(tidyverse)

data("CO2")
str(CO2)

ggplot(CO2, aes(conc, uptake, colour = Treatment)) +
  geom_point() +
  facet_grid(~ factor(Plant))

#vraag C
ggplot(CO2, aes(conc, uptake, colour = Plant)) +
  geom_line(linewidth = 1) +
  facet_grid(Treatment ~ Type) +
  scale_color_discrete()