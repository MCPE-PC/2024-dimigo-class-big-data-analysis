data <- read.csv("baseball.csv", header = TRUE, fileEncoding = "euc-kr")
data
data$H
head(data, 10)
class(data)

bp <- barplot(
 data$H,
 main = paste("2023 KBO"),
 col = rainbow(12),
 cex.names = 1.3,
 las = 3,
 names.arg = data$name,
 ylim = c(0, 200)
)

x <- mean(data$H)
x
abline(h = x, lty = 1, col = "red")
