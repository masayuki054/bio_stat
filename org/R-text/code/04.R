##
## 正規分布からの標本
##
### サイズ 20, 平均=29.2, 分散=1
###

(sample <- rnorm(20, mean=29.2, sd=1))

tz_interval <- function (alpha, sample) {
  c(qnorm(1-alpha/2), qnorm(alpha/2))
  }

## 母平均の区間推定，母分布未知

### alpha : 危険度， (1-alpha): 信頼度
### sample : 標本

est_tz_conf_interval <- function (alpha, sample) {

  xbar = mean(sample)
  s2   = var(sample)
  n = length(sample)
  tz <- tz_interval(0.05, sample)
  sigma <- sqrt(s2)
  
  c(xbar - sigma*tz[1]/sqrt(n), xbar + sigma*tz[1]/sqrt(n))

}

var(sample)
tz_interval(0.05, sample)
est_tz_conf_interval(0.05, sample)
