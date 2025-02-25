library(tidyverse)
library(readxl)
library(effects)

nana <- read_excel("POV002 Nana.xlsx", sheet = "simulatie", range = "A3:F19")

rownames(nana) <- nana$`Experiment #`
nana <- subset(nana, select = -c(`Experiment #`))

regression <- lm(Resultaat ~ Munt + Thee + Zoetmiddel + Munthoeveelheid, data = nana)
summary(regression)

plot(allEffects(regression))

# Vraag E
# Het ideale Nana recept is:
# - Gunpowder groene thee, heel veel mentha spicata nana munt met suiker

# Vraag F
# De nana met Puerh thee gaat -1.2 plus/min 1.3 slechter dan de Gunpowder thee.