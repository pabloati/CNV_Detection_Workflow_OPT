# Here are 5 steps for CNVnator and I done them one by one, when using please remove '#' step by step

# Step1: extracting read mapping from bam/sam files
for i in $(ls ~/Files/Pablo_Results/Filtering/*noSup*.bam); do
  name=$(echo $i | cut -d "/" -f 7| cut -d "." -f 1); echo $name
 # ~/Programs/CNVnator/cnvnator -root "$name"".root" -tree $i &
  #done

# Step2: generate a histogram
#for i in $(ls *root); do
 # ~/Programs/CNVnatorcnvnator -root $i -his 1000 -d ~/Maize_RefGen/MaskedDNA &
 # done

# Step3: calculating statistics
#do ./cnvnator -root $i -stat 1000 &

#done

# Step4: ReadDepth signal partitioning
#do ./cnvnator -root $i -partition 1000 &

#done

# Step5: CNV calling
#do name=$(echo $i | cut -d "." -f1)
#./cnvnator -root $i -call 1000 > "$name""_1000_CNVnator.cnv" &
#done
