library(phylogram)
library(ape)

tree.dendro = read.tree(text = "
                       (Hominids,
                       (Hominin,
                       (Hominina,
                       (Homo,
                       (Neandertal, Denisovan, Human,
                       (Hybrids))))))
                       ;")
png(filename="fig s1-phylotree.png",
    units="in",
    width=10,
    height=10,
    res=300)
plot(tree.dendro, use.edge.length = FALSE, family = "sans", font=3, ps=12,cex=1.5)
nodelabels("14-12 mya", 9, frame = "r", bg = "beige", adj = 0, family = "sans", font=3, ps=12,cex=1.5)
nodelabels("10-8 mya", 10, frame = "r", bg = "beige", adj = 0, family = "sans", font=3, ps=12,cex=1.5)
nodelabels("8-4 mya", 11, frame = "r", bg = "beige", adj = 0, family = "sans", font=3, ps=12,cex=1.5)
nodelabels("2.5-2 mya", 12, frame = "r", bg = "beige", adj = 0, family = "sans", font=3, ps=12,cex=1.5)
nodelabels("0.8 mya", 13, frame = "r", bg = "beige", adj = 0, family = "sans", font=3, ps=12,cex=1.5)
dev.off()

