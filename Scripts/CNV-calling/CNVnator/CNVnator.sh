#!/bin/bash
# Here are 5 steps for CNVnator and I done them one by one, when using please remove '#' step by step

# Step1: extracting read mapping from bam/sam files
for i in $(ls ~/Files/Pablo_Results/Filtering/*noSup*.bam); do
  name=$(echo $i | cut -d "/" -f 8| cut -d "." -f 1)
  ~/Programs/CNVnator/cnvnator -root "$name"".root" -tree $i 
  done

# Step2: generate a histogram
for i in $(ls *root); do
  ~/Programs/CNVnator/cnvnator -root $i -his 1000 -d ~/Maize_RefGen/MaskedDNA/Zea_mays.AGPv4.dna_rm.toplevel.fa 
 
# Step3: calculating statistics
  ~/Programs/CNVnator/cnvnator -root $i -stat 1000 

# Step4: ReadDepth signal partitioning
  ~/Programs/CNVnator/cnvnator -root $i -partition 1000 

# Step5: CNV calling
name=$(echo $i | cut -d "." -f 1)
  ~/Programs/CNVnator/cnvnator -root $i -call 1000 > "$name""_1000_CNVnator.cnv" 
  done

#Conversion of .cnv file to common format 
for i in $(ls *.cnv); do 
  name=$(echo $i | cut -d '_' -f 1,3)
  python /data/home/ge97xak/Programs/TCAG-WGS-CNV-workflow/convert_CNV_calls_to_common_format.py $i CNVnator > "$name""_1000_comformat_CNVnator.txt"
  done
