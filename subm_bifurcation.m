% oscillations bifurcations


function subm_bifurcation

clc

global L_in
global d1
global p

pars=[0.097033942818438
   1.118449222132517
   0.596869235302445
  11.314604711468423
   0.769854551737582
   0.202181943319586
   0.324619687357105
   0.232924800604899];

pars=[0.114471500852052
   1.177541496882635
   0.211658150775181
   9.666505932271139
   0.855708199615597
   0.317377470424927
   0.421198591219959
   0.223911224561197
   ];


p=pars;
ODEFUN=@coli_dt;

Y_E=p(1);
k_LE=p(2);
k_BS=p(3);
k_LG=p(4);
k_c=p(5);
Y_S=p(6);
k_GS=p(7);
Alt_Fe=p(8); %not used
Fe=1;

Liticks=500;
d1ticks=500;


record=zeros(Liticks, d1ticks,3);


%latest
Lmin= 0.01;
Lmax= 3.0; 
d1min= 0.1;
d1max= 0.8;%


for Li=1:Liticks
    Li %output to track progress
    for d1i=1:d1ticks
    L_in=Lmin + (Lmax-Lmin)*(Li-1)/Liticks; %lactose_input
    d1=d1min + (d1max-d1min)*(d1i-1)/d1ticks; %dilution_rate
        
        
        record(Li, d1i, 1)=L_in;
        record(Li, d1i, 2)=d1;
        
        IC=[4      0 0.05   0.05];
        tf=300;
        options = odeset('NonNegative',1);
        [t,s]=ode45(ODEFUN,[0 tf],IC, options);
        
        if s(length(t),3) < 0.001 && s(length(t),4) < 0.001
            
        record(Li, d1i, 3)= 0;  %record of 0 means washout
        
        else
            %compare amplitude of difference in population to max
            %population, over last 25% of simualtion
            e_diff= abs(max(s(floor(0.75*length(t)):length(t),3))- min(s(floor(0.75*length(t)):length(t),3)));
            s_diff= abs(max(s(floor(0.75*length(t)):length(t),4))- min(s(floor(0.75*length(t)):length(t),4)));
            e_max= max(s(floor(0.75*length(t)):length(t),3));
            s_max=max(s(floor(0.75*length(t)):length(t),4));
            %if abs(max(s(floor(0.75*length(t)):length(t),3))- min(s(floor(0.75*length(t)):length(t),3))) > 0.01 || abs(max(s(floor(0.75*length(t)):length(t),4))- min(s(floor(0.75*length(t)):length(t),4))) > 0.01
            %if e_diff > 0.01 || s_diff > 0.01
            if e_diff > 0.1*e_max || s_diff > 0.1*s_max
        record(Li, d1i, 3)= 2; %record of 2 means oscillations
        
            else
                record(Li, d1i, 3)= 1;  %record of 1 means co-maintenance
            end
        end
    end
    
    
    
end

%generate curve

bifcurve=[]; %will contain points where the switch from oscillations to co-maintenance occurs. This is a switch from record=2 to record=1
for Li=1:Liticks
    d1i=1;
    while record(Li, d1i,3)>1 && d1i < d1ticks   
    d1i=d1i+1;
    end
    bifpoint(1)=record(Li, d1i,1);
    bifpoint(2)=record(Li, d1i,2);
    bifcurve = [bifcurve; bifpoint];
end

%     %smoothing to iron out numerical inaccuracies
% for Li=1:Liticks
%     if Li > 1
%     if bifcurve(Li, 2) < bifcurve(Li-1,2);
%         bifcurve(Li, 2)= bifcurve(Li-1,2);
%     end
%     end
% end



washedcurve=[];%will contain points where the switch from co-maintenance to washout occurs. This is a switch from record=1 to record=0
for Li=1:Liticks
   d1i=1;
    while record(Li, d1i,3)>0 && d1i < d1ticks
    d1i=d1i+1;
    end
    washedpoint(1)=record(Li, d1i,1);
    washedpoint(2)=record(Li, d1i,2);
    washedcurve = [washedcurve; washedpoint];
end


figure(99)
plot(bifcurve(:,2), bifcurve(:,1), 'g')
hold on
plot(washedcurve(:,2), washedcurve(:,1), 'b')
legend('bif','washed')
ylabel('Lactose inflow (mM)')
xlabel('dilution rate (/hr)')

saveas(gcf,'bifurcation.png')

filename = 'washout_curve.csv';
csvwrite(filename,washedcurve)

filename = 'bifurcation_curve.csv';
csvwrite(filename,bifcurve)


end


function dS=coli_dt(t,x)

global p;


global L_in
global d1


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

Fe=1;
% Conditions
colicin_death_rate=k_c;
byproduct_growth=k_BS;

%Oscillates
% L_in=0.4; %lactose_input
% d1=0.06; %salmonella death rate



% Equations
L_dt=L_in-k_LE*L*E-k_LG*colicin_death_rate*E*S*L/(Fe^2) - d1*L;
E_dt=Fe*Y_E*k_LE*L*E   -   colicin_death_rate*E*S/(Fe^2) - d1*E;
G_dt=2*k_LG*colicin_death_rate*E*S*L/(Fe^2)  -  G*(k_GS*S) - d1*G;
S_dt=byproduct_growth*Fe*Y_E*k_LE*L*E +  Fe*Y_S*k_GS*G*S - d1*S;

%
% Output
dS=[L_dt;G_dt;E_dt;S_dt];



end
