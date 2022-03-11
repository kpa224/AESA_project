
% script for the simulation of the Muzza model fed with the downscaled
% trajectories of temperature and precipitation (from lab1)

clear
clc
addpath('data'); addpath('function');

%% load climate models output and historical data 
% this files were saved at the end of lab.01 
load -ascii tasH_2001_2005_Muzza.txt 
load -ascii tas85_2046_2050_Muzza.txt
load -ascii tas45_2046_2050_Muzza.txt 
load -ascii prH_2001_2005_Muzza.txt 
load -ascii pr85_2046_2050_Muzza.txt 
load -ascii pr45_2046_2050_Muzza.txt 


% retrieve historical observations for a specific cell of the model (the
% historical data are available over the period 1/1/1993-31/12/2007)
myCell = 196 ; % replace this with the sum of the (n1*n2)^2, where n is the last digit of your personal codes 2&7
histYears = [2001:2005];
[Tobs, Pobs] = getMeteo(histYears, myCell);

%% move to excel for running quantile-mapping downscaling and get the 
% trajectories of Temperature and Precipitation downscaled at the cell level:
%   1) copy the 5-years trajectories of observation, control, and scenario
%   in 'load_time_series' and adjust the date columns (remove 29 feb!)
dn = datenum(2001,1,1):datenum(2005,12,31);
dn = datenum(2046,1,1):datenum(2050,12,31);
dv = datevec(dn);
id_29feb = find( dv(:,2).*dv(:,3) == 2*29 )
dv(id_29feb,1:3) 
%   2) in 'select_common_period', set the dates identifying the common
%   period between observation and control (and extend columns B-C
%   accordingly by editing the equations wrt the last cell in
%   'load_time_series') - adjust the data shown in 'plot_ctrl_obs'
%   3) set the max/min values and check the percentiles computed in
%   'calibration_phase' and the figures in 'plot_cdf' and
%   'plot_correction_function'   
%   4) check the lenght of the data used in 'projection_phase' and extend
%   it if necessary to match the time series length in 'load_time_series'
%   5) copy the downscaled value (column Q in 'projection_phase') into
%   MATLAB variable
Td = []; load -ascii Td.txt
Td45 = []; load -ascii Td45.txt
% Repeat the procedure for precipitation
Pd = []; load -ascii Pd.txt
Pd45 = []; load -ascii Pd45.txt

%% comparison of trajectories pre/post downscaling
T85_m = moving_average( tas85_2046_2050_Muzza, 365, 15 ) ; 
T85d_m = moving_average( Td, 365, 15 ) ;
T45_m = moving_average( tas45_2046_2050_Muzza, 365, 15 ) ; 
T45d_m = moving_average( Td45, 365, 15 ) ; 
P85_m = moving_average( pr85_2046_2050_Muzza, 365, 15 ) ; 
P85d_m = moving_average( Pd, 365, 15 ) ; 
P45_m = moving_average( pr45_2046_2050_Muzza, 365, 15 ) ; 
P45d_m = moving_average( Pd45, 365, 15 ) ;

Tctrl_m = moving_average( tasH_2001_2005_Muzza, 365,15);
Th_m = moving_average( Tobs, 365,15);
Pctrl_m = moving_average( prH_2001_2005_Muzza, 365,15);
Ph_m = moving_average( Pobs, 365,15);

figure; 
subplot(121); plot( [Th_m, Tctrl_m, T45d_m, T85d_m] ) ;
axis([1 365 0 35]); title('Temperature in 2046-2050'); ylabel('°C')
legend('observation', 'ctrl', 'RCP4.5', 'RCP8.5');
subplot(122); plot( cumsum([Ph_m, Pctrl_m, P45d_m, P85d_m]) ) ;
axis([1 365 0 900]); title('Precipitation in 2046-2050'); ylabel('mm/day')
legend('observation', 'ctrl', 'RCP4.5', 'RCP8.5');

%% run the model under historical (2001) and projected conditions (2046)
cellIdx = 50 ; 
crop = 13 ; % [10 11 13 14 15] ;
T2001 = Tobs(1:365);
P2001 = Pobs(1:365);
Y2001 = simulation_script_curr(crop, cellIdx, T2001, P2001);

T2046 = Td(1:365);
P2046 = Pd(1:365);
Y2046_85 = simulation_script_curr(crop, cellIdx, T2046, P2046);
T2046_45 = Td45(1:365);
P2046_45 = Pd45(1:365);
Y2046_45 = simulation_script_curr(crop, cellIdx, T2046_45, P2046_45);


% visualize results: yield and associated climatic conditions
figure; 

subplot(131); X = categorical({'2001','2046 RCP 8.5','2046 RCP 4.5'});
bar(X, [Y2001 Y2046_85 Y2046_45]); title('yield')
subplot(132); plot([moving_average(T2001,365,15) moving_average(T2046,365,15) moving_average(T2046_45,365,15)] ); title('temperature');
axis([1 365 0 30]); grid on; legend('2001', '2046 RCP 8.5' , '2046 RCP 4.5');
subplot(133); plot(cumsum([P2001 P2046 P2046_45]) ); title('precipitation');
axis([1 365 0 800]); grid on;
legend('2001', '2046 RCP 8.5' , '2046 RCP 4.5');
