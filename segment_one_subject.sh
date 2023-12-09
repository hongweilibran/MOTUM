#This script use a container to do automated tumor segmention of multi-contrast MRI images
#It operates on an input folder (one subject) that contains four MRI images 
# cpu or GPU can be used. Details as follows:  
#######################################
## set your input folder containing four Nifty files, with the following structure: 
## /mnt/my_experiments/
##                    /flair.nii.gz
##                    /t1.nii.gz
##                    /t1ce.nii.gz
##                    /t2.nii.gz
## after running, we will create two segmentation masks in the output folder with the following structure: 
## /mnt/my_experiments_masks/                   
##                          /flair_seg_label1.nii.gz
##                          /t1ce_seg_label2.nii.gz

########################################
INPUT_FOLDER=/your/subject/folder
OUTPUT_FOLDER=/your/output/segmentation/folder
########################################
## create the output folder if it is not there 
mkdir $OUTPUT_FOLDER

CONTAINERID=` docker run -dit --gpus all -e NVIDIA_DISABLE_REQUIRE=True \
        -v $INPUT_FOLDER:/app/input:ro  \
        --env 'nnUNet_raw=/app/nnUNet_raw' \
        --env 'nnUNet_preprocessed=/app/nnUNet_preprocessed' \
        --env 'nnUNet_results=/app/nnUNet_results' branhongweili/motum_seg `

##pre-processing the image names to include _0000 so that it meets nn-unet input format
docker exec -t $CONTAINERID python3 pre.py

##segmentation with a pre-trained 3d u-net
export OMP_NUM_THREADS=1
export nnUNet_n_proc_DA=1
## segment label 1
docker exec -t $CONTAINERID nnUNetv2_predict -i /app/input_pre -o /output -d 005 -c 2d -f all -device cpu
## copy the two outputs to your local machine. 
docker cp $CONTAINERID:/output/seg.nii.gz ${OUTPUT_FOLDER}/flair_seg_label1.nii.gz
## segment label 2
docker exec -t $CONTAINERID nnUNetv2_predict -i /app/input_pre -o /output -d 006 -c 2d -f all -device cpu
## copy the two outputs to your local machine. 
docker cp $CONTAINERID:/output/seg.nii.gz ${OUTPUT_FOLDER}/t1ce_seg_label2.nii.gz
