#!/bin/bash

zcat CHr1_7_filtered.vcf.gz |  grep "#"  > header.txt
for i in $(ls *.vcf.gz); do
  name = $(echo $i | cut -d "_" -f 1)
  zcat $i |  grep -v "#" | grep "PASS" > "$name""_7_filtered_PASS.vcf"
  done

for i in $(seq 1 10); do 
  if [ $i -eq 1] ; then
    cat "CHr""$i""_7_filtered_PASS.vcf" > All_filtered_PASS.vcf
  else
    cat filtered_PASS.vcf "CHr""$i""_7_filtered_PASS.vcf" > All_filtered_PASS.vcf
  fi

cat header.txt All_filtered_PASS.vcf > All_filtered_PASS_WH.vcf
