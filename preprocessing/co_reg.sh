### Co-registration using T1 as a reference
### Pre-installed packages: FSL6;
### The input folder is expected to contain multiple subjects after skull-stripping

INPUTDIR=/your/input/folder/
OUTPUTDIR=/your/output/folder/

mkdir $OUTPUTDIR
for file in ${INPUTDIR}*; do
    mkdir $OUTPUTDIR$(basename "$file")
    echo "$(basename "$file")"
    scp $file"/t1.nii.gz" $OUTPUTDIR$(basename "$file")"/t1.nii.gz"
    flirt -in $file"/flair.nii.gz" -out $OUTPUTDIR$(basename "$file")"/flair.nii.gz" -ref $INPUTDIR$(basename "$file")"/t1.nii.gz" -omat flair_to_t1.mat -interp spline -dof 6
    flirt -in $file"/t1ce.nii.gz" -out $OUTPUTDIR$(basename "$file")"/t1ce.nii.gz" -ref $INPUTDIR$(basename "$file")"/t1.nii.gz" -omat t1ce_to_t1.mat -interp spline -dof 6
    flirt -in $file"/t2.nii.gz" -out $OUTPUTDIR$(basename "$file")"/t2.nii.gz" -ref $INPUTDIR$(basename "$file")"/t1.nii.gz" -omat t2_to_t1.mat -interp spline -dof 6
done
