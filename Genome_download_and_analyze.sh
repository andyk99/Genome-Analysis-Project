#!/bin/bash

# Define the URLs leading to the sequence databases
declare -A urls
urls["Pseudomonas_aeruginosa"]="https://ftp.ncbi.nlm.nih.gov/genomes/refseq/bacteria/Pseudomonas_aeruginosa/reference/GCF_000006765.1_ASM676v1/GCF_000006765.1_ASM676v1_genomic.fna.gz"
urls["Bacillus_cereus"]="https://ftp.ncbi.nlm.nih.gov/genomes/refseq/bacteria/Bacillus_cereus/representative/GCF_002220285.1_ASM222028v1/GCF_002220285.1_ASM222028v1_genomic.fna.gz"
urls["Staphylococcus_aureus"]="https://ftp.ncbi.nlm.nih.gov/genomes/refseq/bacteria/Staphylococcus_aureus/reference/GCF_000013425.1_ASM1342v1/GCF_000013425.1_ASM1342v1_genomic.fna.gz"

# Create a directory to store the downloaded genomes
mkdir -p genomes
cd genomes

# Process each species
for species in "${!urls[@]}"; do
    echo "Processing $species..." # Inform which species is being analyzed

    # This section will download the genome sequence
    wget -q "${urls[$species]}" -O "$species.fna.gz"
    
    # Unzip the genome sequence file
    gunzip -f "$species.fna.gz"
    
    # Analyzes the genome using awk
    awk '
    BEGIN { FS=""; OFS="\t"; }
    /^>/ { if(seq) print name, a, c, g, t, length(seq); a=c=g=t=0; seq=""; name=$0; next }
    { 
            for(i=1; i<=NF; i++) { 
                    letter=$i; 
                    if(letter=="A") a++; 
                    else if(letter=="C") c++; 
                    else if(letter=="G") g++; 
                    else if(letter=="T") t++; 
                    } 
                seq = seq $0 
            }
    END { print name, a, c, g, t, length(seq) }
    ' "$species.fna" >> ../P2_results.txt
done

cd ..
echo "Results in P2_results.txt"