
#!/bin/bash
#$ -N filterspadesPA14
#$ -q free64,pub64,bio
#$ -m e

## Use trimmomatic to quality filter sequencing reads

module load trimmomatic/0.35

# cd into the directory with raw sequencing reads

cd /bio/tgallagh/GenomicsTutorial/data/raw/

#make a new directory to put all the quality filtered reads
mkdir /bio/tgallagh/GenomicsTutorial/processed/qualityfiltered/
# make variable with path to output directory
$TRIMMED=/bio/tgallagh/GenomicsTutorial/processed/qualityfiltered

java -jar /data/apps/trimmomatic/0.35/trimmomatic-0.35.jar PE -phed33 PA14_Dorrestein.read1.fastq PA14_Dorrestein.read2.fastq  $TRIMMED\PA14_Dorrestein.paired.read1.fastq $TRIMMED\PA14_Dorrestein.unpaired.read1.fastq $TRIMMED\PA14_Dorrestein.paired.read2.fastq $TRIMMED\PA14_Dorrestein.read2.fastq  ILLUMINACLIP:/bio/tgallagh/alladaptors.fa:2:30:10 LEADING:25 TRAILING:25 SLIDINGWINDOW:4:20 MINLEN:50

java -jar /data/apps/trimmomatic/0.35/trimmomatic-0.35.jar PE -phred33  PA14_Hochbaum.read1.fastq   PA14_Hochbaum.read2.fastq  $TRIMMED\PA14_Hochbaum.paired.read1.fastq $TRIMMED\PA14_Hochbaum.unpaired.read1.fastq $TRIMMED\PA14_Hochbaum.paired.read2.fastq $TRIMMED\PA14_Hochbaum.unpaired.read2.fastq  ILLUMINACLIP:/bio/tgallagh/alladaptors.fa:2:30:10 LEADING:25 TRAILING:25 SLIDINGWINDOW:4:20 MINLEN:50

java -jar /data/apps/trimmomatic/0.35/trimmomatic-0.35.jar PE -phred33 PA14_Siryaporn.read1.fastq PA14_Siryaporn.read2.fastq $TRIMMED\PA14_Siryaporn.paired.read1.fastq $TRIMMED\PA14_Siryaporn.unpaired.read1.fastq $TRIMMED\PA14_Siryaporn.paired.read2.fastq $TRIMMED\PA14_Siryaporn.unpaired.read2.fastq  ILLUMINACLIP:/bio/tgallagh/alladaptors.fa:2:30:10 LEADING:25 TRAILING:25 SLIDINGWINDOW:4:20 MINLEN:50

java -jar /data/apps/trimmomatic/0.35/trimmomatic-0.35.jar PE -phred33 PAnmFLR01_S10_L001_R1_001.fastq PAnmFLR01_S10_L001_R2_001.fastq $TRIMMED\PAnmFLR01.paired.read1.fastq $TRIMMED\PAnmFLR01.unpaired.read1.fastq $TRIMMED\PAnmFLR01.paired.read2.fastq $TRIMMED\$TRIMMED\PAnmFLR01.unpaired.read2.fastq  ILLUMINACLIP:/bio/tgallagh/alladaptors.fa:2:30:10 LEADING:25 TRAILING:25 SLIDINGWINDOW:4:20 MINLEN:50

# assemble the quality filtered reads with SPAdes
module load SPAdes/3.8.2

mkdir /bio/tgallagh/GenomicsTutorial/data/processed/spades/
$SPADES=/bio/tgallagh/GenomicsTutorial/data/processed/spades/

spades.py --pe1-1  $TRIMMED\PA14_Dorrestein.paired.read1.fastq --pe1-2 $TRIMMED\PA14_Dorrestein.paired.read2.fastq -o $SPADES\PA14_Dorrestein

spades.py --pe1-1  $TRIMMED\PA14_Hochbaum.paired.read1.fastq --pe1-2 $TRIMMED\PA14_Hochbaum.paired.read2.fastq -o $SPADES\PA14_Hochbaum
spades.py --pe1-1  $TRIMMED\PA14_Siryaporn.paired.read1.fastq --pe1-2 $TRIMMED\PA14_Siryaporn.paired.read2.fastq -o $SPADES\PA14_Siryaporn
spades.py --pe1-1  $TRIMMED\PAnmFLR01.paired.read1.fastq --pe1-2 $TRIMMED\PAnmFLR01.paired.read2.fastq  -o $SPADES\PAnmFLR01
