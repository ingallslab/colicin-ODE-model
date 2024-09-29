function [output]=subm_run_long_term



pars=[0.114471500852052
   1.177541496882635
   0.211658150775181
   9.666505932271139
   0.855708199615597
   0.317377470424927
   0.421198591219959
   %0.223911224561197
   ];


pars_nom=pars;

ODEFUN=@coli_dtt;


Fe=1;


%Figure scenarios:
%oscillates
%L_in=0.1; %washout
%L_in=0.7; %co-maintenace
%L_in=1.2; %oscillates

d1=0.2; %dilution rate

global p

%%%%%Plotting%%%%%%%

%%%batch%%%

L_in=0;
d1=0;
p=[pars', Fe, L_in, d1];
IC=[4      0 0.05   0.05];
%IC=[4      0 0.0016   0.0016];

tf=50;
options = odeset('AbsTol',1e-9, 'RelTol', 1e-9);

[t,s]=ode23s(ODEFUN,[0 tf],IC, options);

figure(1)
subplot(2,1,1)
xlabel('Time (hr)')
ylabel('Absorbance (OD600)')
hold on
plot(t,s(:,3),'g',t,s(:,4),'r', 'Linewidth',1.25)
%title('populations')
legend('E. coli', 'Salmonella')
hold off

subplot(2,1,2)
xlabel('Time')
ylabel('Concentration (mM)')
hold on
plot(t, s(:,1), 'b', t, s(:,2), 'k','Linewidth',1.25)
%title('nutrients')
legend('lactose', 'glucose/galactose')
hold off

saveas(gcf,'batch.png')
A=[t, s(:,1), s(:,2), s(:,3), s(:,4)];
filename = 'batch.csv';
csvwrite(filename,A)


%%%%%%%%%%%%%%%%%sensitivity figure%%%%%%%%%%%%%
figure(90)
subplot(2,1,1)
xlabel('Time (hr)')
ylabel('Absorbance (OD600)')
hold on
plot(t,s(:,3),'g',t,s(:,4),'r', 'Linewidth',1.25)
%title('populations')
legend('E. coli', 'Salmonella')
hold off

subplot(2,1,2)
xlabel('Time')
ylabel('Concentration (mM)')
hold on
plot(t, s(:,1), 'b', t, s(:,2), 'k','Linewidth',1.25)
%title('nutrients')
legend('lactose', 'glucose/galactose')
hold on


A=[t, s(:,1), s(:,2), s(:,3), s(:,4)];
filename = 'batchnom.csv';
csvwrite(filename,A)


L_in=0;
d1=0;
p=[pars', Fe, L_in, d1];
IC=[4      0 0.05   0.05];
%IC=[4      0 0.0016   0.0016];


%p(1)=p(1)*1.1;
p(5)=p(5)*1.3;
tf=50;
options = odeset('AbsTol',1e-9, 'RelTol', 1e-9);

[t,s]=ode23s(ODEFUN,[0 tf],IC, options);

subplot(2,1,1)
xlabel('Time (hr)')
ylabel('Absorbance (OD600)')
hold on
plot(t,s(:,3),'g--',t,s(:,4),'r--', 'Linewidth',1.25)
%title('populations')
legend('E. coli', 'Salmonella')
hold off

subplot(2,1,2)
xlabel('Time')
ylabel('Concentration (mM)')
hold on
plot(t, s(:,1), 'b--', t, s(:,2), 'k--','Linewidth',1.25)
%title('nutrients')
legend('lactose', 'glucose/galactose')
hold off

saveas(gcf,'batchsens.png')
A=[t, s(:,1), s(:,2), s(:,3), s(:,4)];
filename = 'batchsens.csv';
csvwrite(filename,A)


p(1)=pars_nom(1);

%%%%%%%%%%%%%%%%%end sensitivity figure%%%%%%%%%%%%%


d1=0.2; %dilution rate


%%%washout%%%

L_in=0.1;

p=[pars', Fe, L_in, d1];
IC=[4      0 0.05   0.05];

tf=300;
options = odeset('AbsTol',1e-9, 'RelTol', 1e-9);
[t,s]=ode23s(ODEFUN,[0 tf],IC, options);

figure(2)
subplot(2,1,1)
xlabel('Time (hr)')
ylabel('Absorbance (OD600)')
hold on
plot(t,s(:,3),'g',t,s(:,4),'r', 'Linewidth',1.25)
%title('populations')
legend('E. coli', 'Salmonella')
hold off

subplot(2,1,2)
xlabel('Time')
ylabel('Concentration (mM)')
hold on
plot(t, s(:,1), 'b', t, s(:,2), 'k','Linewidth',1.25)
%title('nutrients')
legend('lactose', 'glucose/galactose')
hold off

saveas(gcf,'washout.png')
A=[t, s(:,1), s(:,2), s(:,3), s(:,4)];
filename = 'washout.csv';
csvwrite(filename,A)


%%%co-maintenace%%%

L_in=0.7;

p=[pars', Fe, L_in, d1];
IC=[4      0 0.05   0.05];

tf=300;
%options = odeset('NonNegative',1);
options = odeset('AbsTol',1e-9, 'RelTol', 1e-9);
[t,s]=ode23s(ODEFUN,[0 tf],IC, options);

figure(3)
subplot(2,1,1)
xlabel('Time (hr)')
ylabel('Absorbance (OD600)')
hold on
plot(t,s(:,3),'g',t,s(:,4),'r', 'Linewidth',1.25)
%title('populations')
legend('E. coli', 'Salmonella')
hold off

subplot(2,1,2)
xlabel('Time')
ylabel('Concentration (mM)')
hold on
plot(t, s(:,1), 'b', t, s(:,2), 'k','Linewidth',1.25)
%title('nutrients')
legend('lactose', 'glucose/galactose')
hold off

saveas(gcf,'comaintenance.png')
A=[t, s(:,1), s(:,2), s(:,3), s(:,4)];
filename = 'comaintenance.csv';
csvwrite(filename,A)



%%%%%%%%%%%%%%%%%%%sensitivity figure%%%%%%%%%%%%%%%%%%%%%


L_in=0.7;

p=[pars', Fe, L_in, d1];
IC=[4      0 0.05   0.05];

tf=75;
%options = odeset('NonNegative',1);
options = odeset('AbsTol',1e-9, 'RelTol', 1e-9);
[t,s]=ode23s(ODEFUN,[0 tf],IC, options);

figure(93)
subplot(2,1,1)
xlabel('Time (hr)')
ylabel('Absorbance (OD600)')
hold on
plot(t,s(:,3),'g',t,s(:,4),'r', 'Linewidth',1.25)
%title('populations')
legend('E. coli', 'Salmonella')
hold off

subplot(2,1,2)
xlabel('Time')
ylabel('Concentration (mM)')
hold on
plot(t, s(:,1), 'b', t, s(:,2), 'k','Linewidth',1.25)
%title('nutrients')
legend('lactose', 'glucose/galactose')
hold off

A=[t, s(:,1), s(:,2), s(:,3), s(:,4)];
filename = 'comaintenancenom.csv';
csvwrite(filename,A)



L_in=0.7;

p=[pars', Fe, L_in, d1];
%p(1)=p(1)*1.1
p(5)=p(5)*1.3
IC=[4      0 0.05   0.05];

tf=75;
%options = odeset('NonNegative',1);
options = odeset('AbsTol',1e-9, 'RelTol', 1e-9);
[t,s]=ode23s(ODEFUN,[0 tf],IC, options);

subplot(2,1,1)
xlabel('Time (hr)')
ylabel('Absorbance (OD600)')
hold on
plot(t,s(:,3),'g--',t,s(:,4),'r--', 'Linewidth',1.25)
%title('populations')
legend('E. coli', 'Salmonella')
hold off

subplot(2,1,2)
xlabel('Time')
ylabel('Concentration (mM)')
hold on
plot(t, s(:,1), 'b--', t, s(:,2), 'k--','Linewidth',1.25)
%title('nutrients')
legend('lactose', 'glucose/galactose')
hold off



saveas(gcf,'comaintenancesens.png')
A=[t, s(:,1), s(:,2), s(:,3), s(:,4)];
filename = 'comaintenancesens.csv';
csvwrite(filename,A)


p(1)=pars_nom(1);


%%%%%%%%%%%%%%%%%%%end sensitivity figure%%%%%%%%%%%%%%%%%%%%%


%%%oscillations%%%

L_in=1.2;

p=[pars', Fe, L_in, d1];
IC=[4      0 0.05   0.05];

tf=300;
options = odeset('AbsTol',1e-9, 'RelTol', 1e-9);
[t,s]=ode23s(ODEFUN,[0 tf],IC, options);

figure(4)
subplot(2,1,1)
xlabel('Time (hr)')
ylabel('Absorbance (OD600)')
hold on
plot(t,s(:,3),'g',t,s(:,4),'r', 'Linewidth',1.25)
%title('populations')
legend('E. coli', 'Salmonella')
hold off

subplot(2,1,2)
xlabel('Time')
ylabel('Concentration (mM)')
hold on
plot(t, s(:,1), 'b', t, s(:,2), 'k','Linewidth',1.25)
%title('nutrients')
legend('lactose', 'glucose/galactose')
hold off

saveas(gcf,'oscillations.png')
A=[t, s(:,1), s(:,2), s(:,3), s(:,4)];
filename = 'oscillations.csv';
csvwrite(filename,A)


%%%%%End Plotting%%%%%%%

%%%% local sensitivities
pert=0.01;

%%%population sensitivities in co-maintenance scenario
L_in=0.7; %co-maintenace
p=[pars', Fe, L_in, d1];

nom_pars = p;
options = odeset('AbsTol',1e-9, 'RelTol', 1e-9);
tf=300;
[t,s]=ode23s(ODEFUN,[0 tf],IC, options);

E_pop_nom = s(length(t), 3);
S_pop_nom = s(length(t), 4);

E_pop_sens=zeros(1,10);
S_pop_sens=zeros(1,10);

for i= 1:10
    p = nom_pars;
    
    p(i) = (1+pert)*p(i);
    options = odeset('AbsTol',1e-9, 'RelTol', 1e-9);
    [t,s]=ode23s(ODEFUN,[0 tf],IC, options);
    E_pop_pert = s(length(t),3);
    S_pop_pert = s(length(t),4);
    
    E_pop_sens(i)=((E_pop_pert-E_pop_nom)/E_pop_nom)*(1/pert);
    S_pop_sens(i)=((S_pop_pert-S_pop_nom)/S_pop_nom)*(1/pert);
    
end

   
'E_pop'

E_pop_sens'

'S_pop'

S_pop_sens'

%%%max population sensitivities in batch scenario


pert=0.01;


tf=300;
L_in=0; %batch
d1=0; %batch
p=[pars', Fe, L_in, d1];

nom_pars=p;
IC=[4      0 0.05   0.05];
options = odeset('AbsTol',1e-9, 'RelTol', 1e-9);
[t,s]=ode23s(ODEFUN,[0 tf],IC, options);
E_max_nom = max(s(:, 3));
S_max_nom = max(s(:, 4));

E_max_sens=zeros(1,9);
S_max_sens=zeros(1,9);

for i= 1:8
    p = nom_pars;
    
    p(i) = (1+pert)*p(i);
    options = odeset('AbsTol',1e-9, 'RelTol', 1e-9);
    [t,s]=ode23s(ODEFUN,[0 tf],IC, options);
    E_max_pert = max(s(:,3));
    S_max_pert = max(s(:,4));
    
    E_max_sens(i)=((E_max_pert-E_max_nom)/E_max_nom)*(1/pert);
    S_max_sens(i)=((S_max_pert-S_max_nom)/S_max_nom)*(1/pert);
    
end


i=i+1;
p = nom_pars;
    
IC=[4*(1+pert)      0 0.05   0.05];
    options = odeset('AbsTol',1e-9, 'RelTol', 1e-9);
    [t,s]=ode23s(ODEFUN,[0 tf],IC, options);
    E_max_pert = max(s(:,3));
    S_max_pert = max(s(:,4));
    
    E_max_sens(i)=((E_max_pert-E_max_nom)/E_max_nom)*(1/pert);
    S_max_sens(i)=((S_max_pert-S_max_nom)/S_max_nom)*(1/pert);
    


'E_max'

E_max_sens'

'S_max'

S_max_sens'

end


function dS=coli_dtt(t, x)

global p


% Setting the parameters
% Base model
Y_E=p(1);
k_LE=p(2);
k_BS=p(3);
k_LG=p(4);
k_c=p(5);
Y_S=p(6);
k_GS=p(7);
Fe=p(8);
L_in=p(9);
d1=p(10);


% Setting the state variables
L=x(1);
G=x(2);
E=x(3);
S=x(4);


% Equations
E_dt=Fe*Y_E*k_LE*L*E - k_c*E*S/(Fe^2) - d1*E;
S_dt=k_BS*Fe*Y_E*k_LE*L*E+Fe*Y_S*k_GS*G*S - d1*S;
L_dt=L_in-Fe*k_LE*L*E-k_LG*k_c*E*S*L/(Fe^2) - d1*L;
G_dt=2*k_LG*k_c*E*S*L/(Fe^2)-Fe*G*k_GS*S - d1*G;

% Output
dS=[L_dt;G_dt;E_dt;S_dt];



end
