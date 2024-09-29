function subm_fetch_data

%%%%%%
%%%%%%
%%Data handling
%%%%%%
%%%%%%

% %Fit to (training data)
% (1) coculture, high FE, wildtype, 10^6, 
% (2) coculture, low FE, wildtype, 
% (3) coculture, high FE, mutant, 

% 
% %validate against (testing data)
% (1) coculture, high FE, wildtype, 10^7 (extrapolation)
% (1) coculture, high FE, wildtype, 10^5, (extrapolation)

%%%%%%
%% coculture, high FE, wildtype, 10^6, 
%%%%%%
%Exp 1A-1D
global CO_LAC_WT_HFE_6_1_T; global CO_LAC_WT_HFE_6_1_S; global CO_LAC_WT_HFE_6_1_E
global CO_LAC_WT_HFE_6_1_TOT; global CO_LAC_WT_HFE_6_1_TOT_T

%%%%%%
%% coculture, high FE, wildtype, 10^7 2 figures
%%%%%%
%Exp 1E
global CO_LAC_WT_HFE_7_1_T; global CO_LAC_WT_HFE_7_1_S; global CO_LAC_WT_HFE_7_1_E;
global CO_LAC_WT_HFE_7_1_TOT_T; global CO_LAC_WT_HFE_7_1_TOT;
%Exp 1F
global CO_LAC_WT_HFE_7_2_T; global CO_LAC_WT_HFE_7_2_S; global CO_LAC_WT_HFE_7_2_E;
global CO_LAC_WT_HFE_7_2_TOT_T; global CO_LAC_WT_HFE_7_2_TOT;

%%%%%%
%% coculture, high FE, wildtype, 10^5 2 figures
%%%%%%
%Exp 1G-1H
global CO_LAC_WT_HFE_5_1_T; global CO_LAC_WT_HFE_5_1_S; global CO_LAC_WT_HFE_5_1_E;
global CO_LAC_WT_HFE_5_1_TOT_T; global CO_LAC_WT_HFE_5_1_TOT;


%%%%%%
%% coculture, low FE, wildtype, 7 figures
%%%%%%
%Exp 2A-2D
global CO_LAC_WT_LFE_6_1_T; global CO_LAC_WT_LFE_6_1_S; global CO_LAC_WT_LFE_6_1_E; 
global CO_LAC_WT_LFE_6_1_TOT; global CO_LAC_WT_LFE_6_1_TOT_T

%Exp 2E
global CO_LAC_WT_LFE_6_2_T; global CO_LAC_WT_LFE_6_2_S; global CO_LAC_WT_LFE_6_2_E
global CO_LAC_WT_LFE_6_2_TOT; global CO_LAC_WT_LFE_6_2_TOT_T
 
%%%%%%
%% coculture, high FE, mutant, 7 figures
%%%%%%
%Exp 3A-3C
global CO_LAC_MU_HFE_6_1_T; global CO_LAC_MU_HFE_6_1_S; global CO_LAC_MU_HFE_6_1_E
global CO_LAC_MU_HFE_6_1_TOT; global CO_LAC_MU_HFE_6_1_TOT_T



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Importing data Details in Readme.txt
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Naming notation for data files:
% name is composed of 7 strings delinated by underscores
% type of culture: CO/S/E (coculture/Salmonella solo/E coli solo)
% type of media: LAC/GLU (lactose/glucose)
% genetics: MU/WT (nutant/wildtype) NOTE: cirA or col mutants equivalent in current model formulation
% iron: HFE/LFE (high/low iron)
% Initial population size: 5/6/7 (10^ as initial popualtion size; always the same for the coculture experiments)
% series number 1/2 (series for each separate time-sampling schedule)
% type of data: T/S/E  (time/Salmonella/E coli)


%Each observation is followed by a standard deviation.

% Active Colicin Co-Cultures of Salmonella and E.coli
% No iron limitation, 10^6 initial OD
% experiments 1A-1D
CO_LAC_WT_HFE_6_1_T=xlsread('subm_Experiment_data.xlsx','ColicinCo','B21:B25'); % 5 timepoints
CO_LAC_WT_HFE_6_1_S=[xlsread('subm_Experiment_data.xlsx','ColicinCo','C21:J25')] ; %Salmonella 4x experiments
CO_LAC_WT_HFE_6_1_E=[xlsread('subm_Experiment_data.xlsx','ColicinCo','C30:J34')] ; %E. coli 4x experiments
 
 
% Active Colicin Co-Cultures of Salmonella and E.coli
% No iron limitation, 10^7 initial OD
% experiment 1E (4 timepoints), experiment 1F (2 timepoints)
CO_LAC_WT_HFE_7_1_T=xlsread('subm_Experiment_data.xlsx','ColicinCo','B53:B56');  % 4 timepoints
CO_LAC_WT_HFE_7_1_S=xlsread('subm_Experiment_data.xlsx','ColicinCo','C53:D56');  %Salmonella 1x experiment
CO_LAC_WT_HFE_7_1_E=xlsread('subm_Experiment_data.xlsx','ColicinCo','C60:D63'); %E. coli 1x experiment

CO_LAC_WT_HFE_7_2_T=xlsread('subm_Experiment_data.xlsx','ColicinCo','F53:F54'); % 2 timepoints
CO_LAC_WT_HFE_7_2_S=xlsread('subm_Experiment_data.xlsx','ColicinCo','G53:H54'); %Salmonella 1x experiment
CO_LAC_WT_HFE_7_2_E=xlsread('subm_Experiment_data.xlsx','ColicinCo','G60:H61'); %E. coli 1x experiment

% Active Colicin Co-Cultures of Salmonella and E.coli
% No iron limitation, 10^5 initial OD
% Dataset 4, Exp 1G-1H
CO_LAC_WT_HFE_5_1_T=xlsread('subm_Experiment_data.xlsx','ColicinCo','B81:B82'); %2 timepoints
CO_LAC_WT_HFE_5_1_S=xlsread('subm_Experiment_data.xlsx','ColicinCo','C81:F82'); %Salmonella 2x experiments 
CO_LAC_WT_HFE_5_1_E=xlsread('subm_Experiment_data.xlsx','ColicinCo','C88:F89'); %E. coli 2x experiments 



% Active Colicin Co-Cultures of Salmonella and E.coli
% Iron limitation, 10^6 initial OD
% experiments 2A-2E: (2A-2D are  2 timepoints, 2E is 4 timepoints)
CO_LAC_WT_LFE_6_1_T=xlsread('subm_Experiment_data.xlsx','ColicinCo','B109:B110'); %2 timepoints
CO_LAC_WT_LFE_6_1_S=xlsread('subm_Experiment_data.xlsx','ColicinCo','C109:J110'); %Salmonella 4x experiments 
CO_LAC_WT_LFE_6_1_E=xlsread('subm_Experiment_data.xlsx','ColicinCo','C117:J118'); %E. coli 5x experiments 

CO_LAC_WT_LFE_6_2_T=xlsread('subm_Experiment_data.xlsx','ColicinCo','L109:L112');  %4 timepoints
CO_LAC_WT_LFE_6_2_S=xlsread('subm_Experiment_data.xlsx','ColicinCo','M109:O112'); %Salmonella 2x experiments 
CO_LAC_WT_LFE_6_2_E=xlsread('subm_Experiment_data.xlsx','ColicinCo','M117:O120'); %E. coli 2x experiments 




% Inactive Colicin Co-Cultures of Salmonella and E.coli
% No iron limitation, 10^6 initial OD
% exp 3A-3C
CO_LAC_MU_HFE_6_1_T=xlsread('subm_Experiment_data.xlsx','NoColicinCo','B19:B23');%5 timepoints
CO_LAC_MU_HFE_6_1_S=xlsread('subm_Experiment_data.xlsx','NoColicinCo','C19:H23');%Salmonella 3x experiments 
CO_LAC_MU_HFE_6_1_E=xlsread('subm_Experiment_data.xlsx','NoColicinCo','C28:H32');%E. coli 3x experiments 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% Plate reader data %%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%coculture wildtype high iron
%experiments 1A-1D
CO_LAC_WT_HFE_6_1_TOT_T=xlsread('subm_Experiment_data.xlsx','PlateReader','A5:A192'); % 188 timepoints
CO_LAC_WT_HFE_6_1_TOT=[ xlsread('subm_Experiment_data.xlsx','PlateReader','B5:C192'), ...
    xlsread('subm_Experiment_data.xlsx','PlateReader','E5:F192'), xlsread('subm_Experiment_data.xlsx','PlateReader','H5:I192'), ...
    xlsread('subm_Experiment_data.xlsx','PlateReader','K5:L192')];

%%%coculture wildtype low iron

%experiment 2A-2D
CO_LAC_WT_LFE_6_1_TOT_T=xlsread('subm_Experiment_data.xlsx','PlateReader','M5:M192'); %timepoints 
CO_LAC_WT_LFE_6_1_TOT=[xlsread('subm_Experiment_data.xlsx','PlateReader','N5:O192'), xlsread('subm_Experiment_data.xlsx','PlateReader','Q5:R192'), ...
    xlsread('subm_Experiment_data.xlsx','PlateReader','T5:U192'), xlsread('subm_Experiment_data.xlsx','PlateReader','W5:X192')];



%experiment 2E
CO_LAC_WT_LFE_6_2_TOT_T=xlsread('subm_Experiment_data.xlsx','PlateReader','Y5:Y192'); % timepoints 
CO_LAC_WT_LFE_6_2_TOT=[xlsread('subm_Experiment_data.xlsx','PlateReader','Z5:AA192')];


%%%coculture wildtype high iron
%experiments 16-17 = 
% No iron limitation, 10^7 initial OD
%  experiment 1E
CO_LAC_WT_HFE_7_1_TOT_T=xlsread('subm_Experiment_data.xlsx','PlateReader','AB5:AB291');  
CO_LAC_WT_HFE_7_1_TOT=xlsread('subm_Experiment_data.xlsx','PlateReader','AC5:AD291');  

% experiment 1F
CO_LAC_WT_HFE_7_2_TOT_T=xlsread('subm_Experiment_data.xlsx','PlateReader','AE5:AE293'); 
CO_LAC_WT_HFE_7_2_TOT=xlsread('subm_Experiment_data.xlsx','PlateReader','AF5:AG293'); 


% Active Colicin Co-Cultures of Salmonella and E.coli
% No iron limitation, 10^5 initial OD
%  Exp  1G,H
CO_LAC_WT_HFE_5_1_TOT_T=xlsread('subm_Experiment_data.xlsx','PlateReader','AH5:AH293'); 
CO_LAC_WT_HFE_5_1_TOT=[xlsread('subm_Experiment_data.xlsx','PlateReader','AI5:AJ293'), xlsread('subm_Experiment_data.xlsx','ColicinCo','AL5:AM293')]; 


%%%coculture mutant high iron
%experiments 3A-3C
CO_LAC_MU_HFE_6_1_TOT_T=xlsread('subm_Experiment_data.xlsx','PlateReader','AN5:AN190'); %timepoints 
CO_LAC_MU_HFE_6_1_TOT=[xlsread('subm_Experiment_data.xlsx','PlateReader','AO5:AP190'), ...
    xlsread('subm_Experiment_data.xlsx','PlateReader','AR5:AS190'), xlsread('subm_Experiment_data.xlsx','PlateReader','AU5:AV190')];



end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
