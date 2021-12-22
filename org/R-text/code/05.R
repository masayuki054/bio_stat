##
## 標本不偏分散の標本分布
##

samples.no <- 10000   # いくつ標本を用いるか
sample.size <- 10     # ひとつの標本の中のデータの個数

this.mean <- 50       # 分布の平均
this.sd <- 10         # 分布の標準偏差

不偏分散s <- numeric(samples.no) # 各々の標本の不偏分散値の保存場所

for (i in 1:samples.no) {
  標本 <- rnorm(n=sample.size, mean=this.mean, sd=this.sd) # ひとつの標本の生成
  不偏分散s[i] <- var(標本)
}

c(mean(不偏分散s),sd(不偏分散s))  # 標本不偏分散達の平均と分散

##
## 標本不偏分散の頻度表
##
hist(不偏分散s, breaks=seq(0,500,10), main="不偏分散の分布")

##
## 標本不偏分散の頻度表
##
hist((不偏分散s/100)*9, freq=FALSE, breaks=seq(0,50,1), main="不偏分散/母分散の分布と自由度9のカイ二乗分布")
curve(dchisq(x,9), add=TRUE, col="red")
