clear all
close all

% Load data
%load('PRW3DsimS1P1dt005nP1000nC1000.mat');
load('PRW3DsimS25P01dt005nP100nC550.mat');
xlim=nPeriods*params.dt; %set limit in x direction

%Analyse RMSS, VACF, MSD
alphaS=0.05; %for S parameter confidence intervals
alphaP=0.05; %for P parameter confidence intervals
mse=0.5; %MSE threshold for P estimate
[rootmeansquspeed,S_est,ne,S_lower,S_upper,~,~,~,~,g,~,~,P_est,~,P_lower,P_upper,MSD,YM]=sphanalysisinsilico(Alltraj,N,Ncells,T,alphaS,alphaP,mse);

%% Plot root mean square speed calculated over all cells at each time point
f1 = figure('PaperSize',[20.98 29.68],'PaperPosition',[1 5 45 18], 'DefaultAxesFontSize',14);
h(1)=subplot(3,4,[1,2,5,6]);
plot(T,rootmeansquspeed,'g','LineWidth',1.5)
xlabel('Time')
ylabel('RMSS')
hold on
line([0,length(rootmeansquspeed)],[S_est,S_est],'Color','r','LineWidth',1.5)
hold on
line([0,length(rootmeansquspeed)],[S_upper,S_upper],'LineStyle','--','Color','k','LineWidth',1.5)
hold on
line([0,length(rootmeansquspeed)],[S_lower,S_lower],'LineStyle','--','Color','k','LineWidth',1.5)
axis([0 xlim min(rootmeansquspeed) max(rootmeansquspeed)])


%% Plot calculated and model MSD with line of best fit

h(2)=subplot(3,4,[3,4,7,8]);
%Plot line of best fit
plot(T,YM,'k','LineStyle','--','LineWidth',1.5)
hold on
plot(T,MSD,'k','LineWidth',1.5)
xlabel('Time')
ylabel('MSD')
hold on
plot(T,(2.*(S_est^2).*(P_est^2).*(exp(-T./P_est)+(T./P_est)-1)),'r','LineWidth',1.5);


%% Plot histograms of speeds for chosen times

allvel=histattime(Alltraj,Ncells,5);
[u,x]=hist(allvel,50);
normalized=u/trapz(x,u);
h(3)=subplot(3,4,9);
bar(x,normalized,'c')
xlabel('Speed')
hold on

% Maxwell-Boltzmann density using estimates
v = linspace(0,3*S_est,100);
const = 4*pi*(1/((2/3)*pi*(S_est)^2))^1.5;
f = const.*v.^2.*exp(-1./(((2/3)*(S_est)^2)).*v.^2);
plot(v,f,'r','LineWidth',1.5)
axis([0 3*S_est 0 0.05])

%plot histogram of speeds for second chosen time
allvel=histattime(Alltraj,Ncells,10);
[u,x]=hist(allvel,50);
normalized=u/trapz(x,u);
h(4)=subplot(3,4,10);
bar(x,normalized,'c')
xlabel('Speed')
hold on

% Maxwell-Boltzmann density using estimates
v = linspace(0,3*S_est,50);
const = 4*pi*(1/((2/3)*pi*(S_est)^2))^1.5;
f = const.*v.^2.*exp(-1./(((2/3)*(S_est)^2)).*v.^2);
plot(v,f,'r','LineWidth',1.5)
axis([0 3*S_est 0 0.05])


%plot histogram of speeds for third chosen time
allvel=histattime(Alltraj,Ncells,50);
[u,x]=hist(allvel,50);
normalized=u/trapz(x,u);
h(5)=subplot(3,4,11);
bar(x,normalized,'c')
xlabel('Speed')
hold on

% Maxwell-Boltzmann density using estimates
v = linspace(0,3*S_est,100);
const = 4*pi*(1/((2/3)*pi*(S_est)^2))^1.5;
f = const.*v.^2.*exp(-1./(((2/3)*(S_est)^2)).*v.^2);
plot(v,f,'r','LineWidth',1.5)
axis([0 3*S_est 0 0.05])

%plot histogram of speeds for final chosen time
allvel=histattime(Alltraj,Ncells,100);
[u,x]=hist(allvel,50);
normalized=u/trapz(x,u);
h(6)=subplot(3,4,12);
bar(x,normalized,'c')
xlabel('Speed')
hold on

% Maxwell-Boltzmann density using estimates
v = linspace(0,3*S_est,100);
const = 4*pi*(1/((2/3)*pi*(S_est)^2))^1.5;
f = const.*v.^2.*exp(-1./(((2/3)*(S_est)^2)).*v.^2);
plot(v,f,'r','LineWidth',1.5)
axis([0 3*S_est 0 0.05])

%%

%Add sublabels
htext=mysublabel(h,0,-19);

%Save figure
print('speedanalysis3d', '-djpeg', '-r500')
