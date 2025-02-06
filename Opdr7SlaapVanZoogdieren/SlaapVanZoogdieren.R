library(tidyverse)
data("msleep")
str(msleep)

sleep_total_rem <- ggplot(msleep, aes(sleep_total, sleep_rem))

# Vraag B
sleep_total_rem + geom_smooth() + labs(title = "Vraag B")

# Vraag C
sleep_total_rem + geom_smooth(color = "darkolivegreen3")

# Vraag D
ggplot(msleep, aes(vore, sleep_total)) +
  geom_jitter(width = 0.1, height = 0.1) +
  labs(title = "Vraag D")

# Vraag E
ggplot(msleep, aes(vore, sleep_total, size = bodywt / brainwt)) +
  geom_jitter(width = 0.2, height = 0.2, alpha = 0.4) +
  labs(title = "Vraag E", y = "total amount of sleep in hours")