%% Plotting higher derivaties of ICG using diff and grad

clc
clear 
%% Laoding data
load('D:\Clifford Lab\Data_4test\EAvg_3114_N.mat')
load('D:\Clifford Lab\Data_4test\Rpk_3114_N.mat')
fs = 1000;

%% Extracting icg 
icg = EAvg_ecg_icg(2,:);
icg = icg(1:1000);
%Rpeak = Rpeak_EA(1);
B = 1:1000;
Rpeak = intersect(Rpeak_EA,B);


%% differentiating using diff
icg_D1=diff(icg);
icg_D2=diff(icg_D1);
id_diff=sign(icg_D2);
icg = icg(1:length(icg_D2));
icg_D1 = icg_D1(1: length(icg_D2));

%% differeniating using gradient function
indis1=Rpeak; 
indis2 = indis1+150;
x = indis1 : indis2;
icg_infl = icg(indis1:indis2);
df1=gradient(icg_infl,x);
df2=gradient(df1,x);
id_grad=sign(df2);                          % signs of diff
labels = cellstr(num2str(id_grad'));
t_inflec = 1:length(icg_infl);

%% plotting
t = 1/fs:1/fs:length(icg)/fs; 
figure
plot(t,icg,t(Rpeak),icg(Rpeak),'*'), title('Ensemble Averaged ICG (dz/dt) and its higher derivatives')
hold on
%% plotting higher derivatices using diff
%  plot(t,100*icg_D1,t(Rpeak_EA),100*icg_D1(Rpeak_EA),'*')
%plot(t,1000*icg_D2,t(Rpeak_EA),1000*icg_D2(Rpeak_EA),'*')
%  vector = 1000*icg_D2;
%  plot(t(indis1:indis2),-vector(indis1:indis2)+1); 
%% plotting sign of derivatives
plot(t(t_inflec+indis1-1),id_grad); 
% plot(t(t_inflec+indis1-1),id_diff(t_inflec+indis1-1),'--'); 

% plotting the '-1' '+1'
 text(t(t_inflec+indis1-1),icg(t_inflec+indis1-1),labels,'VerticalAlignment', 'top','HorizontalAlignment','center' )

% legend('ICG (dz/dt)','R peak','Sign Change Gradient ','Sign Change Diff')
