## 平均11mm, 標準偏差2mmの母集団からの標本の作成

(sample <- rnorm(n=10, mean=11, sd=2))

c(mean(sample), sqrt(var(sample)))

pnorm(mean(sample), mean=5, sd=2)

(sample <- c(7, 10, 12, 13, 13))
c(mean(sample), var(sample), sqrt(var(sample)))

qt(0.975,df=length(sample)-1)

(t_est <- (mean(sample) - 7)/sqrt(var(sample)/length(sample)))

pt(t_est,df=length(sample)-1)

t.test(sample, mu=7)
