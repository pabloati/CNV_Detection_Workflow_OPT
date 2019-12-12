#!/bin/bash

#Extracting overlaping k-mer subsequences as read sequences
~/Programs/Seqbility/splitfa.c ~/Maize_RefGen/UnmaskedDNA/Zea_mays.AGPv4.dna.toplevel.fa | split -l 20000000

#Aligning reads to the genome
bwa aln -R 1000000 -O 3 -E 3 Zea_mays.AGPv4.dna.toplevel.fa ??????

#Generate rawMask
gzip -dc ?? | ~/Programs/Seqbility/gen_raw_mask.pl > rawMask_35.fa

#Generating the final mask
~/Programs/Seqbility/gen_mask.c -l 35 -r 0.5 rawMask_35.fa > mask_35_50.fa

~/Programs/Seqbility/apply_mask_s.c mask_35_50.fa ~/Maize_RefGen/UnmaskedDNA/Zea_mays.AGPv4.dna.toplevel.fa > genome.mask.fa

~/Programs/Seqbility/apply_mask_l.c mask_35_50.fa in.list > out.list 
