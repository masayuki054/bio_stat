

##
## 入門統計学1章 表1.2.csv
##
(表1.2 <- read.csv("R-text/data/01-02.csv"))
class(表1.2)

##
## 
v <- append(表1.2$栽培法A,表1.2$栽培法B)
summary(v)
table(cut(v, breaks=seq(1700,3800 ,300)))
