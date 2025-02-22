# 構建 TSLM 模型
library(lubridate)
# df$ds是日期，df$y是要分析的值
df$ds <- as.Date(df$ds)
# 創建一個完整的日期序列從數據集中的最早日期到最晚日期
full_dates <- seq(from = min(df$ds), to = as.Date("2023-12-19"), by = "day")
# 使用zoo合併原始數據和完整日期序列
# 缺失的日期將有NA值
tslm_data_full <- merge(zoo(df$y, df$ds), zoo(order.by = full_dates), all = TRUE)
# 處理NA值，使用na.approx進行插值：
tslm_data_full <- na.approx(tslm_data_full)
# 將zoo對象轉換為ts對象，這裡我們使用了"天"來創建ts對象
tslm_data_ts <- ts(tslm_data_full, start = c(year(min(df$ds)), month(min(df$ds))), frequency =12 )
# 構建TSLM模型
tslm_model <- tslm(tslm_data_ts ~ trend + season)

# 查看模型摘要
summary(tslm_model)
# 模型診斷
graphics.off() # 關閉所有的圖形裝置
dev.off() # 再次確保所有圖形裝置被關閉
checkresiduals(tslm_model) # 現在嘗試執行模型診斷

# 進行預測
tslm_forecast <- forecast(tslm_model, h = 365)
tslm_forecast
print(tslm_forecast$mean[365])
print(tslm_forecast$upper[365])
print(tslm_forecast$lower[365])

# 繪製預測圖
autoplot(tslm_forecast) +
  ggtitle("TSLM Forecast and Model")

# 如果您想添加模型線，可以使用下面的程式碼
# 繪製預測圖
plot(tslm_forecast)
# 從模型中提取擬合值
fitted_values <- fitted(tslm_model)
# 將擬合值添加到圖形上
lines(fitted_values, col = "red")
