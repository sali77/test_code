[d,s,r] = xlsread('cloudy snow 30ppmGE.xlsx');
I = -d(:,1);                                                    % Current
E = d(:,2);                                                     % Potential
t = E(E<=0);
y = I(E<=0);

load ('C:\Users\Shafaat\Dropbox\Clifford_Lab_MATLAB\LAB\biopac_data\Data\EAvg_Records\EAvg_3114_N.mat')
[b,S,mu]  = polyfit(t, y, 6);
fy = polyval(b,t,S,mu);
y = fy;
d1y = gradient(y,t);                                            % Numerical Derivative
d2y = gradient(d1y,t);                                          % Numerical Second Derivative
t_infl = interp1(d1y, t, max(d1y));                             % Find ‘t’ At Maximum Of First Derivative
y_infl = interp1(t, y, t_infl);                                 % Find ‘y’ At Maximum Of First Derivative
slope  = interp1(t, d1y, t_infl);                               % Slope Defined Here As Maximum Of First Derivative
intcpt = y_infl - slope*t_infl;                                 % Calculate Intercept
tngt = slope*t + intcpt;                                        % Calculate Tangent Line
figure(1)
plot(t, y)
hold on
plot(t, fy)
plot(t, d1y, '-.m',    t, d2y, '--c')                           % Plot Derivatives (Optional)
plot(t, tngt, '-r', 'LineWidth',1)                              % Plot Tangent Line
plot(t_infl, y_infl, 'bp')                                      % Plot Maximum Slope
hold off
grid
legend('y(t)', 'y(t) Fit', 'dy/dt', 'd^2y/dt^2', 'Tangent', 'Location','E')
axis([xlim    min(min(y),intcpt)  ceil(max(y))])