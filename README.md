# scRNA_cell_type

CellO trains a model using cell ontology to assign putative cell types to cells from a seurat object.

https://github.com/deweylab/CellO

https://github.com/satijalab/seurat

# Setup

Copy your seurat files into the *input* directory with extension ".rds"

or use symbolic links

# Run

conda activate your snakemake environment

`snakemake --cores = 4 --use-conda`
