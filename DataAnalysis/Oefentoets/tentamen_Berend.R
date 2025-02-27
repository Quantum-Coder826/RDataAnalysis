# Opdracht 1
cereal <- read.csv("cereal.csv", sep = "^", dec = ".", header = TRUE)
head(cereal, 10)

# Opdracht 2
library(ggplot2)
library(dplyr)

# Opdracht 3
hot_cereals <- subset(cereal, type == "H")
hot_cereals[order(hot_cereals$rating), ]

# Opdracht 4
kelloggs_cereals <- cereal %>%
  filter(mfr == "K")

ggplot(kelloggs_cereals, aes(rating, fill = as.factor(shelf))) +
  geom_histogram(binwidth = 20, position = "dodge") # Bins uniform maken met position arg

# Opdracht 5
cereal %>%
  mutate(protweight = protein / weight) %>%
  summarise(min = min(protweight), max = max(protweight), avg = mean(protweight))

# Opdracht 6
ggplot(cereal, aes(sugars, calories, size = rating)) +
  geom_point(alpha = 0.4, color = "darkolivegreen4") +
  facet_grid(~ mfr)

ggsave("sugars vs calories per cereal manufactuar and rating.png")

# Opdracht 7
ggplot(cereal, aes(sugars, calories, size = rating)) +
  geom_point(alpha = 0.4, color = "darkolivegreen4") +
  facet_grid(~ mfr) +
  labs(title = "Hoeveelheid calorien versus suikers in ontbijtgranen met beoordeling per producent",
       size = "beoordeling") +
  theme_grey() +
  theme(axis.text = element_text(color = "darkolivegreen4"))
