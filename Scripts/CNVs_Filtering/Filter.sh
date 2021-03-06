#!/bin/bash

#Filtering with mappability and masked bedfile
for i in $(ls ~/Files/Pablo_Results/Bedfiles/*_bedfile.txt); do
  Filtro=$(echo $i | cut -d '/' -f 8 | cut -d '_' -f 1)
  for j in $(ls ~/Files/Pablo_Results/CNVs_Filtering/*_overlap.txt); do
    name=$(echo $j | cut -d '/' -f 8 | cut -d '.' -f 1)
    ~/Programs/Python-3.8.1/python ~/Programs/TCAG-WGS-CNV-workflow/compare_with_RLCR_definition.py $i $name.txt > $Filtro/"$name"".txt.bm"
    done
  done
