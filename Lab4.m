
clear
clc

%% mixed exposure space
addpath('data'); addpath('function');
myCell = 196 ; 
[T2001, P2001] = getMeteo(2001, myCell);
myCrop = 13; % maize

dT = [-2:2:8]; nT = length(dT);      % additive perturbation over temperature
dP = [.7:.1:1.3]; nP = length(dP);   % multiplicative perturbation over precipitation
Tes = nan(365,nT);
Pes = nan(365,nP);
Yes = nan(nP,nT);
for i = 1:nP
    for j = 1:nT
        % set current exposure
        Psim = P2001 * dP(i) ;
        Tsim = T2001 + dT(j);
        % archive
        Tes(:,j) = Tsim ;
        Pes(:,i) = Psim;
        Yes(i,j) = simulation_script_curr(myCrop, myCell, Tsim, Psim);
    end
end
% plot failure boundary wrt failure defined over analysis of history
Yfailure = 6.6646e+03; % from LAB03
FB = plotExposureSpace( Yes, dT, dP, Yfailure, '\Delta temp', '\Delta prec' );
legend('Failure','Success');
% robustness with domain criterion for different exposure spaces
%1-17/36
%1-17/49
%1-26/42

% from yield to revenue
Res = yield_to_revenue( Yes, myCrop );
Rfailure = yield_to_revenue( Yfailure, myCrop );
FBr = plotExposureSpace( Res, dT, dP, Rfailure, '\Delta temp', '\Delta prec' ); legend('Failure','Success');

%% adaptive capacity
% simulation of alternative crops (rice = crop code 15) under the failure
% scenarios of maize

testCrop = 10 ; 
Res_ar = Res ;
for i = 1:nP
    for j = 1:nT
        if FBr(i,j) > 0 % maize is failure
        % read current exposure
        Psim = Pes(:,i) ;
        Tsim = Tes(:,j) ;
        y = simulation_script_curr(testCrop, myCell, Tsim, Psim); % yield is converted in revenue later (without including subsides) as done before for maize
        Res_ar(i,j) = yield_to_revenue(y,testCrop);
        end
    end
end

plotExposureSpace( Res_ar, dT, dP, Rfailure, '\Delta temp', '\Delta prec' ); title('ES maize + tomato'); legend('Success');
plotExposureSpace( Res, dT, dP, Rfailure, '\Delta temp', '\Delta prec' ); title('ES maize')
legend('Failure','Success');


%% overlay IPCC scenarios
load -ascii Pd.txt
load -ascii Td.txt
load -ascii Pd45.txt
load -ascii Td45.txt
T_IPCC = reshape(Td, 365, 5);
P_IPCC = reshape(Pd, 365, 5);

% annual mean 
figure; 
subplot(211); plot( T2001, 'k-' ); ylabel('temperature (?C)')
hold on; plot( T_IPCC, 'r-'); axis([1 365 -10 40]); legend('history', 'IPCC')
subplot(212); plot( P2001, 'k-' ); ylabel('precipitation (mm/d)')
hold on; plot( P_IPCC, 'r-'); axis([1 365 0 140]); legend('history', 'IPCC')

DT = mean(Td) - mean(T2001); 
DP = mean(Pd) / mean(P2001);
DT45 = mean(Td45) - mean(T2001); 
DP45 = mean(Pd45) / mean(P2001);

% "original" exposure space of maize
plotExposureSpace( Res, dT, dP, Rfailure, '\Delta temp', '\Delta prec' );
hold on; plot( DT, DP, 'k*', 'MarkerSize', 15 ) 
hold on; plot( DT45, DP45,'r*', 'MarkerSize', 15)
legend('Failure','Success','Scenario RCP8.5','Scenario RCP4.5');
