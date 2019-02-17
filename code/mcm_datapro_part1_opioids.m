A = MCMopioidsdata;
As = MCMopioidsdata1;
[m,n] = size(A);
%A1 = {2010 2011 2012 2013 2014 2015 2016 2017};
%A2 = {'KY';'OH';'PA';'VA';'WV'};
%import position variables
KYx = KY(:,9);
KYy = KY(:,10);
[mk,nk] = size(KY);
OHx = OH(:,9);
OHy = OH(:,10);
[mo,no] = size(OH);
PAx = PA(:,9);
PAy = PA(:,10);
[mp,np] = size(PA);
VAx = VA(:,9);
VAy = VA(:,10);
[mv,nv] = size(VA);
WVx = WV(:,9);
WVy = WV(:,10);
[mw,nw] = size(WV);

mtot = [mk,mo,mp,mv,mw];
mtotal = [0,mk,mk+mo,mk+mo+mp,mk+mo+mp+mv];
Stotal = [KY;OH;PA;VA;WV];
[ms,~] = size(Stotal);
Xtotal = [KYx;OHx;PAx;VAx;WVx];
Ytotal = [KYy;OHy;PAy;VAy;WVy];
Sheet = 2010:1:2017;

%strcmpi ignore case
for i = 1:m
    for j = 1:ms
        if isequal(As(i,6),Stotal(j,2))
            As(i,11) = Xtotal(j);
            As(i,12) = Ytotal(j);
        end
    end
end

xlswrite('synthetic_opioids_data.xlsx',As);   


