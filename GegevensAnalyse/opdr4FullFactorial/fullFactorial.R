# Vraag A: De Full factorial opzet is geschikt omdat we juist geintereseert zijn in intereacties

library(effects)
library(tidyverse)
library(readxl)

chemicals <- read_excel("POV004 XXX Chemicals.xlsx", 
                        sheet = "simulatie", range = "A3:F51")

reg <- lm(Resultaten ~ C1 * C2 * C3 * C4, data = chemicals)
summary(reg)

plot(allEffects(reg))