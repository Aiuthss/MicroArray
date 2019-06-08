write.table(x[tolower(x[,1])==tolower("H2-Q5"),],"H2-Q5.txt")

data <- read.table("Bcl2l11.txt",header=T)
data <- 2^(data)
time <- c(0,2,4,8)
expression <- t(data)
matplot(time, expression, type="b",
        col=c("royalblue3","brown3"), pch=c(15,0), cex=2, lwd=2, lty=1)
legend("topleft", legend=c("WT", "KO"),
       col=c("royalblue3","brown3"), pch=c(15,0), lwd=2, lty=1)
title("Bcl2l11")
