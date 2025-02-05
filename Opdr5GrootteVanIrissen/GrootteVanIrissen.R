library(tidyverse)

data("iris")

means_iris <- iris %>%
  summarise(mean_sepal_length = mean(Sepal.Length),
            mean_sepal_width = mean(Sepal.Width))

# Set if statements to `TRUE` to use the plot
if (FALSE) { # vraag C
  ggplot(iris, aes(x = Sepal.Width, y = Sepal.Length, colour = Species)) +
    geom_point()
}

if (FALSE) { # vraag D
  ggplot(iris, aes(x = Species, y = Sepal.Width, color = Species)) +
    geom_boxplot()
}

# vraag E
iris %>%
  group_by(Species) %>%
  summarise(median_petal_length = median(Petal.Length),
            median_petal_width = median(Petal.Width)) %>%
  arrange(desc(median_petal_length))

# vraag F
iris_setosa_virginica <- iris %>%
  filter(Species != "versicolor")

if (TRUE) {
  ggplot(iris_setosa_virginica, aes(x = Petal.Length, fill = Species)) + # use `fill` to set colors of boxes
    geom_histogram(binwidth = 0.5)
}