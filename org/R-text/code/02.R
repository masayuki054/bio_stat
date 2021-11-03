#+begin_src R 

## 入門統計学2章1節

## dbinom(x, size, prob)

## 二項分布 nCx p^x の計算

dbinom(c(0,1,2,3,4),3,1/3)

plot(dbinom(c(0,1,2,3,4),3,1/3),type="h")
## 入門統計学2章1節

## dnorm(x, mean=, sd=) x での確率密度
## norm(x, mean=, sd=)  0..x までの確率

# dnorm
dnorm(c(0,1,2,3,4),mean=1,sd=sqrt(2/3))

plot(dnorm(c(0,1,2,3,4),mean=1,sd=sqrt(2/3)))

# pnorm
pnorm(44, mean=40, sd=2)
(csv.1.2 <- read.csv("R-text/data/01-02.csv"))
# class(csv.1.2)
# (csv.1.2[,1:2])
# class(csv.1.2[,1:2])
(mat.1.2 <- matrix(as.matrix(csv.1.2), nrow(csv.1.2), ncol(csv.1.2))) 
class(mat.1.2)
(z1 <- (mat.1.2[,1] - mean(mat.1.2[,1]))/sqrt(var(mat.1.2[,1])))
(z2 <- (mat.1.2[,2] - mean(mat.1.2[,2]))/sqrt(var(mat.1.2[,2])))
c("z1 (mean, var,sd): ", mean(z1), var(z1), sqrt(var(z1)))
c("z2 (mean, var,sd): ", mean(z2), var(z2), sqrt(var(z2)))
dev.new()
x <- 0:10
plot(0,0, xlim=c(0,10), ylim=c(0,0.5), type="l",
     main="ポアソン分布",
     ylab="確率",
     xlab="出現値",xaxt="n")
for (lamb in c(1,2,3,4,5,6,7,8,9,10)) {
  points(x, dpois(x, lamb), type="l")
}
#+end_src
