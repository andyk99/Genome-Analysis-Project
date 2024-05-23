# Genome Analysis Project

This project contains a script for downloading genomic data for several bacterial species from the NCBI database, unzipping the downloaded files, and performing a basic analysis to count the occurrences of each nucleotide (A, C, G, T) in the genome sequences. The results are saved to a text file.

## Files

- `Genome_download_and_analyze.sh`: The main script to download and analyze genome data.
- `Sample_Results.docx`: A document containing sample results from the analysis.

## Description

The `Genome_download_and_analyze.sh` script downloads genomic data for several bacterial species from the NCBI database, unzips the downloaded files, and performs a basic analysis to count the occurrences of each nucleotide (A, C, G, T) in the genome sequences. The results are saved to a text file.

## Usage

### Prerequisites

Make sure you have the following tools installed on your system:

- `wget`
- `gunzip`
- `awk`

### Running the Script

1. Clone the repository or download the script to your local machine.
2. Open a terminal and navigate to the directory containing the script.
3. Run the script using the following command:

   ```sh
   ./Genome_download_and_analyze.sh
