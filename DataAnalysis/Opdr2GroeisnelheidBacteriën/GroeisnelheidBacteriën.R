library(readr)
bacteria <- read_delim("bacteria.csv", delim = "@", 
                       escape_double = FALSE, trim_ws = TRUE)

Rownames <- bacteria$ExperimentID

# Remove first colum by selecting cols 2 to the end
bacteria <- subset(bacteria, select = 2:7)
rownames(bacteria) <- Rownames

sum(bacteria$Bacteria == "Lactobacillus casei")

sort(factor(bacteria$Temperature))

resistent <- bacteria[,order()]
