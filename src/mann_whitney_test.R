# src/mann_whitney_test.R
# Shapiro-Wilk normality tests and Mann-Whitney U test

library(dplyr)

DATA_PATH <- "data/raw/Global_Temperature_Anomalies.csv"
data <- read.csv(DATA_PATH)


# Split by hemisphere


northern <- data %>% filter(Hemisphere == "Northern")
southern <- data %>% filter(Hemisphere == "Southern")


# Shapiro-Wilk Tests


cat("Shapiro-Wilk Normality Test (Northern J.D):\n")
print(shapiro.test(northern$J.D))
cat("\n")

cat("Shapiro-Wilk Normality Test (Southern J.D):\n")
print(shapiro.test(southern$J.D))
cat("\n")


# Mann-Whitney U Test

cat("Mann-Whitney U Test (Northern vs Southern J.D):\n")
mw <- wilcox.test(northern$J.D, southern$J.D, alternative = "two.sided")
print(mw)
