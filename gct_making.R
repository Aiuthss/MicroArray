probe <- fit$genes$ProbeName
gene <- fit$genes$GeneName
coe <- fit$coefficients

x <- cbind(cbind(probe,gene),coe)
x <- as.data.frame(x)
View(x)
write.table(x, "Data.gct")
