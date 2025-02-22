#資料整理
library(forecast)
library(tseries)
library(xts)
library(zoo)
library(fBasics)
library(rugarch)
library(ggplot2)

setwd("your_path")
data=read.csv('2330.TW (2).csv')
data=data[-c(2308,4060,4140,4209,4315,4384),]
data$Date <- as.Date(data$Date)
data$Close <- as.numeric(data$Close)
df <- data.frame(ds = data$Date,y = data$Close)
ts_data <- xts(df$y, order.by = as.Date(df$ds))
plot(df, type = 'l',main = "台積電2001年初至2023年底股票價格", ylab = 'price', xlab= "year",xaxt="n")
axis.Date(1, at = seq(from = start(ts_data), to = end(ts_data), by = "1 year"),
          format = "%Y", las = 1)

adf.test(ts_data) #p-value=0.794


#差分
ndiffs(ts_data)
diff_data <- diff(ts_data)
plot(diff_data,
     xlab = 'year',
     ylab = 'diff',
     main = 'diff data')
diff_data <- na.approx(diff_data) #線性插補遺失值
par(mfrow=c(1,2))
acf(ts_data) 
acf(diff_data)
par(mfrow=c(1,2))
pacf(ts_data);pacf(diff_data)

# 執行Ljung-Box檢驗
Box.test(ts_data, lag=log(length(ts_data)))
