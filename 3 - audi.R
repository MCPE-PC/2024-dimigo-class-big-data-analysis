# 필요한 경우 패키지 설치
install.packages("dplyr")

library(ggplot2)
library(dplyr)

audi <- read.csv("audi.csv")

str(audi)
ggplot() # 배경그리기
ggplot(audi, aes(x = year)) # 축그리기

ggplot(audi, aes(x = year)) +
 geom_bar() # 그래프 그리기기

ggplot(audi, aes(x = year)) +
 geom_bar() +
 theme_classic() # 그래프 배경 수정

ggplot(audi, aes(x = year)) +
 geom_bar() +
 theme_classic() +
 theme(
  axis.text.x = element_text(size = 7, face = "bold"),
  axis.text.y = element_text(size = 8, face = "bold"),
  axis.title.x = element_text(size = 8, face = "bold"),
  axis.title.y = element_text(size = 7, face = "bold")
 ) # 그래프 축의 글꼴 수정

ggplot(audi, aes(x = year)) +
 geom_bar() +
 theme_classic() +
 # axis를 설정하지 않고 text 옵션으로 일괄적으로 변경
 theme(text = element_text(size = 7, face = "bold"))

ggplot(audi, aes(x = year)) +
 geom_bar() +
 theme_classic() +
 theme(
  axis.text.x = element_text(size = 7, face = "bold"),
  axis.text.y = element_text(size = 8, face = "bold"),
  axis.title.x = element_text(size = 8, face = "bold"),
  axis.title.y = element_text(size = 7, face = "bold")
 ) +
 scale_x_continuous(
  breaks = seq(1990, 2020, by = 2),
  expand = c(0, 0)
 ) +
 scale_y_continuous(
  breaks = seq(0, 4000, by = 500),
  expand = c(0, 0)
 ) # 그래프 축의 간격 조정

ggplot(audi, aes(x = year, fill = transmission)) +
 geom_bar() +
 theme_classic() +
 theme(
  axis.text.x = element_text(size = 7, face = "bold"),
  axis.text.y = element_text(size = 8, face = "bold"),
  axis.title.x = element_text(size = 8, face = "bold"),
  axis.title.y = element_text(size = 7, face = "bold")
 ) +
 scale_x_continuous(
  breaks = seq(1990, 2020, by = 2),
  expand = c(0, 0)
 ) +
 scale_y_continuous(
  breaks = seq(0, 4000, by = 500),
  expand = c(0, 0)
 ) # 그래프 색 지정

# 그래프 범례 위치 조정
ggplot(audi, aes(x = year, fill = transmission)) +
 geom_bar() +
 theme_classic() +
 theme(
  axis.text.x = element_text(size = 7, face = "bold"),
  axis.text.y = element_text(size = 8, face = "bold"),
  axis.title.x = element_text(size = 8, face = "bold"),
  axis.title.y = element_text(size = 7, face = "bold"),
  legend.text = element_text(size = 8, face = "bold"),
  legend.title = element_text(size = 8, face = "bold"),
  legend.position = "bottom"
 ) +
 scale_x_continuous(
  breaks = seq(1990, 2020, by = 2),
  expand = c(0, 0)
 ) +
 scale_y_continuous(
  breaks = seq(0, 4000, by = 500),
  expand = c(0, 0)
 ) +
 labs(fill = "TRANSMISSION")

# 히스토그램
ggplot(audi, aes(x = price)) +
 geom_histogram() +
 theme_classic()
# 히스토그램 구간 수정
ggplot(audi, aes(x = price)) +
 geom_histogram(bins = 100) +
 theme_classic()

# 히스토그램 색, 축 수정
ggplot(audi, aes(x = price, fill = transmission)) +
 geom_histogram(bins = 100) +
 theme_classic() +
 scale_y_continuous(expand = c(0, 0)) +
 scale_x_continuous(expand = c(0, 0))


# 산점도도
ggplot(audi, aes(x = mpg, y = price)) +
 geom_point() +
 theme_classic()

# 산점도 색 수정
ggplot(audi, aes(x = mpg, y = price, col = fuelType)) +
 geom_point() +
 theme_classic()

# 회귀선
ggplot(audi, aes(x = mpg, y = price)) +
 geom_point() +
 geom_smooth() +
 theme_classic()

# 박스플롯
ggplot(audi, aes(x = fuelType, y = price)) +
 geom_boxplot(outlier.colour = "red") +
 theme_classic()

# 박스플롯 색 지정
ggplot(audi, aes(x = fuelType, y = price, fill = transmission)) +
 geom_boxplot(outlier.colour = "red") +
 theme_classic()


# 선그래프 오류
ggplot(audi, aes(x = year, y = price)) +
 geom_line() +
 geom_point()

audi %>%
 filter(year > 2016) %>%
 select(tax, mpg, engineSize) %>%
 colMeans()

# 선 그래프 작성을 위한 데이터 집계
year_df <- audi %>%
 group_by(year) %>%
 summarise(Price = mean(price))
year_df

# 선 그래프 기본
ggplot(year_df, aes(x = year, y = Price)) +
 geom_line() +
 geom_point() +
 theme_bw()

# 선그래프 색 수정
year_df2 <- audi %>%
 group_by(year, fuelType) %>%
 summarise(Price = mean(price))
year_df2

ggplot(year_df2, aes(x = year, y = Price, col = fuelType)) +
 geom_line() +
 geom_point() +
 theme_bw()
