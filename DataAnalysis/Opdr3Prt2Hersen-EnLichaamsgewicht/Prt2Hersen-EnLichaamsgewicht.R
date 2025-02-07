library(dplyr)
library(ggplot2)

animal_weight <- read.csv("./animal_weight2.csv")

animal_weight %>%
  arrange(desc(brain))
  
# Remove all animals heaver than 9000 kg e.g. "dinos"
animal_nodino <- animal_weight %>%
  filter(body < 9000) %>%
  arrange(desc(brain))

ggplot(animal_nodino, aes(x = body, y = brain)) +
  geom_point() + 
  scale_x_log10() +
  scale_y_log10()