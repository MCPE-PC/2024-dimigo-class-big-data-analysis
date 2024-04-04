# 필요한 경우 패키지 설치
install.packages(c("OpenStreetMap", "ggplot2", "sf"))

library(ggplot2)
library(OpenStreetMap)
library(sf)

data <- read.csv(
 "ansan.csv",
 header = TRUE, fileEncoding = "cp949", encoding = "utf-8"
)
data
summary(data)
head(data)
class(data)

data_city <- data

df <- data.frame(
 name = data_city$store,
 lon = data_city$Longitude,
 lat = data_city$Latitude
)
df
cen <- c(mean(df$lon), mean(df$lat))
cenLon <- mean(df$lon)
cenLat <- mean(df$lat)

kd <- openproj(
 openmap(c(cenLat - 0.05, cenLon - 0.05), c(cenLat + 0.05, cenLon + 0.05)),
 projection = "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs"
)
kor.map <- autoplot(map.latlon) + geom_point(data = df, aes(x = lon, y = lat), size = 3, alpha = 0.7, color = "red")
kor.map + geom_text(data = df, aes(x = lon, y = lat + 0.001, label = name), size = 3)
