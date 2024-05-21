knitr::opts_chunk$set(echo = TRUE)

library(corrplot)

stores <- read.csv("Stores.csv", header = TRUE)

summary(stores)

stores <- stores[order(stores$Store_Area),]

write.csv(stores, "preprocessed.csv")

corrplot(cor(stores))

plot(stores$Store_Area, stores$Items_Available, type="h")

plot(stores$Store_Area, stores$Daily_Customer_Count, type="h")

plot(stores$Store_Area, stores$Store_Sales, type="h")