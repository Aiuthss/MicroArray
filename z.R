y <- list()
for (i in target){
y <- c(y,list(as.character(x[tolower(x[,1])==tolower(i) & x$contrast>0.2 & x$ame > 7,1])))}
z <- list()
for (i in 1:length(y)){
z <- c(z,y[[i]])}

