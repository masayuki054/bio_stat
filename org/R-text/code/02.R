## 入門統計学2章1節

## 1~6 までの一様分布の確率値の計算

(dice <- dunif(1:6, min=1,max=7))

plot(1:6, dice, main="1~6の一様分布")

##
## * 1~6の一様分布の和の分布の確率値の計算
##

dice2 <- rep(0,12) ## 確率値保存用ベクトルの生成

for (i in 1:6) {
  for (j in 1:6) {
    # 
    dice2[i+j] <- dice2[i+j] + dice[i]*dice[j]
  }
}
dice2

##
## 1~6の一様分布の和の分布のヒストグラム
##
plot(1:12, dice2, main="1~6の一様分布の和の分布")

## 入門統計学2章1節

## dbinom(x, size, prob)

## 二項分布 nCx p^x (1-p)^(n-x) の計算

dbinom(c(0,1,2,3,4),3,1/3)

## plot(x,y)

plot(c(0, 1,2,3,4), dbinom(c(0,1,2,3,4),3,1/3),type="h")

## B(n,p) ~ N(np, np(1-p))

## 入門統計学2章1節

## dnorm(x, mean=, sd=) x での確率密度
## norm(x, mean=, sd=)  0..x までの確率

# dnorm
dnorm(c(0,1,2,3,4),mean=1,sd=sqrt(2/3))

plot(dnorm(c(0,1,2,3,4),mean=1,sd=sqrt(2/3)))

# pnorm
pnorm(44, mean=40, sd=2)

#
# 2章のs-課題-1
#
###  dbinom(x,n,p)
###  dnorm(x,mean=np, sd=sqrt(np(1-p)))

plot(4800:5200, dbinom(4800:5200,10000,1/2),col="blue",type="h"); 
# plot(4800:5200, dnorm(4800:5200,mean=5000,sd=50),xlim=c(4800,5200),col="red", type="p")
curve (dnorm(x,mean=5000,sd=50),from=4800,to=5200,col="red",add=T)

(csv.1.2 <- read.csv("R-text/data/01-02.csv"))
# class(csv.1.2)
# (csv.1.2[,1:2])
# class(csv.1.2[,1:2])

(mat.1.2 <- matrix(as.matrix(csv.1.2[,2:3]), nrow(csv.1.2), ncol(csv.1.2)-1)) 
class(mat.1.2)

(z1 <- (mat.1.2[,1] - mean(mat.1.2[,1]))/sqrt(var(mat.1.2[,1])))
(z2 <- (mat.1.2[,2] - mean(mat.1.2[,2]))/sqrt(var(mat.1.2[,2])))

c("z1 (mean, var,sd): ", mean(z1), var(z1), sqrt(var(z1)))
c("z2 (mean, var,sd): ", mean(z2), var(z2), sqrt(var(z2)))

x <- 0:10
plot(0,0, xlim=c(0,10), ylim=c(0,0.5), type="l",
     main="ポアソン分布",
     ylab="確率",
     xlab="出現値",xaxt="n")
for (lamb in c(1,2,3,4,5,6,7,8,9,10)) {
  points(x, dpois(x, lamb), type="l", col="green")
}

##
## ポアソン分布，二項分布，正規分布
##

x <- 0:10
plot(0,0, xlim=c(0,10), ylim=c(0,0.5), type="l",
     main="ポアソン分布,二項分布，正規分布",
     ylab="確率",
     xlab="出現値",xaxt="n")
for (lamb in c(1,2,3,4,5,6,7,8,9,10)) {
  points(x, dpois(x, lamb), type="l", col="green")
  points(x, dbinom(x, 100, lamb/100), type="l", col="blue")
  points(x, dnorm(x, mean=lamb, sd=sqrt(100*lamb/100*(1-lamb/100))),type="l", col="red")
}
