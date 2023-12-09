### pre-installed packages: FSL6; https://github.com/NeuroAI-HD/HD-GLIO; 

#INPUTDIR=/hdd3/bran/data/SD_glioma/pre_reg/breast_metastasis/
#INPUTDIR=/hdd3/bran/data/SD_glioma/pre_reg/glioma_HG/
INPUTDIR=/hdd3/bran/data/SD_glioma/pre_reg/lung_metastasis/
#OUTPUTDIR=/hdd3/bran/data/SD_glioma/pre_reg_res/breast_metastasis/
#OUTPUTDIR=/hdd3/bran/data/SD_glioma/pre_reg_res/glioma_HG/
OUTPUTDIR=/hdd3/bran/data/SD_glioma/pre_reg_res/lung_metastasis/

mkdir $OUTPUTDIR
for file in ${INPUTDIR}*; do
    mkdir $OUTPUTDIR$(basename "$file")
    echo "$(basename "$file")"
    #scp $file"/t1.nii.gz" $OUTPUTDIR$(basename "$file")"/t1.nii.gz"
    ResampleImage 3 $file"/t1.nii.gz" $OUTPUTDIR$(basename "$file")"/t1.nii.gz" 256x256x256 1 2
    ResampleImage 3 $file"/t1ce.nii.gz" $OUTPUTDIR$(basename "$file")"/t1ce.nii.gz" 256x256x256 1 2
    ResampleImage 3 $file"/t2.nii.gz" $OUTPUTDIR$(basename "$file")"/t2.nii.gz" 256x256x256 1 2
    ResampleImage 3 $file"/flair.nii.gz" $OUTPUTDIR$(basename "$file")"/flair.nii.gz" 256x256x256 1 2

done


# perform brain extraction using HD-BET (https://github.com/MIC-DKFZ/HD-BET)



