clear all
close all

alphaP=0.05; %for parameter P confidence intervals

%Load dataset 1
load('PRW3DsimS1P1dt001nP1000nC1000.mat');
mse=0.5; %MSE threshold for P estimate
%Analyse RMSS, VACF, MSD
[Tj1,YP1,P1,logACF1,P_lower1,P_upper1]=velocitycuttinginsilico(Alltraj,Ncells,T,alphaP,mse);
f1 = figure('PaperSize',[20.98 29.68],'PaperPosition',[1 5 30 18],'DefaultAxesFontSize',14);
fighandle(1)=subplot(2,3,1);
plot(Tj1,YP1,'Color','r','LineWidth',1.5)
hold on
plot(T,logACF1,'Color','k')
xlabel('Time')
ylabel('ln(VACF)')
xlim([0 4])
ylim([-4 0])

%Load dataset 2
load('PRW3DsimS1P1dt01nP1000nC1000.mat')
%Analyse RMSS, VACF, MSD
[Tj2,YP2,P2,logACF2,P_lower2,P_upper2]=velocitycuttinginsilico(Alltraj,Ncells,T,alphaP,mse);
fighandle(2)=subplot(2,3,2);
plot(Tj2,YP2,'Color','r','LineWidth',1.5)
hold on
plot(T,logACF2,'Color','k')
xlabel('Time')
ylabel('ln(VACF)')
xlim([0 4])
ylim([-4 0])

%Load dataset 3
load('PRW3DsimS1P1dt1nP1000nC1000.mat')
%Analyse RMSS, VACF, MSD
[Tj3,YP3,P3,logACF3,P_lower3,P_upper3]=velocitycuttinginsilico(Alltraj,Ncells,T,alphaP,mse);
fighandle(3)=subplot(2,3,3);
plot(Tj3,YP3,'Color','r','LineWidth',1.5)
hold on
plot(T,logACF3,'Color','k')
xlabel('Time')
ylabel('ln(VACF)')
xlim([0 4])
ylim([-4 0])

%Load dataset 4
load('PRW3DsimS1P10dt001nP1000nC1000.mat')
%Analyse RMSS, VACF, MSD
[Tj4,YP4,P4,logACF4,P_lower4,P_upper4]=velocitycuttinginsilico(Alltraj,Ncells,T,alphaP,mse);
fighandle(4)=subplot(2,3,4);
plot(Tj4,YP4,'Color','r','LineWidth',1.5)
hold on
plot(T,logACF4,'Color','k')
xlabel('Time')
ylabel('ln(VACF)')
xlim([0 10])
ylim([-2.5 0])

%Load dataset 5
load('PRW3DsimS1P10dt01nP1000nC1000.mat')
%Analyse RMSS, VACF, MSD
[Tj5,YP5,P5,logACF5,P_lower5,P_upper5]=velocitycuttinginsilico(Alltraj,Ncells,T,alphaP,mse);
fighandle(5)=subplot(2,3,5);
plot(Tj5,YP5,'Color','r','LineWidth',1.5)
hold on
plot(T,logACF5,'Color','k')
xlabel('Time')
ylabel('ln(VACF)')
xlim([0 10])
ylim([-2.5 0])

%Load dataset 6
load('PRW3DsimS1P10dt1nP1000nC1000.mat')
%Analyse RMSS, VACF, MSD
[Tj6,YP6,P6,logACF6,P_lower6,P_upper6]=velocitycuttinginsilico(Alltraj,Ncells,T,alphaP,mse);
fighandle(6)=subplot(2,3,6);
plot(Tj6,YP6,'Color','r','LineWidth',1.5)
hold on
plot(T,logACF6,'Color','k')
xlabel('Time')
ylabel('ln(VACF)')
xlim([0 10])
ylim([-2.5 0])

%% Add sublabels
htext=altsublabel(fighandle,0,-20);


%Save figure
%print('VACFanalysis3d', '-djpeg', '-r500')
