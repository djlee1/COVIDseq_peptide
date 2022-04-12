# !/bin/bash
# Convert consensus genome to peptide sequence.
# Author : Dongjoo Lee(ehdwn8242@snu.ac.kr)

# Setting

gffread='tools/gffread'
faTrans='tools/faTrans'
Ref='Ref/NC_045512.2.gff3'




# 1. Input
[ $# -ne 2 ] && { echo -e "\nUsage : bash $0 <consensus.genome.fasta> <output.dir>\n"; exit 1; }

fa=$1
outdir=$2
name=`basename -s ".fasta" $fa`

[ ! -f $fa ] && { echo "Fasta file absent"; exit 1; }
#[ ! -f ${fa}.fai ] && { echo "Fasta index file absent"; exit 1; }

[ ! -d ${outdir} ] && { echo "Output directory absent"; exit 1; }


# 2. gffread
[ ! -d ${outdir}/orf ] && { mkdir ${outdir}/orf; }
[ ! -f $gffread ] && { echo "gffread package absent"; exit 1; }


${gffread} -w ${outdir}/orf/${name}.tmp -g ${fa} ${Ref}

[ -f ${outdir}/orf/${name}.tmp ] && { awk '{ if ($1~">") gsub(" ", ";"); print $0}' ${outdir}/orf/${name}.tmp > ${outdir}/orf/${name}.fasta; rm ${outdir}/orf/${name}.tmp; }



# 3. faTrans 
[ ! -d ${outdir}/peptide ] && { mkdir ${outdir}/peptide; }
$faTrans ${outdir}/orf/${name}.fasta ${outdir}/peptide/${name}.fasta

echo -e "\nPeptide sequence converted : ${name} \n"; exit 0;

