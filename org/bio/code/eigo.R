eigo <- c(	
36,70,56,68,76,60,50,63,62,42,64,60,50,68,71,67,	
50,65,67,57,72,64,61,66,46,80,46,51,59,32,55,65,	
65,52,57,64,23,57,53,54,38,71,57,69,77,61,51,64,	
63,43,65,61,51,69,72,68,53,66,68,58,73,65,62,67,	
47,81,47,52,59,33,56,66,67,52,58,65,24,58,54,55)	
length(eigo)	     	 #データ数　
summary(eigo)			# データの要約統計量
mean(eigo)	     	 	#標本平均　
var(eigo)	     	 	#標本分散　
sd(eigo)	     	 	#標本標準偏差　

# データの図示

## 箱ヒゲ図
png(file="desc/graph/eigo-box.png")
boxplot(eigo, main="英語得点の箱ヒゲ図") #箱ひげ図
boxplot.stats(eigo)	     	         #箱ひげ図用統計量　
dev.off()

## 英語のヒストグラム
png("desc/graph/eigo-hist.png")
hist(eigo, breaks=seq(0, 100, by=5), xlab="英語得点", ylab="頻度", main="")
title(main = "英語得点のヒストグラム")	   #グラフタイトル
stem(eigo, scale=2)	     	           #幹葉表示
dev.off()
