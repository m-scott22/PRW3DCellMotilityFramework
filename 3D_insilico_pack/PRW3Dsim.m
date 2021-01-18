clear all
close all

% Input parameter values for speed S and persistence time P
params.S=3;
params.P=1;


% Initialise cells at the origin
params.x0=0;
params.y0=0;
params.z0=0;


params.t0=0;
params.dt=0.01; %this is needed in the stochastic simulations, 
nPeriods=1000;  %total time is nPeriods*dt
params.Nsteps=100;

Ncells=70;

%for each cell
for cell=1:Ncells

    params.x0=0;
    params.y0=0;
    params.z0=0;

    %initialise random orientation
   
    %generate random number between -1 and 1
    params.vx0=2*rand-1;
    params.vy0=2*rand-1;
    params.vz0=2*rand-1;
     
    %normalise
    temp_speed=sqrt(params.vx0.^2+params.vy0.^2+params.vz0.^2);
    params.vx0= params.vx0*params.S/temp_speed;
    params.vy0=params.vy0*params.S/temp_speed;
    params.vz0=params.vz0*params.S/temp_speed;

    %simulate the SDE
    MDL=random_cell3D(params); 
    [S,T]=simByEuler(MDL, nPeriods,'DeltaTime',params.dt,'NSTEPS',params.Nsteps);

    %the output S(:,i) gives vx (i=1), vy (i=2), vz (i=3), x (i=4), y (i=5), z (i=6) as a
    %function of time
    
    
    %enter the data for this cell into a master array Alltraj
    [N,M]=size(S);
    for  i=1:N
        for j=1:M
            Alltraj(cell,i,j)=S(i,j);
        end
    end
    
end

%save(['PRW3Dsim','S',num2str(params.S),'P1','dt001','nP',num2str(nPeriods),'nC',num2str(Ncells)])
% save(['PRW3Dsim',num2str(params.S),num2str(params.P),num2str(nPeriods),num2str(Ncells),num2str(0005)])