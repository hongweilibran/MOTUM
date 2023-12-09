### pre-installed packages: FSL6; https://github.com/NeuroAI-HD/HD-GLIO; 


#INPUTDIR=/hdd3/bran/data/SD_glioma/orig/breast_metastasis/
#INPUTDIR=/hdd3/bran/data/SD_glioma/orig/glioma_HG/
# INPUTDIR=/hdd3/bran/data/SD_glioma/orig/lung_metastasis/
INPUTDIR=/hdd3/bran/data/SD_glioma/orig/Update_2/
#OUTPUTDIR=/hdd3/bran/data/SD_glioma/pre/breast_metastasis/
#OUTPUTDIR=/hdd3/bran/data/SD_glioma/pre/glioma_HG/
# OUTPUTDIR=/hdd3/bran/data/SD_glioma/pre/lung_metastasis/
OUTPUTDIR=/hdd3/bran/data/SD_glioma/pre/Update_2/

for file in ${INPUTDIR}*; do
    mkdir $OUTPUTDIR$(basename "$file")
    echo "$(basename "$file")"
    hd-bet -i $file"/flair.nii.gz" -o $OUTPUTDIR$(basename "$file")"/flair.nii.gz"
    hd-bet -i $file"/t1.nii.gz" -o $OUTPUTDIR$(basename "$file")"/t1.nii.gz"
    hd-bet -i $file"/t1ce.nii.gz" -o $OUTPUTDIR$(basename "$file")"/t1ce.nii.gz"
    hd-bet -i $file"/t2.nii.gz" -o $OUTPUTDIR$(basename "$file")"/t2.nii.gz"
    #whatever you need with "$file"
done


# perform brain extraction using HD-BET (https://github.com/MIC-DKFZ/HD-BET)



