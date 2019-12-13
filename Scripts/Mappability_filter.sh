#!/bin/bash

#Extracting overlaping k-mer subsequences as read sequences
~/Programs/Seqbility/splitfa ~/Maize_RefGen/UnmaskedDNA/Zea_mays.AGPv4.dna.toplevel.fa 35 > Splitted.fa 

#Aligning reads to the genome
bwa aln -R 1000000 -O 3 -E 3 ~/Maize_RefGen/UnmaskedDNA/Zea_mays.AGPv4.dna.toplevel.fa Splitted.fa > B73v4.sai

#Coverting .sai into .sam
bwa samse ~/Maize_RefGen/UnmaskedDNA/Zea_mays.AGPv4.dna.toplevel.fa B73v4.sai > B73v4.sam

#Generate rawMask
~/Programs/Seqbility/gen_raw_mask.pl B73v4.sam > rawMask_35.fa

#Generating the final mask
~/Programs/Seqbility/gen_mask -l 35 -r 0.5 rawMask_35.fa > mask_35_50.fa

~/Programs/Seqbility/apply_mask_s mask_35_50.fa ~/Maize_RefGen/UnmaskedDNA/Zea_mays.AGPv4.dna.toplevel.fa > genome.mask.fa

~/Programs/Seqbility/apply_mask_l mask_35_50.fa in.list > out.list 
