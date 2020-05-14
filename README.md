# QuPWM Quantization-based Feature Generation
 The two following feature extraction methods  are based on a well-known biological feature generation methodology, Position Weight Matrix (PWM) method. The classificaton is performed using Support Vector Machine (SVM).
 
### Dataset  
The used data set are already quantized frames extracted using frame length = 100 sample and step=2 sample from three MEG session of  two healthy patient (E001 and E002) and three MEG session of  two epileptic  patient (C001 and C002).
These signal are licensed to National Neural Institute- King Fahad Medical City (NNI-KFMC), Riyadh, Saudi Arabia. 
This data was conducted in accordance with the approval of the Institutional Review Board at KFMC (IRB log number: 15-086, 2015).
For more information, Please contact professor  Saleh Alshebeili at : dsaleh@ksu.edu.sa

### Run the PWM-based features extraction  
1- Download the PWM/PWM_Data_M8.mat dataset of MEG quantized signals from: http://dx.doi.org/10.17632/n9snfr7m59.1
 
2- The script “./PWM/Example_PWM_models.m” shows an example of feature genration using PWM-based method. The generated features are classified using SVM model.

### Run the motif-based PWM (mPWM-based)  features extraction  
1- Download the mPWM/mPWM_Data_M10.mat dataset of MEG quantized signals from: http://dx.doi.org/10.17632/n9snfr7m59.1

2- The script “./mPWM/Example_mPWM_models.m” shows an example of feature genration using mPWM-based method. The generated features are classified using SVM model.

### Citation
If you use “QuPWM” for your research, or incorporate our learning algorithms in your work, please cite:

Chahid, A., Albalawi, F., Alotaiby, T., Al-Hameed, M. H., Alshebeili, S. A., & Laleg-Kirati, T. QuPWM: Feature Extraction Method for Epileptic Spike Classification. IEEE Journal of Biomedical and Health Informatics, 1. https://doi.org/10.1109/JBHI.2020.2972286
