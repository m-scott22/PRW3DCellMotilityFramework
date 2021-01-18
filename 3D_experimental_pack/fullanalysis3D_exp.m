clear all
close all

% Load first dataset
load('Alltrajdata1.mat')
T=DT*T; %Set timescale
alphaS=0.05; %alpha for S parameter confidence intervals
alphaP=0.05; %alpha for P parameter confidence intervals
mse=0.5; %MSE threshold for cut off in P estimates
Ncells=i;

%Analyse data (RMSS, VACF, speed histograms, MSD, S and P estimates and CIs)
 [rootmeansquspeed1,S_est1,ne1,S_lower1,S_upper1,x1,normalized1,allvel1,v1,g1,YP1,Tj1,P_est1,logACF1,P_lower1,P_upper1,MSD1,YM1,lnACF]=sphanalysis(Alltraj,ACF0,TL,Ncells,T,alphaS,alphaP,mse);

%Plot RMSS over time for spheroid 1
f1 = figure('PaperSize',[20.98 29.68],'PaperPosition',[1 5 50 18],'DefaultAxesFontSize',14);
h(1)=subplot(3,4,1);
plot(T,rootmeansquspeed1,'g','LineWidth',1.5)
xlabel('Time (h)')
ylabel('RMSS')
hold on
line([0,TL*DT],[S_est1,S_est1],'Color','r','LineWidth',1.5)
axis([0 TL*DT min(rootmeansquspeed1) max(rootmeansquspeed1)])
hold on
line([0,length(rootmeansquspeed1)],[S_upper1,S_upper1],'LineStyle','--','Color','k','LineWidth',1.5)
hold on
line([0,length(rootmeansquspeed1)],[S_lower1,S_lower1],'LineStyle','--','Color','k','LineWidth',1.5)

%Plot log(VACF) and line of best fit for spheroid 1
h(2)=subplot(3,4,2);
Tt=[0;T];
plot(Tt,logACF1,'Color','k')
hold on
plot(Tj1,YP1,'Color','r','LineWidth',1.5)
xlim([0 0.5])
xlabel('Time (h)')
ylabel('ln(VACF)')

%Plot histogram of speeds 
h(3)=subplot(3,4,3);
bar(x1,normalized1,'c')
xlabel('Speed (um/h)')
axis([0 max(allvel1) 0 0.05])
hold on
plot(v1,g1,'r','LineWidth',1.5)
hold on

%Plot MSD, calculated and model predicted, with line of best fit to
%calculated
h(4)=subplot(3,4,4);

%Plot calculated MSD
plot(T,MSD1,'k','LineWidth',1.5)
xlabel('Time (h)')
ylabel('MSD')
axis([0 TL*DT 0 max(MSD1)])
hold on

%Plot line of best fit
plot(T,YM1,'k','LineStyle','--','LineWidth',1.5)
hold on

%Plot the theoretical value using estimates
plot(T,(2.*(S_est1^2).*(P_est1^2).*(exp(-T./P_est1)+(T./P_est1)-1)),'r','LineWidth',1.5);

%%
%Load second dataset
load('Alltrajdata2.mat')
T=DT*T; %Set timescale
Ncells=i;

%Analyse data (RMSS, VACF, speed histograms, MSD, S and P estimates and CIs)
[rootmeansquspeed2,S_est2,ne2,S_lower2,S_upper2,x2,normalized2,allvel2,v2,g2,YP2,Tj2,P_est2,logACF2,P_lower2,P_upper2,MSD2,YM2,lnACF2]=sphanalysis(Alltraj,ACF0,TL,Ncells,T,alphaS,alphaP,mse);
%Plot RMSS over time for spheroid 2
h(5)=subplot(3,4,5);
plot(T,rootmeansquspeed2,'g','LineWidth',1.5)
xlabel('Time (h)')
ylabel('RMSS')
hold on
line([0,TL*DT],[S_est2,S_est2],'Color','r','LineWidth',1.5)
axis([0 TL*DT min(rootmeansquspeed2) max(rootmeansquspeed2)])
hold on
line([0,length(rootmeansquspeed2)],[S_upper2,S_upper2],'LineStyle','--','Color','k','LineWidth',1.5)
hold on
line([0,length(rootmeansquspeed2)],[S_lower2,S_lower2],'LineStyle','--','Color','k','LineWidth',1.5)

%Plot log(VACF) and line of best fit for spheroid 1
h(6)=subplot(3,4,6);
Tt=[0;T];
plot(Tt,logACF2,'Color','k')
hold on
plot(Tj2,YP2,'Color','r','LineWidth',1.5)
xlim([0 0.5])
xlabel('Time (h)')
ylabel('ln(VACF)')

%Plot histogram of speeds 
h(7)=subplot(3,4,7);
bar(x2,normalized2,'c')
xlabel('Speed (um/h)')
axis([0 max(allvel2) 0 0.05])
hold on
plot(v2,g2,'r','LineWidth',1.5)
hold on

%Plot MSD, calculated and model predicted, with line of best fit to
%calculated
h(8)=subplot(3,4,8);

%Plot calculated MSD
plot(T,MSD2,'k','LineWidth',1.5)
xlabel('Time (h)')
ylabel('MSD')
axis([0 TL*DT 0 max(MSD2)])
hold on

%Plot line of best fit
plot(T,YM2,'k','LineStyle','--','LineWidth',1.5)
hold on

% Plot the theoretical value using estimates
plot(T,(2.*(S_est2^2).*(P_est2^2).*(exp(-T./P_est2)+(T./P_est2)-1)),'r','LineWidth',1.5);


%%
% Load third dataset
load('Alltrajdata3.mat')
T=DT*T; %Set timescale
Ncells=i;

%Analyse data (RMSS, VACF, speed histograms, MSD, S and P estimates and CIs)
[rootmeansquspeed3,S_est3,ne3,S_lower3,S_upper3,x3,normalized3,allvel3,v3,g3,YP3,Tj3,P_est3,logACF3,P_lower3,P_upper3,MSD3,YM3,lnACF3]=sphanalysis(Alltraj,ACF0,TL,Ncells,T,alphaS,alphaP,mse);

%Plot RMSS over time for spheroid 3
h(9)=subplot(3,4,9);
plot(T,rootmeansquspeed3,'g','LineWidth',1.5)
xlabel('Time (h)')
ylabel('RMSS')
hold on
line([0,TL*DT],[S_est3,S_est3],'Color','r','LineWidth',1.5)
axis([0 TL*DT min(rootmeansquspeed3) max(rootmeansquspeed3)])
hold on
line([0,length(rootmeansquspeed3)],[S_upper3,S_upper3],'LineStyle','--','Color','k','LineWidth',1.5)
hold on
line([0,length(rootmeansquspeed3)],[S_lower3,S_lower3],'LineStyle','--','Color','k','LineWidth',1.5)

%Plot log(VACF) and line of best fit for spheroid 3
h(10)=subplot(3,4,10);
Tt=[0;T];
plot(Tt,logACF3,'Color','k')
hold on
plot(Tj3,YP3,'Color','r','LineWidth',1.5)
xlim([0 0.5])
xlabel('Time (h)')
ylabel('ln(VACF)')

%Plot histogram of speeds 
h(11)=subplot(3,4,11);
bar(x3,normalized3,'c')
xlabel('Speed (um/h)')
axis([0 max(allvel3) 0 0.05])
hold on
plot(v3,g3,'r','LineWidth',1.5)
hold on

%Plot MSD, calculated and model predicted, with line of best fit to
%calculated
h(12)=subplot(3,4,12);

%Plot calculated MSD
plot(T,MSD3,'k','LineWidth',1.5)
xlabel('Time (h)')
ylabel('MSD')
axis([0 TL*DT 0 max(MSD3)])
hold on

%Plot line of best fit
plot(T,YM3,'k','LineStyle','--','LineWidth',1.5)
hold on

% Plot the theoretical value using estimates
plot(T,(2.*(S_est3^2).*(P_est3^2).*(exp(-T./P_est3)+(T./P_est3)-1)),'r','LineWidth',1.5);


%%
%Add sublabels
htext=ctrlsublabel(h,0,-16);
 
%% %Save figure
%print('fullanalysis3d_exp', '-djpeg', '-r500')
