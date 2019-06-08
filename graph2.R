coe <- fit$coefficients
gene <- fit$genes$GeneName
ame <- fit$Amean

target <- read.table("geneset.txt",header=F,skip=2)
target <- as.character(target$V1)

x <- cbind(cbind(gene,ame),coe)
x <- as.data.frame(x)
for (i in 1:9){
  x[,i+1] <- as.numeric(as.character(x[,i+1]))
}
x$contrast <- x$KO8-x$WT8

cols <- rainbow(length(target))
col_num <- 1
xlim <- c(0,20)
ylim <- c(-3,3)

plot(x[,2],x[,ncol(x)],col="black",
     xlab="Mean",ylab="Difference",main="KO8-WT8",xlim=xlim,ylim=ylim)

for (i in target){
par(new=T)
plot(x[tolower(x[,1])==tolower(i),2],x[tolower(x[,1])==tolower(i),ncol(x)],col=cols[col_num], pch=19, cex=1.5, 
     xlab="",ylab="",xlim=xlim,ylim=ylim)
col_num <- col_num+1}

par(new=T)
plot(x[tolower(x[,1])==tolower("NFKB1"),2],x[tolower(x[,1])==tolower("NFKB1"),ncol(x)],col="Green", pch=19, cex=1.5, 
     xlab="",ylab="",xlim=xlim,ylim=ylim)

par(new=T)
plot(x[tolower(x[,1])==tolower("ccl4"),2],x[tolower(x[,1])==tolower("ccl4"),ncol(x)],col="Red", pch=19, cex=1.5, 
     xlab="",ylab="",xlim=xlim,ylim=ylim)

for (i in target){print(x[tolower(x[,1])==tolower(i) & x[,2]>11 & x[,3]>1,1])}