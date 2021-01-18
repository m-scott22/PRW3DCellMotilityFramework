%Conduct Anderson-Darling test on either full length tracks or at each time
%point over all cells and produce a histogram of p values

clear all
close all

%Load dataset
load('PRW3DsimS1P1dt001nP1000nC1000.mat'); 

%Get x components of velocities at all times
velocitiesx=zeros(length(Ncells),length(T));
for cell=1:Ncells
    for t=1:length(T)
        velocitiesx(cell,t)= Alltraj(cell,t,1);
    end 
end

for cell=1:Ncells
    track=Alltraj(cell,:,2);
    trackadj=track(~isnan(track)); %remove NaNs
    time1(cell)=length(trackadj); %Get lengths of each track
end

A=max(time1); 
B=find(time1==A);
C=find(time1==A-1);
D=[B,C];
E=sort(D);

fullvxtracks=velocitiesx(E,:); %velocities of tracks of length 148 and 149, cell by time
finalxvelocities=fullvxtracks(:,A-1); %vx at time 148

%Conduct AD test on 'final' x velocities i.e. velocities at time 148
[hx,px]=adtest(finalxvelocities)

subplot(1,3,1)
histogram(finalxvelocities) %histogram for visualisation of v_x
xlabel('v_x')


%Get y components of velocities at all times
velocitiesy=zeros(length(Ncells),length(T));
for cell=1:Ncells
    for t=1:length(T)
        velocitiesy(cell,t)= Alltraj(cell,t,2);
    end 
end

for cell=1:Ncells
    track=Alltraj(cell,:,2);
    trackadj=track(~isnan(track)); %remove NaNs
    time1(cell)=length(trackadj); %Get lengths of each track
end

A=max(time1); 
B=find(time1==A);
C=find(time1==A-1);
D=[B,C];
E=sort(D);

fullvytracks=velocitiesy(E,:); %velocities of tracks of length 148 and 149, cell by time
finalyvelocities=fullvytracks(:,A-1); %vx at time 148

%Conduct AD test on 'final' x velocities i.e. velocities at time 148
[hy,py]=adtest(finalyvelocities)

subplot(1,3,2)
histogram(finalyvelocities) %histogram for visualisation of v_y
xlabel('v_y')


%Get z components of velocities at all times
velocitiesz=zeros(length(Ncells),length(T));
for cell=1:Ncells
    for t=1:length(T)
        velocitiesz(cell,t)= Alltraj(cell,t,3);
    end 
end

for cell=1:Ncells
    track=Alltraj(cell,:,2);
    trackadj=track(~isnan(track)); %remove NaNs
    time1(cell)=length(trackadj); %Get lengths of each track
end

A=max(time1); 
B=find(time1==A);
C=find(time1==A-1);
D=[B,C];
E=sort(D);

fullvztracks=velocitiesz(E,:); %velocities of tracks of full, cell by time
finalzvelocities=fullvztracks(:,A-1); %vx at final

%Conduct AD test on 'final' x velocities 
[hz,pz]=adtest(finalzvelocities)

subplot(1,3,3)
histogram(finalzvelocities) %histogram for visualisation of v_z
xlabel('v_z')

%%
%Loop over p values to plot histogram for adtest at each time point over
%all cells
pvalx=NaN(length(T)-1,1);
hypx=NaN(length(T)-1,1);
  for t=1:length(T)-1
    vx=Alltraj(:,t,1);
    [h,p]=adtest(vx);
    pvalx(t)=p;
    hypx(t)=h;
end 

pvaly=NaN(length(T)-1,1);
hypy=NaN(length(T)-1,1);
  for t=1:length(T)-1
    vy=Alltraj(:,t,2);
    [h,p]=adtest(vy);
    pvaly(t)=p;
    hypy(t)=h;
end 

pvalz=NaN(length(T)-1,1);
hypz=NaN(length(T)-1,1);
  for t=1:length(T)-1
    vz=Alltraj(:,t,3);
    [h,p]=adtest(vz);
    pvalz(t)=p;
    hypz(t)=h;
  end 

%histogram for visualisation of p values across time points
figure
subplot(1,3,1)
histogram(pvalx)
xlabel('p value for v_x tests')
subplot(1,3,2)
histogram(pvaly)
xlabel('p value for v_y tests')
subplot(1,3,3)
histogram(pvalz)
xlabel('p value for v_z tests')
