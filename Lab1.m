%Homework LAb 1
close all
clear 
clc

addpath('./netcdf')
addpath('./shape')

%extracting Historical data of precititation and temperature from netcdf
%Taking into account 3 blocks of 5 years each (1961-65; 1981-85; 2001-05)

tasH_1961_1965 = extractNetCDFdata('tas_EUR-44_NOAA-GFDL-GFDL-ESM2M_historical_r1i1p1_SMHI-RCA4_v1_day_19610101-19651231.nc', 'tas');
prH_1961_1965 = extractNetCDFdata('pr_EUR-44_NOAA-GFDL-GFDL-ESM2M_historical_r1i1p1_SMHI-RCA4_v1_day_19610101-19651231.nc', 'pr');
tasH_1981_1985 = extractNetCDFdata('tas_EUR-44_NOAA-GFDL-GFDL-ESM2M_historical_r1i1p1_SMHI-RCA4_v1_day_19810101-19851231.nc', 'tas');
prH_1981_1985 = extractNetCDFdata('pr_EUR-44_NOAA-GFDL-GFDL-ESM2M_historical_r1i1p1_SMHI-RCA4_v1_day_19810101-19851231.nc', 'pr');
tasH_2001_2005 = extractNetCDFdata('tas_EUR-44_NOAA-GFDL-GFDL-ESM2M_historical_r1i1p1_SMHI-RCA4_v1_day_20010101-20051231.nc', 'tas');
prH_2001_2005 = extractNetCDFdata('pr_EUR-44_NOAA-GFDL-GFDL-ESM2M_historical_r1i1p1_SMHI-RCA4_v1_day_20010101-20051231.nc', 'pr');

% visualizing time-snapshot of every 11th of November for every block 
% adding shape of italy
SHP = shaperead('ITA_adm0.shp');

figure(); 
subplot(1,3,1)
plotNetCDFsnapshot(tasH_1961_1965, [1961,01,01], [1965,12,31], [1965,11,11], 'tas');
hold on; plot(SHP.X, SHP.Y, 'k');
title('Temperature 11/11/1965');
subplot(1,3,2)
plotNetCDFsnapshot(tasH_1981_1985, [1981,01,01], [1985,12,31], [1985,11,11], 'tas');
hold on; plot(SHP.X, SHP.Y, 'k');
title('Temperature 11/11/1985');
subplot(1,3,3)
plotNetCDFsnapshot(tasH_2001_2005, [2001,01,01], [2005,12,31], [2005,11,11], 'tas');
hold on; plot(SHP.X, SHP.Y, 'k');
title('Temperature 11/11/2005');

figure();
subplot(1,3,1)
plotNetCDFsnapshot(prH_1961_1965, [1961,01,01], [1965,12,31], [1965,11,11], 'pr');
hold on; plot(SHP.X, SHP.Y, 'k');
title('Precipitation 11/11/1965');
subplot(1,3,2)
plotNetCDFsnapshot(prH_1981_1985, [1981,01,01], [1985,12,31], [1985,11,11], 'pr');
hold on; plot(SHP.X, SHP.Y, 'k');
title('Precipitation 11/11/1985');
subplot(1,3,3)
plotNetCDFsnapshot(prH_2001_2005, [2001,01,01], [2005,12,31], [2005,11,11], 'pr');
hold on; plot(SHP.X, SHP.Y, 'k');
title('Precipitation 11/11/2005');

%%
% Using IPCC scenario RCP8.5: GHGs emissions increase over time up to high concentrations.
tas85_2026_2030 = extractNetCDFdata('tas_EUR-44_NOAA-GFDL-GFDL-ESM2M_rcp85_r1i1p1_SMHI-RCA4_v1_day_20260101-20301231.nc', 'tas');
pr85_2026_2030 = extractNetCDFdata('pr_EUR-44_NOAA-GFDL-GFDL-ESM2M_rcp85_r1i1p1_SMHI-RCA4_v1_day_20260101-20301231.nc', 'pr');
tas85_2036_2040 = extractNetCDFdata('tas_EUR-44_NOAA-GFDL-GFDL-ESM2M_rcp85_r1i1p1_SMHI-RCA4_v1_day_20360101-20401231.nc', 'tas');
pr85_2036_2040 = extractNetCDFdata('pr_EUR-44_NOAA-GFDL-GFDL-ESM2M_rcp85_r1i1p1_SMHI-RCA4_v1_day_20360101-20401231.nc', 'pr');
tas85_2046_2050 = extractNetCDFdata('tas_EUR-44_NOAA-GFDL-GFDL-ESM2M_rcp85_r1i1p1_SMHI-RCA4_v1_day_20460101-20501231.nc', 'tas');
pr85_2046_2050 = extractNetCDFdata('pr_EUR-44_NOAA-GFDL-GFDL-ESM2M_rcp85_r1i1p1_SMHI-RCA4_v1_day_20460101-20501231.nc', 'pr');
tas85_2056_2060 = extractNetCDFdata('tas_EUR-44_NOAA-GFDL-GFDL-ESM2M_rcp85_r1i1p1_SMHI-RCA4_v1_day_20560101-20601231.nc', 'tas');
pr85_2056_2060 = extractNetCDFdata('pr_EUR-44_NOAA-GFDL-GFDL-ESM2M_rcp85_r1i1p1_SMHI-RCA4_v1_day_20560101-20601231.nc', 'pr');
tas85_2066_2070 = extractNetCDFdata('tas_EUR-44_NOAA-GFDL-GFDL-ESM2M_rcp85_r1i1p1_SMHI-RCA4_v1_day_20660101-20701231.nc', 'tas');
pr85_2066_2070 = extractNetCDFdata('pr_EUR-44_NOAA-GFDL-GFDL-ESM2M_rcp85_r1i1p1_SMHI-RCA4_v1_day_20660101-20701231.nc', 'pr');
tas85_2076_2080 = extractNetCDFdata('tas_EUR-44_NOAA-GFDL-GFDL-ESM2M_rcp85_r1i1p1_SMHI-RCA4_v1_day_20760101-20801231.nc', 'tas');
pr85_2076_2080 = extractNetCDFdata('pr_EUR-44_NOAA-GFDL-GFDL-ESM2M_rcp85_r1i1p1_SMHI-RCA4_v1_day_20760101-20801231.nc', 'pr');
tas85_2086_2090 = extractNetCDFdata('tas_EUR-44_NOAA-GFDL-GFDL-ESM2M_rcp85_r1i1p1_SMHI-RCA4_v1_day_20860101-20901231.nc', 'tas');
pr85_2086_2090 = extractNetCDFdata('pr_EUR-44_NOAA-GFDL-GFDL-ESM2M_rcp85_r1i1p1_SMHI-RCA4_v1_day_20860101-20901231.nc', 'pr');
tas85_2096_2100 = extractNetCDFdata('tas_EUR-44_NOAA-GFDL-GFDL-ESM2M_rcp85_r1i1p1_SMHI-RCA4_v1_day_20960101-21001231.nc', 'tas');
pr85_2096_2100 = extractNetCDFdata('pr_EUR-44_NOAA-GFDL-GFDL-ESM2M_rcp85_r1i1p1_SMHI-RCA4_v1_day_20960101-21001231.nc', 'pr');

SHP = shaperead('ITA_adm0.shp');
figure();
subplot(2,4,1)
plotNetCDFsnapshot(tas85_2026_2030, [2026,01,01], [2030,12,31], [2030,11,11], 'tas');
hold on; plot(SHP.X, SHP.Y, 'k');
title('Temperature 11/11/2030 - RCP8.5');
%figure();
subplot(2,4,2)
plotNetCDFsnapshot(tas85_2036_2040, [2036,01,01], [2040,12,31], [2040,11,11], 'tas');
hold on; plot(SHP.X, SHP.Y, 'k');
title('Temperature 11/11/2040 - RCP8.5');
%figure();
subplot(2,4,3)
plotNetCDFsnapshot(tas85_2046_2050, [2046,01,01], [2050,12,31], [2050,11,11], 'tas');
hold on; plot(SHP.X, SHP.Y, 'k');
title('Temperature 11/11/2050 - RCP8.5');
%figure();
subplot(2,4,4)
plotNetCDFsnapshot(tas85_2056_2060, [2056,01,01], [2060,12,31], [2060,11,11], 'tas');
hold on; plot(SHP.X, SHP.Y, 'k');
title('Temperature 11/11/2060 - RCP8.5');
%figure();
subplot(2,4,5)
plotNetCDFsnapshot(tas85_2066_2070, [2066,01,01], [2070,12,31], [2070,11,11], 'tas');
hold on; plot(SHP.X, SHP.Y, 'k');
title('Temperature 11/11/2070 - RCP8.5');
%figure();
subplot(2,4,6)
plotNetCDFsnapshot(tas85_2076_2080, [2076,01,01], [2080,12,31], [2080,11,11], 'tas');
hold on; plot(SHP.X, SHP.Y, 'k');
title('Temperature 11/11/2080 - RCP8.5');
%figure();
subplot(2,4,7)
plotNetCDFsnapshot(tas85_2086_2090, [2086,01,01], [2090,12,31], [2090,11,11], 'tas');
hold on; plot(SHP.X, SHP.Y, 'k');
title('Temperature 11/11/2090 - RCP8.5');
%figure();
subplot(2,4,8)
plotNetCDFsnapshot(tas85_2096_2100, [2096,01,01], [2100,12,31], [2100,11,11], 'tas');
hold on; plot(SHP.X, SHP.Y, 'k');
title('Temperature 11/11/2100 - RCP8.5');

figure();
subplot(2,4,1)
plotNetCDFsnapshot(pr85_2026_2030, [2026,01,01], [2030,12,31], [2030,11,11], 'pr');
hold on; plot(SHP.X, SHP.Y, 'k');
title('Precipitation 11/11/2030 - RCP8.5');
%figure();
subplot(2,4,2)
plotNetCDFsnapshot(pr85_2036_2040, [2036,01,01], [2040,12,31], [2040,11,11], 'pr');
hold on; plot(SHP.X, SHP.Y, 'k');
title('Precipitation 11/11/2040 - RCP8.5');
%figure();
subplot(2,4,3)
plotNetCDFsnapshot(pr85_2046_2050, [2046,01,01], [2050,12,31], [2050,11,11], 'pr');
hold on; plot(SHP.X, SHP.Y, 'k');
title('Precipitation 11/11/2050 - RCP8.5');
%figure();
subplot(2,4,4)
plotNetCDFsnapshot(pr85_2056_2060, [2056,01,01], [2060,12,31], [2060,11,11], 'pr');
hold on; plot(SHP.X, SHP.Y, 'k');
title('Precipitation 11/11/2060 - RCP8.5');
%figure();
subplot(2,4,5)
plotNetCDFsnapshot(pr85_2066_2070, [2066,01,01], [2070,12,31], [2070,11,11], 'pr');
hold on; plot(SHP.X, SHP.Y, 'k');
title('Precipitation 11/11/2070 - RCP8.5');
%figure();
subplot(2,4,6)
plotNetCDFsnapshot(pr85_2076_2080, [2076,01,01], [2080,12,31], [2080,11,11], 'pr');
hold on; plot(SHP.X, SHP.Y, 'k');
title('Precipitation 11/11/2080 - RCP8.5');
%figure();
subplot(2,4,7)
plotNetCDFsnapshot(pr85_2086_2090, [2086,01,01], [2090,12,31], [2090,11,11], 'pr');
hold on; plot(SHP.X, SHP.Y, 'k');
title('Precipitation 11/11/2090 - RCP8.5');
%figure();
subplot(2,4,8)
plotNetCDFsnapshot(pr85_2096_2100, [2096,01,01], [2100,12,31], [2100,11,11], 'pr');
hold on; plot(SHP.X, SHP.Y, 'k');
title('Precipitation 11/11/2100 - RCP8.5');

%% 

% Using IPCC scenario RCP4.5: stabilization pathway in which the radiative
% forcing is stabilized shortly after 2100.
tas45_2026_2030 = extractNetCDFdata('tas_EUR-44_NOAA-GFDL-GFDL-ESM2M_rcp45_r1i1p1_SMHI-RCA4_v1_day_20260101-20301231.nc', 'tas');
pr45_2026_2030 = extractNetCDFdata('pr_EUR-44_NOAA-GFDL-GFDL-ESM2M_rcp45_r1i1p1_SMHI-RCA4_v1_day_20260101-20301231.nc', 'pr');
tas45_2036_2040 = extractNetCDFdata('tas_EUR-44_NOAA-GFDL-GFDL-ESM2M_rcp45_r1i1p1_SMHI-RCA4_v1_day_20360101-20401231.nc', 'tas');
pr45_2036_2040 = extractNetCDFdata('pr_EUR-44_NOAA-GFDL-GFDL-ESM2M_rcp45_r1i1p1_SMHI-RCA4_v1_day_20360101-20401231.nc', 'pr');
tas45_2046_2050 = extractNetCDFdata('tas_EUR-44_NOAA-GFDL-GFDL-ESM2M_rcp45_r1i1p1_SMHI-RCA4_v1_day_20460101-20501231.nc', 'tas');
pr45_2046_2050 = extractNetCDFdata('pr_EUR-44_NOAA-GFDL-GFDL-ESM2M_rcp45_r1i1p1_SMHI-RCA4_v1_day_20460101-20501231.nc', 'pr');
tas45_2056_2060 = extractNetCDFdata('tas_EUR-44_NOAA-GFDL-GFDL-ESM2M_rcp45_r1i1p1_SMHI-RCA4_v1_day_20560101-20601231.nc', 'tas');
pr45_2056_2060 = extractNetCDFdata('pr_EUR-44_NOAA-GFDL-GFDL-ESM2M_rcp45_r1i1p1_SMHI-RCA4_v1_day_20560101-20601231.nc', 'pr');
tas45_2066_2070 = extractNetCDFdata('tas_EUR-44_NOAA-GFDL-GFDL-ESM2M_rcp45_r1i1p1_SMHI-RCA4_v1_day_20660101-20701231.nc', 'tas');
pr45_2066_2070 = extractNetCDFdata('pr_EUR-44_NOAA-GFDL-GFDL-ESM2M_rcp45_r1i1p1_SMHI-RCA4_v1_day_20660101-20701231.nc', 'pr');
tas45_2076_2080 = extractNetCDFdata('tas_EUR-44_NOAA-GFDL-GFDL-ESM2M_rcp45_r1i1p1_SMHI-RCA4_v1_day_20760101-20801231.nc', 'tas');
pr45_2076_2080 = extractNetCDFdata('pr_EUR-44_NOAA-GFDL-GFDL-ESM2M_rcp45_r1i1p1_SMHI-RCA4_v1_day_20760101-20801231.nc', 'pr');
tas45_2086_2090 = extractNetCDFdata('tas_EUR-44_NOAA-GFDL-GFDL-ESM2M_rcp45_r1i1p1_SMHI-RCA4_v1_day_20860101-20901231.nc', 'tas');
pr45_2086_2090 = extractNetCDFdata('pr_EUR-44_NOAA-GFDL-GFDL-ESM2M_rcp45_r1i1p1_SMHI-RCA4_v1_day_20860101-20901231.nc', 'pr');
tas45_2096_2100 = extractNetCDFdata('tas_EUR-44_NOAA-GFDL-GFDL-ESM2M_rcp45_r1i1p1_SMHI-RCA4_v1_day_20960101-21001231.nc', 'tas');
pr45_2096_2100 = extractNetCDFdata('pr_EUR-44_NOAA-GFDL-GFDL-ESM2M_rcp45_r1i1p1_SMHI-RCA4_v1_day_20960101-21001231.nc', 'pr');

SHP = shaperead('ITA_adm0.shp');
figure();
subplot(2,4,1)
plotNetCDFsnapshot(tas45_2026_2030, [2026,01,01], [2030,12,31], [2030,11,11], 'tas');
hold on; plot(SHP.X, SHP.Y, 'k');
title('Temperature 11/11/2030 - RCP4.5');
%figure();
subplot(2,4,2)
plotNetCDFsnapshot(tas45_2036_2040, [2036,01,01], [2040,12,31], [2040,11,11], 'tas');
hold on; plot(SHP.X, SHP.Y, 'k');
title('Temperature 11/11/2040 - RCP4.5');
%figure();
subplot(2,4,3)
plotNetCDFsnapshot(tas45_2046_2050, [2046,01,01], [2050,12,31], [2050,11,11], 'tas');
hold on; plot(SHP.X, SHP.Y, 'k');
title('Temperature 11/11/2050 - RCP4.5');
%figure();
subplot(2,4,4)
plotNetCDFsnapshot(tas45_2056_2060, [2056,01,01], [2060,12,31], [2060,11,11], 'tas');
hold on; plot(SHP.X, SHP.Y, 'k');
title('Temperature 11/11/2060 - RCP4.5');
%figure();
subplot(2,4,5)
plotNetCDFsnapshot(tas45_2066_2070, [2066,01,01], [2070,12,31], [2070,11,11], 'tas');
hold on; plot(SHP.X, SHP.Y, 'k');
title('Temperature 11/11/2070 - RCP4.5');
%figure();
subplot(2,4,6)
plotNetCDFsnapshot(tas45_2076_2080, [2076,01,01], [2080,12,31], [2080,11,11], 'tas');
hold on; plot(SHP.X, SHP.Y, 'k');
title('Temperature 11/11/2080 - RCP4.5');
%figure();
subplot(2,4,7)
plotNetCDFsnapshot(tas45_2086_2090, [2086,01,01], [2090,12,31], [2090,11,11], 'tas');
hold on; plot(SHP.X, SHP.Y, 'k');
title('Temperature 11/11/2090 - RCP4.5');
%figure();
subplot(2,4,8)
plotNetCDFsnapshot(tas45_2096_2100, [2096,01,01], [2100,12,31], [2100,11,11], 'tas');
hold on; plot(SHP.X, SHP.Y, 'k');
title('Temperature 11/11/2100 - RCP4.5');

figure();
subplot(2,4,1)
plotNetCDFsnapshot(pr45_2026_2030, [2026,01,01], [2030,12,31], [2030,11,11], 'pr');
hold on; plot(SHP.X, SHP.Y, 'k');
title('Precipitation 11/11/2030 - RCP4.5');
%figure();
subplot(2,4,2)
plotNetCDFsnapshot(pr45_2036_2040, [2036,01,01], [2040,12,31], [2040,11,11], 'pr');
hold on; plot(SHP.X, SHP.Y, 'k');
title('Precipitation 11/11/2040 - RCP4.5');
%figure();
subplot(2,4,3)
plotNetCDFsnapshot(pr45_2046_2050, [2046,01,01], [2050,12,31], [2050,11,11], 'pr');
hold on; plot(SHP.X, SHP.Y, 'k');
title('Precipitation 11/11/2050 - RCP4.5');
%figure();
subplot(2,4,4)
plotNetCDFsnapshot(pr45_2056_2060, [2056,01,01], [2060,12,31], [2060,11,11], 'pr');
hold on; plot(SHP.X, SHP.Y, 'k');
title('Precipitation 11/11/2060 - RCP4.5');
%figure();
subplot(2,4,5)
plotNetCDFsnapshot(pr45_2066_2070, [2066,01,01], [2070,12,31], [2070,11,11], 'pr');
hold on; plot(SHP.X, SHP.Y, 'k');
title('Precipitation 11/11/2070 - RCP4.5');
%figure();
subplot(2,4,6)
plotNetCDFsnapshot(pr45_2076_2080, [2076,01,01], [2080,12,31], [2080,11,11], 'pr');
hold on; plot(SHP.X, SHP.Y, 'k');
title('Precipitation 11/11/2080 - RCP4.5');
%figure();
subplot(2,4,7)
plotNetCDFsnapshot(pr45_2086_2090, [2086,01,01], [2090,12,31], [2090,11,11], 'pr');
hold on; plot(SHP.X, SHP.Y, 'k');
title('Precipitation 11/11/2090 - RCP4.5');
%figure();
subplot(2,4,8)
plotNetCDFsnapshot(pr45_2096_2100, [2096,01,01], [2100,12,31], [2100,11,11], 'pr');
hold on; plot(SHP.X, SHP.Y, 'k');
title('Precipitation 11/11/2100 - RCP4.5');

%%
%time series analysis 
lonMuzza = [9.3, 9.9];
latMuzza = [45.05, 45.5];

tasH_1961_1965_Muzza=cutNetCDFdata(tasH_1961_1965, lonMuzza, latMuzza);
prH_1961_1965_Muzza=cutNetCDFdata(prH_1961_1965, lonMuzza, latMuzza);
tasH_1981_1985_Muzza=cutNetCDFdata(tasH_1981_1985, lonMuzza, latMuzza);
prH_1981_1985_Muzza=cutNetCDFdata(prH_1981_1985, lonMuzza, latMuzza);
tasH_2001_2005_Muzza=cutNetCDFdata(tasH_2001_2005, lonMuzza, latMuzza);
prH_2001_2005_Muzza=cutNetCDFdata(prH_2001_2005, lonMuzza, latMuzza);

tas85_2026_2030_Muzza=cutNetCDFdata(tas85_2026_2030, lonMuzza, latMuzza);
pr85_2026_2030_Muzza=cutNetCDFdata(pr85_2026_2030, lonMuzza, latMuzza);
tas85_2036_2040_Muzza=cutNetCDFdata(tas85_2036_2040, lonMuzza, latMuzza);
pr85_2036_2040_Muzza=cutNetCDFdata(pr85_2036_2040, lonMuzza, latMuzza);
tas85_2046_2050_Muzza=cutNetCDFdata(tas85_2046_2050, lonMuzza, latMuzza);
pr85_2046_2050_Muzza=cutNetCDFdata(pr85_2046_2050, lonMuzza, latMuzza);
tas85_2056_2060_Muzza=cutNetCDFdata(tas85_2056_2060, lonMuzza, latMuzza);
pr85_2056_2060_Muzza=cutNetCDFdata(pr85_2056_2060, lonMuzza, latMuzza);
tas85_2066_2070_Muzza=cutNetCDFdata(tas85_2066_2070, lonMuzza, latMuzza);
pr85_2066_2070_Muzza=cutNetCDFdata(pr85_2066_2070, lonMuzza, latMuzza);
tas85_2076_2080_Muzza=cutNetCDFdata(tas85_2076_2080, lonMuzza, latMuzza);
pr85_2076_2080_Muzza=cutNetCDFdata(pr85_2076_2080, lonMuzza, latMuzza);
tas85_2086_2090_Muzza=cutNetCDFdata(tas85_2086_2090, lonMuzza, latMuzza);
pr85_2086_2090_Muzza=cutNetCDFdata(pr85_2086_2090, lonMuzza, latMuzza);
tas85_2096_2100_Muzza=cutNetCDFdata(tas85_2096_2100, lonMuzza, latMuzza);
pr85_2096_2100_Muzza=cutNetCDFdata(pr85_2096_2100, lonMuzza, latMuzza);

tas45_2026_2030_Muzza=cutNetCDFdata(tas45_2026_2030, lonMuzza, latMuzza);
pr45_2026_2030_Muzza=cutNetCDFdata(pr45_2026_2030, lonMuzza, latMuzza);
tas45_2036_2040_Muzza=cutNetCDFdata(tas45_2036_2040, lonMuzza, latMuzza);
pr45_2036_2040_Muzza=cutNetCDFdata(pr45_2036_2040, lonMuzza, latMuzza);
tas45_2046_2050_Muzza=cutNetCDFdata(tas45_2046_2050, lonMuzza, latMuzza);
pr45_2046_2050_Muzza=cutNetCDFdata(pr45_2046_2050, lonMuzza, latMuzza);
tas45_2056_2060_Muzza=cutNetCDFdata(tas45_2056_2060, lonMuzza, latMuzza);
pr45_2056_2060_Muzza=cutNetCDFdata(pr45_2056_2060, lonMuzza, latMuzza);
tas45_2066_2070_Muzza=cutNetCDFdata(tas45_2066_2070, lonMuzza, latMuzza);
pr45_2066_2070_Muzza=cutNetCDFdata(pr45_2066_2070, lonMuzza, latMuzza);
tas45_2076_2080_Muzza=cutNetCDFdata(tas45_2076_2080, lonMuzza, latMuzza);
pr45_2076_2080_Muzza=cutNetCDFdata(pr45_2076_2080, lonMuzza, latMuzza);
tas45_2086_2090_Muzza=cutNetCDFdata(tas45_2086_2090, lonMuzza, latMuzza);
pr45_2086_2090_Muzza=cutNetCDFdata(pr45_2086_2090, lonMuzza, latMuzza);
tas45_2096_2100_Muzza=cutNetCDFdata(tas45_2096_2100, lonMuzza, latMuzza);
pr45_2096_2100_Muzza=cutNetCDFdata(pr45_2096_2100, lonMuzza, latMuzza);

figure();
%subplot(3,1,1)
boxplot ([tasH_1961_1965_Muzza.value, tasH_1981_1985_Muzza.value, tasH_2001_2005_Muzza.value])
title('Historical Temperature')
ylabel('Air Temperature [°C]');
set(gca, 'XTicklabel', {'1961-1965', '1981-1985', '2001-2005'});
figure();
subplot(2,1,1)
boxplot ([tas85_2026_2030_Muzza.value, tas85_2036_2040_Muzza.value, tas85_2046_2050_Muzza.value, tas85_2056_2060_Muzza.value, tas85_2066_2070_Muzza.value, tas85_2076_2080_Muzza.value, tas85_2086_2090_Muzza.value, tas85_2096_2100_Muzza.value])
title('Temperature, RCP8.5')
ylabel('Air Temperature [°C]');
set(gca, 'XTicklabel', {'2026-30','2036-40','2046-50','2056-60','2066-70','2076-80', '2086-90','2096-2100'});
subplot(2,1,2)
boxplot ([tas45_2026_2030_Muzza.value, tas45_2036_2040_Muzza.value, tas45_2046_2050_Muzza.value, tas45_2056_2060_Muzza.value, tas45_2066_2070_Muzza.value, tas45_2076_2080_Muzza.value, tas45_2086_2090_Muzza.value, tas45_2096_2100_Muzza.value])
title('Temperature, RCP4.5')
ylabel('Air Temperature [°C]');
set(gca, 'XTicklabel', {'2026-30','2036-40','2046-50','2056-60','2066-70','2076-80', '2086-90','2096-2100'});

figure();
boxplot ([prH_2001_2005_Muzza.value, pr85_2046_2050_Muzza.value, pr85_2096_2100_Muzza.value])
title('Historical Precipitation')
ylabel('Air Temperature [°C]');
set(gca, 'XTicklabel', {'1961-1965', '1981-1985', '2001-2005'});
figure();
boxplot ([pr85_2026_2030_Muzza.value, pr85_2036_2040_Muzza.value, pr85_2046_2050_Muzza.value, pr85_2056_2060_Muzza.value, pr85_2066_2070_Muzza.value, pr85_2076_2080_Muzza.value, pr85_2086_2090_Muzza.value, pr85_2096_2100_Muzza.value])
title('Precipitation, RCP8.5')
ylabel('Air Temperature [°C]');
set(gca, 'XTicklabel', {'2026-30','2036-40','2046-50','2056-60','2066-70','2076-80', '2086-90','2096-2100'});
figure();
boxplot ([pr45_2026_2030_Muzza.value, pr45_2036_2040_Muzza.value, pr45_2046_2050_Muzza.value, pr45_2056_2060_Muzza.value, pr45_2066_2070_Muzza.value, pr45_2076_2080_Muzza.value, pr45_2086_2090_Muzza.value, pr45_2096_2100_Muzza.value])
title('Precipitation, RCP4.5')
ylabel('Air Temperature [°C]');
set(gca, 'XTicklabel', {'2026-30','2036-40','2046-50','2056-60','2066-70','2076-80', '2086-90','2096-2100'});

%comparing historical and RCP8.5 and RCP4.5 scenarios
%Historical only thanking 2001-2005 data
%For RCP scenrios we compare graphically data every 20 years
tasH_m = moving_average(tasH_2001_2005_Muzza.value, 365, 15);
tas85_2036_2040_m=moving_average(tas85_2036_2040_Muzza.value, 365, 15);
tas45_2036_2040_m=moving_average(tas45_2036_2040_Muzza.value, 365, 15);
tas85_2056_2060_m=moving_average(tas85_2056_2060_Muzza.value, 365, 15);
tas45_2056_2060_m=moving_average(tas45_2056_2060_Muzza.value, 365, 15);
tas85_2076_2080_m=moving_average(tas85_2076_2080_Muzza.value, 365, 15);
tas45_2076_2080_m=moving_average(tas45_2076_2080_Muzza.value, 365, 15);
tas85_2096_2100_m=moving_average(tas85_2096_2100_Muzza.value, 365, 15);
tas45_2096_2100_m=moving_average(tas45_2096_2100_Muzza.value, 365, 15);

figure();
subplot(2,2,1)
plot(tasH_m)
hold on
plot(tas85_2036_2040_m)
plot(tas45_2036_2040_m)
title('Temperature 2036-40')
ylabel('Air Temperature [°C]');
legend('History', 'RCP8.5', 'RCP4.5')
xlim([1,365]);
subplot(2,2,2)
plot(tasH_m)
hold on
plot(tas85_2056_2060_m)
plot(tas45_2056_2060_m)
title('Temperature 2056-60')
ylabel('Air Temperature [°C]');
legend('History', 'RCP8.5', 'RCP4.5')
xlim([1,365]);
subplot(2,2,3)
plot(tasH_m)
hold on
plot(tas85_2076_2080_m)
plot(tas45_2076_2080_m)
title('Temperature 2076-80')
ylabel('Air Temperature [°C]');
legend('History', 'RCP8.5', 'RCP4.5')
xlim([1,365]);
subplot(2,2,4)
plot(tasH_m)
hold on
plot(tas85_2096_2100_m)
plot(tas45_2096_2100_m)
title('Temperature 2096-2100')
ylabel('Air Temperature [°C]');
legend('History', 'RCP8.5', 'RCP4.5')
xlim([1,365]);

prH_m = moving_average(prH_2001_2005_Muzza.value, 365, 15);
pr85_2036_2040_m=moving_average(pr85_2036_2040_Muzza.value, 365, 15);
pr45_2036_2040_m=moving_average(pr45_2036_2040_Muzza.value, 365, 15);
pr85_2056_2060_m=moving_average(pr85_2056_2060_Muzza.value, 365, 15);
pr45_2056_2060_m=moving_average(pr45_2056_2060_Muzza.value, 365, 15);
pr85_2076_2080_m=moving_average(pr85_2076_2080_Muzza.value, 365, 15);
pr45_2076_2080_m=moving_average(pr45_2076_2080_Muzza.value, 365, 15);
pr85_2096_2100_m=moving_average(pr85_2096_2100_Muzza.value, 365, 15);
pr45_2096_2100_m=moving_average(pr45_2096_2100_Muzza.value, 365, 15);

figure();
subplot(2,2,1)
plot(prH_m)
hold on
plot(pr85_2036_2040_m)
plot(pr45_2036_2040_m)
title('Precipitation 2036-40')
ylabel('Prec [mm/day]');
legend('History', 'RCP8.5', 'RCP4.5')
xlim([1,365]);
subplot(2,2,2)
plot(prH_m)
hold on
plot(pr85_2056_2060_m)
plot(pr45_2056_2060_m)
title('Precipitation 2056-60')
ylabel('Prec [mm/day]');
legend('History', 'RCP8.5', 'RCP4.5')
xlim([1,365]);
subplot(2,2,3)
plot(prH_m)
hold on
plot(pr85_2076_2080_m)
plot(pr45_2076_2080_m)
title('Precipitation 2076-80')
ylabel('Prec [mm/day]');
legend('History', 'RCP8.5', 'RCP4.5')
xlim([1,365]);
subplot(2,2,4)
plot(prH_m)
hold on
plot(pr85_2096_2100_m)
plot(pr45_2096_2100_m)
title('Precipitation 2096-2100')
ylabel('Prec [mm/day]');
legend('History', 'RCP8.5', 'RCP4.5')
xlim([1,365]);

%---------
% Here the comparison between models


%% save time-series

T1 = tasH_2001_2005_Muzza.value;
T2 = tas85_2036_2040_Muzza.value;
T3 = tas85_2056_2060_Muzza.value;
T4 = tas85_2076_2080_Muzza.value;
T5 = tas85_2096_2100_Muzza.value;
T6 = tas45_2036_2040_Muzza.value;
T7 = tas45_2056_2060_Muzza.value;
T8 = tas45_2076_2080_Muzza.value;
T9 = tas45_2096_2100_Muzza.value;

P1 = prH_2001_2005_Muzza.value;
P2 = pr85_2036_2040_Muzza.value;
P3 = pr85_2056_2060_Muzza.value;
P4 = pr85_2076_2080_Muzza.value;
P5 = pr85_2096_2100_Muzza.value;
P6 = pr45_2036_2040_Muzza.value;
P7 = pr45_2056_2060_Muzza.value;
P8 = pr45_2076_2080_Muzza.value;
P9 = pr45_2096_2100_Muzza.value;

%other values 
% tasH_1961_1965_Muzza.value; 
% tasH_1981_1985_Muzza.value;
% tas85_2026_2030_Muzza.value;
% tas85_2046_2050_Muzza.value;
% tas85_2066_2070_Muzza.value;
% tas85_2086_2090_Muzza.value;
% tas45_2026_2030_Muzza.value;
% tas45_2046_2050_Muzza.value;
% tas45_2066_2070_Muzza.value; 
% tas45_2086_2090_Muzza.value;
% pr85_2026_2030_Muzza.value;
% pr85_2046_2050_Muzza.value;
% pr85_2066_2070_Muzza.value;
% pr85_2086_2090_Muzza.value;
% pr45_2026_2030_Muzza.value;
% pr45_2046_2050_Muzza.value;
% pr45_2066_2070_Muzza.value; 
% pr45_2086_2090_Muzza.value;

save -ascii tasH_2001_2005_Muzza.txt T1
save -ascii tas85_2036_2040_Muzza.txt T2
save -ascii tas85_2056_2060_Muzza.txt T3
save -ascii tas85_2076_2080_Muzza.txt T4
save -ascii tas85_2096_2100_Muzza.txt T5
% save -ascii tas45_2036_2040_Muzza.txt T6 
% save -ascii tas45_2056_2060_Muzza.txt T7
% save -ascii tas45_2076_2080_Muzza.txt T8
% save -ascii tas45_2096_2100_Muzza.txt T9 

save -ascii prH_2001_2005_Muzza.txt P1
save -ascii pr85_2036_2040_Muzza.txt P2
save -ascii pr85_2056_2060_Muzza.txt P3
save -ascii pr85_2076_2080_Muzza.txt P4
save -ascii pr85_2096_2100_Muzza.txt P5
% save -ascii pr45_2036_2040_Muzza.txt P6
% save -ascii pr45_2056_2060_Muzza.txt P7
% save -ascii pr45_2076_2080_Muzza.txt P8
% save -ascii pr45_2096_2100_Muzza.txt P9

%%
% comparison between previous model and Norwegian Earth System Model (NorESM)
tasH_NCC_1981_1985 = extractNetCDFdata('tas_EUR-44_NCC-NorESM1-M_historical_r1i1p1_SMHI-RCA4_v1_day_19810101-19851231.nc', 'tas');
prH_NCC_1981_1985 = extractNetCDFdata('pr_EUR-44_NCC-NorESM1-M_historical_r1i1p1_SMHI-RCA4_v1_day_19810101-19851231.nc', 'pr');
tasH_NCC_2001_2005 = extractNetCDFdata('tas_EUR-44_NCC-NorESM1-M_historical_r1i1p1_SMHI-RCA4_v1_day_20010101-20051231.nc', 'tas');
prH_NCC_2001_2005 = extractNetCDFdata('pr_EUR-44_NCC-NorESM1-M_historical_r1i1p1_SMHI-RCA4_v1_day_20010101-20051231.nc', 'pr');
tas_NCC85_2036_2040 = extractNetCDFdata('tas_EUR-44_NCC-NorESM1-M_rcp85_r1i1p1_SMHI-RCA4_v1_day_20360101-20401231.nc', 'tas');
pr_NCC85_2036_2040 = extractNetCDFdata('pr_EUR-44_NCC-NorESM1-M_rcp85_r1i1p1_SMHI-RCA4_v1_day_20360101-20401231.nc', 'pr');
tas_NCC85_2056_2060 = extractNetCDFdata('tas_EUR-44_NCC-NorESM1-M_rcp85_r1i1p1_SMHI-RCA4_v1_day_20560101-20601231.nc', 'tas');
pr_NCC85_2056_2060 = extractNetCDFdata('pr_EUR-44_NCC-NorESM1-M_rcp85_r1i1p1_SMHI-RCA4_v1_day_20560101-20601231.nc', 'pr');
tas_NCC85_2076_2080 = extractNetCDFdata('tas_EUR-44_NCC-NorESM1-M_rcp85_r1i1p1_SMHI-RCA4_v1_day_20760101-20801231.nc', 'tas');
pr_NCC85_2076_2080 = extractNetCDFdata('pr_EUR-44_NCC-NorESM1-M_rcp85_r1i1p1_SMHI-RCA4_v1_day_20760101-20801231.nc', 'pr');
tas_NCC85_2096_2100 = extractNetCDFdata('tas_EUR-44_NCC-NorESM1-M_rcp85_r1i1p1_SMHI-RCA4_v1_day_20960101-21001231.nc', 'tas');
pr_NCC85_2096_2100 = extractNetCDFdata('pr_EUR-44_NCC-NorESM1-M_rcp85_r1i1p1_SMHI-RCA4_v1_day_20960101-21001231.nc', 'pr');

SHP = shaperead('ITA_adm0.shp');

figure(); 
subplot(1,2,1)
plotNetCDFsnapshot(tasH_NCC_1981_1985, [1981,01,01], [1985,12,31], [1985,11,11], 'tas');
hold on; plot(SHP.X, SHP.Y, 'k');
title('NorESM: Temperature 11/11/1985');
subplot(1,2,2)
plotNetCDFsnapshot(tasH_NCC_2001_2005, [2001,01,01], [2005,12,31], [2005,11,11], 'tas');
hold on; plot(SHP.X, SHP.Y, 'k');
title('NorESM:Temperature 11/11/2005');

figure();
subplot(1,2,1)
plotNetCDFsnapshot(prH_NCC_1981_1985, [1981,01,01], [1985,12,31], [1985,11,11], 'pr');
hold on; plot(SHP.X, SHP.Y, 'k');
title('NorESM:Precipitation 11/11/1985');
subplot(1,2,2)
plotNetCDFsnapshot(prH_2001_2005, [2001,01,01], [2005,12,31], [2005,11,11], 'pr');
hold on; plot(SHP.X, SHP.Y, 'k');
title('NorESM:Precipitation 11/11/2005');

SHP = shaperead('ITA_adm0.shp');
figure();
subplot(2,2,1)
plotNetCDFsnapshot(tas_NCC85_2036_2040, [2036,01,01], [2040,12,31], [2040,11,11], 'tas');
hold on; plot(SHP.X, SHP.Y, 'k');
title('NorESM:Temperature 11/11/2040 - RCP8.5');
%figure();
subplot(2,2,2)
plotNetCDFsnapshot(tas_NCC85_2056_2060, [2056,01,01], [2060,12,31], [2060,11,11], 'tas');
hold on; plot(SHP.X, SHP.Y, 'k');
title('NorESM:Temperature 11/11/2060 - RCP8.5');
%figure();
subplot(2,2,3)
plotNetCDFsnapshot(tas_NCC85_2076_2080, [2076,01,01], [2080,12,31], [2080,11,11], 'tas');
hold on; plot(SHP.X, SHP.Y, 'k');
title('NorESM:Temperature 11/11/2080 - RCP8.5');
%figure();
subplot(2,2,4)
plotNetCDFsnapshot(tas_NCC85_2096_2100, [2096,01,01], [2100,12,31], [2100,11,11], 'tas');
hold on; plot(SHP.X, SHP.Y, 'k');
title('NorESM:Temperature 11/11/2100 - RCP8.5');


SHP = shaperead('ITA_adm0.shp');
figure();
subplot(2,2,1)
plotNetCDFsnapshot(pr_NCC85_2036_2040, [2036,01,01], [2040,12,31], [2040,11,11], 'pr');
hold on; plot(SHP.X, SHP.Y, 'k');
title('NorESM:Precipitation 11/11/2040 - RCP8.5');
%figure();
subplot(2,2,2)
plotNetCDFsnapshot(pr_NCC85_2056_2060, [2056,01,01], [2060,12,31], [2060,11,11], 'pr');
hold on; plot(SHP.X, SHP.Y, 'k');
title('NorESM:Precipitation 11/11/2060 - RCP8.5');
%figure();
subplot(2,2,3)
plotNetCDFsnapshot(pr_NCC85_2076_2080, [2076,01,01], [2080,12,31], [2080,11,11], 'pr');
hold on; plot(SHP.X, SHP.Y, 'k');
title('NorESM:Precipitation 11/11/2080 - RCP8.5');
%figure();
subplot(2,2,4)
plotNetCDFsnapshot(pr_NCC85_2096_2100, [2096,01,01], [2100,12,31], [2100,11,11], 'pr');
hold on; plot(SHP.X, SHP.Y, 'k');
title('NorESM:Precipitation 11/11/2100 - RCP8.5');

%%
%time series analysis 
lonMuzza = [9.3, 9.9];
latMuzza = [45.05, 45.5];

tasH_NCC_1981_1985_Muzza=cutNetCDFdata(tasH_NCC_1981_1985, lonMuzza, latMuzza);
prH_NCC_1981_1985_Muzza=cutNetCDFdata(prH_NCC_1981_1985, lonMuzza, latMuzza);
tasH_NCC_2001_2005_Muzza=cutNetCDFdata(tasH_NCC_2001_2005, lonMuzza, latMuzza);
prH_NCC_2001_2005_Muzza=cutNetCDFdata(prH_NCC_2001_2005, lonMuzza, latMuzza);

tas_NCC85_2036_2040_Muzza=cutNetCDFdata(tas_NCC85_2036_2040, lonMuzza, latMuzza);
pr_NCC85_2036_2040_Muzza=cutNetCDFdata(pr_NCC85_2036_2040, lonMuzza, latMuzza);
tas_NCC85_2056_2060_Muzza=cutNetCDFdata(tas_NCC85_2056_2060, lonMuzza, latMuzza);
pr_NCC85_2056_2060_Muzza=cutNetCDFdata(pr_NCC85_2056_2060, lonMuzza, latMuzza);
tas_NCC85_2076_2080_Muzza=cutNetCDFdata(tas_NCC85_2076_2080, lonMuzza, latMuzza);
pr_NCC85_2076_2080_Muzza=cutNetCDFdata(pr_NCC85_2076_2080, lonMuzza, latMuzza);
tas_NCC85_2096_2100_Muzza=cutNetCDFdata(tas_NCC85_2096_2100, lonMuzza, latMuzza);
pr_NCC85_2096_2100_Muzza=cutNetCDFdata(pr_NCC85_2096_2100, lonMuzza, latMuzza);

figure();
subplot(1,2,1)
boxplot ([tasH_NCC_1981_1985_Muzza.value, tasH_NCC_2001_2005_Muzza.value])
title('NorESM: Historical Temperature')
ylabel('Air Temperature [°C]');
set(gca, 'XTicklabel', {'1981-1985', '2001-2005'});
subplot(1,2,2)
boxplot ([prH_NCC_1981_1985_Muzza.value, prH_NCC_2001_2005_Muzza.value])
title('NorESM:Historical Precipitation')
ylabel('Air Temperature [°C]');
set(gca, 'XTicklabel', {'1981-1985', '2001-2005'});

figure();
subplot(1,2,1)
boxplot ([tas_NCC85_2036_2040_Muzza.value, tas_NCC85_2056_2060_Muzza.value, tas_NCC85_2076_2080_Muzza.value, tas_NCC85_2096_2100_Muzza.value ])
title('NorESM:Temperature, RCP8.5')
ylabel('Air Temperature [°C]');
set(gca, 'XTicklabel', {'2036-40','2056-60','2076-80', '2096-2100'});
subplot(1,2,2)
boxplot ([pr_NCC85_2036_2040_Muzza.value, pr_NCC85_2056_2060_Muzza.value, pr_NCC85_2076_2080_Muzza.value, pr_NCC85_2096_2100_Muzza.value ])
title('NorESM:Precipitation, RCP8.5')
ylabel('Air Temperature [°C]');
set(gca, 'XTicklabel', {'2036-40','2056-60','2076-80', '2096-2100'});

%comparing historical and RCP8.5 and RCP4.5 scenarios
%Historical only thanking 2001-2005 data
%For RCP scenrios we compare graphically data every 20 years
tasH_NCC_m = moving_average(tasH_NCC_2001_2005_Muzza.value, 365, 15);
tas_NCC85_2036_2040_m=moving_average(tas_NCC85_2036_2040_Muzza.value, 365, 15);
tas_NCC85_2076_2080_m=moving_average(tas_NCC85_2076_2080_Muzza.value, 365, 15);
tas_NCC85_2096_2100_m=moving_average(tas_NCC85_2096_2100_Muzza.value, 365, 15);

figure();
subplot(1,2,1)
plot(tasH_NCC_m)
hold on
plot(tas_NCC85_2036_2040_m)
plot(tas_NCC85_2076_2080_m)
plot(tas_NCC85_2096_2100_m)
title('Temperature using NorESM model')
ylabel('Air Temperature [°C]');
legend('history', '2036-2040', '2076-2080', '2096-2100')
xlim([1,365])
subplot(1,2,2)
plot(tasH_m)
hold on
plot(tas85_2036_2040_m)
plot(tas85_2076_2080_m)
plot(tas85_2096_2100_m)
title('Temperature')
ylabel('Air Temperature [°C]');
legend('history', '2036-2040', '2076-2080', '2096-2100')
xlim([1,365])

prH_NCC_m = moving_average(prH_NCC_2001_2005_Muzza.value, 365, 15);
pr_NCC85_2036_2040_m=moving_average(pr_NCC85_2036_2040_Muzza.value, 365, 15);
pr_NCC85_2076_2080_m=moving_average(pr_NCC85_2076_2080_Muzza.value, 365, 15);
pr_NCC85_2096_2100_m=moving_average(pr_NCC85_2096_2100_Muzza.value, 365, 15);

figure();
subplot(1,2,1)
plot(prH_NCC_m)
hold on
plot(pr_NCC85_2036_2040_m)
plot(pr_NCC85_2076_2080_m)
plot(pr_NCC85_2096_2100_m)
title('Precipitation using NorESM model')
ylabel('Prec [mm/day]');
legend('history', '2036-2040', '2076-2080', '2096-2100')
xlim([1,365])
subplot(1,2,2)
plot(prH_m)
hold on
plot(pr85_2036_2040_m)
plot(pr85_2076_2080_m)
plot(pr85_2096_2100_m)
title('Precipitation')
ylabel('Prec [mm/day]');
legend('history', '2036-2040', '2076-2080', '2096-2100')
xlim([1,365])
