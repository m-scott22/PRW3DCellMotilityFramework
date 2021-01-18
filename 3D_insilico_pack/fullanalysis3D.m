clear all
close all

% Load data
load('PRW3DsimS25P01dt005nP100nC550.mat'); 
%load('PRW3DsimS1P1dt001nP1000nC1000.mat');
alphaS=0.05; %For S parameter confidence intervals
alphaP=0.05; %For P parameter confidence intervals
mse=5; %MSE threshold for P estimate cut off
%Analyse RMSS, VACF, MSD
[rootmeansquspeed,S_est,ne,S_lower,S_upper,x,normalized,allvel,v,g,YP,Tj,P_est,logACF,P_lower,P_upper,MSD,YM,lnACF]=sphanalysisinsilico(Alltraj,N,Ncells,T,alphaS,alphaP,mse);

%% Plot root mean square speed calculated over all cells at each time point, and S on graph

f1 = figure('PaperSize',[20.98 29.68],'PaperPosition',[1 5 30 18],'DefaultAxesFontSize',14);
h(1)=subplot(2,2,1);
plot(T,rootmeansquspeed,'g','LineWidth',1.5)
xlabel('Time')
ylabel('RMSS')
hold on
xlim=get(gca,'xlim');
line([0,101],[S_est,S_est],'Color','r','LineWidth',1.5)
hold on
line([0,101],[S_upper,S_upper],'LineStyle','--','Color','k','LineWidth',1.5)
hold on
line([0,101],[S_lower,S_lower],'LineStyle','--','Color','k','LineWidth',1.5)
axis([0 5 min(rootmeansquspeed) max(rootmeansquspeed)])

%% Plot log(ACF) and line of best fit

h(2)=subplot(2,2,2);
plot(T,logACF,'LineWidth',1.5,'Color','k')
%plot(T,logACF,'LineWidth',1.5,'Color','k')
hold on
plot(Tj,YP,'LineWidth',1.5,'Color','r')
xlabel('Time')
ylabel('ln(VACF)')
axis([0 0.5 -2 8])


%% Plot histogram of all speeds at all times and overlay Maxwell Boltzmann pdf using S_est (and params.S in in silico case)

%plot histogram of speeds 
h(3)=subplot(2,2,3);
bar(x,normalized,'c')
xlabel('Speed')
hold on

% Plot Maxwell-Boltzmann density using estimates
plot(v,g,'r','LineWidth',1.5)
hold on


%% Calculate MSD from data, plot with line of best fit and theoretical MSD

h(4)=subplot(2,2,4);
plot(T,MSD,'k','LineWidth',1.5)
xlabel('Time')
ylabel('MSD')
hold on

%Plot line of best fit
plot(T,YM,'k','LineStyle','--','LineWidth',1.5)
hold on

% Plot the theoretical value using estimates
plot(T,(2.*(S_est^2).*(P_est^2).*(exp(-T./P_est)+(T./P_est)-1)),'r','LineWidth',1.5);

%% Add sublabels
htext=sublabel(h,0,-20);
%% 
% %Save figure
%print('fullanalysis3D', '-djpeg', '-r1200')
