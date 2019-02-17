%   MCM_C PART1

clear;
clc;

%   set the correlation coefficent of each possible factor of synthetic
%   opioid
wo = 0.1006094;         % HOUSEHOLDS BY TYPE - Households with one or more people under 18 years   
wcj = 0.0428767;        % PLACE OF BIRTH - Total population
wbb = -0.069315;        % PLACE OF BIRTH - Total population
wbh = -0.1604505;       % EDUCATIONAL ATTAINMENT - Population 25 years and over
wbk = -0.0565836;       % EDUCATIONAL ATTAINMENT - High school graduate (includes equivalency)
wbn = 0.1024029;        % EDUCATIONAL ATTAINMENT - Bachelor's degree
wbr = 0.1051412;        % VETERAN STATUS - Civilian population 18 years and over
wdl = -0.1203898;       % EDUCATIONAL ATTAINMENT - Some college, no degree
wec = 0.0144962;        % ANCESTRY ¨C German
wbu = 0.000114;         % DISABILITY STATUS OF THE CIVILIAN NONINSTITUTIONALIZED POPULATION - With a disability
wal = 0.0423417;       % FERTILITY - Number of women 15 to 50 years old who had a birth in the past 12 months
wp = -0.0307825;        % HOUSEHOLDS BY TYPE - Households with one or more people 65 years and over
wbs = -0.0529627;       % VETERAN STATUS - Civilian veterans
ww = 0.0643631;         % RELATIONSHIP - Other relatives

%   set the change of these factors
deltao = 0;
deltacj = 0;
deltabb = 0;
deltabh = 0;
deltabk = 15;
deltabn = 0;
deltabr = 0;
deltadl = 15;
deltaec = 0;
deltabu = 0;
deltaal = 0;
deltap = 0;
deltabs = 0;
deltaw = 0;

%   data input
%   data for Heroin
data_h = xlsread('Part1_Heroin_data_combined', 'Sheettotal');
data_h_10 = xlsread('Part1_Heroin_data_combined', 'Sheet2010');
data_h_11 = xlsread('Part1_Heroin_data_combined', 'Sheet2011');
data_h_12 = xlsread('Part1_Heroin_data_combined', 'Sheet2012');
data_h_13 = xlsread('Part1_Heroin_data_combined', 'Sheet2013');
data_h_14 = xlsread('Part1_Heroin_data_combined', 'Sheet2014');
data_h_15 = xlsread('Part1_Heroin_data_combined', 'Sheet2015');
data_h_16 = xlsread('Part1_Heroin_data_combined', 'Sheet2016');
data_h_17 = xlsread('Part1_Heroin_data_combined', 'Sheet2017');
%   data for synthetic opioids
data_so = xlsread('synthetic_opioids_data_total', 'Sheettotal');
data_so_10 = xlsread('synthetic_opioids_data_total', 'Sheet2010');
data_so_11 = xlsread('synthetic_opioids_data_total', 'Sheet2011');
data_so_12 = xlsread('synthetic_opioids_data_total', 'Sheet2012');
data_so_13 = xlsread('synthetic_opioids_data_total', 'Sheet2013');
data_so_14 = xlsread('synthetic_opioids_data_total', 'Sheet2014');
data_so_15 = xlsread('synthetic_opioids_data_total', 'Sheet2015');
data_so_16 = xlsread('synthetic_opioids_data_total', 'Sheet2016');
data_so_17 = xlsread('synthetic_opioids_data_total', 'Sheet2017');
%   time
year = [2010; 2011; 2012; 2013; 2014; 2015; 2016; 2017];

%   deal with heroin's data
FIPSIN_h = data_h(:, 8);
FIPSIN_h_10 = data_h_10(:, 8);
FIPSIN_h_11 = data_h_11(:, 8);
FIPSIN_h_12 = data_h_12(:, 8);
FIPSIN_h_13 = data_h_13(:, 8);
FIPSIN_h_14 = data_h_14(:, 8);
FIPSIN_h_15 = data_h_15(:, 8);
FIPSIN_h_16 = data_h_16(:, 8);
FIPSIN_h_17 = data_h_17(:, 8);
num = length(FIPSIN_h);
%   get all the county's FIPS
FIPS(1) = FIPSIN_h(1);
for i = 2:num
    pos = find(FIPS == FIPSIN_h(i));
    if isempty(pos)
        FIPS(end + 1) = FIPSIN_h(i);
    end
end

%   sort all the county's FIPS
FIPS = FIPS';
FIPS = sort(FIPS);
countynum = length(FIPS);
%   get a matrix that only have number of cases
for i = 1:countynum
    pos = find(FIPSIN_h_10 == FIPS(i));
    if  isempty(pos)
        reph(i, 1) = 0;
    else
        reph(i, 1) = data_h_10(pos, 5);
    end
    pos = find(FIPSIN_h_11 == FIPS(i));
    if  isempty(pos)
        reph(i, 2) = 0;
    else
        reph(i, 2) = data_h_11(pos, 5);
    end
    pos = find(FIPSIN_h_12 == FIPS(i));
    if  isempty(pos)
        reph(i, 3) = 0;
    else
        reph(i, 3) = data_h_12(pos, 5);
    end
    pos = find(FIPSIN_h_13 == FIPS(i));
    if  isempty(pos)
        reph(i, 4) = 0;
    else
        reph(i, 4) = data_h_13(pos, 5);
    end
    pos = find(FIPSIN_h_14 == FIPS(i));
    if  isempty(pos)
        reph(i, 5) = 0;
    else
        reph(i, 5) = data_h_14(pos, 5);
    end
    pos = find(FIPSIN_h_15 == FIPS(i));
    if  isempty(pos)
        reph(i, 6) = 0;
    else
        reph(i, 6) = data_h_15(pos, 5);
    end
    pos = find(FIPSIN_h_16 == FIPS(i));
    if  isempty(pos)
        reph(i, 7) = 0;
    else
        reph(i, 7) = data_h_16(pos, 5);
    end
    pos = find(FIPSIN_h_17 == FIPS(i));
    if  isempty(pos)
        reph(i, 8) = 0;
    else
        reph(i, 8) = data_h_17(pos, 5);
    end
end

%   set the parameter of the model
alpha = 0.4;
beta = 0.7;
gamma = 0.6;
%   calculate the factor change's value of heroin
fcvh = wec * deltaec + wbu * deltabu + wal * deltaal + wp * deltap + ...
    wbs * deltabs + ww * deltaw;

for i = 1:countynum
    data = reph(i, :);
    s(1) = data(1);
    t(1) = data(2) - data(1);
    p(1) = 0;
    for j = 2:8
        if j == 8
            s(j) = alpha * (data(j) - p(j-1)) + (1 - alpha) * (s(j-1)+t(j-1));
            t(j) = beta * (s(j) - s(j-1)) + (1-beta) * t(j-1) + fcvh;
            p(j) = gamma * (data(j) - s(j)) + (1-gamma) * p(j-1); 
        else
            s(j) = alpha * (data(j) - p(j-1)) + (1 - alpha) * (s(j-1)+t(j-1));
            t(j) = beta * (s(j) - s(j-1)) + (1-beta) * t(j-1);
            p(j) = gamma * (data(j) - s(j)) + (1-gamma) * p(j-1); 
        end
    end
    for j = 9:11
        data(j) = s(j-1) + t(j-1) + p(j - 2);
        data(j) = round(data(j));
        if data(j) < 0
            data(j) = 0;
        end
        s(j) = alpha * (data(j) - p(j-1)) + (1 - alpha) * (s(j-1)+t(j-1));
        t(j) = beta * (s(j) - s(j-1)) + (1-beta) * t(j-1) + fcvh;
        p(j) = gamma * (data(j) - s(j)) + (1-gamma) * p(j-1); 
        reph(i, j) = data(j);
    end
end

%   find the source point and the dangerous point
reph_10 = reph(:, 1);
reph_17 = reph(:, 8);
reph_18 = reph(:, 9);
reph_19 = reph(:, 10);
reph_20 = reph(:, 11);
souh(1) = 0;
for i = 1:length(reph_10)
    if reph_10(i) > 100
        souh(end+1) = FIPS(i);
    end
end
souh(1) = [];
danh(1) = 0;
for i = 1:length(reph_17)
    if reph_17(i) > 100
        pos = find(danh == FIPS(i));
        if isempty(pos)
            danh(end+1) = FIPS(i);
        end
    end
end
for i = 1:length(reph_18)
    if reph_18(i) > 100
        pos = find(danh == FIPS(i));
        if isempty(pos)
            danh(end+1) = FIPS(i);
        end
    end
end
for i = 1:length(reph_19)
    if reph_19(i) > 100
        pos = find(danh == FIPS(i));
        if isempty(pos)
            danh(end+1) = FIPS(i);
        end
    end
end
for i = 1:length(reph_20)
    if reph_20(i) > 100
        pos = find(danh == FIPS(i));
        if isempty(pos)
            danh(end+1) = FIPS(i);
        end
    end
end
%   output the data
danh(1) = [];
xlswrite('Heroin_pre.xlsx', FIPS, 1, 'A1');
xlswrite('Heroin_pre.xlsx', reph, 1, 'B1');
clear FIPS;

%   deal with synthetic opioid's data
FIPSIN_so = data_so(:, 6);
FIPSIN_so_10 = data_so_10(:, 6);
FIPSIN_so_11 = data_so_11(:, 6);
FIPSIN_so_12 = data_so_12(:, 6);
FIPSIN_so_13 = data_so_13(:, 6);
FIPSIN_so_14 = data_so_14(:, 6);
FIPSIN_so_15 = data_so_15(:, 6);
FIPSIN_so_16 = data_so_16(:, 6);
FIPSIN_so_17 = data_so_17(:, 6);
%   get all the county's FIPS
num = length(FIPSIN_h);
FIPS(1) = FIPSIN_so(1);
for i = 2:num
    pos = find(FIPS == FIPSIN_so(i));
    if isempty(pos)
        FIPS(end + 1) = FIPSIN_so(i);
    end
end
%   sort all the county's FIPS
FIPS = FIPS';
FIPS = sort(FIPS);
countynum = length(FIPS);
%   get a matrix that only have number of cases
for i = 1:countynum
    pos = find(FIPSIN_so_10 == FIPS(i));
    if  isempty(pos)
        repso(i, 1) = 0;
    else
        repso(i, 1) = data_so_10(pos, 8);
    end
    pos = find(FIPSIN_so_11 == FIPS(i));
    if  isempty(pos)
        repso(i, 2) = 0;
    else
        repso(i, 2) = data_so_11(pos, 8);
    end
    pos = find(FIPSIN_so_12 == FIPS(i));
    if  isempty(pos)
        repso(i, 3) = 0;
    else
        repso(i, 3) = data_so_12(pos, 8);
    end
    pos = find(FIPSIN_so_13 == FIPS(i));
    if  isempty(pos)
        repso(i, 4) = 0;
    else
        repso(i, 4) = data_so_13(pos, 8);
    end
    pos = find(FIPSIN_so_14 == FIPS(i));
    if  isempty(pos)
        repso(i, 5) = 0;
    else
        repso(i, 5) = data_so_14(pos, 8);
    end
    pos = find(FIPSIN_so_15 == FIPS(i));
    if  isempty(pos)
        repso(i, 6) = 0;
    else
        repso(i, 6) = data_so_15(pos, 8);
    end
    pos = find(FIPSIN_so_16 == FIPS(i));
    if  isempty(pos)
        repso(i, 7) = 0;
    else
        repso(i, 7) = data_so_16(pos, 8);
    end
    pos = find(FIPSIN_so_17 == FIPS(i));
    if  isempty(pos)
        repso(i, 8) = 0;
    else
        repso(i, 8) = data_so_17(pos, 8);
    end
end

%   set the parameter of the model
alpha = 0.4;
beta = 0.75;
gamma = 0.7;
%   calculate the factor change's value of heroin
fcvso = wo * deltao + wcj * deltacj + wbb * deltabb + wbh * deltabh + ...
    wbk * deltabk + wbn * deltabn + wbr * deltabr + wdl * deltadl;

for i = 1:countynum
    data = repso(i, :);
    s(1) = data(1);
    t(1) = data(2) - data(1);
    p(1) = 0;
    for j = 2:8
        if j == 8
            s(j) = alpha * (data(j) - p(j-1)) + (1 - alpha) * (s(j-1)+t(j-1));
            t(j) = beta * (s(j) - s(j-1)) + (1-beta) * t(j-1) + fcvso;
            p(j) = gamma * (data(j) - s(j)) + (1-gamma) * p(j-1); 
        else
            s(j) = alpha * (data(j) - p(j-1)) + (1 - alpha) * (s(j-1)+t(j-1));
            t(j) = beta * (s(j) - s(j-1)) + (1-beta) * t(j-1);
            p(j) = gamma * (data(j) - s(j)) + (1-gamma) * p(j-1); 
        end
    end
    for j = 9:11
        data(j) = s(j-1) + t(j-1) + p(j - 2);
        data(j) = round(data(j));
        if data(j) < 0
            data(j) = 0;
        end
        s(j) = alpha * (data(j) - p(j-1)) + (1 - alpha) * (s(j-1)+t(j-1));
        t(j) = beta * (s(j) - s(j-1)) + (1-beta) * t(j-1) + fcvso;
        p(j) = gamma * (data(j) - s(j)) + (1-gamma) * p(j-1); 
        repso(i, j) = data(j);
    end
end

%   find the source point and the dangerous point
repso_10 = repso(:, 1);
repso_17 = repso(:, 8);
repso_18 = repso(:, 9);
repso_19 = repso(:, 10);
repso_20 = repso(:, 11);
souso(1) = 0;
for i = 1:length(repso_10)
    if repso_10(i) > 50
        souso(end+1) = FIPS(i);
    end
end
souso(1) = [];
danso(1) = 0;
for i = 1:length(repso_17)
    if repso_17(i) > 100
        pos = find(danso == FIPS(i));
        if isempty(pos)
            danso(end+1) = FIPS(i);
        end
    end
end
for i = 1:length(repso_18)
    if repso_18(i) > 100
        pos = find(danso == FIPS(i));
        if isempty(pos)
            danso(end+1) = FIPS(i);
        end
    end
end
for i = 1:length(repso_19)
    if repso_19(i) > 100
        pos = find(danso == FIPS(i));
        if isempty(pos)
            danso(end+1) = FIPS(i);
        end
    end
end
for i = 1:length(repso_20)
    if repso_20(i) > 100
        pos = find(danso == FIPS(i));
        if isempty(pos)
            danso(end+1) = FIPS(i);
        end
    end
end
%   output the data
danso(1) = [];
xlswrite('SynO_pre.xlsx', FIPS, 1, 'A1');
xlswrite('SynO_pre.xlsx', repso, 1, 'B1');
    