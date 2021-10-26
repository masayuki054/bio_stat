
 (x <- c(2,4,6,8,10))    # ベクトルの作成
 length(x)               # ベクトルの次元数、すなわちベクトル中の数値の個数
 x[3]                    # 3 番目の数値を抽出する
 x[c(2,4)]               # 2番目と 4 番目の数値を抽出
 x[2:4]                  # 2 番目から 4 番目までの数値を抽出
x
x > 5                    # ベクトルの各要素が 5 より大きいかの判定
which (x>5)
x[which(x>5)]
x[x>5]
x <- c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday")

x[c(2,4)]
x[2:4]
grep("sd", x)  # "sd"を含む要素を探す
x <- c(2, 4, 6)
names(x) <- c("First", "Second", "Third")
x[["Second"]]
sum(x)     # x の合計、
mean(x)    # x の平均
(x <- c(2,4,6,8,10));
sum(x > 5) # x の中のTRUEの数を数える

(x <- rbind(c(1,2,3), c(4,5,6)))
(x <- matrix(c(1, 4, 2, 5, 3, 6), nrow=2, ncol=3)) # nrow:行数， ncol:列数
x+1
x*2

y <- rbind(c(2, 4, 6), c(8, 10, 12))

x + y 
x * y

x[2,3]
x[2,]
x[,3]
t(x) # 転置
apply(x, 2, mean) # 行和，xの2次元目の各項の平均
apply(x, 1, mean) # 列和，xの1次元目の各項の平均
(x <- array(1:24, c(3,4,2))) # 3×4×2 の大きさの3次元配列を作成
(x <- list("Oh", "Nomura", "Kadota"))
(x <- list("Oh", "Nomura", "Kadota", c(868, 657, 567)))

x[[2]]
x[[4]]
(x <- list(First="Oh", Second="Nomura", Third="Kadota", Home_Runs=c(868, 657, 567)))
x[[4]]
x$Home_Runs
(x <- data.frame(
 row.names = c("Nomura", "Harimoto", "Kinugasa", "Oh", "Kadota"),
 Team = c("Hawks", "Flyers", "Carps", "Giants", "Hawks"),
 At_Bat = c(10472, 9666, 9404, 9250, 8868),
 Hits = c(2901, 3085, 2543, 2786, 2566),
 Home_Runs = c(657, 504, 504, 868, 567)
))
x$Hits
x[ c(1,5), c(2,3,4) ] # 1、5 行目と 2、3、4 列目を抽出する
attributes(x)
names(x)
row.names(x)
class(x)
(x <- data.frame(
row.names = c("USA", "England", "Italy", "Canada", "Germany", "Japan", "France", "Russia"), 
    Area = c(9.4, 0.2, 0.3, 10.0, 0.3, 0.3, 0.5, 17.1),
    Population = c(315, 62, 60, 34, 82, 127, 62, 141),
    GDP = c(14, 3, 2, 2, 4, 5, 3, 2)
))
x
mean(x$Area)
mean(x[["Population"]])
mean(x[,3])
c("mean(x$Area) = ", mean(x$Area))
