# Brain-state-shift

This repository includes information relative to the project: Body mass index-dependent shifts along large-scale gradients in human cortical organization explain dietary regulatory success.
The folder SubjectContrasts includes all participants' contrasts for the Natural (NC=contrast_0001.nii) and Health conditions (HC=contrast_0003.nii).
The folder GradientsMaps includes the gradients maps downloaded from the Neurovault repository: https://neurovault.org/collections/1598/.
The folder Univariate Analysis includes the results of the univariate analysis conducted with SPM (the t-test modulated by RS).
Data.csv includes the summary data used to perform the analysis. The variable names are explained in the file Data_Variable.txt
Finally, the file "GLM_LOSO_Permutation.m" corresponds to the main analysis script and the GLM_analysis.html corresponds to the output of the Rstat report to plot the main effect, interaction and perform the slope analysis.

Requirements:
- Matlab 2021b (for the GLM, leave-one-subject-out, and permutation test analysis)
- R version 4.2.2 (to plot the main effect and interaction and the slope analysis).
package(plyr);
package(tidyverse);
package(lme4);
package(emmeans);
package(data.table); 
package(ggthemes); 
package(patchwork); 
package(report); 
package(sjPlot); 
package(effectsize);
package(dplyr); 
package(interactions); 
package(performance); 
package(lmerTest);
package(ggplot2);
package(effectsize);
package(effects);
package(ggeffects);
package(interactions);
package(sjPlot);
package(jtools);
