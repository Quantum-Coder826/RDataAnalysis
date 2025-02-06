library(tidyverse)

temperatuurzones <- read.csv("temperatuurzones.csv")

# Verander de Temperatuurzondes in een orderd factor
temperatuurzones$Temperatuurzone <- factor(temperatuurzones$Temperatuurzone, ordered = TRUE,
                                           levels = c("Koud",  "Gematigd", "Warm"))

# Vraag B
temperatuurzones_avg <- temperatuurzones %>%
  select(Activiteit, Voedselconsumptie, Bewegingssnelheid) %>% # Selecteer colomen omdat deze `nums` zijn.
  summarise_all(mean)

temperatuurzones_sd <- temperatuurzones %>%
  select(Activiteit, Voedselconsumptie, Bewegingssnelheid) %>%
  summarise_all(sd)

ggplot(temperatuurzones, aes(Temperatuurzone, Activiteit, color = Soort)) +
  geom_point() +
  geom_jitter(width = 0.1) +
  labs(title = "Activiteit van verschillende soorten dieren bij verschillende temperatuurzones") +
  theme_minimal()