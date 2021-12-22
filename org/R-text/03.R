##
## 標本分散の分布
##
hist(標本分散s/100*10, freq=FALSE, breaks=seq(0,50,1), main="標本分散/母分散の分布と自由度9のカイ二乗分布")
curve(dchisq(x,9), add=TRUE, col="red")
