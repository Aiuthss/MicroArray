library(pathview)

res <- read.csv("cytokine2.csv")
res <- res$ENTREZID

entrez <- unique(res)
entrez <- as.character(entrez)

path.id <- "04060"
pv <- pathview(gene.data = entrez, pathway.id = path.id, species = "mmu")