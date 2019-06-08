coe <- fit$coefficients
gene <- fit$genes$GeneName
ame <- fit$Amean

x <- cbind(cbind(gene,ame),coe)
x <- as.data.frame(x)
for (i in 1:9){
x[,i+1] <- as.numeric(as.character(x[,i+1]))
}
x$contrast <- (x$KO8-x$KO4)-(x$WT8-x$WT4)

xlim=c(0,20)
ylim=c(-1,1)

plot(x[x$contrast<(-1),2],x[x$contrast<(-1),11],col="blue",
     xlab="",ylab="",xlim=xlim,ylim=ylim)
par(new=T)
plot(x[x$contrast>1,2],x[x$contrast>1,11],col="red",
     xlab="",ylab="",xlim=xlim,ylim=ylim)
par(new=T)
plot(x[x$contrast<1 & x$contrast > -1 ,2],x[x$contrast<1 & x$contrast > -1 ,11],col="black",
     xlab="Mean",ylab="Difference",main="8h",xlim=xlim,ylim=ylim)

par(new=T)
plot(x[tolower(x[,1])==tolower("Bcl2l11"),2],x[tolower(x[,1])==tolower("Bcl2l11"),11],col="Green", pch=19, cex=1.5, 
     xlab="",ylab="",xlim=xlim,ylim=ylim)

write.table(x[tolower(x[,1])==tolower("REL"),],"REL.txt")

data <- read.table("REL.txt")
data <- 2^(data)
time <- c(0,2,4,8)
expression <- t(data)
matplot(time, expression, type="b",
        col=c("royalblue3","brown3"), pch=c(15,0), cex=2, lwd=2, lty=1)
legend("topleft", legend=c("WT", "KO"),
       col=c("royalblue3","brown3"), pch=c(15,0), lwd=2, lty=1)
title("REL")

hist(fit2$coefficients[x$contrast<4 & x$contrast>-4,], 
     breaks=seq(-4,4,0.2),main = "Histogram of Difference",xlab="Difference",
     xaxp=c(-4, 4, 8))

hist(fit2$coefficients[x$contrast<4 & x$contrast>-4,], 
     breaks=seq(-4,4,0.2),main = "Histogram of Difference",xlab="Difference",
     ylim=c(1,250),xaxp=c(-4, 4, 8))
