# Vraag A: De Full factorial opzet is geschikt omdat we juist geintereseert zijn 
# in intereacties

library(effects)
library(readxl)

chemicals <- read_excel("POV004 XXX Chemicals.xlsx", 
                        sheet = "simulatie", range = "A3:F51")

# We analyseren hoofteffecten altijd gezamelijk met intereacties
# `+` denoteerd hoofdeffecten
# `:`  denoteerd intereacties
# Alle combinaties meneemen van Fullfactorial
reg <- lm(Resultaten ~ C1 + C2 + C3 + C4 +
            C1:C2 + C1:C3 + C1:C4 + C2:C3 + C2:C4 + C3:C4, data = chemicals) 
anova(reg)

plot(allEffects(reg), lines = list( multiline = TRUE), confint = list(style = "auto"),
     ylim = c(0, 3.5))

# Vraag E
reg.hoofdeffecten <- lm(Resultaten ~ C1 + C2 + C3 + C4, data = chemicals)
plot(allEffects(reg.hoofdeffecten), lines = list( multiline = TRUE),
     confint = list(style = "auto"), ylim = c(0, 3))

# Vraag H
# Middelen C2 en C3 zijn het beste en interacteren positief