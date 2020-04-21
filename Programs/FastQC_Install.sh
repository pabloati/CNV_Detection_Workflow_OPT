# Download the tool - note that you may need to change the version number
wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.8.zip
# unzip
unzip fastqc_v0.11.8.zip 
# make the tool executable
chmod +x FastQC/fastqc
# add FastQC to the Path
export PATH=$PWD/FastQC:${PATH}
