# src/regression_analysis.R
# Regression analysis for predicting future anomalies

DATA_PATH <- "data/raw/Global_Temperature_Anomalies.csv"
data <- read.csv(DATA_PATH)


# Linear Regression


model <- lm(J.D ~ Year, data = data)

cat("Regression Summary (J.D ~ Year):\n")
print(summary(model))
cat("\n")


# Prediction for future years

future_years <- data.frame(Year = seq(2021, 2030, 1))
predictions <- predict(model, newdata = future_years)

results <- data.frame(
  Year = future_years$Year,
  Predicted_Anomaly = predictions
)

cat("Predictions for 2021–2030:\n")
print(results)
