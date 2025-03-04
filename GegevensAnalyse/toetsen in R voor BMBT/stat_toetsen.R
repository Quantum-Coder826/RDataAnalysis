library(readxl)

oldw <- getOption("warn")
options(warn = -1)

data <- read_excel("oefendata BM BT.xlsx", sheet = "data", range = "A1:H17")

## 2.1 Meervoudige regressie-analyse (MRA)
model_levend <- lm(cellijn ~ levend1 + levend2, data = data)
summary(model_levend)

#De standaardfout is 1.135

## 2.2 t-toets tegen een gegeven waarde
t.test(x = data$levend1, mu = 60) # mu is al in %

## 2.3 t-toets - twee onafhankelijke steekproeven
t.test(data$levend2 ~ data$CYP2D6)

## 2.4 Gepaarde t-toets
t.test(data$levend1, data$levend2, paired = TRUE)

## 2.5 ANOVA (variantie-analyse)
hist(data$productie)
data$cellijn <- as.factor(data$cellijn)
summary(lm(productie~ cellijn, data = data))

## 2.6 Twee-weg ANOVA
summary(lm(productie~ cellijn + as.factor(CYP2D6), data = data))

## 2.6 Twee-weg ANOVA
wilcox.test(data$vitaal2, data$CYP2D6, paired = FALSE)

## 2.8 Wilcoxon
wilcox.test(data$vitaal1, data$vitaal2, paired = TRUE)

## 2.9 Kruskal-Wallis
kruskal.test(data$vitaal2, data$cellijn)

## 2.10 Pearson
cor.test(data$levend1, data$levend2)

## 2.11 Spearman
cor.test(data$levend1, data$levend2, method = "spearman")

## 2.12 Chi-kwadraat (één variabele)
chisq.test(table(data$cellijn))

## 2.13 Chi-kwadraat (twee variabelen)
chi_test <- chisq.test(table(data$cellijn, data$CYP2D6))
chi_test
chi_test$expected

## 3.? Zelf kiezen
# Vraag 1
cor.test(data$levend2, data$vitaal2)

# Vraag 2
summary(lm(levend1 ~ levend2, data = data))
# De standaartfout is 1.145 

# Vraag 3
t.test(x = data$productie, mu = 180)

options(warn = oldw)