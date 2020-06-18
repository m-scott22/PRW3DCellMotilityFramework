clear all
close all

% Create Alltraj, an array, for experimental data from chosen spheroid  

% Load raw data
load('CTRL1_trim')
ctrl=1 %spheroid number to append

% data_sPos (n x 9): One row per spot with the following columns
% - X pos (um from origin)
% - Y pos (um from origin)
% - Z pos (um from origin)
% - NaN ?
% - NaN ?- Originally strings denoting (Unit|Category|Collection)
% - NaN ?
% - Frame Number ( The interval between frames is 180s.)
% - Track ID (integer + 10^9)
% - Unique Spot ID


% Carry out simulations for 100000 spots only
data_sPos=data_sPos(1:100000,:);
%%
DT=180/3600; %time measured in hours
% Define T as time by frame number and make it unique as there are several
% cells for each frame
T=unique(data_sPos(:,7));

% Max frame number is last time
max_frames=max(T);

% Maximum track ID is number of cells
Ncells=max(data_sPos(:,8)-10^9)+1; %track ID starts at 0
%%
% Find data for first frame number
index=find(data_sPos(:,7)==1);

% Create initial position vector to fill
Initialpos=NaN(Ncells,6);

% Define initial position for each track ID as x,y,z triple in frame 1 and
% create initial position vector
for i=1:length(index)
datapt=index(i);

Xpos=data_sPos(datapt,1);
Ypos=data_sPos(datapt,2);
Zpos=data_sPos(datapt,3);

trackID=data_sPos(datapt,8)-10^9+1;

Initialpos(trackID,4)=Xpos;
Initialpos(trackID,5)=Ypos;
Initialpos(trackID,6)=Zpos;
end
%%
% Create a master array to store x, y, z position for each
% cell and subtract initial position

Alltraj=NaN(Ncells,max_frames,6);
for datapt=1:length(data_sPos)
    
Xpos=data_sPos(datapt,1);
Ypos=data_sPos(datapt,2);
Zpos=data_sPos(datapt,3);

FrameNumber=data_sPos(datapt,7);

trackID=data_sPos(datapt,8)-10^9+1;

Alltraj(trackID,FrameNumber,4)=Xpos-Initialpos(trackID,4);
Alltraj(trackID,FrameNumber,5)=Ypos-Initialpos(trackID,5);
Alltraj(trackID,FrameNumber,6)=Zpos-Initialpos(trackID,6);
end
%%
%Compute and store x,y,z components of velocity
for datapt=1:length(data_sPos)
    
FrameNumber=data_sPos(datapt,7);

trackID=data_sPos(datapt,8)-10^9+1;
TL=length(Alltraj(trackID,:,4));

if FrameNumber+1>TL
Alltraj(trackID,FrameNumber,1)=NaN;
Alltraj(trackID,FrameNumber,2)=NaN;
Alltraj(trackID,FrameNumber,3)=NaN;
else
Alltraj(trackID,FrameNumber,1)=(Alltraj(trackID,FrameNumber+1,4)-Alltraj(trackID,FrameNumber,4))/DT;
Alltraj(trackID,FrameNumber,2)=(Alltraj(trackID,FrameNumber+1,5)-Alltraj(trackID,FrameNumber,5))/DT;
Alltraj(trackID,FrameNumber,3)=(Alltraj(trackID,FrameNumber+1,6)-Alltraj(trackID,FrameNumber,6))/DT;
end
end

% Plot trajectories for each cell
%figure
%maxtraj=100;
%Ntraj=min(maxtraj, max(data_sPos(:,8)-10^9));
%for traj=1:Ntraj
    
%index=find(data_sPos(:,8)==traj+10^9);

%Xpos=data_sPos(index,1);
%Ypos=data_sPos(index,2);
%Zpos=data_sPos(index,3);

%plot3(Xpos,Ypos,Zpos)
%xlabel('x')
%ylabel('y')
%zlabel('z')
%hold on
%hold all
%end
%grid on
%axis square

%Save the data
save(['Alltrajdata',num2str(ctrl)])



