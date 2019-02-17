A = MCMNFLISDataS1;
As = MCMNFLISDataS2;
[m,n] = size(A);
A1 = {2010 2011 2012 2013 2014 2015 2016 2017};
A2 = {'KY';'OH';'PA';'VA';'WV'};
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
Xtotal = [KYx;OHx;PAx;VAx;WVx];
Ytotal = [KYy;OHy;PAy;VAy;WVy];
Sheet = 2010:1:2017;
B = cell(450,7);
Bn = zeros(450,7);

k = 1;
%strcmpi ignore case
for year = 1:8
    for state = 1:5
        for i = 1:m
            if isequal(A(i,1),A1(year)) && isequal(A(i,2),A2(state))&& isequal(A(i,7),{"Heroin"})
                B(k,1) = A1(year);
                B(k,2) = A2(state);
                B(k,3) = A(i,3);
                Bn(k,year) = As(i,6);
                B(k,4) = {'Heroin'};
                B(k,5) = A(i,8);               
                for mt = 1:mtot(state)
                    if isequal(A(i,3),Stotal(mt + mtotal(state),4))
                        B(k,6) = Xtotal(mt + mtotal(state));
                        B(k,7) = Ytotal(mt + mtotal(state));                       
                        k = k + 1;
                    end
                end                
            end                        
        end        
    end 

    %xlswrite('preprocessed_data.xlsx',B,Sheet(year));
    k = 1;
    B = cell(450,7);
end