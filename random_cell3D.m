
function MDL=random_cell3D(params) %Function defining the drift and diffusion vectors needed to run the PRW model

%vx=p(1)
%vy=p(2)
%vz=p(3)
%x=p(4)
%y=p(5)
%z=p(6)

%this is the drift vector in the SDE
%the first 3 components are vx, vy and vz
%the 4th, 5th and 6th components represent dx/dt=vx; dy/dt=vy; dz/dt=vz (x, y and z)

 F = @(t,p)[-p(1)/params.P;...
            -p(2)/params.P;...
            -p(3)/params.P;...
            p(1);...
            p(2);...
            p(3)];% updating the drift
       
  
 %this is the diffusion tensor in the SDE
 %6x6 since S is 6-dimensional but diffusion only in three directions
   G=@(t,p)[sqrt(2/3)*params.S/sqrt(params.P) 0 0 0 0 0 ;...
            0  sqrt(2/3)*params.S/sqrt(params.P) 0 0 0 0 ;...
            0 0 sqrt(2/3)*params.S/sqrt(params.P) 0 0 0 ;...
            0 0 0 0 0 0;...
            0 0 0 0 0 0;...
            0 0 0 0 0 0            ]; %% updating the diffusion function
   
%construct the SDE with specified initial conditions 
MDL = sde(F,G,'StartState', [params.vx0;params.vy0;params.vz0;params.x0;params.y0;params.z0],'StartTime',params.t0);


end