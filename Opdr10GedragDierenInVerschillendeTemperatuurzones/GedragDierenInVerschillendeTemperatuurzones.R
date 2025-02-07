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

# Vraag D
ggplot(temperatuurzones, aes(Voedselconsumptie, fill = Temperatuurzone)) +
  geom_histogram(binwidth = 50, center = 25) +
  scale_fill_brewer("Pastel1") +
  labs(title = "Vraag D", fill = "Temperatuurzone")

# Vraag E
temperatuurzones %>%
  group_by(Temperatuurzone, Soort) %>%
  summarise(GemActiviteit = mean(Activiteit), SEM = sd(Activiteit)/sqrt(n())) %>%
  
  ggplot(aes(x = Temperatuurzone, y = GemActiviteit, fill =
                             Soort)) +
    geom_col(position = "dodge") +
    geom_errorbar(aes(ymin = GemActiviteit - SEM, ymax = GemActiviteit + SEM),
                  position = position_dodge(0.9), width = 0.2)

# Vraag F
snelheden <- read.csv("Snelheden.csv")

ggplot(snelheden, aes(Tijd, SnelheidGemiddeld)) +
  geom_line(color = "darkolivegreen4") +
  geom_ribbon(aes(ymin = SnelheidGemiddeld - SE, ymax = SnelheidGemiddeld + SE),
              fill = "darkolivegreen4", alpha = 0.5)
  