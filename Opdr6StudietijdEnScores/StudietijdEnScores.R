library(tidyverse)

student_performance <- read.csv("./student_performance.csv", header = TRUE)

# Vraag B
student_performance %>%
  group_by(major) %>%
  summarise(avg_score = mean(total_score),
            min_score = min(total_score),
            total_score = max(total_score))

# Vraag C
student_performance %>%
  group_by(year, gender) %>%
  summarise(avg_hours_studied = mean(hours_studied))

# Vraag D
student_performance_test_scores <- student_performance %>%
  group_by(year) %>%
  summarise(avg_test_score = mean(test_score))

ggplot(student_performance_test_scores, aes(x = year, y = avg_test_score)) +
  geom_line() +
  expand_limits(y=c(0,100)) +
  labs(title = "Vraag D")
  
# Vraag E holy sleek batman
student_performance %>%
  group_by(major) %>%
  summarise(avg_hours = mean(hours_studied)) %>%
  
  ggplot(aes(x = major, y = avg_hours)) +
    geom_col() +
    labs(title = "Vraag E")