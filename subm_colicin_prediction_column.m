%function [output]=f_colicin_prediction_column
function [output]=subm_colicin_prediction_column(pars)

global DTPA; global S_alone; global ECalone; global mutant;
global p;

%%%Co-culture wild-type, high iron
%Exp 1A-1D
global CO_LAC_WT_HFE_6_1_T; global CO_LAC_WT_HFE_6_1_S; global CO_LAC_WT_HFE_6_1_E
global CO_LAC_WT_HFE_6_1_TOT; global CO_LAC_WT_HFE_6_1_TOT_T

%%%Co-culture wild-type, low iron
%Exp 2A-2D
global CO_LAC_WT_LFE_6_1_T; global CO_LAC_WT_LFE_6_1_S; global CO_LAC_WT_LFE_6_1_E %CFU
global CO_LAC_WT_LFE_6_1_TOT; global CO_LAC_WT_LFE_6_1_TOT_T
%Exp 2E
global CO_LAC_WT_LFE_6_2_T; global CO_LAC_WT_LFE_6_2_S; global CO_LAC_WT_LFE_6_2_E %CFU
global CO_LAC_WT_LFE_6_2_TOT; global CO_LAC_WT_LFE_6_2_TOT_T

%%%Co-culture mutant, high iron
%Exp 3A-3C
global CO_LAC_MU_HFE_6_1_T; global CO_LAC_MU_HFE_6_1_S; global CO_LAC_MU_HFE_6_1_E %CFU
global CO_LAC_MU_HFE_6_1_TOT; global CO_LAC_MU_HFE_6_1_TOT_T %PR




p=pars;

% This is the function at the end of this matlab document

ODEFUN=@coli_dtt;

%initialize prediction column output
prediction_column=[];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  co-culture without DTPA,  experiment 1A-1D
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%
%%Testing: WT coculture, high FE
%%%%%%%%%%%%%%%%%%%

mutant=0;
DTPA=0;
ECalone=0;
S_alone=0;


%First CFU counts:



for z=1:4 
    
 %CFU   
 IC = [4 0 p(8+((2*z)-1))  p(8+(2*z))];
 [t,s]=ode23s(ODEFUN,CO_LAC_WT_HFE_6_1_T,IC);
 
 %remove first time-point (not a prediction)
 %spred=s(2:end,:);
 spred=s;
 
 prediction_column=[prediction_column; spred(:,3); spred(:,4)];
 
 
 
 %%PR
 
 IC = [4 0 p(8+((2*z)-1))  p(8+(2*z))];
 [t,s]=ode23s(ODEFUN,CO_LAC_WT_HFE_6_1_TOT_T,IC);
 
 %spred=s(2:end,:);
 spred=s;
 
 prediction_column=[prediction_column; spred(:,3)+spred(:,4)];
        
end





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DTPA, Active Colicin, cocultures
% Exp 2A-2D
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


mutant=0;
DTPA=100;
ECalone=0;
S_alone=0;

for z=1:4
    
    
 %CFU
 %IC = [4 0 CO_LAC_WT_LFE_6_1_E(1,2*z-1) CO_LAC_WT_LFE_6_1_S(1,2*z-1)];
 IC = [4 0 p(16+((2*z)-1))  p(16+(2*z))];
 [t,s]=ode23s(ODEFUN,CO_LAC_WT_LFE_6_1_T,IC);
 s=[s(1,:);s(end,:)]; % to get just two output points.
 
 %spred=s(2:end,:);
 spred=s;
 
 prediction_column=[prediction_column; spred(:,3); spred(:,4)];
 
 
  %%PR
 
 %IC = [4 0 CO_LAC_WT_LFE_6_1_E(1,2*z-1) CO_LAC_WT_LFE_6_1_S(1,2*z-1)];
 IC = [4 0 p(16+((2*z)-1))  p(16+(2*z))];
 [t,s]=ode23s(ODEFUN,CO_LAC_WT_LFE_6_1_TOT_T,IC);
 
 %spred=s(2:end,:);
 spred=s;
 
 prediction_column=[prediction_column; spred(:,3)+spred(:,4)];
 

 
end

 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DTPA, Active Colicin, cocultures
% Exp 2E
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    


mutant=0;
DTPA=100;
ECalone=0;
S_alone=0;


for z=1:1
 %IC = [4 0 CO_LAC_WT_LFE_6_2_E(1,2*z-1) CO_LAC_WT_LFE_6_2_S(1,2*z-1)];
 IC = [4 0 p(25)  p(26)];
 [t,s]=ode23s(ODEFUN,CO_LAC_WT_LFE_6_2_T,IC);
 
 %spred=s(2:end,:);
 spred=s;
 
 prediction_column=[prediction_column; spred(:,3); spred(:,4)];
 
 
 
  %%PR
 
 %IC = [4 0 CO_LAC_WT_LFE_6_2_E(1,2*z-1) CO_LAC_WT_LFE_6_2_S(1,2*z-1)];
 IC = [4 0 p(25)  p(26)];
 [t,s]=ode23s(ODEFUN,CO_LAC_WT_LFE_6_2_TOT_T,IC);
 
 %spred=s(2:end,:);
 spred=s;
 
 prediction_column=[prediction_column; spred(:,3)+spred(:,4)];
 
 
 
end


 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% No Colicin, both populations
% No DTPA
%Exp 3A-3C
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


mutant=1;
DTPA=0;
ECalone=0;
S_alone=0;

for z=1:3
 %IC = [4 0 CO_LAC_MU_HFE_6_1_E(1,2*z-1) CO_LAC_MU_HFE_6_1_S(1,2*z-1)];
 IC = [4 0 p(26+((2*z)-1))  p(26+(2*z))];
 [t,s]=ode23s(ODEFUN,CO_LAC_MU_HFE_6_1_T,IC);
 
 %spred=s(2:end,:);
 spred=s;
 
 prediction_column=[prediction_column; spred(:,3); spred(:,4)];
 

 
  %%PR
 
 %IC = [4 0 CO_LAC_MU_HFE_6_1_E(1,2*z-1) CO_LAC_MU_HFE_6_1_S(1,2*z-1)];
 IC = [4 0 p(26+((2*z)-1))  p(26+(2*z))];
 [t,s]=ode23s(ODEFUN,CO_LAC_MU_HFE_6_1_TOT_T,IC);
 
 %spred=s(2:end,:);
 spred=s;
 
 prediction_column=[prediction_column; spred(:,3)+spred(:,4)];
 
 
 
 
end

output=prediction_column;

end


function dS=coli_dtt(t,x)

global ECalone; global mutant; global S_alone;
global DTPA;

global p;

% in case hard-coded values are needed for debugging
% pars=[
%     0.17133273
%     0.664577526
%     0.070526917
%     166.9128051
%     0.560064549
%     0.126531239
%     0.812606025];


% Setting the parameters
% Base model
Y_E=p(1);
k_LE=p(2);
k_BS=p(3);
k_LG=p(4);
k_c=p(5);
Y_S=p(6);
k_GS=p(7);
%k_GE=p(8);
Alt_Fe=p(8);
%Alt_kLE=p(10);



% Setting the state variables
L=x(1);
G=x(2);
E=x(3);
S=x(4);

if DTPA==0
    Fe=1;
else
   Fe=Alt_Fe;
end


% Conditions

if mutant==1
    colicin_death_rate=0;
 %   k_LE=Alt_kLE;
else
    colicin_death_rate=k_c;
end


if ECalone==1
    byproduct_growth=0;
else
    byproduct_growth=k_BS;
end


% Equations
L_dt=-k_LE*L*E-k_LG*colicin_death_rate*E*S*L/(Fe^2);
%E_dt=Fe*Y_E*k_LE*L*E+ Fe*Y_E*k_GE*G*E - colicin_death_rate*E*S/(Fe^2);
E_dt=Fe*Y_E*k_LE*L*E - colicin_death_rate*E*S/(Fe^2);
%G_dt=2*k_LG*colicin_death_rate*E*S*L/(Fe^2)-G*(k_GS*S+k_GE*E);
G_dt=2*k_LG*colicin_death_rate*E*S*L/(Fe^2)-G*(k_GS*S);
S_dt=byproduct_growth*Fe*Y_E*k_LE*L*E+Fe*Y_S*k_GS*G*S;

% Output
dS=[L_dt;G_dt;E_dt;S_dt];


end