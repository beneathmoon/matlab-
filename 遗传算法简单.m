clear all;clc;close all;
F = @(x,y) 3*(1-x).^2.*exp(-(x.^2)-(y+1).^2)-10*((x./5)-x.^3-y.^5).*exp(-x.^2-y.^2)-1/3^exp(-(x+1).^2-y.^2);
%figure(1);ezsurf(F);

global Length            %length标记染色体长度
global lower_bound       %标记自变量取值区间下界
global upper_bound       %自变量取值区间上界
precision =0.01 ;      %设置取值精度
lower_bound =0 ;   %取下界
upper_bound =20 ;
Length = ceil(log2((upper_bound-lower_bound)'./precision));
a=10000000000;

x_10=transform2to10(population(i,:))


%%
%
x=rand(N,n)*20-10; %染色体初始化

