function [allvel] = histattime(Alltraj,Ncells,time) %Cut allvel to produce histogram up to required time

%plot histogram of speeds 
allvel=[];
for cell=1:Ncells
    for t=1:time
%    for each cell calculate speed as a function of time & concatenate with result for previous cell
      allvel=[allvel,sqrt(Alltraj(cell,t,1).^2+Alltraj(cell,t,2).^2+Alltraj(cell,t,3).^2)];
    end 
end
end