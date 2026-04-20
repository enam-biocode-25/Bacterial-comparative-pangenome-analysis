### R code for presence/absence heatmap

library(pheatmap)

pa <- read.delim("results/panaroo/gene_presence_absence.Rtab",
                 header = TRUE,
                 check.names = FALSE)

rownames(pa) <- pa[, 1]
pa <- pa[, -1]

pa_matrix <- as.matrix(pa)

dir.create("results/figures", showWarnings = FALSE, recursive = TRUE)

pheatmap(pa_matrix,
         cluster_rows = TRUE,
         cluster_cols = TRUE,
         show_rownames = FALSE,
         fontsize_col = 8,
         filename = "results/figures/presence_absence_heatmap.png",
         width = 10,
         height = 8) 



### R code for core vs accessory gene bar plot
gene_pa <- read.csv("results/panaroo/gene_presence_absence.csv", check.names = FALSE)

# Panaroo tables may vary by version, so inspect first
print(colnames(gene_pa))

# Example: count how many genomes contain each gene cluster
genome_cols <- 15:ncol(gene_pa)   # adjust if needed
presence_count <- rowSums(gene_pa[, genome_cols] != "")

total_genomes <- length(genome_cols)

core_genes <- sum(presence_count == total_genomes)
soft_core <- sum(presence_count >= 0.95 * total_genomes & presence_count < total_genomes)
shell_genes <- sum(presence_count >= 0.15 * total_genomes & presence_count < 0.95 * total_genomes)
cloud_genes <- sum(presence_count < 0.15 * total_genomes)

summary_df <- data.frame(
  Category = c("Core", "Soft-core", "Shell", "Cloud"),
  Count = c(core_genes, soft_core, shell_genes, cloud_genes)
)

print(summary_df)

write.csv(summary_df, "results/figures/gene_category_summary.csv", row.names = FALSE)


### R code for a simple bar plot gene categories

library(ggplot2)

df <- read.csv("results/figures/gene_category_summary.csv")

p <- ggplot(df, aes(x = Category, y = Count)) +
  geom_bar(stat = "identity") +
  theme_bw() +
  labs(title = "Pangenome Gene Categories",
       x = "Category",
       y = "Number of gene clusters")

ggsave("results/figures/gene_category_barplot.png", p, width = 7, height = 5, dpi = 300)


### ANI heatmap Script

library(reshape2)
library(pheatmap)

dir.create("results/figures", recursive = TRUE, showWarnings = FALSE)

ani <- read.table("results/ani/ani_output.txt", sep = "\t", header = FALSE,
                  stringsAsFactors = FALSE)
colnames(ani) <- c("query", "reference", "ANI", "fragments_matched", "total_fragments")

ani_mat <- acast(ani, query ~ reference, value.var = "ANI")

# Fill missing diagonal if needed
for (i in intersect(rownames(ani_mat), colnames(ani_mat))) {
  ani_mat[i, i] <- 100
}

pheatmap(ani_mat,
         cluster_rows = TRUE,
         cluster_cols = TRUE,
         display_numbers = FALSE,
         filename = "results/figures/ani_heatmap.png",
         width = 8,
         height = 7)




