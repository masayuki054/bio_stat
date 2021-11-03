x <- c(10, 12, 15, 19, 21, 34)
write(x, "R-intro/data/outfile1.txt", ncolumns = 1)
x <- matrix(c(1,2,3,4,5,6), nrow=2, ncol=3, byrow=T)
write(t(x), "R-intro/data/outfile2.txt", ncolumns=ncol(x), sep="\t")
batters[,c(3,4)]
write.table(batters[,c(3,4)], "R-intro/data/outfile3.txt", sep="=\t", row.names=T, col.names=NA)
