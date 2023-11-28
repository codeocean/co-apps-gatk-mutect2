[![Code Ocean Logo](images/CO_logo_135x72.png)](http://codeocean.com/product)

<hr>

# GATK - Mutect2

Call somatic SNVs and indels via local assembly of haplotypes

## Input data

In **data** directory, tool searches for the following in this specific path structure,
  
- Alignment
    - Normal
        - normal.bam
        - if indexes (optional) are not provided, the tool will create them for you.
    - Tumor 
        - tumor.bam

- Reference
    - hg38.fa  
    - hg38.fa.fai

- Germline
    - af-only.gnomad.hg38.vcf.gz
    - af-only-gnomad.hg38.vcf.gz.tbi

- Panel of Normals
    - 1000g_pon.hg38.vcf.gz
    - 1000g_pon.hg38.vcf.gz.tbi

## Output

Folder name reflects which comparison was done.

- **normal_tumor**
    - **.vcf.gz**: somatic variants
    - **.vcf.gz.stats**: somatic variants stats
    - **.vcf.gz.tbi**: somatic variants index

## Source 

https://gatk.broadinstitute.org/hc/en-us/articles/360037593851-Mutect2

<hr>

[Code Ocean](https://codeocean.com/) is a cloud-based computational platform that aims to make it easy for researchers to share, discover, and run code.<br /><br />
[![Code Ocean Logo](images/CO_logo_68x36.png)](https://www.codeocean.com)