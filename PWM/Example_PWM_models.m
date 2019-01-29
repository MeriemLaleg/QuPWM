
%% ###############   Epileptic Spikes Detection 2019  ########################
% This script detects epileptic spikes bases on  Position Weight Matrix (PWM)  

%% ###########################################################################
%  Author:
%  Abderrazak Chahid (abderrazak.chahid@gmail.com)
% Done: Dec,  2018
%
%% ###########################################################################
warning('off'); clear all;  close all ;format shortG;  addpath ../Functions ;

%% Load PWMs matrics  and an example of converted MEG signal of two Heatly patients 
% and two epileptic patients and  
load('PWM_Data_M8.mat')

%% Generate PWM features
fPWM_features= Generate_PWM_features(X, PWM_P, PWM_N);

%% Apply an SVM  model trianed on the sequences used to build PWM_P, PWM_N
[yfit,scores] = predict(Mdl_SVM_PWM,fPWM_features);
[FPR,TPR,T0,AUC] = perfcurve(y ,scores(:,2),1);

% Compute the performnace
[accuracy, sensitivity, specificity, precision, gmean, f1score]=prediction_performance(y , yfit);
SVM_results=[accuracy, sensitivity, specificity, precision, gmean, f1score,AUC];

%% Show results
   colnames_results={'Accuracy','Sensitivity','Specificity','Precision','Gmean','F1score','AUC'};
   Results= array2table(SVM_results, 'VariableNames',colnames_results)
   
% Plot ROC
   
figure;
plot(FPR,TPR)
xlabel('False Positive Rate(FPR)' ) 
ylabel('True Positive Rate(TPR)')
title('ROC for Classification ')
legend(strcat(' AUC=',num2str(AUC)))
set(gca,'fontsize',20)
grid on