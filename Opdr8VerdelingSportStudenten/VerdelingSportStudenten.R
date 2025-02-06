library(tidyverse)

studenten_sport <- read.csv("studenten_sport.csv", sep = "&", dec = ",")

studenten_sport$Studiejaar <- factor(studenten_sport$Studiejaar, 
                                     levels = c("Eerstejaar", "Tweedejaar", "Derdejaar", "Vierdejaar"),
                                     ordered = TRUE)

# Vraag C
studenten_sport %>%
  filter(Sportclub == "Ja") %>%
  ggplot(aes(Studiejaar)) +
    geom_bar()
  