
% script for the generation of the exposure space for the bottom-up
% assessment of climate change vulnerabilities of the Muzza irrigation
% district.

clear
clc
addpath('data'); addpath('function');

%% load historical observations of temperature and precipitation (as in Lab. 02)
myCell = 196 ; % replace this with the sum of the (n1*n2)^2, where n is the last digit of your personal codes
histYears = [1993:2007];
[Tobs, Pobs] = getMeteo(histYears, myCell);

%% historical analysis of climate and model performance
myCrop = 13; % maize
Ny = length(Tobs) / 365;
TH = reshape(Tobs, 365, Ny);
PH = reshape(Pobs, 365, Ny);

% annual mean 
figure;
subplot(211); plot( histYears, mean( TH ), '.-' ); title('mean annual temperature');
ylabel('¡C'); grid on;
subplot(212); plot( histYears, mean( PH ), '.-' ); title('mean annual precipitation');
ylabel('mm/d'); grid on; xlabel('years');

% cyclostationary average
figure; subplot(211);
for i = 1:Ny
hold on; plot( moving_average( TH(:,i), 365, 5 ), 'k--' );
end
hold on; plot( moving_average( Tobs, 365, 5 ), 'r-', 'LineWidth', 2);
ylabel('¡C'); grid on; title('temperature');
subplot(212);
for i = 1:Ny
hold on; plot( moving_average( PH(:,i), 365, 5 ), 'k--' );
end
hold on; plot( moving_average( Pobs, 365, 5 ), 'r-', 'LineWidth', 2);
ylabel('mm/d'); grid on; title('precipitation'); xlabel('days');

% box-plot
figure; 
subplot(211); boxplot(TH,histYears); title('temperature'); ylabel('°C');
subplot(212); boxplot(PH,histYears); title('precipitation'); ylabel('mm/d');

% yield
YH = nan(Ny,1);
for i = 1:Ny
    YH(i) = simulation_script_curr(myCrop, myCell, TH(:,i), PH(:,i) );
end
figure; plot( histYears, YH, '.-'); title('annual yield'); grid on;
Yfailure = YH(end-2) ; % yield of 2005 selected as critical
  
%% additive perturbation
[T2001, P2001] = getMeteo(2001, myCell);
dT_add = [-2:2:8]; nT = length(dT_add);
dP_add = [-10:4:10 ]; nP = length(dP_add);
Tes_add = nan(365,nT);
Pes_add = nan(365,nP);
Yes_add = nan(nP,nT);
for i = 1:nP
    for j = 1:nT
        % set current exposure
        Psim = P2001 + dP_add(i) ;
        Psim(Psim<0) = 0;
        Tsim = T2001 + dT_add(j);
        % archive
        Pes_add(:,i) = Psim;
        Tes_add(:,j) = Tsim;
        Yes_add(i,j) = simulation_script_curr(myCrop, myCell, Tsim, Psim);
    end
end
% precipitation statistics --> additive perturbation doesn't work great for precip.
Pavg = mean( Pes_add );
Pvar = var( Pes_add );
Ndry = sum( Pes_add == 0 );


%% multiplicative perturbation
dT_m = [.7:.1:1.3]; nT = length(dT_m);
dP_m = [.7:.1:1.3]; nP = length(dP_m);
Tes_m = nan(365,nT);
Pes_m = nan(365,nP);
Yes_m = nan(nP,nT);
for i = 1:nP
    for j = 1:nT
        
        % set current exposure
        Psim = P2001.*dP_m(i) ;
        Psim(Psim<0) = 0;
        Tsim = T2001.*dT_m(j);
        % archive
        Tes_m(:,j) = Tsim ;
        Pes_m(:,i) = Psim;
        Yes_m(i,j) = simulation_script_curr(myCrop, myCell, Tsim, Psim);
    end
end
% temperature scenarios --> multiplicative perturbation doesn't work great for temperature, particularly for low values where most of the scenarios are extremely close
figure;
subplot(121); plot(Tes_add); title('additive');
subplot(122); plot(Tes_m); title('multiplicative');

figure;
subplot(121); plot(Pes_add); title('additive');
subplot(122); plot(Pes_m); title('multiplicative');

figure;
subplot(121); plot(Yes_add); title('additive');
subplot(122); plot(Yes_m); title('multiplicative');
%% plot exposure space and failure boundary wrt failure defined over analysis of history
FB1 = plotExposureSpace( Yes_add, dT_add, dP_add, Yfailure, '\Delta temp', '\Delta prec' ); title('Additive');
FB2 = plotExposureSpace( Yes_m, dT_m, dP_m, Yfailure, '\Delta temp', '\Delta prec' ); title('Multiplicative');

