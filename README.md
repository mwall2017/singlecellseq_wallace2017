# singlecellseq_wallace2017

These are the files associated with the DropSeq analysis in Wallace et al 2017.


raw_data.csv and raw_data.Robj are the rawest forms of the data presented.  They are data from neurons (including some doublets later discarded) from 3101 transcripts with 16484 total genes identified across the population.  

The command
load('raw_data.Robj') 
will load an R objected name entData with the data in it.

The command
entData=read.csv("raw_data.csv", header = T, row.names = 1)
will do the same but read from the .csv file.

The data is normalized to have 10,000 counts per cell and is log normalized - value=log2(1+count_pre_10000)



sub.Robj
load(‘sub.obj’) loads the R object with 1118 cells that had the highest counts.  This is the object shown in the figures and used for the analyses.  It is created with the Seurat package 

TSNEPlot(sub, do.label=T) recreates the TSNE plots shown

run_analysis.R   has sample code to run the analysis from scratch starting with endData

