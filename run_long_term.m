function [output]=subm_run_long_term

pars=[ 0.097033942818438
   1.118449222132517
   0.596869235302445
  11.314604711468423
   0.769854551737582
   0.202181943319586
   0.324619687357105
   %0.232924800604899
   ];


ODEFUN=@coli_dtt;


Fe=1;


%Figure scenarios:
%oscillates
%L_in=0.2; %washout
%L_in=1.0; %co-maintenace
%L_in=2.5; %oscillates

d1=0.2; %dilution rate

global p

%%%%%Plotting%%%%%%%

%%%batch%%%

L_in=0;
d1=0;
p=[pars', Fe, L_in, d1];
IC=[4      0 0.05   0.05];
%IC=[4      0 0.0016   0.0016];

tf=30;
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

%%%batch%%%

L_in=0;
d1=0;
p=[pars', Fe, L_in, d1];
IC=[4      0 0.05   0.05];
%IC=[4      0 0.0016   0.0016];


p(1)=p(1)*1.25
tf=30;
options = odeset('AbsTol',1e-9, 'RelTol', 1e-9);

[t,s]=ode23s(ODEFUN,[0 tf],IC, options);

figure(1)
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

saveas(gcf,'batch.png')
A=[t, s(:,1), s(:,2), s(:,3), s(:,4)];
filename = 'batch.csv';
csvwrite(filename,A)





d1=0.2; %dilution rate


%%%washout%%%

L_in=0.2;

p=[pars', Fe, L_in, d1];
IC=[4      0 0.05   0.05];

tf=300;
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

saveas(gcf,'washout.png')
A=[t, s(:,1), s(:,2), s(:,3), s(:,4)];
filename = 'washout.csv';
csvwrite(filename,A)


%%%co-maintenace%%%

L_in=1.0;

p=[pars', Fe, L_in, d1];
IC=[4      0 0.05   0.05];

tf=75;
%options = odeset('NonNegative',1);
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

saveas(gcf,'comaintenance.png')
A=[t, s(:,1), s(:,2), s(:,3), s(:,4)];
filename = 'comaintenance.csv';
csvwrite(filename,A)


L_in=1.0;

p=[pars', Fe, L_in, d1];
p(1)=p(1)*1.25
IC=[4      0 0.05   0.05];

tf=75;
%options = odeset('NonNegative',1);
options = odeset('AbsTol',1e-9, 'RelTol', 1e-9);
[t,s]=ode23s(ODEFUN,[0 tf],IC, options);

figure(2)
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

saveas(gcf,'comaintenance.png')
A=[t, s(:,1), s(:,2), s(:,3), s(:,4)];
filename = 'comaintenance.csv';
csvwrite(filename,A)




%%%oscillations%%%

L_in=2.5;

p=[pars', Fe, L_in, d1];
IC=[4      0 0.05   0.05];

tf=300;
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

saveas(gcf,'oscillations.png')
A=[t, s(:,1), s(:,2), s(:,3), s(:,4)];
filename = 'oscillations.csv';
csvwrite(filename,A)


%%%%%End Plotting%%%%%%%

%%%% local sensitivities

pert=0.01;

%%%population sensitivities in co-maintenance scenario
L_in=1.0; %co-maintenace
p=[pars', Fe, L_in, d1];

nom_pars = p;
options = odeset('AbsTol',1e-9, 'RelTol', 1e-9);
tf=1000;
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

E_pop_sens=zeros(1,11);
S_pop_sens=zeros(1,11);

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
