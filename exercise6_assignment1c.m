clc;
close all;
clear;

t=[ 1 0 1 1 1 0 0 0];
y1=[0.5 0.3 0.6 0.22 0.4 0.51 0.2 0.33];
y2=[0.04 0.1 0.68 0.22 0.4 0.11 0.8 0.53];
hold on;
[R1,auc1]=rocC(t,y1);
[R2,auc2]=rocC(t,y2);
title(['T=0.33, AUC=',num2str(auc1),', T=0.1, AUC=',num2str(auc2)]);
legend('C1','C2')
hold off;