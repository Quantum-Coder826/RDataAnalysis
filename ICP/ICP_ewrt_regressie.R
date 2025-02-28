library(tidyverse)

raw_data_ICP <- read.csv("data_ICP_klas_A_24-02-2025.csv", na.strings = "!!!!!!!")

data_ICP <- list(ijklijn = raw_data_ICP[1:6, ],
                 samples = raw_data_ICP[6:13, ])

ppm <- c(0, 20, 40, 60 ,80, 100)

# Get all cols that are relevent 
reg_data = data_ICP$ijklijn %>%
  select(-c(SampleNo, SampleClassif, SampleName, G., Date.TimeOfAnalysis))
