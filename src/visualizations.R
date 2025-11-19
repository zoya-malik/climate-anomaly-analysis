# src/visualizations.R
# All visualizations for monthly and seasonal anomalies

library(ggplot2)
library(tidyr)
library(dplyr)

DATA_PATH <- "data/raw/Global_Temperature_Anomalies.csv"
data <- read.csv(DATA_PATH)


# Figure 1 – Monthly Anomalies

data_long <- data %>%
  pivot_longer(cols = Jan:Dec, names_to = "Month", values_to = "Anomaly")

p1 <- ggplot(data_long, aes(x = Year, y = Anomaly, color = Hemisphere)) +
  geom_line() +
  facet_wrap(~ Month, scales = "free_y") +
  labs(
    title = "Monthly Temperature Anomalies Over Years",
    x = "Year",
    y = "Temperature Anomaly (°C)"
  ) +
  theme_minimal() +
  theme(legend.position = "bottom")

print(p1)


# Figure 2 – Seasonal Anomalies


data_seasonal <- data %>%
  select(Hemisphere, Year, DJF, MAM, JJA, SON) %>%
  pivot_longer(cols = DJF:SON, names_to = "Season", values_to = "Anomaly")

p2 <- ggplot(data_seasonal, aes(x = Year, y = Anomaly, color = Season)) +
  geom_line() +
  facet_wrap(~ Hemisphere) +
  labs(
    title = "Seasonal Temperature Anomalies",
    x = "Year",
    y = "Anomaly (°C)"
  ) +
  theme_minimal() +
  scale_color_brewer(palette = "Set3")

print(p2)



# Figure 3 – Seasonal Boxplot


p3 <- ggplot(data_seasonal, aes(x = Season, y = Anomaly, fill = Hemisphere)) +
  geom_boxplot() +
  labs(
    title = "Box Plot of Seasonal Temperature Anomalies",
    x = "Season",
    y = "Anomaly (°C)"
  ) +
  theme_minimal() +
  scale_fill_brewer(palette = "Set1")

print(p3)



# Boxplot Calculations


calculate_statistics <- function(column_name, data) {
  data %>%
    summarise(
      Median        = median(.data[[column_name]], na.rm = TRUE),
      IQR           = IQR(.data[[column_name]], na.rm = TRUE),
      Lower_Whisker = boxplot.stats(.data[[column_name]])$stats[1],
      Upper_Whisker = boxplot.stats(.data[[column_name]])$stats[5],
      Outliers      = list(boxplot.stats(.data[[column_name]])$out)
    )
}

stats_JD  <- calculate_statistics("J.D", data)
stats_DN  <- calculate_statistics("D.N", data)
stats_DJF <- calculate_statistics("DJF", data)
stats_MAM <- calculate_statistics("MAM", data)
stats_JJA <- calculate_statistics("JJA", data)
stats_SON <- calculate_statistics("SON", data)

all_stats <- dplyr::bind_rows(
  JD  = stats_JD,
  DN  = stats_DN,
  DJF = stats_DJF,
  MAM = stats_MAM,
  JJA = stats_JJA,
  SON = stats_SON,
  .id = "Season"
)

cat("\nBoxplot Statistics:\n")
print(all_stats)
