# the data is already noramlized to 10,000 counts per cells and then log normalized such the values in the file are =log2(counts+1)

# two methods of loading - from a csv file - commented out here
#entData=read.csv("raw_data.csv", header = T, row.names = 1) # to load from a .csv file

# or directly from the save R object
load('raw_data.Robj')

ent <- new("seurat", raw.data=entData)
ent <- Setup(ent, min.cells = 3, min.genes = 400, do.logNormalize = F, total.expr = 1e4, project = "ENT")
# can change above to min.genes=1000 to get analysis closer to that run in the paper and shown in the TSNE plot figures

ent <- MeanVarPlot(ent ,fxn.x = expMean, fxn.y = logVarDivMean, x.low.cutoff = 0.125, x.high.cutoff = 3, y.cutoff = 0.5, do.contour = F)
length(ent@var.genes)
# [1] 1441 - number of genes selected as appropriate for the PCA

ent <- PCA(ent, pc.genes = ent@var.genes, do.print = FALSE)
ent <- ProjectPCA(ent)

ent <- FindClusters(ent, pc.use = 1:12, resolution = 0.6, print.output = 0, save.SNN = T) # we selected 12 dimensions.  Can change.  Can change resolution too
ent <- RunTSNE(ent, dims.use = 1:12, do.fast = T) # use same 12 dimensions.  Can run with do.fast=F too to get prettier but it takes a long time and doesn't change clustering

TSNEPlot(ent, do.label=T)
