library(tidyverse)

data("CO2")
str(CO2)

ggplot(CO2, aes(conc, uptake, colour = Treatment)) +
  geom_point() +
  facet_grid(~ Plant)