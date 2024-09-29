%function [output]=run_colicin
function [output]=run_colicin(pars)

global DTPA; global S_alone; global ECalone; global mutant;
global p;

%%%Co-culture wild-type, high iron
%Exp 1A-1D
global CO_LAC_WT_HFE_6_1_T; global CO_LAC_WT_HFE_6_1_S; global CO_LAC_WT_HFE_6_1_E %CFU
global CO_LAC_WT_HFE_6_1_TOT; global CO_LAC_WT_HFE_6_1_TOT_T %PR

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


%%%%%%%%%%%%%%%%%%%
% Calibration
%%%%%%%%%%%%%%%%%%%

% This is the function at the end of this matlab document
ODEFUN=@coli_dtt;

% SSE = sum squared errors (being minimized)
SSE =0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%Calibration 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%min SD to avoid division errors
min_CoV=0.01;
epsilon=0.001;
PRepsilon=0.001;

SSEmat=zeros(13, 6);


% addpath('../Data');
% fetch_data_Oct28;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Calibrating against co-culture without DTPA,  experiment 1A-1D
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%
%%Testing: WT coculture, high FE
%%%%%%%%%%%%%%%%%%%

%set scenario flags
mutant=0;
DTPA=0;
ECalone=0;
S_alone=0;


%First determine SSE for CFU counts:

for z=1:4 
 IC = [4 0 p(8+((2*z)-1))  p(8+(2*z))];
 [t,s]=ode23s(ODEFUN,CO_LAC_WT_HFE_6_1_T,IC);
 
 prediction=[s(:,3) s(:,4)]';
 
 %calibrate sub-populations (CFU)
 data=[CO_LAC_WT_HFE_6_1_E(:,2*z-1)  CO_LAC_WT_HFE_6_1_S(:,2*z-1)]';
 SD=[CO_LAC_WT_HFE_6_1_E(:,2*z)  CO_LAC_WT_HFE_6_1_S(:,2*z)]';

 abs_errors=zeros(2, length(CO_LAC_WT_HFE_6_1_T));
 weighted_errors=zeros(2, length(CO_LAC_WT_HFE_6_1_T));
 
 for kk=1:length(CO_LAC_WT_HFE_6_1_T)
     for jj=1:2
 abs_errors(jj,kk)=prediction(jj,kk)-data(jj,kk);
 weighted_errors(jj,kk)=abs_errors(jj,kk)/(max(max(SD(jj,kk), min_CoV*abs(data(jj,kk))), epsilon));
     end
 end
 
 SSEmat(z,1)=(1/(length(CO_LAC_WT_HFE_6_1_T)))*sum(sum(weighted_errors.^2));
 SSE=SSE+(1/(length(CO_LAC_WT_HFE_6_1_T)))*sum(sum(weighted_errors.^2));

 %%calibrate totals (PR)
 
 IC = [4 0 p(8+((2*z)-1))  p(8+(2*z))];
 [t,s]=ode23s(ODEFUN,CO_LAC_WT_HFE_6_1_TOT_T,IC);
 
 prediction=[s(:,3)+s(:,4)]';
 data=[CO_LAC_WT_HFE_6_1_TOT(:,2*z-1)]';
 SD=[CO_LAC_WT_HFE_6_1_TOT(:,2*z)]';

 abs_errors=zeros(1, length(CO_LAC_WT_HFE_6_1_TOT_T));
 weighted_errors=zeros(1, length(CO_LAC_WT_HFE_6_1_TOT_T));
 
 for kk=1:length(CO_LAC_WT_HFE_6_1_TOT_T)
 abs_errors(kk)=prediction(kk)-data(kk);
 if abs_errors(kk)==0
     weighted_errors(kk)=0;
 else
 weighted_errors(kk)=abs_errors(kk)/(max(max(SD(kk), min_CoV*abs(data(kk))), PRepsilon));
 end
 
 if min_CoV*abs(data(kk)) > max(SD(kk), PRepsilon)
     zz=8;
 end
 end
 
 SSEmat(z,2)=(1/(length(CO_LAC_WT_HFE_6_1_TOT)))*sum(sum(weighted_errors.^2));
 SSE=SSE+(1/(length(CO_LAC_WT_HFE_6_1_TOT)))*sum(sum(weighted_errors.^2));
        
end

Fig1_SSE=SSE;




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DTPA, Active Colicin, cocultures
% Exp 2A-2D
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


mutant=0;
DTPA=100;
ECalone=0;
S_alone=0;

for z=1:4
 IC = [4 0 p(16+((2*z)-1))  p(16+(2*z))];
 [t,s]=ode23s(ODEFUN,CO_LAC_WT_LFE_6_1_T,IC);
 s=[s(1,:);s(end,:)]; % to get just two output points.
 
 prediction=[s(:,3) s(:,4)]';
 data=[CO_LAC_WT_LFE_6_1_E(:,2*z-1)  CO_LAC_WT_LFE_6_1_S(:,2*z-1)]';
 SD=[CO_LAC_WT_LFE_6_1_E(:,2*z)  CO_LAC_WT_LFE_6_1_S(:,2*z)]';

 abs_errors=zeros(2, length(CO_LAC_WT_LFE_6_1_T));
 weighted_errors=zeros(2, length(CO_LAC_WT_LFE_6_1_T));
 for kk=1:length(CO_LAC_WT_LFE_6_1_T)
     for jj=1:2
 abs_errors(jj,kk)=prediction(jj,kk)-data(jj,kk);
 weighted_errors(jj,kk)=abs_errors(jj,kk)/(max(max(SD(jj,kk), min_CoV*abs(data(jj,kk))), epsilon));
     end
 end

 
 SSEmat(z,3)=(1/(length(CO_LAC_WT_LFE_6_1_T)))*sum(sum(weighted_errors.^2));
 SSE=SSE+(1/(length(CO_LAC_WT_LFE_6_1_T)))*sum(sum(weighted_errors.^2));
 
  %%calibrate totals (PR)
 
 IC = [4 0 p(16+((2*z)-1))  p(16+(2*z))];
 [t,s]=ode23s(ODEFUN,CO_LAC_WT_LFE_6_1_TOT_T,IC);
 
 prediction=[s(:,3)+s(:,4)]';
 data=[CO_LAC_WT_LFE_6_1_TOT(:,2*z-1)]';
 SD=[CO_LAC_WT_LFE_6_1_TOT(:,2*z)]';

 abs_errors=zeros(1, length(CO_LAC_WT_LFE_6_1_TOT_T));
 weighted_errors=zeros(1, length(CO_LAC_WT_LFE_6_1_TOT_T));
 
 for kk=1:length(CO_LAC_WT_LFE_6_1_TOT_T)
 abs_errors(kk)=prediction(kk)-data(kk);
 weighted_errors(kk)=abs_errors(kk)/(max(max(SD(kk), min_CoV*abs(data(kk))), PRepsilon));
 end

 SSEmat(z,4)=(1/(length(CO_LAC_WT_LFE_6_1_TOT)))*sum(sum(weighted_errors.^2));
 SSE=SSE+(1/(length(CO_LAC_WT_LFE_6_1_TOT)))*sum(sum(weighted_errors.^2));
 
 Fig2_SSE=SSE-Fig1_SSE;
 
 
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
 IC = [4 0 p(25)  p(26)];
 [t,s]=ode23s(ODEFUN,CO_LAC_WT_LFE_6_2_T,IC);
 
 
 prediction=[s(:,3) s(:,4)]';
 data=[CO_LAC_WT_LFE_6_2_E(:,2*z-1)  CO_LAC_WT_LFE_6_2_S(:,2*z-1)]';
 SD=[CO_LAC_WT_LFE_6_2_E(:,2*z)  CO_LAC_WT_LFE_6_2_S(:,2*z)]';

abs_errors=zeros(2, length(CO_LAC_WT_LFE_6_2_T));
 weighted_errors=zeros(2, length(CO_LAC_WT_LFE_6_2_T));
 for kk=1:length(CO_LAC_WT_LFE_6_2_T)
     for jj=1:2
 abs_errors(jj,kk)=prediction(jj,kk)-data(jj,kk);
 weighted_errors(jj,kk)=abs_errors(jj,kk)/(max(max(SD(jj,kk), min_CoV*abs(data(jj,kk))), epsilon));
     end
 end
 
 
 SSEmat(z+4,3)=(1/(length(CO_LAC_WT_LFE_6_2_T)))*sum(sum(weighted_errors.^2));
 SSE=SSE+(1/(length(CO_LAC_WT_LFE_6_2_T)))*sum(sum(weighted_errors.^2));
 
 
  %%calibrate totals (PR)
 
 IC = [4 0 p(25)  p(26)];
 [t,s]=ode23s(ODEFUN,CO_LAC_WT_LFE_6_2_TOT_T,IC);
 
 prediction=[s(:,3)+s(:,4)]';
 data=[CO_LAC_WT_LFE_6_2_TOT(:,2*z-1)]';
 SD=[CO_LAC_WT_LFE_6_2_TOT(:,2*z)]';

 abs_errors=zeros(1, length(CO_LAC_WT_LFE_6_2_TOT_T));
 weighted_errors=zeros(1, length(CO_LAC_WT_LFE_6_2_TOT_T));
 for kk=1:length(CO_LAC_WT_LFE_6_2_TOT_T)
 abs_errors(kk)=prediction(kk)-data(kk);
 weighted_errors(kk)=abs_errors(kk)/(max(max(SD(kk), min_CoV*abs(data(kk))), PRepsilon)); 
 end

 SSEmat(z+4,4)=(1/(length(CO_LAC_WT_LFE_6_2_TOT)))*sum(sum(weighted_errors.^2));
 SSE=SSE+(1/(length(CO_LAC_WT_LFE_6_2_TOT)))*sum(sum(weighted_errors.^2));
 
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
 IC = [4 0 p(26+((2*z)-1))  p(26+(2*z))];
 [t,s]=ode23s(ODEFUN,CO_LAC_MU_HFE_6_1_T,IC);
 
 prediction=[s(:,3) s(:,4)]';
 data=[CO_LAC_MU_HFE_6_1_E(:,2*z-1)  CO_LAC_MU_HFE_6_1_S(:,2*z-1)]';
 SD=[CO_LAC_MU_HFE_6_1_E(:,2*z)  CO_LAC_MU_HFE_6_1_S(:,2*z)]';

 
 abs_errors=zeros(2, length(CO_LAC_MU_HFE_6_1_T));
 weighted_errors=zeros(2, length(CO_LAC_MU_HFE_6_1_T));
 for kk=1:length(CO_LAC_MU_HFE_6_1_T)
     for jj=1:2
 abs_errors(jj,kk)=prediction(jj,kk)-data(jj,kk);
 weighted_errors(jj,kk)=abs_errors(jj,kk)/(max(max(SD(jj,kk), min_CoV*abs(data(jj,kk))), epsilon));
     end
 end
 
 SSEmat(z,5)=(1/(length(CO_LAC_MU_HFE_6_1_T)))*sum(sum(weighted_errors.^2));
 SSE=SSE+(1/(length(CO_LAC_MU_HFE_6_1_T)))*sum(sum(weighted_errors.^2));
 
  %%calibrate totals (PR)
 
 IC = [4 0 p(26+((2*z)-1))  p(26+(2*z))];
 [t,s]=ode23s(ODEFUN,CO_LAC_MU_HFE_6_1_TOT_T,IC);
 
 prediction=[s(:,3)+s(:,4)]';
 data=[CO_LAC_MU_HFE_6_1_TOT(:,2*z-1)]';
 SD=[CO_LAC_MU_HFE_6_1_TOT(:,2*z)]';

 abs_errors=zeros(1, length(CO_LAC_MU_HFE_6_1_TOT_T));
 weighted_errors=zeros(1, length(CO_LAC_MU_HFE_6_1_TOT_T));
 for kk=1:length(CO_LAC_MU_HFE_6_1_TOT_T)
 abs_errors(kk)=prediction(kk)-data(kk);
 weighted_errors(kk)=abs_errors(kk)/(max(max(SD(kk), min_CoV*abs(data(kk))), PRepsilon)); 
 end
 
 SSEmat(z,6)=(1/(length(CO_LAC_MU_HFE_6_1_TOT)))*sum(sum(weighted_errors.^2));
 SSE=SSE+(1/(length(CO_LAC_MU_HFE_6_1_TOT)))*sum(sum(weighted_errors.^2));
 
 
end

Fig3_SSE=SSE-Fig1_SSE-Fig2_SSE;

SSEmat;



SSE=Fig1_SSE + Fig2_SSE + Fig3_SSE
output=SSE;

end


function dS=coli_dtt(t,x)

global ECalone; global mutant; global S_alone;
global DTPA;

global p;

% Setting the parameters
% Base model
Y_E=p(1);
k_LE=p(2);
k_BS=p(3);
k_LG=p(4);
k_c=p(5);
Y_S=p(6);
k_GS=p(7);
Alt_Fe=p(8);


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
else
    colicin_death_rate=k_c;
end


if ECalone==1
    byproduct_growth=0;
else
    byproduct_growth=k_BS;
end


% Equations
E_dt=Fe*Y_E*k_LE*L*E - colicin_death_rate*E*S/(Fe^2);
S_dt=byproduct_growth*Fe*Y_E*k_LE*L*E+Fe*Y_S*k_GS*G*S;
L_dt=-Fe*k_LE*L*E-k_LG*colicin_death_rate*E*S*L/(Fe^2);
G_dt=2*k_LG*colicin_death_rate*E*S*L/(Fe^2)-Fe*G*k_GS*S;

% Output
dS=[L_dt;G_dt;E_dt;S_dt];


end