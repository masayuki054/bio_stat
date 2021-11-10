##
## 正規分布のグラフを描く
##

curve(dnorm(x), from=-4, to=4, main="図4.4-5 正規分布 N(0, 1), N(0,2), N(1,1)")        # 標準正規分布のグラフ， -4 から +4 の範囲
curve(dnorm(x,sd=2), add=TRUE)        # 平均0， 偏差2 の正規分布，上描き 
curve(dnorm(x,mean=1,sd=1), add=TRUE) # 平均1， 偏差1 の正規分布，上描き

##
## 平均50、標準偏差10の正規母集団からn＝1000の標本を無作為抽出する

#### png("graphs/fig-04-08.png", width=400,height=300)
hist(rnorm(n=1000, mean=50, sd=10), main="図3.8 N(50, 10)からの n=1000 の標本の頻度表")
