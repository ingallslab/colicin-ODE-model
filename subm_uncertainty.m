function z=subm_uncertainty

% Change this
pert_size=0.01; 

global data_cov


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


subm_fetch_data

params=[0.097033942818438
   1.118449222132517
   0.596869235302445
  11.314604711468423
   0.769854551737582
   0.202181943319586
   0.324619687357105
   0.232924800604899
   0.004858805624517
   0.005506843814948
   0.003892291918625
   0.004962664496754
   0.006289516136061
   0.006270117105454
   0.003770898400421
   0.000527273515397
   0.002942917698063
   0.001020148603369
   0.004275361394573
   0.001503145213631
   0.002467682743965
   0.001535556958135
   0.003549912463826
   0.000444314498042
   0.006625994983291
   0.000423239211407
   0.004690759575007
   0.000564418401027
   0.003870495053419
   0.000380575374380
   0.003810073758228
   0.000324634123812];

params=[0.114476272216997
   1.177611545137839
   0.211630394229232
   9.665109370989981
   0.855649155342604
   0.317414919828500
   0.421210335503391
   0.223915228692225
   0.001099766063463
   0.006157480057168
   0.001712729419145
   0.007089069860058
   0.002342070167969
   0.009264736858301
   0.002220614505084
   0.006995636219099
   0.003101884102225
   0.003008761479602
   0.003978043798320
   0.004126565087691
   0.005000005411014
   0.002520909919032
   0.004161314602692
   0.002636859365122
   0.004995302088719
   0.001610364897454
   0.002588969371668
   0.000000040240706
   0.001032516467219
   0.000000049892290
   0.002289674271941
   0.000000025085281];

params=[0.103366030878639
   0.709928890646372
   0.562383005490495
   1.690933823291752
   0.607444686827197
   0.553323015801744
   0.408150462369177
   0.280308091981592
   0.013487909796439
   0.008024425838984
   0.012885539102040
   0.005636982400121
   0.017176790231824
   0.003918897662377
   0.012304380425553
   0.000017479272907
   0.002224344708827
   0.003333218393154
   0.002691103908724
   0.004674942590502
   0.004444366007961
   0.003045211631829
   0.003150876741952
   0.002804086397984
   0.005128199804148
   0.000772203726166
   0.014678761142449
   0.000017185130351
   0.012346293992471
   0.000011499631271
   0.011488001811015
   0.000014405610991];

params=[0.114471500852052
   1.177541496882635
   0.211658150775181
   9.666505932271139
   0.855708199615597
   0.317377470424927
   0.421198591219959
   0.223911224561197
   0.001100072834240
   0.006155849122120
   0.001713291744643
   0.007084442015885
   0.002343229576080
   0.009261500126116
   0.002221571067967
   0.006992461503957
   0.003102900711591
   0.003007528602092
   0.003979439128267
   0.004125429804641
   0.005001246130118
   0.002519631469717
   0.004162155718298
   0.002635664694760
   0.004996158765916
   0.001611042006734
   0.002589779939195
   0.000000201235590
   0.001032964357047
   0.000000249393925
   0.002290538203115
   0.000000125346725];


params=[0.114471500852052
   1.177541496882635
   0.211658150775181
   9.666505932271139
   0.855708199615597
   0.317377470424927
   0.421198591219959
   0.223911224561197
   0.001100072834240
   0.006155849122120
   0.001713291744643
   0.007084442015885
   0.002343229576080
   0.009261500126116
   0.002221571067967
   0.006992461503957
   0.003102900711591
   0.003007528602092
   0.003979439128267
   0.004125429804641
   0.005001246130118
   0.002519631469717
   0.004162155718298
   0.002635664694760
   0.004996158765916
   0.001611042006734
   0.002589779939195
   0.000000201235590
   0.001032964357047
   0.000000249393925
   0.002290538203115
   0.000000125346725];

params=[0.114471500852052
   1.177541496882635
   0.211658150775181
   9.666505932271139
   0.855708199615597
   0.317377470424927
   0.421198591219959
   0.223911224561197
   0.001100072834240
   0.006155849122120
   0.001713291744643
   0.007084442015885
   0.002343229576080
   0.009261500126116
   0.002221571067967
   0.006992461503957
   0.003102900711591
   0.003007528602092
   0.003979439128267
   0.004125429804641
   0.005001246130118
   0.002519631469717
   0.004162155718298
   0.002635664694760
   0.004996158765916
   0.001611042006734
   0.002589779939195
   0.000000201235590
   0.001032964357047
   0.000000249393925
   0.002290538203115
   0.000000125346725];

% Change each of these to reflect the system
%number_of_outputs=3; % Number of outputs

number_of_parameters=8;

%Local sensitivities:

%organization: outputs: Ecoli, Salmonella, both
%observations, concatenated into a single column
% 1A Ecoli,  5 timepoints
% 1A salmonella,   5 timepoints
% 1A totals,...188 timepoints
% 1B Ecoli,  5 timepoints
% 1B salmonella,   5 timepoints
% 1B totals,...188 timepoints
% 1C Ecoli,  5 timepoints
% 1C salmonella,   5 timepoints
% 1C totals,...188 timepoints
% 1D Ecoli,  5 timepoints
% 1D salmonella,   5 timepoints
% 1D totals,...188 timepoints
% 2A Ecoli, 2 timepoint
% 2A salmonella,  2 timepoint
% 2A totals,...188 timepoints
% 2B Ecoli, 2 timepoint
% 2B salmonella,  2 timepoint
% 2B totals,...188 timepoints
% 2C Ecoli, 2 timepoint
% 2C salmonella,  2 timepoint
% 2C totals,...188 timepoints
% 2D Ecoli, 2 timepoint
% 2D salmonella,  2 timepoint
% 2D totals,...188 timepoints
% 2E Ecoli, 4 timepoints
% 2E salmonella, 4 timepoints
% 2E totals,...188 timepoints
% 3A Ecoli, 5 timepoints
% 3A salmonella,   5 timepoints
% 3A totals,...186 timepoints
% 3B Ecoli, 5 timepoints
% 3B salmonella,   5 timepoints
% 3B totals,...186 timepoints
% 3C Ecoli, 5 timepoints
% 3C salmonella,   5 timepoints
% 3C totals,...186 timepoints

number_of_observations=4*(5+5+188) + 4*(2+2+188) + 1*(4+4+188) + 3*(5+5+186); %not including replicates; these are means. 2344

S=zeros(number_of_observations,number_of_parameters);
absS=zeros(number_of_observations,number_of_parameters);  

% 
nom_pars=params;



   %generate a prediction column from the nominal parameter set
   nom_pred=subm_colicin_prediction_column(nom_pars);
   

% Calculating Discrete Sensitivities   
for j=1:number_of_parameters
    pert_pars=nom_pars;
    pert_pars(j)=nom_pars(j)*(1+pert_size);
    
    %generate a prediction column from the perturbed parameter set
    pert_pred=subm_colicin_prediction_column(pert_pars);
    
    for i=1:number_of_observations
            
    S(i,j)=(1/pert_size)*(pert_pred(i)-nom_pred(i))/nom_pred(i);
    absS(i,j)=(1/(pert_size*nom_pars(j)))*(pert_pred(i)-nom_pred(i));
  
    end
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%Structural measures of identifiability
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%overall sensitivity measure

VS=S;
absVS=absS;

overall_sensitivity_measure=sqrt(length(VS)*(rms(VS).^2)')
    

%identify most identifiable parameter (i.e. column of VS with largest
%2-norm)  

Z=VS;



[max0, max_index0]=max(sqrt(length(Z)*rms(Z).^2'));

indices_of_parameters_in_order_of_most_identifiable=zeros(1,number_of_parameters);

indices_of_parameters_in_order_of_most_identifiable(1)=max_index0;
ident_scores_of_parameters_in_order_of_most_identifiable(1)=max0;

%iterate projection process:

Z=VS;

X=[];
previous_max_index=max_index0;

for m=2:number_of_parameters

%in the m-th iteration, this is X(m-1), Zhat(m-1) in Yao

X=[X VS(:,previous_max_index)];

Zhat=X*inv(X'*X)*X'*Z;

R=Z-Zhat;

[norm_max, max_index]=max(sqrt(length(R)*rms(R).^2'));

indices_of_parameters_in_order_of_most_identifiable(m)=max_index;
ident_scores_of_parameters_in_order_of_most_identifiable(m)=norm_max;

previous_max_index=max_index;

end

%generate vector of identifiability scores in original order

for j=1:number_of_parameters
    
    ident_scores_of_parameters(indices_of_parameters_in_order_of_most_identifiable(j))=ident_scores_of_parameters_in_order_of_most_identifiable(j);
    
end

ident_score=ident_scores_of_parameters'



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%Practical measures of identifiability
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

epsilon=0.001;
PRepsilon=0.001;
min_CoV=0.01;


% Standard Deviation Data from Experiments, in column form

std=[];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  co-culture without DTPA,  experiment 1A-1D
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%
%%Testing: WT coculture, high FE
%%%%%%%%%%%%%%%%%%%





for z=1:4 
    
%First CFU counts:
 %CFU   
 
 e_std= max(max(CO_LAC_WT_HFE_6_1_E(:,2*z), epsilon), min_CoV*abs(CO_LAC_WT_HFE_6_1_S(:,(2*z)-1)));
 s_std= max(max(CO_LAC_WT_HFE_6_1_S(:,2*z), epsilon), min_CoV*abs(CO_LAC_WT_HFE_6_1_S(:,(2*z)-1)));

 
 std= [std; e_std; s_std];
 
 %%Then PR
 %%PR
 
 tot_std=max(max(CO_LAC_WT_HFE_6_1_TOT(:, 2*z), PRepsilon), min_CoV*abs(CO_LAC_WT_HFE_6_1_TOT(:,(2*z)-1)));


 std= [std; tot_std];

        
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
 
 e_std= max(max(CO_LAC_WT_LFE_6_1_E(:,2*z), epsilon), min_CoV*abs(CO_LAC_WT_LFE_6_1_E(:,(2*z)-1)));
 s_std= max(max(CO_LAC_WT_LFE_6_1_S(:,2*z), epsilon), min_CoV*abs(CO_LAC_WT_LFE_6_1_S(:,(2*z)-1)));
 
 
 std= [std; e_std; s_std];
 
 
 %%PR
 
 tot_std= max(max(CO_LAC_WT_LFE_6_1_TOT(:, 2*z), PRepsilon), min_CoV*abs(CO_LAC_WT_LFE_6_1_TOT(:,(2*z)-1)));


 std= [std; tot_std];
 
 
 

 
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
    
       
    %CFU   
 
 e_std= max(max(CO_LAC_WT_LFE_6_2_E(:,2*z), epsilon), min_CoV*abs(CO_LAC_WT_LFE_6_2_E(:,(2*z)-1)));
 s_std= max(max(CO_LAC_WT_LFE_6_2_S(:,2*z), epsilon), min_CoV*abs(CO_LAC_WT_LFE_6_2_S(:,(2*z)-1)));
 
 std= [std; e_std; s_std];
 
 %%PR
 
 tot_std= max(max(CO_LAC_WT_LFE_6_2_TOT(:, 2*z), PRepsilon), min_CoV*abs(CO_LAC_WT_LFE_6_2_TOT(:,(2*z)-1)));

 std= [std; tot_std];
 
 
 
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
    
       
    %CFU   
 
 e_std= max(max(CO_LAC_MU_HFE_6_1_E(:,2*z), epsilon), min_CoV*abs(CO_LAC_MU_HFE_6_1_E(:,(2*z)-1)));
 s_std= max(max(CO_LAC_MU_HFE_6_1_S(:,2*z), epsilon), min_CoV*abs(CO_LAC_MU_HFE_6_1_S(:,(2*z)-1)));
 
 
 std= [std; e_std; s_std];
 
 
 %%PR
 
 tot_std= max(max(CO_LAC_MU_HFE_6_1_TOT(:, 2*z), PRepsilon), min_CoV*abs(CO_LAC_MU_HFE_6_1_TOT(:,(2*z)-1)));
 
 std= [std; tot_std];
 

 
 
end



W=diag(std.^2,0);

%FIM

FIM=absVS'*inv(W)*absVS;

%FIM=absVS'*absVS;
%Cramer-Rao bound

sig_squared_lower_bnd=diag(inv(FIM));

%confidence interval:

CI=1.96*sqrt(sig_squared_lower_bnd);

percent_error=(CI./nom_pars(1:8))*100

%{
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%Blom 95% confidence interval
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%length of parameter vector
m=number_of_parameters;

%number of measurements points
N=108;

%min SSE
MLE=650;

% F95(m, N-m)
F95=finv(0.95, m, N-m);

C95=m/(N-m)*MLE*F95;

JTJ=transpose(absVS)*absVS;
JTJ_inv=inv(JTJ);

JTJ_diag=diag(JTJ);
JTJ_inv_diag=diag(JTJ_inv);

Delta_D = C95./sqrt(JTJ_diag)
percent_Delta_D=100*Delta_D./nom_pars'

Delta_I=C95.*sqrt(diag(JTJ_inv))
percent_Delta_I=100*Delta_I./nom_pars'

for i=1:5
    for j=1:5
        cor(i,j)=JTJ_inv(i,j)/(sqrt(JTJ_inv(i,i)*JTJ_inv(j,j)));
    end
end

cor;

[U,S,V] = svd(absVS);

sqrt(diag((S)));
%}



end