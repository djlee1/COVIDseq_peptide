# COVIDseq_peptide
Convert consensus genome to peptide sequence

### ORF parsing consensus genome (based on reference GFF3)

```bash
gffread -w sample.orf.fasta -g sample.fasta Ref/NC_045512.2.gff3
```

### faTrans
(https://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/faTrans)
```bash
awk '{ if ($1~">") gsub(" ", ";"); print $0}' sample.orf.fasta > sample.orf.fasta
faTrans sample.orf.fasta sample.orf.pep
```
