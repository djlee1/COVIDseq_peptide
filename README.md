# COVIDseq_peptide
Convert consensus genome to peptide sequence

### ORF parsing consensus genome (based on reference GFF3)

```bash
gffread -w pepetide/sample.orf.fasta -g sample.fasta Ref/NC_045512.2.gff3
```

### faTrans
(https://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/faTrans)
```bash
awk '{ if ($1~">") gsub(" ", ";"); print $0}' pepetide/sample.orf.fasta > pepetide/sample.orf.fasta
faTrans pepetide/sample.orf.fasta pepetide/sample.orf.pep
```
