##
## 正規分布のグラフを描く
##

curve(dnorm(x), from=-4, to=4, main="図4.4-5 正規分布 N(0, 1), N(0,2), N(1,1)")        # 標準正規分布のグラフ， -4 から +4 の範囲
curve(dnorm(x,sd=2), add=TRUE)        # 平均0， 偏差2 の正規分布，上描き 
curve(dnorm(x,mean=1,sd=1), add=TRUE) # 平均1， 偏差1 の正規分布，上描き

##
## 平均50、標準偏差10の正規母集団からn＝5の標本を無作為抽出する
##

rnorm(n=5, mean=50, sd=10)       # 標本の抽出
hist(rnorm(n=5, mean=50, sd=10), main="図4.7 N(50, 10)からの n=5 の標本の頻度表") # 頻度表の描画

##
## 平均50、標準偏差10の正規母集団からn＝1000の標本を無作為抽出する

hist(rnorm(n=1000, mean=50, sd=10), main="図4.8 N(50, 10)からの n=1000 の標本の頻度表")

##
## 標本サイズ10の標本による，母平均の推定

標本 <- rnorm(n=10, mean=50, sd=10)
mean(標本)

##
## 母平均の推定
### 母集団 N(50, 10^2) から
### 標本サイズ 10の標本の標本平均
### 10000個の標本平均の頻度表を描く
this.mean <- 50
this.sd <- 10
this.counts <- 10000

for (this.sample_size in c(10,20,40,80,160)) {
  標本平均 <- numeric(length=this.counts) 
      
  for(i in 1:this.counts) {
1
    標本 <- rnorm(n=this.sample_size, mean=this.mean, sd=this.sd)
    標本平均[i] <- mean(標本)
  }
  cat("sample_size=", this.sample_size,
      "mean=", mean(標本平均),
      "var=", var(標本平均),
      "\n")
}

hist(標本平均,main="図4.12 標本抽出10,000回のときの標本平均の分布")

## 母平均 (50)からのズレが5以内か否かで振り分ける

誤差絶対値5以下 <- ifelse( abs(標本平均-50) <= 5, 1, 0)
table(誤差絶対値5以下)

##
## 10000個の標本平均の平均値

mean(標本平均)

## 10000個の標本平均の分散値

var(標本平均)

##
# png("graphs/fig-04-13.png", width=400, height=300)
##
hist(標本平均,freq=FALSE, main="図4.13 標本平均の標本分布")
curve(dnorm(x, mean=this.mean, sd=this.sd/sqrt(this.sample_size)), add=TRUE, col="red")

this.sample_size <- 100
標本平均 <- numeric(length=this.counts)
      
for(i in 1:this.counts) {
  標本 <- rnorm(n=this.sample_size, mean=this.mean, sd=this.sd)
  標本平均[i] <- mean(標本)
}

mean(標本平均) ## 付加
var(標本平均)

誤差絶対値5以下 <- ifelse( abs(標本平均-50) <= 5, 1, 0) ## 付加
table(誤差絶対値5以下) ## 付加

##
## png(RforS-graphs/04-14.png)

hist(標本平均,freq=FALSE, main="図4.14 標本サイズを大きくしたときの標本平均の標本分布")
curve(dnorm(x,mean=50,sd=this.sd/sqrt(this.sample_size)),col="red",add=TRUE)
curve(dnorm(x,mean=50,sd=this.sd/sqrt(10)),col="blue",add=TRUE)

##
## 4.6 標本分散と不偏分散の標本分布
##

samples.no <- 10000   # いくつ標本を用いるか
sample.size <- 10     # ひとつの標本の中のデータの個数

this.mean <- 50       # 分布の平均
this.sd <- 10         # 分布の標準偏差

標本分散s <- numeric(samples.no) # 各々の標本の分散値の保存場所
不偏分散s <- numeric(samples.no) # 各々の標本の不偏分散値の保存場所

for (i in 1:samples.no) {
  標本 <- rnorm(n=sample.size, mean=this.mean, sd=this.sd) # ひとつの標本の生成
  標本分散s[i] <- mean((標本-mean(標本))^2) 
  不偏分散s[i] <- var(標本)
}

c(mean(標本分散s),sd(標本分散s))  # 標本分散達の平均と分散
c(mean(不偏分散s),sd(不偏分散s))  # 標本不偏分散達の平均と分散

##
## 標本分散の頻度表
##
hist(標本分散s, breaks=seq(0,500,10), main="標本分散の分布")

##
## 標本不偏分散の頻度表
##
hist(不偏分散s, breaks=seq(0,500,10), main="不偏分散の分布")

##
## 標本不偏分散の分布
##
hist((不偏分散s/100)*9, freq=FALSE, breaks=seq(0,50,1), main="不偏分散/母分散の分布と自由度9のカイ二乗分布")
curve(dchisq(x,9), add=TRUE, col="red")
