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
  
# Vraag D
avg_cijfer_studenten_sport <- studenten_sport %>%
  group_by(Studiejaar, Sportclub) %>%
  summarise(avg_cijver = mean(GemiddeldCijfer))

# Vraag E
ggplot(avg_cijfer_studenten_sport, aes(Studiejaar, avg_cijver,
                                       group = Sportclub,
                                       colour = Sportclub)) +
  geom_line() +
  labs(title = "Vraag E")

# Vraag G
ggplot(studenten_sport, aes(GemiddeldCijfer, Gezondheidsscore,
                            colour = Geslacht, shape = Sportsoort,
                            label = StudentID)) +
  geom_point(size = 5) +
  geom_text(colour = "black", alpha = 0.5) +
  expand_limits(y=0:10) +
  labs(title = "Vraag G", shape = "sport") +
  scale_color_manual(values = c("cyan3", "gold2", "hotpink2"))
