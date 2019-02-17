A10 = ACS105YRDP02withann;
A11 = ACS115YRDP02withann;
A12 = ACS125YRDP02withann;
A13 = ACS135YRDP02withann;
A14 = ACS145YRDP02withann;
A15 = ACS155YRDP02withann;
A16 = ACS165YRDP02withann;

[m10,n10] = size(A10);
[m11,n11] = size(A11);
[m12,n12] = size(A12);
[m13,n13] = size(A13);
[m14,n14] = size(A14);
[m15,n15] = size(A15);
[m16,n16] = size(A16);

A101 = ones(m10,n10/4);
A111 = ones(m11,n11/4);
A121 = ones(m12,n12/4);
A131 = ones(m13,n13/4);
A141 = ones(m14,n14/4);
A151 = ones(m15,n15/4);
A161 = ones(m16,n16/4);

%%10-----------------------------------------------------------------------
for i = 1:n10/4
    A101(:,i) = A10(:,(1 + 4*(i-1)));
end
xlswrite('Point10.xlsx',A101);

for i = 1:n10/4
    A101(:,i) = A10(:,(1 + 4*(i-1))) + A10(:,(2 + 4*(i-1)));
end
xlswrite('Pointsup10.xlsx',A101);

for i = 1:n10/4
    A101(:,i) = A10(:,(1 + 4*(i-1))) - A10(:,(2 + 4*(i-1)));
end
xlswrite('Pointinf10.xlsx',A101);

for i = 1:n10/4
    A101(:,i) = A10(:,(3 + 4*(i-1)));
end
xlswrite('Percent10.xlsx',A101);

for i = 1:n10/4
    A101(:,i) = A10(:,(3 + 4*(i-1))) + A10(:,(4 + 4*(i-1)));
end
xlswrite('Percentsup10.xlsx',A101);

for i = 1:n10/4
    A101(:,i) = A10(:,(3 + 4*(i-1))) - A10(:,(4 + 4*(i-1)));
end
xlswrite('Percentinf10.xlsx',A101);
%%-----------------------------------------------------------------

%%11-----------------------------------------------------------------------
for i = 1:n11/4
    A111(:,i) = A11(:,(1 + 4*(i-1)));
end
xlswrite('Point11.xlsx',A111);

for i = 1:n11/4
    A111(:,i) = A11(:,(1 + 4*(i-1))) + A11(:,(2 + 4*(i-1)));
end
xlswrite('Pointsup11.xlsx',A111);

for i = 1:n11/4
    A111(:,i) = A11(:,(1 + 4*(i-1))) - A11(:,(2 + 4*(i-1)));
end
xlswrite('Pointinf11.xlsx',A111);

for i = 1:n11/4
    A111(:,i) = A11(:,(3 + 4*(i-1)));
end
xlswrite('Percent11.xlsx',A111);

for i = 1:n11/4
    A111(:,i) = A11(:,(3 + 4*(i-1))) + A11(:,(4 + 4*(i-1)));
end
xlswrite('Percentsup11.xlsx',A111);

for i = 1:n11/4
    A111(:,i) = A11(:,(3 + 4*(i-1))) - A11(:,(4 + 4*(i-1)));
end
xlswrite('Percentinf11.xlsx',A111);
%%-----------------------------------------------------------------

%%12-----------------------------------------------------------------------
for i = 1:n12/4
    A121(:,i) = A12(:,(1 + 4*(i-1)));
end
xlswrite('Point12.xlsx',A121);

for i = 1:n12/4
    A121(:,i) = A12(:,(1 + 4*(i-1))) + A12(:,(2 + 4*(i-1)));
end
xlswrite('Pointsup12.xlsx',A121);

for i = 1:n12/4
    A121(:,i) = A12(:,(1 + 4*(i-1))) - A12(:,(2 + 4*(i-1)));
end
xlswrite('Pointinf12.xlsx',A121);

for i = 1:n12/4
    A121(:,i) = A12(:,(3 + 4*(i-1)));
end
xlswrite('Percent12.xlsx',A121);

for i = 1:n12/4
    A121(:,i) = A12(:,(3 + 4*(i-1))) + A12(:,(4 + 4*(i-1)));
end
xlswrite('Percentsup12.xlsx',A121);

for i = 1:n12/4
    A121(:,i) = A12(:,(3 + 4*(i-1))) - A12(:,(4 + 4*(i-1)));
end
xlswrite('Percentinf12.xlsx',A121);
%%-----------------------------------------------------------------

%%13-----------------------------------------------------------------------
for i = 1:n13/4
    A131(:,i) = A13(:,(1 + 4*(i-1)));
end
xlswrite('Point13.xlsx',A131);

for i = 1:n13/4
    A131(:,i) = A13(:,(1 + 4*(i-1))) + A13(:,(2 + 4*(i-1)));
end
xlswrite('Pointsup13.xlsx',A131);

for i = 1:n13/4
    A131(:,i) = A13(:,(1 + 4*(i-1))) - A13(:,(2 + 4*(i-1)));
end
xlswrite('Pointinf13.xlsx',A131);

for i = 1:n13/4
    A131(:,i) = A13(:,(3 + 4*(i-1)));
end
xlswrite('Percent13.xlsx',A131);

for i = 1:n13/4
    A131(:,i) = A13(:,(3 + 4*(i-1))) + A13(:,(4 + 4*(i-1)));
end
xlswrite('Percentsup13.xlsx',A131);

for i = 1:n13/4
    A131(:,i) = A13(:,(3 + 4*(i-1))) - A13(:,(4 + 4*(i-1)));
end
xlswrite('Percentinf13.xlsx',A131);
%%-----------------------------------------------------------------

%%14-----------------------------------------------------------------------
for i = 1:n14/4
    A141(:,i) = A14(:,(1 + 4*(i-1)));
end
xlswrite('Point14.xlsx',A141);

for i = 1:n14/4
    A141(:,i) = A14(:,(1 + 4*(i-1))) + A14(:,(2 + 4*(i-1)));
end
xlswrite('Pointsup14.xlsx',A141);

for i = 1:n14/4
    A141(:,i) = A14(:,(1 + 4*(i-1))) - A14(:,(2 + 4*(i-1)));
end
xlswrite('Pointinf14.xlsx',A141);

for i = 1:n14/4
    A141(:,i) = A14(:,(3 + 4*(i-1)));
end
xlswrite('Percent14.xlsx',A141);

for i = 1:n14/4
    A141(:,i) = A14(:,(3 + 4*(i-1))) + A14(:,(4 + 4*(i-1)));
end
xlswrite('Percentsup14.xlsx',A141);

for i = 1:n14/4
    A141(:,i) = A14(:,(3 + 4*(i-1))) - A14(:,(4 + 4*(i-1)));
end
xlswrite('Percentinf14.xlsx',A141);
%%-----------------------------------------------------------------

%%15-----------------------------------------------------------------------
for i = 1:n15/4
    A151(:,i) = A15(:,(1 + 4*(i-1)));
end
xlswrite('Point15.xlsx',A151);

for i = 1:n15/4
    A151(:,i) = A15(:,(1 + 4*(i-1))) + A15(:,(2 + 4*(i-1)));
end
xlswrite('Pointsup15.xlsx',A151);

for i = 1:n15/4
    A151(:,i) = A15(:,(1 + 4*(i-1))) - A15(:,(2 + 4*(i-1)));
end
xlswrite('Pointinf15.xlsx',A151);

for i = 1:n15/4
    A151(:,i) = A15(:,(3 + 4*(i-1)));
end
xlswrite('Percent15.xlsx',A151);

for i = 1:n15/4
    A151(:,i) = A15(:,(3 + 4*(i-1))) + A15(:,(4 + 4*(i-1)));
end
xlswrite('Percentsup15.xlsx',A151);

for i = 1:n15/4
    A151(:,i) = A15(:,(3 + 4*(i-1))) - A15(:,(4 + 4*(i-1)));
end
xlswrite('Percentinf15.xlsx',A151);
%%-----------------------------------------------------------------

%%16-----------------------------------------------------------------------
for i = 1:n16/4
    A161(:,i) = A16(:,(1 + 4*(i-1)));
end
xlswrite('Point16.xlsx',A161);

for i = 1:n16/4
    A161(:,i) = A16(:,(1 + 4*(i-1))) + A16(:,(2 + 4*(i-1)));
end
xlswrite('Pointsup16.xlsx',A161);

for i = 1:n16/4
    A161(:,i) = A16(:,(1 + 4*(i-1))) - A16(:,(2 + 4*(i-1)));
end
xlswrite('Pointinf16.xlsx',A161);

for i = 1:n16/4
    A161(:,i) = A16(:,(3 + 4*(i-1)));
end
xlswrite('Percent16.xlsx',A161);

for i = 1:n16/4
    A161(:,i) = A16(:,(3 + 4*(i-1))) + A16(:,(4 + 4*(i-1)));
end
xlswrite('Percentsup16.xlsx',A161);

for i = 1:n16/4
    A161(:,i) = A16(:,(3 + 4*(i-1))) - A16(:,(4 + 4*(i-1)));
end
xlswrite('Percentinf16.xlsx',A161);
%%-----------------------------------------------------------------


