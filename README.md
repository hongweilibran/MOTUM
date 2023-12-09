<img src="logo_motum.png" width="200">
This repository serves as the official source for the MOTUM dataset, a sustained effort to make a diverse collection of brain tumor MRI scans from multiple centers and origins publicly available, along with corresponding clinical non-imaging data, for research utilization.


### Download 
The latest dataset can be downloaded from the **[Harvard Dataverse repository](https://doi.org/10.7910/DVN/KUUEWC)**. 


### Data format
The patients are grouped into several tumor categories based on their origins. 
Each patient for any tumor category has the same naming format, such as  

  001-Glioma-AYEY

        |  flair.nii.gz

        |  t1.nii.gz

        |  t2.nii.gz

        |  t1ce.nii.gz

        |  flair_seg_label1.nii.gz

        |  t1ce_seg_label2.nii.gz
   
In this case, *001-Glioma-AYEY* is the general patient ID, *001* is the patient number, *Glioma* is the tumor category, *AYEY* is the center ID, *flair_seg_label1* is the segmentation mask of Label 1 derived from the FLAIR sequence, and *t1ce_seg_label2* is the segmentation mask of Label 2 derived from the T1-ce sequence. 

