%% test file to be used to find the points for inflection
clc
clear all


load ('C:\Users\Shafaat\Dropbox\Clifford_Lab_MATLAB\LAB\biopac_data\Data\EAvg_Records\EAvg_3114_N.mat')

icg_EA = EAvg_ecg_icg(2,:);
icg_EA = icg_EA(1:1000);


x1 = 225;
x2 = 260;
x= x1:x2;
icg_infl = icg_EA(x1:x2);
%%
df1=gradient(icg_infl,x);
df2=gradient(df1,x);
id=sign(df2);
labels = cellstr(num2str(icg_infl'));
% labels = cellstr(num2str(id'));
idx=strfind(id,[-1 1]);
inflexionP=x(idx+1);

%%
figure
% tp = 0:1/1000:(length(icg_EA)-1)/1000;
t_inflec = 1:length(icg_infl);
tp = 1:length(icg_EA);


plot(tp, icg_EA);hold on, plot(tp(x1), icg_EA(x1),'bs'), plot(tp(x2), icg_EA(x2),'rs')
text(t_inflec+x1-1,icg_infl,labels,'VerticalAlignment', 'top','HorizontalAlignment','center' )
hold on, plot(tp(inflexionP), icg_EA(inflexionP),'ro')
xlabel('time'), ylabel('mv')