cla;clc;clear;close all;

%parameters setting

num_inlier=1000;
num_outlier=500; %outlier rate 500/ï¼?1000+500ï¼?=33.33% 


noise_level=0.001;

delta=0.01;


% generate synthetic data
[data,x_gt]=gen_data_synthetic(num_inlier,num_outlier,noise_level);

[x_opt]=bnb_search(data,delta);

error_deg=acosd(abs(x_opt'*x_gt));
disp(['error_deg:',num2str(error_deg)])
