# CoRoT_Explorer
![CoRoT_Explorer](https://github.com/AuditoryVO/CoRoT_Explorer/assets/144262864/ae63f3ef-0b69-4162-908c-bc7835732f85)
CoRoT light curves Dual Binaural/Ambisonics Sonification. 
This prototype provides a method for the auditory exploration of the public IAS CoRoT light curve archive. The seven types of stellar spectra of the Harvard classification (O, B, A, F, G, K, M), are represented associated with the seven musical notes of the C major scale (C, B, A, F, G, D, E). The spectral class and the note associated with each sample appear at the bottom of the graphical interface, facilitating their association. In addition, a constant note (A) is reproduced in octaves mapped to the Morgan-Keenan luminosity class. The amplitude of each note is modulated by the mean flux of its corresponding light curve. An additional Box-fitting Least Squares Periodogram Analysis provides the main period detected in the light curve, which is represented through a tremolo effect. Data: IAS CoRoT public archive.

Acknowledgements

The CoRoT space telescope is a mission of astronomy led by CNES in association with French laboratories (CNRS) and with several international partners (European countries, Brazil).

CONTENTS

- Preprocessing Jupyter notebook: CoRoT-Preprocessing.ipynb
- Sonification Jupyter notebook: CoRoT-Sonification.ipynb
- CSound/Cabbage UI: CoRoT_Dual_Explorer.csd
- Sample images: Coord.png and Lc.png
- UI masks: Init.png and Init2.png
- HRTF files: hrtf-44100-left.dat and hrtf-44100-right.dat
- LICENSE
- README
- requirements.txt
- Evaluation folder:
     Datasets: CoRot_data_edited.csv, CoRoT-stats-Balanced-final-csv, and CoRoT-STELIB-Original_feedback(March-May-2024).xlsx
     Analysis Jupyter notebook: CoRoT_Survey_analysis-Final_ICAD2024.ipynb
     Plotting Jupyter notebook: CoRoT_survey_Plot-Final_ICAD2024.ipynb

CABBAGE/CSOUND INSTALLATION

1- Download and install CSound 6.15 from: https://github.com/csound/csound/releases/tag/6.15.0

2- Download Cabbage from (current version 2.9.0): https://cabbageaudio.com/download/ 

3- Install only Cabbage from the downloaded Cabbage package.

   Warning: Current Cabbage version 2.9.0 allows to optionally install the latest version of CSound. This default option should be unchecked not to overwrite CSound 6.15.
   Latests versions of CSound require additional plugins to work with the image CSound opcodes, so they should not be used.


CoRoT-EXPLORER INSTALLATION

1- Download the data from: http://idoc-corot.ias.u-psud.fr/sitools/client-user/COROT_N2_PUBLIC_DATA/project-index.html

2- Download all the content of this repository into the same folder

3- Install all the dependencies included in the requirements.txt file

4- To reproduce the sonifications:
   - Launch Cabbage, open CoRoT_Dual_Explorer.csd, and press play
   
   Important note: Cabbage 2.9.0 requires CamelCase update via: File/Convert Identifiers to camelCase. Also change manually “PluginID” to “PluginId” to avoid warnings.

   - Run the Jupyter notebook (CoRoT-Sonification.ipynb)
   - Add your path to the downloaded files before running all the cells

Enjoy the sonifications!

Developer system info: Python 3.8.5 - Cabbage 2.5.0 - i7 macOS 10.15.7 - 32 GB - 1536 MB

