
%% ###############   Epileptic Spikes Detection 2019  ############################
% This script detects epileptic spikes bases on  motif-based Position Weight Matrix (mPWM)  

%% ###########################################################################
%  Author:
%  Abderrazak Chahid (abderrazak.chahid@gmail.com)
% Done: Dec,  2018
%
%% ###########################################################################
warning('off');; clear all;  close all ;format shortG;  addpath ../Functions ;

%% Load PWMs matrics  and an example of converted MEG signal of two Heatly and two epileptic patients and  
load('mPWM_Data_M10.mat')


%% The Extracted motif fromthe imput sequences
% The extracted motifs 1-mer : motifs_1Mer, X_1Mer
disp('The Generated 1-mer motifs:')
motifs_1Mer

% The extracted motifs 2-mer : motifs_2Mer, X_2Mer
disp('Example of generated 2-mer motifs:')
motifs_2Mer(1:7)

%% Generate PWM features
 fPWM1 = Apply_General_PWM_feature_generator(X_1Mer, PWMp_1Mer, PWMn_1Mer); 
 fPWM2 = Apply_General_PWM_feature_generator(X_2Mer, PWMp_2Mer,PWMn_2Mer);
 mPWM_features=[fPWM1 fPWM2];
 
%% Apply an SVM  model trianed on the sequences used to build PWM_P, PWM_N
[yfit,scores] = predict(Mdl_SVM_mPWM,mPWM_features);
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