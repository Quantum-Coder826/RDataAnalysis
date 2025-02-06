library(tidyverse)

studenten_sport <- read.csv("studenten_sport.csv", sep = "&", dec = ",")
studenten_sport$Studiejaar <- factor(studenten_sport$Studiejaar, 
                                     levels = c("Eerstejaar", "Tweedejaar"), ordered = TRUE)