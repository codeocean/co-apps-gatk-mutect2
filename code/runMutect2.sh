#!/usr/bin/env bash

set -ex

source ./config.sh

export PATH=$PATH:/opt/gatk-4.4.0.0/

if [ "$reference_count" -eq 1 ] && [ "$alignment_count" -gt 0 ];
then

    cp $reference_file ../scratch
    cp $reference_index ../scratch
    
    echo "Number of References : $reference_count"
    echo "Number of Alignment Files Found : $alignment_count"

    reference_prefix=$(basename -s .fa $reference_file)

    # Creating Dictionary
    samtools dict \
    -o ../scratch/${reference_prefix}.dict \
    $reference_file

    for file in $alignment_files;
    do
        
        prefix=$(basename -s .bam $file)
        dir_prefix=$(basename $(dirname $file))

        mkdir -p ../scratch/$dir_prefix

        # Rename Headers
        samtools addreplacerg \
        -r '@RG\tID:'"$prefix"'\tSM:'"$prefix"'' \
        -o ../scratch/${dir_prefix}/${prefix}.bam \
        $file 

        # Indexing of Coordinate Sorted Bam.
        samtools index \
        -@ $num_thread \
        -o ../scratch/$dir_prefix/${prefix}.bam.bai \
        ../scratch/$dir_prefix/${prefix}.bam 

    done

    control_file=$(find -L ../scratch/Normal -name "*.bam")
    control_name=$(basename -s .bam $control_file)
    case_file=$(find -L ../scratch/Tumor -name "*.bam")
    case_name=$(basename -s .bam $case_file)
        
    mkdir -p ../results/${control_name}_${case_name}

    # Mutect2
    gatk Mutect2 \
    -R ../scratch/${reference_prefix}.fa \
    -I $case_file \
    -I $control_file \
    -normal $control_name \
    --native-pair-hmm-threads $num_thread \
    --germline-resource $germline_files \
    --panel-of-normals $pon_files \
    -O ../results/${control_name}_${case_name}/somatic.vcf.gz
        
else
    echo "Found more than 1 reference or 0 alignment files (.bam)"
fi