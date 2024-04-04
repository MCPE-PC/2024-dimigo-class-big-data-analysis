# 필요한 경우 JDK 설치
install.packages("multilinguer")
library(multilinguer)
install_jdk()

# 필요한 경우 패키지 설치
install.packages(c(
  "hash", "tau", "Sejong", "RSQLite", "devtools", "bit", "rex", "lazyeval",
  "htmlwidgets", "crosstalk", "promises", "later", "sessioninfo",
  "xopen", "bit64", "blob", "DBI", "memoise", "plogr", "covr",
  "DT", "rcmdcheck", "rversions", "wordcloud", "stringr"
))
devtools::install_github("haven-jeon/KoNLP")
# 설치 후 R 재시작

library("KoNLP")
library("wordcloud")
library("stringr")

useSejongDic()
extractNoun("아버지가 방에 들어가신다")

txt <- readLines("jeju.txt", encoding = "UTF-8")
txt
place <- sapply(txt, extractNoun, USE.NAMES = FALSE)

class(place)
head(place, 2)
c <- unlist(place)
c
place <- Filter(function(x) {
  nchar(x) >= 2
}, c)
place
res <- str_replace_all(place, "[^[:alpha:]]", "")
res <- res[res != ""]

res <- gsub("제주", "", res)
res <- gsub("제주", "", res)


write(res, "jeju2.txt")
res2 <- read.table("jeju2.txt")
class(res2)
head(res2)
wordcount <- table(res2)
head(sort(wordcount, decreasing = TRUE), 30)

library(RColorBrewer)
palete <- brewer.pal(9, "Set1")

wordcloud(
  names(wordcount),
  freq = wordcount,
  scale = c(5, 1),
  rot.per = 0.25,
  min.freq = 2,
  random.order = FALSE,
  random.color = TRUE,
  colors = palete
)
