#The starting point are fastq flis named like: DH_PE0345_CAACAATG-CTTCACGG_L004_R1_001.fastq.gz DH_PE0345_CAACAATG-CTTCACGG_L004_R2_001.fastq.gz

#Trimming wih Trimmomatic-0.39
for i in $(ls *_R1_001.fastq.gz); do
  name=$(echo $i | cut -d "_" -f 2,3)
  java -jar ~/Programs/Trimmomatic-0.39/trimmomatic-0.39.jar PE -threads 10 -phred33 "DH_""$name""_L004_R1_001.fastq.gz" "DH_""$name""_L004_R2_001.fastqc.gz" "$name""_paired_R1_001.fastq.gz" "$name""_unpaired_R1_001.fastq.gz" "$name""_paired_R2_001.fastq.gz" "$name""_unpaired_R2_001.fastq.gz" LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
  done

#Aligning Paried End reads (PE) to reference genome using BWA mem. (The genome must be indexed prior to the aligment)
for i in $(ls *_paired_R1_001.fastq.gz); do
  name=$(echo $i | cut -d "_" -f 1,2,3,4) ; ID=$(echo $i | cut -d "_" -f 1)
  bwa mem -t 10 -M -R '@RG\tID:NRGENE\tSM:$ID\tPL:PE\tLB:no\tPU:unit1' ~/Maize_RefGen/MaskedDNA/Zea_mays.AGPv4.dna_rm.chromosome.10.fa.gz "$name""_R1_001.fastq.gz" "$name""_R2_001.fastq.gz" > "$ID""_B7v4_PE.sam" 
  done
  
#Aligning Single End Reads (SE) to reference genome using BWA mem. (The genome must be indexed prior to the aligment)
for i in $(ls *_unpaired_*); do
  name=$(echo $i | cut -d "_" -f 1,2,3,4,5) ; ID=$(echo $i | cut -d "_" -f 1)
  bwa mem -t 10 -M -R '@RG\tID:NRGENE\tSM:$ID\tPL:PE\tLB:no\tPU:unit1' ~/Maize_RefGen/MaskedDNA/Zea_mays.AGPv4.dna_rm.chromosome.10.fa.gz "$name""_001.fastq.gz" > "$nombre""B73v4_SE.sam" 
  done
 
#Sort files and convert to bam files PE using Picard Tools
for i in $(ls *PE.sam); do
  name=$(echo $i | cut -d "_" -f 
  java -Xmx20g -XX:ParallelGCThreads=10 -jar Programs/PicardTools/picard.jar SortSam MAX_RECORDS_IN_RAM=2000000 INPUT=PE0346_Ch10_PE.sam OUTPUT="$name""ed.bam" SORT_ORDER=coordinate
