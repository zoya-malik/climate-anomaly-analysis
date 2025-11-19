# src/eda.R
# Exploratory Data Analysis for Global Temperature Anomalies

library(dplyr)

DATA_PATH <- "data/raw/Global_Temperature_Anomalies.csv"

data <- read.csv(DATA_PATH)


# Frequency Table

cat("Frequency table for Hemisphere:\n")
print(table(data$Hemisphere))
cat("\n")


# Descriptive Statistics (J.D)

cat("Descriptive Statistics for J.D (Annual Temperature Anomaly):\n\n")

cat("Mean:\n")
print(mean(data$J.D, na.rm = TRUE))

cat("\nMedian:\n")
print(median(data$J.D, na.rm = TRUE))

cat("\nVariance:\n")
print(var(data$J.D, na.rm = TRUE))

cat("\nStandard Deviation:\n")
print(sd(data$J.D, na.rm = TRUE))

cat("\nSummary:\n")
print(summary(data$J.D))
cat("\n")
