# 필요한 경우 패키지 설치
install.packages("mlbench")

# 데이터 불러오기
library(mlbench)
data(Ozone)

# 우채민
opar <- par(mfrow = c(1, 3))
for (i in list(
  list("우", "#FF0000", "b"),
  list("채", "#00FF00", "p"),
  list("민", "#0000FF", "o")
)) {
  plot(
    Ozone$V8,
    Ozone$V9,
    main = i[[1]],
    xlab = i[[1]],
    ylab = i[[1]],
    pch = "짜",
    xlim = c(50, 80),
    ylim = c(50, 70),
    cex.main = 5,
    cex.lab = 1.5,
    col = i[[2]],
    type = i[[3]],
  )
}

par(opar)
