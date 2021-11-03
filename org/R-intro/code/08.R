setwd("/Users/saito/TMP")
(x <- scan("R-intro/data/08-01.txt"))
(batters <- read.table("R-intro/data/batters.txt", header=T, sep="\t", row.names=1))
x$Team
x$Hits
