#!/usr/bin/bash
firstname="Olajumoke"
lastname="Oladosu"

# Print the first name and last name on the same line
echo $firstname $lastname

# Print the first name and last name on differente line
echo $firstname
echo $lastname
 # step1 create a directory named team_newton
mkdir olajumoke

# step2 create another directory named biocomputing
mkdir biocomputing && cd $_

# step3 download the three files
wget https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.fna
wget https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.gbk
wget https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.gbk

# step4 move the .fna file to the folder team_newton
mv wildtype.fna ../olajumoke


# step5 delete the duplicated file
rm wildtype.gbk.1

# step6 confirm if the file is mutant or wildtype
grep "tatatata" ../olajumoke/wildtype.fna

# step7 print all the line
grep "tatatata" ../olajumoke/wildtype.fna> mutant.txt

# step8 clear terminal and print all command used today
clear && History

# step9 list the files in the two folders
ls ../olajumoke ../biocomputing 

# bash story two

# step1 graphical representation

# download the figlet command
sudo apt-get install figlet
figlet  "olajumoke oladosu"

# step3 create a folder named compare in our home directory
cd ..
mkdir compare

# step 4 download the file
cd compare
wget https://www.bioinformatics.babraham.ac.uk/training/Introduction%20to%20Unix/unix_intro_data.tar.gz

# unzip the file
gunzip unix_intro_data.tar.gz

# untar the file
tar -xvf unix_intro_data.tar

# identify the rRNAs present in Mito.dat
cd  "seqmonk_genomes/Saccharomyces cerevisiae/EF4"
grep "rRNA" Mito.dat

# copy Mito.dat to compare
cp Mito.dat ../compare/

# f-i  change Miito to Mitochondrion in the ID and AC header lines
nano Mito.dat

# f-ii save the file using ctrl +s and exit with ctrl + x

# f-iii rename Mito.dat to Mitochondrion
cp Mito.dat Mitochondrion.txt

# step4 move to compare and cd to FastQ_Data directory
cd ../compare/
cd FastQ_Data

# calculate the total number of lines in lane8_DD_P4_TTAGGC_L008_R1.fastq.gz
cat lane8_DD_P4_TTAGGC_L008_R1.fastq.gz wc -1

#Print the total number of lines in all fastq.gz files and save it as a new file.
cat *. fastq.qz wc -1 > number_of_lines.txt
cp




