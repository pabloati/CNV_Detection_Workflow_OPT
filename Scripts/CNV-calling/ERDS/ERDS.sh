#!/bin/bash
#Creating snps variant file
for i in $(ls ~/Files/Pablo_Results/Filtering/*noSup*.bam); do
  name=$(echo $i | cut -d "/" -f 8 | cut -d "_" -f 1,2,3)
  ~/Programs/bcftools/bcftools mpileup -f ~/Maize_RefGen/MaskedDNA/Zea_mays.AGPv4.dna_rm.toplevel.fa $i | ~/Programs/bcftools/bcftools call -mv -Ob -o "$name""All_filtered_noHet_PASS_WH.vcf"
  done

# CNV calling with ERDS. Is necessary to have a bam file with no supplementary reads

for i in $(ls ~/Files/Pablo_Results/Filtering/*noSup*.bam); do
  name=$(echo $i | cut -d "/" -f 8 | cut -d "_" -f 1,2,3) 
  perl ~/Programs/ERDS_mod/src/erds_pipeline.pl -o "$name""_ERDS_out_maize" -b $i -v "$name""All_filtered_noHet_PASS_WH.vcf" -r ~/Maize_RefGen/MaskedDNA/Zea_mays.AGPv4.dna_rm.toplevel.fa -n SM  
  done
