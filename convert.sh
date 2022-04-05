# !/bin/bash
# Convert consensus genome to peptide sequence.
# Author : Dongjoo Lee(ehdwn8242@snu.ac.kr)

# Setting

gffread='tools/gffread'
faTrans='tools/faTrans'
Ref='Ref/NC_045512.2.gff3'




# 1. Input
[ $# -ne 1 ] && { echo -e "\nUsage : bash $0 <consensus.genome.fasta> \n"; exit 1; }

fa=$1
name=`basename -s ".fasta" $fa`

[ ! -f $fa ] && { echo "Fasta file absent"; exit 1; }
[ ! -f ${fa}.fai ] && { echo "Fasta index file absent"; exit 1; }


# 2. gffread
[ ! -d orf ] && { mkdir orf; }
[ ! -f $gffread ] && { echo "gffread package absent"; exit 1; }


${gffread} -w orf/${name}.tmp -g ${fa} ${Ref}

[ -f orf/${name}.tmp ] && { awk '{ if ($1~">") gsub(" ", ";"); print $0}' orf/${name}.tmp > orf/${name}.fasta; rm orf/${name}.tmp; }



# 3. faTrans 
[ ! -d peptide ] && { mkdir peptide; }
$faTrans orf/${name}.fasta peptide/${name}.fasta

echo -e "\nPeptide sequence converted : ${name} \n"; exit 0;

