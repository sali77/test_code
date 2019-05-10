% trying box plot and saving it to excel file

clc
clear


x = rand(5,1);
y = rand(10,1);
z = rand(15,1);
group = [repmat({'First'}, 5, 1); repmat({'Second'}, 10, 1); repmat({'Third'}, 15, 1)];
boxplot([x;y;z], group)

%%

A = [16 20 15 17 22 19 17]';
B = [22 15 16 16 16 18]';
C = [23 9 15 18 13 27 17 14 16 15 21 19 17]';
D = [16 20 15 22 19 17]';
E = [22 15 16 16 16 18]';
xls_filename = 'C:\Users\Barfi\Dropbox\Clifford_Lab_MATLAB\LAB\Extracted data\sqi_data.xls';
sheet = 'E_3137_C';
E_3137_C = xlsread(xls_filename,sheet,'A:A');

group = [    ones(size(A));
         2 * ones(size(B));
         3 * ones(size(C));
         4 * ones(size(D));
         5 * ones(size(E));
         6* ones(size(E_3137_C))];
figure
boxplot([A; B; C; D; E; E_3137_C],group)
set(gca,'XTickLabel',{'A','B','C', 'D', 'E', 'E_3137_C'})
%% writing to xls 

filename = 'C:\Users\Barfi\Dropbox\Clifford_Lab_MATLAB\LAB\Extracted data\sqi_data.xls';
val_a= [11; 22; 33]
A = {'Time';val_a };
sheet = 2;
xlRange = 'E1';
xlswrite(filename,A,sheet,xlRange) 