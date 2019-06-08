library(limma)
targets <- readTargets("Targets.txt", row.names="Name")
RG <- read.maimages(targets, source="agilent", green.only=TRUE,other.columns="gIsWellAboveBG")
boxplot(RG$E,ylim=c(0,300))
RGcor <- backgroundCorrect(RG, method="normexp")
boxplot(RGcor$E,ylim=c(0,300))
RGnorm <- normalizeBetweenArrays(RGcor, method="quantile")
boxplot(RGnorm$E)
Control <- RGnorm$genes$ControlType==1L
NoSymbol <- is.na(RGnorm$genes$GeneName)
IsExpr <- rowSums(RGnorm$other$gIsWellAboveBG > 0) >= 1
RGfilt <- RGnorm[!Control & !NoSymbol & IsExpr, ]
lev <- c("WT0","WT2","WT4","WT8","KO0","KO2","KO4","KO8")
f <- factor(targets$Target,levels=lev)
design <- model.matrix(~0+f)
colnames(design) <- lev
fit <- lmFit(RGfilt,design)
contrast.matrix <- makeContrasts((KO8-KO4)-(WT8-WT4),levels=design)
fit2 <- contrasts.fit(fit, contrast.matrix)
plotMD(fit2)

fit2[fit2$genes$GeneName=="Setdb2",]$coefficients
fit2[fit2$genes$GeneName=="Setdb2",]$Amean