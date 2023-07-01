clear;clc;
m=100;n=100;
A=ones(m,n);%-1是黑色，1是白色。
x=[50,50]; %代表一个坐标点
v=[1,0];%代表一个初始的方向
R=[0,1;-1,0];
z=A(x(1),x(2));%先从上到下，再从左往右，先数列
for i=1:11000
v=v*R*A(x(1),x(2)); %把x=50，传递给A;
A(x(1),x(2))=-A(x(1),x(2));
x=x+v;
imagesc(A); pause(0.001);
end


%v=[1,0]; %朝向是右
%%
clear;clc;
Ly=100;Lx=100;A=ones(Ly,Lx);
x=50+50i;v=1;
jN=11000;
for j=1:jN
v=A(real(x),imag(x))*v*1i;
x=x+v;
A(real(x),imag(x))=-A(real(x),imag(x));
imagesc(A);pause(0.001);
end