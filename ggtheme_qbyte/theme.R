library(tidyverse)
library(ggthemes)

data("mtcars")

gruvbox_colors <- list(
  fg = "#3c3836",
  gray = "#7c6f64",
  gray_245 = "#928374",
  gray_244 = "#928374",
  bg0_h = "#f9f5d7",
  bg = "#fbf1c7",
  bg0_s = "#f2e5bc",
  bg1 = "#ebdbb2",
  bg2 = "#d5c4a1",
  gb3 = "#bdae93",
  bg4 = "#a89984",
  
  bright_red = "#fb4934",
  bright_green = "#b8bb26",
  bright_yellow = "#fabd2f",
  bright_blue = "#83a598",
  bright_purple = "#d3869b",
  bright_aqua = "#8ec07c",
  bright_orange = "#fe8019",
  
  neutral_red = "#cc241d",
  neutral_green = "#98971a",
  neutral_yellow = "#d79921",
  neutral_blue = "#458588",
  neutral_purple = "#b16286",
  neutral_aqua = "#689d6a",
  neutral_orange = "#d65d0e",
  
  faded_red = "#9d0006",
  faded_green = "#79740e",
  faded_yellow = "#b57614",
  faded_blue = "#076678",
  faded_purple = "#8f3f71",
  faded_aqua = "#427b58",
  faded_orange = "#af3a03"
)

theme_gruvbox <- function() {
  theme_foundation() + 
    theme(text = element_text(color = gruvbox_colors$fg), rect = element_rect(fill = gruvbox_colors$bg),
          line = element_line(color = gruvbox_colors$fg)) +
    
    theme(panel.grid.minor = element_blank(), panel.grid.major.y = element_blank(),
          panel.grid.major.x = element_line(color = gruvbox_colors$bg2)) +
    
    theme(legend.key = element_blank()) +
    theme(plot.tag = element_text(color = gruvbox_colors$gray),
          plot.caption = element_text(color = gruvbox_colors$gray),
          plot.subtitle = element_text(colour = gruvbox_colors$gray))
}

ggplot(mtcars, aes(mpg, hp, shape = factor(vs))) +
  geom_point() +
  labs(title = "title", subtitle = "sub", caption = "cap", tag = "tag") +
  theme_gruvbox()