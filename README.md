# Brain-state-shift

This repository includes information relative to the project: Body mass index-dependent shifts along large-scale gradients in human cortical organization explain dietary regulatory success.
The folder SubjectContrasts includes all participants' contrasts for the Natural (NC=contrast_0001.nii) and Health condition (HC=contrast_0003.nii).
The folder GradientsMaps includes the gradients maps downloaded from the Neurovault repository: https://neurovault.org/collections/1598/ 

Requirements:
- Matlab 2021b (for the GLM, leave-one-subject-out, and permutation test analysis)
- R version 4.2.2 (to plot the main effect and interaction and the slope analysis).
package(plyr)
package(tidyverse) 
package(lme4) 
package(emmeans) 
package(data.table) 
package(ggthemes) 
package(patchwork) 
package(report) 
package(sjPlot) 
package(effectsize)
package(dplyr) 
package(interactions) 
package(performance) 
package(lmerTest)
package(ggplot2)
package(effectsize)
package(effects)
package(ggeffects)
package(interactions)
package(sjPlot)
package(jtools)
