clear;clc;
k=1;
x=1;
v=1;
dt=0.01;
n=10000;
xbox=(1:n)*0;  %一开始最好是零矩阵，运行的时候可以看数据
vbox=(1:n)*0;
for i=1:n
x=x+v*dt;
a=-k*x-v;  %阻尼总是和速度相反  弹簧总是想抵抗形变，所以是-号
v=v+a*dt;
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