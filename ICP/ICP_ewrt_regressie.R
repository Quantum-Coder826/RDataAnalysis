library(tidyverse)
library(magrittr)

raw_data_ICP <- read.csv("data_ICP_klas_A_24-02-2025.csv", na.strings = "!!!!!!!")

data_ICP <- list()

# Prepere regression data
data_ICP$ijklijn <- raw_data_ICP %>%
  filter(grepl("ijklijn", SampleName)) %>%
  set_rownames(.$SampleName) %>%
  select(-c(SampleNo, SampleClassif, SampleName, G., Date.TimeOfAnalysis))

data_ICP$ijklijn$ppm <- c(0, 20, 40, 60 ,80, 100)

# Preform regression on all cols
data_ICP$regressie <- sapply(colnames(data_ICP$ijklijn), function(x) {
  lm(get(x) ~ ppm, data = data_ICP$ijklijn)
})

# Prepare sample data
data_ICP$samples_emmision <- raw_data_ICP %>%
  filter(!grepl("ijklijn", SampleName)) %>%
  set_rownames(.$SampleName) %>%
  select(-c(SampleNo, SampleClassif, SampleName, G., Date.TimeOfAnalysis))

data_ICP$samples_ppm <- data.frame(matrix(nrow = nrow(data_ICP$samples_emmision),
                                          ncol = ncol(data_ICP$samples_emmision)),
                                   row.names = rownames(data_ICP$samples_emmision))
colnames(data_ICP$samples_ppm) <- colnames(data_ICP$samples_emmision)

for (col in colnames(data_ICP$samples_emmision)) {
    model <- summary(data_ICP$regressie[[col]])
  for(row in 1:nrow(data_ICP$samples_emmision)) {
    predicted.ppm <- coef(model)[1] + data_ICP$samples_emmision[[col]][row] * coef(model)[2]
    data_ICP$samples_ppm[[col]][row] <- predicted.ppm
  }
}