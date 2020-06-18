function [ne,lower,upper]=RMSintervalinsilico(Alltraj,N,alphaS)

%Calculate RMSS
rootmeansquspeed=sqrt(nanmean(Alltraj(:,:,1).^2+Alltraj(:,:,2).^2+Alltraj(:,:,3).^2));
%Estimate S
S_est=nanmean(rootmeansquspeed);
%Estimate variance of S
varRMS=nanvar(rootmeansquspeed);

%Calculate equivalent sample size ne
acf=autocorr(rootmeansquspeed,1);
sum=0;
for t=1:N-1
    bit= 1-(t/N);
    sum_t = bit*(acf(2)^t);
    sum=sum+ sum_t;
end
int= 1 + 2*sum;
ne= N/int;

% Choose to use t or Z in interval calculation
if ne > 30
    critval=norminv(1-alphaS/2);
else
    critval=tinv(1-alphaS/2,ne-1);
end 

%Calculate 95% confidence interval
extra= critval*(sqrt(varRMS)/sqrt(ne));
lower=S_est - extra;
upper=S_est + extra;

end

