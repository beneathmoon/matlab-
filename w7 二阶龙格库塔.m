clear;clc;
k=1;
x=1;
v=1;
a=-k*x-v;
dt=0.01;
n=10000;
xbox=(1:n)*0;  %一开始最好是零矩阵，运行的时候可以看数据
vbox=(1:n)*0;
for i=1:n
xnew=x+v*dt;
vnew=v+a*dt;
anew=-k*xnew-vnew;  %阻尼总是和速度相反
x=x+(v+vnew)/2*dt;
v=v+(a+anew)/2*dt;
a=-k*x-v;
%plot(x,'ro');axis([0,2,-2,2]);   %把坐标轴位置固定
%pause(0.01);
xbox(i)=x;
vbox(i)=v;

end
t=(1:n)*dt; %t是一个数列，t的第一格是经过一个时间的dt
figure;
plot3(t,xbox,vbox);xlabel('t');ylabel('xbox');zlabel('vbox');  %三维图
hold on;
%
