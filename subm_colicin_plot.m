%function colicin_plot(pars)
function colicin_plot

pars=[0.114471500852052
   1.177541496882635
   0.211658150775181
   9.666505932271139
   0.855708199615597
   0.317377470424927
   0.421198591219959
   0.223911224561197];

global DTPA; global S_alone; global ECalone; global mutant;
global p;

%Exp 1A-1D
global CO_LAC_WT_HFE_6_1_T; global CO_LAC_WT_HFE_6_1_S; global CO_LAC_WT_HFE_6_1_E
global CO_LAC_WT_HFE_6_1_TOT; global CO_LAC_WT_HFE_6_1_TOT_T


%Exp 2A-2D
global CO_LAC_WT_LFE_6_1_T; global CO_LAC_WT_LFE_6_1_S; global CO_LAC_WT_LFE_6_1_E; 
global CO_LAC_WT_LFE_6_1_TOT; global CO_LAC_WT_LFE_6_1_TOT_T
%Exp 2E
global CO_LAC_WT_LFE_6_2_T; global CO_LAC_WT_LFE_6_2_S; global CO_LAC_WT_LFE_6_2_E
global CO_LAC_WT_LFE_6_2_TOT; global CO_LAC_WT_LFE_6_2_TOT_T
%Exp 1E
global CO_LAC_WT_HFE_7_1_T; global CO_LAC_WT_HFE_7_1_S; global CO_LAC_WT_HFE_7_1_E;
global CO_LAC_WT_HFE_7_1_TOT_T; global CO_LAC_WT_HFE_7_1_TOT;
%Exp 1F
global CO_LAC_WT_HFE_7_2_T; global CO_LAC_WT_HFE_7_2_S; global CO_LAC_WT_HFE_7_2_E;
global CO_LAC_WT_HFE_7_2_TOT_T; global CO_LAC_WT_HFE_7_2_TOT;
%Exp 1G-H
global CO_LAC_WT_HFE_5_1_T; global CO_LAC_WT_HFE_5_1_S; global CO_LAC_WT_HFE_5_1_E; 
global CO_LAC_WT_HFE_5_1_TOT_T; global CO_LAC_WT_HFE_5_1_TOT;


%Exp 3A-3C
global CO_LAC_MU_HFE_6_1_T; global CO_LAC_MU_HFE_6_1_S; global CO_LAC_MU_HFE_6_1_E
global CO_LAC_MU_HFE_6_1_TOT; global CO_LAC_MU_HFE_6_1_TOT_T


subm_fetch_data



%%%%%%%%%%%%%%%%%%%%%%%

ODEFUN=@colicin_dt;

% Set global variable (p) to parameter set
p=pars;

%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%
% Plotting
%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%
mutant=0;
DTPA=0;
ECalone=0;
S_alone=0;
    
fig_num=1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plotting All
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plotting co-culture without DTPA, Exp 1A
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mutant=0;
DTPA=0;
ECalone=0;
S_alone=0;

IC=[4 0 CO_LAC_WT_HFE_6_1_E(1,1) CO_LAC_WT_HFE_6_1_S(1,1)];
tf=CO_LAC_WT_HFE_6_1_T(end);
[t,s]=ode23s(ODEFUN,[0 tf],IC);

figure(fig_num)
subplot(2,4,1)
plot(t,s(:,3),'g','Linewidth',1.25)
xlabel('Time')
ylabel('Absorbance')
hold on
plot(t,s(:,4),'r','Linewidth',1.25)
errorbar(CO_LAC_WT_HFE_6_1_T,CO_LAC_WT_HFE_6_1_E(:,1),CO_LAC_WT_HFE_6_1_E(:,2),'g+')
errorbar(CO_LAC_WT_HFE_6_1_T,CO_LAC_WT_HFE_6_1_S(:,1),CO_LAC_WT_HFE_6_1_S(:,2),'r+')
%legend('E.coli','Salmonella')
title('1A')
hold off
saveas(gcf,'1ACFU.png')

subplot(2,4,2)
%figure(fig_num)
xlabel('Time')
ylabel('Absorbance')
hold on
plot(t,s(:,3)+s(:,4),'k','Linewidth',1.25)
errorbar(CO_LAC_WT_HFE_6_1_TOT_T,CO_LAC_WT_HFE_6_1_TOT(:,1),CO_LAC_WT_HFE_6_1_TOT(:,2),'k+')
%legend('E.coli','Salmonella')
title('1A')
hold off
saveas(gcf,'1APR.png')

A=[t, s(:,3), s(:,4), s(:,3)+s(:,4)];
filename = '1A.csv';
csvwrite(filename,A)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plotting co-culture without DTPA, Exp 1B
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


mutant=0;
DTPA=0;
ECalone=0;
S_alone=0;

IC=[4 0 CO_LAC_WT_HFE_6_1_E(1,3) CO_LAC_WT_HFE_6_1_S(1,3)];
tf=CO_LAC_WT_HFE_6_1_T(end);
[t,s]=ode23s(ODEFUN,[0 tf],IC);


subplot(2,4,3)
%figure(fig_num)
plot(t,s(:,3),'g','Linewidth',1.25)
xlabel('Time')
ylabel('Absorbance')
hold on
plot(t,s(:,4),'r','Linewidth',1.25)
errorbar(CO_LAC_WT_HFE_6_1_T,CO_LAC_WT_HFE_6_1_E(:,3),CO_LAC_WT_HFE_6_1_E(:,4),'g+')
errorbar(CO_LAC_WT_HFE_6_1_T,CO_LAC_WT_HFE_6_1_S(:,3),CO_LAC_WT_HFE_6_1_S(:,4),'r+')
%legend('E.coli','Salmonella')
title('1B')
hold off
saveas(gcf,'1BCFU.png')

subplot(2,4,4)
%figure(fig_num)
xlabel('Time')
ylabel('Absorbance')
hold on
plot(t,s(:,3)+s(:,4),'k','Linewidth',1.25)
errorbar(CO_LAC_WT_HFE_6_1_TOT_T,CO_LAC_WT_HFE_6_1_TOT(:,3),CO_LAC_WT_HFE_6_1_TOT(:,4),'k+')
%legend('E.coli','Salmonella')
title('1B')
hold off
saveas(gcf,'1BPR.png')

DTPA=0;

A=[t, s(:,3), s(:,4), s(:,3)+s(:,4)];
filename = '1B.csv';
csvwrite(filename,A)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plotting co-culture without DTPA, Exp 1C
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mutant=0;
DTPA=0;
ECalone=0;
S_alone=0;

IC=[4 0 CO_LAC_WT_HFE_6_1_E(1,5) CO_LAC_WT_HFE_6_1_S(1,5)];
tf=CO_LAC_WT_HFE_6_1_T(end);
[t,s]=ode23s(ODEFUN,[0 tf],IC);

subplot(2,4,5)
%figure(fig_num)
plot(t,s(:,3),'g','Linewidth',1.25)
xlabel('Time')
ylabel('Absorbance')
hold on
plot(t,s(:,4),'r','Linewidth',1.25)
errorbar(CO_LAC_WT_HFE_6_1_T,CO_LAC_WT_HFE_6_1_E(:,5),CO_LAC_WT_HFE_6_1_E(:,6),'g+')
errorbar(CO_LAC_WT_HFE_6_1_T,CO_LAC_WT_HFE_6_1_S(:,5),CO_LAC_WT_HFE_6_1_S(:,6),'r+')
%legend('E.coli','Salmonella')
title('1C')
hold off
saveas(gcf,'1CCFU.png')

subplot(2,4,6)
%figure(fig_num)
xlabel('Time')
ylabel('Absorbance')
hold on
plot(t,s(:,3)+s(:,4),'k','Linewidth',1.25)
errorbar(CO_LAC_WT_HFE_6_1_TOT_T,CO_LAC_WT_HFE_6_1_TOT(:,5),CO_LAC_WT_HFE_6_1_TOT(:,6),'k+')
%legend('E.coli','Salmonella')
title('1C')
hold off
saveas(gcf,'1CPR.png')

A=[t, s(:,3), s(:,4), s(:,3)+s(:,4)];
filename = '1C.csv';
csvwrite(filename,A)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plotting co-culture without DTPA, Exp 1D
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mutant=0;
DTPA=0;
ECalone=0;
S_alone=0;

IC=[4 0 CO_LAC_WT_HFE_6_1_E(1,7) CO_LAC_WT_HFE_6_1_S(1,7)];
tf=CO_LAC_WT_HFE_6_1_T(end);
[t,s]=ode23s(ODEFUN,[0 tf],IC);

subplot(2,4,7)
%figure(fig_num)
plot(t,s(:,3),'g','Linewidth',1.25)
xlabel('Time')
ylabel('Absorbance')
hold on
plot(t,s(:,4),'r','Linewidth',1.25)
errorbar(CO_LAC_WT_HFE_6_1_T,CO_LAC_WT_HFE_6_1_E(:,7),CO_LAC_WT_HFE_6_1_E(:,8),'g+')
errorbar(CO_LAC_WT_HFE_6_1_T,CO_LAC_WT_HFE_6_1_S(:,7),CO_LAC_WT_HFE_6_1_S(:,8),'r+')
%legend('E.coli','Salmonella')
title('1D')
hold off
saveas(gcf,'1DCFU.png')

subplot(2,4,8)
%figure(fig_num)
xlabel('Time')
ylabel('Absorbance')
hold on
plot(t,s(:,3)+s(:,4),'k','Linewidth',1.25)
errorbar(CO_LAC_WT_HFE_6_1_TOT_T,CO_LAC_WT_HFE_6_1_TOT(:,7),CO_LAC_WT_HFE_6_1_TOT(:,8),'k+')
%legend('E.coli','Salmonella')
title('1D')
hold off
saveas(gcf,'1DPR.png')

A=[t, s(:,3), s(:,4), s(:,3)+s(:,4)];
filename = '1D.csv';
csvwrite(filename,A)

DTPA=0;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plotting co-culture without DTPA, exp 1E
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fig_num=2;

mutant=0;
DTPA=0;
ECalone=0;
S_alone=0;

IC=[4 0 CO_LAC_WT_HFE_7_1_E(1,1) CO_LAC_WT_HFE_7_1_S(1,1)];
tf=CO_LAC_WT_HFE_7_1_T(end);
[t,s]=ode23s(ODEFUN,[0 tf],IC);

figure(fig_num)
subplot(2,4,1)
plot(t,s(:,3),'g','Linewidth',1.25)
xlabel('Time')
ylabel('Absorbance')
hold on
plot(t,s(:,4),'r','Linewidth',1.25)
errorbar(CO_LAC_WT_HFE_7_1_T,CO_LAC_WT_HFE_7_1_E(:,1),CO_LAC_WT_HFE_7_1_E(:,2),'g+') 
errorbar(CO_LAC_WT_HFE_7_1_T,CO_LAC_WT_HFE_7_1_S(:,1),CO_LAC_WT_HFE_7_1_S(:,2),'r+')
%legend('E.coli','Salmonella')
title('1E')
hold off
saveas(gcf,'1ECFU.png')

subplot(2,4,2)
xlabel('Time')
ylabel('Absorbance')
hold on
plot(t,s(:,3)+s(:,4),'k','Linewidth',1.25)
errorbar(CO_LAC_WT_HFE_7_1_TOT_T,CO_LAC_WT_HFE_7_1_TOT(:,1),CO_LAC_WT_HFE_7_1_TOT(:,2),'k+')
%legend('E.coli','Salmonella')
title('1E')
hold off
saveas(gcf,'1EPR.png')

A=[t, s(:,3), s(:,4), s(:,3)+s(:,4)];
filename = '1E.csv';
csvwrite(filename,A)




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plotting co-culture without DTPA,  exp 1F
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


mutant=0;
DTPA=0;
ECalone=0;
S_alone=0;

IC=[4 0 CO_LAC_WT_HFE_7_2_E(1,1) CO_LAC_WT_HFE_7_2_S(1,1)];
tf=CO_LAC_WT_HFE_7_2_T(end);
[t,s]=ode23s(ODEFUN,[0 tf],IC);

subplot(2,4,3)
%figure(fig_num)
plot(t,s(:,3),'g','Linewidth',1.25)
xlabel('Time')
ylabel('Absorbance')
hold on
plot(t,s(:,4),'r','Linewidth',1.25)
errorbar(CO_LAC_WT_HFE_7_2_T,CO_LAC_WT_HFE_7_2_E(:,1),CO_LAC_WT_HFE_7_2_E(:,2),'g+') 
errorbar(CO_LAC_WT_HFE_7_2_T,CO_LAC_WT_HFE_7_2_S(:,1),CO_LAC_WT_HFE_7_2_S(:,2),'r+')
%legend('E.coli','Salmonella')
title('1F')
hold off
saveas(gcf,'1FCFU.png')

subplot(2,4,4)
%figure(fig_num)
xlabel('Time')
ylabel('Absorbance')
hold on
plot(t,s(:,3)+s(:,4),'k','Linewidth',1.25)
errorbar(CO_LAC_WT_HFE_7_2_TOT_T,CO_LAC_WT_HFE_7_2_TOT(:,1),CO_LAC_WT_HFE_7_2_TOT(:,2),'k+')
%legend('E.coli','Salmonella')
title('1F')
hold off
saveas(gcf,'1FPR.png')

A=[t, s(:,3), s(:,4), s(:,3)+s(:,4)];
filename = '1F.csv';
csvwrite(filename,A)

%fig_num=fig_num+1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plotting co-culture without DTPA, exp 1G
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mutant=0;
DTPA=0;
ECalone=0;
S_alone=0;

IC=[4 0 CO_LAC_WT_HFE_5_1_E(1,1) CO_LAC_WT_HFE_5_1_S(1,1)];
tf=CO_LAC_WT_HFE_5_1_T(end);
[t,s]=ode23s(ODEFUN,[0 tf],IC);

subplot(2,4,5)
%figure(fig_num)
plot(t,s(:,3),'g','Linewidth',1.25)
xlabel('Time')
ylabel('Absorbance')
hold on
plot(t,s(:,4),'r','Linewidth',1.25)
errorbar(CO_LAC_WT_HFE_5_1_T,CO_LAC_WT_HFE_5_1_E(:,1),CO_LAC_WT_HFE_5_1_E(:,2),'g+') 
errorbar(CO_LAC_WT_HFE_5_1_T,CO_LAC_WT_HFE_5_1_S(:,1),CO_LAC_WT_HFE_5_1_S(:,2),'r+')
%legend('E.coli','Salmonella')
title('1G')
hold off
saveas(gcf,'1GCFU.png')

subplot(2,4,6)
%figure(fig_num)
xlabel('Time')
ylabel('Absorbance')
hold on
plot(t,s(:,3)+s(:,4),'k','Linewidth',1.25)
errorbar(CO_LAC_WT_HFE_5_1_TOT_T,CO_LAC_WT_HFE_5_1_TOT(:,1),CO_LAC_WT_HFE_5_1_TOT(:,2),'k+')
%legend('E.coli','Salmonella')
title('1G')
hold off
saveas(gcf,'1GPR.png')

A=[t, s(:,3), s(:,4), s(:,3)+s(:,4)];
filename = '1G.csv';
csvwrite(filename,A)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plotting co-culture without DTPA,  exp 1H
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mutant=0;
DTPA=0;
ECalone=0;
S_alone=0;

IC=[4 0 CO_LAC_WT_HFE_5_1_E(1,3) CO_LAC_WT_HFE_5_1_S(1,3)];
tf=CO_LAC_WT_HFE_5_1_T(end);
[t,s]=ode23s(ODEFUN,[0 tf],IC);

subplot(2,4,7)
%figure(fig_num)
plot(t,s(:,3),'g','Linewidth',1.25)
xlabel('Time')
ylabel('Absorbance')
hold on
plot(t,s(:,4),'r','Linewidth',1.25)
errorbar(CO_LAC_WT_HFE_5_1_T,CO_LAC_WT_HFE_5_1_E(:,3),CO_LAC_WT_HFE_5_1_E(:,4),'g+') 
errorbar(CO_LAC_WT_HFE_5_1_T,CO_LAC_WT_HFE_5_1_S(:,3),CO_LAC_WT_HFE_5_1_S(:,4),'r+')
%legend('E.coli','Salmonella')
title('1H')
hold off
saveas(gcf,'1HCFU.png')

subplot(2,4,8)
%figure(fig_num)
xlabel('Time')
ylabel('Absorbance')
hold on
plot(t,s(:,3)+s(:,4),'k','Linewidth',1.25)
errorbar(CO_LAC_WT_HFE_5_1_TOT_T,CO_LAC_WT_HFE_5_1_TOT(:,1),CO_LAC_WT_HFE_5_1_TOT(:,2),'k+')
%legend('E.coli','Salmonella')
title('1H')
hold off
saveas(gcf,'1HPR.png')


A=[t, s(:,3), s(:,4), s(:,3)+s(:,4)];
filename = '1H.csv';
csvwrite(filename,A)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plotting co-culture with DTPA, exp 2A
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fig_num=3;

mutant=0;
DTPA=100;
ECalone=0;
S_alone=0;


IC=[4 0 CO_LAC_WT_LFE_6_1_E(1,1) CO_LAC_WT_LFE_6_1_S(1,1)];
tf=max(CO_LAC_WT_LFE_6_1_T(end),CO_LAC_WT_LFE_6_1_TOT_T(end));
%tf=CO_LAC_WT_LFE_6_1_T(end);
[t,s]=ode23s(ODEFUN,[0 tf],IC);


figure(fig_num)
subplot(2,6,1)
plot(t,s(:,3),'g','Linewidth',1.25)
xlabel('Time')
ylabel('Absorbance')
hold on
plot(t,s(:,4),'r','Linewidth',1.25)
errorbar(CO_LAC_WT_LFE_6_1_T,CO_LAC_WT_LFE_6_1_E(:,1),CO_LAC_WT_LFE_6_1_E(:,2),'g+') 
errorbar(CO_LAC_WT_LFE_6_1_T,CO_LAC_WT_LFE_6_1_S(:,1),CO_LAC_WT_LFE_6_1_S(:,2),'r+')
legend('E.coli','Salmonella')
title('2A')
axis([0, tf, 0, 0.04])
hold off
saveas(gcf,'2ACFU.png')

subplot(2,6,2)
xlabel('Time')
ylabel('Absorbance')
hold on
plot(t,s(:,3)+s(:,4),'k','Linewidth',1.25)
errorbar(CO_LAC_WT_LFE_6_1_TOT_T,CO_LAC_WT_LFE_6_1_TOT(:,1),CO_LAC_WT_LFE_6_1_TOT(:,2),'k+')
legend('E.coli','Salmonella')
title('2A')
axis([0, tf, 0, 0.04])
hold off
saveas(gcf,'2APR.png')


A=[t, s(:,3), s(:,4), s(:,3)+s(:,4)];
filename = '2A.csv';
csvwrite(filename,A)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plotting co-culture with DTPA, exp 2B
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mutant=0;
DTPA=100;
ECalone=0;
S_alone=0;

IC=[4 0 CO_LAC_WT_LFE_6_1_E(1,3) CO_LAC_WT_LFE_6_1_S(1,3)];
tf=max(CO_LAC_WT_LFE_6_1_T(end),CO_LAC_WT_LFE_6_1_TOT_T(end));
%tf=CO_LAC_WT_LFE_6_1_T(end);
[t,s]=ode23s(ODEFUN,[0 tf],IC);

subplot(2,6,3)
figure(fig_num)
plot(t,s(:,3),'g','Linewidth',1.25)
xlabel('Time')
ylabel('Absorbance')
hold on
plot(t,s(:,4),'r','Linewidth',1.25)
errorbar(CO_LAC_WT_LFE_6_1_T,CO_LAC_WT_LFE_6_1_E(:,3),CO_LAC_WT_LFE_6_1_E(:,4),'g+') 
errorbar(CO_LAC_WT_LFE_6_1_T,CO_LAC_WT_LFE_6_1_S(:,3),CO_LAC_WT_LFE_6_1_S(:,4),'r+')
%legend('E.coli','Salmonella')
title('2B')
axis([0, tf, 0, 0.04])
hold off
saveas(gcf,'2BCFU.png')

subplot(2,6,4)
figure(fig_num)
xlabel('Time')
ylabel('Absorbance')
hold on
plot(t,s(:,3)+s(:,4),'k','Linewidth',1.25)
errorbar(CO_LAC_WT_LFE_6_1_TOT_T,CO_LAC_WT_LFE_6_1_TOT(:,3),CO_LAC_WT_LFE_6_1_TOT(:,4),'k+')
%legend('E.coli','Salmonella')
title('2B')
axis([0, tf, 0, 0.04])
hold off
saveas(gcf,'2BPR.png')

A=[t, s(:,3), s(:,4), s(:,3)+s(:,4)];
filename = '2B.csv';
csvwrite(filename,A)

DTPA=0;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plotting co-culture with DTPA, exp 2C
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mutant=0;
DTPA=100;
ECalone=0;
S_alone=0;

IC=[4 0 CO_LAC_WT_LFE_6_1_E(1,5) CO_LAC_WT_LFE_6_1_S(1,5)];
tf=max(CO_LAC_WT_LFE_6_1_T(end),CO_LAC_WT_LFE_6_1_TOT_T(end));
%tf=CO_LAC_WT_LFE_6_1_T(end);
[t,s]=ode23s(ODEFUN,[0 tf],IC);

subplot(2,6,5)
%figure(fig_num)
plot(t,s(:,3),'g','Linewidth',1.25)
xlabel('Time')
ylabel('Absorbance')
hold on
plot(t,s(:,4),'r','Linewidth',1.25)
errorbar(CO_LAC_WT_LFE_6_1_T,CO_LAC_WT_LFE_6_1_E(:,5),CO_LAC_WT_LFE_6_1_E(:,6),'g+') 
errorbar(CO_LAC_WT_LFE_6_1_T,CO_LAC_WT_LFE_6_1_S(:,5),CO_LAC_WT_LFE_6_1_S(:,6),'r+')
%legend('E.coli','Salmonella')
title('2C')
axis([0, tf, 0, 0.04])
hold off
saveas(gcf,'2CCFU.png')

subplot(2,6,6)
%figure(fig_num)
xlabel('Time')
ylabel('Absorbance')
hold on
plot(t,s(:,3)+s(:,4),'k','Linewidth',1.25)
errorbar(CO_LAC_WT_LFE_6_1_TOT_T,CO_LAC_WT_LFE_6_1_TOT(:,5),CO_LAC_WT_LFE_6_1_TOT(:,6),'k+')
%legend('E.coli','Salmonella')
title('2C')
axis([0, tf, 0, 0.04])
hold off
saveas(gcf,'2CPR.png')

A=[t, s(:,3), s(:,4), s(:,3)+s(:,4)];
filename = '2C.csv';
csvwrite(filename,A)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plotting co-culture with DTPA, exp 2D
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


mutant=0;
DTPA=100;
ECalone=0;
S_alone=0;

IC=[4 0 CO_LAC_WT_LFE_6_1_E(1,7) CO_LAC_WT_LFE_6_1_S(1,7)];
tf=max(CO_LAC_WT_LFE_6_1_T(end),CO_LAC_WT_LFE_6_1_TOT_T(end));
%tf=CO_LAC_WT_LFE_6_1_T(end);
[t,s]=ode23s(ODEFUN,[0 tf],IC);

subplot(2,6,7)
%figure(fig_num)
plot(t,s(:,3),'g','Linewidth',1.25)
xlabel('Time')
ylabel('Absorbance')
hold on
plot(t,s(:,4),'r','Linewidth',1.25)
errorbar(CO_LAC_WT_LFE_6_1_T,CO_LAC_WT_LFE_6_1_E(:,7),CO_LAC_WT_LFE_6_1_E(:,8),'g+') 
errorbar(CO_LAC_WT_LFE_6_1_T,CO_LAC_WT_LFE_6_1_S(:,7),CO_LAC_WT_LFE_6_1_S(:,8),'r+')
%legend('E.coli','Salmonella')
title('2D')
axis([0, tf, 0, 0.04])
hold off
saveas(gcf,'2DCFU.png')

subplot(2,6,8)
%figure(fig_num)
xlabel('Time')
ylabel('Absorbance')
hold on
plot(t,s(:,3)+s(:,4),'k','Linewidth',1.25)
errorbar(CO_LAC_WT_LFE_6_1_TOT_T,CO_LAC_WT_LFE_6_1_TOT(:,7),CO_LAC_WT_LFE_6_1_TOT(:,8),'k+')
%legend('E.coli','Salmonella')
title('2D')
axis([0, tf, 0, 0.04])
hold off
saveas(gcf,'2DPR.png')


A=[t, s(:,3), s(:,4), s(:,3)+s(:,4)];
filename = '2D.csv';
csvwrite(filename,A)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plotting co-culture with DTPA, exp 2E
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



mutant=0;
DTPA=100;
ECalone=0;
S_alone=0;

IC=[4 0 CO_LAC_WT_LFE_6_2_E(1,1) CO_LAC_WT_LFE_6_2_S(1,1)];
tf=max(CO_LAC_WT_LFE_6_2_T(end),CO_LAC_WT_LFE_6_2_TOT_T(end));
%tf=CO_LAC_WT_LFE_6_2_T(end);
[t,s]=ode23s(ODEFUN,[0 tf],IC);

subplot(2,6,9)
%figure(fig_num)
plot(t,s(:,3),'g','Linewidth',1.25)
xlabel('Time')
ylabel('Absorbance')
hold on
plot(t,s(:,4),'r','Linewidth',1.25)
errorbar(CO_LAC_WT_LFE_6_2_T,CO_LAC_WT_LFE_6_2_E(:,1),CO_LAC_WT_LFE_6_2_E(:,2),'g+') 
errorbar(CO_LAC_WT_LFE_6_2_T,CO_LAC_WT_LFE_6_2_S(:,1),CO_LAC_WT_LFE_6_2_S(:,2),'r+')
%legend('E.coli','Salmonella')
title('2E')
axis([0, tf, 0, 0.04])
hold off
saveas(gcf,'2ECFU.png')

subplot(2,6,10)
%figure(fig_num)
xlabel('Time')
ylabel('Absorbance')
hold on
plot(t,s(:,3)+s(:,4),'k','Linewidth',1.25)
errorbar(CO_LAC_WT_LFE_6_2_TOT_T,CO_LAC_WT_LFE_6_2_TOT(:,1),CO_LAC_WT_LFE_6_2_TOT(:,2),'k+')
%legend('E.coli','Salmonella')
title('2E')
axis([0, tf, 0, 0.04])
hold off
saveas(gcf,'2EPR.png')


A=[t, s(:,3), s(:,4), s(:,3)+s(:,4)];
filename = '2E.csv';
csvwrite(filename,A)


fig_num=4;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plotting co-culture without DTPA, exp 3A
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mutant=1;
DTPA=0;
ECalone=0;
S_alone=0;

IC=[4 0 CO_LAC_MU_HFE_6_1_E(1,1) CO_LAC_MU_HFE_6_1_S(1,1)];
tf=CO_LAC_MU_HFE_6_1_T(end);
[t,s]=ode23s(ODEFUN,[0 tf],IC);

figure(fig_num)
subplot(2,2,1)
plot(t,s(:,3),'g','Linewidth',1.25)
xlabel('Time')
ylabel('Absorbance')
hold on
plot(t,s(:,4),'r','Linewidth',1.25)
plot(t,s(:,3)+s(:,4),'k','Linewidth',1.25)
errorbar(CO_LAC_MU_HFE_6_1_T,CO_LAC_MU_HFE_6_1_E(:,1),CO_LAC_MU_HFE_6_1_E(:,2),'g+')  
errorbar(CO_LAC_MU_HFE_6_1_T,CO_LAC_MU_HFE_6_1_S(:,1),CO_LAC_MU_HFE_6_1_S(:,2),'r+')
errorbar(CO_LAC_MU_HFE_6_1_TOT_T,CO_LAC_MU_HFE_6_1_TOT(:,1),CO_LAC_MU_HFE_6_1_TOT(:,2),'k+')
%legend('E.coli','Salmonella')
title('3A')
hold off
saveas(gcf,'3A.png')

A=[t, s(:,3), s(:,4), s(:,3)+s(:,4)];
filename = '3A.csv';
csvwrite(filename,A)

%fig_num=fig_num+1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plotting co-culture without DTPA, exp 3B
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mutant=1;
DTPA=0;
ECalone=0;
S_alone=0;

IC=[4 0 CO_LAC_MU_HFE_6_1_E(1,3) CO_LAC_MU_HFE_6_1_S(1,3)];
tf=CO_LAC_MU_HFE_6_1_T(end);
[t,s]=ode23s(ODEFUN,[0 tf],IC);

subplot(2,2,2)
%figure(fig_num)
plot(t,s(:,3),'g','Linewidth',1.25)
xlabel('Time')
ylabel('Absorbance')
hold on
plot(t,s(:,4),'r','Linewidth',1.25)
plot(t,s(:,3)+s(:,4),'k','Linewidth',1.25)
errorbar(CO_LAC_MU_HFE_6_1_T,CO_LAC_MU_HFE_6_1_E(:,3),CO_LAC_MU_HFE_6_1_E(:,4),'g+')  
errorbar(CO_LAC_MU_HFE_6_1_T,CO_LAC_MU_HFE_6_1_S(:,3),CO_LAC_MU_HFE_6_1_S(:,4),'r+')
errorbar(CO_LAC_MU_HFE_6_1_TOT_T,CO_LAC_MU_HFE_6_1_TOT(:,3),CO_LAC_MU_HFE_6_1_TOT(:,4),'k+')
%legend('E.coli','Salmonella')
title('3B')
hold off
saveas(gcf,'3B.png')


A=[t, s(:,3), s(:,4), s(:,3)+s(:,4)];
filename = '3B.csv';
csvwrite(filename,A)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plotting co-culture without DTPA, exp 3C
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mutant=1;
DTPA=0;
ECalone=0;
S_alone=0;

IC=[4 0 CO_LAC_MU_HFE_6_1_E(1,5) CO_LAC_MU_HFE_6_1_S(1,5)];
tf=CO_LAC_MU_HFE_6_1_T(end);
[t,s]=ode23s(ODEFUN,[0 tf],IC);

subplot(2,2,3)
%figure(fig_num)
plot(t,s(:,3),'g','Linewidth',1.25)
xlabel('Time')
ylabel('Absorbance')
hold on
plot(t,s(:,4),'r','Linewidth',1.25)
plot(t,s(:,3)+s(:,4),'k','Linewidth',1.25)
errorbar(CO_LAC_MU_HFE_6_1_T,CO_LAC_MU_HFE_6_1_E(:,5),CO_LAC_MU_HFE_6_1_E(:,6),'g+')  
errorbar(CO_LAC_MU_HFE_6_1_T,CO_LAC_MU_HFE_6_1_S(:,5),CO_LAC_MU_HFE_6_1_S(:,6),'r+')
errorbar(CO_LAC_MU_HFE_6_1_TOT_T,CO_LAC_MU_HFE_6_1_TOT(:,5),CO_LAC_MU_HFE_6_1_TOT(:,6),'k+')
%legend('E.coli','Salmonella')
title('3C')
hold off
saveas(gcf,'3C.png')


A=[t, s(:,3), s(:,4), s(:,3)+s(:,4)];
filename = '3C.csv';
csvwrite(filename,A)



% 
end


function dS=colicin_dt(t,x)

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
%E_dt=Fe*Y_E*k_LE*L*E + Fe*Y_E*k_GE*G*E   -colicin_death_rate*E*S/(Fe^2);
E_dt=Fe*Y_E*k_LE*L*E   -colicin_death_rate*E*S/(Fe^2);
%G_dt=2*k_LG*colicin_death_rate*E*S*L/(Fe^2)-G*(k_GS*S+k_GE*E);
G_dt=2*k_LG*colicin_death_rate*E*S*L/(Fe^2)-G*(k_GS*S);
S_dt=byproduct_growth*Fe*Y_E*k_LE*L*E+Fe*Y_S*k_GS*G*S;

% Output
dS=[L_dt;G_dt;E_dt;S_dt];


end