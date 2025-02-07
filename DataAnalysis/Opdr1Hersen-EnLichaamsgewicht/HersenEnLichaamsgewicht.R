animal_weight <- read.csv("./animal_weight.csv")

animal_names <- c("Mountain beaver", "Cow", "Grey wolf", "Goat", "Guinea pig",
                  "Dipliodocus", "Asian elephant", "Donkey", "Horse", "Potar monkey",
                  "Cat", "Giraffe", "Gorilla", "Human", "African elephant",
                  "Triceratops", "Rhesus monkey", "Kangaroo", "Golden hamster", "Mouse",
                  "Rabbit", "Sheep", "Jaguar", "Chimpanzee", "Rat", "Brachiosaurus",
                  "Mole", "Pig")

rownames(animal_weight) <- animal_names

mean(animal_weight$body)

light_animals <- subset(animal_weight, body <= 1)

# Calculate brain to body ratio in gram per kg lichaamsgewicht, sla op in colom `brain_body`
light_animals$brain_body <- light_animals$brain / light_animals$body

# Order light_animals by decresing brain body ratio using order
# The `order` function returns the sorted indecies as a vec
light_animals <- light_animals[order(light_animals$brain_body, decreasing = TRUE),]

# Print the first index
head(light_animals, 1)
