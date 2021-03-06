

# 想定

-   $ X $: 母集団 $ \sim N(\mu, \sigma^2) $ とする

-   $ X_{i=1:n} $: $ X $ からの無作為標本

-   $ \mu $ の区間推定


# 平均パラメータの区間推定の問題

「薬の投与により，血中のある物質の濃度が上昇し，健康状態が改善される」
という。

20人の患者への投与により，増加の程度 (%) の標本値が得られた:

    ##
    ## 正規分布からの標本
    ##
    ### サイズ 20, 平均=29.2, 分散=1
    ###
    
    (sample <- rnorm(20, mean=29.2, sd=1))

     [1] 27.94484 29.83686 27.79953 28.04755 28.75391 29.71464 28.29472 26.32046
     [9] 30.47457 29.69439 28.47219 29.96765 29.69294 29.05225 30.87160 30.46751
    [17] 28.09111 29.15670 28.50214 27.93843


# 10.1 母平均の区間推定 (分散既知)


## $ \overline{X_{(n)}}$ の標準化

$Z_n =  \frac{\overline{X_{(n)}}-\mu}{\sqrt{\sigma^2/n}}   \sim
   N(0,1)  $


## 危険度・信頼度と信頼区間

$ P(\theta_{l} \leq \theta \leq \theta_{h}) $ という主張

-   **危険度:** $ \alpha $: 0.05, 0.01 が用いられることが多い
    
    $ P( \theta \leq \theta_{l} ||  \theta_{h} \leq \theta) = \alpha
         $ となる確率を危険度という
    
    メッタに起らない事象である度合い。

-   **信頼度:** $1-\alpha$： 0.95, 0.99 が用いられることが多い
    
    $ P(\theta_{l} \leq \theta \leq \theta_{h}) = 1 - \alpha $ とな
    る区間  $ [\theta_{l}, \theta_{h}] $ を, **信頼区間** と呼ぶ。


## 標本の標本平均が入る区間を求める


### 危険度・信頼度に対する $ z^* $ を求める

$ z^* $ は標準正規分布で危険度・信頼度に対応する座標。

$ P(|Z_n|) \leq z^{*} ) = 1-\alpha $ となる $ z^{*} $


#### 危険度0.05, 信頼度0.95となる $z^*$

    ##
    ##  危険度・信頼度に対する z^* を求める
    ##
    
    (zs <- qnorm(0.975)) ## 下側97.5%, 上側2.5% 点
    pnorm(zs)  ## [-\infty, zs]となる確率
    
    (zs <- qnorm(0.995)) ## 下側99.5%, 上側0.5% 点
    pnorm(zs)  ## [-\infty, zs]となる確率

    [1] 1.959964
    [1] 0.975
    [1] 2.575829
    [1] 0.995


#### 信頼度 $ 1-\alpha$ の信頼区間は，

$ \left[ \overline{X_{(n)}}-z^{*} \sqrt{\sigma^2/n}, \,\,\,
      \overline{X_{(n)}} + z^{*} \sqrt{\sigma^2/n} \right]$


##### 信頼度 0.95/0.99 の信頼区間は，

$ z^* $ に 1.96 を代入した:

$ \left[ \overline{X_{(n)}} - 1.96 \sqrt{\sigma^2/n}, \,\,\,
      \overline{X_{(n)}} + 1.96 \sqrt{\sigma^2/n} \right]$

$ z^* $ に 2.58 を代入した:

$ \left[ \overline{X_{(n)}} - 2.58 \sqrt{\sigma^2/n}, \,\,\,
      \overline{X_{(n)}} + 2.58 \sqrt{\sigma^2/n} \right]$


### $ \mu $ の信頼区間 (を求める公式) を求める

$ 1-\alpha  =  P (|Z_n| \leq z^{*}) $

$ =  P( \frac{|\overline{X_{(n)}}-\mu|}{\sqrt{\sigma^2/n}} \leq     z^{*})$

$ =  P( {|\overline{X_{(n)}}-\mu| \leq z^{*} \sqrt{\sigma^2/n}) $

$ =  P ( \overline{X_{(n)}}-z^{*} \sqrt{\sigma^2/n} \leq \mu \leq  \overline{X_{(n)}} + z^{*} \sqrt{\sigma^2/n}) $


### 平均パラメータの区間推定の問題 (分散既知)

「薬の投与により，血中のある物質の濃度が上昇し，健康状態が改善され
る」という。

20人の患者への投与により，増加の程度 (%) の標本値が得られた:


### 標本生成

母平均 29.2, 母分散 1 の正規分布からの20個のデータからなる標本を作
る:

    
    (sample <- rnorm(20, mean=29.2, sd=1))


#### 標準正規分布で信頼度(1-&alpha;)の信頼区間 (上記の説明通り)求める

    ## 
    
    ## 標準正規分布での信頼度(1-alpha)の信頼区間
    z_interval <- function (alpha) {
      c(qnorm(1-alpha/2), qnorm(alpha/2))
      }
    
    ## 母平均の区間推定，分散既知
    ### alpha : 危険度， (1-alpha): 信頼度
    ### sample : 標本
    ### sigma2 : 母分散
    est_conf_interval <- function (alpha, sample, sigma2) {
      xbar = mean(sample)
      n = length(sample)
      zs <- z_interval(0.05)
      sigma <- sqrt(sigma2)
      
      c(xbar - sigma*zs[1]/sqrt(n), xbar + sigma*zs[1]/sqrt(n))
    }
    var(sample)
    z_interval(0.05)
    est_conf_interval(0.05, sample, 1)

    [1] 0.7330411
    [1]  1.959964 -1.959964
    [1] 28.94026 29.81679


#### $ N\left(\overline{X}, \frac{\sigma^2}{n} \right) $ で信頼度(1-&alpha;)の信頼区間を求める

Rを用いれば，N(標本平均，sigma^2) の分布上での上下限座標を求めるのは簡
単なので，標準化を行なわず，標本平均の正規分布上で直接計算でき:

    
    ## N(標本平均，sigma^2) の分布上で求める
    ## 母平均の区間推定，分散既知
    ### alpha : 危険度， (1-alpha): 信頼度
    ### sample : 標本
    ### sigma2 : 母分散
    
    est_conf_interval_2 <- function(alpha, sample, sigma2) {
    
      xbar = mean(sample)
      n = length(sample)
      zs_h =  qnorm(1-alpha/2, mean=xbar, sd=sqrt(sigma2/n))
      zs_l =  qnorm(alpha/2, mean=xbar, sd=sqrt(sigma2/n))
      c(zs_l, zs_h)
    }
    
    est_conf_interval_2(0.05, sample, 1)

    [1] 28.81210 29.68862


# 10.2 母平均の区間推定 (分散未知)

分散未知の場合は，スチューデント化を用いる。

標本平均 $ \overline{X_{(n)}}$ の従う分布は，
自由度 $ (n-1) $ の t-分布になる。

$ \sigma^2 $ の代わりに標本不偏分散 $ S^2 $ を用いる。

それ以外は，分散既知の場合と同じになる。


## $ \overline{X_{(n)}}$ のスチューデント化

$T_n =  \frac{\overline{X_{(n)}}-\mu}{\sqrt{S^2/n}}   \sim    t_{n-1}  $


## 危険度・信頼度と信頼区間

分散既知の場合と同じ


## 標本のの標本平均が入る区間を求める


### 危険度・信頼度に対する $ t^* $ を求める

$ P(|T_n|) \leq t^{*}_{n-1}) = 1-\alpha $ となる $ t^{*}_{n-1} $


#### 危険度0.05, 信頼度0.95となる $t^*_{n-1}$

下記のRによる計算では，具体的は自由度の値が必要となる。

    degree_of_free <- length(sample)-1
    (tns <- qt(0.975,df=degree_of_free)) ## 下側97.5%, 上側2.5% 点
    pt(tns,degree_of_free)  ## [-\infty, zs]となる確率
    
    (tns <- qt(0.995, df=degree_of_free)) ## 下側99.5%, 上側0.5% 点
    pt(tns, df=degree_of_free)  ## [-\infty, zs]となる確率

    [1] 2.093024
    [1] 0.975
    [1] 2.860935
    [1] 0.995


#### 信頼度 0.95/0.99 の信頼区間は，

$ t^* $ に 2.09 を代入した:

$ \left[ \overline{X_{(n)}} - 2.09 \sqrt{S^2/n}, \,\,\,
     \overline{X_{(n)}} + 2.09 \sqrt{\S^2/n} \right]$

$ t^* $ に 2.86 を代入した:

$ \left[ \overline{X_{(n)}} - 2.86 \sqrt{S^2/n}, \,\,\,
     \overline{X_{(n)}} + 2.86 \sqrt{S^2/n} \right]$


### $ \mu $ の信頼区間 (を求める公式) を求める

$ 1-\alpha  =  P (|T_n| \leq t^{*}_{n-1}) $

$ =  P( \frac{|\overline{X_{(n)}}-\mu|}{\sqrt{S^2/n}} \leq
     t^{*}_{n-1}) $

$ =  P( |\overline{X_{(n)}}-\mu| \leq t^{*}_{n-1} \sqrt{S^2/n})
     $

$ =  P \left( \overline{X_{(n)}}-t^{*}_{n-1} \sqrt{S^2/n} \leq \mu \leq  \overline{X_{(n)}} + t^{*}_{n-1} \sqrt{S^2/n} \right) $


### 平均パラメータの区間推定の問題 (分散未知)

「薬の投与により，血中のあるある物質の濃度が上昇し，健康状態が改善され
る」という。

20人の患者への投与により，増加の程度 (%) の標本値が得られた:


#### t<sub>n-1</sub>分布で信頼度(1-alpha)の信頼区間 (上記の説明通り)求める

    ## 
    
    ## t-分布での信頼度(1-alpha)の信頼区間
    t_interval <- function (alpha, sample) {
      c(qt(1-alpha/2,length(sample)-1), qt(alpha/2, length(sample)-1))
      }
    
    ## 母平均の区間推定，分散未知
    ### alpha : 危険度， (1-alpha): 信頼度
    ### sample : 標本
    est_t_conf_interval <- function (alpha, sample) {
      xbar = mean(sample)
      s2   = var(sample)
      n = length(sample)
      ts <- t_interval(0.05, sample)
      sigma <- sqrt(s2)
      
      c(xbar - sigma*ts[1]/sqrt(n), xbar + sigma*ts[1]/sqrt(n))
    }
    mean(sample)
    var(sample)
    t_interval(0.05, sample)
    est_t_conf_interval(0.05, sample)

    [1] 28.9547
    [1] 1.295045
    [1]  2.093024 -2.093024
    [1] 28.4221 29.4873


# 10.3 母平均の区間推定 (母分布未知)


## アンケートの問題

「内閣を支持しますか，しませんか？」のアンケートに結果，
支持率 34% だった。

このときの誤差を見積もりたい。


### 問題整理

-   確率変数: $ X = 1 $ で支持，$ X = 0 $で支持しない。
-   支持率 : $ \theta $
-   母分布 : ベルヌーイ分布

分散未知の場合は，スチューデント化を用いる。

**大数の法則と中心極限定理により\*，
\*スチューデント化変数 $T_n$ は標準正規分布に分布収束する** 。


## 母分布未知 での$ \overline{X_{(n)}}$ のスチューデント化

\begin{eqnarray}
T_n & = &  \frac{\overline{X_{(n)}}-\mu}{\sqrt{S^2/n}} \\
& = &
\frac{\overline{X_{(n)}}-\mu}{\sqrt{\sigma^2/n}}\frac{1}{\sqrt{S^2/\sigma^2}}\\
& = & Z_n \frac{1}{\sqrt{S^2/\sigma^2}}\\
\end{eqnarray}

で，母分布が未知のため，大数の法則と中心極限定理を用いると，

$Z_n \stackrel{d}{\longrightarrow} N(0, 1) $ ，    $ {\sqrt{S^2/\sigma^2}} \stackrel{P}{\longrightarrow} 1$

なので，   $T_n \stackrel{d}{\longrightarrow} N(0, 1) $  


### $ \mu $ の信頼区間 (を求める公式) を求める

$ 1-\alpha  =  P (|T_n| \leq z^{*}) $

$ =  P( \frac{|\overline{X_{(n)}}-\mu|}{\sqrt{S^2/n}} \leq
     z^{*}) $

$ =  P( {|\overline{X_{(n)}}-\mu|} \leq z^{*}\sqrt{S^2/n} ) $

$ =  P \left( \overline{X_{(n)}}-z^{*} \sqrt{S^2/n} \leq \mu
     \leq  \overline{X_{(n)}} + z^{*}\sqrt{S^2/n} \right) $

    
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

    [1] 0.7330411
    [1]  1.959964 -1.959964
    [1] 29.00330 29.75376


# 10.5 例: 内閣支持率調査アンケート


## 基本的な考え方

-   全国民に聞ければ全て判明

-   適当な人数にアンケート調査して，
    適当な方法で支持率を推定したい

-   アンケート結果を $ \overline{X_{(n)}} $ で得られた値 $ a $%

-   $ a $% にどの程度誤差を見積もるか？


## 問題整理

-   確率変数: $ X = 1 $ で支持，$ X = 0 $で支持しない。
-   支持率 : $ \theta $
-   母分布 : ベルヌーイ分布


## 誤差を見積る

-   **$ \mu = \theta $:** 推定量 $ \overline{X_{(n)}} $
-   **$ \sigma^2 = \theta (1-\theta) $ :** 推定量 $\overline{X_{(n)}} (1 - \overline{X_{(n)}}) $

$ \theta $ の信頼区間は，  $\overline{X_{(n)}} \pm z^*_{\alpha} \sqrt{\overline{X_{(n)}} (1 - \overline{X_{(n)}})/n} $


### 標本サイズと区間推定値

信頼度 $ 1-\alpha = 0.95 $ で，n=100, n=1000 での信頼区間は:

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">\( n=100 \)</td>
<td class="org-left">\( 0.3 &plusmn; 1.96 \sqrt{0.3(1-0.3)/100} &asymp; 0.3 &plusmn; 0.090</td>
</tr>


<tr>
<td class="org-left">\( n=1000 \)</td>
<td class="org-left">\( 0.3 &plusmn; 1.96 \sqrt{0.3(1-0.3)/1000} &asymp; 0.3 &plusmn; 0.028</td>
</tr>
</tbody>
</table>


## 誤差と標本サイズ

誤差を $ \pm 1% $ 程度にしたい。
そのために必要な標本サイズはいくつか？

$ z^*_{\alpha} \sqrt{\overline{X_{(n)}} (1 -
    \overline{X_{(n)}})/n} \approx 0.01
    $

\begin{eqnarray}
n & \approx & (z^*_{(\alpha)})^2 \overline{X_{(n)}} (1 - \overline{X_{(n)}})/(0.01)^2 \\
  & = & 1.96^2\times 0.3 \times 0.7 / (0.01)^2 \\
  & = & 8067
\end{eqnarray}

しかし $ \overline{X_{(n)}} $は，アンケート前にはわからないので，
分散 $ \theta (1-\theta$ \\) が最大になる，$\theta = 1/2 $ とし
て，概数を求める。

\begin{eqnarray}
n & \approx & (z^*_{(\alpha)})^2 \times 0.5 (1-0.5)/(0.01)^2 \\
  & = & 9604
\end{eqnarray}


# 10.7 二つの母集団の平均の差の区間推定


## 薬と血中濃度の問題

-   **Aグループ:** 新薬を投与し， $ \overline{X_{(n)}} = 3.56 $
-   **Bグループ:** 新薬を投与し， $ \overline{Y_{(m)}} = 1.27 $

平均的には，$ \( \overline{X_{(n)}} - \overline{Y_{(m)}} = 2.29 $
だが，その誤差の見積りは？


## 問題設定

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">母集団分布</td>
<td class="org-left">無作為標本</td>
</tr>


<tr>
<td class="org-left">\( X \sim N(\mu_x, \sigma^2_x) \)</td>
<td class="org-left">\(X_{i=1:n} \)</td>
</tr>


<tr>
<td class="org-left">\( Y \sim N(\mu_y, \sigma^2_y) \)</td>
<td class="org-left">\(Y_{i=1:m} \)</td>
</tr>
</tbody>
</table>

のとき，$ \mu_x - \mu_y $ の区間推定


## 分散既知の場合

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">標本平均分布</td>
<td class="org-left">無作為標本</td>
</tr>


<tr>
<td class="org-left">\( \overline{X_{(n)}} \sim N(\mu_x, \sigma^2_x/n) \)</td>
<td class="org-left">\(X_{i=1:n} \)</td>
</tr>


<tr>
<td class="org-left">\( \overline{Y_{(m)}} \sim N(\mu_y, \sigma^2_y/m) \)</td>
<td class="org-left">\(Y_{i=1:m} \)</td>
</tr>
</tbody>
</table>

$ \overline{X_{(n)}} - \overline{Y_{(n)}} \sim N(\mu_x-\mu_y,
   \sigma_x^2/n + \sigma_y^2/m )$


### 標準化変数

$ \overline{Z} =
    ((\overline{X}-\overline{Y}) -(\mu_x - \mu_y)) /
    \sqrt{\sigma_x^2/n + \sigma_y^2/m} $


### 信頼区間

$ (\overline{X}-\overline{Y}) \pm z^* \sqrt{\sigma_x^2/n + \sigma_y^2/m} $


## 分散未知の場合


### $ \sigma_x^2 = \sigma_y^2 = \sigma^2 $ の場合


#### $ \sigma^2 $ の推定量

$ S_*^2 = \frac{1}{n+m-2}\left\{\Sigma_1^n (X_i -
     \overline{X_{(n)}})^2+ \Sigma_1^m (Y_i - \overline{Y_{(m)}})^2
     \right\} $

-   $ S_*^2 $ は $ \sigma^2 $ の不偏推定量

-   $ (n+m-2) S_*^2/\sigma^2 \sim \chi^2_{n+m-2} $


#### スチューデント化変数 T

$ T = \left\{(\overline{X_{(n)}} - \overline{Y_{(n)}}) - (\mu_x-\mu_y) \right\}/
     \sqrt{S_x^2(1/n + 1/m )}$

$ T \sim t_{n+m-2} $


### 信頼区間

$ (\overline{X}-\overline{Y}) \pm t^*_{n+m-2} \sqrt{S_*^2(1/n + 1/m)} $


## 分散未知の場合


### $ \sigma_x^2 \neq \sigma_y^2 $ の場合


#### 二つの標本不偏分散の推定量

$ S_x^2 = \frac{1}{n-1}\Sigma_1^n (X_i -\overline{X_{(n)}})^2
     \longrightarrow  \sigma_x^2$

$ S_y^2 = \frac{1}{m-1}\Sigma_1^m (Y_i -\overline{Y_{(n)}})^2      \longrightarrow  \sigma_y^2$


#### スチューデント化変数 T

$ T^* = \left\{(\overline{X_{(n)}} - \overline{Y_{(n)}}) - (\mu_x-\mu_y) \right\}/
     \sqrt{S_x^2/n + S_y^2/m )}$


#### $ \lim_{n \rightarrow\infty} l$ のコンテキストで

$ T^* \sim N(0,1) $


### 信頼区間

$ (\overline{X}-\overline{Y}) \pm z^*\sqrt{S_x^2/n + S_y^2/m} $ 


# 10.8 分散パラメータの区間推定


## 前提

-   母集団 $ \sim N(\mu, \sigma^2) $,
-   $ \mu $, $ \sigma^2 $ は未知


## 分散の推定量

分散の推定量 $ S^2 $ は，

$ (n-1) S^2/\sigma^2 \sim \chi^2_{n-1}   $


## 信頼区間

$ P( u \leq (n-1) S^2/\sigma^2 \leq v ) = 1 - \alpha $

$ 1-\alpha = P((n-1) S^2/v \leq \sigma^2 \leq (n-1) S^2/u )$ 

なので，信頼区間は，

$ \left[((n-1) S^2/v, (n-1) S^2/u ) \right]$ 


## 95% 信頼区間の両端点

    ###
    ### 
    ###
    for (d in c(4,8,16,32,64)) {
      print(c(d), qchisq(0.025,df=d), qchisq(0.975,df=d)))
    }

    [1]  4.0000000  0.4844186 11.1432868
    [1]  8.000000  2.179731 17.534546
    [1] 16.000000  6.907664 28.845351
    [1] 32.00000 18.29076 49.48044
    [1] 64.00000 43.77595 88.00405


## 90% 信頼区間の両端点

    ###
    ### 
    ###
    for (d in c(4,8,16,32,64)) {
      print(c(d, qchisq(0.05,df=d), qchisq(0.95,df=d)))
    }

    [1] 4.000000 0.710723 9.487729
    [1]  8.000000  2.732637 15.507313
    [1] 16.000000  7.961646 26.296228
    [1] 32.00000 20.07191 46.19426
    [1] 64.00000 46.59491 83.67526

