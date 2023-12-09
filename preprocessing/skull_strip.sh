### pre-installed packages: https://github.com/NeuroAI-HD/HD-GLIO; 

INPUTDIR=/your/input/folder/
OUTPUTDIR=/your/output/folder/

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



