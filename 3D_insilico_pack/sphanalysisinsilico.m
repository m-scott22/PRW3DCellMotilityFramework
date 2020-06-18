function [rootmeansquspeed,S_est,ne,S_lower,S_upper,x,normalized,allvel,v,g,YP,Tj,P_est,logACF,P_lower,P_upper,MSD,YM]=sphanalysisinsilico(Alltraj,N,Ncells,T,alphaS,alphaP) 

%% Estimate S_est as root mean square speed averaged across all cells at all times

rootmeansquspeed=sqrt(nanmean(Alltraj(:,:,1).^2+Alltraj(:,:,2).^2+Alltraj(:,:,3).^2));
S_est=nanmean(rootmeansquspeed);

%% Plot root mean square speed calculated over all cells at each time point, and S on graph

%Compute confidence limits for S estimate
[ne,S_lower,S_upper]=RMSintervalinsilico(Alltraj,N,alphaS);

%% Plot VACF, lnVACF (and params.P theoretical VACF in in silico case)
% Estimate P_est as -1/grad for line of best fit with gradient grad 

[Tj,YP,P_est,logACF,P_lower,P_upper]=velocitycuttinginsilico(Alltraj,Ncells,T,alphaP);


%% Plot histogram of all speeds at all times and overlay Maxwell Boltzmann pdf using S_est (and params.S in in silico case)
allvel=[];
for cell=1:Ncells
%    for each cell calculate speed as a function of time & concatenate with result for previous cell
    allvel=[allvel,sqrt(Alltraj(cell,:,1).^2+Alltraj(cell,:,2).^2+Alltraj(cell,:,3).^2)];
end

[v,x]=hist(allvel,50);
normalized=v/trapz(x,v);

% Maxwell-Boltzmann density using estimates
v = linspace(0,4*S_est,100);
const = 4*pi*(1/((2/3)*pi*(S_est)^2))^1.5;
g = const.*v.^2.*exp(-1./(((2/3)*(S_est)^2)).*v.^2);


%% Calculate MSD from data, plot with line of best fit and theoretical MSD using S_e and P_e (and params.S, params.P in in silico case)

%compute the mean squared displacement over time, with average taken over
%all cells
MSD=nanmean((Alltraj(:,:,4).^2+Alltraj(:,:,5).^2+Alltraj(:,:,6).^2),1);

%Fit a line of best fit to the data
coeffs=fgls(T,MSD','numIter',10);
YM=coeffs(1)+coeffs(2)*T;

end
