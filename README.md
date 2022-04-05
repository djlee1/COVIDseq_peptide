# COVIDseq_to_peptide
A tiny script to convert COVID consensus genome to peptide sequence.

SARS-CoV-2 Reference was taken from [NCBI](https://www.ncbi.nlm.nih.gov/sars-cov-2/)




## Tools
My script consists of these tools. You don't need to download it separately, since these are included in the repo.
|Tools|Version/Links|
|---|---|
|`gffread`|cufflinks-2.2.1 |
|`faTrans`|https://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/faTrans |




## Example usage

    git clone https://github.com/djlee1/COVIDseq_to_peptide.git
    cd COVIDseq_to_peptide
    bash ./convert.sh sample.fasta
    

## Output
|File name|Description|
|---|---|
|`orf/sample.fasta`|Parsed sequences based on SARS-CoV-2 gff3|
|`peptide/sample.fasta`|Amino acid sequences translated from orf/{sample}.fasta |
