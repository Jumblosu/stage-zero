
#!usr/bin/bash

#Download the DNA. fa file
wget https://raw.githubusercontent.com/HackBio-Internship/wale-home-tasks/main/DNA.fa

# Count the sequence in the DNA. fa file downloaded 
grep -C "^>" DNA.fa

# Write a one-line command in Bash to get the total A, T, G & C counts for all the sequences in the file above
grep -Eo 'A|T|G|C' DNA.fa | sort | uniq -c |awk '{Print $2": "$1}'
 
#Set up a conda environment
wget https://repo.anaconda.com/miniconda/Miniconda3-py37_4.12.0-Linux-x86_64.sh
bash miniconda3-latest-linux-x86_64.sh

#download three software( bwa, seqtk, spades)
 sudo apt-get
conda activate base\
bwa\
fastp\
fastqc\
bbatools
Create a working directory
mkdir workdir && cd $

Create a dataset directory and download datasets
mkdir dataset && cd $
wget https://github.com/josoga2/yt-dataset/blob/main/dataset/raw_reads/ACBarrie_R1.fastq.gz -0 ACBarrie_R1.fastq.gz 
wget https://github.com/josoga2/yt-dataset/blob/main/dataset/raw_reads/ACBarrie_R1_TRIM.fq.gz -0 ACBarrie_R1_TRIM.fq.gz
wget https://github.com/josoga2/yt-dataset/blob/main/dataset/raw_reads/ACBarrie_R2.fastq.gz -0 ACBarrie_R2.fastq.gz 
wget https://github.com/josoga2/yt-dataset/blob/main/dataset/raw_reads/ACBarrie_R2_TRIM.fq.gz -0 ACBarrie_R2_TRIM.fq.gz
wget https://github.com/josoga2/yt-dataset/blob/main/dataset/raw_reads/Alsen_R1.fastq.gz -0 Alsen_R1.fastq.gz  
wget https://github.com/josoga2/yt-dataset/blob/main/dataset/raw_reads/Alsen_R2.fastq.gz -0 Alsen_R2.fastq.gz
wget https://github.com/josoga2/yt-dataset/blob/main/dataset/raw_reads/Baxter_R1.fastq.gz -0 Baxter_R1.fastq.gz
wget https://github.com/josoga2/yt-dataset/blob/main/dataset/raw_reads/Baxter_R2.fastq.gz -0 Baxter_R2.fastq.gz
wget https://github.com/josoga2/yt-dataset/blob/main/dataset/raw_reads/Chara_R1.fastq.gz -0 Chara_R1.fastq.gz
wget https://github.com/josoga2/yt-dataset/blob/main/dataset/raw_reads/Chara_R2.fastq.gz -0 Chara_R2.fastq.gz
wget https://github.com/josoga2/yt-dataset/blob/main/dataset/raw_reads/Drysdale_R1.fastq.gz -0 Drysdale_R1.fastq.gz 
wget https://github.com/josoga2/yt-dataset/blob/main/dataset/raw_reads/Drysdale_R2.fastq.gz -0 Drysdale_R2.fastq.gz


Create an output folder
cd ~/workdir
mkdir ouput

# create an output folder
cd ~/workdir
mkdir output

#perform quality control with fastqc 

# create a QC report under output
QC_DIR-~/workdir/output/QC_Report
mkdir -p $QC_DIR

fastqc ~/workdir/dataset/*.fastq.gz -o $QC_DIR

#trim the reads with low quality
TRIMMED_DIR-~/workdir/output/trimmed_data
DATA_DIR-~/workdir/dataset
mkdir -p $TRIMMED_DIR

samples 

samples- "ACBarrie Alsen Baxter Chara Drysdale"

for sample in $samples;
do

  fastp \
   -i $DATA_DIR/${sample}_R1.fastq.gz \
   -I $DATA_DIR/${sample}_R2.fastq.gz \
   -o $TRIMMED_DIR/${sample}_trimmed_R1.fastq. gz \
   -0 $TRIMMED_DIR/${sample}_trimmed_R2.fastq.gz \
   --html $TRIMMED_DIR/${sample}_fastp.html
done

#perform alignment with bwa

# download the reference genome
REFRENCE_DIR-~/workdir/ref_genome
mkdir $REFERENCE_DIR
cd $REFERENCE_DIR
wget https://github.com/josoga2/yt-dataset/blob/main/dataset/references/reference.fasta

index the reference genome
bwa index $REFERENCE_DIR/reference.fasta

# repair disorderd reads and align
cd ~/workdir
ALIGNMENT_DIR-~/workdir/output/alignment
REPAIRED_DIR-~/workdir/output/repaired
mkdir -p $REPAIRED_DIR
mkdir -p $ALIGNMENT_DIR

for sample in $samples;
do
    repir.sh in1-$TRIMMED-DIR/${sample}_trimmed_R1.fastq.gz in2-$TRIMMED_DIR/${sample}_R2.fastq.gz out1-$REPAIRED_DIR/${sample}_R1_rep.fastq.gz
    out2-$REPAIRED_DIR/${sample}_R2_rep.fastq.gz outsinglo-$REPAIRED_DIR/${sample}_single.fastq
    bwa mem -r  1 \
    $REFERENCE_DIR/reference.fasta \
    $REPAIRED_DIR/${sample}_R1_rep.fastq.gz $REPAIRED_DIR/${sample}_R2_rep.fastq.gz > $ALIGNMENT_DIR/${sample}.sam
done


























































