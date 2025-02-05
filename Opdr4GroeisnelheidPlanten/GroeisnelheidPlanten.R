library(tidyverse)

plant_height <- read.csv("./plantheight.csv", sep = ";", dec = ",", header = TRUE)

plant_height <- plant_height %>%
  filter(Lux > 300) %>% # Lights under 300 lux have failed
  filter(GrowthDuration >= 15) %>% # Planten moeten minstens 15 weeken groeien
  mutate(gemiddeldeGroeiWeek = mean(TotalHeight) / GrowthDuration) # bereken gemiddelde groei per week per plant

if (FALSE) { # Change to `FALSE` to select plot vraag e.
  # plot vraag d
  ggplot(plant_height, aes(x = GrowthDuration, y = TotalHeight, color = PlantSpecies)) +
    geom_point()
  
} else {
  # plot vraag e
  ggplot(plant_height, aes(x = GrowthDuration, y = TotalHeight, 
                           color = Lux, size = WaterLevel)) +
    geom_point() +
    facet_wrap(~ PlantSpecies) # '~' represents by
}
