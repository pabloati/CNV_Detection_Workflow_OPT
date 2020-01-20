!/usr/bin/env Rscript

#Extraction of data
args=commandArgs(trailingOnly=TRUE)
Data <- read_tsv(args[1], skip = 0, col_names = TRUE)
Size <- Data[,"Size", drop = FALSE] ; Ovlp <- Data[,"Number of bases overlapping RLCRs", drop = FALSE]
Percentage <- (Ovlp/Size)*100 ; Data[, "X10"] <- Percentage
write_tsv(Data, file=args[1], col_names= TRUE)
