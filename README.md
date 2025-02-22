# TSMC Stock Price Prediction (Time-Series Linear Model)

## Project Overview
This project aims to analyze and predict TSMC (Taiwan Semiconductor Manufacturing Company, 2330.TW) stock prices using various statistical and machine learning models. The methods used in this study include:
- **Time-Series Linear Model (TSLM)**
- **Autoregressive Integrated Moving Average (ARIMA)**
- **Least Absolute Shrinkage and Selection Operator (LASSO)**
- **Long Short-Term Memory (LSTM)**

## My Contributions
This project was a collaborative effort, and I was primarily responsible for the **Time-Series Linear Model (TSLM) implementation**, which includes:

### Data Preprocessing
- Processed and structured stock price data (TSMC Stock Prices from Early 2001 to the End of 2023) using R
- Conducted **Augmented Dickey-Fuller (ADF) test** to check for stationarity
- Handled missing values and outliers in the dataset

### TSLM Model Training
- Built a **Time-Series Linear Model** (`tslm()`) incorporating trend and seasonality components
- Examined **Lag plots** to determine linear relationships in the dataset
- Conducted **residual diagnostics** to evaluate model performance

### Results Analysis and Visualization
- Forecasted stock prices for the next 365 days
- Computed **Root Mean Square Error (RMSE)** for model evaluation
- Visualized results using `ggplot2` to compare actual vs. predicted prices

## Project Structure
```
tsml-stock-prediction/
├── 📄ts_data_preprocessing.R
├── 📄tslm_model_training.R
├── 📄2330.TW.csv     #TSMC Stock Prices from Early 2001 to the End of 2023
│── 📂images/              # Stores visualization outputs
│── README.md            # This documentation
```

## Key Findings
- The TSLM model demonstrated a strong **linear trend** but struggled with capturing rapid stock price fluctuations.
- Model evaluation showed an RMSE of approximately **170.02**, indicating a moderate fit.
- The impact of seasonality was found to be statistically insignificant in most cases.

## Disclaimer
This GitHub repository contains **only my contributions to the team project** (TSLM modeling). The complete project, including contributions from other team members, is not provided here to respect collaboration ethics.

