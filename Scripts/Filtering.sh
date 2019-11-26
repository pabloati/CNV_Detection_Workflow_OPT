# Removal of suplementary reads
for i in $(ls *_indelrealigned.bam); do
name=$(echo i| cut -d '.' -f1)
samtools view -h -F 0x800 $i > "$name""_noSup.bam" 
done 

# Insert size 150-800 filter
for i in $(ls *_noSup.bam); do
  name=$(echo $i | cut -d '_' -f 1)
  samtools view -h $i | perl samparser.sh -e 50 --mm 2 50 --insert 150 800 -i - | samtools view -Sb - > "$name""_noSup_800_filtered.bam"
  done

# Insert size 150-10k filter
for i in $(ls *_noSup.bam); do
  name=$(echo $i | cut -d '_' -f 1)
  samtools view -h $i | perl samparser.sh -e 50 --mm 2 50 --insert 150 800 -i - | samtools view -Sb - > "$name""_noSup_10k_filtered.bam"
  done
