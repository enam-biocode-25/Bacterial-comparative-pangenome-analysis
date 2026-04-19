 **simple pangenomics coding workflow** 

1. **Genome collection**
Collect genome assemblies of multiple strains of the same species.
Input files are usually:
.fna
.fa
.fasta
sometimes GenBank files
Example:
10 to 50 bacterial genomes of Aeromonas caviae or another species
   
2. **Genome quality check**
Check whether genomes are good enough for comparison.
Typical checks:
              -completeness
              -contamination
              -N50
              -genome size
              -number of contigs
**Common tools**:
            -CheckM
            -QUAST
            -BUSCO sometimes

3. **Genome annotation**
Each genome needs annotation before pangenome analysis.
This predicts:
             -CDS
             -rRNA
             -tRNA
             -gene functions
**Common tool**:
              -Prokka
Output files:
         -.gff
         -.gbk
         -.faa
          -.ffn

4. **Pan-genome construction**
Cluster homologous genes across all strains.
This divides genes into groups such as:
                              -core genes = present in all genomes
                              -soft-core genes = present in most genomes
                              -shell genes = moderately distributed
                              -cloud genes = rare genes

Common tools:
            -Roary
            -Panaroo
            -Anvi’o

5. **Core genome alignment**
Align core genes shared by all genomes.
Purpose:
       -build phylogenetic tree
        -compare conserved genomic relationships

6. **Phylogenetic analysis**
Construct a phylogenetic tree from the core genome alignment.
Common tools:
            -IQ-TREE
            -RAxML
            -FastTree
This shows evolutionary relationships among strains.

7. **Accessory genome analysis**
Study genes that vary among strains.
This can help identify:
                    -strain-specific genes
                    -adaptation genes
                    -virulence genes
                    -antimicrobial resistance genes
                    -mobile genetic elements

8. **Pan-genome statistics**

Common analyses:
               -pan-genome accumulation curve
               -core genome curve
               -gene presence/absence matrix
               -gene gain/loss trend

This helps determine whether the pan-genome is:
                                              -open: new genes keep appearing
                                              -closed: gene discovery saturates

9. **Functional analysis**
Annotate gene clusters or unique genes.
Common databases:
               -COG
               -KEGG
               -GO
               -VFDB
               -CARD

10. **Visualization**
             -pan-genome curve
             -core genome curve
             -phylogenetic tree
             -gene presence/absence heatmap
             -accessory gene distribution plots
    
 ** A simple pangenomics workflow diagram**
    
  Genome download
      ↓
Quality assessment (QUAST / CheckM)
      ↓
Genome annotation (Prokka)
      ↓
Pan-genome construction (Panaroo / Roary)
      ↓
Core gene alignment
      ↓
Phylogenetic tree construction (IQ-TREE)
      ↓
Gene presence/absence analysis
      ↓
Pan-genome statistics and visualization
      ↓
Biological interpretation  

