

# Climate Anomaly Analysis: Hemispheric Trends & Statistical Modeling

### STAT 327 — Statistics for the Physical and Environmental Sciences  
**Authors:** Hala Abdelbaki, Zoya Malik  
**University of Calgary — April 2024**


## Project Overview

This project investigates global temperature anomalies from 1880–2020, with a focus on analyzing long-term climate trends, comparing the Northern and Southern Hemispheres, and producing future anomaly predictions.

Using NASA’s publicly available climate dataset, the study applies:

- Exploratory Data Analysis (EDA)  
- Time-series visualization  
- Linear regression forecasting  
- Shapiro–Wilk normality testing  
- Mann–Whitney U hypothesis testing  

All analyses were performed in R using tidyverse and ggplot2.

This repository includes the project report, supporting R scripts, figures, and data-processing workflow.


## Dataset Description

Source: NASA Goddard Institute for Space Studies  
Original Host: data.world (via Bloomberg’s *“What’s Really Warming the World?”*)

Dataset includes:

- Hemisphere (Northern, Southern, Global)  
- Year (1880–present)  
- Monthly temperature anomalies (Jan–Dec)  
- Annual anomalies (J-D, D-N)  
- Seasonal anomalies (DJF, MAM, JJA, SON)

Temperature anomalies represent deviations from a long-term global mean.

## Methods & Statistical Procedures

### 1. Exploratory Data Analysis (EDA)
Performed using:

- Frequency tables  
- Summary statistics (mean, median, variance, SD)  
- Boxplot-based spread metrics (IQR, whiskers, outliers)  
- Data formatting and cleaning decisions

Tools: `dplyr`, `summary()`, `boxplot.stats()`


### 2. Visualization
Generated using ggplot2:

- Monthly anomaly line charts (faceted by month)  
- Seasonal anomaly trends (faceted by hemisphere)  
- Seasonal boxplots comparing distribution patterns  

Tools: `ggplot2`, `tidyr::pivot_longer()`


### 3. Research Question 1 — Predicting Future Anomalies

Regression model:

lm(J.D ~ Year)

- Regression was highly significant (p < 2e-16)  
- Predictions made for 2021–2030  
- Output represents projected deviations from baseline temperature

Tools: `lm()`, `predict()`


### 4. Research Question 2 — Hemispheric Comparison

Normality testing using Shapiro–Wilk:

- Both hemispheres’ anomaly distributions were non-normal 
- Therefore, a non-parametric Mann–Whitney U test was used

Result:
p = 0.6387
→ No statistically significant difference found between Northern and Southern Hemisphere anomalies.



## Key Findings

- No significant hemispheric difference in anomaly distributions  
- Strong positive trend in global temperature anomalies from 1880–2020  
- Forecasts show continued warming into the next decade  
- Seasonal anomaly trends mirror annual findings  
- Historical spikes align with known climate irregularities (e.g., WWII-era warming)



## How to Run the Project in R

### Install required packages:

```r
install.packages(c("ggplot2", "dplyr", "tidyr"))
Run all analysis scripts:
```


source("src/eda.R")
source("src/visualizations.R")
source("src/regression_analysis.R")
source("src/mann_whitney_test.R")


The complete written report is located in:
docs/STAT 327 Final Project.pdf

It includes detailed methodology, figures, statistical outputs, and citations.

References
NASA GISS Surface Temperature Analysis

Bloomberg: What’s Really Warming the World?

R Documentation (ggplot2, dplyr, stats)

STAT 327 Course Materials



