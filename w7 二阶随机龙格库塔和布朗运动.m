clear;clc;
k=0;
x=1;
v=1;
Y=1;
a=-k*x-Y*v;
dt=0.01;
n=10000;
T=1;
D=Y*T;
xbox=(1:n)*0;  %一开始最好是零矩阵，运行的时候可以看数据
vbox=(1:n)*0;
for i=1:n
    u=sqrt(2*D*dt)*randn;
    xnew=x+v*dt;
    vnew=v+a*dt+u;
    anew=-k*xnew-Y*vnew;  %阻尼总是和速度相反
    x=x+(v+vnew)/2*dt;
    v=v+(a+anew)/2*dt+u;  %背后原因很复杂
    a=-k*x-Y*v;
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
