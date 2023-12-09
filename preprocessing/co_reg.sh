### pre-installed packages: FSL6; https://github.com/NeuroAI-HD/HD-GLIO; 

#INPUTDIR=/hdd3/bran/data/SD_glioma/pre/breast_metastasis/
#INPUTDIR=/hdd3/bran/data/SD_glioma/pre/glioma_HG/
INPUTDIR=/hdd3/bran/data/SD_glioma/pre/Update_2/
#OUTPUTDIR=/hdd3/bran/data/SD_glioma/pre_reg/breast_metastasis/
#OUTPUTDIR=/hdd3/bran/data/SD_glioma/pre_reg/glioma_HG/
# OUTPUTDIR=/hdd3/bran/data/SD_glioma/pre_reg/lung_metastasis/
OUTPUTDIR=/hdd3/bran/data/SD_glioma/pre_reg/Update_2/

mkdir $OUTPUTDIR
for file in ${INPUTDIR}*; do
    mkdir $OUTPUTDIR$(basename "$file")
    echo "$(basename "$file")"
    scp $file"/t1.nii.gz" $OUTPUTDIR$(basename "$file")"/t1.nii.gz"
    flirt -in $file"/flair.nii.gz" -out $OUTPUTDIR$(basename "$file")"/flair.nii.gz" -ref $INPUTDIR$(basename "$file")"/t1.nii.gz" -omat flair_to_t1.mat -interp spline -dof 6
    flirt -in $file"/t1ce.nii.gz" -out $OUTPUTDIR$(basename "$file")"/t1ce.nii.gz" -ref $INPUTDIR$(basename "$file")"/t1.nii.gz" -omat t1ce_to_t1.mat -interp spline -dof 6
    flirt -in $file"/t2.nii.gz" -out $OUTPUTDIR$(basename "$file")"/t2.nii.gz" -ref $INPUTDIR$(basename "$file")"/t1.nii.gz" -omat t2_to_t1.mat -interp spline -dof 6
done


# perform brain extraction using HD-BET (https://github.com/MIC-DKFZ/HD-BET)



