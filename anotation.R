library(org.Mm.eg.db)
library(stringr)

sym <- x[x$ame > 7 & x$contrast < -0.2,1]
sym <- as.character(sym)

res <- select(org.Mm.eg.db,
              keys = str_to_title(sym),
              keytype = "SYMBOL",
              columns = "ENTREZID")

write.csv(res,"genes_down_annotated.csv")