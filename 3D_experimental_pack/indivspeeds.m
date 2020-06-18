clear all
close all

%Load first dataset
load('Alltrajdata1.mat')
Ncells=i;
%Get speeds of all cells at all times
cellspeeds1=zeros(length(Ncells),length(T));
for cell=1:Ncells
    for t=1:length(T)
        temp_speed(t) = sqrt(Alltraj(cell,t,1)^2 + Alltraj(cell,t,2)^2 + Alltraj(cell,t,3)^2);
        cellspeeds1(cell,t)= temp_speed(t);
    end 
end

for cell=1:Ncells
    track=Alltraj(cell,:,2);
    trackadj=track(~isnan(track)); %remove NaNs
    time1(cell)=length(trackadj); %Get lengths of each track
end

A=max(time1); %149
B=find(time1==A);
C=find(time1==148);
D=[B,C];
E=sort(D);

fulltracks1=cellspeeds1(E,:); %tracks of length 148 and 149, cell by time

f1 = figure('PaperSize',[20.98 29.68],'PaperPosition',[1 5 60 18]);
h(1)=subplot(1,3,1);
Me_fulltracks=mean(fulltracks1,2,'omitnan');
maxsp=max(Me_fulltracks);
medsp=median(Me_fulltracks);
minsp=min(Me_fulltracks);
T=[1 0 0
    0 1 0];
x=[minsp
    maxsp];
Nlongtracks=size(fulltracks1,1);
map = interp1(x,T,Me_fulltracks);

for cell=1:size(fulltracks1,1)
meansp=mean(fulltracks1(cell,:),'omitnan');
index=find(Me_fulltracks==meansp);
plot(fulltracks1(cell,:),'color',map(index,:))
hold on
xlabel('Timestep')
ylabel('Speed (um/h)')
title('Spheroid 1')
end

%Load second dataset
load('Alltrajdata2.mat')
Ncells=i;
%Get speeds of all cells at all times
cellspeeds2=zeros(length(Ncells),length(T));
for cell=1:Ncells
    for t=1:length(T)
        temp_speed(t) = sqrt(Alltraj(cell,t,1)^2 + Alltraj(cell,t,2)^2 + Alltraj(cell,t,3)^2);
        cellspeeds2(cell,t)= temp_speed(t);
    end 
end

for cell=1:Ncells
    track=Alltraj(cell,:,2);
    trackadj=track(~isnan(track)); %remove NaNs
    time2(cell)=length(trackadj); %Get lengths of each track
end

A=max(time2); %93
B=find(time2==A);

fulltracks2=cellspeeds2(B,:); %tracks of length 148 and 149, cell by time

h(2)=subplot(1,3,2);
Me_fulltracks=mean(fulltracks2,2,'omitnan');
maxsp=max(Me_fulltracks);
medsp=median(Me_fulltracks);
minsp=min(Me_fulltracks);
T=[1 0 0
    0 1 0];
x=[minsp
    maxsp];
Nlongtracks=size(fulltracks2,1);
map = interp1(x,T,Me_fulltracks);

for cell=1:size(fulltracks2,1)
meansp=mean(fulltracks2(cell,:),'omitnan');
index=find(Me_fulltracks==meansp);
plot(fulltracks2(cell,:),'color',map(index,:))
hold on
xlabel('Timestep')
ylabel('Speed (um/h)')
title('Spheroid 2')
end


%Load third dataset
load('Alltrajdata3.mat')
Ncells=i;
%Get speeds of all cells at all times
cellspeeds3=zeros(length(Ncells),length(T));
for cell=1:Ncells
    for t=1:length(T)
        temp_speed(t) = sqrt(Alltraj(cell,t,1)^2 + Alltraj(cell,t,2)^2 + Alltraj(cell,t,3)^2);
        cellspeeds3(cell,t)= temp_speed(t);
    end 
end

for cell=1:Ncells
    track=Alltraj(cell,:,2);
    trackadj=track(~isnan(track)); %remove NaNs
    time3(cell)=length(trackadj); %Get lengths of each track
end

A=max(time3); %78
B=find(time3==A);
fulltracks3=cellspeeds3(B,:); %tracks of length 148 and 149, cell by time

h(3)=subplot(1,3,3);
Me_fulltracks=mean(fulltracks3,2,'omitnan');
maxsp=max(Me_fulltracks);
medsp=median(Me_fulltracks);
minsp=min(Me_fulltracks);
T=[1 0 0
    0 1 0];
x=[minsp
    maxsp];
Nlongtracks=size(fulltracks3,1);
map = interp1(x,T,Me_fulltracks);

for cell=1:size(fulltracks3,1)
meansp=mean(fulltracks3(cell,:),'omitnan');
index=find(Me_fulltracks==meansp);
plot(fulltracks3(cell,:),'color',map(index,:))
hold on
xlabel('Timestep')
ylabel('Speed (um/h)')
title('Spheroid 3')
end

%Add sublabels
htext=altsublabels(h,0,-20);

%Save figure
%print('speeds', '-djpeg', '-r500')

