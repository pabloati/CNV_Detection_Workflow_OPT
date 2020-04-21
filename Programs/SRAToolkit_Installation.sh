# download the gzip file
wget https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/2.9.1-1/sratoolkit.2.9.1-1-centos_linux64.tar.gz
# unzip the file
tar -xzvf sratoolkit.2.9.1-1-centos_linux64.tar.gz
# add the 'bin' directory to the PATH - note the you will need to do this
# everytime you start a new terminal and wish to use the toolkit
export PATH=$PWD/sratoolkit.2.9.1-1-centos_linux64/bin/:${PATH}
# create a directory to which to download the sra files
mkdir sraDir
# use the vdb-config tool to set the download directory
vdb-config -i # this pops up an interactive window instructions below
