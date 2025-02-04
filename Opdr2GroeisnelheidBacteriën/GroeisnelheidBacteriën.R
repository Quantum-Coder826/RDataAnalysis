library(readr)
bacteria <- read_delim("bacteria.csv", delim = "@", 
                       escape_double = FALSE, trim_ws = TRUE)

# Remove first colum by selecting cols 2 to the end
bacteria <- subset(bacteria, select = 2:7)

sum(bacteria$Bacteria == "Lactobacillus casei")

sort(factor(bacteria$Temperature))

resistent <- subset(bacteria, Antibiotic == TRUE)[,1:5]
resistent

# Vraag G
Bacteria <- c("Bacillus subtilis", "Staphylococcus aureus", "Bacillus subtilis",
              "Escherichia coli")
GrowthRate <- c("0.2", "0.1", "0.3", "0.2")
Temperature <- c("39", "35", "35", "38")
Medium <- c("Agar", "Agar", "Broth", "Agar")
pH <- c("3.3", "3.3", "3.3", "3.3")

bacteria_zuur <- data.frame(Bacteria, GrowthRate, Temperature, Medium, pH) 

bioreactor_data_list <- list(neutraal = bacteria, zuur = bacteria_zuur)
bioreactor_data_list